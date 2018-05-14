-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreXMLEditor = CoreXMLEditor or class()
function CoreXMLEditor:init()
	self._active_database = ProjectDatabase
	self._current_prop = {}
	slot3 = self

	self.create_main_frame(slot2)

	slot4 = true

	self.check_news(slot2, self)

	return 
end
function CoreXMLEditor:on_check_news()
	slot3 = self

	self.check_news(slot2)

	return 
end
function CoreXMLEditor:check_news(new_only)
	local news = nil

	if new_only then
		slot7 = self._main_frame_table._main_frame
		news = managers.news.get_news(slot4, managers.news, "xml_editor")
	else
		slot7 = self._main_frame_table._main_frame
		news = managers.news.get_old_news(slot4, managers.news, "xml_editor")
	end

	if news then
		local str = nil
		slot6 = news

		for _, n in ipairs(slot5) do
			if not str then
				str = n
			else
				str = str .. "\n" .. n
			end
		end

		slot10 = "OK,ICON_INFORMATION"
		slot6 = EWS.MessageDialog(slot5, EWS, self._main_frame_table._main_frame, str, "New Features!")

		EWS.MessageDialog(slot5, EWS, self._main_frame_table._main_frame, str, "New Features!").show_modal(slot5)
	end

	return 
end
function CoreXMLEditor:check_open()
	if open_editor then
		slot9 = 0
		slot10 = 0
		slot7 = ""
		local frame = EWS.Frame(slot2, EWS, "", Vector3(slot6, 0, 0), Vector3(0, 0, 0))
		slot8 = "OK,ICON_INFORMATION"
		slot4 = EWS.MessageDialog(EWS, EWS, frame, "Please close the " .. open_editor .. " before open this editor.", "Conflict")

		EWS.MessageDialog(EWS, EWS, frame, "Please close the " .. open_editor .. " before open this editor.", "Conflict").show_modal(EWS)

		slot4 = frame

		frame.destroy(EWS)

		slot5 = "XML Editor"

		managers.toolhub.close(EWS, managers.toolhub)

		return true
	else
		open_editor = "XML Editor"
	end

	return false
end
function CoreXMLEditor:create_main_frame()
	self._main_frame_table = {}
	slot10 = 0
	slot11 = 0
	slot2 = EWS.Frame(slot3, EWS, "XML Editor", Vector3(slot7, -1, -1), Vector3(-1, 1000, 800), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE")
	self._main_frame_table._main_frame = slot2
	slot3 = self._main_frame_table._main_frame
	slot6 = "xml_editor_16x16.png"

	self._main_frame_table._main_frame.set_icon(slot2, CoreEWS.image_path("XML Editor"))

	local menu_bar = EWS.MenuBar(slot2)
	slot5 = ""
	local file_menu = EWS.Menu(EWS, EWS)
	slot8 = ""

	file_menu.append_item(EWS, file_menu, "NEW", "New\tCtrl+N")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "OPEN", "Open\tCtrl+O")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "SAVE", "Save\tCtrl+S")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "SAVE_AS", "Save As")

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "NEWS", "Get Latest News")

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "EXIT", "Exit")

	slot7 = "File"

	menu_bar.append(EWS, menu_bar, file_menu)

	slot6 = ""
	self._db_menu = EWS.Menu(EWS, EWS)
	slot8 = ""

	self._db_menu.append_radio_item(EWS, self._db_menu, "DB_PROJECT", "Project")

	slot8 = ""

	self._db_menu.append_radio_item(EWS, self._db_menu, "DB_CORE", "Core")

	slot7 = true

	self._db_menu.set_checked(EWS, self._db_menu, "DB_PROJECT")

	slot7 = "Database"

	menu_bar.append(EWS, menu_bar, self._db_menu)

	slot6 = menu_bar

	self._main_frame_table._main_frame.set_menu_bar(EWS, self._main_frame_table._main_frame)

	slot12 = "on_new"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "NEW", "EVT_COMMAND_MENU_SELECTED", callback(Global.frame, self, self))

	slot12 = "on_open"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "OPEN", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_save"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "SAVE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_save_as"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "SAVE_AS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_check_news"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "NEWS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_close"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_set_db"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "DB_PROJECT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_set_db"

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "DB_CORE", "EVT_COMMAND_MENU_SELECTED", callback(ProjectDatabase, self, self))

	slot12 = "on_close"
	slot9 = ""

	self._main_frame_table._main_frame.connect(EWS, self._main_frame_table._main_frame, "", "EVT_CLOSE_WINDOW", callback(CoreDatabase, self, self))

	local main_box = EWS.BoxSizer(EWS, EWS)
	slot10 = ""
	self._main_frame_table._main_panel = EWS.Panel("VERTICAL", EWS, self._main_frame_table._main_frame, "")
	local panel_box = EWS.BoxSizer(EWS.Panel("VERTICAL", EWS, self._main_frame_table._main_frame, ""), EWS)
	slot12 = "TE_MULTILINE"
	slot6 = EWS.TextCtrl("VERTICAL", EWS, self._main_frame_table._main_panel, "", "")
	self._main_frame_table._edit_text_ctrl = slot6
	slot11 = "EXPAND"

	panel_box.add(slot6, panel_box, self._main_frame_table._edit_text_ctrl, 1, 0)

	slot8 = panel_box

	self._main_frame_table._main_panel.set_sizer(slot6, self._main_frame_table._main_panel)

	slot11 = "EXPAND"

	main_box.add(slot6, main_box, self._main_frame_table._main_panel, 1, 0)

	slot8 = main_box

	self._main_frame_table._main_frame.set_sizer(slot6, self._main_frame_table._main_frame)

	slot8 = true

	self._main_frame_table._main_frame.set_visible(slot6, self._main_frame_table._main_frame)

	slot11 = "YES_NO,ICON_QUESTION"
	self._save_prev_dialog = EWS.MessageDialog(slot6, EWS, self._main_frame_table._main_frame, "Do you want to save your current work?", "Save")
	slot11 = "OK,ICON_ERROR"
	self._compile_error_dialog = EWS.MessageDialog(slot6, EWS, self._main_frame_table._main_frame, "Could not compile XML!", "Error")
	slot8 = self._main_frame_table._main_frame
	self._new_dialog = CoreXMLEditorNewDialog.new(slot6, CoreXMLEditorNewDialog)

	return 
end
function CoreXMLEditor:on_set_db(data, event)
	slot7 = false

	self._db_menu.set_checked(slot4, self._db_menu, "DB_PROJECT")
	self._db_menu.set_checked(slot4, self._db_menu, "DB_CORE")

	slot8 = event
	slot7 = true

	self._db_menu.set_checked(slot4, self._db_menu, event.get_id(false))

	self._active_database = data
	slot6 = ""

	self._main_frame_table._edit_text_ctrl.set_value(slot4, self._main_frame_table._edit_text_ctrl)

	self._current_node = nil
	self._current_entry = nil
	self._current_prop = {}

	return 
end
function CoreXMLEditor:on_new()
	slot3 = self._main_frame_table._edit_text_ctrl

	if self._main_frame_table._edit_text_ctrl.get_value(slot2) ~= "" then
		slot3 = self._save_prev_dialog

		if self._save_prev_dialog.show_modal(slot2) == "ID_YES" then
			slot3 = self

			self.on_save(slot2)
		end
	end

	slot4 = ""

	self._main_frame_table._edit_text_ctrl.set_value(slot2, self._main_frame_table._edit_text_ctrl)

	self._current_node = nil
	self._current_entry = nil
	self._current_prop = {}
	slot3 = self

	self.update_title(slot2)

	return 
end
function CoreXMLEditor:on_open()
	slot7 = self._active_database
	self._browse = CoreDBDialog.new(slot2, CoreDBDialog, "", self, self.openfile)

	return 
end
function CoreXMLEditor:on_save()
	if not self._current_node or not self._current_entry then
		slot3 = self

		self.on_save_as(slot2)
	else
		slot3 = self._current_node
		slot6 = self._main_frame_table._edit_text_ctrl

		if self._current_node.try_read_xml(slot2, self._main_frame_table._edit_text_ctrl.get_value(slot5)) then
			local entry_type = self._current_entry.type(slot2)
			local entry_name = self._current_entry.name(self._current_entry)
			slot5 = "new_node"
			self._current_node = Node(self._current_entry)
			slot5 = self._current_node
			slot8 = self._main_frame_table._edit_text_ctrl

			self._current_node.read_xml(self._current_entry, self._main_frame_table._edit_text_ctrl.get_value(slot7))

			slot7 = self._current_entry

			self._active_database.save_node(self._current_entry, self._active_database, self._current_node)

			slot5 = self._active_database

			self._active_database.save(self._current_entry)

			slot8 = self._current_prop
			self._current_entry = self._active_database.lookup(self._current_entry, self._active_database, entry_type, entry_name)
			slot6 = self._current_entry
			self._current_node = self._active_database.load_node(self._current_entry, self._active_database)
		else
			slot3 = self._compile_error_dialog

			self._compile_error_dialog.show_modal(slot2)
		end
	end

	return 
end
function CoreXMLEditor:on_save_as()
	local test_node = Node(slot2)
	slot4 = test_node
	slot7 = self._main_frame_table._edit_text_ctrl

	if test_node.try_read_xml("new_node", self._main_frame_table._edit_text_ctrl.get_value(slot6)) then
		slot4 = self._new_dialog

		if self._new_dialog.show_modal(slot3) then
			slot4 = self._new_dialog
			local entry_type, entry_name = self._new_dialog.get_value(slot3)
			slot9 = self._current_prop
			local added_entry = self._active_database.lookup(slot5, self._active_database, entry_type, entry_name)
			slot7 = added_entry

			if not added_entry.valid(self._active_database) then
				slot11 = "xml"
				added_entry = self._active_database.add(slot6, self._active_database, entry_type, entry_name, self._current_prop)
			end

			self._current_node = test_node
			self._current_entry = added_entry
			slot9 = self._current_entry

			self._active_database.save_node(slot6, self._active_database, self._current_node)

			slot7 = self._active_database

			self._active_database.save(slot6)

			slot10 = self._current_prop
			self._current_entry = self._active_database.lookup(slot6, self._active_database, entry_type, entry_name)
			slot8 = self._current_entry
			self._current_node = self._active_database.load_node(slot6, self._active_database)
			slot7 = self

			self.update_title(slot6)
		end
	else
		slot4 = self._compile_error_dialog

		self._compile_error_dialog.show_modal(slot3)
	end

	return 
end
function CoreXMLEditor:openfile()
	slot3 = self._active_database
	slot6 = self._browse
	local node = self._active_database.load_node(slot2, self._browse.get_value(slot5))

	if node then
		slot4 = node
		local xml_str = node.to_xml(slot3)

		if xml_str then
			slot5 = self._main_frame_table._edit_text_ctrl

			if self._main_frame_table._edit_text_ctrl.get_value(slot4) ~= "" then
				slot5 = self._save_prev_dialog

				if self._save_prev_dialog.show_modal(slot4) == "ID_YES" then
					slot5 = self

					self.on_save(slot4)
				end
			end

			self._current_node = node
			slot5 = self._browse
			self._current_entry = self._browse.get_value(slot4)
			slot5 = self._current_entry
			self._current_prop = self._current_entry.properties(slot4)
			slot6 = xml_str

			self._main_frame_table._edit_text_ctrl.set_value(slot4, self._main_frame_table._edit_text_ctrl)

			slot5 = self

			self.update_title(slot4)

			self._browse = nil
		end
	end

	return 
end
function CoreXMLEditor:update_title()
	if self._current_entry then
		slot3 = self._current_entry
	else
		slot4 = "XML Editor"

		self._main_frame_table._main_frame.set_title(slot2, self._main_frame_table._main_frame)
	end

	return 
end
function CoreXMLEditor:update(t, dt)
	if self._browse then
		slot7 = dt

		if self._browse.update(slot4, self._browse, t) then
			slot5 = self._main_frame_table._main_frame

			self._main_frame_table._main_frame.set_focus(slot4)

			self._browse = nil
		end
	end

	return 
end
function CoreXMLEditor:set_position(newpos)
	if self._main_frame_table and self._main_frame_table._main_frame then
		slot5 = newpos

		self._main_frame_table._main_frame.set_position(slot3, self._main_frame_table._main_frame)
	end

	return 
end
function CoreXMLEditor:on_close()
	slot3 = self

	self.close(slot2)

	slot4 = "XML Editor"

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
function CoreXMLEditor:destroy()
	if self._main_frame_table then
		slot3 = self._main_frame_table._main_frame

		if alive(slot2) then
			slot3 = self._main_frame_table._main_frame

			self._main_frame_table._main_frame.destroy(slot2)

			self._main_frame_table._main_frame = nil
		end
	end

	if self._browse then
		slot3 = self._browse

		self._browse.destroy(slot2)

		self._browse = nil
	end

	return 
end
function CoreXMLEditor:close()
	if self._main_frame_table and self._main_frame_table._main_frame then
		slot3 = self._main_frame_table._main_frame

		self._main_frame_table._main_frame.destroy(slot2)

		open_editor = nil
	end

	if self._browse then
		slot3 = self._browse

		self._browse.destroy(slot2)

		self._browse = nil
	end

	return 
end
CoreXMLEditorNewDialog = CoreXMLEditorNewDialog or class()
function CoreXMLEditorNewDialog:init(p)
	slot12 = 0
	slot13 = 0
	slot10 = "CAPTION,SYSTEM_MENU"
	self._dialog = EWS.Dialog(slot3, EWS, p, "Create New Entry", "", Vector3(slot9, -1, -1), Vector3(-1, 200, 86))
	slot5 = "VERTICAL"
	local box = EWS.BoxSizer(slot3, EWS)
	slot6 = "HORIZONTAL"
	local text_box = EWS.BoxSizer(EWS, EWS)
	self._type_text_ctrl = EWS.TextCtrl(EWS, EWS, self._dialog, "", "")
	slot13 = "on_set_button"
	slot10 = ""

	self._type_text_ctrl.connect(EWS, self._type_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	text_box.add(EWS, text_box, self._type_text_ctrl, 1, 0)

	self._name_text_ctrl = EWS.TextCtrl(EWS, EWS, self._dialog, "", "")
	slot13 = "on_set_button"
	slot10 = ""

	self._name_text_ctrl.connect(EWS, self._name_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	text_box.add(EWS, text_box, self._name_text_ctrl, 1, 0)

	slot10 = "ALL,EXPAND"

	box.add(EWS, box, text_box, 0, 4)

	slot7 = "HORIZONTAL"
	local button_box = EWS.BoxSizer(EWS, EWS)
	self._set = EWS.Button(EWS, EWS, self._dialog, "Create", "")
	slot14 = "on_set_button"
	slot11 = ""

	self._set.connect(EWS, self._set, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._set, 1, 4)

	self._cancel = EWS.Button(EWS, EWS, self._dialog, "Cancel", "")
	slot14 = "on_cancel_button"
	slot11 = ""

	self._cancel.connect(EWS, self._cancel, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._cancel, 1, 4)

	slot11 = "EXPAND"

	box.add(EWS, box, button_box, 0, 0)

	slot8 = box

	self._dialog.set_sizer(EWS, self._dialog)

	return 
end
function CoreXMLEditorNewDialog:show_modal()
	slot4 = "[type]"

	self._type_text_ctrl.set_value(slot2, self._type_text_ctrl)

	slot4 = "[name]"

	self._name_text_ctrl.set_value(slot2, self._name_text_ctrl)

	self._key = nil
	self._done = false
	self._return_val = true
	slot3 = self._dialog

	self._dialog.show_modal(slot2)

	while not self._done do
	end

	return self._return_val
end
function CoreXMLEditorNewDialog:on_set_button()
	self._done = true
	slot3 = self._type_text_ctrl
	self._type = self._type_text_ctrl.get_value(slot2)
	slot3 = self._name_text_ctrl
	self._name = self._name_text_ctrl.get_value(slot2)
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function CoreXMLEditorNewDialog:on_cancel_button()
	self._done = true
	self._return_val = false
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function CoreXMLEditorNewDialog:get_value()
	return self._type, self._name
end

return 
