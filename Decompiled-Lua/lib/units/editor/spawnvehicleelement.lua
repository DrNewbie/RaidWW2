if not SpawnVehicleElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnVehicleElement = slot0
function SpawnVehicleElement:init(unit)
	slot6 = unit

	Application.trace(slot3, Application, "SpawnVehicleElement:init")

	slot5 = unit

	MissionElement.init(slot3, self)

	self._vehicle_names = {}
	slot4 = tweak_data.vehicle

	for k, v in pairs(slot3) do
		if v.unit then
			slot10 = k

			table.insert_sorted(slot8, self._vehicle_names)
		end
	end

	self._hed.state = VehicleDrivingExt.STATE_INACTIVE
	self._hed.vehicle = self._vehicle_names[1]
	slot5 = "state"

	table.insert(self._vehicle_names[1], self._save_values)

	slot5 = "vehicle"

	table.insert(self._vehicle_names[1], self._save_values)

	return 
end
function SpawnVehicleElement:_build_panel(panel, panel_sizer)
	slot6 = "SpawnVehicleElement:_build_panel"

	Application.trace(slot4, Application)

	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select a vehicle from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "vehicle", self._vehicle_names)

	slot6 = "The vehicle that will be spawned"

	self._add_help_text(slot4, self)

	return 
end
function SpawnVehicleElement:add_to_mission_package()
	slot4 = "SpawnVehicleElement:add_to_mission_package"

	Application.trace(slot2, Application)

	return 
end

return 
