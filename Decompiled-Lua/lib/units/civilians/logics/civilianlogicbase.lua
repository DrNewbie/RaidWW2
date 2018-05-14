slot2 = "lib/units/enemies/cop/logics/CopLogicBase"

require(slot1)

slot2 = CopLogicBase
CivilianLogicBase = class(slot1)
function CivilianLogicBase.on_objective_unit_destroyed(data, unit)
	slot4 = data.unit

	if not alive(slot3) then
		slot8 = data.objective
		slot7 = data.name

		debug_pause(slot3, "dead unit did not remove destroy listener", data.debug_name, inspect(slot7))

		return 
	end

	data.objective.destroy_clbk_key = nil
	data.objective.death_clbk_key = nil
	slot5 = data.objective

	data.objective_failed_clbk(nil, data.unit)

	return 
end

return 
