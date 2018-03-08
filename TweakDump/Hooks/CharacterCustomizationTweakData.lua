local ModPath = ModPath 
Hooks:PostHook(CharacterCustomizationTweakData, "init", "CharacterCustomizationTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/CharacterCustomizationTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
