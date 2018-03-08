local ModPath = ModPath 
Hooks:PostHook(GroupAIRaidTweakData, "init", "GroupAIRaidTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/GroupAIRaidTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
