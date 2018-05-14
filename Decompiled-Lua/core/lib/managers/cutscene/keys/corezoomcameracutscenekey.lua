-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreZoomCameraCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreZoomCameraCutsceneKey = slot0
CoreZoomCameraCutsceneKey.ELEMENT_NAME = "camera_zoom"
CoreZoomCameraCutsceneKey.NAME = "Camera Zoom"
CoreZoomCameraCutsceneKey.DEFAULT_CAMERA_FOV = 55
CoreZoomCameraCutsceneKey.INTERPOLATION_FUNCTIONS = {
	Linear = function (t, bias)
		return t
	end,
	["J curve"] = function (t, bias)
		local b = 2 * (1 - bias)
		local a = 1 - b

		return a * t^2 + b * t
	end,
	["S curve"] = function (t, bias)
		local a = 1 + bias * 2
		local b = a + 1

		return b * t^a - a * t^b
	end
}
slot5 = tonumber

CoreZoomCameraCutsceneKey.register_serialized_attribute(, CoreZoomCameraCutsceneKey, "start_fov", CoreZoomCameraCutsceneKey.DEFAULT_CAMERA_FOV)

slot5 = tonumber

CoreZoomCameraCutsceneKey.register_serialized_attribute(, CoreZoomCameraCutsceneKey, "end_fov", CoreZoomCameraCutsceneKey.DEFAULT_CAMERA_FOV)

slot5 = tonumber

CoreZoomCameraCutsceneKey.register_serialized_attribute(, CoreZoomCameraCutsceneKey, "transition_time", 0)

slot4 = "Linear"

CoreZoomCameraCutsceneKey.register_serialized_attribute(, CoreZoomCameraCutsceneKey, "interpolation")

function slot5(n)
	slot3 = n

	return (tonumber(slot2) or 0) / 100
end

CoreZoomCameraCutsceneKey.register_serialized_attribute(, CoreZoomCameraCutsceneKey, "interpolation_bias", 0.5)

CoreZoomCameraCutsceneKey.__tostring = function (self)
	return "Change camera zoom."
end
CoreZoomCameraCutsceneKey.populate_from_editor = function (self, cutscene_editor)
	slot5 = cutscene_editor

	self.super.populate_from_editor(slot3, self)

	local camera_attributes = cutscene_editor.camera_attributes(slot3)
	slot6 = camera_attributes.fov

	self.set_start_fov(cutscene_editor, self)

	slot6 = camera_attributes.fov

	self.set_end_fov(cutscene_editor, self)

	return 
end
CoreZoomCameraCutsceneKey.play = function (self, player, undo, fast_forward)
	if undo then
		slot6 = self
		local preceeding_key = self.preceeding_key(slot5)

		if preceeding_key then
			slot8 = "fov"
			slot11 = preceeding_key

			player.set_camera_attribute(slot6, player, preceeding_key.end_fov(slot10))
		else
			slot9 = CoreZoomCameraCutsceneKey.DEFAULT_CAMERA_FOV

			player.set_camera_attribute(slot6, player, "fov")
		end
	else
		slot7 = "fov"
		slot10 = self

		player.set_camera_attribute(slot5, player, self.start_fov(slot9))
	end

	return 
end
CoreZoomCameraCutsceneKey.update = function (self, player, time)
	slot5 = self
	local transition_time = self.transition_time(slot4)

	if time <= transition_time + 0.03333333333333333 then
	end

	return 
end
CoreZoomCameraCutsceneKey.is_valid_start_fov = function (self, value)
	return value and 0 < value and value < 180
end
CoreZoomCameraCutsceneKey.is_valid_transition_time = function (self, value)
	return value and 0 <= value
end
CoreZoomCameraCutsceneKey.is_valid_interpolation = function (self, value)
	return self.INTERPOLATION_FUNCTIONS[value] ~= nil
end
CoreZoomCameraCutsceneKey.is_valid_interpolation_bias = function (self, value)
	return value and 0 <= value and value <= 1
end
CoreZoomCameraCutsceneKey.is_valid_end_fov = CoreZoomCameraCutsceneKey.is_valid_start_fov
CoreZoomCameraCutsceneKey.control_for_interpolation = CoreCutsceneKeyBase.standard_combo_box_control
CoreZoomCameraCutsceneKey.control_for_interpolation_bias = CoreCutsceneKeyBase.standard_percentage_slider_control
slot4 = "interpolation"

function slot8(a, b)
	return a == "Linear" or a < b
end

CoreZoomCameraCutsceneKey.refresh_control_for_interpolation = CoreCutsceneKeyBase.standard_combo_box_control_refresh(CoreZoomCameraCutsceneKey, CoreCutsceneKeyBase, table.map_keys(slot6, CoreZoomCameraCutsceneKey.INTERPOLATION_FUNCTIONS))
slot4 = "interpolation_bias"
CoreZoomCameraCutsceneKey.refresh_control_for_interpolation_bias = CoreCutsceneKeyBase.standard_percentage_slider_control_refresh(CoreZoomCameraCutsceneKey, CoreCutsceneKeyBase)
CoreZoomCameraCutsceneKey._calc_interpolation = function (self, t)
	slot5 = self
	local interpolation_func = self.INTERPOLATION_FUNCTIONS[self.interpolation(slot4)]
	slot5 = t
	slot10 = self
	slot10 = 1

	return interpolation_func(slot4, math.clamp(slot7, self.interpolation_bias(slot9), 0))
end

return 
