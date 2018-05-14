-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
M79GrenadeBase = M79GrenadeBase or class()
M79GrenadeBase.spawn = function (unit_name, pos, rot)
	slot8 = unit_name
	slot8 = rot
	local unit = World.spawn_unit(slot4, World, Idstring(slot7), pos)

	return unit
end
M79GrenadeBase.init = function (self, unit)
	self._unit = unit
	slot4 = unit
	self._new_pos = unit.position(slot3)
	slot5 = "bullet_impact_targets"
	self._collision_slotmask = managers.slot.get_mask(slot3, managers.slot)
	slot4 = unit
	self._spawn_pos = unit.position(slot3)
	self._hidden = true
	slot5 = false

	self._unit.set_visible(slot3, self._unit)

	self._player_damage = 9

	return 
end
M79GrenadeBase.launch = function (self, params)
	self._owner = params.owner
	self._user = params.user
	self._damage = params.damage
	self._range = params.range
	self._curve_pow = params.curve_pow
	self._velocity = params.dir * 4000
	slot4 = self._unit
	self._last_pos = self._unit.position(slot3)
	slot4 = self._last_pos
	self._last_last_pos = mvector3.copy(slot3)
	self._upd_interval = 0.1
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	self._last_upd_t = TimerManager.game(slot3).time(slot3)
	self._next_upd_t = self._last_upd_t + self._upd_interval
	self._auto_explode_t = self._last_upd_t + 3

	return 
end
M79GrenadeBase.update = function (self, unit, t, dt)
	if self._auto_explode_t < t then
		slot6 = self

		self._detonate(slot5)

		return 
	end

	if t < self._next_upd_t then
		return 
	end

	local dt = t - self._last_upd_t
	slot8 = self._last_pos

	mvector3.set(slot6, self._last_last_pos)

	slot8 = self._new_pos

	mvector3.set(slot6, self._last_pos)

	slot8 = dt

	self._upd_velocity(slot6, self)

	slot7 = self

	if self._chk_collision(slot6) then
		slot7 = self

		self._detonate(slot6)

		return 
	end

	slot7 = self

	self._upd_position(slot6)

	if self._hidden then
		local safe_dis_sq = 120
		safe_dis_sq = safe_dis_sq * safe_dis_sq
		slot9 = self._last_pos

		if safe_dis_sq < mvector3.distance_sq(slot7, self._spawn_pos) then
			self._hidden = false
			slot9 = true

			self._unit.set_visible(slot7, self._unit)
		end
	end

	self._last_upd_t = t
	self._next_upd_t = t + self._upd_interval

	return 
end
M79GrenadeBase._upd_velocity = function (self, dt)
	local new_vel_z = mvector3.z(slot3) - dt * 981
	slot6 = new_vel_z

	mvector3.set_z(self._velocity, self._velocity)

	slot6 = self._velocity

	mvector3.set(self._velocity, self._new_pos)

	slot6 = dt

	mvector3.multiply(self._velocity, self._new_pos)

	slot6 = self._last_pos

	mvector3.add(self._velocity, self._new_pos)

	return 
end
M79GrenadeBase._upd_position = function (self)
	slot4 = self._new_pos

	self._unit.set_position(slot2, self._unit)

	return 
end
M79GrenadeBase._chk_collision = function (self)
	slot8 = self._collision_slotmask
	local col_ray = World.raycast(slot2, World, "ray", self._last_pos, self._new_pos, "slot_mask")

	if not col_ray then
		slot9 = self._collision_slotmask
		col_ray = World.raycast(slot3, World, "ray", self._last_last_pos, self._new_pos, "slot_mask")
	end

	if col_ray then
		self._col_ray = col_ray

		return true
	end

	return 
end
M79GrenadeBase._detonate = function (self)

	-- Decompilation error in this vicinity:
	if self._detonated then
		slot1 = debug_pause
		slot3 = "[M79GrenadeBase:_detonate] grenade has already detonated"
		slot4 = self._unit
		slot7 = self._unit

		if alive(slot6) then
			slot7 = self._unit
			slot5 = self._unit.slot(slot6)
		end

		slot1(slot2, slot3, slot4)

		slot3 = self._unit

		if self._unit.slot(slot2) == 0 then
			slot4 = 14

			self._unit.set_slot(slot2, self._unit)
		end

		slot4 = 0

		self._unit.set_slot(slot2, self._unit)

		return 
	end

	self._detonated = true
	local expl_normal = mvector3.copy(slot2)
	slot4 = expl_normal

	mvector3.negate(self._velocity)

	slot4 = expl_normal

	mvector3.normalize(self._velocity)

	local expl_pos = mvector3.copy(self._velocity)
	slot6 = 30

	mvector3.multiply(expl_normal, expl_pos)

	if self._col_ray then
		slot6 = self._col_ray.position

		mvector3.add(slot4, expl_pos)
	else
		slot6 = self._new_pos

		mvector3.add(slot4, expl_pos)
	end

	slot8 = self._range

	managers.explosion.play_sound_and_effects(slot4, managers.explosion, expl_pos, expl_normal)

	slot6 = 0

	self._unit.set_slot(slot4, self._unit)

	slot5 = self._owner
	slot6 = expl_pos

	GrenadeBase._detect_and_give_dmg(slot4, self)

	slot5 = managers.network
	slot12 = self._curve_pow

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "m79grenade_explode_on_client", expl_pos, expl_normal, self._user, self._damage, self._range)

	return 
end

return 
