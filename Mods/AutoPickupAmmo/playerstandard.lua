function PlayerStandard:_find_pickups(list)
	local pickups = World:find_units_quick("sphere", self._unit:movement():m_pos(), 200) or {}
	if pickups and #pickups > 0 then
		for _, pickup in pairs(pickups) do
			if pickup:interaction() and pickup:interaction().tweak_data then
				if list[pickup:interaction().tweak_data] and pickup:pickup() and pickup:pickup():pickup(self._unit) then
					for id, weapon in pairs(self._unit:inventory():available_selections()) do
						managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
					end
				end
			end
		end
	end
end

Hooks:PostHook(PlayerStandard, "_update_check_actions", "F_"..Idstring("Post.PlyStand._update_check_actions.Auto Pickup Ammo"):key(), function(self)
	if self._find_pickups_dt then
		self._find_pickups_dt = nil
	else
		self._find_pickups_dt = true
		self:_find_pickups({ammo_bag = true, ammo_bag_small = true})
	end
end)