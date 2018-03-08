local ModPath = ModPath 
Hooks:PostHook(BlackMarketTweakData, "init", "PostHookBlackMarketTweakData", function(self) 
	local _file = io.open(ModPath.."Output/BlackmarketTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
