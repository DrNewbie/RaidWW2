Hooks:PostHook(InteractionTweakData, "init", "HackLockPick", function(self, ...)
	if self and type(self) == "table" then
		for _type, _data in pairs(self) do
			if type(_data) == "table" and type(_data.number_of_circles) == "number" then
				_data.circle_difficulty = {
					0.25,
					0.25,
					0.25
				}
			end
		end
	end
end)