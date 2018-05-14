slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementVariableSet then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementVariableSet = slot0
function ElementVariableSet:init(...)
	slot3 = self

	ElementVariableSet.super.init(slot2, ...)

	return 
end
function ElementVariableSet:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementVariableSet.super.on_executed(slot3, self)

	return 
end
function ElementVariableSet:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
