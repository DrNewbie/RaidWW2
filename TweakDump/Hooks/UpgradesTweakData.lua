local ModPath = ModPath 
Hooks:PostHook(UpgradesTweakData, "init", "UpgradesTweakData_Init", function(self) 
	local _file = io.open(ModPath.."Output/UpgradesTweakData.json", "w+") 
	_file:write(tostring(json.encode(self))) 
	_file:close() 
end) 
