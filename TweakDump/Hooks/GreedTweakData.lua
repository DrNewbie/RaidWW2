local ModPath = ModPath 
Hooks:PostHook(GreedTweakData, "init", "GreedTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/GreedTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
