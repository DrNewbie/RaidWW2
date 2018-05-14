slot3 = "CoreMenuItemOption"

core.module(slot1, core)

ItemOption = ItemOption or class()
function ItemOption:init(data_node, parameters)
	local params = parameters or {}

	if data_node then
		slot6 = data_node

		for key, value in pairs(slot5) do
			if key ~= "_meta" then
				slot11 = value

				if type(slot10) ~= "table" then
					params[key] = value
				end
			end
		end
	end

	slot7 = params

	self.set_parameters(slot5, self)

	return 
end
function ItemOption:value()
	return self._parameters.value
end
function ItemOption:parameters()
	return self._parameters
end
function ItemOption:set_parameters(parameters)
	self._parameters = parameters

	return 
end

return 
