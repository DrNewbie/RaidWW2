slot3 = "CoreLuaDump"

core.module(slot1, core)

local function string_to_binary(str)
	local out_str = nil
	slot5 = str

	for i = 1, string.len(slot4), 1 do
		out_str = out_str and out_str .. " "
		slot10 = i
		out_str = (out_str or "") .. string.byte(slot8, str)
	end

	return out_str or ""
end

local function dump_collect(tab, t, level, max_level)
	if level < max_level then
		slot6 = tab

		for k, v in pairs(slot5) do
			local k_str = nil
			local v_type = type(slot11)
			slot13 = k

			if type(v) == "userdata" then
				slot13 = k
				local meta = getmetatable(slot12)

				if meta and meta.tostring then
					slot14 = k
					k_str = meta.tostring(slot13)
				else
					slot15 = {}
					k_str = "(" .. tostring(slot14) .. ") UNKNOWN"
				end
			else
				slot13 = k
				k_str = tostring(slot12)
			end

			if level == 0 then
				slot14 = "Dumping: " .. k_str

				cat_print(slot12, "debug")
			end

			if v == tab then
				slot15 = {}
				t[k_str] = {
					_type = "recursive",
					_value = "(" .. tostring(slot14) .. ") UNKNOWN"
				}
			elseif v_type == "function" then
				slot14 = "S"
				local info = debug.getinfo(slot12, v)

				if info.what == "Lua" then
					t[k_str] = {
						_type = v_type,
						_value = info.source .. ":" .. info.linedefined
					}
				end
			elseif v_type == "table" then
				slot17 = max_level
				t[k_str] = {
					_type = v_type,
					_value = dump_collect(slot13, v, {}, level + 1)
				}
			elseif v_type == "userdata" then
				slot13 = tab
				local meta = getmetatable(slot12)

				if meta and meta.tostring then
					slot14 = tab
					local str = meta.tostring(slot13)
					t[k_str] = {
						_type = v_type,
						_value = str
					}
				else
					slot16 = {}
					t[k_str] = {
						_type = v_type,
						_value = "(" .. tostring(slot15) .. ") UNKNOWN"
					}
				end
			else
				slot14 = v
				t[k_str] = {
					_type = v_type,
					_value = tostring(slot13)
				}
			end
		end
	else
		slot7 = {}
		slot9 = {}
		t["(" .. tostring(slot6) .. ") UNKNOWN"] = {
			_type = "unexplored",
			_value = "(" .. tostring(slot8) .. ") UNKNOWN"
		}
	end

	return t
end

local function write_to_file(file, t, level)
	slot5 = t

	for k, v in pairs(slot4) do
		if v._type == "table" then
			slot15 = k
			slot11 = level .. "<table name=\"" .. string_to_binary(slot14) .. "\">\n"

			file.write(slot9, file)

			slot12 = level .. "\t"

			write_to_file(slot9, file, v._value)

			slot11 = level .. "</table>\n"

			file.write(slot9, file)
		else
			slot17 = k
			slot19 = v._value
			slot11 = level .. "<" .. v._type .. " name=\"" .. string_to_binary(slot16) .. "\" value=\"" .. string_to_binary(slot18) .. "\"/>\n"

			file.write(slot9, file)
		end
	end

	return 
end

local function write_locals(file)
	local i = 1
	local value = 1

	while true do
		slot6 = i
		local name, value = debug.getlocal(slot4, 3)

		if name and value then
			local v_str = nil
			slot8 = value

			if type(slot7) == "userdata" then
				slot8 = value
				local meta = getmetatable(slot7)

				if meta and meta.tostring then
					slot9 = value
					v_str = meta.tostring(slot8)
				else
					slot10 = {}
					v_str = "(" .. tostring(slot9) .. ") UNKNOWN"
				end
			else
				slot8 = value
				v_str = tostring(slot7)
			end

			slot12 = name
			slot14 = v_str
			slot9 = "\t<local name=\"" .. string_to_binary(slot11) .. "\" value=\"" .. string_to_binary(slot13) .. "\"/>\n"

			file.write(slot7, file)

			i = i + 1
		else
			break
		end
	end

	return 
end

function core_lua_dump(file_name, root, max_level, no_bin)
	slot8 = "w"
	local file = File.open(slot5, File, file_name or "lua_dump.xml")
	slot7 = file

	assert(File)

	if no_bin then
		function string_to_binary(str)
			return str
		end
	end

	slot8 = "Starting LUA dump..."

	cat_print(slot6, "debug")

	slot8 = "<lua_dump>\n"

	file.write(slot6, file)

	slot8 = "\t<traceback data=\"" .. string_to_binary(debug.traceback()) .. "\"/>\n"

	file.write(slot6, file)

	slot7 = file

	write_locals(slot6)

	slot13 = max_level or 10

	write_to_file(slot6, file, dump_collect("\t", root or _G, {}, 0))

	slot8 = "</lua_dump>\n"

	file.write(slot6, file)

	slot7 = file

	file.close(slot6)

	slot8 = "LUA dump done!"

	cat_print(slot6, "debug")

	return 
end

return 
