local ModPath = ModPath 
Hooks:PostHook(EquipmentsTweakData, "init", "EquipmentsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/EquipmentsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
