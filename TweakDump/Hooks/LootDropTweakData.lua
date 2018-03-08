local ModPath = ModPath 
Hooks:PostHook(LootDropTweakData, "init", "LootDropTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/LootDropTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
