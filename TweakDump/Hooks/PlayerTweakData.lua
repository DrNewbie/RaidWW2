local ModPath = ModPath 
Hooks:PostHook(PlayerTweakData, "init", "PlayerTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/PlayerTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
