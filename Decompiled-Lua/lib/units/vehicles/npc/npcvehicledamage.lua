-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NpcVehicleDamage then
	slot2 = VehicleDamage
	slot0 = class(slot1)
end

NpcVehicleDamage = slot0
NpcVehicleDamage.VEHICLE_DEFAULT_HEALTH = 100
NpcVehicleDamage._HEALTH_GRANULARITY = 512
function NpcVehicleDamage:init(unit)
	slot5 = unit

	VehicleDamage.init(slot3, self)

	self._is_alive = true

	return 
end
function NpcVehicleDamage:damage_bullet(attack_data)
	local result = nil
	local damage = attack_data.damage
	slot10 = self._HEALTH_GRANULARITY
	local damage_percent = math.ceil(math.clamp(slot7, damage / self._HEALTH_INIT_PRECENT, 1))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot8 = attack_data.col_ray

	self._hit_direction(math.clamp, self)

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot8 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		self._health = self._health - damage
	end

	local attacker = attack_data.attacker_unit
	slot8 = attacker

	if attacker.id(slot7) == -1 then
		attacker = self._unit
	end

	slot9 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot8) then
		slot8 = managers.hud

		managers.hud.on_hit_confirmed(slot7)
	end

	self._health_recap(slot7, self)

	local body_index = 1
	local hit_offset_height = 1
	slot15 = hit_offset_height

	self._send_bullet_attack_result(attack_data, self, attack_data, attacker, damage_percent, body_index)

	return result
end
function NpcVehicleDamage:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	slot8 = self._unit
	slot17 = self
	slot15 = (self.dead(slot16) and true) or false

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_bullet", attacker, damage_percent, body_index, hit_offset_height, 0)

	return 
end
function NpcVehicleDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, variant, death)
	slot9 = self

	if self.dead(slot8) then
		return 
	end

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	slot13 = self._unit
	local hit_pos = mvector3.copy(self._unit.position(slot12))
	slot13 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.position, hit_pos)

	attack_data.pos = hit_pos
	local attack_dir, distance = nil

	if attacker_unit then
		slot14 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot13)
		slot14 = attack_dir
		distance = mvector3.normalize(slot13)
	else
		slot14 = self._unit
		slot14 = self._unit.rotation(slot13)
		attack_dir = self._unit.rotation(slot13).y(slot13)
	end

	attack_data.attack_dir = attack_dir
	local result = nil

	if death then
		result = {
			variant = "bullet",
			type = "death"
		}
		slot16 = attack_data.variant

		self.die(slot14, self)
	else
		result = {
			variant = "bullet",
			type = "hurt"
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._current_max_health
	end

	attack_data.variant = "bullet"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	slot16 = attack_data

	self._health_recap(slot14, self)

	slot17 = hit_offset_height

	self._send_sync_bullet_attack_result(slot14, self, attack_data)

	slot16 = attack_data

	self._on_damage_received(slot14, self)

	return 
end
function NpcVehicleDamage:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
	return 
end
function NpcVehicleDamage:damage_explosion(attack_data)

	-- Decompilation error in this vicinity:
	Application.trace(slot3, Application)

	local result = nil
	local damage = attack_data.damage
	slot6 = damage / self._HEALTH_INIT_PRECENT
	local damage_percent = math.ceil("[NpcVehicleDamage:damage_explosion]")
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot8 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		self._health = self._health - damage
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	slot9 = attack_data

	self._health_recap(slot7, self)

	slot15 = attack_data.result.variant
	slot13 = attack_data.col_ray.ray

	self._send_explosion_attack_result(slot7, self, attack_data, attacker, damage_percent, self._get_attack_variant_index(slot13, self))

	slot9 = attack_data

	self._on_damage_received(slot7, self)

	return result
end
function NpcVehicleDamage:_send_explosion_attack_result(attack_data, attacker, damage_percent, i_attack_variant, direction)
	slot8 = self._unit
	slot14 = direction

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, i_attack_variant, (self._dead and true) or false)

	return 
end
function NpcVehicleDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction)
	slot9 = "[NpcVehicleDamage:sync_damage_explosion]"

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
		self._health = self._health - damage
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
function NpcVehicleDamage:_send_sync_explosion_attack_result(attack_data)
	return 
end
function NpcVehicleDamage:damage_fire(attack_data)

	-- Decompilation error in this vicinity:
	Application.trace(slot3, Application)

	local result = nil
	local damage = attack_data.damage
	slot6 = damage / self._HEALTH_INIT_PRECENT
	local damage_percent = math.ceil("[NpcVehicleDamage:damage_fire]")
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot8 = attack_data.variant

		self.die(attack_data.variant, self)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
		self._health = self._health - damage
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	slot9 = attack_data

	self._health_recap(slot7, self)

	slot15 = attack_data.result.variant
	slot13 = attack_data.col_ray.ray

	self._send_fire_attack_result(slot7, self, attack_data, attacker, damage_percent, self._get_attack_variant_index(slot13, self))

	slot9 = attack_data

	self._on_damage_received(slot7, self)

	return result
end
function NpcVehicleDamage:_send_fire_attack_result(attack_data, attacker, damage_percent, i_attack_variant, direction)
	slot8 = self._unit
	slot14 = direction

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, i_attack_variant, (self._dead and true) or false)

	return 
end
function NpcVehicleDamage:sync_damage_fire(attacker_unit, damage_percent, i_attack_variant, death, direction)
	slot9 = "[NpcVehicleDamage:sync_damage_fire]"

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
		self._health = self._health - damage
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

	self._send_sync_fire_attack_result(slot12, self)

	slot14 = attack_data

	self._on_damage_received(slot12, self)

	return 
end
function NpcVehicleDamage:_send_sync_fire_attack_result(attack_data)
	return 
end
function NpcVehicleDamage:damage_collision(attack_data)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._unit
		slot4 = self._unit.vehicle_driving(slot3)

		if not self._unit.vehicle_driving(slot3).is_vulnerable(slot3) then
			return 
		end

		local damage_info = {
			result = {
				variant = "collision",
				type = "hurt"
			}
		}
		local damage = attack_data.damage
		slot6 = damage / self._HEALTH_INIT_PRECENT
		local damage_percent = math.ceil(slot5)
		damage = damage_percent * self._HEALTH_INIT_PRECENT

		if self._health <= damage then
			attack_data.damage = self._health
			slot8 = attack_data.variant

			self.die(slot6, self)
		else
			attack_data.damage = damage
			self._health = self._health - damage
		end

		slot7 = self

		self._health_recap(slot6)

		slot8 = self._health

		self._send_vehicle_health(slot6, self)
	end

	return 
end
function NpcVehicleDamage:is_friendly_fire(attacker_unit)
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
	friendly_fire = attacker_unit.movement(slot4).team(slot4).foes[self._team_police]

	return not friendly_fire
end
function NpcVehicleDamage:_health_recap()
	slot3 = self
	local current_health = self.get_real_health(slot2)

	if current_health <= 0 and self._is_alive then
		self._is_alive = false
		slot4 = self._unit
		slot4 = self._unit.npc_vehicle_driving(slot3)

		self._unit.npc_vehicle_driving(slot3).on_vehicle_death(slot3)
	end

	return 
end

return 
