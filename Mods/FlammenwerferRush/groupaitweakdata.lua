Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "FlammenwerferRush_GroupAITweakData_init", function(self)
	if type(self) == "table" and type(self.enemy_spawn_groups) == "table" and type(self.unit_categories) == "table" then
		self.special_unit_spawn_limits.flamer = 999
		for enemy_type, data in pairs(self.enemy_spawn_groups.german) do
			if data.spawn and type(data.spawn) == "table" then
				for spawn_id, spawn_data in pairs(data.spawn) do
					local ucat = self.unit_categories.german[tostring(spawn_data.unit)]
					if spawn_data and spawn_data.unit and (not ucat or (ucat and not ucat.special_type)) then
						spawn_data.unit = "german_flamethrower"
					end
				end
			end
		end
	end
end)