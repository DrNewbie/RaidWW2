CoreMaterialEditorGlobalDialog = CoreMaterialEditorGlobalDialog or class()
function CoreMaterialEditorGlobalDialog:init(parent, editor)
	self._editor = editor
	slot13 = 0
	slot14 = 0
	slot11 = "CAPTION,SYSTEM_MENU,CLOSE_BOX,STAY_ON_TOP"
	self._dialog = EWS.Dialog(slot4, EWS, parent, "Global Configuration", "", Vector3(slot10, -1, -1), Vector3(-1, 400, 500))
	slot6 = "VERTICAL"
	local main_frame_box = EWS.BoxSizer(slot4, EWS)
	slot9 = ""
	local main_panel = EWS.Panel(EWS, EWS, self._dialog, "")
	slot8 = "VERTICAL"
	local panel_box = EWS.BoxSizer(EWS, EWS)
	slot11 = "TR_HAS_BUTTONS,TR_LINES_AT_ROOT,TR_HIDE_ROOT,TR_DEFAULT_STYLE"
	self._tree_ctrl = EWS.TreeCtrl(EWS, EWS, main_panel, "")
	slot12 = self

	self._tree_ctrl.connect(EWS, self._tree_ctrl, "", "EVT_COMMAND_TREE_ITEM_RIGHT_CLICK", self._editor._on_edit_global_popup)

	slot12 = "EXPAND"

	panel_box.add(EWS, panel_box, self._tree_ctrl, 1, 0)

	slot9 = "HORIZONTAL"
	local btn_box = EWS.BoxSizer(EWS, EWS)
	self._ok_btn = EWS.Button(EWS, EWS, main_panel, "OK", "")
	slot16 = "destroy"
	slot13 = true

	self._ok_btn.connect(EWS, self._ok_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot13 = "ALL,EXPAND"

	btn_box.add(EWS, btn_box, self._ok_btn, 0, 8)

	slot12 = ""
	local dead_panel = EWS.Panel(EWS, EWS, main_panel, "")
	slot14 = "EXPAND"

	btn_box.add(EWS, btn_box, dead_panel, 1, 0)

	self._cancel_btn = EWS.Button(EWS, EWS, main_panel, "Cancel", "")
	slot17 = "destroy"
	slot14 = false

	self._cancel_btn.connect(EWS, self._cancel_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "ALL,EXPAND"

	btn_box.add(EWS, btn_box, self._cancel_btn, 0, 8)

	slot14 = "EXPAND"

	panel_box.add(EWS, panel_box, btn_box, 0, 0)

	slot11 = panel_box

	main_panel.set_sizer(EWS, main_panel)
	main_frame_box.add(EWS, main_frame_box, main_panel, 1, 0)

	slot11 = main_frame_box

	self._dialog.set_sizer(EWS, self._dialog)

	slot17 = "destroy"
	slot14 = false

	self._dialog.connect(EWS, self._dialog, "", "EVT_CLOSE_WINDOW", callback("EXPAND", self, self))

	self._destroy_map = {}
	self._item_map = {}
	slot10 = self._editor._global_material_config_node

	for child in self._editor._global_material_config_node.children(EWS) do
		slot18 = ""
		slot18 = self._item_map

		self._fill_tree(slot13, self, self._tree_ctrl.append_root(slot16, self._tree_ctrl), self._editor._global_material_config_node, child)
	end

	slot10 = self._dialog

	self._dialog.show_modal(slot9)

	return 
end
function CoreMaterialEditorGlobalDialog:destroy(clean)
	if clean then
		slot4 = self._destroy_map

		for _, n in ipairs(slot3) do
			slot9 = n._parent
			slot13 = n._node

			n._parent.remove_child_at(slot8, n._parent.index_of_child(slot11, n._parent))
		end
	end

	slot5 = true

	self._editor._save_global_to_disk(slot3, self._editor)

	slot5 = ""

	self._dialog.end_modal(slot3, self._dialog)

	return 
end
function CoreMaterialEditorGlobalDialog:on_remove(custom_data)
	local item = custom_data.get_item(slot3)
	slot6 = item

	self._tree_ctrl.remove(custom_data, self._tree_ctrl)

	slot9 = item
	slot6 = self._item_map[tostring(slot8)]

	table.insert(custom_data, self._destroy_map)

	return 
end
function CoreMaterialEditorGlobalDialog:_on_ok()
	return 
end
function CoreMaterialEditorGlobalDialog:_on_cancel()
	return 
end
function CoreMaterialEditorGlobalDialog:_fill_tree(id, parent, node)
	slot6 = node
	local text = node.name(slot5)
	slot9 = node

	for k, v in pairs(node.parameters(slot8)) do
		if k == "name" then
			text = text .. " | " .. k .. "=" .. v

			break
		end
	end

	slot9 = node

	for k, v in pairs(node.parameters(slot8)) do
		if k ~= "name" then
			text = text .. " | " .. k .. "=" .. v
		end
	end

	slot9 = text
	local new_id = self._tree_ctrl.append(slot6, self._tree_ctrl, id)
	slot9 = new_id
	self._item_map[tostring(id)] = {
		_node = node,
		_parent = parent
	}
	slot8 = node

	for child in node.children(tostring(id)) do
		slot15 = child

		self._fill_tree(slot11, self, new_id, node)
	end

	return new_id
end
CoreMaterialEditorStartDialog = CoreMaterialEditorStartDialog or class()
function CoreMaterialEditorStartDialog:init(parent, editor)
	self._editor = editor
	self._parent = parent
	slot7 = 0
	self._frame_size = Vector3(slot4, 150, 200)
	slot11 = 0
	slot10 = parent
	self._frame = EWS.Frame(slot4, EWS, "Getting Started", Vector3(slot8, 0, 0), self._frame_size, "FRAME_FLOAT_ON_PARENT,FRAME_TOOL_WINDOW,CAPTION")
	slot6 = "VERTICAL"
	local main_frame_box = EWS.BoxSizer(slot4, EWS)
	slot9 = ""
	local main_panel = EWS.Panel(EWS, EWS, self._frame, "")
	slot8 = "VERTICAL"
	local panel_box = EWS.BoxSizer(EWS, EWS)
	self._new_btn = EWS.Button(EWS, EWS, main_panel, "New", "")
	slot15 = "on_new"
	slot12 = false

	self._new_btn.connect(EWS, self._new_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot12 = "ALL,EXPAND"

	panel_box.add(EWS, panel_box, self._new_btn, 1, 4)

	self._open_btn = EWS.Button(EWS, EWS, main_panel, "Open", "")
	slot15 = "on_open"
	slot12 = false

	self._open_btn.connect(EWS, self._open_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot12 = "ALL,EXPAND"

	panel_box.add(EWS, panel_box, self._open_btn, 1, 4)

	self._exit_btn = EWS.Button(EWS, EWS, main_panel, "Exit", "")
	slot15 = "on_exit"
	slot12 = false

	self._exit_btn.connect(EWS, self._exit_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot12 = "ALL,EXPAND"

	panel_box.add(EWS, panel_box, self._exit_btn, 1, 4)

	slot9 = panel_box

	main_panel.set_sizer(EWS, main_panel)

	slot12 = "EXPAND"

	main_frame_box.add(EWS, main_frame_box, main_panel, 1, 0)

	slot9 = main_frame_box

	self._frame.set_sizer(EWS, self._frame)

	return 
end
function CoreMaterialEditorStartDialog:on_new()
	slot6 = "Material Configurations (*.material_config)|*.material_config"
	local path = managers.database.save_file_dialog(slot2, managers.database, self._parent, true)

	if path then
		slot5 = path

		if managers.database.has(slot3, managers.database) then
			slot8 = "YES_NO,ICON_ERROR"
			slot4 = EWS.MessageDialog(slot3, EWS, self._parent, "A material config with that name already exists. Do you want to replace it?", "Duplicated!")

			if EWS.MessageDialog(slot3, EWS, self._parent, "A material config with that name already exists. Do you want to replace it?", "Duplicated!").show_modal(slot3) == "ID_NO" then
				return 
			end
		end

		slot5 = path

		self._editor._create_new_material_config(slot3, self._editor)

		slot4 = self._editor

		self._editor._update_interface_after_material_list_change(slot3)

		slot4 = self._editor

		self._editor._reset_diff(slot3)

		slot4 = self

		self.end_modal(slot3)
	end

	return 
end
function CoreMaterialEditorStartDialog:on_open()
	slot5 = "*.material_config"
	local node, path = managers.database.load_node_dialog(slot2, managers.database, self._parent)

	if node and path then
		slot7 = node

		if self._editor._load_node(slot4, self._editor, path) then
			slot5 = self

			self.end_modal(slot4)
		end
	end

	return 
end
function CoreMaterialEditorStartDialog:on_exit()
	slot3 = self._frame

	self._frame.destroy(slot2)

	self._frame = nil
	slot4 = self._editor.TOOLHUB_NAME

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
function CoreMaterialEditorStartDialog:running()
	if self._running then
		slot3 = self._frame
		slot1 = alive(slot2)
	end

	return slot1
end
function CoreMaterialEditorStartDialog:show_modal()
	self._running = true
	slot4 = false

	self._parent.set_enabled(slot2, self._parent)

	slot4 = true

	self._frame.set_visible(slot2, self._frame)

	return 
end
function CoreMaterialEditorStartDialog:update(t, dt)
	slot6 = self._parent
	self._frame_pos = (self._parent.get_position(slot4) + self._parent.get_size(self._parent) * 0.5) - self._frame_size * 0.5
	slot6 = self._frame_pos

	self._frame.set_position(self._frame_size * 0.5, self._frame)

	return 
end
function CoreMaterialEditorStartDialog:end_modal()
	self._running = false
	slot4 = false

	self._frame.set_visible(slot2, self._frame)

	slot4 = true

	self._parent.set_enabled(slot2, self._parent)

	slot3 = self._parent

	self._parent.set_focus(slot2)

	return 
end
CoreMaterialEditorCompileWarningDialog = CoreMaterialEditorCompileWarningDialog or class()
function CoreMaterialEditorCompileWarningDialog:init(parent)
	self._parent = parent
	slot6 = 0
	local frame_size = Vector3(slot3, 540, 340)
	slot6 = self._parent
	local frame_pos = (self._parent.get_position(540) + self._parent.get_size(self._parent) * 0.5) - frame_size * 0.5
	self._dialog = EWS.Dialog(self._parent, EWS, parent, "Warning!", "", frame_pos, frame_size)
	slot7 = "VERTICAL"
	local main_frame_box = EWS.BoxSizer(self._parent, EWS)
	slot10 = ""
	local main_panel = EWS.Panel(EWS, EWS, self._dialog, "")
	slot9 = "VERTICAL"
	local panel_box = EWS.BoxSizer(EWS, EWS)
	slot13 = "material_editor/compile_warning.png"
	slot13 = "NO_BORDER"
	self._inmage_btn = EWS.BitmapButton(EWS, EWS, main_panel, CoreEWS.image_path(""), "")
	slot13 = "EXPAND"

	panel_box.add(EWS, panel_box, self._inmage_btn, 1, 0)

	slot10 = "HORIZONTAL"
	local btn_box = EWS.BoxSizer(EWS, EWS)
	self._ok_btn = EWS.Button(EWS, EWS, main_panel, "OK", "")
	slot17 = "end_modal"
	slot14 = "OK"

	self._ok_btn.connect(EWS, self._ok_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "ALL,EXPAND"

	btn_box.add(EWS, btn_box, self._ok_btn, 1, 4)

	self._cancel_btn = EWS.Button(EWS, EWS, main_panel, "Cancel", "")
	slot17 = "end_modal"
	slot14 = "CANCEL"

	self._cancel_btn.connect(EWS, self._cancel_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "ALL,EXPAND"

	btn_box.add(EWS, btn_box, self._cancel_btn, 1, 4)

	slot14 = "EXPAND"

	panel_box.add(EWS, panel_box, btn_box, 0, 0)

	slot11 = panel_box

	main_panel.set_sizer(EWS, main_panel)

	slot14 = "EXPAND"

	main_frame_box.add(EWS, main_frame_box, main_panel, 1, 0)

	slot11 = main_frame_box

	self._dialog.set_sizer(EWS, self._dialog)

	return 
end
function CoreMaterialEditorCompileWarningDialog:show_modal()
	slot3 = self._dialog

	return self._dialog.show_modal(slot2)
end
function CoreMaterialEditorCompileWarningDialog:end_modal(data)
	slot5 = data

	self._dialog.end_modal(slot3, self._dialog)

	return 
end

return 
