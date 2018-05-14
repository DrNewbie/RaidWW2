if not HuskTeamAIDamage then
	slot2 = TeamAIDamage
	slot0 = class(slot1)
end

HuskTeamAIDamage = slot0
TeamAIDamage._RESULT_NAME_TABLE = {
	"hurt",
	"bleedout",
	"death",
	"light_hurt",
	"heavy_hurt",
	"fatal"
}
TeamAIDamage._ATTACK_VARIANTS = CopDamage._ATTACK_VARIANTS
function HuskTeamAIDamage:update(unit, t, dt)
	return 
end
function HuskTeamAIDamage:damage_bullet(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		slot4 = self._unit
		slot5 = "friendly_fire_hit"

		self._unit.network(slot3).send_to_host(slot3, self._unit.network(slot3))

		return 
	end

	slot6 = true
	local damage_abs, damage_percent = self._clamp_health_percentage(slot3, self, attack_data.damage)

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
		slot15 = false

		self._unit.network(slot8).send_to_host(slot8, self._unit.network(slot8), "damage_bullet", attacker, damage_percent, body_index, hit_offset_height)

		slot11 = damage_abs

		self._send_damage_drama(slot8, self, attack_data)
	end

	return 
end
function HuskTeamAIDamage:damage_explosion(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot6 = true
	local damage_abs, damage_percent = self._clamp_health_percentage(slot3, self, attack_data.damage)

	if 0 < damage_percent then
		slot9 = self._unit
		slot9 = self._unit.movement(slot8)
		slot8 = 300
		local hit_offset_height = math.clamp(slot5, attack_data.col_ray.position.z - self._unit.movement(slot8).m_pos(slot8).z, 0)
		local attacker = attack_data.attacker_unit

		if attacker then
			slot8 = attacker

			if attacker.id(slot7) == -1 then
				attacker = self._unit
			end
		end

		slot8 = self._unit
		slot15 = "explosion"
		slot14 = attack_data.col_ray.ray

		self._unit.network(slot7).send_to_host(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, CopDamage._get_attack_variant_index(slot13, self), (self._dead and true) or false)

		slot10 = damage_abs

		self._send_damage_drama(slot7, self, attack_data)
	end

	return 
end
function HuskTeamAIDamage:damage_fire(attack_data)
	if self._dead or self._fatal then
		return 
	end

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

	slot6 = attacker_unit

	if PlayerDamage.is_friendly_fire(slot4, self) then
		slot5 = self._unit
		slot6 = "friendly_fire_hit"

		self._unit.network(slot4).send_to_host(slot4, self._unit.network(slot4))

		return 
	end

	local dmg = attack_data.damage * 0.8
	slot8 = true
	local damage_abs, damage_percent = self._clamp_health_percentage(slot5, self, dmg)

	if 0 < damage_percent then
		slot11 = self._unit
		slot11 = self._unit.movement(slot10)
		slot10 = 300
		local hit_offset_height = math.clamp(slot7, attack_data.col_ray.position.z - self._unit.movement(slot10).m_pos(slot10).z, 0)
		local attacker = attack_data.attacker_unit

		if attacker then
			slot10 = attacker

			if attacker.id(slot9) == -1 then
				attacker = self._unit
			end
		end

		slot10 = self._unit
		slot17 = "fire"
		slot16 = attack_data.col_ray.ray

		self._unit.network(slot9).send_to_host(slot9, self._unit.network(slot9), "damage_explosion_fire", attacker, damage_percent, CopDamage._get_attack_variant_index(slot15, self), (self._dead and true) or false)

		slot12 = damage_abs

		self._send_damage_drama(slot9, self, attack_data)
	end

	return 
end
function HuskTeamAIDamage:damage_melee(attack_data)
	if self._dead or self._fatal then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return 
	end

	slot6 = true
	local damage_abs, damage_percent = self._clamp_health_percentage(slot3, self, attack_data.damage)

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

		slot10 = damage_abs

		self._send_damage_drama(slot7, self, attack_data)
	end

	return 
end
function HuskTeamAIDamage:sync_damage_bullet(attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = (result_index ~= 0 and self._RESULT_NAME_TABLE[result_index]) or nil
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

	if result_type == "fatal" then
		slot11 = self

		self._on_fatal(slot10)
	elseif result_type == "bleedout" then
		slot11 = self

		self._on_bleedout(slot10)
	end

	slot12 = attack_data

	self._call_listeners(slot10, self)

	return 
end
function HuskTeamAIDamage:sync_damage_explosion(attacker_unit, result_index, i_attack_variant)
	if self._dead or self._fatal then
		return 
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local result_type = (result_index ~= 0 and self._RESULT_NAME_TABLE[result_index]) or nil
	local result = {
		variant = variant,
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
		attack_dir = hit_pos - attacker_unit.position(slot10)
		slot11 = attack_dir

		mvector3.normalize(slot10)
	else
		slot11 = self._unit
		slot11 = self._unit.rotation(slot10)
		attack_dir = self._unit.rotation(slot10).y(slot10)
	end

	if not self._no_blood then
		slot13 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot10, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "fatal" then
		slot12 = self

		self._on_fatal(slot11)
	elseif result_type == "bleedout" then
		slot12 = self

		self._on_bleedout(slot11)
	end

	slot13 = attack_data

	self._call_listeners(slot11, self)

	return 
end
function HuskTeamAIDamage:sync_damage_fire(attacker_unit, result_index, i_attack_variant)
	if self._dead or self._fatal then
		return 
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local result_type = (result_index ~= 0 and self._RESULT_NAME_TABLE[result_index]) or nil
	local result = {
		variant = variant,
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
		attack_dir = hit_pos - attacker_unit.position(slot10)
		slot11 = attack_dir

		mvector3.normalize(slot10)
	else
		slot11 = self._unit
		slot11 = self._unit.rotation(slot10)
		attack_dir = self._unit.rotation(slot10).y(slot10)
	end

	if not self._no_blood then
		slot13 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot10, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "fatal" then
		slot12 = self

		self._on_fatal(slot11)
	elseif result_type == "bleedout" then
		slot12 = self

		self._on_bleedout(slot11)
	end

	slot13 = attack_data

	self._call_listeners(slot11, self)

	return 
end
function HuskTeamAIDamage:sync_damage_melee(attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return 
	end

	local result_type = (result_index ~= 0 and self._RESULT_NAME_TABLE[result_index]) or nil
	local result = {
		variant = "melee",
		type = result_type
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	local hit_pos = mvector3.copy(self._unit.movement(slot9).m_pos(slot9))
	slot10 = hit_pos.z + 130

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
		slot10 = attack_dir

		mvector3.negate(slot9)
	end

	if not self._no_blood then
		slot12 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot9, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "melee",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result
	}

	if result_type == "fatal" then
		slot11 = self

		self._on_fatal(slot10)
	elseif result_type == "bleedout" then
		slot11 = self

		self._on_bleedout(slot10)
	end

	slot12 = attack_data

	self._call_listeners(slot10, self)

	return 
end
function HuskTeamAIDamage:sync_damage_bleeding()
	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "death"
		}
	}
	slot4 = self

	self._die(slot3)

	slot5 = dmg_info

	self._call_listeners(slot3, self)

	slot4 = self

	self._unregister_unit(slot3)

	return 
end
function HuskTeamAIDamage:sync_damage_incapacitated()
	self._fatal = true
	slot3 = self._unit
	slot5 = false

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "fatal"
		}
	}
	slot5 = dmg_info

	self._call_listeners(self._unit.interaction(slot2), self)

	return 
end
function HuskTeamAIDamage:sync_damage_tase()
	slot3 = self

	self.damage_tase(slot2)

	return 
end
function HuskTeamAIDamage:sync_unit_recovered()
	if self._tase_effect then
		slot3 = World
		slot4 = self._tase_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))
	end

	self._fatal = nil
	self._bleed_out = nil
	slot3 = self._unit

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), false)

	slot3 = managers.groupai
	slot4 = self._unit

	managers.groupai.state(slot2).on_criminal_recovered(slot2, managers.groupai.state(slot2))

	slot7 = self._unit
	slot5 = self._unit.unit_data(self._unit).name_label_id

	managers.hud.on_teammate_revived(slot2, managers.hud, self._unit.unit_data(false).teammate_panel_id)

	return 
end
function HuskTeamAIDamage:revive(reviving_unit)
	if self._dead then
		return 
	end

	slot4 = self._unit
	slot6 = reviving_unit

	self._unit.network(slot3).send_to_host(slot3, self._unit.network(slot3), "revive_unit")

	return 
end
function HuskTeamAIDamage:pause_bleed_out()
	if self._dead then
		return 
	end

	slot3 = self._unit
	slot4 = "pause_bleed_out"

	self._unit.network(slot2).send_to_host(slot2, self._unit.network(slot2))

	return 
end
function HuskTeamAIDamage:unpause_bleed_out()
	if self._dead then
		return 
	end

	slot3 = self._unit

	if self._unit.id(slot2) == -1 then
		return 
	end

	slot3 = self._unit
	slot4 = "unpause_bleed_out"

	self._unit.network(slot2).send_to_host(slot2, self._unit.network(slot2))

	return 
end
function HuskTeamAIDamage:pause_arrested_timer()
	if self._dead then
		return 
	end

	slot3 = self._unit
	slot4 = "pause_arrested_timer"

	self._unit.network(slot2).send_to_host(slot2, self._unit.network(slot2))

	return 
end
function HuskTeamAIDamage:unpause_arrested_timer()
	if self._dead then
		return 
	end

	slot3 = self._unit

	if self._unit.id(slot2) == -1 then
		return 
	end

	slot3 = self._unit
	slot4 = "unpause_arrested_timer"

	self._unit.network(slot2).send_to_host(slot2, self._unit.network(slot2))

	return 
end
function HuskTeamAIDamage:_on_bleedout(from_dropin)
	self._bleed_out = true
	self._fatal = nil

	if not from_dropin then
		slot4 = self._unit
		slot5 = "revive"

		self._unit.interaction(slot3).set_tweak_data(slot3, self._unit.interaction(slot3))

		slot4 = self._unit

		self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3), true)

		slot8 = self._unit
		slot6 = self._unit.unit_data(self._unit).name_label_id

		managers.hud.on_teammate_downed(slot3, managers.hud, self._unit.unit_data(false).teammate_panel_id)
	end

	return 
end
function HuskTeamAIDamage:_on_fatal(from_dropin)
	self._fatal = true

	if not self._bleed_out and not from_dropin then
		slot4 = self._unit
		slot5 = "revive"

		self._unit.interaction(slot3).set_tweak_data(slot3, self._unit.interaction(slot3))

		slot4 = self._unit

		self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3), true)

		slot8 = self._unit
		slot6 = self._unit.unit_data(self._unit).name_label_id

		managers.hud.on_teammate_downed(slot3, managers.hud, self._unit.unit_data(false).teammate_panel_id)
	end

	self._bleed_out = nil

	return 
end
function HuskTeamAIDamage:_on_death()
	self._dead = true
	self._bleed_out = nil
	self._fatal = nil
	slot3 = self._unit
	slot5 = false

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), false)

	slot3 = self

	self._unregister_unit(slot2)

	return 
end
function HuskTeamAIDamage:load(data)
	if not data.char_dmg then
		return 
	end

	if data.char_dmg.arrested then
		slot4 = self._unit
		slot4 = self._unit.movement(slot3)

		self._unit.movement(slot3).sync_arrested(slot3)
	end

	if data.char_dmg.bleedout then
		self._queued_teammate_panel_update = "bleedout"
	end

	if data.char_dmg.fatal then
		self._queued_teammate_panel_update = "fatal"
	end

	return 
end
function HuskTeamAIDamage:run_queued_teammate_panel_update()
	if self._queued_teammate_panel_update then
		if self._queued_teammate_panel_update == "bleedout" then
			slot3 = self

			self._on_bleedout(slot2)
		elseif self._queued_teammate_panel_update == "fatal" then
			slot3 = self

			self._on_fatal(slot2)
		end
	end

	self._queued_teammate_panel_update = false

	return 
end

return 
