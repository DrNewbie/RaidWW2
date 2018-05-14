if not FragGrenade then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

FragGrenade = slot0
FragGrenade.MAX_CLUSTER_ATTEMPTS = 15
function FragGrenade:_setup_from_tweak_data()
	local grenade_entry = self.name_id
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._init_timer = self._tweak_data.init_timer or 2.5
	self._mass_look_up_modifier = self._tweak_data.mass_look_up_modifier
	self._range = self._tweak_data.range
	slot5 = BuffEffectManager.EFFECT_GRENADE_RADIUS

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot6 = BuffEffectManager.EFFECT_GRENADE_RADIUS
		self._range = self._range + (managers.buff_effect.get_effect_value(slot4, managers.buff_effect) * 100 or 0)
	end

	self._effect_name = self._tweak_data.effect_name or "effects/vanilla/explosions/exp_hand_grenade_001"
	self._curve_pow = self._tweak_data.curve_pow or 3
	self._killzone_range = self._tweak_data.killzone_range or 0.5
	self._damage = self._tweak_data.damage
	slot5 = BuffEffectManager.EFFECT_GRENADE_DAMAGE

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot6 = BuffEffectManager.EFFECT_GRENADE_DAMAGE
		self._damage = self._damage * (managers.buff_effect.get_effect_value(slot4, managers.buff_effect) or 1)
	end

	self._player_damage = self._tweak_data.player_damage
	self._alert_radius = self._tweak_data.alert_radius
	local sound_event = self._tweak_data.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	return 
end
function FragGrenade:set_thrower_unit(unit)
	slot5 = unit

	FragGrenade.super.set_thrower_unit(slot3, self)

	self._clusters_to_spawn = 0
	slot4 = managers.network
	slot5 = self._thrower_unit
	local peer = managers.network.session(slot3).peer_by_unit(slot3, managers.network.session(slot3))
	self.cluster_range = self._range
	self.cluster_damage = self._damage

	if peer then
		slot6 = managers.network
		slot6 = managers.network.session(slot5)

		if peer._id == managers.network.session(slot5).local_peer(slot5)._id then
			slot8 = 0
			self._clusters_to_spawn = managers.player.upgrade_value(slot4, managers.player, "player", "warcry_grenade_clusters")
			slot9 = self.cluster_range
			self.cluster_range = self.cluster_range * managers.player.upgrade_value(managers.player, managers.player, "player", "warcry_grenade_cluster_range")
			slot9 = self.cluster_damage
			self.cluster_damage = self.cluster_damage * managers.player.upgrade_value(managers.player, managers.player, "player", "warcry_grenade_cluster_damage")
		else
			slot9 = 0
			self._clusters_to_spawn = managers.warcry.peer_warcry_upgrade_value(slot4, managers.warcry, peer._id, "player", "warcry_grenade_clusters")
			slot10 = self.cluster_range
			self.cluster_range = self.cluster_range * managers.warcry.peer_warcry_upgrade_value(managers.warcry, managers.warcry, peer._id, "player", "warcry_grenade_cluster_range")
			slot10 = self.cluster_damage
			self.cluster_damage = self.cluster_damage * managers.warcry.peer_warcry_upgrade_value(managers.warcry, managers.warcry, peer._id, "player", "warcry_grenade_cluster_damage")
		end
	end

	slot5 = "----------Number of Cluster grenades:" .. self._clusters_to_spawn

	print(slot4)

	return 
end
function FragGrenade:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot29 = damage

	self._detonate(slot15, self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, ...)

	return 
end
function FragGrenade:_on_collision(col_ray)
	slot4 = self

	self._detonate(slot3)

	return 
end
function FragGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot16 = self._unit
	local pos = self._unit.position(slot15)
	local normal = math.UP
	local range = self._range
	slot20 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot18, managers.slot)
	slot23 = self._player_damage

	managers.explosion.give_local_player_dmg(managers.slot, managers.explosion, pos, range)

	slot24 = self._custom_params

	managers.explosion.play_sound_and_effects(managers.slot, managers.explosion, pos, normal, range)

	slot21 = {
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self._curve_pow,
		damage = self._damage,
		ignore_unit = self._unit,
		alert_radius = self._alert_radius,
		user = self._unit,
		owner = self._unit,
		killzone_range = self._killzone_range
	}
	local hit_units, splinters, results = managers.explosion.detect_and_give_dmg(managers.slot, managers.explosion)
	local thrower_peer_id = self.get_thrower_peer_id(self._killzone_range)
	slot24 = managers.network
	slot25 = thrower_peer_id
	local thrower_peer = managers.network.session(self).peer(self, managers.network.session(self))

	if thrower_peer_id and results and 5 <= results.count_cop_kills then
		local achievement_id = "ach_kill_enemies_with_single_grenade_5"

		if thrower_peer_id == 1 then
			slot27 = achievement_id

			managers.achievment.award(slot25, managers.achievment)
		else
			slot26 = managers.network
			slot29 = achievement_id

			managers.network.session(slot25).send_to_peer(slot25, managers.network.session(slot25), thrower_peer, "sync_award_achievement")
		end
	end

	slot25 = managers.network
	slot29 = GrenadeBase.EVENT_IDS.detonate

	managers.network.session(slot24).send_to_peers_synched(slot24, managers.network.session(slot24), "sync_unit_event_id_16", self._unit, "base")

	slot26 = 0

	self._unit.set_slot(slot24, self._unit)

	if not self._thrower_unit then
		return 
	end

	local spawn_attempts = 0

	if 0 < self._clusters_to_spawn then
		slot27 = "cluster"
		local index = tweak_data.blackmarket.get_index_from_projectile_id(slot25, tweak_data.blackmarket)
		local unit_position = self._unit.position(tweak_data.blackmarket)
		slot30 = unit_position.z + 2
		unit_position = Vector3(self._unit, unit_position.x, unit_position.y)
		local clusters_spawned = 0

		while clusters_spawned < self._clusters_to_spawn do
			slot33 = 30
			slot34 = 30
			slot35 = 50
			slot31 = unit_position.z + math.random(-30, 20)
			local spawn_position = Vector3(slot28, unit_position.x + math.random(slot31, -30), unit_position.y + math.random(-30, -30))
			slot34 = "slot_mask"
			slot38 = "bullet_impact_targets"
			local collision = World.raycast(unit_position.x + math.random(slot31, -30), World, "ray", unit_position, spawn_position, managers.slot.get_mask(slot36, managers.slot))

			if not collision then
				local direction = spawn_position - unit_position.normalized(slot30)
				slot37 = managers.network
				slot37 = managers.network.session(slot36)
				slot37 = managers.network.session(slot36).local_peer(slot36)
				slot37 = self.name_id
				local cluster = ProjectileBase.throw_projectile(spawn_position - unit_position, index, spawn_position, direction, managers.network.session(slot36).local_peer(slot36).id(slot36), nil)
				slot33 = cluster
				slot34 = self.cluster_range

				cluster.base(index).set_range(index, cluster.base(index))

				slot33 = cluster
				slot34 = self.cluster_damage

				cluster.base(index).set_damage(index, cluster.base(index))

				clusters_spawned = clusters_spawned + 1
				slot34 = "FragGrenade -- Spawned cluster @:" .. spawn_position .. ", start pos: " .. pos

				Application.debug(index, Application)

				slot34 = "FragGrenade -- Cluster_range:" .. self.cluster_range .. ", cluster damage: " .. self.cluster_damage

				Application.debug(index, Application)
			else
				slot32 = "[FragGrenade:_detonate] Trying to spawn a cluser, but there is a collision!"

				Application.debug(slot30, Application)

				slot35 = spawn_position
				slot32 = "[FragGrenade:_detonate] Spawn position: \t" .. inspect(slot34)

				Application.debug(slot30, Application)

				slot35 = collision.position
				slot32 = "[FragGrenade:_detonate] Hit position: \t" .. inspect(slot34)

				Application.debug(slot30, Application)

				slot35 = unit_position
				slot32 = "[FragGrenade:_detonate] unit position: \t" .. inspect(slot34)

				Application.debug(slot30, Application)

				slot35 = collision.unit
				slot32 = "[FragGrenade:_detonate] Unit hit: \t\t" .. inspect(slot34)

				Application.debug(slot30, Application)

				if FragGrenade.MAX_CLUSTER_ATTEMPTS < spawn_attempts then
					slot32 = "[FragGrenade:_detonate] ----------------------------------------------"

					Application.debug(slot30, Application)

					slot32 = "[FragGrenade:_detonate] Gave up trying to spawn clsuters, reached max munber of attempts"

					Application.debug(slot30, Application)

					return 
				end
			end

			spawn_attempts = spawn_attempts + 1
		end
	end

	return 
end
function FragGrenade:_detonate_on_client()
	slot3 = self._unit
	local pos = self._unit.position(slot2)
	local range = self._range
	slot8 = self._player_damage

	managers.explosion.give_local_player_dmg(slot4, managers.explosion, pos, range)

	slot12 = self._custom_params

	managers.explosion.explode_on_client(slot4, managers.explosion, pos, math.UP, nil, self._damage, range, self._curve_pow)

	return 
end
function FragGrenade:bullet_hit()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	slot3 = "FragGrenade:bullet_hit()"

	print(slot2)

	self._timer = nil
	slot3 = self

	self._detonate(slot2)

	return 
end

return 
