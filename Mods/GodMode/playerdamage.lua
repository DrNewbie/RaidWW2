Hooks:PostHook(PlayerDamage, "init", "GodModePlyInit", function(self)
	self._invulnerable = true
end)

local GodModePlySet = PlayerDamage.set_invulnerable
function PlayerDamage:set_invulnerable(...)
	return GodModePlySet(self, true)
end