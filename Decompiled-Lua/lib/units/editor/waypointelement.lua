if not WaypointUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

WaypointUnitElement = slot0
function WaypointUnitElement:init(unit)
	slot5 = unit

	WaypointUnitElement.super.init(slot3, self)

	slot4 = self

	self._add_wp_options(slot3)

	self._icon_options = {
		"map_waypoint_pov_in",
		"map_waypoint_pov_out",
		"waypoint_special_aim",
		"waypoint_special_air_strike",
		"waypoint_special_ammo",
		"waypoint_special_boat",
		"waypoint_special_code_book",
		"waypoint_special_code_device",
		"waypoint_special_crowbar",
		"waypoint_special_cvy_foxhole",
		"waypoint_special_cvy_landimine",
		"waypoint_special_defend",
		"waypoint_special_dog_tags",
		"waypoint_special_door",
		"waypoint_special_downed",
		"waypoint_special_dynamite_stick",
		"waypoint_special_escape",
		"waypoint_special_explosive",
		"waypoint_special_fire",
		"waypoint_special_fix",
		"waypoint_special_general_vip_sit",
		"waypoint_special_gereneral_vip_move",
		"waypoint_special_gold",
		"waypoint_special_health",
		"waypoint_special_key",
		"waypoint_special_kill",
		"waypoint_special_lockpick",
		"waypoint_special_loot",
		"waypoint_special_loot_drop",
		"waypoint_special_parachute",
		"waypoint_special_phone",
		"waypoint_special_portable_radio",
		"waypoint_special_power",
		"waypoint_special_prisoner",
		"waypoint_special_recording_device",
		"waypoint_special_refuel",
		"waypoint_special_refuel_empty",
		"waypoint_special_stash_box",
		"waypoint_special_thermite",
		"waypoint_special_tools",
		"waypoint_special_valve",
		"waypoint_special_vehicle_kugelwagen",
		"waypoint_special_vehicle_truck",
		"waypoint_special_wait",
		"waypoint_special_where",
		"raid_wp_wait",
		"raid_prisoner",
		"pd2_lootdrop",
		"pd2_escape",
		"pd2_talk",
		"pd2_kill",
		"pd2_drill",
		"pd2_generic_look",
		"pd2_phone",
		"pd2_c4",
		"pd2_power",
		"pd2_door",
		"pd2_computer",
		"pd2_wirecutter",
		"pd2_fire",
		"pd2_loot",
		"pd2_methlab",
		"pd2_generic_interact",
		"pd2_goto",
		"pd2_ladder",
		"pd2_fix",
		"pd2_question",
		"pd2_defend",
		"pd2_generic_saw",
		"pd2_chainsaw"
	}
	self._map_display_options = {
		"point",
		"square",
		"circle"
	}
	self._hed.map_display = "point"
	self._hed.color = {
		g = 0.8,
		b = 0.33,
		r = 0.38
	}
	self._hed.width = 100
	self._hed.depth = 100
	self._hed.radius = 150
	self._hed.icon = "pd2_goto"
	self._hed.text_id = "debug_none"
	self._hed.only_in_civilian = false
	slot5 = "icon"

	table.insert(false, self._save_values)

	slot5 = "map_display"

	table.insert(false, self._save_values)

	slot5 = "color"

	table.insert(false, self._save_values)

	slot5 = "width"

	table.insert(false, self._save_values)

	slot5 = "depth"

	table.insert(false, self._save_values)

	slot5 = "radius"

	table.insert(false, self._save_values)

	slot5 = "text_id"

	table.insert(false, self._save_values)

	slot5 = "only_in_civilian"

	table.insert(false, self._save_values)

	return 
end
function WaypointUnitElement:_add_wp_options()
	self._text_options = {
		"debug_none"
	}

	return 
end
function WaypointUnitElement:_set_text()
	slot3 = self._text
	slot7 = self._hed.text_id

	self._text.set_value(slot2, managers.localization.text(slot5, managers.localization))

	return 
end
function WaypointUnitElement:set_element_data(params, ...)
	slot5 = params

	WaypointUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "text_id" then
		slot4 = self

		self._set_text(slot3)
	end

	return 
end
function WaypointUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self
	local shape = self.get_shape(slot6)
	local color = self._hed.color

	if shape then
		slot14 = color.b

		shape.draw(slot8, shape, t, dt, color.r, color.g)
	end

	return 
end
function WaypointUnitElement:get_shape()
	if not self._square_shape then
		slot3 = self

		self._create_shapes(slot2)
	end

	return (self._hed.map_display == "square" and self._square_shape) or (self._hed.map_display == "circle" and self._circle_shape)
end
function WaypointUnitElement:clone_data(...)
	slot3 = self

	WaypointUnitElement.super.clone_data(slot2, ...)

	slot3 = self

	self._recreate_shapes(slot2)

	return 
end
function WaypointUnitElement:_create_shapes()
	slot4 = {
		height = 200,
		width = self._hed.width,
		depth = self._hed.depth
	}
	self._square_shape = CoreShapeManager.ShapeBoxMiddle.new(slot2, CoreShapeManager.ShapeBoxMiddle)
	slot4 = self._unit

	self._square_shape.set_unit(slot2, self._square_shape)

	slot4 = {
		height = 200,
		radius = self._hed.radius
	}
	self._circle_shape = CoreShapeManager.ShapeCylinderMiddle.new(slot2, CoreShapeManager.ShapeCylinderMiddle)
	slot4 = self._unit

	self._circle_shape.set_unit(slot2, self._circle_shape)

	return 
end
function WaypointUnitElement:_recreate_shapes()
	self._square_shape = nil
	self._circle_shape = nil
	slot3 = self

	self._create_shapes(slot2)

	return 
end
function WaypointUnitElement:_set_shape_type()
	local display_type = self._hed.map_display
	slot5 = display_type == "circle" or display_type == "square"

	self._color.control.set_enabled(slot3, self._color.control)

	if display_type == "point" then
		slot5 = true

		self._icon_ctrlr.set_enabled(slot3, self._icon_ctrlr)

		slot4 = self._color.control
		slot9 = self._hed.color.b * 255

		self._color.control.set_background_colour(slot3, Color(slot6, self._hed.color.r * 255, self._hed.color.g * 255))
	else
		slot5 = false

		self._icon_ctrlr.set_enabled(slot3, self._icon_ctrlr)

		slot7 = self._hed.color.b * 255

		self._color.control.set_background_colour(slot3, self._color.control, self._hed.color.r * 255, self._hed.color.g * 255)
	end

	slot5 = display_type == "square"

	self._width_params.number_ctrlr.set_enabled(slot3, self._width_params.number_ctrlr)

	slot5 = display_type == "square"

	self._depth_params.number_ctrlr.set_enabled(slot3, self._depth_params.number_ctrlr)

	slot5 = display_type == "circle"

	self._radius_params.number_ctrlr.set_enabled(slot3, self._radius_params.number_ctrlr)

	slot5 = display_type == "square"

	self._sliders.depth.set_enabled(slot3, self._sliders.depth)

	slot5 = display_type == "square"

	self._sliders.width.set_enabled(slot3, self._sliders.width)

	slot5 = display_type == "circle"

	self._sliders.radius.set_enabled(slot3, self._sliders.radius)

	return 
end
function WaypointUnitElement:set_shape_property(params)
	slot6 = self._hed[params.value]

	self._square_shape.set_property(slot3, self._square_shape, params.property)

	slot6 = self._hed[params.value]

	self._circle_shape.set_property(slot3, self._circle_shape, params.property)

	return 
end
function WaypointUnitElement:set_element_data(params, ...)
	slot5 = params

	WaypointUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "map_display" then
		slot4 = self

		self._set_shape_type(slot3)
	elseif params.value == "color" then
		slot7 = self._hed.color
		slot6 = " "
		local colors = self._split_string(slot3, self, tostring(slot6))

		for i = 1, 3, 1 do
			colors[i] = colors[i] / 255
		end

		self._hed.color = {
			r = colors[1],
			g = colors[2],
			b = colors[3]
		}
	end

	return 
end
function WaypointUnitElement:_on_color_changed()
	slot3 = self.__color_picker_dialog
	local color = self.__color_picker_dialog.color(slot2)
	self._hed.color = {
		r = color.r,
		g = color.g,
		b = color.b
	}
	slot7 = color.b * 255

	self._color.control.set_background_colour(, self._color.control, color.r * 255, color.g * 255)

	return 
end
function WaypointUnitElement:_split_string(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end

	local t = {}
	local i = 1
	slot8 = "([^" .. sep .. "]+)"

	for str in string.gmatch(slot6, inputstr) do
		t[i] = str
		i = i + 1
	end

	return t
end
function WaypointUnitElement:scale_slider(panel, sizer, number_ctrlr_params, value, name)
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
function WaypointUnitElement:set_size(params)
	slot5 = params.ctrlr
	local value = (self._hed[params.value] * params.ctrlr.get_value(slot4)) / 100

	if value < 10 then
		value = 10
	end

	slot7 = value

	self._square_shape.set_property(slot4, self._square_shape, params.value)

	slot7 = value

	self._circle_shape.set_property(slot4, self._circle_shape, params.value)

	slot6 = value

	CoreEWS.change_entered_number(slot4, params.number_ctrlr_params)

	return 
end
function WaypointUnitElement:size_release(params)
	self._hed[params.value] = params.number_ctrlr_params.value
	slot5 = 100

	params.ctrlr.set_value(params.value, params.ctrlr)

	return 
end
function WaypointUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = "This waypoint will only be visible for players that are in civilian mode"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "only_in_civilian")

	slot10 = "Select a map display type"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "map_display", self._map_display_options)

	slot10 = "Select an icon"
	self._icon_ctrlr = self._build_value_combobox(slot4, self, panel, panel_sizer, "icon", self._icon_options)
	self._color = {}
	slot11 = "Select the color of the waypoint on the map"
	self._color.label, self._color.control = self._build_value_color(panel, self, panel, panel_sizer, "color")

	if not self._square_shape then
		slot5 = self

		self._create_shapes(slot4)
	end

	local width, width_params = self._build_value_number(slot4, self, panel, panel_sizer, "width", {
		floats = 0,
		min = 10
	})
	slot8 = "Width [cm]:"

	width_params.name_ctrlr.set_label(panel, width_params.name_ctrlr)

	self._width_params = width_params
	slot13 = "set_shape_property"

	width.connect(panel, width, "EVT_COMMAND_TEXT_ENTER", callback("If map display type is \"square,\" this specifies the width of the element on the map (in pixels).", self, self))

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
		min = 10
	})
	slot10 = "Depth [cm]:"

	depth_params.name_ctrlr.set_label(panel, depth_params.name_ctrlr)

	self._depth_params = depth_params
	slot15 = "set_shape_property"

	depth.connect(panel, depth, "EVT_COMMAND_TEXT_ENTER", callback("If map display type is \"square,\" this specifies the depth of the element on the map (in pixels).", self, self))

	slot15 = "set_shape_property"
	slot12 = {
		value = "depth",
		property = "depth"
	}

	depth.connect(panel, depth, "EVT_KILL_FOCUS", callback({
		value = "depth",
		property = "depth"
	}, self, self))

	local radius, radius_params = self._build_value_number(panel, self, panel, panel_sizer, "radius", {
		floats = 0,
		min = 10
	})
	slot12 = "Radius [cm]:"

	radius_params.name_ctrlr.set_label(panel, radius_params.name_ctrlr)

	self._radius_params = radius_params
	slot17 = "set_shape_property"

	radius.connect(panel, radius, "EVT_COMMAND_TEXT_ENTER", callback("If map display type is \"circle,\" this specifies the radius of the element on the map (in pixels).", self, self))

	slot17 = "set_shape_property"
	slot14 = {
		value = "radius",
		property = "radius"
	}

	radius.connect(panel, radius, "EVT_KILL_FOCUS", callback({
		value = "radius",
		property = "radius"
	}, self, self))

	slot16 = "Width scale:"

	self.scale_slider(panel, self, panel, panel_sizer, width_params, "width")

	slot16 = "Depth scale:"

	self.scale_slider(panel, self, panel, panel_sizer, depth_params, "depth")

	slot16 = "Radius scale:"

	self.scale_slider(panel, self, panel, panel_sizer, radius_params, "radius")

	slot16 = "Select a text id"

	self._build_value_combobox(panel, self, panel, panel_sizer, "text_id", self._text_options)

	slot12 = "HORIZONTAL"
	local text_sizer = EWS.BoxSizer(panel, EWS)
	slot19 = ""
	slot16 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

	text_sizer.add(EWS, text_sizer, EWS.StaticText("text_id", EWS, panel, "Text: ", ""), 1, 2)

	slot17 = self._hed.text_id
	slot16 = ""
	self._text = EWS.StaticText(EWS, EWS, panel, managers.localization.text(2, managers.localization), "")
	slot16 = "RIGHT,TOP,EXPAND"

	text_sizer.add(EWS, text_sizer, self._text, 2, 2)

	slot16 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer, 1, 0)

	slot12 = self

	self._set_shape_type(EWS)

	return 
end

return 
