function CoreEditor:build_left_toolbar()
	local icons_path = managers.database.base_path(slot2) .. "core\\lib\\utils\\dev\\editor\\icons\\"
	slot7 = ""
	local left_upper_panel = EWS.Panel(managers.database, EWS, Global.frame_panel, "")
	slot6 = "VERTICAL"
	local left_upper_panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = left_upper_panel_sizer

	left_upper_panel.set_sizer(EWS, left_upper_panel)

	slot9 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	self._left_upper_toolbar = EWS.ToolBar(EWS, EWS, left_upper_panel, "")
	slot11 = "folder_open_16x16.png"

	self._left_upper_toolbar.add_tool(EWS, self._left_upper_toolbar, "TB_OPEN_WORLD_FOLDER", "Open world folder", CoreEWS.image_path(slot10))

	slot13 = "on_open_world_folder"
	slot10 = nil

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_OPEN_WORLD_FOLDER", "EVT_COMMAND_MENU_SELECTED", callback("Open world folder", self, self))

	slot6 = self._left_upper_toolbar

	self._left_upper_toolbar.add_separator(EWS)
	self._left_upper_toolbar.add_check_tool(EWS, self._left_upper_toolbar, "TB_PERFORMANCE_HUD", "Performance Hud", icons_path .. "prefhud.bmp")

	slot13 = "toggle"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_PERFORMANCE_HUD", "EVT_COMMAND_MENU_SELECTED", callback("Performance Hud", managers.prefhud, managers.prefhud))

	slot11 = "world_editor\\draw_occluders_16x16.png"

	self._left_upper_toolbar.add_check_tool(EWS, self._left_upper_toolbar, "TB_DRAW_OCCLUDERS", "Draw Occluders", CoreEWS.image_path(managers.prefhud))

	slot8 = self._draw_occluders

	self._left_upper_toolbar.set_tool_state(EWS, self._left_upper_toolbar, "TB_DRAW_OCCLUDERS")

	slot13 = "toolbar_toggle"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_DRAW_OCCLUDERS", "EVT_COMMAND_MENU_SELECTED", callback("Toggle debug draw of occluder objects", self, self))

	slot11 = "world_editor\\draw_hidden_units_16x16.png"

	self._left_upper_toolbar.add_check_tool(EWS, self._left_upper_toolbar, "TB_DRAW_HIDDEN_UNITS", "Draw Hidden Units", CoreEWS.image_path({
		value = "_draw_occluders",
		toolbar = "_left_upper_toolbar",
		menu = "_debug_menu"
	}))

	slot8 = self._draw_hidden_units

	self._left_upper_toolbar.set_tool_state(EWS, self._left_upper_toolbar, "TB_DRAW_HIDDEN_UNITS")

	slot13 = "toolbar_toggle"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_DRAW_HIDDEN_UNITS", "EVT_COMMAND_MENU_SELECTED", callback("Toggle debug draw of hidden units", self, self))

	slot11 = "blob_16x16.png"

	self._left_upper_toolbar.add_check_tool(EWS, self._left_upper_toolbar, "TB_DRAW_BODIES", "Draw Bodies", CoreEWS.image_path({
		value = "_draw_hidden_units",
		toolbar = "_left_upper_toolbar"
	}))

	slot8 = self._draw_bodies_on

	self._left_upper_toolbar.set_tool_state(EWS, self._left_upper_toolbar, "TB_DRAW_BODIES")

	slot13 = "toolbar_toggle"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_DRAW_BODIES", "EVT_COMMAND_MENU_SELECTED", callback("Toggle debug draw of bodies", self, self))

	slot11 = "sequencer\\clip_icon_camera_00.png"

	self._left_upper_toolbar.add_check_tool(EWS, self._left_upper_toolbar, "TB_FRUSTUM_FREEZE", "Frustum freeze/unfreeze", CoreEws.image_path({
		value = "_draw_bodies_on",
		toolbar = "_left_upper_toolbar"
	}))

	slot8 = false

	self._left_upper_toolbar.set_tool_state(EWS, self._left_upper_toolbar, "TB_FRUSTUM_FREEZE")

	slot13 = "_frustum_freeze_toggle"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_FRUSTUM_FREEZE", "EVT_COMMAND_MENU_SELECTED", callback("Toggle frustum freeze on/off", self, self))

	slot6 = self._left_upper_toolbar

	self._left_upper_toolbar.add_separator(EWS)

	slot11 = "material_editor_16x16.png"

	self._left_upper_toolbar.add_tool(EWS, self._left_upper_toolbar, "TB_MATERIAL_EDITOR", "Material Editor", CoreEWS.image_path(nil))

	slot13 = "on_open_tool"
	slot10 = "Material Editor"

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_MATERIAL_EDITOR", "EVT_COMMAND_MENU_SELECTED", callback("Material Editor", self, self))

	slot6 = self

	self._project_add_left_upper_toolbar_tool(EWS)

	slot6 = self._left_upper_toolbar

	self._left_upper_toolbar.add_separator(EWS)
	self._left_upper_toolbar.add_tool(EWS, self._left_upper_toolbar, "TB_RELOAD_UNIT", "Reload Unit(s)", icons_path .. "reload_unit.bmp")

	slot13 = "on_reload_unit"
	slot10 = ""

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_RELOAD_UNIT", "EVT_COMMAND_MENU_SELECTED", callback("Reload Unit(s)", self, self))
	self._left_upper_toolbar.add_tool(EWS, self._left_upper_toolbar, "TB_RELOAD_UNIT_QUICK", "Reload Unit(s) Quick", icons_path .. "reload_unit_quick.bmp")

	slot14 = true

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_RELOAD_UNIT_QUICK", "EVT_COMMAND_MENU_SELECTED", callback("Reload Unit(s) Quick", self, self, "on_reload_unit"))

	slot11 = "connection_16x16.png"

	self._left_upper_toolbar.add_tool(EWS, self._left_upper_toolbar, "TB_CONNECT_SLAVE", "Connect Slave System", CoreEWS.image_path(""))

	slot13 = "connect_slave"
	slot10 = ""

	self._left_upper_toolbar.connect(EWS, self._left_upper_toolbar, "TB_CONNECT_SLAVE", "EVT_COMMAND_MENU_SELECTED", callback("Connect Slave System", self, self))

	slot6 = self._left_upper_toolbar

	self._left_upper_toolbar.realize(EWS)

	slot10 = "EXPAND"

	left_upper_panel_sizer.add(EWS, left_upper_panel_sizer, self._left_upper_toolbar, 0, 0)

	slot10 = "EXPAND"

	Global.left_toolbar_sizer.add(EWS, Global.left_toolbar_sizer, left_upper_panel, 0, 0)

	slot10 = "EXPAND"

	Global.left_toolbar_sizer.add(EWS, Global.left_toolbar_sizer, EWS.Panel(0, EWS, Global.frame_panel, ""), 1, 0)

	slot9 = ""
	local left_panel = EWS.Panel(EWS, EWS, Global.frame_panel, "")
	slot8 = "VERTICAL"
	local left_panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = left_panel_sizer

	left_panel.set_sizer(EWS, left_panel)

	slot11 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	self._left_toolbar = EWS.ToolBar(EWS, EWS, left_panel, "")
	slot8 = self

	self.add_edit_buttons(EWS)

	slot13 = "world_editor\\edit_settings_16x16.png"

	self._left_toolbar.add_tool(EWS, self._left_toolbar, "LTB_EDIT_UNIT", "Show edit unit dialog", CoreEWS.image_path(""))

	slot15 = "show_edit_unit"

	self._left_toolbar.connect(EWS, self._left_toolbar, "LTB_EDIT_UNIT", "EVT_COMMAND_MENU_SELECTED", callback("Help", self, self))

	slot8 = self._left_toolbar

	self._left_toolbar.add_separator(EWS)

	slot13 = "help_16x16.png"

	self._left_toolbar.add_tool(EWS, self._left_toolbar, "LTB_HELP", "Help", CoreEWS.image_path(nil))

	slot15 = "on_output_help"

	self._left_toolbar.connect(EWS, self._left_toolbar, "LTB_HELP", "EVT_COMMAND_MENU_SELECTED", callback("Help", self, self))

	slot13 = "info_16x16.png"

	self._left_toolbar.add_tool(EWS, self._left_toolbar, "LTB_LIST_UNITS", "List units", CoreEWS.image_path(nil))

	slot15 = "on_list_units"
	slot12 = nil

	self._left_toolbar.connect(EWS, self._left_toolbar, "LTB_LIST_UNITS", "EVT_COMMAND_MENU_SELECTED", callback("List units", self, self))

	slot8 = self._left_toolbar

	self._left_toolbar.realize(EWS)

	slot12 = "EXPAND"

	left_panel_sizer.add(EWS, left_panel_sizer, self._left_toolbar, 0, 0)

	slot12 = "EXPAND"

	Global.left_toolbar_sizer.add(EWS, Global.left_toolbar_sizer, left_panel, 0, 0)

	return 
end
function CoreEditor:_project_add_left_upper_toolbar_tool()
	return 
end
function CoreEditor:show_edit_unit()
	slot5 = "EditUnitDialog"

	self.show_dialog(slot2, self, "edit_unit")

	return 
end
function CoreEditor:on_open_tool(tool)
	slot5 = tool

	managers.toolhub.open(slot3, managers.toolhub)

	return 
end
function CoreEditor:on_output_help()
	local text = "\n"
	slot4 = self
	slot8 = text

	self.output(slot3, self._current_layer.get_help(slot6, self._current_layer))

	return 
end
function CoreEditor:on_list_units()
	slot4 = "all"
	local units = World.find_units_quick(slot2, World)
	local amount = {}
	local total = 0
	slot6 = units

	for _, u in ipairs(slot5) do
		total = total + 1
		slot11 = u
		slot11 = u.name(slot10)
		local name = u.name(slot10).s(slot10)

		if amount[name] then
			amount[name] = amount[name] + 1
		else
			amount[name] = 1
		end
	end

	slot8 = true

	self.output(slot5, self, "")

	slot6 = amount

	for name, amount in pairs(slot5) do
		local len = string.len(slot10)
		slot12 = len / 7
		local tabs = 6 - math.floor(name)
		local tab = ""

		for j = 1, tabs, 1 do
			tab = tab .. "\t"
		end

		slot16 = true

		self.output(slot13, self, name .. tab .. amount)
	end

	slot8 = true

	self.output(slot5, self, "")

	slot12 = amount
	slot7 = "Total units: " .. total .. " Total Unique: " .. table.size(slot11)

	self.output(slot5, self)

	return 
end
function CoreEditor:on_open_world_folder()
	if self._opendir then
		slot3 = "explorer " .. self._opendir

		os.execute(slot2)
	end

	return 
end
function CoreEditor:_frustum_freeze_toggle(a, event)
	slot5 = self._left_upper_toolbar
	slot8 = event
	local state = self._left_upper_toolbar.tool_state(slot4, event.get_id(slot7))

	if state then
		slot6 = self._camera_controller
		slot9 = self

		self._camera_controller.frustum_freeze(slot5, self.camera(slot8))
	else
		slot6 = self._camera_controller
		slot9 = self

		self._camera_controller.frustum_unfreeze(slot5, self.camera(slot8))
	end

	return 
end
function CoreEditor:_interupt_frustum_freeze()
	slot3 = self._camera_controller

	if not self._camera_controller.frustum_frozen(slot2) then
		return 
	end

	self._left_upper_toolbar.set_tool_state(slot2, self._left_upper_toolbar, "TB_FRUSTUM_FREEZE")

	slot3 = self._camera_controller
	slot6 = self

	self._camera_controller.frustum_unfreeze(slot2, self.camera(false))

	return 
end

return 
