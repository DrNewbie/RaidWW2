GreedItem = GreedItem or class()
function GreedItem:init(unit)
	self._unit = unit
	self._value = 0

	return 
end
function GreedItem:set_value(value)
	self._value = value

	return 
end
function GreedItem:value()
	return self._value
end
function GreedItem:on_load_complete()
	if not self._dont_register then
		slot6 = self._unit
		slot4 = self._unit.unit_data(slot5).unit_id
		local world_id = managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection).world_id(slot2)
		slot7 = world_id

		managers.greed.register_greed_item(managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection), managers.greed, self._unit, self._tweak_table)
	end

	slot4 = tweak_data.greed.greed_items[self._tweak_table].value

	self.set_value(slot2, self)

	return 
end

return 
