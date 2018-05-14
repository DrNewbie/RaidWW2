if not DropinStateElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DropinStateElement = slot0
function DropinStateElement:init(unit)
	slot5 = unit

	DropinStateElement.super.init(slot3, self)

	self._hed.state = true
	slot5 = "state"

	table.insert(true, self._save_values)

	return 
end
function DropinStateElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = ""
	local state = EWS.CheckBox(slot4, EWS, panel, "Dropin enabled")
	slot7 = self._hed.state

	state.set_value(EWS, state)

	slot12 = "set_element_data"
	slot9 = {
		value = "state",
		ctrlr = state
	}

	state.connect(EWS, state, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot9, self, self))

	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, state, 0, 0)

	local help = {
		text = "Sets if drop in should be turned on or off.",
		panel = panel,
		sizer = panel_sizer
	}
	slot8 = help

	self.add_help_text(panel_sizer, self)

	return 
end

return 
