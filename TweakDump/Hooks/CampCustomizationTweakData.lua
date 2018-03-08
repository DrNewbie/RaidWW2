local ModPath = ModPath 
Hooks:PostHook(CampCustomizationTweakData, "init", "CampCustomizationTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/CampCustomizationTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
