local ModPath = ModPath 
Hooks:PostHook(InteractionTweakData, "init", "InteractionTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/InteractionTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
