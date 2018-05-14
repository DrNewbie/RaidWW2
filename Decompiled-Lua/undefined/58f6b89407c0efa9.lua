slot3 = "CoreShapeManager"

core.import(slot1, core)

if not NavigationStitcherUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

NavigationStitcherUnitElement = slot0
function NavigationStitcherUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot6 = 0
	self._timeline_color = Vector3(slot3, 1, 1)
	slot4 = Draw
	self._brush = Draw.brush(slot3)
	self._hed.trigger_times = 1
	self._hed.spacing = 100
	self._hed.width = 500
	self._hed.depth = 500
	self._hed.height = 500
	self._hed.use_shape_element_ids = nil
	slot5 = "spacing"

	table.insert(nil, self._save_values)

	slot5 = "width"

	table.insert(nil, self._save_values)

	slot5 = "depth"

	table.insert(nil, self._save_values)

	slot5 = "height"

	table.insert(nil, self._save_values)

	slot5 = "spawn_unit_elements"

	table.insert(nil, self._save_values)

	slot5 = "use_shape_element_ids"

	table.insert(nil, self._save_values)

	return 
end
function NavigationStitcherUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	if self._hed.use_shape_element_ids then
		slot7 = self._hed.use_shape_element_ids

		for _, id in ipairs(slot6) do
			local unit = all_units[id]
			slot15 = unit

			if self._should_draw_link(slot12, self, selected_unit) then
				slot13 = unit
				slot13 = unit.mission_element(slot12)
				local r, g, b = unit.mission_element(slot12).get_link_color(slot12)
				slot17 = {
					from_unit = unit,
					to_unit = self._unit,
					r = r,
					g = g,
					b = b
				}

				self._draw_link(slot15, self)
			end
		end
	end

	return 
end
function NavigationStitcherUnitElement:update_editing()
	return 
end
function NavigationStitcherUnitElement:add_element()
	return 
end
function NavigationStitcherUnitElement:remove_links(unit)
	return 
end
function NavigationStitcherUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self
	local shape = self.get_shape(slot6)

	if shape then
		slot14 = 0.3

		shape.draw(slot7, shape, t, dt, 0.2, 0.2, 0.8)
	end

	return 
end
function NavigationStitcherUnitElement:get_shape()
	if not self._shape then
		slot3 = self

		self._create_shapes(slot2)
	end

	return self._shape
end
function NavigationStitcherUnitElement:set_shape_property(params)
	slot6 = self._hed[params.value]

	self._shape.set_property(slot3, self._shape, params.property)

	return 
end
function NavigationStitcherUnitElement:add_triggers(vc)
	return 
end
function NavigationStitcherUnitElement:_set_shape_type()
	slot4 = true

	self._spacing_params.number_ctrlr.set_enabled(slot2, self._spacing_params.number_ctrlr)

	slot4 = true

	self._depth_params.number_ctrlr.set_enabled(slot2, self._depth_params.number_ctrlr)

	slot4 = true

	self._width_params.number_ctrlr.set_enabled(slot2, self._width_params.number_ctrlr)

	slot4 = true

	self._height_params.number_ctrlr.set_enabled(slot2, self._height_params.number_ctrlr)

	slot4 = true

	self._sliders.depth.set_enabled(slot2, self._sliders.depth)

	slot4 = true

	self._sliders.width.set_enabled(slot2, self._sliders.width)

	slot4 = true

	self._sliders.height.set_enabled(slot2, self._sliders.height)

	return 
end
function NavigationStitcherUnitElement:_create_shapes()
	slot4 = {
		width = self._hed.width,
		depth = self._hed.depth,
		height = self._hed.height
	}
	self._shape = CoreShapeManager.ShapeBoxMiddle.new(slot2, CoreShapeManager.ShapeBoxMiddle)
	slot4 = self._unit

	self._shape.set_unit(slot2, self._shape)

	return 
end
function NavigationStitcherUnitElement:_recreate_shapes()
	self._shape = nil
	slot3 = self

	self._create_shapes(slot2)

	return 
end
function NavigationStitcherUnitElement:set_element_data(params, ...)
	slot5 = params

	NavigationStitcherUnitElement.super.set_element_data(slot3, self, ...)

	return 
end
function NavigationStitcherUnitElement:_build_panel(panel, panel_sizer, disable_params)
	slot6 = self

	self._create_panel(slot5)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = self

	self._create_shapes(slot5)

	local spacing, spacing_params = self._build_value_number(slot5, self, panel, panel_sizer, "spacing", {
		floats = 0,
		min = 0
	})
	slot9 = "spacing[cm]:"

	spacing_params.name_ctrlr.set_label(panel, spacing_params.name_ctrlr)

	self._spacing_params = spacing_params
	slot14 = "set_shape_property"

	spacing.connect(panel, spacing, "EVT_COMMAND_TEXT_ENTER", callback("Set the spacing between navlinks", self, self))

	slot14 = "set_shape_property"
	slot11 = {
		value = "spacing",
		property = "spacing"
	}

	spacing.connect(panel, spacing, "EVT_KILL_FOCUS", callback({
		value = "spacing",
		property = "spacing"
	}, self, self))

	local width, width_params = self._build_value_number(panel, self, panel, panel_sizer, "width", {
		floats = 0,
		min = 0
	})
	slot11 = "Width[cm]:"

	width_params.name_ctrlr.set_label(panel, width_params.name_ctrlr)

	self._width_params = width_params
	slot16 = "set_shape_property"

	width.connect(panel, width, "EVT_COMMAND_TEXT_ENTER", callback("Set the width for the shape", self, self))

	slot16 = "set_shape_property"
	slot13 = {
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
	slot13 = "Depth[cm]:"

	depth_params.name_ctrlr.set_label(panel, depth_params.name_ctrlr)

	self._depth_params = depth_params
	slot18 = "set_shape_property"

	depth.connect(panel, depth, "EVT_COMMAND_TEXT_ENTER", callback("Set the depth for the shape", self, self))

	slot18 = "set_shape_property"
	slot15 = {
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
	slot15 = "Height[cm]:"

	height_params.name_ctrlr.set_label(panel, height_params.name_ctrlr)

	self._height_params = height_params
	slot20 = "set_shape_property"

	height.connect(panel, height, "EVT_COMMAND_TEXT_ENTER", callback("Set the height for the shape", self, self))

	slot20 = "set_shape_property"
	slot17 = {
		value = "height",
		property = "height"
	}

	height.connect(panel, height, "EVT_KILL_FOCUS", callback({
		value = "height",
		property = "height"
	}, self, self))

	slot19 = "Width scale:"

	self.scale_slider(panel, self, panel, panel_sizer, width_params, "width")

	slot19 = "Depth scale:"

	self.scale_slider(panel, self, panel, panel_sizer, depth_params, "depth")

	slot19 = "Height scale:"

	self.scale_slider(panel, self, panel, panel_sizer, height_params, "height")

	slot14 = self

	self._set_shape_type(panel)

	return 
end
function NavigationStitcherUnitElement:scale_slider(panel, sizer, number_ctrlr_params, value, name)
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
function NavigationStitcherUnitElement:set_size(params)
	slot5 = params.ctrlr
	local value = (self._hed[params.value] * params.ctrlr.get_value(slot4)) / 100
	slot7 = value

	self._shape.set_property(slot4, self._shape, params.value)

	slot6 = value

	CoreEWS.change_entered_number(slot4, params.number_ctrlr_params)

	return 
end
function NavigationStitcherUnitElement:size_release(params)
	self._hed[params.value] = params.number_ctrlr_params.value
	slot5 = 100

	params.ctrlr.set_value(params.value, params.ctrlr)

	return 
end
function NavigationStitcherUnitElement:clone_data(...)
	slot3 = self

	NavigationStitcherUnitElement.super.clone_data(slot2, ...)

	slot3 = self

	self._recreate_shapes(slot2)

	return 
end

return 
