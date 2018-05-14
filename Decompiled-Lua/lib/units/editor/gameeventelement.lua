if not GameEventElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

GameEventElement = slot0
GameEventElement.SAVE_UNIT_POSITION = false
GameEventElement.SAVE_UNIT_ROTATION = false
function GameEventElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.category = ""
	self._hed.event = ""
	slot5 = "category"

	table.insert("", self._save_values)

	slot5 = "event"

	table.insert("", self._save_values)

	return 
end
function GameEventElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local text_sizer_category = EWS.BoxSizer(slot4, EWS)
	slot7 = "HORIZONTAL"
	local text_sizer_event = EWS.BoxSizer(EWS, EWS)
	slot11 = ""
	local name_category = EWS.StaticText(EWS, EWS, panel, "Category:", 0)
	slot12 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

	text_sizer_category.add(EWS, text_sizer_category, name_category, 1, 0)

	slot12 = ""
	local name_event = EWS.StaticText(EWS, EWS, panel, "Event:", 0)
	slot13 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

	text_sizer_event.add(EWS, text_sizer_event, name_event, 1, 0)

	slot13 = "TE_PROCESS_ENTER"
	local input_category = EWS.TextCtrl(EWS, EWS, panel, self._hed.category, "")
	slot14 = "TE_PROCESS_ENTER"
	local input_event = EWS.TextCtrl(EWS, EWS, panel, self._hed.event, "")
	slot12 = "Name of the variable to be used."

	input_category.set_tool_tip(EWS, input_category)

	slot12 = "Name of the variable to be used."

	input_event.set_tool_tip(EWS, input_event)

	slot15 = "RIGHT,EXPAND"

	text_sizer_category.add(EWS, text_sizer_category, input_category, 3, 0)

	slot15 = "RIGHT,EXPAND"

	text_sizer_event.add(EWS, text_sizer_event, input_event, 3, 0)

	slot17 = "set_element_data"

	input_category.connect(EWS, input_category, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot17 = "set_element_data"

	input_category.connect(EWS, input_category, "EVT_KILL_FOCUS", callback({
		value = "category",
		ctrlr = input_category
	}, self, self))

	slot17 = "set_element_data"

	input_event.connect(EWS, input_event, "EVT_COMMAND_TEXT_ENTER", callback({
		value = "category",
		ctrlr = input_category
	}, self, self))

	slot17 = "set_element_data"
	slot14 = {
		value = "event",
		ctrlr = input_event
	}

	input_event.connect(EWS, input_event, "EVT_KILL_FOCUS", callback({
		value = "event",
		ctrlr = input_event
	}, self, self))

	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer_category, 0, 0)

	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer_event, 0, 0)

	return 
end

return 
