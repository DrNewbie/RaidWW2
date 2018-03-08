local ModPath = ModPath 
Hooks:PostHook(StatisticsTweakData, "init", "StatisticsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/StatisticsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
