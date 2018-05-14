-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ElementNavigationStitcherOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementNavigationStitcherOperator = slot0
function ElementNavigationStitcherOperator:init(...)
	slot3 = self

	ElementNavigationStitcherOperator.super.init(slot2, ...)

	return 
end
function ElementNavigationStitcherOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementNavigationStitcherOperator:_apply_operator(mission_script_element)
	if mission_script_element then
		local call = mission_script_element[self._values.operation]

		if call then
			slot5 = mission_script_element

			call(slot4)
		else
			slot7 = self._values.operation

			Application.error(slot4, Application, "Operator applied to a unit that doesn't support the specified operation - opertion: ")
		end
	else
		slot5 = "WorldOperator applied to a unit that doesn't exist - operator: "
		slot8 = self._unit

		Application.error(slot3, Application, inspect(slot7))
	end

	return 
end
function ElementNavigationStitcherOperator:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot6 = instigator

	ElementWorldOperator.super.on_executed(slot4, self)

	return 
end

return 
