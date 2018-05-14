slot3 = "CoreEditorUtils"

core.import(slot1, core)

CoreEditorGroups = CoreEditorGroups or class()
function CoreEditorGroups:init()
	self._groups = {}
	self._group_names = {}

	return 
end
function CoreEditorGroups:groups()
	return self._groups
end
function CoreEditorGroups:group_names()
	return self._group_names
end
function CoreEditorGroups:update(t, dt)
	slot5 = self._groups

	for _, group in pairs(slot4) do
		slot12 = dt

		group.draw(slot9, group, t)
	end

	return 
end
function CoreEditorGroups:create(name, reference, units)
	slot7 = name

	if not table.contains(slot5, self._group_names) then
		slot7 = name

		table.insert(slot5, self._group_names)
	end

	slot9 = units
	local group = CoreEditorGroup.new(slot5, CoreEditorGroup, name, reference)
	self._groups[name] = group

	return group
end
function CoreEditorGroups:add(name, units)
	local group = self._groups[name]
	slot7 = units

	group.add(slot5, group)

	return 
end
function CoreEditorGroups:remove(name)
	slot5 = name

	table.delete(slot3, self._group_names)

	slot4 = self._groups[name]

	self._groups[name].remove(slot3)

	self._groups[name] = nil

	return 
end
function CoreEditorGroups:clear()
	return 
end
function CoreEditorGroups:group_name()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for the new group:", "Create Group", self.new_group_name(slot8), Vector3(self, -1, -1))

	if name and name ~= "" then
		if self._groups[name] then
			slot4 = self

			self.group_name(slot3)
		else
			return name
		end
	end

	return nil
end
function CoreEditorGroups:new_group_name()
	local s = "Group0"
	local i = 1

	while self._groups[s .. i] do
		i = i + 1

		if 9 < i then
			s = "Group"
		end
	end

	return s .. i
end
function CoreEditorGroups:save()
	slot3 = self._group_names

	for _, name in ipairs(slot2) do
		local group = self._groups[name]

		if group then
			local units = {}
			slot12 = group

			for _, unit in ipairs(group.units(slot11)) do
				slot18 = unit
				slot16 = unit.unit_data(slot17).unit_id

				table.insert(slot14, units)
			end

			local t = {
				entry = "editor_groups"
			}
			slot11 = group

			if group.continent(slot10) then
				slot11 = group
				slot9 = group.continent_name(slot10)
			end

			t.continent = slot9
			slot9 = {
				name = group.name(slot11),
				reference = group.reference(slot11).unit_data(slot11).unit_id
			}
			slot12 = group
			slot12 = group
			slot12 = group.reference(slot11)
			slot12 = group

			if group.continent(slot11) then
				slot12 = group
				slot10 = group.continent_name(slot11)
			end

			slot9.continent = slot10
			slot9.units = units
			t.data = slot9
			slot12 = t

			managers.editor.add_save_data(slot10, managers.editor)
		end
	end

	return 
end
function CoreEditorGroups:load(world_holder, offset)
	slot8 = offset
	local load_data = world_holder.create_world(slot4, world_holder, "world", "editor_groups")
	local group_names = load_data.group_names
	local groups = {}
	slot8 = load_data.groups

	for name, data in pairs("editor_groups") do
		if 0 < #data.units then
			local reference = managers.worlddefinition.get_unit_by_id(slot12, managers.worlddefinition)
			local units = {}
			slot15 = data.units

			for _, unit in ipairs(data.reference) do
				slot20 = units
				slot24 = unit

				table.insert(slot19, managers.worlddefinition.get_unit_by_id(slot22, managers.worlddefinition))
			end

			local continent = nil

			if data.continent then
				slot17 = data.continent
				continent = managers.editor.continent(slot15, managers.editor)
			end

			slot17 = reference

			if not table.contains(slot15, units) then
				reference = units[1]
				slot19 = "."

				cat_error(slot15, "editor", "Changed reference for group,", name)
			end

			groups[name] = {
				reference = reference,
				units = units,
				continent = continent
			}
		else
			slot14 = name

			table.delete(slot12, group_names)

			slot16 = "since it didnt contain any units."

			cat_error(slot12, "editor", "Removed old group", name)
		end
	end

	slot8 = group_names

	for _, name in ipairs(slot7) do
		if not groups[name].reference then
			slot14 = "Reference unit is nil since there are no units left in group. Will remove, " .. name .. "."

			managers.editor.output_error(slot12, managers.editor)
		else
			slot16 = groups[name].units
			local group = self.create(slot12, self, name, groups[name].reference)
			slot15 = groups[name].continent

			group.set_continent(self, group)
		end
	end

	return 
end
function CoreEditorGroups:load_group()
	slot5 = "XML-file (*.xml)|*.xml"
	local path = managers.database.open_file_dialog(slot2, managers.database, Global.frame)

	if path then
		slot5 = path

		self.load_group_file(slot3, self)
	end

	return 
end
function CoreEditorGroups:load_group_file(path)
	local name = self.group_name(slot3)
	local node = SystemFS.parse_xml(self, SystemFS)
	local layer_name = "Statics"
	slot8 = "layer"

	if node.has_parameter(path, node) then
		slot8 = "layer"
		layer_name = node.parameter(slot6, node)
	end

	slot8 = layer_name
	local layer = managers.editor.layer(slot6, managers.editor)
	slot8 = managers.editor
	local pos = managers.editor.current_layer(managers.editor).current_pos(managers.editor)
	slot10 = layer_name

	managers.editor.change_layer_notebook(managers.editor.current_layer(managers.editor), managers.editor)

	local reference = nil
	local units = {}

	if pos then
		slot11 = node

		for unit in node.children(slot10) do
			local rot, new_unit = nil
			slot17 = unit

			if unit.name(slot16) == "ref_unit" then
				slot21 = "name"
				reference = layer.do_spawn_unit(slot16, layer, unit.parameter(pos, unit))
				new_unit = reference
			else
				slot20 = "local_pos"
				local pos = pos + math.string_to_vector(unit.parameter(slot18, unit))
				local rot = math.string_to_rotation(unit.parameter(unit, unit))
				slot23 = "name"
				slot22 = rot
				new_unit = layer.do_spawn_unit(unit.parameter, layer, unit.parameter("local_rot", unit), pos)
			end

			slot17 = unit

			for setting in unit.children(slot16) do
				slot21 = setting

				if setting.name(slot20) == "light" then
					slot23 = setting

					self.parse_light(slot20, self, new_unit)
				else
					slot21 = setting

					if setting.name(slot20) == "variation" then
						slot23 = setting

						self.parse_variation(slot20, self, new_unit)
					else
						slot21 = setting

						if setting.name(slot20) == "material_variation" then
							slot23 = setting

							self.parse_material_variation(slot20, self, new_unit)
						else
							slot21 = setting

							if setting.name(slot20) == "editable_gui" then
								slot23 = setting

								self.parse_editable_gui(slot20, self, new_unit)
							end
						end
					end
				end
			end

			slot18 = new_unit

			table.insert(slot16, units)
		end

		slot14 = units

		self.create(slot10, self, name, reference)

		slot12 = self._groups[name]

		layer.select_group(slot10, layer)
	end

	return 
end
function CoreEditorGroups:parse_light(unit, node)
	slot5 = unit
	slot11 = "name"
	local light = unit.get_object(slot4, Idstring(node.parameter(slot9, node)))

	if not light then
		return 
	end

	slot6 = light
	slot12 = "enabled"

	light.set_enable(slot5, toboolean(node.parameter(slot10, node)))

	slot6 = light
	slot12 = "far_range"

	light.set_far_range(slot5, tonumber(node.parameter(slot10, node)))

	slot6 = light
	slot12 = "color"

	light.set_color(slot5, math.string_to_vector(node.parameter(slot10, node)))

	slot6 = light
	slot12 = "angle_start"

	light.set_spot_angle_start(slot5, tonumber(node.parameter(slot10, node)))

	slot6 = light
	slot12 = "angle_end"

	light.set_spot_angle_end(slot5, tonumber(node.parameter(slot10, node)))

	slot6 = light
	slot9 = LightIntensityDB
	slot15 = "multiplier"

	light.set_multiplier(slot5, LightIntensityDB.lookup(slot8, Idstring(node.parameter(slot13, node))))

	slot7 = "falloff_exponent"

	if node.has_parameter(slot5, node) then
		slot6 = light
		slot12 = "falloff_exponent"

		light.set_falloff_exponent(slot5, tonumber(node.parameter(slot10, node)))
	end

	slot7 = "linear_attenuation_factor"

	if node.has_parameter(slot5, node) then
		slot6 = light
		slot12 = "linear_attenuation_factor"

		light.set_linear_attenuation_factor(slot5, tonumber(node.parameter(slot10, node)))
	end

	return 
end
function CoreEditorGroups:parse_variation(unit, node)
	slot6 = "value"
	local variation = node.parameter(slot4, node)

	if variation ~= "default" then
		slot6 = unit
		unit.unit_data(slot5).mesh_variation = variation
		slot9 = unit
		slot9 = unit

		managers.sequence.run_sequence_simple2(slot5, managers.sequence, unit.unit_data(slot8).mesh_variation, "change_state")
	end

	return 
end
function CoreEditorGroups:parse_material_variation(unit, node)
	slot6 = "value"
	local material_variation = node.parameter(slot4, node)

	if material_variation ~= "default" then
		slot6 = unit
		unit.unit_data(slot5).material = material_variation
		slot9 = unit

		unit.set_material_config(slot5, unit, unit.unit_data(true).material)
	end

	return 
end
function CoreEditorGroups:parse_editable_gui(unit, node)
	slot5 = unit
	slot5 = unit.editable_gui(slot4)

	unit.editable_gui(slot4).set_text(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot11 = "font_color"

	unit.editable_gui(slot4).set_font_color(slot4, math.string_to_vector(node.parameter("text", node)))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot11 = "font_size"

	unit.editable_gui(slot4).set_font_size(slot4, tonumber(node.parameter("text", node)))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot9 = "font"

	unit.editable_gui(slot4).set_font(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot9 = "align"

	unit.editable_gui(slot4).set_align(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot9 = "vertical"

	unit.editable_gui(slot4).set_vertical(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot9 = "blend_mode"

	unit.editable_gui(slot4).set_blend_mode(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot9 = "render_template"

	unit.editable_gui(slot4).set_render_template(slot4, node.parameter(slot7, node))

	slot5 = unit
	slot9 = "wrap"
	slot6 = node.parameter(slot7, node) == "true"

	unit.editable_gui(slot4).set_wrap(slot4, unit.editable_gui(slot4))

	slot5 = unit
	slot6 = node.parameter(slot7, node) == "true"

	unit.editable_gui(slot4).set_word_wrap(slot4, unit.editable_gui(slot4))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot11 = "alpha"

	unit.editable_gui(slot4).set_alpha(slot4, tonumber(node.parameter("word_wrap", node)))

	slot5 = unit
	slot5 = unit.editable_gui(slot4)
	slot11 = "shape"

	unit.editable_gui(slot4).set_shape(slot4, string.split(slot7, node.parameter(" ", node)))

	return 
end
CoreEditorGroup = CoreEditorGroup or class()
function CoreEditorGroup:init(name, reference, units)
	self._name = name
	self._reference = reference
	self._units = {}
	slot6 = managers.editor
	self._continent = managers.editor.current_continent(slot5)
	slot6 = units

	for _, unit in ipairs(slot5) do
		slot12 = unit

		self.add_unit(slot10, self)
	end

	self._closed = true

	return 
end
function CoreEditorGroup:closed()
	return self._closed
end
function CoreEditorGroup:set_closed(closed)
	self._closed = closed

	return 
end
function CoreEditorGroup:name()
	return self._name
end
function CoreEditorGroup:units()
	return self._units
end
function CoreEditorGroup:continent()
	return self._continent
end
function CoreEditorGroup:set_continent(continent)
	self._continent = continent

	return 
end
function CoreEditorGroup:continent_name()
	slot1 = tostring

	if self._continent then
		slot5 = self._continent
		slot3 = self._continent.name(slot4)
	end

	return slot1(slot2)
end
function CoreEditorGroup:add(units)
	return 
end
function CoreEditorGroup:add_unit(unit)
	if not unit then
		return 
	end

	slot5 = unit

	table.insert(slot3, self._units)

	slot5 = unit
	unit.unit_data(slot3).editor_groups = unit.unit_data(unit).editor_groups or {}
	slot6 = unit

	table.insert(unit.unit_data(unit).editor_groups or , unit.unit_data(self).editor_groups)

	return 
end
function CoreEditorGroup:remove_unit(unit)
	table.delete(slot3, self._units)

	slot6 = unit
	slot5 = self

	table.delete(slot3, unit.unit_data(unit).editor_groups)

	if unit == self._reference then
		if 0 < #self._units then
			self._reference = self._units[1]
		else
			slot5 = self._name

			managers.editor.remove_group(slot3, managers.editor)
		end
	end

	return 
end
function CoreEditorGroup:remove()
	slot3 = self._units

	for _, unit in ipairs(slot2) do
		slot10 = unit

		table.delete(slot7, unit.unit_data(self).editor_groups)
	end

	return 
end
function CoreEditorGroup:reference()
	return self._reference
end
function CoreEditorGroup:set_reference(reference)
	self._reference = reference

	return 
end
function CoreEditorGroup:save_to_file()
	slot6 = "XML-file (*.xml)|*.xml"
	slot9 = self
	local path = managers.database.save_file_dialog(slot2, managers.database, Global.frame, true, self.name(slot8))

	if path then
		slot6 = "w"
		local f = SystemFS.open(slot3, SystemFS, path)
		slot9 = self
		slot11 = managers.editor
		slot6 = "<group name=\"" .. self.name(slot8) .. "\" layer=\"" .. managers.editor.current_layer_name(slot10) .. "\">"

		f.puts(SystemFS, f)

		slot9 = self._reference
		slot9 = self._reference.name("\" layer=\"")
		slot6 = "\t<ref_unit name=\"" .. self._reference.name("\" layer=\"").s("\" layer=\"") .. "\">"

		f.puts(SystemFS, f)

		slot8 = self._reference

		self.save_edited_settings(SystemFS, self, f, "\t\t")

		slot6 = "\t</ref_unit>"

		f.puts(SystemFS, f)

		slot5 = self._units

		for _, unit in ipairs(SystemFS) do
			if unit ~= self._reference then
				slot10 = unit
				local name = unit.name(slot9).s(slot9)
				local local_pos = unit.unit_data(unit.name(slot9)).local_pos
				local local_rot = unit.unit_data(unit).local_rot
				slot14 = local_pos.x
				local x = string.format(unit, "%.4f")
				slot15 = local_pos.y
				local y = string.format("%.4f", "%.4f")
				slot16 = local_pos.z
				local z = string.format("%.4f", "%.4f")
				local_pos = "" .. x .. " " .. y .. " " .. z
				local yaw = string.format(x, local_rot.yaw(" "))
				local pitch = string.format("%.4f", local_rot.pitch(local_rot))
				slot18 = "%.4f"
				slot21 = local_rot
				local roll = string.format("%.4f", local_rot.roll(local_rot))
				local_rot = "" .. yaw .. " " .. pitch .. " " .. roll
				slot20 = "\t<unit name=\"" .. name .. "\" local_pos=\"" .. local_pos .. "\" local_rot=\"" .. local_rot .. "\">"

				f.puts(yaw, f)

				slot22 = unit

				self.save_edited_settings(yaw, self, f, "\t\t")

				slot20 = "\t</unit>"

				f.puts(yaw, f)
			end
		end

		slot6 = "</group>"

		f.puts(slot4, f)

		slot6 = f

		SystemFS.close(slot4, SystemFS)
	end

	return 
end
function CoreEditorGroup:save_edited_settings(...)
	slot3 = self

	self.save_lights(slot2, ...)

	slot3 = self

	self.save_variation(slot2, ...)

	slot3 = self

	self.save_editable_gui(slot2, ...)

	return 
end
function CoreEditorGroup:save_lights(file, t, unit, data_table)
	slot7 = unit
	local lights = CoreEditorUtils.get_editable_lights(slot6) or {}
	slot8 = lights

	for _, light in ipairs(slot7) do
		slot14 = light
		slot16 = light
		slot18 = light
		local c_s = "" .. light.color(slot13).x .. " " .. light.color(slot15).y .. " " .. light.color(slot17).z
		local as = light.spot_angle_start(" ")
		local ae = light.spot_angle_end(light)
		slot18 = light
		local multiplier = CoreEditorUtils.get_intensity_preset(light.multiplier(slot17)).s(light)
		local falloff_exponent = light.falloff_exponent(CoreEditorUtils.get_intensity_preset(light.multiplier(slot17)))
		local laf = light.linear_attenuation_factor(light)
		slot24 = light
		slot24 = light.name(slot23)
		slot28 = light
		slot28 = light
		slot20 = t .. "<light name=\"" .. light.name(slot23).s(slot23) .. "\" enabled=\"" .. tostring(light.enable(slot27)) .. "\" far_range=\"" .. light.far_range(slot27) .. "\" color=\"" .. c_s .. "\" angle_start=\"" .. as .. "\" angle_end=\"" .. ae .. "\" multiplier=\"" .. multiplier .. "\" falloff_exponent=\"" .. falloff_exponent .. "\" linear_attenuation_factor=\"" .. laf .. "\"/>"

		file.puts(light, file)
	end

	return 
end
function CoreEditorGroup:save_variation(file, t, unit, data_table)
	slot7 = unit

	if unit.unit_data(slot6).mesh_variation then
		slot7 = managers.sequence
		slot10 = unit

		if 0 < #managers.sequence.get_editable_state_sequence_list(slot6, unit.name(slot9)) then
			slot12 = unit
			slot8 = t .. "<variation value=\"" .. unit.unit_data(slot11).mesh_variation .. "\"/>"

			file.puts(slot6, file)
		end
	end

	slot7 = unit

	if unit.unit_data(slot6).material then
		slot7 = unit

		if unit.unit_data(slot6).material ~= "default" then
			slot12 = unit
			slot8 = t .. "<material_variation value=\"" .. unit.unit_data(slot11).material .. "\"/>"

			file.puts(slot6, file)
		end
	end

	return 
end
function CoreEditorGroup:save_editable_gui(file, t, unit, data_table)
	slot7 = unit

	if unit.editable_gui(slot6) then
		slot7 = unit
		local text = unit.editable_gui(slot6).text(slot6)
		slot8 = unit
		local font_color = unit.editable_gui(unit.editable_gui(slot6)).font_color(unit.editable_gui(slot6))
		slot9 = unit
		local font_size = unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))).font_size(unit.editable_gui(unit.editable_gui(slot6)))
		slot10 = unit
		local font = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))).font(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))
		slot11 = unit
		local align = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))).align(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))
		slot12 = unit
		local vertical = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))).vertical(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))
		slot13 = unit
		local blend_mode = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))).blend_mode(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))
		slot14 = unit
		local render_template = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))).render_template(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))))
		slot15 = unit
		local wrap = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))))).wrap(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))))
		slot16 = unit
		local word_wrap = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))))).word_wrap(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))))))
		slot17 = unit
		local alpha = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))))))).alpha(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))))))
		slot18 = unit
		local shape = unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))))))).shape(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6))))))))))))
		slot28 = font_color
		slot40 = wrap
		slot42 = word_wrap
		slot46 = "%s %s %s %s"
		slot49 = shape
		slot20 = t .. "<editable_gui text=\"" .. text .. "\" font_size=\"" .. font_size .. "\" font_color=\"" .. math.vector_to_string(slot27) .. "\" font=\"" .. font .. "\" align=\"" .. align .. "\" vertical=\"" .. vertical .. "\" blend_mode=\"" .. blend_mode .. "\" render_template=\"" .. render_template .. "\" wrap=\"" .. tostring(slot39) .. "\" word_wrap=\"" .. tostring(slot41) .. "\" alpha=\"" .. alpha .. "\" shape=\"" .. string.format(slot45, unpack(slot48)) .. "\"/>"

		file.puts(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(unit.editable_gui(slot6)))))))))))), file)
	end

	return 
end
function CoreEditorGroup:draw(t, dt)
	local i = 0.25
	slot6 = managers.editor

	if managers.editor.using_groups(slot5) then
		slot7 = managers.editor

		if self._continent ~= managers.editor.current_continent(slot6) then
			return 
		end

		i = 0.65
	else
		slot6 = managers.editor

		if not managers.editor.debug_draw_groups(slot5) then
			return 
		end
	end

	slot6 = self._units

	for _, unit in ipairs(slot5) do
		slot15 = 1 * i

		Application.draw(slot10, Application, unit, 1 * i, 1 * i)
	end

	slot10 = 0

	Application.draw(slot5, Application, self._reference, 0, 1 * i)

	return 
end

if not GroupPresetsDialog then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

GroupPresetsDialog = slot0
function GroupPresetsDialog:init(files, path)
	self._path = path
	slot13 = 0
	slot14 = 0
	slot11 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot4, self, nil, "Group Presets", "", Vector3(slot10, 300, 150), Vector3(300, 200, 300))

	slot6 = "VERTICAL"

	self.create_panel(slot4, self)

	self._hide_on_create = true
	slot6 = "VERTICAL"
	local option_sizer = EWS.BoxSizer(slot4, EWS)
	slot9 = ""
	local hide = EWS.CheckBox(EWS, EWS, self._panel, "Hide on create")
	slot8 = self._hide_on_create

	hide.set_value(EWS, hide)

	slot13 = "hide_on_create"

	hide.connect(EWS, hide, "EVT_COMMAND_CHECKBOX_CLICKED", callback(Vector3(300, 200, 300), self, self))

	slot13 = "key_cancel"
	slot10 = ""

	hide.connect(EWS, hide, "EVT_KEY_DOWN", callback(hide, self, self))

	slot11 = "RIGHT,LEFT"

	option_sizer.add(EWS, option_sizer, hide, 0, 2)

	slot11 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, option_sizer, 0, 0)

	slot10 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._list = EWS.ListBox(EWS, EWS, self._panel, "group_presets_groups")
	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, self._list, 1, 0)

	slot7 = files

	for _, file in ipairs(EWS) do
		slot13 = file

		self._list.append(slot11, self._list)
	end

	slot13 = "select_group"

	self._list.connect(slot6, self._list, "EVT_COMMAND_LISTBOX_SELECTED", callback(slot10, self, self))

	slot13 = "create_group"

	self._list.connect(slot6, self._list, "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(nil, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	self._list.connect(slot6, self._list, "EVT_KEY_DOWN", callback(nil, self, self))

	slot8 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot6, EWS)
	slot12 = ""
	local create_btn = EWS.Button(EWS, EWS, self._panel, "Create", "")
	slot13 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, create_btn, 0, 2)

	slot15 = "create_group"

	create_btn.connect(EWS, create_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = "key_cancel"
	slot12 = ""

	create_btn.connect(EWS, create_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot13 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Cancel", "")
	slot14 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot16 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot16 = "key_cancel"
	slot13 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot14 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot14 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot11 = true

	self._dialog.set_visible(EWS, self._dialog)

	return 
end
function GroupPresetsDialog:select_group()
	slot3 = self._list
	local i = self._list.selected_index(slot2)

	if -1 < i then
		slot5 = i
		local name = self._list.get_string(slot3, self._list)
		slot5 = managers.database
		self._file = managers.database.base_path(self._list) .. self._path .. "\\" .. name
	end

	return 
end
function GroupPresetsDialog:create_group()
	if self._file then
		if self._hide_on_create then
			slot4 = false

			self._dialog.set_visible(slot2, self._dialog)
		end

		slot3 = managers.editor
		slot4 = self._file

		managers.editor.groups(slot2).load_group_file(slot2, managers.editor.groups(slot2))
	end

	return 
end
function GroupPresetsDialog:hide_on_create(hide)
	slot4 = hide
	self._hide_on_create = hide.get_value(slot3)

	return 
end

return 
