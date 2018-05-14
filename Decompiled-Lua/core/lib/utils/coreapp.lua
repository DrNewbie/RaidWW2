slot3 = "CoreApp"

core.module(slot1, core)

function arg_supplied(key)
	slot5 = Application

	for _, arg in ipairs(Application.argv(slot4)) do
		if arg == key then
			return true
		end
	end

	return false
end

function arg_value(key)
	local found = nil
	slot6 = Application

	for _, arg in ipairs(Application.argv(slot5)) do
		if found then
			return arg
		elseif arg == key then
			found = true
		end
	end

	return 
end

function min_exe_version(version, system_name)
	return 
end

return 
