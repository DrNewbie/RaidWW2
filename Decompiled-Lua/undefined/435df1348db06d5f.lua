if not GlobalStateFilterElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

GlobalStateFilterElement = slot0
GlobalStateFilterElement.STATES = {
	"set",
	"cleared",
	"value"
}
function GlobalStateFilterElement:init(unit)
	slot5 = unit

	GlobalStateFilterElement.super.init(slot3, self)

	self._hed.flag = ""
	self._hed.state = ""
	self._hed.check_type = ""
	slot5 = "flag"

	table.insert("", self._save_values)

	slot5 = "state"

	table.insert("", self._save_values)

	slot5 = "check_type"

	table.insert("", self._save_values)

	slot5 = "value"

	table.insert("", self._save_values)

	slot4 = managers.global_state
	self._flags = managers.global_state.flag_names("")
	slot4 = self._flags

	table.sort("")

	return 
end
function GlobalStateFilterElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select a flag to test"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "flag", self._flags)

	slot10 = "What state of the flag to test"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state", GlobalStateFilterElement.STATES)

	slot10 = "Select which check operation to perform"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "check_type", {
		"equal",
		"less_than",
		"greater_than",
		"less_or_equal",
		"greater_or_equal"
	})

	slot6 = "HORIZONTAL"
	local value_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, value_sizer, 0, 0)

	slot10 = ""
	local value_name = EWS.StaticText(EWS, EWS, panel, "Value:", 0)
	slot11 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value_name, 1, 0)

	slot11 = "TE_PROCESS_ENTER"
	local value = EWS.TextCtrl(EWS, EWS, panel, self._hed.value, "")
	slot12 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value, 2, 0)

	slot14 = "set_element_data"

	value.connect(EWS, value, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "value",
		ctrlr = value
	}

	value.connect(EWS, value, "EVT_KILL_FOCUS", callback({
		value = "value",
		ctrlr = value
	}, self, self))

	slot11 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot9 = toolbar

	toolbar.realize(EWS)

	slot13 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot10 = "Filter will execute depending filter condition and global state flags. Check type is applicable only on value global states."

	self._add_help_text(EWS, self)

	return 
end

return 
