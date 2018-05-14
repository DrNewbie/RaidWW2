if not HybridReloadRaycastWeaponBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

HybridReloadRaycastWeaponBase = slot0
function HybridReloadRaycastWeaponBase:start_reload(...)
	slot3 = self
	self._started_reload_empty = self.clip_empty(slot2)
	slot3 = self

	if self.use_shotgun_reload(slot2) then
		local speed_multiplier = self.reload_speed_multiplier(slot2)
		slot4 = managers.player
		slot5 = self
		self._next_shell_reloded_t = managers.player.player_timer(self).time(self) + self._first_shell_reload_expire_t(managers.player.player_timer(self)) / speed_multiplier
	end

	return 
end
function HybridReloadRaycastWeaponBase:use_shotgun_reload()
	slot3 = self
	local is_empty = self.mag_is_empty(slot2)

	return not is_empty
end
function HybridReloadRaycastWeaponBase:mag_is_empty()
	slot3 = self
	self._mag_is_empty = self.clip_empty(slot2)

	return self._mag_is_empty
end
function HybridReloadRaycastWeaponBase:reload_interuptable()
	if self._started_reload_empty then
		slot3 = self

		if not self.use_shotgun_reload(slot2) then
			return false
		end
	end

	return true
end
function HybridReloadRaycastWeaponBase:update_reloading(t, dt, time_left)
	slot6 = self

	if self.use_shotgun_reload(slot5) and self._next_shell_reloded_t and self._next_shell_reloded_t < t then
		slot6 = self
		local speed_multiplier = self.reload_speed_multiplier(slot5)
		slot8 = self
		self._next_shell_reloded_t = self._next_shell_reloded_t + self.reload_shell_expire_t(slot7) / speed_multiplier
		slot7 = self
		slot13 = self
		slot11 = self.get_ammo_remaining_in_clip(self) + 1

		self.set_ammo_remaining_in_clip(self.reload_shell_expire_t(slot7) / speed_multiplier, math.min(slot9, self.get_ammo_max_per_clip(slot11)))

		slot11 = self._name_id
		slot10 = true

		managers.raid_job.set_memory(self.reload_shell_expire_t(slot7) / speed_multiplier, managers.raid_job, "kill_count_no_reload_" .. tostring(self.get_ammo_max_per_clip(slot11)), nil)

		return true
	end

	return 
end

return 
