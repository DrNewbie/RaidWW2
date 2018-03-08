local ModPath = ModPath 
Hooks:PostHook(GuiTweakData, "init", "GuiTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/GuiTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
