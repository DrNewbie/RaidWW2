if not SpawnPlayerHubElement then
	slot2 = HubElement
	slot0 = class(slot1)
end

SpawnPlayerHubElement = slot0
function SpawnPlayerHubElement:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	slot5 = "unit:position"

	table.insert(slot3, self._save_values)

	slot5 = "unit:rotation"

	table.insert(slot3, self._save_values)

	return 
end

return 
