local ModPath = ModPath 
Hooks:PostHook(DropLootTweakData, "init", "DropLootTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/DropLootTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
