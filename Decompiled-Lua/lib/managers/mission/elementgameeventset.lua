slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementGameEventSet then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGameEventSet = slot0
function ElementGameEventSet:init(...)
	slot3 = self

	ElementGameEventSet.super.init(slot2, ...)

	return 
end
function ElementGameEventSet:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementGameEventSet.super.on_executed(slot3, self)

	return 
end
function ElementGameEventSet:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
