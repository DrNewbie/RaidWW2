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
-- Decompilation Error: _glue_flows(node)

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
slot3 = "CoreEngineAccess"

core.import(slot1, core)

function CoreEditor:build_menubar()
	local menu_bar = EWS.MenuBar(slot2)
	self._menu_bar = menu_bar
	slot5 = ""
	local file_menu = EWS.Menu(EWS, EWS)
	slot11 = "new"
	slot8 = "Create new file"

	file_menu.append_item(EWS, file_menu, "NEW", "New\t" .. self.ctrl_menu_binding(slot9, self))

	slot11 = "open"
	slot8 = "Open world file"

	file_menu.append_item(EWS, file_menu, "OPEN", "Open...\t" .. self.ctrl_menu_binding(slot9, self))

	slot11 = "open_recent"
	slot8 = "Open recent world file"

	file_menu.append_item(EWS, file_menu, "OPEN_RECENT", "Open Recent...\t" .. self.ctrl_menu_binding(slot9, self))

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot11 = "save"
	slot8 = "Save world file"

	file_menu.append_item(EWS, file_menu, "SAVE", "Save\t" .. self.ctrl_menu_binding(slot9, self))

	slot8 = "Save world file"

	file_menu.append_item(EWS, file_menu, "SAVE AS", "Save As...")

	slot8 = "Save copy of world file"

	file_menu.append_item(EWS, file_menu, "SAVE AS COPY", "Save As copy...")

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot6 = ""
	self._rf_menu = EWS.Menu(EWS, EWS)
	slot7 = "on_load_recent_file"
	self._recent_files_callback = callback(EWS, self, self)
	slot5 = self._recent_files

	for index, file in ipairs(EWS) do
		slot13 = ""

		self._rf_menu.append_item(slot9, self._rf_menu, file.path, index .. " " .. file.path)

		slot14 = index

		Global.frame.connect(slot9, Global.frame, file.path, "EVT_COMMAND_MENU_SELECTED", self._recent_files_callback)
	end

	file_menu.append_menu(slot4, file_menu, "RECENT FILES", "Recent Files", self._rf_menu)

	slot5 = file_menu

	file_menu.append_separator(slot4)

	slot8 = "Exit the application"

	file_menu.append_item(slot4, file_menu, "EXIT", "Exit")

	slot7 = "File"

	menu_bar.append(slot4, menu_bar, file_menu)

	slot6 = menu_bar

	Global.frame.set_menu_bar(slot4, Global.frame)

	slot12 = "on_close"

	Global.frame.connect(slot4, Global.frame, "", "EVT_CLOSE_WINDOW", callback("Recent worked on files", self, self))

	slot12 = "on_new"

	Global.frame.connect(slot4, Global.frame, "NEW", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_open"
	slot9 = ""

	Global.frame.connect(slot4, Global.frame, "OPEN", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
	Global.frame.connect(slot4, Global.frame, "OPEN_RECENT", "EVT_COMMAND_MENU_SELECTED", self._recent_files_callback)

	slot12 = "on_save"

	Global.frame.connect(slot4, Global.frame, "SAVE", "EVT_COMMAND_MENU_SELECTED", callback(1, self, self))

	slot12 = "on_saveas"

	Global.frame.connect(slot4, Global.frame, "SAVE AS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_saveascopy"

	Global.frame.connect(slot4, Global.frame, "SAVE AS COPY", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_close"
	slot9 = ""

	Global.frame.connect(slot4, Global.frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot6 = ""
	local layers_menu = EWS.Menu(slot4, EWS)
	slot7 = ""
	self._disable_layer_menu = EWS.Menu(EWS, EWS)
	slot7 = ""
	self._hide_layer_menu = EWS.Menu(EWS, EWS)
	slot7 = ""
	self._unhide_layer_menu = EWS.Menu(EWS, EWS)
	slot9 = "Enabled all layers"

	layers_menu.append_item(EWS, layers_menu, "ENABLE_ALL_LAYERS", "Enabled all layers")

	slot13 = "on_enable_all_layers"

	Global.frame.connect(EWS, Global.frame, "ENABLE_ALL_LAYERS", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot9 = "Disable all layers but current one"

	layers_menu.append_item(EWS, layers_menu, "DISABLE_ALL_OTHER_LAYERS", "Disable layers")

	slot13 = "on_disable_layers"
	slot10 = ""

	Global.frame.connect(EWS, Global.frame, "DISABLE_ALL_OTHER_LAYERS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot10 = "Disable layers"

	layers_menu.append_menu(EWS, layers_menu, "DISABLE_LAYERS", "Disable", self._disable_layer_menu)

	slot6 = layers_menu

	layers_menu.append_separator(EWS)

	slot6 = self._notebook
	local page_count = self._notebook.get_page_count(EWS)

	for i = 0, page_count - 1, 1 do
		slot12 = i
		local text = self._notebook.get_page_text(slot10, self._notebook)
		slot15 = "Disable layer " .. text

		self._disable_layer_menu.append_check_item(self._notebook, self._disable_layer_menu, "DISABLE_" .. text, text)

		slot19 = "on_disable_layer"
		slot16 = {
			name = text,
			id = "DISABLE_" .. text
		}

		Global.frame.connect(self._notebook, Global.frame, "DISABLE_" .. text, "EVT_COMMAND_MENU_SELECTED", callback(text, self, self))

		slot15 = "Hide layer " .. text

		self._hide_layer_menu.append_item(self._notebook, self._hide_layer_menu, "HIDE_" .. text, text)

		slot19 = "on_hide_layer"
		slot16 = {
			name = text,
			id = "HIDE_" .. text
		}

		Global.frame.connect(self._notebook, Global.frame, "HIDE_" .. text, "EVT_COMMAND_MENU_SELECTED", callback(text, self, self))

		slot15 = "Unhide layer " .. text

		self._unhide_layer_menu.append_item(self._notebook, self._unhide_layer_menu, "UNHIDE_" .. text, text)

		slot19 = "on_unhide_layer"
		slot16 = {
			name = text,
			id = "UNHIDE_" .. text
		}

		Global.frame.connect(self._notebook, Global.frame, "UNHIDE_" .. text, "EVT_COMMAND_MENU_SELECTED", callback(text, self, self))

		local c = "\tAlt+" .. i + 1

		if 10 <= i + 1 then
			c = "\tCtrl+Alt+" .. i - 9
		end

		slot16 = "Change To Layer"

		layers_menu.append_item(slot12, layers_menu, text, text .. c)

		slot20 = "on_change_layer"
		slot17 = i

		Global.frame.connect(slot12, Global.frame, text, "EVT_COMMAND_MENU_SELECTED", callback(slot17, self, self))
	end

	slot9 = "Layers"

	menu_bar.append(slot6, menu_bar, layers_menu)

	slot8 = ""
	self._edit_menu = EWS.Menu(slot6, EWS)
	slot13 = "select"
	slot10 = "Select Unit"

	self._edit_menu.append_radio_item(slot6, self._edit_menu, "TB WIDGET SELECT", "Select\t" .. self.ctrl_menu_binding(slot11, self))

	slot13 = "move"
	slot10 = "Select and Move"

	self._edit_menu.append_radio_item(slot6, self._edit_menu, "TB WIDGET MOVE", "Move\t" .. self.ctrl_menu_binding(slot11, self))

	slot13 = "rotate"
	slot10 = "Select and Rotate"

	self._edit_menu.append_radio_item(slot6, self._edit_menu, "TB WIDGET ROTATE", "Rotate\t" .. self.ctrl_menu_binding(slot11, self))

	slot13 = "move_transform_type_in"
	slot10 = "Opens the move transform type-in dialog"

	self._edit_menu.append_item(slot6, self._edit_menu, "SHOW_MOVE_TRANFORM_TYPE_IN", "Move transform type-in\t" .. self.ctrl_menu_binding(slot11, self))

	slot14 = "on_move_transform_type_in"

	Global.frame.connect(slot6, Global.frame, "SHOW_MOVE_TRANFORM_TYPE_IN", "EVT_COMMAND_MENU_SELECTED", callback(slot11, self, self))

	slot13 = "rotate_transform_type_in"
	slot10 = "Opens the rotate transform type-in dialog"

	self._edit_menu.append_item(slot6, self._edit_menu, "SHOW_ROTATION_TRANFORM_TYPE_IN", "Rotate transform type-in\t" .. self.ctrl_menu_binding(nil, self))

	slot14 = "on_rotate_transform_type_in"

	Global.frame.connect(slot6, Global.frame, "SHOW_ROTATION_TRANFORM_TYPE_IN", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = self._edit_menu

	self._edit_menu.append_separator(slot6)

	slot13 = "camera_transform_type_in"
	slot10 = "Opens the camera transform type-in dialog"

	self._edit_menu.append_item(slot6, self._edit_menu, "SHOW_CAMERA_TRANFORM_TYPE_IN", "Camera transform type-in\t" .. self.ctrl_menu_binding(nil, self))

	slot14 = "on_camera_transform_type_in"
	slot11 = nil

	Global.frame.connect(slot6, Global.frame, "SHOW_CAMERA_TRANFORM_TYPE_IN", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = self._edit_menu

	self._edit_menu.append_separator(slot6)

	slot8 = ""
	self._coordinate_menu = EWS.Menu(slot6, EWS)
	slot7 = self._coordinate_systems

	for _, coor in ipairs(slot6) do
		slot15 = coor

		self._coordinate_menu.append_radio_item(slot11, self._coordinate_menu, coor, coor)
	end

	slot9 = true

	self._coordinate_menu.set_checked(slot6, self._coordinate_menu, self._coordinate_system)

	slot13 = "toggle_coordinate_system"

	self._edit_menu.append_menu(slot6, self._edit_menu, "COORDINATE_MENU", "Reference Coordinate System\t(" .. self.ctrl_binding(slot11, self) .. ")", self._coordinate_menu)

	slot7 = self._edit_menu

	self._edit_menu.append_separator(slot6)

	slot13 = "surface_move_toggle"
	slot10 = "Toggle surface move on and off"

	self._edit_menu.append_check_item(slot6, self._edit_menu, "TB_SURFACE_MOVE", "Surface Move\t(" .. self.ctrl_binding("Reference Coordinate System", self) .. ")")

	slot9 = self._use_surface_move

	self._edit_menu.set_checked(slot6, self._edit_menu, "TB_SURFACE_MOVE")

	slot14 = "menu_toolbar_toggle"

	Global.frame.connect(slot6, Global.frame, "TB_SURFACE_MOVE", "EVT_COMMAND_MENU_SELECTED", callback(")", self, self))

	slot13 = "use_snappoints_toggle"
	slot10 = "Toggle use of snappoints on and off"

	self._edit_menu.append_check_item(slot6, self._edit_menu, "TB_SNAPPOINTS", "Use Snappoints\t(" .. self.ctrl_binding({
		value = "_use_surface_move",
		toolbar = "_toolbar",
		menu = "_edit_menu"
	}, self) .. ")")

	slot9 = self._use_snappoints

	self._edit_menu.set_checked(slot6, self._edit_menu, "TB_SNAPPOINTS")

	slot14 = "menu_toolbar_toggle"
	slot11 = {
		value = "_use_snappoints",
		toolbar = "_toolbar",
		menu = "_edit_menu"
	}

	Global.frame.connect(slot6, Global.frame, "TB_SNAPPOINTS", "EVT_COMMAND_MENU_SELECTED", callback(")", self, self))

	slot7 = self._edit_menu

	self._edit_menu.append_separator(slot6)

	slot8 = ""
	self._grid_sizes_menu = EWS.Menu(slot6, EWS)
	slot7 = self._grid_sizes

	for _, g in ipairs(slot6) do
		slot15 = "Set gridsize to " .. g

		self._grid_sizes_menu.append_radio_item(slot11, self._grid_sizes_menu, "TB_GRIDSIZE" .. g, g)
	end

	slot9 = true

	self._grid_sizes_menu.set_checked(slot6, self._grid_sizes_menu, "TB_GRIDSIZE" .. self._grid_size)

	slot13 = "change_grid_size"
	slot11 = "Grid Sizes"

	self._edit_menu.append_menu(slot6, self._edit_menu, "GRID_SIZES_MENU", "Grid sizes\t(" .. self.ctrl_binding(slot11, self) .. ")", self._grid_sizes_menu)

	slot8 = ""
	self._snap_rotations_menu = EWS.Menu(slot6, EWS)
	slot7 = self._snap_rotations

	for _, r in ipairs(slot6) do
		slot15 = "Set snap rotation to " .. r

		self._snap_rotations_menu.append_radio_item(slot11, self._snap_rotations_menu, "TB_SNAPROTATION" .. r, r)
	end

	slot9 = true

	self._snap_rotations_menu.set_checked(slot6, self._snap_rotations_menu, "TB_SNAPROTATION" .. self._snap_rotation)

	slot13 = "change_snaprot"
	slot11 = "Snap Rotations"

	self._edit_menu.append_menu(slot6, self._edit_menu, "SNAP_ROTATION_MENU", "Snap Rotations\t(" .. self.ctrl_binding(slot11, self) .. ")", self._snap_rotations_menu)

	slot8 = ""
	self._snap_rotations_axis_menu = EWS.Menu(slot6, EWS)
	slot10 = "Snap rotate axis X"

	self._snap_rotations_axis_menu.append_radio_item(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_X", "X")

	slot10 = "Snap rotate axis Y"

	self._snap_rotations_axis_menu.append_radio_item(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Y", "Y")

	slot10 = "Snap rotate axis Z"

	self._snap_rotations_axis_menu.append_radio_item(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Z", "Z")

	if self._snap_rotation_axis == "x" then
		slot9 = true

		self._snap_rotations_axis_menu.set_checked(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_X")
	elseif self._snap_rotation_axis == "y" then
		slot9 = true

		self._snap_rotations_axis_menu.set_checked(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Y")
	else
		slot9 = true

		self._snap_rotations_axis_menu.set_checked(slot6, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Z")
	end

	slot13 = "change_snaprot_axis"

	self._edit_menu.append_menu(slot6, self._edit_menu, "SNAP_ROTATION_AIXS_MENU", "Snap Rotation Axis\t(" .. self.ctrl_binding(slot11, self) .. ")", self._snap_rotations_axis_menu)

	slot9 = "Edit"

	menu_bar.append(slot6, menu_bar, self._edit_menu)

	slot8 = ""
	self._group_menu = EWS.Menu(slot6, EWS)
	slot10 = "Shows a list with all groups"

	self._group_menu.append_item(slot6, self._group_menu, "SELECT_GROUP_BY_NAME", "Select Group By Name")

	slot7 = self._group_menu

	self._group_menu.append_separator(slot6)

	slot13 = "create_group"
	slot10 = "Create a group from the seleceted units"

	self._group_menu.append_item(slot6, self._group_menu, "GROUP", "Group\t" .. self.ctrl_menu_binding("Snap Rotation Axis", self))

	slot13 = "remove_group"
	slot10 = "Removes the selected group"

	self._group_menu.append_item(slot6, self._group_menu, "UNGROUP", "Ungroup\t" .. self.ctrl_menu_binding("Snap Rotation Axis", self))

	slot7 = self._group_menu

	self._group_menu.append_separator(slot6)

	slot10 = "Draws units to show that they belong to a group"

	self._group_menu.append_check_item(slot6, self._group_menu, "DEBUG_DRAW_GROUPS", "Draw Groups")

	slot9 = self._debug_draw_groups

	self._group_menu.set_checked(slot6, self._group_menu, "DEBUG_DRAW_GROUPS")

	slot7 = self._group_menu

	self._group_menu.append_separator(slot6)

	slot10 = "Saves a group to file"

	self._group_menu.append_item(slot6, self._group_menu, "SAVE_GROUP", "Save")

	slot10 = "Loads a group from file"

	self._group_menu.append_item(slot6, self._group_menu, "LOAD_GROUP", "Load")

	slot10 = "Displays a list of group presets"

	self._group_menu.append_item(slot6, self._group_menu, "SHOW_GROUP_PRESETS", "Group Presets")

	slot7 = self._group_menu

	self._group_menu.append_separator(slot6)

	slot10 = "Dumps a group to mesh"

	self._group_menu.append_item(slot6, self._group_menu, "DUMP_GROUP", "Dump")

	slot14 = "on_select_group_by_name"

	Global.frame.connect(slot6, Global.frame, "SELECT_GROUP_BY_NAME", "EVT_COMMAND_MENU_SELECTED", callback("Snap Rotation Axis", self, self))

	slot14 = "group"

	Global.frame.connect(slot6, Global.frame, "GROUP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "ungroup"

	Global.frame.connect(slot6, Global.frame, "UNGROUP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "menu_toolbar_toggle"

	Global.frame.connect(slot6, Global.frame, "DEBUG_DRAW_GROUPS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "save_group"

	Global.frame.connect(slot6, Global.frame, "SAVE_GROUP", "EVT_COMMAND_MENU_SELECTED", callback({
		value = "_debug_draw_groups",
		menu = "_group_menu"
	}, self, self))

	slot14 = "load_group"

	Global.frame.connect(slot6, Global.frame, "LOAD_GROUP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "show_group_presets"

	Global.frame.connect(slot6, Global.frame, "SHOW_GROUP_PRESETS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "dump_group"

	Global.frame.connect(slot6, Global.frame, "DUMP_GROUP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot9 = "Group"

	menu_bar.append(slot6, menu_bar, self._group_menu)

	slot8 = ""
	self._mission_menu = EWS.Menu(slot6, EWS)
	slot13 = "run_mission_simulation"
	slot10 = "Run Mission Simulation"

	self._mission_menu.append_item(slot6, self._mission_menu, "RUN MISSION SIMULATION", "Run Mission Simulation\t" .. self.ctrl_menu_binding(nil, self))

	slot13 = "run_gameplay_simulation"
	slot10 = "Run Gameplay Simulation"

	self._mission_menu.append_item(slot6, self._mission_menu, "RUN GAMEPLAY SIMULATION", "Run Gameplay Simulation\t" .. self.ctrl_menu_binding(nil, self))

	slot8 = ""
	local difficulty_menu = EWS.Menu(slot6, EWS)
	slot8 = self._mission_difficulties

	for _, difficulty in ipairs(EWS) do
		slot16 = ""

		difficulty_menu.append_radio_item(slot12, difficulty_menu, difficulty[1], difficulty[2])

		slot20 = "on_difficulty"
		slot17 = difficulty[1]

		Global.frame.connect(slot12, Global.frame, difficulty[1], "EVT_COMMAND_MENU_SELECTED", callback(slot17, self, self))
	end

	slot10 = true

	difficulty_menu.set_checked(slot7, difficulty_menu, self._mission_difficulty)

	slot12 = "Difficulties"

	self._mission_menu.append_menu(slot7, self._mission_menu, "DIFFICULTY MENU", "Difficulty", difficulty_menu)

	slot9 = ""
	local players_menu = EWS.Menu(slot7, EWS)
	slot9 = self._mission_players

	for _, player in ipairs(EWS) do
		slot17 = ""

		players_menu.append_radio_item(slot13, players_menu, player, player)

		slot21 = "on_players"
		slot18 = player

		Global.frame.connect(slot13, Global.frame, player, "EVT_COMMAND_MENU_SELECTED", callback(slot18, self, self))
	end

	slot11 = true

	players_menu.set_checked(slot8, players_menu, self._mission_player)

	slot13 = "Players"

	self._mission_menu.append_menu(slot8, self._mission_menu, "PLAYERS MENU", "Players", players_menu)

	slot10 = ""
	local platforms_menu = EWS.Menu(slot8, EWS)
	slot10 = self._mission_platforms

	for _, platform in ipairs(EWS) do
		slot18 = ""

		platforms_menu.append_radio_item(slot14, platforms_menu, platform, platform)

		slot22 = "on_platform"
		slot19 = platform

		Global.frame.connect(slot14, Global.frame, platform, "EVT_COMMAND_MENU_SELECTED", callback(slot19, self, self))
	end

	slot12 = true

	platforms_menu.set_checked(slot9, platforms_menu, self._mission_platform)
	self._mission_menu.append_menu(slot9, self._mission_menu, "PLATFORMS MENU", "Platform", platforms_menu)

	slot10 = self._mission_menu

	self._mission_menu.append_separator(slot9)

	slot13 = "Will draw areas while running simulation"

	self._mission_menu.append_check_item(slot9, self._mission_menu, "MISSION_DEBUG_DRAW_AREAS", "Draw areas during simulation")

	slot12 = self._simulation_debug_areas

	self._mission_menu.set_checked(slot9, self._mission_menu, "MISSION_DEBUG_DRAW_AREAS")

	slot17 = "menu_toolbar_toggle"

	Global.frame.connect(slot9, Global.frame, "MISSION_DEBUG_DRAW_AREAS", "EVT_COMMAND_MENU_SELECTED", callback("Platform", self, self))

	slot10 = self._mission_menu

	self._mission_menu.append_separator(slot9)

	slot13 = "Full Client Sync"

	self._mission_menu.append_item(slot9, self._mission_menu, "CONNECT_SLAVE", "Connect Slave System")

	slot17 = "run_simulation_callback"

	Global.frame.connect(slot9, Global.frame, "RUN MISSION SIMULATION", "EVT_COMMAND_MENU_SELECTED", callback({
		value = "_simulation_debug_areas",
		menu = "_mission_menu"
	}, self, self))

	slot17 = "run_simulation_callback"

	Global.frame.connect(slot9, Global.frame, "RUN GAMEPLAY SIMULATION", "EVT_COMMAND_MENU_SELECTED", callback(true, self, self))

	slot17 = "connect_slave"
	slot14 = nil

	Global.frame.connect(slot9, Global.frame, "CONNECT_SLAVE", "EVT_COMMAND_MENU_SELECTED", callback(false, self, self))

	slot12 = "Mission"

	menu_bar.append(slot9, menu_bar, self._mission_menu)

	slot11 = ""
	local view_menu = EWS.Menu(slot9, EWS)
	slot12 = ""
	local info_menu = EWS.Menu(EWS, EWS)
	slot15 = "Toggle output"

	info_menu.append_check_item(EWS, info_menu, "INFO OUTPUT", "Show output")

	slot14 = true

	info_menu.set_checked(EWS, info_menu, "INFO OUTPUT")

	slot19 = "toggle_info"

	Global.frame.connect(EWS, Global.frame, "INFO OUTPUT", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot15 = "Toggle unit info"

	info_menu.append_check_item(EWS, info_menu, "INFO UNIT", "Show unit info")

	slot14 = true

	info_menu.set_checked(EWS, info_menu, "INFO UNIT")

	slot19 = "toggle_info"
	slot16 = {
		info_menu,
		"INFO UNIT"
	}

	Global.frame.connect(EWS, Global.frame, "INFO UNIT", "EVT_COMMAND_MENU_SELECTED", callback({
		info_menu,
		"INFO OUTPUT"
	}, self, self))
	view_menu.append_menu(EWS, view_menu, "INFO MENU", "Info", info_menu)

	slot15 = "Show the news list"

	view_menu.append_item(EWS, view_menu, "SHOW_NEWS", "News...")

	slot19 = "show_news"
	slot16 = nil

	Global.frame.connect(EWS, Global.frame, "SHOW_NEWS", "EVT_COMMAND_MENU_SELECTED", callback("Info views", self, self))

	slot12 = view_menu

	view_menu.append_separator(EWS)

	slot15 = "Change visualization to Deferred Lighting"

	view_menu.append_item(EWS, view_menu, "LIGHTING", "Deferred Lighting")

	slot15 = "Change visualization to Albedo"

	view_menu.append_item(EWS, view_menu, "ALBEDO", "Albedo")

	slot15 = "Change visualization to Normal"

	view_menu.append_item(EWS, view_menu, "NORMAL", "Normal")

	slot15 = "Change visualization to Specular"

	view_menu.append_item(EWS, view_menu, "SPECULAR", "Specular")

	slot15 = "Change visualization to Glossiness"

	view_menu.append_item(EWS, view_menu, "GLOSSINESS", "Glossiness")

	slot15 = "Change visualization to Depth"

	view_menu.append_item(EWS, view_menu, "DEPTH", "Depth")

	slot15 = "Change visualization to SSAO"

	view_menu.append_item(EWS, view_menu, "AO", "Ambient occlusion")

	slot12 = view_menu

	view_menu.append_separator(EWS)

	slot13 = ""
	local post_processor_effects_menu = EWS.Menu(EWS, EWS)
	slot13 = {
		"empty",
		"default"
	}

	for _, effect in ipairs(EWS) do
		slot21 = ""

		post_processor_effects_menu.append_radio_item(slot17, post_processor_effects_menu, effect, effect)

		slot25 = "on_post_processor_effect"
		slot22 = effect

		Global.frame.connect(slot17, Global.frame, effect, "EVT_COMMAND_MENU_SELECTED", callback(slot22, self, self))
	end

	slot15 = true

	post_processor_effects_menu.set_checked(slot12, post_processor_effects_menu, "empty")
	view_menu.append_menu(slot12, view_menu, "POST_PROCESSOR_MENU", "Post processor effects", post_processor_effects_menu)

	slot13 = view_menu

	view_menu.append_separator(slot12)

	slot16 = "Toggle lock resolution of application window to/from 1280x720"

	view_menu.append_check_item(slot12, view_menu, "LOCK_1280_720", "Lock 1280x720")

	slot15 = (self._appwin_fixed_resolution and true) or false

	view_menu.set_checked(slot12, view_menu, "LOCK_1280_720")

	slot13 = view_menu

	view_menu.append_separator(slot12)

	slot19 = "orthographic"
	slot16 = "Toggle Orthographic"

	view_menu.append_check_item(slot12, view_menu, "ORTHOGRAPHIC", "Orthographic\t" .. self.ctrl_menu_binding("Post processor effects", self))

	slot13 = view_menu

	view_menu.append_separator(slot12)

	slot19 = "use_light"
	slot16 = "Turn head light on / off"

	view_menu.append_check_item(slot12, view_menu, "USE LIGHT", "Use Light\t" .. self.ctrl_menu_binding("Post processor effects", self))

	slot19 = "show_center"
	slot16 = "Show Center on / off"

	view_menu.append_check_item(slot12, view_menu, "SHOW CENTER", "Show Center\t" .. self.ctrl_menu_binding("Post processor effects", self))

	slot15 = self._show_center

	view_menu.set_checked(slot12, view_menu, "SHOW CENTER")

	slot19 = "show_camera_info"
	slot16 = "Show Camera info on / off"

	view_menu.append_check_item(slot12, view_menu, "SHOW CAMERA INFO", "Show Camera info\t" .. self.ctrl_menu_binding("Post processor effects", self))

	slot15 = self._show_camera_position

	view_menu.set_checked(slot12, view_menu, "SHOW CAMERA INFO")

	slot16 = "Show Marker on / off"

	view_menu.append_check_item(slot12, view_menu, "SHOW_MARKER_BALL", "Show Marker")

	slot15 = self._layer_draw_marker

	view_menu.set_checked(slot12, view_menu, "SHOW_MARKER_BALL")

	slot15 = "View"

	menu_bar.append(slot12, menu_bar, view_menu)

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "LIGHTING", "EVT_COMMAND_MENU_SELECTED", callback("Post processor effects", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "ALBEDO", "EVT_COMMAND_MENU_SELECTED", callback("deferred_lighting", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "NORMAL", "EVT_COMMAND_MENU_SELECTED", callback("albedo_visualization", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "SPECULAR", "EVT_COMMAND_MENU_SELECTED", callback("normal_visualization", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "GLOSSINESS", "EVT_COMMAND_MENU_SELECTED", callback("specular_visualization", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "DEPTH", "EVT_COMMAND_MENU_SELECTED", callback("glossiness_visualization", self, self))

	slot20 = "change_visualization"

	Global.frame.connect(slot12, Global.frame, "AO", "EVT_COMMAND_MENU_SELECTED", callback("depth_visualization", self, self))

	slot20 = "toggle_lock_1280_720"

	Global.frame.connect(slot12, Global.frame, "LOCK_1280_720", "EVT_COMMAND_MENU_SELECTED", callback("ao_visualization", self, self))

	slot20 = "toggle_orthographic"

	Global.frame.connect(slot12, Global.frame, "ORTHOGRAPHIC", "EVT_COMMAND_MENU_SELECTED", callback({
		view_menu,
		"LOCK_1280_720"
	}, self, self))

	slot20 = "toggle_light"

	Global.frame.connect(slot12, Global.frame, "USE LIGHT", "EVT_COMMAND_MENU_SELECTED", callback({
		view_menu,
		"ORTHOGRAPHIC"
	}, self, self))

	slot20 = "toggle_show_center"

	Global.frame.connect(slot12, Global.frame, "SHOW CENTER", "EVT_COMMAND_MENU_SELECTED", callback({
		view_menu,
		"USE LIGHT"
	}, self, self))

	slot20 = "toggle_show_camera_info"

	Global.frame.connect(slot12, Global.frame, "SHOW CAMERA INFO", "EVT_COMMAND_MENU_SELECTED", callback({
		view_menu,
		"SHOW CENTER"
	}, self, self))

	slot20 = "toggle_draw_marker_ball"
	slot17 = {
		view_menu,
		"SHOW_MARKER_BALL"
	}

	Global.frame.connect(slot12, Global.frame, "SHOW_MARKER_BALL", "EVT_COMMAND_MENU_SELECTED", callback({
		view_menu,
		"SHOW CAMERA INFO"
	}, self, self))

	slot14 = ""
	local hide_menu = EWS.Menu(slot12, EWS)
	slot17 = "Unhide units by name"

	hide_menu.append_item(EWS, hide_menu, "UNHIDE_BY_NAME", "Unhide by name")

	slot20 = "unhide_all"
	slot17 = "Unhide all units"

	hide_menu.append_item(EWS, hide_menu, "UNHIDE_ALL", "Unhide all\t" .. self.ctrl_menu_binding(self, self))

	slot20 = "hide_selected"
	slot17 = "Hide selected units"

	hide_menu.append_item(EWS, hide_menu, "HIDE_SELECTED", "Hide selected\t" .. self.ctrl_menu_binding(self, self))

	slot17 = "Hide unselected units"

	hide_menu.append_item(EWS, hide_menu, "HIDE_UNSELECTED", "Hide unselected")

	slot21 = "on_unhide_by_name"

	Global.frame.connect(EWS, Global.frame, "UNHIDE_BY_NAME", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot21 = "on_unhide_all"

	Global.frame.connect(EWS, Global.frame, "UNHIDE_ALL", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot21 = "on_hide_selected"

	Global.frame.connect(EWS, Global.frame, "HIDE_SELECTED", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot21 = "on_hide_unselected"
	slot18 = nil

	Global.frame.connect(EWS, Global.frame, "HIDE_UNSELECTED", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = hide_menu

	hide_menu.append_separator(EWS)

	slot17 = "Hide current layer"

	hide_menu.append_item(EWS, hide_menu, "HIDE_CURRENT_LAYERS", "Hide current layer")

	slot17 = "Hide all layers but current"

	hide_menu.append_item(EWS, hide_menu, "HIDE_ALL_LAYERS", "Hide other layers")

	slot18 = "Hide layers"

	hide_menu.append_menu(EWS, hide_menu, "HIDE_LAYERS", "Hide", self._hide_layer_menu)
	hide_menu.append_menu(EWS, hide_menu, "UNHIDE_HIDE_LAYERS", "Unhide", self._unhide_layer_menu)

	slot21 = "on_hide_current_layer"

	Global.frame.connect(EWS, Global.frame, "HIDE_CURRENT_LAYERS", "EVT_COMMAND_MENU_SELECTED", callback("Unhide layers", self, self))

	slot21 = "on_hide_all_layers"

	Global.frame.connect(EWS, Global.frame, "HIDE_ALL_LAYERS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = hide_menu

	hide_menu.append_separator(EWS)

	slot20 = "hide_helpers"
	slot17 = "Hide Helpers"

	hide_menu.append_item(EWS, hide_menu, "HIDE HELPERS", "Hide Helpers\t" .. self.ctrl_menu_binding(nil, self))

	slot20 = "unhide_helpers"
	slot17 = "Unhide Helpers"

	hide_menu.append_item(EWS, hide_menu, "UNHIDE HELPERS", "Unhide Helpers\t" .. self.ctrl_menu_binding(nil, self))

	slot20 = "hide_helpers_except_lights"
	slot17 = "Hide Helpers except lights"

	hide_menu.append_item(EWS, hide_menu, "HIDE HELPERS EXCEPT LIGHTS", "Hide Helpers Except Lights\t" .. self.ctrl_menu_binding(nil, self))

	slot14 = hide_menu

	hide_menu.append_separator(EWS)

	slot17 = "Toggle rendering of effects on and off"

	hide_menu.append_check_item(EWS, hide_menu, "RENDER_EFFECTS", "Render Effects")

	slot16 = true

	hide_menu.set_checked(EWS, hide_menu, "RENDER_EFFECTS")

	slot21 = "on_hide_helper_units"

	Global.frame.connect(EWS, Global.frame, "HIDE HELPERS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot21 = "on_hide_helper_units"

	Global.frame.connect(EWS, Global.frame, "UNHIDE HELPERS", "EVT_COMMAND_MENU_SELECTED", callback({
		vis = false
	}, self, self))

	slot21 = "on_hide_helper_units"

	Global.frame.connect(EWS, Global.frame, "HIDE HELPERS EXCEPT LIGHTS", "EVT_COMMAND_MENU_SELECTED", callback({
		vis = true
	}, self, self))

	slot21 = "toggle_render_effects"
	slot18 = {
		hide_menu,
		"RENDER_EFFECTS"
	}

	Global.frame.connect(EWS, Global.frame, "RENDER_EFFECTS", "EVT_COMMAND_MENU_SELECTED", callback({
		vis = false,
		skip_lights = true
	}, self, self))

	slot16 = "Hide/Unhide"

	menu_bar.append(EWS, menu_bar, hide_menu)

	slot15 = ""
	local advanced_menu = EWS.Menu(EWS, EWS)
	slot21 = "configuration"
	slot18 = "Configuration"

	advanced_menu.append_item(EWS, advanced_menu, "CONFIGURATION", "Configuration...\t" .. self.ctrl_menu_binding(self, self))

	slot18 = "Show controller bindings"

	advanced_menu.append_item(EWS, advanced_menu, "CONTROLLER_BINDINGS", "Show controller bindings...")

	slot15 = advanced_menu

	advanced_menu.append_separator(EWS)

	slot21 = "expert_mode"
	slot18 = "Toggle expert mode"

	advanced_menu.append_check_item(EWS, advanced_menu, "EXPERT MODE", "Expert Mode\t" .. self.ctrl_menu_binding(self, self))

	slot17 = false

	advanced_menu.set_checked(EWS, advanced_menu, "EXPERT MODE")

	slot15 = advanced_menu

	advanced_menu.append_separator(EWS)

	slot21 = "global_select_unit"
	slot18 = "Global select unit"

	advanced_menu.append_item(EWS, advanced_menu, "SELECT UNIT", "Global select unit...\t" .. self.ctrl_menu_binding(self, self))

	slot21 = "select_by_name"
	slot18 = "Select by name"

	advanced_menu.append_item(EWS, advanced_menu, "SELECT BY NAME", "Select by name...\t" .. self.ctrl_menu_binding(self, self))

	slot17 = "Advanced"

	menu_bar.append(EWS, menu_bar, advanced_menu)

	slot22 = "on_configuration"

	Global.frame.connect(EWS, Global.frame, "CONFIGURATION", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot22 = "on_controller_bindings"

	Global.frame.connect(EWS, Global.frame, "CONTROLLER_BINDINGS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot22 = "on_expert_mode"

	Global.frame.connect(EWS, Global.frame, "EXPERT MODE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot22 = "on_global_select_unit"

	Global.frame.connect(EWS, Global.frame, "SELECT UNIT", "EVT_COMMAND_MENU_SELECTED", callback({
		advanced_menu,
		"EXPERT MODE"
	}, self, self))

	slot22 = "on_select_by_name"
	slot19 = ""

	Global.frame.connect(EWS, Global.frame, "SELECT BY NAME", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = ""
	local unit_menu = EWS.Menu(EWS, EWS)
	slot22 = "toggle_edit_unit_dialog"
	slot19 = "Show/hide the Edit Unit dialog."

	unit_menu.append_item(EWS, unit_menu, "EDIT_UNIT_DIALOG", "Edit Unit..\t" .. self.ctrl_menu_binding(self, self))

	slot19 = "Reload Unit"

	unit_menu.append_item(EWS, unit_menu, "RELOAD UNIT", "Reload Unit")

	slot19 = "Reload Unit Quick"

	unit_menu.append_item(EWS, unit_menu, "RELOAD UNIT QUICK", "Reload Unit Quick")

	slot18 = "Unit"

	menu_bar.append(EWS, menu_bar, unit_menu)

	slot23 = "toggle_edit_unit_dialog"

	Global.frame.connect(EWS, Global.frame, "EDIT_UNIT_DIALOG", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot23 = "on_reload_unit"

	Global.frame.connect(EWS, Global.frame, "RELOAD UNIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot24 = true

	Global.frame.connect(EWS, Global.frame, "RELOAD UNIT QUICK", "EVT_COMMAND_MENU_SELECTED", callback("", self, self, "on_reload_unit"))

	slot18 = ""
	slot15 = EWS.Menu(Global.frame, EWS)
	self._profiler_menu = slot15
	slot19 = ""

	self._profiler_menu.append_item(slot15, self._profiler_menu, "PROFILER_MAIN", "Main")

	slot19 = ""

	self._profiler_menu.append_item(slot15, self._profiler_menu, "PROFILER_MEM", "Mem")

	slot19 = ""

	self._profiler_menu.append_item(slot15, self._profiler_menu, "PROFILER_D3D", "D3d")

	slot19 = ""

	self._profiler_menu.append_item(slot15, self._profiler_menu, "PROFILER_UNIT_PROFILER", "Unit Profiler")

	slot18 = "Profiler"

	menu_bar.append(slot15, menu_bar, self._profiler_menu)

	slot23 = "on_profiler_main"

	Global.frame.connect(slot15, Global.frame, "PROFILER_MAIN", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_profiler_mem"

	Global.frame.connect(slot15, Global.frame, "PROFILER_MEM", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_profiler_d3d"

	Global.frame.connect(slot15, Global.frame, "PROFILER_D3D", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_profiler_unit_profiler"

	Global.frame.connect(slot15, Global.frame, "PROFILER_UNIT_PROFILER", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot18 = ""
	slot15 = EWS.Menu(Global.frame, EWS)
	self._debug_menu = slot15
	slot19 = "Adds a workview based on camera position and rotation"

	self._debug_menu.append_item(slot15, self._debug_menu, "ADD_WORKVIEW", "Add workview")

	slot19 = "Shows the workviews dialog"

	self._debug_menu.append_item(slot15, self._debug_menu, "SHOW_WORKVIEW", "Show workviews")

	slot16 = self._debug_menu

	self._debug_menu.append_separator(slot15)

	slot19 = "Goes through all units and checks if any of the same share position and rotation"

	self._debug_menu.append_item(slot15, self._debug_menu, "CHECK DUALITY", "Check Unit Duality")

	slot16 = self._debug_menu

	self._debug_menu.append_separator(slot15)

	slot22 = "capture_screenshot"
	slot19 = "Choose this to create a screenshot"

	self._debug_menu.append_item(slot15, self._debug_menu, "TB_MAKE_SCREENSHOT", "Capture Screenshot\t" .. self.ctrl_menu_binding("", self))

	slot19 = "Toggle debug draw of occluder objects"

	self._debug_menu.append_check_item(slot15, self._debug_menu, "TB_DRAW_OCCLUDERS", "Draw Occluders")

	slot23 = "on_add_workview"

	Global.frame.connect(slot15, Global.frame, "ADD_WORKVIEW", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_show_workview"

	Global.frame.connect(slot15, Global.frame, "SHOW_WORKVIEW", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_check_duality"

	Global.frame.connect(slot15, Global.frame, "CHECK DUALITY", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "on_make_screenshot"

	Global.frame.connect(slot15, Global.frame, "TB_MAKE_SCREENSHOT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot23 = "menu_toolbar_toggle"
	slot20 = {
		value = "_draw_occluders",
		toolbar = "_left_upper_toolbar",
		menu = "_debug_menu"
	}

	Global.frame.connect(slot15, Global.frame, "TB_DRAW_OCCLUDERS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot18 = "Debug"

	menu_bar.append(slot15, menu_bar, self._debug_menu)

	if managers and managers.toolhub then
		slot20 = Global.frame
		slot18 = "Toolhub"

		menu_bar.append(slot15, menu_bar, managers.toolhub.get_tool_menu("toolhub", managers.toolhub))
	end

	slot17 = ""
	local window_menu = EWS.Menu(slot15, EWS)
	slot20 = "Toggle markers"

	window_menu.append_check_item(EWS, window_menu, "SHOW MARKERS", "Show Markers")

	slot19 = self._show_markers

	window_menu.set_checked(EWS, window_menu, "SHOW MARKERS")

	slot24 = "toggle_show_markers"
	slot21 = {
		window_menu,
		"SHOW MARKERS"
	}

	Global.frame.connect(EWS, Global.frame, "SHOW MARKERS", "EVT_COMMAND_MENU_SELECTED", callback(slot21, self, self))

	slot19 = "Window"

	menu_bar.append(EWS, menu_bar, window_menu)

	slot18 = ""
	local help_menu = EWS.Menu(EWS, EWS)
	slot21 = "Open help"

	help_menu.append_item(EWS, help_menu, "HELP", "Problem solver")

	slot21 = "Open using the editor"

	help_menu.append_item(EWS, help_menu, "USING THE EDITOR", "Using the editor")

	slot18 = help_menu

	help_menu.append_separator(EWS)

	slot21 = "Hello and whatnot"

	help_menu.append_item(EWS, help_menu, "ABOUT", "About...")

	slot20 = "Help"

	menu_bar.append(EWS, menu_bar, help_menu)

	slot25 = "on_help"

	Global.frame.connect(EWS, Global.frame, "HELP", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot25 = "on_using_the_editor"

	Global.frame.connect(EWS, Global.frame, "USING THE EDITOR", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot25 = "on_about"
	slot22 = ""

	Global.frame.connect(EWS, Global.frame, "ABOUT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	return 
end
function CoreEditor:confirm_on_new()
	if Global.running_simulation then
		slot7 = "YES_NO,CANCEL,ICON_QUESTION"
		slot12 = 0
		local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Want to quit?", "Bringer of World", Vector3(slot9, -1, -1))

		if confirm == "CANCEL" or confirm == "NO" then
			return true
		elseif confirm == "YES" then
			return false
		end
	end

	if self._confirm_on_new then
		slot7 = "YES_NO,CANCEL,ICON_QUESTION"
		slot12 = 0
		local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Save Changes?", "Bringer of World", Vector3(slot9, -1, -1))

		if confirm == "CANCEL" then
			return true
		elseif confirm == "YES" then
			slot4 = self

			self.on_save(slot3)
		end

		self._confirm_on_new = false
	end

	return 
end
function CoreEditor:on_new()
	slot3 = self

	if self.confirm_on_new(slot2) then
		return 
	end

	self._title = self._editor_name
	slot4 = self._title

	Global.frame.set_title(slot2, Global.frame)

	slot3 = self

	self.clear_all(slot2)

	self._lastfile = nil

	if self._unit_list then
		slot3 = self._unit_list

		self._unit_list.reset(slot2)
	end

	return 
end
function CoreEditor:on_open()
	slot3 = self

	if self.confirm_on_new(slot2) then
		return 
	end

	slot6 = self._lastdir
	local opendlg_path, opendlg_dir = managers.database.open_file_dialog(slot2, managers.database, Global.frame, "Worlds (*.world)|*.world")

	if opendlg_path and opendlg_dir then
		local path = opendlg_path
		local dir = opendlg_dir
		slot8 = opendlg_path

		if managers.database.is_valid_database_path(slot6, managers.database) then
			slot9 = path

			self.load_level(slot6, self, dir)
		else
			slot8 = "Cant open file from outside the project"

			self.output_error(slot6, self)

			slot7 = self

			self.on_open(slot6)
		end
	end

	return 
end
function CoreEditor:on_save()
	if Global.running_simulation then
		slot4 = "Won't save during simulation."

		self.output_warning(slot2, self)

		return 
	end

	if self._lastfile then
		slot5 = self._lastdir

		self.do_save(slot2, self, self._lastfile)

		local rules = {
			ignore = {
				dds = true
			}
		}
		slot8 = "incremental"
		slot7 = rules

		self.copy_incremental(self, self, self.create_temp_saves(slot6, self), self._lastdir)
	else
		slot3 = self

		self.on_saveas(slot2)
	end

	return 
end
function CoreEditor:create_temp_saves(type)
	slot7 = managers.database
	slot6 = ""
	local a = string.gsub(slot3, managers.editor._lastdir, managers.database.base_path(slot6))
	local dirs = {}
	slot7 = "[%w_]+"

	for w in string.gmatch(managers.database.base_path(slot6), a) do
		slot11 = w

		table.insert(slot9, dirs)
	end

	local d = self._editor_temp_path
	slot7 = dirs

	for _, dir in ipairs(slot6) do
		d = d .. "\\" .. dir
		slot13 = d

		if not SystemFS.exists("\\", SystemFS) then
			slot13 = d

			SystemFS.make_dir(slot11, SystemFS)
		end
	end

	d = d .. "\\" .. type
	slot8 = d

	if not SystemFS.exists("\\", SystemFS) then
		slot8 = d

		SystemFS.make_dir(slot6, SystemFS)
	end

	return d
end
function CoreEditor:on_saveas()
	if Global.running_simulation then
		slot4 = "Won't save during simulation."

		self.output_warning(slot2, self)

		return 
	end

	slot9 = managers.database
	slot7 = managers.database.base_path(slot8) .. self._lastdir
	local savedlg_path, savedlg_dir = managers.database.save_file_dialog(slot2, managers.database, Global.frame, true, "Worlds (*.world)|*.world")

	if savedlg_path and savedlg_dir then
		local save_continents = true
		slot9 = save_continents

		self.do_save(slot5, self, savedlg_path, savedlg_dir)

		slot8 = savedlg_dir

		self.save_editor_settings(slot5, self, savedlg_path)
	end

	return 
end
function CoreEditor:on_saveascopy()
	if Global.running_simulation then
		slot4 = "Won't save during simulation."

		self.output_warning(slot2, self)

		return 
	end

	slot9 = managers.database
	slot7 = managers.database.base_path(slot8) .. self._lastdir
	local savedlg_path, savedlg_dir = managers.database.save_file_dialog(slot2, managers.database, Global.frame, true, "Worlds (*.world)|*.world")

	if savedlg_path and savedlg_dir then
		local save_continents = true
		slot9 = save_continents

		self.do_save(slot5, self, savedlg_path, savedlg_dir)
	end

	return 
end
function CoreEditor:on_load_recent_file(index)
	if not self._recent_files[index] then
		slot5 = "No recent files to load."

		Application.error(slot3, Application)
	end

	slot4 = self

	if self.confirm_on_new(slot3) then
		return 
	end

	slot6 = self._recent_files[index].path

	self.load_level(slot3, self, self._recent_files[index].dir)

	return 
end
function CoreEditor:on_close(custom_data, event_object)
	slot5 = self

	if self.confirm_on_new(slot4) then
		return 
	end

	slot5 = self

	self.save_edit_setting_values(slot4)

	slot5 = self

	self.save_layout(slot4)
	CoreEngineAccess._quit()

	return 
end
function CoreEditor:on_enable_all_layers()
	slot5 = self

	for name, layer in pairs(self.layers(slot4)) do
		slot9 = true

		layer.set_enabled(slot7, layer)

		slot10 = false

		self._disable_layer_menu.set_checked(slot7, self._disable_layer_menu, "DISABLE_" .. name)
	end

	return 
end
function CoreEditor:on_disable_layers()
	slot5 = self

	for name, layer in pairs(self.layers(slot4)) do
		if layer ~= self._current_layer then
			slot10 = true

			self._disable_layer_menu.set_checked(slot7, self._disable_layer_menu, "DISABLE_" .. name)

			slot9 = {
				name = name,
				id = "DISABLE_" .. name
			}

			self.on_disable_layer(slot7, self)
		end
	end

	return 
end
function CoreEditor:on_disable_layer(data)
	slot5 = data.name
	slot8 = data.id
	slot5 = not self._disable_layer_menu.is_checked(slot6, self._disable_layer_menu)
	local accepted = self.layer(slot3, self).set_enabled(slot3, self.layer(slot3, self))

	if not accepted then
		slot7 = false

		self._disable_layer_menu.set_checked(slot4, self._disable_layer_menu, data.id)
	end

	return 
end
function CoreEditor:on_hide_layer(data)
	slot5 = data.name
	slot4 = self.layer(slot3, self)

	self.layer(slot3, self).hide_all(slot3)

	return 
end
function CoreEditor:on_unhide_layer(data)
	slot5 = data.name
	slot4 = self.layer(slot3, self)

	self.layer(slot3, self).unhide_all(slot3)

	return 
end
function CoreEditor:on_change_layer(index)
	slot5 = index

	self._notebook.set_page(slot3, self._notebook)

	return 
end
function CoreEditor:on_select_group_by_name()
	slot5 = "SelectGroupByName"

	self.show_dialog(slot2, self, "select_group_by_name")

	return 
end
function CoreEditor:group()
	slot5 = self._current_layer

	if alive(self._current_layer.selected_unit(slot4)) then
		slot3 = self._groups
		local name = self._groups.group_name(slot2)

		if name then
			slot4 = self._current_layer
			local unit = self._current_layer.selected_unit(slot3)
			slot7 = self._current_layer
			local units = clone(self._current_layer.selected_units(slot6))
			slot9 = units

			self.create_group(self._current_layer.selected_units, self, name, unit)
		end
	end

	return 
end
function CoreEditor:ungroup()
	slot5 = self._current_layer

	if alive(self._current_layer.selected_unit(slot4)) then
		slot3 = self._current_layer
		slot3 = self._current_layer.selected_unit(slot2)
		local groups = self._current_layer.selected_unit(slot2).unit_data(slot2).editor_groups

		if groups and 0 < #groups then
			local group = groups[#groups]
			slot5 = self
			slot8 = group

			self.remove_group(slot4, group.name(slot7))
		end
	end

	return 
end
function CoreEditor:save_group()
	slot5 = self._current_layer

	if alive(self._current_layer.selected_unit(slot4)) then
		slot3 = self._current_layer
		slot3 = self._current_layer.selected_unit(slot2)
		local groups = self._current_layer.selected_unit(slot2).unit_data(slot2).editor_groups

		if groups and 0 < #groups then
			local group = groups[#groups]
			slot5 = group

			group.save_to_file(slot4)
		end
	end

	return 
end
function CoreEditor:load_group()
	slot3 = self._groups

	self._groups.load_group(slot2)

	return 
end
function CoreEditor:show_group_presets()
	slot4 = self._group_presets_path

	if not SystemFS.exists(slot2, SystemFS) then
		slot4 = self._group_presets_path

		SystemFS.make_dir(slot2, SystemFS)
	end

	slot6 = false
	local files = SystemFS.list(slot2, SystemFS, self._group_presets_path, "*.xml")
	slot6 = self._group_presets_path

	GroupPresetsDialog.new(SystemFS, GroupPresetsDialog, files)

	return 
end
function CoreEditor:dump_group()
	slot5 = self._current_layer

	if alive(self._current_layer.selected_unit(slot4)) then
		slot3 = self._current_layer
		slot3 = self._current_layer.selected_unit(slot2)
		local groups = self._current_layer.selected_unit(slot2).unit_data(slot2).editor_groups

		if groups and 0 < #groups then
			local group = groups[#groups]
			slot6 = group.units(slot7)
			slot9 = group

			managers.editor.dump_mesh(slot4, managers.editor, group.name(group))
		end
	end

	return 
end
function CoreEditor:on_difficulty(difficulty)
	self._mission_difficulty = difficulty

	return 
end
function CoreEditor:on_players(player)
	self._mission_player = player

	return 
end
function CoreEditor:mission_player()
	return self._mission_player
end
function CoreEditor:on_platform(platform)
	self._mission_platform = platform

	return 
end
function CoreEditor:mission_platform()
	return self._mission_platform
end
function CoreEditor:toggle_info(data)
	if data[2] == "INFO OUTPUT" then
		slot4 = self._outputctrl
		slot8 = data[2]

		self._outputctrl.set_visible(slot3, data[1].is_checked(slot6, data[1]))
	elseif data[2] == "INFO UNIT" then
		slot4 = self._unit_info
		slot8 = data[2]

		self._unit_info.set_visible(slot3, data[1].is_checked(slot6, data[1]))
	end

	slot4 = self._info_frame

	self._info_frame.layout(slot3)

	return 
end
function CoreEditor:show_news()
	slot4 = true

	self._world_editor_news.set_visible(slot2, self._world_editor_news)

	return 
end
function CoreEditor:change_visualization(viz)
	slot6 = managers.viewport

	for _, vp in ipairs(managers.viewport.viewports(slot5)) do
		slot10 = viz

		vp.set_visualization_mode(slot8, vp)
	end

	return 
end
function CoreEditor:on_post_processor_effect(effect)

	-- Decompilation error in this vicinity:
	slot5 = "empty"
	local effects_off = Idstring(slot3) == Idstring(effect)
	local vls_effect = (effects_off and "none") or "standard"
	slot13 = self
	slot13 = self.viewport(slot12)
	slot15 = Idstring(slot16)
	slot18 = effect

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring("dof_prepare_post_processor"))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "bloom_combine_post_processor"

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(Idstring))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "lens_distortion"

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(bloom_combine_effect))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "contour_post_processor"

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(lens_distortion_effect))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "color_grading_post"

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(contour_effect))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "lens_flare_post_processor"

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(cg_effect))

	slot13 = self
	slot13 = self.viewport(slot12)
	slot17 = "lens_flare_apply_post_processor"
	slot16 = lens_flare_apply_effect

	self.viewport(slot12).vp(slot12).set_post_processor_effect(slot12, self.viewport(slot12).vp(slot12), "World", Idstring(lens_flare_effect))

	slot14 = vls_effect

	managers.environment_controller.set_volumetric_light_scatter_setting(slot12, managers.environment_controller)

	return 
end
function CoreEditor:toggle_lock_1280_720(data)
	slot5 = data[2]

	if data[1].is_checked(slot3, data[1]) then
		slot4 = self
		slot9 = 0

		self._set_appwin_fixed_resolution(slot3, Vector3(slot6, 1280, 720))
	else
		slot5 = nil

		self._set_appwin_fixed_resolution(slot3, self)
	end

	return 
end
function CoreEditor:toggle_orthographic(data)
	slot5 = data[2]
	self._orthographic = data[1].is_checked(slot3, data[1])
	slot5 = self._orthographic

	self._camera_controller.toggle_orthographic(slot3, self._camera_controller)

	return 
end
function CoreEditor:toggle_light(data)
	slot4 = self._light
	slot8 = data[2]

	self._light.set_enable(slot3, data[1].is_checked(slot6, data[1]))

	return 
end
function CoreEditor:toggle_show_center(data)
	slot5 = data[2]
	self._show_center = data[1].is_checked(slot3, data[1])

	return 
end
function CoreEditor:toggle_show_camera_info(data)
	slot5 = data[2]
	self._show_camera_position = data[1].is_checked(slot3, data[1])
	slot5 = self._show_camera_position

	self.set_show_camera_info(slot3, self)

	return 
end
function CoreEditor:toggle_draw_marker_ball(data)
	slot5 = data[2]
	self._layer_draw_marker = data[1].is_checked(slot3, data[1])

	return 
end
function CoreEditor:on_configuration()
	slot3 = self._configuration

	self._configuration.show_modal(slot2)

	return 
end
function CoreEditor:on_controller_bindings()
	slot5 = "EditControllerBindings"

	self.show_dialog(slot2, self, "edit_controller_bindings")

	return 
end
function CoreEditor:on_expert_mode(data)
	slot5 = data[2]
	local expert = data[1].is_checked(slot3, data[1])
	slot6 = not expert

	self._ews_editor_frame.set_visible(data[1], self._ews_editor_frame)

	slot6 = not expert

	self._lower_panel.set_visible(data[1], self._lower_panel)

	slot5 = Global.frame_panel

	Global.frame_panel.layout(data[1])

	return 
end
function CoreEditor:on_reload_unit(quick)
	local names = {}

	if self._current_layer then
		slot7 = self._current_layer

		for _, unit in ipairs(self._current_layer.selected_units(slot6)) do
			slot10 = unit

			if alive(slot9) then
				local name = unit.name(slot9)
				slot12 = name

				if not table.contains(unit, names) then
					slot12 = name

					table.insert(slot10, names)
				end
			end
		end
	end

	slot7 = quick

	self.reload_units(slot4, self, names)

	return 
end
function CoreEditor:on_profiler_main(custom_data, event_object)
	slot9 = event_object
	slot7 = not event_object.is_checked(slot8)

	self._profiler_menu.set_checked(slot4, self._profiler_menu, "PROFILER_MAIN")

	slot6 = "stats main"

	Application.console_command(slot4, Application)

	return 
end
function CoreEditor:on_profiler_mem(custom_data, event_object)
	slot9 = event_object
	slot7 = not event_object.is_checked(slot8)

	self._profiler_menu.set_checked(slot4, self._profiler_menu, "PROFILER_MEM")

	slot6 = "stats mem"

	Application.console_command(slot4, Application)

	return 
end
function CoreEditor:on_profiler_d3d(custom_data, event_object)
	slot9 = event_object
	slot7 = not event_object.is_checked(slot8)

	self._profiler_menu.set_checked(slot4, self._profiler_menu, "PROFILER_D3D")

	slot6 = "stats d3d"

	Application.console_command(slot4, Application)

	return 
end
function CoreEditor:on_profiler_unit_profiler(custom_data, event_object)
	slot9 = event_object
	slot7 = not event_object.is_checked(slot8)

	self._profiler_menu.set_checked(slot4, self._profiler_menu, "PROFILER_UNIT_PROFILER")

	slot6 = "stats unit_profiler"

	Application.console_command(slot4, Application)

	return 
end
function CoreEditor:on_add_workview()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for new work view:", "Add work view", "", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		slot4 = self
		local continent = self.current_continent_name(slot3)

		if self._values[continent].workviews[name] then
			slot5 = self

			self.on_add_workview(slot4)
		else
			slot6 = name

			self.add_workview(slot4, self)
		end
	end

	return 
end
function CoreEditor:on_show_workview()
	slot5 = "SelectWorkView"

	self.show_dialog(slot2, self, "workview_by_name")

	return 
end
function CoreEditor:on_check_duality()
	local units = {}
	local collisions = {
		only_positions = {},
		complete = {}
	}
	slot8 = "all"

	for _, unit in ipairs(World.find_units_quick(slot6, World)) do
		local pos = unit.position(slot9)
		slot11 = pos
		slot14 = pos.x
		pos = pos.with_x(unit, math.floor(slot13))
		slot11 = pos
		slot14 = pos.y
		pos = pos.with_y(unit, math.floor(slot13))
		slot11 = pos
		slot14 = pos.z
		pos = pos.with_z(unit, math.floor(slot13))
		local rot = unit.rotation(unit)
		slot13 = math.floor(rot.pitch(rot))
		slot18 = rot
		rot = Vector3(unit, math.floor(rot.yaw(slot15)), math.floor(rot.roll(rot)))
		slot12 = unit
		slot12 = unit.name(unit)
		local unit_name = units[unit.name(unit).s(unit)]

		if unit_name then
			slot13 = unit_name

			for _, data in ipairs(slot12) do
				if data.pos == pos then
					if data.rot == rot then
						slot19 = {
							u1 = data.unit,
							u2 = unit,
							pos = pos
						}

						table.insert(slot17, collisions.complete)
					else
						slot19 = {
							u1 = data.unit,
							u2 = unit,
							pos = pos
						}

						table.insert(slot17, collisions.only_positions)
					end
				end
			end

			slot14 = {
				unit = unit,
				pos = pos,
				rot = rot
			}

			table.insert(slot12, unit_name)
		else
			slot13 = unit
			slot13 = unit.name(slot12)
			units[unit.name(slot12).s(slot12)] = {
				{
					unit = unit,
					pos = pos,
					rot = rot
				}
			}
		end
	end

	local pos = nil

	if self._unit_duality then
		slot6 = self._unit_duality
		pos = self._unit_duality.position(slot5)
		slot6 = self._unit_duality

		self._unit_duality.destroy(slot5)
	end

	slot8 = pos
	self._unit_duality = UnitDuality.new(slot5, UnitDuality, collisions)

	return 
end
function CoreEditor:on_make_screenshot()
	slot4 = "%Y-%m-%d_%H.%M.%S"
	local name = Application.date(slot2, Application) .. ".tga"
	slot5 = name

	Application.screenshot(Application, Application)

	slot5 = "Screenshot created: " .. name .. "."

	self.output(Application, self)

	return 
end
function CoreEditor:toggle_draw_occluders(data)
	slot5 = data[2]
	self._draw_occluders = data[1].is_checked(slot3, data[1])

	return 
end
slot2 = "leveltools"
local leveltools_ids = Idstring(function (self, data)
	slot5 = data[2]
	self._draw_occluders = data[1].is_checked(slot3, data[1])

	return 
end)
function CoreEditor:on_hide_helper_units(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local cache = {}
	slot5 = self._layers

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-76, warpins: 0 ---
	for name, layer in pairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		slot12 = layer

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-74, warpins: 0 ---
		for _, unit in ipairs(layer.created_units(slot11)) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 1 ---
			slot15 = unit
			slot15 = unit.name(slot14)
			local u_key = unit.name(slot14).s(slot14)

			if cache[u_key] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-24, warpins: 1 ---
				if not cache[u_key].skip then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 25-31, warpins: 1 ---
					slot18 = cache[u_key].vis_state

					self.set_unit_visible(slot15, self, unit)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-38, warpins: 1 ---
				local vis_state, affected = nil
				slot18 = unit
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 68-72, warpins: 2 ---
				cache[u_key] = {
					vis_state = vis_state,
					skip = not affected
				}
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-74, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 75-76, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 77-78, warpins: 1 ---
	cache = nil

	return 
	--- END OF BLOCK #2 ---



end
function CoreEditor:toggle_render_effects(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot4 = World
	slot4 = World.effect_manager(slot3)
	slot8 = data[2]

	World.effect_manager(slot3).set_rendering_enabled(slot3, data[1].is_checked(slot6, data[1]))

	return 
	--- END OF BLOCK #0 ---



end
function CoreEditor:toggle_show_markers(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot4 = self._marker_panel
	slot8 = data[2]

	self._marker_panel.set_visible(slot3, data[1].is_checked(slot6, data[1]))

	slot4 = self._ews_editor_frame

	self._ews_editor_frame.layout(slot3)

	return 
	--- END OF BLOCK #0 ---



end
function CoreEditor:on_using_the_editor()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = "https://intranet.starbreeze.com/wiki/index.php?title=Category:Level_Design"

	EWS.launch_url(slot2, EWS)

	return 
	--- END OF BLOCK #0 ---



end
function CoreEditor:on_help()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = "http://mondomonkey.com/MondoMonkeyWhiteB.jpg"

	EWS.launch_url(slot2, EWS)

	return 
	--- END OF BLOCK #0 ---



end
function CoreEditor:on_about()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot7 = "OK,ICON_INFORMATION"
	slot3 = EWS.MessageDialog(slot2, EWS, Global.frame_panel, self._editor_name .. [[


"And the Earth Was Without Form and Void.."

Copyright 2007-~ GRiN, Inc.

http://ganon/ or http://www.grin.se]], "About...")

	EWS.MessageDialog(slot2, EWS, Global.frame_panel, self._editor_name .. [[


"And the Earth Was Without Form and Void.."

Copyright 2007-~ GRiN, Inc.

http://ganon/ or http://www.grin.se]], "About...").show_modal(slot2)

	return 
	--- END OF BLOCK #0 ---



end

return 
