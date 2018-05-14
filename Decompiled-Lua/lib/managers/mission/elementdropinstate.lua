slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDropinState then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDropinState = slot0
function ElementDropinState:init(...)
	slot3 = self

	ElementDropinState.super.init(slot2, ...)

	return 
end
function ElementDropinState:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementDropinState:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot5 = self._values.state

	managers.groupai.state(slot3).set_allow_dropin(slot3, managers.groupai.state(slot3))

	slot5 = instigator

	ElementDropinState.super.on_executed(slot3, self)

	return 
end

return 
