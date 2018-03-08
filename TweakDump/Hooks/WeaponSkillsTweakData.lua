local ModPath = ModPath 
Hooks:PostHook(WeaponSkillsTweakData, "init", "WeaponSkillsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/WeaponSkillsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
