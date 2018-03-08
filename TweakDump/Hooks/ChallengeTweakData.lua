local ModPath = ModPath 
Hooks:PostHook(ChallengeTweakData, "init", "ChallengeTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/ChallengeTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
