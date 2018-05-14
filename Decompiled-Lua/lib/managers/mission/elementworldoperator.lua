-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ElementWorldOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldOperator = slot0
function ElementWorldOperator:init(...)
	slot3 = self

	ElementWorldOperator.super.init(slot2, ...)

	return 
end
function ElementWorldOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementWorldOperator:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementWorldOperator:_get_unit(unit_id)
	if false then
		slot5 = unit_id

		return managers.editor.unit_with_id(slot3, managers.editor)
	else
		slot5 = unit_id

		return managers.worlddefinition.get_unit(slot3, managers.worlddefinition)
	end

	return 
end
function ElementWorldOperator:_apply_operator(mission_script_element)
	if mission_script_element then
		if mission_script_element.execute_action then
			slot5 = self._values.operation

			mission_script_element.execute_action(slot3, mission_script_element)
		else
			slot6 = self._editor_name
			slot9 = mission_script_element

			Application.error(slot3, Application, "WorldOperator applied to a unit that does not have execute action. ", inspect(slot8))
		end
	else
		slot5 = "WorldOperator applied to a unit that doesn't exist - operator: "
		slot8 = self._unit

		Application.error(slot3, Application, inspect(slot7))
	end

	return 
end
function ElementWorldOperator:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot6 = self._editor_name

	Application.debug(slot3, Application, "ElementWorldOperator:on_executed")

	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementWorldOperator.super.on_executed(slot3, self)

	return 
end

return 
