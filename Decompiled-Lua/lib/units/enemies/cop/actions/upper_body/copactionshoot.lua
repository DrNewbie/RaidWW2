-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

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
slot0 = mvector3
local mvec3_set = slot0.set
slot1 = mvector3
local mvec3_set_z = slot1.set_z
slot2 = mvector3
local mvec3_sub = slot2.subtract
slot3 = mvector3
local mvec3_norm = slot3.normalize
slot4 = mvector3
local mvec3_dir = slot4.direction
slot5 = mvector3
local mvec3_set_l = slot5.set_length
slot6 = mvector3
local mvec3_add = slot6.add
slot7 = mvector3
local mvec3_dot = slot7.dot
slot8 = mvector3
local mvec3_cross = slot8.cross
slot9 = mvector3
local mvec3_rot = slot9.rotate_with
slot10 = mvector3
local mvec3_rand_orth = slot10.random_orthogonal
slot11 = mvector3
local mvec3_lerp = slot11.lerp
slot12 = mrotation
local mrot_axis_angle = slot12.set_axis_angle
slot13 = Vector3
local temp_vec1 = slot13()
slot14 = Vector3
local temp_vec2 = slot14()
slot15 = Vector3
local temp_vec3 = slot15()
slot16 = Rotation
local temp_rot1 = slot16()
local bezier_curve = {
	0,
	0,
	1,
	1
}
slot18 = CopActionShoot

if not slot18 then
	slot18 = class
	slot18 = slot18()
end

CopActionShoot = slot18
slot18 = CopActionShoot
slot19 = {}
slot20 = {
	update = "_update_ik_spine",
	start = "_begin_ik_spine",
	get_blend = "_get_blend_ik_spine",
	stop = "_stop_ik_spine"
}
slot19.spine = slot20
slot20 = {
	update = "_update_ik_r_arm",
	start = "_begin_ik_r_arm",
	get_blend = "_get_blend_ik_r_arm",
	stop = "_stop_ik_r_arm"
}
slot19.r_arm = slot20
slot18._ik_presets = slot19
slot18 = CopActionShoot

function slot19(self, action_desc, common_data)
	self._common_data = common_data
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	local t = TimerManager.game(slot4).time(slot4)
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_brain = common_data.ext_brain
	self._ext_inventory = common_data.ext_inventory
	self._ext_base = common_data.ext_base
	self._body_part = action_desc.body_part
	self._machine = common_data.machine
	self._unit = common_data.unit
	local preset_name = self._ext_anim.base_aim_ik or "spine"
	slot5 = self._ik_presets
	local preset_data = slot5[preset_name]
	self._ik_preset = preset_data
	slot6 = preset_data.start
	slot6 = self[slot6]
	slot8 = self

	slot6(slot7)

	slot6 = self._ext_inventory
	slot8 = slot6
	slot6 = slot6.equipped_unit
	local weapon_unit = slot6(slot7)
	slot9 = weapon_unit
	slot7 = weapon_unit.base
	slot7 = slot7(slot8)
	slot9 = slot7
	slot7 = slot7.weapon_tweak_data
	local weap_tweak = slot7(slot8)
	slot8 = common_data.char_tweak
	slot8 = slot8.weapon
	slot9 = weap_tweak.usage
	local weapon_usage_tweak = slot8[slot9]

	if not weapon_usage_tweak then
		slot9 = Application
		slot11 = slot9
		slot9 = slot9.error
		slot12 = "[CopActionShoot:init vent] unknown weapon used: "
		slot13 = inspect
		slot15 = self._unit
		slot13 = slot13(slot14)
		slot14 = "   "
		slot15 = inspect
		slot17 = weapon_unit
		slot15 = slot15(slot16)
		slot16 = "   "
		slot17 = inspect
		slot19 = weap_tweak
		slot17 = slot17(slot18)
		slot18 = "   "
		slot19 = inspect
		slot21 = common_data.char_tweak

		slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot19(slot20))

		return 
	end

	self._weapon_unit = weapon_unit
	slot11 = weapon_unit
	self._weapon_base = weapon_unit.base(slot10)
	self._weap_tweak = weap_tweak
	self._w_usage_tweak = weapon_usage_tweak
	self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
	self._spread = weapon_usage_tweak.spread
	self._falloff = weapon_usage_tweak.FALLOFF
	self._variant = action_desc.variant
	self._body_part = action_desc.body_part
	slot11 = Network
	self._turn_allowed = Network.is_client(slot10)
	self._automatic_weap = weap_tweak.auto and true
	self._shoot_t = 0
	self._melee_timeout_t = t + 1
	slot9 = self._ext_movement
	slot11 = slot9
	slot9 = slot9.m_head_pos
	local shoot_from_pos = slot9(slot10)
	self._shoot_from_pos = shoot_from_pos
	slot12 = self
	slot10 = self.on_attention
	slot13 = common_data.attention

	slot10(slot11, slot12)

	slot10 = Network
	slot12 = slot10
	slot10 = slot10.is_server
	slot10 = slot10(slot11)

	if slot10 then
		slot10 = self._ext_movement
		slot12 = slot10
		slot10 = slot10.set_stance_by_code
		slot13 = 3

		slot10(slot11, slot12)
	end

	slot10 = CopActionAct
	slot10 = slot10._create_blocks_table
	slot12 = self
	slot13 = action_desc.blocks

	slot10(slot11, slot12)

	slot10 = Network
	slot12 = slot10
	slot10 = slot10.is_server
	slot10 = slot10(slot11)

	if slot10 then
		slot10 = common_data.ext_network
		slot12 = slot10
		slot10 = slot10.send
		slot13 = "action_aim_state"
		slot14 = true

		slot10(slot11, slot12, slot13)
	end

	slot10 = 1
	self._skipped_frames = slot10
	slot10 = self._get_target_pos
	self._get_target_position = slot10
	slot10 = true

	return slot10
end

slot18.init = slot19
slot18 = CopActionShoot

function slot19(self, event)
	slot2 = self._weapon_unit

	if slot2 then
		slot2 = self._autofiring

		if slot2 then
			slot2 = self._weapon_base
			slot4 = slot2
			slot2 = slot2.stop_autofire

			slot2(slot3)

			slot2 = self._ext_anim
			slot2 = slot2.recoil

			if slot2 then
				slot2 = self._ext_movement
				slot4 = slot2
				slot2 = slot2.play_redirect
				slot5 = "up_idle"

				slot2(slot3, slot4)
			end
		end
	end

	slot2 = self._ext_inventory
	slot4 = slot2
	slot2 = slot2.equipped_unit
	local weapon_unit = slot2(slot3)
	self._weapon_unit = weapon_unit

	if weapon_unit then
		slot5 = weapon_unit
		slot3 = weapon_unit.base
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.weapon_tweak_data
		local weap_tweak = slot3(slot4)
		slot4 = self._common_data
		slot4 = slot4.char_tweak
		slot4 = slot4.weapon
		slot5 = weap_tweak.usage
		local weapon_usage_tweak = slot4[slot5]

		if not weapon_usage_tweak then
			slot5 = Application
			slot7 = slot5
			slot5 = slot5.error
			slot8 = "[CopActionShoot:on_inventory_e vent] unknown weapon used: "
			slot9 = inspect
			slot11 = self._unit
			slot9 = slot9(slot10)
			slot10 = "   "
			slot11 = inspect
			slot13 = weap_tweak
			slot11 = slot11(slot12)
			slot12 = "   "
			slot13 = inspect
			slot15 = self._common_data
			slot15 = slot15.char_tweak

			slot5(slot6, slot7, slot8, slot9, slot10, slot11, slot13(slot14))

			return 
		end

		slot7 = weapon_unit
		self._weapon_base = weapon_unit.base(slot6)
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
		self._spread = weapon_usage_tweak.spread
		self._falloff = weapon_usage_tweak.FALLOFF
		self._automatic_weap = weap_tweak.auto and true
	else
		slot3 = nil
		self._weapon_base = slot3
		slot3 = nil
		self._weap_tweak = slot3
		slot3 = nil
		self._w_usage_tweak = slot3
		slot3 = nil
		self._reload_speed = slot3
		slot3 = nil
		self._spread = slot3
		slot3 = nil
		self._falloff = slot3
		slot3 = nil
		self._automatic_weap = slot3
	end

	slot3 = nil
	self._autofiring = slot3
	slot3 = nil
	self._autoshots_fired = slot3
	slot3 = self._weapon_unit

	if slot3 then
		slot3 = nil
		self.update = slot3
	else
		slot3 = self._upd_empty
		slot3 = slot3()
		self.update = slot3
	end

	return 
end

slot18.on_inventory_event = slot19
slot18 = CopActionShoot

function slot19(self, attention, old_attention)
	slot3 = self._shooting_player

	if slot3 and old_attention then
		slot3 = alive
		slot5 = old_attention.unit
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = old_attention.unit
			slot5 = slot3
			slot3 = slot3.movement
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.on_targetted_for_attack
			slot6 = false
			slot7 = self._common_data
			slot7 = slot7.unit

			slot3(slot4, slot5, slot6)
		end
	end

	slot3 = nil
	self._shooting_player = slot3
	slot3 = nil
	self._shooting_husk_player = slot3
	slot3 = nil
	self._next_vis_ray_t = slot3

	if attention then
		slot3 = self._ik_preset
		slot3 = slot3.start
		slot3 = self[slot3]
		slot5 = self

		slot3(slot4)

		slot3 = self._ext_base
		slot5 = slot3
		slot3 = slot3.lod_stage
		local vis_state = slot3(slot4)

		if vis_state then
			slot4 = 3
		else
			slot4 = nil
			self._aim_transition = slot4
			slot4 = self._get_target_pos
			self._get_target_position = slot4
		end

		slot4 = TimerManager
		slot6 = slot4
		slot4 = slot4.game
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.time
		slot4 = slot4(slot5)
		slot4 = slot4 + 0.5
		self._mod_enable_t = slot4
		slot4 = attention.unit

		if slot4 then

			-- Decompilation error in this vicinity:
			slot4 = attention.unit
			slot6 = slot4
			slot4 = slot4.base
			slot4 = slot4(slot5)

			if slot4 then
				slot4 = attention.unit
				slot6 = slot4
				slot4 = slot4.base
				slot4 = slot4(slot5)
				slot4 = slot4.is_local_player
			end

			self._shooting_player = slot4
			slot4 = Network
			slot6 = slot4
			slot4 = slot4.is_client
			slot4 = slot4(slot5)

			if slot4 then
				slot4 = attention.unit
				slot6 = slot4
				slot4 = slot4.base
				slot4 = slot4(slot5)

				if slot4 then
					slot4 = attention.unit
					slot6 = slot4
					slot4 = slot4.base
					slot4 = slot4(slot5)
					slot4 = slot4.is_husk_player
				end

				self._shooting_husk_player = slot4
				slot4 = self._shooting_husk_player

				if slot4 then
					slot4 = TimerManager
					slot6 = slot4
					slot4 = slot4.game
					slot4 = slot4(slot5)
					slot6 = slot4
					slot4 = slot4.time
					slot4 = slot4(slot5)
					self._next_vis_ray_t = slot4
				end
			end

			slot4 = self._shooting_player
			local usage_tweak = self._w_usage_tweak
			slot5 = attention.handler
			slot6 = math
			slot6 = slot6.random
			slot8 = 360
			local focus_error_roll = slot6(slot7)
			local shoot_hist = self._shoot_history

			if shoot_hist then
				shoot_hist.focus_error_roll = focus_error_roll
				slot8 = mvector3
				slot8 = slot8.distance
				slot10 = target_pos
				slot11 = shoot_hist.m_last_pos
				local displacement = slot8(slot9, slot10)
				slot9 = usage_tweak.focus_delay
				slot10 = math
				slot10 = slot10.min
				slot12 = 1
				slot13 = usage_tweak.focus_dis
				slot13 = displacement / slot13
				slot10 = slot10(slot11, slot12)
				local focus_delay = slot9 * slot10
				slot10 = TimerManager
				slot12 = slot10
				slot10 = slot10.game
				slot10 = slot10(slot11)
				slot12 = slot10
				slot10 = slot10.time
				slot10 = slot10(slot11)
				shoot_hist.focus_start_t = slot10
				shoot_hist.focus_delay = focus_delay
				slot10 = mvector3
				slot10 = slot10.copy
				slot12 = target_pos
				slot10 = slot10(slot11)
				shoot_hist.m_last_pos = slot10
			else
				slot8 = {
					focus_error_roll = focus_error_roll
				}
				slot9 = TimerManager
				slot11 = slot9
				slot9 = slot9.game
				slot9 = slot9(slot10)
				slot11 = slot9
				slot9 = slot9.time
				slot9 = slot9(slot10)
				slot8.focus_start_t = slot9
				slot9 = usage_tweak.focus_delay
				slot8.focus_delay = slot9
				slot9 = mvector3
				slot9 = slot9.copy
				slot11 = target_pos
				slot9 = slot9(slot10)
				slot8.m_last_pos = slot9
				shoot_hist = slot8
				self._shoot_history = shoot_hist
			end
		end
	else
		slot3 = self._ik_preset
		slot3 = slot3.stop
		slot3 = self[slot3]
		slot5 = self

		slot3(slot4)

		slot3 = self._aim_transition

		if slot3 then
			slot3 = nil
			self._aim_transition = slot3
			slot3 = self._get_target_pos
			self._get_target_position = slot3
		end
	end

	self._attention = attention

	return 
end

slot18.on_attention = slot19
slot18 = CopActionShoot

function slot19(self, save_data)
	slot2 = "shoot"
	save_data.type = slot2
	slot2 = 3
	save_data.body_part = slot2

	return 
end

slot18.save = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = Network
	slot3 = slot1
	slot1 = slot1.is_server
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._ext_movement
		slot3 = slot1
		slot1 = slot1.set_stance
		slot4 = "hos"

		slot1(slot2, slot3)
	end

	slot1 = self._modifier_on

	if slot1 then
		slot1 = self._ik_preset
		slot1 = slot1.stop
		slot1 = self[slot1]
		slot3 = self

		slot1(slot2)
	end

	slot1 = self._autofiring

	if slot1 then
		slot1 = self._weapon_base
		slot3 = slot1
		slot1 = slot1.stop_autofire

		slot1(slot2)
	end

	slot1 = self._ext_anim
	slot1 = slot1.recoil

	if slot1 then
		slot1 = self._ext_movement
		slot3 = slot1
		slot1 = slot1.play_redirect
		slot4 = "up_idle"

		slot1(slot2, slot3)
	end

	slot1 = Network
	slot3 = slot1
	slot1 = slot1.is_server
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._common_data
		slot1 = slot1.unit
		slot3 = slot1
		slot1 = slot1.network
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.send
		slot4 = "action_aim_state"
		slot5 = false

		slot1(slot2, slot3, slot4)
	end

	slot1 = self._shooting_player

	if slot1 then
		slot1 = alive
		slot3 = self._attention
		slot3 = slot3.unit
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._attention
			slot1 = slot1.unit
			slot3 = slot1
			slot1 = slot1.movement
			slot1 = slot1(slot2)
			slot3 = slot1
			slot1 = slot1.on_targetted_for_attack
			slot4 = false
			slot5 = self._common_data
			slot5 = slot5.unit

			slot1(slot2, slot3, slot4)
		end
	end

	return 
end

slot18.on_exit = slot19
slot18 = CopActionShoot

function slot19(self, t)
	slot4 = self._ext_base
	local vis_state = self._ext_base.lod_stage(slot3)
	vis_state = vis_state or 4

	if vis_state == 1 then
	else
		slot3 = vis_state * 3
		slot4 = self._skipped_frames

		if slot4 < slot3 then
			slot3 = self._skipped_frames
			slot3 = slot3 + 1
			self._skipped_frames = slot3

			return 
		else
			slot3 = 1
			self._skipped_frames = slot3
		end
	end

	local shoot_from_pos = self._shoot_from_pos
	local ext_anim = self._ext_anim
	local target_vec, target_dis, autotarget, target_pos = nil
	slot9 = self._attention

	if slot9 then
		slot11 = self
		slot9 = self._get_target_position
		slot12 = shoot_from_pos
		slot13 = self._attention
		slot14 = t
		slot9, slot10, slot11, slot12 = slot9(slot10, slot11, slot12, slot13)
		autotarget = slot12
		target_dis = slot11
		target_vec = slot10
		target_pos = slot9
		local tar_vec_flat = temp_vec2
		slot10 = mvec3_set
		slot12 = tar_vec_flat
		slot13 = target_vec

		slot10(slot11, slot12)

		slot10 = mvec3_set_z
		slot12 = tar_vec_flat
		slot13 = 0

		slot10(slot11, slot12)

		slot10 = mvec3_norm
		slot12 = tar_vec_flat

		slot10(slot11)

		slot10 = self._common_data
		local fwd = slot10.fwd
		slot11 = mvec3_dot
		slot13 = fwd
		slot14 = tar_vec_flat
		local fwd_dot = slot11(slot12, slot13)
		slot12 = self._turn_allowed

		if slot12 then
			slot12 = self._common_data
			local active_actions = slot12.active_actions
			slot13 = self._common_data
			local queued_actions = slot13.queued_actions
			slot14 = active_actions[2]
		end

		slot14 = self
		slot12 = self._upd_ik
		slot15 = target_vec
		slot16 = fwd_dot
		slot17 = t
		slot12 = slot12(slot13, slot14, slot15, slot16)
		target_vec = slot12
	end

	slot9 = ext_anim.reload

	if not slot9 then
		slot9 = ext_anim.equip

		if not slot9 then
			slot9 = ext_anim.melee

			if not slot9 then
				slot9 = ext_anim.equip

				if slot9 then
				else
					slot9 = self._weapon_base
					slot11 = slot9
					slot9 = slot9.clip_empty
					slot9 = slot9(slot10)

					if slot9 then
						slot9 = self._autofiring

						if slot9 then
							slot9 = self._weapon_base
							slot11 = slot9
							slot9 = slot9.stop_autofire

							slot9(slot10)

							slot9 = ext_anim.recoil

							if slot9 then
								slot9 = self._ext_movement
								slot11 = slot9
								slot9 = slot9.play_redirect
								slot12 = "up_idle"

								slot9(slot10, slot11)
							end

							slot9 = nil
							self._autofiring = slot9
							slot9 = nil
							self._autoshots_fired = slot9
						end

						slot9 = ext_anim.recoil

						if not slot9 then
							slot9 = self._ext_anim
							slot9 = slot9.base_no_reload

							if slot9 then
								slot9 = self._weapon_unit
								slot11 = slot9
								slot9 = slot9.base
								slot9 = slot9(slot10)
								slot11 = slot9
								slot9 = slot9.on_reload

								slot9(slot10)
							else
								slot9 = CopActionReload
								slot9 = slot9._play_reload
								slot11 = self
								local res = slot9(slot10)

								if res then
									slot10 = self._machine
									slot12 = slot10
									slot10 = slot10.set_speed
									slot13 = res
									slot14 = self._reload_speed

									slot10(slot11, slot12, slot13)
								end
							end
						end
					else
						slot9 = self._autofiring

						if slot9 then
						elseif target_vec then
							slot9 = self._common_data
							slot9 = slot9.allow_fire

							if slot9 then
								slot9 = self._shoot_t

								if slot9 < t then
									slot9 = self._mod_enable_t

									if slot9 < t then

										-- Decompilation error in this vicinity:
										local shoot = nil

										if shoot then
											local melee = nil

											if autotarget then
												slot11 = self._common_data
												slot11 = slot11.melee_countered_t
											end

											if not melee then
												slot13 = self
												slot11 = self._get_shoot_falloff
												slot14 = target_dis
												slot15 = self._falloff
												local falloff, i_range = slot11(slot12, slot13, slot14)
												local firemode = nil
												slot14 = self._automatic_weap

												if slot14 then
													slot14 = math
													slot14 = slot14.random
													local random_mode = slot14()
													slot15 = ipairs
													slot17 = falloff.mode
													slot15, slot16, slot17 = slot15(slot16)

													for i_mode, mode_chance in slot15, slot16, slot17 do
														if random_mode <= mode_chance then
															firemode = i_mode

															break
														end
													end
												else
													firemode = 1
												end

												slot14 = 1

												if slot14 < firemode then
													slot17 = firemode < 4 and firemode

													self._weapon_base.start_autofire(slot15, self._weapon_base)

													slot14 = 4

													if firemode >= slot14 or not firemode then
														slot14 = math
														slot14 = slot14.random
														slot16 = self._w_usage_tweak
														slot16 = slot16.autofire_rounds
														slot16 = slot16[1]
														slot17 = self._w_usage_tweak
														slot17 = slot17.autofire_rounds
														slot17 = slot17[2]
														slot14 = slot14(slot15, slot16)
													end

													self._autofiring = slot14
													slot14 = 0
													self._autoshots_fired = slot14

													if vis_state == 1 then
														slot14 = ext_anim.base_no_recoil

														if not slot14 then
															slot14 = self._ext_movement
															slot16 = slot14
															slot14 = slot14.play_redirect
															slot17 = "recoil_auto"

															slot14(slot15, slot16)
														end
													end
												else
													local spread = self._spread

													if autotarget then
														slot15 = self._shoot_history

														if slot15 then
															slot17 = self
															slot15 = self._get_unit_shoot_pos
															slot18 = t
															slot19 = target_pos
															slot20 = target_dis
															slot21 = self._w_usage_tweak
															slot22 = falloff
															slot23 = i_range
															slot24 = autotarget
															local new_target_pos = slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)
														end

														if new_target_pos then
															target_pos = new_target_pos
														else
															slot16 = math
															slot16 = slot16.min
															slot18 = 20
															slot19 = spread
															slot16 = slot16(slot17, slot18)
															spread = slot16
														end
													end

													local spread_pos = temp_vec2
													slot16 = mvec3_rand_orth
													slot18 = spread_pos
													slot19 = target_vec

													slot16(slot17, slot18)

													slot16 = mvec3_set_l
													slot18 = spread_pos
													slot19 = spread

													slot16(slot17, slot18)

													slot16 = mvec3_add
													slot18 = spread_pos
													slot19 = target_pos

													slot16(slot17, slot18)

													slot16 = mvec3_dir
													slot18 = target_vec
													slot19 = shoot_from_pos
													slot20 = spread_pos
													slot16 = slot16(slot17, slot18, slot19)
													target_dis = slot16
													slot18 = self
													slot16 = self._get_shoot_falloff_damage
													slot19 = self._falloff
													slot20 = target_dis
													slot21 = i_range
													local damage_multiplier = slot16(slot17, slot18, slot19, slot20)
													slot17 = self._weapon_base
													slot19 = slot17
													slot17 = slot17.singleshot
													slot20 = shoot_from_pos
													slot21 = target_vec
													slot22 = damage_multiplier
													slot23 = self._shooting_player
													slot24, slot25, slot26 = nil
													slot27 = self._attention
													slot27 = slot27.unit
													local fired = slot17(slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26)

													if fired then
														slot18 = fired.hit_enemy

														if slot18 then
															slot18 = fired.hit_enemy
															slot18 = slot18.type

															if slot18 == "death" then
																slot18 = self._unit
																slot20 = slot18
																slot18 = slot18.unit_data
																slot18 = slot18(slot19)
																slot18 = slot18.mission_element

																if slot18 then
																	slot18 = self._unit
																	slot20 = slot18
																	slot18 = slot18.unit_data
																	slot18 = slot18(slot19)
																	slot18 = slot18.mission_element
																	slot20 = slot18
																	slot18 = slot18.event
																	slot21 = "killshot"
																	slot22 = self._unit

																	slot18(slot19, slot20, slot21)
																end
															end
														end
													end

													if vis_state == 1 then
														slot18 = ext_anim.base_no_recoil

														if not slot18 then
															slot18 = self._ext_movement
															slot20 = slot18
															slot18 = slot18.play_redirect
															slot21 = "recoil_single"

															slot18(slot19, slot20)
														end

														slot18 = (self._common_data.is_suppressed and 1.5) or 1
														slot22 = falloff.recoil[2]
														slot19 = math.lerp(slot20, falloff.recoil[1], math.random())
														slot18 = slot18 * slot19
														slot18 = t + slot18
														self._shoot_t = slot18
													else
														slot18 = falloff.recoil
														slot18 = slot18[2]
														slot18 = t + slot18
														self._shoot_t = slot18
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot9 = self._ext_anim
	slot9 = slot9.base_need_upd

	if slot9 then
		slot9 = self._ext_movement
		slot11 = slot9
		slot9 = slot9.upd_m_head_pos

		slot9(slot10)
	end

	return 
end

slot18.update = slot19
slot18 = CopActionShoot

function slot19(self, t)
	return 
end

slot18._upd_empty = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = "shoot"

	return slot1
end

slot18.type = slot19
slot18 = CopActionShoot

function slot19(self, target_dis, falloff)
	slot3 = ipairs
	slot5 = falloff
	slot3, slot4, slot5 = slot3(slot4)

	for i_range, range_data in slot3, slot4, slot5 do
		slot8 = range_data.r

		if target_dis < slot8 then
			slot8 = range_data
			slot9 = i_range

			return slot8, slot9
		end
	end

	slot3 = #falloff
	slot3 = falloff[slot3]
	slot4 = #falloff

	return slot3, slot4
end

slot18._get_shoot_falloff = slot19
slot18 = CopActionShoot

function slot19(self, falloff, target_dis, idx)
	if idx == 1 then
		slot4 = falloff[idx]
		slot4 = slot4.dmg_mul

		return slot4
	else
		slot4 = #falloff

		if idx == slot4 then
			slot4 = falloff[idx]
			slot4 = slot4.r
		else
			slot4 = idx - 1
			local a = falloff[slot4]
			local b = falloff[idx]
			slot6 = a.r
			slot6 = target_dis - slot6
			slot7 = b.r
			slot8 = a.r
			slot7 = slot7 - slot8
			local t = slot6 / slot7
			slot7 = math
			slot7 = slot7.lerp
			slot9 = a.dmg_mul
			slot10 = b.dmg_mul
			slot11 = t

			return slot7(slot8, slot9, slot10)
		end
	end

	return 
end

slot18._get_shoot_falloff_damage = slot19
slot18 = CopActionShoot

function slot19(self, t, pos, dis, w_tweak, falloff, i_range, shooting_local_player)
	local shoot_hist = self._shoot_history
	local focus_delay, focus_prog = nil
	slot11 = shoot_hist.focus_delay

	if slot11 then
	else
		focus_prog = 1
	end

	local dis_lerp = nil
	local hit_chances = falloff.acc
	local hit_chance = nil

	if i_range == 1 then
		slot14 = falloff.r
		dis_lerp = dis / slot14
		slot14 = math
		slot14 = slot14.lerp
		slot16 = hit_chances[1]
		slot17 = hit_chances[2]
		slot18 = focus_prog
		slot14 = slot14(slot15, slot16, slot17)
		hit_chance = slot14
	else
		slot14 = w_tweak.FALLOFF
		slot15 = i_range - 1
		local prev_falloff = slot14[slot15]
		slot15 = math
		slot15 = slot15.min
		slot17 = 1
		slot18 = prev_falloff.r
		slot18 = dis - slot18
		slot19 = falloff.r
		slot20 = prev_falloff.r
		slot19 = slot19 - slot20
		slot18 = slot18 / slot19
		slot15 = slot15(slot16, slot17)
		dis_lerp = slot15
		slot15 = math
		slot15 = slot15.lerp
		slot17 = prev_falloff.acc
		slot17 = slot17[1]
		slot18 = prev_falloff.acc
		slot18 = slot18[2]
		slot19 = focus_prog
		local prev_range_hit_chance = slot15(slot16, slot17, slot18)
		slot16 = math
		slot16 = slot16.lerp
		slot18 = prev_range_hit_chance
		slot19 = math
		slot19 = slot19.lerp
		slot21 = hit_chances[1]
		slot22 = hit_chances[2]
		slot23 = focus_prog
		slot19 = slot19(slot20, slot21, slot22)
		slot20 = dis_lerp
		slot16 = slot16(slot17, slot18, slot19)
		hit_chance = slot16
	end

	slot14 = self._common_data
	slot14 = slot14.is_suppressed

	if slot14 then
		hit_chance = hit_chance * 0.5
	end

	slot14 = self._common_data
	slot14 = slot14.active_actions
	slot14 = slot14[2]

	if slot14 then
		slot14 = self._common_data
		slot14 = slot14.active_actions
		slot14 = slot14[2]
		slot16 = slot14
		slot14 = slot14.type
		slot14 = slot14(slot15)

		if slot14 == "dodge" then
			slot14 = self._common_data
			slot14 = slot14.active_actions
			slot14 = slot14[2]
			slot16 = slot14
			slot14 = slot14.accuracy_multiplier
			slot14 = slot14(slot15)
			hit_chance = hit_chance * slot14
		end
	end

	slot14 = math
	slot14 = slot14.random
	slot14 = slot14()

	if slot14 < hit_chance then
		slot14 = mvec3_set
		slot16 = shoot_hist.m_last_pos
		slot17 = pos

		slot14(slot15, slot16)
	else

		-- Decompilation error in this vicinity:
		local enemy_vec = temp_vec2
		slot18 = pos

		mvec3_set(slot16, enemy_vec)

		slot18 = self._common_data.pos

		mvec3_sub(slot16, enemy_vec)

		local error_vec = Vector3()
		slot20 = math.UP

		mvec3_cross(enemy_vec, error_vec, enemy_vec)

		slot20 = shoot_hist.focus_error_roll

		mrot_axis_angle(enemy_vec, temp_rot1, enemy_vec)

		slot19 = temp_rot1

		mvec3_rot(enemy_vec, error_vec)

		local miss_min_dis = (shooting_local_player and 31) or 150
		slot17 = w_tweak.spread
		slot17 = miss_min_dis + slot17
		slot18 = w_tweak.miss_dis
		slot19 = 1 - focus_prog
		slot18 = slot18 * slot19
		local error_vec_len = slot17 + slot18
		slot18 = mvec3_set_l
		slot20 = error_vec
		slot21 = error_vec_len

		slot18(slot19, slot20)

		slot18 = mvec3_add
		slot20 = error_vec
		slot21 = pos

		slot18(slot19, slot20)

		slot18 = mvec3_set
		slot20 = shoot_hist.m_last_pos
		slot21 = error_vec

		slot18(slot19, slot20)

		return error_vec
	end

	return 
end

slot18._get_unit_shoot_pos = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._weapon_dropped

	if slot1 then
		return 
	end

	slot1 = self._shooting_hurt

	if slot1 then
		slot1 = stage

		if slot1 == 2 then
			slot1 = self._weapon_base
			slot3 = slot1
			slot1 = slot1.stop_autofire

			slot1(slot2)

			slot1 = self._ext_inventory
			slot3 = slot1
			slot1 = slot1.drop_weapon

			slot1(slot2)

			slot1 = true
			self._weapon_dropped = slot1
			slot1 = false
			self._shooting_hurt = slot1
		end
	else
		slot1 = self._ext_inventory

		if slot1 then
			slot1 = self._ext_inventory
			slot3 = slot1
			slot1 = slot1.drop_weapon

			slot1(slot2)

			slot1 = true
			self._weapon_dropped = slot1
		end
	end

	return 
end

slot18.on_death_drop = slot19
slot18 = CopActionShoot

function slot19(self)
	local old_action_desc = {
		block_type = "action",
		body_part = 3,
		type = "shoot"
	}

	return old_action_desc
end

slot18.get_husk_interrupt_desc = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = true

	return slot1
end

slot18.need_upd = slot19
slot18 = CopActionShoot

function slot19(self, shoot_from_pos, attention, t)

	-- Decompilation error in this vicinity:
	local transition = self._aim_transition
	slot5 = transition.start_t
	slot5 = t - slot5
	slot6 = transition.duration
	local prog = slot5 / slot6
	slot6 = 1

	if slot6 < prog then
		slot6 = nil
		self._aim_transition = slot6
		slot6 = self._get_target_pos
		self._get_target_position = slot6
		slot8 = self
		slot6 = self._get_target_position
		slot9 = shoot_from_pos
		slot10 = attention

		return slot6(slot7, slot8, slot9)
	end

	slot6 = math
	slot6 = slot6.bezier
	slot8 = bezier_curve
	slot9 = prog
	slot6 = slot6(slot7, slot8)
	prog = slot6
	local target_pos, target_vec, target_dis, autotarget = nil
	slot10 = attention.handler

	if slot10 then
		target_pos = temp_vec1
		slot10 = mvector3
		slot10 = slot10.set
		slot12 = target_pos
		slot13 = attention.handler
		slot15 = slot13
		slot13 = slot13.get_attention_m_pos

		slot10(slot11, slot13(slot14))

		slot10 = self._shooting_player

		if slot10 then
			autotarget = true
		end
	else
		slot10 = attention.unit

		if slot10 then
			slot10 = self._shooting_player

			if slot10 then
				autotarget = true
			end

			target_pos = temp_vec1
			slot10 = attention.unit
			slot12 = slot10
			slot10 = slot10.character_damage
			slot10 = slot10(slot11)
			slot12 = slot10
			slot10 = slot10.shoot_pos_mid
			slot13 = target_pos

			slot10(slot11, slot12)
		else
			target_pos = attention.pos
		end
	end

	target_vec = temp_vec3
	slot10 = mvec3_dir
	slot12 = target_vec
	slot13 = shoot_from_pos
	slot14 = target_pos
	slot10 = slot10(slot11, slot12, slot13)
	target_dis = slot10
	slot10 = mvec3_lerp
	slot12 = target_vec
	slot13 = transition.start_vec
	slot14 = target_vec
	slot15 = prog

	slot10(slot11, slot12, slot13, slot14)

	slot10 = target_pos
	slot11 = target_vec
	slot12 = target_dis
	slot13 = autotarget

	return slot10, slot11, slot12, slot13
end

slot18._get_transition_target_pos = slot19
slot18 = CopActionShoot

function slot19(self, shoot_from_pos, attention)
	local target_pos, target_vec, target_dis, autotarget = nil
	slot7 = attention.handler

	if slot7 then
		target_pos = temp_vec1
		slot7 = mvector3
		slot7 = slot7.set
		slot9 = target_pos
		slot10 = attention.handler
		slot12 = slot10
		slot10 = slot10.get_attention_m_pos

		slot7(slot8, slot10(slot11))

		slot7 = self._shooting_player

		if slot7 then
			autotarget = true
		end
	else
		slot7 = attention.unit

		if slot7 then
			slot7 = self._shooting_player

			if slot7 then
				autotarget = true
			end

			target_pos = temp_vec1
			slot7 = attention.unit
			slot9 = slot7
			slot7 = slot7.character_damage
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.shoot_pos_mid
			slot10 = target_pos

			slot7(slot8, slot9)
		else
			target_pos = attention.pos
		end
	end

	target_vec = temp_vec3
	slot7 = mvec3_dir
	slot9 = target_vec
	slot10 = shoot_from_pos
	slot11 = target_pos
	slot7 = slot7(slot8, slot9, slot10)
	target_dis = slot7
	slot7 = target_pos
	slot8 = target_vec
	slot9 = target_dis
	slot10 = autotarget

	return slot7, slot8, slot9, slot10
end

slot18._get_target_pos = slot19
slot18 = CopActionShoot

function slot19(self, preset_name)
	slot2 = self._ik_preset
	slot2 = slot2.stop
	slot2 = self[slot2]
	slot4 = self

	slot2(slot3)

	slot2 = self._ik_presets
	local preset_data = slot2[preset_name]
	self._ik_preset = preset_data
	slot3 = preset_data.start
	slot3 = self[slot3]
	slot5 = self

	slot3(slot4)

	return 
end

slot18.set_ik_preset = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._modifier

	if slot1 then
		return 
	end

	slot1 = Idstring
	slot3 = "action_upper_body_enemy"
	slot1 = slot1(slot2)
	self._modifier_name = slot1
	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.get_modifier
	slot4 = self._modifier_name
	slot1 = slot1(slot2, slot3)
	self._modifier = slot1
	slot3 = self
	slot1 = self._set_ik_updator
	slot4 = "_upd_ik_spine"

	slot1(slot2, slot3)

	slot1 = nil
	self._modifier_on = slot1
	slot1 = nil
	self._mod_enable_t = slot1

	return 
end

slot18._begin_ik_spine = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._modifier

	if not slot1 then
		return 
	end

	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.allow_modifier
	slot4 = self._modifier_name

	slot1(slot2, slot3)

	slot1 = nil
	self._modifier_name = slot1
	slot1 = nil
	self._modifier = slot1
	slot1 = nil
	self._modifier_on = slot1

	return 
end

slot18._stop_ik_spine = slot19
slot18 = CopActionShoot

function slot19(self, target_vec, fwd_dot, t)
	slot4 = 0.5

	if slot4 < fwd_dot then
		slot4 = self._modifier_on

		if not slot4 then
			slot4 = true
			self._modifier_on = slot4
			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.force_modifier
			slot7 = self._modifier_name

			slot4(slot5, slot6)

			slot4 = t + 0.5
			self._mod_enable_t = slot4
		end

		slot4 = self._modifier
		slot6 = slot4
		slot4 = slot4.set_target_y
		slot7 = target_vec

		slot4(slot5, slot6)

		slot4 = mvec3_set
		slot6 = self._common_data
		slot6 = slot6.look_vec
		slot7 = target_vec

		slot4(slot5, slot6)

		return target_vec
	else
		slot4 = self._modifier_on

		if slot4 then
			slot4 = nil
			self._modifier_on = slot4
			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.allow_modifier
			slot7 = self._modifier_name

			slot4(slot5, slot6)
		end

		slot4 = nil

		return slot4
	end

	return 
end

slot18._upd_ik_spine = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._modifier
	slot3 = slot1
	slot1 = slot1.blend

	return slot1(slot2)
end

slot18._get_blend_ik_spine = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._head_modifier

	if slot1 then
		return 
	end

	slot1 = Idstring
	slot3 = "look_head"
	slot1 = slot1(slot2)
	self._head_modifier_name = slot1
	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.get_modifier
	slot4 = self._head_modifier_name
	slot1 = slot1(slot2, slot3)
	self._head_modifier = slot1
	slot1 = Idstring
	slot3 = "aim_r_arm"
	slot1 = slot1(slot2)
	self._r_arm_modifier_name = slot1
	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.get_modifier
	slot4 = self._r_arm_modifier_name
	slot1 = slot1(slot2, slot3)
	self._r_arm_modifier = slot1
	slot1 = nil
	self._modifier_on = slot1
	slot1 = false
	self._mod_enable_t = slot1
	slot3 = self
	slot1 = self._set_ik_updator
	slot4 = "_upd_ik_r_arm"

	slot1(slot2, slot3)

	return 
end

slot18._begin_ik_r_arm = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._head_modifier

	if not slot1 then
		return 
	end

	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.allow_modifier
	slot4 = self._head_modifier_name

	slot1(slot2, slot3)

	slot1 = self._machine
	slot3 = slot1
	slot1 = slot1.allow_modifier
	slot4 = self._r_arm_modifier_name

	slot1(slot2, slot3)

	slot1 = nil
	self._head_modifier_name = slot1
	slot1 = nil
	self._head_modifier = slot1
	slot1 = nil
	self._r_arm_modifier_name = slot1
	slot1 = nil
	self._r_arm_modifier = slot1
	slot1 = nil
	self._modifier_on = slot1

	return 
end

slot18._stop_ik_r_arm = slot19
slot18 = CopActionShoot

function slot19(self, target_vec, fwd_dot, t)
	slot4 = 0.01

	if slot4 < fwd_dot then
		slot4 = self._modifier_on

		if not slot4 then
			slot4 = true
			self._modifier_on = slot4
			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.force_modifier
			slot7 = self._head_modifier_name

			slot4(slot5, slot6)

			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.force_modifier
			slot7 = self._r_arm_modifier_name

			slot4(slot5, slot6)

			slot4 = t + 0.5
			self._mod_enable_t = slot4
		end

		slot4 = self._head_modifier
		slot6 = slot4
		slot4 = slot4.set_target_z
		slot7 = target_vec

		slot4(slot5, slot6)

		slot4 = self._r_arm_modifier
		slot6 = slot4
		slot4 = slot4.set_target_y
		slot7 = target_vec

		slot4(slot5, slot6)

		slot4 = mvec3_set
		slot6 = self._common_data
		slot6 = slot6.look_vec
		slot7 = target_vec

		slot4(slot5, slot6)

		return target_vec
	else
		slot4 = self._modifier_on

		if slot4 then
			slot4 = nil
			self._modifier_on = slot4
			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.allow_modifier
			slot7 = self._head_modifier_name

			slot4(slot5, slot6)

			slot4 = self._machine
			slot6 = slot4
			slot4 = slot4.allow_modifier
			slot7 = self._r_arm_modifier_name

			slot4(slot5, slot6)
		end

		slot4 = nil

		return slot4
	end

	return 
end

slot18._upd_ik_r_arm = slot19
slot18 = CopActionShoot

function slot19(self)
	slot1 = self._r_arm_modifier
	slot3 = slot1
	slot1 = slot1.blend

	return slot1(slot2)
end

slot18._get_blend_ik_r_arm = slot19
slot18 = CopActionShoot

function slot19(self, name)
	slot2 = self[name]
	self._upd_ik = slot2

	return 
end

slot18._set_ik_updator = slot19
slot18 = CopActionShoot

function slot19(self, target_vec, target_dis, autotarget, target_pos)

	-- Decompilation error in this vicinity:
	slot7 = self._unit
	slot7 = self._unit.base(slot6)
	local melee_weapon = self._unit.base(slot6).melee_weapon(slot6)
	local is_weapon = melee_weapon == "weapon"
	slot10 = (is_weapon and "melee") or "melee_item"
	local state = self._ext_movement.play_redirect(slot8, self._ext_movement)
end

slot18._chk_start_melee = slot19
slot18 = CopActionShoot

function slot19(self)

	-- Decompilation error in this vicinity:
	slot1 = self._attention

	if not slot1 then
		return 
	end

	local shoot_from_pos = self._shoot_from_pos
	local ext_anim = self._ext_anim
	local max_dix = 165
	slot6 = self
	slot4 = self._get_target_pos
	slot7 = shoot_from_pos
	slot8 = self._attention
	slot9 = TimerManager
	slot11 = slot9
	slot9 = slot9.game
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.time
	local target_pos, target_vec, target_dis, autotarget = slot4(slot5, slot6, slot7, slot9(slot10))

	if not autotarget or target_dis >= max_dix then
		return 
	end

	slot8 = math
	slot8 = slot8.lerp
	slot10 = 0
	slot11 = 0.4
	slot12 = target_dis / max_dix
	local min_dot = slot8(slot9, slot10, slot11)
	local tar_vec_flat = temp_vec2
	slot10 = mvec3_set
	slot12 = tar_vec_flat
	slot13 = target_vec

	slot10(slot11, slot12)

	slot10 = mvec3_set_z
	slot12 = tar_vec_flat
	slot13 = 0

	slot10(slot11, slot12)

	slot10 = mvec3_norm
	slot12 = tar_vec_flat

	slot10(slot11)

	slot10 = self._common_data
	local fwd = slot10.fwd
	slot11 = mvec3_dot
	slot13 = fwd
	slot14 = tar_vec_flat
	local fwd_dot = slot11(slot12, slot13)

	if fwd_dot < min_dot then
		return 
	end

	slot15 = 0.1
	local push_vel = target_vec.with_z(slot13, target_vec).normalized(slot13) * 600
	slot15 = self._unit
	slot15 = self._unit.base(target_vec.with_z(slot13, target_vec))
	local melee_weapon = self._unit.base(target_vec.with_z(slot13, target_vec)).melee_weapon(target_vec.with_z(slot13, target_vec))
	local is_weapon = melee_weapon == "weapon"

	if is_weapon then
		slot16 = 1
	else
		local damage = damage * (self._common_data.char_tweak.melee_weapon_dmg_multiplier or 1)
		local action_data = {
			variant = "melee",
			damage = damage,
			weapon_unit = self._weapon_unit,
			attacker_unit = self._common_data.unit,
			melee_weapon = melee_weapon,
			push_vel = push_vel
		}
		slot20 = target_vec
		slot18 = mvector3.copy(slot19)
		action_data.col_ray = {
			position = shoot_from_pos + fwd * 50,
			ray = slot18
		}
		slot19 = self._attention.unit
		slot20 = action_data
		local defense_data = self._attention.unit.character_damage(slot18).damage_melee(slot18, self._attention.unit.character_damage(slot18))
	end

	if defense_data == "countered" then
		slot18 = self._common_data
		slot19 = TimerManager
		slot21 = slot19
		slot19 = slot19.game
		slot19 = slot19(slot20)
		slot21 = slot19
		slot19 = slot19.time
		slot19 = slot19(slot20)
		slot18.melee_countered_t = slot19
		local action_data = {
			damage_effect = 1,
			damage = 0,
			variant = "counter_spooc"
		}
		slot19 = self._strike_unit
		action_data.attacker_unit = slot19
		slot19 = {}
		slot20 = self._unit
		slot22 = slot20
		slot20 = slot20.body
		slot23 = "body"
		slot20 = slot20(slot21, slot22)
		slot19.body = slot20
		slot20 = self._common_data
		slot20 = slot20.pos
		slot21 = math
		slot21 = slot21.UP
		slot21 = slot21 * 100
		slot20 = slot20 + slot21
		slot19.position = slot20
		action_data.col_ray = slot19
		slot21 = target_vec
		slot19 = target_vec.normalized
		slot19 = slot19(slot20)
		slot19 = -1 * slot19
		action_data.attack_dir = slot19
		slot19 = self._unit
		slot21 = slot19
		slot19 = slot19.character_damage
		slot19 = slot19(slot20)
		slot21 = slot19
		slot19 = slot19.damage_melee
		slot22 = action_data

		slot19(slot20, slot21)

		return 
	end

	return 
end

slot18.anim_clbk_melee_strike = slot19

return 
