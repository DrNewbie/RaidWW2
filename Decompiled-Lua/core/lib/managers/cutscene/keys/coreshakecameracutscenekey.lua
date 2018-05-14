slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreShakeCameraCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreShakeCameraCutsceneKey = slot0
CoreShakeCameraCutsceneKey.ELEMENT_NAME = "camera_shaker"
CoreShakeCameraCutsceneKey.NAME = "Camera Shake"
slot4 = ""

CoreShakeCameraCutsceneKey.register_serialized_attribute("Camera Shake", CoreShakeCameraCutsceneKey, "name")

slot5 = tonumber

CoreShakeCameraCutsceneKey.register_serialized_attribute("Camera Shake", CoreShakeCameraCutsceneKey, "amplitude", 1)

slot5 = tonumber

CoreShakeCameraCutsceneKey.register_serialized_attribute("Camera Shake", CoreShakeCameraCutsceneKey, "frequency", 1)

slot5 = tonumber

CoreShakeCameraCutsceneKey.register_serialized_attribute("Camera Shake", CoreShakeCameraCutsceneKey, "offset", 0)

function CoreShakeCameraCutsceneKey:__tostring()
	slot4 = self

	return "Trigger camera shake \"" .. self.name(slot3) .. "\"."
end
function CoreShakeCameraCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot6 = self

		self.stop(slot5)
	elseif not fast_forward then
		slot6 = self

		self.stop(slot5)

		slot9 = self.frequency(self)
		slot12 = self
		self._shake_abort_func = player.play_camera_shake(slot5, player, self.name(slot8), self.amplitude(self), self.offset(self))
	end

	return 
end
function CoreShakeCameraCutsceneKey:stop()
	if self._shake_abort_func then
		self._shake_abort_func()

		self._shake_abort_func = nil
	end

	return 
end

return 
