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
slot0 = FPCameraPlayerBase

if not slot0 then
	slot0 = class
	slot2 = UnitBase
	slot0 = slot0(slot1)
end

FPCameraPlayerBase = slot0
slot0 = FPCameraPlayerBase
slot1 = Idstring
slot3 = "empty"
slot1 = slot1(slot2)
slot0.IDS_EMPTY = slot1
slot0 = FPCameraPlayerBase
slot1 = Idstring
slot3 = ""
slot1 = slot1(slot2)
slot0.IDS_NOSTRING = slot1
slot0 = FPCameraPlayerBase
slot1 = nil
slot0.bipod_location = slot1
slot0 = FPCameraPlayerBase
slot1 = nil
slot0.camera_last_pos = slot1
slot0 = FPCameraPlayerBase
slot1 = 85
slot0.MAX_PITCH = slot1
slot0 = mvector3
local mvec3_set = slot0.set
slot1 = mvector3
local mvec3_set_zero = slot1.set_zero
slot2 = mvector3
local mvec3_set_x = slot2.set_x
slot3 = mvector3
local mvec3_set_y = slot3.set_y
slot4 = mvector3
local mvec3_add = slot4.add
slot5 = mvector3
local mvec3_dot = slot5.dot
slot6 = mvector3
local mvec3_sub = slot6.subtract
slot7 = mvector3
local mvec3_mul = slot7.multiply
slot8 = mvector3
local mvec3_norm = slot8.normalize
slot9 = mvector3
local mvec3_dir = slot9.direction
slot10 = mvector3
local mvec3_set_l = slot10.set_length
slot11 = mvector3
local mvec3_len = slot11.length
slot12 = mvector3
local mvec3_cross = slot12.cross
slot13 = Vector3
local tmp_vec1 = slot13()
slot14 = Vector3
local tmp_vec2 = slot14()
slot15 = Vector3
local tmp_vec3 = slot15()
slot16 = Rotation
local tmp_rot1 = slot16()
slot17 = math
slot17 = slot17.sqrt
slot19 = 2
local math_sqrt2 = slot17(slot18)
slot18 = FPCameraPlayerBase

function slot19(self, unit)
	slot2 = UnitBase
	slot2 = slot2.init
	slot4 = self
	slot5 = unit
	slot6 = true

	slot2(slot3, slot4, slot5)

	self._unit = unit
	slot4 = unit
	slot2 = unit.set_timer
	slot5 = managers
	slot5 = slot5.player
	slot7 = slot5
	slot5 = slot5.player_timer

	slot2(slot3, slot5(slot6))

	slot4 = unit
	slot2 = unit.set_animation_timer
	slot5 = managers
	slot5 = slot5.player
	slot7 = slot5
	slot5 = slot5.player_timer

	slot2(slot3, slot5(slot6))

	slot4 = unit
	slot2 = unit.set_approximate_orientation
	slot5 = false

	slot2(slot3, slot4)

	slot2 = true
	self._anims_enabled = slot2
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.orientation_object
	slot2 = slot2(slot3)
	self._obj_eye = slot2
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = Idstring
	slot7 = "right_weapon_align"
	slot2 = slot2(slot3, slot5(slot6))
	self._weap_align = slot2
	slot2 = {
		pitch = 0.5,
		spin = 0
	}
	self._camera_properties = slot2
	slot2 = {}
	slot5 = unit
	slot3 = unit.position
	slot3 = slot3(slot4)
	slot2.position = slot3
	slot5 = unit
	slot3 = unit.rotation
	slot3 = slot3(slot4)
	slot2.rotation = slot3
	self._output_data = slot2
	slot2 = {}
	self._head_stance = slot2
	slot2 = self._head_stance
	slot3 = Vector3
	slot3 = slot3()
	slot2.translation = slot3
	slot2 = self._head_stance
	slot3 = Rotation
	slot3 = slot3()
	slot2.rotation = slot3
	slot2 = {}
	self._shoulder_stance = slot2
	slot2 = self._shoulder_stance
	slot3 = Vector3
	slot3 = slot3()
	slot2.translation = slot3
	slot2 = self._shoulder_stance
	slot3 = Rotation
	slot3 = slot3()
	slot2.rotation = slot3
	slot2 = {}
	self._vel_overshot = slot2
	slot2 = self._vel_overshot
	slot3 = Vector3
	slot3 = slot3()
	slot2.translation = slot3
	slot2 = self._vel_overshot
	slot3 = Rotation
	slot3 = slot3()
	slot2.rotation = slot3
	slot2 = self._vel_overshot
	slot3 = 0
	slot2.last_yaw = slot3
	slot2 = self._vel_overshot
	slot3 = 0
	slot2.last_pitch = slot3
	slot2 = self._vel_overshot
	slot3 = 0
	slot2.target_yaw = slot3
	slot2 = self._vel_overshot
	slot3 = 0
	slot2.target_pitch = slot3
	slot2 = {}
	self._aim_assist = slot2
	slot2 = self._aim_assist
	slot3 = Vector3
	slot3 = slot3()
	slot2.direction = slot3
	slot2 = self._aim_assist
	slot3 = 0
	slot2.distance = slot3
	slot2 = self._aim_assist
	slot3 = Rotation
	slot3 = slot3()
	slot2.mrotation = slot3
	slot2 = {}
	self._aim_assist_sticky = slot2
	slot2 = self._aim_assist_sticky
	slot3 = Vector3
	slot3 = slot3()
	slot2.direction = slot3
	slot2 = self._aim_assist_sticky
	slot3 = 0
	slot2.distance = slot3
	slot2 = self._aim_assist_sticky
	slot3 = Rotation
	slot3 = slot3()
	slot2.mrotation = slot3
	slot2 = self._aim_assist_sticky
	slot3 = 0
	slot2.distance_to_aim_line = slot3
	slot2 = self._aim_assist_sticky
	slot3 = true
	slot2.is_sticky = slot3
	slot2 = {
		fov = 75
	}
	self._fov = slot2
	slot2 = {}
	self._input = slot2
	slot2 = tweak_data
	slot2 = slot2.input
	slot2 = slot2.gamepad
	self._tweak_data = slot2
	slot2 = self._camera_properties
	slot3 = self._tweak_data
	slot3 = slot3.look_speed_standard
	slot2.look_speed_current = slot3
	slot2 = self._camera_properties
	slot3 = 0
	slot2.look_speed_transition_timer = slot3
	slot2 = self._camera_properties
	slot3 = 0
	slot2.target_tilt = slot3
	slot2 = self._camera_properties
	slot3 = 0
	slot2.current_tilt = slot3
	slot2 = {
		velocity = 0
	}
	slot3 = Vector3
	slot3 = slot3()
	slot2.direction = slot3
	slot3 = Vector3
	slot3 = slot3()
	slot2.delta = slot3
	self._view_kick = slot2
	slot4 = self
	slot2 = self.check_flashlight_enabled

	slot2(slot3)

	slot4 = self
	slot2 = self.load_fps_mask_units

	slot2(slot3)

	slot2 = true
	self._use_anim_allowed = slot2

	return 
end

slot18.init = slot19
slot18 = FPCameraPlayerBase

function slot19(self, parent_unit)
	self._parent_unit = parent_unit
	slot2 = self._parent_unit
	slot4 = slot2
	slot2 = slot2.movement
	slot2 = slot2(slot3)
	self._parent_movement_ext = slot2
	slot4 = parent_unit
	slot2 = parent_unit.base
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.add_destroy_listener
	slot5 = "FPCameraPlayerBase"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "parent_destroyed_clbk"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot2 = self._parent_unit
	slot4 = slot2
	slot2 = slot2.base
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.controller
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.get_default_controller_id
	local controller_type = slot2(slot3)

	if controller_type == "keyboard" then
		slot3 = callback
		slot5 = self
		slot6 = self
		slot7 = "_pc_look_function"
		slot3 = slot3(slot4, slot5, slot6)
		self._look_function = slot3
	elseif controller_type == "steampad" then
		slot3 = callback
		slot5 = self
		slot6 = self
		slot7 = "_steampad_look_function"
		slot3 = slot3(slot4, slot5, slot6)
		self._look_function = slot3
		slot3 = self._tweak_data
		slot4 = true
		slot3.uses_keyboard = slot4
	else
		slot3 = callback
		slot5 = self
		slot6 = self
		slot7 = "_gamepad_look_function"
		slot3 = slot3(slot4, slot5, slot6)
		self._look_function = slot3
		slot3 = self._tweak_data
		slot4 = false
		slot3.uses_keyboard = slot4
	end

	return 
end

slot18.set_parent_unit = slot19
slot18 = FPCameraPlayerBase

function slot19(self, parent_unit)
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.set_extension_update_enabled
	slot5 = Idstring
	slot7 = "base"
	slot5 = slot5(slot6)
	slot6 = false

	slot2(slot3, slot4, slot5)

	slot4 = self
	slot2 = self.set_slot
	slot5 = self._unit
	slot6 = 0

	slot2(slot3, slot4, slot5)

	slot2 = nil
	self._parent_unit = slot2

	return 
end

slot18.parent_destroyed_clbk = slot19
slot18 = FPCameraPlayerBase

function slot19(self)
	slot1 = self._camera_properties
	slot2 = self._parent_unit
	slot4 = slot2
	slot2 = slot2.rotation
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.y
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.to_polar
	slot2 = slot2(slot3)
	slot2 = slot2.spin
	slot1.spin = slot2

	return 
end

slot18.reset_properties = slot19
slot18 = FPCameraPlayerBase

function slot19(self, unit, t, dt)

	-- Decompilation error in this vicinity:
	slot4 = managers
	slot4 = slot4.menu
	slot4 = slot4.loading_screen_visible
	slot4 = self._tweak_data
	slot4 = slot4.aim_assist_use_sticky_aim

	if slot4 then
		slot6 = self
		slot4 = self._update_aim_assist_sticky
		slot7 = t
		slot8 = dt

		slot4(slot5, slot6, slot7)
	end

	slot4 = self._parent_unit
	slot6 = slot4
	slot4 = slot4.base
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.controller
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.get_input_axis_clbk
	slot7 = "look"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_update_rot"

	slot4(slot5, slot6, slot8(slot9, slot10, slot11))

	slot6 = self
	slot4 = self._update_stance
	slot7 = t
	slot8 = dt

	slot4(slot5, slot6, slot7)

	slot6 = self
	slot4 = self._update_movement
	slot7 = t
	slot8 = dt

	slot4(slot5, slot6, slot7)

	slot4 = managers
	slot4 = slot4.player
	slot6 = slot4
	slot4 = slot4.current_state
	slot4 = slot4(slot5)

	if slot4 == "driving" then
		slot6 = self
		slot4 = self._set_camera_position_in_vehicle

		slot4(slot5)
	else
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.camera
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.set_position
		slot7 = self._output_data
		slot7 = slot7.position

		slot4(slot5, slot6)

		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.camera
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.set_rotation
		slot7 = self._output_data
		slot7 = slot7.rotation

		slot4(slot5, slot6)
	end

	slot4 = self._fov
	slot4 = slot4.dirty

	if slot4 then
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.camera
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.set_FOV
		slot7 = self._fov
		slot7 = slot7.fov

		slot4(slot5, slot6)

		slot4 = self._fov
		slot5 = nil
		slot4.dirty = slot5
	end

	slot4 = alive
	slot6 = self._light
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.inventory
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.equipped_unit
		local weapon = slot4(slot5)

		if weapon then
			slot7 = weapon
			slot5 = weapon.get_object
			slot8 = Idstring
			slot10 = "fire"
			local object = slot5(slot6, slot8(slot9))
			slot8 = object
			slot6 = object.position
			slot6 = slot6(slot7)
			slot9 = object
			slot7 = object.rotation
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.y
			slot7 = slot7(slot8)
			slot7 = slot7 * 10
			slot6 = slot6 + slot7
			slot9 = object
			slot7 = object.rotation
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.x
			slot7 = slot7(slot8)
			slot7 = slot7 * 0
			slot6 = slot6 + slot7
			slot9 = object
			slot7 = object.rotation
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.z
			slot7 = slot7(slot8)
			slot7 = slot7 * -2
			local pos = slot6 + slot7
			slot7 = self._light
			slot9 = slot7
			slot7 = slot7.set_position
			slot10 = pos

			slot7(slot8, slot9)

			slot7 = self._light
			slot9 = slot7
			slot7 = slot7.set_rotation
			slot10 = Rotation
			slot14 = object
			slot12 = object.rotation
			slot12 = slot12(slot13)
			slot14 = slot12
			slot12 = slot12.z
			slot12 = slot12(slot13)
			slot15 = object
			slot13 = object.rotation
			slot13 = slot13(slot14)
			slot15 = slot13
			slot13 = slot13.x
			slot13 = slot13(slot14)
			slot16 = object
			slot14 = object.rotation
			slot14 = slot14(slot15)
			slot16 = slot14
			slot14 = slot14.y

			slot7(slot8, slot10(slot11, slot12, slot14(slot15)))

			slot7 = World
			slot9 = slot7
			slot7 = slot7.effect_manager
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.move_rotate
			slot10 = self._light_effect
			slot11 = pos
			slot12 = Rotation
			slot16 = object
			slot14 = object.rotation
			slot14 = slot14(slot15)
			slot16 = slot14
			slot14 = slot14.x
			slot14 = slot14(slot15)
			slot17 = object
			slot15 = object.rotation
			slot15 = slot15(slot16)
			slot17 = slot15
			slot15 = slot15.y
			slot15 = slot15(slot16)
			slot15 = -slot15
			slot18 = object
			slot16 = object.rotation
			slot16 = slot16(slot17)
			slot18 = slot16
			slot16 = slot16.z
			slot16 = slot16(slot17)
			slot16 = -slot16

			slot7(slot8, slot9, slot10, slot12(slot13, slot14, slot15))
		end
	end

	return 
end

slot18.update = slot19
slot18 = FPCameraPlayerBase

function slot19(self)
	slot1 = managers
	slot1 = slot1.game_play_central
	slot3 = slot1
	slot1 = slot1.flashlights_on_player_on
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = alive
		slot3 = self._light
		slot1 = slot1(slot2)

		if not slot1 then
			slot1 = World
			slot3 = slot1
			slot1 = slot1.create_light
			slot4 = "spot|specular"
			slot1 = slot1(slot2, slot3)
			self._light = slot1
			slot1 = self._light
			slot3 = slot1
			slot1 = slot1.set_spot_angle_end
			slot4 = 45

			slot1(slot2, slot3)

			slot1 = self._light
			slot3 = slot1
			slot1 = slot1.set_far_range
			slot4 = 1000

			slot1(slot2, slot3)
		end

		slot1 = self._light_effect

		if not slot1 then
			slot1 = World
			slot3 = slot1
			slot1 = slot1.effect_manager
			slot1 = slot1(slot2)
			slot3 = slot1
			slot1 = slot1.spawn
			slot4 = {}
			slot5 = Idstring
			slot7 = "effects/vanilla/weapons/flashlight/fp_flashlight"
			slot5 = slot5(slot6)
			slot4.effect = slot5
			slot5 = self._unit
			slot7 = slot5
			slot5 = slot5.position
			slot5 = slot5(slot6)
			slot4.position = slot5
			slot5 = Rotation
			slot5 = slot5()
			slot4.rotation = slot5
			slot1 = slot1(slot2, slot3)
			self._light_effect = slot1
		end

		slot1 = self._light
		slot3 = slot1
		slot1 = slot1.set_enable
		slot4 = true

		slot1(slot2, slot3)

		slot1 = World
		slot3 = slot1
		slot1 = slot1.effect_manager
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.set_hidden
		slot4 = self._light_effect
		slot5 = false

		slot1(slot2, slot3, slot4)
	else
		slot1 = alive
		slot3 = self._light
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._light
			slot3 = slot1
			slot1 = slot1.set_enable
			slot4 = false

			slot1(slot2, slot3)

			slot1 = World
			slot3 = slot1
			slot1 = slot1.effect_manager
			slot1 = slot1(slot2)
			slot3 = slot1
			slot1 = slot1.set_hidden
			slot4 = self._light_effect
			slot5 = true

			slot1(slot2, slot3, slot4)
		end
	end

	return 
end

slot18.check_flashlight_enabled = slot19
slot18 = FPCameraPlayerBase

function slot19(self)
	return 
end

slot18.start_shooting = slot19
slot18 = FPCameraPlayerBase

function slot19(self, wait)
	return 
end

slot18.stop_shooting = slot19
slot18 = FPCameraPlayerBase

function slot19(self)
	slot1 = self._view_kick
	slot1 = slot1.x
	slot2 = 0
	slot1.velocity = slot2
	slot1 = self._view_kick
	slot1 = slot1.x
	slot2 = 0
	slot1.delta = slot2
	slot1 = self._view_kick
	slot1 = slot1.y
	slot2 = 0
	slot1.velocity = slot2
	slot1 = self._view_kick
	slot1 = slot1.y
	slot2 = 0
	slot1.delta = slot2
	slot3 = self
	slot1 = self.stop_shooting

	slot1(slot2)

	return 
end

slot18.break_recoil = slot19
local bezier_values = {
	0,
	0,
	1,
	1
}
slot19 = FPCameraPlayerBase

function slot20(self, t, dt)
	slot3 = self._shoulder_stance
	slot3 = slot3.transition

	if slot3 then
		slot3 = self._shoulder_stance
		local trans_data = slot3.transition
		slot4 = trans_data.start_t
		local elapsed_t = t - slot4
		slot5 = trans_data.duration

		if slot5 < elapsed_t then
			slot5 = mvector3
			slot5 = slot5.set
			slot7 = self._shoulder_stance
			slot7 = slot7.translation
			slot8 = trans_data.end_translation

			slot5(slot6, slot7)

			slot5 = self._shoulder_stance
			slot6 = trans_data.end_rotation
			slot5.rotation = slot6
			slot5 = self._shoulder_stance
			slot6 = nil
			slot5.transition = slot6
		else
			slot5 = trans_data.duration
			local progress = elapsed_t / slot5
			slot6 = math
			slot6 = slot6.bezier
			slot8 = bezier_values
			slot9 = progress
			local progress_smooth = slot6(slot7, slot8)
			slot7 = mvector3
			slot7 = slot7.lerp
			slot9 = self._shoulder_stance
			slot9 = slot9.translation
			slot10 = trans_data.start_translation
			slot11 = trans_data.end_translation
			slot12 = progress_smooth

			slot7(slot8, slot9, slot10, slot11)

			slot7 = self._shoulder_stance
			slot8 = trans_data.start_rotation
			slot10 = slot8
			slot8 = slot8.slerp
			slot11 = trans_data.end_rotation
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.rotation = slot8
		end
	end

	slot3 = self._head_stance
	slot3 = slot3.transition

	if slot3 then
		slot3 = self._head_stance
		local trans_data = slot3.transition
		slot4 = trans_data.start_t
		local elapsed_t = t - slot4
		slot5 = trans_data.duration

		if slot5 < elapsed_t then
			slot5 = mvector3
			slot5 = slot5.set
			slot7 = self._head_stance
			slot7 = slot7.translation
			slot8 = trans_data.end_translation

			slot5(slot6, slot7)

			slot5 = self._head_stance
			slot6 = nil
			slot5.transition = slot6
		else
			slot5 = trans_data.duration
			local progress = elapsed_t / slot5
			slot6 = math
			slot6 = slot6.bezier
			slot8 = bezier_values
			slot9 = progress
			local progress_smooth = slot6(slot7, slot8)
			slot7 = mvector3
			slot7 = slot7.lerp
			slot9 = self._head_stance
			slot9 = slot9.translation
			slot10 = trans_data.start_translation
			slot11 = trans_data.end_translation
			slot12 = progress_smooth

			slot7(slot8, slot9, slot10, slot11)
		end
	end

	slot3 = self._vel_overshot
	slot3 = slot3.transition

	if slot3 then
		slot3 = self._vel_overshot
		local trans_data = slot3.transition
		slot4 = trans_data.start_t
		local elapsed_t = t - slot4
		slot5 = trans_data.duration

		if slot5 < elapsed_t then
			slot5 = self._vel_overshot
			slot6 = trans_data.end_yaw_neg
			slot5.yaw_neg = slot6
			slot5 = self._vel_overshot
			slot6 = trans_data.end_yaw_pos
			slot5.yaw_pos = slot6
			slot5 = self._vel_overshot
			slot6 = trans_data.end_pitch_neg
			slot5.pitch_neg = slot6
			slot5 = self._vel_overshot
			slot6 = trans_data.end_pitch_pos
			slot5.pitch_pos = slot6
			slot5 = mvector3
			slot5 = slot5.set
			slot7 = self._vel_overshot
			slot7 = slot7.pivot
			slot8 = trans_data.end_pivot

			slot5(slot6, slot7)

			slot5 = self._vel_overshot
			slot6 = nil
			slot5.transition = slot6
		else
			slot5 = trans_data.duration
			local progress = elapsed_t / slot5
			slot6 = math
			slot6 = slot6.bezier
			slot8 = bezier_values
			slot9 = progress
			local progress_smooth = slot6(slot7, slot8)
			slot7 = self._vel_overshot
			slot8 = math
			slot8 = slot8.lerp
			slot10 = trans_data.start_yaw_neg
			slot11 = trans_data.end_yaw_neg
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.yaw_neg = slot8
			slot7 = self._vel_overshot
			slot8 = math
			slot8 = slot8.lerp
			slot10 = trans_data.start_yaw_pos
			slot11 = trans_data.end_yaw_pos
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.yaw_pos = slot8
			slot7 = self._vel_overshot
			slot8 = math
			slot8 = slot8.lerp
			slot10 = trans_data.start_pitch_neg
			slot11 = trans_data.end_pitch_neg
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.pitch_neg = slot8
			slot7 = self._vel_overshot
			slot8 = math
			slot8 = slot8.lerp
			slot10 = trans_data.start_pitch_pos
			slot11 = trans_data.end_pitch_pos
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.pitch_pos = slot8
			slot7 = mvector3
			slot7 = slot7.lerp
			slot9 = self._vel_overshot
			slot9 = slot9.pivot
			slot10 = trans_data.start_pivot
			slot11 = trans_data.end_pivot
			slot12 = progress_smooth

			slot7(slot8, slot9, slot10, slot11)
		end
	end

	slot5 = self
	slot3 = self._calculate_soft_velocity_overshot
	slot6 = dt

	slot3(slot4, slot5)

	slot3 = self._fov
	slot3 = slot3.transition

	if slot3 then
		slot3 = self._fov
		local trans_data = slot3.transition
		slot4 = trans_data.start_t
		local elapsed_t = t - slot4
		slot5 = trans_data.duration

		if slot5 < elapsed_t then
			slot5 = self._fov
			slot6 = trans_data.end_fov
			slot5.fov = slot6
			slot5 = self._fov
			slot6 = nil
			slot5.transition = slot6
		else
			slot5 = trans_data.duration
			local progress = elapsed_t / slot5
			slot6 = math
			slot6 = slot6.max
			slot8 = math
			slot8 = slot8.min
			slot10 = math
			slot10 = slot10.bezier
			slot12 = bezier_values
			slot13 = progress
			slot10 = slot10(slot11, slot12)
			slot11 = 1
			slot8 = slot8(slot9, slot10)
			slot9 = 0
			local progress_smooth = slot6(slot7, slot8)
			slot7 = self._fov
			slot8 = math
			slot8 = slot8.lerp
			slot10 = trans_data.start_fov
			slot11 = trans_data.end_fov
			slot12 = progress_smooth
			slot8 = slot8(slot9, slot10, slot11)
			slot7.fov = slot8
		end

		slot5 = self._fov
		slot6 = true
		slot5.dirty = slot6
	end

	return 
end

slot19._update_stance = slot20
slot19 = Rotation
local mrot1 = slot19()
slot20 = Rotation
local mrot2 = slot20()
slot21 = Rotation
local mrot3 = slot21()
slot22 = Rotation
local mrot4 = slot22()
slot23 = Vector3
local mvec1 = slot23()
slot24 = Vector3
local mvec2 = slot24()
slot25 = Vector3
local mvec3 = slot25()
slot26 = Vector3
local mvec4 = slot26()
slot27 = FPCameraPlayerBase

function slot28(self, t, dt)

	-- Decompilation error in this vicinity:
	slot3 = self._force_rotation2

	if slot3 then
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.camera
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.set_rotation
		slot6 = self._force_rotation2

		slot3(slot4, slot5)

		slot3 = self._output_data
		slot4 = self._force_rotation2
		slot3.rotation = slot4
		slot3 = nil
		self._force_rotation2 = slot3

		return 
	end

	slot3 = self._previous_direction

	if not slot3 then
		slot3 = mvector3
		slot3 = slot3.copy
		slot5 = self._parent_unit
		slot7 = slot5
		slot5 = slot5.camera
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.forward
		slot3 = slot3(slot5(slot6))
		self._previous_direction = slot3
	end

	slot3 = mvector3
	slot3 = slot3.copy
	slot5 = self._parent_unit
	slot7 = slot5
	slot5 = slot5.camera
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.forward
	local current_direction = slot3(slot5(slot6))
	slot4 = mvector3
	slot4 = slot4.angle
	slot6 = current_direction
	slot7 = self._previous_direction
	slot4 = slot4(slot5, slot6)
	slot4 = slot4 / dt
	self._movement_speed = slot4
	self._previous_direction = current_direction
	local data = self._camera_properties
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2
	slot9 = self._parent_unit
	slot11 = slot9
	slot9 = slot9.m_position
	slot12 = new_head_pos

	slot9(slot10, slot11)

	slot9 = mvector3
	slot9 = slot9.add
	slot11 = new_head_pos
	slot12 = self._head_stance
	slot12 = slot12.translation

	slot9(slot10, slot11)

	local stick_input_x = 0
	local stick_input_y = 0
	slot13 = self
	slot11 = self._get_aim_assist
	slot14 = t
	slot15 = dt
	slot16 = self._tweak_data
	slot16 = slot16.aim_assist_snap_speed
	slot17 = self._aim_assist
	local aim_assist_x, aim_assist_y = slot11(slot12, slot13, slot14, slot15, slot16)
	slot15 = self
	slot13 = self._update_view_kick_vector
	slot16 = t
	slot17 = dt
	local recoil_x, recoil_y = slot13(slot14, slot15, slot16)
	slot15 = stick_input_x + aim_assist_x
	stick_input_x = slot15 + recoil_x
	slot15 = stick_input_y + aim_assist_y
	stick_input_y = slot15 + recoil_y
	slot15 = data.spin
	local look_polar_spin = slot15 - stick_input_x
	slot16 = math
	slot16 = slot16.clamp
	slot18 = data.pitch
	slot18 = slot18 + stick_input_y
	slot19 = FPCameraPlayerBase
	slot19 = slot19.MAX_PITCH
	slot19 = -slot19
	slot20 = FPCameraPlayerBase
	slot20 = slot20.MAX_PITCH
	local look_polar_pitch = slot16(slot17, slot18, slot19)
	slot17 = self._limits
	slot17 = Polar
	slot19 = 1
	slot20 = look_polar_pitch
	slot21 = look_polar_spin
	local look_polar = slot17(slot18, slot19, slot20)
	slot20 = look_polar
	slot18 = look_polar.to_vector
	local look_vec = slot18(slot19)
	local cam_offset_rot = mrot3
	slot20 = mrotation
	slot20 = slot20.set_look_at
	slot22 = cam_offset_rot
	slot23 = look_vec
	slot24 = math
	slot24 = slot24.UP

	slot20(slot21, slot22, slot23)

	slot20 = mrotation
	slot20 = slot20.set_zero
	slot22 = new_head_rot

	slot20(slot21)

	slot20 = mrotation
	slot20 = slot20.multiply
	slot22 = new_head_rot
	slot23 = self._head_stance
	slot23 = slot23.rotation

	slot20(slot21, slot22)

	slot20 = mrotation
	slot20 = slot20.multiply
	slot22 = new_head_rot
	slot23 = cam_offset_rot

	slot20(slot21, slot22)

	data.pitch = look_polar_pitch
	data.spin = look_polar_spin
	slot20 = self._output_data
	slot20.position = new_head_pos
	slot20 = self._output_data

	if not new_head_rot then
		slot21 = self._output_data
		slot21 = slot21.rotation
	end

	slot20.rotation = slot21
	slot20 = self._camera_properties
	slot20 = slot20.current_tilt
	slot21 = self._camera_properties
	slot21 = slot21.target_tilt

	if slot20 ~= slot21 then
		slot20 = self._camera_properties
		slot21 = math
		slot21 = slot21.step
		slot23 = self._camera_properties
		slot23 = slot23.current_tilt
		slot24 = self._camera_properties
		slot24 = slot24.target_tilt
		slot25 = 150 * dt
		slot21 = slot21(slot22, slot23, slot24)
		slot20.current_tilt = slot21
	end

	slot20 = self._camera_properties
	slot20 = slot20.current_tilt

	if slot20 ~= 0 then
		slot20 = self._output_data
		slot21 = Rotation
		slot23 = self._output_data
		slot23 = slot23.rotation
		slot25 = slot23
		slot23 = slot23.yaw
		slot23 = slot23(slot24)
		slot24 = self._output_data
		slot24 = slot24.rotation
		slot26 = slot24
		slot24 = slot24.pitch
		slot24 = slot24(slot25)
		slot25 = self._output_data
		slot25 = slot25.rotation
		slot27 = slot25
		slot25 = slot25.roll
		slot25 = slot25(slot26)
		slot26 = self._camera_properties
		slot26 = slot26.current_tilt
		slot25 = slot25 + slot26
		slot21 = slot21(slot22, slot23, slot24)
		slot20.rotation = slot21
	end

	slot20 = mvector3
	slot20 = slot20.set
	slot22 = new_shoulder_pos
	slot23 = self._shoulder_stance
	slot23 = slot23.translation

	slot20(slot21, slot22)

	slot20 = mvector3
	slot20 = slot20.add
	slot22 = new_shoulder_pos
	slot23 = self._vel_overshot
	slot23 = slot23.translation

	slot20(slot21, slot22)

	slot20 = mvector3
	slot20 = slot20.rotate_with
	slot22 = new_shoulder_pos
	slot23 = self._output_data
	slot23 = slot23.rotation

	slot20(slot21, slot22)

	slot20 = mvector3
	slot20 = slot20.add
	slot22 = new_shoulder_pos
	slot23 = new_head_pos

	slot20(slot21, slot22)

	slot20 = mrotation
	slot20 = slot20.set_zero
	slot22 = new_shoulder_rot

	slot20(slot21)

	slot20 = mrotation
	slot20 = slot20.multiply
	slot22 = new_shoulder_rot
	slot23 = self._output_data
	slot23 = slot23.rotation

	slot20(slot21, slot22)

	slot20 = mrotation
	slot20 = slot20.multiply
	slot22 = new_shoulder_rot
	slot23 = self._shoulder_stance
	slot23 = slot23.rotation

	slot20(slot21, slot22)

	slot20 = mrotation
	slot20 = slot20.multiply
	slot22 = new_shoulder_rot
	slot23 = self._vel_overshot
	slot23 = slot23.rotation

	slot20(slot21, slot22)

	slot22 = self
	slot20 = self.set_position
	slot23 = new_shoulder_pos

	slot20(slot21, slot22)

	slot22 = self
	slot20 = self.set_rotation
	slot23 = new_shoulder_rot

	slot20(slot21, slot22)

	return 
end

slot27._update_movement = slot28
slot27 = FPCameraPlayerBase

function slot28(self, rot)
	self._force_rotation = rot
	self._force_rotation2 = rot

	return 
end

slot27.force_rot = slot28
slot27 = Vector3
local mvec1 = slot27()
slot28 = FPCameraPlayerBase

function slot29(self, axis, unscaled_axis)

	-- Decompilation error in this vicinity:
	slot3 = self._force_rotation

	if slot3 then
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.camera
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.set_rotation
		slot6 = self._force_rotation

		slot3(slot4, slot5)

		slot3 = self._output_data
		slot4 = self._force_rotation
		slot3.rotation = slot4
		slot3 = self._force_rotation
		slot5 = slot3
		slot3 = slot3.y
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.to_polar
		local forward_polar = slot3(slot4)
		slot4 = self._camera_properties
		slot5 = forward_polar.spin
		slot4.spin = slot5
		slot4 = self._camera_properties
		slot5 = forward_polar.pitch
		slot4.pitch = slot5
		slot4 = nil
		self._force_rotation = slot4

		return 
	end

	slot3 = self._animate_pitch

	if slot3 then
		slot5 = self
		slot3 = self.animate_pitch_upd

		slot3(slot4)
	end

	slot5 = managers.player
	slot5 = managers.player.player_timer(slot4)
	local t = managers.player.player_timer(slot4).time(slot4)
	local dt = t - (self._last_rot_t or t)
	self._last_rot_t = t
	local data = self._camera_properties
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2
	slot13 = new_head_pos

	self._parent_unit.m_position(slot11, self._parent_unit)

	slot12 = managers.player
	slot10 = managers.player.current_state(slot11)

	if slot10 ~= "turret" then
		slot10 = mvector3
		slot10 = slot10.add
		slot12 = new_head_pos
		slot13 = self._head_stance
		slot13 = slot13.translation

		slot10(slot11, slot12)
	end

	slot10 = self._input
	slot10.look = axis
	slot10 = self._input
	slot11 = self._parent_unit
	slot13 = slot11
	slot11 = slot11.base
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.controller
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.get_setup
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.get_connection
	slot14 = "look"
	slot11 = slot11(slot12, slot13)
	slot13 = slot11
	slot11 = slot11.get_multiplier
	slot11 = slot11(slot12)
	slot10.look_multiplier = slot11
	slot10 = self._look_function
	slot12 = axis
	slot13 = self._input
	slot13 = slot13.look_multiplier
	slot14 = dt
	slot15 = unscaled_axis
	local stick_input_x, stick_input_y = slot10(slot11, slot12, slot13, slot14)
	local multiplier = 1
	slot13 = self._parent_unit
	slot15 = slot13
	slot13 = slot13.movement
	slot13 = slot13(slot14)
	slot13 = slot13._current_state
	slot15 = slot13
	slot13 = slot13.in_steelsight
	slot13 = slot13(slot14)

	if slot13 then
		slot13 = managers
		slot13 = slot13.player
		slot15 = slot13
		slot13 = slot13.player_unit
		slot13 = slot13(slot14)
		slot15 = slot13
		slot13 = slot13.movement
		slot13 = slot13(slot14)
		slot15 = slot13
		slot13 = slot13.current_state
		slot13 = slot13(slot14)
		slot13 = slot13._equipped_unit
		slot15 = slot13
		slot13 = slot13.base
		local equipped_unit_base = slot13(slot14)

		if equipped_unit_base then
			slot14 = equipped_unit_base.get_name_id

			if slot14 then
				slot14 = equipped_unit_base.get_reticle_obj

				if slot14 then
					slot16 = equipped_unit_base
					slot14 = equipped_unit_base.get_reticle_obj
					slot14 = slot14(slot15)

					if slot14 then
						slot16 = equipped_unit_base
						slot14 = equipped_unit_base.get_name_id
						local weapon_id = slot14(slot15)
						slot15 = tweak_data
						slot15 = slot15.player
						slot15 = slot15.stances
						slot15 = slot15[weapon_id]

						if not slot15 then
							slot15 = tweak_data
							slot15 = slot15.player
							slot15 = slot15.stances
							local stances = slot15.default
						end

						slot16 = stances.steelsight
						slot16 = slot16.camera_sensitivity_multiplier

						if not slot16 then
						end
					end
				end
			end
		end
	end

	slot15 = self
	slot13 = self._get_aim_assist_look_multiplier
	slot13 = slot13(slot14)
	slot13 = stick_input_x * slot13
	stick_input_x = slot13 * multiplier
	slot15 = self
	slot13 = self._get_aim_assist_look_multiplier
	slot13 = slot13(slot14)
	slot13 = stick_input_y * slot13
	stick_input_y = slot13 * multiplier
	slot13 = mvector3
	slot13 = slot13.length
	slot15 = Vector3
	slot17 = stick_input_x
	slot18 = stick_input_y
	slot19 = 0
	slot13 = slot13(slot15(slot16, slot17, slot18))
	self._stick_input_length = slot13
	slot13 = managers
	slot13 = slot13.player
	slot15 = slot13
	slot13 = slot13.current_state
	slot13 = slot13(slot14)

	if slot13 == "turret" then
		slot13 = self._parent_unit
		slot15 = slot13
		slot13 = slot13.movement
		slot13 = slot13(slot14)
		local current_State = slot13._current_state
		slot14 = current_State.get_camera_speed_limit

		if slot14 then
			slot16 = current_State
			slot14 = current_State.get_camera_speed_limit
			local camera_speed_limit = slot14(slot15)
		end

		if camera_speed_limit then
			slot15 = math
			slot15 = slot15.clamp
			slot17 = stick_input_x
			slot18 = -camera_speed_limit
			slot19 = camera_speed_limit
			slot15 = slot15(slot16, slot17, slot18)
			stick_input_x = slot15
			slot15 = math
			slot15 = slot15.clamp
			slot17 = stick_input_y
			slot18 = -camera_speed_limit
			slot19 = camera_speed_limit
			slot15 = slot15(slot16, slot17, slot18)
			stick_input_y = slot15
		end
	end

	slot13 = data.spin
	local look_polar_spin = slot13 - stick_input_x
	slot14 = math
	slot14 = slot14.clamp
	slot16 = data.pitch
	slot16 = slot16 + stick_input_y
	slot17 = FPCameraPlayerBase
	slot17 = slot17.MAX_PITCH
	slot17 = -slot17
	slot18 = FPCameraPlayerBase
	slot18 = slot18.MAX_PITCH
	local look_polar_pitch = slot14(slot15, slot16, slot17)
	slot15 = managers
	slot15 = slot15.player
	slot17 = slot15
	slot15 = slot15.current_state
	local player_state = slot15(slot16)

	if player_state == "turret" then
		slot16 = self._limits

		if not slot16 then
			slot18 = managers.player
			self._turret_unit = managers.player.get_turret_unit(slot17)
			slot18 = managers.player
			slot18 = managers.player.get_turret_unit(slot17)
			slot18 = managers.player.get_turret_unit(slot17).weapon(slot17)
			local turret_weapon_name = managers.player.get_turret_unit(slot17).weapon(slot17).get_name_id(slot17)
			local spin = tweak_data.weapon[turret_weapon_name].camera_limit_horizontal or 45
			local pitch = tweak_data.weapon[turret_weapon_name].camera_limit_vertical or 30
			slot21 = self._turret_unit
			slot21 = self._turret_unit.rotation(slot20)
			slot21 = self._turret_unit.rotation(slot20).y(slot20)
			local mid_spin = (self._turret_unit.rotation(slot20).y(slot20).to_polar(slot20).spin + 360) % 360
			local mid_pitch = tweak_data.weapon[turret_weapon_name].camera_limit_vertical_mid or 0
			slot23 = self
			slot21 = self.set_limits
			slot24 = spin
			slot25 = pitch
			slot26 = mid_spin
			slot27 = mid_pitch

			slot21(slot22, slot23, slot24, slot25, slot26)
		end
	end

	slot16 = self._limits

	if slot16 then
		slot16 = self._limits
		slot16 = slot16.spin

		if slot16 then
			local angle = look_polar_spin
			slot17 = self._limits
			slot17 = slot17.spin
			local mid = slot17.mid
			slot18 = math
			slot18 = slot18.abs
			slot20 = mid - angle
			slot18 = slot18(slot19)
			local dist_angle_to_mid = slot18 % 360
			slot19 = 180

			if slot19 < dist_angle_to_mid then
				dist_angle_to_mid = 360 - dist_angle_to_mid
			end

			slot19 = self._limits
			slot19 = slot19.spin
			slot19 = slot19.offset
			local d = dist_angle_to_mid / slot19
			slot20 = math
			slot20 = slot20.clamp
			slot22 = d
			slot23 = -1
			slot24 = 1
			slot20 = slot20(slot21, slot22, slot23)
			d = slot20
			slot20 = data.spin
			slot21 = math
			slot21 = slot21.lerp
			slot23 = stick_input_x
			slot24 = 0
			slot25 = math
			slot25 = slot25.abs
			slot27 = d
			slot21 = slot21(slot22, slot23, slot25(slot26))
			look_polar_spin = slot20 - slot21
		end

		slot16 = self._limits
		slot16 = slot16.pitch

		if slot16 then
			local angle = look_polar_pitch
			slot17 = self._limits
			slot17 = slot17.pitch
			local mid = slot17.mid
			slot18 = math
			slot18 = slot18.abs
			slot20 = mid - angle
			slot18 = slot18(slot19)
			local dist_angle_to_mid = slot18 % 360
			slot19 = 180

			if slot19 < dist_angle_to_mid then
				dist_angle_to_mid = 360 - dist_angle_to_mid
			end

			slot19 = self._limits
			slot19 = slot19.pitch
			slot19 = slot19.offset
			local d = dist_angle_to_mid / slot19
			slot20 = math
			slot20 = slot20.clamp
			slot22 = d
			slot23 = -1
			slot24 = 1
			slot20 = slot20(slot21, slot22, slot23)
			d = slot20
			slot20 = data.pitch
			slot21 = math
			slot21 = slot21.lerp
			slot23 = stick_input_y
			slot24 = 0
			slot25 = math
			slot25 = slot25.abs
			slot27 = d
			slot21 = slot21(slot22, slot23, slot25(slot26))
			look_polar_pitch = slot20 + slot21
			slot20 = math
			slot20 = slot20.clamp
			slot22 = look_polar_pitch
			slot23 = FPCameraPlayerBase
			slot23 = slot23.MAX_PITCH
			slot23 = -slot23
			slot24 = FPCameraPlayerBase
			slot24 = slot24.MAX_PITCH
			slot20 = slot20(slot21, slot22, slot23)
			look_polar_pitch = slot20
		end
	end

	slot16 = self._limits
	slot16 = Polar
	slot18 = 1
	slot19 = look_polar_pitch
	slot20 = look_polar_spin
	local look_polar = slot16(slot17, slot18, slot19)
	slot19 = look_polar
	slot17 = look_polar.to_vector
	local look_vec = slot17(slot18)
	local cam_offset_rot = mrot3
	slot19 = mrotation
	slot19 = slot19.set_look_at
	slot21 = cam_offset_rot
	slot22 = look_vec
	slot23 = math
	slot23 = slot23.UP

	slot19(slot20, slot21, slot22)

	slot19 = self._animate_pitch

	if slot19 == nil then
		slot19 = mrotation
		slot19 = slot19.set_zero
		slot21 = new_head_rot

		slot19(slot20)

		slot19 = mrotation
		slot19 = slot19.multiply
		slot21 = new_head_rot
		slot22 = self._head_stance
		slot22 = slot22.rotation

		slot19(slot20, slot21)

		slot19 = mrotation
		slot19 = slot19.multiply
		slot21 = new_head_rot
		slot22 = cam_offset_rot

		slot19(slot20, slot21)

		data.pitch = look_polar_pitch
		data.spin = look_polar_spin
	end

	slot19 = self._output_data
	slot19.position = new_head_pos
	slot19 = self._camera_properties
	slot19 = slot19.camera_offset

	if slot19 then
		slot19 = mvector3
		slot19 = slot19.set
		slot21 = mvec4
		slot22 = self._camera_properties
		slot22 = slot22.camera_offset

		slot19(slot20, slot21)

		slot19 = mvector3
		slot19 = slot19.rotate_with
		slot21 = mvec4
		slot22 = Rotation
		slot24 = self._output_data
		slot24 = slot24.rotation
		slot26 = slot24
		slot24 = slot24.yaw
		slot24 = slot24(slot25)
		slot25 = 0
		slot26 = 0

		slot19(slot20, slot22(slot23, slot24, slot25))

		slot19 = mvector3
		slot19 = slot19.add
		slot21 = self._output_data
		slot21 = slot21.position
		slot22 = mvec4

		slot19(slot20, slot21)
	end

	slot19 = self._parachute_exit

	if slot19 then
		slot19 = false
		self._parachute_exit = slot19
		slot19 = self._output_data
		slot20 = self._parent_unit
		slot22 = slot20
		slot20 = slot20.movement
		slot20 = slot20(slot21)
		slot20 = slot20.fall_rotation
		slot19.rotation = slot20
		slot19 = mrotation
		slot19 = slot19.multiply
		slot21 = self._output_data
		slot21 = slot21.rotation
		slot22 = self._parent_unit
		slot24 = slot22
		slot22 = slot22.camera
		slot22 = slot22(slot23)
		slot24 = slot22
		slot22 = slot22.rotation

		slot19(slot20, slot22(slot23))

		slot19 = self._output_data
		slot19 = slot19.rotation
		slot21 = slot19
		slot19 = slot19.y
		slot19 = slot19(slot20)
		slot21 = slot19
		slot19 = slot19.to_polar
		slot19 = slot19(slot20)
		slot19 = slot19.spin
		data.spin = slot19
	else
		slot19 = self._output_data

		if not new_head_rot then
			slot20 = self._output_data
			slot20 = slot20.rotation
		end

		slot19.rotation = slot20
	end

	slot19 = self._camera_properties
	slot19 = slot19.current_tilt
	slot20 = self._camera_properties
	slot20 = slot20.target_tilt

	if slot19 ~= slot20 then
		slot19 = self._camera_properties
		slot20 = math
		slot20 = slot20.step
		slot22 = self._camera_properties
		slot22 = slot22.current_tilt
		slot23 = self._camera_properties
		slot23 = slot23.target_tilt
		slot24 = 150 * dt
		slot20 = slot20(slot21, slot22, slot23)
		slot19.current_tilt = slot20
	end

	slot19 = self._camera_properties
	slot19 = slot19.current_tilt

	if slot19 ~= 0 then
		slot19 = self._output_data
		slot20 = Rotation
		slot22 = self._output_data
		slot22 = slot22.rotation
		slot24 = slot22
		slot22 = slot22.yaw
		slot22 = slot22(slot23)
		slot23 = self._output_data
		slot23 = slot23.rotation
		slot25 = slot23
		slot23 = slot23.pitch
		slot23 = slot23(slot24)
		slot24 = self._output_data
		slot24 = slot24.rotation
		slot26 = slot24
		slot24 = slot24.roll
		slot24 = slot24(slot25)
		slot25 = self._camera_properties
		slot25 = slot25.current_tilt
		slot24 = slot24 + slot25
		slot20 = slot20(slot21, slot22, slot23)
		slot19.rotation = slot20
	end

	slot19 = self._parent_unit
	slot21 = slot19
	slot19 = slot19.inventory
	slot19 = slot19(slot20)
	slot21 = slot19
	slot19 = slot19.equipped_unit
	local equipped_weapon = slot19(slot20)
	slot20 = Vector3
	slot22 = 0
	slot23 = 0
	slot24 = 0
	local bipod_weapon_translation = slot20(slot21, slot22, slot23)

	if equipped_weapon then
		slot23 = equipped_weapon
		slot21 = equipped_weapon.base
		slot21 = slot21(slot22)

		if slot21 then
			slot23 = equipped_weapon
			slot21 = equipped_weapon.base
			slot21 = slot21(slot22)
			slot23 = slot21
			slot21 = slot21.weapon_tweak_data
			local weapon_tweak_data = slot21(slot22)

			if weapon_tweak_data then
				slot22 = weapon_tweak_data.bipod_weapon_translation

				if slot22 then
					bipod_weapon_translation = weapon_tweak_data.bipod_weapon_translation
				end
			end
		end
	end

	slot21 = Vector3
	slot23 = 0
	slot24 = 0
	slot25 = 0
	local bipod_pos = slot21(slot22, slot23, slot24)
	local bipod_rot = new_shoulder_rot
	slot23 = mvector3
	slot23 = slot23.set
	slot25 = bipod_pos
	slot26 = bipod_weapon_translation

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.rotate_with
	slot25 = bipod_pos
	slot26 = self._output_data
	slot26 = slot26.rotation

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.add
	slot25 = bipod_pos
	slot26 = new_head_pos

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.set
	slot25 = new_shoulder_pos
	slot26 = self._shoulder_stance
	slot26 = slot26.translation

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.add
	slot25 = new_shoulder_pos
	slot26 = self._vel_overshot
	slot26 = slot26.translation

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.rotate_with
	slot25 = new_shoulder_pos
	slot26 = self._output_data
	slot26 = slot26.rotation

	slot23(slot24, slot25)

	slot23 = mvector3
	slot23 = slot23.add
	slot25 = new_shoulder_pos
	slot26 = new_head_pos

	slot23(slot24, slot25)

	slot23 = mrotation
	slot23 = slot23.set_zero
	slot25 = new_shoulder_rot

	slot23(slot24)

	slot23 = mrotation
	slot23 = slot23.multiply
	slot25 = new_shoulder_rot
	slot26 = self._output_data
	slot26 = slot26.rotation

	slot23(slot24, slot25)

	slot23 = mrotation
	slot23 = slot23.multiply
	slot25 = new_shoulder_rot
	slot26 = self._shoulder_stance
	slot26 = slot26.rotation

	slot23(slot24, slot25)

	slot23 = mrotation
	slot23 = slot23.multiply
	slot25 = new_shoulder_rot
	slot26 = self._vel_overshot
	slot26 = slot26.rotation

	slot23(slot24, slot25)

	if player_state == "bipod" then
		slot24 = self._parent_unit
		slot26 = slot24
		slot24 = slot24.movement
		slot24 = slot24(slot25)
		slot24 = slot24._current_state
		slot26 = slot24
		slot24 = slot24.in_steelsight
		slot24 = slot24(slot25)
	else
		slot24 = self._parent_unit
		slot26 = slot24
		slot24 = slot24.movement
		slot24 = slot24(slot25)
		slot24 = slot24._current_state
		slot26 = slot24
		slot24 = slot24.in_steelsight
		slot24 = slot24(slot25)

		if not slot24 then
			slot24 = PlayerBipod
			slot26 = slot24
			slot24 = slot24.set_camera_positions
			slot27 = bipod_pos
			slot28 = self._output_data
			slot28 = slot28.position

			slot24(slot25, slot26, slot27)
		end
	end

	return 
end

slot28._update_rot = slot29
slot28 = FPCameraPlayerBase

function slot29(self, t, p0, p1, p2, p3)
	slot6 = 2 * p1
	slot7 = -p0
	slot7 = slot7 + p2
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot7 = 2 * p0
	slot8 = 5 * p1
	slot7 = slot7 - slot8
	slot8 = 4 * p2
	slot7 = slot7 + slot8
	slot7 = slot7 - p3
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot7 = -p0
	slot8 = 3 * p1
	slot7 = slot7 + slot8
	slot8 = 3 * p2
	slot7 = slot7 - slot8
	slot7 = slot7 + p3
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot6 = 0.5 * slot6

	return slot6
end

slot28.catmullrom = slot29
slot28 = FPCameraPlayerBase

function slot29(self)
	slot1 = managers
	slot1 = slot1.player
	slot3 = slot1
	slot1 = slot1.get_vehicle
	local vehicle_data = slot1(slot2)

	if not vehicle_data then
		return 
	end

	local vehicle_unit = vehicle_data.vehicle_unit
	slot3 = alive
	slot5 = vehicle_unit
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot5 = vehicle_unit
	slot3 = vehicle_unit.vehicle
	local vehicle = slot3(slot4)
	slot6 = vehicle_unit
	slot4 = vehicle_unit.vehicle_driving
	local vehicle_ext = slot4(slot5)
	slot7 = vehicle_ext
	slot5 = vehicle_ext.find_seat_for_player
	slot8 = managers
	slot8 = slot8.player
	slot10 = slot8
	slot8 = slot8.player_unit
	local seat = slot5(slot6, slot8(slot9))
	slot8 = vehicle_ext
	slot6 = vehicle_ext.get_object_placement
	slot9 = managers
	slot9 = slot9.player
	slot11 = slot9
	slot9 = slot9.local_player
	local obj_pos, obj_rot = slot6(slot7, slot9(slot10))

	if obj_pos == nil or obj_rot == nil then
		return 
	end

	slot8 = managers
	slot8 = slot8.player
	slot10 = slot8
	slot8 = slot8.local_player
	slot8 = slot8(slot9)
	slot10 = slot8
	slot8 = slot8.movement
	slot8 = slot8(slot9)
	slot10 = slot8
	slot8 = slot8.current_state
	slot8 = slot8(slot9)
	slot10 = slot8
	slot8 = slot8.stance
	local stance = slot8(slot9)
	slot9 = PlayerDriving
	slot9 = slot9.STANCE_SHOOTING

	if stance == slot9 then
		slot9 = mvector3
		slot9 = slot9.add
		slot11 = obj_pos
		slot12 = seat.shooting_pos
		slot14 = slot12
		slot12 = slot12.rotate_with
		slot17 = vehicle
		slot15 = vehicle.rotation

		slot9(slot10, slot12(slot13, slot15(slot16)))
	end

	local camera_rot = mrot3
	slot10 = mrotation
	slot10 = slot10.set_zero
	slot12 = camera_rot

	slot10(slot11)

	slot10 = mrotation
	slot10 = slot10.multiply
	slot12 = camera_rot
	slot13 = obj_rot

	slot10(slot11, slot12)

	slot10 = mrotation
	slot10 = slot10.multiply
	slot12 = camera_rot
	slot13 = self._output_data
	slot13 = slot13.rotation

	slot10(slot11, slot12)

	local hands_rot = mrot4
	slot11 = mrotation
	slot11 = slot11.set_zero
	slot13 = hands_rot

	slot11(slot12)

	slot11 = mrotation
	slot11 = slot11.multiply
	slot13 = hands_rot
	slot14 = obj_rot

	slot11(slot12, slot13)

	slot11 = Vector3
	slot13 = 0
	slot14 = 0
	slot15 = 0
	local target = slot11(slot12, slot13, slot14)
	slot12 = Vector3
	slot14 = 0
	slot15 = 0
	slot16 = 0
	local target_camera = slot12(slot13, slot14, slot15)
	slot13 = vehicle_ext._tweak_data
	slot13 = slot13.driver_camera_offset

	if slot13 then
		slot13 = vehicle_ext._tweak_data
		slot13 = slot13.driver_camera_offset
		target_camera = target_camera + slot13
	end

	slot13 = mvector3
	slot13 = slot13.rotate_with
	slot15 = target
	slot18 = vehicle
	slot16 = vehicle.rotation

	slot13(slot14, slot16(slot17))

	slot13 = mvector3
	slot13 = slot13.rotate_with
	slot15 = target_camera
	slot18 = vehicle
	slot16 = vehicle.rotation

	slot13(slot14, slot16(slot17))

	local pos = obj_pos + target
	local camera_pos = obj_pos + target_camera
	slot15 = seat.driving

	if slot15 then
		slot17 = vehicle_unit
		slot15 = vehicle_unit.camera
		slot15 = slot15(slot16)

		if slot15 then
			slot17 = vehicle_unit
			slot15 = vehicle_unit.camera
			slot15 = slot15(slot16)
			slot17 = slot15
			slot15 = slot15.update_camera

			slot15(slot16)
		end

		slot17 = self
		slot15 = self.set_position
		slot18 = pos

		slot15(slot16, slot17)

		slot17 = self
		slot15 = self.set_rotation
		slot18 = hands_rot

		slot15(slot16, slot17)

		slot15 = self._parent_unit
		slot17 = slot15
		slot15 = slot15.camera
		slot15 = slot15(slot16)
		slot17 = slot15
		slot15 = slot15.set_position
		slot18 = camera_pos

		slot15(slot16, slot17)

		slot15 = self._parent_unit
		slot17 = slot15
		slot15 = slot15.camera
		slot15 = slot15(slot16)
		slot17 = slot15
		slot15 = slot15.set_rotation
		slot18 = camera_rot

		slot15(slot16, slot17)
	else
		local shoulder_pos = mvec3
		local shoulder_rot = mrot4
		slot17 = mrotation
		slot17 = slot17.set_zero
		slot19 = shoulder_rot

		slot17(slot18)

		slot17 = mrotation
		slot17 = slot17.multiply
		slot19 = shoulder_rot
		slot20 = camera_rot

		slot17(slot18, slot19)

		slot17 = mrotation
		slot17 = slot17.multiply
		slot19 = shoulder_rot
		slot20 = self._shoulder_stance
		slot20 = slot20.rotation

		slot17(slot18, slot19)

		slot17 = mrotation
		slot17 = slot17.multiply
		slot19 = shoulder_rot
		slot20 = self._vel_overshot
		slot20 = slot20.rotation

		slot17(slot18, slot19)

		slot17 = mvector3
		slot17 = slot17.set
		slot19 = shoulder_pos
		slot20 = self._shoulder_stance
		slot20 = slot20.translation

		slot17(slot18, slot19)

		slot17 = mvector3
		slot17 = slot17.add
		slot19 = shoulder_pos
		slot20 = self._vel_overshot
		slot20 = slot20.translation

		slot17(slot18, slot19)

		slot17 = mvector3
		slot17 = slot17.rotate_with
		slot19 = shoulder_pos
		slot20 = camera_rot

		slot17(slot18, slot19)

		slot17 = mvector3
		slot17 = slot17.add
		slot19 = shoulder_pos
		slot20 = pos

		slot17(slot18, slot19)

		slot19 = self
		slot17 = self.set_position
		slot20 = shoulder_pos

		slot17(slot18, slot19)

		slot19 = self
		slot17 = self.set_rotation
		slot20 = shoulder_rot

		slot17(slot18, slot19)

		slot17 = self._parent_unit
		slot19 = slot17
		slot17 = slot17.camera
		slot17 = slot17(slot18)
		slot19 = slot17
		slot17 = slot17.set_position
		slot20 = pos

		slot17(slot18, slot19)

		slot17 = self._parent_unit
		slot19 = slot17
		slot17 = slot17.camera
		slot17 = slot17(slot18)
		slot19 = slot17
		slot17 = slot17.set_rotation
		slot20 = camera_rot

		slot17(slot18, slot19)
	end

	return 
end

slot28._set_camera_position_in_vehicle = slot29
slot28 = FPCameraPlayerBase

function slot29(self, t, dt, speed, aim_data)
	slot5 = aim_data.distance

	if slot5 == 0 then
		slot5 = 0
		slot6 = 0

		return slot5, slot6
	end

	slot5 = math
	slot5 = slot5.step
	slot7 = 0
	slot8 = aim_data.distance
	slot9 = speed * dt
	local s_value = slot5(slot6, slot7, slot8)
	slot6 = mvector3
	slot6 = slot6.x
	slot8 = aim_data.direction
	slot6 = slot6(slot7)
	local r_value_x = slot6 * s_value
	slot7 = mvector3
	slot7 = slot7.y
	slot9 = aim_data.direction
	slot7 = slot7(slot8)
	local r_value_y = slot7 * s_value
	slot8 = aim_data.is_sticky

	if slot8 then
		slot8 = self._tweak_data
		slot8 = slot8.aim_assist_use_sticky_aim

		if slot8 then
			slot11 = (aim_data.distance_to_aim_line or 0) / 100
			local strength = 1 - math.min(slot9, 1)
			local mx = 1 - self._tweak_data.aim_assist_gradient_max
			local mn = 1 - self._tweak_data.aim_assist_gradient_min
			slot14 = mx
			slot18 = (aim_data.target_distance or 0) / self._tweak_data.aim_assist_gradient_max_distance
			local min_strength = math.lerp(slot12, mn, math.min(slot16, 1))
			slot15 = strength - min_strength
			strength = math.max(mn, 0) / (1 - min_strength)
			r_value_x = r_value_x * strength
			r_value_y = r_value_y * strength
		end
	end

	slot8 = aim_data.distance
	slot8 = slot8 - s_value
	aim_data.distance = slot8
	slot8 = aim_data.distance
	slot9 = 0

	if slot8 <= slot9 then
		slot10 = self
		slot8 = self._stop_aim_assist
		slot11 = aim_data

		slot8(slot9, slot10)
	end

	slot8 = r_value_x
	slot9 = r_value_y

	return slot8, slot9
end

slot28._get_aim_assist = slot29
slot28 = FPCameraPlayerBase

function slot29(self)
	slot1 = self._aim_assist_look_multiplier

	if not slot1 then
		slot1 = 1

		return slot1
	end

	slot1 = self._aim_assist_look_multiplier

	return slot1
end

slot28._get_aim_assist_look_multiplier = slot29
slot28 = FPCameraPlayerBase

function slot29(self, col_ray)
	slot4 = self
	slot2 = self._get_aim_assist_direction
	slot5 = col_ray
	local yaw, pitch, roll = slot2(slot3, slot4)
	slot5 = mvector3
	slot5 = slot5.length
	slot7 = Vector3
	slot9 = yaw
	slot10 = -pitch
	slot11 = roll
	local distance = slot5(slot7(slot8, slot9, slot10))
	slot6 = managers
	slot6 = slot6.player
	slot8 = slot6
	slot6 = slot6.upgrade_value
	slot9 = "player"
	slot10 = "warcry_aim_assist_radius"
	slot11 = 1
	slot6 = slot6(slot7, slot8, slot9, slot10)
	distance = distance / slot6
	slot6 = self._previous_aim_assist_distance

	if not slot6 then
		self._previous_aim_assist_distance = distance
	end

	slot6 = self._aim_locked

	if slot6 then
		slot6 = distance / 7
		slot6 = slot6 + 0.07
		self._aim_assist_look_multiplier = slot6
		slot6 = tostring
		slot8 = self._stick_input_length
		slot6 = slot6(slot7)
		slot7 = tostring
		slot9 = 0
		slot7 = slot7(slot8)

		if slot6 == slot7 then
			slot6 = 3

			if distance < slot6 then
				slot8 = self
				slot6 = self.clbk_aim_assist
				slot9 = col_ray

				slot6(slot7, slot8)
			end
		end

		slot6 = col_ray.unit
		self._locked_unit = slot6
		slot6 = 10

		if slot6 < distance then
			slot6 = false
			self._aim_locked = slot6
			slot6 = nil
			self._locked_unit = slot6
		end
	else
		slot6 = 6

		if distance < slot6 then
			slot8 = self
			slot6 = self.clbk_aim_assist
			slot9 = col_ray

			slot6(slot7, slot8)

			slot6 = true
			self._aim_locked = slot6
			slot6 = col_ray.unit
			self._locked_unit = slot6
		end

		slot6 = distance / 10
		self._aim_assist_look_multiplier = slot6
		slot6 = self._movement_speed
		slot7 = 1

		if slot7 < slot6 then
			slot6 = self._aim_assist_look_multiplier
			slot7 = math
			slot7 = slot7.sqrt
			slot9 = self._movement_speed
			slot9 = slot9 / 5
			slot7 = slot7(slot8)
			slot6 = slot6 / slot7
			self._aim_assist_look_multiplier = slot6
		end
	end

	self._previous_aim_assist_distance = distance

	return 
end

slot28.calculate_aim_assist_look_multiplier = slot29
slot28 = FPCameraPlayerBase

function slot29(self)
	slot1 = self._locked_unit

	return slot1
end

slot28.locked_unit = slot29
slot28 = FPCameraPlayerBase

function slot29(self)
	slot1 = false
	self._aim_locked = slot1
	slot1 = nil
	self._locked_unit = slot1
	slot1 = 1
	self._aim_assist_look_multiplier = slot1

	return 
end

slot28.reset_aim_assist = slot29
slot28 = FPCameraPlayerBase

function slot29(self, multiplier)
	self._aim_assist_look_multiplier = multiplier

	return 
end

slot28.set_aim_assist_look_multiplier = slot29
local viewkick_multiplier = 12
local recenter_divisor = 16
local max_deflection = 10
local viewkick_velocity = 0
slot32 = Vector3
local viewkick_velocity_vec = slot32()
slot33 = Vector3
local viewkick_delta_vec = slot33()
slot34 = FPCameraPlayerBase

function slot35(self, up, down, left, right, recoil_multiplier)

	-- Decompilation error in this vicinity:
	recoil_multiplier = recoil_multiplier or 1
	slot6 = up * recoil_multiplier
	slot7 = viewkick_multiplier
	up = slot6 * slot7
	slot6 = down * recoil_multiplier
	slot7 = viewkick_multiplier
	down = slot6 * slot7
	slot6 = left * recoil_multiplier
	slot7 = viewkick_multiplier
	left = slot6 * slot7
	slot6 = right * recoil_multiplier
	slot7 = viewkick_multiplier
	right = slot6 * slot7
	slot6 = math
	slot6 = slot6.lerp
	slot8 = left
	slot9 = right
	slot10 = math
	slot10 = slot10.random
	local kick_x = slot6(slot7, slot8, slot10())
	slot7 = math
	slot7 = slot7.lerp
	slot9 = down
	slot10 = up
	slot11 = math
	slot11 = slot11.random
	local kick_y = slot7(slot8, slot9, slot11())
	slot10 = self
	slot8 = self._get_minimum_view_kick
	slot11 = kick_x
	slot12 = 2
	slot13 = recoil_multiplier
	slot8 = slot8(slot9, slot10, slot11, slot12)
	slot9 = math_sqrt2
	kick_x = slot8 / slot9
	slot10 = self
	slot8 = self._get_minimum_view_kick
	slot11 = kick_y
	slot12 = 1
	slot13 = recoil_multiplier
	slot8 = slot8(slot9, slot10, slot11, slot12)
	slot9 = math_sqrt2
	kick_y = slot8 / slot9
	slot8 = mvec3_set
	slot10 = tmp_vec1
	slot11 = self._view_kick
	slot11 = slot11.delta

	slot8(slot9, slot10)

	slot8 = mvec3_norm
	slot10 = tmp_vec1

	slot8(slot9)

	slot8 = math
	slot8 = slot8.sign
	slot10 = tmp_vec1
	slot10 = slot10.x
	local x_delta_sign = slot8(slot9)
	slot9 = math
	slot9 = slot9.sign
	slot11 = tmp_vec1
	slot11 = slot11.y
	local y_delta_sign = slot9(slot10)
	slot10 = self._view_kick
	slot11 = mvec3_norm
	slot13 = self._view_kick
	slot13 = slot13.direction
	slot11 = slot11(slot12)
	slot10.velocity = slot11

	return 
end

slot34.recoil_kick = slot35
slot34 = FPCameraPlayerBase

function slot35(self, kick_value, axis, recoil_multiplier)
	slot4 = managers
	slot4 = slot4.player
	slot6 = slot4
	slot4 = slot4.get_current_state
	local player_state = slot4(slot5)
	slot5 = self._parent_unit
	slot7 = slot5
	slot5 = slot5.inventory
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.equipped_unit
	local weapon = slot5(slot6)
	slot6 = alive
	slot8 = weapon
	slot6 = slot6(slot7)

	if slot6 then
		slot8 = weapon
		slot6 = weapon.base
		slot6 = slot6(slot7)
		slot8 = slot6
		slot6 = slot6.weapon_tweak_data
		slot6 = slot6(slot7)
		local minimum_kick_values = slot6.minimum_view_kick
	end

	if player_state and minimum_kick_values then
		local state_data = player_state._state_data
		slot8 = state_data.in_steelsight

		if slot8 then
			slot8 = state_data.ducking
		else
			slot8 = state_data.in_steelsight

			if slot8 then
				slot8 = "steelsight"
			else
				local state = (state_data.ducking and "crouching") or "standing"
			end
		end

		slot9 = minimum_kick_values[state]

		if slot9 then
			slot9 = minimum_kick_values[state]
			slot9 = slot9[axis]
			slot9 = slot9 * recoil_multiplier
			slot10 = viewkick_multiplier
			local min = slot9 * slot10
			slot10 = math
			slot10 = slot10.max
			slot12 = math
			slot12 = slot12.abs
			slot14 = kick_value
			slot12 = slot12(slot13)
			slot13 = min
			slot10 = slot10(slot11, slot12)
			slot11 = math
			slot11 = slot11.sign
			slot13 = kick_value
			slot11 = slot11(slot12)
			slot10 = slot10 * slot11

			return slot10
		end
	end

	return kick_value
end

slot34._get_minimum_view_kick = slot35
slot34 = FPCameraPlayerBase

function slot35(self)
	local view_kick_center_speed = 500
	slot2 = self._parent_unit
	slot4 = slot2
	slot2 = slot2.inventory
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.equipped_unit
	local weapon = slot2(slot3)
	slot3 = alive
	slot5 = weapon
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = weapon
		slot3 = weapon.base
		slot3 = slot3(slot4)
		slot3 = slot3.is_melee_weapon
	else
		return view_kick_center_speed
	end

	return 
end

slot34._get_view_kick_center_acceleration = slot35
slot34 = FPCameraPlayerBase

function slot35(self, t, dt)
	slot3 = managers
	slot3 = slot3.player
	slot5 = slot3
	slot3 = slot3.current_state
	local player_state = slot3(slot4)

	if player_state == "bipod" then
		slot4 = 0
		slot5 = 0

		return slot4, slot5
	end

	slot6 = self
	slot4 = self._get_view_kick_center_acceleration
	local view_kick_center_speed = slot4(slot5)
	local acceleration = view_kick_center_speed * dt
	local delta_normalized = tmp_vec1
	slot7 = mvec3_set
	slot9 = tmp_vec1
	slot10 = self._view_kick
	slot10 = slot10.delta

	slot7(slot8, slot9)

	slot7 = mvec3_norm
	slot9 = tmp_vec1

	slot7(slot8)

	slot7 = self._view_kick
	slot7 = slot7.direction
	slot7 = slot7.x
	slot8 = self._view_kick
	slot8 = slot8.velocity
	slot7 = slot7 * slot8
	local x = slot7 * dt
	slot8 = self._view_kick
	slot8 = slot8.direction
	slot8 = slot8.y
	slot9 = self._view_kick
	slot9 = slot9.velocity
	slot8 = slot8 * slot9
	local y = slot8 * dt
	slot9 = mvec3_set_zero
	slot11 = tmp_vec2

	slot9(slot10)

	slot9 = mvec3_set_x
	slot11 = tmp_vec2
	slot12 = x

	slot9(slot10, slot11)

	slot9 = mvec3_set_y
	slot11 = tmp_vec2
	slot12 = y

	slot9(slot10, slot11)

	slot9 = mvec3_add
	slot11 = self._view_kick
	slot11 = slot11.delta
	slot12 = tmp_vec2

	slot9(slot10, slot11)

	slot9 = mvec3_len
	slot11 = self._view_kick
	slot11 = slot11.delta
	local delta_length = slot9(slot10)
	slot10 = 0

	if slot10 < delta_length then
		slot10 = math
		slot10 = slot10.sign
		slot12 = self._view_kick
		slot12 = slot12.velocity
		slot10 = slot10(slot11)
		slot11 = math
		slot11 = slot11.sign
		slot13 = delta_length
		slot11 = slot11(slot12)

		if slot10 ~= slot11 then
			slot10 = mvec3_set_zero
			slot12 = self._view_kick
			slot12 = slot12.direction

			slot10(slot11)

			slot10 = mvec3_set_x
			slot12 = self._view_kick
			slot12 = slot12.direction
			slot13 = delta_normalized.x

			slot10(slot11, slot12)

			slot10 = mvec3_set_y
			slot12 = self._view_kick
			slot12 = slot12.direction
			slot13 = delta_normalized.y

			slot10(slot11, slot12)

			slot10 = recenter_divisor
			acceleration = acceleration / slot10
		end
	end

	slot10 = max_deflection

	if slot10 < delta_length then
		slot10 = mvec3_norm
		slot12 = self._view_kick
		slot12 = slot12.delta

		slot10(slot11)

		slot10 = mvec3_mul
		slot12 = self._view_kick
		slot12 = slot12.delta
		slot13 = max_deflection

		slot10(slot11, slot12)

		slot10 = self._view_kick
		slot11 = 0
		slot10.velocity = slot11
		slot10 = delta_normalized.x
		slot11 = max_deflection
		slot11 = delta_length - slot11
		slot10 = slot10 * slot11
		x = x - slot10
		slot10 = delta_normalized.y
		slot11 = max_deflection
		slot11 = delta_length - slot11
		slot10 = slot10 * slot11
		y = y - slot10
	end

	slot10 = math
	slot10 = slot10.sign
	slot12 = delta_length
	slot10 = slot10(slot11)
	slot10 = acceleration * slot10
	acceleration = slot10 * -1
	slot10 = self._view_kick
	slot11 = self._view_kick
	slot11 = slot11.velocity
	slot11 = slot11 + acceleration
	slot10.velocity = slot11
	slot10 = math
	slot10 = slot10.sign
	slot12 = self._view_kick
	slot12 = slot12.velocity
	slot12 = slot12 * dt
	slot12 = delta_length + slot12
	slot10 = slot10(slot11)
	slot11 = math
	slot11 = slot11.sign
	slot13 = delta_length
	slot11 = slot11(slot12)

	if slot10 ~= slot11 then
		slot10 = delta_normalized.x
		slot10 = slot10 * delta_length
		x = x - slot10
		slot10 = delta_normalized.y
		slot10 = slot10 * delta_length
		y = y - slot10
		slot10 = mvec3_set_zero
		slot12 = self._view_kick
		slot12 = slot12.delta

		slot10(slot11)

		slot10 = mvec3_set_zero
		slot12 = self._view_kick
		slot12 = slot12.direction

		slot10(slot11)

		slot10 = self._view_kick
		slot11 = 0
		slot10.velocity = slot11
	end

	slot10 = x
	slot11 = y

	return slot10, slot11
end

slot34._update_view_kick_vector = slot35
slot34 = FPCameraPlayerBase

function slot35(self, stick_input, stick_input_multiplier, dt)
	slot4 = stick_input.x
	slot5 = stick_input.y

	return slot4, slot5
end

slot34._pc_look_function = slot35
slot34 = Vector3
local multiplier = slot34()
slot35 = FPCameraPlayerBase

function slot36(self, stick_input, stick_input_multiplier, dt, unscaled_stick_input)
	local aim_assist_x = 0
	local aim_assist_y = 0
	slot7 = managers
	slot7 = slot7.player
	slot9 = slot7
	slot7 = slot7.current_state
	local cs = slot7(slot8)
	local aim_assist = false

	if cs == "standard" or cs == "carry" or cs == "bipod" then
		slot9 = managers
		slot9 = slot9.controller
		slot11 = slot9
		slot9 = slot9.get_default_wrapper_type
		slot9 = slot9(slot10)

		if slot9 ~= "pc" then
			slot9 = managers
			slot9 = slot9.user
			slot11 = slot9
			slot9 = slot9.get_setting
			slot12 = "sticky_aim"
			slot9 = slot9(slot10, slot11)

			if slot9 then
				aim_assist = true
			end
		end
	end

	slot9 = self._tweak_data
	local dz = slot9.look_speed_dead_zone
	slot10 = mvector3
	slot10 = slot10.length
	slot12 = unscaled_stick_input
	local length = slot10(slot11)

	if dz < length then
		slot11 = mvector3
		slot11 = slot11.set
		slot13 = multiplier
		slot14 = stick_input_multiplier

		slot11(slot12, slot13)

		slot11 = multiplier
		slot11 = slot11.x
		slot11 = slot11 - 1
		slot12 = 0.001

		if slot12 < slot11 then
			slot11 = mvector3
			slot11 = slot11.set_x
			slot13 = multiplier
			slot14 = multiplier
			slot14 = slot14.x
			slot14 = slot14 - 1
			slot14 = 1.6 * slot14
			slot15 = tweak_data
			slot15 = slot15.player
			slot15 = slot15.camera
			slot15 = slot15.MAX_SENSITIVITY
			slot16 = tweak_data
			slot16 = slot16.player
			slot16 = slot16.camera
			slot16 = slot16.MIN_SENSITIVITY
			slot15 = slot15 - slot16
			slot15 = slot15 * 0.5
			slot14 = slot14 / slot15
			slot14 = 1 + slot14

			slot11(slot12, slot13)
		end

		slot11 = multiplier
		slot11 = slot11.y
		slot11 = slot11 - 1
		slot12 = 0.001

		if slot12 < slot11 then
			slot11 = mvector3
			slot11 = slot11.set_y
			slot13 = multiplier
			slot14 = multiplier
			slot14 = slot14.y
			slot14 = slot14 - 1
			slot14 = 1.6 * slot14
			slot15 = tweak_data
			slot15 = slot15.player
			slot15 = slot15.camera
			slot15 = slot15.MAX_SENSITIVITY
			slot16 = tweak_data
			slot16 = slot16.player
			slot16 = slot16.camera
			slot16 = slot16.MIN_SENSITIVITY
			slot15 = slot15 - slot16
			slot15 = slot15 * 0.5
			slot14 = slot14 / slot15
			slot14 = 1 + slot14

			slot11(slot12, slot13)
		end

		if aim_assist then
			slot13 = self
			slot11 = self._get_aim_assist
			slot14 = 0
			slot15 = dt
			slot16 = self._tweak_data
			slot16 = slot16.aim_assist_look_speed
			slot17 = self._aim_assist_sticky
			slot11, slot12 = slot11(slot12, slot13, slot14, slot15, slot16)
			aim_assist_y = slot12
			aim_assist_x = slot11
		end

		local x = unscaled_stick_input.x
		local y = unscaled_stick_input.y
		x = x / length
		y = y / length
		slot13 = math
		slot13 = slot13.min
		slot15 = length
		slot16 = 1
		slot13 = slot13(slot14, slot15)
		length = slot13
		slot13 = length - dz
		slot14 = 1 - dz
		local scale = slot13 / slot14
		x = x * scale
		y = y * scale
		slot14 = Vector3
		slot16 = x
		slot17 = y
		slot18 = 0
		slot14 = slot14(slot15, slot16, slot17)
		unscaled_stick_input = slot14
		slot16 = self
		slot14 = self._get_look_speed
		slot17 = unscaled_stick_input
		slot18 = multiplier
		slot19 = dt
		local look_speed_x, look_speed_y = slot14(slot15, slot16, slot17, slot18)
		look_speed_y = look_speed_x
		slot16 = multiplier
		slot16 = slot16.x
		look_speed_x = look_speed_x * slot16
		slot16 = multiplier
		slot16 = slot16.y
		look_speed_y = look_speed_y * slot16
		slot16 = unscaled_stick_input.x
		slot16 = slot16 * dt
		local stick_input_x = slot16 * look_speed_x
		slot17 = unscaled_stick_input.y
		slot17 = slot17 * dt
		local stick_input_y = slot17 * look_speed_y
		slot18 = Vector3
		slot20 = stick_input_x
		slot21 = stick_input_y
		slot22 = 0
		local look = slot18(slot19, slot20, slot21)

		if aim_assist then
			slot19 = mvector3
			slot19 = slot19.length
			slot21 = look
			local len = slot19(slot20)
			slot20 = Vector3
			slot22 = look.x
			slot22 = slot22 + aim_assist_x
			slot23 = look.y
			slot24 = 0
			slot20 = slot20(slot21, slot22, slot23)
			look = slot20
			slot20 = 0.08

			if length < slot20 then
				slot20 = mvector3
				slot20 = slot20.normalize
				slot22 = look

				slot20(slot21)

				look = look * len
			end
		end

		slot19 = look.x
		slot20 = look.y

		return slot19, slot20
	end

	if aim_assist then
		slot13 = self
		slot11 = self._get_aim_assist
		slot14 = 0
		slot15 = dt
		slot16 = self._tweak_data
		slot16 = slot16.aim_assist_move_speed
		slot17 = self._aim_assist_sticky
		slot11, slot12 = slot11(slot12, slot13, slot14, slot15, slot16)
		aim_assist_y = slot12
		aim_assist_x = slot11
		slot11 = math
		slot11 = slot11.abs
		slot13 = self._parent_unit
		slot15 = slot13
		slot13 = slot13.movement
		slot13 = slot13(slot14)
		slot13 = slot13._current_state
		slot13 = slot13._stick_move
		slot13 = slot13.x
		local move = slot11(slot12)
		slot12 = self._tweak_data
		slot12 = slot12.aim_assist_move_th_min

		if slot12 <= move then
			slot12 = self._tweak_data
			slot12 = slot12.aim_assist_move_th_max

			if move <= slot12 then
				slot12 = aim_assist_x
				slot13 = 0

				return slot12, slot13
			end
		end
	end

	slot11 = 0
	slot12 = 0

	return slot11, slot12
end

slot35._gamepad_look_function = slot36
slot35 = FPCameraPlayerBase

function slot36(self, stick_input, stick_input_multiplier, dt)
	slot4 = mvector3
	slot4 = slot4.length
	slot6 = stick_input
	slot4 = slot4(slot5)
	slot5 = self._tweak_data
	slot5 = slot5.look_speed_dead_zone
	slot6 = stick_input_multiplier.x
	slot5 = slot5 * slot6

	if slot5 < slot4 then

		-- Decompilation error in this vicinity:
		local x = stick_input.x
		local y = stick_input.y
		slot6 = self._tweak_data
		slot6 = slot6.look_speed_standard
		slot7 = alive
		slot9 = self._parent_unit
		slot7 = slot7(slot8)
		slot9 = self._parent_unit
		slot9 = self._parent_unit.base(slot8)
		slot10 = "change_sensitivity"
		local look_speed = slot6 * ((self._parent_unit.base(slot8).controller(slot8).get_input_bool(slot8, self._parent_unit.base(slot8).controller(slot8)) and 1) or 0.5)
		local stick_input_x = x * dt * look_speed
		local stick_input_y = y * dt * look_speed
		slot9 = stick_input_x
		slot10 = stick_input_y

		return slot9, slot10
	end

	slot4 = 0
	slot5 = 0

	return slot4, slot5
end

slot35._steampad_look_function = slot36

local function get_look_setting(a, b, c, t)
	slot4 = 0.5

	if t < slot4 then
		slot4 = math
		slot4 = slot4.lerp
		slot6 = a
		slot7 = b
		slot8 = t / 0.5

		return slot4(slot5, slot6, slot7)
	end

	slot4 = math
	slot4 = slot4.lerp
	slot6 = b
	slot7 = c
	slot8 = t - 0.5
	slot8 = slot8 / 0.5

	return slot4(slot5, slot6, slot7)
end

local function get_look_setting_x_y(a, b, c, x, y)
	slot5 = get_look_setting
	slot7 = a
	slot8 = b
	slot9 = c
	slot10 = x
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot6 = get_look_setting
	slot8 = a
	slot9 = b
	slot10 = c
	slot11 = y

	return slot5, slot6(slot7, slot8, slot9, slot10)
end

slot37 = FPCameraPlayerBase

function slot38(self, stick_input, stick_input_multiplier, dt)

	-- Decompilation error in this vicinity:
	slot4 = self._parent_unit
	slot6 = slot4
	slot4 = slot4.movement
	slot4 = slot4(slot5)
	slot4 = slot4._current_state
	slot6 = slot4
	slot4 = slot4.in_steelsight
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = self._tweak_data
		slot4 = slot4.look_speed_steel_sight

		return slot4
	end

	slot4 = mvector3
	slot4 = slot4.length
	slot6 = stick_input
	slot4 = slot4(slot5)
	slot5 = self._tweak_data
	slot5 = slot5.look_speed_transition_occluder
	slot4 = self._camera_properties
	slot4 = slot4.look_speed_transition_timer
	slot5 = 1

	if slot5 <= slot4 then
		slot4 = self._tweak_data
		slot4 = slot4.look_speed_fast

		return slot4
	end

	slot4 = self._tweak_data
	local p1 = slot4.look_speed_standard
	slot5 = self._tweak_data
	local p2 = slot5.look_speed_standard
	slot6 = self._tweak_data
	slot6 = slot6.look_speed_standard
	slot7 = self._tweak_data
	slot7 = slot7.look_speed_fast
	slot8 = self._tweak_data
	slot8 = slot8.look_speed_standard
	slot7 = slot7 - slot8
	slot7 = slot7 / 3
	slot7 = slot7 * 2
	local p3 = slot6 + slot7
	slot7 = self._tweak_data
	local p4 = slot7.look_speed_fast
	slot8 = self._camera_properties
	slot9 = self._camera_properties
	slot9 = slot9.look_speed_transition_timer
	slot10 = self._tweak_data
	slot10 = slot10.look_speed_transition_to_fast
	slot10 = dt / slot10
	slot9 = slot9 + slot10
	slot8.look_speed_transition_timer = slot9
	slot8 = math
	slot8 = slot8.bezier
	slot10 = {
		p1,
		p2,
		p3,
		p4
	}
	slot11 = self._camera_properties
	slot11 = slot11.look_speed_transition_timer

	return slot8(slot9, slot10)
end

slot37._get_look_speed = slot38
slot37 = FPCameraPlayerBase

function slot38(self, dt)

	-- Decompilation error in this vicinity:
	slot2 = self._input
	local stick_input = slot2.look
	local vel_overshot = self._vel_overshot

	if not stick_input then
		return 
	end

	local input_yaw, input_pitch, input_x, input_z = nil
	slot8 = self._tweak_data
	slot8 = slot8.uses_keyboard
	local last_yaw = vel_overshot.last_yaw
	slot10 = math
	slot10 = slot10.sign
	slot12 = input_yaw
	local sign_in_yaw = slot10(slot11)
	slot11 = math
	slot11 = slot11.abs
	slot13 = input_yaw
	local abs_in_yaw = slot11(slot12)
	slot12 = math
	slot12 = slot12.sign
	slot14 = last_yaw
	local sign_last_yaw = slot12(slot13)
	slot13 = math
	slot13 = slot13.abs
	slot15 = last_yaw
	local abs_last_yaw = slot13(slot14)
	slot14 = self._tweak_data
	slot14 = slot14.uses_keyboard
	local last_pitch = vel_overshot.last_pitch
	slot23 = math
	slot23 = slot23.sign
	slot25 = input_pitch
	local sign_in_pitch = slot23(slot24)
	slot24 = math
	slot24 = slot24.abs
	slot26 = input_pitch
	local abs_in_pitch = slot24(slot25)
	slot25 = math
	slot25 = slot25.sign
	slot27 = last_pitch
	local sign_last_pitch = slot25(slot26)
	slot26 = math
	slot26 = slot26.abs
	slot28 = last_pitch
	local abs_last_pitch = slot26(slot27)
	slot27 = self._tweak_data
	slot27 = slot27.uses_keyboard
	slot28 = math
	slot28 = slot28.step
	slot30 = vel_overshot.target_pitch
	slot31 = input_pitch
	slot32 = step_v
	slot28 = slot28(slot29, slot30, slot31)
	vel_overshot.target_pitch = slot28
	local final_pitch = nil
	slot29 = math
	slot29 = slot29.abs
	slot31 = vel_overshot.target_pitch
	slot31 = slot31 - last_pitch
	local diff = slot29(slot30)
	local diff_clamp = 40
	slot31 = math
	slot31 = slot31.pow
	slot33 = diff / diff_clamp
	slot34 = 1
	local diff_ratio = slot31(slot32, slot33)
	slot32 = math
	slot32 = slot32.clamp
	slot34 = diff_ratio
	slot35 = 0
	slot36 = 1
	local diff_ratio_clamped = slot32(slot33, slot34, slot35)
	slot33 = math
	slot33 = slot33.lerp
	slot35 = 3
	slot36 = 180
	slot37 = diff_ratio_clamped
	slot33 = slot33(slot34, slot35, slot36)
	local step_amount = slot33 * dt
	slot34 = math
	slot34 = slot34.step
	slot36 = last_pitch
	slot37 = vel_overshot.target_pitch
	slot38 = step_amount
	slot34 = slot34(slot35, slot36, slot37)
	final_pitch = slot34
	vel_overshot.last_pitch = final_pitch
	slot34 = mrotation
	slot34 = slot34.set_yaw_pitch_roll
	slot36 = vel_overshot.rotation
	slot37 = final_yaw
	slot38 = final_pitch
	slot39 = -final_yaw

	slot34(slot35, slot36, slot37, slot38)

	local pivot = vel_overshot.pivot
	local new_root = mvec3
	slot36 = mvector3
	slot36 = slot36.set
	slot38 = new_root
	slot39 = pivot

	slot36(slot37, slot38)

	slot36 = mvector3
	slot36 = slot36.negate
	slot38 = new_root

	slot36(slot37)

	slot36 = mvector3
	slot36 = slot36.rotate_with
	slot38 = new_root
	slot39 = vel_overshot.rotation

	slot36(slot37, slot38)

	slot36 = mvector3
	slot36 = slot36.add
	slot38 = new_root
	slot39 = pivot

	slot36(slot37, slot38)

	slot36 = mvector3
	slot36 = slot36.set
	slot38 = vel_overshot.translation
	slot39 = new_root

	slot36(slot37, slot38)

	return 
end

slot37._calculate_soft_velocity_overshot = slot38
slot37 = FPCameraPlayerBase

function slot38(self, pos)
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.set_position
	slot5 = pos

	slot2(slot3, slot4)

	return 
end

slot37.set_position = slot38
slot37 = FPCameraPlayerBase

function slot38(self, rot)
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.set_rotation
	slot5 = rot

	slot2(slot3, slot4)

	return 
end

slot37.set_rotation = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._obj_eye
	slot3 = slot1
	slot1 = slot1.position

	return slot1(slot2)
end

slot37.eye_position = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._obj_eye
	slot3 = slot1
	slot1 = slot1.rotation

	return slot1(slot2)
end

slot37.eye_rotation = slot38
slot37 = FPCameraPlayerBase

function slot38(self, redirect_name, speed, offset_time)
	slot6 = self
	slot4 = self.set_anims_enabled
	slot7 = true

	slot4(slot5, slot6)

	slot4 = false
	self._anim_empty_state_wanted = slot4
	slot4 = self._use_anim_allowed

	if not slot4 then
		slot4 = Idstring
		slot6 = "use"
		slot4 = slot4(slot5)

		if redirect_name == slot4 then
			return 
		end
	end

	slot4 = self._unit
	slot6 = slot4
	slot4 = slot4.play_redirect
	slot7 = redirect_name
	slot8 = offset_time
	local result = slot4(slot5, slot6, slot7)
	slot5 = self.IDS_NOSTRING

	if result == slot5 then
		slot5 = false

		return slot5
	end

	slot5 = Idstring
	slot7 = "use"
	slot5 = slot5(slot6)

	if redirect_name == slot5 then
		slot5 = false
		self._use_anim_allowed = slot5
	end

	if speed then
		slot5 = self._unit
		slot7 = slot5
		slot5 = slot5.anim_state_machine
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.set_speed
		slot8 = result
		slot9 = speed

		slot5(slot6, slot7, slot8)
	end

	return result
end

slot37.play_redirect = slot38
slot37 = FPCameraPlayerBase

function slot38(self, state, redirect_name, offset_time, t)
	slot7 = self
	slot5 = self.set_anims_enabled
	slot8 = true

	slot5(slot6, slot7)

	slot5 = false
	self._anim_empty_state_wanted = slot5
	slot5 = self._unit
	slot7 = slot5
	slot5 = slot5.anim_state_machine
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.set_parameter
	slot8 = state
	slot9 = "t"
	slot10 = t

	slot5(slot6, slot7, slot8, slot9)

	slot5 = self._unit
	slot7 = slot5
	slot5 = slot5.play_redirect
	slot8 = redirect_name
	slot9 = offset_time
	local result = slot5(slot6, slot7, slot8)
	slot6 = self.IDS_NOSTRING

	if result == slot6 then
		slot6 = false

		return slot6
	end

	return result
end

slot37.play_redirect_timeblend = slot38
slot37 = FPCameraPlayerBase

function slot38(self, name, params)
	slot6 = true

	self.set_anims_enabled(slot4, self)

	self._anim_empty_state_wanted = false
	local asm = self._unit.anim_state_machine(slot4)
	slot8 = params
	local result = asm.play_raw(self._unit, asm, name)

	return result ~= self.IDS_NOSTRING and result
end

slot37.play_raw = slot38
slot37 = FPCameraPlayerBase

function slot38(self, enabled)
	self._steelsight_anims_enabled = enabled
	slot4 = self
	slot2 = self._check_play_empty_state

	slot2(slot3)

	return 
end

slot37.set_steelsight_anim_enabled = slot38
slot37 = FPCameraPlayerBase

function slot38(self, state_name)
	slot5 = true

	self.set_anims_enabled(slot3, self)

	self._anim_empty_state_wanted = false
	slot4 = self._unit
	slot7 = state_name
	local result = self._unit.play_state(slot3, Idstring(slot6))

	return result ~= self.IDS_NOSTRING and result
end

slot37.play_state = slot38
slot37 = FPCameraPlayerBase

function slot38(self, tilt)
	slot2 = self._camera_properties
	slot2.target_tilt = tilt

	return 
end

slot37.set_target_tilt = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._camera_properties
	slot1 = slot1.current_tilt

	return slot1
end

slot37.current_tilt = slot38
slot37 = FPCameraPlayerBase

function slot38(self, camera_offset)
	slot2 = self._camera_properties
	slot2.camera_offset = camera_offset

	return 
end

slot37.set_camera_offset = slot38
slot37 = FPCameraPlayerBase

function slot38(self, stance_name)
	slot2 = tweak_data
	slot2 = slot2.player
	slot2 = slot2.stances
	slot2 = slot2.default
	slot2 = slot2[stance_name]
	local new_stance = slot2.shoulders

	if new_stance then
		slot3 = self._shoulder_stance
		slot4 = nil
		slot3.transition = slot4
		slot3 = self._shoulder_stance
		slot4 = mvector3
		slot4 = slot4.copy
		slot6 = new_stance.translation
		slot4 = slot4(slot5)
		slot3.translation = slot4
		slot3 = self._shoulder_stance
		slot4 = new_stance.rotation
		slot3.rotation = slot4
	end

	slot3 = tweak_data
	slot3 = slot3.player
	slot3 = slot3.stances
	slot3 = slot3.default
	slot3 = slot3[stance_name]
	local new_stance = slot3.head

	if new_stance then
		slot4 = self._head_stance
		slot5 = nil
		slot4.transition = slot5
		slot4 = self._head_stance
		slot5 = mvector3
		slot5 = slot5.copy
		slot7 = new_stance.translation
		slot5 = slot5(slot6)
		slot4.translation = slot5
		slot4 = self._head_stance
		slot5 = new_stance.rotation
		slot4.rotation = slot5
	end

	slot4 = tweak_data
	slot4 = slot4.player
	slot4 = slot4.stances
	slot4 = slot4.default
	slot4 = slot4[stance_name]
	local new_overshot = slot4.vel_overshot

	if new_overshot then
		slot5 = self._vel_overshot
		slot6 = nil
		slot5.transition = slot6
		slot5 = self._vel_overshot
		slot6 = new_overshot.yaw_neg
		slot5.yaw_neg = slot6
		slot5 = self._vel_overshot
		slot6 = new_overshot.yaw_pos
		slot5.yaw_pos = slot6
		slot5 = self._vel_overshot
		slot6 = new_overshot.pitch_neg
		slot5.pitch_neg = slot6
		slot5 = self._vel_overshot
		slot6 = new_overshot.pitch_pos
		slot5.pitch_pos = slot6
		slot5 = self._vel_overshot
		slot6 = mvector3
		slot6 = slot6.copy
		slot8 = new_overshot.pivot
		slot6 = slot6(slot7)
		slot5.pivot = slot6
	end

	slot7 = self
	slot5 = self.set_stance_fov_instant
	slot8 = stance_name

	slot5(slot6, slot7)

	return 
end

slot37.set_stance_instant = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._shoulder_stance
	slot1 = slot1.transition

	if not slot1 then
		slot1 = self._head_stance
		slot1 = slot1.transition
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	return slot1
end

slot37.is_stance_done = slot38
slot37 = FPCameraPlayerBase

function slot38(self, new_fov)
	if new_fov then
		slot2 = self._fov
		slot3 = nil
		slot2.transition = slot3
		slot2 = self._fov
		slot2.fov = new_fov
		slot2 = self._fov
		slot3 = true
		slot2.dirty = slot3
		slot2 = Application
		slot4 = slot2
		slot2 = slot2.paused
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = self._parent_unit
			slot4 = slot2
			slot2 = slot2.camera
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.set_FOV
			slot5 = self._fov
			slot5 = slot5.fov

			slot2(slot3, slot4)
		end
	end

	return 
end

slot37.set_fov_instant = slot38
slot37 = FPCameraPlayerBase

function slot38(self, stance_name)

	-- Decompilation error in this vicinity:
	slot2 = tweak_data
	slot2 = slot2.player
	slot2 = slot2.stances
	slot2 = slot2.default
	slot2 = slot2[stance_name]
	slot2 = slot2.zoom_fov

	if new_fov then
		slot3 = self._fov
		slot4 = nil
		slot3.transition = slot4
		slot3 = self._fov
		slot3.fov = new_fov
		slot3 = self._fov
		slot4 = true
		slot3.dirty = slot4
		slot3 = Application
		slot5 = slot3
		slot3 = slot3.paused
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = self._parent_unit
			slot5 = slot3
			slot3 = slot3.camera
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.set_FOV
			slot6 = self._fov
			slot6 = slot6.fov

			slot3(slot4, slot5)
		end
	end

	return 
end

slot37.set_stance_fov_instant = slot38
slot37 = FPCameraPlayerBase

function slot38(self, new_shoulder_stance, new_head_stance, new_vel_overshot, new_fov, new_shakers, stance_mod, duration_multiplier, duration)
	slot9 = Application
	slot11 = slot9
	slot9 = slot9.time
	local t = slot9(slot10)

	if new_shoulder_stance then
		local transition = {}
		slot11 = self._shoulder_stance
		slot11.transition = transition
		slot11 = new_shoulder_stance.translation
		slot12 = stance_mod.translation

		if not slot12 then
			slot12 = Vector3
			slot12 = slot12()
		end

		slot11 = slot11 + slot12
		transition.end_translation = slot11
		slot11 = new_shoulder_stance.rotation
		slot12 = stance_mod.rotation

		if not slot12 then
			slot12 = Rotation
			slot12 = slot12()
		end

		slot11 = slot11 * slot12
		transition.end_rotation = slot11
		slot11 = mvector3
		slot11 = slot11.copy
		slot13 = self._shoulder_stance
		slot13 = slot13.translation
		slot11 = slot11(slot12)
		transition.start_translation = slot11
		slot11 = self._shoulder_stance
		slot11 = slot11.rotation
		transition.start_rotation = slot11
		transition.start_t = t
		slot11 = duration * duration_multiplier
		transition.duration = slot11
	end

	if new_head_stance then
		local transition = {}
		slot11 = self._head_stance
		slot11.transition = transition
		slot11 = new_head_stance.translation
		transition.end_translation = slot11
		slot11 = new_head_stance.rotation
		transition.end_rotation = slot11
		slot11 = mvector3
		slot11 = slot11.copy
		slot13 = self._head_stance
		slot13 = slot13.translation
		slot11 = slot11(slot12)
		transition.start_translation = slot11
		slot11 = self._head_stance
		slot11 = slot11.rotation
		transition.start_rotation = slot11
		transition.start_t = t
		slot11 = duration * duration_multiplier
		transition.duration = slot11
	end

	if new_vel_overshot then
		local transition = {}
		slot11 = self._vel_overshot
		slot11.transition = transition
		slot11 = new_vel_overshot.pivot
		transition.end_pivot = slot11
		slot11 = new_vel_overshot.yaw_neg
		transition.end_yaw_neg = slot11
		slot11 = new_vel_overshot.yaw_pos
		transition.end_yaw_pos = slot11
		slot11 = new_vel_overshot.pitch_neg
		transition.end_pitch_neg = slot11
		slot11 = new_vel_overshot.pitch_pos
		transition.end_pitch_pos = slot11
		slot11 = mvector3
		slot11 = slot11.copy
		slot13 = self._vel_overshot
		slot13 = slot13.pivot
		slot11 = slot11(slot12)
		transition.start_pivot = slot11
		slot11 = self._vel_overshot
		slot11 = slot11.yaw_neg
		transition.start_yaw_neg = slot11
		slot11 = self._vel_overshot
		slot11 = slot11.yaw_pos
		transition.start_yaw_pos = slot11
		slot11 = self._vel_overshot
		slot11 = slot11.pitch_neg
		transition.start_pitch_neg = slot11
		slot11 = self._vel_overshot
		slot11 = slot11.pitch_pos
		transition.start_pitch_pos = slot11
		transition.start_t = t
		slot11 = duration * duration_multiplier
		transition.duration = slot11
	end

	if new_fov then
		slot10 = self._fov
		slot10 = slot10.fov

		if new_fov == slot10 then
			slot10 = self._fov
			slot11 = nil
			slot10.transition = slot11
		else
			local transition = {}
			slot11 = self._fov
			slot11.transition = transition
			transition.end_fov = new_fov
			slot11 = self._fov
			slot11 = slot11.fov
			transition.start_fov = slot11
			transition.start_t = t
			slot11 = duration * duration_multiplier
			transition.duration = slot11
		end
	end

	if new_shakers then
		slot10 = pairs
		slot12 = new_shakers
		slot10, slot11, slot12 = slot10(slot11)

		for effect, values in slot10, slot11, slot12 do
			slot15 = pairs
			slot17 = values
			slot15, slot16, slot17 = slot15(slot16)

			for parameter, value in slot15, slot16, slot17 do
				slot20 = self._parent_unit
				slot22 = slot20
				slot20 = slot20.camera
				slot20 = slot20(slot21)
				slot22 = slot20
				slot20 = slot20.set_shaker_parameter
				slot23 = effect
				slot24 = parameter
				slot25 = value

				slot20(slot21, slot22, slot23, slot24)
			end
		end
	end

	return 
end

slot37.clbk_stance_entered = slot38
slot37 = FPCameraPlayerBase

function slot38(self, col_ray)
	if col_ray then
		local ray = col_ray.ray
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.camera
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.rotation
		local r1 = slot3(slot4)
		slot4 = self._aim_assist
		slot4 = slot4.mrotation

		if not slot4 then
			slot4 = Rotation
			local r2 = slot4()
		end

		slot5 = mrotation
		slot5 = slot5.set_look_at
		slot7 = r2
		slot8 = ray
		slot11 = r1
		slot9 = r1.z

		slot5(slot6, slot7, slot9(slot10))

		slot5 = mrotation
		slot5 = slot5.yaw
		slot7 = r1
		slot5 = slot5(slot6)
		slot6 = mrotation
		slot6 = slot6.yaw
		slot8 = r2
		slot6 = slot6(slot7)
		local yaw = slot5 - slot6
		slot6 = mrotation
		slot6 = slot6.pitch
		slot8 = r1
		slot6 = slot6(slot7)
		slot7 = mrotation
		slot7 = slot7.pitch
		slot9 = r2
		slot7 = slot7(slot8)
		local pitch = slot6 - slot7
		slot7 = 180

		if slot7 < yaw then
			yaw = 360 - yaw
		else
			slot7 = -180

			if yaw < slot7 then
				yaw = 360 + yaw
			end
		end

		slot7 = 180

		if slot7 < pitch then
			pitch = 360 - pitch
		else
			slot7 = -180

			if pitch < slot7 then
				pitch = 360 + pitch
			end
		end

		slot7 = yaw
		slot8 = pitch
		slot9 = 0

		return slot7, slot8, slot9
	end

	return 
end

slot37._get_aim_assist_direction = slot38
slot37 = FPCameraPlayerBase

function slot38(self, col_ray, aim_data)
	if col_ray then
		local ray = col_ray.ray
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.camera
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.rotation
		local r1 = slot4(slot5)
		slot5 = aim_data.mrotation

		if not slot5 then
			slot5 = Rotation
			local r2 = slot5()
		end

		slot6 = mrotation
		slot6 = slot6.set_look_at
		slot8 = r2
		slot9 = ray
		slot12 = r1
		slot10 = r1.z

		slot6(slot7, slot8, slot10(slot11))

		slot6 = mrotation
		slot6 = slot6.yaw
		slot8 = r1
		slot6 = slot6(slot7)
		slot7 = mrotation
		slot7 = slot7.yaw
		slot9 = r2
		slot7 = slot7(slot8)
		local yaw = slot6 - slot7
		slot7 = mrotation
		slot7 = slot7.pitch
		slot9 = r1
		slot7 = slot7(slot8)
		slot8 = mrotation
		slot8 = slot8.pitch
		slot10 = r2
		slot8 = slot8(slot9)
		local pitch = slot7 - slot8
		slot8 = 180

		if slot8 < yaw then
			yaw = 360 - yaw
		else
			slot8 = -180

			if yaw < slot8 then
				yaw = 360 + yaw
			end
		end

		slot8 = 180

		if slot8 < pitch then
			pitch = 360 - pitch
		else
			slot8 = -180

			if pitch < slot8 then
				pitch = 360 + pitch
			end
		end

		slot8 = mvector3
		slot8 = slot8.set_static
		slot10 = aim_data.direction
		slot11 = yaw
		slot12 = -pitch
		slot13 = 0

		slot8(slot9, slot10, slot11, slot12)

		slot8 = mvector3
		slot8 = slot8.normalize
		slot10 = aim_data.direction
		slot8 = slot8(slot9)
		aim_data.distance = slot8
		slot8 = col_ray.distance
		aim_data.target_distance = slot8
		slot8 = col_ray.distance_to_aim_line
		aim_data.distance_to_aim_line = slot8
	end

	return 
end

slot37._start_aim_assist = slot38
slot37 = FPCameraPlayerBase

function slot38(self, aim_data)
	slot2 = mvector3
	slot2 = slot2.set_static
	slot4 = aim_data.direction
	slot5 = 0
	slot6 = 0
	slot7 = 0

	slot2(slot3, slot4, slot5, slot6)

	slot2 = 0
	aim_data.distance = slot2
	slot2 = 0
	aim_data.target_distance = slot2
	slot2 = 0
	aim_data.distance_to_aim_line = slot2

	return 
end

slot37._stop_aim_assist = slot38
slot37 = FPCameraPlayerBase

function slot38(self, t, dt)
	slot3 = managers
	slot3 = slot3.controller
	slot5 = slot3
	slot3 = slot3.get_default_wrapper_type
	slot3 = slot3(slot4)

	if slot3 ~= "pc" then
		slot3 = managers
		slot3 = slot3.user
		slot5 = slot3
		slot3 = slot3.get_setting
		slot6 = "sticky_aim"
		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = self._parent_unit
			slot5 = slot3
			slot3 = slot3.inventory
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.equipped_unit
			local weapon = slot3(slot4)
			slot4 = self._parent_unit
			slot6 = slot4
			slot4 = slot4.movement
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.current_state
			local player_state = slot4(slot5)

			if weapon then
				slot7 = weapon
				slot5 = weapon.base
				slot5 = slot5(slot6)
				slot7 = slot5
				slot5 = slot5.get_aim_assist
				slot10 = player_state
				slot8 = player_state.get_fire_weapon_position
				slot8 = slot8(slot9)
				slot11 = player_state
				slot9 = player_state.get_fire_weapon_direction
				slot9 = slot9(slot10)
				slot10 = nil
				slot11 = true
				local closest_ray = slot5(slot6, slot7, slot8, slot9, slot10)
				slot8 = self
				slot6 = self._start_aim_assist
				slot9 = closest_ray
				slot10 = self._aim_assist_sticky

				slot6(slot7, slot8, slot9)
			else
				slot7 = self
				slot5 = self._stop_aim_assist
				slot8 = self._aim_assist_sticky

				slot5(slot6, slot7)
			end
		end
	end

	return 
end

slot37._update_aim_assist_sticky = slot38
slot37 = FPCameraPlayerBase

function slot38(self, col_ray)
	if col_ray then
		slot4 = self
		slot2 = self._get_aim_assist_direction
		slot5 = col_ray
		local yaw, pitch, roll = slot2(slot3, slot4)
		slot5 = mvector3
		slot5 = slot5.set_static
		slot7 = self._aim_assist
		slot7 = slot7.direction
		slot8 = yaw
		slot9 = -pitch
		slot10 = 0

		slot5(slot6, slot7, slot8, slot9)

		slot5 = self._aim_assist
		slot6 = mvector3
		slot6 = slot6.normalize
		slot8 = self._aim_assist
		slot8 = slot8.direction
		slot6 = slot6(slot7)
		slot5.distance = slot6
	end

	return 
end

slot37.clbk_aim_assist = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = mvector3
	slot1 = slot1.set_static
	slot3 = self._aim_assist
	slot3 = slot3.direction
	slot4 = 0
	slot5 = 0
	slot6 = 0

	slot1(slot2, slot3, slot4, slot5)

	slot1 = self._aim_assist
	slot2 = 0
	slot1.distance = slot2

	return 
end

slot37.clbk_stop_aim_assist = slot38
slot37 = FPCameraPlayerBase

function slot38(self, new_fov, duration_multiplier)
	slot3 = self._fov
	slot3 = slot3.fov

	if new_fov == slot3 then
		slot3 = self._fov
		slot4 = nil
		slot3.transition = slot4
	else
		local transition = {}
		self._fov.transition = transition
		transition.end_fov = new_fov
		transition.start_fov = self._fov.fov
		slot6 = managers.player
		slot6 = managers.player.player_timer(slot5)
		transition.start_t = managers.player.player_timer(slot5).time(slot5)
		transition.duration = 0.23 * (duration_multiplier or 1)
	end

	return 
end

slot37.animate_fov = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = true
	self._anim_empty_state_wanted = slot1
	slot3 = self
	slot1 = self._check_play_empty_state

	slot1(slot2)

	return 
end

slot37.anim_clbk_idle_full_blend = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._anim_empty_state_wanted

	if not slot1 then
		return 
	end

	slot1 = self._steelsight_anims_enabled

	if slot1 then
		return 
	end

	slot3 = self
	slot1 = self.play_redirect
	slot4 = self.IDS_EMPTY

	slot1(slot2, slot3)

	return 
end

slot37._check_play_empty_state = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	return 
end

slot37.anim_clbk_idle_exit = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = true
	self._playing_empty_state = slot1

	return 
end

slot37.anim_clbk_empty_enter = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = false
	self._playing_empty_state = slot1

	return 
end

slot37.anim_clbk_empty_exit = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._playing_empty_state

	return slot1
end

slot37.playing_empty_state = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = false
	self._playing_empty_state = slot1
	slot3 = self
	slot1 = self.set_anims_enabled
	slot4 = false

	slot1(slot2, slot3)

	return 
end

slot37.anim_clbk_empty_full_blend = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	return 
end

slot37.anim_clbk_spawn_handcuffs = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	return 
end

slot37.anim_clbk_unspawn_handcuffs = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = true
	self._use_anim_allowed = slot1

	return 
end

slot37.anim_clbk_use_exit = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_unit
	slot3 = slot1
	slot1 = slot1.inventory
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.equipped_unit
	local weapon = slot1(slot2)
	slot4 = weapon
	slot2 = weapon.get_object
	slot5 = Idstring
	slot7 = "a_sight"
	local object = slot2(slot3, slot5(slot6))
	slot3 = print
	slot7 = object
	slot5 = object.position
	slot5 = slot5(slot6)
	slot6 = self._unit
	slot8 = slot6
	slot6 = slot6.position
	slot6 = slot6(slot7)
	slot5 = slot5 - slot6
	slot7 = slot5
	slot5 = slot5.rotate_HP
	slot8 = self._unit
	slot10 = slot8
	slot8 = slot8.rotation
	slot8 = slot8(slot9)
	slot10 = slot8
	slot8 = slot8.inverse

	slot3(slot5(slot6, slot8(slot9)))

	slot3 = print
	slot5 = self._unit
	slot7 = slot5
	slot5 = slot5.rotation
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.inverse
	slot5 = slot5(slot6)
	slot8 = object
	slot6 = object.rotation
	slot6 = slot6(slot7)
	slot5 = slot5 * slot6

	slot3(slot4)

	return 
end

slot37.get_weapon_offsets = slot38
slot37 = FPCameraPlayerBase

function slot38(self, part_id)
	slot2 = self._parent_unit
	slot4 = slot2
	slot2 = slot2.inventory
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.equipped_unit
	local weapon = slot2(slot3)
	slot5 = self
	slot3 = self._get_position_and_rotation
	slot6 = weapon
	slot7 = Idstring
	slot9 = part_id
	local weapon_part_position, weapon_part_rotation = slot3(slot4, slot5, slot7(slot8))

	if weapon_part_position and weapon_part_rotation then
		slot5 = print
		slot7 = self._unit
		slot9 = slot7
		slot7 = slot7.position
		slot7 = slot7(slot8)
		slot7 = weapon_part_position - slot7
		slot9 = slot7
		slot7 = slot7.rotate_HP
		slot10 = self._unit
		slot12 = slot10
		slot10 = slot10.rotation
		slot10 = slot10(slot11)
		slot12 = slot10
		slot10 = slot10.inverse

		slot5(slot7(slot8, slot10(slot11)))

		slot5 = print
		slot7 = self._unit
		slot9 = slot7
		slot7 = slot7.rotation
		slot7 = slot7(slot8)
		slot9 = slot7
		slot7 = slot7.inverse
		slot7 = slot7(slot8)
		slot7 = slot7 * weapon_part_rotation

		slot5(slot6)
	else
		slot5 = print
		slot7 = "Weapon part '"
		slot8 = tostring
		slot10 = part_id
		slot8 = slot8(slot9)
		slot9 = "' not found!"
		slot7 = slot7 .. slot8 .. slot9

		slot5(slot6)
	end

	return 
end

slot37.get_weapon_part_offsets = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, part_id)
	local children = nil
	slot4 = unit.get_objects

	if slot4 then
		slot6 = unit
		slot4 = unit.get_objects
		slot7 = "*"
		slot4 = slot4(slot5, slot6)
		children = slot4
	else
		slot4 = unit.children

		if slot4 then
			slot6 = unit
			slot4 = unit.children
			slot4 = slot4(slot5)
			children = slot4
		end
	end

	local object_position, object_rotation = nil

	if children then
		slot6 = 1
		slot7 = #children
		slot8 = 1

		for i = slot6, slot7, slot8 do
			slot10 = children[i]
			slot12 = slot10
			slot10 = slot10.name
			slot10 = slot10(slot11)

			if slot10 == part_id then
				slot10 = children[i]
				slot12 = slot10
				slot10 = slot10.position
				slot10 = slot10(slot11)
				slot11 = children[i]
				slot13 = slot11
				slot11 = slot11.rotation

				return slot10, slot11(slot12)
			else
				slot12 = self
				slot10 = self._get_position_and_rotation
				slot13 = children[i]
				slot14 = part_id
				slot10, slot11 = slot10(slot11, slot12, slot13)
				object_rotation = slot11
				object_position = slot10

				if object_position and object_rotation then
					slot10 = object_position
					slot11 = object_rotation

					return slot10, slot11
				end
			end
		end
	end

	return 
end

slot37._get_position_and_rotation = slot38
slot37 = FPCameraPlayerBase

function slot38(self, state)
	slot2 = self._anims_enabled

	if state ~= slot2 then
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.set_animations_enabled
		slot5 = state

		slot2(slot3, slot4)

		self._anims_enabled = state
	end

	return 
end

slot37.set_anims_enabled = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._anims_enabled

	return slot1
end

slot37.anims_enabled = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit)
	slot2 = alive
	slot4 = self._parent_unit
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = alive
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.inventory
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.equipped_unit
		slot2 = slot2(slot4(slot5))

		if slot2 then
			slot2 = self._parent_unit
			slot4 = slot2
			slot2 = slot2.inventory
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.equipped_unit
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.damage
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = self._parent_unit
				slot4 = slot2
				slot2 = slot2.inventory
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.equipped_unit
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.damage
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.has_sequence
				slot5 = "hide_pin"
				slot2 = slot2(slot3, slot4)

				if slot2 then
					slot2 = self._parent_unit
					slot4 = slot2
					slot2 = slot2.inventory
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.equipped_unit
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.damage
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.run_sequence_simple
					slot5 = "hide_pin"

					slot2(slot3, slot4)
				end
			end
		end
	end

	return 
end

slot37.anim_clbk_hide_pin = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit)
	slot2 = alive
	slot4 = self._parent_unit
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = alive
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.inventory
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.equipped_unit
		slot2 = slot2(slot4(slot5))

		if slot2 then
			slot2 = self._parent_unit
			slot4 = slot2
			slot2 = slot2.inventory
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.equipped_unit
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.damage
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = self._parent_unit
				slot4 = slot2
				slot2 = slot2.inventory
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.equipped_unit
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.damage
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.has_sequence
				slot5 = "show_pin"
				slot2 = slot2(slot3, slot4)

				if slot2 then
					slot2 = self._parent_unit
					slot4 = slot2
					slot2 = slot2.inventory
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.equipped_unit
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.damage
					slot2 = slot2(slot3)
					slot4 = slot2
					slot2 = slot2.run_sequence_simple
					slot5 = "show_pin"

					slot2(slot3, slot4)
				end
			end
		end
	end

	return 
end

slot37.anim_clbk_show_pin = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, event)
	slot3 = alive
	slot5 = self._parent_unit
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.sound
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.play
		slot6 = event

		slot3(slot4, slot5)
	end

	return 
end

slot37.play_sound = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, sound_id)

	-- Decompilation error in this vicinity:
	slot3 = managers
	slot3 = slot3.blackmarket
	slot5 = slot3
	slot3 = slot3.equipped_melee_weapon
	local melee_entry = slot3(slot4)
	slot4 = tweak_data
	slot4 = slot4.blackmarket
	slot4 = slot4.melee_weapons
	local tweak_data = slot4[melee_entry]
	slot5 = tweak_data.sounds
	slot5 = alive
	slot7 = self._parent_unit
	slot5 = slot5(slot6)

	if slot5 then
		slot5 = self._parent_unit
		slot7 = slot5
		slot5 = slot5.sound
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.play
		slot8 = tweak_data.sounds
		slot8 = slot8[sound_id]
		slot9 = nil
		slot10 = false

		slot5(slot6, slot7, slot8, slot9)
	end

	return 
end

slot37.play_melee_sound = slot38
slot37 = FPCameraPlayerBase

function slot38(self, spin, pitch, mid_spin, mid_pitch)
	slot5 = {}
	self._limits = slot5

	if spin then
		if not mid_spin then
			slot5 = self._camera_properties
			local mid = slot5.spin
		end

		slot6 = self._limits
		slot7 = {
			mid = mid,
			offset = spin
		}
		slot6.spin = slot7
	end

	if pitch then
		if not mid_pitch then
			slot5 = self._camera_properties
			local mid = slot5.pitch
		end

		slot6 = self._limits
		slot7 = {
			mid = mid,
			offset = pitch
		}
		slot6.pitch = slot7
	end

	return 
end

slot37.set_limits = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = nil
	self._limits = slot1

	return 
end

slot37.remove_limits = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit)
	slot4 = self
	slot2 = self.unspawn_grenade

	slot2(slot3)

	slot2 = alive
	slot4 = self._parent_unit
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = self._parent_unit
		slot4 = slot2
		slot2 = slot2.equipment
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.throw_projectile

		slot2(slot3)
	end

	return 
end

slot37.throw_projectile = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit)
	slot4 = self
	slot2 = self.unspawn_grenade

	slot2(slot3)

	slot2 = alive
	slot4 = self._parent_unit
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = self._parent_unit
		slot4 = slot2
		slot2 = slot2.equipment
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.throw_grenade

		slot2(slot3)
	end

	return 
end

slot37.throw_grenade = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._grenade_unit
	slot1 = slot1(slot2)

	if slot1 then
		return 
	end

	slot1 = Idstring
	slot3 = "a_weapon_left"
	local align_obj_l_name = slot1(slot2)
	slot2 = Idstring
	slot4 = "a_weapon_right"
	local align_obj_r_name = slot2(slot3)
	slot3 = self._unit
	slot5 = slot3
	slot3 = slot3.get_object
	slot6 = align_obj_l_name
	local align_obj_l = slot3(slot4, slot5)
	slot4 = self._unit
	slot6 = slot4
	slot4 = slot4.get_object
	slot7 = align_obj_r_name
	local align_obj_r = slot4(slot5, slot6)
	slot5 = managers
	slot5 = slot5.blackmarket
	slot7 = slot5
	slot5 = slot5.equipped_grenade
	local grenade_entry = slot5(slot6)
	slot6 = World
	slot8 = slot6
	slot6 = slot6.spawn_unit
	slot9 = Idstring
	slot11 = tweak_data
	slot11 = slot11.projectiles
	slot11 = slot11[grenade_entry]
	slot11 = slot11.unit
	slot9 = slot9(slot10)
	slot12 = align_obj_r
	slot10 = align_obj_r.position
	slot10 = slot10(slot11)
	slot13 = align_obj_r
	slot11 = align_obj_r.rotation
	slot6 = slot6(slot7, slot8, slot9, slot11(slot12))
	self._grenade_unit = slot6
	slot6 = self._unit
	slot8 = slot6
	slot6 = slot6.link
	slot11 = align_obj_r
	slot9 = align_obj_r.name
	slot9 = slot9(slot10)
	slot10 = self._grenade_unit
	slot11 = self._grenade_unit
	slot13 = slot11
	slot11 = slot11.orientation_object
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.name

	slot6(slot7, slot8, slot9, slot11(slot12))

	return 
end

slot37.spawn_grenade = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._grenade_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._grenade_unit
		slot3 = slot1
		slot1 = slot1.unlink

		slot1(slot2)

		slot1 = World
		slot3 = slot1
		slot1 = slot1.delete_unit
		slot4 = self._grenade_unit

		slot1(slot2, slot3)

		slot1 = nil
		self._grenade_unit = slot1
	end

	return 
end

slot37.unspawn_grenade = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = Idstring
	slot3 = "a_weapon_right"
	local align_obj_r_name = slot1(slot2)
	slot2 = self._unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = align_obj_r_name
	local align_obj_r = slot2(slot3, slot4)
	slot5 = align_obj_r
	slot3 = align_obj_r.position
	local pos = slot3(slot4)
	slot4 = self._parent_unit
	slot6 = slot4
	slot4 = slot4.camera
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.forward
	local dir = slot4(slot5)
	slot5 = managers
	slot5 = slot5.player
	slot7 = slot5
	slot5 = slot5.upgrade_value
	slot8 = "player"
	slot9 = "toss_ammo"
	slot10 = 0
	local idx = slot5(slot6, slot7, slot8, slot9)
	slot6 = ThrowableAmmoBag
	slot6 = slot6.spawn
	slot8 = pos
	slot9 = dir
	slot10 = idx

	slot6(slot7, slot8, slot9)

	return 
end

slot37.spawn_ammo_bag = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._melee_item_units

	if slot1 then
		return 
	end

	slot1 = managers
	slot1 = slot1.blackmarket
	slot3 = slot1
	slot1 = slot1.equipped_melee_weapon
	local melee_entry = slot1(slot2)
	slot2 = tweak_data
	slot2 = slot2.blackmarket
	slot2 = slot2.melee_weapons
	slot2 = slot2[melee_entry]
	local unit_name = slot2.unit

	if unit_name then
		local aligns = tweak_data.blackmarket.melee_weapons[melee_entry].align_objects or {
			"a_weapon_left"
		}
		local graphic_objects = tweak_data.blackmarket.melee_weapons[melee_entry].graphic_objects or {}
		slot5 = {}
		self._melee_item_units = slot5
		slot5 = ipairs
		slot7 = aligns
		slot5, slot6, slot7 = slot5(slot6)

		for _, align in slot5, slot6, slot7 do
			slot10 = Idstring
			slot12 = align
			local align_obj_name = slot10(slot11)
			slot11 = self._unit
			slot13 = slot11
			slot11 = slot11.get_object
			slot14 = align_obj_name
			local align_obj = slot11(slot12, slot13)
			slot12 = World
			slot14 = slot12
			slot12 = slot12.spawn_unit
			slot15 = Idstring
			slot17 = unit_name
			slot15 = slot15(slot16)
			slot18 = align_obj
			slot16 = align_obj.position
			slot16 = slot16(slot17)
			slot19 = align_obj
			slot17 = align_obj.rotation
			local unit = slot12(slot13, slot14, slot15, slot17(slot18))
			slot13 = self._unit
			slot15 = slot13
			slot13 = slot13.link
			slot18 = align_obj
			slot16 = align_obj.name
			slot16 = slot16(slot17)
			slot17 = unit
			slot20 = unit
			slot18 = unit.orientation_object
			slot18 = slot18(slot19)
			slot20 = slot18
			slot18 = slot18.name

			slot13(slot14, slot15, slot16, slot18(slot19))

			slot13 = pairs
			slot15 = graphic_objects
			slot13, slot14, slot15 = slot13(slot14)

			for a_object, g_object in slot13, slot14, slot15 do
				local graphic_obj_name = Idstring(slot19)
				slot22 = graphic_obj_name
				local graphic_obj = unit.get_object(g_object, unit)
				slot25 = a_object
				slot23 = Idstring(slot24) == align_obj_name

				graphic_obj.set_visibility(unit, graphic_obj)
			end

			slot13 = table
			slot13 = slot13.insert
			slot15 = self._melee_item_units
			slot16 = unit

			slot13(slot14, slot15)
		end
	end

	return 
end

slot37.spawn_melee_item = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._melee_item_units

	if not slot1 then
		return 
	end

	slot1 = ipairs
	slot3 = self._melee_item_units
	slot1, slot2, slot3 = slot1(slot2)

	for _, unit in slot1, slot2, slot3 do
		slot6 = alive
		slot8 = unit
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = unit
			slot6 = unit.unlink

			slot6(slot7)

			slot6 = World
			slot8 = slot6
			slot6 = slot6.delete_unit
			slot9 = unit

			slot6(slot7, slot8)
		end
	end

	slot1 = nil
	self._melee_item_units = slot1

	return 
end

slot37.unspawn_melee_item = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.hide_equipped_unit

		slot1(slot2)
	end

	return 
end

slot37.hide_weapon = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.show_equipped_unit

		slot1(slot2)
	end

	return 
end

slot37.show_weapon = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, state, ...)
	slot3 = alive
	slot5 = self._parent_unit
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.inventory
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.equipped_unit
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.base
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.reload_speed_multiplier
		local speed_multiplier = slot3(slot4)
		slot4 = self._unit
		slot6 = slot4
		slot4 = slot4.anim_state_machine
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.set_speed
		slot7 = Idstring
		slot9 = state
		slot7 = slot7(slot8)
		slot8 = speed_multiplier

		slot4(slot5, slot6, slot7)
	end

	return 
end

slot37.enter_shotgun_reload_loop = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_movement_ext
	local current_state = slot1._current_state

	if current_state then
		slot2 = current_state.give_shock_to_taser

		if slot2 then
			slot4 = current_state
			slot2 = current_state.give_shock_to_taser

			slot2(slot3)

			slot2 = alive
			slot4 = self._taser_hooks_unit
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = self._unit
				slot4 = slot2
				slot2 = slot2.get_object
				slot5 = Idstring
				slot7 = "a_weapon_right"
				local align_obj = slot2(slot3, slot5(slot6))
				slot3 = World
				slot5 = slot3
				slot3 = slot3.effect_manager
				slot3 = slot3(slot4)
				slot5 = slot3
				slot3 = slot3.spawn
				slot6 = {}
				slot7 = Idstring
				slot9 = "effects/vanilla/character/taser_stop"
				slot7 = slot7(slot8)
				slot6.effect = slot7
				slot9 = align_obj
				slot7 = align_obj.position
				slot7 = slot7(slot8)
				slot6.position = slot7
				slot9 = align_obj
				slot7 = align_obj.rotation
				slot7 = slot7(slot8)
				slot9 = slot7
				slot7 = slot7.y
				slot7 = slot7(slot8)
				slot6.normal = slot7

				slot3(slot4, slot5)
			end
		end
	end

	return 
end

slot37.counter_taser = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	return 
end

slot37.spawn_taser_hooks = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._taser_hooks_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._taser_hooks_unit
		slot3 = slot1
		slot1 = slot1.unlink

		slot1(slot2)

		slot1 = self._taser_hooks_unit
		slot3 = slot1
		slot1 = slot1.name
		local name = slot1(slot2)
		slot2 = World
		slot4 = slot2
		slot2 = slot2.delete_unit
		slot5 = self._taser_hooks_unit

		slot2(slot3, slot4)

		slot2 = managers
		slot2 = slot2.dyn_resource
		slot4 = slot2
		slot2 = slot2.unload
		slot5 = Idstring
		slot7 = "unit"
		slot5 = slot5(slot6)
		slot6 = name
		slot7 = DynamicResourceManager
		slot7 = slot7.DYN_RESOURCES_PACKAGE
		slot8 = false

		slot2(slot3, slot4, slot5, slot6, slot7)

		slot2 = nil
		self._taser_hooks_unit = slot2
	end

	return 
end

slot37.unspawn_taser_hooks = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_movement_ext
	local current_state = slot1._current_state

	if current_state then
		slot2 = current_state.clbk_exit_to_std

		if slot2 then
			slot4 = current_state
			slot2 = current_state.clbk_exit_to_std

			slot2(slot3)
		end
	end

	return 
end

slot37.end_tase = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.equipped_unit
		local weapon = slot1(slot2)
		slot2 = alive
		slot4 = weapon
		slot2 = slot2(slot3)

		if slot2 then
			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.predict_bullet_objects

			slot2(slot3)
		end
	end

	return 
end

slot37.anim_clbk_check_bullet_object = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.equipped_unit
		local weapon = slot1(slot2)
		slot2 = alive
		slot4 = weapon
		slot2 = slot2(slot3)

		if slot2 then
			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "reload"

			slot2(slot3, slot4)

			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "reload_not_empty"

			slot2(slot3, slot4)
		end
	end

	return 
end

slot37.anim_clbk_stop_weapon_reload = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, anim, speed)
	slot4 = alive
	slot6 = self._parent_unit
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = self._parent_unit
		slot6 = slot4
		slot4 = slot4.inventory
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.equipped_unit
		local weapon = slot4(slot5)
		slot5 = alive
		slot7 = weapon
		slot5 = slot5(slot6)

		if slot5 then
			slot7 = weapon
			slot5 = weapon.base
			slot5 = slot5(slot6)
			slot7 = slot5
			slot5 = slot5.tweak_data_anim_play
			slot8 = anim
			slot9 = speed

			slot5(slot6, slot7, slot8)
		end
	end

	return 
end

slot37.anim_clbk_play_weapon_anim = slot38
slot37 = FPCameraPlayerBase

function slot38(self, unit, anim)
	slot3 = alive
	slot5 = self._parent_unit
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._parent_unit
		slot5 = slot3
		slot3 = slot3.inventory
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.equipped_unit
		local weapon = slot3(slot4)
		slot4 = alive
		slot6 = weapon
		slot4 = slot4(slot5)

		if slot4 then
			slot6 = weapon
			slot4 = weapon.base
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.tweak_data_anim_stop
			slot7 = anim

			slot4(slot5, slot6)
		end
	end

	return 
end

slot37.anim_clbk_stop_weapon_anim = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.equipped_unit
		local weapon = slot1(slot2)
		slot2 = alive
		slot4 = weapon
		slot2 = slot2(slot3)

		if slot2 then
			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "reload_enter"

			slot2(slot3, slot4)

			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "reload_exit"

			slot2(slot3, slot4)
		end
	end

	return 
end

slot37.anim_clbk_stop_weapon_reload_all = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.equipped_unit
		local weapon = slot1(slot2)
		slot2 = alive
		slot4 = weapon
		slot2 = slot2(slot3)

		if slot2 then
			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "magazine_empty"

			slot2(slot3, slot4)

			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.tweak_data_anim_stop
			slot5 = "magazine_empty"

			slot2(slot3, slot4)
		end
	end

	return 
end

slot37.anim_clbk_stop_weapon_magazine_empty = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_unit
	slot3 = slot1
	slot1 = slot1.inventory
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.equipped_unit
	local weapon = slot1(slot2)
	slot4 = weapon
	slot2 = weapon.base
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.reset_magazine_anim_pos

	slot2(slot3)

	return 
end

slot37.anim_clbk_reset_dp28_mag_pos = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_unit
	slot3 = slot1
	slot1 = slot1.inventory
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.equipped_unit
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.base
	slot1 = slot1(slot2)
	slot1 = slot1._unit
	slot3 = slot1
	slot1 = slot1.get_object
	slot4 = Idstring
	slot6 = "align_mag"
	local align_obj = slot1(slot2, slot4(slot5))
	slot4 = align_obj
	slot2 = align_obj.position
	local position = slot2(slot3)
	slot5 = align_obj
	slot3 = align_obj.rotation
	local rotation = slot3(slot4)
	slot6 = self
	slot4 = self._unspawn_bren_mag_shell

	slot4(slot5)

	slot4 = self._parent_unit
	slot6 = slot4
	slot4 = slot4.inventory
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.equipped_unit
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.base
	local weapon_unit = slot4(slot5)
	local mag_unit = nil

	if weapon_unit then
		slot6 = weapon_unit._parts
	else
		slot6 = Idstring
		slot8 = "units/upd_005/weapons/wpn_fps_lmg_bren_pts/wpn_fps_lmg_bren_m_standard_prop"
		slot6 = slot6(slot7)
		mag_unit = slot6
	end

	slot6 = World
	slot8 = slot6
	slot6 = slot6.spawn_unit
	slot9 = mag_unit
	slot10 = position
	slot11 = rotation
	slot6 = slot6(slot7, slot8, slot9, slot10)
	self._bren_magazine = slot6
	slot6 = self._bren_magazine
	slot8 = slot6
	slot6 = slot6.push_at
	slot9 = 30
	slot10 = self._parent_unit
	slot12 = slot10
	slot10 = slot10.camera
	slot10 = slot10(slot11)
	slot10 = slot10._m_cam_fwd
	slot10 = slot10 * 5
	slot11 = self._bren_magazine
	slot13 = slot11
	slot11 = slot11.position

	slot6(slot7, slot8, slot9, slot11(slot12))

	return 
end

slot37.anim_clbk_punch_bren_mag = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._bren_magazine
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = World
	slot3 = slot1
	slot1 = slot1.delete_unit
	slot4 = self._bren_magazine

	slot1(slot2, slot3)

	slot1 = nil
	self._bren_magazine = slot1

	return 
end

slot37._unspawn_bren_mag_shell = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._parent_unit
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.inventory
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.equipped_unit
		local weapon = slot1(slot2)
		slot2 = alive
		slot4 = weapon
		slot2 = slot2(slot3)

		if slot2 then
			slot4 = weapon
			slot2 = weapon.base
			slot2 = slot2(slot3)
			slot2 = slot2.shotgun_shell_data

			if slot2 then
				slot4 = weapon
				slot2 = weapon.base
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.shotgun_shell_data
				local shotgun_shell_data = slot2(slot3)

				if not shotgun_shell_data then
					return 
				end

				slot3 = Idstring
				slot5 = "a_weapon_left"
				local align_obj_l_name = slot3(slot4)
				slot4 = Idstring
				slot6 = "a_weapon_right"
				local align_obj_r_name = slot4(slot5)
				slot5 = self._unit
				slot7 = slot5
				slot5 = slot5.get_object
				slot8 = align_obj_l_name
				local align_obj_l = slot5(slot6, slot7)
				slot6 = self._unit
				slot8 = slot6
				slot6 = slot6.get_object
				slot9 = align_obj_r_name
				local align_obj_r = slot6(slot7, slot8)
				local align_obj = align_obj_l
				slot8 = shotgun_shell_data.align

				if slot8 then
					slot8 = shotgun_shell_data.align

					if slot8 == "right" then
						align_obj = align_obj_r
					end
				end

				slot10 = self
				slot8 = self._unspawn_shotgun_shell

				slot8(slot9)

				slot8 = World
				slot10 = slot8
				slot8 = slot8.spawn_unit
				slot11 = Idstring
				slot13 = shotgun_shell_data.unit_name
				slot11 = slot11(slot12)
				slot14 = align_obj
				slot12 = align_obj.position
				slot12 = slot12(slot13)
				slot15 = align_obj
				slot13 = align_obj.rotation
				slot8 = slot8(slot9, slot10, slot11, slot13(slot14))
				self._shell = slot8
				slot8 = self._unit
				slot10 = slot8
				slot8 = slot8.link
				slot13 = align_obj
				slot11 = align_obj.name
				slot11 = slot11(slot12)
				slot12 = self._shell
				slot13 = self._shell
				slot15 = slot13
				slot13 = slot13.orientation_object
				slot13 = slot13(slot14)
				slot15 = slot13
				slot13 = slot13.name

				slot8(slot9, slot10, slot11, slot13(slot14))
			end
		end
	end

	return 
end

slot37.anim_clbk_spawn_shotgun_shell = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot3 = self
	slot1 = self._unspawn_shotgun_shell

	slot1(slot2)

	return 
end

slot37.anim_clbk_unspawn_shotgun_shell = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = alive
	slot3 = self._shell
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = self._shell
	slot3 = slot1
	slot1 = slot1.unlink

	slot1(slot2)

	slot1 = World
	slot3 = slot1
	slot1 = slot1.delete_unit
	slot4 = self._shell

	slot1(slot2, slot3)

	slot1 = nil
	self._shell = slot1

	return 
end

slot37._unspawn_shotgun_shell = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._mask_backface_loaded

	if not slot1 then
		slot1 = true
		self._mask_backface_loaded = slot1
	end

	return 
end

slot37.load_fps_mask_units = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._parent_unit

	if slot1 then
		slot1 = self._parent_unit
		slot3 = slot1
		slot1 = slot1.base
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.remove_destroy_listener
		slot4 = "FPCameraPlayerBase"

		slot1(slot2, slot3)
	end

	slot1 = self._light

	if slot1 then
		slot1 = World
		slot3 = slot1
		slot1 = slot1.delete_light
		slot4 = self._light

		slot1(slot2, slot3)
	end

	slot1 = self._light_effect

	if slot1 then
		slot1 = World
		slot3 = slot1
		slot1 = slot1.effect_manager
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.kill
		slot4 = self._light_effect

		slot1(slot2, slot3)

		slot1 = nil
		self._light_effect = slot1
	end

	slot3 = self
	slot1 = self.anim_clbk_unspawn_handcuffs

	slot1(slot2)

	slot3 = self
	slot1 = self.unspawn_grenade

	slot1(slot2)

	slot3 = self
	slot1 = self.unspawn_melee_item

	slot1(slot2)

	slot3 = self
	slot1 = self._unspawn_shotgun_shell

	slot1(slot2)

	slot1 = self._mask_backface_loaded

	if slot1 then
		slot1 = nil
		self._mask_backface_loaded = slot1
	end

	return 
end

slot37.destroy = slot38
slot37 = FPCameraPlayerBase

function slot38(self, _spin)
	slot2 = self._camera_properties
	slot2.spin = _spin

	return 
end

slot37.set_spin = slot38
slot37 = FPCameraPlayerBase

function slot38(self, _pitch)
	slot2 = self._camera_properties
	slot2.pitch = _pitch

	return 
end

slot37.set_pitch = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = self._camera_properties
	slot1 = slot1.current_tilt

	return slot1
end

slot37.current_tilt = slot38
slot37 = FPCameraPlayerBase

function slot38(self, start_t, start_pitch, end_pitch, total_duration)
	slot5 = {}
	self._animate_pitch = slot5
	slot5 = self._animate_pitch
	slot5.start_t = start_t
	slot5 = self._animate_pitch

	if not start_pitch then
		slot6 = self._camera_properties
		slot6 = slot6.pitch
	end

	slot5.start_pitch = slot6
	slot5 = self._animate_pitch
	slot5.end_pitch = end_pitch
	slot5 = self._animate_pitch
	slot5.duration = total_duration

	return 
end

slot37.animate_pitch = slot38
slot37 = FPCameraPlayerBase

function slot38(self)
	slot1 = Application
	slot3 = slot1
	slot1 = slot1.time
	local t = slot1(slot2)
	slot2 = self._animate_pitch
	slot2 = slot2.start_t
	local elapsed_t = t - slot2
	slot3 = self._animate_pitch
	slot3 = slot3.duration
	local step = elapsed_t / slot3
	slot4 = 1

	if slot4 < step then
		slot4 = nil
		self._animate_pitch = slot4
	else
		slot6 = self
		slot4 = self.catmullrom
		slot7 = step
		slot8 = -10
		slot9 = 0
		slot10 = 1
		slot11 = 0.7
		slot4 = slot4(slot5, slot6, slot7, slot8, slot9, slot10)
		step = slot4
		slot4 = self._camera_properties
		slot5 = math
		slot5 = slot5.lerp
		slot7 = self._animate_pitch
		slot7 = slot7.start_pitch
		slot8 = self._animate_pitch
		slot8 = slot8.end_pitch
		slot9 = step
		slot5 = slot5(slot6, slot7, slot8)
		slot4.pitch = slot5
	end

	return 
end

slot37.animate_pitch_upd = slot38
slot37 = FPCameraPlayerBase

function slot38(self, direction, max_tilt, tilt_speed, dt)
	self._tilt_dt = self._tilt_dt or 0
	slot5 = 0

	if direction < slot5 then
		slot5 = self._camera_properties
		slot5 = slot5.current_tilt
		slot6 = 0
	else
		slot5 = 0

		if slot5 < direction then
			slot5 = self._camera_properties
			slot5 = slot5.current_tilt
			slot6 = 0
		else
			slot7 = self
			slot5 = self.set_target_tilt
			slot8 = math
			slot8 = slot8.sign
			slot10 = self._camera_properties
			slot10 = slot10.current_tilt
			slot8 = slot8(slot9)
			slot11 = self
			slot9 = self.smoothstep
			slot12 = 0
			slot13 = max_tilt
			slot14 = self._tilt_dt
			slot15 = tilt_speed
			slot9 = slot9(slot10, slot11, slot12, slot13, slot14)
			slot8 = slot8 * slot9

			slot5(slot6, slot7)

			slot5 = self._tilt_dt
			slot6 = 0

			if slot6 < slot5 then
				slot5 = self._tilt_dt
				slot6 = 2 * dt
				slot5 = slot5 - slot6
				self._tilt_dt = slot5
				slot5 = self._tilt_dt
				slot6 = 0

				if slot5 < slot6 then
					slot5 = 0
					self._tilt_dt = slot5
				end
			end
		end
	end

	return 
end

slot37.update_tilt_smooth = slot38
slot37 = FPCameraPlayerBase

function slot38(self, t, p0, p1, p2, p3)
	slot6 = 2 * p1
	slot7 = -p0
	slot7 = slot7 + p2
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot7 = 2 * p0
	slot8 = 5 * p1
	slot7 = slot7 - slot8
	slot8 = 4 * p2
	slot7 = slot7 + slot8
	slot7 = slot7 - p3
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot7 = -p0
	slot8 = 3 * p1
	slot7 = slot7 + slot8
	slot8 = 3 * p2
	slot7 = slot7 - slot8
	slot7 = slot7 + p3
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot7 = slot7 * t
	slot6 = slot6 + slot7
	slot6 = 0.5 * slot6

	return slot6
end

slot37.catmullrom = slot38
slot37 = FPCameraPlayerBase

function slot38(self, a, b, step, n)
	local v = step / n
	slot6 = 1 - v
	slot7 = 1 - v
	slot6 = slot6 * slot7
	v = 1 - slot6
	slot6 = 1 - v
	slot6 = a * slot6
	slot7 = b * v
	local x = slot6 + slot7

	return x
end

slot37.smoothstep = slot38

return 
