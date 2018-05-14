slot3 = "CoreEditorSave"

core.module(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreXml"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

function save_unit(world, level, unit, data)
	return 
end

function save_data_table(unit)
	slot3 = unit
	local ud = unit.unit_data(slot2)
	local t = {}
	slot5 = unit
	slot5 = unit.name(slot4)
	t.name = unit.name(slot4).s(slot4)
	t.unit_id = ud.unit_id
	t.name_id = ud.name_id
	slot5 = unit

	if unit.unit_data(slot4).continent then
		slot5 = unit
		slot5 = unit.unit_data(slot4).continent
		slot3 = unit.unit_data(slot4).continent.name(slot4)
	end

	t.continent = slot3
	slot5 = unit
	t.position = unit.position(slot4)
	slot5 = unit
	t.rotation = unit.rotation(slot4)
	t.mesh_variation = ud.mesh_variation
	t.material_variation = ud.material
	t.cutscene_actor = ud.cutscene_actor
	t.disable_shadows = ud.disable_shadows
	t.hide_on_projection_light = ud.hide_on_projection_light
	t.disable_on_ai_graph = ud.disable_on_ai_graph
	slot5 = unit
	t.lights = _light_data_table(slot4)
	slot5 = unit
	t.triggers = _triggers_data_table(slot4)
	slot5 = unit
	t.editable_gui = _editable_gui_data_table(slot4)
	slot5 = unit
	t.projection_light = CoreEditorUtils.has_any_projection_light(slot4)
	t.projection_lights = ud.projection_lights
	t.projection_textures = ud.projection_textures
	slot5 = unit
	t.ladder = _editable_ladder_table(slot4)
	slot5 = unit
	t.zipline = _editable_zipline_table(slot4)

	return t
end

function _light_data_table(unit)
	slot3 = unit
	local lights = CoreEditorUtils.get_editable_lights(slot2)

	if not lights then
		return nil
	end

	local t = {}
	slot5 = lights

	for _, light in ipairs(slot4) do
		local data = {}
		slot11 = light
		slot11 = light.name(slot10)
		data.name = light.name(slot10).s(slot10)
		slot11 = light
		data.enabled = light.enable(slot10)
		slot11 = light
		data.far_range = light.far_range(slot10)
		slot11 = light
		data.near_range = light.near_range(slot10)
		slot11 = light
		data.color = light.color(slot10)
		slot11 = light
		data.spot_angle_start = light.spot_angle_start(slot10)
		slot11 = light
		data.spot_angle_end = light.spot_angle_end(slot10)
		slot13 = light
		slot11 = CoreEditorUtils.get_intensity_preset(light.multiplier(slot12))
		data.multiplier = CoreEditorUtils.get_intensity_preset(light.multiplier(slot12)).s(slot10)
		slot11 = light
		data.falloff_exponent = light.falloff_exponent(slot10)
		slot11 = light
		data.linear_attenuation_factor = light.linear_attenuation_factor(slot10)
		slot11 = light
		data.clipping_values = light.clipping_values(slot10)
		slot12 = data

		table.insert(slot10, t)
	end

	return (0 < #t and t) or nil
end

function _triggers_data_table(unit)
	slot3 = managers.sequence
	slot6 = unit
	local triggers = managers.sequence.get_trigger_list(slot2, unit.name(slot5))

	if #triggers == 0 then
		return nil
	end

	local t = {}

	if 0 < #triggers then
		slot5 = unit

		if unit.damage(slot4) then
			slot5 = unit
			slot5 = unit.damage(slot4)
			local trigger_name_list = unit.damage(slot4).get_trigger_name_list(slot4)

			if trigger_name_list then
				slot6 = trigger_name_list

				for _, trigger_name in ipairs(slot5) do
					slot11 = unit
					slot12 = trigger_name
					local trigger_data = unit.damage(slot10).get_trigger_data_list(slot10, unit.damage(slot10))

					if trigger_data and 0 < #trigger_data then
						slot12 = trigger_data

						for _, data in ipairs(slot11) do
							slot18 = {
								name = data.trigger_name,
								id = data.id,
								notify_unit_id = data.notify_unit.unit_data(slot20).unit_id,
								time = data.time,
								notify_unit_sequence = data.notify_unit_sequence
							}
							slot21 = data.notify_unit

							table.insert(slot16, t)
						end
					end
				end
			end
		end
	end

	return (0 < #t and t) or nil
end

function _editable_gui_data_table(unit)
	local t = nil
	slot4 = unit

	if unit.editable_gui(slot3) then
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		slot5 = unit
		slot5 = unit.editable_gui(slot4)
		t = {
			text = unit.editable_gui(slot4).text(slot4),
			font_color = unit.editable_gui(slot4).font_color(slot4),
			font_size = unit.editable_gui(slot4).font_size(slot4),
			font = unit.editable_gui(slot4).font(slot4),
			align = unit.editable_gui(slot4).align(slot4),
			vertical = unit.editable_gui(slot4).vertical(slot4),
			blend_mode = unit.editable_gui(slot4).blend_mode(slot4),
			render_template = unit.editable_gui(slot4).render_template(slot4),
			wrap = unit.editable_gui(slot4).wrap(slot4),
			word_wrap = unit.editable_gui(slot4).word_wrap(slot4),
			alpha = unit.editable_gui(slot4).alpha(slot4),
			shape = unit.editable_gui(slot4).shape(slot4)
		}
	end

	return t
end

function _editable_ladder_table(unit)
	local t = nil
	slot4 = unit

	if unit.ladder(slot3) then
		slot5 = unit
		slot5 = unit.ladder(slot4)
		slot5 = unit
		slot5 = unit.ladder(slot4)
		t = {
			width = unit.ladder(slot4).width(slot4),
			height = unit.ladder(slot4).height(slot4)
		}
	end

	return t
end

function _editable_zipline_table(unit)
	local t = nil
	slot4 = unit

	if unit.zipline(slot3) then
		slot5 = unit
		slot5 = unit.zipline(slot4)
		slot5 = unit
		slot5 = unit.zipline(slot4)
		slot5 = unit
		slot5 = unit.zipline(slot4)
		slot5 = unit
		slot5 = unit.zipline(slot4)
		slot5 = unit
		slot5 = unit.zipline(slot4)
		t = {
			end_pos = unit.zipline(slot4).end_pos(slot4),
			speed = unit.zipline(slot4).speed(slot4),
			slack = unit.zipline(slot4).slack(slot4),
			usage_type = unit.zipline(slot4).usage_type(slot4),
			ai_ignores_bag = unit.zipline(slot4).ai_ignores_bag(slot4)
		}
	end

	return t
end

function save_layout(params)
	local dialogs = {}

	if params.save_dialog_states then
		slot4 = params.dialogs

		for name, dialog in pairs(slot3) do
			slot12 = dialog
			slot10 = dialog
			slot10 = dialog
			slot10 = dialog
			dialogs[name] = {
				class = CoreDebug.class_name(getmetatable(slot11)),
				position = dialog.position(slot9),
				size = dialog.size(slot9),
				visible = dialog.visible(slot9)
			}
		end

		slot4 = params.dialogs_settings

		for name, setting in pairs(slot3) do
			if not params.dialogs[name] then
				dialogs[name] = {
					class = setting.class,
					position = setting.position,
					size = setting.size,
					visible = setting.visible
				}
			end
		end
	end

	local data = {}
	slot5 = Global.frame
	data.is_maximized = Global.frame.is_maximized(slot4)
	slot5 = Global.frame
	data.is_iconized = Global.frame.is_iconized(slot4)
	slot5 = Global.frame
	data.size = Global.frame.get_size(slot4)
	slot5 = Global.frame
	data.position = Global.frame.get_position(slot4)
	data.dialogs = dialogs
	slot7 = "w"
	local f = SystemFS.open(slot4, SystemFS, params.file)
	slot6 = f
	slot10 = data

	f.puts(SystemFS, ScriptSerializer.to_generic_xml(slot8, ScriptSerializer))

	slot6 = f

	f.close(SystemFS)

	return 
end

function load_layout(params)
	slot6 = params.file
	local data = ScriptSerializer.from_generic_xml(slot2, params.file.read(slot5))
	slot4 = data.dialogs

	for name, settings in pairs(ScriptSerializer) do
		params.dialogs_settings[name] = settings

		if settings.visible then
			slot11 = settings.class

			managers.editor.show_dialog(slot8, managers.editor, name)
		end
	end

	if not data.is_maximized and not data.is_iconized then
		slot5 = data.is_maximized

		Global.frame.maximize(slot3, Global.frame)

		slot5 = data.size

		Global.frame.set_size(slot3, Global.frame)

		slot5 = data.position

		Global.frame.set_position(slot3, Global.frame)
	elseif data.is_iconized then
		slot5 = data.is_iconized

		Global.frame.iconize(slot3, Global.frame)
	end

	return 
end

return 
