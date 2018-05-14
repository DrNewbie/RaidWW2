slot3 = "CoreClass"

core.module(slot1, core)

__overrides = {}
__everyclass = {}

function class(...)
	local super = ...
	slot3 = "#"

	if 1 <= select(slot2, ...) and super == nil then
		slot4 = 2

		error(slot2, "trying to inherit from nil")
	end

	local class_table = {}

	if __everyclass then
		slot5 = class_table

		table.insert(slot3, __everyclass)
	end

	class_table.super = __overrides[super] or super
	class_table.__index = class_table
	slot4 = 2
	class_table.__module__ = getfenv(slot3)
	slot5 = __overrides[super] or super

	setmetatable(slot3, class_table)

	class_table.new = function (klass, ...)
		local object = {}
		slot5 = __overrides[class_table] or class_table

		setmetatable(slot3, object)

		if object.init then
			slot5 = object

			return object, object.init(slot4, ...)
		end

		return object
	end

	return class_table
end

function override_class(old_class, new_class)
	slot5 = "Too late to override class now."

	assert(slot3, __everyclass)

	slot4 = __everyclass

	for _, ct in ipairs(slot3) do
		if ct ~= new_class and ct.super == old_class then
			ct.super = new_class
			slot10 = new_class

			setmetatable(slot8, ct)
		end
	end

	__overrides[old_class] = new_class

	return 
end

function close_override()
	__everyclass = nil

	return 
end

function type_name(value)
	slot3 = value
	local name = type(slot2)

	if name == "userdata" and value.type_name then
		return value.type_name
	end

	return name
end

function mixin(res, ...)
	slot3 = {
		...
	}

	for _, t in ipairs(slot2) do
		slot8 = t

		for k, v in pairs(slot7) do
			if k ~= "new" and k ~= "__index" then
				slot15 = v

				rawset(slot12, res, k)
			end
		end
	end

	return res
end

function mix(...)
	slot2 = {}

	return mixin(slot1, ...)
end

function mixin_add(res, ...)
	slot3 = {
		...
	}

	for _, t in ipairs(slot2) do
		slot8 = t

		for k, v in pairs(slot7) do
			slot14 = v

			table.insert(slot12, res)
		end
	end

	return res
end

function mix_add(...)
	slot2 = {}

	return mixin_add(slot1, ...)
end

function hijack_func(instance_or_meta, func_name, func)
	slot5 = instance_or_meta
	local meta = getmetatable(slot4) or instance_or_meta

	if not meta then
		slot7 = "Can't hijack nil instance or class."

		Application.error(slot5, Application)
	elseif not meta[func_name] then
		slot10 = func_name
		slot7 = "Unable to hijack non-existing function \"" .. tostring(slot9) .. "\"."

		Application.error(slot5, Application)
	else
		local old_func_name = "hijacked_" .. func_name

		if not meta[old_func_name] then
			meta[old_func_name] = meta[func_name]
			meta[func_name] = func or function ()
				return 
			end
		end
	end

	return 
end

function unhijack_func(instance_or_meta, func_name)
	slot4 = instance_or_meta
	local meta = getmetatable(slot3) or instance_or_meta

	if not meta then
		slot6 = "Can't unhijack nil instance or class."

		Application.error(slot4, Application)
	else
		local old_func_name = "hijacked_" .. func_name

		if meta[old_func_name] then
			meta[func_name] = meta[old_func_name]
			meta[old_func_name] = nil
		end
	end

	return 
end

__frozen__newindex = __frozen__newindex or function (self, key, value)
	slot12 = self

	error(string.format(slot6, "Attempt to set %s = %s in frozen %s.", tostring(tostring(key)), type_or_class_name(value)))

	return 
end

function freeze(...)
	slot2 = {
		...
	}

	for _, instance in ipairs(slot1) do
		slot7 = instance

		if not is_frozen(slot6) then
			slot7 = instance
			local metatable = getmetatable(slot6)

			if metatable == nil then
				slot9 = {
					__newindex = __frozen__newindex
				}

				setmetatable(slot7, instance)
			else
				slot9 = {
					__index = metatable.__index,
					__newindex = __frozen__newindex,
					__metatable = metatable
				}

				setmetatable(slot7, instance)
			end
		end
	end

	return ...
end

function is_frozen(instance)
	slot3 = instance
	local metatable = debug.getmetatable(slot2)

	return metatable and metatable.__newindex == __frozen__newindex
end

function frozen_class(...)
	local class_table = class(...)
	local new = class_table.new
	class_table.new = function (klass, ...)
		slot3 = klass
		local instance, ret = new(slot2, ...)
		slot5 = instance

		return freeze(slot4), ret
	end

	return class_table
end

function responder(...)
	local response = {
		...
	}

	local function responder_function()
		slot2 = response

		return unpack(slot1)
	end

	slot5 = {
		__index = function ()
			return responder_function
		end
	}

	return setmetatable(slot3, {})
end

function responder_map(response_table)
	local responder = {}
	slot4 = response_table

	for key, value in pairs(slot3) do
		if key == "default" then
			slot10 = {
				__index = function ()
					return function ()
						return value
					end
				end
			}

			setmetatable(slot8, responder)
		else
			responder[key] = function ()
				return value
			end
		end
	end

	return responder
end

GetSet = GetSet or class()
GetSet.init = function (self, t)
	slot4 = t

	for k, v in pairs(slot3) do
		self["_" .. k] = v
		self[k] = function (self)
			return self["_" .. k]
		end
		self["set_" .. k] = function (self, v)
			self["_" .. k] = v

			return 
		end
	end

	return 
end

return 
