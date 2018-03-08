local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_materials", "MaterialsTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/MaterialsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.materials))) 
	_file:close() 
end) 
