slot3 = "CoreEditorWidgets"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

Widget = Widget or CoreClass.class()
function Widget:init(layer, name)
	self._layer = layer
	slot8 = "core/units/" .. name .. "/" .. name
	slot6 = Idstring(slot7)
	self._widget = World.spawn_unit(slot4, World, Vector3())
	slot6 = false

	self._widget.set_enabled(slot4, self._widget)

	self._use = false
	slot7 = "red"
	self._x_pen = Draw.pen(slot4, Draw, "no_z")
	slot7 = "green"
	self._y_pen = Draw.pen(slot4, Draw, "no_z")
	slot7 = "blue"
	self._z_pen = Draw.pen(slot4, Draw, "no_z")
	slot7 = "yellow"
	self._yellow_pen = Draw.pen(slot4, Draw, "no_z")

	return 
end
function Widget:widget()
	return self._widget
end
function Widget:set_enabled(enabled)
	slot5 = self._use and enabled

	self._widget.set_enabled(slot3, self._widget)

	return 
end
function Widget:set_use(use)
	self._use = use

	return 
end
function Widget:enabled()
	slot3 = self._widget

	return self._widget.enabled(slot2)
end
function Widget:set_position(pos)
	slot5 = pos

	self._widget.set_position(slot3, self._widget)

	return 
end
function Widget:set_rotation(rot)
	slot5 = rot

	self._widget.set_rotation(slot3, self._widget)

	return 
end
function Widget:update()
	return 
end
function Widget:calculate()
	return 
end
function Widget:reset_values()
	return 
end

if not MoveWidget then
	slot2 = Widget
	slot0 = CoreClass.class(slot1)
end

MoveWidget = slot0
function MoveWidget:init(layer)
	slot6 = "move_widget"

	MoveWidget.super.init(slot3, self, layer)

	self._draw_axis = {}
	self._move_widget_axis = {}
	self._move_widget_offset = Vector3()
	slot5 = false

	self._widget.set_visible(slot3, self._widget)

	return 
end
function MoveWidget:reset_values()
	self._move_widget_axis = {}
	self._draw_axis = {}
	self._move_widget_offset = Vector3()

	return 
end
function MoveWidget:update(t, dt)
	local u_pos = self._widget.position(slot4)
	local u_rot = self._widget.rotation(self._widget)
	slot11 = u_rot
	slot10 = 0.25

	self._x_pen.arrow(self._widget, self._x_pen, u_pos + u_rot.x(slot9) * 10, u_pos + u_rot.x(u_rot) * 100)

	slot11 = u_rot
	slot10 = 0.25

	self._y_pen.arrow(self._widget, self._y_pen, u_pos + u_rot.y(u_pos + u_rot.x(u_rot) * 100) * 10, u_pos + u_rot.y(u_rot) * 100)

	slot10 = 0.25

	self._z_pen.arrow(self._widget, self._z_pen, u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, u_pos + u_rot.z(u_rot) * 100)

	local ps = 40
	local pr = 1
	slot14 = u_rot
	slot15 = 1

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.z(u_rot) * ps, u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps, pr, 0, 0)

	slot14 = u_rot
	slot15 = 0

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.y(u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps) * ps, u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps, pr, 0, 1)

	slot14 = u_rot
	slot15 = 1

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.z(u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps) * ps, u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps, pr, 0, 0)

	slot14 = u_rot
	slot15 = 0

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.x(u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps) * ps, u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps, pr, 1, 0)

	slot14 = u_rot
	slot15 = 0

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.y(u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps) * ps, u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps, pr, 0, 1)

	slot14 = u_rot
	slot15 = 0

	Application.draw_cylinder(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10, Application, u_pos + u_rot.x(u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps) * ps, u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps, pr, 1, 0)

	slot9 = self._draw_axis
	local draw_axis = CoreTable.clone(u_pos + u_rot.z(u_pos + u_rot.y(u_rot) * 100) * 10)

	if #draw_axis == 0 then
		slot11 = 0
		local from = managers.editor.get_cursor_look_point(slot9, managers.editor)
		slot12 = 100000
		local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
		slot19 = self._widget
		local ray = World.raycast(managers.editor, World, "ray", from, to, "ray_type", "widget", "target_unit")

		if ray and ray.body then
			slot13 = ray.body
			local axis = ray.body.name(slot12).s(slot12)
			slot15 = axis

			table.insert(ray.body.name(slot12), draw_axis)

			if axis == "xy" or axis == "xz" then
				slot15 = "x"

				table.insert(slot13, draw_axis)
			end

			if axis == "xy" or axis == "yz" then
				slot15 = "y"

				table.insert(slot13, draw_axis)
			end

			if axis == "xz" or axis == "yz" then
				slot15 = "z"

				table.insert(slot13, draw_axis)
			end
		end
	end

	slot10 = draw_axis

	for _, axis in ipairs(slot9) do
		if axis == "xy" then
			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.y(slot17) * ps, u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps)

			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.x(u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps) * ps, u_pos + (u_rot.y(u_rot) + u_rot.x(u_rot)) * ps)
		elseif axis == "xz" then
			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.z(slot17) * ps, u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps)

			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.x(u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps) * ps, u_pos + (u_rot.z(u_rot) + u_rot.x(u_rot)) * ps)
		elseif axis == "yz" then
			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.z(slot17) * ps, u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps)

			slot20 = u_rot
			slot18 = pr

			self._yellow_pen.cylinder(slot14, self._yellow_pen, u_pos + u_rot.y(u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps) * ps, u_pos + (u_rot.z(u_rot) + u_rot.y(u_rot)) * ps)
		else
			slot19 = u_rot
			slot18 = 0.25

			self._yellow_pen.arrow(slot14, self._yellow_pen, u_pos + u_rot[axis](slot17) * 10, u_pos + u_rot[axis](u_rot) * 100)
		end
	end

	return 
end
function MoveWidget:calculate(unit, widget_rot)
	slot7 = widget_rot
	local result_pos = self.calc_move_widget_pos(slot4, self, unit)
	result_pos = result_pos + self._move_widget_offset

	return result_pos
end
function MoveWidget:calc_move_widget_pos(unit, widget_rot)
	local result_pos = Vector3()

	if #self._move_widget_axis == 2 then
		slot7 = 0
		local p1 = managers.editor.get_cursor_look_point(slot5, managers.editor)
		slot8 = 100
		local p2 = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
		local axis1 = widget_rot[self._move_widget_axis[1]](managers.editor)
		local axis2 = widget_rot[self._move_widget_axis[2]](widget_rot)
		slot11 = axis2
		local normal = axis1.cross(widget_rot, axis1)
		slot12 = normal
		local d = self._unit_start_pos.dot(axis1, self._unit_start_pos)
		slot13 = normal

		if p2 - p1.dot(self._unit_start_pos, p2 - p1) ~= 0 then
			slot13 = normal
			slot14 = normal
			local t = (d - p1.dot(slot11, p1)) / p2 - p1.dot(p1, p2 - p1)
			result_pos = (p2 - p1) * t
		end
	else
		local axis1 = self._move_widget_axis[1]
		slot8 = 0
		local from = managers.editor.get_cursor_look_point(slot6, managers.editor)
		local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
		local w_s_pos = self._unit_start_pos + widget_rot[axis1](100) * -100
		slot11 = widget_rot
		local w_e_pos = self._unit_start_pos + widget_rot[axis1](widget_rot) * 100
		slot14 = to
		local mid_line_pos = math.line_intersection(widget_rot, w_s_pos, w_e_pos, from)
		local dot1_v = mid_line_pos - w_s_pos
		local dot2_v = w_e_pos - w_s_pos
		slot14 = dot2_v
		slot15 = dot1_v
		local dot = dot2_v.normalized(from).dot(from, dot2_v.normalized(from))
		slot15 = dot2_v
		local line_pos = w_s_pos + dot2_v.normalized(dot2_v.normalized(from)) * dot
		result_pos = line_pos - self._unit_start_pos
	end

	slot6 = result_pos
	result_pos = result_pos.rotate_with(slot5, widget_rot.inverse(slot8))
	local grid_size = self._layer.grid_size(slot5)
	slot10 = result_pos.x / grid_size
	slot8 = math.round(widget_rot) * grid_size
	result_pos = result_pos.with_x(self._layer, result_pos)
	slot10 = result_pos.y / grid_size
	slot8 = math.round(widget_rot) * grid_size
	result_pos = result_pos.with_y(self._layer, result_pos)
	slot10 = result_pos.z / grid_size
	slot8 = math.round(widget_rot) * grid_size
	result_pos = result_pos.with_z(self._layer, result_pos)
	slot8 = widget_rot
	result_pos = result_pos.rotate_with(self._layer, result_pos)

	return result_pos + self._unit_start_pos
end
function MoveWidget:add_move_widget_axis(axis)
	if axis == "x" then
		slot5 = "x"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "x"

		table.insert(slot3, self._draw_axis)
	elseif axis == "y" then
		slot5 = "y"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "y"

		table.insert(slot3, self._draw_axis)
	elseif axis == "z" then
		slot5 = "z"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "z"

		table.insert(slot3, self._draw_axis)
	elseif axis == "xy" then
		slot5 = "x"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "y"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "x"

		table.insert(slot3, self._draw_axis)

		slot5 = "y"

		table.insert(slot3, self._draw_axis)

		slot5 = "xy"

		table.insert(slot3, self._draw_axis)
	elseif axis == "xz" then
		slot5 = "x"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "z"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "x"

		table.insert(slot3, self._draw_axis)

		slot5 = "z"

		table.insert(slot3, self._draw_axis)

		slot5 = "xz"

		table.insert(slot3, self._draw_axis)
	elseif axis == "yz" then
		slot5 = "y"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "z"

		table.insert(slot3, self._move_widget_axis)

		slot5 = "y"

		table.insert(slot3, self._draw_axis)

		slot5 = "z"

		table.insert(slot3, self._draw_axis)

		slot5 = "yz"

		table.insert(slot3, self._draw_axis)
	end

	return table
end
function MoveWidget:set_move_widget_offset(unit, widget_rot)
	slot5 = unit
	self._unit_start_pos = unit.position(slot4)
	slot8 = widget_rot
	self._move_widget_offset = unit.position(slot4) - self.calc_move_widget_pos(unit, self, unit)

	return 
end

if not RotationWidget then
	slot2 = Widget
	slot0 = CoreClass.class(slot1)
end

RotationWidget = slot0
function RotationWidget:init(layer)
	slot6 = "rotation_widget"

	RotationWidget.super.init(slot3, self, layer)

	self._rotate_widget_axis = nil

	return 
end
function RotationWidget:reset_values()
	self._rotate_widget_axis = nil

	return 
end
function RotationWidget:set_rotate_widget_axis(axis)
	self._rotate_widget_axis = axis

	return 
end
function RotationWidget:set_rotate_widget_start_screen_position(pos)
	self._rotate_widget_start_screen_position = pos

	return 
end
function RotationWidget:set_rotate_widget_unit_rot(rot)
	self._rotate_widget_unit_rot = rot

	return 
end
function RotationWidget:set_world_dir(ray_pos)
	slot4 = self._widget
	self._world_dir = ray_pos - self._widget.position(slot3)

	return 
end
function RotationWidget:update(t, dt)
	local u_pos = self._widget.position(slot4)
	local u_rot = self._widget.rotation(self._widget)
	slot10 = 2.5
	slot13 = u_rot

	self._x_pen.torus(self._widget, self._x_pen, u_pos, 75, u_rot.x(slot12))

	slot10 = 2.5
	slot13 = u_rot

	self._y_pen.torus(self._widget, self._y_pen, u_pos, 75, u_rot.y(slot12))

	slot10 = 2.5
	slot13 = u_rot

	self._z_pen.torus(self._widget, self._z_pen, u_pos, 75, u_rot.z(slot12))

	local axis = self._rotate_widget_axis

	if not axis then
		slot9 = 0
		local from = managers.editor.get_cursor_look_point(slot7, managers.editor)
		slot10 = 100000
		local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
		slot17 = self._widget
		local ray = World.raycast(managers.editor, World, "ray", from, to, "ray_type", "widget", "target_unit")

		if ray and ray.body then
			slot11 = ray.body
			slot11 = ray.body.name(slot10)
			axis = ray.body.name(slot10).s(slot10)
		end
	end

	if axis then
		slot11 = 2.5
		slot14 = u_rot

		self._yellow_pen.torus(slot7, self._yellow_pen, u_pos, 75, u_rot[axis](slot13))
	end

	return 
end
function RotationWidget:calculate(unit, widget_rot, widget_pos, widget_screen_pos)
	slot7 = managers.editor
	slot10 = unit

	managers.editor.world_to_screen(slot6, unit.position(slot9))

	slot7 = self._widget
	local world_click_pos = self._widget.position(slot6) + self._world_dir
	slot9 = managers.editor
	local distance_vector = self._rotate_widget_start_screen_position - managers.editor.cursor_pos(unit.position)
	slot10 = world_click_pos
	local real_click_screen_pos = managers.editor.world_to_screen(unit.position, managers.editor)
	slot11 = real_click_screen_pos.z / 1000
	real_click_screen_pos = real_click_screen_pos.with_z(managers.editor, real_click_screen_pos)
	slot13 = self._widget
	local real_widget_screen_pos = managers.editor.world_to_screen(managers.editor, self._widget.position(slot12))
	slot12 = real_widget_screen_pos.z / 1000
	real_widget_screen_pos = real_widget_screen_pos.with_z(managers.editor, real_widget_screen_pos)
	local real_screen_dir = real_click_screen_pos - real_widget_screen_pos.normalized(managers.editor)
	slot16 = widget_rot
	slot13 = self._widget.position(slot14) + widget_rot[self._rotate_widget_axis](self._widget) * 100
	local real_widget_axis_pos = managers.editor.world_to_screen(real_click_screen_pos - real_widget_screen_pos, managers.editor)
	slot14 = real_widget_axis_pos.z / 1000
	real_widget_axis_pos = real_widget_axis_pos.with_z(managers.editor, real_widget_axis_pos)
	local real_widget_screen_dir = real_widget_axis_pos - real_widget_screen_pos.normalized(managers.editor)
	slot15 = real_widget_screen_dir
	local real_cross_dir = real_screen_dir.cross(real_widget_axis_pos - real_widget_screen_pos, real_screen_dir)
	slot16 = 0
	slot15 = real_cross_dir.with_z(real_screen_dir, real_cross_dir)
	real_cross_dir = real_cross_dir.with_z(real_screen_dir, real_cross_dir).normalized(real_screen_dir)
	slot16 = real_click_screen_pos + real_cross_dir * 3
	local world_to_1 = managers.editor.screen_to_world(real_screen_dir, managers.editor)
	slot17 = real_click_screen_pos + real_cross_dir * -3
	local world_to_2 = managers.editor.screen_to_world(managers.editor, managers.editor)
	slot22 = 0

	Application.draw_line(managers.editor, Application, world_click_pos, world_to_1, 1, 1)

	slot22 = 0

	Application.draw_line(managers.editor, Application, world_click_pos, world_to_2, 1, 1)

	slot20 = distance_vector
	local amount = real_cross_dir.dot(managers.editor, distance_vector.normalized(world_to_2))
	local distance = distance_vector.length(real_cross_dir) * amount * 360
	local snap_rot = self._layer.snap_rotation(distance_vector)
	local rot = math.round(self._layer) * snap_rot
	slot21 = Rotation()[self._rotate_widget_axis](Rotation())
	slot22 = rot
	local result_rot = Rotation(distance / snap_rot, slot21)
	slot22 = managers.editor
	slot27 = result_rot.pitch(result_rot)
	slot30 = result_rot

	managers.editor.set_value_info(slot21, string.format(slot24, "(" .. self._rotate_widget_axis .. ") (%.2f %.2f %.2f)", result_rot.yaw(") (%.2f %.2f %.2f)"), result_rot.roll(result_rot)))

	slot22 = self._layer

	if self._layer.local_rot(slot21) then
		slot24 = self._rotate_widget_unit_rot
		slot23 = rot
		result_rot = Rotation(slot21, self._rotate_widget_unit_rot[self._rotate_widget_axis](self._rotate_widget_axis))
	end

	result_rot = result_rot * self._rotate_widget_unit_rot
	slot25 = unit
	slot24 = result_rot

	Application.draw_rotation(slot21, Application, unit.position(slot24))

	slot23 = widget_screen_pos

	managers.editor.set_value_info_pos(slot21, managers.editor)

	return result_rot
end

return 
