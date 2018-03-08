local ModPath = ModPath 
Hooks:PostHook(GroupAITweakData, "init", "GroupAITweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/GroupAITweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
