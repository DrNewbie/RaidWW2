-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
SentryGunDamage = SentryGunDamage or class()
SentryGunDamage._HEALTH_GRANULARITY = CopDamage._HEALTH_GRANULARITY
SentryGunDamage._ATTACK_VARIANTS = CopDamage._ATTACK_VARIANTS
function SentryGunDamage:init(unit)
	self._unit = unit
	slot4 = unit
	self._ext_movement = unit.movement(slot3)
	slot4 = unit
	slot4 = unit.base(slot3)

	unit.base(slot3).post_init(slot3)

	slot4 = unit
	slot4 = unit.brain(slot3)

	unit.brain(slot3).post_init(slot3)

	slot4 = unit
	slot4 = unit.movement(slot3)

	unit.movement(slot3).post_init(slot3)

	self._HEALTH_INIT = 10000
	self._SHIELD_HEALTH_INIT = 10000

	if self._shield_body_name then
		slot4 = self._shield_body_name
		self._shield_body_name_ids = Idstring(slot3)
	end

	if self._bag_body_name then
		slot4 = self._bag_body_name
		self._bag_body_name_ids = Idstring(slot3)
	end

	if self._invulnerable_body_names then
		self._invulnerable_bodies = {}
		slot5 = " "
		local names_split = string.split(slot3, self._invulnerable_body_names)
		slot5 = names_split

		for _, name_ids in ipairs(self._invulnerable_body_names) do
			slot11 = name_ids
			self._invulnerable_bodies[name_ids.key(slot10)] = true
		end
	end

	self._health = self._HEALTH_INIT
	self._shield_health = self._SHIELD_HEALTH_INIT
	self._shield_smoke_level = 0
	self._shield_smoke_levels = {}
	slot5 = self._shield_smoke_level_1

	table.insert(slot3, self._shield_smoke_levels)

	slot5 = self._shield_smoke_level_2

	table.insert(slot3, self._shield_smoke_levels)

	slot5 = self._shield_smoke_level_3

	table.insert(slot3, self._shield_smoke_levels)

	slot4 = self._shield_smoke_levels
	self._num_shield_smoke_levels = table.getn(slot3)
	self._sync_dmg_leftover = 0

	if self._ignore_client_damage then
		slot4 = Network

		if Network.is_server(slot3) then
			self._HEALTH_GRANULARITY = 5
		else
			self._health_ratio = 1
		end
	end

	self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
	self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY
	self._invulnerable = true
	self._no_blood = true

	return 
end
function SentryGunDamage:set_health(amount, shield_health_amount)
	self._health = amount
	self._HEALTH_INIT = amount
	self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
	self._shield_health = shield_health_amount
	self._SHIELD_HEALTH_INIT = shield_health_amount
	self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY

	return 
end
function SentryGunDamage:sync_health(health_ratio)
	self._health_ratio = health_ratio / self._HEALTH_GRANULARITY

	if health_ratio == 0 then
		slot4 = self

		self.die(slot3)
	end

	return 
end
function SentryGunDamage:shoot_pos_mid(m_pos)
	slot4 = m_pos
	slot7 = self._ext_movement

	mvector3.set(slot3, self._ext_movement.m_head_pos(slot6))

	return 
end
function SentryGunDamage:damage_bullet(attack_data)

	-- Decompilation error in this vicinity:
	local hit_body = attack_data.col_ray.body
	slot5 = hit_body
	local hit_body_name = hit_body.name(slot4)

	if self._invulnerable_bodies then
		slot7 = hit_body_name

		if self._invulnerable_bodies[hit_body_name.key(slot6)] then
			return 
		end
	end

	local hit_shield = attack_data.col_ray.body and hit_body_name == self._shield_body_name_ids
	local hit_bag = attack_data.col_ray.body and hit_body_name == self._bag_body_name_ids
	local dmg_adjusted = attack_data.damage
	slot10 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot9) then
		slot10 = self._unit
		slot10 = self._unit.base(slot9)
		self._char_tweak = tweak_data.weapon[self._unit.base(slot9).get_name_id(slot9)]
		slot10 = dmg_adjusted
		local critical_hit, damage = CopDamage.roll_critical_hit(self._unit.base(slot9).get_name_id(slot9), self)
		dmg_adjusted = damage

		if critical_hit then
			slot11 = managers.hud

			managers.hud.on_crit_confirmed(slot10)
		else
			slot11 = managers.hud

			managers.hud.on_hit_confirmed(slot10)
		end
	end

	if hit_shield then
		slot10 = self._unit
		slot10 = self._unit.base(slot9)
		dmg_adjusted = dmg_adjusted * tweak_data.weapon[self._unit.base(slot9).get_name_id(slot9)].SHIELD_DMG_MUL
	elseif hit_bag then
		slot10 = self._unit
		slot10 = self._unit.base(slot9)
		dmg_adjusted = dmg_adjusted * tweak_data.weapon[self._unit.base(slot9).get_name_id(slot9)].BAG_DMG_MUL

		if self._bag_hit_snd_event then
			slot9 = self._unit
			slot10 = self._bag_hit_snd_event

			self._unit.sound_source(slot8).post_event(slot8, self._unit.sound_source(slot8))
		end
	end

	dmg_adjusted = dmg_adjusted + self._sync_dmg_leftover
	local dmg_shield = nil

	if hit_shield and 0 < self._shield_health then
		dmg_shield = true
	end

	local result = {
		variant = "bullet",
		type = "dmg_rcv"
	}
	slot15 = true
	local damage_sync = self._apply_damage(slot10, self, dmg_adjusted, dmg_shield, not dmg_shield)

	if self._ignore_client_damage then
		local health_percent = math.ceil(slot11)
		slot13 = self._unit
		slot15 = health_percent

		self._unit.network(self._health / self._HEALTH_INIT_PERCENT).send(self._health / self._HEALTH_INIT_PERCENT, self._unit.network(self._health / self._HEALTH_INIT_PERCENT), "sentrygun_health")
	else

		-- Decompilation error in this vicinity:
		if not damage_sync or damage_sync == 0 then
			return 
		end

		local attacker = attack_data.attacker_unit
		slot14 = hit_body_name
		local body_index = self._unit.get_body_index(slot12, self._unit)
		slot14 = self._unit
		slot20 = (self._dead and true) or false

		self._unit.network(self._unit).send(slot13, self._unit.network(self._unit), "damage_bullet", attacker, damage_sync, body_index, 0)
	end

	if not self._dead then
		slot12 = self._unit
		slot13 = attack_data.attacker_unit

		self._unit.brain(slot11).on_damage_received(slot11, self._unit.brain(slot11))
	end

	local attacker_unit = attack_data and attack_data.attacker_unit
	slot13 = attacker_unit

	if alive(slot12) then
		slot13 = attacker_unit

		if attacker_unit.base(slot12) then
			slot13 = attacker_unit

			if attacker_unit.base(slot12).thrower_unit then
				slot13 = attacker_unit
				slot13 = attacker_unit.base(slot12)
				attacker_unit = attacker_unit.base(slot12).thrower_unit(slot12)
			end
		end
	end

	slot13 = managers.player

	if attacker_unit == managers.player.player_unit(slot12) and attack_data then
		slot15 = attack_data

		managers.player.on_damage_dealt(slot12, managers.player, self._unit)
	end

	return result
end
function SentryGunDamage:damage_fire(attack_data)

	-- Decompilation error in this vicinity:
	local attacker_unit = attack_data.attacker_unit

	if attacker_unit then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				slot5 = attacker_unit
				slot5 = attacker_unit.base(slot4)
				attacker_unit = attacker_unit.base(slot4).thrower_unit(slot4)
			end
		end
	end

	if attacker_unit then
		slot6 = attacker_unit

		if PlayerDamage.is_friendly_fire(slot4, self) then
			return 
		end
	end

	slot7 = self._unit
	slot7 = self._unit.base(slot6)
	local damage = attack_data.damage * tweak_data.weapon[self._unit.base(slot6).get_name_id(slot6)].FIRE_DMG_MUL
	damage = damage + self._sync_dmg_leftover
	slot10 = true
	local damage_sync = self._apply_damage(self._unit.base(slot6).get_name_id(slot6), self, damage, true, true)

	if self._ignore_client_damage then
		local health_percent = math.ceil(slot6)
		slot8 = self._unit
		slot10 = health_percent

		self._unit.network(self._health / self._HEALTH_INIT_PERCENT).send(self._health / self._HEALTH_INIT_PERCENT, self._unit.network(self._health / self._HEALTH_INIT_PERCENT), "sentrygun_health")
	else

		-- Decompilation error in this vicinity:
		if not damage_sync or damage_sync == 0 then
			return 
		end

		local attacker = attack_data.attacker_unit
		slot9 = attack_data.variant
		local i_attack_variant = CopDamage._get_attack_variant_index(slot7, self)
		slot9 = self._unit

		self._unit.network(self).send(slot8, self._unit.network(self), "damage_fire", attacker, damage_sync, false, (self._dead and true) or false, attack_data.col_ray.ray, nil)
	end

	if not self._dead then
		slot7 = self._unit
		slot8 = attack_data.attacker_unit

		self._unit.brain(slot6).on_damage_received(slot6, self._unit.brain(slot6))
	end

	local attacker_unit = attack_data and attack_data.attacker_unit
	slot8 = attacker_unit

	if alive(slot7) then
		slot8 = attacker_unit

		if attacker_unit.base(slot7) then
			slot8 = attacker_unit

			if attacker_unit.base(slot7).thrower_unit then
				slot8 = attacker_unit
				slot8 = attacker_unit.base(slot7)
				attacker_unit = attacker_unit.base(slot7).thrower_unit(slot7)
			end
		end
	end

	slot8 = managers.player

	if attacker_unit == managers.player.player_unit(slot7) and attack_data then
		slot10 = attack_data

		managers.player.on_damage_dealt(slot7, managers.player, self._unit)
	end

	return 
end
function SentryGunDamage:damage_explosion(attack_data)

	-- Decompilation error in this vicinity:
	local attacker_unit = attack_data.attacker_unit

	if attacker_unit then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				slot5 = attacker_unit
				slot5 = attacker_unit.base(slot4)
				attacker_unit = attacker_unit.base(slot4).thrower_unit(slot4)
			end
		end
	end

	if attacker_unit then
		slot6 = attacker_unit

		if PlayerDamage.is_friendly_fire(slot4, self) then
			return 
		end
	end

	slot7 = self._unit
	slot7 = self._unit.base(slot6)
	local damage = attack_data.damage * tweak_data.weapon[self._unit.base(slot6).get_name_id(slot6)].EXPLOSION_DMG_MUL

	if attacker_unit then
		slot6 = managers.player

		if attacker_unit == managers.player.player_unit(slot5) then
			slot7 = self._unit
			slot7 = self._unit.base(slot6)
			self._char_tweak = tweak_data.weapon[self._unit.base(slot6).get_name_id(slot6)]
			slot7 = damage
			local critical_hit, crit_damage = CopDamage.roll_critical_hit(self._unit.base(slot6).get_name_id(slot6), self)
			damage = crit_damage

			if critical_hit then
				slot8 = managers.hud

				managers.hud.on_crit_confirmed(slot7)
			else
				slot8 = managers.hud

				managers.hud.on_hit_confirmed(slot7)
			end
		end
	end

	damage = damage + self._sync_dmg_leftover
	slot10 = true
	local damage_sync = self._apply_damage(slot5, self, damage, true, true)

	if self._ignore_client_damage then
		local health_percent = math.ceil(slot6)
		slot8 = self._unit
		slot10 = health_percent

		self._unit.network(self._health / self._HEALTH_INIT_PERCENT).send(self._health / self._HEALTH_INIT_PERCENT, self._unit.network(self._health / self._HEALTH_INIT_PERCENT), "sentrygun_health")
	else

		-- Decompilation error in this vicinity:
		if not damage_sync or damage_sync == 0 then
			return 
		end

		local attacker = attack_data.attacker_unit
		slot9 = attack_data.variant
		local i_attack_variant = CopDamage._get_attack_variant_index(slot7, self)
		slot9 = self._unit
		slot15 = attack_data.col_ray.ray

		self._unit.network(self).send(slot8, self._unit.network(self), "damage_explosion_fire", attacker, damage_sync, i_attack_variant, (self._dead and true) or false)
	end

	if not self._dead then
		slot7 = self._unit
		slot8 = attacker_unit

		self._unit.brain(slot6).on_damage_received(slot6, self._unit.brain(slot6))
	end

	local attacker_unit = attack_data and attack_data.attacker_unit
	slot8 = attacker_unit

	if alive(slot7) then
		slot8 = attacker_unit

		if attacker_unit.base(slot7) then
			slot8 = attacker_unit

			if attacker_unit.base(slot7).thrower_unit then
				slot8 = attacker_unit
				slot8 = attacker_unit.base(slot7)
				attacker_unit = attacker_unit.base(slot7).thrower_unit(slot7)
			end
		end
	end

	slot8 = managers.player

	if attacker_unit == managers.player.player_unit(slot7) and attack_data then
		slot10 = attack_data

		managers.player.on_damage_dealt(slot7, managers.player, self._unit)
	end

	return 
end
function SentryGunDamage:dead()
	return self._dead
end
function SentryGunDamage:needs_repair()
	return self._shield_health == 0
end
function SentryGunDamage:repair_shield()
	self._shield_health = self._SHIELD_HEALTH_INIT
	slot3 = self
	slot6 = self

	self.update_shield_smoke_level(slot2, self.shield_health_ratio(slot5))

	if self._shield_repaired_sequence_name then
		slot3 = self._unit
		slot4 = self._shield_repaired_sequence_name

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	self._shield_smoke_level = 0
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit
		slot4 = "turret_repair_shield"

		self._unit.network(slot2).send(slot2, self._unit.network(slot2))
	end

	return 
end
function SentryGunDamage:health_ratio()
	return self._health / self._HEALTH_INIT
end
function SentryGunDamage:shield_health_ratio()
	return self._shield_health / self._SHIELD_HEALTH_INIT
end
function SentryGunDamage:focus_delay_mul()
	return 1
end
function SentryGunDamage:die()
	self._health = 0
	self._dead = true
	slot4 = 26

	self._unit.set_slot(slot2, self._unit)

	slot3 = self._unit
	slot4 = false

	self._unit.brain(slot2).set_active(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = false

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	self._unit.movement(slot2).on_death(slot2)

	slot3 = managers.groupai
	slot4 = self._unit

	managers.groupai.state(slot2).on_criminal_neutralized(slot2, managers.groupai.state(slot2))

	slot3 = self._unit
	slot3 = self._unit.base(slot2)

	self._unit.base(slot2).on_death(slot2)

	slot3 = self._unit
	slot4 = self._breakdown_snd_event

	self._unit.sound_source(slot2).post_event(slot2, self._unit.sound_source(slot2))

	slot3 = self._unit
	slot3 = self._unit.base(slot2)

	if self._unit.base(slot2).has_shield(slot2) and self._death_with_shield_sequence_name then
		slot3 = self._unit
		slot4 = self._death_with_shield_sequence_name

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	elseif self._death_sequence_name then
		slot3 = self._unit
		slot4 = self._death_sequence_name

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	slot3 = self._unit

	if self._unit.interaction(slot2) then
		slot3 = self._unit
		slot4 = "sentry_gun_revive"

		self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))
	end

	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	local turret_units = managers.groupai.state(slot2).turrets(slot2)

	if turret_units then
		slot5 = self._unit

		if table.contains(slot3, turret_units) then
			slot4 = self._unit
			slot6 = true

			self._unit.contour(slot3).remove(slot3, self._unit.contour(slot3), "mark_unit_friendly")

			slot4 = self._unit
			slot6 = true

			self._unit.contour(slot3).remove(slot3, self._unit.contour(slot3), "mark_unit_dangerous")

			slot4 = managers.groupai
			slot5 = self._unit

			managers.groupai.state(slot3).unregister_turret(slot3, managers.groupai.state(slot3))
		end
	end

	slot5 = "tank_destroyed"

	managers.mission.call_global_event(slot3, managers.mission)

	return 
end
function SentryGunDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, death)
	if self._dead then
		return 
	end

	if death then
		slot8 = self

		self.die(slot7)

		return 
	end

	slot9 = i_body
	local hit_body = self._unit.body(slot7, self._unit)
	slot9 = hit_body
	local hit_shield = hit_body.name(self._unit) == self._shield_body_name_ids
	local dmg_shield = hit_shield and 0 < self._shield_health

	if death then
		slot9 = "death"
	else
		local damage = damage_percent * ((dmg_shield and self._SHIELD_HEALTH_INIT_PERCENT) or self._HEALTH_INIT_PERCENT)
	end

	slot16 = false

	self._apply_damage(slot11, self, damage, dmg_shield, not dmg_shield)

	if not self._dead then
		slot12 = self._unit
		slot13 = attacker_unit

		self._unit.brain(slot11).on_damage_received(slot11, self._unit.brain(slot11))
	end

	return 
end
function SentryGunDamage:sync_damage_fire(attacker_unit, damage_percent, death, direction)
	if self._dead then
		return 
	end

	if death then
		slot7 = self

		self.die(slot6)

		return 
	end

	local damage = (death and "death") or damage_percent * self._HEALTH_INIT_PERCENT
	slot12 = false

	self._apply_damage(slot7, self, damage, true, true)

	if not self._dead then
		slot8 = self._unit
		slot9 = attacker_unit

		self._unit.brain(slot7).on_damage_received(slot7, self._unit.brain(slot7))
	end

	return 
end
function SentryGunDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction)
	if self._dead then
		return 
	end

	if death then
		slot8 = self

		self.die(slot7)

		return 
	end

	local variant = self._ATTACK_VARIANTS[i_attack_variant]
	local damage = (death and "death") or damage_percent * self._HEALTH_INIT_PERCENT
	slot14 = false

	self._apply_damage(slot9, self, damage, true, true)

	if not self._dead then
		slot10 = self._unit
		slot11 = attacker_unit

		self._unit.brain(slot9).on_damage_received(slot9, self._unit.brain(slot9))
	end

	return 
end
function SentryGunDamage:_apply_damage(damage, dmg_shield, dmg_body, is_local)
	if dmg_shield and 0 < self._shield_health then
		local damage_percent = nil
		local shield_dmg = (damage ~= "death" and damage) or self._SHIELD_HEALTH_INIT
		slot10 = self._unit
		slot10 = self._unit.base(slot9)

		if tweak_data.weapon[self._unit.base(slot9).get_name_id(slot9)].SHIELD_DAMAGE_CLAMP then
			slot13 = self._unit
			slot13 = self._unit.base(slot12)
			slot10 = tweak_data.weapon[self._unit.base(slot12).get_name_id(slot12)].SHIELD_DAMAGE_CLAMP
			shield_dmg = math.min(slot8, shield_dmg)
		end

		if is_local then
			slot10 = self._unit
			slot10 = self._unit.base(slot9)
			shield_dmg = shield_dmg * tweak_data.weapon[self._unit.base(slot9).get_name_id(slot9)].SHIELD_DMG_MUL
			local health_init_percent = self._SHIELD_HEALTH_INIT_PERCENT
			slot12 = self._HEALTH_GRANULARITY
			damage_percent = math.clamp(slot9, shield_dmg / health_init_percent, 0)
			local leftover_percent = damage_percent - math.floor(slot9)
			self._sync_dmg_leftover = leftover_percent * health_init_percent
			slot11 = damage_percent
			damage_percent = math.floor(damage_percent)
			shield_dmg = damage_percent * health_init_percent
		end

		if 0 < shield_dmg then
			if self._shield_health <= shield_dmg then
				damage = damage - self._shield_health
				self._shield_health = 0
				self._sync_dmg_leftover = 0

				if self._shield_destroyed_sequence_name then
					slot9 = self._unit
					slot10 = self._shield_destroyed_sequence_name

					self._unit.damage(slot8).run_sequence_simple(slot8, self._unit.damage(slot8))
				end

				if self._shield_destroyed_snd_event then
					slot9 = self._unit
					slot10 = self._shield_destroyed_snd_event

					self._unit.sound_source(slot8).post_event(slot8, self._unit.sound_source(slot8))
				end

				slot9 = self
				slot12 = self

				self.update_shield_smoke_level(slot8, self.shield_health_ratio(slot11))
			else
				self._shield_health = self._shield_health - shield_dmg
				damage = damage - shield_dmg
				slot9 = self
				slot12 = self

				self.update_shield_smoke_level(slot8, self.shield_health_ratio(slot11))
			end

			if not dmg_body then
				return damage_percent
			end
		end
	end

	if dmg_body then
		local damage_percent = nil
		local body_damage = (damage ~= "death" and damage) or self._HEALTH_INIT

		if is_local then
			local health_init_percent = self._HEALTH_INIT_PERCENT
			slot12 = self._HEALTH_GRANULARITY
			damage_percent = math.clamp(slot9, body_damage / health_init_percent, 0)
			slot10 = damage_percent
			local leftover_percent = damage_percent - math.floor(slot9)
			self._sync_dmg_leftover = self._sync_dmg_leftover + leftover_percent * health_init_percent
			slot11 = damage_percent
			damage_percent = math.floor(leftover_percent * health_init_percent)
			body_damage = damage_percent * health_init_percent
		end

		if body_damage == 0 then
			return 
		end

		slot9 = self
		local previous_health_ratio = self.health_ratio(slot8)

		if self._health <= body_damage then
			slot10 = self

			self.die(slot9)
		else
			self._health = self._health - body_damage
		end

		slot11 = self._unit
		slot11 = self._unit.base(slot10)

		if not tweak_data.weapon[self._unit.base(slot10).get_name_id(slot10)].AUTO_REPAIR and not self._dead and 0.75 <= previous_health_ratio then
			slot10 = self

			if self.health_ratio(slot9) < 0.75 and self._damaged_sequence_name then
				slot10 = self._unit
				slot11 = self._damaged_sequence_name

				self._unit.damage(slot9).run_sequence_simple(slot9, self._unit.damage(slot9))
			end
		end

		return damage_percent
	end

	return 
end
function SentryGunDamage:update_shield_smoke_level(ratio, up)
	local num_shield_smoke_levels = self._num_shield_smoke_levels
	local new_smoke_level = num_shield_smoke_levels - ratio * num_shield_smoke_levels

	if up then
		slot7 = new_smoke_level
		new_smoke_level = math.ceil(slot6)
	else
		slot7 = new_smoke_level
		new_smoke_level = math.floor(slot6)
	end

	if new_smoke_level ~= self._shield_smoke_level then
		self._shield_smoke_level = new_smoke_level
		slot7 = self

		self._make_shield_smoke(slot6)
	end

	return 
end
function SentryGunDamage:_make_shield_smoke()
	if self._shield_smoke_level == 0 then
		slot3 = self._unit
		slot4 = self._shield_smoke_level_0

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	elseif self._shield_smoke_levels and self._shield_smoke_levels[self._shield_smoke_level] then
		slot3 = self._unit
		slot4 = self._shield_smoke_levels[self._shield_smoke_level]

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	return 
end
function SentryGunDamage:save(save_data)
	local my_save_data = {}
	save_data.char_damage = my_save_data
	my_save_data.ignore_client_damage = self._ignore_client_damage
	my_save_data.health = self._health
	my_save_data.shield_health = self._shield_health
	my_save_data.HEALTH_INIT = self._HEALTH_INIT
	my_save_data.SHIELD_HEALTH_INIT = self._SHIELD_HEALTH_INIT
	my_save_data.shield_smoke_level = self._shield_smoke_level

	return 
end
function SentryGunDamage:load(save_data)
	if not save_data or not save_data.char_damage then
		return 
	end

	local my_save_data = save_data.char_damage
	self._ignore_client_damage = my_save_data.ignore_client_damage
	self._health = my_save_data.health
	self._shield_health = my_save_data.shield_health
	self._shield_smoke_level = my_save_data.shield_smoke_level
	self._HEALTH_INIT = my_save_data.HEALTH_INIT
	self._SHIELD_HEALTH_INIT = my_save_data.SHIELD_HEALTH_INIT
	self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
	self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY

	if self._health == 0 then
		slot5 = self

		self.die(slot4)
	end

	if 0 < self._shield_smoke_level then
		slot5 = self

		self._make_shield_smoke(slot4)
	end

	return 
end
function SentryGunDamage:destroy(unit)
	return 
end
function SentryGunDamage:shield_smoke_level()
	return self._shield_smoke_level
end

return 
