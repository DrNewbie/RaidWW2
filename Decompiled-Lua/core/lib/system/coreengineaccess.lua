slot3 = "CoreEngineAccess"

core.module(slot1, core)

local function get_class_table(engine_class_name)
	slot4 = engine_class_name
	local class_table = rawget(slot2, _G)

	if class_table then
		return class_table, nil
	else
		slot6 = engine_class_name

		return nil, string.format(slot4, "Engine-side class not found: \"%s\".")
	end

	return 
end

local function get_method_table(engine_class_name)
	slot3 = engine_class_name
	local class_table, problem = get_class_table(slot2)

	if problem then
		return nil, problem
	end

	slot5 = class_table
	local class_meta_table = getmetatable(slot4)

	if class_meta_table == nil then
		slot8 = engine_class_name

		return nil, string.format(slot6, "Global \"%s\" is not bound to a class table.")
	end

	slot7 = "__index"
	local method_table = rawget(slot5, class_meta_table)

	if method_table == nil then
		slot9 = engine_class_name

		return nil, string.format(slot7, "Metatable for class \"%s\" does not have an __index member.")
	end

	slot7 = method_table

	if type(slot6) ~= "table" then
		slot9 = engine_class_name

		return nil, string.format(slot7, "Metatable for class \"%s\" does not use a table for indexing methods.")
	end

	return method_table, nil
end

local function hide_static_engine_method(engine_class_name, method_name, message)
	slot6 = "Invalid argument list."

	assert(slot4, engine_class_name and method_name)

	local function failure_func(failure_message)
		return function (...)
			slot7 = failure_message

			error(string.format(slot3, "Failed to call hidden method %s:%s(...). %s", engine_class_name, method_name))

			return 
		end
	end

	slot6 = engine_class_name
	local method_table, problem = get_method_table(engine_class_name and method_name)

	if problem then
		slot8 = problem

		return failure_func(slot7)
	end

	local method = method_table[method_name]
	slot9 = method

	if type(slot8) ~= "function" then
		slot9 = "Method not found."

		return failure_func(slot8)
	end

	method_table[method_name] = function ()
		slot7 = message or "You should not call it directly."

		error(string.format(slot3, "%s:%s(...) has been hidden by core. %s", engine_class_name, method_name))

		return 
	end
	slot11 = engine_class_name
	local class_table = assert(get_class_table(slot10))

	return function (...)
		slot2 = class_table

		return method(slot1, ...)
	end
end

if not __required then
	__required = true
	slot7 = "Use CoreSetup:exec(...) instead!"
	_exec = hide_static_engine_method(slot4, "Application", "exec")
	slot7 = "Use CoreSetup:quit(...) instead!"
	_quit = hide_static_engine_method(slot4, "Application", "quit")
	slot6 = "editor_package"
	_editor_package = hide_static_engine_method(slot4, "PackageManager")
	slot6 = "editor_load"
	_editor_load = hide_static_engine_method(slot4, "PackageManager")
	slot6 = "editor_reload"
	_editor_reload = hide_static_engine_method(slot4, "PackageManager")
	slot6 = "editor_reload_node"
	_editor_reload_node = hide_static_engine_method(slot4, "PackageManager")
	slot6 = "editor_unit_data"
	_editor_unit_data = hide_static_engine_method(slot4, "PackageManager")
end

return 
