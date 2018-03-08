local ModPath = ModPath 
Hooks:PostHook(ProjectilesTweakData, "init", "ProjectilesTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/ProjectilesTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
