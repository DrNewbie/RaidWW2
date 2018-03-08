Hooks:PostHook(OperationsTweakData, "init", "MoreXP_Init", function(self)
	if type(self.missions) == "table" then
		for mission, data in pairs(self.missions) do
			if data.xp then
				self.missions[mission].xp = (data.xp + 1) * 1000
			end
		end
	end
end)