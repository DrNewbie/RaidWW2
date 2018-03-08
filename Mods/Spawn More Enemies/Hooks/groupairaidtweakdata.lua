Hooks:PostHook(GroupAIRaidTweakData, "init", "SME_GroupAIRaidTweakData", function(self, tweak_data)
	local mul = math.round(SMEGKey.Options:GetValue("Multiple"))
	local div = SMEGKey.Options:GetValue("Divisor")
	if type(self) ~= "table" then
		return
	end
	if type(self.assault) == "table" then
		for name in pairs({"delay"}) do
			if type(self.assault[name]) == "table" then
				for i, d in pairs(self.assault[name]) do
					self.assault[name][i] = d * div
				end
			end
		end
		for name in pairs({"force", "force_pool_balancemul", "force_pool", "sustain_duration_balancemul", "sustain_duration_min", "sustain_duration_max"}) do
			if type(self.assault[name]) == "table" then
				for i, d in pairs(self.assault[name]) do
					self.assault[name][i] = ((d or 1) + 1) * mul
				end
			end
		end
		if type(self.assault.groups) == "table" then
			for name, _ in pairs(self.assault.groups) do
				if type(self.assault.groups[name]) == "table" then
					for i, d in pairs(self.assault.groups[name]) do
						self.assault.groups[name][i] = ((d or 1) + 1) * mul
					end
				end
			end
		end
	end
	--self.max_spawning_distance = (self.max_spawning_distance or 0) * 2
	--self.min_spawning_distance = (self.min_spawning_distance or 0) * 2
	--self.max_spawning_height_diff = (self.max_spawning_height_diff or 0) * 2
	self.recon.interval_variation = (self.recon.interval_variation or 0) * div	
	for i, d in pairs(self.recurring_group_SO.recurring_spawn_1.interval) do
		self.recurring_group_SO.recurring_spawn_1.interval[i] = (d or 0) * div
	end
	for name, _ in pairs(self.reenforce.groups) do
		for i, d in pairs(self.reenforce.groups[name]) do
			self.reenforce.groups[name][i] = ((d or 1) + 1) * mul
		end
	end
	for i, d in pairs(self.reenforce.interval) do
		self.reenforce.interval[i] = (d or 0) * div
	end
end)