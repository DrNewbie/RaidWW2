-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreShapeManager"

core.import(slot1, core)

if not CoreAreaTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreAreaTriggerUnitElement = slot0

if not AreaTriggerUnitElement then
	slot2 = CoreAreaTriggerUnitElement
	slot0 = class(slot1)
end

AreaTriggerUnitElement = slot0
function AreaTriggerUnitElement:init(...)
	slot3 = self

	CoreAreaTriggerUnitElement.init(slot2, ...)

	return 
end
function CoreAreaTriggerUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot6 = 0
	self._timeline_color = Vector3(slot3, 1, 1)
	self._brush = Draw.brush(slot3)
	self._hed.trigger_times = 1
	self._hed.interval = 0.1
	self._hed.trigger_on = "on_enter"
	slot5 = managers.mission
	self._hed.instigator = managers.mission.default_area_instigator(Draw)
	self._hed.shape_type = "box"
	self._hed.width = 500
	self._hed.depth = 500
	self._hed.height = 500
	self._hed.radius = 250
	self._hed.spawn_unit_elements = {}
	self._hed.amount = "1"
	self._hed.use_shape_element_ids = nil
	self._hed.use_disabled_shapes = false
	self._hed.rules_element_ids = nil
	self._hed.unit_ids = nil
	slot5 = "interval"

	table.insert(nil, self._save_values)

	slot5 = "trigger_on"

	table.insert(nil, self._save_values)

	slot5 = "instigator"

	table.insert(nil, self._save_values)

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

	slot5 = "spawn_unit_elements"

	table.insert(nil, self._save_values)

	slot5 = "amount"

	table.insert(nil, self._save_values)

	slot5 = "use_shape_element_ids"

	table.insert(nil, self._save_values)

	slot5 = "use_disabled_shapes"

	table.insert(nil, self._save_values)

	slot5 = "rules_element_ids"

	table.insert(nil, self._save_values)

	slot5 = "unit_ids"

	table.insert(nil, self._save_values)

	return 
end
function CoreAreaTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	slot7 = self._hed.spawn_unit_elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		slot15 = unit

		if self._should_draw_link(slot12, self, selected_unit) then
			slot14 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot12, self)
		end
	end

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

	slot8 = all_units

	self._check_removed_units(slot6, self)

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

	if self._hed.rules_element_ids then
		slot7 = self._hed.rules_element_ids

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
function CoreAreaTriggerUnitElement:_check_removed_units(all_units)
	if self._hed.use_shape_element_ids then
		slot6 = self._hed.use_shape_element_ids

		for _, id in ipairs(clone(slot5)) do
			local unit = all_units[id]
			slot10 = unit

			if not alive(slot9) then
				slot11 = id

				table.delete(slot9, self._hed.use_shape_element_ids)
			end
		end
	end

	if self._hed.rules_element_ids then
		slot6 = self._hed.rules_element_ids

		for _, id in ipairs(clone(slot5)) do
			local unit = all_units[id]
			slot10 = unit

			if not alive(slot9) then
				slot11 = id

				table.delete(slot9, self._hed.rules_element_ids)
			end
		end
	end

	return 
end
function CoreAreaTriggerUnitElement:update_editing()
	return 
end
function CoreAreaTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then

		-- Decompilation error in this vicinity:
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "point_spawn_unit", 1) then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.spawn_unit_elements) then
				slot6 = id

				table.delete(slot4, self._hed.spawn_unit_elements)
			else
				slot6 = id

				table.insert(slot4, self._hed.spawn_unit_elements)
			end
		end

		slot4 = ray.unit
		slot4 = ray.unit.name(slot3)
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "data_instigator_rule", 1) then
			self._hed.rules_element_ids = self._hed.rules_element_ids or {}
			local id = ray.unit.unit_data(self._hed.rules_element_ids or ).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.rules_element_ids) then
				slot6 = id

				table.delete(slot4, self._hed.rules_element_ids)
			else
				slot6 = id

				table.insert(slot4, self._hed.rules_element_ids)
			end

			self._hed.rules_element_ids = (0 < #self._hed.rules_element_ids and self._hed.rules_element_ids) or nil
		end

		return 
	end

	slot5 = {
		ray_type = "body editor",
		mask = 1
	}
	local ray = managers.editor.unit_by_raycast(slot3, managers.editor)

	if ray and ray.unit then
		self._hed.unit_ids = self._hed.unit_ids or {}
		local id = ray.unit.unit_data(self._hed.unit_ids or ).unit_id
		slot7 = id

		if table.contains(ray.unit, self._hed.unit_ids) then
			slot7 = id

			self._remove_unit_id(slot5, self)
		else
			slot7 = id

			self._add_unit_id(slot5, self)
		end
	end

	return 
end
function CoreAreaTriggerUnitElement:_add_unit_id(id)
	slot5 = id

	table.insert(slot3, self._hed.unit_ids)

	if self._instigator_ctrlr then
		slot5 = not self._hed.unit_ids

		self._instigator_ctrlr.set_enabled(slot3, self._instigator_ctrlr)
	end

	return 
end
function CoreAreaTriggerUnitElement:_remove_unit_id(id)
	slot5 = id

	table.delete(slot3, self._hed.unit_ids)

	self._hed.unit_ids = (0 < #self._hed.unit_ids and self._hed.unit_ids) or nil
	slot4 = self._instigator_ctrlr

	if alive(slot3) then
		slot5 = not self._hed.unit_ids

		self._instigator_ctrlr.set_enabled(slot3, self._instigator_ctrlr)
	end

	return 
end
function CoreAreaTriggerUnitElement:remove_links(unit)
	slot4 = self._hed.spawn_unit_elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.spawn_unit_elements)
		end
	end

	return 
end
function CoreAreaTriggerUnitElement:update_selected(t, dt, selected_unit, all_units)
	if not self._hed.use_shape_element_ids then
		slot7 = self
		local shape = self.get_shape(slot6)

		if shape then
			slot13 = 1

			shape.draw(slot7, shape, t, dt, 1, 1)
		end
	else
		slot8 = all_units

		self._check_removed_units(slot6, self)

		slot7 = self._hed.use_shape_element_ids

		for _, id in ipairs(slot6) do
			local unit = all_units[id]
			slot13 = unit
			slot13 = unit.mission_element(slot12)
			local shape = unit.mission_element(slot12).get_shape(slot12)

			if shape then
				slot19 = 0.85

				shape.draw(slot13, shape, t, dt, 0.85, 0.85)
			end
		end
	end

	return 
end
function CoreAreaTriggerUnitElement:get_shape()
	if not self._shape then
		slot3 = self

		self._create_shapes(slot2)
	end

	return (self._hed.shape_type == "box" and self._shape) or (self._hed.shape_type == "cylinder" and self._cylinder_shape)
end
function CoreAreaTriggerUnitElement:set_shape_property(params)
	slot6 = self._hed[params.value]

	self._shape.set_property(slot3, self._shape, params.property)

	slot6 = self._hed[params.value]

	self._cylinder_shape.set_property(slot3, self._cylinder_shape, params.property)

	return 
end
function CoreAreaTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreAreaTriggerUnitElement:_set_shape_type()
	local is_box = self._hed.shape_type == "box"
	local is_cylinder = self._hed.shape_type == "cylinder"
	local uses_external = self._hed.use_shape_element_ids

	if not uses_external then
	else
		is_box = false

		if false then
			is_box = true
		end
	end

	if not uses_external then
	else
		is_cylinder = false

		if false then
			is_cylinder = true
		end
	end

	slot7 = is_box

	self._depth_params.number_ctrlr.set_enabled(slot5, self._depth_params.number_ctrlr)

	slot7 = is_box

	self._width_params.number_ctrlr.set_enabled(slot5, self._width_params.number_ctrlr)

	slot7 = is_box or is_cylinder

	self._height_params.number_ctrlr.set_enabled(slot5, self._height_params.number_ctrlr)

	slot7 = is_cylinder

	self._radius_params.number_ctrlr.set_enabled(slot5, self._radius_params.number_ctrlr)

	slot7 = not uses_external

	self._shape_type_params.ctrlr.set_enabled(slot5, self._shape_type_params.ctrlr)

	slot7 = uses_external

	self._use_disabled_shapes.set_enabled(slot5, self._use_disabled_shapes)

	slot7 = is_box

	self._sliders.depth.set_enabled(slot5, self._sliders.depth)

	slot7 = is_box

	self._sliders.width.set_enabled(slot5, self._sliders.width)

	slot7 = is_box or is_cylinder

	self._sliders.height.set_enabled(slot5, self._sliders.height)

	slot7 = is_cylinder

	self._sliders.radius.set_enabled(slot5, self._sliders.radius)

	return 
end
function CoreAreaTriggerUnitElement:_create_shapes()
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
function CoreAreaTriggerUnitElement:_recreate_shapes()
	self._shape = nil
	self._cylinder_shape = nil
	slot3 = self

	self._create_shapes(slot2)

	return 
end
function CoreAreaTriggerUnitElement:set_element_data(params, ...)
	slot5 = params

	CoreAreaTriggerUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "instigator" and self._hed.instigator == "criminals" then
		slot8 = "ICON_WARNING"
		slot13 = 0

		EWS.message_box(slot3, EWS, Global.frame_panel, "Criminals is deprecated, you should probably use local_criminals. Ask Martin or Ilija why.", "Instigator Warning", Vector3(slot10, -1, -1))
	end

	if params.value == "shape_type" then
		slot4 = self

		self._set_shape_type(slot3)
	end

	return 
end
function CoreAreaTriggerUnitElement:create_values_ctrlrs(panel, panel_sizer, disable)
	slot11 = "Set the check interval for the area, in seconds."

	self._build_value_number(slot5, self, panel, panel_sizer, "interval", {
		floats = 2,
		min = 0.01
	})

	if not disable or not disable.trigger_type then
		slot10 = {
			"on_enter",
			"on_exit",
			"both",
			"on_empty",
			"while_inside"
		}

		self._build_value_combobox(slot5, self, panel, panel_sizer, "trigger_on")
	end

	if not disable or not disable.instigator then
		slot12 = managers.mission
		slot11 = "Select an instigator type for the area"
		local instigator, _ = self._build_value_combobox(slot5, self, panel, panel_sizer, "instigator", managers.mission.area_instigator_categories(slot11))
		self._instigator_ctrlr = instigator
		slot9 = not self._hed.unit_ids

		self._instigator_ctrlr.set_enabled(panel, self._instigator_ctrlr)
	end

	if not disable or not disable.amount then
		slot11 = "Select how many are required to trigger area"

		self._build_value_combobox(slot5, self, panel, panel_sizer, "amount", {
			"1",
			"2",
			"3",
			"4",
			"all"
		})
	end

	slot9 = "use_disabled_shapes"
	self._use_disabled_shapes = self._build_value_checkbox(slot5, self, panel, panel_sizer)

	return 
end
function CoreAreaTriggerUnitElement:_build_panel(panel, panel_sizer, disable_params)
	slot6 = self

	self._create_panel(slot5)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = disable_params

	self.create_values_ctrlrs(slot5, self, panel, panel_sizer)

	slot11 = "Select shape for area"
	local _, shape_type_params = self._build_value_combobox(slot5, self, panel, panel_sizer, "shape_type", {
		"box",
		"cylinder"
	})
	self._shape_type_params = shape_type_params

	if not self._shape then
		slot8 = self

		self._create_shapes(slot7)
	end

	local width, width_params = self._build_value_number(slot7, self, panel, panel_sizer, "width", {
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

	local radius, radius_params = self._build_value_number(panel, self, panel, panel_sizer, "radius", {
		floats = 0,
		min = 0
	})
	slot17 = "Radius[cm]:"

	radius_params.name_ctrlr.set_label(panel, radius_params.name_ctrlr)

	self._radius_params = radius_params
	slot22 = "set_shape_property"

	radius.connect(panel, radius, "EVT_COMMAND_TEXT_ENTER", callback("Set the radius for the shape", self, self))

	slot22 = "set_shape_property"
	slot19 = {
		value = "radius",
		property = "radius"
	}

	radius.connect(panel, radius, "EVT_KILL_FOCUS", callback({
		value = "radius",
		property = "radius"
	}, self, self))

	slot21 = "Width scale:"

	self.scale_slider(panel, self, panel, panel_sizer, width_params, "width")

	slot21 = "Depth scale:"

	self.scale_slider(panel, self, panel, panel_sizer, depth_params, "depth")

	slot21 = "Height scale:"

	self.scale_slider(panel, self, panel, panel_sizer, height_params, "height")

	slot21 = "Radius scale:"

	self.scale_slider(panel, self, panel, panel_sizer, radius_params, "radius")

	slot16 = self

	self._set_shape_type(panel)

	return 
end
function CoreAreaTriggerUnitElement:scale_slider(panel, sizer, number_ctrlr_params, value, name)
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
function CoreAreaTriggerUnitElement:set_size(params)
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
function CoreAreaTriggerUnitElement:size_release(params)
	self._hed[params.value] = params.number_ctrlr_params.value
	slot5 = 100

	params.ctrlr.set_value(params.value, params.ctrlr)

	return 
end
function CoreAreaTriggerUnitElement:clone_data(...)
	slot3 = self

	CoreAreaTriggerUnitElement.super.clone_data(slot2, ...)

	slot3 = self

	self._recreate_shapes(slot2)

	return 
end

if not CoreAreaOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreAreaOperatorUnitElement = slot0
CoreAreaOperatorUnitElement.SAVE_UNIT_POSITION = false
CoreAreaOperatorUnitElement.SAVE_UNIT_ROTATION = false

if not AreaOperatorUnitElement then
	slot2 = CoreAreaOperatorUnitElement
	slot0 = class(slot1)
end

AreaOperatorUnitElement = slot0
function AreaOperatorUnitElement:init(...)
	slot3 = self

	AreaOperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreAreaOperatorUnitElement:init(unit)
	slot5 = unit

	CoreAreaOperatorUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.interval = 0.1
	self._hed.trigger_on = "on_enter"
	slot5 = managers.mission
	self._hed.instigator = managers.mission.default_area_instigator(self)
	self._hed.amount = "1"
	self._hed.use_disabled_shapes = false
	self._hed.operation = "none"
	slot5 = "elements"

	table.insert("none", self._save_values)

	slot5 = "interval"

	table.insert("none", self._save_values)

	slot5 = "use_disabled_shapes"

	table.insert("none", self._save_values)

	slot5 = "operation"

	table.insert("none", self._save_values)

	self._apply_on_checkboxes = {
		"interval",
		"use_disabled_shapes"
	}
	slot4 = self._apply_on_checkboxes

	for _, uses in ipairs("none") do
		self._hed["apply_on_" .. uses] = false
		slot10 = "apply_on_" .. uses

		table.insert("apply_on_" .. uses, self._save_values)
	end

	return 
end
function CoreAreaOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreAreaOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0.25,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreAreaOperatorUnitElement:update_editing()
	return 
end
function CoreAreaOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = ray.unit
		slot4 = ray.unit.name(slot3)

		if ray.unit.name(slot3).s(slot3) == "core/units/mission_elements/trigger_area/trigger_area" then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.elements) then
				slot6 = id

				table.delete(slot4, self._hed.elements)
			else
				slot6 = id

				table.insert(slot4, self._hed.elements)
			end
		end
	end

	return 
end
function CoreAreaOperatorUnitElement:remove_links(unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function CoreAreaOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreAreaOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local exact_names = {
		"core/units/mission_elements/trigger_area/trigger_area"
	}
	slot11 = exact_names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements, nil)

	slot9 = {
		amount = true,
		instigator = true,
		trigger_type = true
	}

	CoreAreaTriggerUnitElement.create_values_ctrlrs(slot5, self, panel, panel_sizer)

	slot12 = "LI_HORIZONTAL"
	slot10 = "EXPAND,TOP,BOTTOM"

	panel_sizer.add(slot5, panel_sizer, EWS.StaticLine(panel_sizer, EWS, panel, ""), 0, 5)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"clear_inside"
	})

	slot6 = self._apply_on_checkboxes

	for _, uses in ipairs(slot5) do
		local name = "apply_on_" .. uses
		slot15 = name

		self._build_value_checkbox(slot11, self, panel, panel_sizer)
	end

	slot7 = "This element can modify trigger_area element. Select areas to modify using insert and clicking on the elements."

	self._add_help_text(slot5, self)

	return 
end

if not CoreAreaReportTriggerUnitElement then
	slot2 = CoreAreaTriggerUnitElement
	slot0 = class(slot1)
end

CoreAreaReportTriggerUnitElement = slot0
CoreAreaReportTriggerUnitElement.ON_EXECUTED_ALTERNATIVES = {
	"enter",
	"leave",
	"empty",
	"while_inside",
	"on_death",
	"rule_failed",
	"reached_amount"
}

if not AreaReportTriggerUnitElement then
	slot2 = CoreAreaReportTriggerUnitElement
	slot0 = class(slot1)
end

AreaReportTriggerUnitElement = slot0
function AreaReportTriggerUnitElement:init(...)
	slot3 = self

	AreaReportTriggerUnitElement.super.init(slot2, ...)

	self._hed.trigger_on = nil

	return 
end
function AreaReportTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot8 = {
		trigger_type = true
	}

	AreaReportTriggerUnitElement.super._build_panel(slot4, self, panel, panel_sizer)

	return 
end

return 
