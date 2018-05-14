slot3 = "CoreEnvironmentAreaManager"

core.module(slot1, core)

slot3 = "CoreShapeManager"

core.import(slot1, core)

slot3 = "CoreEnvironmentFeeder"

core.import(slot1, core)

EnvironmentAreaManager = EnvironmentAreaManager or class()
EnvironmentAreaManager.POSITION_OFFSET = 50
function EnvironmentAreaManager:init()
	self._areas = {}
	self._blocks = 0
	slot4 = 0.1

	self.set_default_transition_time(slot2, self)

	slot4 = {
		0,
		0,
		1,
		1
	}

	self.set_default_bezier_curve(slot2, self)

	local default_filter_list = {}
	slot6 = managers.viewport

	for name, data_path_key_list in pairs(managers.viewport.get_predefined_environment_filter_map(slot5)) do
		slot9 = data_path_key_list

		for _, data_path_key in ipairs(slot8) do
			slot15 = data_path_key

			table.insert(slot13, default_filter_list)
		end
	end

	self._default_filter_list = default_filter_list

	return 
end
function EnvironmentAreaManager:set_default_transition_time(time)
	self._default_transition_time = time

	return 
end
function EnvironmentAreaManager:default_transition_time()
	return self._default_transition_time
end
function EnvironmentAreaManager:set_default_bezier_curve(bezier_curve)
	self._default_bezier_curve = bezier_curve

	return 
end
function EnvironmentAreaManager:default_bezier_curve()
	return self._default_bezier_curve
end
function EnvironmentAreaManager:default_filter_list()
	if self._default_filter_list then
		slot3 = self._default_filter_list

		return table.list_copy(slot2)
	else
		return nil
	end

	return 
end
function EnvironmentAreaManager:default_prio()
	return 100
end
function EnvironmentAreaManager:areas()
	return self._areas
end
function EnvironmentAreaManager:get_area_by_name(name)
	slot4 = self._areas

	for _, area in ipairs(slot3) do
		slot9 = area

		if area.name(slot8) == name then
			return area
		end
	end

	return 
end
function EnvironmentAreaManager:add_area(area_params, world_id)
	slot6 = area_params
	local area = EnvironmentArea.new(slot4, EnvironmentArea)
	area._world_id = world_id
	slot7 = area

	table.insert(EnvironmentArea, self._areas)

	slot6 = self

	self.prio_order_areas(EnvironmentArea)

	return area
end
function EnvironmentAreaManager:prio_order_areas()
	function slot4(a, b)
		slot4 = a
		slot7 = b

		return a.is_higher_prio(slot3, b.prio(slot6))
	end

	table.sort(slot2, self._areas)

	return 
end
function EnvironmentAreaManager:remove_area(area)
	slot6 = managers.viewport

	for _, vp in ipairs(managers.viewport.viewports(slot5)) do
		slot10 = area

		vp.on_environment_area_removed(slot8, vp)
	end

	slot5 = area

	table.delete(slot3, self._areas)

	return 
end
function EnvironmentAreaManager:remove_all_areas()
	while 0 < #self._areas do
		slot4 = self._areas[1]

		self.remove_area(slot2, self)
	end

	return 
end
function EnvironmentAreaManager:remove_all_areas_for_world(world_id)
	for i = #self._areas, 1, -1 do
		if self._areas[i]._world_id == world_id then
			slot9 = self._areas[i]

			self.remove_area(slot7, self)
		end
	end

	return 
end
function EnvironmentAreaManager:update(t, dt)
	local vps = managers.viewport.all_really_active_viewports(slot4)
	slot6 = vps

	for _, vp in ipairs(managers.viewport) do
		if 0 < self._blocks then
			return 
		end

		slot13 = self.POSITION_OFFSET

		vp.update_environment_area(slot10, vp, self._areas)
	end

	return 
end
function EnvironmentAreaManager:environment_at_position(pos)
	local environment = managers.viewport.default_environment(slot3)
	slot5 = self._areas

	for _, area in ipairs(managers.viewport) do
		slot11 = pos

		if area.is_inside(slot9, area) then
			slot10 = area
			environment = area.environment(slot9)

			break
		end
	end

	return environment
end
function EnvironmentAreaManager:add_block()
	self._blocks = self._blocks + 1

	return 
end
function EnvironmentAreaManager:remove_block()
	self._blocks = self._blocks - 1

	return 
end

if not EnvironmentArea then
	slot2 = CoreShapeManager.ShapeBox
	slot0 = class(slot1)
end

EnvironmentArea = slot0
function EnvironmentArea:init(params)
	params.type = "box"
	slot5 = params

	EnvironmentArea.super.init(slot3, self)

	self._properties.name = params.name
	slot2 = self._properties

	if not params.environment then
		slot5 = managers.viewport
		slot3 = managers.viewport.game_default_environment(slot4)
	end

	slot2.environment = slot3
	self._properties.permanent = params.permanent or false
	slot2 = self._properties

	if not params.transition_time then
		slot5 = managers.environment_area
		slot3 = managers.environment_area.default_transition_time(slot4)
	end

	slot2.transition_time = slot3
	slot2 = self._properties

	if not params.bezier_curve then
		slot5 = managers.environment_area
		slot3 = managers.environment_area.default_bezier_curve(slot4)
	end

	slot2.bezier_curve = slot3
	slot5 = managers.environment_area
	self._properties.filter_list = managers.environment_area.default_filter_list(slot4)
	slot2 = self._properties

	if not params.prio then
		slot5 = managers.environment_area
		slot3 = managers.environment_area.default_prio(slot4)
	end

	slot2.prio = slot3
	slot4 = self

	self._generate_id(slot3)

	return 
end
function EnvironmentArea:name()
	return self._properties.name
end
function EnvironmentArea:_generate_id()
	local filter_list_id = ""

	if self._properties.filter_list then
		slot4 = self._properties.filter_list

		for _, data_path_key in pairs(slot3) do
			filter_list_id = filter_list_id .. "," .. data_path_key
		end
	end

	slot4 = self._properties.environment .. filter_list_id
	self._id = self._properties.environment .. filter_list_id.key(filter_list_id)

	return 
end
function EnvironmentArea:save_level_data()
	slot3 = self
	local unit = self.unit(slot2)

	if unit then
		slot5 = self._unit
		self._properties.name = self._unit.unit_data(slot4).name_id
	end

	slot4 = self

	return EnvironmentArea.super.save_level_data(slot3)
end
function EnvironmentArea:set_unit(unit)
	slot5 = unit

	EnvironmentArea.super.set_unit(slot3, self)

	if unit and self._properties.name then
		return self._properties.name
	else
		return nil
	end

	return 
end
function EnvironmentArea:id()
	return self._id
end
function EnvironmentArea:environment()
	slot4 = "environment"

	return self.property(slot2, self)
end
function EnvironmentArea:set_environment(environment)
	slot6 = environment

	self.set_property_string(slot3, self, "environment")

	slot4 = self

	self._generate_id(slot3)

	return 
end
function EnvironmentArea:permanent()
	slot4 = "permanent"

	return self.property(slot2, self)
end
function EnvironmentArea:set_permanent(permanent)
	self._properties.permanent = permanent

	return 
end
function EnvironmentArea:transition_time()
	slot4 = "transition_time"

	return self.property(slot2, self)
end
function EnvironmentArea:set_transition_time(time)
	self._properties.transition_time = time

	return 
end
function EnvironmentArea:bezier_curve()
	slot4 = "bezier_curve"

	return self.property(slot2, self)
end
function EnvironmentArea:set_bezier_curve(bezier_curve)
	self._properties.bezier_curve = bezier_curve

	return 
end
function EnvironmentArea:filter_list()
	slot4 = "filter_list"

	return self.property(slot2, self)
end
function EnvironmentArea:set_filter_list(filter_list)
	self._properties.filter_list = filter_list
	slot4 = self

	self._generate_id(slot3)

	return 
end
function EnvironmentArea:prio()
	slot4 = "prio"

	return self.property(slot2, self)
end
function EnvironmentArea:set_prio(prio)
	if self._properties.prio ~= prio then
		self._properties.prio = prio
		slot4 = managers.environment_area

		managers.environment_area.prio_order_areas(slot3)
	end

	return 
end
function EnvironmentArea:is_higher_prio(min_prio)
	if min_prio then
		return self._properties.prio < min_prio
	else
		return true
	end

	return 
end

return 
