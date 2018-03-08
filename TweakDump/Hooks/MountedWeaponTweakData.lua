local ModPath = ModPath 
Hooks:PostHook(MountedWeaponTweakData, "init", "MountedWeaponTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/MountedWeaponTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
