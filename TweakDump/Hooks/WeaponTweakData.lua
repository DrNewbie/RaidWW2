local ModPath = ModPath 
Hooks:PostHook(WeaponTweakData, "init", "WeaponTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/WeaponTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
