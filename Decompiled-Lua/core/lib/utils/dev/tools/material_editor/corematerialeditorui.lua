-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = require
slot2 = "core/lib/utils/dev/tools/material_editor/CoreMaterialEditorDialogs"

slot0(slot1)

slot0 = require
slot2 = "core/lib/utils/dev/ews/tree_control/CoreManagedTreeControl"

slot0(slot1)

slot0 = CoreMaterialEditor

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreMaterialEditor = slot0
slot0 = CoreMaterialEditor

function slot1(self)
	slot1 = EWS
	slot3 = slot1
	slot1 = slot1.Frame
	slot4 = self.FRAME_TITLE
	slot5 = Vector3
	slot7 = -1
	slot8 = -1
	slot9 = 0
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = Vector3
	slot8 = 450
	slot9 = 800
	slot10 = 0
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE"
	slot8 = Global
	slot8 = slot8.frame
	slot1 = slot1(slot2, slot3, slot4, slot5, slot6, slot7)
	self._main_frame = slot1
	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.set_icon
	slot4 = self.FRAME_ICON

	slot1(slot2, slot3)

	slot1 = EWS
	slot3 = slot1
	slot1 = slot1.ToolBar
	slot4 = self._main_frame
	slot5 = ""
	slot6 = "TB_FLAT,TB_NOALIGN"
	slot1 = slot1(slot2, slot3, slot4, slot5)
	self._main_frame_tool_bar = slot1
	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_tool
	slot4 = "NEW"
	slot5 = "New"
	slot6 = self.NEW_ICON
	slot7 = "Creates a new material configuration."

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_tool
	slot4 = "OPEN"
	slot5 = "Open"
	slot6 = self.OPEN_ICON
	slot7 = "Opens a material configuration."

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_tool
	slot4 = "SAVE"
	slot5 = "Save"
	slot6 = self.SAVE_ICON
	slot7 = "Saves this material configuration."

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_separator

	slot1(slot2)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_tool
	slot4 = "RELOAD"
	slot5 = "Reload Material Config"
	slot6 = self.RELOAD_ICON
	slot7 = "Reloads this material config."

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_separator

	slot1(slot2)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.add_tool
	slot4 = "PROBLEM_SOLVER"
	slot5 = "Problem Solver"
	slot6 = self.PROBLEM_SOLVER_ICON
	slot7 = "Do you need help?"

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = self._main_frame_tool_bar
	slot3 = slot1
	slot1 = slot1.realize

	slot1(slot2)

	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.set_tool_bar
	slot4 = self._main_frame_tool_bar

	slot1(slot2, slot3)

	slot1 = EWS
	slot3 = slot1
	slot1 = slot1.StatusBar
	slot4 = self._main_frame
	slot5 = ""
	slot6 = ""
	slot1 = slot1(slot2, slot3, slot4, slot5)
	self._main_frame_status_bar = slot1
	slot1 = self._main_frame
	slot3 = slot1
	slot1 = slot1.set_status_bar
	slot4 = self._main_frame_status_bar

	slot1(slot2, slot3)

	slot1 = EWS
	slot3 = slot1
	slot1 = slot1.MenuBar
	local menu_bar = slot1(slot2)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Menu
	slot5 = ""
	local file_menu = slot2(slot3, slot4)
	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "NEW"
	slot7 = "New\tCtrl+N"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "OPEN"
	slot7 = "Open\tCtrl+O"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_separator

	slot3(slot4)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "SAVE"
	slot7 = "Save\tCtrl+S"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "SAVE_AS"
	slot7 = "Save As"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_separator

	slot3(slot4)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "SAVE_GLOBAL"
	slot7 = "Save Global"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_separator

	slot3(slot4)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "RELOAD"
	slot7 = "Reload Material Config"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_separator

	slot3(slot4)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "NEWS"
	slot7 = "Get Latest News"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = file_menu
	slot3 = file_menu.append_separator

	slot3(slot4)

	slot5 = file_menu
	slot3 = file_menu.append_item
	slot6 = "EXIT"
	slot7 = "Exit"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = menu_bar
	slot3 = menu_bar.append
	slot6 = file_menu
	slot7 = "File"

	slot3(slot4, slot5, slot6)

	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Menu
	slot6 = ""
	slot3 = slot3(slot4, slot5)
	self._tools_menu = slot3
	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.append_item
	slot6 = "REBUILD"
	slot7 = "Rebuild"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.append_item
	slot6 = "EDIT_GLOBAL"
	slot7 = "Edit Global"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.append_item
	slot6 = "REMOTE_COMPILER"
	slot7 = "Remote Compiler"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.append_separator

	slot3(slot4)

	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.append_check_item
	slot6 = "FEEDBACK"
	slot7 = "Real Time Feedback"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot3 = self._tools_menu
	slot5 = slot3
	slot3 = slot3.set_checked
	slot6 = "FEEDBACK"
	slot7 = true

	slot3(slot4, slot5, slot6)

	slot5 = menu_bar
	slot3 = menu_bar.append
	slot6 = self._tools_menu
	slot7 = "Tools"

	slot3(slot4, slot5, slot6)

	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Menu
	slot6 = ""
	slot3 = slot3(slot4, slot5)
	self._help_menu = slot3
	slot3 = self._help_menu
	slot5 = slot3
	slot3 = slot3.append_item
	slot6 = "PROBLEM_SOLVER"
	slot7 = "Problem Solver"
	slot8 = ""

	slot3(slot4, slot5, slot6, slot7)

	slot5 = menu_bar
	slot3 = menu_bar.append
	slot6 = self._help_menu
	slot7 = "Help"

	slot3(slot4, slot5, slot6)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.set_menu_bar
	slot6 = menu_bar

	slot3(slot4, slot5)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "NEW"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_new"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "OPEN"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_open"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "SAVE"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_save"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "SAVE_AS"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_save_as"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "SAVE_GLOBAL"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_save_global"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "RELOAD"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_reload"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "NEWS"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_check_news"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "EXIT"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_close"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "REBUILD"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_rebuild"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "EDIT_GLOBAL"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_edit_global"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "REMOTE_COMPILER"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_change_remote_server"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "FEEDBACK"
	slot7 = "EVT_COMMAND_MENU_SELECTED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_feedback"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "PROBLEM_SOLVER"
	slot7 = "EVT_COMMAND_MENU_SELECTED"

	function slot8()
		slot0 = EWS
		slot2 = slot0
		slot0 = slot0.launch_url
		slot3 = "http://mondomonkey.com/MondoMonkeyWhiteB.jpg"

		slot0(slot1, slot2)

		return 
	end

	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._main_frame
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = ""
	slot7 = "EVT_CLOSE_WINDOW"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "_on_close"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.ScrolledWindow
	slot6 = self._main_frame
	slot7 = ""
	slot8 = "SUNKEN_BORDER"
	slot3 = slot3(slot4, slot5, slot6, slot7)
	self._main_scroll_window = slot3
	slot3 = self._main_scroll_window
	slot5 = slot3
	slot3 = slot3.set_background_colour
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.get_system_colour
	slot9 = "3DFACE"
	slot6 = slot6(slot7, slot8)
	slot6 = slot6 * 128
	slot8 = slot6
	slot6 = slot6.unpack

	slot3(slot4, slot6(slot7))

	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "VERTICAL"
	local main_frame_box = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "VERTICAL"
	local main_scroll_window_box = slot4(slot5, slot6)
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Panel
	slot8 = self._main_scroll_window
	slot9 = ""
	slot10 = ""
	local main_panel = slot5(slot6, slot7, slot8, slot9)
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "VERTICAL"
	local panel_box = slot6(slot7, slot8)
	slot7 = CoreEWS
	slot9 = slot7
	slot7 = slot7.CollapseBox
	slot10 = main_panel
	slot11 = "VERTICAL"
	slot12 = "Material"
	slot13 = nil
	slot14 = true
	slot15 = "NO_BORDER"
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	self._material_collapse_box = slot7
	slot7 = self._material_collapse_box
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_BUTTON_CLICKED"
	slot12 = self._layout_all
	slot13 = self

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._material_collapse_box
	slot9 = slot7
	slot7 = slot7.lower_panel
	slot7 = slot7(slot8)
	slot9 = slot7
	slot7 = slot7.set_background_colour
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.get_system_colour
	slot13 = "3DFACE"
	slot10 = slot10(slot11, slot12)
	slot10 = slot10 * 255
	slot12 = slot10
	slot10 = slot10.unpack

	slot7(slot8, slot10(slot11))

	slot9 = panel_box
	slot7 = panel_box.add
	slot10 = self._material_collapse_box
	slot12 = slot10
	slot10 = slot10.panel
	slot10 = slot10(slot11)
	slot11 = 0
	slot12 = 4
	slot13 = "ALL,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.ListBox
	slot10 = self._material_collapse_box
	slot12 = slot10
	slot10 = slot10.lower_panel
	slot10 = slot10(slot11)
	slot11 = "material_editor_list"
	slot12 = "LB_SORT"
	slot7 = slot7(slot8, slot9, slot10, slot11)
	self._material_list_box = slot7
	slot7 = self._material_list_box
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_LISTBOX_SELECTED"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "_on_material_selected"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ""

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._material_list_box
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_RIGHT_UP"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "_on_material_popup"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ""

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._material_list_box
	slot9 = slot7
	slot7 = slot7.set_min_size
	slot10 = Vector3
	slot12 = 0
	slot13 = 150
	slot14 = 0

	slot7(slot8, slot10(slot11, slot12, slot13))

	slot7 = self._material_collapse_box
	slot9 = slot7
	slot7 = slot7.box
	slot7 = slot7(slot8)
	slot9 = slot7
	slot7 = slot7.add
	slot10 = self._material_list_box
	slot11 = 1
	slot12 = 4
	slot13 = "ALL,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = CoreEWS
	slot9 = slot7
	slot7 = slot7.CollapseBox
	slot10 = main_panel
	slot11 = "VERTICAL"
	slot12 = "Shader"
	slot13 = nil
	slot14 = true
	slot15 = "NO_BORDER"
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	self._shader_collapse_box = slot7
	slot7 = self._shader_collapse_box
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = ""
	slot11 = "EVT_COMMAND_BUTTON_CLICKED"
	slot12 = self._layout_all
	slot13 = self

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._shader_collapse_box
	slot9 = slot7
	slot7 = slot7.lower_panel
	slot7 = slot7(slot8)
	slot9 = slot7
	slot7 = slot7.set_background_colour
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.get_system_colour
	slot13 = "3DFACE"
	slot10 = slot10(slot11, slot12)
	slot10 = slot10 * 255
	slot12 = slot10
	slot10 = slot10.unpack

	slot7(slot8, slot10(slot11))

	slot9 = panel_box
	slot7 = panel_box.add
	slot10 = self._shader_collapse_box
	slot12 = slot10
	slot10 = slot10.panel
	slot10 = slot10(slot11)
	slot11 = 0
	slot12 = 4
	slot13 = "ALL,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "HORIZONTAL"
	local box = slot7(slot8, slot9)
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.StaticText
	slot11 = self._shader_collapse_box
	slot13 = slot11
	slot11 = slot11.lower_panel
	slot11 = slot11(slot12)
	slot12 = "Compilable Shader: "
	slot13 = ""
	slot14 = ""
	local text = slot8(slot9, slot10, slot11, slot12, slot13)
	slot11 = box
	slot9 = box.add
	slot12 = text
	slot13 = 0
	slot14 = 4
	slot15 = "ALL,EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.ComboBox
	slot12 = self._shader_collapse_box
	slot14 = slot12
	slot12 = slot12.lower_panel
	slot12 = slot12(slot13)
	slot13 = ""
	slot14 = ""
	slot15 = "CB_READONLY,CB_SORT"
	slot9 = slot9(slot10, slot11, slot12, slot13, slot14)
	self._compilable_shader_combo_box = slot9
	slot9 = self._compilable_shader_combo_box
	slot11 = slot9
	slot9 = slot9.connect
	slot12 = ""
	slot13 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot14 = callback
	slot16 = self
	slot17 = self
	slot18 = "_on_shader_combobox_selected"
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = ""

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot11 = box
	slot9 = box.add
	slot12 = self._compilable_shader_combo_box
	slot13 = 1
	slot14 = 4
	slot15 = "ALL,EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = self._shader_collapse_box
	slot11 = slot9
	slot9 = slot9.box
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.add
	slot12 = box
	slot13 = 0
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.StaticLine
	slot12 = self._shader_collapse_box
	slot14 = slot12
	slot12 = slot12.lower_panel
	slot12 = slot12(slot13)
	slot13 = ""
	slot14 = ""
	local line = slot9(slot10, slot11, slot12, slot13)
	slot10 = self._shader_collapse_box
	slot12 = slot10
	slot10 = slot10.box
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.add
	slot13 = line
	slot14 = 0
	slot15 = 4
	slot16 = "ALL,EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Panel
	slot13 = self._shader_collapse_box
	slot15 = slot13
	slot13 = slot13.lower_panel
	slot13 = slot13(slot14)
	slot14 = ""
	slot15 = ""
	slot10 = slot10(slot11, slot12, slot13, slot14)
	self._shader_option_panel = slot10
	slot10 = self._shader_collapse_box
	slot12 = slot10
	slot10 = slot10.box
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.add
	slot13 = self._shader_option_panel
	slot14 = 1
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.BoxSizer
	slot13 = "VERTICAL"
	slot10 = slot10(slot11, slot12)
	self._shader_option_box = slot10
	slot10 = self._shader_option_panel
	slot12 = slot10
	slot10 = slot10.set_sizer
	slot13 = self._shader_option_box

	slot10(slot11, slot12)

	slot10 = CoreManagedTreeControl
	slot12 = slot10
	slot10 = slot10.new
	slot13 = self._shader_option_panel
	slot14 = "TR_HAS_BUTTONS,TR_HIDE_ROOT,TR_LINES_AT_ROOT,TR_SINGLE,TR_HAS_CHECKBOX"
	slot10 = slot10(slot11, slot12, slot13)
	self._shader_option_tree = slot10
	slot10 = self._shader_option_tree
	slot12 = slot10
	slot10 = slot10.get_image_list
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.add
	slot13 = CoreEWS
	slot13 = slot13.image_path
	slot15 = "folder_16x16.png"
	slot10 = slot10(slot11, slot13(slot14))
	self._section_image_id = slot10
	slot10 = self._shader_option_tree
	slot12 = slot10
	slot10 = slot10.get_image_list
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.add
	slot13 = CoreEWS
	slot13 = slot13.image_path
	slot15 = "folder_open_16x16.png"
	slot10 = slot10(slot11, slot13(slot14))
	self._section_open_image_id = slot10
	slot10 = self._shader_option_tree
	slot12 = slot10
	slot10 = slot10.set_min_size
	slot13 = Vector3
	slot15 = 0
	slot16 = 175
	slot17 = 0

	slot10(slot11, slot13(slot14, slot15, slot16))

	slot10 = self._shader_option_tree
	slot12 = slot10
	slot10 = slot10.add_to_sizer
	slot13 = self._shader_option_box
	slot14 = 1
	slot15 = 4
	slot16 = "EXPAND,ALL"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.BoxSizer
	slot13 = "VERTICAL"
	local cmpbox = slot10(slot11, slot12)
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.BoxSizer
	slot14 = "HORIZONTAL"
	slot11 = slot11(slot12, slot13)
	box = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.CheckBox
	slot14 = self._shader_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "Remote Compile"
	slot16 = ""
	slot17 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._remote_compile_checkbox = slot11
	slot13 = box
	slot11 = box.add
	slot14 = self._remote_compile_checkbox
	slot15 = 1
	slot16 = 4
	slot17 = "ALL"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._remote_compile_checkbox
	slot13 = slot11
	slot11 = slot11.set_enabled
	slot14 = self._remote_host

	slot11(slot12, slot13)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.Button
	slot14 = self._shader_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "Compile"
	slot16 = ""
	slot17 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._compile_button = slot11
	slot11 = self._compile_button
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "_on_compile_btn"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = ""

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = box
	slot11 = box.add
	slot14 = self._compile_button
	slot15 = 0
	slot16 = 4
	slot17 = "ALL"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = cmpbox
	slot11 = cmpbox.add
	slot14 = box
	slot15 = 0
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.BoxSizer
	slot14 = "HORIZONTAL"
	slot11 = slot11(slot12, slot13)
	box = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.StaticText
	slot14 = self._shader_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = ""
	slot16 = ""
	slot17 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._compile_info_text = slot11
	slot11 = self._compile_info_text
	slot13 = slot11
	slot11 = slot11.set_font_family
	slot14 = "FONTFAMILY_TELETYPE"

	slot11(slot12, slot13)

	slot11 = self._compile_info_text
	slot13 = slot11
	slot11 = slot11.set_font_weight
	slot14 = "FONTWEIGHT_BOLD"

	slot11(slot12, slot13)

	slot13 = box
	slot11 = box.add
	slot14 = self._compile_info_text
	slot15 = 1
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = cmpbox
	slot11 = cmpbox.add
	slot14 = box
	slot15 = 0
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._shader_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = cmpbox
	slot15 = 0
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.CollapseBox
	slot14 = main_panel
	slot15 = "VERTICAL"
	slot16 = "Parameter"
	slot17 = nil
	slot18 = true
	slot19 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	self._parameter_collapse_box = slot11
	slot11 = self._parameter_collapse_box
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = self._layout_all
	slot17 = self

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._parameter_collapse_box
	slot13 = slot11
	slot11 = slot11.lower_panel
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_background_colour
	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.get_system_colour
	slot17 = "3DFACE"
	slot14 = slot14(slot15, slot16)
	slot14 = slot14 * 255
	slot16 = slot14
	slot14 = slot14.unpack

	slot11(slot12, slot14(slot15))

	slot13 = panel_box
	slot11 = panel_box.add
	slot14 = self._parameter_collapse_box
	slot16 = slot14
	slot14 = slot14.panel
	slot14 = slot14(slot15)
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.BoxSizer
	slot14 = "HORIZONTAL"
	slot11 = slot11(slot12, slot13)
	box = slot11
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.StaticText
	slot14 = self._parameter_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "Parent: "
	slot16 = ""
	slot17 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	text = slot11
	slot13 = box
	slot11 = box.add
	slot14 = text
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.ComboBox
	slot14 = self._parameter_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = ""
	slot16 = ""
	slot17 = "CB_READONLY,CB_SORT"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._parent_combo_box = slot11
	slot11 = self._parent_combo_box
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "_on_parent_combo_box_change"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = ""

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = box
	slot11 = box.add
	slot14 = self._parent_combo_box
	slot15 = 1
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._parameter_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = box
	slot15 = 0
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.StaticLine
	slot14 = self._parameter_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = ""
	slot16 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15)
	line = slot11
	slot11 = self._parameter_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = line
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.CollapseBox
	slot14 = main_panel
	slot15 = "VERTICAL"
	slot16 = "Output"
	slot17 = nil
	slot18 = false
	slot19 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	self._output_collapse_box = slot11
	slot11 = self._output_collapse_box
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = self._layout_all
	slot17 = self

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._output_collapse_box
	slot13 = slot11
	slot11 = slot11.lower_panel
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_background_colour
	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.get_system_colour
	slot17 = "3DFACE"
	slot14 = slot14(slot15, slot16)
	slot14 = slot14 * 255
	slot16 = slot14
	slot14 = slot14.unpack

	slot11(slot12, slot14(slot15))

	slot13 = panel_box
	slot11 = panel_box.add
	slot14 = self._output_collapse_box
	slot16 = slot14
	slot14 = slot14.panel
	slot14 = slot14(slot15)
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.CollapseBox
	slot14 = self._output_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "VERTICAL"
	slot16 = "Material"
	slot17 = nil
	slot18 = false
	slot19 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	self._material_output_collapse_box = slot11
	slot11 = self._material_output_collapse_box
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = self._layout_output
	slot17 = self

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._material_output_collapse_box
	slot13 = slot11
	slot11 = slot11.lower_panel
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_background_colour
	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.get_system_colour
	slot17 = "3DFACE"
	slot14 = slot14(slot15, slot16)
	slot14 = slot14 * 255
	slot16 = slot14
	slot14 = slot14.unpack

	slot11(slot12, slot14(slot15))

	slot11 = self._output_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = self._material_output_collapse_box
	slot16 = slot14
	slot14 = slot14.panel
	slot14 = slot14(slot15)
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.XMLTextCtrl
	slot14 = self._material_output_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15, slot16, slot17 = nil
	slot18 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17)
	self._output_text_ctrl = slot11
	slot11 = self._output_text_ctrl
	slot13 = slot11
	slot11 = slot11.text_ctrl
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_min_size
	slot14 = Vector3
	slot16 = 0
	slot17 = 150
	slot18 = 0

	slot11(slot12, slot14(slot15, slot16, slot17))

	slot11 = self._material_output_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = self._output_text_ctrl
	slot16 = slot14
	slot14 = slot14.text_ctrl
	slot14 = slot14(slot15)
	slot15 = 1
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.CollapseBox
	slot14 = self._output_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "VERTICAL"
	slot16 = "Global"
	slot17 = nil
	slot18 = false
	slot19 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	self._global_output_collapse_box = slot11
	slot11 = self._global_output_collapse_box
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = self._layout_output
	slot17 = self

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._global_output_collapse_box
	slot13 = slot11
	slot11 = slot11.lower_panel
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_background_colour
	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.get_system_colour
	slot17 = "3DFACE"
	slot14 = slot14(slot15, slot16)
	slot14 = slot14 * 255
	slot16 = slot14
	slot14 = slot14.unpack

	slot11(slot12, slot14(slot15))

	slot11 = self._output_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = self._global_output_collapse_box
	slot16 = slot14
	slot14 = slot14.panel
	slot14 = slot14(slot15)
	slot15 = 0
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = CoreEWS
	slot13 = slot11
	slot11 = slot11.XMLTextCtrl
	slot14 = self._global_output_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15, slot16, slot17 = nil
	slot18 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17)
	self._global_text_ctrl = slot11
	slot11 = self._global_text_ctrl
	slot13 = slot11
	slot11 = slot11.text_ctrl
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.set_min_size
	slot14 = Vector3
	slot16 = 0
	slot17 = 150
	slot18 = 0

	slot11(slot12, slot14(slot15, slot16, slot17))

	slot11 = self._global_output_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = self._global_text_ctrl
	slot16 = slot14
	slot14 = slot14.text_ctrl
	slot14 = slot14(slot15)
	slot15 = 1
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.Button
	slot14 = self._output_collapse_box
	slot16 = slot14
	slot14 = slot14.lower_panel
	slot14 = slot14(slot15)
	slot15 = "Update"
	slot16 = ""
	slot17 = "NO_BORDER"
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	self._output_update_button = slot11
	slot11 = self._output_update_button
	slot13 = slot11
	slot11 = slot11.connect
	slot14 = ""
	slot15 = "EVT_COMMAND_BUTTON_CLICKED"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "_update_output"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = ""

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._output_collapse_box
	slot13 = slot11
	slot11 = slot11.box
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.add
	slot14 = self._output_update_button
	slot15 = 0
	slot16 = 4
	slot17 = "ALIGN_RIGHT,ALL"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = main_panel
	slot11 = main_panel.set_sizer
	slot14 = panel_box

	slot11(slot12, slot13)

	slot13 = main_scroll_window_box
	slot11 = main_scroll_window_box.add
	slot14 = main_panel
	slot15 = 1
	slot16 = 4
	slot17 = "ALL,EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = main_frame_box
	slot11 = main_frame_box.add
	slot14 = self._main_scroll_window
	slot15 = 1
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = self._main_scroll_window
	slot13 = slot11
	slot11 = slot11.set_sizer
	slot14 = main_scroll_window_box

	slot11(slot12, slot13)

	slot11 = self._main_scroll_window
	slot13 = slot11
	slot11 = slot11.set_scroll_rate
	slot14 = Vector3
	slot16 = 0
	slot17 = 20
	slot18 = 0

	slot11(slot12, slot14(slot15, slot16, slot17))

	slot11 = self._main_scroll_window
	slot13 = slot11
	slot11 = slot11.set_virtual_size_hints
	slot14 = Vector3
	slot16 = 0
	slot17 = 0
	slot18 = 0
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = Vector3
	slot17 = 1
	slot18 = -1
	slot19 = -1

	slot11(slot12, slot13, slot15(slot16, slot17, slot18))

	slot11 = self._main_scroll_window
	slot13 = slot11
	slot11 = slot11.set_virtual_size
	slot14 = Vector3
	slot16 = -1
	slot17 = -1
	slot18 = 0

	slot11(slot12, slot14(slot15, slot16, slot17))

	slot11 = self._main_scroll_window
	slot13 = slot11
	slot11 = slot11.enable_scrolling
	slot14 = false
	slot15 = true

	slot11(slot12, slot13, slot14)

	slot11 = self._main_frame
	slot13 = slot11
	slot11 = slot11.set_sizer
	slot14 = main_frame_box

	slot11(slot12, slot13)

	slot11 = self._main_frame
	slot13 = slot11
	slot11 = slot11.set_visible
	slot14 = true

	slot11(slot12, slot13)

	return 
end

slot0._create_main_frame = slot1
slot0 = CoreMaterialEditor

function slot1(self)
	slot1 = self._compilable_shader_combo_box
	slot3 = slot1
	slot1 = slot1.get_value
	local shader_name = slot1(slot2)
	slot2 = self._shader_option_tree_name

	if slot2 ~= shader_name then
		slot4 = self
		slot2 = self._freeze_frame

		slot2(slot3)

		slot2 = self._shader_option_tree
		slot4 = slot2
		slot2 = slot2.clear

		slot2(slot3)

		slot2 = {}
		self._shader_defines = slot2
		self._shader_option_tree_name = shader_name
		slot2 = self._compilable_shaders
		slot2 = slot2[shader_name]
		local shader = slot2._node
		slot3 = self._shader_option_tree
		slot5 = slot3
		slot3 = slot3.root_node
		local root = slot3(slot4)
		slot6 = self
		slot4 = self._get_node
		slot7 = shader
		slot8 = "editor"
		local editor_node = slot4(slot5, slot6, slot7)
		slot7 = self
		slot5 = self._build_section
		slot8 = shader_name
		slot9 = shader
		slot10 = editor_node
		slot11 = root

		slot5(slot6, slot7, slot8, slot9, slot10)

		slot5 = self._shader_option_panel
		slot7 = slot5
		slot5 = slot5.layout

		slot5(slot6)

		slot7 = self
		slot5 = self._unfreeze_frame

		slot5(slot6)
	end

	return 
end

slot0._build_shader_options = slot1
slot0 = CoreMaterialEditor

function slot1(self, node, item)
	slot6 = "tooltip"
	local tooltip = node.parameter(slot4, node) or ""
	slot4 = self._shader_option_tree
	slot6 = slot4
	slot4 = slot4.set_tooltip
	slot7 = item
	slot8 = tooltip

	slot4(slot5, slot6, slot7)

	return 
end

slot0._set_shader_option_tooltip = slot1
slot0 = CoreMaterialEditor

function slot1(self, shader_name, shader, node, tree)
	slot7 = node
	slot5 = node.children
	slot5, slot6, slot7 = slot5(slot6)

	for child in slot5, slot6, slot7 do
		slot11 = child
		slot9 = child.parameter
		slot12 = "project"
		local project = slot9(slot10, slot11)
		slot12 = child
		slot10 = child.name
		slot10 = slot10(slot11)

		if slot10 == "define" then
		else
			slot12 = child
			slot10 = child.name
			slot10 = slot10(slot11)

			if slot10 == "section" then
				slot12 = tree
				slot10 = tree.append
				slot15 = child
				slot13 = child.parameter
				slot16 = "name"
				local section_node = slot10(slot11, slot13(slot14, slot15))
				slot13 = section_node
				slot11 = section_node.set_image
				slot14 = self._section_image_id
				slot15 = "NORMAL"

				slot11(slot12, slot13, slot14)

				slot13 = section_node
				slot11 = section_node.set_image
				slot14 = self._section_open_image_id
				slot15 = "EXPANDED"

				slot11(slot12, slot13, slot14)

				slot13 = self
				slot11 = self._set_shader_option_tooltip
				slot14 = child
				slot15 = section_node

				slot11(slot12, slot13, slot14)

				slot13 = self
				slot11 = self._build_section
				slot14 = shader_name
				slot15 = shader
				slot16 = child
				slot17 = section_node

				slot11(slot12, slot13, slot14, slot15, slot16)
			end
		end
	end

	return 
end

slot0._build_section = slot1
slot0 = CoreMaterialEditor

function slot1(self)

	-- Decompilation error in this vicinity:
	local progress_dialog = nil
	slot2 = self._material_config_node
	slot4 = slot2
	slot2 = slot2.num_children
	slot2 = slot2(slot3)
	slot3 = 1

	if slot3 < slot2 then
		slot2 = self._output_collapse_box
		slot4 = slot2
		slot2 = slot2.expanded
		slot2 = slot2(slot3)

		if slot2 then
		end
	end

	slot4 = self
	slot2 = self._freeze_output

	slot2(slot3)

	slot4 = self
	slot2 = self._freeze_frame

	slot2(slot3)

	slot2 = self._material_parameter_widgets

	if slot2 then
		slot2 = pairs
		slot4 = self._material_parameter_widgets
		slot2, slot3, slot4 = slot2(slot3)

		for k, v in slot2, slot3, slot4 do
			slot9 = v
			slot7 = v.destroy

			slot7(slot8)
		end
	end

	slot2 = self._parent_combo_box
	slot4 = slot2
	slot2 = slot2.set_value
	slot5 = self._current_material_node
	slot4 = self._parameter_widgets
	slot4 = slot4.decal
	slot6 = slot4
	slot4 = slot4.new
	slot7 = self._parameter_collapse_box
	slot9 = slot7
	slot7 = slot7.lower_panel
	slot7 = slot7(slot8)
	slot8 = self
	slot4 = slot4(slot5, slot6, slot7)
	local widget = slot4
	slot4 = self._material_parameter_widgets
	slot4.decal = widget
	slot4 = self._parameter_collapse_box
	slot6 = slot4
	slot4 = slot4.box
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.add
	slot9 = widget
	slot7 = widget.panel
	slot7 = slot7(slot8)
	slot8 = 0
	slot9 = 4
	slot10 = "ALL,EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._parameter_collapse_box
	slot6 = slot4
	slot4 = slot4.lower_panel
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.layout

	slot4(slot5)

	slot4 = self._main_scroll_window
	slot6 = slot4
	slot4 = slot4.fit_inside

	slot4(slot5)

	slot6 = self
	slot4 = self._unfreeze_frame

	slot4(slot5)

	slot6 = self
	slot4 = self._unfreeze_output

	slot4(slot5)

	if progress_dialog then
		slot6 = progress_dialog
		slot4 = progress_dialog.update_bar
		slot7 = 100

		slot4(slot5, slot6)
	end

	return 
end

slot0._create_parameter_panel = slot1

return 
