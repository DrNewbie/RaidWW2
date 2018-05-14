-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreWorldInstanceManager = CoreWorldInstanceManager or class()
CoreWorldInstanceManager.init = function (self)
	self._instance_data = {}
	self._registered_input_elements = {}
	self._registered_output_event_elements = {}
	self._instance_params = {}
	self._start_offset_index = 30000

	return 
end
CoreWorldInstanceManager.start_offset_index = function (self)
	return self._start_offset_index
end
CoreWorldInstanceManager.add_instance_data = function (self, data)
	slot5 = data

	table.insert(slot3, self._instance_data)

	return 
end
CoreWorldInstanceManager.get_instance_data_by_name = function (self, name, worlddefinition_id)
	slot5 = self._instance_data

	for _, instance_data in ipairs(slot4) do
		if instance_data.name == name and (((not worlddefinition_id or worlddefinition_id == 0) and not instance_data.worlddefinition_id) or instance_data.worlddefinition_id == worlddefinition_id) then
			return instance_data
		end
	end

	return false
end
CoreWorldInstanceManager.remove_instances_for_world = function (self, worlddefinition_id)
	for i = #self._instance_data, 1, -1 do
		if self._instance_data[i].worlddefinition_id == worlddefinition_id then
			slot9 = i

			table.remove(slot7, self._instance_data)
		end
	end

	return 
end
CoreWorldInstanceManager.has_instance = function (self, name)
	slot4 = self._instance_data

	for _, instance_data in ipairs(slot3) do
		if instance_data.name == name then
			return true
		end
	end

	return false
end
CoreWorldInstanceManager.get_safe_name = function (self, instance_name, name)
	local start_number = 1

	if name then
		local sub_name = name
		slot7 = name

		for i = string.len(slot6), 0, -1 do
			slot12 = i
			slot15 = name
			local sub = string.sub(slot10, name, string.len(slot14))
			slot14 = i
			sub_name = string.sub(name, name, 0)
			slot12 = sub

			if tonumber(name) then
				slot12 = sub
				start_number = tonumber(slot11)
			else
				break
			end
		end

		name = sub_name
	else
		name = instance_name .. "_"
	end

	local names = {}
	slot7 = self._instance_data

	for _, instance_data in ipairs(slot6) do
		names[instance_data.name] = true
	end

	for i = start_number, 10000, 1 do
		i = ((i < 10 and "00") or (i < 100 and "0") or "") .. i
		local name_id = name .. i

		if not names[name_id] then
			return name_id
		end
	end

	return 
end
CoreWorldInstanceManager.get_safe_start_index = function (self, index_size, continent, dry_run)
	local start_indices = {}
	local end_indices = {}
	local t = self._instance_data

	if dry_run then
		t = self._instance_data_dry_run
	end

	slot9 = t

	for _, instance_data in ipairs(slot8) do
		if instance_data.continent == continent then
			slot15 = instance_data.start_index

			table.insert(slot13, start_indices)

			slot15 = (instance_data.start_index + (instance_data.index_size or 600)) - 1

			table.insert(slot13, end_indices)
		end
	end

	slot9 = start_indices

	table.sort(slot8)
	table.sort(slot8)

	local new_index = 0
	slot10 = start_indices

	for i, si in ipairs(end_indices) do
		local ei = end_indices[i]

		if not start_indices[i + 1] then
			return ei + 1
		else
			local next_si = start_indices[i + 1]

			if index_size < next_si - ei then
				return ei + 1
			end
		end
	end

	return 0
end
CoreWorldInstanceManager.get_used_indices = function (self, continent)
	local start_indices = {}
	local end_indices = {}
	slot6 = self._instance_data

	for _, instance_data in ipairs(slot5) do
		if instance_data.continent == continent then
			slot12 = instance_data.start_index

			table.insert(slot10, start_indices)

			slot12 = (instance_data.start_index + (instance_data.index_size or 600)) - 1

			table.insert(slot10, end_indices)
		end
	end

	slot6 = start_indices

	table.sort(slot5)

	slot6 = end_indices

	table.sort(slot5)

	return start_indices, end_indices
end
CoreWorldInstanceManager.rename_instance = function (self, name, new_name)
	slot6 = name
	local data = self.get_instance_data_by_name(slot4, self)

	if data then
		data.name = new_name
	end

	return 
end
CoreWorldInstanceManager.instance_data = function (self)
	return self._instance_data
end
CoreWorldInstanceManager.instance_save_data = function (self)
	local data = {}
	slot4 = self._instance_data

	for i, instance_data in ipairs(slot3) do
		data[i] = {}
		slot9 = instance_data

		for name, value in pairs(slot8) do
			if name ~= "worlddefinition_id" then
				data[i][name] = value
			end
		end
	end

	return data
end
CoreWorldInstanceManager.debug_recalculate_instance_size = function (self, ignore_not_found)
	print(slot3)

	self._instance_data_dry_run = {}
	local dry_run_ok = true
	slot5 = self._instance_data

	for i, instance_data in ipairs("[CoreWorldInstanceManager:debug_recalculate_instance_size()] STARTED") do
		local found = false
		local predef = instance_data.predef

		if not predef then
			slot13 = instance_data.folder
			predef = self._parse_instance_name_from_folder(slot11, self)
		end

		if predef then
			slot12 = managers.editor

			if managers.editor.layers(slot11).Instances._predefined_instances[predef] then
				found = true
			end
		end

		if not found then
			dry_run_ok = false
			slot12 = "Could not find predefine for instance:"
			slot15 = instance_data

			print(slot11, inspect(slot14))
		end
	end

	if dry_run_ok or ignore_not_found then
		if dry_run_ok then
			slot5 = "[CoreWorldInstanceManager:debug_recalculate_instance_size()] DRY RUN OK!"

			print(slot4)
		else
			slot5 = "[CoreWorldInstanceManager:debug_recalculate_instance_size()] DRY RUN FAILED, BUT IGNORE FLAG PASSED, CONTINUING!"

			print(slot4)
		end

		self._instance_data_dry_run = {}
		slot5 = self._instance_data

		for i, instance_data in ipairs(slot4) do
			if not instance_data.predef then
				slot11 = instance_data.folder
				local predef = self._parse_instance_name_from_folder(slot9, self)
				slot11 = managers.editor

				if managers.editor.layers(self).Instances._predefined_instances[predef] then
					instance_data.predef = predef
				end
			end

			if instance_data.predef then
				slot10 = managers.editor
				instance_data.index_size = managers.editor.layers(slot9).Instances._predefined_instances[instance_data.predef].size
			end

			slot13 = true
			instance_data.start_index = managers.world_instance.get_safe_start_index(slot9, managers.world_instance, instance_data.index_size, instance_data.continent)
			slot11 = instance_data

			table.insert(slot9, self._instance_data_dry_run)
		end

		slot5 = "[CoreWorldInstanceManager:debug_recalculate_instance_size()] SUCCESS! Save the level to make changes permanent."

		print(slot4)
	else
		slot6 = "Could not recalculate some instances, aborting! If you wish to force recalculate, set method arg to true."

		Application.error(slot4, Application)
	end

	return 
end
CoreWorldInstanceManager._parse_instance_name_from_folder = function (self, folder)
	slot6 = managers.editor
	slot4 = managers.editor.layers(slot5).Instances._predefined_instances

	for key, data in pairs(slot3) do
		if data.folder == folder then
			return key
		end
	end

	return 
end
CoreWorldInstanceManager.instance_names_by_script = function (self, script)
	local names = {}
	slot5 = self._instance_data

	for _, instance_data in ipairs(slot4) do
		if instance_data.script == script then
			slot11 = instance_data.name

			table.insert(slot9, names)
		end
	end

	slot5 = names

	table.sort(slot4)

	return names
end
CoreWorldInstanceManager.instance_names = function (self, continent)
	local names = {}
	slot5 = self._instance_data

	for _, instance_data in ipairs(slot4) do
		if not continent or instance_data.continent == continent then
			slot11 = instance_data.name

			table.insert(slot9, names)
		end
	end

	slot5 = names

	table.sort(slot4)

	return names
end
CoreWorldInstanceManager.instances_data_by_continent = function (self, continent)
	local instances = {}
	slot5 = self._instance_data

	for _, instance_data in ipairs(slot4) do
		if not continent or instance_data.continent == continent then
			slot11 = instance_data

			table.insert(slot9, instances)
		end
	end

	return instances
end
CoreWorldInstanceManager.packages_by_instance = function (self, instance)
	local folder = instance.folder
	local package = folder .. "/" .. "world"
	local init_package = folder .. "/" .. "world_init"

	return {
		package = package,
		init_package = init_package
	}
end
CoreWorldInstanceManager.custom_create_instance = function (self, instance_name, worlddefinition_id, custom_data)

	-- Decompilation error in this vicinity:
	if worlddefinition_id ~= 0 then
		slot7 = worlddefinition_id
		slot4 = managers.worldcollection.worlddefinition_by_id(slot5, managers.worldcollection)
	else
		slot4 = false

		if false then
			local worlddefinition = true
		end
	end

	slot9 = worlddefinition_id
	local instance = self.get_instance_data_by_name(slot6, self, instance_name)
	worlddefinition = worlddefinition or managers.worlddefinition
	local continent_data = worlddefinition._continents[instance.continent]
	slot10 = instance
	local package_data = managers.world_instance.packages_by_instance(slot8, managers.world_instance)
	instance.position = custom_data.position or Vector3()
	instance.rotation = custom_data.rotation or Rotation()
	slot13 = worlddefinition
	local prepared_unit_data = managers.world_instance.prepare_unit_data(slot9, managers.world_instance, instance, continent_data)

	if prepared_unit_data.statics then
		local world_in_world = (worlddefinition_id ~= 0 and true) or false
		slot12 = prepared_unit_data.statics

		for _, static in ipairs(slot11) do
			slot20 = world_in_world
			local unit = worlddefinition._create_statics_unit(slot16, worlddefinition, static, Vector3())
			slot18 = Application

			if Application.editor(worlddefinition) then
				slot19 = "Statics"
				slot19 = unit

				managers.editor.layer(slot17, managers.editor).add_unit_to_created_units(slot17, managers.editor.layer(slot17, managers.editor))
			end
		end
	end

	if prepared_unit_data.dynamics then
		slot11 = prepared_unit_data.dynamics

		for _, entry in ipairs(slot10) do
			slot19 = world_in_world
			local unit = worlddefinition._create_dynamics_unit(slot15, worlddefinition, entry, Vector3())
			slot17 = Application

			if Application.editor(worlddefinition) then
				slot18 = "Dynamics"
				slot18 = unit

				managers.editor.layer(slot16, managers.editor).add_unit_to_created_units(slot16, managers.editor.layer(slot16, managers.editor))
			end
		end
	end

	slot13 = worlddefinition_id
	local prepare_mission_data = self.prepare_mission_data_by_name(slot10, self, instance_name)
	slot14 = instance.script
	slot14 = prepare_mission_data

	mission.script(slot12, mission).external_create_instance_elements(slot12, mission.script(slot12, mission))

	return 
end
CoreWorldInstanceManager._get_instance_continent_data = function (self, path)
	slot4 = Application

	if Application.editor(slot3) then
		slot6 = path

		return self._serialize_to_script(slot3, self, "continent")
	end

	self._instance_continent_data = self._instance_continent_data or {}

	if self._instance_continent_data[path] then
		slot4 = self._instance_continent_data[path]

		return deep_clone(slot3)
	end

	slot7 = path
	self._instance_continent_data[path] = self._serialize_to_script(self._instance_continent_data[path], self, "continent")

	return deep_clone(self._serialize_to_script(self._instance_continent_data[path], self, "continent"))
end
CoreWorldInstanceManager.prepare_unit_data = function (self, instance, continent_data, worlddefinition)
	local start_index = instance.start_index
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	local instance_data = self._get_instance_continent_data("world", self)

	local function _prepare_entries(entries)
		if not entries then
			return 
		end

		slot3 = entries

		for _, entry in ipairs(slot2) do
			entry.unit_data.rotation = instance.rotation * entry.unit_data.rotation
			slot11 = instance.rotation
			entry.unit_data.position = instance.position + entry.unit_data.position.rotate_with(slot9, entry.unit_data.position)

			if worlddefinition then
				slot8 = worlddefinition
			else
				slot11 = entry.unit_data.unit_id
				entry.unit_data.unit_id = continent_data.base_id + self._get_mod_id(slot9, self) + self._start_offset_index + start_index
			end

			entry.unit_data.instance = instance.name
			entry.unit_data.continent = instance.continent

			if entry.unit_data.zipline then
				slot11 = instance.rotation
				entry.unit_data.zipline.end_pos = instance.position + entry.unit_data.zipline.end_pos.rotate_with(slot9, entry.unit_data.zipline.end_pos)
			end
		end

		return 
	end

	slot11 = instance_data.statics

	_prepare_entries(path)

	slot11 = instance_data.dynamics

	_prepare_entries(path)

	return instance_data
end
CoreWorldInstanceManager._get_mod_id = function (self, id)
	slot5 = 100000

	return math.mod(slot3, id)
end
CoreWorldInstanceManager.prepare_serialized_instance_data = function (self, instance)
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	slot7 = path

	self._get_instance_mission_data("world", self)

	slot7 = path

	self._get_instance_continent_data("world", self)

	return 
end
CoreWorldInstanceManager.check_highest_id = function (self, instance)
	local folder = instance.folder
	local highest_id = 0
	local amount = 0
	local type_amount = {}

	local function compare(datas)
		if not datas then
			return 0
		end

		local type_amount = 0
		slot4 = datas

		for _, data in ipairs(slot3) do
			slot10 = data.unit_data.unit_id
			local mod_id = self._get_mod_id(slot8, self)
			highest_id = (highest_id < mod_id and mod_id) or highest_id
			amount = amount + 1
			type_amount = type_amount + 1
		end

		return type_amount
	end

	local path = folder .. "/" .. "world"
	slot12 = path
	local instance_data = self._serialize_to_script("world", self, "continent")
	slot11 = instance_data.statics
	type_amount.statics = compare(self)
	slot11 = instance_data.dynamics
	type_amount.dynamics = compare(self)
	local path = folder .. "/" .. "mission"
	slot14 = path
	local instance_data = self._serialize_to_script("mission", self, "continent")
	slot13 = instance_data.mission
	type_amount.mission = compare(self)

	return highest_id, amount, type_amount
end
CoreWorldInstanceManager.prepare_mission_data_by_name = function (self, name, worlddefinition_id)
	slot7 = worlddefinition_id
	local instance_data = self.get_instance_data_by_name(slot4, self, name)
	slot7 = instance_data

	return self.prepare_mission_data(self, self)
end
CoreWorldInstanceManager._get_instance_mission_data = function (self, path)
	slot4 = Application

	if Application.editor(slot3) then
		slot6 = path

		return self._serialize_to_script(slot3, self, "mission")
	end

	self._instance_mission_data = self._instance_mission_data or {}

	if self._instance_mission_data[path] then
		slot4 = self._instance_mission_data[path]

		return deep_clone(slot3)
	end

	slot7 = path
	self._instance_mission_data[path] = self._serialize_to_script(self._instance_mission_data[path], self, "mission")

	return deep_clone(self._serialize_to_script(self._instance_mission_data[path], self, "mission"))
end
CoreWorldInstanceManager.prepare_mission_data = function (self, instance)

	-- Decompilation error in this vicinity:
	local start_index = instance.start_index
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	slot8 = path
	local instance_data = self._get_instance_mission_data("world", self)

	return instance_data
end
CoreWorldInstanceManager.translate_element_values = function (element, position, rotation)
	if element.values.rotation then
		element.values.rotation = rotation * element.values.rotation
	end

	if element.values.position then
		slot7 = rotation
		element.values.position = position + element.values.position.rotate_with(slot5, element.values.position)
	end

	if element.class == "ElementSpecialObjective" or element.class == "ElementNavLink" then
		slot7 = rotation
		element.values.search_position = position + element.values.search_position.rotate_with(slot5, element.values.search_position)
	elseif element.class == "ElementLootBag" then
		if element.values.spawn_dir then
			slot7 = rotation
			element.values.spawn_dir = element.values.spawn_dir.rotate_with(slot5, element.values.spawn_dir)
		end
	elseif element.class == "ElementSpawnGrenade" then
		slot7 = rotation
		element.values.spawn_dir = element.values.spawn_dir.rotate_with(slot5, element.values.spawn_dir)
	elseif element.class == "ElementSpawnUnit" then
		slot7 = rotation
		element.values.unit_spawn_dir = element.values.unit_spawn_dir.rotate_with(slot5, element.values.unit_spawn_dir)
	elseif element.class == "ElementLaserTrigger" then
		slot5 = element.values.points

		for _, point in pairs(slot4) do
			point.rot = rotation * point.rot
			slot11 = rotation
			point.pos = position + point.pos.rotate_with(slot9, point.pos)
		end
	end

	return 
end
CoreWorldInstanceManager._convert_table = function (self, convert_list, convert_table, continent_data, start_index)
	slot7 = convert_table

	for key, value in pairs(slot6) do
		slot12 = value

		if type_name(slot11) == "table" then
			slot16 = start_index

			self._convert_table(slot11, self, convert_list, value, continent_data)
		else
			slot12 = value

			if type_name(slot11) == "number" then
				if convert_list[value] then
					convert_table[key] = convert_list[value]
				elseif 100000 <= value then
					slot14 = value
					convert_table[key] = continent_data.base_id + self._get_mod_id(slot12, self) + self._start_offset_index + start_index
				end
			end
		end
	end

	return 
end
CoreWorldInstanceManager.get_mission_inputs_by_name = function (self, name)
	slot5 = name
	local instance_data = self.get_instance_data_by_name(slot3, self)
	slot6 = instance_data

	return self.get_mission_inputs(self, self)
end
CoreWorldInstanceManager.get_mission_inputs = function (self, instance)
	local start_index = instance.start_index
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	slot9 = path
	local instance_data = self._serialize_to_script("world", self, "mission")
	local mission_inputs = {}
	slot9 = instance_data

	for script, script_data in pairs("mission") do
		slot14 = script_data.elements

		for _, element in ipairs(slot13) do
			if element.class == "ElementInstanceInput" then
				local id = element.id + self._start_offset_index + start_index
				slot21 = element.values.event

				table.insert(slot19, mission_inputs)
			end
		end
	end

	slot9 = mission_inputs

	table.sort(slot8)

	return mission_inputs
end
CoreWorldInstanceManager.get_mission_outputs_by_name = function (self, name)
	slot5 = name
	local instance_data = self.get_instance_data_by_name(slot3, self)
	slot6 = instance_data

	return self.get_mission_outputs(self, self)
end
CoreWorldInstanceManager.get_mission_outputs = function (self, instance)
	local start_index = instance.start_index
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	slot9 = path
	local instance_data = self._serialize_to_script("world", self, "mission")
	local mission_inputs = {}
	slot9 = instance_data

	for script, script_data in pairs("mission") do
		slot14 = script_data.elements

		for _, element in ipairs(slot13) do
			if element.class == "ElementInstanceOutput" then
				local id = element.id + self._start_offset_index + start_index
				slot21 = element.values.event

				table.insert(slot19, mission_inputs)
			end
		end
	end

	slot9 = mission_inputs

	table.sort(slot8)

	return mission_inputs
end
CoreWorldInstanceManager.get_instance_params_by_name = function (self, name)
	slot5 = name
	local instance_data = self.get_instance_data_by_name(slot3, self)
	slot6 = instance_data

	return self.get_instance_params(self, self)
end
CoreWorldInstanceManager.get_instance_params = function (self, instance)
	local folder = instance.folder
	local path = folder .. "/" .. "world"
	slot8 = path
	local instance_data = self._serialize_to_script("world", self, "mission")
	local instance_params = {}
	slot8 = instance_data

	for script, script_data in pairs("mission") do
		slot13 = script_data.elements

		for _, element in ipairs(slot12) do
			if element.class == "ElementInstanceParams" then
				slot18 = element.values.params

				for _, params in ipairs(slot17) do
					slot24 = params

					table.insert(slot22, instance_params)
				end
			end
		end
	end

	return instance_params
end
CoreWorldInstanceManager._serialize_to_script = function (self, type, name)
	slot5 = Application

	if Application.editor(slot4) then
		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.editor_load_script_data(slot4, PackageManager, name.id(type))
	else
		slot6 = type.id(slot7)
		slot9 = name

		if not PackageManager.has(slot4, PackageManager, name.id(type)) then
			slot6 = "Script data file " .. name .. " of type " .. type .. " has not been loaded."

			Application.throw_exception(slot4, Application)
		end

		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.script_data(slot4, PackageManager, name.id(type))
	end

	return 
end
CoreWorldInstanceManager.unregister_input_elements = function (self, mission_id)
	self._registered_input_elements[mission_id] = {}

	return 
end
CoreWorldInstanceManager.unregister_output_event_elements = function (self, mission_id)
	self._registered_output_event_elements[mission_id] = {}

	return 
end
CoreWorldInstanceManager.register_input_element = function (self, mission_id, instance_name, instance_input, mission_element)
	self._registered_input_elements[mission_id] = self._registered_input_elements[mission_id] or {}
	local t = self._registered_input_elements[mission_id]
	t[instance_name] = t[instance_name] or {}
	t[instance_name][instance_input] = t[instance_name][instance_input] or {}
	slot9 = mission_element

	table.insert(t[instance_name][instance_input] or , t[instance_name][instance_input])

	return 
end
CoreWorldInstanceManager.get_registered_input_elements = function (self, mission_id, instance_name, instance_input)
	local t = self._registered_input_elements[mission_id]

	if not t then
		return nil
	end

	if not t[instance_name] then
		return nil
	end

	if not t[instance_name][instance_input] then
		return nil
	end

	return t[instance_name][instance_input]
end
CoreWorldInstanceManager.register_output_event_element = function (self, mission_id, instance_name, instance_output, mission_element)
	self._registered_output_event_elements[mission_id] = self._registered_output_event_elements[mission_id] or {}
	local t = self._registered_output_event_elements[mission_id]
	t[instance_name] = t[instance_name] or {}
	t[instance_name][instance_output] = t[instance_name][instance_output] or {}
	slot9 = mission_element

	table.insert(t[instance_name][instance_output] or , t[instance_name][instance_output])

	return 
end
CoreWorldInstanceManager.get_registered_output_event_elements = function (self, mission_id, instance_name, instance_output)
	local t = self._registered_output_event_elements[mission_id]

	if not t then
		return nil
	end

	if not t[instance_name] then
		return nil
	end

	if not t[instance_name][instance_output] then
		return nil
	end

	return t[instance_name][instance_output]
end
CoreWorldInstanceManager.set_instance_params = function (self, mission_id, instance_name, params)
	self._instance_params[mission_id] = self._instance_params[mission_id] or {}
	self._instance_params[mission_id][instance_name] = params

	return 
end
CoreWorldInstanceManager.remove_instance_params = function (self, mission_id)
	self._instance_params[mission_id] = {}

	return 
end
CoreWorldInstanceManager.get_instance_param = function (self, mission_id, instance_name, var_name)
	if not self._instance_params[mission_id] then
		return nil
	end

	if not self._instance_params[mission_id][instance_name] then
		return nil
	end

	return self._instance_params[mission_id][instance_name][var_name]
end
CoreWorldInstanceManager.sync_save = function (self, data)
	local state = {
		instance_params = self._instance_params
	}
	data.CoreWorldInstanceManager = state

	return 
end
CoreWorldInstanceManager.sync_load = function (self, data)
	local state = data.CoreWorldInstanceManager

	if state then
		self._instance_params = state.instance_params
	end

	return 
end
CoreWorldInstanceManager.on_simulation_ended = function (self)
	self._registered_input_elements = {}
	self._registered_output_event_elements = {}
	self._instance_params = {}

	return 
end
CoreWorldInstanceManager.clear = function (self)
	self._instance_data = {}

	return 
end

return 
