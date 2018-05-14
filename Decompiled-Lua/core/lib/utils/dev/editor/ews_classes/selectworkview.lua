if not SelectWorkView then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

SelectWorkView = slot0
function SelectWorkView:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Workviews", "", Vector3(slot8, 300, 150), Vector3(300, 350, 500), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	slot4 = "HORIZONTAL"
	local horizontal_ctrlr_sizer = EWS.BoxSizer(slot2, EWS)
	slot5 = "VERTICAL"
	local list_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = ""
	slot9 = "ALIGN_CENTER_HORIZONTAL"

	list_sizer.add(EWS, list_sizer, EWS.StaticText(Vector3(slot8, 300, 150), EWS, self._panel, "Filter", 0), 0, 0)

	slot9 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(EWS, EWS, self._panel, "", "")
	slot9 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._filter, 0, 0)

	slot11 = "update_filter"
	slot8 = nil

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback(0, self, self))

	slot8 = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	self._list = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot5 = self._list

	self._list.clear_all(EWS)

	slot6 = "Name"

	self._list.append_column(EWS, self._list)

	slot9 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._list, 1, 0)

	slot9 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, list_sizer, 3, 0)

	slot6 = "VERTICAL"
	local list_ctrlrs = EWS.BoxSizer(EWS, EWS)
	slot9 = "Continents"
	local continents_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot8 = "VERTICAL"
	self._continents_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = self

	self.build_cbs(EWS)

	slot11 = "TOP,BOTTOM"

	continents_sizer.add(EWS, continents_sizer, self._continents_sizer, 0, 2)

	slot11 = "EXPAND,TOP"

	list_ctrlrs.add(EWS, list_ctrlrs, continents_sizer, 0, 30)

	slot8 = "HORIZONTAL"
	local layer_buttons_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "BU_EXACTFIT,NO_BORDER"
	local all_btn = EWS.Button(EWS, EWS, self._panel, "All", "")
	slot13 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, all_btn, 0, 2)

	slot15 = "on_all_continents"

	all_btn.connect(EWS, all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	all_btn.connect(EWS, all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = "BU_EXACTFIT,NO_BORDER"
	local none_btn = EWS.Button(EWS, EWS, self._panel, "None", "")
	slot14 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, none_btn, 0, 2)

	slot16 = "on_none_continents"

	none_btn.connect(EWS, none_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot16 = "key_cancel"
	slot13 = ""

	none_btn.connect(EWS, none_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot14 = "BU_EXACTFIT,NO_BORDER"
	local invert_btn = EWS.Button(EWS, EWS, self._panel, "Invert", "")
	slot15 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, invert_btn, 0, 2)

	slot17 = "on_invert_continents"

	invert_btn.connect(EWS, invert_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot17 = "key_cancel"
	slot14 = ""

	invert_btn.connect(EWS, invert_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot15 = "TOP,BOTTOM"

	continents_sizer.add(EWS, continents_sizer, layer_buttons_sizer, 0, 2)

	slot15 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, list_ctrlrs, 2, 0)

	slot15 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_ctrlr_sizer, 3, 0)

	slot17 = "on_mark_view"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot17 = "on_select_view"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot17 = "key_delete"

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot17 = "key_cancel"
	slot14 = ""

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback("", self, self))

	slot15 = "TE_PROCESS_ENTER,TE_MULTILINE,TE_WORDWRAP"
	self._info_ctrlr = EWS.TextCtrl(EWS, EWS, self._panel, "", "")
	slot17 = "on_set_info"

	self._info_ctrlr.connect(EWS, self._info_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback("", self, self))

	slot17 = "on_set_info"
	slot14 = nil

	self._info_ctrlr.connect(EWS, self._info_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	slot15 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, self._info_ctrlr, 1, 0)

	slot12 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot16 = "BU_BOTTOM"
	local goto_btn = EWS.Button(EWS, EWS, self._panel, "Goto", "")
	slot17 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, goto_btn, 0, 2)

	slot19 = "on_goto"

	goto_btn.connect(EWS, goto_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot19 = "key_cancel"
	slot16 = ""

	goto_btn.connect(EWS, goto_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot17 = "BU_BOTTOM"
	local add_btn = EWS.Button(EWS, EWS, self._panel, "Add", "")
	slot18 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, add_btn, 0, 2)

	slot20 = "on_add"

	add_btn.connect(EWS, add_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot20 = "key_cancel"
	slot17 = ""

	add_btn.connect(EWS, add_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot18 = "BU_BOTTOM"
	local delete_btn = EWS.Button(EWS, EWS, self._panel, "Delete", "")
	slot19 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, delete_btn, 0, 2)

	slot21 = "on_delete"

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot21 = "key_cancel"
	slot18 = ""

	delete_btn.connect(EWS, delete_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot19 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Cancel", "")
	slot20 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot22 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot22 = "key_cancel"
	slot19 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot20 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot20 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot16 = self

	self.fill_views_list(EWS)

	slot17 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function SelectWorkView:build_cbs()
	self._continents_cbs = {}
	local continents = managers.editor.continents(slot2)
	self._continent_names = {}
	slot4 = continents

	for name, continent in pairs(managers.editor) do
		slot10 = name

		table.insert(slot8, self._continent_names)
	end

	slot4 = self._continent_names

	table.sort(slot3)

	slot4 = self._continent_names

	for _, name in ipairs(slot3) do
		slot12 = ""
		local cb = EWS.CheckBox(slot8, EWS, self._panel, name)
		slot11 = true

		cb.set_value(EWS, cb)

		self._continents_cbs[name] = cb
		slot16 = "on_continent_cb"

		cb.connect(EWS, cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot13, self, self))

		slot16 = "key_cancel"
		slot13 = ""

		cb.connect(EWS, cb, "EVT_KEY_DOWN", callback({
			cb = cb,
			name = name
		}, self, self))

		slot14 = "EXPAND,TOP"

		self._continents_sizer.add(EWS, self._continents_sizer, cb, 0, 2)
	end

	return 
end
function SelectWorkView:key_delete(ctrlr, event)
	slot5 = event

	event.skip(slot4)

	slot6 = "K_DELETE"
	slot6 = event

	if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
		slot5 = self

		self.on_delete(slot4)
	end

	return 
end
function SelectWorkView:key_cancel(ctrlr, event)
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
function SelectWorkView:on_continent_cb()
	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:on_all_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = true

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:on_none_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = false

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:on_invert_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot11 = cb
		slot9 = not cb.get_value(slot10)

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:on_delete()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index == -1 then
		return 
	end

	slot5 = index
	local j = self._list.get_item_data_ref(slot3, self._list)
	local continent = self._views[j].continent
	local view_name = self._views[j].name
	slot9 = view_name

	managers.editor.delete_workview(slot6, managers.editor, continent)

	slot7 = self

	self.fill_views_list(slot6)

	return 
end
function SelectWorkView:on_set_info()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index == -1 then
		return 
	end

	local j = self._list.get_item_data_ref(slot3, self._list)
	local view = self._views[j].view
	slot6 = self._info_ctrlr
	view.text = self._info_ctrlr.get_value(index)

	return 
end
function SelectWorkView:on_mark_view()
	local index = self._list.selected_item(slot2)
	local j = self._list.get_item_data_ref(self._list, self._list)
	local view = self._views[j].view
	slot7 = view.text or ""

	self._info_ctrlr.change_value(index, self._info_ctrlr)

	return 
end
function SelectWorkView:on_select_view()
	slot3 = self

	self.on_goto(slot2)

	return 
end
function SelectWorkView:on_goto()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index == -1 then
		return 
	end

	slot5 = index
	local j = self._list.get_item_data_ref(slot3, self._list)
	slot6 = self._views[j].view

	managers.editor.goto_workview(self._list, managers.editor)

	return 
end
function SelectWorkView:on_add()
	slot3 = managers.editor

	managers.editor.on_add_workview(slot2)

	return 
end
function SelectWorkView:update_filter()
	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:workview_added()
	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:fill_views_list()
	self._list.delete_all_items(slot2)

	local j = 1
	local filter = self._filter.get_value(self._list)
	self._views = {}
	slot5 = self._list

	self._list.freeze(self._filter)

	local values = managers.editor.values(self._filter)
	slot6 = self._continent_names

	for _, c_name in ipairs(managers.editor) do
		slot11 = self._continents_cbs[c_name]

		if self._continents_cbs[c_name].get_value(slot10) then
			local c_values = values[c_name]

			if c_values and c_values.workviews then
				slot12 = c_values.workviews

				for v_name, view in pairs(slot11) do
					slot20 = true

					if string.find(slot16, v_name, filter, 1) then
						slot18 = v_name
						local i = self._list.append_item(slot16, self._list)
						self._views[j] = {
							view = view,
							continent = c_name,
							name = v_name
						}
						slot20 = j

						self._list.set_item_data(, self._list, i)

						j = j + 1
					end
				end
			end
		end
	end

	slot6 = self._list

	self._list.thaw(slot5)

	slot7 = 0

	self._list.autosize_column(slot5, self._list)

	return 
end
function SelectWorkView:reset()
	slot3 = self

	self.fill_views_list(slot2)

	return 
end
function SelectWorkView:freeze()
	slot3 = self._list

	self._list.freeze(slot2)

	return 
end
function SelectWorkView:thaw()
	slot3 = self._list

	self._list.thaw(slot2)

	return 
end
function SelectWorkView:recreate()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = cb

		self._continents_sizer.detach(slot7, self._continents_sizer)

		slot8 = cb

		cb.destroy(slot7)
	end

	slot4 = ""

	self._info_ctrlr.change_value(slot2, self._info_ctrlr)

	slot3 = self

	self.build_cbs(slot2)

	slot3 = self

	self.fill_views_list(slot2)

	slot3 = self._panel

	self._panel.layout(slot2)

	return 
end

return 
