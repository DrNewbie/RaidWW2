Hooks:PostHook(PlayerMovement, "init", "Inspire_ply_rally_skill_data_init", function(self)
	self._rally_skill_data = {
		range_sq = 810000,
		morale_boost_delay_t = 0,
		long_dis_revive = true,
		revive_chance = 1,
		morale_boost_cooldown_t = 3.5
	}
end)