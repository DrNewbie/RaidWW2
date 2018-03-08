function RaidMul(them, _mul, _div)
	for name in ({"reenforce", "assault"}) do	
		for i, d in pairs(them[name].groups) do
			them[name].groups[i] = ((d or 1) + 1) * _mul
		end
		for i, d in pairs(them[name].interval) do
			them[name].interval[i] = (d or 0) * _div
		end
	end
	for i, d in pairs(them.recurring_group_SO.recurring_spawn_1.interval) do
		them.recurring_group_SO.recurring_spawn_1.interval[i] = (d or 0) * _div
	end
	for name in pairs({"delay"}) do
		for i, d in pairs(them.assault[name]) do
			them.assault[name][i] = (d or 0) * _div
		end
	end
	for name in pairs({"force", "force_pool_balance_mul", "force_pool", "sustain_duration_balance_mul", "sustain_duration_min", "sustain_duration_max"}) do
		for i, d in pairs(them.assault[name]) do
			them.assault[name][i] = (d or 1) * _mul
		end
	end
	--them.max_spawning_distance = (them.max_spawning_distance or 0) * 2
	--them.min_spawning_distance = (them.min_spawning_distance or 0) * 2
	--them.max_spawning_height_diff = (them.max_spawning_height_diff or 0) * 2
	them.recon.interval_variation = (them.recon.interval_variation or 0) * _div
	return them
end
Hooks:PostHook(GroupAITweakData, "init", "SME_GroupAITweakData", function(self, tweak_data)
	local mul = math.round(SMEGKey.Options:GetValue("Multiple"))
	local div = SMEGKey.Options:GetValue("Divisor")
	if type(self) ~= "table" then
		return
	end
	for i, d in pairs(self.difficulty_curve_points) do
		self.difficulty_curve_points[i] = 1
	end
	for i, d in pairs(self.special_unit_spawn_limits) do
		self.special_unit_spawn_limits[i] = ((d or 1) + 1) * mul
	end
	for name, _ in pairs(self.enemy_spawn_groups.german) do
		for i, d in pairs(self.enemy_spawn_groups.german[name].amount) do
			self.enemy_spawn_groups.german[name].amount[i] = ((d or 1) + 1) * mul
		end
		for i, d in pairs(self.enemy_spawn_groups.german[name].spawn) do
			self.enemy_spawn_groups.german[name].spawn[i].amount_min = ((self.enemy_spawn_groups.german[name].spawn[i].amount_min or 1) + 1) * mul
		end
	end
	for name in pairs({"raid", "street", "besiege"}) do
		if type(self[name]) == "table" and type(self[name].assault) == "table" then
			self[name] = RaidMul(self[name], mul, div)
		end
	end
end)