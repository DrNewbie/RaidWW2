local ModPath = ModPath 
Hooks:PostHook(OperationsTweakData, "init", "OperationsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/OperationsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
