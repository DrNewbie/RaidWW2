slot3 = "CoreElementSpawnUnit"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreUnit"

core.import(slot1, core)

if not ElementSpawnUnit then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnUnit = slot0
function ElementSpawnUnit:init(...)
	slot3 = self

	ElementSpawnUnit.super.init(slot2, ...)

	self._units = {}

	return 
end
function ElementSpawnUnit:client_on_executed(...)
	if self._values.unit_name ~= "none" then
		slot6 = self._values.unit_name
		slot5 = ""
		slot3 = PackageManager.unit_data(slot2, PackageManager, self._values.unit_name.id(slot5))
		local network_sync = PackageManager.unit_data(slot2, PackageManager, self._values.unit_name.id(slot5)).network_sync(slot2)

		if network_sync ~= "none" and network_sync ~= "client" then
			return 
		end
	end

	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementSpawnUnit:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.unit_name ~= "none" then
		slot6 = self._values.rotation
		local unit = CoreUnit.safe_spawn_unit(slot3, self._values.unit_name, self._values.position)

		if self._values.unit_spawn_mass then
			slot7 = self._values.unit_spawn_dir * self._values.unit_spawn_velocity

			unit.push(slot4, unit, self._values.unit_spawn_mass)
		end

		slot6 = unit

		table.insert(slot4, self._units)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant spawn unit \"none\" [" .. self._editor_name .. "]"

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementSpawnUnit.super.on_executed(slot3, self)

	return 
end
function ElementSpawnUnit:units()
	return self._units
end
function ElementSpawnUnit:delete_units()
	slot3 = self._units

	for _, unit in ipairs(slot2) do
		slot9 = 0

		unit.set_slot(slot7, unit)
	end

	self._units = {}

	return 
end
function ElementSpawnUnit:destroy()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self

		self.delete_units(slot2)
	end

	return 
end

return 
