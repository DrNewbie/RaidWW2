-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEngineAccess"

core.import(slot1, core)

if not CoreEditorEwsDialog then
	slot3 = BasicEventHandling
	slot0 = mixin(slot1, class())
end

CoreEditorEwsDialog = slot0
function CoreEditorEwsDialog:init(parent, caption, id, position, size, style, settings)
	self._default_position = position
	self._default_size = size
	local pos = (settings and settings.position) or self._default_position
	local size = (settings and settings.size) or self._default_size
	slot18 = style
	self._dialog = EWS.Dialog(slot11, EWS, parent, caption, id, pos, size)
	slot12 = self._dialog

	self._dialog.set_icon(slot11, CoreEWS.image_path(caption))

	slot13 = "HORIZONTAL"
	self._dialog_sizer = EWS.BoxSizer(slot11, EWS)
	slot13 = self._dialog_sizer

	self._dialog.set_sizer(slot11, self._dialog)

	slot18 = "_evt_close_window"
	slot15 = nil

	self._dialog.connect(slot11, self._dialog, "EVT_CLOSE_WINDOW", callback("world_editor_16x16.png", self, self))

	return 
end
function CoreEditorEwsDialog:_evt_close_window()
	slot3 = self

	self.on_cancel(slot2)

	return 
end
function CoreEditorEwsDialog:create_panel(orientation)
	slot7 = "TAB_TRAVERSAL"
	self._panel = EWS.Panel(slot3, EWS, self._dialog, "")
	slot5 = orientation
	self._panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._panel_sizer

	self._panel.set_sizer(slot3, self._panel)

	return 
end
function CoreEditorEwsDialog:update(t, dt)
	return 
end
function CoreEditorEwsDialog:dialog()
	return self._dialog
end
function CoreEditorEwsDialog:panel()
	return self._panel
end
function CoreEditorEwsDialog:set_visible(visible)
	slot5 = visible

	self._dialog.set_visible(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:visible()
	slot3 = self._dialog

	return self._dialog.visible(slot2)
end
function CoreEditorEwsDialog:set_enabled(enabled)
	slot5 = enabled

	self._dialog.set_enabled(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:enabled()
	slot3 = self._dialog

	return self._dialog.enabled(slot2)
end
function CoreEditorEwsDialog:show_modal()
	slot3 = self._dialog

	self._dialog.show_modal(slot2)

	return 
end
function CoreEditorEwsDialog:end_modal(code)
	slot5 = code

	self._dialog.end_modal(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:size()
	slot3 = self._dialog

	return self._dialog.get_size(slot2)
end
function CoreEditorEwsDialog:set_size(size)
	slot5 = size

	self._dialog.set_size(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:key_cancel(ctrlr, event)
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
function CoreEditorEwsDialog:on_cancel()
	slot4 = false

	self._dialog.set_visible(slot2, self._dialog)

	return 
end
function CoreEditorEwsDialog:position()
	slot3 = self._dialog

	return self._dialog.get_position(slot2)
end
function CoreEditorEwsDialog:set_position(pos)
	slot5 = pos

	self._dialog.set_position(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:set_caption(caption)
	slot5 = caption

	self._dialog.set_caption(slot3, self._dialog)

	return 
end
function CoreEditorEwsDialog:reset()
	return 
end
function CoreEditorEwsDialog:recreate()
	return 
end
function CoreEditorEwsDialog:destroy()
	slot3 = self._dialog

	self._dialog.destroy(slot2)

	return 
end
UnitList = UnitList or class()
function UnitList:init()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER"
	self._dialog = EWS.Dialog(slot2, EWS, nil, "Unit debug list", "", Vector3(slot8, 100, 100), Vector3(100, 850, 600))
	slot4 = "HORIZONTAL"
	local dialog_sizer = EWS.BoxSizer(slot2, EWS)
	slot5 = dialog_sizer

	self._dialog.set_sizer(EWS, self._dialog)

	slot7 = ""
	local panel = EWS.Panel(EWS, EWS, self._dialog, "")
	self._panel = panel
	slot6 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot9 = "LC_REPORT,LC_SORT_ASCENDING"
	self._list = EWS.ListCtrl(EWS, EWS, panel, "")
	slot6 = self._list

	self._list.clear_all(EWS)

	slot7 = "Name"

	self._list.append_column(EWS, self._list)

	slot7 = "Amount"

	self._list.append_column(EWS, self._list)

	slot7 = "Geometry Memory"

	self._list.append_column(EWS, self._list)

	slot7 = "Models"

	self._list.append_column(EWS, self._list)

	slot7 = "Bodies"

	self._list.append_column(EWS, self._list)

	slot7 = "Slot"

	self._list.append_column(EWS, self._list)

	slot7 = "Mass"

	self._list.append_column(EWS, self._list)

	slot7 = "Textures"

	self._list.append_column(EWS, self._list)

	slot7 = "Materials"

	self._list.append_column(EWS, self._list)

	slot7 = "Vertices/Triangles"

	self._list.append_column(EWS, self._list)

	slot7 = "Instanced"

	self._list.append_column(EWS, self._list)

	slot7 = "Author"

	self._list.append_column(EWS, self._list)

	slot7 = "Unit Filename"

	self._list.append_column(EWS, self._list)

	slot7 = "Object filename"

	self._list.append_column(EWS, self._list)

	slot7 = "Diesel Filename"

	self._list.append_column(EWS, self._list)

	slot7 = "Material Filename"

	self._list.append_column(EWS, self._list)

	slot7 = "Last Exported From"

	self._list.append_column(EWS, self._list)

	self._column_states = {}
	slot7 = {
		value = "name",
		state = "ascending"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "amount",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "memory",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "models",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "nr_bodies",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "slot",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "mass",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "nr_textures",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "nr_materials",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "vertices_per_tris",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "instanced",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "author",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "unit_filename",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "model_filename",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "diesel_filename",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "material_filename",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot7 = {
		value = "last_exported_from",
		state = "random"
	}

	table.insert(EWS, self._column_states)

	slot10 = "EXPAND,TOP,BOTTOM"

	panel_sizer.add(EWS, panel_sizer, self._list, 2, 0)

	self._unit_list = EWS.ListCtrl(EWS, EWS, panel, "")
	slot6 = self._unit_list

	self._unit_list.clear_all(EWS)

	slot7 = "Name ID"

	self._unit_list.append_column(EWS, self._unit_list)

	slot7 = "Unit ID"

	self._unit_list.append_column(EWS, self._unit_list)

	slot12 = "on_select_unit_list"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback("LC_REPORT,LC_SORT_ASCENDING", self, self))

	slot12 = "on_changed_layer"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot12 = "column_click_list"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_COL_CLICK", callback(nil, self, self))

	slot12 = "key_cancel"

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot12 = "on_select_unit_list_unit"

	self._unit_list.connect(EWS, self._unit_list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback("", self, self))

	slot12 = "key_cancel"

	self._unit_list.connect(EWS, self._unit_list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot12 = "key_delete"
	slot9 = ""

	self._unit_list.connect(EWS, self._unit_list, "EVT_KEY_DOWN", callback("", self, self))

	slot7 = "HORIZONTAL"
	local bottom_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND"

	bottom_sizer.add(EWS, bottom_sizer, self._unit_list, 7, 0)

	slot8 = "VERTICAL"
	local stats_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "BU_BOTTOM"
	local update_btn = EWS.Button(EWS, EWS, panel, "Update", "")
	slot13 = "EXPAND,LEFT,TOP"

	stats_sizer.add(EWS, stats_sizer, update_btn, 0, 5)

	slot15 = "fill_unit_list"
	slot12 = "all"

	update_btn.connect(EWS, update_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot13 = "BU_BOTTOM"
	local update_btn = EWS.Button(EWS, EWS, panel, "Update Limited", "")
	slot14 = "EXPAND,LEFT,TOP"

	stats_sizer.add(EWS, stats_sizer, update_btn, 0, 5)

	slot16 = "fill_unit_list"

	update_btn.connect(EWS, update_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot11 = "HORIZONTAL"
	local total_units_sizer = EWS.BoxSizer(EWS, EWS)
	slot18 = ""
	slot15 = "ALIGN_CENTER_VERTICAL"

	total_units_sizer.add(EWS, total_units_sizer, EWS.StaticText("limited", EWS, panel, "Total units:", ""), 1, 0)

	slot15 = ""
	self._total_units = EWS.StaticText(EWS, EWS, panel, "0", "")
	slot15 = "ALIGN_CENTER_VERTICAL"

	total_units_sizer.add(EWS, total_units_sizer, self._total_units, 0, 0)

	slot15 = "EXPAND,TOP,LEFT"

	stats_sizer.add(EWS, stats_sizer, total_units_sizer, 0, 5)

	slot12 = "HORIZONTAL"
	local total_unique_units_sizer = EWS.BoxSizer(EWS, EWS)
	slot19 = ""
	slot16 = "ALIGN_CENTER_VERTICAL"

	total_unique_units_sizer.add(EWS, total_unique_units_sizer, EWS.StaticText(5, EWS, panel, "Total unique units:", ""), 1, 0)

	slot16 = ""
	self._total_unique_units = EWS.StaticText(EWS, EWS, panel, "0", "")
	slot16 = "ALIGN_CENTER_VERTICAL"

	total_unique_units_sizer.add(EWS, total_unique_units_sizer, self._total_unique_units, 0, 0)

	slot16 = "EXPAND,TOP,LEFT"

	stats_sizer.add(EWS, stats_sizer, total_unique_units_sizer, 0, 5)

	slot13 = "HORIZONTAL"
	local total_geometry_sizer = EWS.BoxSizer(EWS, EWS)
	slot20 = ""
	slot17 = "ALIGN_CENTER_VERTICAL"

	total_geometry_sizer.add(EWS, total_geometry_sizer, EWS.StaticText(5, EWS, panel, "Total geometry:", ""), 1, 0)

	slot17 = ""
	self._total_geometry = EWS.StaticText(EWS, EWS, panel, "0", "")
	slot17 = "ALIGN_CENTER_VERTICAL"

	total_geometry_sizer.add(EWS, total_geometry_sizer, self._total_geometry, 0, 0)

	slot17 = "EXPAND,TOP,LEFT"

	stats_sizer.add(EWS, stats_sizer, total_geometry_sizer, 0, 5)

	slot17 = "EXPAND,RIGHT"

	bottom_sizer.add(EWS, bottom_sizer, stats_sizer, 2, 5)

	slot17 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, bottom_sizer, 1, 0)

	slot14 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot18 = "BU_BOTTOM"
	local delete_btn = EWS.Button(EWS, EWS, panel, "Delete", "")
	slot19 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, delete_btn, 0, 2)

	slot21 = "on_delete"
	slot18 = ""

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot19 = ""
	local cancel_btn = EWS.Button(EWS, EWS, panel, "Cancel", "")
	slot20 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot22 = "on_cancel"
	slot19 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot20 = "ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, button_sizer, 0, 0)

	slot20 = "EXPAND"

	dialog_sizer.add(EWS, dialog_sizer, panel, 1, 0)

	slot17 = "all"

	self.fill_unit_list(EWS, self)

	slot17 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function UnitList:key_delete(ctrlr, event)
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
function UnitList:key_cancel(ctrlr, event)
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
function UnitList:on_cancel()
	slot4 = false

	self._dialog.set_visible(slot2, self._dialog)

	return 
end
function UnitList:on_delete()
	slot3 = managers.editor

	managers.editor.freeze_gui_lists(slot2)

	slot5 = self

	for _, unit in ipairs(self.selected_item_units(slot4)) do
		slot9 = unit

		managers.editor.delete_unit(slot7, managers.editor)
	end

	slot3 = managers.editor

	managers.editor.thaw_gui_lists(slot2)

	return 
end
function UnitList:selected_item_units()
	local units = {}
	slot6 = self._unit_list

	for _, i in ipairs(self._unit_list.selected_items(slot5)) do
		slot11 = i
		local unit = self._unit_list_units[self._unit_list.get_item_data(slot9, self._unit_list)]
		slot11 = unit

		table.insert(slot9, units)
	end

	return units
end
function UnitList:column_click_list(data, event)
	slot5 = event
	local column = event.get_column(slot4) + 1
	local value = self._column_states[column].value
	local state = self._column_states[column].state
	slot8 = self._column_states

	for name, s in pairs(slot7) do
		s = "random"
	end

	if state == "random" then
		state = "ascending"
	elseif state == "ascending" then
		state = "descending"
	elseif state == "descending" then
		state = "ascending"
	end

	self._column_states[column].state = state
	local f = nil

	if state == "ascending" then
		function f(item1, item2)
			if item1[value] < item2[value] then
				return -1
			elseif item2[value] < item1[value] then
				return 1
			end

			return 0
		end
	else
		function f(item1, item2)
			if item2[value] < item1[value] then
				return -1
			elseif item1[value] < item2[value] then
				return 1
			end

			return 0
		end
	end

	slot10 = f

	self._list.sort(slot8, self._list)

	return 
end
function UnitList:on_changed_layer()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index ~= -1 then
		slot6 = 0
		local unit_name = self._list.get_item(slot3, self._list, index)
		slot6 = unit_name
		local s = managers.editor.select_unit_name(self._list, managers.editor)
		slot7 = s

		managers.editor.output(managers.editor, managers.editor)
	end

	return 
end
function UnitList:on_select_unit_list(ignore_unit)
	local list = self._list
	local unit_list = self._unit_list
	slot6 = list
	local index = list.selected_item(slot5)

	if index ~= -1 then
		slot9 = 0
		local unit_name = list.get_item(slot6, list, index)
		slot8 = unit_list

		unit_list.delete_all_items(list)

		local units = World.find_units_quick(list, World)
		self._unit_list_units = {}
		local j = 1
		slot10 = units

		for _, unit in ipairs("all") do
			slot15 = unit
			slot15 = unit.name(slot14)

			if unit.name(slot14).s(slot14) == unit_name then
				slot15 = unit

				if unit.unit_data(slot14) and (not ignore_unit or ignore_unit ~= unit) then
					slot18 = unit
					slot16 = unit.unit_data(slot17).name_id
					local i = unit_list.append_item(slot14, unit_list)
					slot21 = unit
					slot19 = unit.unit_data(slot20).unit_id

					unit_list.set_item(unit_list, unit_list, i, 1)

					slot18 = j

					unit_list.set_item_data(unit_list, unit_list, i)

					self._unit_list_units[j] = unit
					j = j + 1
				end
			end
		end

		if #self._unit_list_units == 0 then
			slot11 = "Unit " .. unit_name .. " is not placed by editor."

			managers.editor.output_error(slot9, managers.editor)
		end

		slot11 = unit_list

		for i = 0, unit_list.column_count(slot10) - 1, 1 do
			slot15 = i

			unit_list.autosize_column(slot13, unit_list)
		end
	else
		slot7 = unit_list

		unit_list.delete_all_items(slot6)
	end

	return 
end
function UnitList:on_select_unit_list_unit()
	local list = self._list
	local unit_list = self._unit_list
	slot5 = unit_list
	local index = unit_list.selected_item(slot4)
	slot8 = index
	local unit = self._unit_list_units[unit_list.get_item_data(slot6, unit_list)]
	slot7 = unit

	if not unit.unit_data(slot6).instance then
		slot8 = unit

		managers.editor.select_unit(slot6, managers.editor)
	end

	slot8 = unit

	managers.editor.center_view_on_unit(slot6, managers.editor)

	return 
end
function UnitList:reset()
	slot4 = "all"

	self.fill_unit_list(slot2, self)

	slot3 = self._unit_list

	self._unit_list.delete_all_items(slot2)

	return 
end
function UnitList:deleted_unit(unit)
	slot4 = self

	self.freeze(slot3)

	slot4 = self._list
	local index = self._list.selected_item(slot3)
	slot6 = self._list

	for i = 0, self._list.item_count(slot5) - 1, 1 do
		slot11 = 0
		slot10 = unit
		slot10 = unit.name(self._list)

		if self._list.get_item(slot8, self._list, i) == unit.name(self._list).s(self._list) then
			slot11 = 1
			local amount = self._list.get_item(slot8, self._list, i) - 1
			slot13 = amount

			self._list.set_item(self._list, self._list, i, 1)

			if amount == 0 then
				slot11 = i

				self._list.delete_item(slot9, self._list)
			end

			if index ~= -1 and index == i then
				slot11 = unit

				self.on_select_unit_list(slot9, self)
			end

			slot10 = self

			self.thaw(slot9)

			return 
		end
	end

	slot5 = self

	self.thaw(slot4)

	return 
end
function UnitList:spawned_unit(unit)
	slot4 = self

	self.freeze(slot3)

	slot4 = self._list
	local index = self._list.selected_item(slot3)
	slot6 = self._list

	for i = 0, self._list.item_count(slot5) - 1, 1 do
		slot11 = 0
		slot10 = unit
		slot10 = unit.name(self._list)

		if self._list.get_item(slot8, self._list, i) == unit.name(self._list).s(self._list) then
			slot11 = 1
			local amount = self._list.get_item(slot8, self._list, i) + 1
			slot13 = amount

			self._list.set_item(self._list, self._list, i, 1)

			if index ~= -1 and index == i then
				slot10 = self

				self.on_select_unit_list(slot9)
			end

			slot10 = self

			self.thaw(slot9)

			return 
		end
	end

	slot6 = unit
	local stats = managers.editor.get_unit_stat(slot4, managers.editor)
	stats.amount = 1
	slot9 = unit
	slot9 = unit.name(stats)

	self.append_item(managers.editor, self, unit.name(stats).s(stats))

	slot6 = self

	self._autosize_columns(managers.editor)

	slot6 = self

	self.thaw(managers.editor)

	return 
end
function UnitList:selected_unit(unit)
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = false

		self._list.set_item_selected(slot8, self._list, i)
	end

	slot4 = unit

	if not alive(slot3) then
		return 
	end

	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = 0
		slot9 = unit
		slot9 = unit.name(self._list)

		if self._list.get_item(slot7, self._list, i) == unit.name(self._list).s(self._list) then
			slot10 = true

			self._list.set_item_selected(slot7, self._list, i)

			slot9 = i

			self._list.ensure_visible(slot7, self._list)

			slot9 = self._unit_list

			for j = 0, self._unit_list.item_count(self._list) - 1, 1 do
				slot16 = 1

				if tonumber(self._unit_list.get_item(unit, self._unit_list, j)) == unit.unit_data(self._unit_list.get_item).unit_id then
					slot14 = true

					self._unit_list.set_item_selected(slot11, self._unit_list, j)

					slot13 = j

					self._unit_list.ensure_visible(slot11, self._unit_list)

					break
				end
			end

			return 
		end
	end

	return 
end
function UnitList:unit_name_changed(unit)
	slot4 = self._list
	local index = self._list.selected_item(slot3)
	slot6 = self._list

	for i = 0, self._list.item_count(slot5) - 1, 1 do
		slot11 = 0
		slot10 = unit
		slot10 = unit.name(self._list)

		if self._list.get_item(slot8, self._list, i) == unit.name(self._list).s(self._list) then
			if index ~= -1 and index == i then
				slot9 = self

				self.on_select_unit_list(slot8)
			end

			return 
		end
	end

	return 
end
function UnitList:fill_unit_list(type)
	self.freeze(slot3)

	local list = self._list
	slot5 = list

	list.delete_all_items(self)

	local data, total = nil

	if type == "limited" then
		slot7 = managers.editor
		data, total = managers.editor.get_unit_stats_from_layers(slot6)
	else
		slot7 = managers.editor
		data, total = managers.editor.get_unit_stats(slot6)
	end

	local unique = 0
	slot8 = data

	for name, t in pairs(slot7) do
		unique = unique + 1
		slot15 = t

		self.append_item(slot12, self, name)
	end

	slot9 = total.amount

	self._total_units.set_value(slot7, self._total_units)

	slot9 = unique

	self._total_unique_units.set_value(slot7, self._total_unique_units)

	slot9 = total.geometry_memory

	self._total_geometry.set_value(slot7, self._total_geometry)

	slot8 = self._panel

	self._panel.layout(slot7)

	slot8 = self

	self._autosize_columns(slot7)

	slot8 = self

	self.thaw(slot7)

	return 
end
function UnitList:_autosize_columns()
	slot4 = self._list

	for i = 0, self._list.column_count(slot3) - 1, 1 do
		slot8 = i

		self._list.autosize_column(slot6, self._list)
	end

	return 
end
function UnitList:append_item(name, t)
	slot6 = name
	local i = self._list.append_item(slot4, self._list)
	slot9 = t.amount

	self._list.set_item(self._list, self._list, i, 1)

	slot9 = t.memory

	self._list.set_item(self._list, self._list, i, 2)

	slot9 = t.models

	self._list.set_item(self._list, self._list, i, 3)

	slot9 = t.nr_bodies

	self._list.set_item(self._list, self._list, i, 4)

	slot9 = t.slot

	self._list.set_item(self._list, self._list, i, 5)

	slot9 = t.mass

	self._list.set_item(self._list, self._list, i, 6)

	slot9 = t.nr_textures

	self._list.set_item(self._list, self._list, i, 7)

	slot9 = t.nr_materials

	self._list.set_item(self._list, self._list, i, 8)

	slot9 = t.vertices_per_tris

	self._list.set_item(self._list, self._list, i, 9)

	slot8 = 10
	slot11 = t.instanced

	self._list.set_item(self._list, self._list, i, tostring(slot10))

	slot9 = t.author

	self._list.set_item(self._list, self._list, i, 11)

	slot9 = t.unit_filename

	self._list.set_item(self._list, self._list, i, 12)

	slot9 = t.model_filename

	self._list.set_item(self._list, self._list, i, 13)

	slot9 = t.diesel_filename

	self._list.set_item(self._list, self._list, i, 14)

	slot9 = t.material_filename

	self._list.set_item(self._list, self._list, i, 15)

	slot9 = t.last_exported_from

	self._list.set_item(self._list, self._list, i, 16)

	local new_t = clone(self._list)
	new_t.name = name
	slot7 = new_t.instanced
	new_t.instanced = tostring(t)
	slot9 = new_t

	self._list.set_item_data_ref(t, self._list, i)

	return 
end
function UnitList:set_visible(visible)
	slot5 = visible

	self._dialog.set_visible(slot3, self._dialog)

	return 
end
function UnitList:visible()
	slot3 = self._dialog

	self._dialog.visible(slot2)

	return 
end
function UnitList:freeze()
	slot3 = self._list

	self._list.freeze(slot2)

	slot3 = self._unit_list

	self._unit_list.freeze(slot2)

	return 
end
function UnitList:thaw()
	slot3 = self._unit_list

	self._unit_list.thaw(slot2)

	slot3 = self._list

	self._list.thaw(slot2)

	return 
end

if not UnitTreeBrowser then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

UnitTreeBrowser = slot0
function UnitTreeBrowser:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER"

	CoreEditorEwsDialog.init(slot2, self, nil, "Browse avalible units", "", Vector3(slot8, 200, 100), Vector3(200, 400, 900), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	self._unit_names = {}
	slot4 = "HORIZONTAL"
	local horizontal_ctrlr_sizer = EWS.BoxSizer(slot2, EWS)
	slot5 = "VERTICAL"
	local vertical_tree_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, vertical_tree_sizer, 1, 0)

	slot6 = "VERTICAL"
	local settings_sizer = EWS.BoxSizer(EWS, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_HORIZONTAL"

	settings_sizer.add(EWS, settings_sizer, EWS.StaticText(0, EWS, self._panel, "Filter", 0), 0, 0)

	slot10 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(EWS, EWS, self._panel, "", "")
	slot10 = "EXPAND"

	settings_sizer.add(EWS, settings_sizer, self._filter, 0, 0)

	slot12 = "update_tree"

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback(0, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	self._filter.connect(EWS, self._filter, "EVT_KEY_DOWN", callback(nil, self, self))

	slot10 = "EXPAND"

	vertical_tree_sizer.add(EWS, vertical_tree_sizer, settings_sizer, 0, 0)

	slot9 = "TR_ROW_LINES"
	self._unit_tree = EWS.TreeCtrl(EWS, EWS, self._panel, "")
	slot6 = self

	self.create_image_list(EWS)

	slot10 = "EXPAND"

	vertical_tree_sizer.add(EWS, vertical_tree_sizer, self._unit_tree, 1, 0)

	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot7 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	local expand_all_btn = EWS.Button(EWS, EWS, self._panel, "Expand All", "")
	slot14 = "on_expand_all"

	expand_all_btn.connect(EWS, expand_all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "key_cancel"
	slot11 = ""

	expand_all_btn.connect(EWS, expand_all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot12 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, expand_all_btn, 0, 2)

	local collapse_all_btn = EWS.Button(EWS, EWS, self._panel, "Collapse All", "")
	slot15 = "on_collapse_all"

	collapse_all_btn.connect(EWS, collapse_all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot15 = "key_cancel"
	slot12 = ""

	collapse_all_btn.connect(EWS, collapse_all_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, collapse_all_btn, 0, 2)

	slot13 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot14 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot16 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot16 = "key_cancel"
	slot13 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot14 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot10 = self

	self.update_tree(EWS)

	slot16 = "on_select"

	self._unit_tree.connect(EWS, self._unit_tree, "EVT_COMMAND_TREE_SEL_CHANGED", callback(0, self, self))

	slot16 = "key_cancel"
	slot13 = ""

	self._unit_tree.connect(EWS, self._unit_tree, "EVT_KEY_DOWN", callback("", self, self))

	slot14 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot11 = true

	self.set_visible(EWS, self)

	return 
end
function UnitTreeBrowser:create_image_list()
	self._image_list = EWS.ImageList(slot2, EWS, 16)
	slot3 = self._image_list
	slot6 = "connection_16x16.png"
	self._world_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "folder_16x16.png"
	self._layer_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "folder_open_16x16.png"
	self._layer_expand_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "folder_16x16.png"
	self._category_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "folder_open_16x16.png"
	self._category_expand_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "world_editor\\unit_file_max_16x16.png"
	self._unit_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot3 = self._image_list
	slot6 = "error_16x16.png"
	self._no_preview_icon = self._image_list.add(slot2, CoreEWS.image_path(16))
	slot4 = self._image_list

	self._unit_tree.set_image_list(slot2, self._unit_tree)

	return 
end
function UnitTreeBrowser:update_tree()
	slot3 = self

	self._create_tree_data(slot2)

	slot3 = self

	self._populate_tree(slot2)

	return 
end
function UnitTreeBrowser:_create_tree_data()
	self._tree_data = {
		total_units = 0,
		total_units_preview = 0,
		layers = {}
	}
	local layers = managers.editor.layers()
	slot5 = layers
	local layer_names = self.sorted_map(managers.editor, self)
	local filter = self._filter.get_value(self)
	slot6 = layer_names

	for _, layer_name in ipairs(self._filter) do
		self._tree_data.layers[layer_name] = {
			total_layer_units = 0,
			total_layer_units_preview = 0,
			categories = {},
			path = {}
		}
		slot11 = layers[layer_name]
		local c_map = layers[layer_name].category_map()

		if c_map then
			slot13 = c_map
			local c_names = self.sorted_map(slot11, self)
			slot13 = c_names

			for _, c_name in ipairs(self) do
				self._tree_data.layers[layer_name].categories[c_name] = {
					total_units = 0,
					total_preview_units = 0,
					units = {}
				}
				slot19 = c_map[c_name]
				local unit_names = self.sorted_map(, self)
				slot19 = unit_names

				for _, unit_name in ipairs(self) do
					slot27 = true

					if string.find(slot23, unit_name, filter, 1) then
						local split = string.split(slot23, unit_name)
						local path = self._tree_data.layers[layer_name].path
						slot26 = split

						for ip, pname in ipairs("/") do
							if ip == #split then
								path[pname .. ".unit"] = unit_name
							else
								path[pname] = path[pname] or {}
							end

							path = path[pname]
						end

						slot26 = self
						slot30 = unit_name
						local preview = self.has_preview(slot25, managers.editor.get_real_name(slot28, managers.editor))
						self._tree_data.layers[layer_name].categories[c_name].units[unit_name] = (preview and true) or false
						self._tree_data.total_units = self._tree_data.total_units + 1
						self._tree_data.total_units_preview = self._tree_data.total_units_preview + ((preview and 1) or 0)
						self._tree_data.layers[layer_name].total_layer_units = self._tree_data.layers[layer_name].total_layer_units + 1
						self._tree_data.layers[layer_name].total_layer_units_preview = self._tree_data.layers[layer_name].total_layer_units_preview + ((preview and 1) or 0)
						self._tree_data.layers[layer_name].categories[c_name].total_units = self._tree_data.layers[layer_name].categories[c_name].total_units + 1
						self._tree_data.layers[layer_name].categories[c_name].total_preview_units = self._tree_data.layers[layer_name].categories[c_name].total_preview_units + ((preview and 1) or 0)
					end
				end
			end
		end
	end

	return 
end
function UnitTreeBrowser:_populate_unit_paths(path, id)
	local x_unit, y_unit = nil

	local function sort(x, y)
		slot7 = true
		x_unit = (string.find(slot3, x, ".unit", nil) and true) or false
		slot7 = true
		y_unit = (string.find(slot3, y, ".unit", nil) and true) or false

		if x_unit ~= y_unit then
			return y_unit
		end

		return x < y
	end

	local ip_keys = table.map_keys(slot7, path)
	local size = 0
	slot10 = ip_keys

	for _, pname in ipairs(sort) do
		local data = path[pname]
		slot16 = data
		size = size + ((type(slot15) ~= "table" and 1) or 0)
	end

	local nsize = size
	slot11 = ip_keys

	for _, pname in ipairs(slot10) do
		local data = path[pname]
		slot19 = ""
		local new_name = string.gsub(slot16, pname, "%.unit")
		slot20 = new_name
		local new_id = self._unit_tree.append(pname, self._unit_tree, id)
		slot19 = data

		if type(self._unit_tree) == "table" then
			slot21 = self._category_icon

			self._unit_tree.set_item_image(slot18, self._unit_tree, new_id)

			slot22 = "EXPANDED"

			self._unit_tree.set_item_image(slot18, self._unit_tree, new_id, self._category_expand_icon)

			slot21 = new_id
			nsize = self._populate_unit_paths(slot18, self, data)
			size = size + nsize
			slot21 = new_name .. " [" .. nsize .. "]"

			self._unit_tree.set_item_text(slot18, self._unit_tree, new_id)
		else
			slot21 = self._unit_icon

			self._unit_tree.set_item_image(slot18, self._unit_tree, new_id)

			self._unit_names[new_id] = data
		end
	end

	return size
end
function UnitTreeBrowser:_populate_tree()
	slot3 = self._unit_tree

	self._unit_tree.freeze(slot2)

	slot3 = self._unit_tree

	self._unit_tree.clear(slot2)

	self._unit_names = {}
	slot4 = "Units [" .. self._tree_data.total_units .. "]"
	self._root = self._unit_tree.append_root(slot2, self._unit_tree)
	slot5 = true

	self._unit_tree.set_item_bold(slot2, self._unit_tree, self._root)

	slot5 = self._world_icon

	self._unit_tree.set_item_image(slot2, self._unit_tree, self._root)

	slot4 = self._tree_data.layers
	local layer_names = self.sorted_map(slot2, self)
	local filter = self._filter.get_value(self)
	slot5 = layer_names

	for _, layer_name in ipairs(self._filter) do
		local layer = self._tree_data.layers[layer_name]
		local preview = layer.total_layer_units_preview
		local total = layer.total_layer_units

		if filter == "" or 0 < total then
			slot15 = layer_name .. " [" .. total .. "]"
			local layer_id = self._unit_tree.append(slot12, self._unit_tree, self._root)
			slot16 = self._layer_icon

			self._unit_tree.set_item_image(self._unit_tree, self._unit_tree, layer_id)

			slot17 = "EXPANDED"

			self._unit_tree.set_item_image(self._unit_tree, self._unit_tree, layer_id, self._layer_expand_icon)

			slot16 = layer_id

			self._populate_unit_paths(self._unit_tree, self, self._tree_data.layers[layer_name].path)
		end
	end

	slot6 = self._root

	self._unit_tree.expand(slot4, self._unit_tree)

	slot5 = self._unit_tree

	self._unit_tree.thaw(slot4)

	return 
end
function UnitTreeBrowser:sorted_map(map)
	local sorted = {}
	slot5 = map

	for index, _ in pairs(slot4) do
		slot11 = index

		table.insert(slot9, sorted)
	end

	slot5 = sorted

	table.sort(slot4)

	return sorted
end
function UnitTreeBrowser:on_select(a, event)
	slot5 = event
	local id = event.get_item(slot4)

	if self._unit_names[id] then
		local item_text = self._unit_names[id]
		slot8 = item_text
		local name = managers.editor.get_real_name(slot6, managers.editor)
		slot9 = name

		managers.editor.select_unit_name(managers.editor, managers.editor)
	end

	return 
end
function UnitTreeBrowser:has_preview(name)
	slot6 = name

	if DB.has(slot3, DB, "preview_texture") then
		slot6 = name

		return managers.database.entry_expanded_path(slot3, managers.database, "preview_texture")
	end

	return nil
end
function UnitTreeBrowser:on_expand_all()
	slot3 = self._unit_tree

	self._unit_tree.freeze(slot2)

	slot3 = self
	slot7 = self._root

	self.expand_children(slot2, self._unit_tree.get_children(slot5, self._unit_tree))

	slot3 = self._unit_tree

	self._unit_tree.thaw(slot2)

	return 
end
function UnitTreeBrowser:expand_children(children)
	slot4 = children

	for _, child in ipairs(slot3) do
		slot9 = self
		slot13 = child

		self.expand_children(slot8, self._unit_tree.get_children(slot11, self._unit_tree))

		slot10 = child

		self._unit_tree.expand(slot8, self._unit_tree)
	end

	return 
end
function UnitTreeBrowser:on_collapse_all()
	slot3 = self._unit_tree

	self._unit_tree.freeze(slot2)

	slot3 = self
	slot7 = self._root

	self.collapse_children(slot2, self._unit_tree.get_children(slot5, self._unit_tree))

	slot3 = self._unit_tree

	self._unit_tree.thaw(slot2)

	return 
end
function UnitTreeBrowser:collapse_children(children)
	slot4 = children

	for _, child in ipairs(slot3) do
		slot9 = self
		slot13 = child

		self.collapse_children(slot8, self._unit_tree.get_children(slot11, self._unit_tree))

		slot10 = child

		self._unit_tree.collapse(slot8, self._unit_tree)
	end

	return 
end

if not GlobalSelectUnit then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

GlobalSelectUnit = slot0
function GlobalSelectUnit:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,MINIMIZE_BOX,MAXIMIZE_BOX"

	CoreEditorEwsDialog.init(slot2, self, nil, "Global select unit v2", "", Vector3(slot8, 525, 160), Vector3(525, 560, 680), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	self._preview_unit = nil
	self._only_list_used_units = false
	slot4 = "HORIZONTAL"
	local horizontal_ctrlr_sizer = EWS.BoxSizer(slot2, EWS)
	slot8 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot5 = "VERTICAL"
	local list_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, list_sizer, 3, 0)

	slot8 = "Type filter"
	local layers_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot10 = "EXPAND"

	horizontal_ctrlr_sizer.add(EWS, horizontal_ctrlr_sizer, layers_sizer, 1, 0)

	slot6 = self
	self._all_names = self._all_unit_names(EWS)
	slot6 = self._all_names
	self._names_as_ipairs = table.map_keys(EWS)
	slot10 = "ALIGN_LEFT"
	self._short_name = EWS.CheckBox(EWS, EWS, self._panel, "Short name", "")
	slot7 = true

	self._short_name.set_value(EWS, self._short_name)

	slot10 = "TOP,LEFT,EXPAND"

	list_sizer.add(EWS, list_sizer, self._short_name, 0, 5)

	slot13 = ""
	slot10 = "ALIGN_CENTER_HORIZONTAL"

	list_sizer.add(EWS, list_sizer, EWS.StaticText(0, EWS, self._panel, "Filter", 0), 0, 0)

	slot10 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(EWS, EWS, self._panel, "", "")
	slot10 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._filter, 0, 0)

	local cb = EWS.CheckBox(EWS, EWS, self._panel, "Only list used units", "")
	slot8 = self._only_list_used_units

	cb.set_value(EWS, cb)

	slot13 = "on_only_list_used_units"

	cb.connect(EWS, cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback("ALIGN_LEFT", self, self))

	slot13 = "key_cancel"
	slot10 = ""

	cb.connect(EWS, cb, "EVT_KEY_DOWN", callback({
		cb = cb
	}, self, self))

	slot11 = "TOP,BOTTOM,LEFT"

	list_sizer.add(EWS, list_sizer, cb, 0, 5)

	slot10 = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING,LC_SINGLE_SEL"
	self._units = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot7 = self._units

	self._units.clear_all(EWS)

	slot8 = "Name"

	self._units.append_column(EWS, self._units)

	slot11 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._units, 1, 0)

	slot13 = "on_select_unit_dialog"

	self._units.connect(EWS, self._units, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot13 = "key_down"

	self._units.connect(EWS, self._units, "EVT_KEY_DOWN", callback(self._units, self, self))

	slot13 = "key_up"

	self._units.connect(EWS, self._units, "EVT_KEY_UP", callback("", self, self))

	slot13 = "_on_units_focus_lost"

	self._units.connect(EWS, self._units, "EVT_KILL_FOCUS", callback("", self, self))

	slot13 = "update_list"

	self._short_name.connect(EWS, self._short_name, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot13 = "update_list"

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback(nil, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	self._filter.connect(EWS, self._filter, "EVT_KEY_DOWN", callback(nil, self, self))

	self._layer_cbs = {}
	slot7 = managers.editor
	local layers = managers.editor.layers(EWS)
	local names_layers = {}
	slot9 = layers

	for name, layer in pairs("EVT_KEY_DOWN") do
		slot16 = layer

		for _, type in ipairs(layer.unit_types(slot15)) do
			slot20 = type

			table.insert(slot18, names_layers)
		end
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

	slot13 = self

	self.update_list(EWS)

	slot14 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	local reload_btn = EWS.Button(EWS, EWS, self._panel, "Reload", "")
	slot16 = "Should only be used by artist, level designers be aware."

	reload_btn.set_tool_tip(EWS, reload_btn)

	slot21 = "on_reload"

	reload_btn.connect(EWS, reload_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot21 = "key_cancel"
	slot18 = ""

	reload_btn.connect(EWS, reload_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot19 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, reload_btn, 0, 5)

	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot22 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot22 = "key_cancel"
	slot19 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot20 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, cancel_btn, 0, 5)

	slot20 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, btn_sizer, 0, 0)

	slot20 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot17 = true

	self.set_visible(EWS, self)

	return 
end
function GlobalSelectUnit:key_down(ctrlr, event)
	slot5 = event

	event.skip(slot4)

	slot6 = "K_ESCAPE"
	slot6 = event

	if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
		slot6 = "GlobalSelectUnit:key_down(ctrlr, event): ESCAPE"

		Application.trace(slot4, Application)

		slot5 = self

		self.on_cancel(slot4)
	else
		slot6 = "K_SPACE"
		slot6 = event

		if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
			slot5 = self

			self._show_unit_preview(slot4)
		end
	end

	return 
end
function GlobalSelectUnit:key_up(ctrlr, event)
	slot5 = event

	event.skip(slot4)

	slot6 = "K_ESCAPE"
	slot6 = event

	if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
		slot6 = "GlobalSelectUnit:key_up(ctrlr, event): ESCAPE"

		Application.trace(slot4, Application)

		slot5 = self

		self.on_cancel(slot4)
	else
		slot6 = "K_SPACE"
		slot6 = event

		if EWS.name_to_key_code(slot4, EWS) == event.key_code(EWS) then
			slot5 = self

			self._on_unit_preview_end(slot4)
		end
	end

	return 
end
function GlobalSelectUnit:_show_unit_preview()
	slot3 = self

	if self._is_unit_being_previewed(slot2) then
		slot3 = self

		self._on_unit_preview_update(slot2)

		return 
	end

	slot3 = self
	slot6 = self

	self._on_unit_preview_start(slot2, self._get_selected_unit(slot5))

	return 
end
function GlobalSelectUnit:_on_units_focus_lost(ctrlr, event)
	slot5 = self

	self._on_unit_preview_end(slot4)

	return 
end
function GlobalSelectUnit:_on_unit_preview_start(unit_to_preview)
	self._preview_unit = unit_to_preview
	local previewed_unit_height = self._calculate_bounding_sphere_radius(slot3, self)
	local desired_distance_to_camera = previewed_unit_height
	slot8 = desired_distance_to_camera

	self._setup_preview_camera(unit_to_preview, self, previewed_unit_height)

	slot7 = Application
	slot7 = Application.last_camera_rotation(self)
	local position_in_front_camera = self._new_cam_pos + Application.last_camera_rotation(self).y(self) * desired_distance_to_camera
	slot11 = unit_to_preview
	slot11 = unit_to_preview.oobb(unit_to_preview)

	unit_to_preview.set_position(self, unit_to_preview)

	slot9 = unit_to_preview
	slot10 = unit_to_preview
	slot11 = unit_to_preview
	slot11 = unit_to_preview.oobb(unit_to_preview.oobb(unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview))))
	slot9 = unit_to_preview.oobb(unit_to_preview.oobb(unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview)))).center(unit_to_preview.oobb(unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview)))).z
	self._rotation_point_for_preview = Vector3(self, unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview)).center(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview)).x, unit_to_preview.oobb(unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview))).center(unit_to_preview.oobb(position_in_front_camera + unit_to_preview.position(slot9) - unit_to_preview.oobb(unit_to_preview).center(unit_to_preview))).y)

	return 
end
function GlobalSelectUnit:_on_unit_preview_update()
	local degrees_per_second = 45
	slot4 = Application
	local time = Application.time(slot3)
	local dt = nil

	if self._last_preview_update_time == nil then
		dt = 0.01667
	else
		dt = time - self._last_preview_update_time
	end

	if 0.01667 <= dt then
		slot11 = degrees_per_second

		self._rotate_around_point(slot5, self, self._preview_unit, self._rotation_point_for_preview, math.UP, dt)

		self._last_preview_update_time = time
	end

	return 
end
function GlobalSelectUnit:_on_unit_preview_end()
	slot3 = self

	if not self._is_unit_being_previewed(slot2) then
		return 
	end

	slot4 = self._preview_unit

	World.delete_unit(slot2, World)

	self._preview_unit = nil
	slot3 = managers.viewport
	slot4 = self._old_fov

	managers.viewport.get_current_camera(slot2).set_fov(slot2, managers.viewport.get_current_camera(slot2))

	slot3 = managers.viewport
	slot4 = self._old_cam_pos

	managers.viewport.get_current_camera(slot2).set_position(slot2, managers.viewport.get_current_camera(slot2))

	self._old_cam_pos = nil
	self._old_fov = nil
	self._rotation_point_for_preview = nil
	self._last_preview_update_time = nil

	return 
end
function GlobalSelectUnit:_is_unit_being_previewed()
	return self._preview_unit
end
function GlobalSelectUnit:_get_selected_unit()
	slot3 = self._units

	if self._units.selected_item(slot2) == -1 then
		return 
	end

	local selected_item_index = self._units.selected_item(slot2)
	slot8 = selected_item_index
	local name = managers.editor.get_real_name(self._units, self._units.get_item_data(slot6, self._units))
	slot9 = Application
	slot9 = Application.last_camera_rotation(Application)
	slot6 = Application.last_camera_position(self._units) + Application.last_camera_rotation(Application).y(Application)
	slot11 = 0

	return CoreUnit.safe_spawn_unit(managers.editor, name, Rotation(Application, 0, 0))
end
function GlobalSelectUnit:_setup_preview_camera(previewed_unit_height, desired_distance_to_camera)
	local one_km = 10000
	slot6 = managers.viewport
	slot6 = managers.viewport.get_current_camera(slot5)
	self._old_cam_pos = managers.viewport.get_current_camera(slot5).position(slot5)
	slot6 = Application
	self._new_cam_pos = Application.last_camera_position(slot5) + math.UP * one_km
	slot6 = managers.viewport
	slot6 = managers.viewport.get_current_camera(math.UP * one_km)
	self._old_fov = managers.viewport.get_current_camera(math.UP * one_km).fov(math.UP * one_km)
	slot8 = previewed_unit_height / (2 * desired_distance_to_camera)
	local new_fov = math.deg(math.atan(slot7))
	slot7 = managers.viewport
	slot8 = new_fov

	managers.viewport.get_current_camera(math.atan).set_fov(math.atan, managers.viewport.get_current_camera(math.atan))

	slot7 = managers.viewport
	slot8 = self._new_cam_pos

	managers.viewport.get_current_camera(math.atan).set_position(math.atan, managers.viewport.get_current_camera(math.atan))

	return 
end
function GlobalSelectUnit:_calculate_bounding_sphere_radius(unit)
	slot6 = unit
	slot7 = unit
	slot7 = unit.oobb(unit.oobb(slot5))
	slot7 = unit
	slot8 = unit
	slot8 = unit.oobb(unit.oobb(unit.oobb(slot5)))
	slot7 = unit
	slot8 = unit
	slot8 = unit.oobb(unit.oobb(unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y))
	slot4 = unit.oobb(slot5).size(slot5).x * unit.oobb(unit.oobb(slot5)).size(unit.oobb(slot5)).x + unit.oobb(unit.oobb(slot5)).size(unit.oobb(slot5)).y * unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y + unit.oobb(unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y).size(unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y).z * unit.oobb(unit.oobb(unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y)).size(unit.oobb(unit.oobb(unit.oobb(unit.oobb(slot5))).size(unit.oobb(unit.oobb(slot5))).y)).z
	local oobb_diagonal_length = math.sqrt(slot3)

	return oobb_diagonal_length * 2
end
function GlobalSelectUnit:_rotate_around_point(unit, point_to_rotate_around, axis, dt, speed)
	slot11 = unit
	slot9 = unit.position(slot10) - point_to_rotate_around * dt

	unit.set_position(slot7, unit)

	slot13 = speed * dt
	slot9 = unit.rotation(point_to_rotate_around * dt) * Rotation(unit, axis)

	unit.set_rotation(slot7, unit)

	slot11 = unit
	slot9 = unit.position(Rotation(unit, axis)) + point_to_rotate_around * dt

	unit.set_position(slot7, unit)

	return 
end
function GlobalSelectUnit:_stripped_unit_name(name)
	local reverse = string.reverse(slot3)
	slot6 = "/"
	local i = string.find(name, reverse)
	slot10 = i - 1
	name = string.reverse(string.sub(slot7, reverse, 0))

	return name
end
function GlobalSelectUnit:_all_unit_names()
	local names = {}
	local layers = managers.editor.layers(slot3)
	slot5 = layers

	for name, layer in pairs(managers.editor) do
		slot12 = layer

		for unit_name, unit_resource in pairs(layer.get_unit_map(slot11)) do
			slot15 = unit_resource
			slot15 = unit_resource.type(slot14)
			names[unit_name] = unit_resource.type(slot14).s(slot14)
		end
	end

	slot5 = names

	table.sort(slot4)

	return names
end
function GlobalSelectUnit:_current_unit_names()
	slot3 = managers.editor
	local layers = managers.editor.layers(slot2)
	local current_names = {}
	slot5 = layers

	for name, layer in pairs(slot4) do
		slot12 = layer

		for _, unit in ipairs(layer.created_units(slot11)) do
			slot15 = unit
			slot16 = unit
			slot16 = unit.name(unit.name(slot14))
			current_names[unit.name(slot14).s(slot14)] = (current_names[unit.name(unit.name(slot14)).s(unit.name(slot14))] or 0) + 1
		end
	end

	local names = {}
	slot6 = self._all_names

	for name, type in pairs(slot5) do
		slot12 = name

		if current_names[managers.editor.get_real_name(slot10, managers.editor)] then
			slot12 = name
			names[name] = current_names[managers.editor.get_real_name(slot10, managers.editor)]
		end
	end

	self._current = names

	return names
end
function GlobalSelectUnit:on_only_list_used_units(data)
	slot4 = data.cb
	self._only_list_used_units = data.cb.get_value(slot3)
	slot4 = self

	self.update_list(slot3)

	return 
end
function GlobalSelectUnit:on_reload()
	slot3 = self._units
	local i = self._units.selected_item(slot2)

	if i ~= -1 then
		local name = managers.editor.get_real_name(slot3, self._units.get_item_data(slot6, self._units))
		slot9 = name
		slot7 = true

		managers.editor.reload_units(managers.editor, managers.editor, {
			Idstring(i)
		})
	end

	return 
end
function GlobalSelectUnit:on_select_unit_dialog(units)
	slot5 = "GlobalSelectUnit:on_select_unit_dialog( units )"

	Application.trace(slot3, Application)

	slot4 = units
	local i = units.selected_item(slot3)

	if i ~= -1 then
		slot9 = i
		local name = managers.editor.get_real_name(slot4, units.get_item_data(slot7, units))
		slot6 = managers.editor
		slot10 = name

		managers.editor.output(managers.editor, managers.editor.select_unit_name(units, managers.editor))
	end

	return 
end
function GlobalSelectUnit:update_list(current)
	slot4 = self._units

	self._units.freeze(slot3)

	local filter = self._filter.get_value(slot3)
	slot5 = self._units

	self._units.delete_all_items(self._filter)

	if self._only_list_used_units then
		if not current then
			slot5 = self
			current = self._current_unit_names(slot4)
		end

		slot5 = current

		for name, _ in pairs(slot4) do
			local type = self._all_names[name]
			slot11 = self._layer_cbs[type]

			if self._layer_cbs[type].get_value(slot10) then
				slot11 = self._short_name
			end
		end
	else
		slot5 = self._names_as_ipairs

		for _, name in ipairs(slot4) do
			local type = self._all_names[name]
			slot11 = self._layer_cbs[type]

			if self._layer_cbs[type].get_value(slot10) then
				slot11 = self._short_name
			end
		end
	end

	slot5 = self._units

	self._units.thaw(slot4)

	slot6 = 0

	self._units.autosize_column(slot4, self._units)

	return 
end
function GlobalSelectUnit:spawned_unit(unit)
	if self._only_list_used_units then
		slot4 = self._current

		for name, _ in pairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = self._current[name] + 1
				slot10 = self._current

				self.update_list(self._current[name] + 1, self)

				return 
			end
		end

		slot4 = self._all_names

		for name, type in pairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = 1
				slot10 = self._current

				self.update_list(1, self)

				return 
			end
		end
	end

	return 
end
function GlobalSelectUnit:deleted_unit(unit)
	if self._only_list_used_units then
		slot4 = self._current

		for name, _ in pairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = self._current[name] - 1

				if self._current[name] == 0 then
					self._current[name] = nil
				end

				slot10 = self._current

				self.update_list(slot8, self)

				return 
			end
		end
	end

	return 
end
function GlobalSelectUnit:set_visible(...)
	slot3 = self

	CoreEditorEwsDialog.set_visible(slot2, ...)

	slot3 = self._filter

	self._filter.set_focus(slot2)

	slot5 = -1

	self._filter.set_selection(slot2, self._filter, -1)

	return 
end
function GlobalSelectUnit:reset()
	slot3 = self

	self.update_list(slot2)

	return 
end
function GlobalSelectUnit:on_all_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = true

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.update_list(slot2)

	return 
end
function GlobalSelectUnit:on_none_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot9 = false

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.update_list(slot2)

	return 
end
function GlobalSelectUnit:on_invert_layers()
	slot3 = self._layer_cbs

	for name, cb in pairs(slot2) do
		slot11 = cb
		slot9 = not cb.get_value(slot10)

		cb.set_value(slot7, cb)
	end

	slot3 = self

	self.update_list(slot2)

	return 
end
function GlobalSelectUnit:on_layer_cb(data)
	slot4 = self

	self.update_list(slot3)

	return 
end

if not ReplaceUnit then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

ReplaceUnit = slot0
function ReplaceUnit:init(name, types)
	slot13 = 0
	slot14 = 0
	slot11 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER"

	CoreEditorEwsDialog.init(slot4, self, nil, name, "", Vector3(slot10, 300, 150), Vector3(300, 900, 500))

	slot6 = "VERTICAL"

	self.create_panel(slot4, self)

	slot6 = "HORIZONTAL"
	local horizontal_units_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_units_sizer, 1, 0)

	slot9 = "NB_TOP,NB_MULTILINE"
	local notebook = EWS.Notebook(EWS, EWS, self._panel, "")
	slot11 = "EXPAND"

	horizontal_units_sizer.add(EWS, horizontal_units_sizer, notebook, 1, 0)

	self._all_unit_lists = {}
	local category_map = {}
	local unit_names = {}
	slot9 = types

	for _, t in pairs(notebook) do
		category_map[t] = {}
		slot17 = t

		for _, unit_name in ipairs(managers.database.list_units_of_type(slot15, managers.database)) do
			slot20 = unit_name

			table.insert(slot18, category_map[t])

			slot20 = unit_name

			table.insert(slot18, unit_names)
		end
	end

	slot12 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot8, EWS, self._panel, "")
	slot14 = "EXPAND"

	horizontal_units_sizer.add(EWS, horizontal_units_sizer, panel, 1, 0)

	slot11 = "VERTICAL"
	local units_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = units_sizer

	panel.set_sizer(EWS, panel)

	slot18 = ""
	slot15 = "ALIGN_CENTER_HORIZONTAL"

	units_sizer.add(EWS, units_sizer, EWS.StaticText(0, EWS, panel, "Filter", 0), 0, 0)

	slot15 = "TE_CENTRE"
	local unit_filter = EWS.TextCtrl(EWS, EWS, panel, "", "")
	slot16 = "EXPAND"

	units_sizer.add(EWS, units_sizer, unit_filter, 0, 0)

	slot15 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	local units = EWS.ListBox(EWS, EWS, panel, "replace_unit_units_1")
	slot13 = units

	units.freeze(EWS)

	slot13 = unit_names

	for _, name in pairs(EWS) do
		slot19 = name

		units.append(slot17, units)
	end

	slot17 = "EXPAND"

	units_sizer.add(slot12, units_sizer, units, 1, 0)

	slot19 = "replace_unit_name"

	units.connect(slot12, units, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot13 = units

	units.thaw(slot12)

	slot19 = "update_filter"
	slot16 = {
		filter = unit_filter,
		units = units,
		names = unit_names
	}

	unit_filter.connect(slot12, unit_filter, "EVT_COMMAND_TEXT_UPDATED", callback(units, self, self))

	slot14 = units

	table.insert(slot12, self._all_unit_lists)

	slot13 = category_map

	for c, names in pairs(slot12) do
		slot21 = "TAB_TRAVERSAL"
		local panel = EWS.Panel(slot17, EWS, notebook, "")
		slot20 = "VERTICAL"
		local units_sizer = EWS.BoxSizer(EWS, EWS)
		slot21 = units_sizer

		panel.set_sizer(EWS, panel)

		slot27 = ""
		slot24 = "ALIGN_CENTER_HORIZONTAL"

		units_sizer.add(EWS, units_sizer, EWS.StaticText(slot22, EWS, panel, "Filter", 0), 0, 0)

		slot24 = "TE_CENTRE"
		local unit_filter = EWS.TextCtrl(EWS, EWS, panel, "", "")
		slot25 = "EXPAND"

		units_sizer.add(EWS, units_sizer, unit_filter, 0, 0)

		slot24 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
		local units = EWS.ListBox(EWS, EWS, panel, "replace_unit_units_2")
		slot22 = units

		units.freeze(EWS)

		slot22 = names

		for _, name in ipairs(EWS) do
			slot28 = name

			units.append(slot26, units)
		end

		slot26 = "EXPAND"

		units_sizer.add(slot21, units_sizer, units, 1, 0)

		slot28 = "replace_unit_name"

		units.connect(slot21, units, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

		slot22 = units

		units.thaw(slot21)

		slot28 = "update_filter"

		unit_filter.connect(slot21, unit_filter, "EVT_COMMAND_TEXT_UPDATED", callback(units, self, self))

		slot27 = c
		slot25 = true

		notebook.add_page(slot21, notebook, panel, managers.editor.category_name({
			filter = unit_filter,
			units = units,
			names = names
		}, managers.editor))

		slot23 = units

		table.insert(slot21, self._all_unit_lists)
	end

	slot14 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(slot12, EWS)
	local ok_btn = EWS.Button(EWS, EWS, self._panel, "OK", "_ok_dialog")
	slot21 = "close_replace_unit"
	slot18 = {
		value = true
	}

	ok_btn.connect(EWS, ok_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot19 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, ok_btn, 0, 5)

	local none_btn = EWS.Button(EWS, EWS, self._panel, "None", "_none_dialog")
	slot22 = "close_replace_unit"
	slot19 = {
		value = false
	}

	none_btn.connect(EWS, none_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot20 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, none_btn, 0, 5)

	slot20 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, btn_sizer, 0, 0)

	slot20 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot16 = self

	self.show_modal(EWS)

	return 
end
function ReplaceUnit:replace_unit_name(units)
	slot4 = self._all_unit_lists

	for _, units_list in ipairs(slot3) do
		if units_list ~= units then
			slot9 = units_list
			local i = units_list.selected_index(slot8)

			if -1 < i then
				slot11 = i

				units_list.deselect_index(slot9, units_list)
			end
		end
	end

	slot4 = units
	local i = units.selected_index(slot3)

	if -1 < i then
		slot6 = i
		self._replace_unit_name = units.get_string(slot4, units)
	end

	return 
end
function ReplaceUnit:update_filter(data)
	local filter = data.filter.get_value(slot3)
	slot5 = data.units

	data.units.freeze(data.filter)

	slot5 = data.units

	data.units.clear(data.filter)

	slot5 = data.names

	for _, name in pairs(data.filter) do
		slot11 = filter

		if string.find(slot9, name) then
			slot11 = name

			data.units.append(slot9, data.units)
		end
	end

	slot5 = data.units

	data.units.thaw(slot4)

	return 
end
function ReplaceUnit:close_replace_unit(data)
	self._made_replace_choice = data.value
	slot4 = self

	self.end_modal(slot3)

	return 
end
function ReplaceUnit:result()
	if self._made_replace_choice and self._replace_unit_name then
		return self._replace_unit_name
	end

	return false
end

if not LayerReplaceUnit then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

LayerReplaceUnit = slot0
function LayerReplaceUnit:init(layer)
	slot12 = 0
	slot13 = 0
	slot10 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot3, self, nil, "Replace Units", "", Vector3(slot9, 525, 200), Vector3(525, 270, 400))

	slot5 = "VERTICAL"

	self.create_panel(slot3, self)

	self._only_list_used_units = false
	self._layer = layer
	slot5 = layer
	self._all_names = self._all_unit_names(slot3, self)
	slot11 = ""
	slot8 = "ALIGN_CENTER_HORIZONTAL"

	self._panel_sizer.add(slot3, self._panel_sizer, EWS.StaticText("Replace Units", EWS, self._panel, "Filter", 0), 0, 0)

	slot8 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(slot3, EWS, self._panel, "", "")
	slot8 = "EXPAND"

	self._panel_sizer.add(slot3, self._panel_sizer, self._filter, 0, 0)

	local cb = EWS.CheckBox(slot3, EWS, self._panel, "Only list used units", "")
	slot6 = self._only_list_used_units

	cb.set_value(EWS, cb)

	slot11 = "on_only_list_used_units"

	cb.connect(EWS, cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback("ALIGN_RIGHT", self, self))

	slot11 = "key_cancel"
	slot8 = ""

	cb.connect(EWS, cb, "EVT_KEY_DOWN", callback({
		cb = cb
	}, self, self))

	slot9 = "TOP,BOTTOM,RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, cb, 0, 5)

	slot8 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._units = EWS.ListBox(EWS, EWS, self._panel, "layer_replace_units")
	slot5 = self

	self.update_list(EWS)

	slot9 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, self._units, 1, 0)

	slot11 = "replace_unit"

	self._units.connect(EWS, self._units, "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(0, self, self))

	slot11 = "key_cancel"

	self._units.connect(EWS, self._units, "EVT_KEY_DOWN", callback({
		all = false,
		units = self._units
	}, self, self))

	slot11 = "update_list"

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback("", self, self))

	slot11 = "key_cancel"
	slot8 = ""

	self._filter.connect(EWS, self._filter, "EVT_KEY_DOWN", callback(nil, self, self))

	slot6 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	local replace_btn = EWS.Button(EWS, EWS, self._panel, "Replace", "")
	slot13 = "replace_unit"

	replace_btn.connect(EWS, replace_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot13 = "key_cancel"
	slot10 = ""

	replace_btn.connect(EWS, replace_btn, "EVT_KEY_DOWN", callback({
		all = false,
		units = self._units
	}, self, self))

	slot11 = "EXPAND,RIGHT"

	btn_sizer.add(EWS, btn_sizer, replace_btn, 0, 5)

	local replace_all_btn = EWS.Button(EWS, EWS, self._panel, "Replace All", "")
	slot14 = "replace_unit"

	replace_all_btn.connect(EWS, replace_all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "key_cancel"
	slot11 = ""

	replace_all_btn.connect(EWS, replace_all_btn, "EVT_KEY_DOWN", callback({
		all = true,
		units = self._units
	}, self, self))

	slot12 = "EXPAND,RIGHT"

	btn_sizer.add(EWS, btn_sizer, replace_all_btn, 0, 5)

	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot15 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot15 = "key_cancel"
	slot12 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, cancel_btn, 0, 5)

	slot13 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, btn_sizer, 0, 0)

	slot13 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot10 = true

	self.set_visible(EWS, self)

	return 
end
function LayerReplaceUnit:_all_unit_names(layer)
	local names = {}
	slot7 = layer

	for unit_name, _ in pairs(layer.get_unit_map(slot6)) do
		slot11 = unit_name

		table.insert(slot9, names)
	end

	slot5 = names

	table.sort(slot4)

	return names
end
function LayerReplaceUnit:replace_unit(data)
	slot4 = self._layer

	if self._layer.selected_unit(slot3) and data then
		local units = data.units
		slot5 = units
		local i = units.selected_index(slot4)

		if -1 < i then
			slot10 = i
			local name = managers.editor.get_real_name(slot5, units.get_string(slot8, units))
			slot9 = data.all

			self._layer.replace_unit(managers.editor, self._layer, name)
		end
	end

	return 
end
function LayerReplaceUnit:_current_unit_names()
	local current_names = {}
	slot6 = self._layer

	for _, unit in ipairs(self._layer.created_units(slot5)) do
		slot9 = unit
		slot10 = unit
		slot10 = unit.name(unit.name(slot8))
		current_names[unit.name(slot8).s(slot8)] = (current_names[unit.name(unit.name(slot8)).s(unit.name(slot8))] or 0) + 1
	end

	local names = {}
	slot5 = self._all_names

	for _, name in ipairs(slot4) do
		slot11 = name

		if current_names[managers.editor.get_real_name(slot9, managers.editor)] then
			slot11 = name
			names[name] = current_names[managers.editor.get_real_name(slot9, managers.editor)]
		end
	end

	self._current = names

	return names
end
function LayerReplaceUnit:on_only_list_used_units(data)
	slot4 = data.cb
	self._only_list_used_units = data.cb.get_value(slot3)
	slot4 = self

	self.update_list(slot3)

	return 
end
function LayerReplaceUnit:update_list(current)
	slot4 = self._units

	self._units.freeze(slot3)

	local filter = self._filter.get_value(slot3)
	slot5 = self._units

	self._units.clear(self._filter)

	if self._only_list_used_units then
		if not current then
			slot5 = self
			current = self._current_unit_names(slot4)
		end

		slot5 = current

		for name, _ in pairs(slot4) do
			slot11 = filter

			if string.find(slot9, name) then
				slot11 = name

				self._units.append(slot9, self._units)
			end
		end
	else
		slot5 = self._all_names

		for _, name in ipairs(slot4) do
			slot11 = filter

			if string.find(slot9, name) then
				slot11 = name

				self._units.append(slot9, self._units)
			end
		end
	end

	slot5 = self._units

	self._units.thaw(slot4)

	return 
end
function LayerReplaceUnit:set_visible(visible)
	slot5 = visible

	CoreEditorEwsDialog.set_visible(slot3, self)

	slot4 = self

	self.update_list(slot3)

	return 
end
function LayerReplaceUnit:spawned_unit(unit)
	if self._only_list_used_units then
		slot4 = self._current

		for name, _ in pairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = self._current[name] + 1
				slot10 = self._current

				self.update_list(self._current[name] + 1, self)

				return 
			end
		end

		slot4 = self._all_names

		for _, name in ipairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = 1
				slot10 = self._current

				self.update_list(1, self)

				return 
			end
		end
	end

	return 
end
function LayerReplaceUnit:deleted_unit(unit)
	if self._only_list_used_units then
		slot4 = self._current

		for name, _ in pairs(slot3) do
			slot9 = unit
			slot11 = name

			if unit.name(slot8).s(slot8) == managers.editor.get_real_name(unit.name(slot8), managers.editor) then
				self._current[name] = self._current[name] - 1

				if self._current[name] == 0 then
					self._current[name] = nil
				end

				slot10 = self._current

				self.update_list(slot8, self)

				return 
			end
		end
	end

	return 
end
function LayerReplaceUnit:reset()
	slot3 = self

	self.update_list(slot2)

	return 
end

if not MoveTransformTypeIn then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

MoveTransformTypeIn = slot0
function MoveTransformTypeIn:init()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Move transform type-in", "", Vector3(slot8, 761, 67), Vector3(761, 264, 129))

	slot4 = "HORIZONTAL"

	self.create_panel(slot2, self)

	self._min = -100000000
	self._max = 100000000
	slot6 = "Absolut:World"
	local world_sizer = EWS.StaticBoxSizer(slot2, EWS, self._panel, "VERTICAL")
	slot9 = world_sizer
	self._ax = self._create_ctrl(EWS, self, "X:", "x", 0, "absolut")
	slot9 = world_sizer
	self._ay = self._create_ctrl(EWS, self, "Y:", "y", 0, "absolut")
	slot9 = world_sizer
	self._az = self._create_ctrl(EWS, self, "Z:", "z", 0, "absolut")
	slot8 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, world_sizer, 1, 0)

	slot7 = "Offset"
	local offset_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot10 = offset_sizer
	self._ox = self._create_ctrl(EWS, self, "X:", "x", 0, "offset")
	slot10 = offset_sizer
	self._oy = self._create_ctrl(EWS, self, "Y:", "y", 0, "offset")
	slot10 = offset_sizer
	self._oz = self._create_ctrl(EWS, self, "Z:", "z", 0, "offset")
	slot9 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, offset_sizer, 1, 0)

	slot9 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot6 = false

	self._panel.set_enabled(EWS, self._panel)

	return 
end
function MoveTransformTypeIn:_create_ctrl(name, coor, value, type, sizer)
	slot9 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = "ALIGN_LEFT"
	slot13 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, EWS.StaticText(slot11, EWS, self._panel, name, ""), 0, 0)

	slot13 = "TE_PROCESS_ENTER"
	local ctrl = EWS.TextCtrl(EWS, EWS, self._panel, value, "")
	slot11 = "Type in " .. type .. " " .. coor .. "-coordinate in meters"

	ctrl.set_tool_tip(EWS, ctrl)

	slot16 = "verify_number"
	slot13 = ctrl

	ctrl.connect(EWS, ctrl, "EVT_CHAR", callback(" ", nil, _G))

	if type == "offset" then
		slot16 = "update_offset"

		ctrl.connect(slot9, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(slot13, self, self))

		slot16 = "update_offset"
		slot13 = {
			ctrl = ctrl,
			coor = coor
		}

		ctrl.connect(slot9, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))
	else
		slot16 = "update_absolut"

		ctrl.connect(slot9, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(slot13, self, self))

		slot16 = "update_absolut"
		slot13 = {
			ctrl = ctrl,
			coor = coor
		}

		ctrl.connect(slot9, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))
	end

	slot14 = "EXPAND"

	ctrl_sizer.add(slot9, ctrl_sizer, ctrl, 1, 0)

	slot13 = "SP_VERTICAL"
	local spin = EWS.SpinButton(slot9, EWS, self._panel, "")
	local c = ctrl

	if type == "offset" then
		c = self["_a" .. coor]
	end

	slot18 = "update_spin"

	spin.connect(slot11, spin, "EVT_SCROLL_LINEUP", callback(slot15, self, self))

	slot18 = "update_spin"
	slot15 = {
		step = -0.1,
		ctrl = c,
		coor = coor
	}

	spin.connect(slot11, spin, "EVT_SCROLL_LINEDOWN", callback({
		step = 0.1,
		ctrl = c,
		coor = coor
	}, self, self))

	slot16 = "EXPAND"

	ctrl_sizer.add(slot11, ctrl_sizer, spin, 0, 0)

	slot16 = "EXPAND,LEFT,RIGHT"

	sizer.add(slot11, sizer, ctrl_sizer, 1, 10)

	return ctrl
end
function MoveTransformTypeIn:update_spin(data)
	slot6 = data.ctrl

	if not tonumber(data.ctrl.get_value(slot5)) then
		slot5 = 0

		data.ctrl.set_value(slot3, data.ctrl)
	end

	slot4 = data.ctrl
	slot10 = data.ctrl
	slot8 = data.ctrl.get_value(slot9) + data.step

	data.ctrl.set_value(slot3, string.format(slot6, "%.2f"))

	slot5 = data

	self.update_absolut(slot3, self)

	return 
end
function MoveTransformTypeIn:update_absolut(data)
	slot6 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot5)) or 0

	if self._min == value then
		return 
	end

	value = value * 100
	slot5 = self._unit

	if alive(slot4) then
		slot5 = self._unit
		local pos = self._unit.position(slot4)
		slot7 = value
		pos = pos["with_" .. data.coor](data.coor, pos)
		slot6 = data.ctrl
		slot10 = value / 100

		data.ctrl.change_value(data.coor, string.format(slot8, "%.2f"))

		slot8 = -1

		data.ctrl.set_selection(data.coor, data.ctrl, -1)

		slot7 = pos

		managers.editor.set_selected_units_position(data.coor, managers.editor)
	end

	return 
end
function MoveTransformTypeIn:update_offset(data, event)
	slot7 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot6)) or 0
	slot6 = self._unit

	if alive(slot5) then
		slot7 = "Local"
		local local_rot = managers.editor.is_coordinate_system(slot5, managers.editor)
		slot7 = self._unit
		local pos = self._unit.position(managers.editor)
		local rot = Rotation()

		if local_rot then
			slot9 = self._unit
			rot = self._unit.rotation(slot8)
		end

		value = value * 100
		slot9 = rot
		pos = pos + rot[data.coor](slot8) * value
		slot10 = pos

		managers.editor.set_selected_units_position(slot8, managers.editor)

		slot10 = 0

		data.ctrl.change_value(slot8, data.ctrl)

		slot11 = -1

		data.ctrl.set_selection(slot8, data.ctrl, -1)
	end

	return 
end
function MoveTransformTypeIn:set_unit(unit)
	self._unit = unit
	slot4 = self._panel
	slot7 = self._unit

	self._panel.set_enabled(slot3, alive(slot6))

	return 
end
function MoveTransformTypeIn:update(t, dt)
	slot5 = self._unit

	if alive(slot4) then
		local pos = self._unit.position(slot4)
		slot6 = self._ax

		if not self._ax.in_focus(self._unit) then
			slot6 = self._ax
			slot10 = pos.x / 100

			self._ax.change_value(slot5, string.format(slot8, "%.2f"))
		end

		slot6 = self._ay

		if not self._ay.in_focus(slot5) then
			slot6 = self._ay
			slot10 = pos.y / 100

			self._ay.change_value(slot5, string.format(slot8, "%.2f"))
		end

		slot6 = self._az

		if not self._az.in_focus(slot5) then
			slot6 = self._az
			slot10 = pos.z / 100

			self._az.change_value(slot5, string.format(slot8, "%.2f"))
		end
	end

	return 
end

if not RotateTransformTypeIn then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

RotateTransformTypeIn = slot0
function RotateTransformTypeIn:init()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Rotate transform type-in", "", Vector3(slot8, 761, 180), Vector3(761, 264, 129))

	slot4 = "HORIZONTAL"

	self.create_panel(slot2, self)

	self._min = -100000000
	self._max = 100000000
	slot6 = "Absolut:World"
	local world_sizer = EWS.StaticBoxSizer(slot2, EWS, self._panel, "VERTICAL")
	slot9 = world_sizer
	self._ax = self._create_ctrl(EWS, self, "X:", "x", 0, "absolut")
	slot9 = world_sizer
	self._ay = self._create_ctrl(EWS, self, "Y:", "y", 0, "absolut")
	slot9 = world_sizer
	self._az = self._create_ctrl(EWS, self, "Z:", "z", 0, "absolut")
	slot8 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, world_sizer, 1, 0)

	slot7 = "Offset"
	local offset_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot10 = offset_sizer
	self._ox = self._create_ctrl(EWS, self, "X:", "x", 0, "offset")
	slot10 = offset_sizer
	self._oy = self._create_ctrl(EWS, self, "Y:", "y", 0, "offset")
	slot10 = offset_sizer
	self._oz = self._create_ctrl(EWS, self, "Z:", "z", 0, "offset")
	slot9 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, offset_sizer, 1, 0)

	slot9 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot6 = false

	self._panel.set_enabled(EWS, self._panel)

	return 
end
function RotateTransformTypeIn:_create_ctrl(name, coor, value, type, sizer)
	slot9 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = "ALIGN_LEFT"
	slot13 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, EWS.StaticText(slot11, EWS, self._panel, name, ""), 0, 0)

	slot13 = "TE_PROCESS_ENTER"
	local ctrl = EWS.TextCtrl(EWS, EWS, self._panel, value, "")
	slot11 = "Type in " .. type .. " " .. coor .. "-rotation in degrees"

	ctrl.set_tool_tip(EWS, ctrl)

	slot16 = "verify_number"
	slot13 = ctrl

	ctrl.connect(EWS, ctrl, "EVT_CHAR", callback(" ", nil, _G))

	if type == "offset" then
		slot16 = "update_offset"

		ctrl.connect(slot9, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(slot13, self, self))

		slot16 = "update_offset"
		slot13 = {
			ctrl = ctrl,
			coor = coor
		}

		ctrl.connect(slot9, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))
	else
		slot16 = "update_absolut"

		ctrl.connect(slot9, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(slot13, self, self))

		slot16 = "update_absolut"
		slot13 = {
			ctrl = ctrl,
			coor = coor
		}

		ctrl.connect(slot9, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))
	end

	slot14 = "EXPAND"

	ctrl_sizer.add(slot9, ctrl_sizer, ctrl, 1, 0)

	slot13 = "SP_VERTICAL"
	local spin = EWS.SpinButton(slot9, EWS, self._panel, "")
	local c = ctrl

	if type == "offset" then
		c = self["_a" .. coor]
	end

	slot18 = "update_spin"

	spin.connect(slot11, spin, "EVT_SCROLL_LINEUP", callback(slot15, self, self))

	slot18 = "update_spin"
	slot15 = {
		step = -0.1,
		ctrl = c,
		coor = coor
	}

	spin.connect(slot11, spin, "EVT_SCROLL_LINEDOWN", callback({
		step = 0.1,
		ctrl = c,
		coor = coor
	}, self, self))

	slot16 = "EXPAND"

	ctrl_sizer.add(slot11, ctrl_sizer, spin, 0, 0)

	slot16 = "EXPAND,LEFT,RIGHT"

	sizer.add(slot11, sizer, ctrl_sizer, 1, 10)

	return ctrl
end
function RotateTransformTypeIn:update_spin(data)
	slot6 = data.ctrl

	if not tonumber(data.ctrl.get_value(slot5)) then
		slot5 = 0

		data.ctrl.set_value(slot3, data.ctrl)
	end

	slot4 = data.ctrl
	slot10 = data.ctrl
	slot8 = data.ctrl.get_value(slot9) + data.step

	data.ctrl.set_value(slot3, string.format(slot6, "%.2f"))

	slot5 = data

	self.update_absolut(slot3, self)

	return 
end
function RotateTransformTypeIn:update_absolut(data)
	slot6 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot5)) or 0

	if self._min == value then
		return 
	end

	slot5 = self._unit

	if alive(slot4) then
		slot5 = self._unit
		local rot = self._unit.rotation(slot4)

		if data.coor == "x" then
			slot7 = rot.pitch(slot8)
			slot10 = rot
			rot = Rotation(slot5, value, rot.roll(rot))
		elseif data.coor == "y" then
			slot8 = rot
			slot7 = value
			slot10 = rot
			rot = Rotation(slot5, rot.yaw(slot7), rot.roll(slot9))
		elseif data.coor == "z" then
			slot9 = rot
			slot8 = value
			rot = Rotation(slot5, rot.yaw(slot7), rot.pitch(rot))
		end

		slot6 = data.ctrl
		slot10 = value

		data.ctrl.change_value(slot5, string.format(slot8, "%.2f"))
		data.ctrl.set_selection(slot5, data.ctrl, -1)

		slot9 = self._unit
		slot9 = self._unit.rotation(-1)
		slot7 = rot * self._unit.rotation(-1).inverse(-1)

		managers.editor.set_selected_units_rotation(slot5, managers.editor)
	end

	return 
end
function RotateTransformTypeIn:update_offset(data, event)
	slot7 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot6)) or 0
	slot6 = self._unit

	if alive(slot5) then
		local local_rot = managers.editor.is_coordinate_system(slot5, managers.editor)
		local rot = Rotation()
		local rot_axis = rot[data.coor]("Local")
		slot9 = self._unit
		local u_rot = self._unit.rotation(rot)

		if local_rot then
			slot10 = u_rot
			rot_axis = u_rot[data.coor](slot9)
		end

		slot11 = value
		rot = Rotation(slot9, rot_axis)
		slot11 = rot

		managers.editor.set_selected_units_rotation(slot9, managers.editor)

		slot11 = 0

		data.ctrl.change_value(slot9, data.ctrl)

		slot12 = -1

		data.ctrl.set_selection(slot9, data.ctrl, -1)
	end

	return 
end
function RotateTransformTypeIn:set_unit(unit)
	self._unit = unit
	slot4 = self._panel
	slot7 = self._unit

	self._panel.set_enabled(slot3, alive(slot6))

	return 
end
function RotateTransformTypeIn:update(t, dt)
	slot5 = self._unit

	if alive(slot4) then
		local rot = self._unit.rotation(slot4)
		slot6 = self._ax

		if not self._ax.in_focus(self._unit) then
			slot6 = self._ax
			slot9 = "%.2f"
			slot12 = rot

			self._ax.change_value(slot5, string.format(slot8, rot.yaw(slot11)))
		end

		slot6 = self._ay

		if not self._ay.in_focus(slot5) then
			slot6 = self._ay
			slot9 = "%.2f"
			slot12 = rot

			self._ay.change_value(slot5, string.format(slot8, rot.pitch(slot11)))
		end

		slot6 = self._az

		if not self._az.in_focus(slot5) then
			slot6 = self._az
			slot9 = "%.2f"
			slot12 = rot

			self._az.change_value(slot5, string.format(slot8, rot.roll(slot11)))
		end
	end

	return 
end

if not CameraTransformTypeIn then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

CameraTransformTypeIn = slot0
function CameraTransformTypeIn:init()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Camera transform type-in", "", Vector3(slot8, 761, 180), Vector3(761, 291, 210))

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	self._min = -100000000
	self._max = 100000000
	slot4 = "HORIZONTAL"
	local pos_rot_sizer = EWS.BoxSizer(slot2, EWS)
	slot7 = "Absolut:World:Pos"
	local world_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot10 = world_sizer
	self._ax = self._create_ctrl(EWS, self, "X:", "x", 0, "absolut")
	slot10 = world_sizer
	self._ay = self._create_ctrl(EWS, self, "Y:", "y", 0, "absolut")
	slot10 = world_sizer
	self._az = self._create_ctrl(EWS, self, "Z:", "z", 0, "absolut")
	slot9 = "EXPAND"

	pos_rot_sizer.add(EWS, pos_rot_sizer, world_sizer, 1, 0)

	slot8 = "Absolut:World:Rot"
	local offset_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot11 = offset_sizer
	self._ox = self._create_ctrl(EWS, self, "X:", "x", 0, "offset")
	slot11 = offset_sizer
	self._oy = self._create_ctrl(EWS, self, "Y:", "y", 0, "offset")
	slot11 = offset_sizer
	self._oz = self._create_ctrl(EWS, self, "Z:", "z", 0, "offset")
	slot10 = "EXPAND"

	pos_rot_sizer.add(EWS, pos_rot_sizer, offset_sizer, 1, 0)

	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, pos_rot_sizer, 5, 0)

	slot8 = "HORIZONTAL"
	local settings_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel)
	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, settings_sizer, 2, 0)

	slot8 = settings_sizer
	self._fov = self._create_fov_ctrl(EWS, self)
	slot8 = settings_sizer
	self._far_range = self._create_far_range_ctrl(EWS, self)
	slot11 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot8 = true

	self._panel.set_enabled(EWS, self._panel)

	return 
end
function CameraTransformTypeIn:_create_fov_ctrl(sizer)
	slot5 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot3, EWS)
	slot12 = "ALIGN_LEFT"
	slot9 = "ALIGN_CENTER_VERTICAL"

	ctrl_sizer.add(EWS, ctrl_sizer, EWS.StaticText(slot7, EWS, self._panel, "Fov:", ""), 0, 0)

	local ctrl = EWS.TextCtrl(EWS, EWS, self._panel, 0, "")
	slot12 = "verify_number"

	ctrl.connect(EWS, ctrl, "EVT_CHAR", callback("TE_PROCESS_ENTER", nil, _G))

	slot7 = "Type in fov"

	ctrl.set_tool_tip(EWS, ctrl)

	slot12 = "update_fov"

	ctrl.connect(EWS, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(ctrl, self, self))

	slot12 = "update_fov"
	slot9 = nil

	ctrl.connect(EWS, ctrl, "EVT_KILL_FOCUS", callback(nil, self, self))

	slot10 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, ctrl, 1, 0)

	slot10 = "EXPAND,LEFT,RIGHT"

	sizer.add(EWS, sizer, ctrl_sizer, 1, 10)

	return ctrl
end
function CameraTransformTypeIn:_create_far_range_ctrl(sizer)
	slot5 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot3, EWS)
	slot12 = "ALIGN_LEFT"
	slot9 = "ALIGN_CENTER_VERTICAL"

	ctrl_sizer.add(EWS, ctrl_sizer, EWS.StaticText(slot7, EWS, self._panel, "Far Range:", ""), 0, 0)

	local ctrl = EWS.TextCtrl(EWS, EWS, self._panel, 0, "")
	slot12 = "verify_number"

	ctrl.connect(EWS, ctrl, "EVT_CHAR", callback("TE_PROCESS_ENTER", nil, _G))

	slot7 = "Type in far range in meters"

	ctrl.set_tool_tip(EWS, ctrl)

	slot12 = "update_far_range"

	ctrl.connect(EWS, ctrl, "EVT_COMMAND_TEXT_ENTER", callback(ctrl, self, self))

	slot12 = "update_far_range"
	slot9 = nil

	ctrl.connect(EWS, ctrl, "EVT_KILL_FOCUS", callback(nil, self, self))

	slot10 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, ctrl, 1, 0)

	slot10 = "EXPAND,LEFT,RIGHT"

	sizer.add(EWS, sizer, ctrl_sizer, 2, 10)

	return ctrl
end
function CameraTransformTypeIn:_create_ctrl(name, coor, value, type, sizer)
	slot9 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = "ALIGN_LEFT"
	slot13 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, EWS.StaticText(slot11, EWS, self._panel, name, ""), 0, 0)

	slot13 = "TE_PROCESS_ENTER"
	local ctrl = EWS.TextCtrl(EWS, EWS, self._panel, value, "")
	slot13 = "SP_VERTICAL"
	local spin = EWS.SpinButton(EWS, EWS, self._panel, "")
	slot17 = "verify_number"
	slot14 = ctrl

	ctrl.connect(EWS, ctrl, "EVT_CHAR", callback(name, nil, _G))

	if type == "offset" then
		slot12 = "Type in absolut " .. coor .. "-rotation in degrees"

		ctrl.set_tool_tip(slot10, ctrl)

		slot17 = "update_rotation"

		ctrl.connect(slot10, ctrl, "EVT_COMMAND_TEXT_ENTER", callback("-rotation in degrees", self, self))

		slot17 = "update_rotation"

		ctrl.connect(slot10, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))

		slot17 = "update_rotation_spin"

		spin.connect(slot10, spin, "EVT_SCROLL_LINEUP", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))

		slot17 = "update_rotation_spin"
		slot14 = {
			step = -1,
			ctrl = ctrl,
			coor = coor
		}

		spin.connect(slot10, spin, "EVT_SCROLL_LINEDOWN", callback({
			step = 1,
			ctrl = ctrl,
			coor = coor
		}, self, self))
	else
		slot12 = "Type in absolut " .. coor .. "-coordinates in cm"

		ctrl.set_tool_tip(slot10, ctrl)

		slot17 = "update_position"

		ctrl.connect(slot10, ctrl, "EVT_COMMAND_TEXT_ENTER", callback("-coordinates in cm", self, self))

		slot17 = "update_position"

		ctrl.connect(slot10, ctrl, "EVT_KILL_FOCUS", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))

		slot17 = "update_position_spin"

		spin.connect(slot10, spin, "EVT_SCROLL_LINEUP", callback({
			ctrl = ctrl,
			coor = coor
		}, self, self))

		slot17 = "update_position_spin"
		slot14 = {
			step = -10,
			ctrl = ctrl,
			coor = coor
		}

		spin.connect(slot10, spin, "EVT_SCROLL_LINEDOWN", callback({
			step = 10,
			ctrl = ctrl,
			coor = coor
		}, self, self))
	end

	slot15 = "EXPAND"

	ctrl_sizer.add(slot10, ctrl_sizer, ctrl, 1, 0)

	slot15 = "EXPAND"

	ctrl_sizer.add(slot10, ctrl_sizer, spin, 0, 0)

	slot15 = "EXPAND,LEFT,RIGHT"

	sizer.add(slot10, sizer, ctrl_sizer, 1, 10)

	return ctrl
end
function CameraTransformTypeIn:update_position_spin(data)
	slot6 = data.ctrl

	if not tonumber(data.ctrl.get_value(slot5)) then
		slot5 = 0

		data.ctrl.set_value(slot3, data.ctrl)
	end

	slot4 = data.ctrl
	slot10 = data.ctrl
	slot8 = data.ctrl.get_value(slot9) + data.step

	data.ctrl.set_value(slot3, string.format(slot6, "%.0f"))

	slot5 = data

	self.update_position(slot3, self)

	return 
end
function CameraTransformTypeIn:update_rotation_spin(data)
	slot6 = data.ctrl

	if not tonumber(data.ctrl.get_value(slot5)) then
		slot5 = 0

		data.ctrl.set_value(slot3, data.ctrl)
	end

	slot4 = data.ctrl
	slot10 = data.ctrl
	slot8 = data.ctrl.get_value(slot9) + data.step

	data.ctrl.set_value(slot3, string.format(slot6, "%.0f"))

	slot5 = data

	self.update_rotation(slot3, self)

	return 
end
function CameraTransformTypeIn:update_position(data)
	slot6 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot5)) or 0

	if self._min == value then
		return 
	end

	slot5 = managers.editor
	local pos = managers.editor.camera_position(slot4)
	slot7 = value
	pos = pos["with_" .. data.coor](data.coor, pos)
	slot6 = data.ctrl
	slot10 = value

	data.ctrl.set_value(data.coor, string.format(slot8, "%.0f"))

	slot8 = -1

	data.ctrl.set_selection(data.coor, data.ctrl, -1)

	slot7 = pos
	slot10 = managers.editor

	managers.editor.set_camera(data.coor, managers.editor, managers.editor.camera_rotation("%.0f"))

	return 
end
function CameraTransformTypeIn:update_rotation(data)
	slot6 = data.ctrl
	local value = tonumber(data.ctrl.get_value(slot5)) or 0

	if self._min == value then
		return 
	end

	slot5 = managers.editor
	local rot = managers.editor.camera_rotation(slot4)

	if data.coor == "x" then
		slot7 = rot.pitch(slot8)
		slot10 = rot
		rot = Rotation(slot5, value, rot.roll(rot))
	elseif data.coor == "y" then
		slot8 = rot
		slot7 = value
		slot10 = rot
		rot = Rotation(slot5, rot.yaw(slot7), rot.roll(slot9))
	elseif data.coor == "z" then
		slot9 = rot
		slot8 = value
		rot = Rotation(slot5, rot.yaw(slot7), rot.pitch(rot))
	end

	slot6 = data.ctrl
	slot10 = value

	data.ctrl.set_value(slot5, string.format(slot8, "%.0f"))
	data.ctrl.set_selection(slot5, data.ctrl, -1)

	slot9 = managers.editor
	slot8 = rot

	managers.editor.set_camera(slot5, managers.editor, managers.editor.camera_position(-1))

	return 
end
function CameraTransformTypeIn:update_fov()
	slot5 = self._fov

	if not tonumber(self._fov.get_value(slot4)) then
		slot3 = managers.editor
		local value = managers.editor.camera_fov(slot2)
	end

	value = math.clamp(slot3, value, 1)
	slot4 = self._fov
	slot8 = value

	self._fov.set_value(slot3, string.format(170, "%.0f"))

	slot6 = -1

	self._fov.set_selection(slot3, self._fov, -1)

	slot5 = value

	managers.editor.set_default_camera_fov(slot3, managers.editor)

	return 
end
function CameraTransformTypeIn:update_far_range()
	slot5 = self._far_range

	if not tonumber(self._far_range.get_value(slot4)) then
		slot3 = managers.editor
		local value = managers.editor.camera_far_range(slot2) / 100
	end

	if value < 1 then
		value = 1
	end

	value = value * 100
	slot4 = self._far_range
	slot8 = value / 100

	self._far_range.set_value(slot3, string.format(slot6, "%.2f"))

	slot6 = -1

	self._far_range.set_selection(slot3, self._far_range, -1)

	slot5 = value

	managers.editor.set_camera_far_range(slot3, managers.editor)

	return 
end
function CameraTransformTypeIn:update(t, dt)
	local pos = managers.editor.camera_position(slot4)
	slot6 = self._ax

	if not self._ax.in_focus(managers.editor) then
		slot6 = self._ax
		slot10 = pos.x

		self._ax.set_value(slot5, string.format(slot8, "%.0f"))
	end

	slot6 = self._ay

	if not self._ay.in_focus(slot5) then
		slot6 = self._ay
		slot10 = pos.y

		self._ay.set_value(slot5, string.format(slot8, "%.0f"))
	end

	slot6 = self._az

	if not self._az.in_focus(slot5) then
		slot6 = self._az
		slot10 = pos.z

		self._az.set_value(slot5, string.format(slot8, "%.0f"))
	end

	local rot = managers.editor.camera_rotation(slot5)
	slot7 = self._ox

	if not self._ox.in_focus(managers.editor) then
		slot7 = self._ox
		slot10 = "%.0f"
		slot13 = rot

		self._ox.set_value(slot6, string.format(slot9, rot.yaw(slot12)))
	end

	slot7 = self._oy

	if not self._oy.in_focus(slot6) then
		slot7 = self._oy
		slot10 = "%.0f"
		slot13 = rot

		self._oy.set_value(slot6, string.format(slot9, rot.pitch(slot12)))
	end

	slot7 = self._oz

	if not self._oz.in_focus(slot6) then
		slot7 = self._oz
		slot10 = "%.0f"
		slot13 = rot

		self._oz.set_value(slot6, string.format(slot9, rot.roll(slot12)))
	end

	slot7 = self._fov

	if not self._fov.in_focus(slot6) then
		slot7 = self._fov
		slot10 = "%.0f"
		slot13 = managers.editor

		self._fov.change_value(slot6, string.format(slot9, managers.editor.camera_fov(slot12)))
	end

	slot7 = self._far_range

	if not self._far_range.in_focus(slot6) then
		slot7 = self._far_range
		slot13 = managers.editor
		slot11 = managers.editor.camera_far_range(slot12) / 100

		self._far_range.change_value(slot6, string.format(slot9, "%.2f"))
	end

	return 
end

if not EditControllerBindings then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

EditControllerBindings = slot0
function EditControllerBindings:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Controller bindings", "", Vector3(slot8, 300, 150), Vector3(300, 350, 500), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	slot6 = "LC_REPORT,LC_NO_HEADER"
	self._list = EWS.ListCtrl(slot2, EWS, self._panel, "")
	slot3 = self._list

	self._list.clear_all(slot2)

	slot4 = "Name"

	self._list.append_column(slot2, self._list)

	slot4 = "Key"

	self._list.append_column(slot2, self._list)

	slot7 = "EXPAND"

	self._panel_sizer.add(slot2, self._panel_sizer, self._list, 1, 0)

	slot4 = "Base:"

	self._list.append_item(slot2, self._list)

	slot4 = ""

	self._list.append_item(slot2, self._list)

	slot3 = self
	slot6 = managers.editor

	self.add_list(slot2, managers.editor.ctrl_bindings(1))

	slot4 = ""

	self._list.append_item(slot2, self._list)

	slot4 = "Layer:"

	self._list.append_item(slot2, self._list)

	slot4 = ""

	self._list.append_item(slot2, self._list)

	slot3 = self
	slot6 = managers.editor

	self.add_list(slot2, managers.editor.ctrl_layer_bindings(1))

	slot4 = ""

	self._list.append_item(slot2, self._list)

	slot4 = "Menu:"

	self._list.append_item(slot2, self._list)

	slot4 = ""

	self._list.append_item(slot2, self._list)

	slot6 = managers.editor

	self.add_list(slot2, managers.editor.ctrl_menu_bindings(1))

	slot4 = self._list

	for i = 0, self._list.column_count(self) - 1, 1 do
		slot8 = i

		self._list.autosize_column(slot6, self._list)
	end

	slot9 = "key_cancel"
	slot6 = ""

	self._list.connect(slot2, self._list, "EVT_KEY_DOWN", callback(slot6, self, self))

	slot4 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot2, EWS)
	slot8 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Cancel", "")
	slot9 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot11 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot11 = "key_cancel"
	slot8 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot9 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot9 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot6 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function EditControllerBindings:add_list(list)
	local names = {}
	slot5 = list

	for name, _ in pairs(slot4) do
		slot11 = name

		table.insert(slot9, names)
	end

	slot5 = names

	table.sort(slot4)

	slot5 = names

	for _, name in ipairs(slot4) do
		slot11 = name
		local i = self._list.append_item(slot9, self._list)
		slot14 = list[name]

		self._list.set_item(self._list, self._list, i, 1)
	end

	return 
end

if not MissionGraph then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

MissionGraph = slot0
function MissionGraph:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,,MINIMIZE_BOX,MAXIMIZE_BOX,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Mission Graph", "", Vector3(slot8, 100, 100), Vector3(100, 800, 600), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	slot3 = EWS
	self._graph = EWS.Graph(slot2)
	slot6 = self._graph
	self._graph_view = EWS.GraphView(slot2, EWS, self._panel, "")
	self._nodes = {}
	slot5 = managers.editor._layers.Mission

	for _, unit in ipairs(managers.editor._layers.Mission.created_units(self._panel)) do
		slot13 = unit
		slot11 = unit.position(unit).y / 4 * -1
		local node = EWS.Node(slot7, EWS, unit.unit_data(slot10).name_id, unit.position(unit).x / 4)
		slot10 = unit
		self._nodes[unit.unit_data(unit.unit_data(slot10).name_id).unit_id] = node
		slot10 = node

		self._graph.add_node(unit.unit_data(unit.unit_data(slot10).name_id).unit_id, self._graph)
	end

	slot5 = managers.editor._layers.Mission

	for _, unit in ipairs(managers.editor._layers.Mission.created_units(slot4)) do
		slot9 = unit
		local node = self._nodes[unit.unit_data(slot8).unit_id]
		slot11 = unit
		slot9 = unit.mission_element_data(slot10).on_executed

		for _, data in ipairs(slot8) do
			local e_node = self._nodes[data.id]
			slot18 = 0

			e_node.set_colour(slot14, e_node, 0, 1)

			slot18 = node
			slot18 = "on_executed"

			node.set_target(slot14, node, node.free_slot(1), e_node)
		end
	end

	slot4 = true

	self._graph_view.pan_to_selected(slot2, self._graph_view)

	slot3 = self._graph_view

	self._graph_view.refresh(slot2)

	slot7 = "EXPAND"

	self._panel_sizer.add(slot2, self._panel_sizer, self._graph_view, 1, 0)

	slot3 = self._graph

	self._graph.notify_views(slot2)

	slot7 = "EXPAND"

	self._dialog_sizer.add(slot2, self._dialog_sizer, self._panel, 1, 0)

	slot4 = true

	self._dialog.set_visible(slot2, self._dialog)

	return 
end
function MissionGraph:update(t, dt)
	slot6 = dt

	self._graph_view.update_graph(slot4, self._graph_view)

	slot5 = self._graph

	self._graph.notify_views(slot4)

	return 
end

if not WorldEditorNews then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

WorldEditorNews = slot0
function WorldEditorNews:init()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "World editor news", "", Vector3(slot8, 270, 130), Vector3(270, 560, 620))

	self._captions = {}
	slot4 = "Great stuff man!"

	table.insert(slot2, self._captions)

	slot4 = "Keep them coming"

	table.insert(slot2, self._captions)

	slot4 = "I agree"

	table.insert(slot2, self._captions)

	slot4 = "Acknowledged!"

	table.insert(slot2, self._captions)

	slot4 = "Sweet!"

	table.insert(slot2, self._captions)

	slot4 = "I understand what I have read"

	table.insert(slot2, self._captions)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	slot7 = "TE_MULTILINE,TE_NOHIDESEL,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	self._text = EWS.TextCtrl(slot2, EWS, self._panel, "", "")
	slot6 = managers.database
	slot5 = "r"
	local file = SystemFS.open(slot2, SystemFS, managers.database.base_path("") .. "core\\lib\\utils\\dev\\editor\\WorldEditorNews.txt")
	slot5 = "*a"
	local news = file.read(SystemFS, file)
	slot6 = news

	self._text.set_value(file, self._text)

	slot9 = "EXPAND"

	self._panel_sizer.add(file, self._panel_sizer, self._text, 1, 0)

	slot11 = "key_cancel"
	slot8 = ""

	self._text.connect(file, self._text, "EVT_KEY_DOWN", callback(0, self, self))

	slot6 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(file, EWS)
	slot11 = #self._captions
	slot10 = ""
	self._cancel_btn = EWS.Button(EWS, EWS, self._panel, self._captions[math.random(self)], "")
	slot10 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, self._cancel_btn, 0, 2)

	slot12 = "on_cancel"

	self._cancel_btn.connect(EWS, self._cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	self._cancel_btn.connect(EWS, self._cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot10 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot10 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot7 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function WorldEditorNews:set_visible(visible)
	if visible then
		slot8 = #self._captions
		slot5 = self._captions[math.random(slot7)]

		self._cancel_btn.set_caption(slot3, self._cancel_btn)

		slot4 = self._panel

		self._panel.layout(slot3)
	end

	slot5 = visible

	CoreEditorEwsDialog.set_visible(slot3, self)

	return 
end
function WorldEditorNews:version()
	slot3 = self._text

	return self._text.get_last_position(slot2)
end

if not UnitDuality then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

UnitDuality = slot0
function UnitDuality:init(collisions, pos)
	if not pos then
		slot7 = 0
		pos = Vector3(slot4, 120, 130)
	end

	slot14 = 0
	slot11 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot4, self, nil, "Unit Duality", "", pos, Vector3(slot11, 760, 620))

	slot8 = "VSCROLL,TAB_TRAVERSAL"
	self._panel = EWS.ScrolledWindow(slot4, EWS, self._dialog, "")
	slot5 = self._panel
	slot10 = 0

	self._panel.set_scroll_rate(slot4, Vector3("", 0, 20))

	slot10 = 0
	slot6 = Vector3("", 0, 0)
	slot11 = -1

	self._panel.set_virtual_size_hints(slot4, self._panel, Vector3(0, 1, -1))

	slot6 = "VERTICAL"
	self._panel_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._panel_sizer

	self._panel.set_sizer(slot4, self._panel)

	local y_size = 0
	slot9 = "Collisions with both position and rotation"
	local complete_sizer = EWS.StaticBoxSizer(self._panel, EWS, self._panel, "VERTICAL")

	if 0 < #collisions.complete then
		slot7 = collisions.complete

		for _, collision in ipairs(slot6) do
			slot16 = collision
			slot16 = "EXPAND"

			complete_sizer.add(slot11, complete_sizer, self.build_collision(slot14, self), 0, 0)
		end
	else
		slot14 = ""
		slot11 = "ALIGN_CENTER_HORIZONTAL,TOP,BOTTOM"

		complete_sizer.add(slot6, complete_sizer, EWS.StaticText(slot9, EWS, self._panel, "No collisions found. Great!", 0), 0, 5)

		y_size = y_size + 25
	end

	slot11 = "EXPAND"

	self._panel_sizer.add(slot6, self._panel_sizer, complete_sizer, 0, 0)

	slot10 = "Collisions with only position"
	local position_sizer = EWS.StaticBoxSizer(slot6, EWS, self._panel, "VERTICAL")

	if 0 < #collisions.only_positions then
		slot8 = collisions.only_positions

		for _, collision in ipairs(slot7) do
			slot17 = collision
			slot17 = "EXPAND"

			position_sizer.add(slot12, position_sizer, self.build_collision(slot15, self), 0, 0)
		end
	else
		slot15 = ""
		slot12 = "ALIGN_CENTER_HORIZONTAL,TOP,BOTTOM"

		position_sizer.add(slot7, position_sizer, EWS.StaticText(slot10, EWS, self._panel, "No collisions found. Great!", 0), 0, 5)

		y_size = y_size + 25
	end

	slot12 = "EXPAND"

	self._panel_sizer.add(slot7, self._panel_sizer, position_sizer, 0, 0)

	slot9 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot7, EWS)
	slot13 = ""
	self._check_btn = EWS.Button(EWS, EWS, self._panel, "Check Again", "")
	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, self._check_btn, 0, 2)

	slot15 = "on_check_again"

	self._check_btn.connect(EWS, self._check_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	self._check_btn.connect(EWS, self._check_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = ""
	self._cancel_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, self._cancel_btn, 0, 2)

	slot15 = "on_cancel"

	self._cancel_btn.connect(EWS, self._cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	self._cancel_btn.connect(EWS, self._cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot13 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot11 = y_size

	self.calc_size(EWS, self, collisions)

	slot10 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function UnitDuality:calc_size(collisions, y_size)
	slot5 = self._dialog
	local size = self._dialog.get_size(slot4)
	local y = (#collisions.complete + #collisions.only_positions) * 25 + 50 + 40 + y_size
	slot7 = self._dialog
	slot12 = 0

	self._dialog.set_size(slot6, Vector3(slot9, size.x, y))

	return 
end
function UnitDuality:build_collision(collision)
	local u1 = collision.u1
	local u2 = collision.u2
	local pos = collision.pos
	slot10 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot6, EWS, self._panel, "")
	slot9 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = sizer

	panel.set_sizer(EWS, panel)

	slot13 = u1
	local text1 = EWS.TextCtrl(EWS, EWS, panel, u1.unit_data(slot12).name_id, "")
	slot16 = "key_cancel"
	slot13 = ""

	text1.connect(EWS, text1, "EVT_KEY_DOWN", callback("ALIGN_CENTER_HORIZONTAL,TE_READONLY", self, self))

	local del1 = EWS.Button(EWS, EWS, panel, "Del", "")
	slot17 = "delete_unit"

	del1.connect(EWS, del1, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot17 = "key_cancel"

	del1.connect(EWS, del1, "EVT_KEY_DOWN", callback({
		unit = u1,
		panel = panel,
		text = text1
	}, self, self))

	slot15 = u2
	local text2 = EWS.TextCtrl(EWS, EWS, panel, u2.unit_data("").name_id, "")
	slot18 = "key_cancel"
	slot15 = ""

	text2.connect(EWS, text2, "EVT_KEY_DOWN", callback("ALIGN_CENTER_HORIZONTAL,TE_READONLY", self, self))

	local del2 = EWS.Button(EWS, EWS, panel, "Del", "")
	slot19 = "delete_unit"

	del2.connect(EWS, del2, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot19 = "key_cancel"

	del2.connect(EWS, del2, "EVT_KEY_DOWN", callback({
		unit = u2,
		panel = panel,
		text = text2
	}, self, self))

	slot17 = pos
	local text_pos = EWS.TextCtrl(EWS, EWS, panel, tostring(""), "")
	slot20 = "key_cancel"
	slot17 = ""

	text_pos.connect(EWS, text_pos, "EVT_KEY_DOWN", callback("ALIGN_CENTER_HORIZONTAL,TE_READONLY", self, self))

	local goto = EWS.Button(EWS, EWS, panel, "Goto", "")
	slot21 = "goto"

	goto.connect(EWS, goto, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot21 = "key_cancel"
	slot18 = ""

	goto.connect(EWS, goto, "EVT_KEY_DOWN", callback(collision, self, self))

	slot19 = "EXPAND"

	sizer.add(EWS, sizer, text1, 5, 0)

	slot19 = "EXPAND,RIGHT"

	sizer.add(EWS, sizer, del1, 1, 5)

	slot19 = "EXPAND"

	sizer.add(EWS, sizer, text2, 5, 0)

	slot19 = "EXPAND,RIGHT"

	sizer.add(EWS, sizer, del2, 1, 5)

	slot19 = "EXPAND"

	sizer.add(EWS, sizer, text_pos, 5, 0)

	slot19 = "EXPAND"

	sizer.add(EWS, sizer, goto, 1, 0)

	return panel
end
function UnitDuality:goto(collision)
	local u1 = collision.u1
	local u2 = collision.u2
	local pos = collision.pos
	slot7 = u1

	if not alive(slot6) then
		return 
	end

	slot8 = u1

	managers.editor.center_view_on_unit(slot6, managers.editor)

	return 
end
function UnitDuality:delete_unit(data)
	slot4 = data.unit

	if alive(slot3) then
		slot5 = data.unit

		managers.editor.delete_unit(slot3, managers.editor)
	end

	slot5 = "DELETED"

	data.text.set_value(slot3, data.text)

	slot5 = false

	data.panel.set_enabled(slot3, data.panel)

	return 
end
function UnitDuality:on_check_again()
	slot3 = managers.editor

	managers.editor.on_check_duality(slot2)

	return 
end

if not BrushLayerDebug then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

BrushLayerDebug = slot0
function BrushLayerDebug:init(...)
	slot11 = 0
	slot12 = 0

	CoreEditorEwsDialog.init(slot2, self, nil, "Brush layer debug", "", Vector3(slot8, 300, 150), Vector3(300, 600, 400), ...)

	slot4 = "VERTICAL"

	self.create_panel(slot2, self)

	self._column_states = {}
	slot4 = {
		value = "name",
		state = "ascending"
	}

	table.insert(slot2, self._column_states)

	slot4 = {
		value = "amount",
		state = "random"
	}

	table.insert(slot2, self._column_states)

	slot4 = "VERTICAL"
	local toolbar_sizer = EWS.BoxSizer(slot2, EWS)
	slot8 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, toolbar_sizer, 0, 0)

	slot7 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, self._panel, "")
	slot10 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "DELETE", "Delete", CoreEws.image_path("DEFAULT_DIALOG_STYLE,RESIZE_BORDER"))

	slot12 = "_on_gui_delete"

	toolbar.connect(EWS, toolbar, "DELETE", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = "help_16x16.png"

	toolbar.add_tool(EWS, toolbar, "HELP", "Help", CoreEws.image_path(nil))

	slot12 = "_on_gui_help"
	slot9 = nil

	toolbar.connect(EWS, toolbar, "HELP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = toolbar

	toolbar.realize(EWS)

	slot9 = "EXPAND,LEFT"

	toolbar_sizer.add(EWS, toolbar_sizer, toolbar, 0, 0)

	slot6 = "VERTICAL"
	local selected_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, selected_sizer, 1, 0)

	slot9 = "LC_REPORT,LC_SORT_ASCENDING,NO_BORDER"
	self._unit_list = EWS.ListCtrl(EWS, EWS, self._panel, "")
	slot6 = self._unit_list

	self._unit_list.clear_all(EWS)

	slot7 = "Name"

	self._unit_list.append_column(EWS, self._unit_list)

	slot7 = "Amount"

	self._unit_list.append_column(EWS, self._unit_list)

	slot10 = "EXPAND"

	selected_sizer.add(EWS, selected_sizer, self._unit_list, 1, 0)

	slot12 = "_right_clicked"

	self._unit_list.connect(EWS, self._unit_list, "EVT_COMMAND_LIST_ITEM_RIGHT_CLICK", callback(0, self, self))

	slot12 = "_on_select_unit"

	self._unit_list.connect(EWS, self._unit_list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(self._unit_list, self, self))

	slot12 = "column_click_list"

	self._unit_list.connect(EWS, self._unit_list, "EVT_COMMAND_LIST_COL_CLICK", callback(nil, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	self._unit_list.connect(EWS, self._unit_list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot7 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = ""
	local close_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot12 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, close_btn, 0, 2)

	slot14 = "on_cancel"

	close_btn.connect(EWS, close_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot14 = "key_cancel"
	slot11 = ""

	close_btn.connect(EWS, close_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot12 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot12 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot9 = true

	self._dialog.set_visible(EWS, self._dialog)

	slot8 = self

	self.fill_unit_list(EWS)

	return 
end
function BrushLayerDebug:_toolbar_toggle(params, event)
	slot6 = params.toolbar
	slot9 = event
	self[params.value] = params.toolbar.tool_state(slot5, event.get_id(slot8))

	return 
end
function BrushLayerDebug:_on_gui_delete()
	local current_data = self._current_data(slot2)
	slot6 = current_data

	print(inspect(slot5))

	slot4 = current_data and current_data.name

	print(self)

	if current_data then
		slot5 = "Brush"
		slot5 = current_data.name

		managers.editor.layer(slot3, managers.editor).clear_units_by_name(slot3, managers.editor.layer(slot3, managers.editor))
	end

	return 
end
function BrushLayerDebug:_on_gui_help()
	local text = "Since brush units are not always visible, this dialog shows actual amount of units in the level."
	text = text .. "\n\nSorting can be done by clicking the column namnes."
	text = text .. "\n\nDelete all units with a certain name by clicking the delete icon on toolbar."
	slot8 = "OK"

	EWS.message_box("\n\nDelete all units with a certain name by clicking the delete icon on toolbar.", EWS, self._panel, text, "Help", Vector3())

	return 
end
function BrushLayerDebug:fill_unit_list()
	slot3 = self

	self.freeze(slot2)

	slot3 = self._unit_list

	self._unit_list.delete_all_items(slot2)

	slot4 = "Brush"
	local brush_stats = managers.editor.layer(slot2, managers.editor).get_brush_stats(slot2)
	slot4 = brush_stats

	for _, stats in ipairs(managers.editor.layer(slot2, managers.editor)) do
		slot12 = stats.unit_name
		local i = self._unit_list.append_item(slot8, stats.unit_name.s(slot11))
		slot13 = "" .. stats.amount

		self._unit_list.set_item(self._unit_list, self._unit_list, i, 1)

		slot12 = {
			name = stats.unit_name.s(stats.amount),
			amount = stats.amount
		}
		slot15 = stats.unit_name

		self._unit_list.set_item_data(self._unit_list, self._unit_list, i)
	end

	slot5 = self._unit_list

	self._autosize_columns(slot3, self)

	slot4 = self

	self.thaw(slot3)

	return 
end
function BrushLayerDebug:_autosize_columns(list)
	slot5 = list

	for i = 0, list.column_count(slot4) - 1, 1 do
		slot9 = i

		list.autosize_column(slot7, list)
	end

	return 
end
function BrushLayerDebug:key_cancel(ctrlr, event)
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
function BrushLayerDebug:_on_select_unit()
	slot3 = self
	local current_data = self._current_data(slot2)

	if current_data and current_data.unit and self._use_look_at then
		slot5 = current_data.unit

		managers.editor.look_towards_unit(slot3, managers.editor)
	end

	return 
end
function BrushLayerDebug:column_click_list(...)
	self._list = self._unit_list
	slot3 = self

	UnitList.column_click_list(slot2, ...)

	return 
end
function BrushLayerDebug:_right_clicked(list)
	slot5 = list
	local item_data = self._selected_list_data(slot3, self)

	return 
end
function BrushLayerDebug:_current_data()
	slot3 = self._unit_list
	local index = self._unit_list.selected_item(slot2)

	if index == -1 then
		return 
	end

	slot5 = index

	return self._unit_list.get_item_data_ref(slot3, self._unit_list)
end
function BrushLayerDebug:_selected_list_data(list)
	slot4 = list
	local index = list.selected_item(slot3)

	if index == -1 then
		return 
	end

	slot6 = index

	return list.get_item_data_ref(slot4, list)
end
function BrushLayerDebug:reset()
	return 
end
function BrushLayerDebug:freeze()
	slot3 = self._unit_list

	self._unit_list.freeze(slot2)

	return 
end
function BrushLayerDebug:thaw()
	slot3 = self._unit_list

	self._unit_list.thaw(slot2)

	return 
end

return 
