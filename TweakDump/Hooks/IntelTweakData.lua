local ModPath = ModPath 
Hooks:PostHook(IntelTweakData, "init", "IntelTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/IntelTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
