Loot = Loot or class()
function Loot:init(unit)
	self._unit = unit
	self._value = 0
	slot7 = "loot_drop"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(false))

	return 
end
function Loot:set_value(value)
	self._value = value

	return 
end
function Loot:value()
	return self._value
end
function Loot:on_load_complete()
	slot6 = self._unit
	slot4 = self._unit.unit_data(slot5).unit_id
	local world_id = managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection).world_id(slot2)
	slot7 = world_id

	managers.lootdrop.register_loot(managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection), managers.lootdrop, self._unit, self._loot_size)

	return 
end

return 
