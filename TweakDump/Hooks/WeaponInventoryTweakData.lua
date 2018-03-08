local ModPath = ModPath 
Hooks:PostHook(WeaponInventoryTweakData, "init", "WeaponInventoryTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/WeaponInventoryTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
