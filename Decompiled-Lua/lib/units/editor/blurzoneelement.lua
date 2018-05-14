if not BlurZoneUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

BlurZoneUnitElement = slot0
function BlurZoneUnitElement:init(unit)
	slot5 = unit

	BlurZoneUnitElement.super.init(slot3, self)

	self._hed.mode = 0
	self._hed.radius = 200
	self._hed.height = 200
	slot5 = "mode"

	table.insert(200, self._save_values)

	slot5 = "radius"

	table.insert(200, self._save_values)

	slot5 = "height"

	table.insert(200, self._save_values)

	return 
end
function BlurZoneUnitElement:update_selected(t, dt, selected_unit, all_units)
	local brush = Draw.brush(slot6)
	slot8 = brush
	slot14 = 1

	brush.set_color(Draw, Color(slot10, 0.15, 1, 1))

	slot14 = 0.5
	local pen = Draw.pen(Draw, Color(slot10, 0.15, 0.5, 0.5))
	slot13 = self._unit
	slot12 = self._hed.radius

	brush.cylinder(Draw, brush, self._unit.position(0.15), self._unit.position(self._unit) + math.Z * self._hed.height)

	slot13 = self._unit
	slot12 = self._hed.radius

	pen.cylinder(Draw, pen, self._unit.position(self._unit.position(self._unit) + math.Z * self._hed.height), self._unit.position(self._unit) + math.Z * self._hed.height)

	slot12 = self._unit
	slot13 = 2

	brush.half_sphere(Draw, brush, self._unit.position(self._unit.position(self._unit) + math.Z * self._hed.height), self._hed.radius, math.Z)

	slot12 = self._unit
	slot12 = math.Z

	pen.half_sphere(Draw, pen, self._unit.position(self._hed.radius), self._hed.radius)

	slot12 = self._unit
	slot13 = 2

	brush.half_sphere(Draw, brush, self._unit.position(self._hed.radius) + math.Z * self._hed.height, self._hed.radius, -math.Z)

	slot12 = self._unit
	slot12 = -math.Z

	pen.half_sphere(Draw, pen, self._unit.position(self._hed.radius) + math.Z * self._hed.height, self._hed.radius)

	return 
end
function BlurZoneUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local mode_params = {
		name_proportions = 1,
		name = "Mode:",
		ctrlr_proportions = 2,
		tooltip = "Set the mode, 0 is disable, 2 is flash, 1 is normal",
		min = 0,
		floats = 0,
		max = 2,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.mode
	}
	local mode = CoreEWS.number_controller(slot5)
	slot13 = "set_element_data"

	mode.connect(mode_params, mode, "EVT_COMMAND_TEXT_ENTER", callback(slot10, self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "mode",
		ctrlr = mode
	}

	mode.connect(mode_params, mode, "EVT_KILL_FOCUS", callback({
		value = "mode",
		ctrlr = mode
	}, self, self))

	local radius_params = {
		name = "Radius:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the radius",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.radius
	}
	local radius = CoreEWS.number_controller(mode)
	slot15 = "set_element_data"

	radius.connect(radius_params, radius, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot15 = "set_element_data"
	slot12 = {
		value = "radius",
		ctrlr = radius
	}

	radius.connect(radius_params, radius, "EVT_KILL_FOCUS", callback({
		value = "radius",
		ctrlr = radius
	}, self, self))

	local height_params = {
		name = "Height:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the height",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.height
	}
	local height = CoreEWS.number_controller(radius)
	slot17 = "set_element_data"

	height.connect(height_params, height, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot17 = "set_element_data"
	slot14 = {
		value = "height",
		ctrlr = height
	}

	height.connect(height_params, height, "EVT_KILL_FOCUS", callback({
		value = "height",
		ctrlr = height
	}, self, self))

	return 
end

return 
