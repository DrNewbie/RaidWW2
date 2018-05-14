if not VehicleTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

VehicleTriggerUnitElement = slot0
VehicleTriggerUnitElement.ON_ENTER = "on_enter"
VehicleTriggerUnitElement.ON_EXIT = "on_exit"
VehicleTriggerUnitElement.ON_ALL_INSIDE = "on_all_inside"
VehicleTriggerUnitElement.events = {
	VehicleTriggerUnitElement.ON_ENTER,
	VehicleTriggerUnitElement.ON_EXIT,
	VehicleTriggerUnitElement.ON_ALL_INSIDE
}
function VehicleTriggerUnitElement:init(unit)
	slot5 = "VehicleTriggerUnitElement:init"

	Application.debug(slot3, Application)

	slot5 = unit

	VehicleTriggerUnitElement.super.init(slot3, self)

	self._hed.trigger_times = 1
	self._hed.event = VehicleTriggerUnitElement.ON_ENTER
	slot5 = "event"

	table.insert(VehicleTriggerUnitElement.ON_ENTER, self._save_values)

	return 
end
function VehicleTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot6 = "VehicleTriggerUnitElement:_build_panel"

	Application.debug(slot4, Application)

	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select an event from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "event", VehicleTriggerUnitElement.events)

	slot6 = "Set the vehicle event the element should trigger on."

	self._add_help_text(slot4, self)

	return 
end

return 
