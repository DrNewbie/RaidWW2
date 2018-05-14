slot3 = "CoreSerialize"

core.module(slot1, core)

function string_to_classtable(s)
	local module_name, name = nil
	slot6 = "[.]"

	if string.find(slot4, s) then
		slot8 = "[.]"
		module_name, name = unpack(string.split(slot6, s))
	else
		name = s
		module_name = "_G"
	end

	if module_name == "_G" then
		slot6 = name
		local obj = rawget(slot4, _G)
		slot7 = "Can't find '" .. name .. "' in _G"

		assert(_G, obj)

		return obj
	else
		local module = core._name_to_module(slot4, core)
		local obj = module[name]
		slot8 = "Can't get name '" .. name .. "' from module '" .. module_name .. "'"

		assert(module_name, obj)

		return obj
	end

	return 
end

function classtable_to_string(ct)
	slot4 = ct.__module__
	local module_name = core._module_to_name(slot2, core)
	slot4 = ct.__module__

	for name, obj in pairs(core) do
		if obj == ct then
			return module_name .. "." .. name
		end
	end

	slot4 = "Can't find classtable in module '" .. module_name .. "'"

	error(slot3)

	return 
end

return 
