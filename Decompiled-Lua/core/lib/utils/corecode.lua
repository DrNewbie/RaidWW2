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
slot3 = "CoreCode"

core.module(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

local function open_lua_source_file(source)

	-- Decompilation error in this vicinity:
	slot3 = DB

	if DB.is_bundled(slot2) then
		return "[N/A in bundle]"
	end

	local entry_type = Idstring(slot2)
	slot5 = "([^.]*)"
	local entry_name = source.match("lua_source", source).lower("lua_source")
	slot6 = entry_type
	slot9 = entry_name
end

function get_prototype(info)
	if info.source == "=[C]" then
		return "(C++ method)"
	end

	local prototype = info.source
	slot4 = info.source
	local source_file = open_lua_source_file(slot3)

	if source_file then
		for i = 1, info.linedefined, 1 do
			slot9 = source_file
			prototype = source_file.gets(slot8)
		end

		slot5 = source_file

		source_file.close(slot4)
	end

	return prototype
end

function get_source(info)
	if info.source == "=[C]" then
		return "(C++ method)"
	end

	slot3 = info.source
	local source_file = open_lua_source_file(slot2)
	local lines = {}

	for i = 1, info.linedefined - 1, 1 do
		local line = source_file.gets(slot8)
		slot11 = "^%s*%-%-"

		if line.match(source_file, line) then
			slot11 = line

			table.insert(slot9, lines)
		else
			lines = {}
		end
	end

	for i = info.linedefined, info.lastlinedefined, 1 do
		slot9 = lines
		slot12 = source_file

		table.insert(slot8, source_file.gets(slot11))
	end

	slot5 = source_file

	source_file.close(slot4)

	slot6 = "\n"

	return table.concat(slot4, lines)
end

function traceback(max_level)
	max_level = max_level or 2
	local level = 2

	while true do
		slot5 = "Sl"
		local info = debug.getinfo(slot3, level)

		if not info or max_level + 2 <= level then
			break
		end

		if info.what == "C" then
			slot7 = "C function"

			CoreDebug.cat_print(slot4, "debug", level)
		else
			slot5 = "debug"
			slot10 = info.currentline

			CoreDebug.cat_print(slot4, string.format(slot7, "[%s]:%d", info.source))
		end

		level = level + 1
	end

	return 
end

function alive(obj)
	if obj then
		slot3 = obj

		if obj.alive(slot2) then
			return true
		end
	end

	return false
end

function deprecation_warning(method_name, breaking_release_name)
	slot4 = "debug"
	slot9 = breaking_release_name or "a future release"

	CoreDebug.cat_print(slot3, string.format(slot6, "DEPRECATION WARNING: %s will be removed in %s", method_name))

	return 
end

local function sort_iterator(t, raw)
	local sorted = {}
	slot5 = t

	for k, v in pairs(slot4) do
		sorted[#sorted + 1] = k
	end

	function slot6(a, b)
		slot4 = a

		if type(slot3) == "number" then
			slot4 = b

			if type(slot3) == "number" then
				return a < b
			else
				return true
			end
		else
			slot4 = b

			if type(slot3) == "number" then
				return false
			end
		end

		slot5 = b

		return tostring(slot3) < tostring(a)
	end

	table.sort(slot4, sorted)

	local index = 0

	return function ()
		index = index + 1
		local k = sorted[index]

		if raw then
			slot5 = k

			return k, rawget(slot3, t)
		else
			return k, t[k]
		end

		return 
	end
end

function line_representation(x, seen, raw)
	slot5 = DB

	if DB.is_bundled(slot4) then
		return "[N/A in bundle]"
	end

	local w = 60
	slot6 = x

	if type(slot5) == "userdata" then
		slot6 = x

		return tostring(slot5)
	else
		slot6 = x

		if type(slot5) == "table" then
			seen = seen or {}

			if seen[x] then
				return "..."
			end

			seen[x] = true
			local r = "{"
			slot8 = raw

			for k, v in sort_iterator(slot6, x) do
				slot15 = raw
				slot17 = raw
				r = r .. line_representation(r, k, seen) .. "=" .. line_representation(seen, v, seen) .. ", "

				if w < r.len(line_representation(r, k, seen)) then
					slot14 = w
					r = r.sub(slot11, r, 1)
					r = r .. "..."

					break
				end
			end

			r = r .. "}"

			return r
		else
			slot6 = x

			if type(slot5) == "string" then
				slot8 = "\\n"
				x = string.gsub(slot5, x, "\n")
				slot8 = "\\r"
				x = string.gsub(slot5, x, "\r")
				slot8 = "\\t"
				x = string.gsub(slot5, x, "\t")
				slot6 = x

				if w < x.len(slot5) then
					slot8 = w
					x = x.sub(slot5, x, 1) .. "..."
				end

				return x
			else
				slot6 = x

				if type(slot5) == "function" then
					slot6 = x
					local info = debug.getinfo(slot5)

					if info.source == "=[C]" then
						return "(C++ method)"
					else
						slot9 = info
						slot9 = raw

						return line_representation(slot6, get_prototype(slot8), nil)
					end
				else
					slot6 = x

					return tostring(slot5)
				end
			end
		end
	end

	return 
end

function full_representation(x, seen)
	slot4 = DB

	if DB.is_bundled(slot3) then
		return "[N/A in bundle]"
	end

	slot4 = x

	if type(slot3) == "function" then
		local info = debug.getinfo(slot3)
		slot5 = info

		return get_source(x)
	else
		slot4 = x

		if type(slot3) == "table" then
			slot5 = true

			return ascii_table(slot3, x)
		else
			slot4 = x

			return tostring(slot3)
		end
	end

	return 
end

inspect = full_representation

function properties(x)
	local t = {}
	slot4 = x.__properties

	for i, p in ipairs(slot3) do
		slot9 = x
		t[p] = x[p](slot8)
	end

	slot4 = "debug"
	slot7 = t

	CoreDebug.cat_print(slot3, ascii_table(slot6))

	return 
end

function help(o)
	local methods = {}

	local function add_methods(t)
		slot3 = t

		if type(slot2) == "table" then
			slot3 = t

			for k, v in pairs(slot2) do
				slot8 = v

				if type(slot7) == "function" then
					slot9 = "S"
					local info = debug.getinfo(slot7, v)

					if info.source ~= "=[C]" then
						slot9 = info
						local h = get_prototype(slot8)
						local name = k
						k = nil
						slot12 = "= function"

						if h.match(slot10, h) then
							k = name
						end

						if not k then
							slot12 = ":(.*)"
							k = h.match(slot10, h)
						end

						if not k then
							slot12 = "%.(.*)"
							k = h.match(slot10, h)
						end

						k = k or h
					end

					slot11 = 40 - #k
					k = k .. string.rep(slot9, " ")

					if info.what == "Lua" then
						k = k .. "(" .. info.source .. ":" .. info.linedefined .. ")"
					else
						k = k .. "(C++ function)"
					end

					methods[k] = true
				end
			end
		end

		slot3 = t

		if getmetatable(slot2) then
			slot5 = t

			add_methods(getmetatable(slot4))
		end

		return 
	end

	add_methods(slot4)

	local sorted_methods = {}
	slot6 = methods

	for k, v in pairs(o) do
		slot12 = k

		table.insert(slot10, sorted_methods)
	end

	slot6 = sorted_methods

	table.sort(slot5)

	slot6 = sorted_methods

	for i, name in ipairs(slot5) do
		slot12 = name

		CoreDebug.cat_print(slot10, "debug")
	end

	return 
end

function ascii_table(t, raw)
	local out = ""
	local klen = 20
	local vlen = 20
	slot7 = t

	for k, v in pairs(slot6) do
		slot14 = raw
		local kl = line_representation(slot11, k, nil).len(slot11) + 2
		slot15 = raw
		slot13 = line_representation(line_representation(slot11, k, nil), v, nil)
		local vl = line_representation(line_representation(slot11, k, nil), v, nil).len(line_representation(slot11, k, nil)) + 2

		if klen < kl then
			klen = kl
		end

		if vlen < vl then
			vlen = vl
		end
	end

	slot9 = klen + vlen + 5
	out = out .. "-".rep(slot7, "-") .. "\n"
	slot8 = raw

	for k, v in sort_iterator("-".rep(slot7, "-"), t) do
		slot16 = raw
		slot18 = raw
		slot17 = vlen
		out = out .. "| " .. line_representation(slot13, k, nil).left(slot13, line_representation(slot13, k, nil)) .. "| " .. line_representation(klen, v, nil).left(klen, line_representation(klen, v, nil)) .. "|\n"
	end

	slot9 = klen + vlen + 5
	out = out .. "-".rep(slot7, "-") .. "\n"

	return out
end

function memory_report(limit)
	local seen = {}
	local count = {}
	local name = {
		_G = _G
	}
	slot6 = _G

	for k, v in pairs(slot5) do

		-- Decompilation error in this vicinity:
		slot11 = v
	end

	local function simple(item)
		slot3 = item
		local t = type(slot2)

		if t == "table" then
			return false
		end

		if t == "userdata" then
			slot4 = t

			return getmetatable(slot3)
		end

		return true
	end

	local function recurse(item, parent, key)

		-- Decompilation error in this vicinity:
		slot5 = item
		seen[index] = true

		if not name[index] then
			slot7 = item
			local t = name[getmetatable(slot6)] or parent .. "/" .. key
		end

		count[t] = (count[t] or 0) + 1
		slot7 = item

		if type((count[t] or 0) + 1) == "table" then
			slot7 = item

			for k, v in pairs(slot6) do
				count[t .. "/*"] = (count[t .. "/*"] or 0) + 1
				slot12 = v

				if not simple(slot11) and not seen[v] then
					slot13 = t
					slot16 = k

					recurse(slot11, v, tostring(slot15))
				end
			end
		end

		slot7 = item

		if CoreClass.type_name(slot6) == "Unit" then
			slot9 = item

			for _, e in ipairs(item.extensions(slot8)) do
				slot14 = item
				slot14 = e

				recurse(slot11, item[e](slot13), t)
			end
		end

		slot7 = item

		if getmetatable(slot6) then
			slot8 = item

			if not seen[getmetatable(slot7)] then
				slot9 = item
				slot9 = "metatable"

				recurse(slot6, getmetatable(slot8), t)
			end
		end

		return 
	end

	recurse(slot7, _G, nil)

	slot8 = World
	local units = World.unit_manager(slot7).get_units(slot7)
	slot10 = "win32"
	local is_windows = SystemInfo.platform(World.unit_manager(slot7)) == Idstring(SystemInfo)
	slot10 = units

	for _, u in ipairs(slot9) do

		-- Decompilation error in this vicinity:
		slot13 = recurse
		slot15 = u
		slot16 = "Units"
		slot18 = u

		slot13(slot14, slot15, slot16, slot17)
	end

	local total = 0
	local res = {}
	slot12 = count

	for k, v in pairs(slot11) do
		total = total + v

		if (limit or 100) < v then
			slot20 = k
			res[#res + 1] = string.format(slot17, "%6i  %s", v)
		end
	end

	slot12 = res

	table.sort(slot11)

	slot12 = res

	for _, l in ipairs(slot11) do
		slot18 = l

		CoreDebug.cat_print(slot16, "debug")
	end

	slot12 = "debug"
	slot16 = total

	CoreDebug.cat_print(slot11, string.format(slot14, "\n%6i  TOTAL"))

	return 
end

__old_profiled = __old_profiled or {}

if __profiled then
	__old_profiled = __profiled
	slot4 = __profiled

	for k, v in pairs(slot3) do
		slot10 = "profiler remove " .. k

		Application.console_command(slot8, Application)
	end
end

__profiled = {}

function profile(s)

	-- Decompilation error in this vicinity:
	if __profiled[s] then
		return 
	end

	local t = {
		s = s
	}
	slot5 = ":"
	local start, stop = s.find(slot3, s)

	if start then
		slot8 = start - 1
		t.class = s.sub(slot5, s, 0)
		slot7 = stop + 1
		t.name = s.sub(slot5, s)
		slot7 = t.class

		if not rawget(slot5, _G) then
			slot7 = "Could not find class " .. t.class

			CoreDebug.cat_print(slot5, "debug")

			return 
		end

		slot7 = t.class
		t.f = rawget(slot5, _G)[t.name]
		t.patch = function (f)
			_G[t.class][t.name] = f

			return 
		end
	else
		t.name = s
		slot7 = t.name
		t.f = rawget(slot5, _G)
		t.patch = function (f)
			_G[t.name] = f

			return 
		end
	end

	t.instrumented = function (...)
		slot3 = t.s
		local id = Profiler.start(slot1, Profiler)
		res = t.f(...)
		slot4 = id

		Profiler.stop(Profiler, Profiler)

		return res
	end
	slot6 = t.instrumented

	t.patch(slot5)

	__profiled[s] = t
	slot7 = "profiler add " .. s

	Application.console_command(slot5, Application)

	return 
end

function unprofile(s)
	local t = __profiled[s]

	if t then
		slot4 = t.f

		t.patch(slot3)
	end

	slot5 = "profiler remove " .. s

	Application.console_command(slot3, Application)

	__profiled[s] = nil

	return 
end

function reprofile()
	slot2 = __old_profiled

	for k, v in pairs(slot1) do
		slot7 = k

		profile(slot6)
	end

	__old_profiled = {}

	return 
end

return 
