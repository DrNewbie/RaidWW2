-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
VehicleDamage = VehicleDamage or class()
VehicleDamage.VEHICLE_DEFAULT_HEALTH = 100
VehicleDamage._HEALTH_GRANULARITY = 512
function VehicleDamage:init(unit)
	self._unit = unit
	slot7 = "character_damage"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(false))

	self._incapacitated = nil
	slot4 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot3)
	self._health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	self._current_max_health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	slot6 = true
	self._next_allowed_dmg_t = Application.digest_value(slot3, Application, -100)
	self._last_received_dmg = 0
	self._team_police = "law1"
	self._team_criminal = "criminal1"
	self._half_damaged_squence_played = false
	self._no_blood = true

	return 
end
function VehicleDamage:set_tweak_data(data)
	self._tweak_data = data
	self._current_max_health = self._tweak_data.damage.max_health
	slot5 = self._tweak_data.damage.max_health

	self.set_health(slot3, self)

	self._HEALTH_INIT_PRECENT = self._current_max_health / self._HEALTH_GRANULARITY

	return 
end
function VehicleDamage:is_invulnerable()
	local result = false
	slot4 = self._unit
	slot4 = self._unit.vehicle_driving(slot3)
	local players_count_inside_vehicle = self._unit.vehicle_driving(slot3).num_players_inside(slot3)

	if players_count_inside_vehicle <= 0 then
		result = true
	end

	return result
end
function VehicleDamage:is_friendly_fire(attacker_unit)
	local friendly_fire = false

	if not attacker_unit then
		return 
	end

	if attacker_unit then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				return false
			end
		end
	end

	slot5 = attacker_unit
	slot5 = attacker_unit.movement(slot4)
	friendly_fire = attacker_unit.movement(slot4).team(slot4).foes[self._team_criminal]

	return not friendly_fire
end
function VehicleDamage:damage_mission(dmg)
	local damage_info = {
		result = {
			variant = "killzone",
			type = "hurt"
		}
	}
	local attack_data = {
		variant = "killzone",
		damage = dmg
	}
	local result = damage_info.result
	local damage = attack_data.damage
	slot12 = self._HEALTH_GRANULARITY
	local damage_percent = math.ceil(math.clamp(slot9, damage / self._HEALTH_INIT_PRECENT, 1))
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot10 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		slot10 = self._health - damage

		self.set_health(attack_data.variant, self)
	end

	attack_data.result = result

	self._health_recap(slot8, self)

	local body_index = 1
	local hit_offset_height = 1
	slot18 = "explosion"
	slot16 = attack_data.col_ray and attack_data.col_ray.ray

	self._send_explosion_attack_result(attack_data, self, attack_data, self._unit, damage_percent, self._get_attack_variant_index(slot16, self))

	slot12 = attack_data

	self._on_damage_received(attack_data, self)

	return result
end
function VehicleDamage:damage_bullet(attack_data)
	slot4 = self._unit

	if self._unit.vehicle_driving(slot3) then
		slot4 = self._unit
		slot4 = self._unit.vehicle_driving(slot3)

		if not self._unit.vehicle_driving(slot3).is_vulnerable(slot3) then
			return 
		end
	end

	local damage_info = {
		result = {
			variant = "bullet",
			type = "hurt"
		},
		attacker_unit = attack_data.attacker_unit
	}

	if Global.god_mode then
		if 0 < attack_data.damage then
		end

		slot6 = damage_info

		self._call_listeners(slot4, self)

		return 
	else
		slot5 = self

		if self.is_invulnerable(slot4) then
			slot6 = damage_info

			self._call_listeners(slot4, self)

			return 
		else
			slot5 = self

			if self.incapacitated(slot4) then
				return 
			else
				slot6 = attack_data.attacker_unit

				if self.is_friendly_fire(slot4, self) then
					return "friendly_fire"
				else
					slot6 = attack_data.damage

					if self._chk_dmg_too_soon(slot4, self) then
						return 
					end
				end
			end
		end
	end

	local result = damage_info.result
	local damage = attack_data.damage
	slot11 = self._HEALTH_GRANULARITY
	local damage_percent = math.ceil(math.clamp(slot8, damage / self._HEALTH_INIT_PRECENT, 1))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot9 = attack_data.col_ray

	self._hit_direction(math.clamp, self)

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot9 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		slot9 = self._health - damage

		self.set_health(attack_data.variant, self)
	end

	attack_data.result = result
	local attacker = attack_data.attacker_unit
	slot9 = attacker

	if attacker.id(slot8) == -1 then
		attacker = self._unit
	end

	slot10 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot9) then
		slot9 = managers.hud

		managers.hud.on_hit_confirmed(slot8)
	end

	self._health_recap(slot8, self)

	local body_index = 1
	local hit_offset_height = 1
	slot16 = hit_offset_height

	self._send_bullet_attack_result(attack_data, self, attack_data, attacker, damage_percent, body_index)

	slot12 = attack_data

	self._on_damage_received(attack_data, self)

	return result
end
function VehicleDamage:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	slot8 = self._unit
	slot16 = self
	slot14 = (self.dead(slot15) and true) or false

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_bullet", attacker, damage_percent, body_index, hit_offset_height)

	return 
end
function VehicleDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, death)
	slot8 = self

	if self.dead(slot7) then
		return 
	end

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	slot12 = self._unit
	local hit_pos = mvector3.copy(self._unit.position(slot11))
	slot12 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.position, hit_pos)

	attack_data.pos = hit_pos
	local attack_dir, distance = nil

	if attacker_unit then
		slot13 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot12)
		slot13 = attack_dir
		distance = mvector3.normalize(slot12)
	else
		slot13 = self._unit
		slot13 = self._unit.rotation(slot12)
		attack_dir = self._unit.rotation(slot12).y(slot12)
	end

	attack_data.attack_dir = attack_dir
	local result = nil

	if death then
		result = {
			variant = "bullet",
			type = "death"
		}
		slot15 = attack_data.variant

		self.die(slot13, self)
	else
		result = {
			variant = "bullet",
			type = "hurt"
		}
		slot15 = self._health - damage

		self.set_health(slot13, self)

		self._health_ratio = self._health / self._current_max_health
	end

	attack_data.variant = "bullet"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	slot15 = attack_data

	self._health_recap(slot13, self)

	slot15 = attack_data

	self._on_damage_received(slot13, self)

	return 
end
function VehicleDamage:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
	return 
end
function VehicleDamage:damage_explosion(attack_data)

	-- Decompilation error in this vicinity:
	slot4 = self._unit
	slot4 = self._unit.vehicle_driving(slot3)

	if not self._unit.vehicle_driving(slot3).is_vulnerable(slot3) then
		return 
	end

	local damage_info = {
		result = {
			variant = "explosion",
			type = "hurt"
		}
	}

	if self._god_mode or self._invulnerable then
		slot6 = damage_info

		self._call_listeners(slot4, self)

		return 
	else
		slot5 = self

		if self.incapacitated(slot4) then
			return 
		end
	end

	local result = damage_info.result
	local damage = attack_data.damage
	slot11 = self._HEALTH_GRANULARITY
	local damage_percent = math.ceil(math.clamp(slot8, damage / self._HEALTH_INIT_PRECENT, 1))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot8 = damage / self._HEALTH_INIT_PRECENT
	local damage_percent = math.ceil(math.clamp)
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot10 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		slot10 = self._health - damage

		self.set_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	slot11 = attack_data

	self._health_recap(slot9, self)

	slot17 = attack_data.result.variant

	self._send_explosion_attack_result(slot9, self, attack_data, attacker, damage_percent, self._get_attack_variant_index(attack_data.col_ray.ray, self))

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return result
end
function VehicleDamage:_send_explosion_attack_result(attack_data, attacker, damage_percent, i_attack_variant, direction)
	slot8 = self._unit
	slot14 = direction

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, i_attack_variant, (self._dead and true) or false)

	return 
end
function VehicleDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction)
	slot9 = "[VehicleDamage:sync_damage_explosion]"

	Application.trace(slot7, Application)

	if self._dead then
		return 
	end

	local variant = "explosion"
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {
		variant = variant
	}
	local result = nil

	if death then
		result = {
			type = "death",
			variant = variant
		}
		slot13 = attack_data.variant

		self.die(slot11, self)

		slot10 = {
			variant = "explosion",
			head_shot = false,
			name = self._unit.base(self)._tweak_table
		}
		slot13 = self._unit

		if attacker_unit then
			slot13 = attacker_unit

			if attacker_unit.inventory(slot12) then
				slot13 = attacker_unit
				slot13 = attacker_unit.inventory(slot12)
				slot11 = attacker_unit.inventory(slot12).equipped_unit(slot12)
			end
		end

		slot10.weapon_unit = slot11
	else
		result = {
			type = "explosion",
			variant = variant
		}
		slot13 = self._health - damage

		self.set_health(slot11, self)
	end

	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		slot14 = attacker_unit
		attack_dir = self._unit.position(slot12) - attacker_unit.position(self._unit)
		slot13 = attack_dir

		mvector3.normalize(attacker_unit.position(self._unit))
	else
		slot13 = self._unit
		slot13 = self._unit.rotation(slot12)
		attack_dir = self._unit.rotation(slot12).y(slot12)
	end

	attack_data.attack_dir = attack_dir

	if attack_data.attacker_unit then
		slot14 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(slot13) then
			slot13 = managers.hud

			managers.hud.on_hit_confirmed(slot12)
		end
	end

	slot14 = attack_data

	self._health_recap(slot12, self)

	slot13 = self._unit
	attack_data.pos = self._unit.position(slot12)
	slot14 = attack_data.pos.z + math.random() * 180

	mvector3.set_z(slot12, attack_data.pos)

	slot14 = attack_data

	self._send_sync_explosion_attack_result(slot12, self)

	slot14 = attack_data

	self._on_damage_received(slot12, self)

	return 
end
function VehicleDamage:_send_sync_explosion_attack_result(attack_data)
	return 
end
function VehicleDamage:damage_fire(attack_data)

	-- Decompilation error in this vicinity:
	slot5 = "[VehicleDamage:damage_fire]"

	Application.trace(slot3, Application)

	slot4 = self._unit
	slot4 = self._unit.vehicle_driving(slot3)

	if not self._unit.vehicle_driving(slot3).is_vulnerable(slot3) then
		return 
	end

	local damage_info = {
		result = {
			variant = "fire",
			type = "hurt"
		}
	}

	if self._god_mode or self._invulnerable then
		slot6 = damage_info

		self._call_listeners(slot4, self)

		return 
	else
		slot5 = self

		if self.incapacitated(slot4) then
			return 
		end
	end

	local result = damage_info.result
	local damage = attack_data.damage
	slot7 = damage / self._HEALTH_INIT_PRECENT
	local damage_percent = math.ceil(slot6)
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot9 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		slot9 = self._health - damage

		self.set_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	slot10 = attack_data

	self._health_recap(slot8, self)

	slot16 = attack_data.result.variant

	self._send_fire_attack_result(slot8, self, attack_data, attacker, damage_percent, self._get_attack_variant_index(attack_data.col_ray.ray, self))

	slot10 = attack_data

	self._on_damage_received(slot8, self)

	return result
end
function VehicleDamage:_send_fire_attack_result(attack_data, attacker, damage_percent, i_attack_variant, direction)
	slot8 = self._unit
	slot14 = direction

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, i_attack_variant, (self._dead and true) or false)

	return 
end
function VehicleDamage:sync_damage_fire(attacker_unit, damage_percent, i_attack_variant, death, direction)
	slot9 = "[VehicleDamage:sync_damage_fire]"

	Application.trace(slot7, Application)

	if self._dead then
		return 
	end

	local variant = "fire"
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {
		variant = variant
	}
	local result = nil

	if death then
		result = {
			type = "death",
			variant = variant
		}
		slot13 = attack_data.variant

		self.die(slot11, self)

		slot10 = {
			variant = "fire",
			head_shot = false,
			name = self._unit.base(self)._tweak_table
		}
		slot13 = self._unit

		if attacker_unit then
			slot13 = attacker_unit

			if attacker_unit.inventory(slot12) then
				slot13 = attacker_unit
				slot13 = attacker_unit.inventory(slot12)
				slot11 = attacker_unit.inventory(slot12).equipped_unit(slot12)
			end
		end

		slot10.weapon_unit = slot11
	else
		result = {
			type = "fire",
			variant = variant
		}
		slot13 = self._health - damage

		self.set_health(slot11, self)
	end

	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		slot14 = attacker_unit
		attack_dir = self._unit.position(slot12) - attacker_unit.position(self._unit)
		slot13 = attack_dir

		mvector3.normalize(attacker_unit.position(self._unit))
	else
		slot13 = self._unit
		slot13 = self._unit.rotation(slot12)
		attack_dir = self._unit.rotation(slot12).y(slot12)
	end

	attack_data.attack_dir = attack_dir

	if attack_data.attacker_unit then
		slot14 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(slot13) then
			slot13 = managers.hud

			managers.hud.on_hit_confirmed(slot12)
		end
	end

	slot13 = self._unit
	attack_data.pos = self._unit.position(slot12)
	slot14 = attack_data.pos.z + math.random() * 180

	mvector3.set_z(slot12, attack_data.pos)

	slot14 = attack_data

	self._send_sync_fire_attack_result(slot12, self)

	slot14 = attack_data

	self._on_damage_received(slot12, self)

	return 
end
function VehicleDamage:_send_sync_fire_attack_result(attack_data)
	return 
end
function VehicleDamage:damage_collision(attack_data)
	local local_player_seat = nil
	slot5 = managers.player

	if managers.player.local_player(slot4) then
		slot5 = managers.player
		slot5 = managers.player.local_player(slot4)

		if managers.player.local_player(slot4).movement(slot4) then
			slot5 = managers.player
			slot5 = managers.player.local_player(slot4)

			if managers.player.local_player(slot4).movement(slot4)._current_state then
				slot5 = managers.player
				slot5 = managers.player.local_player(slot4)
				local_player_seat = managers.player.local_player(slot4).movement(slot4)._current_state._seat
			end
		end
	end

	if local_player_seat and local_player_seat.driving then
		slot5 = self._unit
		slot5 = self._unit.vehicle_driving(slot4)

		if not self._unit.vehicle_driving(slot4).is_vulnerable(slot4) then
			return 
		end

		local damage_info = {
			result = {
				variant = "collision",
				type = "hurt"
			}
		}

		if Global.god_mode then
			if 0 < attack_data.damage then
			end

			slot7 = damage_info

			self._call_listeners(slot5, self)

			return 
		else
			slot6 = self

			if self.is_invulnerable(slot5) then
				slot7 = damage_info

				self._call_listeners(slot5, self)

				return 
			else
				slot6 = self

				if self.incapacitated(slot5) then
					return 
				end
			end
		end

		local damage = attack_data.damage

		if self._health <= damage then
			attack_data.damage = self._health
			slot8 = attack_data.variant

			self.die(slot6, self)
		else
			attack_data.damage = damage
			slot8 = self._health - damage

			self.set_health(slot6, self)
		end

		slot9 = {
			skip_idle_check = true
		}

		managers.dialog.queue_dialog(slot6, managers.dialog, "gen_vehicle_taking_damage")

		slot7 = self

		self._health_recap(slot6)

		slot8 = self._health

		self._send_vehicle_health(slot6, self)
	end

	return 
end
function VehicleDamage:_send_vehicle_health(health)
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot9 = nil

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_ai_vehicle_action", "health", self._unit, health)
	end

	return 
end
function VehicleDamage:sync_vehicle_health(health)
	slot4 = self
	slot7 = health

	self.set_health(slot3, tonumber(slot6))

	slot4 = self

	self._health_recap(slot3)

	return 
end
function VehicleDamage:_on_damage_received(damage_info)
	slot5 = damage_info

	self._call_listeners(slot3, self)

	return 
end
function VehicleDamage:_get_attack_variant_index(variant)
	slot4 = self._ATTACK_VARIANTS

	for i, test_variant in ipairs(slot3) do
		if variant == test_variant then
			return i
		end
	end

	slot5 = variant
	slot8 = self._ATTACK_VARIANTS

	debug_pause(slot3, "variant not found!", inspect(slot7))

	return 1
end
function VehicleDamage:incapacitated()
	return self._incapacitated
end
function VehicleDamage:revive()
	slot3 = self

	self._revive(slot2)

	if managers.network then
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot3 = managers.network

			managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_ai_vehicle_action", "revive", self._unit, nil)
		end
	end

	return 
end
function VehicleDamage:_revive()
	slot3 = self
	slot6 = self

	self.set_health(slot2, self._max_health(slot5))

	slot3 = self._unit
	slot5 = false

	self._unit.vehicle_driving(slot2).set_state(slot2, self._unit.vehicle_driving(slot2), VehicleDrivingExt.STATE_DRIVING)

	slot3 = self._unit
	slot4 = VehicleDrivingExt.SEQUENCE_REPAIRED

	if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
		slot3 = self._unit
		slot4 = VehicleDrivingExt.SEQUENCE_REPAIRED

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	slot5 = {
		skip_idle_check = true
	}

	managers.dialog.queue_dialog(slot2, managers.dialog, "gen_vehicle_repaired")

	self._half_damaged_squence_played = false

	return 
end
function VehicleDamage:sync_vehicle_revive()
	slot3 = self

	self._revive(slot2)

	return 
end
function VehicleDamage:need_revive()
	return self.dead()
end
function VehicleDamage:dead()
	return self._health <= 0
end
function VehicleDamage:die()
	slot4 = "[VehicleDamage:die]"

	Application.trace(slot2, Application)

	slot4 = 0

	self.set_health(slot2, self)

	slot3 = self._unit
	slot3 = self._unit.vehicle_driving(slot2)

	self._unit.vehicle_driving(slot2).on_vehicle_death(slot2)

	return 
end
function VehicleDamage:_chk_dmg_too_soon(damage)
	slot4 = self._next_allowed_dmg_t

	if type(slot3) ~= "number" or not self._next_allowed_dmg_t then
		slot6 = false
		local next_allowed_dmg_t = Application.digest_value(slot3, Application, self._next_allowed_dmg_t)
	end

	if damage <= self._last_received_dmg + 0.01 then
		slot5 = managers.player
		slot5 = managers.player.player_timer(slot4)

		if managers.player.player_timer(slot4).time(slot4) < next_allowed_dmg_t then
			return true
		end
	end

	return 
end
function VehicleDamage:_hit_direction(col_ray)
	slot4 = managers.player
	local local_player_vehicle = managers.player.get_vehicle(slot3)

	if local_player_vehicle and self._unit == local_player_vehicle.vehicle_unit and col_ray then
		local dir = col_ray.ray
		slot8 = managers.player
		slot8 = managers.player.local_player(dir)
		slot8 = managers.player.local_player(dir).camera(dir)
		local infront = math.dot(slot5, managers.player.local_player(dir).camera(dir).forward(dir))

		if infront < -0.9 then
		elseif 0.9 < infront then
			slot9 = HUDHitDirection.UNIT_TYPE_HIT_VEHICLE

			managers.hud.on_hit_direction(slot6, managers.hud, "right")
		else
			slot7 = managers.player
			slot7 = managers.player.local_player(slot6)
			slot7 = managers.player.local_player(slot6).camera(slot6)
			slot8 = -dir
			slot13 = 1
			local polar = managers.player.local_player(slot6).camera(slot6).forward(slot6).to_polar_with_reference(slot6, managers.player.local_player(slot6).camera(slot6).forward(slot6), Vector3(slot10, 0, 0))
			slot10 = 0
			local direction = Vector3(managers.player.local_player(slot6).camera(slot6).forward(slot6), polar.spin, polar.pitch).normalized(managers.player.local_player(slot6).camera(slot6).forward(slot6))
			slot10 = direction.y

			if math.abs(direction.x) < math.abs(Vector3(managers.player.local_player(slot6).camera(slot6).forward(slot6), polar.spin, polar.pitch)) then
				if direction.x < 0 then
					slot11 = HUDHitDirection.UNIT_TYPE_HIT_VEHICLE

					managers.hud.on_hit_direction(slot8, managers.hud, "left")
				else
					slot11 = HUDHitDirection.UNIT_TYPE_HIT_VEHICLE

					managers.hud.on_hit_direction(slot8, managers.hud, "right")
				end
			elseif direction.y < 0 then
				slot11 = HUDHitDirection.UNIT_TYPE_HIT_VEHICLE

				managers.hud.on_hit_direction(slot8, managers.hud, "up")
			else
				slot11 = HUDHitDirection.UNIT_TYPE_HIT_VEHICLE

				managers.hud.on_hit_direction(slot8, managers.hud, "down")
			end
		end
	end

	return 
end
function VehicleDamage:_call_listeners(damage_info)
	slot7 = damage_info

	self._listener_holder.call(slot3, self._listener_holder, damage_info.result.type, self._unit)

	return 
end
function VehicleDamage:add_listener(key, events, clbk)
	events = events or self._all_event_types
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function VehicleDamage:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function VehicleDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	slot5 = self
	health_subtracted = self.get_real_health(slot4)
	slot6 = -attack_data.damage

	self.change_health(slot4, self)

	slot5 = self

	self._set_health_effect(slot4)

	return health_subtracted
end
function VehicleDamage:get_real_health()
	slot3 = self._health * 100

	return math.round(slot2) / 100
end
function VehicleDamage:get_health_percentage()
	return self._health / self._current_max_health
end
function VehicleDamage:change_health(change_of_health)
	slot7 = self
	slot5 = self.get_real_health(slot6) + change_of_health

	self.set_health(slot3, self)

	slot4 = self

	if self.get_real_health(slot3) < 0 then
		slot5 = 0

		self.set_health(slot3, self)
	end

	return 
end
function VehicleDamage:set_health(health)
	slot4 = health * 100
	self._health = math.round(slot3) / 100

	return 
end
function VehicleDamage:_max_health()
	return self._current_max_health
end
function VehicleDamage:_set_health_effect()
	slot4 = self
	local hp = self.get_real_health(slot2) / self._max_health(self)
	slot6 = 1

	math.clamp(self, hp, 0)

	return 
end
function VehicleDamage:_get_attack_variant_index(variant)
	slot4 = CopDamage._ATTACK_VARIANTS

	for i, test_variant in ipairs(slot3) do
		if variant == test_variant then
			return i
		end
	end

	slot5 = variant
	slot8 = self._ATTACK_VARIANTS

	debug_pause(slot3, "variant not found!", inspect(slot7))

	return 1
end
function VehicleDamage:_health_recap()
	if not self._half_damaged_squence_played then
		slot4 = self

		if self.get_real_health(slot2) / self._max_health(self) <= 0.5 then
			slot3 = self._unit
			slot4 = VehicleDrivingExt.SEQUENCE_HALF_DAMAGED

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = VehicleDrivingExt.SEQUENCE_HALF_DAMAGED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end

			self._half_damaged_squence_played = true
		end
	end

	slot3 = self

	if self.get_real_health(slot2) <= 0 then
		slot3 = self._unit
		slot3 = self._unit.vehicle_driving(slot2)

		if self._unit.vehicle_driving(slot2).get_state_name(slot2) ~= VehicleDrivingExt.STATE_BROKEN then
			slot3 = self

			self.die(slot2)
		end
	end

	return 
end

return 
