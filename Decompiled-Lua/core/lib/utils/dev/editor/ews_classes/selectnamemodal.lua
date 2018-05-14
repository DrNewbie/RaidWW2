if not SelectNameModal then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

SelectNameModal = slot0
function SelectNameModal:init(name, assets_list, settings, ...)
	Global.world_editor = Global.world_editor or {}
	Global.world_editor.filter = Global.world_editor.filter or ""
	self._dialog_name = self._dialog_name or name or "Assets"
	self._cancelled = true
	self._assets_list = assets_list
	slot14 = 0
	slot15 = 0

	CoreEditorEwsDialog.init(Global.world_editor.filter or "", self, nil, self._dialog_name, "", Vector3(slot11, 300, 150), Vector3(300, 350, 500), ...)
	self.create_panel(Global.world_editor.filter or "", self)

	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot9 = panel_sizer

	panel.set_sizer("VERTICAL", panel)

	slot9 = "HORIZONTAL"
	local horizontal_ctrlr_sizer = EWS.BoxSizer("VERTICAL", EWS)
	slot10 = "VERTICAL"
	local list_sizer = EWS.BoxSizer(EWS, EWS)
	slot17 = ""
	slot14 = "ALIGN_CENTER_HORIZONTAL"

	list_sizer.add(EWS, list_sizer, EWS.StaticText("DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP", EWS, panel, "Filter", 0), 0, 0)

	slot14 = "TE_CENTRE"
	self._filter = EWS.TextCtrl(EWS, EWS, panel, Global.world_editor.filter, "")
	slot14 = "EXPAND"

	list_sizer.add(EWS, list_sizer, self._filter, 0, 0)

	slot16 = "update_filter"
	slot13 = nil

	self._filter.connect(EWS, self._filter, "EVT_COMMAND_TEXT_UPDATED", callback(0, self, self))

	local list_style = (settings and settings.list_style) or "LC_SINGLE_SEL,LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	slot14 = list_style
	self._list = EWS.ListCtrl(slot10, EWS, panel, "")
	slot11 = self._list

	self._list.clear_all(slot10)

	slot12 = "Name"

	self._list.append_column(slot10, self._list)

	slot15 = "EXPAND"

	list_sizer.add(slot10, list_sizer, self._list, 1, 0)

	slot15 = "EXPAND"

	horizontal_ctrlr_sizer.add(slot10, horizontal_ctrlr_sizer, list_sizer, 3, 0)

	slot15 = "EXPAND"

	panel_sizer.add(slot10, panel_sizer, horizontal_ctrlr_sizer, 1, 0)

	slot17 = "_on_mark_assett"

	self._list.connect(slot10, self._list, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

	slot17 = "_on_select_asset"

	self._list.connect(slot10, self._list, "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback(nil, self, self))

	slot17 = "key_delete"

	self._list.connect(slot10, self._list, "EVT_CHAR", callback(nil, self, self))

	slot17 = "key_cancel"
	slot14 = ""

	self._list.connect(slot10, self._list, "EVT_KEY_DOWN", callback("", self, self))

	slot12 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot10, EWS)
	slot14 = button_sizer

	self._build_buttons(EWS, self, panel)

	slot16 = "ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, button_sizer, 0, 0)

	slot16 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot12 = self

	self.fill_asset_list(EWS)

	slot13 = true

	self._dialog.set_visible(EWS, self._dialog)

	slot12 = self

	self.show_modal(EWS)

	return 
end
function SelectNameModal:_on_mark_assett()
	return 
end
function SelectNameModal:_on_select_asset()
	return 
end
function SelectNameModal:_build_buttons(panel, sizer)
	slot9 = "BU_BOTTOM"
	local select_btn = EWS.Button(slot4, EWS, panel, "Select", "")
	slot10 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, select_btn, 0, 2)

	slot12 = "_on_select_asset"

	select_btn.connect(EWS, select_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	select_btn.connect(EWS, select_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot10 = ""
	local cancel_btn = EWS.Button(EWS, EWS, panel, "Cancel", "")
	slot11 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, cancel_btn, 0, 2)

	slot13 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	return 
end
function SelectNameModal:_on_select_asset()
	self._cancelled = false
	slot4 = "hello"

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function SelectNameModal:on_cancel()
	slot4 = "hello"

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function SelectNameModal:selected_assets()
	slot3 = self

	return self._selected_item_assets(slot2)
end
function SelectNameModal:update_filter()
	slot4 = self._filter
	Global.world_editor.filter = self._filter.get_value(slot3)
	slot3 = self

	self.fill_asset_list(self._filter.get_value(slot3))

	return 
end
function SelectNameModal:cancelled()
	return self._cancelled
end
function SelectNameModal:fill_asset_list()
	slot3 = self._list

	self._list.delete_all_items(slot2)

	slot3 = self._filter
	local filter = self._filter.get_value(slot2)
	slot6 = filter
	filter = utf8.to_lower(utf8.from_latin1(slot5))
	local j = 1
	self._assets = {}
	slot5 = self._list

	self._list.freeze(utf8.from_latin1)

	slot5 = self._assets_list

	for _, asset in pairs(utf8.from_latin1) do
		slot12 = asset
		local l_asset = utf8.to_lower(utf8.from_latin1(slot11))
		slot14 = true

		if string.find(utf8.from_latin1, l_asset, filter, 1) then
			slot12 = asset
			local i = self._list.append_item(slot10, self._list)
			self._assets[j] = asset
			slot14 = j

			self._list.set_item_data(self._list, self._list, i)

			j = j + 1
		end
	end

	slot5 = self._list

	self._list.thaw(slot4)

	slot6 = 0

	self._list.autosize_column(slot4, self._list)

	return 
end
function SelectNameModal:key_delete(ctrlr, event)
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
function SelectNameModal:key_cancel(ctrlr, event)
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
function SelectNameModal:_on_delete()
	return 
end
function SelectNameModal:_selected_item_assets()
	local assets = {}
	slot6 = self._list

	for _, i in ipairs(self._list.selected_items(slot5)) do
		slot11 = 0
		local asset = self._list.get_item(slot8, self._list, i)
		slot11 = asset

		table.insert(self._list, assets)
	end

	return assets
end

return 
