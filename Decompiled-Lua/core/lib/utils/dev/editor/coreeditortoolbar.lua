function CoreEditor:build_toolbar()
	local icons_path = managers.database.base_path(slot2) .. "core\\lib\\utils\\dev\\editor\\icons\\"
	slot7 = "TB_FLAT,TB_NODIVIDER"
	self._toolbar = EWS.ToolBar(managers.database, EWS, Global.frame, "")
	slot5 = self._toolbar

	Global.frame.set_tool_bar(managers.database, Global.frame)

	slot10 = "new"
	slot9 = "toolbar\\new_16x16.png"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB NEW WORLD", "New World (" .. self.ctrl_menu_binding(slot8, self) .. ")", CoreEWS.image_path(")"))

	slot11 = "on_new"

	self._toolbar.connect(managers.database, self._toolbar, "TB NEW WORLD", "EVT_COMMAND_MENU_SELECTED", callback("New World", self, self))

	slot10 = "open"
	slot9 = "toolbar\\open_16x16.png"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB OPEN WORLD", "Open World (" .. self.ctrl_menu_binding("", self) .. ")", CoreEWS.image_path(")"))

	slot11 = "on_open"

	self._toolbar.connect(managers.database, self._toolbar, "TB OPEN WORLD", "EVT_COMMAND_MENU_SELECTED", callback("Open World", self, self))

	slot10 = "save"
	slot9 = "toolbar\\save_16x16.png"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB SAVE WORLD", "Save World (" .. self.ctrl_menu_binding("", self) .. ")", CoreEWS.image_path(")"))

	slot11 = "on_save"

	self._toolbar.connect(managers.database, self._toolbar, "TB SAVE WORLD", "EVT_COMMAND_MENU_SELECTED", callback("Save World", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(managers.database)

	slot10 = "select_by_name"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB SELECT BY NAME", "Select by name (" .. self.ctrl_menu_binding("", self) .. ")", icons_path .. "select_by_name.bmp")

	slot11 = "on_select_by_name"
	slot8 = ""

	self._toolbar.connect(managers.database, self._toolbar, "TB SELECT BY NAME", "EVT_COMMAND_MENU_SELECTED", callback("Select by name", self, self))
	self._toolbar.add_tool(managers.database, self._toolbar, "TB PREVIEW UNITS", "Browse all availible units", icons_path .. "browse_units.bmp")

	slot11 = "on_unit_tree_browser"

	self._toolbar.connect(managers.database, self._toolbar, "TB PREVIEW UNITS", "EVT_COMMAND_MENU_SELECTED", callback("Browse all availible units", self, self))

	slot10 = "global_select_unit"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB GLOBAL SELECT UNITS", "Global select unit (" .. self.ctrl_menu_binding("", self) .. ")", icons_path .. "global_select_unit.bmp")

	slot11 = "on_global_select_unit"

	self._toolbar.connect(managers.database, self._toolbar, "TB GLOBAL SELECT UNITS", "EVT_COMMAND_MENU_SELECTED", callback("Global select unit", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(managers.database)

	slot9 = "sequencer\\zoom_out_16x16.png"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB_HIDE_BY_NAME", "Hide by name", CoreEWS.image_path(""))

	slot11 = "on_hide_by_name"

	self._toolbar.connect(managers.database, self._toolbar, "TB_HIDE_BY_NAME", "EVT_COMMAND_MENU_SELECTED", callback("Opens the hide by name dialog", self, self))

	slot9 = "sequencer\\zoom_in_16x16.png"

	self._toolbar.add_tool(managers.database, self._toolbar, "TB_UNHIDE_BY_NAME", "Unhide by name", CoreEWS.image_path(""))

	slot11 = "on_unhide_by_name"
	slot8 = ""

	self._toolbar.connect(managers.database, self._toolbar, "TB_UNHIDE_BY_NAME", "EVT_COMMAND_MENU_SELECTED", callback("Opens the unhide by name dialog", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(managers.database)
	self._toolbar.add_tool(managers.database, self._toolbar, "TB UNIT DEBUG LIST", "Unit debug list", icons_path .. "unit_list.bmp")

	slot11 = "on_unit_list"
	slot8 = ""

	self._toolbar.connect(managers.database, self._toolbar, "TB UNIT DEBUG LIST", "EVT_COMMAND_MENU_SELECTED", callback("Unit debug list", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(managers.database)
	self._toolbar.add_tool(managers.database, self._toolbar, "TB_SELECT_GROUP_BY_NAME", "Select group by name", icons_path .. "select_group_by_name.bmp")

	slot11 = "on_select_group_by_name"

	self._toolbar.connect(managers.database, self._toolbar, "TB_SELECT_GROUP_BY_NAME", "EVT_COMMAND_MENU_SELECTED", callback("Select group by name", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(managers.database)

	slot10 = "select"

	self._toolbar.add_radio_tool(managers.database, self._toolbar, "TB WIDGET SELECT", "Select Unit (" .. self.ctrl_menu_binding("", self) .. ")", icons_path .. "widget_select.bmp")

	slot11 = "set_widget"

	Global.frame.connect(managers.database, Global.frame, "TB WIDGET SELECT", "EVT_COMMAND_MENU_SELECTED", callback("Select Unit", self, self))

	slot10 = "move"

	self._toolbar.add_radio_tool(managers.database, self._toolbar, "TB WIDGET MOVE", "Select and Move (" .. self.ctrl_menu_binding({
		rotate = false,
		select = true,
		move = false
	}, self) .. ")", icons_path .. "widget_move.bmp")

	slot11 = "set_widget"

	Global.frame.connect(managers.database, Global.frame, "TB WIDGET MOVE", "EVT_COMMAND_MENU_SELECTED", callback("Select and Move", self, self))

	slot11 = "on_move_transform_type_in"

	Global.frame.connect(managers.database, Global.frame, "TB WIDGET MOVE", "EVT_COMMAND_TOOL_RCLICKED", callback({
		rotate = false,
		select = false,
		move = true
	}, self, self))

	slot10 = "rotate"

	self._toolbar.add_radio_tool(managers.database, self._toolbar, "TB WIDGET ROTATE", "Select and Rotate (" .. self.ctrl_menu_binding(nil, self) .. ")", icons_path .. "widget_rotation.bmp")

	slot11 = "set_widget"

	Global.frame.connect(managers.database, Global.frame, "TB WIDGET ROTATE", "EVT_COMMAND_MENU_SELECTED", callback("Select and Rotate", self, self))

	slot11 = "on_rotate_transform_type_in"

	Global.frame.connect(managers.database, Global.frame, "TB WIDGET ROTATE", "EVT_COMMAND_TOOL_RCLICKED", callback({
		rotate = true,
		select = false,
		move = false
	}, self, self))

	slot4 = self

	self.build_ref_coordinate_system(managers.database)

	slot10 = "surface_move_toggle"
	slot9 = "world_editor\\surface_move_16x16.png"

	self._toolbar.add_check_tool(managers.database, self._toolbar, "TB_SURFACE_MOVE", "Surface move (" .. self.ctrl_binding(nil, self) .. ")", CoreEWS.image_path(")"))

	slot6 = self._use_surface_move

	self._toolbar.set_tool_state(managers.database, self._toolbar, "TB_SURFACE_MOVE")

	slot11 = "toolbar_toggle"
	slot8 = {
		value = "_use_surface_move",
		menu = "_edit_menu"
	}

	self._toolbar.connect(managers.database, self._toolbar, "TB_SURFACE_MOVE", "EVT_COMMAND_MENU_SELECTED", callback("Toggle surface move on and off", self, self))

	slot3 = callback(self._toolbar, self, self, "toolbar_toggle_trg")
	self._ews_triggers.surface_move_toggle = slot3
	slot10 = "use_snappoints_toggle"
	slot9 = "world_editor\\snappoints_16x16.png"

	self._toolbar.add_check_tool(slot3, self._toolbar, "TB_SNAPPOINTS", "Use Snappoints (" .. self.ctrl_binding({
		id = "TB_SURFACE_MOVE",
		value = "_use_surface_move",
		menu = "_edit_menu"
	}, self) .. ")", CoreEWS.image_path(")"))

	slot6 = self._use_snappoints

	self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPPOINTS")

	slot11 = "toolbar_toggle"
	slot8 = {
		value = "_use_snappoints",
		menu = "_edit_menu"
	}

	self._toolbar.connect(slot3, self._toolbar, "TB_SNAPPOINTS", "EVT_COMMAND_MENU_SELECTED", callback("Toggle use of snappoints on and off", self, self))

	slot3 = callback(self._toolbar, self, self, "toolbar_toggle_trg")
	self._ews_triggers.use_snappoints_toggle = slot3
	slot4 = self._toolbar

	self._toolbar.add_separator(slot3)

	slot10 = "using_group_toggle"
	slot9 = "world_editor\\using_groups_16x16.png"

	self._toolbar.add_check_tool(slot3, self._toolbar, "TB_USING_GROUPS", "Using groups (" .. self.ctrl_binding({
		id = "TB_SNAPPOINTS",
		value = "_use_snappoints",
		menu = "_edit_menu"
	}, self) .. ")", CoreEWS.image_path(")"))

	slot11 = "toolbar_toggle"
	slot8 = {
		value = "_using_groups"
	}

	self._toolbar.connect(slot3, self._toolbar, "TB_USING_GROUPS", "EVT_COMMAND_MENU_SELECTED", callback("Toggle using groups on and off", self, self))

	slot3 = callback(self._toolbar, self, self, "toolbar_toggle_trg")
	self._ews_triggers.using_group_toggle = slot3
	slot4 = self._toolbar

	self._toolbar.add_separator(slot3)

	slot5 = icons_path

	self.build_grid_sizes(slot3, self)

	slot9 = "world_editor\\toggle_draw_grid_16x16.png"

	self._toolbar.add_check_tool(slot3, self._toolbar, "TB_LAYER_DRAW_GRID", "Draw grid", CoreEWS.image_path({
		value = "_using_groups",
		id = "TB_USING_GROUPS"
	}))

	slot6 = self._layer_draw_grid

	self._toolbar.set_tool_state(slot3, self._toolbar, "TB_LAYER_DRAW_GRID")

	slot11 = "toolbar_toggle"

	self._toolbar.connect(slot3, self._toolbar, "TB_LAYER_DRAW_GRID", "EVT_COMMAND_MENU_SELECTED", callback("Toggle draw grid on and off", self, self))

	slot4 = self._toolbar

	self._toolbar.add_separator(slot3)

	slot4 = self

	self.build_snap_rotations(slot3)

	slot9 = "world_editor\\snap_rotation_x_16x16.png"

	self._toolbar.add_radio_tool(slot3, self._toolbar, "TB_SNAPROTATE_X", "Snap rotate axis X", CoreEWS.image_path({
		value = "_layer_draw_grid",
		toolbar = "_toolbar"
	}))

	slot11 = "set_snap_rotation_axis"

	Global.frame.connect(slot3, Global.frame, "TB_SNAPROTATE_X", "EVT_COMMAND_MENU_SELECTED", callback("Snap rotate axis X", self, self))

	slot9 = "world_editor\\snap_rotation_y_16x16.png"

	self._toolbar.add_radio_tool(slot3, self._toolbar, "TB_SNAPROTATE_Y", "Snap rotate axis Y", CoreEWS.image_path({
		axis = "x"
	}))

	slot11 = "set_snap_rotation_axis"

	Global.frame.connect(slot3, Global.frame, "TB_SNAPROTATE_Y", "EVT_COMMAND_MENU_SELECTED", callback("Snap rotate axis Y", self, self))

	slot9 = "world_editor\\snap_rotation_z_16x16.png"

	self._toolbar.add_radio_tool(slot3, self._toolbar, "TB_SNAPROTATE_Z", "Snap rotate axis Z", CoreEWS.image_path({
		axis = "y"
	}))

	slot11 = "set_snap_rotation_axis"
	slot8 = {
		axis = "z"
	}

	Global.frame.connect(slot3, Global.frame, "TB_SNAPROTATE_Z", "EVT_COMMAND_MENU_SELECTED", callback("Snap rotate axis Z", self, self))

	if self._snap_rotation_axis == "x" then
		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_X")
	elseif self._snap_rotation_axis == "y" then
		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_Y")
	else
		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_Z")
	end

	slot3 = callback(slot4, self, self, "change_snaprot_axis")
	self._ews_triggers.change_snaprot_axis = slot3
	slot4 = self

	self.build_rotation_speed(slot3)

	slot4 = self._toolbar

	self._toolbar.add_separator(slot3)

	slot9 = "world_editor\\generate_one_projection_16x16.png"

	self._toolbar.add_tool(slot3, self._toolbar, "TB_GENERATE_SELECTED_PROJECTION_LIGHT", "Generate selected projection light", CoreEWS.image_path({
		value = "_coordinate_system",
		t = "_coordinate_systems",
		combobox = self._ref_coordinate_system,
		menu = self._coordinate_menu
	}))

	slot9 = "world_editor\\generate_all_projection_16x16.png"

	self._toolbar.add_tool(slot3, self._toolbar, "TB_GENERATE_ALL_PROJECTION_LIGHT", "Generate all projection light", CoreEWS.image_path("Generate selected projection light"))

	slot11 = "create_projection_light"

	self._toolbar.connect(slot3, self._toolbar, "TB_GENERATE_SELECTED_PROJECTION_LIGHT", "EVT_COMMAND_MENU_SELECTED", callback("Generate all projection light", self, self))

	slot11 = "create_projection_light"
	slot8 = "all"

	self._toolbar.connect(slot3, self._toolbar, "TB_GENERATE_ALL_PROJECTION_LIGHT", "EVT_COMMAND_MENU_SELECTED", callback("selected", self, self))
	self._toolbar.add_separator(slot3)

	local s = "Burton Leon Reynolds, Jr.[2] (born February 11, 1936) is an Oscar-nominated and Emmy Award-winning American actor."

	self._toolbar.add_tool(self._toolbar, self._toolbar, "TB_HELP", "Burt Reynolds guide to using the editor", icons_path .. "burt.bmp")

	slot12 = "on_using_the_editor"
	slot9 = ""

	self._toolbar.connect(self._toolbar, self._toolbar, "TB_HELP", "EVT_COMMAND_MENU_SELECTED", callback(s, self, self))

	slot5 = self._toolbar

	self._toolbar.realize(self._toolbar)

	return 
end
function CoreEditor:set_widget(data, event)
	local id = event.get_id(slot4)
	slot8 = true

	self._edit_menu.set_checked(event, self._edit_menu, id)

	slot8 = true

	self._toolbar.set_tool_state(event, self._toolbar, id)

	self._use_move_widget = data.move
	self._use_rotate_widget = data.rotate
	slot6 = self._current_layer

	self._current_layer.release_widget(event)

	slot7 = self._use_move_widget

	self._current_layer.use_move_widget(event, self._current_layer)

	slot7 = self._use_rotate_widget

	self._current_layer.use_rotate_widget(event, self._current_layer)

	return 
end
function CoreEditor:set_snap_rotation_axis(data, event)
	local id = event.get_id(slot4)
	slot8 = true

	self._snap_rotations_axis_menu.set_checked(event, self._snap_rotations_axis_menu, id)

	slot8 = true

	self._toolbar.set_tool_state(event, self._toolbar, id)

	self._snap_rotation_axis = data.axis

	return 
end
function CoreEditor:change_snaprot_axis(data)
	if self._snap_rotation_axis == "x" then
		self._snap_rotation_axis = "y"
		slot6 = true

		self._snap_rotations_axis_menu.set_checked(slot3, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Y")

		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_Y")
	elseif self._snap_rotation_axis == "y" then
		self._snap_rotation_axis = "z"
		slot6 = true

		self._snap_rotations_axis_menu.set_checked(slot3, self._snap_rotations_axis_menu, "TB_SNAPROTATE_Z")

		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_Z")
	elseif self._snap_rotation_axis == "z" then
		self._snap_rotation_axis = "x"
		slot6 = true

		self._snap_rotations_axis_menu.set_checked(slot3, self._snap_rotations_axis_menu, "TB_SNAPROTATE_X")

		slot6 = true

		self._toolbar.set_tool_state(slot3, self._toolbar, "TB_SNAPROTATE_X")
	end

	return 
end
function CoreEditor:on_move_transform_type_in()
	slot4 = true

	self._move_transform_type_in.set_visible(slot2, self._move_transform_type_in)

	return 
end
function CoreEditor:on_rotate_transform_type_in()
	slot4 = true

	self._rotate_transform_type_in.set_visible(slot2, self._rotate_transform_type_in)

	return 
end
function CoreEditor:on_camera_transform_type_in()
	slot4 = true

	self._camera_transform_type_in.set_visible(slot2, self._camera_transform_type_in)

	return 
end
function CoreEditor:build_ref_coordinate_system()
	slot7 = "CB_DROPDOWN,CB_READONLY"
	self._ref_coordinate_system = EWS.ComboBox(slot2, EWS, self._toolbar, "", "")
	slot8 = "toggle_coordinate_system"
	slot4 = "Reference Coordinate System (" .. self.ctrl_binding("", self) .. ")"

	self._ref_coordinate_system.set_tool_tip(slot2, self._ref_coordinate_system)

	slot3 = self._coordinate_systems

	for _, coor in ipairs(slot2) do
		slot9 = coor

		self._ref_coordinate_system.append(slot7, self._ref_coordinate_system)

		slot15 = "set_combobox_value"
		slot12 = {
			value = "_coordinate_system",
			combobox = self._ref_coordinate_system,
			menu = self._coordinate_menu
		}

		Global.frame.connect(slot7, Global.frame, coor, "EVT_COMMAND_MENU_SELECTED", callback(slot12, self, self))
	end

	slot4 = self._coordinate_system

	self._ref_coordinate_system.set_value(slot2, self._ref_coordinate_system)

	slot3 = self._ref_coordinate_system
	slot8 = 0

	self._ref_coordinate_system.set_size(slot2, Vector3(slot5, 60, -1))

	slot4 = self._ref_coordinate_system

	self._toolbar.add_control(slot2, self._toolbar)

	slot9 = "change_combo_box"
	slot6 = {
		value = "_coordinate_system",
		combobox = self._ref_coordinate_system,
		menu = self._coordinate_menu
	}

	self._ref_coordinate_system.connect(slot2, self._ref_coordinate_system, "EVT_COMMAND_COMBOBOX_SELECTED", callback(60, self, self))

	slot7 = {
		value = "_coordinate_system",
		t = "_coordinate_systems",
		combobox = self._ref_coordinate_system,
		menu = self._coordinate_menu
	}
	self._ews_triggers.toggle_coordinate_system = callback(self._ref_coordinate_system, self, self, "change_combo_box_trg")

	return 
end
function CoreEditor:build_grid_sizes(icons_path)
	slot6 = "change_grid_size"
	local tip = "Grid Sizes (" .. self.ctrl_binding(slot4, self) .. ")"
	slot9 = "world_editor\\grid_sizes_10x16.png"
	slot9 = "NO_BORDER"
	local grid_icon = EWS.BitmapButton(")", EWS, self._toolbar, CoreEWS.image_path(slot8), "")
	slot7 = tip

	grid_icon.set_tool_tip(EWS, grid_icon)

	slot7 = grid_icon

	self._toolbar.add_control(EWS, self._toolbar)

	slot10 = "CB_DROPDOWN,CB_READONLY"
	local sizes = EWS.ComboBox(EWS, EWS, self._toolbar, "", "")
	slot7 = self._grid_sizes

	for _, g in pairs(EWS) do
		slot13 = g

		sizes.append(slot11, sizes)

		slot19 = "set_combobox_value"
		slot16 = {
			value = "_grid_size",
			combobox = sizes,
			menu = self._grid_sizes_menu,
			choice = g
		}

		Global.frame.connect(slot11, Global.frame, "TB_GRIDSIZE" .. g, "EVT_COMMAND_MENU_SELECTED", callback(slot16, self, self))
	end

	slot8 = self._grid_size

	sizes.set_value(slot6, sizes)

	slot8 = tip

	sizes.set_tool_tip(slot6, sizes)

	slot7 = sizes
	slot12 = 0

	sizes.set_size(slot6, Vector3(slot9, 55, -1))

	slot8 = sizes

	self._toolbar.add_control(slot6, self._toolbar)

	slot13 = "change_combo_box"
	slot10 = {
		prefix = "TB_GRIDSIZE",
		value = "_grid_size",
		combobox = sizes,
		menu = self._grid_sizes_menu
	}

	sizes.connect(slot6, sizes, "EVT_COMMAND_COMBOBOX_SELECTED", callback(55, self, self))

	slot11 = {
		prefix = "TB_GRIDSIZE",
		value = "_grid_size",
		t = "_grid_sizes",
		combobox = sizes,
		menu = self._grid_sizes_menu
	}
	self._ews_triggers.change_grid_size = callback(sizes, self, self, "change_combo_box_trg")

	return 
end
function CoreEditor:build_snap_rotations()
	slot5 = "change_snaprot"
	local tip = "Snap Rotations (" .. self.ctrl_binding(slot3, self) .. ")"
	slot8 = "world_editor\\snap_rotations_10x16.png"
	slot8 = "NO_BORDER"
	local snap_icon = EWS.BitmapButton(")", EWS, self._toolbar, CoreEWS.image_path(slot7), "")
	slot6 = tip

	snap_icon.set_tool_tip(EWS, snap_icon)

	slot6 = snap_icon

	self._toolbar.add_control(EWS, self._toolbar)

	slot9 = "CB_DROPDOWN,CB_READONLY"
	local rotations = EWS.ComboBox(EWS, EWS, self._toolbar, "", "")
	slot6 = self._snap_rotations

	for _, r in pairs(EWS) do
		slot12 = r

		rotations.append(slot10, rotations)

		slot18 = "set_combobox_value"
		slot15 = {
			value = "_snap_rotation",
			combobox = rotations,
			menu = self._snap_rotations_menu,
			choice = r
		}

		Global.frame.connect(slot10, Global.frame, "TB_SNAPROTATION" .. r, "EVT_COMMAND_MENU_SELECTED", callback(slot15, self, self))
	end

	slot7 = self._snap_rotation

	rotations.set_value(slot5, rotations)

	slot7 = tip

	rotations.set_tool_tip(slot5, rotations)

	slot6 = rotations
	slot11 = 0

	rotations.set_size(slot5, Vector3(slot8, 55, -1))

	slot7 = rotations

	self._toolbar.add_control(slot5, self._toolbar)

	slot12 = "change_combo_box"
	slot9 = {
		prefix = "TB_SNAPROTATION",
		value = "_snap_rotation",
		combobox = rotations,
		menu = self._snap_rotations_menu
	}

	rotations.connect(slot5, rotations, "EVT_COMMAND_COMBOBOX_SELECTED", callback(55, self, self))

	slot10 = {
		prefix = "TB_SNAPROTATION",
		value = "_snap_rotation",
		t = "_snap_rotations",
		combobox = rotations,
		menu = self._snap_rotations_menu
	}
	self._ews_triggers.change_snaprot = callback(rotations, self, self, "change_combo_box_trg")

	return 
end
function CoreEditor:build_rotation_speed()
	local tip = "Free rotation speed (+/-)"
	slot8 = "world_editor\\rotation_speed_10x16.png"
	slot8 = "NO_BORDER"
	local speed_icon = EWS.BitmapButton(slot3, EWS, self._toolbar, CoreEWS.image_path(slot7), "")
	slot6 = tip

	speed_icon.set_tool_tip(EWS, speed_icon)

	slot6 = speed_icon

	self._toolbar.add_control(EWS, self._toolbar)

	slot9 = ""
	local rot_speed = EWS.SpinCtrl(EWS, EWS, self._toolbar, self._rotation_speed, "")
	slot7 = tip

	rot_speed.set_tool_tip(EWS, rot_speed)

	slot6 = rot_speed
	slot11 = 0

	rot_speed.set_size(EWS, Vector3("", 50, -1))

	slot12 = "update_rot_speed"

	rot_speed.connect(EWS, rot_speed, "EVT_SCROLL_THUMBTRACK", callback(50, self, self))

	slot12 = "update_rot_speed"
	slot9 = rot_speed

	rot_speed.connect(EWS, rot_speed, "EVT_COMMAND_TEXT_UPDATED", callback(rot_speed, self, self))

	slot10 = {
		value = 1,
		ctrlr = rot_speed
	}
	self._ews_triggers.increase_rotation_speed = callback(rot_speed, self, self, "update_rot_speed_trg")
	slot10 = {
		value = -1,
		ctrlr = rot_speed
	}
	self._ews_triggers.decrease_rotation_speed = callback(rot_speed, self, self, "update_rot_speed_trg")
	slot7 = rot_speed

	self._toolbar.add_control(callback(rot_speed, self, self, "update_rot_speed_trg"), self._toolbar)

	return 
end
function CoreEditor:update_rot_speed(rotation_speed)
	slot4 = rotation_speed
	self._rotation_speed = rotation_speed.get_value(slot3)

	return 
end
function CoreEditor:update_rot_speed_trg(data)
	slot7 = data.ctrlr
	slot5 = data.ctrlr.get_value(slot6) + data.value

	data.ctrlr.set_value(slot3, data.ctrlr)

	slot4 = data.ctrlr
	self._rotation_speed = data.ctrlr.get_value(slot3)

	return 
end
function CoreEditor:change_combo_box(data)
	slot4 = self[data.value]

	if tonumber(slot3) then
		slot7 = data.combobox
		self[data.value] = tonumber(data.combobox.get_value(slot6))
	else
		slot5 = data.combobox
		self[data.value] = data.combobox.get_value(slot4)
	end

	if data.menu then
		slot4 = data.combobox
		local id = data.combobox.get_value(slot3)

		if data.prefix then
			id = data.prefix .. id
		end

		slot7 = true

		data.menu.set_checked(slot4, data.menu, id)
	end

	return 
end
function CoreEditor:change_combo_box_trg(data)
	local next_i = nil

	for i = 1, #self[data.t], 1 do
		if self[data.value] == self[data.t][i] then
			if ctrl() then
				if i == 1 then
					next_i = #self[data.t]
				else
					next_i = 1
				end
			elseif shift() then
				if i == 1 then
					next_i = #self[data.t]
				else
					next_i = i - 1
				end
			elseif i == #self[data.t] then
				next_i = 1
			else
				next_i = i + 1
			end
		end
	end

	slot6 = self[data.t][next_i]

	data.combobox.set_value(slot4, data.combobox)

	slot6 = data

	self.change_combo_box(slot4, self)

	return 
end
function CoreEditor:set_combobox_value(data, event)
	if data.choice then
		slot6 = data.choice

		data.combobox.set_value(slot4, data.combobox)
	else
		slot5 = data.combobox
		slot8 = event

		data.combobox.set_value(slot4, event.get_id(slot7))
	end

	slot6 = data

	self.change_combo_box(slot4, self)

	return 
end
function CoreEditor:on_select_by_name()
	slot5 = "SelectByName"

	self.show_dialog(slot2, self, "select_by_name")

	return 
end
function CoreEditor:on_unit_tree_browser()
	slot5 = "UnitTreeBrowser"

	self.show_dialog(slot2, self, "unit_tree_browser")

	return 
end
function CoreEditor:on_global_select_unit()
	slot5 = "GlobalSelectUnit"

	self.show_dialog(slot2, self, "global_select_unit")

	return 
end
function CoreEditor:on_unit_list()
	if not self._unit_list then
		slot3 = UnitList
		self._unit_list = UnitList.new(slot2)
	else
		slot4 = true

		self._unit_list.set_visible(slot2, self._unit_list)
	end

	return 
end
function CoreEditor:on_unhide_by_name()
	slot5 = "UnhideByName"

	self.show_dialog(slot2, self, "unhide_by_name")

	return 
end
function CoreEditor:on_hide_by_name()
	slot5 = "HideByName"

	self.show_dialog(slot2, self, "hide_by_name")

	return 
end
function CoreEditor:build_widgets_icons(panel, sizer, icons_path)
	slot10 = ""
	local select = EWSRadioBitmapButton.new(slot5, EWSRadioBitmapButton, panel, icons_path .. "widget_select_checked.bmp", "")
	slot8 = icons_path .. "widget_select.bmp"

	select.set_off_bmp(EWSRadioBitmapButton, select)

	slot8 = true

	select.set_value(EWSRadioBitmapButton, select)

	slot7 = select
	slot8 = "Select Unit (1)"

	select.button(EWSRadioBitmapButton).set_tool_tip(EWSRadioBitmapButton, select.button(EWSRadioBitmapButton))

	slot10 = select
	slot11 = "EXPAND,LEFT"

	sizer.add(EWSRadioBitmapButton, sizer, select.button("widget_select.bmp"), 0, 5)

	slot11 = ""
	local move = EWSRadioBitmapButton.new(EWSRadioBitmapButton, EWSRadioBitmapButton, panel, icons_path .. "widget_move_checked.bmp", "")
	slot9 = icons_path .. "widget_move.bmp"

	move.set_off_bmp(EWSRadioBitmapButton, move)

	slot9 = false

	move.set_value(EWSRadioBitmapButton, move)

	slot8 = move
	slot9 = "Select and Move (2)"

	move.button(EWSRadioBitmapButton).set_tool_tip(EWSRadioBitmapButton, move.button(EWSRadioBitmapButton))

	slot11 = move
	slot12 = "EXPAND,LEFT"

	sizer.add(EWSRadioBitmapButton, sizer, move.button("widget_move.bmp"), 0, 5)

	slot12 = ""
	local rotate = EWSRadioBitmapButton.new(EWSRadioBitmapButton, EWSRadioBitmapButton, panel, icons_path .. "widget_rotation_checked.bmp", "")
	slot10 = icons_path .. "widget_rotation.bmp"

	rotate.set_off_bmp(EWSRadioBitmapButton, rotate)

	slot10 = false

	rotate.set_value(EWSRadioBitmapButton, rotate)

	slot9 = rotate
	slot10 = "Select and Rotate (3)"

	rotate.button(EWSRadioBitmapButton).set_tool_tip(EWSRadioBitmapButton, rotate.button(EWSRadioBitmapButton))

	slot12 = rotate
	slot13 = "EXPAND,LEFT"

	sizer.add(EWSRadioBitmapButton, sizer, rotate.button("widget_rotation.bmp"), 0, 5)

	return 
end

return 
