-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreDebug"

core.module(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

Global.render_debug = Global.render_debug or {}
Global.render_debug_initialized = Global.render_debug_initialized or {}

if not Global.render_debug_initialized.coredebug then
	Global.render_debug.draw_enabled = true
	Global.render_debug.render_sky = true
	Global.render_debug.render_world = true
	Global.render_debug.render_overlay = true
	Global.render_debug_initialized.coredebug = true
end

function only_in_debug(f, klass)
	if not klass then
		slot4 = Application
		klass = getmetatable(slot3)
	end

	local old = "old_" .. f

	if not klass[old] then
		klass[old] = klass[f]
		klass[f] = function (...)
			if Global.render_debug.draw_enabled then
				klass[old](...)
			end

			return 
		end
	end

	return 
end

slot2 = "draw"

only_in_debug(slot1)

slot2 = "draw_sphere"

only_in_debug(slot1)

slot2 = "draw_line"

only_in_debug(slot1)

slot2 = "draw_cone"

only_in_debug(slot1)

slot2 = "draw_circle"

only_in_debug(slot1)

slot2 = "draw_rotation"

only_in_debug(slot1)

slot2 = "draw_cylinder"

only_in_debug(slot1)

slot2 = "draw_line_unpaused"

only_in_debug(slot1)

slot2 = "draw_sphere_unpaused"

only_in_debug(slot1)

slot2 = "draw_rotation_size"

only_in_debug(slot1)

slot2 = "draw_arrow"

only_in_debug(slot1)

slot2 = "draw_link"

only_in_debug(slot1)

slot3 = Pen

only_in_debug(slot1, "arrow")

Global.category_print = Global.category_print or {}
Global.category_print_initialized = Global.category_print_initialized or {}

if not Global.category_print_initialized.coredebug then
	Global.category_print.debug = true
	Global.category_print.editor = false
	Global.category_print.sequence = false
	Global.category_print.controller_manager = false
	Global.category_print.game_state_machine = false
	Global.category_print.subtitle_manager = false
	Global.category_print_initialized.coredebug = true
end

function out(...)
	local CAT_TYPE = "debug"
	local NO_CAT = "spam"
	local args = {
		...
	}

	local function correct_spaces(...)
		local args = {
			...
		}
		local sel = {}
		slot4 = 2
		sel[MULTRES] = select(slot3, ...)
		slot6 = sel[1]
		sel[1] = args[1] .. " " .. tostring(slot5)
		slot4 = sel

		return unpack(" ")
	end

	local function do_print(c, ...)
		local cat = CAT_TYPE
		local args = {
			...
		}
		slot5 = Global.category_print

		for k, _ in pairs(slot4) do
			if k == c then
				cat = c

				break
			end
		end

		slot5 = cat

		cat_print(slot4, ...)

		return 
	end

	if #args == 0 then
		return 
	elseif 1 < #args then
		slot7 = args[1]
	else
		slot7 = NO_CAT
		slot10 = "[" .. NO_CAT .. "]"
		slot13 = args

		do_print(slot6, correct_spaces(slot9, unpack("]")))
	end

	return 
end

function cat_print(cat, ...)
	if Global.category_print[cat] then
		_G.print(...)
	end

	return 
end

function cat_debug(cat, ...)
	if Global.category_print[cat] then
		slot3 = Application

		Application.debug(slot2, ...)
	end

	return 
end

function cat_error(cat, ...)
	if Global.category_print[cat] then
		slot3 = Application

		Application.error(slot2, ...)
	end

	return 
end

function cat_stack_dump(cat)
	if Global.category_print[cat] then
		slot3 = Application

		Application.stack_dump(slot2)
	end

	return 
end

function cat_print_inspect(cat, ...)
	if Global.category_print[cat] then
		slot3 = {
			...
		}

		for _, var in ipairs(slot2) do
			slot8 = cat
			slot11 = var

			cat_print(slot7, CoreCode.inspect(slot10))
		end
	end

	return 
end

function cat_debug_inspect(cat, ...)
	if Global.category_print[cat] then
		slot3 = {
			...
		}

		for _, var in ipairs(slot2) do
			slot14 = var
			slot9 = "\n" .. tostring(CoreCode.inspect(slot13))

			cat_debug(slot7, cat)
		end
	end

	return 
end

function catprint_save()
	local data = {
		_meta = "categories"
	}
	slot3 = Global.category_print

	for name, allow_print in pairs(slot2) do
		if Global.original_category_print[name] ~= allow_print then
			slot9 = {
				_meta = "category",
				name = name,
				print = allow_print
			}

			table.insert(slot7, data)
		end
	end

	local path = managers.database.base_path(slot2) .. "settings/catprint.catprint"
	slot6 = "w"
	local file = SystemFS.open(managers.database, SystemFS, path)
	slot5 = file
	slot9 = data

	file.print(SystemFS, ScriptSerializer.to_custom_xml(slot7, ScriptSerializer))

	slot5 = file

	file.close(SystemFS)

	return 
end

function catprint_load()
	if not Global.original_category_print then
		Global.original_category_print = {}
		slot2 = Global.category_print

		for category, default in pairs() do
			Global.original_category_print[category] = default
		end
	end

	local file_path = "settings/catprint"
	local file_extension = "catprint"
	slot6 = file_path

	if DB.has(slot3, DB, file_extension) then
		slot6 = file_path
		local xml = DB.open(slot3, DB, file_extension).read(slot3)
		slot6 = xml
		local data = ScriptSerializer.from_custom_xml(DB.open(slot3, DB, file_extension), ScriptSerializer)
		slot6 = data

		for _, sub_data in ipairs(ScriptSerializer) do
			slot11 = sub_data.name
			local name = tostring(slot10)
			local allow_print = sub_data.print == true
			Global.category_print[name] = allow_print
		end
	end

	return 
end

function print_console_result(...)
	slot3 = "#"

	for i = 1, select(slot2, ...), 1 do
		slot6 = "debug"
		slot11 = i

		cat_print(slot5, CoreCode.full_representation(select(slot10, ...)))
	end

	return 
end

function compile_and_reload()
	local function root_path()
		local path = Application.base_path(slot1) .. (CoreApp.arg_value(Application) or "../../")
		local f = nil

		function f(s)

			-- Decompilation error in this vicinity:
			slot5 = ""
			local str, i = string.gsub(slot2, s, "\\[%w_%.%s]+\\%.%.")
		end

		slot4 = path

		return f("-assetslocation")
	end

	slot6 = "WIN32"
	slot4 = "You can only compile on win32 platforms!"

	assert(slot2, SystemInfo.platform(slot4) == Idstring(SystemInfo))

	slot4 = {
		target_db_name = "all",
		preprocessor_definitions = "preprocessor_definitions",
		verbose = false,
		platform = string.lower(SystemInfo.platform(slot8).s(slot8)),
		source_root = root_path() .. "//assets",
		target_db_root = Application.base_path("//assets") .. "assets"
	}
	slot9 = SystemInfo
	slot9 = SystemInfo.platform(slot8)
	slot7 = Application

	Application.data_compile(slot2, Application)

	slot3 = DB

	DB.reload(slot2)

	slot4 = "reload"

	Application.console_command(slot2, Application)

	return 
end

function class_name(class)
	slot4 = class

	return core._lookup(slot2, core)
end

function full_class_name(class)
	slot3 = class
	local x, y = class_name(slot2)

	return y .. "." .. x
end

function watch(cond_func, exact)
	slot6 = 1

	debug.sethook(slot3, function ()
		if cond_func() then
			if exact then
				slot2 = "debug"
				slot9 = "__watch_previnfo"
				slot6 = rawget(slot7, _G) or "? : -1"

				cat_print(slot1, string.format(slot4, "[CoreVarTrace] %s"))
			else
				slot3 = "Sl"
				local src = debug.getinfo(slot1, 2)
				slot4 = "[CoreVarTrace] Probably file: " .. ((src and src.source) or "?")

				cat_print(slot2, "debug")

				slot4 = "[CoreVarTrace] Might be line: " .. ((src and src.currentline) or -1)

				cat_print(slot2, "debug")
			end

			slot2 = "debug"

			cat_print(slot1, debug.traceback())
			debug.sethook()
		end

		if exact then
			slot3 = "Sl"
			local src = debug.getinfo(slot1, 2)

			if src then
				slot4 = "__watch_previnfo"
				slot9 = src.currentline or -1

				rawset(slot2, _G, string.format(slot6, "%s : %i", src.source or "?"))
			end
		end

		return 
	end, "l")

	return 
end

function trace_ref(class_name, init_name, destroy_name)

	-- Decompilation error in this vicinity:
	slot5 = class_name
	slot9 = "_" .. destroy_name

	if not rawget(slot7, class_mt) then
		slot9 = "_" .. destroy_name
		slot15 = destroy_name

		rawset(slot7, class_mt, assert(rawget(slot13, class_mt)))

		function slot10(...)
			ref()

			local p = {
				...
			}
			local o = p[2]

			if o and o.alive then
				slot4 = o
			else
				slot6 = o

				cat_print(slot3, "debug", "[CoreTraceRef] Delete ref:")
			end

			slot5 = "_" .. destroy_name
			local r = 
			-- Decompilation error in this vicinity:
			rawget(slot3, class_mt)(...)
			slot6 = "_trace_ref_table"
			local t = rawget(class_mt, _G)
			t[o] = nil

			return r
		end

		rawset(slot7, class_mt, destroy_name)
	end

	slot9 = "_destroy"

	if not rawget(slot7, _G) then
		slot9 = "_destroy"
		slot13 = "destroy"

		rawset(slot7, _G, rawget(slot11, _G))

		function slot10(...)
			ref()

			slot3 = "_destroy"
			local d = rawget(slot1, _G)

			if d then
				d(...)
			end

			local c = 0
			slot7 = "_trace_ref_table"
			local t = assert(rawget(slot5, _G))
			slot5 = t

			for k, v in pairs(rawget) do
				c = c + 1
			end

			slot5 = "debug"
			slot9 = c

			cat_print(slot4, string.format(slot7, "[CoreTraceRef] ---------------------- %i Script References Lost --------------------------"))

			slot5 = t

			for k, v in pairs(slot4) do
				slot13 = v

				cat_print(slot9, "debug", "[CoreTraceRef]", k)
			end

			return 
		end

		rawset(slot7, _G, "destroy")
	end

	return 
end

function trace_ref_add_destroy_all(class_name, func_name)

	-- Decompilation error in this vicinity:
	slot4 = class_name

	return 
end

function debug_pause(...)
	return 
end

function debug_pause_unit(unit, ...)
	return 
end

return 
