local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "_init_melee_weapons", "MeleeWeaponsTweakData_Init", function(self, ...) 
	local _file = io.open(ModPath.."Output/MeleeWeaponsTweakData.json", "w+") 
	_file:write(tostring(json.encode(self.melee_weapons))) 
	_file:close() 
end) 
