if not MissionElementListFlow then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

MissionElementListFlow = slot0
function MissionElementListFlow:init(...)
	slot11 = 0
	slot12 = 0

	CoreEditorEwsDialog.init(slot2, self, nil, "Mission List Flow", "", Vector3(slot8, 300, 150), Vector3(300, 700, 400), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	self._use_look_at = false
	slot4 = "VERTICAL"
	local toolbar_sizer = EWS.BoxSizer(slot2, EWS)
	slot8 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, toolbar_sizer, 0, 0)

	slot7 = 255

	self._panel.set_background_colour(EWS, self._panel, 255, 255)

	slot7 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, self._panel, "")
	slot10 = "world_editor\\wc_previous_key_16x16.png"

	toolbar.add_tool(EWS, toolbar, "PREVIOUS", "Previous", CoreEws.image_path("DEFAULT_DIALOG_STYLE,RESIZE_BORDER"))

	slot12 = "_on_gui_previous"

	toolbar.connect(EWS, toolbar, "PREVIOUS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = "world_editor\\wc_next_key_16x16.png"

	toolbar.add_tool(EWS, toolbar, "NEXT", "Next", CoreEws.image_path(nil))

	slot12 = "_on_gui_next"

	toolbar.connect(EWS, toolbar, "NEXT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = "toolbar\\find_16x16.png"

	toolbar.add_check_tool(EWS, toolbar, "LOOK_AT", "Look at selected", CoreEws.image_path(nil))

	slot7 = self._use_look_at

	toolbar.set_tool_state(EWS, toolbar, "LOOK_AT")

	slot12 = "_toolbar_toggle"

	toolbar.connect(EWS, toolbar, "LOOK_AT", "EVT_COMMAND_MENU_SELECTED", callback("Look at selected", self, self))

	slot10 = "help_16x16.png"

	toolbar.add_tool(EWS, toolbar, "HELP", "Help", CoreEws.image_path({
		value = "_use_look_at",
		toolbar = toolbar
	}))

	slot12 = "_on_gui_help"
	slot9 = nil

	toolbar.connect(EWS, toolbar, "HELP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = toolbar

	toolbar.realize(EWS)

	slot9 = "EXPAND,LEFT"

	toolbar_sizer.add(EWS, toolbar_sizer, toolbar, 0, 0)

	slot6 = "HORIZONTAL"
	local selected_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, selected_sizer, 0, 0)

	slot10 = "HORIZONTAL"
	slot10 = "EXPAND"

	selected_sizer.add(EWS, selected_sizer, EWS.BoxSizer(0, EWS), 1, 0)

	slot9 = "LC_REPORT,LC_SORT_ASCENDING,NO_BORDER"
	self._selected_list = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot6 = self._selected_list

	self._selected_list.clear_all(EWS)

	slot7 = "Name"

	self._selected_list.append_column(EWS, self._selected_list)

	slot7 = "Id"

	self._selected_list.append_column(EWS, self._selected_list)

	slot10 = "EXPAND"

	selected_sizer.add(EWS, selected_sizer, self._selected_list, 2, 0)

	slot10 = "HORIZONTAL"
	slot10 = "EXPAND"

	selected_sizer.add(EWS, selected_sizer, EWS.BoxSizer(2, EWS), 1, 0)

	slot12 = "_right_clicked"

	self._selected_list.connect(EWS, self._selected_list, "EVT_COMMAND_LIST_ITEM_RIGHT_CLICK", callback(0, self, self))

	slot12 = "_on_select_selected"

	self._selected_list.connect(EWS, self._selected_list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(self._selected_list, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	self._selected_list.connect(EWS, self._selected_list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot7 = "HORIZONTAL"
	local lists_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "LC_REPORT,LC_SORT_ASCENDING"
	self._executers_list = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot7 = self._executers_list

	self._executers_list.clear_all(EWS)

	slot8 = "Name"

	self._executers_list.append_column(EWS, self._executers_list)

	slot8 = "Id"

	self._executers_list.append_column(EWS, self._executers_list)

	slot8 = "Type"

	self._executers_list.append_column(EWS, self._executers_list)

	slot8 = "Delay"

	self._executers_list.append_column(EWS, self._executers_list)

	slot11 = "EXPAND"

	lists_sizer.add(EWS, lists_sizer, self._executers_list, 1, 0)

	slot10 = "LC_REPORT,LC_SORT_ASCENDING"
	self._on_executed_list = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot7 = self._on_executed_list

	self._on_executed_list.clear_all(EWS)

	slot8 = "Name"

	self._on_executed_list.append_column(EWS, self._on_executed_list)

	slot8 = "Id"

	self._on_executed_list.append_column(EWS, self._on_executed_list)

	slot8 = "Type"

	self._on_executed_list.append_column(EWS, self._on_executed_list)

	slot8 = "Delay"

	self._on_executed_list.append_column(EWS, self._on_executed_list)

	slot11 = "EXPAND"

	lists_sizer.add(EWS, lists_sizer, self._on_executed_list, 1, 0)

	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, lists_sizer, 3, 0)

	slot13 = "_on_mark_executer"

	self._executers_list.connect(EWS, self._executers_list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot13 = "_on_select_executer"

	self._executers_list.connect(EWS, self._executers_list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot13 = "_right_clicked"

	self._executers_list.connect(EWS, self._executers_list, "EVT_COMMAND_LIST_ITEM_RIGHT_CLICK", callback(nil, self, self))

	slot13 = "key_cancel"

	self._executers_list.connect(EWS, self._executers_list, "EVT_KEY_DOWN", callback(self._executers_list, self, self))

	slot13 = "_on_mark_on_executed"

	self._on_executed_list.connect(EWS, self._on_executed_list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback("", self, self))

	slot13 = "_on_select_on_executed"

	self._on_executed_list.connect(EWS, self._on_executed_list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot13 = "_right_clicked"

	self._on_executed_list.connect(EWS, self._on_executed_list, "EVT_COMMAND_LIST_ITEM_RIGHT_CLICK", callback(nil, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	self._on_executed_list.connect(EWS, self._on_executed_list, "EVT_KEY_DOWN", callback(self._on_executed_list, self, self))

	slot8 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = ""
	local close_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, close_btn, 0, 2)

	slot15 = "on_cancel"

	close_btn.connect(EWS, close_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	close_btn.connect(EWS, close_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot13 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot10 = true

	self._dialog.set_visible(EWS, self._dialog)

	self._unit_history = {}
	self._unit_history_index = 0

	return 
end
function MissionElementListFlow:_toolbar_toggle(params, event)
	slot6 = params.toolbar
	slot9 = event
	self[params.value] = params.toolbar.tool_state(slot5, event.get_id(slot8))

	return 
end
function MissionElementListFlow:_on_gui_help()
	local text = "Mission flow show connections between different mission components.\n\nAt the top is the current selected mission element. The left list shows what is affecting it and the right what it affects."
	text = text .. "\n\nThe 'Type' column displays what type of connection it is. It can be on_executed, operator, trigger etc."
	text = text .. "\n\nDouble click left mouse button (in any list) will select that unit."
	text = text .. "\nSingle click right mouse button (in any list) will find that unit."
	slot8 = "OK"

	EWS.message_box("\nSingle click right mouse button (in any list) will find that unit.", EWS, self._panel, text, "Help", Vector3())

	return 
end
function MissionElementListFlow:on_unit_selected(unit)
	slot4 = self

	self.freeze(slot3)

	slot4 = self._selected_list

	self._selected_list.delete_all_items(slot3)

	slot4 = self._executers_list

	self._executers_list.delete_all_items(slot3)

	slot4 = self._on_executed_list

	self._on_executed_list.delete_all_items(slot3)

	function slot5(unit)
		slot3 = unit

		return not alive(slot2)
	end

	table.remove_condition(slot3, self._unit_history)

	if unit then
		if not self._skip_history then
			if self._unit_history_index < #self._unit_history then
				slot5 = self._unit_history_index

				table.crop(slot3, self._unit_history)
			end

			if not self._unit_history[self._unit_history_index] or self._unit_history[self._unit_history_index] ~= unit then
				slot5 = unit

				table.insert(slot3, self._unit_history)

				self._unit_history_index = #self._unit_history
			end
		end

		self._skip_history = nil
		local unit_id = unit.unit_data(slot3).unit_id
		slot8 = unit
		slot6 = unit.unit_data(slot7).name_id
		local i = self._selected_list.append_item(unit, self._selected_list)
		slot9 = "" .. unit_id

		self._selected_list.set_item(self._selected_list, self._selected_list, i, 1)

		slot8 = {
			unit = unit
		}

		self._selected_list.set_item_data(self._selected_list, self._selected_list, i)

		slot7 = self._selected_list

		self._autosize_columns(self._selected_list, self)

		slot7 = "Mission"
		slot7 = unit
		local links = managers.editor.layer(self._selected_list, managers.editor).get_unit_links(self._selected_list, managers.editor.layer(self._selected_list, managers.editor))
		slot7 = links.on_executed

		for _, data in ipairs(managers.editor.layer(self._selected_list, managers.editor)) do
			local on_executed_unit = data.unit
			slot16 = on_executed_unit
			slot14 = on_executed_unit.unit_data(slot15).name_id
			local i = self._on_executed_list.append_item(slot12, self._on_executed_list)
			slot20 = on_executed_unit
			slot17 = "" .. on_executed_unit.unit_data(slot19).unit_id

			self._on_executed_list.set_item(self._on_executed_list, self._on_executed_list, i, 1)

			slot17 = "" .. ((data.alternative and data.alternative) or "N/A")

			self._on_executed_list.set_item(slot13, self._on_executed_list, i, 2)

			slot17 = "" .. ((data.delay and data.delay) or "N/A")

			self._on_executed_list.set_item(slot13, self._on_executed_list, i, 3)

			slot16 = {
				unit = on_executed_unit
			}

			self._on_executed_list.set_item_data(slot13, self._on_executed_list, i)
		end

		slot7 = links.executers

		for _, data in ipairs(slot6) do
			local link_unit = data.unit
			slot16 = link_unit
			slot14 = link_unit.unit_data(slot15).name_id
			local i = self._executers_list.append_item(slot12, self._executers_list)
			slot20 = link_unit
			slot17 = "" .. link_unit.unit_data(slot19).unit_id

			self._executers_list.set_item(self._executers_list, self._executers_list, i, 1)

			slot17 = "" .. ((data.alternative and data.alternative) or "N/A")

			self._executers_list.set_item(slot13, self._executers_list, i, 2)

			slot17 = "" .. ((data.delay and data.delay) or "N/A")

			self._executers_list.set_item(slot13, self._executers_list, i, 3)

			slot16 = {
				unit = link_unit
			}

			self._executers_list.set_item_data(slot13, self._executers_list, i)
		end
	end

	slot5 = self._on_executed_list

	self._autosize_columns(slot3, self)

	slot5 = self._executers_list

	self._autosize_columns(slot3, self)

	slot4 = self

	self.thaw(slot3)

	return 
end
function MissionElementListFlow:_autosize_columns(list)
	slot5 = list

	for i = 0, list.column_count(slot4) - 1, 1 do
		slot9 = i

		list.autosize_column(slot7, list)
	end

	return 
end
function MissionElementListFlow:_on_gui_previous()
	if self._unit_history_index == 0 then
		return 
	end

	self._skip_history = true
	slot4 = 1
	self._unit_history_index = math.max(slot2, self._unit_history_index - 1)
	slot4 = {
		self._unit_history[self._unit_history_index]
	}

	managers.editor.select_units(slot2, managers.editor)

	return 
end
function MissionElementListFlow:_on_gui_next()
	if #self._unit_history < self._unit_history_index then
		return 
	end

	self._skip_history = true
	slot4 = #self._unit_history
	self._unit_history_index = math.min(slot2, self._unit_history_index + 1)
	slot4 = {
		self._unit_history[self._unit_history_index]
	}

	managers.editor.select_units(slot2, managers.editor)

	return 
end
function MissionElementListFlow:key_cancel(ctrlr, event)
	slot5 = event

	event.skip(slot4)

	slot6 = "K_ESCAPE"
	slot6 = event

	if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
		slot5 = self

		self.on_cancel(slot4)
	end

	return 
end
function MissionElementListFlow:_on_select_selected()
	slot3 = self
	local current_data = self._current_data(slot2)

	if current_data and current_data.unit and self._use_look_at then
		slot5 = current_data.unit

		managers.editor.look_towards_unit(slot3, managers.editor)
	end

	return 
end
function MissionElementListFlow:_right_clicked(list)
	slot5 = list
	local item_data = self._selected_list_data(slot3, self)

	if item_data then
		slot6 = item_data.unit

		managers.editor.center_view_on_unit(slot4, managers.editor)
	end

	return 
end
function MissionElementListFlow:_on_mark_executer()
	slot3 = self
	local item_data = self._selected_executer_data(slot2)

	return 
end
function MissionElementListFlow:_on_select_executer()
	slot3 = self
	local item_data = self._selected_executer_data(slot2)

	if item_data and item_data.unit then
		if self._use_look_at then
			slot5 = item_data.unit

			managers.editor.look_towards_unit(slot3, managers.editor)
		end

		slot5 = {
			item_data.unit
		}

		managers.editor.select_units(slot3, managers.editor)
	end

	return 
end
function MissionElementListFlow:_on_mark_on_executed()
	slot3 = self
	local item_data = self._selected_on_executed_data(slot2)

	return 
end
function MissionElementListFlow:_on_select_on_executed()
	slot3 = self
	local item_data = self._selected_on_executed_data(slot2)

	if item_data and item_data.unit then
		if self._use_look_at then
			slot5 = item_data.unit

			managers.editor.look_towards_unit(slot3, managers.editor)
		end

		slot5 = {
			item_data.unit
		}

		managers.editor.select_units(slot3, managers.editor)
	end

	return 
end
function MissionElementListFlow:_current_data()
	slot3 = self._selected_list
	local index = self._selected_list.selected_item(slot2)

	if index == -1 then
	end

	slot5 = 0

	return self._selected_list.get_item_data_ref(slot3, self._selected_list)
end
function MissionElementListFlow:_selected_list_data(list)
	slot4 = list
	local index = list.selected_item(slot3)

	if index == -1 then
		return 
	end

	slot6 = index

	return list.get_item_data_ref(slot4, list)
end
function MissionElementListFlow:_selected_on_executed_data()
	slot3 = self._on_executed_list
	local index = self._on_executed_list.selected_item(slot2)

	if index == -1 then
		return 
	end

	slot5 = index

	return self._on_executed_list.get_item_data_ref(slot3, self._on_executed_list)
end
function MissionElementListFlow:_selected_executer_data()
	slot3 = self._executers_list
	local index = self._executers_list.selected_item(slot2)

	if index == -1 then
		return 
	end

	slot5 = index

	return self._executers_list.get_item_data_ref(slot3, self._executers_list)
end
function MissionElementListFlow:on_goto()
	return 
end
function MissionElementListFlow:reset()
	return 
end
function MissionElementListFlow:freeze()
	slot3 = self._selected_list

	self._selected_list.freeze(slot2)

	slot3 = self._executers_list

	self._executers_list.freeze(slot2)

	slot3 = self._on_executed_list

	self._on_executed_list.freeze(slot2)

	return 
end
function MissionElementListFlow:thaw()
	slot3 = self._selected_list

	self._selected_list.thaw(slot2)

	slot3 = self._executers_list

	self._executers_list.thaw(slot2)

	slot3 = self._on_executed_list

	self._on_executed_list.thaw(slot2)

	return 
end
function MissionElementListFlow:recreate()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = cb

		self._continents_sizer.detach(slot7, self._continents_sizer)

		slot8 = cb

		cb.destroy(slot7)
	end

	slot3 = self._panel

	self._panel.layout(slot2)

	return 
end

return 
