if not AreaMinPoliceForceUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AreaMinPoliceForceUnitElement = slot0
function AreaMinPoliceForceUnitElement:init(unit)
	slot5 = unit

	AreaMinPoliceForceUnitElement.super.init(slot3, self)

	self._hed.amount = 1
	slot5 = "amount"

	table.insert(1, self._save_values)

	return 
end
function AreaMinPoliceForceUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local amount_params = {
		name = "Amount:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set amount of enemy forces in area. Use 0 to define dynamic spawn area for \"street\" GroupAI.",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.amount
	}
	local amount_points = CoreEWS.number_controller(slot5)
	slot13 = "set_element_data"

	amount_points.connect(amount_params, amount_points, "EVT_COMMAND_TEXT_ENTER", callback(slot10, self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "amount",
		ctrlr = amount_points
	}

	amount_points.connect(amount_params, amount_points, "EVT_KILL_FOCUS", callback({
		value = "amount",
		ctrlr = amount_points
	}, self, self))

	return 
end

return 
