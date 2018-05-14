if not GlobalStateTriggerElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

GlobalStateTriggerElement = slot0
GlobalStateTriggerElement.ACTIONS = {
	"on_set",
	"on_clear",
	"on_event",
	"on_value"
}
GlobalStateTriggerElement.init = function (self, unit)
	slot5 = unit

	GlobalStateTriggerElement.super.init(slot3, self)

	self._hed.flag = ""
	self._hed.on_set = false
	self._hed.on_clear = false
	slot5 = "flag"

	table.insert(false, self._save_values)

	slot5 = "on_set"

	table.insert(false, self._save_values)

	slot5 = "on_clear"

	table.insert(false, self._save_values)

	slot5 = "on_event"

	table.insert(false, self._save_values)

	slot5 = "on_value"

	table.insert(false, self._save_values)

	slot5 = "check_type"

	table.insert(false, self._save_values)

	slot5 = "value"

	table.insert(false, self._save_values)

	slot4 = managers.global_state
	self._flags = managers.global_state.flag_names(false)
	slot4 = self._flags

	table.sort(false)

	return 
end
GlobalStateTriggerElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "Flag options"
	local flag_sizer = EWS.StaticBoxSizer(slot4, EWS, panel, "VERTICAL")
	slot7 = "HORIZONTAL"
	local flag_element_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND,LEFT"

	flag_sizer.add(EWS, flag_sizer, flag_element_sizer, 0, 1)

	slot12 = "Select a flag"

	self._build_value_combobox(EWS, self, panel, flag_sizer, "flag", self._flags)

	slot11 = "On Flag Set"

	self._build_value_checkbox(EWS, self, panel, flag_sizer, "on_set")

	slot11 = "On Flag Clear"

	self._build_value_checkbox(EWS, self, panel, flag_sizer, "on_clear")

	slot11 = "On Event"

	self._build_value_checkbox(EWS, self, panel, flag_sizer, "on_event")

	slot11 = "On Value"

	self._build_value_checkbox(EWS, self, panel, flag_sizer, "on_value")

	slot11 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, flag_sizer, 0, 0)

	slot12 = "Select which check operation to perform"

	self._build_value_combobox(EWS, self, panel, panel_sizer, "check_type", {
		"equal",
		"less_than",
		"greater_than",
		"less_or_equal",
		"greater_or_equal"
	})

	slot8 = "HORIZONTAL"
	local value_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, value_sizer, 0, 0)

	slot12 = ""
	local value_name = EWS.StaticText(EWS, EWS, panel, "Value:", 0)
	slot13 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value_name, 1, 0)

	slot13 = "TE_PROCESS_ENTER"
	local value = EWS.TextCtrl(EWS, EWS, panel, self._hed.value, "")
	slot14 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value, 2, 0)

	slot16 = "set_element_data"

	value.connect(EWS, value, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot16 = "set_element_data"
	slot13 = {
		value = "value",
		ctrlr = value
	}

	value.connect(EWS, value, "EVT_KILL_FOCUS", callback({
		value = "value",
		ctrlr = value
	}, self, self))

	slot13 = "Adittional options"
	local additional_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot12 = "HORIZONTAL"
	local additional_element_sizer = EWS.BoxSizer(EWS, EWS)
	slot16 = "EXPAND,LEFT"

	additional_sizer.add(EWS, additional_sizer, additional_element_sizer, 0, 1)

	slot15 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot13 = toolbar

	toolbar.realize(EWS)

	slot17 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot14 = "Trigger depending on global state flags. Check type is only applicable on value elements."

	self._add_help_text(EWS, self)

	return 
end

return 
