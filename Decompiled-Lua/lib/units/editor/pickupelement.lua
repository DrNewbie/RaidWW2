if not PickupUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

PickupUnitElement = slot0
PickupUnitElement.SAVE_UNIT_POSITION = false
PickupUnitElement.SAVE_UNIT_ROTATION = false
PickupUnitElement.init = function (self, unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.pickup = "remove"
	slot5 = "pickup"

	table.insert("remove", self._save_values)

	return 
end
PickupUnitElement.get_options = function ()
	slot2 = tweak_data.pickups

	return table.map_keys(slot1)
end
PickupUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = {
		"remove"
	}
	slot14 = tweak_data.pickups
	slot10 = "Select a pickup to be set or remove."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "pickup", table.list_add(slot10, table.map_keys(slot13)))

	return 
end

return 
