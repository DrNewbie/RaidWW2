local ModPath = ModPath 
Hooks:PostHook(TipsTweakData, "init", "TipsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/TipsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
