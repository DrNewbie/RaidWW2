slot3 = "CoreShapeManager"

core.import(slot1, core)

if not CoreShapeUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreShapeUnitElement = slot0

if not ShapeUnitElement then
	slot2 = CoreShapeUnitElement
	slot0 = class(slot1)
end

ShapeUnitElement = slot0
function ShapeUnitElement:init(...)
	slot3 = self

	CoreShapeUnitElement.init(slot2, ...)

	return 
end
function CoreShapeUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot6 = 0
	self._timeline_color = Vector3(slot3, 1, 1)
	slot4 = Draw
	self._brush = Draw.brush(slot3)
	self._hed.trigger_times = 0
	self._hed.shape_type = "box"
	self._hed.width = 500
	self._hed.depth = 500
	self._hed.height = 500
	self._hed.radius = 250
	self._hed.grow = 0
	self._hed.unit_ids = nil
	slot5 = "shape_type"

	table.insert(nil, self._save_values)

	slot5 = "width"

	table.insert(nil, self._save_values)

	slot5 = "depth"

	table.insert(nil, self._save_values)

	slot5 = "height"

	table.insert(nil, self._save_values)

	slot5 = "radius"

	table.insert(nil, self._save_values)

	slot5 = "grow"

	table.insert(nil, self._save_values)

	slot5 = "unit_ids"

	table.insert(nil, self._save_values)

	return 
end
function CoreShapeUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self
	local shape = self.get_shape(slot6)

	if shape then
		slot13 = 1

		shape.draw(slot7, shape, t, dt, 1, 1)
	end

	return 
end
function CoreShapeUnitElement:get_shape()
	if not self._shape then
		slot3 = self

		self._create_shapes(slot2)
	end

	return (self._hed.shape_type == "box" and self._shape) or (self._hed.shape_type == "cylinder" and self._cylinder_shape)
end
function CoreShapeUnitElement:set_shape_property(params)
	slot6 = self._hed[params.value]

	self._shape.set_property(slot3, self._shape, params.property)

	slot6 = self._hed[params.value]

	self._cylinder_shape.set_property(slot3, self._cylinder_shape, params.property)

	return 
end
function CoreShapeUnitElement:_set_shape_type()
	local is_box = self._hed.shape_type == "box"
	local is_cylinder = self._hed.shape_type == "cylinder"
	local is_unit = self._hed.shape_type == "unit"
	slot7 = is_box

	self._depth_params.number_ctrlr.set_enabled(slot5, self._depth_params.number_ctrlr)

	slot7 = is_box

	self._width_params.number_ctrlr.set_enabled(slot5, self._width_params.number_ctrlr)

	slot7 = is_box or is_cylinder

	self._height_params.number_ctrlr.set_enabled(slot5, self._height_params.number_ctrlr)

	slot7 = is_cylinder

	self._radius_params.number_ctrlr.set_enabled(slot5, self._radius_params.number_ctrlr)

	slot7 = is_unit

	self._grow_params.number_ctrlr.set_enabled(slot5, self._grow_params.number_ctrlr)

	slot7 = is_box

	self._sliders.depth.set_enabled(slot5, self._sliders.depth)

	slot7 = is_box

	self._sliders.width.set_enabled(slot5, self._sliders.width)

	slot7 = is_box or is_cylinder

	self._sliders.height.set_enabled(slot5, self._sliders.height)

	slot7 = is_cylinder

	self._sliders.radius.set_enabled(slot5, self._sliders.radius)

	slot7 = is_unit

	self._sliders.grow.set_enabled(slot5, self._sliders.grow)

	return 
end
function CoreShapeUnitElement:_create_shapes()
	slot4 = {
		width = self._hed.width,
		depth = self._hed.depth,
		height = self._hed.height
	}
	self._shape = CoreShapeManager.ShapeBoxMiddle.new(slot2, CoreShapeManager.ShapeBoxMiddle)
	slot4 = self._unit

	self._shape.set_unit(slot2, self._shape)

	slot4 = {
		radius = self._hed.radius,
		height = self._hed.height
	}
	self._cylinder_shape = CoreShapeManager.ShapeCylinderMiddle.new(slot2, CoreShapeManager.ShapeCylinderMiddle)
	slot4 = self._unit

	self._cylinder_shape.set_unit(slot2, self._cylinder_shape)

	return 
end
function CoreShapeUnitElement:set_element_data(params, ...)
	slot5 = params

	CoreShapeUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "shape_type" then
		slot4 = self

		self._set_shape_type(slot3)
	end

	return 
end
function CoreShapeUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select shape for area"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "shape_type", {
		"box",
		"cylinder",
		"unit"
	})

	if not self._shape then
		slot5 = self

		self._create_shapes(slot4)
	end

	local width, width_params = self._build_value_number(slot4, self, panel, panel_sizer, "width", {
		floats = 0,
		min = 0
	})
	slot8 = "Width[cm]:"

	width_params.name_ctrlr.set_label(panel, width_params.name_ctrlr)

	self._width_params = width_params
	slot13 = "set_shape_property"

	width.connect(panel, width, "EVT_COMMAND_TEXT_ENTER", callback("Set the width for the shape", self, self))

	slot13 = "set_shape_property"
	slot10 = {
		value = "width",
		property = "width"
	}

	width.connect(panel, width, "EVT_KILL_FOCUS", callback({
		value = "width",
		property = "width"
	}, self, self))

	local depth, depth_params = self._build_value_number(panel, self, panel, panel_sizer, "depth", {
		floats = 0,
		min = 0
	})
	slot10 = "Depth[cm]:"

	depth_params.name_ctrlr.set_label(panel, depth_params.name_ctrlr)

	self._depth_params = depth_params
	slot15 = "set_shape_property"

	depth.connect(panel, depth, "EVT_COMMAND_TEXT_ENTER", callback("Set the depth for the shape", self, self))

	slot15 = "set_shape_property"
	slot12 = {
		value = "depth",
		property = "depth"
	}

	depth.connect(panel, depth, "EVT_KILL_FOCUS", callback({
		value = "depth",
		property = "depth"
	}, self, self))

	local height, height_params = self._build_value_number(panel, self, panel, panel_sizer, "height", {
		floats = 0,
		min = 0
	})
	slot12 = "Height[cm]:"

	height_params.name_ctrlr.set_label(panel, height_params.name_ctrlr)

	self._height_params = height_params
	slot17 = "set_shape_property"

	height.connect(panel, height, "EVT_COMMAND_TEXT_ENTER", callback("Set the height for the shape", self, self))

	slot17 = "set_shape_property"
	slot14 = {
		value = "height",
		property = "height"
	}

	height.connect(panel, height, "EVT_KILL_FOCUS", callback({
		value = "height",
		property = "height"
	}, self, self))

	local radius, radius_params = self._build_value_number(panel, self, panel, panel_sizer, "radius", {
		floats = 0,
		min = 0
	})
	slot14 = "Radius[cm]:"

	radius_params.name_ctrlr.set_label(panel, radius_params.name_ctrlr)

	self._radius_params = radius_params
	slot19 = "set_shape_property"

	radius.connect(panel, radius, "EVT_COMMAND_TEXT_ENTER", callback("Set the radius for the shape", self, self))

	slot19 = "set_shape_property"
	slot16 = {
		value = "radius",
		property = "radius"
	}

	radius.connect(panel, radius, "EVT_KILL_FOCUS", callback({
		value = "radius",
		property = "radius"
	}, self, self))

	slot18 = "Set the grow(cm) for unit OOBB"
	local grow, grow_params = self._build_value_number(panel, self, panel, panel_sizer, "grow", {
		floats = 0,
		min = 0
	})
	slot16 = "Grow[cm]:"

	grow_params.name_ctrlr.set_label(panel, grow_params.name_ctrlr)

	self._grow_params = grow_params
	slot20 = "Width scale:"

	self.scale_slider(panel, self, panel, panel_sizer, width_params, "width")

	slot20 = "Depth scale:"

	self.scale_slider(panel, self, panel, panel_sizer, depth_params, "depth")

	slot20 = "Height scale:"

	self.scale_slider(panel, self, panel, panel_sizer, height_params, "height")

	slot20 = "Radius scale:"

	self.scale_slider(panel, self, panel, panel_sizer, radius_params, "radius")

	slot20 = "Grow OOBB:"

	self.scale_slider(panel, self, panel, panel_sizer, grow_params, "grow")

	slot15 = self

	self._set_shape_type(panel)

	return 
end
function CoreShapeUnitElement:scale_slider(panel, sizer, number_ctrlr_params, value, name)
	slot9 = "HORIZONTAL"
	local slider_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = "ALIGN_LEFT"
	slot13 = "ALIGN_CENTER_VERTICAL"

	slider_sizer.add(EWS, slider_sizer, EWS.StaticText(slot11, EWS, panel, name, ""), 1, 0)

	slot15 = ""
	local slider = EWS.Slider(EWS, EWS, panel, 100, 1, 200, "")
	slot14 = "EXPAND"

	slider_sizer.add(EWS, slider_sizer, slider, 2, 0)

	slot16 = "set_size"

	slider.connect(EWS, slider, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot16 = "set_size"

	slider.connect(EWS, slider, "EVT_SCROLL_THUMBTRACK", callback({
		ctrlr = slider,
		number_ctrlr_params = number_ctrlr_params,
		value = value
	}, self, self))

	slot16 = "size_release"

	slider.connect(EWS, slider, "EVT_SCROLL_CHANGED", callback({
		ctrlr = slider,
		number_ctrlr_params = number_ctrlr_params,
		value = value
	}, self, self))

	slot16 = "size_release"
	slot13 = {
		ctrlr = slider,
		number_ctrlr_params = number_ctrlr_params,
		value = value
	}

	slider.connect(EWS, slider, "EVT_SCROLL_THUMBRELEASE", callback({
		ctrlr = slider,
		number_ctrlr_params = number_ctrlr_params,
		value = value
	}, self, self))

	slot14 = "EXPAND"

	sizer.add(EWS, sizer, slider_sizer, 0, 0)

	self._sliders = self._sliders or {}
	self._sliders[value] = slider

	return 
end
function CoreShapeUnitElement:set_size(params)
	slot5 = params.ctrlr
	local value = (self._hed[params.value] * params.ctrlr.get_value(slot4)) / 100
	slot7 = value

	self._shape.set_property(slot4, self._shape, params.value)

	slot7 = value

	self._cylinder_shape.set_property(slot4, self._cylinder_shape, params.value)

	slot6 = value

	CoreEWS.change_entered_number(slot4, params.number_ctrlr_params)

	return 
end
function CoreShapeUnitElement:size_release(params)
	self._hed[params.value] = params.number_ctrlr_params.value
	slot5 = 100

	params.ctrlr.set_value(params.value, params.ctrlr)

	return 
end
function CoreShapeUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	if self._hed.unit_ids then
		slot7 = self._hed.unit_ids

		for _, id in ipairs(slot6) do
			slot13 = "Statics"
			local unit = managers.editor.layer(slot11, managers.editor).created_units_pairs(slot11)[id]
			slot13 = unit

			if alive(managers.editor.layer(slot11, managers.editor)) then
				slot15 = unit

				if self._should_draw_link(slot12, self, selected_unit) then
					slot14 = {
						g = 0.5,
						b = 0.75,
						r = 0,
						from_unit = unit,
						to_unit = self._unit
					}

					self._draw_link(slot12, self)

					slot17 = 0.75

					Application.draw(slot12, Application, unit, 0, 0.5)
				end
			else
				slot14 = id

				self._remove_unit_id(slot12, self)
			end
		end
	end

	return 
end
function CoreShapeUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		self._hed.unit_ids = self._hed.unit_ids or {}
		local id = ray.unit.unit_data(self._hed.unit_ids or ).unit_id
		slot6 = id

		if table.contains(ray.unit, self._hed.unit_ids) then
			slot6 = id

			self._remove_unit_id(slot4, self)
		else
			slot6 = id

			self._add_unit_id(slot4, self)
		end
	end

	return 
end
function CoreShapeUnitElement:_add_unit_id(id)
	slot5 = id

	table.insert(slot3, self._hed.unit_ids)

	return 
end
function CoreShapeUnitElement:_remove_unit_id(id)
	slot5 = id

	table.delete(slot3, self._hed.unit_ids)

	self._hed.unit_ids = (0 < #self._hed.unit_ids and self._hed.unit_ids) or nil

	return 
end
function CoreShapeUnitElement:update_editing()
	return 
end
function CoreShapeUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

return 
