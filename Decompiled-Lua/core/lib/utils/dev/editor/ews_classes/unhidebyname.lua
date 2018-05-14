-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not UnhideByName then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

UnhideByName = slot0
function UnhideByName:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER"

	CoreEditorEwsDialog.init(slot2, self, nil, self.TITLE or "Unhide by name", "", Vector3(slot8, 300, 150), Vector3(300, 350, 500), ...)

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
	self._layer_cbs = {}
	slot9 = "List Layers"
	local layers_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot7 = managers.editor
	local layers = managers.editor.layers(EWS)
	local names_layers = {}
	slot9 = layers

	for name, layer in pairs("VERTICAL") do
		slot15 = name

		table.insert(slot13, names_layers)
	end

	slot9 = names_layers

	table.sort(slot8)

	slot9 = names_layers

	for _, name in ipairs(slot8) do
		slot17 = ""
		local cb = EWS.CheckBox(slot13, EWS, self._panel, name)
		slot16 = true

		cb.set_value(EWS, cb)

		self._layer_cbs[name] = cb
		slot21 = "on_layer_cb"

		cb.connect(EWS, cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot18, self, self))

		slot21 = "key_cancel"
		slot18 = ""

		cb.connect(EWS, cb, "EVT_KEY_DOWN", callback({
			cb = cb,
			name = name
		}, self, self))

		slot19 = "EXPAND,TOP"

		layers_sizer.add(EWS, layers_sizer, cb, 0, 2)
	end

	slot10 = "HORIZONTAL"
	local layer_buttons_sizer = EWS.BoxSizer(slot8, EWS)
	slot14 = "BU_EXACTFIT,NO_BORDER"
	local all_btn = EWS.Button(EWS, EWS, self._panel, "All", "")
	slot15 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, all_btn, 0, 2)

	slot17 = "on_all_layers"

	all_btn.connect(EWS, all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot17 = "key_cancel"
	slot14 = ""

	all_btn.connect(EWS, all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot15 = "BU_EXACTFIT,NO_BORDER"
	local none_btn = EWS.Button(EWS, EWS, self._panel, "None", "")
	slot16 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, none_btn, 0, 2)

	slot18 = "on_none_layers"

	none_btn.connect(EWS, none_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot18 = "key_cancel"
	slot15 = ""

	none_btn.connect(EWS, none_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot16 = "BU_EXACTFIT,NO_BORDER"
	local invert_btn = EWS.Button(EWS, EWS, self._panel, "Invert", "")
	slot17 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, invert_btn, 0, 2)

	slot19 = "on_invert_layers"

	invert_btn.connect(EWS, invert_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot19 = "key_cancel"
	slot16 = ""

	invert_btn.connect(EWS, invert_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot17 = "TOP,BOTTOM"

	layers_sizer.add(EWS, layers_sizer, layer_buttons_sizer, 0, 2)

	slot17 = "EXPAND,TOP"

	list_ctrlrs.add(EWS, list_ctrlrs, layers_sizer, 0, 30)

	slot16 = "Continents"
	local continents_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot15 = "VERTICAL"
	self._continents_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = self

	self.build_continent_cbs(EWS)

	slot18 = "TOP,BOTTOM"

	continents_sizer.add(EWS, continents_sizer, self._continents_sizer, 0, 2)
	list_ctrlrs.add(EWS, list_ctrlrs, continents_sizer, 0, 5)

	slot15 = "HORIZONTAL"
	local continent_buttons_sizer = EWS.BoxSizer(EWS, EWS)
	slot19 = "BU_EXACTFIT,NO_BORDER"
	local continent_all_btn = EWS.Button(EWS, EWS, self._panel, "All", "")
	slot20 = "TOP,BOTTOM"

	continent_buttons_sizer.add(EWS, continent_buttons_sizer, continent_all_btn, 0, 2)

	slot22 = "on_all_continents"

	continent_all_btn.connect(EWS, continent_all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot22 = "key_cancel"
	slot19 = ""

	continent_all_btn.connect(EWS, continent_all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot20 = "BU_EXACTFIT,NO_BORDER"
	local continent_none_btn = EWS.Button(EWS, EWS, self._panel, "None", "")
	slot21 = "TOP,BOTTOM"

	continent_buttons_sizer.add(EWS, continent_buttons_sizer, continent_none_btn, 0, 2)

	slot23 = "on_none_continents"

	continent_none_btn.connect(EWS, continent_none_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot23 = "key_cancel"
	slot20 = ""

	continent_none_btn.connect(EWS, continent_none_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot21 = "BU_EXACTFIT,NO_BORDER"
	local continent_invert_btn = EWS.Button(EWS, EWS, self._panel, "Invert", "")
	slot22 = "TOP,BOTTOM"

	continent_buttons_sizer.add(EWS, continent_buttons_sizer, continent_invert_btn, 0, 2)

	slot24 = "on_invert_continents"

	continent_invert_btn.connect(EWS, continent_invert_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot24 = "key_cancel"
	slot21 = ""

	continent_invert_btn.connect(EWS, continent_invert_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot22 = "TOP,BOTTOM"

	continents_sizer.add(EWS, continents_sizer, continent_buttons_sizer, 0, 2)

	slot22 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, list_ctrlrs, 2, 0)

	slot22 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot24 = "on_mark_unit"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot24 = "on_unhide"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot24 = "key_cancel"
	slot21 = ""

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot19 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot23 = "BU_BOTTOM"
	local unhide_btn = EWS.Button("EXPAND,TOP", EWS, self._panel, self.BTN_NAME or "Unhide", "")
	slot24 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, unhide_btn, 0, 2)

	slot26 = "on_unhide"

	unhide_btn.connect(EWS, unhide_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot26 = "key_cancel"
	slot23 = ""

	unhide_btn.connect(EWS, unhide_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot24 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Cancel", "")
	slot25 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot27 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot27 = "key_cancel"
	slot24 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot25 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot25 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot21 = self

	self.fill_unit_list(EWS)

	slot22 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function UnhideByName:build_continent_cbs()
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
function UnhideByName:on_continent_cb()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_all_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = true

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_none_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = false

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_invert_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot11 = cb
		slot9 = not cb.get_value(slot10)

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_all_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = true

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_none_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = false

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:on_invert_continents()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot11 = cb
		slot9 = not cb.get_value(slot10)

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:key_cancel(ctrlr, event)
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
function UnhideByName:on_layer_cb(data)
	slot4 = self

	self.fill_unit_list(slot3)

	return 
end
function UnhideByName:on_cancel()
	slot4 = false

	self._dialog.set_visible(slot2, self._dialog)

	return 
end
function UnhideByName:on_unhide()
	slot3 = managers.editor

	managers.editor.freeze_gui_lists(slot2)

	slot5 = self

	for _, unit in ipairs(self._selected_item_units(slot4)) do
		if self.IS_HIDE_BY_NAME then
			slot10 = false

			managers.editor.set_unit_visible(slot7, managers.editor, unit)
		else
			slot10 = true

			managers.editor.set_unit_visible(slot7, managers.editor, unit)
		end
	end

	slot3 = managers.editor

	managers.editor.thaw_gui_lists(slot2)

	return 
end
function UnhideByName:on_delete()
	slot3 = managers.editor

	managers.editor.freeze_gui_lists(slot2)

	slot5 = self

	for _, unit in ipairs(self._selected_item_units(slot4)) do
		slot9 = unit

		managers.editor.delete_unit(slot7, managers.editor)
	end

	slot3 = managers.editor

	managers.editor.thaw_gui_lists(slot2)

	return 
end
function UnhideByName:on_mark_unit()
	return 
end
function UnhideByName:_selected_item_units()
	local units = {}
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = i
		local unit = self._units[self._list.get_item_data(slot9, self._list)]
		slot11 = unit

		table.insert(slot9, units)
	end

	return units
end
function UnhideByName:_selected_item_unit()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index ~= -1 then
		slot6 = index

		return self._units[self._list.get_item_data(slot4, self._list)]
	end

	return 
end
function UnhideByName:select_unit(unit)
	slot5 = unit

	managers.editor.select_unit(slot3, managers.editor)

	return 
end
function UnhideByName:hid_unit(unit)
	slot5 = unit

	self._append_unit_to_list(slot3, self)

	return 
end
function UnhideByName:_append_unit_to_list(unit)
	slot7 = unit
	local i = self._list.append_item(slot3, self._list)
	local j = #self._units + 1
	self._units[j] = unit
	slot8 = j

	self._list.set_item_data(unit.unit_data(slot6).name_id, self._list, i)

	return 
end
function UnhideByName:unhid_unit(unit)
	slot5 = unit

	self._remove_unit_from_list(slot3, self)

	return 
end
function UnhideByName:_remove_unit_from_list(unit)
	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = i

		if self._units[self._list.get_item_data(slot8, self._list)] == unit then
			slot9 = i

			self._list.delete_item(slot7, self._list)

			return 
		end
	end

	return 
end
function UnhideByName:unit_name_changed(unit)
	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = i

		if self._units[self._list.get_item_data(slot8, self._list)] == unit then
			slot13 = unit
			slot11 = unit.unit_data(slot12).name_id

			self._list.set_item(slot7, self._list, i, 0)

			local sort = false

			if 0 <= i - 1 then
				slot11 = i - 1
				slot9 = self._units[self._list.get_item_data(slot9, self._list)]
				local over = self._units[self._list.get_item_data(slot9, self._list)].unit_data(self._list.get_item_data(slot9, self._list)).name_id

				if not sort then
					slot10 = unit
					sort = unit.unit_data(slot9).name_id < over
				end
			end

			slot10 = self._list

			if i + 1 < self._list.item_count(slot9) then
				slot11 = i + 1
				slot9 = self._units[self._list.get_item_data(slot9, self._list)]
				local under = self._units[self._list.get_item_data(slot9, self._list)].unit_data(self._list.get_item_data(slot9, self._list)).name_id

				if not sort then
					slot10 = unit
					sort = under < unit.unit_data(slot9).name_id
				end
			end

			if sort then
				self.fill_unit_list(slot8)

				slot10 = self._list

				for i = 0, self._list.item_count(self) - 1, 1 do
					slot15 = i

					if self._units[self._list.get_item_data(slot13, self._list)] == unit then
						slot15 = true

						self._list.set_item_selected(slot12, self._list, i)

						slot14 = i

						self._list.ensure_visible(slot12, self._list)

						break
					end
				end
			end

			break
		end
	end

	return 
end
function UnhideByName:update_filter()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:fill_unit_list()
	slot3 = self._list

	self._list.freeze(slot2)

	slot3 = self._list

	self._list.delete_all_items(slot2)

	slot3 = managers.editor
	local layers = managers.editor.layers(slot2)
	local j = 1
	slot5 = self._filter
	local filter = self._filter.get_value(slot4)
	self._units = {}
	local hidden = {}
	slot9 = managers.editor

	for _, unit in ipairs(managers.editor.hidden_units(slot8)) do
		slot12 = unit
		hidden[unit.key(slot11)] = unit
	end

	slot7 = layers

	for name, layer in pairs(slot6) do
		slot12 = self._layer_cbs[name]

		if self._layer_cbs[name].get_value(slot11) then
			slot14 = layer

			for _, unit in ipairs(layer.created_units(slot13)) do
				slot18 = unit

				if self._continent_ok(slot16, self) then
				end
			end
		end
	end

	slot8 = 0

	self._list.autosize_column(slot6, self._list)

	slot7 = self._list

	self._list.thaw(slot6)

	return 
end
function UnhideByName:_continent_ok(unit)
	slot4 = unit
	local continent = unit.unit_data(slot3).continent

	if not continent then
		return true
	end

	slot6 = continent

	if self._continents_cbs[continent.name(slot5)] then
		slot6 = continent
		slot5 = self._continents_cbs[continent.name(slot5)]
		slot3 = self._continents_cbs[continent.name(slot5)].get_value(continent.name(slot5))
	end

	return slot3
end
function UnhideByName:reset()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnhideByName:freeze()
	slot3 = self._list

	self._list.freeze(slot2)

	return 
end
function UnhideByName:thaw()
	slot3 = self._list

	self._list.thaw(slot2)

	return 
end
function UnhideByName:recreate()
	slot3 = self._continents_cbs

	for name, cb in pairs(slot2) do
		slot9 = cb

		self._continents_sizer.detach(slot7, self._continents_sizer)

		slot8 = cb

		cb.destroy(slot7)
	end

	slot3 = self

	self.build_continent_cbs(slot2)

	slot3 = self

	self.fill_unit_list(slot2)

	slot3 = self._panel

	self._panel.layout(slot2)

	return 
end

if not HideByName then
	slot2 = UnhideByName
	slot0 = class(slot1)
end

HideByName = slot0
HideByName.TITLE = "Hide by Name"
HideByName.BTN_NAME = "Hide"
HideByName.IS_HIDE_BY_NAME = true
function HideByName:init(...)
	slot3 = self

	HideByName.super.init(slot2, ...)

	return 
end
function HideByName:hid_unit(unit)
	slot5 = unit

	self._remove_unit_from_list(slot3, self)

	return 
end
function HideByName:unhid_unit(unit)
	slot5 = unit

	self._append_unit_to_list(slot3, self)

	return 
end
function HideByName:spawned_unit(unit)
	slot5 = unit

	self._append_unit_to_list(slot3, self)

	return 
end
function HideByName:deleted_unit(unit)
	slot5 = unit

	self._remove_unit_from_list(slot3, self)

	return 
end

return 
