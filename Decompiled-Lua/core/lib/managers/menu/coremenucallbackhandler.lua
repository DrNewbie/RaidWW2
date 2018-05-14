slot3 = "CoreMenuCallbackHandler"

core.module(slot1, core)

CallbackHandler = CallbackHandler or class()
CallbackHandler.init = function (self)
	slot3 = self
	getmetatable(slot2).__index = function (t, key)
		slot6 = t
		local value = rawget(slot3, getmetatable(key))

		if value then
			return value
		end

		return 
	end

	return 
end

return 
