local ModPath = ModPath 
Hooks:PostHook(AchievementTweakData, "init", "AchievementTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/AchievementTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
