function PlayerStandard:_find_pickups(t, list)
	local pickups = World:find_units_quick("sphere", self._unit:movement():m_pos(), 200)
	for _, pickup in ipairs(pickups) do
		if pickup:interaction() and pickup:interaction().tweak_data and list[pickup:interaction().tweak_data] then
			if pickup:pickup() and pickup:pickup():pickup(self._unit) then
				for id, weapon in pairs(self._unit:inventory():available_selections()) do
					managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
				end
			end
		end
	end
end

Hooks:PostHook(PlayerStandard, "_update_check_actions", "F_"..Idstring("Post.PlyStand._update_check_actions.Auto Pickup Ammo"):key(), function(self, t, dt)
	if self._find_pickups_dt then
		self._find_pickups_dt = self._find_pickups_dt - dt
		if self._find_pickups_dt < 0 then
			self._find_pickups_dt = nil
		end
	else
		self._find_pickups_dt = 0.25
		self:_find_pickups(t, {ammo_bag = true, ammo_bag_small = true})
	end
end)