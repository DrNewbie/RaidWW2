-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CopActionTase = CopActionTase or class()
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
function CopActionTase:init(action_desc, common_data)
	self._common_data = common_data
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_brain = common_data.ext_brain
	self._ext_inventory = common_data.ext_inventory
	self._body_part = action_desc.body_part
	self._machine = common_data.machine
	slot5 = "action_upper_body_enemy"
	self._modifier_name = Idstring(slot4)
	slot6 = self._modifier_name
	self._modifier = self._machine.get_modifier(slot4, self._machine)
	local attention = common_data.attention

	if not attention or not attention.unit then
		slot6 = Network

		if Network.is_server(slot5) then
			slot6 = "[CopActionTase:init] no attention"
			slot9 = action_desc

			debug_pause(slot5, inspect(slot8))

			return 
		end
	end

	local weapon_unit = self._ext_inventory.equipped_unit(slot5)
	slot8 = attention

	self.on_attention(self._ext_inventory, self)

	slot7 = Network

	if Network.is_server(self._ext_inventory) then
		slot8 = 3

		self._ext_movement.set_stance_by_code(slot6, self._ext_movement)
	end

	slot8 = action_desc.block_desc

	CopActionAct._create_blocks_table(slot6, self)

	return true
end
function CopActionTase:expired()
	return self._expired
end
function CopActionTase:on_attention(attention)

	-- Decompilation error in this vicinity:
	if self._expired then
		self._attention = attention
	else
		slot4 = Network

		if Network.is_server(slot3) then
			if self._attention then
				if self._discharging then
					slot4 = self._tasing_local_unit
					slot4 = self._tasing_local_unit.movement(slot3)

					self._tasing_local_unit.movement(slot3).on_tase_ended(slot3)

					self._discharging = nil
				end

				if self._tasing_local_unit and self._tasing_player then
					slot4 = self._attention.unit
					slot6 = self._unit

					self._attention.unit.movement(slot3).on_targetted_for_attack(slot3, self._attention.unit.movement(slot3), false)
				end

				self._tasing_player = nil
				self._tasing_local_unit = nil
				self._expired = true
				self.update = self._upd_empty
				self._attention = attention

				return 
			end
		else
			if self._client_attention_set or not attention or not attention.unit then
				if self._discharging then
					slot4 = self._tasing_local_unit
					slot4 = self._tasing_local_unit.movement(slot3)

					self._tasing_local_unit.movement(slot3).on_tase_ended(slot3)

					self._discharging = nil
				end

				if self._tasing_local_unit and self._tasing_player then
					slot4 = self._tasing_local_unit
					slot6 = self._unit

					self._tasing_local_unit.movement(slot3).on_targetted_for_attack(slot3, self._tasing_local_unit.movement(slot3), false)
				end

				self._tasing_player = nil
				self._tasing_local_unit = nil
				self._attention = attention
				self.update = self._upd_empty

				return 
			end

			self._client_attention_set = true
		end
	end

	local attention_unit = attention.unit
	self.update = nil
	local weapon_unit = self._ext_inventory.equipped_unit(slot4)
	slot6 = weapon_unit
	slot6 = weapon_unit.base(self._ext_inventory)
	local weap_tweak = weapon_unit.base(self._ext_inventory).weapon_tweak_data(self._ext_inventory)
	local weapon_usage_tweak = self._common_data.char_tweak.weapon[weap_tweak.usage]
	self._weap_tweak = weap_tweak
	self._w_usage_tweak = weapon_usage_tweak
	self._falloff = weapon_usage_tweak.FALLOFF
	slot8 = Network
	self._turn_allowed = Network.is_client(slot7)
	self._attention = attention
	slot8 = TimerManager
	slot8 = TimerManager.game(slot7)
	local t = TimerManager.game(slot7).time(slot7)
	slot10 = self._ext_movement
	local shoot_from_pos = self._ext_movement.m_head_pos(slot9)
	local target_vec = target_pos - shoot_from_pos
	slot13 = target_vec

	self._modifier.set_target_y(slot11, self._modifier)

	local aim_delay = weapon_usage_tweak.aim_delay_tase or weapon_usage_tweak.aim_delay
	slot16 = target_vec
	slot14 = target_vec.length(slot15) / self._falloff[#self._falloff].r
	local lerp_dis = math.min(slot12, 1)
	slot16 = lerp_dis
	local shoot_delay = math.lerp(1, aim_delay[1], aim_delay[2])
	self._mod_enable_t = t + shoot_delay
	self._tasing_local_unit = nil
	self._tasing_player = nil
	slot15 = Network

	if Network.is_server(aim_delay[1]) then
		slot17 = 1

		self._common_data.ext_network.send(slot14, self._common_data.ext_network, "action_tase_event")

		slot15 = attention_unit

		if not attention_unit.base(slot14).is_husk_player then
			slot15 = TimerManager
			slot15 = TimerManager.game(slot14)
			self._shoot_t = TimerManager.game(slot14).time(slot14) + shoot_delay
			self._tasing_local_unit = attention_unit
			slot16 = "bullet_impact_targets_no_criminals"
			self._line_of_fire_slotmask = managers.slot.get_mask(slot14, managers.slot)
			slot15 = attention_unit
			self._tasing_player = attention_unit.base(slot14).is_local_player
		end
	else
		slot15 = attention_unit

		if attention_unit.base(slot14).is_local_player then
			slot15 = TimerManager
			slot15 = TimerManager.game(slot14)
			self._shoot_t = TimerManager.game(slot14).time(slot14) + shoot_delay
			self._tasing_local_unit = attention_unit
			slot16 = "bullet_impact_targets"
			self._line_of_fire_slotmask = managers.slot.get_mask(slot14, managers.slot)
			self._tasing_player = true
		end
	end

	if self._tasing_local_unit and self._tasing_player then
		slot15 = self._tasing_local_unit
		slot17 = self._unit

		self._tasing_local_unit.movement(slot14).on_targetted_for_attack(slot14, self._tasing_local_unit.movement(slot14), true)
	end

	return 
end
function CopActionTase:save(save_data)
	save_data.type = "tase"
	save_data.body_part = self._body_part

	return 
end
function CopActionTase:on_exit()
	if self._tase_effect then
		slot3 = World
		slot4 = self._tase_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))
	end

	if self._discharging then
		slot3 = self._tasing_local_unit
		slot3 = self._tasing_local_unit.movement(slot2)

		self._tasing_local_unit.movement(slot2).on_tase_ended(slot2)
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot4 = 2

		self._ext_movement.set_stance_by_code(slot2, self._ext_movement)
	end

	if self._modifier_on then
		slot4 = self._modifier_name

		self._machine.allow_modifier(slot2, self._machine)
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit
		slot5 = 2

		self._unit.network(slot2).send(slot2, self._unit.network(slot2), "action_tase_event")

		if self._expired then
			slot4 = {
				body_part = 3,
				type = "idle"
			}

			self._ext_movement.action_request(slot2, self._ext_movement)
		end
	end

	if self._tasered_sound then
		slot3 = self._tasered_sound

		self._tasered_sound.stop(slot2)

		slot3 = self._unit
		slot5 = nil

		self._unit.sound(slot2).play(slot2, self._unit.sound(slot2), "tasered_3rd_stop")
	end

	if self._tasing_local_unit and self._tasing_player then
		slot3 = self._attention.unit
		slot5 = self._unit

		self._attention.unit.movement(slot2).on_targetted_for_attack(slot2, self._attention.unit.movement(slot2), false)
	end

	if self._malfunction_clbk_id then
		slot4 = self._malfunction_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._malfunction_clbk_id = nil
	end

	return 
end
function CopActionTase:on_destroy()
	if self._tase_effect then
		slot3 = World
		slot4 = self._tase_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))
	end

	if self._malfunction_clbk_id then
		slot4 = self._malfunction_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._malfunction_clbk_id = nil
	end

	return 
end
function CopActionTase:update(t)
	if self._expired then
		return 
	end

	slot4 = self._ext_movement
	local shoot_from_pos = self._ext_movement.m_head_pos(slot3)
	local target_dis = nil
	local target_vec = temp_vec1
	local target_pos = temp_vec2
	slot8 = self._attention.unit
	slot9 = target_pos

	self._attention.unit.character_damage(slot7).shoot_pos_mid(slot7, self._attention.unit.character_damage(slot7))

	slot10 = target_pos
	target_dis = mvector3.direction(slot7, target_vec, shoot_from_pos)
	slot9 = 0
	local target_vec_flat = target_vec.with_z(slot7, target_vec)
	slot9 = target_vec_flat

	mvector3.normalize(target_vec)

	slot10 = target_vec_flat
	local fwd_dot = mvector3.dot(target_vec, self._common_data.fwd)

	if 0.7 < fwd_dot then
		if not self._modifier_on then
			self._modifier_on = true
			slot11 = self._modifier_name

			self._machine.force_modifier(slot9, self._machine)

			self._mod_enable_t = t + 0.5
		end

		slot11 = target_vec

		self._modifier.set_target_y(slot9, self._modifier)
	else
		if self._modifier_on then
			self._modifier_on = nil
			slot11 = self._modifier_name

			self._machine.allow_modifier(slot9, self._machine)
		end

		if self._turn_allowed and not self._ext_anim.walk and not self._ext_anim.turn then
			slot11 = "walk"

			if not self._ext_movement.chk_action_forbidden(slot9, self._ext_movement) then
				slot12 = math.UP
				local spin = target_vec.to_polar_with_reference(slot9, target_vec, self._common_data.fwd).spin
				slot11 = spin
				local abs_spin = math.abs(target_vec)

				if 27 < abs_spin then
					local new_action_data = {
						type = "turn",
						body_part = 2,
						angle = spin
					}
					slot14 = new_action_data

					self._ext_movement.action_request(slot12, self._ext_movement)
				end
			end
		end

		target_vec = nil
	end

	if not self._ext_anim.reload then
		if self._ext_anim.equip then
		elseif self._discharging then
			slot18 = "report"
			local vis_ray = self._unit.raycast(slot9, self._unit, "ray", shoot_from_pos, target_pos, "slot_mask", self._line_of_fire_slotmask, "ignore_unit", self._tasing_local_unit)
			slot11 = self._tasing_local_unit
			slot11 = self._tasing_local_unit.movement(self._unit)

			if not self._tasing_local_unit.movement(self._unit).tased(self._unit) or vis_ray then
				slot11 = Network

				if Network.is_server(slot10) then
					self._expired = true
				else
					slot11 = self._tasing_local_unit
					slot11 = self._tasing_local_unit.movement(slot10)

					self._tasing_local_unit.movement(slot10).on_tase_ended(slot10)

					slot11 = self._attention.unit
					slot13 = self._unit

					self._attention.unit.movement(slot10).on_targetted_for_attack(slot10, self._attention.unit.movement(slot10), false)

					self._discharging = nil
					self._tasing_player = nil
					self._tasing_local_unit = nil
					self.update = self._upd_empty
				end
			end
		elseif self._shoot_t and target_vec and self._common_data.allow_fire and self._shoot_t < t and self._mod_enable_t < t then
			if self._tase_effect then
				slot10 = World
				slot11 = self._tase_effect

				World.effect_manager(slot9).fade_kill(slot9, World.effect_manager(slot9))
			end

			slot10 = World
			slot11 = {
				force_synch = true,
				effect = Idstring(slot13),
				parent = self._ext_inventory.equipped_unit(slot13).get_object(slot13, Idstring(slot16))
			}
			slot14 = "effects/vanilla/character/taser_thread"
			slot14 = self._ext_inventory
			slot14 = self._ext_inventory.equipped_unit(slot13)
			slot17 = "fire"
			self._tase_effect = World.effect_manager(slot9).spawn(slot9, World.effect_manager(slot9))

			if self._tasing_local_unit then
				slot11 = target_pos
			elseif not self._tasing_local_unit then
				slot10 = self._unit
				slot12 = nil
				self._tasered_sound = self._unit.sound(slot9).play(slot9, self._unit.sound(slot9), "tasered_3rd")
				slot11 = "recoil"
				local redir_res = self._ext_movement.play_redirect(slot9, self._ext_movement)

				if redir_res then
					slot14 = 0

					self._machine.set_parameter(slot10, self._machine, redir_res, "hvy")
				end

				self._shoot_t = nil
			end
		end
	end

	return 
end
function CopActionTase:type()
	return "tase"
end
function CopActionTase:fire_taser()
	self._shoot_t = 0

	return 
end
function CopActionTase:chk_block(action_type, t)
	slot7 = t

	return CopActionAct.chk_block(slot4, self, action_type)
end
function CopActionTase:_upd_empty(t)
	return 
end
function CopActionTase:need_upd()
	return true
end
function CopActionTase:get_husk_interrupt_desc()
	local action_desc = {
		block_type = "action",
		body_part = 3,
		type = "tase"
	}

	return action_desc
end
function CopActionTase:clbk_malfunction()
	self._malfunction_clbk_id = nil

	if self._expired then
		return 
	end

	slot3 = World
	slot4 = {
		effect = Idstring(slot6),
		position = self._ext_movement.m_head_pos(slot6),
		normal = math.UP
	}
	slot7 = "effects/vanilla/character/taser_stop"
	slot7 = self._ext_movement

	World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))

	local action_data = {
		damage = 0,
		variant = "melee"
	}
	slot4 = self._unit
	action_data.damage_effect = self._unit.character_damage(World.effect_manager(slot2))._HEALTH_INIT * 10
	action_data.attacker_unit = managers.player.player_unit(World.effect_manager(slot2)) or self._unit
	action_data.attack_dir = -self._common_data.fwd
	slot7 = self._ext_movement
	slot3 = self._unit.body(managers.player, self._unit)
	action_data.col_ray = {
		position = mvector3.copy(self._ext_movement.m_head_pos("body")),
		body = slot3
	}
	slot4 = self._unit
	slot5 = action_data

	self._unit.character_damage(slot3).damage_melee(slot3, self._unit.character_damage(slot3))

	return 
end

return 
