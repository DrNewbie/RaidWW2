slot3 = "CoreLogic"

core.module(slot1, core)

function toboolean(value)
	slot3 = value

	if type(slot2) == "string" then
		return value == "true"
	else
		slot3 = value

		if type(slot2) == "number" then
			return value == 1
		end
	end

	return 
end

function iff(t, a, b)
	if t then
		return a
	else
		return b
	end

	return 
end

return 
