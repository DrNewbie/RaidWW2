Hooks:PostHook(WeaponTweakData, "init", "F_"..Idstring("Post.WeaponTweakData.init.BarrageBomb"):key(), function(self, tweak_data)
	self.shotty.CLIP_AMMO_MAX = 1
	self.shotty.NR_CLIPS_MAX = 1
	self.shotty.AMMO_MAX = 1
	self.shotty.AMMO_PICKUP = {0.1, 0.2}
	self.shotty.timers = {
		reload_not_empty = 10,
		reload_empty = 10,
		unequip = 4,
		equip = 4
	}
end)