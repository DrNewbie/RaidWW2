slot3 = "CoreElementOperator"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementOperator = slot0
function ElementOperator:init(...)
	slot3 = self

	ElementOperator.super.init(slot2, ...)

	return 
end
function ElementOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.operation == "add" then
				slot10 = element

				element.operation_add(slot9)
			elseif self._values.operation == "remove" then
				slot10 = element

				element.operation_remove(slot9)
			end
		end
	end

	slot5 = instigator

	ElementOperator.super.on_executed(slot3, self)

	return 
end

return 
