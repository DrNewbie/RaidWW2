slot4 = false
local production = rawget(slot1, _G, "LUA_PRODUCTION")

if production then
	slot5 = true

	rawset(slot2, _G, "SOME_DLC_OR_FEATURE")
end

return 
