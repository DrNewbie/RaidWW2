local ModPath = ModPath 
Hooks:PostHook(BarrageTweakData, "init", "BarrageTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/BarrageTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
