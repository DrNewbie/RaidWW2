slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditZipLine then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditZipLine = slot0
function EditZipLine:init(editor)
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	self._panel = panel
	slot7 = "HORIZONTAL"
	local end_pos_sizer = EWS.BoxSizer({
		name = "ZipLine",
		class = self
	}, EWS)
	slot11 = "EXPAND"

	sizer.add(EWS, sizer, end_pos_sizer, 0, 0)

	slot14 = ""
	slot11 = "ALIGN_CENTER_VERTICAL"

	end_pos_sizer.add(EWS, end_pos_sizer, EWS.StaticText(0, EWS, panel, "End pos:", 0), 1, 0)

	slot11 = ""
	self._end_pos_ctrl = EWS.StaticText(EWS, EWS, panel, "0,0,0", 0)
	slot11 = "ALIGN_CENTER_VERTICAL"

	end_pos_sizer.add(EWS, end_pos_sizer, self._end_pos_ctrl, 2, 0)

	slot10 = "TB_FLAT,TB_NODIVIDER"
	local btn_toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot13 = "tree_checkbox_unchecked_16x16.png"

	btn_toolbar.add_tool(EWS, btn_toolbar, "USE_CAMERA_POS", "Use camera pos for position end", CoreEws.image_path("End pos:"))

	slot15 = "_use_camera_pos"

	btn_toolbar.connect(EWS, btn_toolbar, "USE_CAMERA_POS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot13 = "tree_checkbox_undecided_16x16.png"

	btn_toolbar.add_tool(EWS, btn_toolbar, "USE_CAMERA_POS_LINE", "Use camera pos for line position end", CoreEws.image_path(nil))

	slot15 = "_use_camera_pos_for_line"
	slot12 = nil

	btn_toolbar.connect(EWS, btn_toolbar, "USE_CAMERA_POS_LINE", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot8 = btn_toolbar

	btn_toolbar.realize(EWS)

	slot12 = "EXPAND,LEFT"

	end_pos_sizer.add(EWS, end_pos_sizer, btn_toolbar, 0, 1)

	slot13 = "_update_speed"
	slot13 = "_update_speed"
	self._speed_params = {
		value = 0,
		name = "Speed [cm/s]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the speed of the zipline in cm/s",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot8 = self._speed_params

	CoreEws.number_controller()

	slot13 = "_update_slack"
	slot13 = "_update_slack"
	self._slack_params = {
		value = 0,
		name = "Slack [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Value to define slack of the zipline in cm",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot8 = self._slack_params

	CoreEws.number_controller()

	self._type_params = {
		sorted = true,
		name = "Type:",
		name_proportions = 1,
		ctrlr_proportions = 1,
		tooltip = "Select a type from the combobox",
		panel = panel,
		sizer = sizer,
		options = ZipLine.TYPES
	}
	slot8 = self._type_params

	CoreEws.combobox(ZipLine.TYPES)

	slot14 = "_change_type"
	slot11 = nil

	self._type_params.ctrlr.connect(ZipLine.TYPES, self._type_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	self._ai_ignores_bag = EWS.CheckBox(ZipLine.TYPES, EWS, panel, "AI ignores bag")
	slot14 = "set_ai_ignores_bag"
	slot11 = nil

	self._ai_ignores_bag.connect(ZipLine.TYPES, self._ai_ignores_bag, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot12 = "EXPAND"

	sizer.add(ZipLine.TYPES, sizer, self._ai_ignores_bag, 0, 1)

	slot8 = panel

	panel.layout(ZipLine.TYPES)

	slot9 = false

	panel.set_enabled(ZipLine.TYPES, panel)

	return 
end
function EditZipLine:update(t, dt)
	slot5 = self._selected_units

	for _, unit in ipairs(slot4) do
		slot10 = unit

		if unit.zipline(slot9) then
			slot10 = unit
			slot12 = dt

			unit.zipline(slot9).debug_draw(slot9, unit.zipline(slot9), t)
		end
	end

	return 
end
function EditZipLine:_use_camera_pos()
	slot3 = self._selected_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if unit.zipline(slot7) then
			slot8 = unit
			slot8 = unit.zipline(slot7)
			slot11 = managers.editor

			unit.zipline(slot7).set_end_pos(slot7, managers.editor.camera_position(slot10))
		end
	end

	return 
end
function EditZipLine:_use_camera_pos_for_line()
	slot3 = self._selected_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if unit.zipline(slot7) then
			slot8 = unit
			slot8 = unit.zipline(slot7)
			slot11 = managers.editor

			unit.zipline(slot7).set_end_pos_by_line(slot7, managers.editor.camera_position(slot10))
		end
	end

	return 
end
function EditZipLine:_update_speed(params)
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.zipline(slot8) then
			slot9 = unit
			slot10 = self._speed_params.value

			unit.zipline(slot8).set_speed(slot8, unit.zipline(slot8))
		end
	end

	return 
end
function EditZipLine:_update_slack(params)
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.zipline(slot8) then
			slot9 = unit
			slot10 = self._slack_params.value

			unit.zipline(slot8).set_slack(slot8, unit.zipline(slot8))
		end
	end

	return 
end
function EditZipLine:_change_type()
	slot3 = self._selected_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit

			if unit.zipline(slot7) then
				local type = self._type_params.ctrlr.get_value(slot7)
				slot9 = unit
				slot10 = type

				unit.zipline(self._type_params.ctrlr).set_usage_type(self._type_params.ctrlr, unit.zipline(self._type_params.ctrlr))
			end
		end
	end

	return 
end
function EditZipLine:set_ai_ignores_bag()
	slot3 = self._selected_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit

			if unit.zipline(slot7) then
				slot8 = unit
				slot8 = unit.zipline(slot7)
				slot11 = self._ai_ignores_bag

				unit.zipline(slot7).set_ai_ignores_bag(slot7, self._ai_ignores_bag.get_value(slot10))
			end
		end
	end

	return 
end
function EditZipLine:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then
		slot5 = unit

		if unit.zipline(slot4) then
			self._reference_unit = unit
			self._selected_units = units
			self._no_event = true
			slot5 = self._end_pos_ctrl
			slot10 = unit
			slot10 = unit.zipline(slot9)

			self._end_pos_ctrl.set_label(slot4, tostring(unit.zipline(slot9).end_pos(slot9)))

			slot5 = self._speed_params
			slot8 = unit
			slot8 = unit.zipline(slot7)

			CoreEws.change_entered_number(slot4, unit.zipline(slot7).speed(slot7))

			slot5 = self._slack_params
			slot8 = unit
			slot8 = unit.zipline(slot7)

			CoreEws.change_entered_number(slot4, unit.zipline(slot7).slack(slot7))

			slot5 = self._type_params
			slot8 = unit
			slot8 = unit.zipline(slot7)

			CoreEws.change_combobox_value(slot4, unit.zipline(slot7).usage_type(slot7))

			slot5 = self._ai_ignores_bag
			slot8 = unit
			slot8 = unit.zipline(slot7)

			self._ai_ignores_bag.set_value(slot4, unit.zipline(slot7).ai_ignores_bag(slot7))

			self._no_event = false

			return true
		end
	end

	self._selected_units = {}

	return false
end

return 
