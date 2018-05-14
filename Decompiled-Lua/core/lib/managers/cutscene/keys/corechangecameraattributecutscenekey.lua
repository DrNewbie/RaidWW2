slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreChangeCameraAttributeCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreChangeCameraAttributeCutsceneKey = slot0
CoreChangeCameraAttributeCutsceneKey.ELEMENT_NAME = "camera_attribute"
CoreChangeCameraAttributeCutsceneKey.NAME = "Camera Attribute"
slot5 = tonumber

CoreChangeCameraAttributeCutsceneKey.register_serialized_attribute("Camera Attribute", CoreChangeCameraAttributeCutsceneKey, "near_range", nil)

slot5 = tonumber

CoreChangeCameraAttributeCutsceneKey.register_serialized_attribute("Camera Attribute", CoreChangeCameraAttributeCutsceneKey, "far_range", nil)

slot4 = "far_range"

CoreChangeCameraAttributeCutsceneKey.attribute_affects("Camera Attribute", CoreChangeCameraAttributeCutsceneKey, "near_range")

slot4 = "near_range"

CoreChangeCameraAttributeCutsceneKey.attribute_affects("Camera Attribute", CoreChangeCameraAttributeCutsceneKey, "far_range")

function CoreChangeCameraAttributeCutsceneKey:__tostring()
	return "Change camera attributes."
end
function CoreChangeCameraAttributeCutsceneKey:populate_from_editor(cutscene_editor)
	slot5 = cutscene_editor

	self.super.populate_from_editor(slot3, self)

	local camera_attributes = cutscene_editor.camera_attributes(slot3)
	slot6 = camera_attributes.near_range

	self.set_near_range(cutscene_editor, self)

	slot6 = camera_attributes.far_range

	self.set_far_range(cutscene_editor, self)

	return 
end
function CoreChangeCameraAttributeCutsceneKey:is_valid()
	return true
end
function CoreChangeCameraAttributeCutsceneKey:evaluate(player, fast_forward)
	local function set_attribute_if_valid(attribute_name)
		slot4 = attribute_name
		local value = self.attribute_value(slot2, self)

		if value then
			slot5 = value

			if self["is_valid_" .. attribute_name]("is_valid_" .. attribute_name, self) then
				slot6 = value

				player.set_camera_attribute(slot3, player, attribute_name)
			end
		end

		return 
	end

	slot6 = self.__serialized_attributes

	for attribute_name, _ in pairs(slot5) do
		slot11 = attribute_name

		set_attribute_if_valid(slot10)
	end

	return 
end
function CoreChangeCameraAttributeCutsceneKey:is_valid_near_range(value)
	return value == nil or (0 < value and value < slot2)
end
function CoreChangeCameraAttributeCutsceneKey:is_valid_far_range(value)
	return value == nil or slot2 < value
end

return 
