local ModPath = ModPath 
Hooks:PostHook(DramaTweakData, "init", "DramaTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/DramaTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
