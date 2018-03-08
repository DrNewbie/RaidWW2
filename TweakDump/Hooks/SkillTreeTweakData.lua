local ModPath = ModPath 
Hooks:PostHook(SkillTreeTweakData, "init", "SkillTreeTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/SkillTreeTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
