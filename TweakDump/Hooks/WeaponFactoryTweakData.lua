local ModPath = ModPath 
Hooks:PostHook(WeaponFactoryTweakData, "init", "WeaponFactoryTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/WeaponFactoryTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
