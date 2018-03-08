local ModPath = ModPath 
Hooks:PostHook(SubtitlesTweakData, "init", "SubtitlesTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/SubtitlesTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
