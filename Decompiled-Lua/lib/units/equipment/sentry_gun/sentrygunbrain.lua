-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local math_max = math.max
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
SentryGunBrain = SentryGunBrain or class()
SentryGunBrain._create_attention_setting_from_descriptor = PlayerMovement._create_attention_setting_from_descriptor
SentryGunBrain.TURRET_TYPE_TANK = "tank"
SentryGunBrain.TANK_ATTENTION_TIME = 5
function SentryGunBrain:init(unit)
	self._unit = unit
	self._active = false
	slot7 = "brain"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(false))

	slot5 = self._unit
	slot5 = self._unit.base(self._unit)
	slot3 = self._unit.base(self._unit).get_name_id(self._unit)
	self._tweak_data = tweak_data.weapon[slot3]
	slot5 = "AI_visibility_sentry_gun"
	self._visibility_slotmask = managers.slot.get_mask(slot3, managers.slot)
	self._detected_attention_objects = {}
	self._next_detection_upd_t = 0
	self._firing = false
	self._SO_access_str = "teamAI1"
	slot5 = self._SO_access_str
	self._SO_access = managers.navigation.convert_access_flag(slot3, managers.navigation)

	return 
end
function SentryGunBrain:destroy(unit)
	slot6 = self

	managers.queued_tasks.unqueue_all(slot3, managers.queued_tasks, self._ukey)

	return 
end
function SentryGunBrain:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)

	return 
end
function SentryGunBrain:update(unit, t, dt)
	slot6 = Network

	if Network.is_server(slot5) then
		slot7 = t

		self._upd_detection(slot5, self)

		slot7 = t

		self._select_focus_attention(slot5, self)

		slot7 = t

		self._upd_flash_grenade(slot5, self)

		slot7 = t

		self._upd_go_idle(slot5, self)
	end

	slot7 = t

	self._upd_fire(slot5, self)

	return 
end
function SentryGunBrain:setup(shaprness_mul)
	self._shaprness_mul = shaprness_mul or 1
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self

		self._setup_attention_handler(slot3)
	end

	return 
end
function SentryGunBrain:on_activated(tweak_table_id)
	self._allow_turret_abandon = false
	self._tweak_data = tweak_data.weapon[tweak_table_id]
	slot4 = self

	self._update_SO_access(slot3)

	return 
end
function SentryGunBrain:_update_SO_access()
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)
	local team_data = self._unit.movement(slot2).team(slot2)
	slot6 = "player"

	if team_data.foes[tweak_data.levels.get_default_team_ID(slot4, tweak_data.levels)] then
		slot6 = "combatant"

		if team_data.foes[tweak_data.levels.get_default_team_ID(slot4, tweak_data.levels)] then
			self._SO_access_str = "gangster"
		else
			self._SO_access_str = "swat"
		end
	else
		slot6 = "combatant"

		if team_data.foes[tweak_data.levels.get_default_team_ID(slot4, tweak_data.levels)] then
			self._SO_access_str = "teamAI1"
		else
			self._SO_access_str = "civ_male"
		end
	end

	slot5 = self._SO_access_str
	self._SO_access = managers.navigation.convert_access_flag(slot3, managers.navigation)

	return 
end
function SentryGunBrain:is_active()
	return self._active
end
function SentryGunBrain:set_active(state)
	if state then
		state = true
	else
		state = false
	end

	if self._active == state then
		return 
	end

	slot7 = "brain"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(state))

	self._active = state

	if not state and self._firing then
		slot4 = self._unit
		slot4 = self._unit.weapon(slot3)

		self._unit.weapon(slot3).stop_autofire(slot3)

		self._firing = false
	end

	if not state then
		slot4 = Network

		if Network.is_server(slot3) and self._attention_handler then
			slot5 = nil

			PlayerMovement.set_attention_settings(slot3, self)
		end
	end

	return 
end
function SentryGunBrain:_upd_detection(t)

	-- Decompilation error in this vicinity:
	slot4 = self._ext_movement

	if t < self._next_detection_upd_t then
		return 
	end

	local delay = 1
	local my_SO_access_str = self._SO_access_str
	local my_SO_access = self._SO_access
	slot7 = self._unit
	slot7 = self._unit.movement(slot6)
	local my_tracker = self._unit.movement(slot6).nav_tracker(slot6)
	local chk_vis_func = my_tracker.check_visibility
	local detected_objects = self._detected_attention_objects
	local my_key = self._unit.key(slot9)
	local my_team = self._ext_movement.team(self._unit)
	local my_pos = self._ext_movement.m_head_pos(self._ext_movement)
	slot13 = self._ext_movement
	local my_tracker = self._ext_movement.nav_tracker(self._ext_movement)
	local chk_vis_func = my_tracker.check_visibility
	local max_detection_range = self._tweak_data.DETECTION_RANGE
	slot16 = managers.groupai
	slot18 = my_team
	local all_attention_objects = managers.groupai.state(slot15).get_AI_attention_objects_by_filter(slot15, managers.groupai.state(slot15), my_SO_access_str)
	local ignore_units = {
		self._unit
	}
	slot18 = all_attention_objects

	for u_key, attention_info in pairs(my_SO_access_str) do
		if u_key ~= my_key and not detected_objects[u_key] then
		end
	end

	local update_delay = 2
	slot19 = detected_objects

	for u_key, attention_info in pairs(slot18) do
		if t < attention_info.next_verify_t then
			slot25 = update_delay
			update_delay = math.min(slot23, attention_info.next_verify_t - t)
		else
			ignore_units[2] = attention_info.unit or nil
			attention_info.next_verify_t = t + ((attention_info.identified and attention_info.verified and attention_info.settings.verification_interval) or attention_info.settings.notice_interval or attention_info.settings.verification_interval)
			slot25 = attention_info.settings.verification_interval
			update_delay = math.min(slot23, update_delay)

			if not attention_info.identified then
				slot29 = max_detection_range

				self._update_noticing(slot23, self, t, my_pos, attention_info, ignore_units)
			end

			if attention_info.identified then
				slot31 = my_team
				update_delay = self._update_verify(slot23, self, t, my_pos, attention_info, ignore_units, update_delay, max_detection_range)
			end
		end
	end

	self._next_detection_upd_t = t + update_delay

	return 
end
function SentryGunBrain:_update_noticing(t, my_pos, attention_info, ignore_units, max_detection_range)
	local noticable = nil
	slot14 = max_detection_range
	local distance = self._distance_chk(slot8, self, my_pos, attention_info.handler, attention_info.settings, nil)

	if distance then
		local attention_pos = attention_info.handler.get_detection_m_pos(slot9)
		slot21 = "report"
		local vis_ray = World.raycast(attention_info.handler, World, "ray", my_pos, attention_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

		if not vis_ray then
			noticable = true
		end
	end

	local delta_prog = nil
	local dt = t - attention_info.prev_notice_chk_t

	if noticable then
		local min_delay = self._tweak_data.DETECTION_DELAY[1][2]
		local max_delay = self._tweak_data.DETECTION_DELAY[2][2]
		local dis_ratio = (distance - self._tweak_data.DETECTION_DELAY[1][1]) / (self._tweak_data.DETECTION_DELAY[2][1] - self._tweak_data.DETECTION_DELAY[1][1])
		slot17 = dis_ratio
		local dis_mul_mod = math.lerp(self._tweak_data.DETECTION_DELAY[1][1], min_delay, max_delay)
		local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

		if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
			notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
		end

		slot19 = dis_mul_mod
		local notice_delay_modified = math.lerp(slot16, min_delay * notice_delay_mul, max_delay)
		delta_prog = (0 < notice_delay_modified and dt / notice_delay_modified) or 1
	else
		delta_prog = dt * -0.125
	end

	attention_info.notice_progress = attention_info.notice_progress + delta_prog

	if 1 < attention_info.notice_progress then
		attention_info.notice_progress = nil
		attention_info.prev_notice_chk_t = nil
		attention_info.identified = true
		attention_info.release_t = t + attention_info.settings.release_delay
		attention_info.identified_t = t
		noticable = true

		if self._turret_type and self._turret_type == SentryGunBrain.TURRET_TYPE_TANK then
			local p = self._unit.unit_data(slot11).parent_unit
			slot13 = p

			if alive(self._unit) then
				slot14 = p
				p.unit_data(slot12).player_seen = p.unit_data(p).player_seen or 0
				slot14 = p
				p.unit_data(p.unit_data(p).player_seen or 0).player_seen = p.unit_data(p).player_seen + 1
			end
		end
	elseif attention_info.notice_progress < 0 then
		slot13 = attention_info

		self._destroy_detected_attention_object_data(slot11, self)

		noticable = false
	else
		noticable = attention_info.notice_progress
		attention_info.prev_notice_chk_t = t
	end

	if noticable ~= false and attention_info.settings.notice_clbk then
		slot13 = noticable

		attention_info.settings.notice_clbk(slot11, self._unit)
	end

	return 
end
function SentryGunBrain:_update_verify(t, my_pos, attention_info, ignore_units, update_delay, max_detection_range, my_team)
	update_delay = math.min(slot9, update_delay)
	attention_info.nearly_visible = nil
	local verified, vis_ray = nil
	local attention_pos = attention_info.handler.get_detection_m_pos(attention_info.settings.verification_interval)
	slot14 = attention_info.m_head_pos
	local dis = mvector3.distance(attention_info.handler, my_pos)

	if dis < max_detection_range * 1.2 and (not attention_info.settings.max_range or dis < attention_info.settings.max_range * ((attention_info.settings.detection and attention_info.settings.detection.range_mul) or 1) * 1.2) then
		local detect_pos = nil

		if attention_info.is_husk_player then
			slot15 = attention_info.unit
		else
			detect_pos = attention_pos
		end

		slot24 = "ai_vision"
		vis_ray = World.raycast(slot14, World, "ray", my_pos, detect_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type")

		if not vis_ray then
			verified = true
		end

		attention_info.verified = verified
	end

	attention_info.dis = dis
	attention_info.vis_ray = (vis_ray and vis_ray.dis) or nil

	if verified then
		attention_info.release_t = nil
		attention_info.verified_t = t
		slot15 = attention_pos

		mvector3.set(slot13, attention_info.verified_pos)

		slot14 = attention_pos
		attention_info.last_verified_pos = mvector3.copy(slot13)
		attention_info.verified_dis = dis
	elseif attention_info.has_team then
		slot15 = attention_info.unit
		slot15 = attention_info.unit.movement(slot14)

		if my_team.foes[attention_info.unit.movement(slot14).team(slot14).id] and attention_info.criminal_record and AIAttentionObject.REACT_COMBAT <= attention_info.settings.reaction then
			if 1000 < dis then
				slot15 = attention_info.criminal_record.pos
			else
				slot15 = update_delay
				update_delay = math.min(slot13, 0.2)
				slot14 = attention_info.criminal_record.pos
				attention_info.verified_pos = mvector3.copy(slot13)
				attention_info.verified_dis = dis

				if vis_ray then
					slot18 = ignore_units

					self._nearly_visible_chk(slot13, self, attention_info, attention_pos, my_pos)
				end
			end
		elseif attention_info.release_t and attention_info.release_t < t then
			slot15 = attention_info

			self._destroy_detected_attention_object_data(slot13, self)
		else
			attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
		end
	elseif attention_info.release_t and attention_info.release_t < t then
		slot15 = attention_info

		self._destroy_detected_attention_object_data(slot13, self)
	else
		attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
	end

	return update_delay
end
function SentryGunBrain:_distance_chk(my_pos, handler, settings, attention_pos, max_detection_range)
	if not attention_pos then
		slot8 = handler
		attention_pos = handler.get_detection_m_pos(slot7)
	end

	slot9 = attention_pos
	local dis_sq = mvector3.distance_sq(slot7, my_pos)
	slot10 = settings.max_range or max_detection_range
	local max_dis = math.min(slot8, max_detection_range)

	if settings.detection and settings.detection.range_mul then
		max_dis = max_dis * settings.detection.range_mul
	end

	if dis_sq < max_dis * max_dis then
		slot10 = dis_sq

		return math.sqrt(slot9)
	end

	return 
end
function SentryGunBrain:_nearly_visible_chk(attention_info, detect_pos, my_pos, ignore_units)
	local near_pos = tmp_vec1

	if attention_info.verified_dis < 2000 then
		slot8 = detect_pos.z - my_pos.z

		if math.abs(slot7) < 300 then
			slot9 = detect_pos

			mvector3.set(slot7, near_pos)

			slot9 = near_pos.z + 100

			mvector3.set_z(slot7, near_pos)

			slot18 = "report"
			local near_vis_ray = World.raycast(slot7, World, "ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

			if near_vis_ray then
				local side_vec = tmp_vec1
				slot11 = detect_pos

				mvector3.set(slot9, side_vec)

				slot11 = my_pos

				mvector3.subtract(slot9, side_vec)

				slot12 = math.UP

				mvector3.cross(slot9, side_vec, side_vec)

				slot11 = 150

				mvector3.set_length(slot9, side_vec)

				slot11 = detect_pos

				mvector3.set(slot9, near_pos)

				slot11 = side_vec

				mvector3.add(slot9, near_pos)

				slot20 = "report"
				local near_vis_ray = World.raycast(slot9, World, "ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

				if near_vis_ray then
					slot12 = -2

					mvector3.multiply(slot10, side_vec)

					slot12 = side_vec

					mvector3.add(slot10, near_pos)

					slot21 = "report"
					near_vis_ray = World.raycast(slot10, World, "ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")
				end
			end

			if not near_vis_ray then
				attention_info.nearly_visible = true
				slot9 = near_pos
				attention_info.last_verified_pos = mvector3.copy(slot8)
			end
		end
	end

	return 
end
function SentryGunBrain:_select_focus_attention(t)
	local current_focus = self._attention_obj
	slot5 = self._ext_movement
	local current_pos = self._ext_movement.m_head_pos(slot4)
	local current_fwd = nil

	if current_focus then
		current_fwd = tmp_vec2
		slot10 = self._ext_movement

		mvec3_dir(slot6, current_fwd, self._ext_movement.m_head_pos(current_focus.m_head_pos))
	else
		slot7 = self._ext_movement
		current_fwd = self._ext_movement.m_head_fwd(slot6)
	end

	local max_dis = self._tweak_data.DETECTION_RANGE

	local function _get_weight(attention_info)
		if not attention_info.identified then
			return 
		end

		local total_weight = 1

		if attention_info.verified then
		elseif attention_info.verified_t and t - attention_info.verified_t < 3 then
			local max_duration = 3
			local elapsed_t = t - attention_info.verified_t
			slot8 = elapsed_t / max_duration
			total_weight = total_weight * math.lerp(slot5, 1, 0.6)
		else
			return 
		end

		if attention_info.settings.weight_mul then
			total_weight = total_weight * attention_info.settings.weight_mul
		end

		slot6 = attention_info.m_head_pos
		local dis = mvec3_dir(slot3, tmp_vec1, current_pos)
		slot6 = (max_dis - dis) / max_dis
		local dis_weight = math_max(tmp_vec1, 0)
		total_weight = total_weight * dis_weight
		slot7 = current_fwd
		local dot_weight = 1 + mvec3_dot(0, tmp_vec1)
		dot_weight = dot_weight * dot_weight * dot_weight
		total_weight = total_weight * dot_weight

		return total_weight
	end

	local best_focus_attention, best_focus_weight = nil
	local best_focus_reaction = 0
	slot12 = self._detected_attention_objects

	for u_key, attention_info in pairs(slot11) do
		slot17 = attention_info
		local weight = _get_weight(slot16)

		if not self._tweak_data.can_shoot_at_AI and attention_info.is_person and not attention_info.is_human_player then
			weight = nil
		end

		if weight and (best_focus_reaction < attention_info.reaction or (best_focus_reaction == attention_info.reaction and (not best_focus_weight or best_focus_weight < weight))) then
			best_focus_weight = weight
			best_focus_attention = attention_info
			best_focus_reaction = attention_info.reaction
		end
	end

	if current_focus ~= best_focus_attention then
		if best_focus_attention then
			local attention_data = {
				unit = best_focus_attention.unit,
				u_key = best_focus_attention.u_key,
				handler = best_focus_attention.handler,
				reaction = best_focus_attention.reaction
			}
			slot14 = attention_data

			self._ext_movement.set_attention(slot12, self._ext_movement)
		else
			slot12 = self._ext_movement

			self._ext_movement.set_attention(slot11)
		end

		self._attention_obj = best_focus_attention
	end

	return 
end
function SentryGunBrain:_destroy_detected_attention_object_data(attention_info)
	slot10 = self._unit
	slot5 = "detect_" .. tostring(self._unit.key(slot9))

	attention_info.handler.remove_listener(slot3, attention_info.handler)

	if attention_info.settings.notice_clbk then
		slot5 = false

		attention_info.settings.notice_clbk(slot3, self._unit)
	end

	if AIAttentionObject.REACT_SUSPICIOUS <= attention_info.settings.reaction then
		slot4 = managers.groupai
		slot7 = nil

		managers.groupai.state(slot3).on_criminal_suspicion_progress(slot3, managers.groupai.state(slot3), attention_info.unit, self._unit)
	end

	if attention_info.uncover_progress then
		slot4 = attention_info.unit
		slot6 = false

		attention_info.unit.movement(slot3).on_suspicion(slot3, attention_info.unit.movement(slot3), self._unit)
	end

	self._detected_attention_objects[attention_info.u_key] = nil

	if self._turret_type and self._turret_type == SentryGunBrain.TURRET_TYPE_TANK then
		slot7 = self._unit
		self._ukey = "setry_gun_player_seen_" .. tostring(self._unit.key(slot6))
		slot10 = nil

		managers.queued_tasks.queue(tostring(self._unit.key(slot6)), managers.queued_tasks, self._ukey, self._player_seen_decrease, self, nil, SentryGunBrain.TANK_ATTENTION_TIME)
	end

	return 
end
function SentryGunBrain:_player_seen_decrease()
	slot3 = self._unit
	local p = self._unit.unit_data(slot2).parent_unit

	if p then
		slot4 = p

		if alive(slot3) then
			slot5 = p
			p.unit_data(slot3).player_seen = p.unit_data(p).player_seen or 0
			slot5 = p
			p.unit_data(p.unit_data(p).player_seen or 0).player_seen = p.unit_data(p).player_seen - 1
			slot4 = p

			if p.unit_data(p.unit_data(p).player_seen - 1).player_seen < 0 then
				slot4 = p
				p.unit_data(slot3).player_seen = 0
			end
		end
	end

	return 
end
function SentryGunBrain:_upd_abandon_turret(t, target_is_visible)
	if self._tweak_data.WAIT_FOR_TARGET then
		slot5 = self

		if self.allow_turret_abandon(slot4) then
			if not target_is_visible then
				if not self._target_unreachable_since then
					self._target_unreachable_since = t
				end

				slot6 = Application

				if self._target_unreachable_since + self._tweak_data.WAIT_FOR_TARGET < Application.time(slot5) then
					slot5 = self._unit
					slot5 = self._unit.weapon(slot4)

					self._unit.weapon(slot4).deactivate(slot4)

					self._target_unreachable_since = nil
				end
			else
				self._target_unreachable_since = nil
			end
		end
	end

	return 
end
function SentryGunBrain:_upd_fire(t)

	-- Decompilation error in this vicinity:
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	slot4 = self._ext_movement
	local target_is_visible = self._ext_movement.is_target_visible(slot3)
	slot7 = target_is_visible

	self._upd_abandon_turret(self._ext_movement, self, t)

	if not target_is_visible and self._firing then
		slot5 = self._unit
		slot5 = self._unit.weapon(slot4)

		self._unit.weapon(slot4).stop_autofire(slot4)

		self._firing = false
	end

	local attention = self._ext_movement.attention(slot4)
	slot6 = self._unit

	if self._unit.weapon(self._ext_movement) then
		slot6 = self._unit
		slot6 = self._unit.weapon(slot5)
	else
		slot6 = self._ext_movement

		if self._ext_movement.rearming(slot5) then
			slot6 = self._ext_movement

			self._ext_movement.complete_rearming(slot5)
		elseif attention and attention.reaction and AIAttentionObject.REACT_SHOOT <= attention.reaction then
			slot7 = t
		elseif self._firing then
			slot6 = self._unit
			slot6 = self._unit.weapon(slot5)

			self._unit.weapon(slot5).stop_autofire(slot5)

			self._firing = false
		end
	end

	return 
end
function SentryGunBrain:_upd_flash_grenade(t)
	if not self._tweak_data.FLASH_GRENADE then
		return 
	end

	slot4 = self._ext_movement

	if self._ext_movement.repairing(slot3) then
		return 
	end

	if self._next_flash_grenade_chk_t and t < self._next_flash_grenade_chk_t then
		return 
	end

	local grenade_tweak = self._tweak_data.FLASH_GRENADE
	local check_t = self._next_flash_grenade_chk_t or t
	slot7 = grenade_tweak.check_interval[2]
	self._next_flash_grenade_chk_t = check_t + math.lerp(slot5, grenade_tweak.check_interval[1], math.random())

	if grenade_tweak.chance < math.random() then
		return 
	end

	local max_range = grenade_tweak.range
	local m_pos = self._ext_movement.m_head_pos(slot6)
	local ray_to = mvector3.copy(self._ext_movement)
	slot10 = ray_to.z - 500

	mvector3.set_z(m_pos, ray_to)

	slot13 = "slot_mask"
	slot17 = "statics"
	local ground_ray = World.raycast(m_pos, World, "ray", m_pos, ray_to, managers.slot.get_mask(slot15, managers.slot))

	if ground_ray then
		slot10 = ground_ray.hit_position
		self._grenade_m_pos = mvector3.copy(slot9)
		slot11 = self._grenade_m_pos.z + 3

		mvector3.set_z(slot9, self._grenade_m_pos)

		slot10 = self._detected_attention_objects

		for u_key, attention_info in pairs(slot9) do
			if attention_info.identified then
				slot16 = attention_info.last_verified_pos

				if mvector3.distance_sq(slot14, self._grenade_m_pos) < max_range * max_range then
					slot15 = managers.groupai
					slot18 = grenade_tweak.effect_duration

					managers.groupai.state(slot14).detonate_cs_grenade(slot14, managers.groupai.state(slot14), self._grenade_m_pos, m_pos)

					slot16 = grenade_tweak.quiet_time[2]
					self._next_flash_grenade_chk_t = check_t + math.lerp(slot14, grenade_tweak.quiet_time[1], math.random())

					break
				end
			end
		end
	end

	return 
end
function SentryGunBrain:_upd_go_idle(t)
	slot4 = Network

	if not Network.is_server(slot3) or not self._tweak_data.CAN_GO_IDLE then
		return 
	end

	local attention_obj = self._attention_obj
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	if managers.groupai.state(slot4).is_detection_persistent(slot4) then
		self._has_seen_assault_mode = true
	end

	if self._tweak_data.AUTO_REPAIR then
		slot5 = self._unit
		slot5 = self._unit.character_damage(slot4)

		if self._unit.character_damage(slot4).needs_repair(slot4) then
			if not self._idle then
				slot5 = self._ext_movement

				if not self._ext_movement.is_inactivating(slot4) then
					if not self._auto_repair_counter then
						self._auto_repair_counter = 0
					end

					if self._auto_repair_counter < self._tweak_data.AUTO_REPAIR_MAX_COUNT then
						self._auto_repair_counter = self._auto_repair_counter + 1
						slot6 = true

						self.set_idle(slot4, self)
					end
				end
			end

			if self._idle then
				slot5 = self._ext_movement

				if self._ext_movement.is_inactivated(slot4) then
					slot5 = self._ext_movement

					if not self._ext_movement.repairing(slot4) then
						slot5 = self._ext_movement

						self._ext_movement.repair(slot4)
					end
				end
			end
		end
	end

	slot5 = self._ext_movement

	if not self._ext_movement.is_inactivating(slot4) then
		slot5 = self._ext_movement

		if not self._ext_movement.repairing(slot4) then
			if attention_obj and AIAttentionObject.REACT_AIM < attention_obj.reaction then
				slot5 = self._ext_movement
			elseif not self._idle then
				slot5 = self._ext_movement

				if not self._ext_movement.rearming(slot4) and self._has_seen_assault_mode and self._has_seen_assault_mode then
					slot5 = managers.groupai
					slot5 = managers.groupai.state(slot4)

					if not managers.groupai.state(slot4).is_detection_persistent(slot4) then
						if not self._decide_go_idle_t then
							self._decide_go_idle_t = t + self._tweak_data.IDLE_WAIT_TIME
						elseif self._decide_go_idle_t < t then
							slot6 = true

							self.set_idle(slot4, self)
						end
					end
				end
			end
		end
	end

	return 
end
function SentryGunBrain:on_detected_attention_obj_modified(modified_u_key)
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	local attention_info = self._detected_attention_objects[modified_u_key]

	if not attention_info then
		return 
	end

	slot11 = self._unit
	slot11 = self._unit.movement(slot10)
	local new_settings = attention_info.handler.get_attention(slot4, attention_info.handler, self._SO_access, nil, self._unit.movement(slot10).team(slot10))
	local old_settings = attention_info.settings

	if new_settings == old_settings then
		return 
	end

	local old_notice_clbk = not attention_info.identified and old_settings.notice_clbk

	if new_settings and AIAttentionObject.REACT_SUSPICIOUS <= new_settings.reaction then
		attention_info.settings = new_settings
		attention_info.stare_expire_t = nil
		attention_info.pause_expire_t = nil
	else
		slot9 = attention_info

		self._destroy_detected_attention_object_data(slot7, self)

		if self._attention_obj and self._attention_obj.u_key == modified_u_key then
			slot8 = self._ext_movement

			self._ext_movement.set_attention(slot7)
		end
	end

	if old_notice_clbk and (not new_settings or not new_settings.notice_clbk) then
		slot9 = false

		old_notice_clbk(slot7, self._unit)
	end

	return 
end
function SentryGunBrain:on_damage_received(attacker_unit)
	slot4 = Network

	if not Network.is_server(slot3) or not attacker_unit then
		return 
	end

	slot4 = attacker_unit
	local u_key = attacker_unit.key(slot3)
	local attention_info = self._detected_attention_objects[u_key]

	if not attention_info then
		return 
	end

	slot6 = TimerManager
	slot6 = TimerManager.game(slot5)
	attention_info.dmg_t = TimerManager.game(slot5).time(slot5)

	return 
end
function SentryGunBrain:on_team_set(team_data)
	if self._attention_handler then
		slot5 = team_data

		self._attention_handler.set_team(slot3, self._attention_handler)
	end

	local all_att_objects = {}
	slot5 = self._detected_attention_objects

	for u_key, att_info in pairs(slot4) do
		slot11 = u_key

		table.insert(slot9, all_att_objects)
	end

	slot5 = all_att_objects

	for _, u_key in ipairs(slot4) do
		slot11 = u_key

		self.on_detected_attention_obj_modified(slot9, self)
	end

	return 
end
function SentryGunBrain:set_idle(state)
	self._idle = state
	slot5 = not state

	self._ext_movement.set_idle(slot3, self._ext_movement)

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._unit
		slot6 = state

		self._unit.network(slot3).send(slot3, self._unit.network(slot3), "turret_idle_state")
	end

	return 
end
function SentryGunBrain:get_repair_counter()
	return self._auto_repair_counter
end
function SentryGunBrain:switch_off(fixed)
	slot4 = self._unit
	slot5 = "laser_off"

	if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
		slot4 = self._unit
		slot5 = "laser_off"

		self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
	end

	slot4 = Network
	local is_server = Network.is_server(slot3)

	if is_server then
		slot5 = self._ext_movement

		self._ext_movement.set_attention(slot4)
	end

	slot6 = false

	self.set_active(slot4, self)

	slot6 = fixed

	self._ext_movement.switch_off(slot4, self._ext_movement)

	slot6 = 26

	self._unit.set_slot(slot4, self._unit)

	slot5 = managers.groupai
	slot6 = self._unit

	if managers.groupai.state(slot4).all_criminals(slot4)[self._unit.key(managers.groupai.state(slot4))] then
		slot5 = managers.groupai
		slot6 = self._unit

		managers.groupai.state(slot4).on_criminal_neutralized(slot4, managers.groupai.state(slot4))
	end

	slot5 = Network

	if Network.is_server(slot4) then
		slot6 = nil

		PlayerMovement.set_attention_settings(slot4, self)
	end

	slot5 = self._unit
	slot5 = self._unit.base(slot4)

	self._unit.base(slot4).unregister(slot4)

	self._attention_obj = nil

	return 
end
function SentryGunBrain:switch_on()

	-- Decompilation error in this vicinity:
	slot3 = self._unit
	slot4 = "laser_activate"

	if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
		slot3 = self._unit
		slot4 = "laser_activate"

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	slot3 = Network
	local is_server = Network.is_server(slot2)

	if is_server then
	end

	slot5 = true

	self.set_active(slot3, self)

	slot4 = self._ext_movement

	self._ext_movement.switch_on(slot3)

	slot5 = 25

	self._unit.set_slot(slot3, self._unit)

	slot4 = self._unit
	slot4 = self._unit.base(slot3)

	self._unit.base(slot3).register(slot3)

	slot4 = managers.groupai
	slot5 = self._unit

	if managers.groupai.state(slot3).all_criminals(slot3)[self._unit.key(managers.groupai.state(slot3))] then
		slot4 = managers.groupai
		slot5 = self._unit

		managers.groupai.state(slot3).on_criminal_recovered(slot3, managers.groupai.state(slot3))
	end

	if is_server then
		slot5 = {
			"sentry_gun_enemy_cbt"
		}

		PlayerMovement.set_attention_settings(slot3, self)
	end

	return 
end
function SentryGunBrain:_setup_attention_handler()
	slot4 = self._unit
	self._attention_handler = CharacterAttentionObject.new(slot2, CharacterAttentionObject)
	slot3 = self._attention_handler
	slot6 = self._ext_movement

	self._attention_handler.set_team(slot2, self._ext_movement.team(slot5))

	slot4 = {
		"sentry_gun_enemy_cbt"
	}

	PlayerMovement.set_attention_settings(slot2, self)

	return 
end
function SentryGunBrain:attention_handler()
	return self._attention_handler
end
function SentryGunBrain:SO_access()
	return self._SO_access
end
function SentryGunBrain:on_hacked_start()
	slot4 = {
		"sentry_gun_enemy_cbt_hacked"
	}

	PlayerMovement.set_attention_settings(slot2, self)

	return 
end
function SentryGunBrain:on_hacked_end()
	slot4 = {
		"sentry_gun_enemy_cbt"
	}

	PlayerMovement.set_attention_settings(slot2, self)

	return 
end
function SentryGunBrain:save(save_data)
	local my_save_data = {}
	save_data.brain = my_save_data
	my_save_data.shaprness_mul = self._shaprness_mul
	my_save_data.SO_access_str = self._SO_access_str
	slot5 = self._unit
	slot5 = self._unit.base(slot4)
	my_save_data.tweak_data_id = self._unit.base(slot4).get_name_id(slot4)
	my_save_data.keep_ai_attached = self._keep_ai_attached

	return 
end
function SentryGunBrain:load(save_data)
	if not save_data or not save_data.brain then
		return 
	end

	local my_save_data = save_data.brain
	self._shaprness_mul = save_data.brain.shaprness_mul or 1
	self._SO_access_str = my_save_data.SO_access_str
	slot6 = self._SO_access_str
	self._SO_access = managers.navigation.convert_access_flag(slot4, managers.navigation)
	self._tweak_data = tweak_data.weapon[my_save_data.tweak_data_id]
	self._keep_ai_attached = my_save_data.keep_ai_attached

	return 
end
function SentryGunBrain:pre_destroy()
	slot3 = self._detected_attention_objects

	for key, attention_info in pairs(slot2) do
		slot9 = attention_info

		self._destroy_detected_attention_object_data(slot7, self)
	end

	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil)

	slot3 = Network

	if Network.is_server(slot2) and self._attention_handler then
		slot4 = nil

		PlayerMovement.set_attention_settings(slot2, self)
	end

	return 
end
function SentryGunBrain:on_intimidated(amount, aggressor_unit)
	return 
end
function SentryGunBrain:keep_ai_attached()
	self._keep_ai_attached = true

	return 
end
function SentryGunBrain:allow_turret_abandon()
	return self._allow_turret_abandon and not self._keep_ai_attached
end

return 
