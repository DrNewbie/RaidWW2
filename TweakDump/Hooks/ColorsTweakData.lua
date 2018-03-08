local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_colors", "ColorsTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/ColorsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.colors))) 
	_file:close() 
end) 
