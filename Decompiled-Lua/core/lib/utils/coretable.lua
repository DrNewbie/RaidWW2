-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

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
slot3 = "CoreTable"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

function clone(o)
	local res = {}
	slot4 = o

	for k, v in pairs(slot3) do
		res[k] = v
	end

	slot4 = res
	slot7 = o

	setmetatable(slot3, getmetatable(slot6))

	return res
end

function deep_clone(o)
	slot3 = o

	if type(slot2) == "userdata" then
		return o
	end

	local res = {}
	slot4 = res
	slot7 = o

	setmetatable(slot3, getmetatable(slot6))

	slot4 = o

	for k, v in pairs(slot3) do
		slot9 = v

		if type(slot8) == "table" then
			slot9 = v
			res[k] = deep_clone(slot8)
		else
			res[k] = v
		end
	end

	return res
end

function dpairs(vector_table)
	slot3 = table

	if type(slot2) ~= "table" then
		slot3 = "Expected table got"
		slot6 = vector_table

		error(slot2, type(slot5))
	end

	local t = vector_table
	local i = 0
	local last_size = #t

	return function ()
		if last_size == #t then
			i = i + 1
		end

		local v = t[i]

		if v then
			last_size = #t

			return i, v
		end

		return 
	end
end

table.tuple_iterator = function (v, n)
	local index = 1 - n
	local count = #v

	return function ()
		index = index + n

		if index <= count then
			slot4 = (index + n) - 1

			return unpack(slot1, v, index)
		end

		return 
	end
end
table.sorted_map_iterator = function (map, key_comparator_func)
	slot4 = map
	local sorted_keys = table.map_keys(slot3)
	local index = 0
	local count = #sorted_keys
	slot8 = key_comparator_func

	table.sort(slot6, sorted_keys)

	return function ()
		index = index + 1

		if index <= count then
			local key = sorted_keys[index]

			return key, map[key]
		end

		return 
	end
end
table.map_copy = function (map)
	local copy = {}
	slot4 = map

	for k, v in pairs(slot3) do
		copy[k] = v
	end

	return copy
end
table.deep_map_copy = function (map)
	local copy = {}
	slot4 = map

	for k, v in pairs(slot3) do
		slot9 = v

		if type(slot8) == "table" then
			slot9 = v
			copy[k] = table.deep_map_copy(slot8)
		else
			copy[k] = v
		end
	end

	return copy
end
table.list_copy = function (list)
	local copy = {}
	slot4 = list

	for k, v in ipairs(slot3) do
		copy[k] = v
	end

	return copy
end
table.get_vector_index = function (v, e)
	slot4 = v

	for index, value in ipairs(slot3) do
		if value == e then
			return index
		end
	end

	return 
end
table.delete = function (v, e)
	slot5 = e
	local index = table.get_vector_index(slot3, v)

	if index then
		slot6 = index

		table.remove(slot4, v)
	end

	return 
end
table.exclude = function (t, e)
	local filtered = {}
	slot5 = t

	for _, v in ipairs(slot4) do
		if v ~= e then
			slot11 = v

			table.insert(slot9, filtered)
		end
	end

	return filtered
end
table.equals = function (a, b, value_compare_func)
	value_compare_func = value_compare_func or function (va, vb)
		return va == vb
	end
	local size_a = 0
	slot6 = a

	for k, v in pairs(slot5) do
		size_a = size_a + 1
		slot12 = b[k]

		if value_compare_func(slot10, v) == false then
			return false
		end
	end

	slot6 = b

	return size_a == table.size(slot5)
end
table.contains = function (v, e)
	slot4 = v

	for _, value in pairs(slot3) do
		if value == e then
			return true
		end
	end

	return false
end
table.index_of = function (v, e)
	slot4 = v

	for index, value in ipairs(slot3) do
		if value == e then
			return index
		end
	end

	return -1
end
table.get_key = function (map, wanted_key_value)
	slot4 = map

	for key, value in pairs(slot3) do
		if value == wanted_key_value then
			return key
		end
	end

	return nil
end
table.has = function (v, k)
	slot4 = v

	for key, _ in pairs(slot3) do
		if key == k then
			return true
		end
	end

	return false
end
table.size = function (v)
	local i = 0
	slot4 = v

	for _, _ in pairs(slot3) do
		i = i + 1
	end

	return i
end
table.crop = function (t, size)
	while t[size + 1] do
		slot5 = size + 1

		table.remove(slot3, t)
	end

	return 
end
table.empty = function (v)
	slot3 = v

	return not next(slot2)
end
table.random = function (t)
	slot3 = #t

	return t[math.random(slot2)]
end
table.random_key = function (t)
	slot3 = t

	if not next(slot2) then
		return 
	end

	slot5 = t
	local rand_nr = math.random(table.size(slot4))
	local key = nil

	for i = 1, rand_nr, 1 do
		slot10 = prev_key
		key = next(slot8, t)
	end

	return prev_key
end
table.concat_map = function (map, concat_values, none_string, wrap, sep, last_sep)
	local count = 0

	local function func()
		return none_string
	end

	wrap = wrap or "\""
	sep = sep or ", "
	last_sep = last_sep or " and "
	slot10 = map

	for key, value in pairs(slot9) do
		local last_func = func
		local append_string = nil

		if concat_values then
			slot17 = value
			append_string = tostring(slot16)
		else
			slot17 = key
			append_string = tostring(slot16)
		end

		function func(count, first)
			if count == 1 then
				return wrap .. append_string .. wrap
			elseif first then
				slot5 = false

				return last_func(slot3, count - 1) .. last_sep .. wrap .. append_string .. wrap
			else
				slot5 = false

				return last_func(slot3, count - 1) .. sep .. wrap .. append_string .. wrap
			end

			return 
		end

		count = count + 1
	end

	slot11 = true

	return func(slot9, count)
end
table.ordering = function (prioritized_order_list)
	return function (a, b)
		slot5 = a
		local a_index = table.get_vector_index(slot3, prioritized_order_list)
		slot6 = b
		local b_index = table.get_vector_index(prioritized_order_list, prioritized_order_list)

		if a_index == nil and b_index == nil then
			return a < b
		elseif a_index or b_index then
			return b_index == nil
		else
			return a_index < b_index
		end

		return 
	end
end
table.sorted_copy = function (t, predicate)
	local sorted_copy = {}
	slot5 = t

	for _, value in ipairs(slot4) do
		slot11 = value

		table.insert(slot9, sorted_copy)
	end

	slot6 = predicate

	table.sort(slot4, sorted_copy)

	return sorted_copy
end
table.find_value = function (t, func)
	slot4 = t

	for _, value in ipairs(slot3) do
		slot9 = value

		if func(slot8) then
			return value
		end
	end

	return 
end
table.find_all_values = function (t, func)
	local matches = {}
	slot5 = t

	for _, value in ipairs(slot4) do
		slot10 = value

		if func(slot9) then
			slot11 = value

			table.insert(slot9, matches)
		end
	end

	return matches
end
table.true_for_all = function (t, predicate)
	slot4 = t

	for key, value in pairs(slot3) do
		slot10 = key

		if not predicate(slot8, value) then
			return false
		end
	end

	return true
end
table.collect = function (t, func)
	local result = {}
	slot5 = t

	for key, value in pairs(slot4) do
		slot10 = value
		result[key] = func(slot9)
	end

	return result
end
table.inject = function (t, initial, func)
	local result = initial
	slot6 = t

	for _, value in ipairs(slot5) do
		slot12 = value
		result = func(slot10, result)
	end

	return result
end
table.insert_sorted = function (t, item, comparator_func)
	if item == nil then
		return 
	end

	comparator_func = comparator_func or function (a, b)
		return a < b
	end
	local index = 1
	local examined_item = t[index]

	while examined_item and comparator_func(slot6, examined_item) do
		index = index + 1
		examined_item = t[index]
	end

	slot9 = item

	table.insert(slot6, t, index)

	return 
end
table.for_each_value = function (t, func)
	slot4 = t

	for _, value in ipairs(slot3) do
		slot9 = value

		func(slot8)
	end

	return 
end
table.remove_condition = function (t, func)
	local i = 1
	slot5 = t

	while next(slot4) and i <= #t do
		slot5 = t[i]

		if func(slot4) then
			slot6 = i

			table.remove(slot4, t)
		else
			i = i + 1
		end
	end

	return 
end
table.range = function (s, e)
	local range = {}

	for i = s, e, 1 do
		slot10 = i

		table.insert(slot8, range)
	end

	return range
end
table.unpack_sparse = function (sparse_list)
	table.__unpack_sparse_implementations = table.__unpack_sparse_implementations or {}
	local count = 0
	slot4 = sparse_list

	for index, _ in pairs(slot3) do
		slot10 = index
		count = math.max(slot8, count)
	end

	local func = table.__unpack_sparse_implementations[count]

	if func == nil then
		slot8 = count

		function slot6(i)
			return "__list__[" .. i .. "]"
		end

		local return_values = table.collect(slot4, table.range(slot6, 1))
		slot7 = ", "
		local return_value_string = table.concat(table.range(slot6, 1), return_values)
		local code = "return function( __list__ ) return " .. return_value_string .. " end"
		slot10 = code
		func = 
		-- Decompilation error in this vicinity:
		assert(loadstring(slot9))()
		table.__unpack_sparse_implementations[count] = func
	end

	slot5 = sparse_list

	return func(slot4)
end
table.unpack_map = function (map)
	slot5 = map

	return unpack(table.map_to_list(slot4))
end
table.map_to_list = function (map)
	local list = {}
	slot4 = map

	for k, v in pairs(slot3) do
		slot10 = k

		table.insert(slot8, list)

		slot10 = v

		table.insert(slot8, list)
	end

	return list
end
table.map_keys = function (map, sort_func)
	local keys = {}
	slot5 = map

	for key, _ in pairs(slot4) do
		slot11 = key

		table.insert(slot9, keys)
	end

	slot6 = sort_func

	table.sort(slot4, keys)

	return keys
end
table.map_values = function (map, sort_func)
	local values = {}
	slot5 = map

	for _, value in pairs(slot4) do
		slot11 = value

		table.insert(slot9, values)
	end

	if sort_func ~= nil then
		slot6 = sort_func

		table.sort(slot4, values)
	end

	return values
end
table.remap = function (map, remap_func)
	local result = {}
	slot5 = map

	for k, v in pairs(slot4) do
		slot11 = v
		result_k, result_v = remap_func(slot9, k)
		result[result_k] = result_v
	end

	return result
end
table.list_add = function (...)
	local result = {}
	slot3 = {
		...
	}

	for _, list_table in ipairs(slot2) do
		slot8 = list_table

		for _, value in ipairs(slot7) do
			slot14 = value

			table.insert(slot12, result)
		end
	end

	return result
end
table.list_union = function (...)
	local unique = {}
	slot3 = {
		...
	}

	for _, list_table in ipairs(slot2) do
		slot8 = list_table

		for _, value in ipairs(slot7) do
			unique[value] = true
		end
	end

	local result = {}
	slot4 = unique

	for key, _ in pairs(slot3) do
		slot10 = key

		table.insert(slot8, result)
	end

	return result
end
table.is_list_value_union = function (list1, list2)
	slot4 = list1

	for _, value1 in ipairs(slot3) do
		slot9 = list2

		for _, value2 in ipairs(slot8) do
			if value1 == value2 then
				return true
			end
		end
	end

	return false
end
table.list_append = function (t, ...)
	slot3 = {
		...
	}

	for _, list_table in ipairs(slot2) do
		slot8 = list_table

		for _, value in ipairs(slot7) do
			slot14 = value

			table.insert(slot12, t)
		end
	end

	return 
end
table.map_append = function (t, ...)
	slot3 = {
		...
	}

	for _, list_table in ipairs(slot2) do
		slot8 = list_table

		for key, value in pairs(slot7) do
			t[key] = value
		end
	end

	return 
end
table.print_data = function (data, t)
	slot4 = data

	if type(slot3) == "table" then
		t = t or ""
		slot4 = data

		for k, v in pairs(slot3) do
			slot9 = v

			if type(slot8) ~= "userdata" then
				slot13 = k
				slot15 = v
				slot10 = t .. tostring(slot12) .. "=" .. tostring(slot14)

				CoreDebug.cat_debug(slot8, "debug")
			else
				slot13 = k
				slot15 = v
				slot10 = t .. tostring(slot12) .. "=" .. CoreClass.type_name(slot14)

				CoreDebug.cat_debug(slot8, "debug")
			end

			slot9 = v

			if type(slot8) == "table" then
				slot10 = t .. "\t"

				table.print_data(slot8, v)
			end
		end
	else
		slot5 = CoreClass.type_name(slot6)
		slot8 = data

		CoreDebug.cat_debug(slot3, "debug", tostring(data))
	end

	return 
end
slot2 = Application

if Application.ews_enabled(function (data, t)
	slot4 = data

	if type(slot3) == "table" then
		t = t or ""
		slot4 = data

		for k, v in pairs(slot3) do
			slot9 = v

			if type(slot8) ~= "userdata" then
				slot13 = k
				slot15 = v
				slot10 = t .. tostring(slot12) .. "=" .. tostring(slot14)

				CoreDebug.cat_debug(slot8, "debug")
			else
				slot13 = k
				slot15 = v
				slot10 = t .. tostring(slot12) .. "=" .. CoreClass.type_name(slot14)

				CoreDebug.cat_debug(slot8, "debug")
			end

			slot9 = v

			if type(slot8) == "table" then
				slot10 = t .. "\t"

				table.print_data(slot8, v)
			end
		end
	else
		slot5 = CoreClass.type_name(slot6)
		slot8 = data

		CoreDebug.cat_debug(slot3, "debug", tostring(data))
	end

	return 
end) then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 154-161, warpins: 1 ---
	local __lua_representation, __write_lua_representation_to_file = nil

	function __lua_representation(value)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot3 = value
		local t = type(slot2)

		if t == "string" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-11, warpins: 1 ---
			slot5 = value

			return string.format(slot3, "%q")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-13, warpins: 1 ---
			if t == "number" or t == "boolean" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-19, warpins: 2 ---
				slot4 = value

				return tostring(slot3)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-25, warpins: 1 ---
				slot4 = "Unable to generate Lua representation of type \"" .. t .. "\"."

				error(slot3)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-26, warpins: 3 ---
		return 
		--- END OF BLOCK #1 ---



	end

	function __write_lua_representation_to_file(value, file, indentation)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		indentation = indentation or 1
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-8, warpins: 2 ---
		slot5 = value
		local t = type(slot4)

		if t == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-21, warpins: 1 ---
			slot7 = indentation
			local indent = string.rep(slot5, "\t")
			slot8 = "{\n"

			file.write("\t", file)

			slot7 = value

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 22-53, warpins: 0 ---
			for key, value in pairs("\t") do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-27, warpins: 1 ---
				slot14 = key
				slot13 = "Using a table for a key is unsupported."

				assert(slot11, type(slot13) ~= "table")

				slot17 = key
				slot13 = indent .. "[" .. __lua_representation(slot16) .. "] = "

				file.write(slot11, file)

				slot14 = indentation + 1

				__write_lua_representation_to_file(slot11, value, file)

				slot13 = ";\n"

				file.write(slot11, file)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 31-51, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 52-53, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 54-64, warpins: 1 ---
			slot11 = indentation - 1
			slot8 = string.rep(slot9, "\t") .. "}"

			file.write(slot6, file)
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-66, warpins: 1 ---
			if t == "string" or t == "number" or t == "boolean" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 71-77, warpins: 3 ---
				slot6 = file
				slot9 = value

				file.write(slot5, __lua_representation(slot8))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-83, warpins: 1 ---
				slot6 = "Unable to generate Lua representation of type \"" .. t .. "\"."

				error(slot5)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 84-84, warpins: 3 ---
		return 
		--- END OF BLOCK #2 ---



	end

	function write_lua_representation_to_path(value, path)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot6 = path
		slot5 = "Invalid path argument. Expected string."

		assert(slot3, type(slot5) == "string")

		slot5 = "w"
		local file = io.open(slot3, path)
		slot6 = "return "

		file.write(path, file)

		slot6 = file

		__write_lua_representation_to_file(path, value)

		slot5 = file

		file.close(path)

		return 
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-28, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	function read_lua_representation_from_path(path)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot5 = path
		slot4 = "Invalid path argument. Expected string."

		assert(slot2, type(slot4) == "string")

		slot4 = "r"
		local file = io.open(slot2, path)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-18, warpins: 2 ---
		if file then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-22, warpins: 1 ---
			slot5 = "*a"
			local script = file.read(slot3, file)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-27, warpins: 2 ---
		slot5 = file

		file.close(slot4)
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 35-35, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end
	--- END OF BLOCK #0 ---



end

return 
