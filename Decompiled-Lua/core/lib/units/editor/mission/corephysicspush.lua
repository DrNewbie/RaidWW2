if not CorePhysicsPushUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CorePhysicsPushUnitElement = slot0

if not PhysicsPushUnitElement then
	slot2 = CorePhysicsPushUnitElement
	slot0 = class(slot1)
end

PhysicsPushUnitElement = slot0
function PhysicsPushUnitElement:init(...)
	slot3 = self

	CorePhysicsPushUnitElement.init(slot2, ...)

	return 
end
function CorePhysicsPushUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.physicspush_range = 1000
	self._hed.physicspush_velocity = 100
	self._hed.physicspush_mass = 100
	slot5 = "physicspush_range"

	table.insert(100, self._save_values)

	slot5 = "physicspush_velocity"

	table.insert(100, self._save_values)

	slot5 = "physicspush_mass"

	table.insert(100, self._save_values)

	return 
end
function CorePhysicsPushUnitElement:update_selected()
	slot6 = self._unit
	slot8 = 0

	Application.draw_sphere(slot2, Application, self._unit.position(slot5), self._hed.physicspush_range, 0, 1)

	return 
end
function CorePhysicsPushUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "Range"
	local range_sizer = EWS.StaticBoxSizer(slot4, EWS, panel, "VERTICAL")
	slot12 = "SL_LABELS"
	local range = EWS.Slider(EWS, EWS, panel, self._hed.physicspush_range, 1, 10000, "")
	slot11 = "EXPAND"

	range_sizer.add(EWS, range_sizer, range, 0, 0)

	slot13 = "set_element_data"

	range.connect(EWS, range, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "physicspush_range",
		ctrlr = range
	}

	range.connect(EWS, range, "EVT_SCROLL_THUMBTRACK", callback({
		value = "physicspush_range",
		ctrlr = range
	}, self, self))

	slot10 = "Velocity"
	local velocity_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot14 = "SL_LABELS"
	local velocity = EWS.Slider(EWS, EWS, panel, self._hed.physicspush_velocity, 1, 5000, "")
	slot13 = "EXPAND"

	velocity_sizer.add(EWS, velocity_sizer, velocity, 0, 0)

	slot15 = "set_element_data"

	velocity.connect(EWS, velocity, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot15 = "set_element_data"
	slot12 = {
		value = "physicspush_velocity",
		ctrlr = velocity
	}

	velocity.connect(EWS, velocity, "EVT_SCROLL_THUMBTRACK", callback({
		value = "physicspush_velocity",
		ctrlr = velocity
	}, self, self))

	slot12 = "Mass"
	local mass_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot16 = "SL_LABELS"
	local mass = EWS.Slider(EWS, EWS, panel, self._hed.physicspush_mass, 1, 5000, "")
	slot15 = "EXPAND"

	mass_sizer.add(EWS, mass_sizer, mass, 0, 0)

	slot17 = "set_element_data"

	mass.connect(EWS, mass, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot17 = "set_element_data"
	slot14 = {
		value = "physicspush_mass",
		ctrlr = mass
	}

	mass.connect(EWS, mass, "EVT_SCROLL_THUMBTRACK", callback({
		value = "physicspush_mass",
		ctrlr = mass
	}, self, self))

	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, range_sizer, 0, 0)

	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, velocity_sizer, 0, 0)

	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, mass_sizer, 0, 0)

	return 
end
function CorePhysicsPushUnitElement:add_to_mission_package()
	slot4 = {
		name = "core/physic_effects/hubelement_push",
		category = "physic_effects",
		continent = self._unit.unit_data(slot6).continent
	}
	slot7 = self._unit

	managers.editor.add_to_world_package(slot2, managers.editor)

	return 
end

return 
