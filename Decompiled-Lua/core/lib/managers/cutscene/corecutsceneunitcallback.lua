CoreCutsceneUnitCallback = CoreCutsceneUnitCallback or class()
function CoreCutsceneUnitCallback:init(callback_name)
	self._callback_name = callback_name
	self._params = {}

	return 
end
function CoreCutsceneUnitCallback:add_parameter(param)
	self._params[param._name] = param

	return 
end
function CoreCutsceneUnitCallback:get_parameter_map()
	return self._params
end
CoreCutsceneInputParam = CoreCutsceneInputParam or class()
function CoreCutsceneInputParam:init(name, value_type, default_value, min_value, max_value, decimals)
	self._name = name
	self._value_type = value_type
	self._default_value = default_value
	self._min_value = min_value
	self._max_value = max_value
	self._decimals = decimals

	return 
end
function CoreCutsceneInputParam:float_to_string(number, decimals)
	slot5 = number

	if type(slot4) == "boolean" then
		slot5 = number

		return tostring(slot4)
	elseif decimals then
		slot6 = number or 0

		return string.format(slot4, "%." .. decimals .. "f")
	else
		slot6 = number or 0

		return string.format(slot4, "%f")
	end

	return 
end
function CoreCutsceneInputParam:validate(value)
	if self._value_type == "number" then
		slot13 = self._decimals
		value = self.float_to_string(slot3, self, self.validate_number(self._decimals, self, self._value_type, value, self._min_value, self._max_value, self._default_value))
	elseif self._value_type == "boolean" then
		slot5 = value
		value = self.validate_boolean(slot3, self)
	end

	return value
end
function CoreCutsceneInputParam:validate_number(number, min_value, max_value, default_value, decimals)
	slot8 = number

	if type(slot7) == "string" then
		local stripped_number = ""
		slot11 = 1

		if string.sub(slot8, number, 1) == "." then
			number = "0" .. number
		end

		slot10 = "(%d+%.?%d?)"

		for digit in string.gmatch(slot8, number) do
			stripped_number = stripped_number .. digit
		end

		slot9 = stripped_number
		number = tonumber(slot8)
	end

	if number == nil then
		number = default_value
	end

	if self._decimals ~= nil then
		local round_helper = 10^self._decimals
		slot9 = number * round_helper
		number = math.round(slot8)

		if number == 0 then
			number = 0
		else
			number = number / round_helper
		end
	end

	if min_value ~= nil and number < min_value then
		number = min_value
	elseif max_value ~= nil and max_value < number then
		number = max_value
	end

	return number
end
function CoreCutsceneInputParam:validate_boolean(boolean)
	slot4 = boolean

	if type(slot3) == "string" then
		return boolean == "true"
	else
		return boolean
	end

	return 
end

return 
