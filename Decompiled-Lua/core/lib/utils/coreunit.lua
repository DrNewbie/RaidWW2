-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreUnit"

core.module(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

table.get_ray_ignore_args = function (...)
	local arg_list = {}
	slot3 = {
		...
	}

	for _, unit in pairs(slot2) do
		slot8 = unit

		if CoreCode.alive(slot7) then
			slot9 = "ignore_unit"

			table.insert(slot7, arg_list)

			slot9 = unit

			table.insert(slot7, arg_list)
		end
	end

	slot3 = arg_list

	return unpack(slot2)
end

function get_distance_to_body(body, pos)
	local root_obj = body.root_object(slot3)
	slot6 = pos
	local min_dist = root_obj.distance_to_bounding_volume(body, root_obj)
	local child_obj_list = root_obj.children(root_obj)
	slot7 = child_obj_list

	for _, child_obj in ipairs(root_obj) do
		slot13 = pos
		local dist = child_obj.distance_to_bounding_volume(slot11, child_obj)

		if dist < min_dist then
			min_dist = dist
		end
	end

	return min_dist
end

function reload_units(unit_name)
	local units = World.find_units_quick(slot2, World)
	local num_reloads = 0
	slot6 = Idstring(slot7)
	slot9 = unit_name

	PackageManager.reload("all", PackageManager, unit_name.id("unit"))

	slot7 = true

	managers.sequence.reload("all", managers.sequence, unit_name)

	if units then
		local reloaded_units = {}
		slot6 = units

		for i, unit in ipairs(slot5) do
			slot11 = unit
			slot12 = unit_name

			if unit.name(slot10).id(slot10) == unit_name.id(unit.name(slot10)) then
				if not reloaded_units[unit_name] then
					slot11 = Application
					slot14 = unit
					slot14 = unit.material_config(slot13)

					Application.reload_material_config(slot10, unit.material_config(slot13).id(slot13))
				end

				local pos = unit.position(slot10)
				local rot = unit.rotation(unit)
				slot14 = 0

				unit.set_slot(unit, unit)

				slot16 = unit_name
				slot16 = rot

				World.spawn_unit(unit, World, unit_name.id(slot15), pos)

				reloaded_units[unit_name] = true
				num_reloads = num_reloads + 1
			end
		end
	end

	return num_reloads
end

function set_unit_and_children_visible(unit, visible, filter_func)

	-- Decompilation error in this vicinity:
	slot7 = unit

	for _, child in ipairs(unit.children(slot6)) do
		slot12 = filter_func

		set_unit_and_children_visible(slot9, child, visible)
	end

	return 
end

function editor_load_unit(unit_name)
	slot3 = Application

	if Application.editor(slot2) then
		local type_ids = Idstring(slot2)
		local name_ids = unit_name.id("unit")
		slot7 = name_ids

		if not DB.has(unit_name, DB, type_ids) then
			slot7 = name_ids

			Application.error(slot4, Application, "Unit not found in DB")

			slot6 = "error"

			Application.stack_dump(slot4, Application)

			return 
		end

		slot6 = name_ids

		CoreEngineAccess._editor_load(slot4, type_ids)

		return true
	else
		return true
	end

	return 
end

function safe_spawn_unit(unit_name, ...)
	slot3 = unit_name

	if editor_load_unit(slot2) then
		slot6 = unit_name
		slot4 = unit_name.id(slot5)

		return World.spawn_unit(slot2, World, ...)
	end

	return 
end

function safe_spawn_unit_from_package(unit_name, package, ...)
	slot4 = unit_name

	if editor_load_unit(slot3) then
		slot7 = unit_name
		slot6 = package

		return World.spawn_unit_from_package(slot3, World, unit_name.id(slot6), ...)
	end

	return 
end

function safe_spawn_unit_without_extensions(unit_name, ...)
	slot3 = unit_name

	editor_load_unit(slot2)

	slot6 = unit_name
	slot4 = unit_name.id(slot5)

	return World.spawn_unit_without_extensions(slot2, World, ...)
end

return 
