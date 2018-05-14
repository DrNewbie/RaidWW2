if not GrenadeCluster then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

GrenadeCluster = slot0
function GrenadeCluster:init(unit)
	slot5 = unit

	GrenadeCluster.super.init(slot3, self)

	return 
end
function GrenadeCluster:_setup_from_tweak_data()
	local grenade_entry = self.name_id
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._mass_look_up_modifier = self._tweak_data.mass_look_up_modifier
	self._range = self._tweak_data.range
	self._effect_name = self._tweak_data.effect_name or "effects/vanilla/explosions/exp_hand_grenade_001"
	self._curve_pow = self._tweak_data.curve_pow or 3
	self._damage = self._tweak_data.damage
	self._killzone_range = self._tweak_data.killzone_range or 0.1
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
function GrenadeCluster:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot29 = damage

	self._detonate(slot15, self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, ...)

	return 
end
function GrenadeCluster:_on_collision(col_ray)
	slot4 = self

	self._detonate(slot3)

	return 
end
function GrenadeCluster:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot16 = self._unit
	local pos = self._unit.position(slot15)
	local normal = math.UP
	local range = self._range
	slot20 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot18, managers.slot)
	slot20 = self
	local thrower_peer_id = self.get_thrower_peer_id(managers.slot)

	if thrower_peer_id then
		slot21 = managers.network
		slot21 = managers.network.session(slot20)
		slot21 = managers.network.session(slot20).local_peer(slot20)

		if thrower_peer_id == managers.network.session(slot20).local_peer(slot20).id(slot20) then
			slot25 = 1
			self._range = self._range * managers.player.upgrade_value(slot21, managers.player, "player", "warcry_grenade_cluster_range")
			slot25 = 1
			self._damage = self._damage * managers.player.upgrade_value(slot21, managers.player, "player", "warcry_grenade_cluster_damage")
		else
			slot26 = 1
			self._range = self._range * managers.warcry.peer_warcry_upgrade_value(slot21, managers.warcry, thrower_peer_id, "player", "warcry_grenade_cluster_range")
			slot26 = 1
			self._damage = self._damage * managers.warcry.peer_warcry_upgrade_value(slot21, managers.warcry, thrower_peer_id, "player", "warcry_grenade_cluster_damage")
		end
	end

	slot24 = self._player_damage

	managers.explosion.give_local_player_dmg(slot20, managers.explosion, pos, range)

	slot25 = self._custom_params

	managers.explosion.play_sound_and_effects(slot20, managers.explosion, pos, normal, range)

	local hit_units, splinters = managers.explosion.detect_and_give_dmg(slot20, managers.explosion)
	slot23 = managers.network
	slot27 = GrenadeBase.EVENT_IDS.detonate

	managers.network.session({
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self._curve_pow,
		damage = self._damage,
		ignore_unit = self._unit,
		alert_radius = self._alert_radius,
		user = self._unit,
		killzone_range = self._killzone_range
	}).send_to_peers_synched(, managers.network.session(), "sync_unit_event_id_16", self._unit, "base")

	slot24 = 0

	self._unit.set_slot(, self._unit)

	return 
end
function GrenadeCluster:set_range(range)
	self._range = range

	return 
end
function GrenadeCluster:set_damage(damage)
	self._damage = damage

	return 
end
function GrenadeCluster:_detonate_on_client()
	slot3 = self._unit
	local pos = self._unit.position(slot2)
	local range = self._range
	local thrower_peer_id = self.get_thrower_peer_id(slot4)
	slot6 = self
	local parent_projectile_id = self.get_parent_projectile_id(self)

	if thrower_peer_id and parent_projectile_id then
		self._range = tweak_data.projectiles[parent_projectile_id].range
		self._damage = tweak_data.projectiles[parent_projectile_id].damage
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		slot7 = managers.network.session(slot6).local_peer(slot6)

		if thrower_peer_id == managers.network.session(slot6).local_peer(slot6).id(slot6) then
			slot11 = 1
			self._range = self._range * managers.player.upgrade_value(slot7, managers.player, "player", "warcry_grenade_cluster_range")
			slot11 = 1
			self._damage = self._damage * managers.player.upgrade_value(slot7, managers.player, "player", "warcry_grenade_cluster_damage")
		else
			slot12 = 1
			self._range = self._range * managers.warcry.peer_warcry_upgrade_value(slot7, managers.warcry, thrower_peer_id, "player", "warcry_grenade_cluster_range")
			slot12 = 1
			self._damage = self._damage * managers.warcry.peer_warcry_upgrade_value(slot7, managers.warcry, thrower_peer_id, "player", "warcry_grenade_cluster_damage")
		end
	end

	slot10 = self._player_damage

	managers.explosion.give_local_player_dmg(slot6, managers.explosion, pos, range)

	slot14 = self._custom_params

	managers.explosion.explode_on_client(slot6, managers.explosion, pos, math.UP, nil, self._damage, range, self._curve_pow)

	return 
end
function GrenadeCluster:bullet_hit()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	slot3 = "GrenadeCluster:bullet_hit()"

	print(slot2)

	self._timer = nil
	slot3 = self

	self._detonate(slot2)

	return 
end

return 
