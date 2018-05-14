slot3 = "CoreOldModule"

core.module(slot1, core)

function get_core_or_local(name)
	slot4 = name

	if not rawget(slot2, _G) then
		slot4 = "Core" .. name
		slot1 = rawget(slot2, _G)
	end

	return slot1
end

function core_or_local(name, ...)
	slot3 = name
	local metatable = get_core_or_local(slot2)

	if metatable then
		slot4 = metatable
		slot2 = metatable.new(slot3, ...)
	end

	return slot2
end

return 
