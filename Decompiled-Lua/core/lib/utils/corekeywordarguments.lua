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
slot3 = "CoreKeywordArguments"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

function parse_kwargs(args, ...)
	slot3 = #args == 1

	assert(slot2)

	slot5 = args[1]
	slot3 = type(slot4) == "table"

	assert(slot2)

	local kwargs = args[1]
	local result = {}
	slot5 = {
		...
	}

	for _, arg_def in ipairs(slot4) do
		slot11 = ":"
		local j = string.find(slot9, arg_def)
		slot13 = j - 1
		local typ = string.sub(arg_def, arg_def, 1)
		local name = string.sub(arg_def, arg_def)
		local value = kwargs[name]
		slot14 = type(slot15) == typ
		slot19 = typ
		slot22 = value

		assert(j + 1, string.format(value, "For value='%s' wanted type is '%s', received '%s'", name, type(slot21)))

		slot15 = value

		table.insert(j + 1, result)

		kwargs[name] = nil
	end

	slot5 = kwargs

	for n, v in pairs(slot4) do
		slot10 = n

		assert(slot9)
	end

	slot5 = result

	return unpack(slot4)
end

KeywordArguments = KeywordArguments or CoreClass.class()
function KeywordArguments:init(...)
	local args = {
		...
	}

	assert(slot3, #args == 1)

	slot6 = args[1]
	slot5 = "must be called with table as first argument"

	assert(slot3, type("must be called with one argument only (a table with keyword arguments)") == "table")

	self._kwargs = args[1]
	self._unconsumed_kwargs = {}
	slot4 = self._kwargs

	for k, _ in pairs(slot3) do
		self._unconsumed_kwargs[k] = k
	end

	return 
end
function KeywordArguments:assert_all_consumed()
	slot5 = self._unconsumed_kwargs
	slot8 = self._unconsumed_kwargs
	slot4 = "unknown keyword argument(s): " .. string.join(slot6, ", ")

	assert(slot2, table.size(slot4) == 0)

	return 
end
function KeywordArguments:mandatory(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		local v = self._kwargs[n]
		slot11 = "a mandatory keyword argument (" .. n .. ") is missing"

		assert(slot9, v ~= nil)

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:mandatory_string(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		local v = self._kwargs[n]

		assert(slot9, v ~= nil)

		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a string (" .. n .. "=" .. tostring(slot15) .. ")"

		assert(slot9, type("a mandatory keyword argument (" .. n .. ") is missing") == "string")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:mandatory_number(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		local v = self._kwargs[n]

		assert(slot9, v ~= nil)

		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a number (" .. n .. "=" .. tostring(slot15) .. ")"

		assert(slot9, type("a mandatory keyword argument (" .. n .. ") is missing") == "number")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:mandatory_table(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		local v = self._kwargs[n]

		assert(slot9, v ~= nil)

		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a table (" .. n .. "=" .. tostring(slot15) .. ")"

		assert(slot9, type("a mandatory keyword argument (" .. n .. ") is missing") == "table")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:mandatory_function(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		local v = self._kwargs[n]

		assert(slot9, v ~= nil)

		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a function (" .. n .. "=" .. tostring(slot15) .. ")"

		assert(slot9, type("a mandatory keyword argument (" .. n .. ") is missing") == "function")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:mandatory_object(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]

		assert(slot9, v ~= nil)

		slot8 = assert
		slot12 = v
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a table or userdata (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "userdata")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do
		slot10 = self._kwargs[n]

		table.insert(slot8, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional_string(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]
		slot8 = assert
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a string (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "string")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional_number(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]
		slot8 = assert
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a number (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "number")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional_table(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]
		slot8 = assert
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a table or userdata (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "table")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional_function(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]
		slot8 = assert
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a function (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "function")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end
function KeywordArguments:optional_object(...)
	local ret_list = {}
	slot4 = {
		...
	}

	for _, n in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		local v = self._kwargs[n]
		slot8 = assert
		slot12 = v
		slot12 = v
		slot16 = v
		slot11 = "keyword argument is not a table or userdata (" .. n .. "=" .. tostring(slot15) .. ")"

		slot8(slot9, type(slot11) == "userdata")

		slot11 = v

		table.insert(slot9, ret_list)

		self._unconsumed_kwargs[n] = nil
	end

	slot4 = ret_list

	return unpack(slot3)
end

return 
