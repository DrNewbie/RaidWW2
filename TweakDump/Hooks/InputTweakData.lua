local ModPath = ModPath 
Hooks:PostHook(InputTweakData, "init", "InputTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/InputTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
