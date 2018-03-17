local AllEnemySizeNow = -1
Hooks:PostHook(EnemyManager, "update", "HudEnemyCounter.Post.EnemyManager.update", function(self, t, dt)
	if managers.hud._hud_enemy_counter then
		local _size = table.size(self:all_enemies())
		if AllEnemySizeNow ~= _size then
			AllEnemySizeNow = _size
			managers.hud._hud_enemy_counter:set_num_enemies({nr_enemies = AllEnemySizeNow})
		end
	end
end)