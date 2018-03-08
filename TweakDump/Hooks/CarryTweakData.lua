local ModPath = ModPath 
Hooks:PostHook(CarryTweakData, "init", "CarryTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/CarryTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
