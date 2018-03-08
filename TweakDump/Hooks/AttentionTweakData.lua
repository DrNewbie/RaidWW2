local ModPath = ModPath 
Hooks:PostHook(AttentionTweakData, "init", "AttentionTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/AttentionTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
