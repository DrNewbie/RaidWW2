Hooks:PostHook(PlayerManager, "on_throw_grenade", "InfiniteGrenade_Give", function(self)
	self:refill_grenades()
end)