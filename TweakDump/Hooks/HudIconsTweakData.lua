local ModPath = ModPath 
Hooks:PostHook(HudIconsTweakData, "init", "HudIconsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/HudIconsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
