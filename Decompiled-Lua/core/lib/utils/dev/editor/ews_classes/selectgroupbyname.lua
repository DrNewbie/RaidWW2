if not SelectGroupByName then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

SelectGroupByName = slot0
function SelectGroupByName:init(...)
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot2, self, nil, "Select group by name", "", Vector3(slot8, 300, 150), Vector3(300, 350, 500), ...)

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

	slot9 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot11 = "on_mark_group"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot11 = "on_select_group"

	self._list.connect(EWS, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot11 = "key_delete"

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot11 = "key_cancel"
	slot8 = ""

	self._list.connect(EWS, self._list, "EVT_KEY_DOWN", callback("", self, self))

	slot6 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "BU_BOTTOM"
	local select_btn = EWS.Button(EWS, EWS, self._panel, "Select", "")
	slot11 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, select_btn, 0, 2)

	slot13 = "on_select_group"

	select_btn.connect(EWS, select_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	select_btn.connect(EWS, select_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot11 = "BU_BOTTOM"
	local find_btn = EWS.Button(EWS, EWS, self._panel, "Ungroup", "")
	slot12 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, find_btn, 0, 2)

	slot14 = "on_ungroup"

	find_btn.connect(EWS, find_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot14 = "key_cancel"
	slot11 = ""

	find_btn.connect(EWS, find_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot12 = "BU_BOTTOM"
	local delete_btn = EWS.Button(EWS, EWS, self._panel, "Delete", "")
	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, delete_btn, 0, 2)

	slot15 = "on_delete"

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	delete_btn.connect(EWS, delete_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Cancel", "")
	slot14 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot16 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot16 = "key_cancel"
	slot13 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot14 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot14 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot10 = self

	self.fill_group_list(EWS)

	slot11 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function SelectGroupByName:key_delete(ctrlr, event)
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
function SelectGroupByName:key_cancel(ctrlr, event)
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
function SelectGroupByName:on_delete()
	slot3 = managers.editor

	managers.editor.freeze_gui_lists(slot2)

	local groups = self._selected_item_groups(slot2)
	slot4 = groups

	for _, group in ipairs(self) do
		slot13 = group

		for _, unit in ipairs(clone(group.units(slot12))) do
			slot15 = unit

			managers.editor.delete_unit(slot13, managers.editor)
		end
	end

	slot4 = managers.editor

	managers.editor.thaw_gui_lists(slot3)

	return 
end
function SelectGroupByName:on_mark_group()
	return 
end
function SelectGroupByName:on_ungroup()
	local groups = self._selected_item_groups(slot2)
	slot4 = groups

	for _, group in ipairs(self) do
		slot9 = managers.editor
		slot12 = group

		managers.editor.remove_group(slot8, group.name(slot11))
	end

	return 
end
function SelectGroupByName:on_select_group()
	slot3 = self
	local group = self._selected_item_group(slot2)

	if not group then
		return 
	end

	local ref = group.reference(slot3)
	slot6 = ref

	managers.editor.change_layer_based_on_unit(group, managers.editor)

	slot5 = managers.editor

	managers.editor.freeze_gui_lists(group)

	slot6 = group

	managers.editor.select_group(group, managers.editor)

	slot5 = managers.editor

	managers.editor.thaw_gui_lists(group)

	return 
end
function SelectGroupByName:_selected_item_groups()
	local groups = {}
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = i
		local group = self._groups[self._list.get_item_data(slot9, self._list)]
		slot11 = group

		table.insert(slot9, groups)
	end

	return groups
end
function SelectGroupByName:_selected_item_group()
	slot3 = self._list
	local index = self._list.selected_item(slot2)

	if index ~= -1 then
		slot6 = index

		return self._groups[self._list.get_item_data(slot4, self._list)]
	end

	return 
end
function SelectGroupByName:group_removed(group)
	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = i

		if self._groups[self._list.get_item_data(slot8, self._list)] == group then
			slot9 = i

			self._list.delete_item(slot7, self._list)

			return 
		end
	end

	return 
end
function SelectGroupByName:group_created(group)
	slot4 = self._list
	slot7 = group
	local i = self._list.append_item(slot3, group.name(slot6))
	local j = #self._groups + 1
	self._groups[j] = group
	slot8 = j

	self._list.set_item_data(group.name, self._list, i)

	return 
end
function SelectGroupByName:group_selected(group)
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = false

		self._list.set_item_selected(slot8, self._list, i)
	end

	slot5 = self._list

	for i = 0, self._list.item_count(slot4) - 1, 1 do
		slot10 = i

		if self._groups[self._list.get_item_data(slot8, self._list)] == group then
			slot10 = true

			self._list.set_item_selected(slot7, self._list, i)

			slot9 = i

			self._list.ensure_visible(slot7, self._list)

			return 
		end
	end

	return 
end
function SelectGroupByName:update_filter()
	slot3 = self

	self.fill_group_list(slot2)

	return 
end
function SelectGroupByName:fill_group_list()
	slot3 = self._list

	self._list.delete_all_items(slot2)

	slot3 = managers.editor
	slot3 = managers.editor.groups(slot2)
	local groups = managers.editor.groups(slot2).groups(slot2)
	local j = 1
	local filter = self._filter.get_value(slot4)
	self._groups = {}
	slot6 = self._list

	self._list.freeze(self._filter)

	slot6 = groups

	for name, group in pairs(self._filter) do
		slot14 = true

		if string.find(slot10, name, filter, 1) then
			slot12 = name
			local i = self._list.append_item(slot10, self._list)
			self._groups[j] = group
			slot14 = j

			self._list.set_item_data(self._list, self._list, i)

			j = j + 1
		end
	end

	slot6 = self._list

	self._list.thaw(slot5)

	slot7 = 0

	self._list.autosize_column(slot5, self._list)

	return 
end
function SelectGroupByName:reset()
	slot3 = self

	self.fill_group_list(slot2)

	return 
end
function SelectGroupByName:freeze()
	slot3 = self._list

	self._list.freeze(slot2)

	return 
end
function SelectGroupByName:thaw()
	slot3 = self._list

	self._list.thaw(slot2)

	return 
end

return 
