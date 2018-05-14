slot2 = _G
local mt = getmetatable(slot1)

if mt == nil then
	mt = {}
	slot4 = mt

	setmetatable(slot2, _G)
end

mt.__declared = {}
mt.__newindex = function (t, n, v)
	if not mt.__declared[n] then
		slot6 = "S"
		local info = debug.getinfo(slot4, 2)

		if info and info.what ~= "main" and info.what ~= "C" then
			slot9 = n
			slot7 = 2

			error(slot5, "cannot assign undeclared global '" .. tostring(slot8) .. "'")
		end

		mt.__declared[n] = true
	end

	slot7 = v

	rawset(slot4, t, n)

	return 
end
mt.__index = function (t, n)
	if not mt.__declared[n] then
		slot5 = "S"
		local info = debug.getinfo(slot3, 2)

		if info and info.what ~= "main" and info.what ~= "C" then
			slot8 = n
			slot6 = 2

			error(slot4, "cannot use undeclared global '" .. tostring(slot7) .. "'")
		end
	end

	return 
end

return 
