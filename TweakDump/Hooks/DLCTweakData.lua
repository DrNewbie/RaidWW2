local ModPath = ModPath 
Hooks:PostHook(DLCTweakData, "init", "DLCTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/DLCTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
