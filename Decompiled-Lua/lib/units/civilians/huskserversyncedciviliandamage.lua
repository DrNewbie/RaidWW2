if not HuskServerSyncedCivilianDamage then
	slot2 = HuskCivilianDamage
	slot0 = class(slot1)
end

HuskServerSyncedCivilianDamage = slot0
HuskServerSyncedCivilianDamage._RESULT_NAME_TABLE = {
	"hurt",
	"light_hurt",
	"heavy_hurt",
	"death"
}
function HuskServerSyncedCivilianDamage:sync_damage_bullet(attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = self._RESULT_NAME_TABLE[result_index]
	local result = {
		variant = "bullet",
		type = result_type
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	local hit_pos = mvector3.copy(self._unit.movement(slot9).m_pos(slot9))
	slot10 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.movement(slot9).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot10 = attacker_unit
		slot10 = attacker_unit.movement(slot9)
		attack_dir = hit_pos - attacker_unit.movement(slot9).m_head_pos(slot9)
		slot10 = attack_dir

		mvector3.normalize(slot9)
	else
		slot10 = self._unit
		slot10 = self._unit.rotation(slot9)
		attack_dir = self._unit.rotation(slot9).y(slot9)
	end

	if not self._no_blood then
		slot12 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot9, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "bullet",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "death" then
		slot12 = attack_data.variant

		self.die(slot10, self)
	end

	slot12 = attack_data

	self._on_damage_received(slot10, self)

	return 
end
function HuskServerSyncedCivilianDamage:sync_damage_explosion(attacker_unit, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = self._RESULT_NAME_TABLE[result_index]
	local result = {
		variant = "explosion",
		type = result_type
	}
	slot9 = self._unit
	slot9 = self._unit.movement(slot8)
	local hit_pos = mvector3.copy(self._unit.movement(slot8).m_pos(slot8))
	slot9 = hit_pos.z + 130

	mvector3.set_z(self._unit.movement(slot8).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot9 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot8)
		slot9 = attack_dir

		mvector3.normalize(slot8)
	else
		slot9 = self._unit
		slot9 = self._unit.rotation(slot8)
		attack_dir = self._unit.rotation(slot8).y(slot8)
	end

	if not self._no_blood then
		slot11 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot8, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "explosion",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "death" then
		slot11 = attack_data.variant

		self.die(slot9, self)
	end

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return 
end
function HuskServerSyncedCivilianDamage:sync_damage_fire(attacker_unit, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = self._RESULT_NAME_TABLE[result_index]
	local result = {
		variant = "fire",
		type = result_type
	}
	slot9 = self._unit
	slot9 = self._unit.movement(slot8)
	local hit_pos = mvector3.copy(self._unit.movement(slot8).m_pos(slot8))
	slot9 = hit_pos.z + 130

	mvector3.set_z(self._unit.movement(slot8).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot9 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot8)
		slot9 = attack_dir

		mvector3.normalize(slot8)
	else
		slot9 = self._unit
		slot9 = self._unit.rotation(slot8)
		attack_dir = self._unit.rotation(slot8).y(slot8)
	end

	if not self._no_blood then
		slot11 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot8, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "fire",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "death" then
		slot11 = attack_data.variant

		self.die(slot9, self)
	end

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return 
end
function HuskServerSyncedCivilianDamage:sync_damage_melee(attacker_unit, attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = self._RESULT_NAME_TABLE[result_index]
	local result = {
		variant = "melee",
		type = result_type
	}
	slot11 = self._unit
	slot11 = self._unit.movement(slot10)
	local hit_pos = mvector3.copy(self._unit.movement(slot10).m_pos(slot10))
	slot11 = hit_pos.z + 130

	mvector3.set_z(self._unit.movement(slot10).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot11 = attacker_unit
		slot11 = attacker_unit.movement(slot10)
		attack_dir = hit_pos - attacker_unit.movement(slot10).m_head_pos(slot10)
		slot11 = attack_dir

		mvector3.normalize(slot10)
	else
		slot11 = self._unit
		slot11 = self._unit.rotation(slot10)
		attack_dir = self._unit.rotation(slot10).y(slot10)
		slot11 = attack_dir

		mvector3.negate(slot10)
	end

	if not self._no_blood then
		slot13 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot10, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "melee",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "death" then
		slot13 = attack_data.variant

		self.die(slot11, self)
	end

	slot13 = attack_data

	self._on_damage_received(slot11, self)

	return 
end
function HuskServerSyncedCivilianDamage:damage_bullet(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.damage
	local damage_abs, damage_percent = HuskServerSyncedCivilianDamage._clamp_health_percentage(slot3, self)

	if 0 < damage_percent then
		local body_index = self._unit.get_body_index(slot5, attack_data.col_ray.body.name(slot8))
		slot10 = self._unit
		slot10 = self._unit.movement(attack_data.col_ray.body)
		slot9 = 300
		local hit_offset_height = math.clamp(self._unit, attack_data.col_ray.position.z - self._unit.movement(attack_data.col_ray.body).m_pos(attack_data.col_ray.body).z, 0)
		local attacker = attack_data.attacker_unit
		slot9 = attacker

		if attacker.id(0) == -1 then
			attacker = self._unit
		end

		slot9 = self._unit
		slot14 = hit_offset_height

		self._unit.network(slot8).send_to_host(slot8, self._unit.network(slot8), "damage_bullet", attacker, damage_percent, body_index)
	end

	return 
end
function HuskServerSyncedCivilianDamage:damage_explosion(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.damage
	local damage_abs, damage_percent = HuskServerSyncedCivilianDamage._clamp_health_percentage(slot3, self)

	if 0 < damage_percent then
		slot9 = self._unit
		slot9 = self._unit.movement(slot8)
		slot8 = 300
		local hit_offset_height = math.clamp(slot5, attack_data.col_ray.position.z - self._unit.movement(slot8).m_pos(slot8).z, 0)
		local attacker = attack_data.attacker_unit
		slot8 = attacker

		if attacker.id(0) == -1 then
			attacker = self._unit
		end
	end

	return 
end
function HuskServerSyncedCivilianDamage:damage_fire(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.damage
	local damage_abs, damage_percent = HuskServerSyncedCivilianDamage._clamp_health_percentage(slot3, self)

	if 0 < damage_percent then
		slot9 = self._unit
		slot9 = self._unit.movement(slot8)
		slot8 = 300
		local hit_offset_height = math.clamp(slot5, attack_data.col_ray.position.z - self._unit.movement(slot8).m_pos(slot8).z, 0)
		local attacker = attack_data.attacker_unit
		slot8 = attacker

		if attacker.id(0) == -1 then
			attacker = self._unit
		end

		slot8 = self._unit
		slot14 = 0

		self._unit.network(slot7).send_to_host(slot7, self._unit.network(slot7), "damage_fire", attacker, damage_percent, 1, hit_offset_height)
	end

	return 
end
function HuskServerSyncedCivilianDamage:damage_melee(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.damage
	local damage_abs, damage_percent = HuskServerSyncedCivilianDamage._clamp_health_percentage(slot3, self)

	if 0 < damage_percent then
		slot9 = self._unit
		slot9 = self._unit.movement(slot8)
		slot8 = 300
		local hit_offset_height = math.clamp(slot5, attack_data.col_ray.position.z - self._unit.movement(slot8).m_pos(slot8).z, 0)
		local attacker = attack_data.attacker_unit
		slot8 = attacker

		if attacker.id(0) == -1 then
			attacker = self._unit
		end

		slot8 = self._unit
		slot14 = 0

		self._unit.network(slot7).send_to_host(slot7, self._unit.network(slot7), "damage_melee", attacker, damage_percent, 1, hit_offset_height)
	end

	return 
end
function HuskServerSyncedCivilianDamage:_clamp_health_percentage(health_abs)
	slot6 = self._HEALTH_INIT
	local damage = math.clamp(slot3, health_abs, self._HEALTH_INIT_PRECENT)
	slot5 = damage / self._HEALTH_INIT_PRECENT
	local damage_percent = math.ceil(health_abs)
	damage = damage_percent * self._HEALTH_INIT_PRECENT

	return damage, damage_percent
end

return 
