ScriptUnitData = ScriptUnitData or class()
UnitBase = UnitBase or class()
function UnitBase:init(unit, update_enabled)
	self._unit = unit

	if not update_enabled then
		slot8 = "base"

		unit.set_extension_update_enabled(slot4, unit, Idstring(false))
	end

	return 
end
function UnitBase:pre_destroy(unit)
	self._destroying = true

	return 
end

return 
