local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_textures", "TexturesTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/TexturesTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.textures))) 
	_file:close() 
end) 
