local ModPath = ModPath 
Hooks:PostHook(TimeSpeedEffectTweakData, "init", "TimeSpeedEffectTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/TimeSpeedEffectTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
