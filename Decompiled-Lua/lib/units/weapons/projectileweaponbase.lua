if not ProjectileWeaponBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

ProjectileWeaponBase = slot0
function ProjectileWeaponBase:init(...)
	slot3 = self

	ProjectileWeaponBase.super.init(slot2, ...)

	slot3 = self
	self._projectile_type_index = self.weapon_tweak_data(slot2).projectile_type_index

	return 
end
local mvec_spread_direction = Vector3()
function ProjectileWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local unit = nil
	slot14 = user_unit
	local spread = self._get_spread(slot12, self)
	slot15 = direction

	mvector3.set(self, mvec_spread_direction)

	if spread then
		slot15 = spread * (spread_mul or 1)

		mvector3.spread(slot13, mvec_spread_direction)
	end

	local projectile_type_index = self._projectile_type_index or 2

	if self._ammo_data and self._ammo_data.launcher_grenade then
		slot16 = self._ammo_data.launcher_grenade
		projectile_type_index = tweak_data.blackmarket.get_index_from_projectile_id(slot14, tweak_data.blackmarket)
	end

	slot16 = mvec_spread_direction

	self._adjust_throw_z(slot14, self)

	slot16 = self
	mvec_spread_direction = mvec_spread_direction * self.projectile_speed_multiplier(self)
	slot15 = self
	local spawn_offset = self._get_spawn_offset(self.projectile_speed_multiplier(self))
	self._dmg_mul = dmg_mul or 1

	if not self._client_authoritative then
		slot16 = Network

		if Network.is_client(slot15) then
			slot16 = managers.network
			slot21 = 0

			managers.network.session(slot15).send_to_host(slot15, managers.network.session(slot15), "request_throw_projectile", projectile_type_index, from_pos, mvec_spread_direction)
		else
			slot18 = mvec_spread_direction
			slot21 = managers.network
			slot21 = managers.network.session(slot20)
			slot21 = managers.network.session(slot20).local_peer(slot20)
			unit = ProjectileBase.throw_projectile(slot15, projectile_type_index, from_pos, managers.network.session(slot20).local_peer(slot20).id(slot20))
		end
	else
		slot18 = mvec_spread_direction
		slot21 = managers.network
		slot21 = managers.network.session(slot20)
		slot21 = managers.network.session(slot20).local_peer(slot20)
		unit = ProjectileBase.throw_projectile(slot15, projectile_type_index, from_pos, managers.network.session(slot20).local_peer(slot20).id(slot20))
	end

	slot17 = {
		hit = false,
		weapon_unit = self._unit
	}

	managers.statistics.shot_fired(slot15, managers.statistics)

	return {}
end
function ProjectileWeaponBase:_update_stats_values()
	slot3 = self

	ProjectileWeaponBase.super._update_stats_values(slot2)

	if self._ammo_data and self._ammo_data.projectile_type_index ~= nil then
		self._projectile_type_index = self._ammo_data.projectile_type_index
	end

	return 
end
function ProjectileWeaponBase:_adjust_throw_z(m_vec)
	return 
end
function ProjectileWeaponBase:projectile_damage_multiplier()
	return self._dmg_mul
end
function ProjectileWeaponBase:projectile_speed_multiplier()
	return 1
end
function ProjectileWeaponBase:_get_spawn_offset()
	return 0
end

return 
