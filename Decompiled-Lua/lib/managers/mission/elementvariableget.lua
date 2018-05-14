slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementVariableGet then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementVariableGet = slot0
function ElementVariableGet:init(...)
	slot3 = self

	ElementVariableGet.super.init(slot2, ...)

	return 
end
function ElementVariableGet:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementVariableGet.super.on_executed(slot3, self)

	return 
end
function ElementVariableGet:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
