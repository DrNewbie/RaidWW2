-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreTableEditorPanel = CoreTableEditorPanel or class()
function CoreTableEditorPanel:init(parent)
	self.__column_names = {}
	slot5 = parent
	self.__panel = EWS.Panel(slot3, EWS)
	slot5 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = panel_sizer

	self.__panel.set_sizer(EWS, self.__panel)

	slot9 = self.__panel
	slot9 = "TOP,LEFT,RIGHT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._create_list_ctrl(slot7, self), 1, 5)

	slot9 = self.__panel
	slot9 = "ALL,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._create_buttons_panel(1, self), 0, 4)

	slot9 = self.__panel
	slot9 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._create_fields_panel(0, self), 0, 0)

	return 
end
function CoreTableEditorPanel:destroy()
	slot3 = self.__panel

	self.__panel.destroy(slot2)

	self.__panel = nil

	return 
end
function CoreTableEditorPanel:clear()
	slot3 = self

	self.freeze(slot2)

	slot3 = self.__list_ctrl

	self.__list_ctrl.delete_all_items(slot2)

	slot4 = nil

	self.set_selected_item(slot2, self)

	slot3 = self

	self.thaw(slot2)

	return 
end
function CoreTableEditorPanel:add_to_sizer(sizer, proportion, border, flags)
	slot11 = flags

	sizer.add(slot6, sizer, self.__panel, proportion, border)

	return 
end
function CoreTableEditorPanel:detach_from_sizer(sizer)
	slot5 = self.__panel

	sizer.detach(slot3, sizer)

	return 
end
function CoreTableEditorPanel:freeze()
	self.__frozen = true
	slot3 = self.__panel

	self.__panel.freeze(slot2)

	return 
end
function CoreTableEditorPanel:thaw()
	self.__frozen = nil
	slot3 = self.__panel

	self.__panel.thaw(slot2)

	if self.__needs_refresh then
		self.__needs_refresh = nil
		slot3 = self

		self._refresh_fields_panel(slot2)

		slot3 = self

		self._refresh_buttons_panel(slot2)
	end

	return 
end
function CoreTableEditorPanel:add_column(heading, format_style)
	slot6 = heading

	table.insert(slot4, self.__column_names)

	slot7 = format_style or "LIST_FORMAT_LEFT"

	self.__list_ctrl.append_column(slot4, self.__list_ctrl, heading)

	slot5 = self

	self._refresh_fields_panel(slot4)

	return 
end
function CoreTableEditorPanel:add_item(...)
	local values = {
		...
	}
	slot4 = self.__list_ctrl
	slot7 = values[1]
	local item_index = self.__list_ctrl.append_item(slot3, tostring(slot6))

	for i = 2, #values, 1 do
		slot11 = i - 1
		slot14 = values[i]

		self.__list_ctrl.set_item(slot8, self.__list_ctrl, item_index, tostring(slot13))
	end

	slot6 = item_index

	self.set_selected_item(slot4, self)

	return item_index
end
function CoreTableEditorPanel:remove_item(item_index)
	slot5 = item_index

	self.__list_ctrl.delete_item(slot3, self.__list_ctrl)

	slot5 = nil

	self.set_selected_item(slot3, self)

	return 
end
function CoreTableEditorPanel:item_value(item_index, column_name)
	slot9 = item_index
	slot13 = column_name

	return self._string_to_value(slot4, self, self.__list_ctrl.get_item(column_name, self.__list_ctrl, self._column_index(slot11, self)))
end
function CoreTableEditorPanel:set_item_value(item_index, column_name, value)
	slot11 = column_name
	slot8 = self._column_index(slot9, self)
	slot13 = column_name

	self.__list_ctrl.set_item(slot5, self.__list_ctrl, item_index, self._value_to_string(self, self, value))

	return 
end
function CoreTableEditorPanel:selected_item()
	slot3 = self.__list_ctrl
	local item_index = self.__list_ctrl.selected_item(slot2)

	return (0 <= item_index and item_index) or nil
end
function CoreTableEditorPanel:set_selected_item(item_index)
	slot6 = true

	self.__list_ctrl.set_item_selected(slot3, self.__list_ctrl, item_index or -1)

	slot4 = self

	self._refresh_fields_panel(slot3)

	slot4 = self

	self._refresh_buttons_panel(slot3)

	return 
end
function CoreTableEditorPanel:selected_item_value(column_name)
	slot4 = self
	local selected_item_index = self.selected_item(slot3)

	if selected_item_index then
		slot7 = column_name
		slot3 = self.item_value(slot4, self, selected_item_index)
	end

	return slot3
end
function CoreTableEditorPanel:set_selected_item_value(column_name, value)
	slot5 = self
	local selected_item_index = self.selected_item(slot4)

	if selected_item_index then
		slot9 = value

		self.set_item_value(slot5, self, selected_item_index, column_name)
	end

	return 
end
function CoreTableEditorPanel:_create_list_ctrl(parent)
	self.__list_ctrl = EWS.ListCtrl(slot3, EWS, parent, "")
	slot10 = "_on_selection_changed"

	self.__list_ctrl.connect(slot3, self.__list_ctrl, "EVT_COMMAND_LIST_ITEM_SELECTED", callback("LC_REPORT,LC_SINGLE_SEL", self, self))

	slot10 = "_on_selection_changed"
	slot7 = self.__list_ctrl

	self.__list_ctrl.connect(slot3, self.__list_ctrl, "EVT_COMMAND_LIST_ITEM_DESELECTED", callback(self.__list_ctrl, self, self))

	return self.__list_ctrl
end
function CoreTableEditorPanel:_create_buttons_panel(parent)
	slot5 = parent
	self.__buttons_panel = EWS.Panel(slot3, EWS)
	slot5 = "HORIZONTAL"
	local panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = panel_sizer

	self.__buttons_panel.set_sizer(EWS, self.__buttons_panel)

	slot7 = "Add"
	self.__add_button = EWS.Button(EWS, EWS, self.__buttons_panel)
	slot11 = "_on_add_button_clicked"

	self.__add_button.connect(EWS, self.__add_button, "EVT_COMMAND_BUTTON_CLICKED", callback(slot8, self, self))

	slot7 = "Remove"
	self.__remove_button = EWS.Button(EWS, EWS, self.__buttons_panel)
	slot11 = "_on_remove_button_clicked"
	slot8 = self.__add_button

	self.__remove_button.connect(EWS, self.__remove_button, "EVT_COMMAND_BUTTON_CLICKED", callback(self.__add_button, self, self))

	slot9 = "RIGHT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self.__add_button, 1, 1)

	slot9 = "LEFT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self.__remove_button, 1, 2)

	return self.__buttons_panel
end
function CoreTableEditorPanel:_create_fields_panel(parent)
	slot5 = parent
	self.__fields_panel = EWS.Panel(slot3, EWS)
	slot4 = self

	self._refresh_fields_panel(slot3)

	return self.__fields_panel
end
function CoreTableEditorPanel:_refresh_buttons_panel()
	slot6 = self
	slot4 = self.selected_item(slot5) ~= nil

	self.__remove_button.set_enabled(slot2, self.__remove_button)

	return 
end
function CoreTableEditorPanel:_refresh_fields_panel()
	if self.__frozen then
		self.__needs_refresh = true
	else
		slot3 = self.__fields_panel

		self.__fields_panel.freeze(slot2)

		slot3 = self.__fields_panel

		self.__fields_panel.destroy_children(slot2)

		slot4 = self.__fields_panel
		local new_sizer = self._sizer_with_editable_fields(slot2, self)

		if new_sizer then
			slot5 = new_sizer

			self.__fields_panel.set_sizer(slot3, self.__fields_panel)

			slot4 = self.__fields_panel

			self.__fields_panel.fit_inside(slot3)
		end

		slot4 = self.__fields_panel

		self.__fields_panel.thaw(slot3)
	end

	return 
end
function CoreTableEditorPanel:_sizer_with_editable_fields(parent)
	local sizer = EWS.BoxSizer(slot3, EWS)
	local first_control = nil
	slot6 = self.__column_names

	for _, column_name in ipairs("VERTICAL") do
		slot14 = sizer
		local control = self._create_labeled_text_field(slot10, self, column_name, parent)
		first_control = first_control or control
	end

	if first_control then
		slot6 = self

		if self.selected_item(slot5) ~= nil then
			slot8 = -1

			first_control.set_selection(slot5, first_control, -1)

			slot6 = first_control

			first_control.set_focus(slot5)
		end
	end

	return sizer
end
function CoreTableEditorPanel:_create_labeled_text_field(column_name, parent, sizer)
	slot6 = self
	local enabled = self.selected_item(slot5) ~= nil
	slot12 = true
	slot9 = string.pretty(slot10, column_name) .. ":"
	local label = EWS.StaticText(slot6, EWS, parent)
	slot9 = parent
	slot13 = column_name
	local control = EWS.TextCtrl(EWS, EWS, self.selected_item_value(column_name, self))
	slot11 = column_name
	local callback_func = self._make_control_edited_callback(EWS, self, control)
	slot11 = enabled

	label.set_enabled(self, label)

	slot11 = enabled

	control.set_enabled(self, control)

	slot10 = control
	slot13 = control
	slot14 = 0

	control.set_min_size(self, control.get_min_size(self).with_x(self, control.get_min_size(self)))

	slot12 = callback_func

	control.connect(self, control, "EVT_COMMAND_TEXT_UPDATED")

	slot14 = "TOP,LEFT,RIGHT"

	sizer.add(self, sizer, label, 0, 5)

	slot14 = "ALL,EXPAND"

	sizer.add(self, sizer, control, 0, 5)

	return control
end
function CoreTableEditorPanel:_column_index(column_name)
	return column_index - 1
end
function CoreTableEditorPanel:_string_to_value(str, column_name)

	-- Decompilation error in this vicinity:
	return str or ""
end
function CoreTableEditorPanel:_value_to_string(value, column_name)
	if value == nil then
		slot3 = ""
	else
		slot5 = value
		slot3 = tostring(slot4)
	end

	return slot3
end
function CoreTableEditorPanel:_make_control_edited_callback(control, column_name, value_method_name)
	return function ()
		slot5 = value_method_name

		self._on_control_edited(slot1, self, control, column_name)

		return 
	end
end
function CoreTableEditorPanel:_top_level_window(window)

	-- Decompilation error in this vicinity:
	window = window or self.__panel
	slot4 = window

	return slot2
end
function CoreTableEditorPanel:_on_selection_changed(sender)
	slot4 = self

	self._refresh_fields_panel(slot3)

	slot4 = self

	self._refresh_buttons_panel(slot3)

	return 
end
function CoreTableEditorPanel:_on_add_button_clicked(sender)
	slot5 = "<New Entry>"

	self.add_item(slot3, self)

	return 
end
function CoreTableEditorPanel:_on_remove_button_clicked(sender)
	slot4 = self
	slot7 = self

	self.remove_item(slot3, self.selected_item(slot6))

	return 
end
function CoreTableEditorPanel:_on_control_edited(control, column_name, value_method_name)
	value_method_name = value_method_name or "get_value"
	local value = control[value_method_name](slot5)
	slot9 = value

	self.set_selected_item_value(control, self, column_name)

	return 
end

return 
