CoreExtendedMultiChoiceDialog = CoreExtendedMultiChoiceDialog or class()
slot2 = Application

if Application.ews_enabled(slot1) then
	slot5 = "EWS"
	local ews = getmetatable(rawget(slot3, _G))
	slot3 = ews

	assert(rawget)

	function slot5(ews, ...)
		slot3 = "CoreExtendedMultiChoiceDialog"

		return core_or_local(slot2, ...)
	end

	rawset(rawget, ews, "ExtendedMultiChoiceDialog")
end

function CoreExtendedMultiChoiceDialog:init(parent, caption, message, pos, size, style, objects)
	self._objects = objects or {}
	slot10 = EWS
	slot8 = EWS.Dialog
	slot11 = parent
	slot12 = caption or ""
	slot13 = ""

	if not pos then
		slot18 = 0
		slot14 = Vector3(slot15, -1, -1)
	end

	if not size then
		slot19 = 0
		slot15 = Vector3(slot16, 450, 500)
	end

	slot16 = style or "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	self._dialog = slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	slot11 = "VERTICAL"
	local box = EWS.BoxSizer(slot9, EWS)
	slot12 = "HORIZONTAL"
	local lb_box = EWS.BoxSizer(EWS, EWS)

	if message and message ~= "" then
		slot16 = ""
		local message_text = EWS.StaticText(slot11, EWS, self._dialog, message, "")
		slot17 = "EXPAND,ALL"

		box.add(EWS, box, message_text, 0, 12)

		slot16 = ""
		local line = EWS.StaticLine(EWS, EWS, self._dialog, "")
		slot18 = "EXPAND,BOTTOM"

		box.add(EWS, box, line, 0, 10)
	end

	self._left_list_box = EWS.ListBox(slot11, EWS, self._dialog, "multi_choic_left_box", "")
	slot19 = "on_left_box"
	slot16 = ""

	self._left_list_box.connect(slot11, self._left_list_box, "", "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback("LB_SORT", self, self))

	slot16 = "ALL,EXPAND"

	lb_box.add(slot11, lb_box, self._left_list_box, 1, 4)

	self._right_list_box = EWS.ListBox(slot11, EWS, self._dialog, "multi_choic_left_box", "")
	slot19 = "on_right_box"
	slot16 = ""

	self._right_list_box.connect(slot11, self._right_list_box, "", "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback("LB_SORT", self, self))

	slot16 = "ALL,EXPAND"

	lb_box.add(slot11, lb_box, self._right_list_box, 1, 4)

	slot16 = "EXPAND"

	box.add(slot11, box, lb_box, 1, 0)

	slot15 = ""
	local line = EWS.StaticLine(slot11, EWS, self._dialog, "")
	slot17 = "EXPAND,TOP"

	box.add(EWS, box, line, 0, 10)

	slot14 = "HORIZONTAL"
	local button_box = EWS.BoxSizer(EWS, EWS)
	self._ok_btn = EWS.Button(EWS, EWS, self._dialog, "OK", "")
	slot21 = "on_ok_button"
	slot18 = ""

	self._ok_btn.connect(EWS, self._ok_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot18 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._ok_btn, 1, 10)

	self._cancel_btn = EWS.Button(EWS, EWS, self._dialog, "Cancel", "")
	slot21 = "on_cancel_button"
	slot18 = ""

	self._cancel_btn.connect(EWS, self._cancel_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot18 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._cancel_btn, 1, 10)

	slot18 = "EXPAND"

	box.add(EWS, box, button_box, 0, 0)

	slot15 = box

	self._dialog.set_sizer(EWS, self._dialog)

	return 
end
function CoreExtendedMultiChoiceDialog:show_modal()
	self._value_map = {}
	slot3 = self._left_list_box

	self._left_list_box.clear(slot2)

	slot3 = self._right_list_box

	self._right_list_box.clear(slot2)

	slot3 = self._objects

	for _, object in ipairs(slot2) do
		slot9 = object

		self._left_list_box.append(slot7, self._left_list_box)
	end

	slot3 = self._dialog

	return self._dialog.show_modal(slot2)
end
function CoreExtendedMultiChoiceDialog:on_ok_button()
	slot4 = self._right_list_box

	for i = 0, self._right_list_box.nr_items(slot3) - 1, 1 do
		slot7 = self._value_map
		slot11 = i

		table.insert(slot6, self._right_list_box.get_string(slot9, self._right_list_box))
	end

	slot4 = "ID_OK"

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function CoreExtendedMultiChoiceDialog:on_cancel_button()
	slot4 = "ID_CANCEL"

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function CoreExtendedMultiChoiceDialog:on_left_box()
	slot3 = self._left_list_box
	local index = self._left_list_box.selected_index(slot2)

	if -1 < index then
		slot5 = index
		local selected = self._left_list_box.get_string(slot3, self._left_list_box)
		slot6 = selected

		self._right_list_box.append(self._left_list_box, self._right_list_box)

		slot6 = index

		self._left_list_box.remove(self._left_list_box, self._left_list_box)
	end

	return 
end
function CoreExtendedMultiChoiceDialog:on_right_box()
	slot3 = self._right_list_box
	local index = self._right_list_box.selected_index(slot2)

	if -1 < index then
		slot5 = index
		local selected = self._right_list_box.get_string(slot3, self._right_list_box)
		slot6 = selected

		self._left_list_box.append(self._right_list_box, self._left_list_box)

		slot6 = index

		self._right_list_box.remove(self._right_list_box, self._right_list_box)
	end

	return 
end
function CoreExtendedMultiChoiceDialog:get_value()
	return self._value_map
end

return 
