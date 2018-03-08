local ModPath = ModPath 
Hooks:PostHook(CommWheelTweakData, "init", "CommWheelTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/CommWheelTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
