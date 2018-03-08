local ModPath = ModPath 
Hooks:PostHook(LevelsTweakData, "init", "LevelsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/LevelsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
