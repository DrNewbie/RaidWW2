slot3 = "CoreHelperUnitManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

HelperUnitManager = HelperUnitManager or CoreClass.class()
function HelperUnitManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function HelperUnitManager:clear()
	slot3 = self

	self._setup(slot2)

	return 
end
function HelperUnitManager:_setup()
	self._types = {}

	return 
end
function HelperUnitManager:add_unit(unit, type)
	self._types[type] = self._types[type] or {}
	slot6 = unit

	table.insert(self._types[type] or , self._types[type])

	return 
end
function HelperUnitManager:get_units_by_type(type)
	return self._types[type] or {}
end

return 
