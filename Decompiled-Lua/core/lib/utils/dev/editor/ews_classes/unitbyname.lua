if not UnitByName then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

UnitByName = slot0
function UnitByName:init(name, unit_filter_function, ...)
	self._dialog_name = self._dialog_name or name or "UnitByName"
	self._unit_filter_function = unit_filter_function
	slot13 = 0
	slot14 = 0

	CoreEditorEwsDialog.init(slot4, self, nil, self._dialog_name, "", Vector3(slot10, 300, 150), Vector3(300, 350, 500), ...)
	self.create_panel(slot4, self)

	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot8 = panel_sizer

	panel.set_sizer("VERTICAL", panel)

	local horizontal_ctrlr_sizer = EWS.BoxSizer("VERTICAL", EWS)
	slot9 = "VERTICAL"
	local list_sizer = EWS.BoxSizer(EWS, EWS)
	slot16 = ""
	slot13 = "ALIGN_CENTER_HORIZONTAL"

	list_sizer.add(EWS, list_sizer, EWS.StaticText("DEFAULT_DIALOG_STYLE,RESIZE_BORDER", EWS, panel, "Filter", 0), 0, 0)

	slot13 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(EWS, EWS, panel, "", "")
	slot13 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._filter, 0, 0)

	slot15 = "update_filter"

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback(0, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	self._filter.connect(EWS, self._filter, "EVT_KEY_DOWN", callback(nil, self, self))

	slot12 = self.STYLE or "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	self._list = EWS.ListCtrl("HORIZONTAL", EWS, panel, "")
	slot9 = self._list

	self._list.clear_all("HORIZONTAL")

	slot10 = "Name"

	self._list.append_column("HORIZONTAL", self._list)

	slot13 = "EXPAND"

	list_sizer.add("HORIZONTAL", list_sizer, self._list, 1, 0)

	slot13 = "EXPAND"

	horizontal_ctrlr_sizer.add("HORIZONTAL", horizontal_ctrlr_sizer, list_sizer, 3, 0)

	slot10 = "VERTICAL"
	local list_ctrlrs = EWS.BoxSizer("HORIZONTAL", EWS)
	slot13 = "Filter By Type"
	local filter_type_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot15 = "EXPAND"

	list_ctrlrs.add(EWS, list_ctrlrs, filter_type_sizer, 0, 0)

	self._filter_buttons = {}

	local function add_filter_button(id, name)
		slot9 = ""
		self._filter_buttons[id] = EWS.RadioButton(slot4, EWS, panel, name, "filter_type")
		slot8 = ""

		filter_type_sizer.add(EWS.RadioButton(slot4, EWS, panel, name, "filter_type"), filter_type_sizer, self._filter_buttons[id], 0, 0)

		return 
	end

	slot13 = "Name ID"

	add_filter_button(list_ctrlrs, "by_name_id")

	slot13 = "Unit name"

	add_filter_button(list_ctrlrs, "by_unit_name")

	slot13 = "Unit ID"

	add_filter_button(list_ctrlrs, "by_unit_id")

	slot13 = true

	self._filter_buttons.by_name_id.set_value(list_ctrlrs, self._filter_buttons.by_name_id)

	slot19 = "_on_set_filter"

	panel.connect(list_ctrlrs, panel, "filter_type", "EVT_COMMAND_RADIOBUTTON_SELECTED", callback(nil, self, self))

	self._layer_cbs = {}
	slot15 = "List Layers"
	local layers_sizer = EWS.StaticBoxSizer(list_ctrlrs, EWS, panel, "VERTICAL")
	slot13 = managers.editor
	local layers = managers.editor.layers(EWS)
	local names_layers = {}
	slot15 = layers

	for name, layer in pairs("VERTICAL") do
		slot21 = name

		table.insert(slot19, names_layers)
	end

	slot15 = names_layers

	table.sort(slot14)

	slot15 = names_layers

	for _, name in ipairs(slot14) do
		slot23 = ""
		local cb = EWS.CheckBox(slot19, EWS, panel, name)
		slot22 = true

		cb.set_value(EWS, cb)

		self._layer_cbs[name] = cb
		slot27 = "on_layer_cb"

		cb.connect(EWS, cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot24, self, self))

		slot27 = "key_cancel"
		slot24 = ""

		cb.connect(EWS, cb, "EVT_KEY_DOWN", callback({
			cb = cb,
			name = name
		}, self, self))

		slot25 = "EXPAND,TOP"

		layers_sizer.add(EWS, layers_sizer, cb, 0, 2)
	end

	slot16 = "HORIZONTAL"
	local layer_buttons_sizer = EWS.BoxSizer(slot14, EWS)
	slot20 = "BU_EXACTFIT,NO_BORDER"
	local all_btn = EWS.Button(EWS, EWS, panel, "All", "")
	slot21 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, all_btn, 0, 2)

	slot23 = "on_all_layers"

	all_btn.connect(EWS, all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot23 = "key_cancel"
	slot20 = ""

	all_btn.connect(EWS, all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot21 = "BU_EXACTFIT,NO_BORDER"
	local none_btn = EWS.Button(EWS, EWS, panel, "None", "")
	slot22 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, none_btn, 0, 2)

	slot24 = "on_none_layers"

	none_btn.connect(EWS, none_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot24 = "key_cancel"
	slot21 = ""

	none_btn.connect(EWS, none_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot22 = "BU_EXACTFIT,NO_BORDER"
	local invert_btn = EWS.Button(EWS, EWS, panel, "Invert", "")
	slot23 = "TOP,BOTTOM"

	layer_buttons_sizer.add(EWS, layer_buttons_sizer, invert_btn, 0, 2)

	slot25 = "on_invert_layers"

	invert_btn.connect(EWS, invert_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot25 = "key_cancel"
	slot22 = ""

	invert_btn.connect(EWS, invert_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot23 = "TOP,BOTTOM"

	layers_sizer.add(EWS, layers_sizer, layer_buttons_sizer, 0, 2)

	slot23 = "EXPAND,TOP"

	list_ctrlrs.add(EWS, list_ctrlrs, layers_sizer, 0, 2)

	slot23 = "EXPAND,LEFT"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, list_ctrlrs, 2, 5)

	slot23 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot25 = "_on_mark_unit"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot25 = "_on_select_unit"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot25 = "key_delete"

	self._list.connect(EWS, self._list, "EVT_CHAR", callback(nil, self, self))

	slot25 = "key_cancel"
	slot22 = ""

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback("", self, self))

	slot20 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot22 = button_sizer

	self._build_buttons(EWS, self, panel)

	slot24 = "ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, button_sizer, 0, 0)

	slot24 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot20 = self

	self.fill_unit_list(EWS)

	slot21 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function UnitByName:_build_buttons(panel, sizer)
	slot9 = ""
	local cancel_btn = EWS.Button(slot4, EWS, panel, "Cancel", "")
	slot10 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, cancel_btn, 0, 2)

	slot12 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	return 
end
function UnitByName:_on_set_filter()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnitByName:_get_filter_type()
	slot3 = self._filter_buttons

	for name, ctrlr in pairs(slot2) do
		slot8 = ctrlr

		if ctrlr.get_value(slot7) then
			return name
		end
	end

	return 
end
function UnitByName:on_all_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = true

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnitByName:on_none_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = false

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnitByName:on_invert_layers()
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
function UnitByName:key_delete(ctrlr, event)
	slot5 = event

	event.skip(slot4)

	slot6 = "K_DELETE"
	slot6 = event

	if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
		slot5 = self

		self._on_delete(slot4)
	end

	return 
end
function UnitByName:key_cancel(ctrlr, event)
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
function UnitByName:on_layer_cb(data)
	slot4 = self

	self.fill_unit_list(slot3)

	return 
end
function UnitByName:on_cancel()
	slot4 = false

	self._dialog.set_visible(slot2, self._dialog)

	return 
end
function UnitByName:_on_delete()
	return 
end
function UnitByName:_on_mark_unit()
	return 
end
function UnitByName:_on_select_unit()
	return 
end
function UnitByName:_selected_item_units()
	if self._cancelled then
		return {}
	end

	local units = {}
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = i
		local unit = self._units[self._list.get_item_data(slot9, self._list)]
		slot11 = unit

		if not self._continent_locked(slot9, self) then
			slot11 = unit

			table.insert(slot9, units)
		end
	end

	return units
end
function UnitByName:_selected_item_unit()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index ~= -1 then
		slot6 = index

		return self._units[self._list.get_item_data(slot4, self._list)]
	end

	return 
end
function UnitByName:deleted_unit(unit)
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
function UnitByName:spawned_unit(unit)
	slot7 = unit
	local i = self._list.append_item(slot3, self._list)
	local j = #self._units + 1
	self._units[j] = unit
	slot8 = j

	self._list.set_item_data(unit.unit_data(slot6).name_id, self._list, i)

	return 
end
function UnitByName:selected_unit(unit)
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = false

		self._list.set_item_selected(slot8, self._list, i)
	end

	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = i

		if self._units[self._list.get_item_data(slot8, self._list)] == unit then
			slot10 = true

			self._list.set_item_selected(slot7, self._list, i)

			slot9 = i

			self._list.ensure_visible(slot7, self._list)

			return 
		end
	end

	return 
end
function UnitByName:selected_units(units)
	if self._blocked then
		return 
	end

	slot4 = self._list

	self._list.freeze(slot3)

	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = false

		self._list.set_item_selected(slot8, self._list, i)
	end

	local ukeys = {}
	slot5 = units

	for _, unit in ipairs(slot4) do
		slot10 = unit
		ukeys[unit.key(slot9)] = unit
	end

	if 0 < #units then
		slot5 = units[#units]
		slot3 = units[#units].key(slot4)
	else
		slot3 = false

		if false then
			local ensure_visible_key = true
		end
	end

	slot7 = self._list

	for i = 0, self._list.item_count(slot6) - 1, 1 do
		slot12 = i
		slot10 = self._units[self._list.get_item_data(slot10, self._list)]
		local ukey = self._units[self._list.get_item_data(slot10, self._list)].key(self._list.get_item_data(slot10, self._list))

		if ukeys[ukey] then
			slot13 = true

			self._list.set_item_selected(slot10, self._list, i)

			if ukey == ensure_visible_key then
				slot12 = i

				self._list.ensure_visible(slot10, self._list)
			end
		end
	end

	slot6 = self._list

	self._list.thaw(slot5)

	return 
end
function UnitByName:unit_name_changed(unit)
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
function UnitByName:update_filter()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnitByName:fill_unit_list()
	slot3 = self._list

	self._list.freeze(slot2)

	slot3 = self._list

	self._list.delete_all_items(slot2)

	slot3 = managers.editor
	local layers = managers.editor.layers(slot2)
	local j = 1
	local filter = self._filter.get_value(slot4)
	slot8 = filter
	filter = utf8.to_lower(utf8.from_latin1(slot7))
	self._units = {}
	slot6 = layers

	for name, layer in pairs(self._filter) do
		slot11 = self._layer_cbs[name]

		if self._layer_cbs[name].get_value(slot10) then
			slot13 = layer

			for _, unit in ipairs(layer.created_units(slot12)) do
				slot23 = unit
				slot19 = true

				if string.find(slot15, utf8.to_lower(utf8.from_latin1(self._get_filter_string(slot21, self))), filter, 1) then
					slot17 = unit

					if self._unit_condition(slot15, self) then
						slot19 = unit
						slot17 = unit.unit_data(slot18).name_id
						local i = self._list.append_item(slot15, self._list)
						self._units[j] = unit
						slot19 = j

						self._list.set_item_data(self._list, self._list, i)

						slot19 = 0
						local colour = Vector3(self._list, 0, 0)
						slot19 = unit

						if self._continent_locked(0, self) then
							slot20 = 0.75
							colour = Vector3(slot17, 0.75, 0.75)
						else
							slot18 = unit

							if not unit.visible(slot17) then
								slot20 = 0
								colour = Vector3(slot17, 1, 0)
							end
						end

						slot20 = colour

						self._list.set_item_text_colour(slot17, self._list, i)

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
function UnitByName:_get_filter_string(unit)
	slot4 = self
	local filter = self._get_filter_type(slot3)

	if filter == "by_unit_id" then
		slot5 = unit

		return unit.unit_data(slot4).unit_id
	end

	if filter == "by_unit_name" then
		slot5 = unit
		slot5 = unit.name(slot4)

		return unit.name(slot4).s(slot4)
	end

	if filter == "by_name_id" then
		slot5 = unit

		return unit.unit_data(slot4).name_id
	end

	return 
end
function UnitByName:_continent_locked(unit)
	slot4 = unit
	local continent = unit.unit_data(slot3).continent

	if not continent then
		return false
	end

	slot5 = unit
	slot6 = "locked"

	return unit.unit_data(slot4).continent.value(slot4, unit.unit_data(slot4).continent)
end
function UnitByName:_unit_condition(unit)
	if self._unit_filter_function then
		slot4 = unit

		return self._unit_filter_function(slot3)
	end

	slot4 = unit

	return not unit.unit_data(slot3).instance
end
function UnitByName:reset()
	slot3 = self

	self.fill_unit_list(slot2)

	return 
end
function UnitByName:freeze()
	slot3 = self._list

	self._list.freeze(slot2)

	return 
end
function UnitByName:thaw()
	slot3 = self._list

	self._list.thaw(slot2)

	return 
end

return 
