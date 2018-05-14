slot3 = "CorePortalManager"

core.module(slot1, core)

slot3 = "CoreShapeManager"

core.import(slot1, core)

PortalManager = PortalManager or class()
slot3 = World
PortalManager.EFFECT_MANAGER = World.effect_manager(slot2)
function PortalManager:init()
	self._portal_shapes = {}
	self._all_units = {}
	self._all_effects = {}
	self._unit_groups = {}
	self._check_positions = {}
	self._hide_list = {}
	slot5 = "unit_deactivated"
	self._deactivate_funtion = callback(slot2, self, self)

	return 
end
function PortalManager:clear()
	slot3 = self._portal_shapes

	for _, portal in ipairs(slot2) do
		slot8 = portal

		portal.show_all(slot7)
	end

	self._portal_shapes = {}
	self._all_units = {}
	self._unit_groups = {}
	self._hide_list = {}

	return 
end
function PortalManager:pseudo_reset()
	slot6 = "Statics"
	slot5 = managers.editor.layer(slot4, managers.editor)

	for _, unit in ipairs(managers.editor.layer(slot4, managers.editor).created_units(slot4)) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			unit.unit_data(slot7)._visibility_counter = 0
		end
	end

	slot3 = self._unit_groups

	for _, group in pairs(slot2) do
		group._is_inside = false
		slot11 = "Statics"
		slot10 = managers.editor.layer(slot9, managers.editor)

		for _, unit in ipairs(managers.editor.layer(slot9, managers.editor).created_units(slot9)) do
			slot14 = unit

			if group._ids[unit.unit_data(slot13).unit_id] then
				slot13 = unit

				if alive(slot12) then
					slot14 = true

					unit.set_visible(slot12, unit)

					slot13 = unit
					unit.unit_data(slot12)._visibility_counter = 0
				end
			end
		end
	end

	return 
end
function PortalManager:add_portal(polygon_tbl, min, max)
	slot8 = #polygon_tbl

	cat_print(slot5, "portal", "add_portal")

	if 0 < #polygon_tbl then
		slot6 = self._portal_shapes
		slot12 = max

		table.insert(slot5, PortalShape.new(slot8, PortalShape, polygon_tbl, min))
	end

	return 
end
function PortalManager:add_unit(unit, ...)
	slot4 = unit

	if unit.unit_data(slot3).ignore_portal then
		return 
	end

	local added = nil
	slot5 = self._unit_groups

	for _, group in pairs(slot4) do
		slot11 = unit

		if not group.add_unit(slot9, group, ...) then
		end
	end

	if added then
		return 
	end

	slot5 = self._portal_shapes

	for _, portal in ipairs(slot4) do
		slot11 = unit
		local added, amount = portal.add_unit(slot9, portal, ...)

		if added then
			slot13 = unit
			slot15 = unit
			self._all_units[unit.key(slot12)] = (self._all_units[unit.key(slot14)] or 0) + amount
			slot12 = unit
			local inverse = unit.unit_data(unit.key(slot12)).portal_visible_inverse
			local i = 0
			slot14 = portal

			if not portal.is_inside(slot13) then
				if inverse then
					i = 1
				else
					i = -1
				end
			end

			slot17 = inverse

			self.change_visibility(slot13, self, unit, i)
		end
	end

	return 
end
function PortalManager:remove_dynamic_unit(unit)
	slot5 = unit

	self.remove_unit(slot3, self)

	slot4 = unit
	slot7 = unit

	if not unit.body(slot3, unit.orientation_object(slot6)) then
		slot5 = 0
		local check_body = unit.body(slot3, unit)
	end

	slot5 = check_body

	if alive(slot4) then
		slot6 = "dynamic_portal"

		check_body.set_activate_tag(slot4, check_body)

		slot6 = "dynamic_portal"

		check_body.set_deactivate_tag(slot4, check_body)
	end

	slot6 = self._deactivate_funtion

	unit.add_body_activation_callback(slot4, unit)

	return 
end
function PortalManager:unit_deactivated(tag, unit, body, activated)
	if not activated then
		slot12 = activated

		cat_print(slot6, "portal", "should add unit here", tag, unit, body)

		slot8 = unit

		self.add_unit(slot6, self)

		slot8 = self._deactivate_funtion

		unit.remove_body_activation_callback(slot6, unit)
	end

	return 
end
function PortalManager:remove_unit(unit)
	slot6 = unit
	slot9 = unit

	cat_print(slot3, "portal", "remove_unit", unit.visible(slot8))

	slot5 = unit
	self._all_units[unit.key("portal")] = nil
	slot4 = self._portal_shapes

	for _, portal in ipairs(unit.key("portal")) do
		slot10 = unit

		portal.remove_unit(slot8, portal)
	end

	slot5 = true

	unit.set_visible(slot3, unit)

	return 
end
function PortalManager:delete_unit(unit)
	slot4 = self._unit_groups

	for name, group in pairs(slot3) do
		slot10 = unit

		group.remove_unit_id(slot8, group)
	end

	return 
end
function PortalManager:change_visibility(unit, i, inverse)
	slot7 = unit
	slot9 = unit
	self._all_units[unit.key(slot6)] = self._all_units[unit.key(slot8)] + i
	slot7 = unit

	if self._all_units[unit.key(self._all_units[unit.key(slot8)] + i)] == 0 then
		slot7 = inverse ~= false

		unit.set_visible(slot5, unit)
	else
		slot6 = unit

		if not unit.visible(slot5) ~= inverse then
			slot7 = inverse ~= true

			unit.set_visible(slot5, unit)
		end
	end

	return 
end
function PortalManager:add_effect(effect)
	slot5 = effect
	effect.id = self.EFFECT_MANAGER.spawn(slot3, self.EFFECT_MANAGER)
	self._all_effects[effect] = 0
	slot4 = self._portal_shapes

	for _, portal in ipairs(0) do
		slot10 = effect
		local added, amount = portal.add_effect(slot8, portal)

		if added then
			self._all_effects[effect] = self._all_effects[effect] + amount
		end
	end

	return 
end
function PortalManager:change_effect_visibility(effect, i)
	self._all_effects[effect] = self._all_effects[effect] + i

	if self._all_effects[effect] == 0 then
		effect.hidden = true
		slot7 = true

		self.EFFECT_MANAGER.set_frozen(slot4, self.EFFECT_MANAGER, effect.id)

		slot7 = true

		self.EFFECT_MANAGER.set_hidden(slot4, self.EFFECT_MANAGER, effect.id)
	elseif effect.hidden then
		effect.hidden = false
		slot7 = false

		self.EFFECT_MANAGER.set_frozen(slot4, self.EFFECT_MANAGER, effect.id)

		slot7 = false

		self.EFFECT_MANAGER.set_hidden(slot4, self.EFFECT_MANAGER, effect.id)
	end

	return 
end
function PortalManager:restart_effects()
	slot3 = self._portal_shapes

	for _, portal in ipairs(slot2) do
		slot8 = portal

		portal.clear_effects(slot7)
	end

	local restart = {}
	slot4 = self._all_effects

	for e, n in pairs(slot3) do
		restart[e] = n
	end

	self._all_effects = {}
	slot4 = restart

	for effect, _ in pairs(slot3) do
		if effect.id then
			slot10 = effect.id

			self.EFFECT_MANAGER.kill(slot8, self.EFFECT_MANAGER)
		end

		slot10 = effect

		self.add_effect(slot8, self)
	end

	restart = nil

	return 
end
function PortalManager:kill_all_effects()
	slot3 = self._portal_shapes

	for _, portal in ipairs(slot2) do
		slot8 = portal

		portal.clear_effects(slot7)
	end

	slot3 = self._all_effects

	for effect, _ in pairs(slot2) do
		if effect.id then
			slot9 = effect.id

			self.EFFECT_MANAGER.kill(slot7, self.EFFECT_MANAGER)
		end
	end

	self._all_effects = {}

	return 
end
function PortalManager:render()
	slot3 = self._portal_shapes

	for _, portal in ipairs(slot2) do
		slot11 = TimerManager
		slot9 = TimerManager.wall(slot10).time(slot10)
		slot12 = TimerManager
		slot12 = TimerManager.wall(TimerManager.wall(slot10))

		portal.update(slot7, portal, TimerManager.wall(TimerManager.wall(slot10)).delta_time(TimerManager.wall(slot10)))
	end

	slot3 = self._unit_groups

	for _, group in pairs(slot2) do
		slot11 = TimerManager
		slot9 = TimerManager.wall(slot10).time(slot10)
		slot12 = TimerManager
		slot12 = TimerManager.wall(TimerManager.wall(slot10))

		group.update(slot7, group, TimerManager.wall(TimerManager.wall(slot10)).delta_time(TimerManager.wall(slot10)))
	end

	slot3 = self._hide_list
	local unit_id, unit = next(slot2)
	slot5 = unit

	if alive(slot4) then
		slot6 = false

		unit.set_visible(slot4, unit)

		self._hide_list[unit_id] = nil
	end

	slot5 = self._check_positions

	while table.remove(slot4) do
	end

	return 
end
function PortalManager:add_to_hide_list(unit)
	slot5 = unit
	self._hide_list[unit.key(slot4)] = unit

	return 
end
function PortalManager:remove_from_hide_list(unit)
	slot5 = unit
	self._hide_list[unit.key(slot4)] = nil

	return 
end
function PortalManager:debug_draw_border(polygon, min, max)
	local step = 500
	local time = 10
	slot8 = polygon
	local tbl = polygon.to_table(slot7)

	for x = 2, #tbl, 1 do
		local length = 0

		while length < time do
			if min and max then
				slot16 = max
				local start = Vector3(slot13, tbl[x - 1].x, tbl[x - 1].y)
				slot17 = max
				local stop = Vector3(tbl[x - 1].x, tbl[x].x, tbl[x].y)
				slot18 = min
				local stop_vertical = Vector3(tbl[x].x, tbl[x - 1].x, tbl[x - 1].y)
				slot22 = 0

				Application.draw_line(tbl[x - 1].x, Application, start, stop, 1, 0)

				slot22 = 0

				Application.draw_line(tbl[x - 1].x, Application, start, stop_vertical, 0, 1)
			else
				slot16 = step * length
				local start = Vector3(slot13, tbl[x - 1].x, tbl[x - 1].y)
				slot17 = step * length
				local stop = Vector3(tbl[x - 1].x, tbl[x].x, tbl[x].y)
				slot18 = step * (length + 1)
				local stop_vertical = Vector3(tbl[x].x, tbl[x - 1].x, tbl[x - 1].y)
				slot22 = 0

				Application.draw_line(tbl[x - 1].x, Application, start, stop, 1, 0)

				slot22 = 0

				Application.draw_line(tbl[x - 1].x, Application, start, stop_vertical, 0, 1)
			end

			length = length + 1
		end
	end

	return 
end
function PortalManager:unit_groups()
	return self._unit_groups
end
function PortalManager:unit_group_on_shape(in_shape)
	slot4 = self._unit_groups

	for _, group in pairs(slot3) do
		slot11 = group

		for _, shape in ipairs(group.shapes(slot10)) do
			if shape == in_shape then
				return group
			end
		end
	end

	return 
end
function PortalManager:rename_unit_group(name, new_name)
	if self._unit_groups[new_name] then
		return false
	end

	local group = self._unit_groups[name]
	self._unit_groups[name] = nil
	self._unit_groups[new_name] = group
	slot7 = new_name

	group.rename(nil, group)

	return true
end
function PortalManager:unit_group(name)
	return self._unit_groups[name]
end
function PortalManager:add_unit_group(name)
	slot5 = name
	local group = PortalUnitGroup.new(slot3, PortalUnitGroup)
	self._unit_groups[name] = group

	return group
end
function PortalManager:remove_unit_group(name)
	self._unit_groups[name] = nil

	return 
end
function PortalManager:clear_unit_groups()
	self._unit_groups = {}

	return 
end
function PortalManager:group_name()
	local name = "group"
	local i = 1

	while self._unit_groups[name .. i] do
		i = i + 1
	end

	return name .. i
end
function PortalManager:check_positions()
	if 0 < #self._check_positions then
		return self._check_positions
	end

	slot5 = managers.viewport

	for _, vp in ipairs(managers.viewport.all_really_active_viewports(slot4)) do
		local camera = vp.camera(slot7)
		slot9 = camera

		if alive(vp) then
			slot10 = "World"

			if vp.is_rendering_scene(slot8, vp) then
				slot9 = self._check_positions
				slot12 = camera

				table.insert(slot8, camera.position(slot11))
			end
		end
	end

	return self._check_positions
end
function PortalManager:unit_in_any_unit_group(unit)
	slot4 = self._unit_groups

	for name, group in pairs(slot3) do
		slot10 = unit

		if group.unit_in_group(slot8, group) then
			return true
		end
	end

	return false
end
function PortalManager:save(t)
	local t = t or ""
	local s = ""
	slot6 = self._unit_groups

	for name, group in pairs(slot5) do
		s = s .. t .. "\t<unit_group name=\"" .. name .. "\">\n"
		slot13 = group

		for _, shape in ipairs(group.shapes(name)) do
			slot18 = t .. "\t\t"
			s = s .. shape.save(slot16, shape) .. "\n"
		end

		s = s .. t .. "\t</unit_group>\n"
	end

	return s
end
function PortalManager:save_level_data()
	local t = {}
	slot4 = self._unit_groups

	for name, group in pairs(slot3) do
		local shapes = {}
		slot12 = group

		for _, shape in ipairs(group.shapes(slot11)) do
			slot15 = shapes
			slot18 = shape

			table.insert(slot14, shape.save_level_data(slot17))
		end

		t[name] = {
			shapes = shapes
		}
		slot11 = group
		t[name].ids = group.ids(slot10)
	end

	return t
end
PortalShape = PortalShape or class()
function PortalShape:init(polygon_tbl, min, max)
	slot6 = polygon_tbl
	self._polygon = ScriptPolygon2D(slot5)
	self._units = {}
	self._inverse_units = {}
	self._effects = {}
	self._is_inside = true
	self._min = min
	self._max = max

	return 
end
function PortalShape:add_unit(unit)
	slot4 = self
	slot7 = unit

	if self.inside(slot3, unit.position(slot6)) then
		slot5 = unit
		self._units[unit.key(unit)] = unit
		local inverse = unit.unit_data(unit.key(unit)).portal_visible_inverse

		if inverse then
			slot6 = false

			unit.set_visible(slot4, unit)
		end

		return true, (inverse and -1) or 1, self
	end

	return 
end
function PortalShape:remove_unit(unit)
	slot5 = unit
	self._units[unit.key(slot4)] = nil

	return 
end
function PortalShape:add_effect(effect)
	slot5 = effect.position

	if self.inside(slot3, self) then
		slot5 = effect

		table.insert(slot3, self._effects)

		return true, 1
	end

	return 
end
function PortalShape:clear_effects()
	self._effects = {}

	return 
end
function PortalShape:show_all()
	slot3 = self._units

	for _, unit in pairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = true

			unit.set_visible(slot7, unit)
		end
	end

	return 
end
function PortalShape:inside(pos)
	slot5 = pos
	local is_inside = self._polygon.inside(slot3, self._polygon)

	if is_inside and self._min and self._max then
		local z = pos.z

		if self._min < z and z < self._max then
			return true
		else
			return false
		end
	end

	return is_inside
end
function PortalShape:is_inside()
	return self._is_inside
end
function PortalShape:update(time, rel_time)
	local is_inside = false
	slot8 = managers.portal

	for _, pos in ipairs(managers.portal.check_positions(slot7)) do
		slot12 = pos
		is_inside = self.inside(slot10, self)

		if is_inside then
			break
		end
	end

	if self._is_inside ~= is_inside then
		self._is_inside = is_inside
		slot6 = self._units

		for _, unit in pairs(slot5) do
			slot12 = unit

			self._change_visibility(slot10, self)
		end

		slot6 = self._effects

		for _, effect in ipairs(slot5) do
			local i = (self._is_inside and 1) or -1
			slot14 = i

			managers.portal.change_effect_visibility(slot11, managers.portal, effect)
		end
	end

	return 
end
function PortalShape:_change_visibility(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit
		local inverse = unit.unit_data(slot3).portal_visible_inverse
		local i = (self._is_inside ~= inverse and 1) or -1
		slot9 = inverse

		managers.portal.change_visibility(slot5, managers.portal, unit, i)
	end

	return 
end
PortalUnitGroup = PortalUnitGroup or class()
function PortalUnitGroup:init(name)
	self._name = name
	self._shapes = {}
	self._ids = {}
	slot4 = 0.5
	self._r = 0.5 + math.rand(slot3)
	slot4 = 0.5
	self._g = 0.5 + math.rand(slot3)
	slot4 = 0.5
	self._b = 0.5 + math.rand(slot3)
	self._units = {}
	self._is_inside = false

	return 
end
function PortalUnitGroup:rename(new_name)
	self._name = new_name

	return 
end
function PortalUnitGroup:name()
	return self._name
end
function PortalUnitGroup:shapes()
	return self._shapes
end
function PortalUnitGroup:ids()
	return self._ids
end
function PortalUnitGroup:set_ids(ids, world_definition)
	self._ids = ids or self._ids
	self._world_definition = world_definition

	return 
end
function PortalUnitGroup:add_shape(params)
	slot5 = params
	local shape = PortalUnitGroupShape.new(slot3, PortalUnitGroupShape)
	slot6 = shape

	table.insert(PortalUnitGroupShape, self._shapes)

	return shape
end
function PortalUnitGroup:remove_shape(shape)
	slot4 = shape

	shape.destroy(slot3)

	slot5 = shape

	table.delete(slot3, self._shapes)

	return 
end
function PortalUnitGroup:add_unit(unit, world_definition, original_id)
	if world_definition and self._world_definition ~= world_definition then
		return 
	end

	slot4 = self._ids

	if not original_id then
		slot7 = unit
		slot5 = unit.unit_data(slot6).unit_id
	end

	if slot4[slot5] then
		slot7 = unit
		unit.unit_data(slot5)._visibility_counter = unit.unit_data(unit)._visibility_counter or 0
		slot8 = (self._is_inside and 1) or 0

		self._change_visibility(unit.unit_data(unit)._visibility_counter or 0, self, unit)

		slot7 = unit

		table.insert(unit.unit_data(unit)._visibility_counter or 0, self._units)

		return true
	end

	return false
end
function PortalUnitGroup:add_unit_id(unit)
	slot5 = unit

	if self._ids[unit.unit_data(slot4).unit_id] then
		slot5 = unit

		self.remove_unit_id(slot3, self)

		return 
	end

	slot5 = unit
	self._ids[unit.unit_data(slot4).unit_id] = true

	return 
end
function PortalUnitGroup:remove_unit_id(unit)
	slot5 = unit
	self._ids[unit.unit_data(slot4).unit_id] = nil

	return 
end
function PortalUnitGroup:lock_units()
	slot3 = self._units

	for slot4, slot5 in ipairs(slot2) do
	end

	return 
end
function PortalUnitGroup:inside(pos)
	slot4 = self._shapes

	for _, shape in ipairs(slot3) do
		slot10 = pos

		if shape.is_inside(slot8, shape) then
			return true
		end
	end

	return false
end
function PortalUnitGroup:update(t, dt)
	local is_inside = false
	slot8 = managers.portal

	for _, pos in ipairs(managers.portal.check_positions(slot7)) do
		slot12 = pos
		is_inside = self.inside(slot10, self)

		if is_inside then
			break
		end
	end

	if self._is_inside ~= is_inside then
		self._is_inside = is_inside
		local diff = (self._is_inside and 1) or -1
		slot8 = diff

		self._change_units_visibility(slot6, self)
	end

	return 
end
function PortalUnitGroup:_change_units_visibility(diff)
	slot4 = self._units

	for _, unit in pairs(slot3) do
		slot11 = diff

		self._change_visibility(slot8, self, unit)
	end

	return 
end
function PortalUnitGroup:_change_units_visibility_in_editor(diff)
	slot7 = "Statics"
	slot6 = managers.editor.layer(slot5, managers.editor)

	for _, unit in ipairs(managers.editor.layer(slot5, managers.editor).created_units(slot5)) do
		slot10 = unit

		if self._ids[unit.unit_data(slot9).unit_id] then
			slot11 = diff

			self._change_visibility(slot8, self, unit)
		end
	end

	return 
end
function PortalUnitGroup:_change_visibility(unit, diff)
	slot5 = unit

	if alive(slot4) then
		slot6 = unit
		unit.unit_data(slot4)._visibility_counter = unit.unit_data(unit)._visibility_counter + diff
		slot5 = unit

		if 0 < unit.unit_data(unit.unit_data(unit)._visibility_counter + diff)._visibility_counter then
			slot6 = true

			unit.set_visible(slot4, unit)

			slot6 = unit

			managers.portal.remove_from_hide_list(slot4, managers.portal)
		else
			slot6 = unit

			managers.portal.add_to_hide_list(slot4, managers.portal)
		end
	end

	return 
end
function PortalUnitGroup:unit_in_group(unit)
	slot5 = unit

	return (self._ids[unit.unit_data(slot4).unit_id] and true) or false
end
function PortalUnitGroup:draw(t, dt, mul, skip_shapes, skip_units)
	local r = self._r * mul
	local g = self._g * mul
	local b = self._b * mul
	local brush = Draw.brush(slot10)
	slot12 = brush
	slot18 = b

	brush.set_color(Draw, Color(slot14, 0.25, r, g))

	if not skip_units then
		slot15 = "Statics"
		slot14 = managers.editor.layer(slot13, managers.editor)

		for _, unit in ipairs(managers.editor.layer(slot13, managers.editor).created_units(slot13)) do
			slot18 = unit

			if self._ids[unit.unit_data(slot17).unit_id] then
				slot18 = unit

				brush.unit(slot16, brush)

				slot21 = b

				Application.draw(slot16, Application, unit, r, g)
			end
		end
	end

	if not skip_shapes then
		slot12 = self._shapes

		for _, shape in ipairs(slot11) do
			slot22 = b

			shape.draw(slot16, shape, t, dt, r, g)

			slot22 = b / 2

			shape.draw_outline(slot16, shape, t, dt, r / 2, g / 2)
		end
	end

	return 
end

if not PortalUnitGroupShape then
	slot2 = CoreShapeManager.ShapeBox
	slot0 = class(slot1)
end

PortalUnitGroupShape = slot0
function PortalUnitGroupShape:init(params)
	params.type = "box"
	slot5 = params

	PortalUnitGroupShape.super.init(slot3, self)

	return 
end
function PortalUnitGroupShape:draw(t, dt, r, g, b)
	slot13 = b

	PortalUnitGroupShape.super.draw(slot7, self, t, dt, r, g)

	slot8 = self._unit

	if alive(slot7) then
		slot12 = b

		Application.draw(slot7, Application, self._unit, r, g)
	end

	return 
end

return 
