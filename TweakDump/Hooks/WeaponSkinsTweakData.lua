local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_weapon_skins", "WeaponSkinsTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/WeaponSkinsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.weapon_skins))) 
	_file:close() 
end) 
