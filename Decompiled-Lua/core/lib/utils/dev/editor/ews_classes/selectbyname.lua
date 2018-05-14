if not SelectByName then
	slot2 = UnitByName
	slot0 = class(slot1)
end

SelectByName = slot0
function SelectByName:init(...)
	slot5 = nil

	UnitByName.init(slot2, self, "Select by name", ...)

	return 
end
function SelectByName:_build_buttons(panel, sizer)
	slot9 = "BU_BOTTOM"
	local find_btn = EWS.Button(slot4, EWS, panel, "Find", "")
	slot10 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, find_btn, 0, 2)

	slot12 = "_on_find_unit"

	find_btn.connect(EWS, find_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	find_btn.connect(EWS, find_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot10 = "BU_BOTTOM"
	local select_btn = EWS.Button(EWS, EWS, panel, "Select", "")
	slot11 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, select_btn, 0, 2)

	slot13 = "_on_select_unit"

	select_btn.connect(EWS, select_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	select_btn.connect(EWS, select_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot11 = "BU_BOTTOM"
	local delete_btn = EWS.Button(EWS, EWS, panel, "Delete", "")
	slot12 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, delete_btn, 0, 2)

	slot14 = "_on_delete"

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot14 = "key_cancel"
	slot11 = ""

	delete_btn.connect(EWS, delete_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot10 = sizer

	UnitByName._build_buttons(EWS, self, panel)

	return 
end
function SelectByName:_on_delete()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, self._dialog, "Delete selected unit(s)?", self._dialog_name, Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = managers.editor

	managers.editor.freeze_gui_lists(slot3)

	slot6 = self

	for _, unit in ipairs(self._selected_item_units(slot5)) do
		slot10 = unit

		managers.editor.delete_unit(slot8, managers.editor)
	end

	slot4 = managers.editor

	managers.editor.thaw_gui_lists(slot3)

	return 
end
function SelectByName:_on_find_unit()
	slot3 = self

	self._on_select_unit(slot2)

	slot3 = managers.editor
	slot6 = self

	managers.editor.center_view_on_unit(slot2, self._selected_item_unit(slot5))

	return 
end
function SelectByName:_on_select_unit()
	slot3 = managers.editor
	slot6 = self

	managers.editor.change_layer_based_on_unit(slot2, self._selected_item_unit(slot5))

	slot3 = managers.editor

	managers.editor.freeze_gui_lists(slot2)

	self._blocked = true
	slot3 = managers.editor
	slot6 = self

	managers.editor.select_units(slot2, self._selected_item_units(slot5))

	slot3 = managers.editor

	managers.editor.thaw_gui_lists(slot2)

	self._blocked = false

	return 
end

return 
