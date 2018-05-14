function class(...)
	local super = ...
	slot3 = "#"

	if 1 <= select(slot2, ...) and super == nil then
		slot4 = 2

		error(slot2, "trying to inherit from nil")
	end

	local class_table = {
		super = super,
		__index = class_table
	}
	slot5 = super

	setmetatable(slot3, class_table)

	function class_table.new(klass, ...)
		local object = {}
		slot5 = class_table

		setmetatable(slot3, object)

		if object.init then
			slot5 = object

			return object, object.init(slot4, ...)
		end

		return object
	end

	return class_table
end

function callback(o, base_callback_class, base_callback_func_name, base_callback_param)
	if base_callback_class and base_callback_func_name and base_callback_class[base_callback_func_name] then
		if base_callback_param ~= nil then
			if o then
				return function (...)
					slot3 = base_callback_param

					return base_callback_class[base_callback_func_name](base_callback_func_name, o, ...)
				end
			else
				return function (...)
					slot2 = base_callback_param

					return base_callback_class[base_callback_func_name](base_callback_func_name, ...)
				end
			end
		elseif o then
			return function (...)
				slot2 = o

				return base_callback_class[base_callback_func_name](base_callback_func_name, ...)
			end
		else
			return function (...)
				return base_callback_class[base_callback_func_name](...)
			end
		end
	elseif base_callback_class then
		if base_callback_class then
			slot8 = base_callback_class
			slot6 = getmetatable(slot7) or base_callback_class
			local class_name = CoreDebug.class_name(slot5)
		end

		slot10 = class_name
		slot12 = base_callback_func_name
		slot7 = "Callback on class \"" .. tostring(slot9) .. "\" refers to a non-existing function \"" .. tostring(slot11) .. "\"."

		error(slot6)
	elseif base_callback_func_name then
		slot9 = base_callback_func_name
		slot6 = "Callback to function \"" .. tostring(slot8) .. "\" is on a nil class."

		error(slot5)
	else
		slot6 = "Callback class and function was nil."

		error(slot5)
	end

	return 
end

CoreLoadingSetup = CoreLoadingSetup or class()
function CoreLoadingSetup:init()
	return 
end
function CoreLoadingSetup:init_managers(managers)
	return 
end
function CoreLoadingSetup:init_gp()
	return 
end
function CoreLoadingSetup:post_init()
	return 
end
function CoreLoadingSetup:update(t, dt)
	return 
end
function CoreLoadingSetup:destroy()
	return 
end
function CoreLoadingSetup:__init()
	slot4 = managers

	self.init_managers(slot2, self)

	slot3 = self

	self.init_gp(slot2)

	slot3 = self

	self.post_init(slot2)

	return 
end
function CoreLoadingSetup:__update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function CoreLoadingSetup:__destroy(t, dt)
	slot5 = self

	self.destroy(slot4)

	return 
end
function CoreLoadingSetup:make_entrypoint()
	slot4 = "init"
	slot9 = "__init"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "update"
	slot9 = "__update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "destroy"
	slot9 = "__destroy"

	rawset(slot2, _G, callback(slot6, self, self))

	return 
end

return 
