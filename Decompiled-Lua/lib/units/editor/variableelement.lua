if not VariableElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

VariableElement = slot0
VariableElement.SAVE_UNIT_POSITION = false
VariableElement.SAVE_UNIT_ROTATION = false
function VariableElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.variable = ""
	self._hed.activated = true
	slot5 = "variable"

	table.insert(true, self._save_values)

	slot5 = "activated"

	table.insert(true, self._save_values)

	return 
end
function VariableElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local text_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = ""
	local name = EWS.StaticText(EWS, EWS, panel, "Variable:", 0)
	slot11 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

	text_sizer.add(EWS, text_sizer, name, 1, 0)

	slot11 = "TE_PROCESS_ENTER"
	local input = EWS.TextCtrl(EWS, EWS, panel, self._hed.variable, "")
	slot9 = "Name of the variable to be used."

	input.set_tool_tip(EWS, input)

	slot12 = "RIGHT,EXPAND"

	text_sizer.add(EWS, text_sizer, input, 3, 0)

	slot14 = "set_element_data"

	input.connect(EWS, input, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "variable",
		ctrlr = input
	}

	input.connect(EWS, input, "EVT_KILL_FOCUS", callback({
		value = "variable",
		ctrlr = input
	}, self, self))

	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer, 0, 0)

	slot12 = "Set if the variable is active and uncheck if the variable is disabled."

	self._build_value_checkbox(EWS, self, panel, panel_sizer, "activated")

	return 
end

return 
