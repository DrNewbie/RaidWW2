local ModPath = ModPath 
Hooks:PostHook(WarcryTweakData, "init", "WarcryTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/WarcryTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
