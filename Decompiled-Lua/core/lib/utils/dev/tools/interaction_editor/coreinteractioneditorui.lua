slot3 = "CoreInteractionEditorUI"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreInteractionEditorConfig"

core.import(slot1, core)

slot3 = "CoreInteractionEditorPropUI"

core.import(slot1, core)

InteractionEditorUI = InteractionEditorUI or CoreClass.class()
function InteractionEditorUI:init(owner)
	slot10 = -1
	slot11 = 0
	slot9 = Global.frame
	self._main_frame = EWS.Frame(slot3, EWS, CoreInteractionEditorConfig.EDITOR_TITLE, Vector3(slot7, -1, -1), Vector3(-1, 1000, 800), "")
	local menu_bar = EWS.MenuBar(slot3)
	slot6 = ""
	self._file_menu = EWS.Menu(EWS, EWS)
	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "NEW", "New\tCtrl-N")

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "OPEN", "Open\tCtrl-O")

	slot5 = self._file_menu

	self._file_menu.append_separator(EWS)

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "SAVE", "Save\tCtrl-S")

	slot7 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "SAVE")

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "SAVE_AS", "Save As")

	slot7 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "SAVE_AS")

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "SAVE_ALL", "Save All")

	slot7 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "SAVE_ALL")

	slot5 = self._file_menu

	self._file_menu.append_separator(EWS)

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "CLOSE", "Close\tCtrl-W")

	slot7 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "CLOSE")

	slot5 = self._file_menu

	self._file_menu.append_separator(EWS)

	slot8 = ""

	self._file_menu.append_item(EWS, self._file_menu, "EXIT", "Exit")

	slot7 = "File"

	menu_bar.append(EWS, menu_bar, self._file_menu)

	slot6 = ""
	local edit_menu = EWS.Menu(EWS, EWS)
	slot9 = ""

	edit_menu.append_item(EWS, edit_menu, "UNDO", "Undo\tCtrl-Z")

	slot8 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "UNDO")

	slot9 = ""

	edit_menu.append_item(EWS, edit_menu, "REDO", "Redo\tCtrl-Y")

	slot8 = false

	self._file_menu.set_enabled(EWS, self._file_menu, "REDO")

	slot8 = "Edit"

	menu_bar.append(EWS, menu_bar, edit_menu)

	slot7 = menu_bar

	self._main_frame.set_menu_bar(EWS, self._main_frame)

	slot9 = "TB_FLAT,TB_NOALIGN"
	self._tool_bar = EWS.ToolBar(EWS, EWS, self._main_frame, "")
	slot10 = ""

	self._tool_bar.add_tool(EWS, self._tool_bar, "NEW", "New", CoreInteractionEditorConfig.NEW_ICON)

	slot10 = ""

	self._tool_bar.add_tool(EWS, self._tool_bar, "OPEN", "Open", CoreInteractionEditorConfig.OPEN_ICON)

	slot6 = self._tool_bar

	self._tool_bar.add_separator(EWS)

	slot10 = ""

	self._tool_bar.add_tool(EWS, self._tool_bar, "SAVE", "Save", CoreInteractionEditorConfig.SAVE_ICON)

	slot8 = false

	self._tool_bar.set_tool_enabled(EWS, self._tool_bar, "SAVE")

	slot10 = ""

	self._tool_bar.add_tool(EWS, self._tool_bar, "SAVE_ALL", "Save All", CoreInteractionEditorConfig.SAVE_ALL_ICON)

	slot8 = false

	self._tool_bar.set_tool_enabled(EWS, self._tool_bar, "SAVE_ALL")

	slot6 = self._tool_bar

	self._tool_bar.add_separator(EWS)

	slot10 = ""

	self._tool_bar.add_tool(EWS, self._tool_bar, "CLOSE", "Close", CoreInteractionEditorConfig.CLOSE_ICON)

	slot8 = false

	self._tool_bar.set_tool_enabled(EWS, self._tool_bar, "CLOSE")

	slot7 = self._tool_bar

	self._main_frame.set_tool_bar(EWS, self._main_frame)

	slot6 = self._tool_bar

	self._tool_bar.realize(EWS)

	slot9 = ""
	self._status_bar = EWS.StatusBar(EWS, EWS, self._main_frame, "")
	slot7 = self._status_bar

	self._main_frame.set_status_bar(EWS, self._main_frame)

	slot7 = "HORIZONTAL"
	local main_box = EWS.BoxSizer(EWS, EWS)
	slot10 = ""
	self._main_splitter = EWS.SplitterWindow(EWS, EWS, self._main_frame, "")
	self._main_notebook = EWS.Notebook(EWS, EWS, self._main_splitter, "")
	slot9 = owner
	self._prop_panel = CoreInteractionEditorPropUI.InteractionEditorPropUI.new(EWS, CoreInteractionEditorPropUI.InteractionEditorPropUI, self._main_splitter)
	slot11 = self._prop_panel
	slot10 = -1

	self._main_splitter.split_vertically(EWS, self._main_splitter, self._main_notebook, self._prop_panel.window(""))

	slot11 = "EXPAND"

	main_box.add(EWS, main_box, self._main_splitter, 1, 0)

	slot8 = main_box

	self._main_frame.set_sizer(EWS, self._main_frame)

	slot8 = 200

	self._main_splitter.set_minimum_pane_size(EWS, self._main_splitter)

	slot8 = 1

	self._main_splitter.set_sash_gravity(EWS, self._main_splitter)

	slot7 = self._main_splitter

	self._main_splitter.update_size(EWS)

	slot8 = true

	self._main_frame.set_visible(EWS, self._main_frame)

	self._owner = owner
	slot7 = self

	self.connect_events(EWS)

	return 
end
function InteractionEditorUI:frame()
	return self._main_frame
end
function InteractionEditorUI:set_position(pos)
	slot5 = pos

	self._main_frame.set_position(slot3, self._main_frame)

	return 
end
function InteractionEditorUI:set_title(text)
	slot5 = (text and CoreInteractionEditorConfig.EDITOR_TITLE .. " - " .. text) or CoreInteractionEditorConfig.EDITOR_TITLE

	self._main_frame.set_title(slot3, self._main_frame)

	return 
end
function InteractionEditorUI:connect_events()
	slot10 = "on_new"

	self._main_frame.connect(slot2, self._main_frame, "NEW", "EVT_COMMAND_MENU_SELECTED", callback(slot7, self._owner, self._owner))

	slot10 = "on_open"

	self._main_frame.connect(slot2, self._main_frame, "OPEN", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_save"

	self._main_frame.connect(slot2, self._main_frame, "SAVE", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_save_as"

	self._main_frame.connect(slot2, self._main_frame, "SAVE_AS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_save_all"

	self._main_frame.connect(slot2, self._main_frame, "SAVE_ALL", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_close_system"

	self._main_frame.connect(slot2, self._main_frame, "CLOSE", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_close"

	self._main_frame.connect(slot2, self._main_frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_undo"

	self._main_frame.connect(slot2, self._main_frame, "UNDO", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_redo"

	self._main_frame.connect(slot2, self._main_frame, "REDO", "EVT_COMMAND_MENU_SELECTED", callback(nil, self._owner, self._owner))

	slot10 = "on_close"

	self._main_frame.connect(slot2, self._main_frame, "", "EVT_CLOSE_WINDOW", callback(nil, self._owner, self._owner))

	slot10 = "on_notebook_changing"
	slot7 = nil

	self._main_frame.connect(slot2, self._main_frame, "", "EVT_COMMAND_NOTEBOOK_PAGE_CHANGED", callback(nil, self._owner, self._owner))

	return 
end
function InteractionEditorUI:create_graph_context_menu(system)
	slot4 = system
	slot11 = "on_show_graph_context_menu"

	system.graph(slot3).connect(slot3, system.graph(slot3), "", "EVT_RIGHT_UP", callback(system, self._owner, self._owner))

	slot5 = ""
	local add_menu = EWS.Menu(slot3, EWS)
	slot7 = InteractionDescription

	for _, v in ipairs(InteractionDescription.node_types("EVT_RIGHT_UP")) do
		slot14 = v
		slot14 = v

		add_menu.append_item(slot9, add_menu, "ADD_NODE_" .. string.upper(slot13), string.upper(slot13))

		slot10 = system
		slot10 = system.graph(slot9)
		slot17 = "on_add_node"

		function slot14()
			slot3 = v

			system.add_node(slot1, system)

			return 
		end

		system.graph(slot9).window(slot9).connect(slot9, system.graph(slot9).window(slot9), "ADD_NODE_" .. string.upper(""), "EVT_COMMAND_MENU_SELECTED", callback(v, self._owner, self._owner))
	end

	slot6 = ""
	local menu = EWS.Menu(slot4, EWS)

	menu.append_menu(EWS, menu, "ADD_NODE", "Add Node", add_menu)

	slot6 = menu

	menu.append_separator(EWS)

	slot9 = ""

	menu.append_item(EWS, menu, "DELETE_NODE", "Delete Node")

	slot6 = system
	slot6 = system.graph(EWS)
	slot13 = "on_remove_node"

	function slot10()
		slot4 = system

		for _, n in ipairs(system.selected_nodes(slot3)) do
			slot8 = n

			system.remove_node(slot6, system)
		end

		return 
	end

	system.graph(EWS).window(EWS).connect(EWS, system.graph(EWS).window(EWS), "DELETE_NODE", "EVT_COMMAND_MENU_SELECTED", callback("", self._owner, self._owner))

	return menu
end
function InteractionEditorUI:show_graph_context_menu(system)
	slot4 = system

	system.context_menu(slot3).set_enabled(slot3, system.context_menu(slot3), "DELETE_NODE")

	slot4 = system
	slot4 = system.graph(slot3)
	slot5 = system.context_menu(false)
	slot10 = 0

	system.graph(slot3).window(slot3).popup_menu(slot3, system.graph(slot3).window(slot3), Vector3(system, -1, -1))

	return 
end
function InteractionEditorUI:destroy()
	slot3 = self._main_frame

	if CoreCode.alive(slot2) then
		slot3 = self._main_frame

		self._main_frame.destroy(slot2)

		self._main_frame = nil
	end

	return 
end
function InteractionEditorUI:clean_prop_panel()
	slot3 = self._prop_panel

	self._prop_panel.clean(slot2)

	return 
end
function InteractionEditorUI:rebuild_prop_panel(desc, node)
	slot7 = node

	self._prop_panel.rebuild(slot4, self._prop_panel, desc)

	return 
end
function InteractionEditorUI:create_nb_page(caption, select)
	slot8 = ""
	local panel = EWS.Panel(slot4, EWS, self._main_notebook, "")
	slot10 = select

	return panel, self._main_notebook.add_page(self._main_notebook, self._main_notebook, panel, caption)
end
function InteractionEditorUI:destroy_nb_page(id)
	slot4 = self._main_notebook

	self._main_notebook.freeze(slot3)

	slot4 = self.set_nb_page(slot5, self)
	slot5 = 0
	slot10 = self
	slot10 = math.huge
	local newid = math.clamp(slot3, slot4, math.clamp(0, self.get_nb_page_count(slot9) - 2, 0))
	slot6 = id

	self._main_notebook.delete_page(slot4, self._main_notebook)

	slot6 = newid

	self.set_nb_page(slot4, self)

	slot5 = self._main_notebook

	self._main_notebook.thaw(slot4)

	slot5 = self._main_notebook

	self._main_notebook.refresh(slot4)

	return 
end
function InteractionEditorUI:current_nb_page()
	slot3 = self._main_notebook

	return self._main_notebook.get_current_page(slot2)
end
function InteractionEditorUI:get_nb_page_count()
	slot3 = self._main_notebook

	return self._main_notebook.get_page_count(slot2)
end
function InteractionEditorUI:set_nb_page(id)
	slot5 = id

	return self._main_notebook.set_page(slot3, self._main_notebook)
end
function InteractionEditorUI:get_nb_page(id)
	slot5 = id

	return self._main_notebook.get_page(slot3, self._main_notebook)
end
function InteractionEditorUI:update_nb_page_caption(id, text)
	slot7 = text

	self._main_notebook.set_page_text(slot4, self._main_notebook, id)

	return 
end
function InteractionEditorUI:get_nb_page_by_caption(text)
	slot5 = self._main_notebook

	for i = 0, self._main_notebook.get_page_count(slot4) - 1, 1 do
		slot9 = i

		if self._main_notebook.get_page_text(slot7, self._main_notebook) == text then
			return i
		end
	end

	return 
end
function InteractionEditorUI:get_nb_page_id(panel)
	slot5 = self._main_notebook

	for i = 0, self._main_notebook.get_page_count(slot4) - 1, 1 do
		slot9 = i

		if self._main_notebook.get_page(slot7, self._main_notebook) == panel then
			return i
		end
	end

	return 
end
function InteractionEditorUI:set_save_close_option_enabled(b)
	slot6 = b

	self._file_menu.set_enabled(slot3, self._file_menu, "SAVE")

	slot6 = b

	self._tool_bar.set_tool_enabled(slot3, self._tool_bar, "SAVE")

	slot6 = b

	self._file_menu.set_enabled(slot3, self._file_menu, "SAVE_AS")

	slot6 = b

	self._file_menu.set_enabled(slot3, self._file_menu, "SAVE_ALL")

	slot6 = b

	self._tool_bar.set_tool_enabled(slot3, self._tool_bar, "SAVE_ALL")

	slot6 = b

	self._file_menu.set_enabled(slot3, self._file_menu, "CLOSE")

	slot6 = b

	self._tool_bar.set_tool_enabled(slot3, self._tool_bar, "CLOSE")

	return 
end
function InteractionEditorUI:want_to_save(path)
	slot8 = "ICON_WARNING,YES_DEFAULT,YES_NO,CANCEL"
	slot13 = -1

	return EWS.message_box(slot3, EWS, self._main_frame, path .. " has changed.\nDo you want to save it?", "Save Changes", Vector3(slot10, -1, -1))
end

return 
