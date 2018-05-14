slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreChangeCameraCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreChangeCameraCutsceneKey = slot0
CoreChangeCameraCutsceneKey.ELEMENT_NAME = "change_camera"
CoreChangeCameraCutsceneKey.NAME = "Camera Change"
slot4 = nil

CoreChangeCameraCutsceneKey.register_serialized_attribute("Camera Change", CoreChangeCameraCutsceneKey, "camera")

function CoreChangeCameraCutsceneKey:__tostring()
	slot4 = self

	return "Change camera to \"" .. self.camera(slot3) .. "\"."
end
function CoreChangeCameraCutsceneKey:load(key_node, loading_class)
	slot7 = loading_class

	self.super.load(slot4, self, key_node)

	if self.__camera == nil then
		slot6 = "ref_obj_name"
		self.__camera = key_node.parameter(slot4, key_node) or "camera"
	end

	return 
end
function CoreChangeCameraCutsceneKey:evaluate(player, fast_forward)
	slot5 = player
	slot8 = self

	player.set_camera(slot4, self.camera(slot7))

	return 
end
function CoreChangeCameraCutsceneKey:is_valid_camera(camera)
	slot5 = camera

	if self.super.is_valid_unit_name(slot3, self) then
		slot5 = "camera"
		slot2 = string.begins(slot3, camera)
	end

	return slot2
end

return 
