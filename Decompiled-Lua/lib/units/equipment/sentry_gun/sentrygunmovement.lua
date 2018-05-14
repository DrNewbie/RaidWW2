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
slot0 = mvector3
local mvec3_dir = slot0.direction
slot1 = Rotation
local tmp_rot1 = slot1()
slot2 = Vector3
local tmp_vec1 = slot2()
slot3 = Vector3
local tmp_vec2 = slot3()
slot4 = SentryGunMovement

if not slot4 then
	slot4 = class
	slot4 = slot4()
end

SentryGunMovement = slot4
slot4 = SentryGunMovement
slot5 = PlayerMovement
slot5 = slot5.set_friendly_fire
slot4.set_friendly_fire = slot5
slot4 = SentryGunMovement
slot5 = PlayerMovement
slot5 = slot5.friendly_fire
slot4.friendly_fire = slot5
slot4 = SentryGunMovement

function slot5(self, unit)
	self._unit = unit
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = Idstring
	slot7 = "a_detect"
	slot2 = slot2(slot3, slot5(slot6))
	self._head_obj = slot2
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = Idstring
	slot7 = self._spin_obj_name
	slot2 = slot2(slot3, slot5(slot6))
	self._spin_obj = slot2
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = Idstring
	slot7 = self._pitch_obj_name
	slot2 = slot2(slot3, slot5(slot6))
	self._pitch_obj = slot2
	slot4 = unit
	slot2 = unit.rotation
	slot2 = slot2(slot3)
	self._m_rot = slot2
	slot2 = self._m_rot
	slot4 = slot2
	slot2 = slot2.y
	slot2 = slot2(slot3)
	self._m_head_fwd = slot2
	slot2 = self._m_rot
	slot4 = slot2
	slot2 = slot2.z
	slot2 = slot2(slot3)
	self._unit_up = slot2
	slot2 = self._m_rot
	slot4 = slot2
	slot2 = slot2.y
	slot2 = slot2(slot3)
	self._unit_fwd = slot2
	slot2 = self._head_obj
	slot4 = slot2
	slot2 = slot2.position
	slot2 = slot2(slot3)
	self._m_head_pos = slot2
	slot2 = {
		pitch = 0,
		spin = 0
	}
	self._vel = slot2
	slot2 = managers
	slot2 = slot2.navigation
	slot4 = slot2
	slot2 = slot2.is_data_ready
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = managers
		slot2 = slot2.navigation
		slot4 = slot2
		slot2 = slot2.get_pos_reservation_id
		slot2 = slot2(slot3)
		self._pos_rsrv_id = slot2
		slot2 = managers
		slot2 = slot2.navigation
		slot4 = slot2
		slot2 = slot2.create_nav_tracker
		slot5 = self._unit
		slot7 = slot5
		slot5 = slot5.position
		slot2 = slot2(slot3, slot5(slot6))
		self._nav_tracker = slot2
		slot2 = {
			radius = 30
		}
		slot3 = self._unit
		slot5 = slot3
		slot3 = slot3.position
		slot3 = slot3(slot4)
		slot2.position = slot3
		slot3 = self._pos_rsrv_id
		slot2.filter = slot3
		self._pos_reservation = slot2
		slot2 = managers
		slot2 = slot2.navigation
		slot4 = slot2
		slot2 = slot2.add_pos_reservation
		slot5 = self._pos_reservation

		slot2(slot3, slot4)
	else
		slot2 = Application
		slot4 = slot2
		slot2 = slot2.error
		slot5 = "[SentryGunBase:setup] Spawned Sentry gun unit with incomplete navigation data."

		slot2(slot3, slot4)
	end

	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.sound_source
	slot2 = slot2(slot3)
	self._sound_source = slot2
	slot2 = 0
	self._last_attention_t = slot2
	slot2 = 0
	self._warmup_t = slot2
	slot2 = 1
	self._rot_speed_mul = slot2
	slot2 = callback
	slot4 = self
	slot5 = self
	slot6 = "_update_inactive"
	slot2 = slot2(slot3, slot4, slot5)
	self._updator = slot2

	return 
end

slot4.init = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.network
	slot1 = slot1(slot2)
	self._ext_network = slot1
	slot1 = tweak_data
	slot1 = slot1.weapon
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.base
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.get_name_id
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]
	self._tweak = slot1
	slot1 = self._tweak
	slot1 = slot1.VELOCITY_COMPENSATION

	if slot1 then
		slot1 = Vector3
		slot1 = slot1()
		self._m_last_attention_pos = slot1
		slot1 = Vector3
		slot1 = slot1()
		self._m_last_attention_vel = slot1
	end

	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.base
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.get_name_id
	local name = slot1(slot2)
	slot2 = tweak_data
	slot2 = slot2.weapon
	slot2 = slot2[name]
	slot2 = slot2.MAX_TARGETING_SPIN
	self._spin_max = slot2
	slot2 = tweak_data
	slot2 = slot2.weapon
	slot2 = slot2[name]
	slot2 = slot2.MAX_TARGETING_PITCH
	self._pitch_max = slot2
	slot4 = self
	slot2 = self.set_team
	slot5 = managers
	slot5 = slot5.groupai
	slot7 = slot5
	slot5 = slot5.state
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.team_data
	slot8 = tweak_data
	slot8 = slot8.levels
	slot10 = slot8
	slot8 = slot8.get_default_team_ID
	slot11 = "player"

	slot2(slot3, slot5(slot6, slot8(slot9, slot10)))

	return 
end

slot4.post_init = slot5
slot4 = SentryGunMovement

function slot5(self, unit, t, dt)
	slot4 = SentryGunMovement
	slot5 = self._updator
	slot4.updator = slot5
	slot4 = self._updator
	slot6 = t
	slot7 = dt

	slot4(slot5, slot6)

	return 
end

slot4.update = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	return 
end

slot4._update_inactive = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot5 = self
	slot3 = self._upd_hacking
	slot6 = t
	slot7 = dt

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self._upd_mutables

	slot3(slot4)

	slot3 = self._warmup_t

	if slot3 < t then
		slot5 = self
		slot3 = self._upd_movement
		slot6 = dt

		slot3(slot4, slot5)
	end

	return 
end

slot4._update_active = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot5 = self
	slot3 = self._upd_mutables

	slot3(slot4)

	slot3 = self._unit
	slot5 = slot3
	slot3 = slot3.anim_is_playing
	slot6 = self._activation_anim_group_name_ids
	slot3 = slot3(slot4, slot5)

	if not slot3 then
		slot3 = false
		self._activating = slot3
		slot3 = true
		self._activated = slot3
		slot3 = false
		self._inactivated = slot3
		slot3 = self._rearming

		if slot3 then
			slot3 = callback
			slot5 = self
			slot6 = self
			slot7 = "_update_rearming"
			slot3 = slot3(slot4, slot5, slot6)
			self._updator = slot3
		else
			slot3 = callback
			slot5 = self
			slot6 = self
			slot7 = "_update_active"
			slot3 = slot3(slot4, slot5, slot6)
			self._updator = slot3
		end

		slot3 = self._unit
		slot5 = slot3
		slot3 = slot3.weapon
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.update_laser

		slot3(slot4)

		slot3 = managers
		slot3 = slot3.game_play_central
		slot5 = slot3
		slot3 = slot3.flashlights_on
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = self._lights_on_sequence_name

			if slot3 then
				slot3 = self._unit
				slot5 = slot3
				slot3 = slot3.damage
				slot3 = slot3(slot4)
				slot5 = slot3
				slot3 = slot3.run_sequence_simple
				slot6 = self._lights_on_sequence_name

				slot3(slot4, slot5)
			end
		end

		slot3 = self._unit
		slot5 = slot3
		slot3 = slot3.character_damage
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.shield_smoke_level
		slot3 = slot3(slot4)
		slot4 = 0

		if slot4 < slot3 then
			slot3 = self._shield_sparks_enable

			if slot3 then
				slot3 = self._unit
				slot5 = slot3
				slot3 = slot3.damage
				slot3 = slot3(slot4)
				slot5 = slot3
				slot3 = slot3.run_sequence_simple
				slot6 = self._shield_sparks_enable

				slot3(slot4, slot5)
			end
		end
	end

	return 
end

slot4._update_activating = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot5 = self
	slot3 = self._upd_mutables

	slot3(slot4)

	slot3 = self._unit
	slot5 = slot3
	slot3 = slot3.anim_is_playing
	slot6 = self._activation_anim_group_name_ids
	slot3 = slot3(slot4, slot5)

	if not slot3 then
		slot3 = false
		self._inactivating = slot3
		slot3 = true
		self._inactivated = slot3
		slot3 = callback
		slot5 = self
		slot6 = self
		slot7 = "_update_inactive"
		slot3 = slot3(slot4, slot5, slot6)
		self._updator = slot3
		slot3 = self._unit
		slot5 = slot3
		slot3 = slot3.weapon
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.update_laser

		slot3(slot4)
	end

	return 
end

slot4._update_inactivating = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot3 = self._rearm_complete_t

	if slot3 then
		slot3 = self._rearm_complete_t

		if slot3 < t then
			slot5 = self
			slot3 = self.complete_rearming

			slot3(slot4)
		end
	end

	return 
end

slot4._update_rearming = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.weapon
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.set_ammo
	slot4 = self._tweak
	slot4 = slot4.CLIP_SIZE

	slot1(slot2, slot3)

	slot1 = self._rearm_complete_snd_event

	if slot1 then
		slot1 = self._sound_source
		slot3 = slot1
		slot1 = slot1.post_event
		slot4 = "tiger_npc_canon_reload"

		slot1(slot2, slot3)

		slot1 = nil
		self._rearm_event = slot1
	end

	slot1 = false
	self._rearming = slot1
	slot1 = callback
	slot3 = self
	slot4 = self
	slot5 = "_update_active"
	slot1 = slot1(slot2, slot3, slot4)
	self._updator = slot1

	return 
end

slot4.complete_rearming = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot3 = self._repair_complete_t
	slot3 = slot3 - t
	slot4 = self._tweak
	slot4 = slot4.AUTO_REPAIR_DURATION
	slot3 = slot3 / slot4
	local repair_complete_ratio = 1 - slot3
	slot4 = self._unit
	slot6 = slot4
	slot4 = slot4.character_damage
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.update_shield_smoke_level
	slot7 = repair_complete_ratio
	slot8 = true

	slot4(slot5, slot6, slot7)

	slot4 = self._repair_complete_t

	if slot4 then
		slot4 = self._repair_complete_t

		if slot4 < t then
			slot6 = self
			slot4 = self.complete_repairing

			slot4(slot5)
		end
	end

	return 
end

slot4._update_repairing = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = Network
	slot3 = slot1
	slot1 = slot1.is_server
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.character_damage
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.repair_shield

		slot1(slot2)
	end

	slot1 = self._repair_complete_seq

	if slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.damage
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.run_sequence_simple
		slot4 = self._repair_complete_seq

		slot1(slot2, slot3)
	end

	slot1 = false
	self._repairing = slot1
	slot1 = callback
	slot3 = self
	slot4 = self
	slot5 = "_update_active"
	slot1 = slot1(slot2, slot3, slot4)
	self._updator = slot1

	return 
end

slot4.complete_repairing = slot5
slot4 = SentryGunMovement

function slot5(self, rot_speed_multiplier)
	self._rot_speed_mul = rot_speed_multiplier
	slot2 = true
	self._activated = slot2
	slot2 = callback
	slot4 = self
	slot5 = self
	slot6 = "_update_active"
	slot2 = slot2(slot3, slot4, slot5)
	self._updator = slot2

	return 
end

slot4.setup = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = tweak_data
	slot1 = slot1.weapon
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.base
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.get_name_id
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]
	self._tweak = slot1
	slot1 = self._tweak
	slot1 = slot1.VELOCITY_COMPENSATION

	if slot1 then
		slot1 = self._m_last_attention_pos

		if not slot1 then
			slot1 = Vector3
			slot1 = slot1()
			self._m_last_attention_pos = slot1
			slot1 = Vector3
			slot1 = slot1()
			self._m_last_attention_vel = slot1
		end
	end

	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.damage
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.damage
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.has_sequence
		slot4 = "activate"
		slot1 = slot1(slot2, slot3)

		if slot1 then
			slot1 = self._activation_anim_group_name

			if slot1 then
				slot1 = Idstring
				slot3 = self._activation_anim_group_name
				slot1 = slot1(slot2)
				self._activation_anim_group_name_ids = slot1
				slot1 = self._unit
				slot3 = slot1
				slot1 = slot1.damage
				slot1 = slot1(slot2)
				slot3 = slot1
				slot1 = slot1.run_sequence_simple
				slot4 = "activate"

				slot1(slot2, slot3)

				slot1 = true
				self._activating = slot1
				slot1 = callback
				slot3 = self
				slot4 = self
				slot5 = "_update_activating"
				slot1 = slot1(slot2, slot3, slot4)
				self._updator = slot1
			end
		end
	end

	return 
end

slot4.on_activated = slot5
slot4 = SentryGunMovement

function slot5(self, state)
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.set_extension_update_enabled
	slot5 = Idstring
	slot7 = "movement"
	slot5 = slot5(slot6)
	slot6 = state

	slot2(slot3, slot4, slot5)

	if not state then
		slot2 = self._motor_sound

		if slot2 then
			slot2 = self._motor_sound
			slot4 = slot2
			slot2 = slot2.stop

			slot2(slot3)

			slot2 = false
			self._motor_sound = slot2
		end

		slot2 = self._rearm_event

		if slot2 then
			slot2 = self._rearm_event
			slot4 = slot2
			slot2 = slot2.stop

			slot2(slot3)

			slot2 = false
			self._rearm_event = slot2
		end
	end

	return 
end

slot4.set_active = slot5
slot4 = SentryGunMovement

function slot5(self, state)
	if not state then
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.damage
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.damage
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.has_sequence
			slot5 = "deactivate"
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot2 = self._activation_anim_group_name

				if slot2 then
					slot2 = Idstring
					slot4 = self._activation_anim_group_name
					slot2 = slot2(slot3)
					self._activation_anim_group_name_ids = slot2
					slot2 = self._unit
					slot4 = slot2
					slot2 = slot2.damage
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.run_sequence_simple
					slot5 = "deactivate"

					slot2(slot3, slot4)

					slot2 = true
					self._inactivating = slot2
					slot2 = callback
					slot4 = self
					slot5 = self
					slot6 = "_update_inactivating"
					slot2 = slot2(slot3, slot4, slot5)
					self._updator = slot2
				end
			end
		end
	else
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.damage
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.damage
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.has_sequence
			slot5 = "activate"
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot2 = self._activation_anim_group_name

				if slot2 then
					slot2 = Idstring
					slot4 = self._activation_anim_group_name
					slot2 = slot2(slot3)
					self._activation_anim_group_name_ids = slot2
					slot2 = self._unit
					slot4 = slot2
					slot2 = slot2.damage
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.run_sequence_simple
					slot5 = "activate"

					slot2(slot3, slot4)

					slot2 = true
					self._activating = slot2
					slot2 = callback
					slot4 = self
					slot5 = self
					slot6 = "_update_activating"
					slot2 = slot2(slot3, slot4, slot5)
					self._updator = slot2
				end
			end
		end
	end

	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.weapon
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.update_laser

	slot2(slot3)

	return 
end

slot4.set_idle = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = alive
	slot3 = self._nav_tracker
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = managers
		slot1 = slot1.navigation
		slot3 = slot1
		slot1 = slot1.create_nav_tracker
		slot4 = self._unit
		slot6 = slot4
		slot4 = slot4.position
		slot1 = slot1(slot2, slot4(slot5))
		self._nav_tracker = slot1
		slot1 = {
			radius = 30
		}
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.position
		slot2 = slot2(slot3)
		slot1.position = slot2
		self._pos_reservation = slot1
		slot1 = managers
		slot1 = slot1.navigation
		slot3 = slot1
		slot1 = slot1.add_pos_reservation
		slot4 = self._pos_reservation

		slot1(slot2, slot3)
	end

	slot1 = self._nav_tracker

	return slot1
end

slot4.nav_tracker = slot5
slot4 = SentryGunMovement

function slot5(self, attention)
	if not attention then
		slot2 = self._attention

		if not slot2 then
			return 
		end
	end

	if attention then
		slot2 = self._attention

		if slot2 then
			local different = nil
			slot3 = pairs
			slot5 = self._attention
			slot3, slot4, slot5 = slot3(slot4)

			for i, k in slot3, slot4, slot5 do
				slot8 = attention[i]

				if slot8 ~= k then
					different = true

					break
				end
			end

			if not different then
				slot3 = pairs
				slot5 = attention
				slot3, slot4, slot5 = slot3(slot4)

				for i, k in slot3, slot4, slot5 do
					slot8 = self._attention
					slot8 = slot8[i]

					if slot8 ~= k then
						different = true

						break
					end
				end
			end

			if not different then
				return 
			end
		end
	end

	slot2 = CopMovement
	slot2 = slot2._remove_attention_destroy_listener
	slot4 = self
	slot5 = self._attention

	slot2(slot3, slot4)

	if attention then
		slot2 = attention.unit

		if slot2 then
			slot2 = attention.handler

			if slot2 then
				slot2 = self._m_last_attention_pos

				if slot2 then
					slot2 = mvector3
					slot2 = slot2.set
					slot4 = self._m_last_attention_pos
					slot5 = attention.handler
					slot7 = slot5
					slot5 = slot5.get_attention_m_pos

					slot2(slot3, slot5(slot6))

					slot2 = mvector3
					slot2 = slot2.set_zero
					slot4 = self._m_last_attention_vel

					slot2(slot3)

					slot2 = TimerManager
					slot4 = slot2
					slot2 = slot2.game
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.time
					slot2 = slot2(slot3)
					slot2 = slot2 - 0.1
					self._last_attention_snapshot_t = slot2
				end

				slot2 = attention.handler
				slot4 = slot2
				slot2 = slot2.unit
				local attention_unit = slot2(slot3)
				slot5 = attention_unit
				slot3 = attention_unit.id
				slot3 = slot3(slot4)

				if slot3 ~= -1 then
					slot3 = self._ext_network
					slot5 = slot3
					slot3 = slot3.send
					slot6 = "set_attention"
					slot7 = attention_unit
					slot8 = attention.reaction

					slot3(slot4, slot5, slot6, slot7)
				else
					slot3 = self._ext_network
					slot5 = slot3
					slot3 = slot3.send
					slot6 = "cop_set_attention_pos"
					slot7 = mvector3
					slot7 = slot7.copy
					slot9 = attention.handler
					slot11 = slot9
					slot9 = slot9.get_attention_m_pos

					slot3(slot4, slot5, slot7(slot9(slot10)))
				end
			else
				local attention_unit = attention.unit
				slot3 = self._m_last_attention_pos

				if slot3 then
					slot5 = attention_unit
					slot3 = attention_unit.character_damage
					slot3 = slot3(slot4)
					slot5 = slot3
					slot3 = slot3.shoot_pos_mid
					slot6 = self._m_last_attention_pos

					slot3(slot4, slot5)

					slot3 = mvector3
					slot3 = slot3.set_zero
					slot5 = self._m_last_attention_vel

					slot3(slot4)

					slot3 = TimerManager
					slot5 = slot3
					slot3 = slot3.game
					slot3 = slot3(slot4)
					slot5 = slot3
					slot3 = slot3.time
					slot3 = slot3(slot4)
					slot3 = slot3 - 0.1
					self._last_attention_snapshot_t = slot3
				end

				slot5 = attention_unit
				slot3 = attention_unit.id
				slot3 = slot3(slot4)

				if slot3 ~= -1 then
					slot3 = self._ext_network
					slot5 = slot3
					slot3 = slot3.send
					slot6 = "set_attention"
					slot7 = attention_unit
					slot8 = AIAttentionObject
					slot8 = slot8.REACT_IDLE

					slot3(slot4, slot5, slot6, slot7)
				end
			end

			slot2 = CopMovement
			slot2 = slot2._add_attention_destroy_listener
			slot4 = self
			slot5 = attention

			slot2(slot3, slot4)
		else
			slot2 = self._ext_network
			slot4 = slot2
			slot2 = slot2.send
			slot5 = "cop_set_attention_pos"
			slot6 = attention.pos

			slot2(slot3, slot4, slot5)
		end
	else
		slot2 = self._attention

		if slot2 then
			slot2 = alive
			slot4 = self._unit
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = self._unit
				slot4 = slot2
				slot2 = slot2.id
				slot2 = slot2(slot3)

				if slot2 ~= -1 then
					slot2 = self._ext_network
					slot4 = slot2
					slot2 = slot2.send
					slot5 = "set_attention"
					slot6 = nil
					slot7 = AIAttentionObject
					slot7 = slot7.REACT_IDLE

					slot2(slot3, slot4, slot5, slot6)
				end
			end
		end
	end

	self._attention = attention
	slot4 = self
	slot2 = self.chk_play_alert
	slot5 = attention
	slot6 = self._attention

	slot2(slot3, slot4, slot5)

	return 
end

slot4.set_attention = slot5
slot4 = SentryGunMovement

function slot5(self, attention)
	slot2 = CopMovement
	slot2 = slot2._remove_attention_destroy_listener
	slot4 = self
	slot5 = self._attention

	slot2(slot3, slot4)

	slot2 = CopMovement
	slot2 = slot2._add_attention_destroy_listener
	slot4 = self
	slot5 = attention

	slot2(slot3, slot4)

	if attention then
		slot2 = attention.unit

		if slot2 then
			slot2 = attention.destroy_listener_key

			if not slot2 then
				slot2 = debug_pause_unit
				slot4 = attention.unit
				slot5 = "[SentryGunMovement:synch_attention] problematic attention unit"
				slot6 = attention.unit

				slot2(slot3, slot4, slot5)

				slot4 = self
				slot2 = self.synch_attention
				slot5 = nil

				slot2(slot3, slot4)

				return 
			end
		end
	end

	if attention then
		slot2 = attention.unit

		if slot2 then
			slot2 = attention.handler

			if slot2 then
				slot2 = self._m_last_attention_pos

				if slot2 then
					slot2 = mvector3
					slot2 = slot2.set
					slot4 = self._m_last_attention_pos
					slot5 = attention.handler
					slot7 = slot5
					slot5 = slot5.get_attention_m_pos

					slot2(slot3, slot5(slot6))

					slot2 = mvector3
					slot2 = slot2.set_zero
					slot4 = self._m_last_attention_vel

					slot2(slot3)

					slot2 = TimerManager
					slot4 = slot2
					slot2 = slot2.game
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.time
					slot2 = slot2(slot3)
					slot2 = slot2 - 0.1
					self._last_attention_snapshot_t = slot2
				end
			else
				local attention_unit = attention.unit
				slot3 = self._m_last_attention_pos

				if slot3 then
					slot5 = attention_unit
					slot3 = attention_unit.character_damage
					slot3 = slot3(slot4)
					slot5 = slot3
					slot3 = slot3.shoot_pos_mid
					slot6 = self._m_last_attention_pos

					slot3(slot4, slot5)

					slot3 = mvector3
					slot3 = slot3.set_zero
					slot5 = self._m_last_attention_vel

					slot3(slot4)

					slot3 = TimerManager
					slot5 = slot3
					slot3 = slot3.game
					slot3 = slot3(slot4)
					slot5 = slot3
					slot3 = slot3.time
					slot3 = slot3(slot4)
					slot3 = slot3 - 0.1
					self._last_attention_snapshot_t = slot3
				end
			end
		end
	end

	self._attention = attention
	slot4 = self
	slot2 = self.chk_play_alert
	slot5 = attention
	slot6 = self._attention

	slot2(slot3, slot4, slot5)

	return 
end

slot4.synch_attention = slot5
slot4 = SentryGunMovement

function slot5(self, attention, old_attention)
	if not attention and old_attention then
		slot3 = TimerManager
		slot5 = slot3
		slot3 = slot3.game
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.time
		slot3 = slot3(slot4)
		self._last_attention_t = slot3
	end

	if attention and not old_attention then
		slot3 = TimerManager
		slot5 = slot3
		slot3 = slot3.game
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.time
		slot3 = slot3(slot4)
		slot4 = self._last_attention_t
		slot3 = slot3 - slot4
		slot4 = 3

		if slot4 < slot3 then
			slot3 = self._sound_source
			slot5 = slot3
			slot3 = slot3.post_event
			slot6 = "tank_tracks_npc_stop_R"

			slot3(slot4, slot5)

			slot3 = TimerManager
			slot5 = slot3
			slot3 = slot3.game
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.time
			slot3 = slot3(slot4)
			slot3 = slot3 + 0.5
			self._warmup_t = slot3
		end
	end

	return 
end

slot4.chk_play_alert = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._attention

	return slot1
end

slot4.attention = slot5
slot4 = SentryGunMovement

function slot5(self, unit)
	slot2 = Network
	slot4 = slot2
	slot2 = slot2.is_server
	slot2 = slot2(slot3)

	if slot2 then
		slot4 = self
		slot2 = self.set_attention

		slot2(slot3)
	else
		slot4 = self
		slot2 = self.synch_attention

		slot2(slot3)
	end

	return 
end

slot4.attention_unit_destroy_clbk = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._head_obj
	slot3 = slot1
	slot1 = slot1.m_position
	slot4 = self._m_head_pos

	slot1(slot2, slot3)

	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.m_rotation
	slot4 = self._m_rot

	slot1(slot2, slot3)

	slot1 = self._head_obj
	slot3 = slot1
	slot1 = slot1.m_rotation
	slot4 = tmp_rot1

	slot1(slot2, slot3)

	slot1 = mrotation
	slot1 = slot1.y
	slot3 = tmp_rot1
	slot4 = self._m_head_fwd

	slot1(slot2, slot3)

	slot1 = mrotation
	slot1 = slot1.y
	slot3 = self._m_rot
	slot4 = self._unit_fwd

	slot1(slot2, slot3)

	slot1 = mrotation
	slot1 = slot1.z
	slot3 = self._m_rot
	slot4 = self._unit_up

	slot1(slot2, slot3)

	return 
end

slot4._upd_mutables = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_pos

	return slot1
end

slot4.m_head_pos = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_pos

	return slot1
end

slot4.m_com = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_pos

	return slot1
end

slot4.m_pos = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_pos

	return slot1
end

slot4.m_detect_pos = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_pos

	return slot1
end

slot4.m_stand_pos = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._m_head_fwd

	return slot1
end

slot4.m_head_fwd = slot5
slot4 = SentryGunMovement

function slot5(self, look_vec3)
	slot2 = mvector3
	slot2 = slot2.set
	slot4 = self._m_head_fwd
	slot5 = look_vec3

	slot2(slot3, slot4)

	slot4 = look_vec3
	slot2 = look_vec3.to_polar_with_reference
	slot5 = self._unit_fwd
	slot6 = self._unit_up
	local look_rel_polar = slot2(slot3, slot4, slot5)
	slot3 = self._spin_obj
	slot5 = slot3
	slot3 = slot3.set_local_rotation
	slot6 = Rotation
	slot8 = look_rel_polar.spin
	slot9 = 0
	slot10 = 0

	slot3(slot4, slot6(slot7, slot8, slot9))

	slot3 = self._pitch_obj
	slot5 = slot3
	slot3 = slot3.set_local_rotation
	slot6 = Rotation
	slot8 = 0
	slot9 = look_rel_polar.pitch
	slot10 = 0

	slot3(slot4, slot6(slot7, slot8, slot9))

	slot3 = self._unit
	slot5 = slot3
	slot3 = slot3.set_moving
	slot6 = true

	slot3(slot4, slot5)

	return 
end

slot4.set_look_vec3 = slot5
slot4 = SentryGunMovement

function slot5(self)

	-- Decompilation error in this vicinity:
	slot1 = self._current_orientation
	slot1 = math
	slot1 = slot1.abs
	slot3 = self._current_orientation
	slot3 = slot3.spin
	slot1 = slot1(slot2)
	slot2 = self._spin_max
	local diff_spin = slot1 - slot2
	slot2 = math
	slot2 = slot2.abs
	slot4 = self._current_orientation
	slot4 = slot4.pitch
	slot2 = slot2(slot3)
	slot3 = self._pitch_max
	local diff_pitch = slot2 - slot3
	slot3 = 0
end

slot4.is_target_visible = slot5
slot4 = SentryGunMovement

function slot5(self, target_dir)

	-- Decompilation error in this vicinity:
	slot2 = self._attention
	slot2 = self._team
	local sentry_team_id = slot2.id
	local attention = self._attention
	slot4 = self._attention
	local attention_unit = slot4.unit
	slot5 = self._attention
	slot5 = slot5.unit
	slot7 = slot5
	slot5 = slot5.movement
	local attention_unit_movement = slot5(slot6)
	slot6 = self._attention
	slot6 = slot6.unit
	slot8 = slot6
	slot6 = slot6.movement
	slot6 = slot6(slot7)
	slot8 = slot6
	slot6 = slot6.team
	local attention_unit_movement_team = slot6(slot7)
	local attention_team_id = attention_unit_movement_team.id

	if sentry_team_id == attention_team_id then
		return 
	end

	slot10 = self
	slot8 = self._is_target_close
	slot11 = target_dir

	return slot8(slot9, slot10)
end

slot4._abandon_turret_logic = slot5
slot4 = SentryGunMovement

function slot5(self, target_unit)
	local direction_to_unit = target_unit.position(slot3) - self._m_head_pos
	slot6 = direction_to_unit
	local angle_to_unit = self._m_head_fwd.angle(target_unit, self._m_head_fwd)
	slot6 = angle_to_unit

	return math.cos(self._m_head_fwd) < 0
end

slot4.is_unit_behind = slot5
slot4 = SentryGunMovement

function slot5(self, target_dir)
	slot5 = target_dir
	local player_angle = self._m_head_fwd.angle(slot3, self._m_head_fwd)
	slot5 = player_angle
	local player_behind = math.cos(self._m_head_fwd) < 0
	slot6 = self._m_last_attention_pos - self._m_head_pos
	local player_distance = self._m_last_attention_pos - self._m_head_pos.length(self._m_head_pos)
	local abandon_distance = self._tweak.abandon_proximity or 500
	local result = player_behind and player_distance < abandon_distance

	return result
end

slot4._is_target_close_behind = slot5
slot4 = SentryGunMovement

function slot5(self, target_dir)
	slot5 = target_dir
	local player_angle = self._m_head_fwd.angle(slot3, self._m_head_fwd)
	slot5 = self._m_last_attention_pos - self._m_head_pos
	local player_distance = self._m_last_attention_pos - self._m_head_pos.length(self._m_head_pos)
	local abandon_distance = self._tweak.abandon_proximity or 500
	local result = player_distance < abandon_distance

	return result
end

slot4._is_target_close = slot5
slot4 = SentryGunMovement

function slot5(self, value, err, vel, slowdown_at, max_vel, min_vel, acc, dt)
	slot9 = math
	slot9 = slot9.sign
	slot11 = err
	local sign_err = slot9(slot10)
	slot10 = math
	slot10 = slot10.abs
	slot12 = err
	local abs_err = slot10(slot11)
	local wanted_vel = nil

	if abs_err < slowdown_at then
		slot12 = math
		slot12 = slot12.lerp
		slot14 = min_vel
		slot15 = max_vel
		slot16 = abs_err / slowdown_at
		slot12 = slot12(slot13, slot14, slot15)
		wanted_vel = slot12 * sign_err
	else
		wanted_vel = max_vel * sign_err
	end

	local err_vel = wanted_vel - vel
	slot13 = math
	slot13 = slot13.sign
	slot15 = err_vel
	local sign_err_vel = slot13(slot14)
	slot14 = math
	slot14 = slot14.abs
	slot16 = err_vel
	local abs_err_vel = slot14(slot15)
	slot15 = math
	slot15 = slot15.min
	slot17 = acc * dt
	slot18 = abs_err_vel
	local abs_delta_vel = slot15(slot16, slot17)
	local delta_vel = abs_delta_vel * sign_err_vel
	local new_vel = vel + delta_vel
	local at_end = nil
	local correction = new_vel * dt
	slot20 = math
	slot20 = slot20.abs
	slot22 = correction
	slot20 = slot20(slot21)
	slot21 = math
	slot21 = slot21.abs
	slot23 = err
	slot21 = slot21(slot22)

	if slot21 <= slot20 then
		slot20 = math
		slot20 = slot20.sign
		slot22 = correction
		slot20 = slot20(slot21)
		slot21 = math
		slot21 = slot21.sign
		slot23 = err
		slot21 = slot21(slot22)

		if slot20 == slot21 then
			new_vel = 0
			correction = err
			at_end = true
		end
	end

	local new_val = value + correction
	slot21 = at_end
	slot22 = new_vel
	slot23 = new_val

	return slot21, slot22, slot23
end

slot4._ramp_value = slot5
slot4 = SentryGunMovement

function slot5(self, dt)
	slot4 = self
	slot2 = self._get_target_dir
	slot5 = self._attention
	slot6 = dt
	local target_dir = slot2(slot3, slot4, slot5)
	slot3 = self._unit_fwd
	slot5 = slot3
	slot3 = slot3.to_polar
	local unit_fwd_polar = slot3(slot4)
	slot4 = self._m_head_fwd
	slot6 = slot4
	slot4 = slot4.to_polar_with_reference
	slot7 = self._unit_fwd
	slot8 = self._unit_up
	local fwd_polar = slot4(slot5, slot6, slot7)
	slot7 = target_dir
	slot5 = target_dir.to_polar_with_reference
	slot8 = self._unit_fwd
	slot9 = self._unit_up
	local error_polar = slot5(slot6, slot7, slot8)
	self._current_orientation = error_polar
	local clamped_pitch = nil
	slot7 = self._pitch_max

	if slot7 then
		slot7 = math
		slot7 = slot7.clamp
		slot9 = error_polar.pitch
		slot10 = self._pitch_max
		slot10 = -slot10
		slot11 = self._pitch_max
		slot7 = slot7(slot8, slot9, slot10)
		clamped_pitch = slot7
	else
		clamped_pitch = error_polar.pitch
	end

	local clamped_spin = nil
	slot8 = self._spin_max

	if slot8 then
		slot8 = math
		slot8 = slot8.clamp
		slot10 = error_polar.spin
		slot11 = self._spin_max
		slot11 = -slot11
		slot12 = self._spin_max
		slot8 = slot8(slot9, slot10, slot11)
		clamped_spin = slot8
	else
		clamped_spin = error_polar.spin
	end

	slot8 = Polar
	slot10 = 1
	slot11 = clamped_pitch
	slot12 = clamped_spin
	slot8 = slot8(slot9, slot10, slot11)
	error_polar = slot8
	error_polar = error_polar - fwd_polar
	local pitch_end, spin_end, new_vel, new_spin, new_pitch = nil
	slot15 = self
	slot13 = self._ramp_value
	slot16 = fwd_polar.spin
	slot17 = error_polar.spin
	slot18 = self._vel
	slot18 = slot18.spin
	slot19 = self._tweak
	slot19 = slot19.SLOWDOWN_ANGLE_SPIN
	slot20 = self._tweak
	slot20 = slot20.MAX_VEL_SPIN
	slot21 = self._rot_speed_mul
	slot20 = slot20 * slot21
	slot21 = self._tweak
	slot21 = slot21.MIN_VEL_SPIN
	slot22 = self._tweak
	slot22 = slot22.ACC_SPIN
	slot23 = self._rot_speed_mul
	slot22 = slot22 * slot23
	slot23 = dt
	slot13, slot14, slot15 = slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22)
	new_spin = slot15
	new_vel = slot14
	spin_end = slot13
	slot13 = self._vel
	slot13.spin = new_vel
	slot13 = math
	slot13 = slot13.abs
	slot15 = new_vel
	local new_vel_abs = slot13(slot14)
	slot14 = math
	slot14 = slot14.clamp
	slot16 = self._tweak
	slot16 = slot16.MIN_VEL_SPIN
	slot16 = new_vel_abs - slot16
	slot16 = 1.5 * slot16
	slot17 = self._tweak
	slot17 = slot17.MAX_VEL_SPIN
	slot18 = self._tweak
	slot18 = slot18.MIN_VEL_SPIN
	slot17 = slot17 - slot18
	slot16 = slot16 / slot17
	slot17 = 0
	slot18 = 1
	local vel_ratio = slot14(slot15, slot16, slot17)
	slot15 = 0.5

	if slot15 < vel_ratio then
		slot15 = self._motor_sound

		if not slot15 then
			slot15 = self._sound_source
			slot17 = slot15
			slot15 = slot15.post_event
			slot18 = "tank_turret_turn_gen_npc_R"
			slot15 = slot15(slot16, slot17)
			self._motor_sound = slot15
		end
	elseif vel_ratio == 0 then
		slot15 = self._motor_sound

		if slot15 then
			slot15 = self._sound_source
			slot17 = slot15
			slot15 = slot15.post_event
			slot18 = "tank_turret_stop_npc_R"

			slot15(slot16, slot17)

			slot15 = self._motor_sound
			slot17 = slot15
			slot15 = slot15.stop

			slot15(slot16)

			slot15 = false
			self._motor_sound = slot15
		end
	end

	slot17 = self
	slot15 = self._ramp_value
	slot18 = fwd_polar.pitch
	slot19 = error_polar.pitch
	slot20 = self._vel
	slot20 = slot20.pitch
	slot21 = self._tweak
	slot21 = slot21.SLOWDOWN_ANGLE_PITCH
	slot22 = self._tweak
	slot22 = slot22.MAX_VEL_PITCH
	slot23 = self._rot_speed_mul
	slot22 = slot22 * slot23
	slot23 = self._tweak
	slot23 = slot23.MIN_VEL_PITCH
	slot24 = self._tweak
	slot24 = slot24.ACC_PITCH
	slot25 = self._rot_speed_mul
	slot24 = slot24 * slot25
	slot25 = dt
	slot15, slot16, slot17 = slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)
	new_pitch = slot17
	new_vel = slot16
	pitch_end = slot15
	slot15 = self._vel
	slot15.pitch = new_vel
	slot15 = Polar
	slot17 = 1
	slot18 = new_pitch
	slot19 = new_spin
	local new_fwd_polar = slot15(slot16, slot17, slot18)
	slot18 = new_fwd_polar
	slot16 = new_fwd_polar.to_vector
	local new_fwd_vec3 = slot16(slot17)
	slot17 = mvector3
	slot17 = slot17.rotate_with
	slot19 = new_fwd_vec3
	slot20 = Rotation
	slot22 = math
	slot22 = slot22.UP
	slot23 = 90

	slot17(slot18, slot20(slot21, slot22))

	slot17 = mvector3
	slot17 = slot17.rotate_with
	slot19 = new_fwd_vec3
	slot20 = self._m_rot

	slot17(slot18, slot19)

	slot19 = self
	slot17 = self.set_look_vec3
	slot20 = new_fwd_vec3

	slot17(slot18, slot19)

	slot17 = self._tweak
	slot17 = slot17.puppet_stance

	if slot17 then
		slot19 = self
		slot17 = self._abandon_turret_logic
		slot20 = target_dir
		slot17 = slot17(slot18, slot19)

		if slot17 then
			slot19 = self
			slot17 = self.is_target_visible
			slot17 = slot17(slot18)

			if not slot17 then
				slot17 = self._unit
				slot19 = slot17
				slot17 = slot17.weapon
				slot17 = slot17(slot18)
				slot17 = slot17.deactivate

				if slot17 then
					slot17 = self._unit
					slot19 = slot17
					slot17 = slot17.weapon
					slot17 = slot17(slot18)
					slot19 = slot17
					slot17 = slot17.deactivate

					slot17(slot18)
				end

				return 
			end
		end
	end

	if pitch_end and spin_end then
		slot17 = self._switched_off

		if slot17 then
			slot19 = self
			slot17 = self.set_active
			slot20 = false

			slot17(slot18, slot19)
		end
	end

	return 
end

slot4._upd_movement = slot5
slot4 = SentryGunMovement

function slot5(self, t, dt)
	slot3 = self._tweak
	slot3 = slot3.ECM_HACKABLE

	if not slot3 then
		return 
	end

	local is_hacking_active = nil
	slot4 = Network
	slot6 = slot4
	slot4 = slot4.is_server
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = managers
		slot4 = slot4.groupai
		slot6 = slot4
		slot4 = slot4.state
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.is_ecm_jammer_active
		slot7 = "camera"
		slot4 = slot4(slot5, slot6)
		is_hacking_active = slot4
	else
		slot4 = self._team
		slot4 = slot4.id

		if slot4 == "hacked_turret" then
			is_hacking_active = true
		end
	end

	slot4 = self._is_hacked

	if slot4 then
		if not is_hacking_active then
			slot4 = nil
			self._is_hacked = slot4
			slot4 = Network
			slot6 = slot4
			slot4 = slot4.is_server
			slot4 = slot4(slot5)

			if slot4 then
				local original_team = self._original_team
				slot5 = nil
				self._original_team = slot5
				slot7 = self
				slot5 = self.set_team
				slot8 = original_team

				slot5(slot6, slot7)
			end

			slot4 = self._hacked_stop_snd_event

			if slot4 then
			end

			slot4 = Network
			slot6 = slot4
			slot4 = slot4.is_server
			slot4 = slot4(slot5)

			if slot4 then
				slot4 = self._unit
				slot6 = slot4
				slot4 = slot4.brain
				slot4 = slot4(slot5)
				slot6 = slot4
				slot4 = slot4.on_hacked_end

				slot4(slot5)
			end
		end
	elseif is_hacking_active then
		slot4 = true
		self._is_hacked = slot4
		slot4 = Network
		slot6 = slot4
		slot4 = slot4.is_server
		slot4 = slot4(slot5)

		if slot4 then
			local original_team = self._team
			slot7 = self
			slot5 = self.set_team
			slot8 = managers
			slot8 = slot8.groupai
			slot10 = slot8
			slot8 = slot8.state
			slot8 = slot8(slot9)
			slot10 = slot8
			slot8 = slot8.team_data
			slot11 = "hacked_turret"

			slot5(slot6, slot8(slot9, slot10))

			self._original_team = original_team
		end

		slot4 = self._hacked_start_snd_event

		if slot4 then
		end

		slot4 = Network
		slot6 = slot4
		slot4 = slot4.is_server
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = self._unit
			slot6 = slot4
			slot4 = slot4.brain
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.on_hacked_start

			slot4(slot5)
		end
	end

	return 
end

slot4._upd_hacking = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._tweak
	local recoil_tweak = slot1.recoil
	local th = recoil_tweak.horizontal
	slot3 = math
	slot3 = slot3.rand
	slot5 = th[1]
	slot6 = th[2]
	slot3 = slot3(slot4, slot5)
	slot4 = math
	slot4 = slot4.random
	slot6 = th[3]
	slot7 = th[4]
	slot4 = slot4(slot5, slot6)
	local recoil_pitch = slot3 * slot4
	local tv = recoil_tweak.vertical
	slot5 = math
	slot5 = slot5.rand
	slot7 = tv[1]
	slot8 = tv[2]
	slot5 = slot5(slot6, slot7)
	slot6 = math
	slot6 = slot6.random
	slot8 = tv[3]
	slot9 = tv[4]
	slot6 = slot6(slot7, slot8)
	local recoil_spin = slot5 * slot6
	slot6 = self._unit_fwd
	slot8 = slot6
	slot6 = slot6.to_polar
	local unit_fwd_polar = slot6(slot7)
	slot7 = self._m_head_fwd
	slot9 = slot7
	slot7 = slot7.to_polar_with_reference
	slot10 = self._unit_fwd
	slot11 = self._unit_up
	local fwd_polar = slot7(slot8, slot9, slot10)
	slot8 = Polar
	slot10 = recoil_pitch
	slot11 = recoil_spin
	slot12 = 0
	local recoil_polar = slot8(slot9, slot10, slot11)
	slot9 = fwd_polar.pitch
	local new_pitch = slot9 + recoil_pitch
	slot10 = fwd_polar.spin
	local new_spin = slot10 + recoil_spin
	slot11 = Polar
	slot13 = 1
	slot14 = new_pitch
	slot15 = new_spin
	local new_fwd_polar = slot11(slot12, slot13, slot14)
	slot14 = new_fwd_polar
	slot12 = new_fwd_polar.to_vector
	local new_fwd_vec3 = slot12(slot13)
	slot13 = mvector3
	slot13 = slot13.rotate_with
	slot15 = new_fwd_vec3
	slot16 = Rotation
	slot18 = math
	slot18 = slot18.UP
	slot19 = 90

	slot13(slot14, slot16(slot17, slot18))

	slot13 = mvector3
	slot13 = slot13.rotate_with
	slot15 = new_fwd_vec3
	slot16 = self._m_rot

	slot13(slot14, slot15)

	slot15 = self
	slot13 = self.set_look_vec3
	slot16 = new_fwd_vec3

	slot13(slot14, slot15)

	return 
end

slot4.give_recoil = slot5
slot4 = SentryGunMovement

function slot5(self, attention, dt)
	if not attention then
		slot3 = self._switched_off

		if slot3 then
			slot3 = self._switch_off_rot
		else
			slot3 = self._unit_fwd

			return slot3
		end
	else
		local target_pos = tmp_vec1
		slot4 = attention.handler

		if slot4 then
			slot4 = self._m_last_attention_pos

			if slot4 then
				slot4 = mvector3
				slot4 = slot4.set
				slot6 = target_pos
				slot7 = self._m_last_attention_vel

				slot4(slot5, slot6)

				slot4 = mvector3
				slot4 = slot4.multiply
				slot6 = target_pos
				slot7 = self._tweak
				slot7 = slot7.VELOCITY_COMPENSATION
				slot7 = slot7.SNAPSHOT_INTERVAL

				slot4(slot5, slot6)

				slot4 = mvector3
				slot4 = slot4.add
				slot6 = target_pos
				slot7 = self._m_last_attention_pos

				slot4(slot5, slot6)
			else
				slot4 = self._unit
				slot6 = slot4
				slot4 = slot4.weapon
				slot4 = slot4(slot5)
				slot6 = slot4
				slot4 = slot4.adjust_target_pos
				slot7 = attention.handler
				slot9 = slot7
				slot7 = slot7.get_attention_m_pos
				local adjusted_pos = slot4(slot5, slot7(slot8))
				slot5 = mvector3
				slot5 = slot5.set
				slot7 = target_pos
				slot8 = adjusted_pos

				slot5(slot6, slot7)
			end
		else
			slot4 = attention.unit

			if slot4 then
				slot4 = self._m_last_attention_pos

				if slot4 then
					slot4 = mvector3
					slot4 = slot4.set
					slot6 = target_pos
					slot7 = self._m_last_attention_vel

					slot4(slot5, slot6)

					slot4 = mvector3
					slot4 = slot4.multiply
					slot6 = target_pos
					slot7 = self._tweak
					slot7 = slot7.VELOCITY_COMPENSATION
					slot7 = slot7.SNAPSHOT_INTERVAL

					slot4(slot5, slot6)

					slot4 = mvector3
					slot4 = slot4.add
					slot6 = target_pos
					slot7 = self._m_last_attention_pos

					slot4(slot5, slot6)

					slot4 = attention.unit
					slot6 = slot4
					slot4 = slot4.character_damage
					slot4 = slot4(slot5)
					slot6 = slot4
					slot4 = slot4.shoot_pos_mid
					slot7 = self._m_last_attention_pos

					slot4(slot5, slot6)
				else
					slot4 = attention.unit
					slot6 = slot4
					slot4 = slot4.character_damage
					slot4 = slot4(slot5)
					slot6 = slot4
					slot4 = slot4.shoot_pos_mid
					slot7 = target_pos

					slot4(slot5, slot6)
				end
			else
				target_pos = attention.pos
			end
		end

		slot4 = attention.unit

		if slot4 then
			slot4 = self._m_last_attention_pos

			if slot4 then
				slot4 = TimerManager
				slot6 = slot4
				slot4 = slot4.game
				slot4 = slot4(slot5)
				slot6 = slot4
				slot4 = slot4.time
				slot4 = slot4(slot5)
				slot5 = self._last_attention_snapshot_t
				slot6 = self._tweak
				slot6 = slot6.VELOCITY_COMPENSATION
				slot6 = slot6.SNAPSHOT_INTERVAL
				slot5 = slot5 + slot6

				if slot5 < slot4 then
					slot4 = mvector3
					slot4 = slot4.set
					slot6 = self._m_last_attention_vel
					slot7 = self._m_last_attention_pos

					slot4(slot5, slot6)

					slot4 = attention.handler

					if slot4 then
						slot4 = self._unit
						slot6 = slot4
						slot4 = slot4.weapon
						slot4 = slot4(slot5)
						slot6 = slot4
						slot4 = slot4.adjust_target_pos
						slot7 = attention.handler
						slot9 = slot7
						slot7 = slot7.get_attention_m_pos
						local adjusted_pos = slot4(slot5, slot7(slot8))
						slot5 = mvector3
						slot5 = slot5.set
						slot7 = self._m_last_attention_pos
						slot8 = adjusted_pos

						slot5(slot6, slot7)
					else
						slot4 = attention.unit
						slot6 = slot4
						slot4 = slot4.character_damage
						slot4 = slot4(slot5)
						slot6 = slot4
						slot4 = slot4.shoot_pos_mid
						slot7 = self._m_last_attention_pos

						slot4(slot5, slot6)
					end

					slot4 = mvector3
					slot4 = slot4.subtract
					slot6 = self._m_last_attention_vel
					slot7 = self._m_last_attention_pos

					slot4(slot5, slot6)

					slot4 = mvector3
					slot4 = slot4.divide
					slot6 = self._m_last_attention_vel
					slot7 = self._last_attention_snapshot_t
					slot8 = TimerManager
					slot10 = slot8
					slot8 = slot8.game
					slot8 = slot8(slot9)
					slot10 = slot8
					slot8 = slot8.time
					slot8 = slot8(slot9)
					slot7 = slot7 - slot8

					slot4(slot5, slot6)

					slot4 = TimerManager
					slot6 = slot4
					slot4 = slot4.game
					slot4 = slot4(slot5)
					slot6 = slot4
					slot4 = slot4.time
					slot4 = slot4(slot5)
					self._last_attention_snapshot_t = slot4
				end
			end
		end

		local target_vec = tmp_vec2
		slot5 = mvec3_dir
		slot7 = target_vec
		slot8 = self._m_head_pos
		slot9 = target_pos

		slot5(slot6, slot7, slot8)

		return target_vec
	end

	return 
end

slot4._get_target_dir = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = false

	return slot1
end

slot4.tased = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot3 = self
	slot1 = self.on_death

	slot1(slot2)

	return 
end

slot4.on_deactivated = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.set_extension_update_enabled
	slot4 = Idstring
	slot6 = "movement"
	slot4 = slot4(slot5)
	slot5 = false

	slot1(slot2, slot3, slot4)

	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.weapon
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.set_laser_enabled
	slot4, slot5 = nil

	slot1(slot2, slot3, slot4)

	return 
end

slot4.on_death = slot5
slot4 = SentryGunMovement

function slot5(self, ...)
	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.brain
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.synch_allow_fire
	slot4 = ...
	slot5 = true

	slot1(slot2, slot3, slot4)

	return 
end

slot4.synch_allow_fire = slot5
slot4 = SentryGunMovement

function slot5(self, t)
	return t < self._warmup_t
end

slot4.warming_up = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._activating

	return slot1
end

slot4.is_activating = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._inactivating

	return slot1
end

slot4.is_inactivating = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._inactivated

	return slot1
end

slot4.is_inactivated = slot5
slot4 = SentryGunMovement

function slot5(self, fixed)
	slot2 = true
	self._switched_off = slot2
	slot2 = nil
	self._switch_off_rot = slot2

	if not fixed then
		slot2 = Rotation
		slot4 = self._m_rot
		slot6 = slot4
		slot4 = slot4.x
		slot4 = slot4(slot5)
		slot5 = -35
		slot2 = slot2(slot3, slot4)
		self._switch_off_rot = slot2
	end

	return 
end

slot4.switch_off = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = false
	self._switched_off = slot1
	slot3 = self
	slot1 = self.set_active
	slot4 = true

	slot1(slot2, slot3)

	return 
end

slot4.switch_on = slot5
slot4 = SentryGunMovement

function slot5(self, save_data)
	local my_save_data = {}
	save_data.movement = my_save_data
	slot3 = self._attention

	if slot3 then
		slot3 = self._attention
		slot3 = slot3.pos

		if slot3 then
			slot3 = self._attention
			my_save_data.attention = slot3
		else
			slot3 = self._attention
			slot3 = slot3.unit
			slot5 = slot3
			slot3 = slot3.id
			slot3 = slot3(slot4)

			if slot3 == -1 then
				slot3 = {}
				slot4 = self._attention
				slot4 = slot4.unit
				slot6 = slot4
				slot4 = slot4.movement
				slot4 = slot4(slot5)
				slot6 = slot4
				slot4 = slot4.m_com
				slot4 = slot4(slot5)
				slot3.pos = slot4
				my_save_data.attention = slot3
			else
				slot3 = managers
				slot3 = slot3.enemy
				slot5 = slot3
				slot3 = slot3.add_delayed_clbk
				slot6 = "clbk_sync_attention"
				slot7 = tostring
				slot9 = self._unit
				slot11 = slot9
				slot9 = slot9.key
				slot7 = slot7(slot9(slot10))
				slot6 = slot6 .. slot7
				slot7 = callback
				slot9 = self
				slot10 = CopMovement
				slot11 = "clbk_sync_attention"
				slot12 = self._attention
				slot7 = slot7(slot8, slot9, slot10, slot11)
				slot8 = TimerManager
				slot10 = slot8
				slot8 = slot8.game
				slot8 = slot8(slot9)
				slot10 = slot8
				slot8 = slot8.time
				slot8 = slot8(slot9)
				slot8 = slot8 + 0.1

				slot3(slot4, slot5, slot6, slot7)
			end
		end
	end

	slot3 = self._rot_speed_mul

	if slot3 ~= 1 then
		slot3 = self._rot_speed_mul
		my_save_data.rot_speed_mul = slot3
	end

	slot3 = self._team
	slot3 = slot3.id
	my_save_data.team = slot3
	slot3 = self._activating

	if slot3 then
		slot3 = true
		my_save_data.activating = slot3
	else
		slot3 = self._activated

		if slot3 then
			slot3 = true
			my_save_data.activated = slot3
		end
	end

	slot3 = self._spin_obj
	slot5 = slot3
	slot3 = slot3.rotation
	slot3 = slot3(slot4)
	my_save_data.spin_rot = slot3
	slot3 = self._pitch_obj
	slot5 = slot3
	slot3 = slot3.rotation
	slot3 = slot3(slot4)
	my_save_data.pitch_rot = slot3

	return 
end

slot4.save = slot5
slot4 = SentryGunMovement

function slot5(self, save_data)

	-- Decompilation error in this vicinity:
	local my_save_data = save_data.movement
	self._rot_speed_mul = my_save_data.rot_speed_mul or 1
	slot3 = tweak_data
	slot3 = slot3.weapon
	slot4 = self._unit
	slot6 = slot4
	slot4 = slot4.base
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.get_name_id
	slot4 = slot4(slot5)
	slot3 = slot3[slot4]
	self._tweak = slot3
	slot3 = self._tweak
	slot3 = slot3.VELOCITY_COMPENSATION

	if slot3 then
		slot3 = self._m_last_attention_pos

		if not slot3 then
			slot3 = Vector3
			slot3 = slot3()
			self._m_last_attention_pos = slot3
			slot3 = Vector3
			slot3 = slot3()
			self._m_last_attention_vel = slot3
		end
	end

	slot3 = my_save_data.attention

	if slot3 then
		slot3 = my_save_data.attention
		self._attention = slot3
	end

	slot3 = managers
	slot3 = slot3.groupai
	slot5 = slot3
	slot3 = slot3.state
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.team_data
	slot6 = my_save_data.team
	slot3 = slot3(slot4, slot5)
	self._team = slot3
	slot3 = managers
	slot3 = slot3.groupai
	slot5 = slot3
	slot3 = slot3.state
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.add_listener
	slot6 = "SentryGunMovement_team_def_"
	slot7 = tostring
	slot9 = self._unit
	slot11 = slot9
	slot9 = slot9.key
	slot7 = slot7(slot9(slot10))
	slot6 = slot6 .. slot7
	slot7 = {
		"team_def"
	}
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "clbk_team_def"

	slot3(slot4, slot5, slot6, slot8(slot9, slot10, slot11))

	slot3 = my_save_data.activating

	if slot3 then
		slot3 = true
		self._activating = slot3
		slot3 = callback
		slot5 = self
		slot6 = self
		slot7 = "_update_activating"
		slot3 = slot3(slot4, slot5, slot6)
		self._updator = slot3
	else
		slot3 = my_save_data.activated

		if slot3 then
			slot3 = true
			self._activated = slot3
			slot3 = callback
			slot5 = self
			slot6 = self
			slot7 = "_update_active"
			slot3 = slot3(slot4, slot5, slot6)
			self._updator = slot3
		end
	end

	slot3 = self._unit
	slot5 = slot3
	slot3 = slot3.weapon
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.update_laser

	slot3(slot4)

	slot3 = self._spin_obj
	slot5 = slot3
	slot3 = slot3.set_rotation
	slot6 = my_save_data.spin_rot

	slot3(slot4, slot5)

	slot3 = self._spin_obj
	slot5 = slot3
	slot3 = slot3.set_rotation
	slot6 = my_save_data.pitch_rot

	slot3(slot4, slot5)

	return 
end

slot4.load = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = managers
	slot1 = slot1.groupai
	slot3 = slot1
	slot1 = slot1.state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.team_data
	slot4 = self._team
	slot4 = slot4.id
	slot1 = slot1(slot2, slot3)
	self._team = slot1
	slot1 = managers
	slot1 = slot1.groupai
	slot3 = slot1
	slot1 = slot1.state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove_listener
	slot4 = "SentryGunMovement_team_def_"
	slot5 = tostring
	slot7 = self._unit
	slot9 = slot7
	slot7 = slot7.key
	slot5 = slot5(slot7(slot8))
	slot4 = slot4 .. slot5

	slot1(slot2, slot3)

	return 
end

slot4.clbk_team_def = slot5
slot4 = SentryGunMovement

function slot5(self, team_data)
	slot2 = self._original_team

	if slot2 then
		self._original_team = team_data

		return 
	end

	self._team = team_data
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.weapon
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.on_team_set
	slot5 = team_data

	slot2(slot3, slot4)

	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.brain
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.on_team_set
	slot5 = team_data

	slot2(slot3, slot4)

	slot2 = Network
	slot4 = slot2
	slot2 = slot2.is_server
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.id
		slot2 = slot2(slot3)

		if slot2 ~= -1 then
			slot2 = tweak_data
			slot2 = slot2.levels
			slot4 = slot2
			slot2 = slot2.get_team_index
			slot5 = team_data.id
			local team_index = slot2(slot3, slot4)
			slot3 = 256

			if team_index <= slot3 then
				slot3 = self._ext_network
				slot5 = slot3
				slot3 = slot3.send
				slot6 = "sync_char_team"
				slot7 = team_index

				slot3(slot4, slot5, slot6)
			else
				slot3 = debug_pause_unit
				slot5 = self._unit
				slot6 = "[SentryGunMovement:set_team] team limit reached!"
				slot7 = team_data.id

				slot3(slot4, slot5, slot6)
			end
		end
	end

	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.weapon
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.update_laser

	slot2(slot3)

	slot2 = managers
	slot2 = slot2.groupai
	slot4 = slot2
	slot2 = slot2.state
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.turrets
	local turret_units = slot2(slot3)

	if turret_units then
		slot3 = table
		slot3 = slot3.contains
		slot5 = turret_units
		slot6 = self._unit
		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = self._unit
			slot5 = slot3
			slot3 = slot3.movement
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.team
			slot3 = slot3(slot4)
			slot3 = slot3.foes
			slot4 = tweak_data
			slot4 = slot4.levels
			slot6 = slot4
			slot4 = slot4.get_default_team_ID
			slot7 = "player"
			slot4 = slot4(slot5, slot6)
			slot3 = slot3[slot4]

			if slot3 then
				slot3 = self._unit
				slot5 = slot3
				slot3 = slot3.contour
				slot3 = slot3(slot4)

				if slot3 then
					slot3 = self._unit
					slot5 = slot3
					slot3 = slot3.contour
					slot3 = slot3(slot4)
					slot5 = slot3
					slot3 = slot3.remove
					slot6 = "mark_unit_friendly"
					slot7 = true

					slot3(slot4, slot5, slot6)
				end
			end
		end
	end

	return 
end

slot4.set_team = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._team

	return slot1
end

slot4.team = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = managers
	slot1 = slot1.groupai
	slot3 = slot1
	slot1 = slot1.state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.whisper_mode

	return slot1(slot2)
end

slot4.cool = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = managers
	slot1 = slot1.groupai
	slot3 = slot1
	slot1 = slot1.state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.whisper_mode
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = managers
		slot1 = slot1.groupai
		slot3 = slot1
		slot1 = slot1.state
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.whisper_mode_change_t
		slot1 = slot1(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	return slot1
end

slot4.not_cool_t = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._rearming

	return slot1
end

slot4.rearming = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = callback
	slot3 = self
	slot4 = self
	slot5 = "_update_rearming"
	slot1 = slot1(slot2, slot3, slot4)
	self._updator = slot1
	slot1 = true
	self._rearming = slot1
	slot1 = TimerManager
	slot3 = slot1
	slot1 = slot1.game
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.time
	slot1 = slot1(slot2)
	slot2 = self._tweak
	slot2 = slot2.AUTO_RELOAD_DURATION
	slot1 = slot1 + slot2
	self._rearm_complete_t = slot1
	slot1 = self._vel
	slot2 = 0
	slot1.pitch = slot2
	slot1 = self._vel
	slot2 = 0
	slot1.spin = slot2
	slot1 = self._rearm_snd_event

	if slot1 then
		slot1 = self._sound_source
		slot3 = slot1
		slot1 = slot1.post_event
		slot4 = self._rearm_snd_event
		slot1 = slot1(slot2, slot3)
		self._rearm_event = slot1
	end

	slot1 = self._unit
	slot3 = slot1
	slot1 = slot1.weapon
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.update_laser

	slot1(slot2)

	return 
end

slot4.rearm = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = self._repairing

	return slot1
end

slot4.repairing = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = callback
	slot3 = self
	slot4 = self
	slot5 = "_update_repairing"
	slot1 = slot1(slot2, slot3, slot4)
	self._updator = slot1
	slot1 = self._repair_start_seq

	if slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.damage
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.run_sequence_simple
		slot4 = self._repair_start_seq

		slot1(slot2, slot3)
	end

	slot1 = true
	self._repairing = slot1
	slot1 = Network
	slot3 = slot1
	slot1 = slot1.is_server
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = TimerManager
		slot3 = slot1
		slot1 = slot1.game
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.time
		slot1 = slot1(slot2)
		slot2 = self._tweak
		slot2 = slot2.AUTO_REPAIR_DURATION
		slot1 = slot1 + slot2
		self._repair_complete_t = slot1
	end

	return 
end

slot4.repair = slot5
slot4 = SentryGunMovement

function slot5(self)
	slot1 = Network
	slot3 = slot1
	slot1 = slot1.is_server
	slot1 = slot1(slot2)

	if slot1 then
		slot3 = self
		slot1 = self.set_attention

		slot1(slot2)
	else
		slot3 = self
		slot1 = self.synch_attention

		slot1(slot2)
	end

	slot1 = self._nav_tracker

	if slot1 then
		slot1 = managers
		slot1 = slot1.navigation
		slot3 = slot1
		slot1 = slot1.destroy_nav_tracker
		slot4 = self._nav_tracker

		slot1(slot2, slot3)

		slot1 = nil
		self._nav_tracker = slot1
	end

	slot1 = self._pos_reservation

	if slot1 then
		slot1 = managers
		slot1 = slot1.navigation
		slot3 = slot1
		slot1 = slot1.unreserve_pos
		slot4 = self._pos_reservation

		slot1(slot2, slot3)

		slot1 = nil
		self._pos_reservation = slot1
	end

	slot1 = self._pos_rsrv_id

	if slot1 then
		slot1 = managers
		slot1 = slot1.navigation
		slot3 = slot1
		slot1 = slot1.release_pos_reservation_id
		slot4 = self._pos_rsrv_id

		slot1(slot2, slot3)

		slot1 = nil
		self._pos_rsrv_id = slot1
	end

	return 
end

slot4.pre_destroy = slot5

return 
