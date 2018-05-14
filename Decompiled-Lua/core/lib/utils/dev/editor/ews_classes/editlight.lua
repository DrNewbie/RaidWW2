-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditUnitLight then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditUnitLight = slot0
EditUnitLight.DEFAULT_SHADOW_RESOLUTION = 128
EditUnitLight.DEFAULT_SPOT_PROJECTION_TEXTURE = "units/lights/spot_light_projection_textures/default_df"
function EditUnitLight:init(editor)
	slot4 = self

	EditUnitLight.super.init(slot3)

	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	slot7 = "VERTICAL"
	local debug_sizer = EWS.BoxSizer({
		name = "Light",
		class = self
	}, EWS)
	slot10 = ""
	local debug_ctrlr = EWS.CheckBox(EWS, EWS, panel, "Debug")
	slot9 = self._debug

	debug_ctrlr.set_value(EWS, debug_ctrlr)

	slot14 = "update_debug"

	debug_ctrlr.connect(EWS, debug_ctrlr, "EVT_COMMAND_CHECKBOX_CLICKED", callback(debug_ctrlr, self, self))

	slot12 = "EXPAND,LEFT"

	debug_sizer.add(EWS, debug_sizer, debug_ctrlr, 1, 5)
	sizer.add(EWS, sizer, debug_sizer, 0, 5)

	slot9 = "HORIZONTAL"
	local lights_sizer = EWS.BoxSizer(EWS, EWS)
	self._lights_params = {
		name = "Lights:",
		name_proportions = 3,
		tooltip = "Select a light to edit from the combobox",
		sorted = true,
		sizer_proportions = 2,
		ctrlr_proportions = 4,
		panel = panel,
		sizer = lights_sizer,
		options = {}
	}
	slot9 = self._lights_params

	CoreEws.combobox()

	slot15 = "change_light"
	slot12 = nil

	self._lights_params.ctrlr.connect(, self._lights_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback("EXPAND,BOTTOM,TOP", self, self))

	slot13 = "BU_EXACTFIT"
	self._color_ctrlr = EWS.Button(, EWS, panel, "Color", "")
	slot15 = "show_color_dialog"
	slot12 = ""

	self._color_ctrlr.connect(, self._color_ctrlr, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot13 = "EXPAND,LEFT"

	lights_sizer.add(, lights_sizer, self._color_ctrlr, 0, 5)

	self._enabled_ctrlr = EWS.CheckBox(, EWS, panel, "Enabled")
	slot15 = "update_enabled"
	slot12 = self._enabled_ctrlr

	self._enabled_ctrlr.connect(, self._enabled_ctrlr, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot13 = "EXPAND,LEFT"

	lights_sizer.add(, lights_sizer, self._enabled_ctrlr, 1, 5)

	slot13 = "EXPAND,BOTTOM"

	sizer.add(, sizer, lights_sizer, 0, 5)

	slot14 = "update_near_range"
	slot14 = "update_near_range"
	self._near_range_params = {
		value = 0,
		name = "Near range [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the near range of the light in cm",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot9 = self._near_range_params

	CoreEws.number_controller()

	slot14 = "update_far_range"
	slot14 = "update_far_range"
	self._range_params = {
		value = 0,
		name = "Far range [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the range of the light in cm",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot9 = self._range_params

	CoreEws.number_controller()

	slot15 = "x"
	slot15 = "x"
	self._upper_clipping_params = {
		name_proportions = 1,
		name = "Set the upper clipping [cm]:",
		value = 0,
		tooltip = "Sets the upper clipping in cm",
		floats = 0,
		ctrlr_proportions = 1,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self, "update_clipping")
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self, "update_clipping")
			}
		}
	}
	slot9 = self._upper_clipping_params

	CoreEws.number_controller()

	slot15 = "y"
	slot15 = "y"
	self._lower_clipping_params = {
		name_proportions = 1,
		name = "Set the lower clipping [cm]:",
		value = 0,
		tooltip = "Sets the lower clipping in cm",
		floats = 0,
		ctrlr_proportions = 1,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self, "update_clipping")
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self, "update_clipping")
			}
		}
	}
	slot9 = self._lower_clipping_params

	CoreEws.number_controller()

	local intensity_options = {}
	slot12 = LightIntensityDB

	for _, intensity in ipairs(LightIntensityDB.list(0)) do
		slot15 = intensity_options
		slot18 = intensity

		table.insert(slot14, intensity.s(slot17))
	end

	self._intensity_params = {
		default = "none",
		name = "Intensity:",
		name_proportions = 1,
		tooltip = "Select an intensity from the combobox",
		sorted = false,
		ctrlr_proportions = 3,
		panel = panel,
		sizer = sizer,
		options = intensity_options
	}
	slot10 = self._intensity_params

	CoreEws.combobox(slot9)

	slot16 = "update_intensity"

	self._intensity_params.ctrlr.connect(slot9, self._intensity_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot13, self, self))

	self._falloff_params = {
		name_proportions = 1,
		name = "Quadratic attenuation:",
		ctrlr_proportions = 3,
		value = 0.0001,
		tooltip = "Controls quadratic attenuation factor",
		min = 0,
		floats = 7,
		max = 2,
		panel = panel,
		sizer = sizer
	}
	slot10 = self._falloff_params

	CoreEws.slider_and_number_controller(slot9)

	slot16 = "update_falloff"

	self._falloff_params.slider_ctrlr.connect(slot9, self._falloff_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(nil, self, self))

	slot16 = "update_falloff"

	self._falloff_params.slider_ctrlr.connect(slot9, self._falloff_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot16 = "update_falloff"

	self._falloff_params.number_ctrlr.connect(slot9, self._falloff_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot16 = "update_falloff"

	self._falloff_params.number_ctrlr.connect(slot9, self._falloff_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._linear_atten_params = {
		name_proportions = 1,
		name = "Linear attenuation:",
		ctrlr_proportions = 3,
		value = 0.0001,
		tooltip = "Controls linear attenuation factor",
		min = 1e-07,
		floats = 7,
		max = 1,
		panel = panel,
		sizer = sizer
	}
	slot10 = self._linear_atten_params

	CoreEws.slider_and_number_controller(slot9)

	slot16 = "update_linear_atten"

	self._linear_atten_params.slider_ctrlr.connect(slot9, self._linear_atten_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(nil, self, self))

	slot16 = "update_linear_atten"

	self._linear_atten_params.slider_ctrlr.connect(slot9, self._linear_atten_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot16 = "update_linear_atten"

	self._linear_atten_params.number_ctrlr.connect(slot9, self._linear_atten_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot16 = "update_linear_atten"

	self._linear_atten_params.number_ctrlr.connect(slot9, self._linear_atten_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._spot_start_angle_params = {
		name_proportions = 1,
		name = "Start angle:",
		ctrlr_proportions = 3,
		value = 1,
		tooltip = "Controls the start angle of the spot light",
		min = 1,
		floats = 0,
		max = 179,
		panel = panel,
		sizer = sizer
	}
	slot10 = self._spot_start_angle_params

	CoreEws.slider_and_number_controller(slot9)

	slot16 = "update_start_angle"

	self._spot_start_angle_params.slider_ctrlr.connect(slot9, self._spot_start_angle_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(nil, self, self))

	slot16 = "update_start_angle"

	self._spot_start_angle_params.slider_ctrlr.connect(slot9, self._spot_start_angle_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot16 = "update_start_angle"

	self._spot_start_angle_params.number_ctrlr.connect(slot9, self._spot_start_angle_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot16 = "update_start_angle"

	self._spot_start_angle_params.number_ctrlr.connect(slot9, self._spot_start_angle_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._spot_end_angle_params = {
		name_proportions = 1,
		name = "End angle:",
		ctrlr_proportions = 3,
		value = 1,
		tooltip = "Controls the end angle of the spot light",
		min = 1,
		floats = 0,
		max = 179,
		panel = panel,
		sizer = sizer
	}
	slot10 = self._spot_end_angle_params

	CoreEws.slider_and_number_controller(slot9)

	slot16 = "update_end_angle"

	self._spot_end_angle_params.slider_ctrlr.connect(slot9, self._spot_end_angle_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(nil, self, self))

	slot16 = "update_end_angle"

	self._spot_end_angle_params.slider_ctrlr.connect(slot9, self._spot_end_angle_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot16 = "update_end_angle"

	self._spot_end_angle_params.number_ctrlr.connect(slot9, self._spot_end_angle_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot16 = "update_end_angle"

	self._spot_end_angle_params.number_ctrlr.connect(slot9, self._spot_end_angle_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._shadow_resolution_params = {
		name = "Shadow Resolution:",
		numbers = true,
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select an resolution from the combobox",
		sorted = false,
		panel = panel,
		sizer = sizer,
		value = EditUnitLight.DEFAULT_SHADOW_RESOLUTION,
		options = {
			16,
			32,
			64,
			128,
			256,
			512,
			1024,
			2048
		}
	}
	slot10 = self._shadow_resolution_params

	CoreEws.combobox()

	slot16 = "update_resolution"

	self._shadow_resolution_params.ctrlr.connect(, self._shadow_resolution_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(nil, self, self))

	slot11 = self
	slot9 = self.get_spot_projection_textures(self._shadow_resolution_params.ctrlr)
	self._spot_projection_texture_params = {
		name_proportions = 1,
		name = "Spot Texture:",
		tooltip = "Select a spot projection texture from the combobox",
		sorted = true,
		ctrlr_proportions = 3,
		panel = panel,
		sizer = sizer,
		value = EditUnitLight.DEFAULT_SPOT_PROJECTION_TEXTURE,
		options = slot9
	}
	slot10 = self._spot_projection_texture_params

	CoreEws.combobox(slot9)

	slot16 = "update_spot_projection_texture"
	slot13 = nil

	self._spot_projection_texture_params.ctrlr.connect(slot9, self._spot_projection_texture_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(nil, self, self))

	slot10 = panel

	panel.layout(slot9)

	slot11 = false

	panel.set_enabled(slot9, panel)

	self._panel = panel

	return 
end
function EditUnitLight:get_spot_projection_textures()
	slot4 = managers.database.base_path(slot5) .. "units\\lights\\spot_light_projection_textures"
	local entry_path = managers.database.entry_path(slot2, managers.database)
	slot7 = managers.database
	local files = SystemFS.list(managers.database, SystemFS)
	local textures = {}
	slot6 = files

	for _, file in ipairs(managers.database.base_path(managers.database) .. "units\\lights\\spot_light_projection_textures") do
		slot11 = textures
		slot15 = entry_path .. "\\" .. file

		table.insert(slot10, managers.database.entry_path(slot13, managers.database))
	end

	return textures
end
function EditUnitLight:change_light()
	slot3 = self._reference_unit

	if alive(slot2) then
		slot8 = self._lights_params.ctrlr
		local light = self._reference_unit.get_object(slot2, Idstring(self._lights_params.ctrlr.get_value(slot7)))
		slot5 = light

		self.update_light_ctrls_from_light(self._reference_unit, self)
	end

	return 
end
function EditUnitLight:update_light_ctrls_from_light(light)

	-- Decompilation error in this vicinity:
	slot4 = self._lights_params
	slot7 = light
	slot7 = light.name(slot6)

	CoreEws.change_combobox_value(slot3, light.name(slot6).s(slot6))

	slot4 = self._enabled_ctrlr
	slot7 = light

	self._enabled_ctrlr.set_value(slot3, light.enable(slot6))

	slot9 = light
	slot7 = light.color(light).z * 255

	self._color_ctrlr.set_background_colour(slot3, self._color_ctrlr, light.color(slot6).x * 255, light.color(light).y * 255)

	slot4 = self._range_params
	slot7 = light

	CoreEws.change_entered_number(slot3, light.far_range(light.color(light).y * 255))

	slot4 = self._near_range_params
	slot7 = light

	CoreEws.change_entered_number(slot3, light.near_range(light.color(light).y * 255))

	local clipping_values = light.clipping_values(slot3)
	slot6 = clipping_values.x

	CoreEws.change_entered_number(light, self._upper_clipping_params)
	CoreEws.change_entered_number(light, self._lower_clipping_params)

	slot7 = light
	local intensity = CoreEditorUtils.get_intensity_preset(light.multiplier(clipping_values.y))
	slot6 = light
	slot10 = intensity

	light.set_multiplier(light.multiplier, LightIntensityDB.lookup(light, LightIntensityDB))

	slot6 = light
	slot10 = intensity

	light.set_specular_multiplier(light.multiplier, LightIntensityDB.lookup_specular_multiplier(light, LightIntensityDB))

	slot6 = self._intensity_params
	slot9 = intensity

	CoreEws.change_combobox_value(light.multiplier, intensity.s(light))

	slot6 = self._falloff_params
	slot9 = light

	CoreEws.change_slider_and_number_value(light.multiplier, light.falloff_exponent(light))

	slot6 = self._linear_atten_params
	slot9 = light

	CoreEws.change_slider_and_number_value(light.multiplier, light.linear_attenuation_factor(light))

	slot6 = self._spot_start_angle_params
	slot9 = light

	CoreEws.change_slider_and_number_value(light.multiplier, light.spot_angle_start(light))

	slot6 = self._spot_end_angle_params
	slot9 = light

	CoreEws.change_slider_and_number_value(light.multiplier, light.spot_angle_end(light))

	slot8 = light
	slot7 = "omni"
	slot8 = is_spot

	self._spot_start_angle_params.number_ctrlr.set_enabled(slot6, self._spot_start_angle_params.number_ctrlr)

	slot8 = is_spot

	self._spot_start_angle_params.slider_ctrlr.set_enabled(slot6, self._spot_start_angle_params.slider_ctrlr)

	slot8 = is_spot

	self._spot_end_angle_params.number_ctrlr.set_enabled(slot6, self._spot_end_angle_params.number_ctrlr)

	slot8 = is_spot

	self._spot_end_angle_params.slider_ctrlr.set_enabled(slot6, self._spot_end_angle_params.slider_ctrlr)

	slot9 = "shadow_projection"
	local is_shadow_projection = CoreEditorUtils.is_projection_light(slot6, self._reference_unit, light)
	slot9 = is_shadow_projection

	self._shadow_resolution_params.ctrlr.set_enabled(self._reference_unit, self._shadow_resolution_params.ctrlr)

	slot8 = self._reference_unit
	local resolution = self._reference_unit.unit_data(self._reference_unit).projection_lights
	slot12 = projection_texture

	CoreEws.change_combobox_value(slot10, self._spot_projection_texture_params)

	return 
end
function EditUnitLight:update_falloff()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot9 = self._falloff_params.value

		light.set_falloff_exponent(slot7, light)
	end

	return 
end
function EditUnitLight:update_linear_atten()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot9 = self._linear_atten_params.value

		light.set_linear_attenuation_factor(slot7, light)
	end

	return 
end
function EditUnitLight:update_enabled()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot8 = light
		slot11 = self._enabled_ctrlr

		light.set_enable(slot7, self._enabled_ctrlr.get_value(slot10))
	end

	return 
end
function EditUnitLight:show_color_dialog()
	slot8 = self._color_ctrlr
	slot6 = self._color_ctrlr.background_colour(slot7) / 255
	local colordlg = EWS.ColourDialog(slot2, EWS, self._panel, true)
	slot4 = colordlg

	if colordlg.show_modal(EWS) then
		slot9 = colordlg
		slot7 = colordlg.get_colour(colordlg).z * 255

		self._color_ctrlr.set_background_colour(slot3, self._color_ctrlr, colordlg.get_colour(slot6).x * 255, colordlg.get_colour(colordlg).y * 255)

		slot6 = self

		for _, light in ipairs(self._selected_lights(colordlg.get_colour(slot6).x * 255)) do
			slot12 = self._color_ctrlr
			slot10 = self._color_ctrlr.background_colour(slot11) / 255

			light.set_color(slot8, light)
		end
	end

	return 
end
function EditUnitLight:update_intensity()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot8 = light
		slot11 = LightIntensityDB
		slot14 = self._intensity_params.value

		light.set_multiplier(slot7, LightIntensityDB.lookup(slot10, Idstring(slot13)))

		slot8 = light
		slot11 = LightIntensityDB
		slot14 = self._intensity_params.value

		light.set_specular_multiplier(slot7, LightIntensityDB.lookup_specular_multiplier(slot10, Idstring(slot13)))
	end

	return 
end
function EditUnitLight:update_near_range(params)
	slot6 = self

	for _, light in ipairs(self._selected_lights(slot5)) do
		slot10 = params.value

		light.set_near_range(slot8, light)
	end

	return 
end
function EditUnitLight:update_far_range(params)
	slot6 = self

	for _, light in ipairs(self._selected_lights(slot5)) do
		slot10 = params.value

		light.set_far_range(slot8, light)
	end

	return 
end
function EditUnitLight:update_clipping(value, params)
	slot7 = self

	for _, light in ipairs(self._selected_lights(slot6)) do
		slot10 = light
		local clipping_values = light.clipping_values(slot9)

		if value == "x" then
			slot11 = light
			slot15 = params.value

			light.set_clipping_values(slot10, clipping_values.with_x(slot13, clipping_values))
		elseif value == "y" then
			slot11 = light
			slot15 = params.value

			light.set_clipping_values(slot10, clipping_values.with_y(slot13, clipping_values))
		elseif value == "z" then
			slot11 = light
			slot15 = params.value

			light.set_clipping_values(slot10, clipping_values.with_z(slot13, clipping_values))
		end
	end

	return 
end
function EditUnitLight:update_start_angle()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot9 = self._spot_start_angle_params.value

		light.set_spot_angle_start(slot7, light)
	end

	return 
end
function EditUnitLight:update_end_angle()
	slot5 = self

	for _, light in ipairs(self._selected_lights(slot4)) do
		slot9 = self._spot_end_angle_params.value

		light.set_spot_angle_end(slot7, light)
	end

	return 
end
function EditUnitLight:update_resolution()
	local value = self._shadow_resolution_params.value
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit
			slot14 = self._lights_params.ctrlr
			local light = unit.get_object(slot8, Idstring(self._lights_params.ctrlr.get_value(slot13)))

			if light then
				slot11 = unit
				unit.unit_data(slot9).projection_lights = unit.unit_data(unit).projection_lights or {}
				slot11 = light
				slot11 = light.name(unit)
				unit.unit_data(unit.unit_data(unit).projection_lights or ).projection_lights[light.name(unit).s(unit)] = {
					x = value,
					y = value
				}
			end
		end
	end

	return 
end
function EditUnitLight:update_spot_projection_texture()
	local value = self._spot_projection_texture_params.value
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit
			slot14 = self._lights_params.ctrlr
			local light = unit.get_object(slot8, Idstring(self._lights_params.ctrlr.get_value(slot13)))

			if light then
				slot13 = value
				slot13 = false

				light.set_projection_texture(slot9, light, Idstring(slot12), false)

				slot11 = unit
				unit.unit_data(slot9).projection_textures = unit.unit_data(unit).projection_textures or {}
				slot11 = light
				slot11 = light.name(unit)
				unit.unit_data(unit.unit_data(unit).projection_textures or ).projection_textures[light.name(unit).s(unit)] = value
			end
		end
	end

	return 
end
function EditUnitLight:_selected_lights()
	local lights = {}
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit
			slot14 = self._lights_params.ctrlr
			local light = unit.get_object(slot8, Idstring(self._lights_params.ctrlr.get_value(slot13)))

			if light then
				slot11 = light

				table.insert(slot9, lights)
			end
		end
	end

	return lights
end
function EditUnitLight:_reference_light()
	slot3 = self._reference_unit

	if alive(slot2) then
		slot3 = self._reference_unit
		slot8 = self._lights_params.ctrlr

		return self._reference_unit.get_object(slot2, Idstring(self._lights_params.ctrlr.get_value(slot7)))
	end

	return 
end
function EditUnitLight:_is_type(type)
	slot6 = self
	slot6 = self._reference_light(slot5)
	slot5 = type

	return string.find(slot3, self._reference_light(slot5).properties(slot5))
end
function EditUnitLight:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then
		slot5 = unit
		local lights = CoreEditorUtils.get_editable_lights(slot4) or {}
		local options = {}
		slot7 = lights

		for _, light in ipairs(slot6) do
			slot12 = options
			slot15 = light
			slot15 = light.name(slot14)

			table.insert(slot11, light.name(slot14).s(slot14))
		end

		slot8 = options

		CoreEws.update_combobox_options(slot6, self._lights_params)

		if lights[1] then
			self._reference_unit = unit
			self._selected_units = units
			slot8 = lights[1]

			self.update_light_ctrls_from_light(slot6, self)

			return true
		end
	end

	self._selected_units = {}

	return false
end
function EditUnitLight:update(t, dt)
	slot7 = dt

	self._draw(slot4, self, t)

	return 
end
function EditUnitLight:_draw(t, dt)
	if not self._debug then
		return 
	end

	slot7 = self

	for _, light in ipairs(self._selected_lights(slot6)) do
		slot13 = dt

		self._draw_light(slot9, self, light, t)
	end

	return 
end
function EditUnitLight:_draw_light(light, t, dt)
	slot6 = light

	if not light.enable(slot5) then
		return 
	end

	local c = light.color(slot5)
	local clipping_values = light.clipping_values(light)
	slot9 = "omni"

	if self._is_type(light, self) then
		slot8 = self._brush
		slot14 = c.z * 1

		self._brush.set_color(slot7, Color(slot10, 0.15, c.x * 1, c.y * 1))

		slot12 = light
		slot10 = light.far_range(light)
		slot11 = 4

		self._brush.sphere(slot7, self._brush, light.position(slot10), slot10)

		slot8 = self._brush
		slot14 = c.z * 0.5

		self._brush.set_color(slot7, Color(slot10, 0.15, c.x * 0.5, c.y * 0.5))

		slot12 = light
		slot11 = 4

		self._brush.sphere(slot7, self._brush, light.position(slot10), light.near_range(light))

		slot12 = light
		slot13 = c.z * 0.5

		Application.draw_sphere(slot7, Application, light.position(light.near_range(light)), light.near_range(light), c.x * 0.5, c.y * 0.5)

		slot12 = light
		slot13 = c.z * 1

		Application.draw_sphere(slot7, Application, light.position(light.near_range(light)), light.far_range(light), c.x * 1, c.y * 1)
	else
		slot9 = light
		local far_radius = math.tan(slot7) * light.far_range(light.spot_angle_end(slot9) / 2)
		slot11 = light
		slot10 = light
		local near_radius = math.tan(light.spot_angle_end(slot9) / 2) * light.near_range(light.spot_angle_end(light) / 2)
		slot10 = self._brush
		slot16 = c.z * 1

		self._brush.set_color(light.spot_angle_end(light) / 2, Color(slot12, 0.25, c.x * 1, c.y * 1))

		slot15 = light
		slot16 = light
		slot13 = far_radius

		self._brush.cone(light.spot_angle_end(light) / 2, self._brush, light.position(slot12), light.position(light) - light.rotation(light).z(light) * light.far_range(light.rotation(light)))

		slot10 = self._brush
		slot16 = c.z * 0.25

		self._brush.set_color(light.spot_angle_end(light) / 2, Color(light.position(light) - light.rotation(light).z(light) * light.far_range(light.rotation(light)), 0.25, c.x * 0.25, c.y * 0.25))

		slot15 = light
		slot16 = light
		slot13 = near_radius

		self._brush.cone(light.spot_angle_end(light) / 2, self._brush, light.position(light.position(light) - light.rotation(light).z(light) * light.far_range(light.rotation(light))), light.position(light) - light.rotation(light).z(light) * light.near_range(light.rotation(light)))

		slot15 = light
		slot16 = light
		slot16 = c.z * 1

		Application.draw_cone(light.spot_angle_end(light) / 2, Application, light.position(light.position(light) - light.rotation(light).z(light) * light.near_range(light.rotation(light))), light.position(light) - light.rotation(light).z(light) * light.far_range(light.rotation(light)), far_radius, c.x * 1, c.y * 1)

		slot15 = light
		slot16 = light
		slot16 = c.z * 0.5

		Application.draw_cone(light.spot_angle_end(light) / 2, Application, light.position(light.position(light) - light.rotation(light).z(light) * light.far_range(light.rotation(light))), light.position(light) - light.rotation(light).z(light) * light.near_range(light.rotation(light)), near_radius, c.x * 0.5, c.y * 0.5)
	end

	slot8 = self._brush
	slot14 = c.z * 0

	self._brush.set_color(slot7, Color(slot10, 0.5, c.x * 1, c.y * 0.5))

	slot14 = clipping_values.x
	slot9 = light.position(slot10) + Vector3(light, 0, 0)
	slot12 = light

	self._brush.disc(slot7, self._brush, light.far_range(light))

	slot14 = clipping_values.x
	slot9 = light.position(light.far_range) + Vector3(light, 0, 0)
	slot12 = light

	self._pen.circle(slot7, self._pen, light.far_range(light))

	slot8 = self._brush
	slot14 = c.z * 0

	self._brush.set_color(slot7, Color(light.far_range, 0.5, c.x * 1, c.y * 0.2))

	slot14 = clipping_values.y
	slot9 = light.position(light.far_range) + Vector3(light, 0, 0)
	slot12 = light

	self._brush.disc(slot7, self._brush, light.far_range(light))

	slot14 = clipping_values.y
	slot9 = light.position(light.far_range) + Vector3(light, 0, 0)
	slot12 = light

	self._pen.circle(slot7, self._pen, light.far_range(light))

	return 
end

return 
