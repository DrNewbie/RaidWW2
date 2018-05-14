if not FadeToBlackElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

FadeToBlackElement = slot0
function FadeToBlackElement:init(unit)
	slot5 = unit

	FadeToBlackElement.super.init(slot3, self)

	self._hed.state = false
	slot5 = "state"

	table.insert(false, self._save_values)

	return 
end
function FadeToBlackElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = ""
	local state = EWS.CheckBox(slot4, EWS, panel, "Fade in/out")
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
		text = "Fade in or out, takes 3 seconds. Hardcore.",
		panel = panel,
		sizer = panel_sizer
	}
	slot8 = help

	self.add_help_text(panel_sizer, self)

	return 
end

return 
