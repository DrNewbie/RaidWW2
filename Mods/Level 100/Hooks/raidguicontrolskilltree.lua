local ThisNewLevel = 100
local ThisModIds = ModPath and Idstring(ModPath):key() or tostring(math.random())
local Hook3 = "F_"..Idstring("Hook3::"..ThisModIds):key()

--[[
Hooks:PostHook(RaidGUIControlSkilltree, "init", Hook3, function(self)
	for i = 41, ThisNewLevel do
		self._levels[i] = self._levels[1]
		self._levels[i].points_needed = math.round(self._levels[40].points_needed * i / 40)
	end
end)
]]
