if not LaserTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

LaserTriggerUnitElement = slot0
LaserTriggerUnitElement.SAVE_UNIT_POSITION = false
LaserTriggerUnitElement.SAVE_UNIT_ROTATION = false
LaserTriggerUnitElement.ON_EXECUTED_ALTERNATIVES = {
	"enter",
	"leave",
	"empty",
	"while_inside"
}
LaserTriggerUnitElement.USES_INSTIGATOR_RULES = true
LaserTriggerUnitElement.CLOSE_DISTANCE = 25
LaserTriggerUnitElement.COLORS = {
	red = {
		1,
		0,
		0
	},
	green = {
		0,
		1,
		0
	},
	blue = {
		0,
		0,
		1
	},
	grey = {
		0.5,
		0.5,
		0.5
	},
	black = {
		0.1,
		0.1,
		0.1
	}
}
function LaserTriggerUnitElement:init(unit)
	slot5 = unit

	LaserTriggerUnitElement.super.init(slot3, self)

	self._dummy_unit_name = Idstring(slot3)
	self._hed.trigger_times = 1
	self._hed.interval = 0.1
	slot5 = managers.mission
	self._hed.instigator = managers.mission.default_area_instigator("units/vanilla/props/props_button/props_button")
	self._hed.color = "red"
	self._hed.visual_only = false
	self._hed.skip_dummies = false
	self._hed.cycle_interval = 0
	self._hed.cycle_random = false
	self._hed.cycle_active_amount = 1
	self._hed.cycle_type = "flow"
	self._hed.flicker_remove = nil
	self._hed.points = {}
	self._hed.connections = {}
	slot5 = "interval"

	table.insert(, self._save_values)

	slot5 = "instigator"

	table.insert(, self._save_values)

	slot5 = "color"

	table.insert(, self._save_values)

	slot5 = "visual_only"

	table.insert(, self._save_values)

	slot5 = "skip_dummies"

	table.insert(, self._save_values)

	slot5 = "cycle_interval"

	table.insert(, self._save_values)

	slot5 = "cycle_random"

	table.insert(, self._save_values)

	slot5 = "cycle_active_amount"

	table.insert(, self._save_values)

	slot5 = "cycle_type"

	table.insert(, self._save_values)

	slot5 = "flicker_remove"

	table.insert(, self._save_values)

	slot5 = "points"

	table.insert(, self._save_values)

	slot5 = "connections"

	table.insert(, self._save_values)

	return 
end
function LaserTriggerUnitElement:update_editing(...)
	slot3 = self
	local ray = self._raycast(slot2)

	if self._moving_point and ray then
		local moving_point = self._hed.points[self._moving_point]
		moving_point.pos = ray.position
		slot6 = math.UP
		moving_point.rot = Rotation(slot4, ray.normal)
	end

	return 
end
function LaserTriggerUnitElement:begin_editing(...)
	slot5 = Vector3()
	self._dummy_unit = World.spawn_unit(slot2, World, self._dummy_unit_name, Rotation())

	return 
end
function LaserTriggerUnitElement:end_editing(...)
	slot3 = self

	LaserTriggerUnitElement.super.end_editing(slot2, ...)

	slot4 = self._dummy_unit

	World.delete_unit(slot2, World)

	slot3 = self

	self._break_creating_connection(slot2)

	slot3 = self

	self._break_moving_point(slot2)

	return 
end
function LaserTriggerUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot11 = all_units

	LaserTriggerUnitElement.super.update_selected(slot6, self, t, dt, selected_unit)

	slot7 = self

	self._draw_selected(slot6)

	return 
end
function LaserTriggerUnitElement:_draw_selected()
	slot3 = self._hed.points

	for _, point in pairs(slot2) do
		slot13 = 0

		self._draw_point(slot7, self, point.pos, point.rot, 0, 0.5)
	end

	slot3 = self._hed.connections

	for i, connection in ipairs(slot2) do
		local s_p = self._hed.points[connection.from]
		local e_p = self._hed.points[connection.to]
		slot10 = self.COLORS[self._hed.color]
		local r, g, b = unpack(slot9)

		if self._selected_connection and self._selected_connection == i then
			slot18 = 1

			Application.draw_line(slot12, Application, s_p.pos, e_p.pos, 1, 1)
		else
			slot18 = b

			Application.draw_line(slot12, Application, s_p.pos, e_p.pos, r, g)
		end
	end

	return 
end
function LaserTriggerUnitElement:_raycast()
	slot4 = 0
	local from = managers.editor.get_cursor_look_point(slot2, managers.editor)
	slot5 = 100000
	local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
	slot8 = nil
	slot12 = "all"
	local ray = World.raycast(managers.editor, World, from, to, managers.slot.get_mask(slot10, managers.slot))

	if ray and ray.position then
		slot8 = ray.position
		local index, point = self._get_close_point(slot5, self, self._hed.points)
		slot8 = self.COLORS[self._hed.color]
		local r, g, b = unpack(self._hed.points)

		if point then
			if self._creating_connection then
				local creating_point = self._hed.points[self._creating_connection]
				slot17 = b * 0.6

				Application.draw_line(slot11, Application, creating_point.pos, point.pos, r * 0.6, g * 0.6)

				slot17 = 0

				self._draw_point(slot11, self, point.pos, point.rot, 0, 1)
			else
				slot16 = 0

				self._draw_point(slot10, self, point.pos, point.rot, 1, 0)
			end
		else
			if self._creating_connection then
				local creating_point = self._hed.points[self._creating_connection]
				slot17 = b * 0.6

				Application.draw_line(slot11, Application, creating_point.pos, ray.position, r * 0.6, g * 0.6)
			end

			slot12 = ray.position
			slot16 = math.UP

			self._draw_point(slot10, self, Rotation(slot14, ray.normal))
		end

		slot12 = ray.position

		self._dummy_unit.set_position(slot10, self._dummy_unit)

		slot11 = self._dummy_unit
		slot15 = math.UP

		self._dummy_unit.set_rotation(slot10, Rotation(slot13, ray.normal))

		return ray
	end

	return nil
end
function LaserTriggerUnitElement:_get_close_point(points, pos)
	slot5 = points

	for i, point in pairs(slot4) do
		slot10 = point.pos - pos

		if point.pos - pos.length(slot9) < self.CLOSE_DISTANCE then
			return i, point
		end
	end

	return nil, nil
end
function LaserTriggerUnitElement:_draw_point(pos, rot, r, g, b)
	r = r or 1
	g = g or 1
	b = b or 1
	local len = 25
	local scale = 0.05
	slot15 = b

	Application.draw_sphere(slot9, Application, pos, 5, r, g)

	slot14 = rot
	slot16 = scale

	Application.draw_arrow(slot9, Application, pos, pos + rot.x(r) * len, 1, 0, 0)

	slot14 = rot
	slot16 = scale

	Application.draw_arrow(slot9, Application, pos, pos + rot.y(1) * len, 0, 1, 0)

	slot14 = rot
	slot16 = scale

	Application.draw_arrow(slot9, Application, pos, pos + rot.z(0) * len, 0, 0, 1)

	return 
end
function LaserTriggerUnitElement:_remove_any_close_point(pos)
	slot6 = pos
	local index, point = self._get_close_point(slot3, self, self._hed.points)

	if index then
		slot7 = index

		self._check_remove_index(slot5, self)

		self._hed.points[index] = nil

		return true
	end

	return false
end
function LaserTriggerUnitElement:_break_creating_connection()
	slot3 = self._dummy_unit

	if alive(slot2) then
		slot4 = true

		self._dummy_unit.set_enabled(slot2, self._dummy_unit)
	end

	self._creating_connection = nil

	return 
end
function LaserTriggerUnitElement:_break_moving_point()
	self._moving_point = nil
	self._moving_point_undo = nil

	return 
end
function LaserTriggerUnitElement:_rmb()
	if self._moving_point then
		self._hed.points[self._moving_point] = self._moving_point_undo
		slot3 = self

		self._break_moving_point(self._moving_point)

		return 
	end

	if self._creating_connection then
		slot3 = self

		self._break_creating_connection(slot2)

		return 
	end

	slot3 = "LaserTriggerUnitElement:_rmb()"

	print(slot2)

	slot3 = self
	local ray = self._raycast(slot2)

	if not ray then
		return 
	end

	local pos = ray.position
	slot6 = math.UP
	local rot = Rotation(slot4, ray.normal)
	slot7 = pos

	if self._remove_any_close_point(ray.normal, self) then
		return 
	end

	slot7 = {
		pos = pos,
		rot = rot
	}

	table.insert(slot5, self._hed.points)

	return 
end
function LaserTriggerUnitElement:_lmb()
	slot3 = "LaserTriggerUnitElement:_lmb()"

	print(slot2)

	if self._moving_point then
		return 
	end

	slot3 = self
	local ray = self._raycast(slot2)

	if not ray then
		return 
	end

	local pos = ray.position
	slot6 = math.UP
	local rot = Rotation(slot4, ray.normal)
	slot8 = pos
	local index, point = self._get_close_point(ray.normal, self, self._hed.points)
	slot9 = index

	print(self._hed.points, "index")

	if not point then
		slot8 = "break starting connection"

		print(slot7)

		slot8 = self

		self._break_creating_connection(slot7)

		return 
	end

	if self._creating_connection then
		if self._creating_connection == index then
			slot8 = "break (same) starting connection"

			print(slot7)
		else
			slot8 = "finish starting connection"

			print(slot7)

			slot10 = index

			if not self._check_remove_connection(slot7, self, self._creating_connection) then
				slot9 = {
					from = self._creating_connection,
					to = index
				}

				table.insert(slot7, self._hed.connections)

				slot8 = self

				self._fill_connections_box(slot7)
			end
		end

		slot8 = self

		self._break_creating_connection(slot7)
	else
		slot8 = "start creating connection"

		print(slot7)

		slot9 = false

		self._dummy_unit.set_enabled(slot7, self._dummy_unit)

		self._creating_connection = index
	end

	return 
end
function LaserTriggerUnitElement:_emb()
	if self._creating_connection then
		return 
	end

	slot3 = "LaserTriggerUnitElement:_emb()"

	print(slot2)

	slot3 = self
	local ray = self._raycast(slot2)

	if not ray then
		return 
	end

	local pos = ray.position
	slot6 = math.UP
	local rot = Rotation(slot4, ray.normal)
	slot8 = pos
	local index, point = self._get_close_point(ray.normal, self, self._hed.points)
	slot9 = index

	print(self._hed.points, "index")

	if not point then
		return 
	end

	slot8 = point
	self._moving_point_undo = clone(slot7)
	self._moving_point = index

	return 
end
function LaserTriggerUnitElement:_release_emb()
	slot3 = "LaserTriggerUnitElement:_release_emb()"

	print(slot2)

	if self._moving_point then
		slot3 = self

		self._break_moving_point(slot2)
	end

	return 
end
function LaserTriggerUnitElement:_check_remove_index(index)
	slot6 = self._hed.connections

	for i, connection in ipairs(clone(slot5)) do
		if connection.from == index or connection.to == index then
			if self._selected_connection and self._selected_connection == i then
				self._selected_connection = nil
			end

			slot10 = i

			table.remove(slot8, self._hed.connections)

			slot9 = self

			self._fill_connections_box(slot8)

			slot10 = index

			self._check_remove_index(slot8, self)

			return 
		end
	end

	return 
end
function LaserTriggerUnitElement:_check_remove_connection(i1, i2)
	slot7 = self._hed.connections

	for i, connection in ipairs(clone(slot6)) do
		if (connection.from == i1 and connection.to == i2) or (connection.from == i2 and connection.to == i1) then
			slot11 = i

			table.remove(slot9, self._hed.connections)

			slot10 = self

			self._fill_connections_box(slot9)

			if self._selected_connection and self._selected_connection == i then
				self._selected_connection = nil
			end

			return true
		end
	end

	return false
end
function LaserTriggerUnitElement:add_triggers(vc)
	slot5 = vc

	LaserTriggerUnitElement.super.add_triggers(slot3, self)

	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "_rmb"

	vc.add_trigger(slot3, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "_emb"

	vc.add_trigger(slot3, vc, callback("emb", self, self))

	slot5 = Idstring(callback)
	slot10 = "_release_emb"

	vc.add_release_trigger(slot3, vc, callback("emb", self, self))

	return 
end
function LaserTriggerUnitElement:_on_clicked_connections_box()
	slot3 = "LaserTriggerUnitElement:_on_clicked_connections_box()"

	print(slot2)

	slot3 = self._connections_box
	local selected_index = self._connections_box.selected_index(slot2)

	if not selected_index then
		self._selected_connection = nil

		return 
	end

	slot7 = selected_index

	print(self._connections_box.get_string(slot5, self._connections_box))

	slot7 = selected_index
	self._selected_connection = tonumber(self._connections_box.get_string(slot5, self._connections_box))

	return 
end
function LaserTriggerUnitElement:_fill_connections_box()
	slot3 = self._connections_box

	self._connections_box.clear(slot2)

	slot3 = self._hed.connections

	for i, connection in ipairs(slot2) do
		slot9 = i

		self._connections_box.append(slot7, self._connections_box)
	end

	return 
end
function LaserTriggerUnitElement:_move_connection_up()
	slot3 = "LaserTriggerUnitElement:_move_connection_up()"

	print(slot2)

	if not self._selected_connection or self._selected_connection == 1 then
		return 
	end

	local selected_index = self._connections_box.selected_index(slot2)
	slot5 = self._selected_connection - 1
	slot9 = self._selected_connection

	table.insert(self._connections_box, self._hed.connections, table.remove(slot7, self._hed.connections))

	slot4 = self

	self._fill_connections_box(self._connections_box)

	slot5 = selected_index - 1

	self._connections_box.select_index(self._connections_box, self._connections_box)

	slot4 = self

	self._on_clicked_connections_box(self._connections_box)

	return 
end
function LaserTriggerUnitElement:_move_connection_down()
	slot3 = "LaserTriggerUnitElement:_move_connection_down()"

	print(slot2)

	if not self._selected_connection or self._selected_connection == #self._hed.connections then
		return 
	end

	local selected_index = self._connections_box.selected_index(slot2)
	slot5 = self._selected_connection + 1
	slot9 = self._selected_connection

	table.insert(self._connections_box, self._hed.connections, table.remove(slot7, self._hed.connections))

	slot4 = self

	self._fill_connections_box(self._connections_box)

	slot5 = selected_index + 1

	self._connections_box.select_index(self._connections_box, self._connections_box)

	slot4 = self

	self._on_clicked_connections_box(self._connections_box)

	return 
end
function LaserTriggerUnitElement:set_element_data(params, ...)
	slot5 = params

	LaserTriggerUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "instigator" and self._hed.instigator == "criminals" then
		slot8 = "ICON_WARNING"
		slot13 = 0

		EWS.message_box(slot3, EWS, Global.frame_panel, "Criminals is deprecated, you should probably use local_criminals. Ask Martin or Ilija why.", "Instigator Warning", Vector3(slot10, -1, -1))
	end

	return 
end
function LaserTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = "Check interval:"

	self._build_value_number(slot4, self, panel, panel_sizer, "interval", {
		floats = 2,
		min = 0.01
	}, "Set the check interval for the laser, in seconds")

	slot10 = "Select an instigator type"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "instigator", managers.mission.area_instigator_categories("Set the check interval for the laser, in seconds"))

	slot10 = "Select a color"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "color", {
		"red",
		"green",
		"blue",
		"grey",
		"black"
	})

	slot8 = "visual_only"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot8 = "skip_dummies"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot9 = "Will flicker the lasers when removed"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "flicker_remove")

	slot10 = "Set the check cycle interval for the laser, in seconds (0 == disabled)"

	self._build_value_number(slot4, self, panel, panel_sizer, "cycle_interval", {
		floats = 2,
		min = 0
	})

	slot10 = "Defines how many are active during cycle"

	self._build_value_number(slot4, self, panel, panel_sizer, "cycle_active_amount", {
		floats = 0,
		min = 1
	})

	slot10 = "Select a cycle type"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "cycle_type", {
		"flow",
		"pop"
	})

	slot8 = "cycle_random"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot6 = "HORIZONTAL"
	local connections_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "LEFT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, connections_sizer, 0, 1)

	slot9 = "TB_FLAT,TB_NODIVIDER,TB_VERTICAL"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot12 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "MOVE_UP", "Move up", CoreEws.image_path(managers.mission))

	slot14 = "_move_connection_up"

	toolbar.connect(EWS, toolbar, "MOVE_UP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot12 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "MOVE_DOWN", "Move down", CoreEws.image_path(nil))

	slot14 = "_move_connection_down"
	slot11 = nil

	toolbar.connect(EWS, toolbar, "MOVE_DOWN", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = toolbar

	toolbar.realize(EWS)

	slot11 = "EXPAND,LEFT,ALIGN_RIGHT"

	connections_sizer.add(EWS, connections_sizer, toolbar, 0, 1)

	slot10 = ""
	local connections_box = EWS.ListBox(EWS, EWS, panel, "laser_trigger_connections")
	slot15 = "_on_clicked_connections_box"
	slot12 = nil

	connections_box.connect(EWS, connections_box, "", "EVT_COMMAND_LISTBOX_SELECTED", callback(self, self, self))

	slot8 = connections_box
	slot13 = 0

	connections_box.set_min_size(EWS, Vector3("EVT_COMMAND_LISTBOX_SELECTED", 50, 140))

	slot12 = "TOP,EXPAND,ALIGN_RIGHT"

	connections_sizer.add(EWS, connections_sizer, connections_box, 0, 4)

	self._connections_box = connections_box
	slot8 = self

	self._fill_connections_box(EWS)

	return 
end
function LaserTriggerUnitElement:add_to_mission_package()
	local unit_name = self._dummy_unit_name
	slot5 = {
		category = "units",
		name = unit_name.s(slot7),
		continent = self._unit.unit_data(slot7).continent
	}
	slot8 = unit_name
	slot8 = self._unit

	managers.editor.add_to_world_package(slot3, managers.editor)

	local sequence_files = {}
	slot6 = sequence_files

	CoreEditorUtils.get_sequence_files_by_unit_name(managers.editor, unit_name)

	slot5 = sequence_files

	for _, file in ipairs(managers.editor) do
		slot11 = {
			init = true,
			category = "script_data",
			name = file.s(slot13) .. ".sequence_manager",
			continent = self._unit.unit_data(".sequence_manager").continent
		}
		slot14 = file
		slot14 = self._unit

		managers.editor.add_to_world_package(slot9, managers.editor)
	end

	return 
end

return 
