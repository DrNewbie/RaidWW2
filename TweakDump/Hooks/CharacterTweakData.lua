local ModPath = ModPath 
Hooks:PostHook(CharacterTweakData, "init", "CharacterTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/CharacterTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
