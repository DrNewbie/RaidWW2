if RequiredScript == "lib/units/player_team/logics/teamailogicassault" and Network:is_server() then
	local p = pairs
	local mvec3_angle = mvector3.angle
	local mvec3_norm = mvector3.normalize
	local function _throw_conc(data, criminal)
		local enemy_slotmask = managers.slot:get_mask("enemies")
		local target_unit, target_dis
		local close_enemies = 0
		local crim_mov = criminal:movement()
		local from_pos = crim_mov:m_head_pos()
		local look_vec = crim_mov:m_rot():y()
		local detected_obj = data.detected_attention_objects
		for u_key, u_char in p(detected_obj) do
			if u_char.identified then
				local unit = u_char.unit
				if unit:in_slot(enemy_slotmask) then
					if u_char.verified then
						local dis = u_char.verified_dis
						if dis <= 8000 then
							local vec = u_char.m_head_pos - from_pos
							if mvec3_angle(vec, look_vec) <= 90 then
								local tweak_table = unit:base()._tweak_table
								if tweak_table then
									close_enemies = close_enemies + 1
									if close_enemies >= 3 then
										if not target_dis or target_dis < dis then
											target_unit = unit
											target_dis = dis
										end
									end
								end
							end
						end
					end
				end
			end
		end
		if target_unit then
			local mvec_spread_direction = target_unit:movement():m_head_pos() - from_pos
			mvec3_norm(mvec_spread_direction)
			local cc_unit = ProjectileBase.spawn("units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343", from_pos, Rotation())
			crim_mov:play_redirect("throw_grenade")
			managers.network:session():send_to_peers("play_distance_interact_redirect", criminal, "throw_grenade")
			cc_unit:base():throw({ dir = mvec_spread_direction, owner = criminal })
		end
	end
	local old_update = TeamAILogicAssault.update
	function TeamAILogicAssault.update(data, ...)
		local t = TimerManager:game():time()
		if not TeamAILogicAssault._conc_t or TeamAILogicAssault._conc_t + 1 < t then
			TeamAILogicAssault._conc_t = t
			_throw_conc(data, data.unit)
		end
		return old_update(data, ...)
	end
end