local ModPath = ModPath 
Hooks:PostHook(VehicleTweakData, "init", "VehicleTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/VehicleTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
