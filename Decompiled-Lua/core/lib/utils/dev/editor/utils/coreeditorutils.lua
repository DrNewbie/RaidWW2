slot3 = "CoreEditorUtils"

core.module(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

function all_lights()
	local lights = {}
	slot4 = "all"
	local all_units = World.find_units_quick(slot2, World)
	slot4 = all_units

	for _, unit in ipairs(World) do
		slot11 = unit
		slot14 = "light"

		for _, light in ipairs(unit.get_objects_by_type(slot10, Idstring(slot13))) do
			slot15 = light

			table.insert(slot13, lights)
		end
	end

	return lights
end

function get_editable_lights(unit)
	slot3 = unit
	slot6 = "light"
	local has_lights = 0 < #unit.get_objects_by_type(slot2, Idstring(slot5))

	if not has_lights then
		return nil
	end

	local lights = {}
	local object_file = unit.model_filename(slot4)
	slot8 = object_file

	if DB.has(unit, DB, "object") then
		slot8 = object_file
		local node = DB.load_node(slot5, DB, "object")
	end

	if node then
		slot7 = node

		for child in node.children(slot6) do
			slot11 = child

			if child.name(slot10) == "lights" then
				slot11 = child

				for light in child.children(slot10) do
					slot16 = "editable"

					if light.has_parameter(slot14, light) then
						slot16 = "editable"

						if light.parameter(slot14, light) == "true" then
							slot15 = lights
							slot18 = unit
							slot24 = "name"

							table.insert(slot14, unit.get_object(slot17, Idstring(light.parameter(slot22, light))))
						end
					end
				end
			end
		end
	end

	return lights
end

function has_editable_lights(unit)
	slot3 = unit
	local lights = get_editable_lights(slot2)

	return lights and 0 < #lights
end

function has_any_projection_light(unit)
	slot3 = unit
	slot6 = "light"
	local has_lights = 0 < #unit.get_objects_by_type(slot2, Idstring(slot5))

	if not has_lights then
		return nil
	end

	slot5 = "shadow_projection"

	if not has_projection_light(slot3, unit) then
		slot5 = "projection"
		slot2 = has_projection_light(slot3, unit)
	end

	return slot2
end

function has_projection_light(unit, type)
	type = type or "projection"
	slot6 = unit
	slot6 = unit.name(slot5)
	local object_file = CoreEngineAccess._editor_unit_data(unit.name(slot5).id(slot5)).model(slot3)
	slot7 = object_file

	if DB.has(CoreEngineAccess._editor_unit_data(unit.name(slot5).id(slot5)), DB, "object") then
		slot7 = object_file
		local node = DB.load_node(slot4, DB, "object")
	end

	if node then
		slot6 = node

		for child in node.children(slot5) do
			slot10 = child

			if child.name(slot9) == "lights" then
				slot10 = child

				for light in child.children(slot9) do
					slot15 = type

					if light.has_parameter(slot13, light) then
						slot15 = type

						if light.parameter(slot13, light) == "true" then
							slot15 = "name"

							return light.parameter(slot13, light)
						end
					end
				end
			end
		end
	end

	return nil
end

function is_projection_light(unit, light, type)
	type = type or "projection"
	slot7 = unit
	slot7 = unit.name(slot6)
	local object_file = CoreEngineAccess._editor_unit_data(unit.name(slot6).id(slot6)).model(slot4)
	slot8 = object_file

	if DB.has(CoreEngineAccess._editor_unit_data(unit.name(slot6).id(slot6)), DB, "object") then
		slot8 = object_file
		local node = DB.load_node(slot5, DB, "object")
	end

	if node then
		slot7 = node

		for child in node.children(slot6) do
			slot11 = child

			if child.name(slot10) == "lights" then
				slot11 = child

				for light_node in child.children(slot10) do
					slot16 = type

					if light_node.has_parameter(slot14, light_node) then
						slot16 = type

						if light_node.parameter(slot14, light_node) == "true" then
							slot15 = light
							slot19 = "name"

							if light.name(slot14) == Idstring(light_node.parameter(slot17, light_node)) then
								return true
							end
						end
					end
				end
			end
		end
	end

	return false
end

function intensity_value()
	local t = {}
	slot5 = LightIntensityDB

	for _, intensity in ipairs(LightIntensityDB.list(slot4)) do
		slot8 = t
		slot12 = intensity

		table.insert(slot7, LightIntensityDB.lookup(slot10, LightIntensityDB))
	end

	slot3 = t

	table.sort(slot2)

	return t
end

INTENSITY_VALUES = intensity_value()

function get_intensity_preset(multiplier)
	slot4 = multiplier
	local intensity = LightIntensityDB.reverse_lookup(slot2, LightIntensityDB)
	slot4 = intensity

	if intensity.s(LightIntensityDB) ~= "undefined" then
		return intensity
	end

	local intensity_values = INTENSITY_VALUES

	for i = 1, #intensity_values, 1 do
		local next = intensity_values[i + 1]
		local this = intensity_values[i]

		if not next then
			slot12 = this

			return LightIntensityDB.reverse_lookup(slot10, LightIntensityDB)
		end

		if this < multiplier and multiplier < next then
			if multiplier - this < next - multiplier then
				slot12 = this

				return LightIntensityDB.reverse_lookup(slot10, LightIntensityDB)
			else
				slot12 = next

				return LightIntensityDB.reverse_lookup(slot10, LightIntensityDB)
			end
		elseif multiplier < this then
			slot12 = this

			return LightIntensityDB.reverse_lookup(slot10, LightIntensityDB)
		end
	end

	return 
end

function get_sequence_files_by_unit(unit, sequence_files)
	slot8 = unit
	slot5 = sequence_files

	_get_sequence_file(slot3, CoreEngineAccess._editor_unit_data(unit.name(slot7)))

	return 
end

function get_sequence_files_by_unit_name(unit_name, sequence_files)
	slot6 = unit_name

	_get_sequence_file(slot3, CoreEngineAccess._editor_unit_data(sequence_files))

	return 
end

function _get_sequence_file(unit_data, sequence_files)
	slot6 = unit_data

	for _, unit_name in ipairs(unit_data.unit_dependencies(slot5)) do
		slot11 = unit_name

		_get_sequence_file(slot8, CoreEngineAccess._editor_unit_data(sequence_files))
	end

	slot4 = sequence_files
	slot7 = unit_data

	table.insert(slot3, unit_data.sequence_manager_filename(slot6))

	return 
end

GrabInfo = GrabInfo or CoreClass.class()
function GrabInfo:init(o, pos, rot)
	if not pos then
		slot6 = o
		slot4 = o.position(slot5)
	end

	self._pos = slot4

	if not rot then
		slot6 = o
		slot4 = o.rotation(slot5)
	end

	self._rot = slot4

	return 
end
function GrabInfo:rotation()
	return self._rot
end
function GrabInfo:position()
	return self._pos
end
layer_types = layer_types or {}

function parse_layer_types()
	slot6 = "core/settings/editor_types"

	assert(slot1, DB.has("Editor type settings are missing from core settings.", DB, "xml"))

	slot4 = "core/settings/editor_types"
	local node = DB.load_node(slot1, DB, "xml")
	slot3 = node

	for layer in node.children(DB) do
		slot8 = layer
		layer_types[layer.name(slot7)] = {}
		slot7 = layer

		for type in layer.children(layer.name(slot7)) do
			slot14 = layer
			slot11 = layer_types[layer.name(slot13)]
			slot15 = "value"

			table.insert(slot10, type.parameter(slot13, type))
		end
	end

	slot5 = "settings/editor_types"

	if DB.has(slot2, DB, "xml") then
		slot5 = "settings/editor_types"
		local node = DB.load_node(slot2, DB, "xml")
		slot4 = node

		for layer in node.children(DB) do
			slot9 = layer
			layer_types[layer.name(slot8)] = {}
			slot8 = layer

			for type in layer.children(layer.name(slot8)) do
				slot15 = layer
				slot12 = layer_types[layer.name(slot14)]
				slot16 = "value"

				table.insert(slot11, type.parameter(slot14, type))
			end
		end
	end

	return 
end

function layer_type(layer)
	return layer_types[layer]
end

function get_layer_types()
	return layer_types
end

function toolbar_toggle(data, event)
	local c = data.class
	slot5 = data.toolbar
	local toolbar = (_G.type_name(slot4) == "string" and c[data.toolbar]) or data.toolbar
	slot7 = toolbar
	slot10 = event
	c[data.value] = toolbar.tool_state(slot6, event.get_id(slot9))

	if c[data.menu] then
		slot9 = event

		c[data.menu].set_checked(slot5, c[data.menu], event.get_id(c[data.value]))
	end

	return 
end

function toolbar_toggle_trg(data)
	local c = data.class
	local toolbar = c[data.toolbar]
	slot10 = data.id
	slot7 = not toolbar.tool_state(slot8, toolbar)

	toolbar.set_tool_state(slot4, toolbar, data.id)

	slot7 = data.id
	c[data.value] = toolbar.tool_state(toolbar, toolbar)

	if c[data.menu] then
		slot7 = c[data.value]

		c[data.menu].set_checked(slot4, c[data.menu], data.id)
	end

	return 
end

function dump_mesh(units, name, get_objects_string)
	name = name or "dump_mesh"
	get_objects_string = get_objects_string or "g_*"

	if not units then
		slot6 = "all"
		slot10 = "dump_mesh"
		units = World.find_units_quick(slot4, World, managers.slot.get_mask(slot8, managers.slot))
	end

	local objects = {}
	local lods = {
		"e",
		"_e",
		"d",
		"_d",
		"c",
		"_c",
		"b",
		"_b",
		"a",
		"_a"
	}
	slot8 = "Starting dump mesh"

	cat_print(slot6, "editor")

	slot8 = "  Dumping from " .. #units .. " units"

	cat_print(slot6, "editor")

	slot7 = units

	for _, u in ipairs(slot6) do
		local i = 1
		local objs = {}

		if #objs == 0 then
			slot18 = u
			slot18 = u.name(slot17)
			slot15 = "getting gfx instead of lod for unit " .. u.name(slot17).s(slot17)

			cat_print(slot13, "editor")

			slot15 = get_objects_string
			objs = u.get_objects(slot13, u)
		end

		slot16 = #objs

		cat_print(slot13, "editor", "insert objs")

		slot14 = objs

		for _, o in ipairs(slot13) do
			slot23 = o
			slot23 = o.name(slot22)
			slot20 = "    " .. o.name(slot22).s(slot22)

			cat_print(slot18, "editor")

			slot20 = o

			table.insert(slot18, objects)
		end

		slot15 = "gfx_*"
		objs = u.get_objects(slot13, u)
		slot16 = #objs

		cat_print(slot13, "editor", "insert objs")

		slot14 = objs

		for _, o in ipairs(slot13) do
			slot23 = o
			slot23 = o.name(slot22)
			slot20 = "    " .. o.name(slot22).s(slot22)

			cat_print(slot18, "editor")

			slot20 = o

			table.insert(slot18, objects)
		end
	end

	slot8 = "  Dumped " .. #objects .. " objects"

	cat_print(slot6, "editor")

	slot10 = managers.database
	slot9 = objects
	slot16 = 0
	slot17 = -1
	slot18 = 0

	MeshDumper.dump_meshes(slot6, MeshDumper, managers.database.root_path(#objects) .. name, Rotation(slot11, Vector3(Vector3(1, 0, 0), 1, 0), Vector3(0, 0, -1)))

	return 
end

function dump_all(units, name, get_objects_string)
	name = name or "all_dumped"
	get_objects_string = get_objects_string or "g_*"

	if not units then
		slot6 = "all"
		slot10 = "dump_all"
		units = World.find_units_quick(slot4, World, managers.slot.get_mask(slot8, managers.slot))
	end

	local objects = {}
	slot7 = "Starting dump mesh"

	cat_print(slot5, "editor")

	slot7 = "  Dumping from " .. #units .. " units"

	cat_print(slot5, "editor")

	slot6 = units

	for _, u in ipairs(slot5) do
		local objs = {}
		slot13 = "g_*"
		local all_objs = u.get_objects(slot11, u)

		for i = 5, 0, -1 do
			slot17 = all_objs

			for _, o in ipairs(slot16) do
				slot24 = o
				slot24 = o.name("lod" .. i)

				if string.match(slot21, o.name("lod" .. i).s("lod" .. i)) then
					slot23 = "insert obj"
					slot26 = o
					slot26 = o.name(slot25)

					cat_print(slot21, "editor", o.name(slot25).s(slot25))

					slot23 = o

					table.insert(slot21, objs)

					break
				end
			end

			if 0 < #objs then
				slot18 = "enough lods, time to break"

				cat_print(slot16, "editor")

				break
			end
		end

		if #objs == 0 then
			slot17 = u
			slot17 = u.name(slot16)
			slot14 = "getting gfx instead of lod for unit " .. u.name(slot16).s(slot16)

			cat_print(slot12, "editor")

			slot14 = get_objects_string
			objs = u.get_objects(slot12, u)

			if #objs == 0 then
				slot14 = "gfx_*"
				objs = u.get_objects(slot12, u)
			end
		end

		slot16 = "from unit"
		slot19 = u
		slot19 = u.name(slot18)

		cat_print(slot12, "editor", "insert objs", #objs, u.name(slot18).s(slot18))

		slot13 = objs

		for _, o in ipairs(slot12) do
			slot22 = o
			slot22 = o.name(slot21)
			slot19 = "    " .. o.name(slot21).s(slot21)

			cat_print(slot17, "editor")

			slot19 = o

			table.insert(slot17, objects)
		end
	end

	slot7 = "  Starting dump of " .. #objects .. " objects..."

	cat_print(slot5, "editor")

	slot9 = managers.database
	slot8 = objects
	slot15 = 0
	slot16 = -1
	slot17 = 0

	MeshDumper.dump_meshes(slot5, MeshDumper, managers.database.root_path(#objects) .. name, Rotation(slot10, Vector3(Vector3(1, 0, 0), 1, 0), Vector3(0, 0, -1)))

	slot7 = "  .. dumping done."

	cat_print(slot5, "editor")

	return 
end

function find_unit_references(start, prefix)
	if not start then
		slot5 = "No start point for search provided"

		Application.error(slot3, Application)

		return 
	end

	local results = {}
	local visited = {}
	slot7 = visited

	for name, data in pairs(slot5, start) do
		slot11 = data

		if _G.type(slot10) == "userdata" then
			local s_name = _G.tostring(slot10)
			slot13 = "userdata"

			if not string.find(data, s_name) then
				slot12 = data

				if _G.type_name(slot11) == "Unit" then
					local tt = prefix .. "." .. name
					slot14 = {
						table = tt,
						userdata = data
					}

					table.insert(name, results)
				end
			end
		else
			slot11 = data

			if _G.type(slot10) == "table" then
				slot15 = results

				find_unit_references_recursive(slot10, name, data, visited, prefix)
			end
		end
	end

	slot7 = "Done"

	Application.debug(slot5, Application)

	return results
end

function find_unit_references_recursive(table_name, t, visited, prefix, results)
	slot8 = t

	if table.contains(slot6, visited) then
		return 
	end

	table.insert(slot6, visited)

	slot9 = table_name
	local tt = prefix .. "." .. tostring(t)
	slot8 = t

	for name, data in pairs(tostring(t)) do
		slot13 = data

		if _G.type(slot12) == "userdata" then
			local s_name = _G.tostring(slot12)
			slot15 = "userdata"

			if not string.find(data, s_name) then
				slot14 = data

				if _G.type_name(slot13) == "Unit" then
					slot15 = {
						table = tt,
						userdata = data
					}

					table.insert(slot13, results)
				end
			end
		else
			slot13 = data

			if _G.type(slot12) == "table" then
				slot17 = results

				find_unit_references_recursive(slot12, name, data, visited, tt)
			end
		end
	end

	return 
end

function print_null_refs(references)
	slot3 = references

	for i, ref in ipairs(slot2) do
		slot8 = ref.userdata

		if not alive(slot7) then
			slot9 = i
			slot12 = ref

			Application.debug(slot7, Application, inspect(slot11))
		end
	end

	return 
end

return 
