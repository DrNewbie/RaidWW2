local ModPath = ModPath 
Hooks:PostHook(TweakData, "init", "TweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/TweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
