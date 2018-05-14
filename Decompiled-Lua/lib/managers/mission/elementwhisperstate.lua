slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementWhisperState then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWhisperState = slot0
function ElementWhisperState:init(...)
	slot3 = self

	ElementWhisperState.super.init(slot2, ...)

	return 
end
function ElementWhisperState:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementWhisperState:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot5 = self._values.state

	managers.groupai.state(slot3).set_whisper_mode(slot3, managers.groupai.state(slot3))

	slot5 = instigator

	ElementWhisperState.super.on_executed(slot3, self)

	return 
end

return 
