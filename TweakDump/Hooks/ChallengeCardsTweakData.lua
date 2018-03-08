local ModPath = ModPath 
Hooks:PostHook(ChallengeCardsTweakData, "init", "ChallengeCardsTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/ChallengeCardsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
