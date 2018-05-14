-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = CoreDBDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDBDialog = slot0
slot0 = CoreDBDialog

function slot1(self, type_to_pick, cb_self, cb, db)
	slot5 = {}
	self._browser_data = slot5
	slot5 = self._browser_data
	slot5.type_to_pick = type_to_pick
	slot5 = self._browser_data
	slot5.cb = cb
	slot5 = self._browser_data
	slot5.cb_self = cb_self
	slot5 = CoreDatabaseBrowser
	slot7 = slot5
	slot5 = slot5.new
	slot8 = self._browser_data
	slot9 = db
	slot5 = slot5(slot6, slot7, slot8)
	self._window = slot5

	return 
end

slot0.init = slot1
slot0 = CoreDBDialog

function slot1(self, t, dt)
	slot3 = self._window

	if slot3 then
		slot3 = self._window
		slot5 = slot3
		slot3 = slot3.update
		slot6 = t
		slot7 = dt

		slot3(slot4, slot5, slot6)
	end

	slot3 = self._browser_data
	slot3 = slot3.destroy

	if slot3 == "OK" then
		slot3 = nil
		self._window = slot3
		slot3 = self._browser_data
		slot3 = slot3.cb

		if slot3 then
			slot3 = self._browser_data
			slot3 = slot3.cb
			slot5 = self._browser_data
			slot5 = slot5.cb_self

			slot3(slot4)
		end

		slot3 = "OK"

		return slot3
	else
		slot3 = self._browser_data
		slot3 = slot3.destroy

		if slot3 then
			slot3 = nil
			self._window = slot3
			slot3 = "CANCEL"

			return slot3
		end
	end

	return 
end

slot0.update = slot1
slot0 = CoreDBDialog

function slot1(self)
	slot1 = self._browser_data
	slot1 = slot1.entry

	return slot1
end

slot0.get_value = slot1
slot0 = CoreDBDialog

function slot1(self)
	slot1 = self._window

	if slot1 then
		slot1 = self._window
		slot3 = slot1
		slot1 = slot1.close

		slot1(slot2)
	end

	return 
end

slot0.destroy = slot1
slot0 = CoreDatabaseBrowser

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowser = slot0
slot0 = CoreDatabaseBrowser
slot1 = true
slot0.LC_BUGFIX = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, browser_data, db)
	slot6 = "CoreDatabaseBrowser"

	min_exe_version(slot4, "1.0.0.7607")

	self._active_database = db or ProjectDatabase
	self._browser_data = browser_data
	slot5 = self

	self.create_main_frame(slot4)

	slot5 = self

	self.on_reload(slot4)

	slot5 = Application
	slot3 = Application.vista_userfolder_enabled(slot4)

	if slot3 then
		slot3 = EWS
		slot5 = slot3
		slot3 = slot3.MessageDialog
		slot6 = self._main_frame
		slot7 = "You cannot commit or edit files when the vista user folder is enabled. Run the database browser from the editor instead."
		slot8 = "Error"
		slot9 = "OK,ICON_ERROR"
		slot3 = slot3(slot4, slot5, slot6, slot7, slot8)
		slot5 = slot3
		slot3 = slot3.show_modal

		slot3(slot4)

		slot3 = managers
		slot3 = slot3.toolhub
		slot5 = slot3
		slot3 = slot3.close
		slot6 = "Database Browser"

		slot3(slot4, slot5)
	end

	slot3 = true
	self._dirty_flag = slot3
	slot5 = self
	slot3 = self.check_news
	slot6 = true

	slot3(slot4, slot5)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = open_editor

	if slot1 then
		slot1 = self._browser_data
	else
		slot1 = "Unit Editor"
		open_editor = slot1
	end

	slot1 = false

	return slot1
end

slot0.check_open = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	local style = "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE"
	slot2 = self._browser_data

	if slot2 then
		style = "FRAME_FLOAT_ON_PARENT,FRAME_TOOL_WINDOW,CAPTION"
	end

	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Frame
	slot5 = "Database Browser"
	slot6 = Vector3
	slot8 = 100
	slot9 = 400
	slot10 = 0
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = Vector3
	slot9 = 500
	slot10 = 500
	slot11 = 0
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = style
	slot9 = Global
	slot9 = slot9.frame
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8)
	self._main_frame = slot2
	slot2 = self._main_frame
	slot4 = slot2
	slot2 = slot2.set_icon
	slot5 = CoreEWS
	slot5 = slot5.image_path
	slot7 = "database_browser_16x16.png"

	slot2(slot3, slot5(slot6))

	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.MenuBar
	local menu_bar = slot2(slot3)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Menu
	slot6 = ""
	local file_menu = slot3(slot4, slot5)
	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "MOVE"
	slot8 = "Move\tCtrl+M"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "RELOAD"
	slot8 = "Reload\tCtrl+L"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "REMOVE"
	slot8 = "Remove\tCtrl+R"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "RENAME"
	slot8 = "Rename\tCtrl+N"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "IMPORT"
	slot8 = "Import XML"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "VIEW_METADATA"
	slot8 = "View Metadata"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "METADATA"
	slot8 = "Set Metadata"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_separator

	slot4(slot5)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "NEWS"
	slot8 = "Get Latest News"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = file_menu
	slot4 = file_menu.append_separator

	slot4(slot5)

	slot6 = file_menu
	slot4 = file_menu.append_item
	slot7 = "EXIT"
	slot8 = "Exit"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot6 = menu_bar
	slot4 = menu_bar.append
	slot7 = file_menu
	slot8 = "File"

	slot4(slot5, slot6, slot7)

	slot4 = self._browser_data

	if not slot4 then
		slot4 = EWS
		slot6 = slot4
		slot4 = slot4.Menu
		slot7 = ""
		slot4 = slot4(slot5, slot6)
		self._db_menu = slot4
		slot4 = self._db_menu
		slot6 = slot4
		slot4 = slot4.append_radio_item
		slot7 = "DB_PROJECT"
		slot8 = "Project"
		slot9 = ""

		slot4(slot5, slot6, slot7, slot8)

		slot4 = self._db_menu
		slot6 = slot4
		slot4 = slot4.append_radio_item
		slot7 = "DB_CORE"
		slot8 = "Core"
		slot9 = ""

		slot4(slot5, slot6, slot7, slot8)

		slot4 = self._db_menu
		slot6 = slot4
		slot4 = slot4.set_checked
		slot7 = "DB_PROJECT"
		slot8 = true

		slot4(slot5, slot6, slot7)

		slot6 = menu_bar
		slot4 = menu_bar.append
		slot7 = self._db_menu
		slot8 = "Database"

		slot4(slot5, slot6, slot7)
	end

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.Menu
	slot7 = ""
	slot4 = slot4(slot5, slot6)
	self._op_menu = slot4
	slot4 = self._op_menu
	slot6 = slot4
	slot4 = slot4.append_check_item
	slot7 = "OP_AUTO_CONVERT_TEXTURES"
	slot8 = "Auto Convert Textures"
	slot9 = ""

	slot4(slot5, slot6, slot7, slot8)

	slot4 = self._op_menu
	slot6 = slot4
	slot4 = slot4.set_checked
	slot7 = "OP_AUTO_CONVERT_TEXTURES"
	slot8 = true

	slot4(slot5, slot6, slot7)

	slot6 = menu_bar
	slot4 = menu_bar.append
	slot7 = self._op_menu
	slot8 = "Options"

	slot4(slot5, slot6, slot7)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.set_menu_bar
	slot7 = menu_bar

	slot4(slot5, slot6)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "MOVE"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_move"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "RELOAD"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_reload"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "REMOVE"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_remove"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "RENAME"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_rename"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "IMPORT"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_import_xml"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "METADATA"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_set_metadata"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "VIEW_METADATA"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_view_metadata"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "NEWS"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_check_news"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "EXIT"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_close"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "DB_PROJECT"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_set_db"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ProjectDatabase

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = "DB_CORE"
	slot8 = "EVT_COMMAND_MENU_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_set_db"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = CoreDatabase

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_CLOSE_WINDOW"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_close"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "VERTICAL"
	local main_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Notebook
	slot8 = self._main_frame
	slot9 = ""
	slot10 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9)
	self._main_notebook = slot5
	slot5 = self._main_notebook
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_NOTEBOOK_PAGE_CHANGING"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_notebook_changing"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = main_box
	slot5 = main_box.add
	slot8 = self._main_notebook
	slot9 = 2
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = {}
	self._search_box = slot5
	slot5 = self._search_box
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Panel
	slot9 = self._main_notebook
	slot10 = ""
	slot11 = ""
	slot6 = slot6(slot7, slot8, slot9, slot10)
	slot5.panel = slot6
	slot5 = self._search_box
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "VERTICAL"
	slot6 = slot6(slot7, slot8)
	slot5.panel_box = slot6
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.BoxSizer
	slot8 = "HORIZONTAL"
	local top_search_box = slot5(slot6, slot7)
	slot6 = self._search_box
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.ComboBox
	slot10 = self._search_box
	slot10 = slot10.panel
	slot11 = ""
	slot12 = ""
	slot13 = "CB_READONLY,CB_SORT"
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12)
	slot6.type_combobox = slot7
	slot6 = self._search_box
	slot6 = slot6.type_combobox
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = ""
	slot10 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_read_database"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = self
	slot6 = self.append_all_types
	slot9 = self._search_box
	slot9 = slot9.type_combobox

	slot6(slot7, slot8)

	slot6 = self._search_box
	slot6 = slot6.type_combobox
	slot8 = slot6
	slot6 = slot6.append
	slot9 = "[all]"

	slot6(slot7, slot8)

	slot8 = top_search_box
	slot6 = top_search_box.add
	slot9 = self._search_box
	slot9 = slot9.type_combobox
	slot10 = 1
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._search_box
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.TextCtrl
	slot10 = self._search_box
	slot10 = slot10.panel
	slot11 = ""
	slot12 = ""
	slot13 = "TE_CENTRE"
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12)
	slot6.search_text_ctrl = slot7
	slot6 = self._search_box
	slot6 = slot6.search_text_ctrl
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = ""
	slot10 = "EVT_COMMAND_TEXT_UPDATED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_search"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = top_search_box
	slot6 = top_search_box.add
	slot9 = self._search_box
	slot9 = slot9.search_text_ctrl
	slot10 = 2
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._search_box
	slot6 = slot6.panel_box
	slot8 = slot6
	slot6 = slot6.add
	slot9 = top_search_box
	slot10 = 0
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._search_box
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.ListBox
	slot10 = self._search_box
	slot10 = slot10.panel
	slot11 = "database_browser_search"
	slot12 = "LB_SORT,LB_EXTENDED"
	slot7 = slot7(slot8, slot9, slot10, slot11)
	slot6.list_box = slot7
	slot6 = self._search_box
	slot6 = slot6.list_box
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = ""
	slot10 = "EVT_COMMAND_LISTBOX_SELECTED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_select"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._browser_data

	if slot6 then
		slot6 = self._search_box
		slot6 = slot6.list_box
		slot8 = slot6
		slot6 = slot6.connect
		slot9 = ""
		slot10 = "EVT_COMMAND_LISTBOX_DOUBLECLICKED"
		slot11 = callback
		slot13 = self
		slot14 = self
		slot15 = "on_close"
		slot11 = slot11(slot12, slot13, slot14)
		slot12 = "OK"

		slot6(slot7, slot8, slot9, slot10, slot11)
	end

	slot6 = self._search_box
	slot6 = slot6.panel_box
	slot8 = slot6
	slot6 = slot6.add
	slot9 = self._search_box
	slot9 = slot9.list_box
	slot10 = 2
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._search_box
	slot6 = slot6.panel
	slot8 = slot6
	slot6 = slot6.set_sizer
	slot9 = self._search_box
	slot9 = slot9.panel_box

	slot6(slot7, slot8)

	slot6 = self._main_notebook
	slot8 = slot6
	slot6 = slot6.add_page
	slot9 = self._search_box
	slot9 = slot9.panel
	slot10 = "Search View"
	slot11 = true

	slot6(slot7, slot8, slot9, slot10)

	slot6 = {}
	self._tree_box = slot6
	slot6 = self._tree_box
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.Panel
	slot10 = self._main_notebook
	slot11 = ""
	slot12 = ""
	slot7 = slot7(slot8, slot9, slot10, slot11)
	slot6.panel = slot7
	slot6 = self._tree_box
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "VERTICAL"
	slot7 = slot7(slot8, slot9)
	slot6.panel_box = slot7
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "HORIZONTAL"
	local top_search_box = slot6(slot7, slot8)
	slot7 = self._tree_box
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.ComboBox
	slot11 = self._tree_box
	slot11 = slot11.panel
	slot12 = ""
	slot13 = ""
	slot14 = "CB_READONLY,CB_SORT"
	slot8 = slot8(slot9, slot10, slot11, slot12, slot13)
	slot7.type_combobox = slot8
	slot7 = self._tree_box
	slot7 = slot7.type_combobox
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "on_read_database"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ""

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = self
	slot7 = self.append_all_types
	slot10 = self._tree_box
	slot10 = slot10.type_combobox

	slot7(slot8, slot9)

	slot7 = self._tree_box
	slot7 = slot7.type_combobox
	slot9 = slot7
	slot7 = slot7.append
	slot10 = "[all]"

	slot7(slot8, slot9)

	slot9 = top_search_box
	slot7 = top_search_box.add
	slot10 = self._tree_box
	slot10 = slot10.type_combobox
	slot11 = 1
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._tree_box
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.TextCtrl
	slot11 = self._tree_box
	slot11 = slot11.panel
	slot12 = ""
	slot13 = ""
	slot14 = "TE_CENTRE"
	slot8 = slot8(slot9, slot10, slot11, slot12, slot13)
	slot7.search_text_ctrl = slot8
	slot7 = self._tree_box
	slot7 = slot7.search_text_ctrl
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_TEXT_UPDATED"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "on_search"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ""

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = top_search_box
	slot7 = top_search_box.add
	slot10 = self._tree_box
	slot10 = slot10.search_text_ctrl
	slot11 = 2
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._tree_box
	slot7 = slot7.panel_box
	slot9 = slot7
	slot7 = slot7.add
	slot10 = top_search_box
	slot11 = 0
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._tree_box
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.TreeCtrl
	slot11 = self._tree_box
	slot11 = slot11.panel
	slot12 = ""
	slot13 = "TR_MULTIPLE,TR_HAS_BUTTONS"
	slot8 = slot8(slot9, slot10, slot11, slot12)
	slot7.tree_ctrl = slot8
	slot7 = self._tree_box
	slot7 = slot7.tree_ctrl
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_TREE_SEL_CHANGED"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "on_tree_ctrl_change"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ""

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._browser_data

	if slot7 then
		slot7 = self._tree_box
		slot7 = slot7.tree_ctrl
		slot9 = slot7
		slot7 = slot7.connect
		slot10 = ""
		slot11 = "EVT_COMMAND_TREE_ITEM_ACTIVATED"
		slot12 = callback
		slot14 = self
		slot15 = self
		slot16 = "on_close"
		slot12 = slot12(slot13, slot14, slot15)
		slot13 = "OK"

		slot7(slot8, slot9, slot10, slot11, slot12)
	end

	slot7 = self._tree_box
	slot7 = slot7.panel_box
	slot9 = slot7
	slot7 = slot7.add
	slot10 = self._tree_box
	slot10 = slot10.tree_ctrl
	slot11 = 2
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._tree_box
	slot7 = slot7.panel
	slot9 = slot7
	slot7 = slot7.set_sizer
	slot10 = self._tree_box
	slot10 = slot10.panel_box

	slot7(slot8, slot9)

	slot7 = self._main_notebook
	slot9 = slot7
	slot7 = slot7.add_page
	slot10 = self._tree_box
	slot10 = slot10.panel
	slot11 = "Tree View"
	slot12 = false

	slot7(slot8, slot9, slot10, slot11)

	slot7 = {}
	self._local_box = slot7
	slot7 = self._local_box
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.Panel
	slot11 = self._main_notebook
	slot12 = ""
	slot13 = ""
	slot8 = slot8(slot9, slot10, slot11, slot12)
	slot7.panel = slot8
	slot7 = self._local_box
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.BoxSizer
	slot11 = "VERTICAL"
	slot8 = slot8(slot9, slot10)
	slot7.panel_box = slot8
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "HORIZONTAL"
	local top_local_box = slot7(slot8, slot9)
	slot8 = self._local_box
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.ComboBox
	slot12 = self._local_box
	slot12 = slot12.panel
	slot13 = ""
	slot14 = ""
	slot15 = "CB_READONLY,CB_SORT"
	slot9 = slot9(slot10, slot11, slot12, slot13, slot14)
	slot8.type_combobox = slot9
	slot8 = self._local_box
	slot8 = slot8.type_combobox
	slot10 = slot8
	slot8 = slot8.connect
	slot11 = ""
	slot12 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "on_read_database"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = ""

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot10 = self
	slot8 = self.append_all_types
	slot11 = self._local_box
	slot11 = slot11.type_combobox

	slot8(slot9, slot10)

	slot8 = self._local_box
	slot8 = slot8.type_combobox
	slot10 = slot8
	slot8 = slot8.append
	slot11 = "[all]"

	slot8(slot9, slot10)

	slot8 = self._local_box
	slot8 = slot8.type_combobox
	slot10 = slot8
	slot8 = slot8.set_value
	slot11 = "[all]"

	slot8(slot9, slot10)

	slot10 = top_local_box
	slot8 = top_local_box.add
	slot11 = self._local_box
	slot11 = slot11.type_combobox
	slot12 = 1
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = self._local_box
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.TextCtrl
	slot12 = self._local_box
	slot12 = slot12.panel
	slot13 = ""
	slot14 = ""
	slot15 = "TE_CENTRE"
	slot9 = slot9(slot10, slot11, slot12, slot13, slot14)
	slot8.search_text_ctrl = slot9
	slot8 = self._local_box
	slot8 = slot8.search_text_ctrl
	slot10 = slot8
	slot8 = slot8.connect
	slot11 = ""
	slot12 = "EVT_COMMAND_TEXT_UPDATED"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "on_search_local_changes"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = ""

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot10 = top_local_box
	slot8 = top_local_box.add
	slot11 = self._local_box
	slot11 = slot11.search_text_ctrl
	slot12 = 2
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = self._local_box
	slot8 = slot8.panel_box
	slot10 = slot8
	slot8 = slot8.add
	slot11 = top_local_box
	slot12 = 0
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = self._local_box
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.ListBox
	slot12 = self._local_box
	slot12 = slot12.panel
	slot13 = "database_browser_local"
	slot14 = "LB_SORT,LB_EXTENDED"
	slot9 = slot9(slot10, slot11, slot12, slot13)
	slot8.list_box = slot9
	slot8 = self._local_box
	slot8 = slot8.list_box
	slot10 = slot8
	slot8 = slot8.connect
	slot11 = ""
	slot12 = "EVT_COMMAND_LISTBOX_SELECTED"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "on_select"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = ""

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot10 = self
	slot8 = self.append_local_changes

	slot8(slot9)

	slot8 = self._local_box
	slot8 = slot8.panel_box
	slot10 = slot8
	slot8 = slot8.add
	slot11 = self._local_box
	slot11 = slot11.list_box
	slot12 = 2
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.BoxSizer
	slot11 = "HORIZONTAL"
	local bottom_local_box = slot8(slot9, slot10)
	slot9 = self._local_box
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Button
	slot13 = self._local_box
	slot13 = slot13.panel
	slot14 = "Commit"
	slot15 = ""
	slot16 = ""
	slot10 = slot10(slot11, slot12, slot13, slot14, slot15)
	slot9.commit_btn = slot10
	slot9 = self._local_box
	slot9 = slot9.commit_btn
	slot11 = slot9
	slot9 = slot9.connect
	slot12 = ""
	slot13 = "EVT_COMMAND_BUTTON_CLICKED"
	slot14 = callback
	slot16 = self
	slot17 = self
	slot18 = "on_commit_btn"
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = ""

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot11 = bottom_local_box
	slot9 = bottom_local_box.add
	slot12 = self._local_box
	slot12 = slot12.commit_btn
	slot13 = 1
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = self._local_box
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Button
	slot13 = self._local_box
	slot13 = slot13.panel
	slot14 = "Revert"
	slot15 = ""
	slot16 = ""
	slot10 = slot10(slot11, slot12, slot13, slot14, slot15)
	slot9.revert_btn = slot10
	slot9 = self._local_box
	slot9 = slot9.revert_btn
	slot11 = slot9
	slot9 = slot9.connect
	slot12 = ""
	slot13 = "EVT_COMMAND_BUTTON_CLICKED"
	slot14 = callback
	slot16 = self
	slot17 = self
	slot18 = "on_revert_btn"
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = ""

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot11 = bottom_local_box
	slot9 = bottom_local_box.add
	slot12 = self._local_box
	slot12 = slot12.revert_btn
	slot13 = 1
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = self._local_box
	slot9 = slot9.panel_box
	slot11 = slot9
	slot9 = slot9.add
	slot12 = bottom_local_box
	slot13 = 0
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = self._local_box
	slot9 = slot9.panel
	slot11 = slot9
	slot9 = slot9.set_sizer
	slot12 = self._local_box
	slot12 = slot12.panel_box

	slot9(slot10, slot11)

	slot9 = self._browser_data

	if not slot9 then
		slot9 = self._main_notebook
		slot11 = slot9
		slot9 = slot9.add_page
		slot12 = self._local_box
		slot12 = slot12.panel
		slot13 = "Local Changes"
		slot14 = false

		slot9(slot10, slot11, slot12, slot13)
	else
		slot9 = self._local_box
		slot9 = slot9.panel
		slot11 = slot9
		slot9 = slot9.set_visible
		slot12 = false

		slot9(slot10, slot11)
	end

	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.Panel
	slot12 = self._main_frame
	slot13 = ""
	slot14 = ""
	slot9 = slot9(slot10, slot11, slot12, slot13)
	self._preview_panel = slot9
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.BoxSizer
	slot12 = "VERTICAL"
	local text_box = slot9(slot10, slot11)
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.StaticText
	slot13 = self._preview_panel
	slot14 = "No preview!"
	slot15 = ""
	slot16 = "ALIGN_CENTER_VERTICAL"
	local msg = slot10(slot11, slot12, slot13, slot14, slot15)
	slot13 = text_box
	slot11 = text_box.add
	slot14 = msg
	slot15 = 1
	slot16 = 4
	slot17 = "EXPAND,ALL"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._preview_panel
	slot13 = slot11
	slot11 = slot11.set_sizer
	slot14 = text_box

	slot11(slot12, slot13)

	slot13 = main_box
	slot11 = main_box.add
	slot14 = self._preview_panel
	slot15 = 1
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.XMLTextCtrl
	slot14 = self._main_frame
	slot15, slot16, slot17 = nil
	slot18 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17)
	self._preview_text_ctrl = slot11
	slot11 = self._preview_text_ctrl
	slot13 = slot11
	slot11 = slot11.text_ctrl
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_visible
	slot14 = false

	slot11(slot12, slot13)

	slot13 = main_box
	slot11 = main_box.add
	slot14 = self._preview_text_ctrl
	slot16 = slot14
	slot14 = slot14.text_ctrl
	slot14 = slot14(slot15)
	slot15 = 1
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.BitmapButton
	slot14 = self._main_frame
	slot15 = CoreEWS
	slot15 = slot15.image_path
	slot17 = "magnifying_glass_32x32.png"
	slot15 = slot15(slot16)
	slot16 = ""
	slot17 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._preview_image = slot11
	slot11 = self._preview_image
	slot13 = slot11
	slot11 = slot11.set_visible
	slot14 = false

	slot11(slot12, slot13)

	slot13 = main_box
	slot11 = main_box.add
	slot14 = self._preview_image
	slot15 = 1
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._browser_data

	if slot11 then
		slot11 = EWS
		slot13 = slot11
		slot11 = slot11.BoxSizer
		slot14 = "HORIZONTAL"
		local button_box = slot11(slot12, slot13)
		slot12 = EWS
		slot14 = slot12
		slot12 = slot12.Button
		slot15 = self._main_frame
		slot16 = "OK"
		slot17 = ""
		slot18 = ""
		slot12 = slot12(slot13, slot14, slot15, slot16, slot17)
		self._ok_btn = slot12
		slot12 = self._ok_btn
		slot14 = slot12
		slot12 = slot12.connect
		slot15 = ""
		slot16 = "EVT_COMMAND_BUTTON_CLICKED"
		slot17 = callback
		slot19 = self
		slot20 = self
		slot21 = "on_close"
		slot17 = slot17(slot18, slot19, slot20)
		slot18 = "OK"

		slot12(slot13, slot14, slot15, slot16, slot17)

		slot14 = button_box
		slot12 = button_box.add
		slot15 = self._ok_btn
		slot16 = 1
		slot17 = 0
		slot18 = "EXPAND"

		slot12(slot13, slot14, slot15, slot16, slot17)

		slot12 = EWS
		slot14 = slot12
		slot12 = slot12.Button
		slot15 = self._main_frame
		slot16 = "Cancel"
		slot17 = ""
		slot18 = ""
		slot12 = slot12(slot13, slot14, slot15, slot16, slot17)
		self._cancel_btn = slot12
		slot12 = self._cancel_btn
		slot14 = slot12
		slot12 = slot12.connect
		slot15 = ""
		slot16 = "EVT_COMMAND_BUTTON_CLICKED"
		slot17 = callback
		slot19 = self
		slot20 = self
		slot21 = "on_close"
		slot17 = slot17(slot18, slot19, slot20)
		slot18 = ""

		slot12(slot13, slot14, slot15, slot16, slot17)

		slot14 = button_box
		slot12 = button_box.add
		slot15 = self._cancel_btn
		slot16 = 1
		slot17 = 0
		slot18 = "EXPAND"

		slot12(slot13, slot14, slot15, slot16, slot17)

		slot14 = main_box
		slot12 = main_box.add
		slot15 = button_box
		slot16 = 0
		slot17 = 0
		slot18 = "EXPAND"

		slot12(slot13, slot14, slot15, slot16, slot17)
	end

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.FileDialog
	slot14 = self._main_frame
	slot15 = "Import XML"
	slot16 = Application
	slot18 = slot16
	slot16 = slot16.base_path
	slot16 = slot16(slot17)
	slot17 = ""
	slot18 = "XML files (*.xml)|*.xml"
	slot19 = "OPEN,FILE_MUST_EXIST"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	self._open_xml_file_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "This will delete the selected entry(s). Proceed?"
	slot16 = "Remove"
	slot17 = "YES_NO,ICON_QUESTION"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._remove_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "The path you have chosen is invalid!"
	slot16 = "Error"
	slot17 = "OK,ICON_ERROR"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._invalid_path_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "Do you want to revert the selected entry(s)?"
	slot16 = "Revert"
	slot17 = "YES_NO,ICON_QUESTION"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._revert_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "Do you want to commit the selected entry(s)?"
	slot16 = "Commit"
	slot17 = "YES_NO,ICON_QUESTION"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._commit_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "This option is not available in this mode."
	slot16 = "Unavailable"
	slot17 = "OK,ICON_INFORMATION"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._not_available_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "The database is dirty and it needs to be reloaded."
	slot16 = "Database"
	slot17 = "OK,ICON_INFORMATION"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._dirty_database_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "Duplicated entry!"
	slot16 = "Error"
	slot17 = "OK,ICON_ERROR"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._rename_error_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "Could not commit the selected entry(s)!"
	slot16 = "Error"
	slot17 = "OK,ICON_ERROR"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._commit_error_dialog = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.MessageDialog
	slot14 = self._main_frame
	slot15 = "You need to have at least one node in your XML file."
	slot16 = "Error"
	slot17 = "OK,ICON_ERROR"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._no_nodes_dialog = slot11
	slot11 = CoreDatabaseBrowserMoveDialog
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self
	slot15 = self._main_frame
	slot11 = slot11(slot12, slot13, slot14)
	self._move_dialog = slot11
	slot11 = CoreDatabaseBrowserImportDialog
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self
	slot15 = self._main_frame
	slot11 = slot11(slot12, slot13, slot14)
	self._import_dialog = slot11
	slot11 = CoreDatabaseBrowserMetadataDialog
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self._main_frame
	slot11 = slot11(slot12, slot13)
	self._metadata_dialog = slot11
	slot11 = CoreDatabaseBrowserInputDialog
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self._main_frame
	slot11 = slot11(slot12, slot13)
	self._comment_dialog = slot11
	slot11 = CoreDatabaseBrowserRenameDialog
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self._main_frame
	slot11 = slot11(slot12, slot13)
	self._rename_dialog = slot11
	slot11 = self._main_frame
	slot13 = slot11
	slot11 = slot11.set_sizer
	slot14 = main_box

	slot11(slot12, slot13)

	slot11 = self._main_frame
	slot13 = slot11
	slot11 = slot11.set_visible
	slot14 = true

	slot11(slot12, slot13)

	return 
end

slot0.create_main_frame = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, data, event)
	slot3 = self._db_menu
	slot5 = slot3
	slot3 = slot3.set_checked
	slot6 = "DB_PROJECT"
	slot7 = false

	slot3(slot4, slot5, slot6)

	slot3 = self._db_menu
	slot5 = slot3
	slot3 = slot3.set_checked
	slot6 = "DB_CORE"
	slot7 = false

	slot3(slot4, slot5, slot6)

	slot3 = self._db_menu
	slot5 = slot3
	slot3 = slot3.set_checked
	slot8 = event
	slot6 = event.get_id
	slot6 = slot6(slot7)
	slot7 = true

	slot3(slot4, slot5, slot6)

	self._active_database = data
	slot5 = self
	slot3 = self.on_read_database

	slot3(slot4)

	return 
end

slot0.on_set_db = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot3 = self
	slot1 = self.check_news

	slot1(slot2)

	return 
end

slot0.on_check_news = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, new_only)
	local news = nil

	if new_only then
		slot3 = managers
		slot3 = slot3.news
		slot5 = slot3
		slot3 = slot3.get_news
		slot6 = "database_browser"
		slot7 = self._main_frame
		slot3 = slot3(slot4, slot5, slot6)
		news = slot3
	else
		slot3 = managers
		slot3 = slot3.news
		slot5 = slot3
		slot3 = slot3.get_old_news
		slot6 = "database_browser"
		slot7 = self._main_frame
		slot3 = slot3(slot4, slot5, slot6)
		news = slot3
	end

	if news then
		local str = nil
		slot4 = ipairs
		slot6 = news
		slot4, slot5, slot6 = slot4(slot5)

		for _, n in slot4, slot5, slot6 do
			if not str then
				str = n
			else
				slot9 = str
				slot10 = "\n"
				slot11 = n
				str = slot9 .. slot10 .. slot11
			end
		end

		slot4 = EWS
		slot6 = slot4
		slot4 = slot4.MessageDialog
		slot7 = self._main_frame
		slot8 = str
		slot9 = "New Features!"
		slot10 = "OK,ICON_INFORMATION"
		slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
		slot6 = slot4
		slot4 = slot4.show_modal

		slot4(slot5)
	end

	return 
end

slot0.check_news = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._dirty_flag

	if slot1 then
		slot1 = cat_print
		slot3 = "debug"
		slot4 = "The database is dirty and it needs to be reloaded. RELOADING!"

		slot1(slot2, slot3)
	end

	slot3 = self
	slot1 = self.on_reload

	slot1(slot2)

	slot1 = true
	self._dirty_flag = slot1

	return 
end

slot0.on_dirty_entrys = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot3 = self
	slot1 = self.append_local_changes

	slot1(slot2)

	return 
end

slot0.on_search_local_changes = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)
	slot4 = entry.name(slot5)
	slot7 = self._local_box.search_text_ctrl

	return string.find(slot3, self._local_box.search_text_ctrl.get_value(entry)) ~= nil
end

slot0.filter_local_changes = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._active_database
	slot3 = slot1
	slot1 = slot1.local_changes
	local db_changes = slot1(slot2)
	local change_table = {}
	slot3 = {}
	self._local_changes = slot3
	slot3 = self._local_box
	slot3 = slot3.list_box
	slot5 = slot3
	slot3 = slot3.clear

	slot3(slot4)

	slot3 = ipairs
	slot5 = db_changes
	slot3, slot4, slot5 = slot3(slot4)

	for _, change in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		slot8 = self._local_box
		slot8 = slot8.type_combobox
		slot10 = slot8
		slot8 = slot8.get_value
		slot8 = slot8(slot9)
	end

	slot3 = pairs
	slot5 = change_table
	slot3, slot4, slot5 = slot3(slot4)

	for describe, struct in slot3, slot4, slot5 do
		slot8 = describe
		slot9 = " - "
		slot10 = struct.str
		local str = slot8 .. slot9 .. slot10
		slot9 = self._local_changes
		slot9[str] = struct
		slot9 = self._local_box
		slot9 = slot9.list_box
		slot11 = slot9
		slot9 = slot9.append
		slot12 = str

		slot9(slot10, slot11)
	end

	return 
end

slot0.append_local_changes = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, str)
	local comment = ""
	slot3 = string
	slot3 = slot3.gmatch
	slot5 = str
	slot6 = "[%w%s_]+"
	slot3, slot4, slot5 = slot3(slot4, slot5)

	for word in slot3, slot4, slot5 do
		slot7 = comment
		slot8 = word
		comment = slot7 .. slot8
	end

	return comment
end

slot0.format_comment = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)

	-- Decompilation error in this vicinity:
	slot4 = entry
	slot2 = entry.property
	slot5 = "platform"
	slot2 = slot2(slot3, slot4)
end

slot0.is_entry_raw = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._op_menu
	slot3 = slot1
	slot1 = slot1.is_checked
	slot4 = "OP_AUTO_CONVERT_TEXTURES"
	slot1 = slot1(slot2, slot3)

	return 
end

slot0.on_commit_btn = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._local_box
	slot1 = slot1.list_box
	slot3 = slot1
	slot1 = slot1.selected_indices
	slot1 = slot1(slot2)
	slot1 = #slot1
	slot2 = 0

	if slot2 < slot1 then
		slot1 = self._revert_dialog
		slot3 = slot1
		slot1 = slot1.show_modal
		slot1 = slot1(slot2)

		if slot1 == "ID_YES" then
			local flag = nil
			local revert_table = {}
			slot3 = EWS
			slot5 = slot3
			slot3 = slot3.ProgressDialog
			slot6 = self._main_frame
			slot7 = "Revert"
			slot8 = "Reverting data..."
			slot9 = 100
			slot10 = "PD_AUTO_HIDE,PD_SMOOTH"
			local progress = slot3(slot4, slot5, slot6, slot7, slot8, slot9)
			slot6 = progress
			slot4 = progress.update_bar
			slot7 = 0

			slot4(slot5, slot6)

			slot4 = ipairs
			slot6 = self._local_box
			slot6 = slot6.list_box
			slot8 = slot6
			slot6 = slot6.selected_indices
			slot4, slot5, slot6 = slot4(slot6(slot7))

			for _, id in slot4, slot5, slot6 do
				slot9 = tostring
				slot11 = id
				slot9 = slot9(slot10)
				slot10 = self._local_box
				slot10 = slot10.list_box
				slot12 = slot10
				slot10 = slot10.get_string
				slot13 = id
				slot10 = slot10(slot11, slot12)
				revert_table[slot9] = slot10
			end

			slot6 = progress
			slot4 = progress.update_bar
			slot7 = 50

			slot4(slot5, slot6)

			slot4 = pairs
			slot6 = revert_table
			slot4, slot5, slot6 = slot4(slot5)

			for id_str, entry in slot4, slot5, slot6 do
				slot9 = false
				self._dirty_flag = slot9
				slot9 = self._active_database
				slot11 = slot9
				slot9 = slot9.revert_changes
				slot12 = self._local_changes
				slot12 = slot12[entry]
				slot12 = slot12.entry
				slot9 = slot9(slot10, slot11)

				if not slot9 then
					slot11 = self
					slot9 = self.append_local_changes

					slot9(slot10)

					flag = true

					break
				end

				slot11 = self
				slot9 = self.append_local_changes

				slot9(slot10)
			end

			if flag then
				slot4 = EWS
				slot6 = slot4
				slot4 = slot4.MessageDialog
				slot7 = self._main_frame
				slot8 = "Could not revert the selected entry(s)!"
				slot9 = "Error"
				slot10 = "OK,ICON_ERROR"
				slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
				slot6 = slot4
				slot4 = slot4.show_modal

				slot4(slot5)
			end

			slot4 = self._active_database
			slot6 = slot4
			slot4 = slot4.load

			slot4(slot5)

			slot6 = self
			slot4 = self.on_read_database

			slot4(slot5)

			slot6 = progress
			slot4 = progress.update_bar
			slot7 = 100

			slot4(slot5, slot6)
		end
	end

	return 
end

slot0.on_revert_btn = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._active_database
	slot3 = slot1
	slot1 = slot1.load

	slot1(slot2)

	slot3 = self
	slot1 = self.append_local_changes

	slot1(slot2)

	slot3 = self
	slot1 = self.on_read_database

	slot1(slot2)

	return 
end

slot0.on_update_btn = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._browser_data

	if not slot1 then
		slot1 = self._open_xml_file_dialog
		slot3 = slot1
		slot1 = slot1.show_modal
		slot1 = slot1(slot2)
	else
		slot1 = self._not_available_dialog
		slot3 = slot1
		slot1 = slot1.show_modal

		slot1(slot2)
	end

	return 
end

slot0.on_import_xml = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, node, parent)
	slot3 = pairs
	slot7 = parent
	slot5 = parent.parameter_map
	slot3, slot4, slot5 = slot3(slot5(slot6))

	for key, value in slot3, slot4, slot5 do
		slot10 = node
		slot8 = node.set_parameter
		slot11 = key
		slot12 = value

		slot8(slot9, slot10, slot11)
	end

	slot5 = parent
	slot3 = parent.children
	slot3, slot4, slot5 = slot3(slot4)

	for child in slot3, slot4, slot5 do
		slot9 = self
		slot7 = self.create_node
		slot12 = node
		slot10 = node.make_child
		slot15 = child
		slot13 = child.name
		slot10 = slot10(slot11, slot13(slot14))
		slot11 = child

		slot7(slot8, slot9, slot10)
	end

	return 
end

slot0.create_node = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = {}
	self._entrys = slot1

	local function apply_type_filter(type_combobox, dest_type_combobox)

		-- Decompilation error in this vicinity:
		slot4 = type_combobox
		slot2 = type_combobox.get_value
		local t = slot2(slot3)
		slot6 = dest_type_combobox
		slot4 = dest_type_combobox.set_value
		slot7 = t

		slot4(slot5, slot6)

		slot4 = entries
		slot5 = t

		return slot4, slot5
	end

	local data_table, database_type = nil
	slot4 = self._main_notebook
	slot6 = slot4
	slot4 = slot4.get_current_page
	local current_page = slot4(slot5)
	slot5 = self._main_notebook
	slot7 = slot5
	slot5 = slot5.get_page
	slot8 = 0
	slot5 = slot5(slot6, slot7)

	if current_page == slot5 then
		slot5 = apply_type_filter
		slot7 = self._search_box
		slot7 = slot7.type_combobox
		slot8 = self._tree_box
		slot8 = slot8.type_combobox
		slot5, slot6 = slot5(slot6, slot7)
		database_type = slot6
		data_table = slot5
	else
		slot5 = self._main_notebook
		slot7 = slot5
		slot5 = slot5.get_page
		slot8 = 1
		slot5 = slot5(slot6, slot7)

		if current_page == slot5 then
			slot5 = apply_type_filter
			slot7 = self._tree_box
			slot7 = slot7.type_combobox
			slot8 = self._search_box
			slot8 = slot8.type_combobox
			slot5, slot6 = slot5(slot6, slot7)
			database_type = slot6
			data_table = slot5
		end
	end

	slot5 = ipairs
	slot7 = data_table or {}
	slot5, slot6, slot7 = slot5(slot6)

	for _, entry in slot5, slot6, slot7 do

		-- Decompilation error in this vicinity:
		slot10 = self._browser_data
	end

	slot7 = self
	slot5 = self.on_search

	slot5(slot6)

	return 
end

slot0.on_read_database = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)
	slot4 = entry
	slot2 = entry.type
	slot2 = slot2(slot3)
	slot3 = " - "
	slot6 = entry
	slot4 = entry.name
	slot4 = slot4(slot5)
	local str = slot2 .. slot3 .. slot4
	slot3 = pairs
	slot7 = entry
	slot5 = entry.properties
	slot3, slot4, slot5 = slot3(slot5(slot6))

	for key, value in slot3, slot4, slot5 do
		slot8 = str
		slot9 = " : "
		slot10 = value
		str = slot8 .. slot9 .. slot10
	end

	return str
end

slot0.create_unique_name = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, selected_type, selected)
	local str = ""
	slot4 = self._entrys
	local entry = slot4[selected]

	if entry then
		slot5 = 1
		slot8 = entry
		slot6 = entry.num_metadatas
		slot6 = slot6(slot7)
		slot7 = 1

		for i = slot5, slot6, slot7 do
			slot11 = entry
			slot9 = entry.metadata_key
			slot12 = i - 1
			local meta_key = slot9(slot10, slot11)
			slot12 = entry
			slot10 = entry.metadata_value
			slot13 = i - 1
			local meta_value = slot10(slot11, slot12)
			slot11 = str
			slot12 = meta_key
			slot13 = "->"
			slot14 = meta_value
			slot15 = "\n"
			str = slot11 .. slot12 .. slot13 .. slot14 .. slot15
		end
	end

	return str
end

slot0.get_meta_data = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	local str = nil
	slot2 = self._main_notebook
	slot4 = slot2
	slot2 = slot2.get_current_page
	slot2 = slot2(slot3)
	slot3 = self._main_notebook
	slot5 = slot3
	slot3 = slot3.get_page
	slot6 = 0
	slot3 = slot3(slot4, slot5)

	if slot2 == slot3 then
		slot2 = self._search_box
		slot2 = slot2.list_box
		slot4 = slot2
		slot2 = slot2.selected_indices
		slot2 = slot2(slot3)
		slot2 = #slot2
		slot3 = 0

		if slot3 < slot2 then
			slot2 = 1
			slot3 = self._search_box
			slot3 = slot3.list_box
			slot5 = slot3
			slot3 = slot3.selected_indices
			slot3 = slot3(slot4)
			slot3 = #slot3
			slot4 = 1

			for i = slot2, slot3, slot4 do
				slot6 = self._search_box
				slot6 = slot6.list_box
				slot8 = slot6
				slot6 = slot6.get_string
				slot9 = self._search_box
				slot9 = slot9.list_box
				slot11 = slot9
				slot9 = slot9.selected_indices
				slot9 = slot9(slot10)
				slot9 = slot9[i]
				local selected = slot6(slot7, slot8)
				slot7 = self._active_database
				slot9 = slot7
				slot7 = slot7.lookup
				slot10 = self._entrys
				slot10 = slot10[selected]
				slot12 = slot10
				slot10 = slot10.type
				slot10 = slot10(slot11)
				slot11 = self._entrys
				slot11 = slot11[selected]
				slot13 = slot11
				slot11 = slot11.name
				slot11 = slot11(slot12)
				slot12 = self._entrys
				slot12 = slot12[selected]
				slot14 = slot12
				slot12 = slot12.properties
				local entry = slot7(slot8, slot9, slot10, slot12(slot13))
				slot8 = pairs
				slot12 = entry
				slot10 = entry.metadatas
				slot8, slot9, slot10 = slot8(slot10(slot11))

				for k, v in slot8, slot9, slot10 do
					str = (str or "") .. k .. "->" .. v .. "\n"
				end
			end
		end
	else
		slot2 = self._tree_box
		slot2 = slot2.tree_ctrl
		slot4 = slot2
		slot2 = slot2.selected_items
		local ids = slot2(slot3)
		slot3 = #ids
		slot4 = 0

		if slot4 < slot3 then
			slot3 = 1
			slot4 = #ids
			slot5 = 1

			for i = slot3, slot4, slot5 do
				slot7 = self._tree_box
				slot7 = slot7.tree_ctrl
				slot9 = slot7
				slot7 = slot7.get_item_text
				slot10 = ids[i]
				local selected = slot7(slot8, slot9)
				slot8 = self._active_database
				slot10 = slot8
				slot8 = slot8.lookup
				slot11 = self._entrys
				slot11 = slot11[selected]
				slot13 = slot11
				slot11 = slot11.type
				slot11 = slot11(slot12)
				slot12 = self._entrys
				slot12 = slot12[selected]
				slot14 = slot12
				slot12 = slot12.name
				slot12 = slot12(slot13)
				slot13 = self._entrys
				slot13 = slot13[selected]
				slot15 = slot13
				slot13 = slot13.properties
				local entry = slot8(slot9, slot10, slot11, slot13(slot14))
				slot9 = pairs
				slot13 = entry
				slot11 = entry.metadatas
				slot9, slot10, slot11 = slot9(slot11(slot12))

				for k, v in slot9, slot10, slot11 do
					str = (str or "") .. k .. "->" .. v .. "\n"
				end
			end
		end
	end

	slot8 = "OK,ICON_INFORMATION"
	slot4 = EWS.MessageDialog(slot3, EWS, self._main_frame, str or "No metadata!", "Metadata")

	EWS.MessageDialog(slot3, EWS, self._main_frame, str or "No metadata!", "Metadata").show_modal(slot3)

	return 
end

slot0.on_view_metadata = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_notebook
	slot3 = slot1
	slot1 = slot1.get_current_page
	slot1 = slot1(slot2)
	slot2 = self._main_notebook
	slot4 = slot2
	slot2 = slot2.get_page
	slot5 = 0
	slot2 = slot2(slot3, slot4)

	if slot1 == slot2 then
		slot1 = self._search_box
		slot1 = slot1.list_box
		slot3 = slot1
		slot1 = slot1.selected_indices
		slot1 = slot1(slot2)
		slot1 = #slot1
		slot2 = 0

		if slot2 < slot1 then
			slot1 = self._metadata_dialog
			slot3 = slot1
			slot1 = slot1.show_modal
			slot1 = slot1(slot2)

			if slot1 then
				slot1 = 1
				slot2 = self._search_box
				slot2 = slot2.list_box
				slot4 = slot2
				slot2 = slot2.selected_indices
				slot2 = slot2(slot3)
				slot2 = #slot2
				slot3 = 1

				for i = slot1, slot2, slot3 do
					slot5 = self._search_box
					slot5 = slot5.list_box
					slot7 = slot5
					slot5 = slot5.get_string
					slot8 = self._search_box
					slot8 = slot8.list_box
					slot10 = slot8
					slot8 = slot8.selected_indices
					slot8 = slot8(slot9)
					slot8 = slot8[i]
					local selected = slot5(slot6, slot7)
					slot6 = self._metadata_dialog
					slot8 = slot6
					slot6 = slot6.get_value
					local key, value = slot6(slot7)
					slot8 = self._active_database
					slot10 = slot8
					slot8 = slot8.lookup
					slot11 = self._entrys
					slot11 = slot11[selected]
					slot13 = slot11
					slot11 = slot11.type
					slot11 = slot11(slot12)
					slot12 = self._entrys
					slot12 = slot12[selected]
					slot14 = slot12
					slot12 = slot12.name
					slot12 = slot12(slot13)
					slot13 = self._entrys
					slot13 = slot13[selected]
					slot15 = slot13
					slot13 = slot13.properties
					local entry = slot8(slot9, slot10, slot11, slot13(slot14))

					if value == "" then
						slot9 = self._active_database
						slot11 = slot9
						slot9 = slot9.clear_metadata
						slot12 = entry
						slot13 = key

						slot9(slot10, slot11, slot12)

						slot9 = false
						self._dirty_flag = slot9
						slot9 = self._active_database
						slot11 = slot9
						slot9 = slot9.save

						slot9(slot10)
					else
						slot9 = self._active_database
						slot11 = slot9
						slot9 = slot9.set_metadata
						slot12 = entry
						slot13 = key
						slot14 = value

						slot9(slot10, slot11, slot12, slot13)

						slot9 = false
						self._dirty_flag = slot9
						slot9 = self._active_database
						slot11 = slot9
						slot9 = slot9.save

						slot9(slot10)
					end
				end
			end
		end
	else
		slot1 = self._tree_box
		slot1 = slot1.tree_ctrl
		slot3 = slot1
		slot1 = slot1.selected_items
		local ids = slot1(slot2)
		slot2 = #ids
		slot3 = 0

		if slot3 < slot2 then
			slot2 = self._metadata_dialog
			slot4 = slot2
			slot2 = slot2.show_modal
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = 1
				slot3 = #ids
				slot4 = 1

				for i = slot2, slot3, slot4 do
					slot6 = self._tree_box
					slot6 = slot6.tree_ctrl
					slot8 = slot6
					slot6 = slot6.get_item_text
					slot9 = ids[i]
					local selected = slot6(slot7, slot8)
					slot7 = self._metadata_dialog
					slot9 = slot7
					slot7 = slot7.get_value
					local key, value = slot7(slot8)
					slot9 = self._active_database
					slot11 = slot9
					slot9 = slot9.lookup
					slot12 = self._entrys
					slot12 = slot12[selected]
					slot14 = slot12
					slot12 = slot12.type
					slot12 = slot12(slot13)
					slot13 = self._entrys
					slot13 = slot13[selected]
					slot15 = slot13
					slot13 = slot13.name
					slot13 = slot13(slot14)
					slot14 = self._entrys
					slot14 = slot14[selected]
					slot16 = slot14
					slot14 = slot14.properties
					local entry = slot9(slot10, slot11, slot12, slot14(slot15))

					if value == "" then
						slot10 = self._active_database
						slot12 = slot10
						slot10 = slot10.clear_metadata
						slot13 = entry
						slot14 = key

						slot10(slot11, slot12, slot13)

						slot10 = false
						self._dirty_flag = slot10
						slot10 = self._active_database
						slot12 = slot10
						slot10 = slot10.save

						slot10(slot11)
					else
						slot10 = self._active_database
						slot12 = slot10
						slot10 = slot10.set_metadata
						slot13 = entry
						slot14 = key
						slot15 = value

						slot10(slot11, slot12, slot13, slot14)

						slot10 = false
						self._dirty_flag = slot10
						slot10 = self._active_database
						slot12 = slot10
						slot10 = slot10.save

						slot10(slot11)
					end
				end
			end
		end
	end

	slot1 = self._active_database
	slot3 = slot1
	slot1 = slot1.load

	slot1(slot2)

	slot3 = self
	slot1 = self.on_read_database

	slot1(slot2)

	return 
end

slot0.on_set_metadata = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, gui)
	slot2 = self._browser_data

	if slot2 then
		slot2 = self._browser_data
		slot2 = slot2.type_to_pick
	else
		slot2 = self._active_database
		slot4 = slot2
		slot2 = slot2.all
		slot5 = false
		local data_table = slot2(slot3, slot4)
		local name_table = {}
		slot4 = ipairs
		slot6 = data_table
		slot4, slot5, slot6 = slot4(slot5)

		for _, entry in slot4, slot5, slot6 do
			slot11 = entry
			slot9 = entry.type
			slot9 = slot9(slot10)
			slot9 = name_table[slot9]

			if not slot9 then
				slot11 = entry
				slot9 = entry.type
				slot9 = slot9(slot10)
				name_table[slot9] = entry
				slot11 = gui
				slot9 = gui.append
				slot14 = entry
				slot12 = entry.type

				slot9(slot10, slot12(slot13))

				slot11 = gui
				slot9 = gui.set_value
				slot14 = entry
				slot12 = entry.type

				slot9(slot10, slot12(slot13))
			end
		end

		name_table = nil
	end

	return 
end

slot0.append_all_types = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, newpos)
	slot2 = self._main_frame

	if slot2 then
		slot2 = self._main_frame
		slot4 = slot2
		slot2 = slot2.set_position
		slot5 = newpos

		slot2(slot3, slot4)
	end

	return 
end

slot0.set_position = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, custom_data, event_object)
	slot3 = self._browser_data

	if slot3 then
		slot5 = self
		slot3 = self.close

		slot3(slot4)

		slot3 = self._browser_data
		slot3.destroy = custom_data
	else
		slot3 = managers
		slot3 = slot3.toolhub
		slot5 = slot3
		slot3 = slot3.close
		slot6 = "Database Browser"

		slot3(slot4, slot5)
	end

	return 
end

slot0.on_close = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = alive
	slot3 = self._main_frame
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._main_frame
		slot3 = slot1
		slot1 = slot1.destroy

		slot1(slot2)

		slot1 = nil
		self._main_frame = slot1
	end

	return 
end

slot0.destroy = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_frame

	if slot1 then
		slot1 = self._main_frame
		slot3 = slot1
		slot1 = slot1.destroy

		slot1(slot2)

		slot1 = self._browser_data

		if not slot1 then
			slot1 = nil
			open_editor = slot1
		end
	end

	return 
end

slot0.close = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, t, dt)
	slot3 = self._search_flag

	if slot3 then
		slot5 = self
		slot3 = self.on_read_database

		slot3(slot4)

		slot5 = self
		slot3 = self.on_search

		slot3(slot4)

		slot3 = nil
		self._search_flag = slot3
	end

	return 
end

slot0.update = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot3 = self
	slot1 = self.on_read_database

	slot1(slot2)

	return 
end

slot0.on_reload = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = true
	self._search_flag = slot1

	return 
end

slot0.on_notebook_changing = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._search_box
	slot1 = slot1.list_box
	slot3 = slot1
	slot1 = slot1.selected_indices
	slot1 = slot1(slot2)
	slot1 = #slot1

	if slot1 == 1 then
		slot1 = self._search_box
		slot1 = slot1.list_box
		slot3 = slot1
		slot1 = slot1.get_string
		slot4 = self._search_box
		slot4 = slot4.list_box
		slot6 = slot4
		slot4 = slot4.selected_indices
		slot4 = slot4(slot5)
		slot4 = slot4[1]
		local selected = slot1(slot2, slot3)
		slot4 = self
		slot2 = self.update_preview
		slot5 = self._entrys
		slot5 = slot5[selected]

		slot2(slot3, slot4)

		slot2 = self._browser_data

		if slot2 then
			slot2 = self._browser_data
			slot3 = self._entrys
			slot3 = slot3[selected]
			slot2.entry = slot3
		end
	end

	return 
end

slot0.on_select = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._tree_box
	slot1 = slot1.tree_ctrl
	slot3 = slot1
	slot1 = slot1.selected_items
	slot1 = slot1(slot2)
	slot1 = #slot1
	slot2 = 0

	if slot2 < slot1 then
		slot1 = self._tree_box
		slot1 = slot1.tree_ctrl
		slot3 = slot1
		slot1 = slot1.selected_items
		local ids = slot1(slot2)
		slot2 = #ids

		if slot2 == 1 then
			slot2 = self._tree_box
			slot2 = slot2.tree_ctrl
			slot4 = slot2
			slot2 = slot2.get_item_text
			slot5 = ids[1]
			local selected = slot2(slot3, slot4)
			slot5 = self
			slot3 = self.update_preview
			slot6 = self._entrys
			slot6 = slot6[selected]

			slot3(slot4, slot5)

			slot3 = self._browser_data

			if slot3 then
				slot3 = self._browser_data
				slot4 = self._entrys
				slot4 = slot4[selected]
				slot3.entry = slot4
			end
		end
	end

	return 
end

slot0.on_tree_ctrl_change = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, node, name)
	slot5 = node
	slot3 = node.children
	slot3, slot4, slot5 = slot3(slot4)

	for n in slot3, slot4, slot5 do
		slot9 = n
		slot7 = n.name
		slot7 = slot7(slot8)

		if slot7 == name then
			return n
		end
	end

	return 
end

slot0.get_node = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, node, name, key, value)
	slot7 = node
	slot5 = node.children
	slot5, slot6, slot7 = slot5(slot6)

	for n in slot5, slot6, slot7 do
		slot11 = n
		slot9 = n.parameter
		slot12 = key
		slot9 = slot9(slot10, slot11)

		if slot9 == value then
		end
	end

	return 
end

slot0.find_node = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)
	local function valid_node(node)
		if node then
			slot3 = node

			return node.to_xml(slot2) ~= "</>\n"
		end
	end

	local function preview_model_xml(self, node, valid_node)
		slot3 = valid_node
		slot5 = node
		slot3 = slot3(slot4)

		if slot3 then
			slot5 = self
			slot3 = self.get_node
			slot6 = node
			slot7 = "diesel"
			local diesel_node = slot3(slot4, slot5, slot6)

			if diesel_node then
				slot6 = diesel_node
				slot4 = diesel_node.parameter
				slot7 = "file"
				slot4 = slot4(slot5, slot6)

				if slot4 then
					slot4 = self._active_database
					slot6 = slot4
					slot4 = slot4.lookup
					slot7 = "preview_texture"
					slot10 = diesel_node
					slot8 = diesel_node.parameter
					slot11 = "file"
					local preview = slot4(slot5, slot6, slot8(slot9, slot10))
					slot7 = preview
					slot5 = preview.valid
					slot5 = slot5(slot6)

					if slot5 then
						slot5 = self._preview_image
						slot7 = slot5
						slot5 = slot5.set_label_bitmap
						slot8 = Application
						slot10 = slot8
						slot8 = slot8.base_path
						slot8 = slot8(slot9)
						slot9 = self._active_database
						slot11 = slot9
						slot9 = slot9.root
						slot9 = slot9(slot10)
						slot10 = "/"
						slot13 = preview
						slot11 = preview.path
						slot11 = slot11(slot12)
						slot8 = slot8 .. slot9 .. slot10 .. slot11

						slot5(slot6, slot7)

						slot5 = self._preview_image
						slot7 = slot5
						slot5 = slot5.set_visible
						slot8 = true

						slot5(slot6, slot7)

						slot5 = true

						return slot5
					end
				end
			end
		end

		return 
	end

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.freeze

	slot4(slot5)

	slot4 = self._preview_panel
	slot6 = slot4
	slot4 = slot4.set_visible
	slot7 = false

	slot4(slot5, slot6)

	slot4 = self._preview_text_ctrl
	slot6 = slot4
	slot4 = slot4.text_ctrl
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.set_visible
	slot7 = false

	slot4(slot5, slot6)

	slot4 = self._preview_image
	slot6 = slot4
	slot4 = slot4.set_visible
	slot7 = false

	slot4(slot5, slot6)

	if entry then
		slot4 = self._active_database
		slot6 = slot4
		slot4 = slot4.load_node
		slot7 = entry
		local node = slot4(slot5, slot6)
		slot7 = entry
		slot5 = entry.type
		slot5 = slot5(slot6)

		if slot5 == "unit" then
			local flag = nil
			slot6 = valid_node
			slot8 = node
			slot6 = slot6(slot7)

			if slot6 then
				slot8 = self
				slot6 = self.get_node
				slot9 = node
				slot10 = "model"
				local model_node = slot6(slot7, slot8, slot9)

				if model_node then
					slot9 = model_node
					slot7 = model_node.parameter
					slot10 = "file"
					slot7 = slot7(slot8, slot9)

					if slot7 then
						slot7 = self._active_database
						slot9 = slot7
						slot7 = slot7.lookup
						slot10 = "object"
						slot13 = model_node
						slot11 = model_node.parameter
						slot14 = "file"
						local model_xml_entry = slot7(slot8, slot9, slot11(slot12, slot13))
						slot10 = model_xml_entry
						slot8 = model_xml_entry.valid
						slot8 = slot8(slot9)

						if slot8 then
							slot8 = self._active_database
							slot10 = slot8
							slot8 = slot8.load_node
							slot11 = model_xml_entry
							local model_xml_node = slot8(slot9, slot10)
							slot9 = preview_model_xml
							slot11 = self
							slot12 = model_xml_node
							slot13 = valid_node
							slot9 = slot9(slot10, slot11, slot12)
							flag = slot9
						end
					end
				end
			end

			if not flag then
				slot6 = self._preview_panel
				slot8 = slot6
				slot6 = slot6.set_visible
				slot9 = true

				slot6(slot7, slot8)
			end
		else
			slot7 = entry
			slot5 = entry.type
			slot5 = slot5(slot6)

			if slot5 == "object" then
				slot5 = preview_model_xml
				slot7 = self
				slot8 = node
				slot9 = valid_node
				slot5 = slot5(slot6, slot7, slot8)

				if not slot5 then
					slot5 = self._preview_panel
					slot7 = slot5
					slot5 = slot5.set_visible
					slot8 = true

					slot5(slot6, slot7)
				end
			else
				slot7 = entry
				slot5 = entry.type
				slot5 = slot5(slot6)

				if slot5 == "model" then
					slot5 = self._active_database
					slot7 = slot5
					slot5 = slot5.lookup
					slot8 = "preview_texture"
					slot11 = entry
					slot9 = entry.name
					local preview = slot5(slot6, slot7, slot9(slot10))
					slot8 = preview
					slot6 = preview.valid
					slot6 = slot6(slot7)

					if slot6 then
						slot6 = self._preview_image
						slot8 = slot6
						slot6 = slot6.set_label_bitmap
						slot9 = Application
						slot11 = slot9
						slot9 = slot9.base_path
						slot9 = slot9(slot10)
						slot10 = self._active_database
						slot12 = slot10
						slot10 = slot10.root
						slot10 = slot10(slot11)
						slot11 = "/"
						slot14 = preview
						slot12 = preview.path
						slot12 = slot12(slot13)
						slot9 = slot9 .. slot10 .. slot11 .. slot12

						slot6(slot7, slot8)

						slot6 = self._preview_image
						slot8 = slot6
						slot6 = slot6.set_visible
						slot9 = true

						slot6(slot7, slot8)
					else
						slot6 = self._preview_panel
						slot8 = slot6
						slot6 = slot6.set_visible
						slot9 = true

						slot6(slot7, slot8)
					end
				else
					slot5 = valid_node
					slot7 = node
					slot5 = slot5(slot6)

					if slot5 then
						slot5 = self._preview_text_ctrl
						slot7 = slot5
						slot5 = slot5.set_value
						slot10 = node
						slot8 = node.to_xml

						slot5(slot6, slot8(slot9))

						slot5 = self._preview_text_ctrl
						slot7 = slot5
						slot5 = slot5.text_ctrl
						slot5 = slot5(slot6)
						slot7 = slot5
						slot5 = slot5.set_visible
						slot8 = true

						slot5(slot6, slot7)
					else
						slot5 = self._preview_panel
						slot7 = slot5
						slot5 = slot5.set_visible
						slot8 = true

						slot5(slot6, slot7)
					end
				end
			end
		end
	else
		slot4 = self._preview_panel
		slot6 = slot4
		slot4 = slot4.set_visible
		slot7 = true

		slot4(slot5, slot6)
	end

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.layout

	slot4(slot5)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.thaw

	slot4(slot5)

	slot4 = self._main_frame
	slot6 = slot4
	slot4 = slot4.refresh

	slot4(slot5)

	return 
end

slot0.update_preview = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.freeze

	slot1(slot2)

	slot1 = self._preview_panel
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = true

	slot1(slot2, slot3)

	slot1 = self._preview_text_ctrl
	slot3 = slot1
	slot1 = slot1.text_ctrl
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._preview_image
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.layout

	slot1(slot2)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.thaw

	slot1(slot2)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.refresh

	slot1(slot2)

	return 
end

slot0.reset_preview = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.freeze

	slot1(slot2)

	slot1 = self._preview_panel
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._preview_text_ctrl
	slot3 = slot1
	slot1 = slot1.text_ctrl
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._preview_image
	slot3 = slot1
	slot1 = slot1.set_visible
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.layout

	slot1(slot2)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.thaw

	slot1(slot2)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.refresh

	slot1(slot2)

	return 
end

slot0.hide_preview = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_notebook
	slot3 = slot1
	slot1 = slot1.get_current_page
	slot1 = slot1(slot2)
	slot2 = self._main_notebook
	slot4 = slot2
	slot2 = slot2.get_page
	slot5 = 0
	slot2 = slot2(slot3, slot4)

	if slot1 ~= slot2 then
		slot1 = self._move_dialog
		slot3 = slot1
		slot1 = slot1.show_modal
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._move_dialog
			slot3 = slot1
			slot1 = slot1.get_value
			local path = slot1(slot2)
			slot4 = self
			slot2 = self.check_path
			slot5 = path
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot4 = self
				slot2 = self.move_entry
				slot5 = path

				slot2(slot3, slot4)

				slot4 = self
				slot2 = self.on_search

				slot2(slot3)

				slot4 = self
				slot2 = self.get_tree_id
				slot5 = path
				slot6 = true

				slot2(slot3, slot4, slot5)

				slot2 = false
				self._dirty_flag = slot2
				slot2 = self._active_database
				slot4 = slot2
				slot2 = slot2.save

				slot2(slot3)
			else
				slot2 = self._invalid_path_dialog
				slot4 = slot2
				slot2 = slot2.show_modal

				slot2(slot3)
			end
		end
	end

	return 
end

slot0.on_move = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, path)
	if path ~= "" then
		slot2 = string
		slot2 = slot2.sub
		slot4 = path
		slot5 = 1
		slot6 = 1
		slot2 = slot2(slot3, slot4, slot5)
	end

	slot2 = true

	return slot2
end

slot0.check_path = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, path)
	slot2 = self._tree_box
	slot2 = slot2.tree_ctrl
	slot4 = slot2
	slot2 = slot2.selected_items
	slot2 = slot2(slot3)
	slot2 = #slot2
	slot3 = 0

	if slot3 < slot2 then
		slot4 = self
		slot2 = self.filter_folders
		slot5 = self._tree_box
		slot5 = slot5.tree_ctrl
		slot7 = slot5
		slot5 = slot5.selected_items
		local ids = slot2(slot3, slot5(slot6))
		slot3 = ipairs
		slot5 = ids
		slot3, slot4, slot5 = slot3(slot4)

		for _, id in slot3, slot4, slot5 do
			slot8 = self._tree_box
			slot8 = slot8.tree_ctrl
			slot10 = slot8
			slot8 = slot8.get_item_text
			slot11 = id
			local selected = slot8(slot9, slot10)
			slot9 = self._entrys
			local entry = slot9[selected]

			if path == "" then
				slot12 = entry
				slot10 = entry.has_metadata
				slot13 = "db_browser_folder"
				slot10 = slot10(slot11, slot12)
			else
				slot10 = self._active_database
				slot12 = slot10
				slot10 = slot10.set_metadata
				slot13 = entry
				slot14 = "db_browser_folder"
				slot15 = path

				slot10(slot11, slot12, slot13, slot14)
			end
		end
	end

	return 
end

slot0.move_entry = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, ids)
	local out_table = {}
	slot3 = ipairs
	slot5 = ids
	slot3, slot4, slot5 = slot3(slot4)

	for _, id in slot3, slot4, slot5 do
		slot8 = self._folder_table
		slot8 = slot8.id

		if id ~= slot8 then
			slot10 = self
			slot8 = self.is_folder
			slot11 = self._folder_table
			slot12 = id
			slot8 = slot8(slot9, slot10, slot11)

			if not slot8 then
				slot8 = table
				slot8 = slot8.insert
				slot10 = out_table
				slot11 = id

				slot8(slot9, slot10)
			end
		end
	end

	return out_table
end

slot0.filter_folders = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, folder_table, id)
	slot3 = pairs
	slot5 = folder_table.children
	slot3, slot4, slot5 = slot3(slot4)

	for _, child in slot3, slot4, slot5 do
		slot8 = child.id

		if slot8 == id then
			slot8 = true

			return slot8
		else
			slot10 = self
			slot8 = self.is_folder
			slot11 = child
			slot12 = id
			slot8 = slot8(slot9, slot10, slot11)

			if slot8 then
				slot8 = true

				return slot8
			end
		end
	end

	slot3 = false

	return slot3
end

slot0.is_folder = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, path)
	local parent = self._folder_table
	slot3 = string
	slot3 = slot3.gmatch
	slot5 = path
	slot6 = "[%w_]+"
	slot3, slot4, slot5 = slot3(slot4, slot5)

	for folder_name in slot3, slot4, slot5 do
		slot7 = parent.children
		slot7 = slot7[folder_name]

		if not slot7 then
			local new_folder_table = {}
			slot8 = self._tree_box
			slot8 = slot8.tree_ctrl
			slot10 = slot8
			slot8 = slot8.append
			slot11 = parent.id
			slot12 = folder_name
			slot8 = slot8(slot9, slot10, slot11)
			new_folder_table.id = slot8
			slot8 = {}
			new_folder_table.children = slot8
			slot8 = self._tree_box
			slot8 = slot8.tree_ctrl
			slot10 = slot8
			slot8 = slot8.set_item_bold
			slot11 = new_folder_table.id
			slot12 = true

			slot8(slot9, slot10, slot11)

			slot8 = parent.children
			slot8[folder_name] = new_folder_table
			parent = new_folder_table
		else
			slot7 = parent.children
			parent = slot7[folder_name]
		end
	end

	return 
end

slot0.build_tree = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, path, expand)
	local parent = self._folder_table
	slot4 = string
	slot4 = slot4.gmatch
	slot6 = path
	slot7 = "[%w_]+"
	slot4, slot5, slot6 = slot4(slot5, slot6)

	for folder_name in slot4, slot5, slot6 do
		if expand then
			slot8 = self._tree_box
			slot8 = slot8.tree_ctrl
			slot10 = slot8
			slot8 = slot8.expand
			slot11 = parent.id

			slot8(slot9, slot10)
		end

		slot8 = parent.children
		parent = slot8[folder_name]
	end

	slot4 = self._tree_box
	slot4 = slot4.tree_ctrl
	slot6 = slot4
	slot4 = slot4.expand
	slot7 = parent.id

	slot4(slot5, slot6)

	slot4 = parent.id

	return slot4
end

slot0.get_tree_id = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._main_notebook
	slot3 = slot1
	slot1 = slot1.get_current_page
	slot1 = slot1(slot2)
	slot2 = self._main_notebook
	slot4 = slot2
	slot2 = slot2.get_page
	slot5 = 0
	slot2 = slot2(slot3, slot4)

	if slot1 == slot2 then

		-- Decompilation error in this vicinity:
		slot1 = self._search_box
		slot1 = slot1.list_box
		slot3 = slot1
		slot1 = slot1.freeze

		slot1(slot2)

		slot1 = self._search_box
		slot1 = slot1.list_box
		slot3 = slot1
		slot1 = slot1.clear

		slot1(slot2)

		slot3 = self
		slot1 = self.reset_preview

		slot1(slot2)

		slot1 = self._search_box
		slot1 = slot1.search_text_ctrl
		slot3 = slot1
		slot1 = slot1.get_value
		local search_str = slot1(slot2)
		slot2 = self._search_box
		slot2 = slot2.type_combobox
		slot4 = slot2
		slot2 = slot2.get_value
		local type_filter = slot2(slot3)
		slot3 = self._search_box
		slot3 = slot3.list_box
		slot5 = slot3
		slot3 = slot3.thaw

		slot3(slot4)

		slot3 = self._search_box
		slot3 = slot3.list_box
		slot5 = slot3
		slot3 = slot3.refresh

		slot3(slot4)

		slot3 = self._search_box
		slot3 = slot3.search_text_ctrl
		slot5 = slot3
		slot3 = slot3.set_focus

		slot3(slot4)
	else
		slot1 = self._main_notebook
		slot3 = slot1
		slot1 = slot1.get_current_page
		slot1 = slot1(slot2)
		slot2 = self._main_notebook
		slot4 = slot2
		slot2 = slot2.get_page
		slot5 = 1
		slot2 = slot2(slot3, slot4)

		if slot1 == slot2 then

			-- Decompilation error in this vicinity:
			slot1 = self._tree_box
			slot1 = slot1.tree_ctrl
			slot3 = slot1
			slot1 = slot1.freeze

			slot1(slot2)

			slot1 = self._tree_box
			slot1 = slot1.tree_ctrl
			slot3 = slot1
			slot1 = slot1.clear

			slot1(slot2)

			slot3 = self
			slot1 = self.reset_preview

			slot1(slot2)

			slot1 = {}
			self._folder_table = slot1
			slot1 = self._folder_table
			slot2 = self._tree_box
			slot2 = slot2.tree_ctrl
			slot4 = slot2
			slot2 = slot2.append_root
			slot5 = "root"
			slot2 = slot2(slot3, slot4)
			slot1.id = slot2
			slot1 = self._folder_table
			slot2 = {}
			slot1.children = slot2
			slot1 = self._tree_box
			slot1 = slot1.tree_ctrl
			slot3 = slot1
			slot1 = slot1.set_item_bold
			slot4 = self._folder_table
			slot4 = slot4.id
			slot5 = true

			slot1(slot2, slot3, slot4)

			slot1 = self._tree_box
			slot1 = slot1.search_text_ctrl
			slot3 = slot1
			slot1 = slot1.get_value
			local search_str = slot1(slot2)
			slot2 = self._tree_box
			slot2 = slot2.type_combobox
			slot4 = slot2
			slot2 = slot2.get_value
			local type_filter = slot2(slot3)
			slot3 = self._tree_box
			slot3 = slot3.tree_ctrl
			slot5 = slot3
			slot3 = slot3.expand
			slot6 = self._folder_table
			slot6 = slot6.id

			slot3(slot4, slot5)

			slot3 = self._tree_box
			slot3 = slot3.tree_ctrl
			slot5 = slot3
			slot3 = slot3.thaw

			slot3(slot4)

			slot3 = self._tree_box
			slot3 = slot3.tree_ctrl
			slot5 = slot3
			slot3 = slot3.refresh

			slot3(slot4)

			slot3 = self._tree_box
			slot3 = slot3.search_text_ctrl
			slot5 = slot3
			slot3 = slot3.set_focus

			slot3(slot4)
		else
			slot1 = self._main_notebook
			slot3 = slot1
			slot1 = slot1.get_current_page
			slot1 = slot1(slot2)
			slot2 = self._main_notebook
			slot4 = slot2
			slot2 = slot2.get_page
			slot5 = 2
			slot2 = slot2(slot3, slot4)

			if slot1 == slot2 then
				slot3 = self
				slot1 = self.append_local_changes

				slot1(slot2)

				slot3 = self
				slot1 = self.hide_preview

				slot1(slot2)
			end
		end
	end

	return 
end

slot0.on_search = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._browser_data

	if not slot1 then
		slot1 = self._main_notebook
		slot3 = slot1
		slot1 = slot1.get_current_page
		slot1 = slot1(slot2)
		slot2 = self._main_notebook
		slot4 = slot2
		slot2 = slot2.get_page
		slot5 = 0
		slot2 = slot2(slot3, slot4)

		if slot1 == slot2 then
			slot1 = self._search_box
			slot1 = slot1.list_box
			slot3 = slot1
			slot1 = slot1.selected_indices
			local ids = slot1(slot2)
			slot2 = #ids
			slot3 = 0

			if slot3 < slot2 then
				slot2 = self._remove_dialog
				slot4 = slot2
				slot2 = slot2.show_modal
				slot2 = slot2(slot3)

				if slot2 == "ID_YES" then
					slot2 = ipairs
					slot4 = ids
					slot2, slot3, slot4 = slot2(slot3)

					for _, id in slot2, slot3, slot4 do
						slot7 = self._search_box
						slot7 = slot7.list_box
						slot9 = slot7
						slot7 = slot7.get_string
						slot10 = id
						local selected = slot7(slot8, slot9)
						slot8 = self._active_database
						slot10 = slot8
						slot8 = slot8.remove
						slot11 = self._entrys
						slot11 = slot11[selected]
						slot13 = slot11
						slot11 = slot11.type
						slot11 = slot11(slot12)
						slot12 = self._entrys
						slot12 = slot12[selected]
						slot14 = slot12
						slot12 = slot12.name
						slot12 = slot12(slot13)
						slot13 = self._entrys
						slot13 = slot13[selected]
						slot15 = slot13
						slot13 = slot13.properties

						slot8(slot9, slot10, slot11, slot13(slot14))

						slot8 = self._entrys
						slot9 = nil
						slot8[selected] = slot9
						slot8 = false
						self._dirty_flag = slot8
						slot8 = self._active_database
						slot10 = slot8
						slot8 = slot8.save

						slot8(slot9)
					end

					slot4 = self
					slot2 = self.on_search

					slot2(slot3)
				end
			end
		else
			slot1 = self._main_notebook
			slot3 = slot1
			slot1 = slot1.get_current_page
			slot1 = slot1(slot2)
			slot2 = self._main_notebook
			slot4 = slot2
			slot2 = slot2.get_page
			slot5 = 1
			slot2 = slot2(slot3, slot4)

			if slot1 == slot2 then
				slot1 = self._tree_box
				slot1 = slot1.tree_ctrl
				slot3 = slot1
				slot1 = slot1.selected_items
				slot1 = slot1(slot2)
				slot1 = #slot1
				slot2 = 0

				if slot2 < slot1 then
					slot1 = self._remove_dialog
					slot3 = slot1
					slot1 = slot1.show_modal
					slot1 = slot1(slot2)

					if slot1 == "ID_YES" then
						slot3 = self
						slot1 = self.filter_folders
						slot4 = self._tree_box
						slot4 = slot4.tree_ctrl
						slot6 = slot4
						slot4 = slot4.selected_items
						local ids = slot1(slot2, slot4(slot5))
						slot2 = ipairs
						slot4 = ids
						slot2, slot3, slot4 = slot2(slot3)

						for _, id in slot2, slot3, slot4 do
							slot7 = self._tree_box
							slot7 = slot7.tree_ctrl
							slot9 = slot7
							slot7 = slot7.get_item_text
							slot10 = id
							local selected = slot7(slot8, slot9)
							slot8 = self._active_database
							slot10 = slot8
							slot8 = slot8.remove
							slot11 = self._entrys
							slot11 = slot11[selected]
							slot13 = slot11
							slot11 = slot11.type
							slot11 = slot11(slot12)
							slot12 = self._entrys
							slot12 = slot12[selected]
							slot14 = slot12
							slot12 = slot12.name
							slot12 = slot12(slot13)
							slot13 = self._entrys
							slot13 = slot13[selected]
							slot15 = slot13
							slot13 = slot13.properties

							slot8(slot9, slot10, slot11, slot13(slot14))

							slot8 = self._entrys
							slot9 = nil
							slot8[selected] = slot9
							slot8 = false
							self._dirty_flag = slot8
							slot8 = self._active_database
							slot10 = slot8
							slot8 = slot8.save

							slot8(slot9)
						end

						slot4 = self
						slot2 = self.on_search

						slot2(slot3)
					end
				end
			else
				slot1 = self._main_notebook
				slot3 = slot1
				slot1 = slot1.get_current_page
				slot1 = slot1(slot2)
				slot2 = self._main_notebook
				slot4 = slot2
				slot2 = slot2.get_page
				slot5 = 2
				slot2 = slot2(slot3, slot4)

				if slot1 == slot2 then
					slot3 = self
					slot1 = self.on_revert_btn

					slot1(slot2)
				end
			end
		end
	else
		slot1 = self._not_available_dialog
		slot3 = slot1
		slot1 = slot1.show_modal

		slot1(slot2)
	end

	return 
end

slot0.on_remove = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, new_entry, old_name)
	slot5 = new_entry
	slot3 = new_entry.type
	slot3 = slot3(slot4)

	if slot3 == "unit" then
		slot3 = self._active_database
		slot5 = slot3
		slot3 = slot3.load_node
		slot6 = new_entry
		local node = slot3(slot4, slot5)
		slot4 = assert
		slot6 = node

		slot4(slot5)

		slot6 = node
		slot4 = node.set_parameter
		slot7 = "name"
		slot10 = new_entry
		slot8 = new_entry.name

		slot4(slot5, slot6, slot8(slot9))

		slot4 = self._active_database
		slot6 = slot4
		slot4 = slot4.save_node
		slot7 = node
		slot8 = new_entry

		slot4(slot5, slot6, slot7)
	else
		slot5 = new_entry
		slot3 = new_entry.type
		slot3 = slot3(slot4)

		if slot3 == "model" then
			slot3 = self._active_database
			slot5 = slot3
			slot3 = slot3.lookup
			slot6 = "preview_texture"
			slot7 = old_name
			local preview = slot3(slot4, slot5, slot6)
			slot6 = preview
			slot4 = preview.valid
			slot4 = slot4(slot5)

			if slot4 then
				slot4 = self._active_database
				slot6 = slot4
				slot4 = slot4.rename
				slot7 = preview
				slot8 = "preview_texture"
				slot11 = new_entry
				slot9 = new_entry.name
				slot9 = slot9(slot10)
				slot12 = preview
				slot10 = preview.properties

				slot4(slot5, slot6, slot7, slot8, slot10(slot11))
			end
		end
	end

	return 
end

slot0.on_special_rename = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry, new_name)

	-- Decompilation error in this vicinity:
	slot5 = entry
	slot3 = entry.name
	local old_name = slot3(slot4)
	slot4 = self._active_database
	slot6 = slot4
	slot4 = slot4.lookup
	slot9 = entry
	slot7 = entry.type
	slot7 = slot7(slot8)
	slot8 = old_name
	slot11 = entry
	slot9 = entry.properties
	local old_ref = slot4(slot5, slot6, slot7, slot9(slot10))

	return new_ref
end

slot0._rename_and_transfer_metadata = slot1
slot0 = CoreDatabaseBrowser

function slot1(self)
	slot1 = self._browser_data

	if not slot1 then
		slot1 = self._main_notebook
		slot3 = slot1
		slot1 = slot1.get_current_page
		slot1 = slot1(slot2)
		slot2 = self._main_notebook
		slot4 = slot2
		slot2 = slot2.get_page
		slot5 = 0
		slot2 = slot2(slot3, slot4)

		if slot1 == slot2 then
			slot1 = self._search_box
			slot1 = slot1.list_box
			slot3 = slot1
			slot1 = slot1.selected_indices
			local ids = slot1(slot2)
			slot2 = #ids
			slot3 = 0

			if slot3 < slot2 then
				slot2 = self._rename_dialog
				slot4 = slot2
				slot2 = slot2.set_value
				slot5 = self._entrys
				slot6 = self._search_box
				slot6 = slot6.list_box
				slot8 = slot6
				slot6 = slot6.get_string
				slot9 = ids[1]
				slot6 = slot6(slot7, slot8)
				slot5 = slot5[slot6]
				slot7 = slot5
				slot5 = slot5.name

				slot2(slot3, slot5(slot6))

				slot2 = self._rename_dialog
				slot4 = slot2
				slot2 = slot2.show_modal
				slot2 = slot2(slot3)

				if slot2 then
					slot2 = ipairs
					slot4 = ids
					slot2, slot3, slot4 = slot2(slot3)

					for _, id in slot2, slot3, slot4 do
						slot7 = self._search_box
						slot7 = slot7.list_box
						slot9 = slot7
						slot7 = slot7.get_string
						slot10 = id
						local selected = slot7(slot8, slot9)
						slot8 = self._active_database
						slot10 = slot8
						slot8 = slot8.has
						slot11 = self._entrys
						slot11 = slot11[selected]
						slot13 = slot11
						slot11 = slot11.type
						slot11 = slot11(slot12)
						slot12 = self._rename_dialog
						slot14 = slot12
						slot12 = slot12.get_value
						slot12 = slot12(slot13)
						slot13 = self._entrys
						slot13 = slot13[selected]
						slot15 = slot13
						slot13 = slot13.properties
						slot8 = slot8(slot9, slot10, slot11, slot13(slot14))

						if not slot8 then
							slot8 = self._entrys
							slot8 = slot8[selected]
							slot10 = slot8
							slot8 = slot8.name
							local old_name = slot8(slot9)
							slot11 = self
							slot9 = self._rename_and_transfer_metadata
							slot12 = self._entrys
							slot12 = slot12[selected]
							slot13 = self._rename_dialog
							slot15 = slot13
							slot13 = slot13.get_value
							local new_ref = slot9(slot10, slot11, slot13(slot14))
							slot10 = self._entrys
							slot11 = nil
							slot10[selected] = slot11
							slot10 = self._entrys
							slot13 = new_ref
							slot11 = new_ref.type
							slot11 = slot11(slot12)
							slot12 = " - "
							slot15 = new_ref
							slot13 = new_ref.name
							slot13 = slot13(slot14)
							slot11 = slot11 .. slot12 .. slot13
							slot10[slot11] = new_ref
							slot10 = false
							self._dirty_flag = slot10
							slot12 = self
							slot10 = self.on_special_rename
							slot13 = new_ref
							slot14 = old_name

							slot10(slot11, slot12, slot13)

							slot10 = self._active_database
							slot12 = slot10
							slot10 = slot10.save

							slot10(slot11)

							slot10 = self._active_database
							slot12 = slot10
							slot10 = slot10.load

							slot10(slot11)
						else
							slot8 = self._rename_error_dialog
							slot10 = slot8
							slot8 = slot8.show_modal

							slot8(slot9)
						end
					end

					slot4 = self
					slot2 = self.on_read_database

					slot2(slot3)
				end
			end
		else
			slot1 = self._main_notebook
			slot3 = slot1
			slot1 = slot1.get_current_page
			slot1 = slot1(slot2)
			slot2 = self._main_notebook
			slot4 = slot2
			slot2 = slot2.get_page
			slot5 = 1
			slot2 = slot2(slot3, slot4)

			if slot1 == slot2 then
				slot1 = self._tree_box
				slot1 = slot1.tree_ctrl
				slot3 = slot1
				slot1 = slot1.selected_items
				slot1 = slot1(slot2)
				slot1 = #slot1
				slot2 = 0

				if slot2 < slot1 then
					slot3 = self
					slot1 = self.filter_folders
					slot4 = self._tree_box
					slot4 = slot4.tree_ctrl
					slot6 = slot4
					slot4 = slot4.selected_items
					slot1 = slot1(slot2, slot4(slot5))
					local id = slot1[1]
					slot2 = self._tree_box
					slot2 = slot2.tree_ctrl
					slot4 = slot2
					slot2 = slot2.get_item_text
					slot5 = id
					local selected = slot2(slot3, slot4)
					slot3 = self._rename_dialog
					slot5 = slot3
					slot3 = slot3.set_value
					slot6 = self._entrys
					slot7 = self._tree_box
					slot7 = slot7.tree_ctrl
					slot9 = slot7
					slot7 = slot7.get_item_text
					slot10 = id
					slot7 = slot7(slot8, slot9)
					slot6 = slot6[slot7]
					slot8 = slot6
					slot6 = slot6.name

					slot3(slot4, slot6(slot7))

					slot3 = self._rename_dialog
					slot5 = slot3
					slot3 = slot3.show_modal
					slot3 = slot3(slot4)

					if slot3 then
						slot3 = self._active_database
						slot5 = slot3
						slot3 = slot3.has
						slot6 = self._entrys
						slot6 = slot6[selected]
						slot8 = slot6
						slot6 = slot6.type
						slot6 = slot6(slot7)
						slot7 = self._rename_dialog
						slot9 = slot7
						slot7 = slot7.get_value
						slot7 = slot7(slot8)
						slot8 = self._entrys
						slot8 = slot8[selected]
						slot10 = slot8
						slot8 = slot8.properties
						slot3 = slot3(slot4, slot5, slot6, slot8(slot9))

						if not slot3 then
							slot3 = self._tree_box
							slot3 = slot3.tree_ctrl
							slot5 = slot3
							slot3 = slot3.get_item_text
							slot6 = id
							local selected = slot3(slot4, slot5)
							slot4 = self._entrys
							slot4 = slot4[selected]
							slot6 = slot4
							slot4 = slot4.name
							local old_name = slot4(slot5)
							slot7 = self
							slot5 = self._rename_and_transfer_metadata
							slot8 = self._entrys
							slot8 = slot8[selected]
							slot9 = self._rename_dialog
							slot11 = slot9
							slot9 = slot9.get_value
							local new_ref = slot5(slot6, slot7, slot9(slot10))
							slot6 = self._entrys
							slot7 = nil
							slot6[selected] = slot7
							slot6 = self._entrys
							slot9 = new_ref
							slot7 = new_ref.type
							slot7 = slot7(slot8)
							slot8 = " - "
							slot9 = self._rename_dialog
							slot11 = slot9
							slot9 = slot9.get_value
							slot9 = slot9(slot10)
							slot7 = slot7 .. slot8 .. slot9
							slot6[slot7] = new_ref
							slot6 = false
							self._dirty_flag = slot6
							slot8 = self
							slot6 = self.on_special_rename
							slot9 = new_ref
							slot10 = old_name

							slot6(slot7, slot8, slot9)

							slot6 = self._active_database
							slot8 = slot6
							slot6 = slot6.save

							slot6(slot7)

							slot6 = self._active_database
							slot8 = slot6
							slot6 = slot6.load

							slot6(slot7)
						else
							slot3 = self._rename_error_dialog
							slot5 = slot3
							slot3 = slot3.show_modal

							slot3(slot4)
						end

						slot5 = self
						slot3 = self.on_read_database

						slot3(slot4)
					end
				end
			end
		end
	else
		slot1 = self._not_available_dialog
		slot3 = slot1
		slot1 = slot1.show_modal

		slot1(slot2)
	end

	return 
end

slot0.on_rename = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, in_table, target)
	local str = " "
	slot4 = pairs
	slot6 = in_table
	slot4, slot5, slot6 = slot4(slot5)

	for key, value in slot4, slot5, slot6 do
		slot9 = str
		slot10 = "-"
		slot11 = target
		slot12 = " "
		slot13 = key
		slot14 = "="
		slot15 = value
		slot16 = " "
		str = slot9 .. slot10 .. slot11 .. slot12 .. slot13 .. slot14 .. slot15 .. slot16
	end

	return str
end

slot0.unpack_prop = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)
	slot2 = self._op_menu
	slot4 = slot2
	slot2 = slot2.is_checked
	slot5 = "OP_AUTO_CONVERT_TEXTURES"
	slot2 = slot2(slot3, slot4)

	if slot2 then

		-- Decompilation error in this vicinity:
		slot4 = entry
		slot2 = entry.properties
		local prop = slot2(slot3)
		slot3 = "x360raw"
		prop.platform = slot3
		slot3 = self._active_database
		slot5 = slot3
		slot3 = slot3.lookup
		slot6 = "texture"
		slot9 = entry
		slot7 = entry.name
		slot7 = slot7(slot8)
		slot8 = prop
		local raw_texture = slot3(slot4, slot5, slot6, slot7)
		slot6 = raw_texture
		slot4 = raw_texture.valid
		slot4 = slot4(slot5)
		slot4 = "x360"
		prop.platform = slot4
		slot4 = "imageexportertool -d \""
		slot5 = Application
		slot7 = slot5
		slot5 = slot5.base_path
		slot5 = slot5(slot6)
		slot6 = "db\" -sn "
		slot9 = raw_texture
		slot7 = raw_texture.name
		slot7 = slot7(slot8)
		slot10 = self
		slot8 = self.unpack_prop
		slot13 = raw_texture
		slot11 = raw_texture.properties
		slot11 = slot11(slot12)
		slot12 = "sp"
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = "-qpf A8L8"
		local str = slot4 .. slot5 .. slot6 .. slot7 .. slot8 .. slot9
		slot5 = Application
		slot7 = slot5
		slot5 = slot5.system
		slot8 = str
		slot9 = true
		slot10 = true
		slot5 = slot5(slot6, slot7, slot8, slot9)

		if slot5 == 0 then
			slot5 = "imageexportertool -d \""
			slot6 = Application
			slot8 = slot6
			slot6 = slot6.base_path
			slot6 = slot6(slot7)
			slot7 = "db\" -sn "
			slot10 = raw_texture
			slot8 = raw_texture.name
			slot8 = slot8(slot9)
			slot11 = self
			slot9 = self.unpack_prop
			slot14 = raw_texture
			slot12 = raw_texture.properties
			slot12 = slot12(slot13)
			slot13 = "sp"
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = "-dn "
			slot13 = raw_texture
			slot11 = raw_texture.name
			slot11 = slot11(slot12)
			slot14 = self
			slot12 = self.unpack_prop
			slot15 = prop
			slot16 = "dp"
			slot12 = slot12(slot13, slot14, slot15)
			slot13 = "-p 3DC -f dds"
			str = slot5 .. slot6 .. slot7 .. slot8 .. slot9 .. slot10 .. slot11 .. slot12 .. slot13
			slot5 = cat_print
			slot7 = "debug"
			slot8 = "[CoreDatabaseBrowser] "
			slot9 = str
			slot8 = slot8 .. slot9

			slot5(slot6, slot7)

			slot5 = Application
			slot7 = slot5
			slot5 = slot5.system
			slot8 = str
			slot9 = true
			slot10 = true

			slot5(slot6, slot7, slot8, slot9)

			slot5 = self._active_database
			slot7 = slot5
			slot5 = slot5.load

			slot5(slot6)

			slot5 = self._active_database
			slot7 = slot5
			slot5 = slot5.lookup
			slot8 = "texture"
			slot11 = raw_texture
			slot9 = raw_texture.name
			slot9 = slot9(slot10)
			slot10 = prop

			return slot5(slot6, slot7, slot8, slot9)
		end

		slot5 = self._active_database
		slot7 = slot5
		slot5 = slot5.load

		slot5(slot6)
	end

	return 
end

slot0.convert_to_x360 = slot1
slot0 = CoreDatabaseBrowser

function slot1(self, entry)
	slot2 = self._op_menu
	slot4 = slot2
	slot2 = slot2.is_checked
	slot5 = "OP_AUTO_CONVERT_TEXTURES"
	slot2 = slot2(slot3, slot4)

	if slot2 then

		-- Decompilation error in this vicinity:
		slot4 = entry
		slot2 = entry.properties
		local prop = slot2(slot3)
		slot3 = "ps3raw"
		prop.platform = slot3
		slot3 = self._active_database
		slot5 = slot3
		slot3 = slot3.lookup
		slot6 = "texture"
		slot9 = entry
		slot7 = entry.name
		slot7 = slot7(slot8)
		slot8 = prop
		local raw_texture = slot3(slot4, slot5, slot6, slot7)
		slot6 = raw_texture
		slot4 = raw_texture.valid
		slot4 = slot4(slot5)
		slot4 = "ps3"
		prop.platform = slot4
		slot4 = "imageexportertool -d \""
		slot5 = Application
		slot7 = slot5
		slot5 = slot5.base_path
		slot5 = slot5(slot6)
		slot6 = "db\" -sn "
		slot9 = raw_texture
		slot7 = raw_texture.name
		slot7 = slot7(slot8)
		slot10 = self
		slot8 = self.unpack_prop
		slot13 = raw_texture
		slot11 = raw_texture.properties
		slot11 = slot11(slot12)
		slot12 = "sp"
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = "-qpf A8L8"
		local str = slot4 .. slot5 .. slot6 .. slot7 .. slot8 .. slot9
		slot5 = Application
		slot7 = slot5
		slot5 = slot5.system
		slot8 = str
		slot9 = true
		slot10 = true
		slot5 = slot5(slot6, slot7, slot8, slot9)

		if slot5 == 0 then
			slot5 = "imageexportertool -d \""
			slot6 = Application
			slot8 = slot6
			slot6 = slot6.base_path
			slot6 = slot6(slot7)
			slot7 = "db\" -sn "
			slot10 = raw_texture
			slot8 = raw_texture.name
			slot8 = slot8(slot9)
			slot11 = self
			slot9 = self.unpack_prop
			slot14 = raw_texture
			slot12 = raw_texture.properties
			slot12 = slot12(slot13)
			slot13 = "sp"
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = "-dn "
			slot13 = raw_texture
			slot11 = raw_texture.name
			slot11 = slot11(slot12)
			slot14 = self
			slot12 = self.unpack_prop
			slot15 = prop
			slot16 = "dp"
			slot12 = slot12(slot13, slot14, slot15)
			slot13 = "-f gtf -p DXT5_NM"
			str = slot5 .. slot6 .. slot7 .. slot8 .. slot9 .. slot10 .. slot11 .. slot12 .. slot13
		else
			slot5 = "imageexportertool -d \""
			slot6 = Application
			slot8 = slot6
			slot6 = slot6.base_path
			slot6 = slot6(slot7)
			slot7 = "db\" -sn "
			slot10 = raw_texture
			slot8 = raw_texture.name
			slot8 = slot8(slot9)
			slot11 = self
			slot9 = self.unpack_prop
			slot14 = raw_texture
			slot12 = raw_texture.properties
			slot12 = slot12(slot13)
			slot13 = "sp"
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = "-dn "
			slot13 = raw_texture
			slot11 = raw_texture.name
			slot11 = slot11(slot12)
			slot14 = self
			slot12 = self.unpack_prop
			slot15 = prop
			slot16 = "dp"
			slot12 = slot12(slot13, slot14, slot15)
			slot13 = "-f gtf"
			str = slot5 .. slot6 .. slot7 .. slot8 .. slot9 .. slot10 .. slot11 .. slot12 .. slot13
		end

		slot5 = cat_print
		slot7 = "debug"
		slot8 = "[CoreDatabaseBrowser] "
		slot9 = str
		slot8 = slot8 .. slot9

		slot5(slot6, slot7)

		slot5 = Application
		slot7 = slot5
		slot5 = slot5.system
		slot8 = str
		slot9 = true
		slot10 = true

		slot5(slot6, slot7, slot8, slot9)

		slot5 = self._active_database
		slot7 = slot5
		slot5 = slot5.load

		slot5(slot6)

		slot5 = self._active_database
		slot7 = slot5
		slot5 = slot5.lookup
		slot8 = "texture"
		slot11 = raw_texture
		slot9 = raw_texture.name
		slot9 = slot9(slot10)
		slot10 = prop

		return slot5(slot6, slot7, slot8, slot9)
	end

	return 
end

slot0.convert_to_ps3 = slot1
slot0 = CoreDatabaseBrowserMoveDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowserMoveDialog = slot0
slot0 = CoreDatabaseBrowserMoveDialog

function slot1(self, editor, p)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Dialog
	slot6 = p
	slot7 = "Move"
	slot8 = ""
	slot9 = Vector3
	slot11 = -1
	slot12 = -1
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = Vector3
	slot12 = 300
	slot13 = 75
	slot14 = 0
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	slot3 = slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	self._dialog = slot3
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "VERTICAL"
	local box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._dialog
	slot8 = ""
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	self._text_ctrl = slot4
	slot4 = self._text_ctrl
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_move_button"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = self._text_ctrl
	slot8 = 0
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local button_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Move"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._move = slot5
	slot5 = self._move
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_move_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._move
	slot9 = 1
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Cancel"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._cancel = slot5
	slot5 = self._cancel
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_cancel_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._cancel
	slot9 = 1
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = box
	slot5 = box.add
	slot8 = button_box
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = self._dialog
	slot7 = slot5
	slot5 = slot5.set_sizer
	slot8 = box

	slot5(slot6, slot7)

	slot5 = self._text_ctrl
	slot7 = slot5
	slot5 = slot5.set_focus

	slot5(slot6)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowserMoveDialog

function slot1(self)
	slot1 = self._text_ctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = nil
	self._resault = slot1
	slot1 = false
	self._done = slot1
	slot1 = true
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.show_modal

	slot1(slot2)

	slot1 = self._done

	while not slot1 do
	end

	slot1 = self._return_val

	return slot1
end

slot0.show_modal = slot1
slot0 = CoreDatabaseBrowserMoveDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = self._text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._resault = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_move_button = slot1
slot0 = CoreDatabaseBrowserMoveDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = false
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_cancel_button = slot1
slot0 = CoreDatabaseBrowserMoveDialog

function slot1(self)
	slot1 = self._resault

	return slot1
end

slot0.get_value = slot1
slot0 = CoreDatabaseBrowserImportDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowserImportDialog = slot0
slot0 = CoreDatabaseBrowserImportDialog

function slot1(self, editor, p)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Dialog
	slot6 = p
	slot7 = "New Entry"
	slot8 = ""
	slot9 = Vector3
	slot11 = -1
	slot12 = -1
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = Vector3
	slot12 = 300
	slot13 = 86
	slot14 = 0
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	slot3 = slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	self._dialog = slot3
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "VERTICAL"
	local box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local text_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.ComboBox
	slot8 = self._dialog
	slot9 = ""
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._type_combobox = slot5
	slot5 = self._type_combobox
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_TEXT_ENTER"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_import_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = editor
	slot5 = editor.append_all_types
	slot8 = self._type_combobox

	slot5(slot6, slot7)

	slot7 = text_box
	slot5 = text_box.add
	slot8 = self._type_combobox
	slot9 = 1
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.TextCtrl
	slot8 = self._dialog
	slot9 = ""
	slot10 = ""
	slot11 = "TE_PROCESS_ENTER"
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._name_text_ctrl = slot5
	slot5 = self._name_text_ctrl
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_TEXT_ENTER"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_import_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = text_box
	slot5 = text_box.add
	slot8 = self._name_text_ctrl
	slot9 = 1
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = box
	slot5 = box.add
	slot8 = text_box
	slot9 = 0
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.BoxSizer
	slot8 = "HORIZONTAL"
	local button_box = slot5(slot6, slot7)
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Button
	slot9 = self._dialog
	slot10 = "Import"
	slot11 = ""
	slot12 = ""
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	self._move = slot6
	slot6 = self._move
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = ""
	slot10 = "EVT_COMMAND_BUTTON_CLICKED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_import_button"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = button_box
	slot6 = button_box.add
	slot9 = self._move
	slot10 = 1
	slot11 = 4
	slot12 = "ALL,EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Button
	slot9 = self._dialog
	slot10 = "Cancel"
	slot11 = ""
	slot12 = ""
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	self._cancel = slot6
	slot6 = self._cancel
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = ""
	slot10 = "EVT_COMMAND_BUTTON_CLICKED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_cancel_button"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = button_box
	slot6 = button_box.add
	slot9 = self._cancel
	slot10 = 1
	slot11 = 4
	slot12 = "ALL,EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = box
	slot6 = box.add
	slot9 = button_box
	slot10 = 0
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._dialog
	slot8 = slot6
	slot6 = slot6.set_sizer
	slot9 = box

	slot6(slot7, slot8)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowserImportDialog

function slot1(self)
	slot1 = self._type_combobox
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = self._name_text_ctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = nil
	self._type = slot1
	slot1 = nil
	self._name = slot1
	slot1 = false
	self._done = slot1
	slot1 = true
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.show_modal

	slot1(slot2)

	slot1 = self._done

	while not slot1 do
	end

	slot1 = self._return_val

	return slot1
end

slot0.show_modal = slot1
slot0 = CoreDatabaseBrowserImportDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = self._type_combobox
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._type = slot1
	slot1 = self._name_text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._name = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_import_button = slot1
slot0 = CoreDatabaseBrowserImportDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = false
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_cancel_button = slot1
slot0 = CoreDatabaseBrowserImportDialog

function slot1(self)
	slot1 = self._type
	slot2 = self._name

	return slot1, slot2
end

slot0.get_value = slot1
slot0 = CoreDatabaseBrowserMetadataDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowserMetadataDialog = slot0
slot0 = CoreDatabaseBrowserMetadataDialog

function slot1(self, p)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Dialog
	slot5 = p
	slot6 = "Set Metadata"
	slot7 = ""
	slot8 = Vector3
	slot10 = -1
	slot11 = -1
	slot12 = 0
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = Vector3
	slot11 = 300
	slot12 = 86
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	self._dialog = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.BoxSizer
	slot5 = "VERTICAL"
	local box = slot2(slot3, slot4)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	local text_box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._dialog
	slot8 = ""
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	self._key_text_ctrl = slot4
	slot4 = self._key_text_ctrl
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_set_button"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = text_box
	slot4 = text_box.add
	slot7 = self._key_text_ctrl
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._dialog
	slot8 = ""
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	self._value_text_ctrl = slot4
	slot4 = self._value_text_ctrl
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_set_button"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = text_box
	slot4 = text_box.add
	slot7 = self._value_text_ctrl
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = text_box
	slot8 = 0
	slot9 = 4
	slot10 = "ALL,EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local button_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Set"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._move = slot5
	slot5 = self._move
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_set_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._move
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Cancel"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._cancel = slot5
	slot5 = self._cancel
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_cancel_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._cancel
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = box
	slot5 = box.add
	slot8 = button_box
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = self._dialog
	slot7 = slot5
	slot5 = slot5.set_sizer
	slot8 = box

	slot5(slot6, slot7)

	slot5 = self._key_text_ctrl
	slot7 = slot5
	slot5 = slot5.set_focus

	slot5(slot6)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowserMetadataDialog

function slot1(self)
	slot1 = self._key_text_ctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = self._value_text_ctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = nil
	self._key = slot1
	slot1 = nil
	self._value = slot1
	slot1 = false
	self._done = slot1
	slot1 = true
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.show_modal

	slot1(slot2)

	slot1 = self._done

	while not slot1 do
	end

	slot1 = self._return_val

	return slot1
end

slot0.show_modal = slot1
slot0 = CoreDatabaseBrowserMetadataDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = self._key_text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._key = slot1
	slot1 = self._value_text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._value = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_set_button = slot1
slot0 = CoreDatabaseBrowserMetadataDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = false
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_cancel_button = slot1
slot0 = CoreDatabaseBrowserMetadataDialog

function slot1(self)
	slot1 = self._key
	slot2 = self._value

	return slot1, slot2
end

slot0.get_value = slot1
slot0 = CoreDatabaseBrowserInputDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowserInputDialog = slot0
slot0 = CoreDatabaseBrowserInputDialog

function slot1(self, p)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Dialog
	slot5 = p
	slot6 = "Comment"
	slot7 = ""
	slot8 = Vector3
	slot10 = -1
	slot11 = -1
	slot12 = 0
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = Vector3
	slot11 = 300
	slot12 = 86
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	self._dialog = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.BoxSizer
	slot5 = "VERTICAL"
	local box = slot2(slot3, slot4)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	local text_box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._dialog
	slot8 = ""
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	self._key_text_ctrl = slot4
	slot4 = self._key_text_ctrl
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_ok_button"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = text_box
	slot4 = text_box.add
	slot7 = self._key_text_ctrl
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = text_box
	slot8 = 0
	slot9 = 4
	slot10 = "ALL,EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local button_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "OK"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._ok = slot5
	slot5 = self._ok
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_ok_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._ok
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Cancel"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._cancel = slot5
	slot5 = self._cancel
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_cancel_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._cancel
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = box
	slot5 = box.add
	slot8 = button_box
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = self._dialog
	slot7 = slot5
	slot5 = slot5.set_sizer
	slot8 = box

	slot5(slot6, slot7)

	slot5 = self._key_text_ctrl
	slot7 = slot5
	slot5 = slot5.set_focus

	slot5(slot6)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowserInputDialog

function slot1(self)
	slot1 = self._key_text_ctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = nil
	self._key = slot1
	slot1 = false
	self._done = slot1
	slot1 = true
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.show_modal

	slot1(slot2)

	slot1 = self._done

	while not slot1 do
	end

	slot1 = self._return_val

	return slot1
end

slot0.show_modal = slot1
slot0 = CoreDatabaseBrowserInputDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = self._key_text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._key = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_ok_button = slot1
slot0 = CoreDatabaseBrowserInputDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = false
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_cancel_button = slot1
slot0 = CoreDatabaseBrowserInputDialog

function slot1(self)
	slot1 = self._key

	return slot1
end

slot0.get_value = slot1
slot0 = CoreDatabaseBrowserRenameDialog

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreDatabaseBrowserRenameDialog = slot0
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self, p)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Dialog
	slot5 = p
	slot6 = "Rename"
	slot7 = ""
	slot8 = Vector3
	slot10 = -1
	slot11 = -1
	slot12 = 0
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = Vector3
	slot11 = 300
	slot12 = 86
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = "CAPTION,SYSTEM_MENU,STAY_ON_TOP"
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	self._dialog = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.BoxSizer
	slot5 = "VERTICAL"
	local box = slot2(slot3, slot4)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	local text_box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._dialog
	slot8 = ""
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	self._key_text_ctrl = slot4
	slot4 = self._key_text_ctrl
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_ok_button"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = text_box
	slot4 = text_box.add
	slot7 = self._key_text_ctrl
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = text_box
	slot8 = 0
	slot9 = 4
	slot10 = "ALL,EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local button_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Rename"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._ok = slot5
	slot5 = self._ok
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_ok_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._ok
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = self._dialog
	slot9 = "Cancel"
	slot10 = ""
	slot11 = ""
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	self._cancel = slot5
	slot5 = self._cancel
	slot7 = slot5
	slot5 = slot5.connect
	slot8 = ""
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_cancel_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = ""

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = button_box
	slot5 = button_box.add
	slot8 = self._cancel
	slot9 = 1
	slot10 = 4
	slot11 = "ALL,EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = box
	slot5 = box.add
	slot8 = button_box
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = self._dialog
	slot7 = slot5
	slot5 = slot5.set_sizer
	slot8 = box

	slot5(slot6, slot7)

	slot5 = self._key_text_ctrl
	slot7 = slot5
	slot5 = slot5.set_focus

	slot5(slot6)

	return 
end

slot0.init = slot1
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self)
	slot1 = nil
	self._key = slot1
	slot1 = false
	self._done = slot1
	slot1 = true
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.show_modal

	slot1(slot2)

	slot1 = self._done

	while not slot1 do
	end

	slot1 = self._return_val

	return slot1
end

slot0.show_modal = slot1
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = self._key_text_ctrl
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)
	self._key = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_ok_button = slot1
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self)
	slot1 = true
	self._done = slot1
	slot1 = false
	self._return_val = slot1
	slot1 = self._dialog
	slot3 = slot1
	slot1 = slot1.end_modal
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.on_cancel_button = slot1
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self)
	slot1 = self._key

	return slot1
end

slot0.get_value = slot1
slot0 = CoreDatabaseBrowserRenameDialog

function slot1(self, str)
	slot2 = self._key_text_ctrl
	slot4 = slot2
	slot2 = slot2.set_value
	slot5 = str

	slot2(slot3, slot4)

	return 
end

slot0.set_value = slot1

return 
