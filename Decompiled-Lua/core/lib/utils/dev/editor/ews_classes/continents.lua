ContinentPanel = ContinentPanel or class()
function ContinentPanel:init(parent)
	slot6 = "VERTICAL"

	self.create_panel(slot3, self, parent)

	slot6 = "VERTICAL"

	self.create_continent_panel(slot3, self, self._panel)

	slot7 = "Continents"
	self._continents_sizer = EWS.StaticBoxSizer(slot3, EWS, self._panel, "HORIZONTAL")
	slot8 = "EXPAND"

	self._panel_sizer.add(slot3, self._panel_sizer, self._continents_sizer, 1, 0)

	slot7 = self
	slot8 = "EXPAND"

	self._continents_sizer.add(slot3, self._continents_sizer, self.create_toolbar(1), 0, 0)

	slot8 = "EXPAND"

	self._continents_sizer.add(slot3, self._continents_sizer, self._continent_panel, 1, 0)

	slot7 = self
	slot8 = "EXPAND"

	self._panel_sizer.add(slot3, self._panel_sizer, self.create_world_setting(1), 0, 0)

	self._continent_panels = {}

	return 
end
function ContinentPanel:create_toolbar()
	slot4 = "VERTICAL"
	local toolbar_sizer = EWS.BoxSizer(slot2, EWS)
	slot7 = "TB_FLAT,TB_NODIVIDER,TB_VERTICAL"
	self._toolbar = EWS.ToolBar(EWS, EWS, self._panel, "")
	slot9 = "world_editor\\new_continent_16x16.png"

	self._toolbar.add_tool(EWS, self._toolbar, "CREATE_CONTINENT", "Create a new continent", CoreEWS.image_path(slot8))

	slot11 = "create_continent_dialog"

	self._toolbar.connect(EWS, self._toolbar, "CREATE_CONTINENT", "EVT_COMMAND_MENU_SELECTED", callback("Create a new continent", self, self))

	slot9 = "toolbar\\delete_16x16.png"

	self._toolbar.add_tool(EWS, self._toolbar, "DELETE_CONTINENT", "Delete the current continent", CoreEWS.image_path(nil))

	slot11 = "delete_continent"
	slot8 = nil

	self._toolbar.connect(EWS, self._toolbar, "DELETE_CONTINENT", "EVT_COMMAND_MENU_SELECTED", callback("Delete the current continent", self, self))

	slot8 = "EXPAND"

	toolbar_sizer.add(EWS, toolbar_sizer, self._toolbar, 1, 0)

	slot4 = self._toolbar

	self._toolbar.realize(EWS)

	return toolbar_sizer
end
function ContinentPanel:create_world_setting()
	slot4 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot2, EWS)
	slot7 = "TB_FLAT,TB_NODIVIDER"
	self._world_setting_toolbar = EWS.ToolBar(EWS, EWS, self._panel, "")
	slot9 = "world_editor\\continent\\create_world_setting_16x16.png"

	self._world_setting_toolbar.add_tool(EWS, self._world_setting_toolbar, "CREATE_WORLD_SETTING", "Create a world setting file", CoreEWS.image_path(slot8))

	slot11 = "create_world_setting_dialog"

	self._world_setting_toolbar.connect(EWS, self._world_setting_toolbar, "CREATE_WORLD_SETTING", "EVT_COMMAND_MENU_SELECTED", callback("Create a world setting file", self, self))

	slot9 = "toolbar\\open_16x16.png"

	self._world_setting_toolbar.add_tool(EWS, self._world_setting_toolbar, "OPEN_WORLD_SETTING", "Open a world setting file to edit", CoreEWS.image_path(nil))

	slot11 = "open_world_setting_dialog"
	slot8 = nil

	self._world_setting_toolbar.connect(EWS, self._world_setting_toolbar, "OPEN_WORLD_SETTING", "EVT_COMMAND_MENU_SELECTED", callback("Open a world setting file to edit", self, self))

	slot8 = "EXPAND"

	sizer.add(EWS, sizer, self._world_setting_toolbar, 0, 0)

	slot8 = "ALIGN_CENTRE"
	self._world_setting_path = EWS.StaticText(EWS, EWS, self._panel, "-", 0)

	sizer.add(EWS, sizer, self._world_setting_path, 1, 0)

	slot7 = "TB_FLAT,TB_NODIVIDER"
	self._right_world_setting_toolbar = EWS.ToolBar(EWS, EWS, self._panel, "")
	slot9 = "toolbar\\delete_16x16.png"

	self._right_world_setting_toolbar.add_tool(EWS, self._right_world_setting_toolbar, "CLEAR_SIMULATION_WORLD_SETTING", "Removes the world setting file when simulating", CoreEWS.image_path("ALIGN_CENTER_VERTICAL"))

	slot11 = "remove_simulation_world_setting_dialog"

	self._right_world_setting_toolbar.connect(EWS, self._right_world_setting_toolbar, "CLEAR_SIMULATION_WORLD_SETTING", "EVT_COMMAND_MENU_SELECTED", callback("Removes the world setting file when simulating", self, self))

	slot9 = "toolbar\\open_16x16.png"

	self._right_world_setting_toolbar.add_tool(EWS, self._right_world_setting_toolbar, "SET_SIMULATION_WORLD_SETTING", "Set a world setting file to use when simulating", CoreEWS.image_path(nil))

	slot11 = "set_simulation_world_setting_dialog"
	slot8 = nil

	self._right_world_setting_toolbar.connect(EWS, self._right_world_setting_toolbar, "SET_SIMULATION_WORLD_SETTING", "EVT_COMMAND_MENU_SELECTED", callback("Set a world setting file to use when simulating", self, self))

	slot8 = "EXPAND,RIGHT"

	sizer.add(EWS, sizer, self._right_world_setting_toolbar, 0, 10)

	slot4 = self._world_setting_toolbar

	self._world_setting_toolbar.realize(EWS)

	slot4 = self._right_world_setting_toolbar

	self._right_world_setting_toolbar.realize(EWS)

	return sizer
end
function ContinentPanel:panel()
	return self._panel
end
function ContinentPanel:create_panel(parent, orientation)
	slot8 = "TAB_TRAVERSAL,ALWAYS_SHOW_SB"
	self._panel = EWS.Panel(slot4, EWS, parent, "")
	slot6 = orientation
	self._panel_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._panel_sizer

	self._panel.set_sizer(slot4, self._panel)

	return 
end
function ContinentPanel:create_continent_panel(parent, orientation)
	slot8 = "VSCROLL,TAB_TRAVERSAL,SIMPLE_BORDER"
	self._continent_panel = EWS.ScrolledWindow(slot4, EWS, parent, "")
	slot5 = self._continent_panel
	slot10 = 0

	self._continent_panel.set_scroll_rate(slot4, Vector3("", 0, 20))

	slot10 = 0
	slot6 = Vector3("", 0, 0)
	slot11 = -1

	self._continent_panel.set_virtual_size_hints(slot4, self._continent_panel, Vector3(0, 1, -1))

	slot8 = 255

	self._continent_panel.set_background_colour(slot4, self._continent_panel, 255, 255)

	slot5 = self._continent_panel

	self._continent_panel.refresh(slot4)

	slot6 = orientation
	self._continent_panel_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._continent_panel_sizer

	self._continent_panel.set_sizer(slot4, self._continent_panel)

	return 
end
function ContinentPanel:create_continent_dialog()
	slot12 = 0
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for new continent:", "Create new continent", "", Vector3(true, -1, -1))

	if name and name ~= "" then
		slot5 = name

		if managers.editor.continent(slot3, managers.editor) then
			slot4 = self

			self.create_continent_dialog(slot3)
		else
			slot6 = {}

			managers.editor.create_continent(slot3, managers.editor, name)
		end
	end

	return 
end
function ContinentPanel:add_continent(params)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, self._continent_panel, "")
	params.panel = panel
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = sizer

	panel.set_sizer(EWS, panel)

	slot9 = 255

	panel.set_background_colour(EWS, panel, 255, 255)

	slot9 = "TB_FLAT,TB_NODIVIDER"
	params.toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot11 = "world_editor\\continent\\hide_all_16x16.png"

	params.toolbar.add_tool(EWS, params.toolbar, "HIDE_ALL", "Hide all units in the continent", CoreEWS.image_path(slot10))

	slot13 = "hide_all"

	params.toolbar.connect(EWS, params.toolbar, "HIDE_ALL", "EVT_COMMAND_MENU_SELECTED", callback("Hide all units in the continen", self, self))

	slot11 = "world_editor\\continent\\unhide_all_16x16.png"

	params.toolbar.add_tool(EWS, params.toolbar, "UNHIDE_ALL", "Unhides all units in the continent", CoreEWS.image_path(params))

	slot13 = "unhide_all"

	params.toolbar.connect(EWS, params.toolbar, "UNHIDE_ALL", "EVT_COMMAND_MENU_SELECTED", callback("Hide all units in the continen", self, self))

	slot11 = "world_editor\\continent\\locked_16x16.png"

	params.toolbar.add_check_tool(EWS, params.toolbar, "LOCKED", "Toggle locked", CoreEWS.image_path(params))

	slot8 = params.locked

	params.toolbar.set_tool_state(EWS, params.toolbar, "LOCKED")

	slot13 = "toggle_locked"

	params.toolbar.connect(EWS, params.toolbar, "LOCKED", "EVT_COMMAND_MENU_SELECTED", callback("Toggle locked", self, self))

	slot11 = "world_editor\\continent\\use_when_simulate_16x16.png"

	params.toolbar.add_check_tool(EWS, params.toolbar, "ENABLED_IN_SIMULATION", "Toggles if this continent is enabled when simulating", CoreEWS.image_path(params))

	slot8 = params.enabled_in_simulation

	params.toolbar.set_tool_state(EWS, params.toolbar, "ENABLED_IN_SIMULATION")

	slot13 = "toggle_enabled_in_simulation"

	params.toolbar.connect(EWS, params.toolbar, "ENABLED_IN_SIMULATION", "EVT_COMMAND_MENU_SELECTED", callback("Toggles if this continent is enabled when simulating", self, self))

	slot11 = "world_editor\\continent\\editor_only_16x16.png"

	params.toolbar.add_check_tool(EWS, params.toolbar, "EDITOR_ONLY", "Toggles if this continent only is loaded in editor", CoreEWS.image_path(params))

	slot8 = params.editor_only

	params.toolbar.set_tool_state(EWS, params.toolbar, "EDITOR_ONLY")

	slot13 = "toggle_editor_only"
	slot10 = params

	params.toolbar.connect(EWS, params.toolbar, "EDITOR_ONLY", "EVT_COMMAND_MENU_SELECTED", callback("Toggles if this continent only is loaded in editor", self, self))

	slot6 = params.toolbar

	params.toolbar.realize(EWS)

	slot7 = params

	self._set_toolbar_colour(EWS, self)

	slot10 = "EXPAND,BOTTOM"

	sizer.add(EWS, sizer, params.toolbar, 0, 1)

	slot10 = params.continent
	slot10 = ""
	params.toggle_button = EWS.ToggleButton(EWS, EWS, panel, params.continent.name(1), "")

	params.toggle_button.set_background_colour(EWS, params.toggle_button, 255, 255)

	slot12 = "toggle_button_clicked"
	slot9 = params

	params.toggle_button.connect(EWS, params.toggle_button, "EVT_COMMAND_TOGGLEBUTTON_CLICKED", callback(255, self, self))

	slot10 = "EXPAND"

	sizer.add(EWS, sizer, params.toggle_button, 1, 0)

	slot10 = "EXPAND,BOTTOM"

	self._continent_panel_sizer.add(EWS, self._continent_panel_sizer, panel, 0, 1)

	slot6 = self._continent_panel

	self._continent_panel.refresh(EWS)

	slot6 = self._continent_panel

	self._continent_panel.fit_inside(EWS)

	slot7 = params

	table.insert(EWS, self._continent_panels)

	return panel
end
function ContinentPanel:toggle_visible(params)
	return 
end
function ContinentPanel:toggle_locked(params)
	slot4 = params.continent
	slot8 = "LOCKED"

	params.continent.set_locked(slot3, params.toolbar.tool_state(slot6, params.toolbar))

	slot5 = params

	self._set_toolbar_colour(slot3, self)

	return 
end
function ContinentPanel:_set_toolbar_colour(params)
	slot5 = "LOCKED"
	local locked = params.toolbar.tool_state(slot3, params.toolbar)
	slot8 = (locked and 50) or 255

	params.toolbar.set_background_colour(slot4, params.toolbar, (locked and 150) or 255, (locked and 50) or 255)

	slot5 = params.panel

	params.panel.refresh(slot4)

	return 
end
function ContinentPanel:hide_all(params)
	slot5 = false

	params.continent.set_visible(slot3, params.continent)

	return 
end
function ContinentPanel:unhide_all(params)
	slot5 = true

	params.continent.set_visible(slot3, params.continent)

	return 
end
function ContinentPanel:toggle_enabled_in_simulation(params)
	slot5 = "enabled_in_simulation"
	slot9 = "ENABLED_IN_SIMULATION"

	params.continent.set_value(slot3, params.continent, params.toolbar.tool_state(slot7, params.toolbar))

	return 
end
function ContinentPanel:toggle_editor_only(params)
	slot5 = "editor_only"
	slot9 = "EDITOR_ONLY"

	params.continent.set_value(slot3, params.continent, params.toolbar.tool_state(slot7, params.toolbar))

	return 
end
function ContinentPanel:toggle_button_clicked(params)
	slot4 = managers.editor
	slot7 = params.continent

	managers.editor.set_continent(slot3, params.continent.name(slot6))

	return 
end
function ContinentPanel:update_continent_panel(continent)
	slot4 = self._continent_panels

	for _, params in ipairs(slot3) do
		if params.continent == continent then
			slot10 = "LOCKED"
			slot14 = "locked"

			params.toolbar.set_tool_state(slot8, params.toolbar, continent.value(slot12, continent))

			slot10 = "ENABLED_IN_SIMULATION"
			slot14 = "enabled_in_simulation"

			params.toolbar.set_tool_state(slot8, params.toolbar, continent.value(slot12, continent))

			slot10 = "EDITOR_ONLY"
			slot14 = "editor_only"

			params.toolbar.set_tool_state(slot8, params.toolbar, continent.value(slot12, continent))

			break
		end
	end

	return 
end
function ContinentPanel:set_continent(continent)
	slot4 = self._continent_panels

	for _, params in ipairs(slot3) do
		slot10 = params.continent == continent

		params.toggle_button.set_value(slot8, params.toggle_button)
	end

	return 
end
function ContinentPanel:delete_continent()
	slot3 = managers.editor

	managers.editor.delete_continent(slot2)

	return 
end
function ContinentPanel:destroy_continent(continent)
	slot4 = self._continent_panels

	for _, params in ipairs(slot3) do
		if params.continent == continent then
			slot10 = params

			self._destroy_continent(slot8, self)

			return 
		end
	end

	return 
end
function ContinentPanel:_destroy_continent(params)
	slot5 = params

	if not table.contains(slot3, self._continent_panels) then
		return 
	end

	slot5 = params

	table.delete(slot3, self._continent_panels)

	slot4 = params.panel

	params.panel.destroy(slot3)

	slot4 = self._continent_panel

	self._continent_panel.fit_inside(slot3)

	return 
end
function ContinentPanel:destroy_all_continents()
	slot5 = self._continent_panels

	for _, params in ipairs(clone(slot4)) do
		slot9 = params

		self._destroy_continent(slot7, self)
	end

	return 
end
function ContinentPanel:create_world_setting_dialog()
	slot3 = managers.editor

	if not managers.editor.lastfile(slot2) then
		slot7 = "OK,ICON_ERROR"
		slot12 = 0
		local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Can't create world setting when the level isn't saved.", "Continent", Vector3(slot9, -1, -1))

		return 
	end

	slot6 = "World setting (*.world_setting)|*.world_setting"
	slot9 = managers.editor
	local path, dir = managers.database.save_file_dialog(slot2, managers.database, Global.frame, true, managers.editor.get_open_dir(slot8))

	if path and dir then
		slot6 = {
			name = managers.database.entry_name(slot8, managers.database),
			dir = dir
		}
		slot10 = path

		CreateWorldSettingFile.new(slot4, CreateWorldSettingFile)
	end

	return 
end
function ContinentPanel:open_world_setting_dialog()
	slot5 = "World setting (*.world_setting)|*.world_setting"
	slot8 = managers.editor
	local path, dir = managers.database.open_file_dialog(slot2, managers.database, Global.frame, managers.editor.get_open_dir(slot7))

	if path and dir then
		slot6 = {
			path = path
		}

		CreateWorldSettingFile.new(slot4, CreateWorldSettingFile)
	end

	return 
end
function ContinentPanel:set_simulation_world_setting_dialog()
	slot5 = "World setting (*.world_setting)|*.world_setting"
	slot8 = managers.editor
	local path, dir = managers.database.open_file_dialog(slot2, managers.database, Global.frame, managers.editor.get_open_dir(slot7))

	if path and dir then
		slot5 = managers.editor
		slot9 = path

		managers.editor.set_simulation_world_setting_path(slot4, managers.database.entry_path(slot7, managers.database))
	end

	return 
end
function ContinentPanel:remove_simulation_world_setting_dialog()
	slot4 = nil

	managers.editor.set_simulation_world_setting_path(slot2, managers.editor)

	return 
end
function ContinentPanel:set_world_setting_path(path)
	slot5 = path or "-"

	self._world_setting_path.set_value(slot3, self._world_setting_path)

	slot4 = self._panel

	self._panel.layout(slot3)

	return 
end

return 
