local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_masks", "MasksTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/MasksTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.masks))) 
	_file:close() 
end) 
