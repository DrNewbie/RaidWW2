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
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

slot2 = "core/lib/utils/dev/ews/CoreCameraDistancePicker"

require(slot1)

if not CoreDepthOfFieldCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreDepthOfFieldCutsceneKey = slot0
CoreDepthOfFieldCutsceneKey.ELEMENT_NAME = "camera_focus"
CoreDepthOfFieldCutsceneKey.NAME = "Camera Focus"
CoreDepthOfFieldCutsceneKey.DEFAULT_NEAR_DISTANCE = 15
CoreDepthOfFieldCutsceneKey.DEFAULT_FAR_DISTANCE = 10000
slot5 = tonumber

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "near_distance", CoreDepthOfFieldCutsceneKey.DEFAULT_NEAR_DISTANCE)

slot5 = tonumber

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "far_distance", CoreDepthOfFieldCutsceneKey.DEFAULT_FAR_DISTANCE)

slot4 = ""

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "tracked_unit_name")

slot4 = ""

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "tracked_object_name")

slot3 = "divider1"

CoreDepthOfFieldCutsceneKey.register_control(10000, CoreDepthOfFieldCutsceneKey)

slot5 = tonumber

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "transition_time", 0)

slot3 = "divider2"

CoreDepthOfFieldCutsceneKey.register_control(10000, CoreDepthOfFieldCutsceneKey)

slot5 = tonumber

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "target_near_distance", CoreDepthOfFieldCutsceneKey.DEFAULT_NEAR_DISTANCE)

slot5 = tonumber

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "target_far_distance", CoreDepthOfFieldCutsceneKey.DEFAULT_FAR_DISTANCE)

slot4 = ""

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_unit_name")

slot4 = ""

CoreDepthOfFieldCutsceneKey.register_serialized_attribute(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_object_name")

slot4 = "near_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "tracked_unit_name")

slot4 = "far_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "tracked_unit_name")

slot4 = "tracked_object_name"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "tracked_unit_name")

slot4 = "near_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "tracked_object_name")

slot4 = "far_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "tracked_object_name")

slot4 = "target_near_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "transition_time")

slot4 = "target_far_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "transition_time")

slot4 = "target_tracked_unit_name"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "transition_time")

slot4 = "target_tracked_object_name"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "transition_time")

slot4 = "target_near_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_unit_name")

slot4 = "target_far_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_unit_name")

slot4 = "target_tracked_object_name"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_unit_name")

slot4 = "target_near_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_object_name")

slot4 = "target_far_distance"

CoreDepthOfFieldCutsceneKey.attribute_affects(10000, CoreDepthOfFieldCutsceneKey, "target_tracked_object_name")

CoreDepthOfFieldCutsceneKey.control_for_tracked_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreDepthOfFieldCutsceneKey.control_for_tracked_object_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreDepthOfFieldCutsceneKey.control_for_divider1 = CoreCutsceneKeyBase.standard_divider_control
CoreDepthOfFieldCutsceneKey.control_for_divider2 = CoreCutsceneKeyBase.standard_divider_control
CoreDepthOfFieldCutsceneKey.control_for_target_tracked_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreDepthOfFieldCutsceneKey.control_for_target_tracked_object_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreDepthOfFieldCutsceneKey:__tostring()
	return "Change camera focus."
end
function CoreDepthOfFieldCutsceneKey:populate_from_editor(cutscene_editor)
	slot5 = cutscene_editor

	self.super.populate_from_editor(slot3, self)

	slot4 = cutscene_editor
	local camera_attributes = cutscene_editor.camera_attributes(slot3)
	local near = camera_attributes.near_focus_distance_max or self.DEFAULT_NEAR_DISTANCE
	local far = camera_attributes.far_focus_distance_min or self.DEFAULT_FAR_DISTANCE
	slot8 = near

	self.set_near_distance(slot6, self)

	slot8 = far

	self.set_far_distance(slot6, self)

	slot8 = near

	self.set_target_near_distance(slot6, self)

	slot8 = far

	self.set_target_far_distance(slot6, self)

	return 
end
function CoreDepthOfFieldCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot6 = self
		local preceeding_key = self.preceeding_key(slot5)

		if preceeding_key then
			slot12 = player
			slot9 = preceeding_key._final_target_near_distance(slot10, preceeding_key)
			slot13 = player

			self._set_camera_depth_of_field(slot6, self, player, preceeding_key._final_target_far_distance(preceeding_key, preceeding_key))
		else
			slot10 = self.DEFAULT_FAR_DISTANCE

			self._set_camera_depth_of_field(slot6, self, player, self.DEFAULT_NEAR_DISTANCE)
		end
	else
		slot6 = self

		if self._is_editing_target_values(slot5) then
			slot11 = player
			slot8 = self._final_target_near_distance(slot9, self)
			slot12 = player

			self._set_camera_depth_of_field(slot5, self, player, self._final_target_far_distance(self, self))
		else
			slot11 = player
			slot8 = self._final_near_distance(slot9, self)
			slot12 = player

			self._set_camera_depth_of_field(slot5, self, player, self._final_far_distance(self, self))
		end
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:update(player, time)

	-- Decompilation error in this vicinity:
	slot5 = self
	local transition_time = self.transition_time(slot4)
	slot9 = player
	local start_near = self._final_near_distance(slot7, self)

	if transition_time ~= 0 or not start_near then
		slot10 = player
		local end_near = self._final_target_near_distance(slot8, self)
	end

	local near = start_near + (end_near - start_near) * alpha
	slot12 = player
	local start_far = self._final_far_distance(slot10, self)

	if transition_time ~= 0 or not start_far then
		slot13 = player
		local end_far = self._final_target_far_distance(slot11, self)
	end

	local far = start_far + (end_far - start_far) * alpha
	slot17 = far

	self._set_camera_depth_of_field(slot13, self, player, near)

	return 
end
function CoreDepthOfFieldCutsceneKey:update_gui(time, delta_time, player)
	if player then
		slot6 = player
		local cutscene_camera_enabled = player.is_viewport_enabled(slot5)
	end

	if self.__near_distance_control then
		slot9 = delta_time

		self.__near_distance_control.update(slot6, self.__near_distance_control, time)

		slot8 = cutscene_camera_enabled

		self.__near_distance_control.set_pick_button_enabled(slot6, self.__near_distance_control)
	end

	if self.__far_distance_control then
		slot9 = delta_time

		self.__far_distance_control.update(slot6, self.__far_distance_control, time)

		slot8 = cutscene_camera_enabled

		self.__far_distance_control.set_pick_button_enabled(slot6, self.__far_distance_control)
	end

	if self.__target_near_distance_control then
		slot9 = delta_time

		self.__target_near_distance_control.update(slot6, self.__target_near_distance_control, time)

		slot8 = cutscene_camera_enabled

		self.__target_near_distance_control.set_pick_button_enabled(slot6, self.__target_near_distance_control)
	end

	if self.__target_far_distance_control then
		slot9 = delta_time

		self.__target_far_distance_control.update(slot6, self.__target_far_distance_control, time)

		slot8 = cutscene_camera_enabled

		self.__target_far_distance_control.set_pick_button_enabled(slot6, self.__target_far_distance_control)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:is_valid_near_distance(value)
	return value == nil or 0 <= value
end
function CoreDepthOfFieldCutsceneKey:is_valid_far_distance(value)
	return value == nil or 0 <= value
end
function CoreDepthOfFieldCutsceneKey:is_valid_tracked_unit_name(value)
	if value ~= nil and value ~= "" then
		slot5 = value
		slot2 = CoreCutsceneKeyBase.is_valid_unit_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_unit_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
function CoreDepthOfFieldCutsceneKey:is_valid_tracked_object_name(value)
end
function CoreDepthOfFieldCutsceneKey:is_valid_transition_time(value)

	-- Decompilation error in this vicinity:
	return value and 0 <= value
end
function CoreDepthOfFieldCutsceneKey:is_valid_target_near_distance(value)
	return value == nil or 0 <= value
end
function CoreDepthOfFieldCutsceneKey:is_valid_target_far_distance(value)
	return value == nil or 0 <= value
end
function CoreDepthOfFieldCutsceneKey:is_valid_target_tracked_unit_name(value)
	if value ~= nil and value ~= "" then
		slot5 = value
		slot2 = CoreCutsceneKeyBase.is_valid_unit_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_unit_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
function CoreDepthOfFieldCutsceneKey:is_valid_target_tracked_object_name(value)
end
function CoreDepthOfFieldCutsceneKey:control_for_near_distance(parent_frame, callback_func)
	slot6 = parent_frame
	slot9 = self
	self.__near_distance_control = CoreCameraDistancePicker.new(slot4, CoreCameraDistancePicker, self.near_distance(slot8))
	slot7 = callback_func

	self.__near_distance_control.connect(slot4, self.__near_distance_control, "EVT_COMMAND_TEXT_UPDATED")

	return self.__near_distance_control
end
function CoreDepthOfFieldCutsceneKey:control_for_far_distance(parent_frame, callback_func)
	slot6 = parent_frame
	slot9 = self
	self.__far_distance_control = CoreCameraDistancePicker.new(slot4, CoreCameraDistancePicker, self.far_distance(slot8))
	slot7 = callback_func

	self.__far_distance_control.connect(slot4, self.__far_distance_control, "EVT_COMMAND_TEXT_UPDATED")

	return self.__far_distance_control
end
function CoreDepthOfFieldCutsceneKey:control_for_target_near_distance(parent_frame, callback_func)
	slot6 = parent_frame
	slot9 = self
	self.__target_near_distance_control = CoreCameraDistancePicker.new(slot4, CoreCameraDistancePicker, self.target_near_distance(slot8))
	slot7 = callback_func

	self.__target_near_distance_control.connect(slot4, self.__target_near_distance_control, "EVT_COMMAND_TEXT_UPDATED")

	return self.__target_near_distance_control
end
function CoreDepthOfFieldCutsceneKey:control_for_target_far_distance(parent_frame, callback_func)
	slot6 = parent_frame
	slot9 = self
	self.__target_far_distance_control = CoreCameraDistancePicker.new(slot4, CoreCameraDistancePicker, self.target_far_distance(slot8))
	slot7 = callback_func

	self.__target_far_distance_control.connect(slot4, self.__target_far_distance_control, "EVT_COMMAND_TEXT_UPDATED")

	return self.__target_far_distance_control
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_tracked_unit_name(control)

	-- Decompilation error in this vicinity:
	slot5 = control
	slot8 = self

	self.refresh_control_for_unit_name(slot3, self, self.tracked_unit_name(slot7))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.tracked_unit_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_tracked_object_name(control)

	-- Decompilation error in this vicinity:
	slot6 = self.tracked_unit_name(slot7)
	slot9 = self

	self.refresh_control_for_object_name(slot3, self, control, self.tracked_object_name(self))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_target_tracked_unit_name(control)
	slot5 = control
	slot8 = self

	self.refresh_control_for_unit_name(slot3, self, self.target_tracked_unit_name(slot7))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.target_tracked_unit_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	slot7 = self
	slot5 = 0 < self.transition_time(slot6)

	control.set_enabled(slot3, control)

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_target_tracked_object_name(control)

	-- Decompilation error in this vicinity:
	slot6 = self.target_tracked_unit_name(slot7)
	slot9 = self

	self.refresh_control_for_object_name(slot3, self, control, self.target_tracked_object_name(self))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self
	slot4 = control
	slot2 = control.set_enabled
	slot7 = self
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_near_distance(control)
	slot4 = control

	control.set_value(slot3, tostring(self.near_distance(slot8)))

	slot8 = self.tracked_object_name(self)
	slot11 = self
	slot5 = not self.is_valid_object_name(slot6, self, self.tracked_unit_name(self))

	control.set_enabled(slot3, control)

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_far_distance(control)
	slot4 = control

	control.set_value(slot3, tostring(self.far_distance(slot8)))

	slot8 = self.tracked_object_name(self)
	slot11 = self
	slot5 = not self.is_valid_object_name(slot6, self, self.tracked_unit_name(self))

	control.set_enabled(slot3, control)

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_target_near_distance(control)
	slot4 = control
	slot9 = self

	control.set_value(slot3, tostring(self.target_near_distance(slot8)))

	slot4 = control
	slot2 = control.set_enabled
	slot7 = self

	if 0 < self.transition_time(slot6) then
		slot8 = self.target_tracked_object_name(slot9)
		slot11 = self
		slot5 = not self.is_valid_object_name(slot6, self, self.target_tracked_unit_name(self))
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	slot2(slot3, slot4)

	return 
end
function CoreDepthOfFieldCutsceneKey:refresh_control_for_target_far_distance(control)
	slot4 = control
	slot9 = self

	control.set_value(slot3, tostring(self.target_far_distance(slot8)))

	slot4 = control
	slot2 = control.set_enabled
	slot7 = self

	if 0 < self.transition_time(slot6) then
		slot8 = self.target_tracked_object_name(slot9)
		slot11 = self
		slot5 = not self.is_valid_object_name(slot6, self, self.target_tracked_unit_name(self))
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	slot2(slot3, slot4)

	return 
end
function CoreDepthOfFieldCutsceneKey:_set_camera_depth_of_field(player, near, far)
	slot7 = near
	slot11 = near

	player.set_camera_depth_of_field(slot5, player, math.max(slot9, far))

	return 
end
function CoreDepthOfFieldCutsceneKey:_is_editing_initial_values()
	slot3 = Application

	if Application.ews_enabled(slot2) then
	end

	return slot1
end
function CoreDepthOfFieldCutsceneKey:_is_editing_target_values()
	slot3 = Application

	if Application.ews_enabled(slot2) then
	end

	return slot1
end
function CoreDepthOfFieldCutsceneKey:_final_near_distance(player)
	slot5 = self.tracked_unit_name(slot6)
	slot8 = self
	local distance = player.distance_from_camera(slot3, player, self.tracked_object_name(self))
	slot5 = self
	local hyperfocal_distance = self._hyperfocal_distance(player)

	if distance and hyperfocal_distance then
		return (distance < hyperfocal_distance and (hyperfocal_distance * distance) / (hyperfocal_distance + distance)) or hyperfocal_distance / 2
	else
		slot6 = self

		return self.near_distance(slot5)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:_final_far_distance(player)
	slot5 = self.tracked_unit_name(slot6)
	slot8 = self
	local distance = player.distance_from_camera(slot3, player, self.tracked_object_name(self))
	slot5 = self
	local hyperfocal_distance = self._hyperfocal_distance(player)

	if distance and hyperfocal_distance then
		return (distance < hyperfocal_distance and (hyperfocal_distance * distance) / (hyperfocal_distance - distance)) or distance
	else
		slot6 = self

		return self.far_distance(slot5)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:_final_target_near_distance(player)
	slot5 = self.target_tracked_unit_name(slot6)
	slot8 = self
	local distance = player.distance_from_camera(slot3, player, self.target_tracked_object_name(self))
	slot5 = self
	local hyperfocal_distance = self._hyperfocal_distance(player)

	if distance and hyperfocal_distance then
		return (distance < hyperfocal_distance and (hyperfocal_distance * distance) / (hyperfocal_distance + distance)) or hyperfocal_distance / 2
	else
		slot6 = self

		return self.target_near_distance(slot5)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:_final_target_far_distance(player)
	slot5 = self.target_tracked_unit_name(slot6)
	slot8 = self
	local distance = player.distance_from_camera(slot3, player, self.target_tracked_object_name(self))
	slot5 = self
	local hyperfocal_distance = self._hyperfocal_distance(player)

	if distance and hyperfocal_distance then
		return (distance < hyperfocal_distance and (hyperfocal_distance * distance) / (hyperfocal_distance - distance)) or distance
	else
		slot6 = self

		return self.target_far_distance(slot5)
	end

	return 
end
function CoreDepthOfFieldCutsceneKey:_hyperfocal_distance()
	return 1433
end
function CoreDepthOfFieldCutsceneKey:_calc_interpolation(t)
	return 3 * t^2 - 2 * t^3
end

return 
