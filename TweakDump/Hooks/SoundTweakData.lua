local ModPath = ModPath 
Hooks:PostHook(SoundTweakData, "init", "SoundTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/SoundTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
