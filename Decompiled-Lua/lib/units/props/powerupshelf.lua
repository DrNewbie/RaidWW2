-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PowerupShelf then
	slot2 = UnitBase
	slot0 = class(slot1)
end

PowerupShelf = slot0
function PowerupShelf:init(unit)
	slot6 = false

	PowerupShelf.super.init(slot3, self, unit)

	self._unit = unit
	self._pickups_spawned = false

	return 
end
function PowerupShelf:spawn_pickups()

	-- Decompilation error in this vicinity:
	slot3 = self._unit
	slot6 = "item_01"
	local loot_locator = self._unit.get_object(slot2, Idstring(slot5))
	local index = 2

	while loot_locator ~= nil do
		managers.drop_loot.drop_item(slot4, managers.drop_loot, self._tweak_table, loot_locator.rotation(loot_locator))

		slot5 = self._unit
		slot12 = index
		slot8 = "item_" .. string.format(loot_locator, "%02d")
		loot_locator = self._unit.get_object(slot4, Idstring(loot_locator.position(slot8)))
		index = index + 1
	end

	self._pickups_spawned = true

	return 
end
function PowerupShelf:set_tweak_data(new_tweak_table)
	self._tweak_table = new_tweak_table

	return 
end

return 
