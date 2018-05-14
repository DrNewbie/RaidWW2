slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementVehicleSpawner then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementVehicleSpawner = slot0
function ElementVehicleSpawner:init(...)
	slot3 = self

	ElementVehicleSpawner.super.init(slot2, ...)

	self._vehicles = {}
	slot3 = tweak_data.vehicle

	for k, v in pairs(slot2) do
		if v.unit then
			self._vehicles[k] = v.unit
		end
	end

	self._vehicle_units = {}

	return 
end
function ElementVehicleSpawner:value(name)
	return self._values[name]
end
function ElementVehicleSpawner:client_on_executed(...)
	if not self._values.enabled then
		return 
	end

	return 
end
function ElementVehicleSpawner:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot6 = self._values.rotation
	local vehicle = safe_spawn_unit(slot3, self._vehicles[self._values.vehicle], self._values.position)
	slot6 = vehicle

	table.insert(self._vehicles[self._values.vehicle], self._vehicle_units)

	slot6 = vehicle

	print(self._vehicles[self._values.vehicle], "[ElementVehicleSpawner] Spawned vehicle")

	slot6 = self._unit or instigator

	ElementVehicleSpawner.super.on_executed(slot4, self)

	return 
end
function ElementVehicleSpawner:unspawn_all_units()
	slot3 = self._vehicle_units

	for _, vehicle_unit in ipairs(slot2) do
		slot8 = vehicle_unit

		if alive(slot7) then
			slot9 = vehicle_unit

			managers.vehicle.remove_vehicle(slot7, managers.vehicle)
		end
	end

	return 
end
function ElementVehicleSpawner:stop_simulation(...)
	slot3 = self

	self.unspawn_all_units(slot2)

	return 
end

return 
