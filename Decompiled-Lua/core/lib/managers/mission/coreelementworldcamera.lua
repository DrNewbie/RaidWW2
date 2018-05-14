slot3 = "CoreElementWorldCamera"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementWorldCamera then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldCamera = slot0
function ElementWorldCamera:init(...)
	slot3 = self

	ElementWorldCamera.super.init(slot2, ...)

	return 
end
function ElementWorldCamera:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementWorldCamera:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.worldcamera_sequence and self._values.worldcamera_sequence ~= "none" then
		slot5 = self._values.worldcamera_sequence

		managers.worldcamera.play_world_camera_sequence(slot3, managers.worldcamera)
	elseif self._values.worldcamera ~= "none" then
		slot5 = self._values.worldcamera

		managers.worldcamera.play_world_camera(slot3, managers.worldcamera)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Can not play worldcamera or sequence \"none\""

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementWorldCamera.super.on_executed(slot3, self)

	return 
end

if not ElementWorldCameraTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldCameraTrigger = slot0
function ElementWorldCameraTrigger:init(...)
	slot3 = self

	ElementWorldCameraTrigger.super.init(slot2, ...)

	if self._values.worldcamera_trigger_sequence ~= "none" then
		if self._values.worldcamera_trigger_after_clip == "done" then
			slot4 = self._values.worldcamera_trigger_sequence
			slot9 = "on_executed"
			self._sequence = managers.worldcamera.add_sequence_done_callback(slot2, managers.worldcamera, callback(slot6, self, self))
		else
			slot5 = self._values.worldcamera_trigger_after_clip
			slot10 = "on_executed"
			self._sequence = managers.worldcamera.add_sequence_camera_clip_callback(slot2, managers.worldcamera, self._values.worldcamera_trigger_sequence, callback(slot7, self, self))
		end
	end

	return 
end
function ElementWorldCameraTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.mission
	instigator = managers.mission.default_instigator(slot3)
	slot5 = instigator

	ElementWorldCameraTrigger.super.on_executed(slot3, self)

	return 
end

return 
