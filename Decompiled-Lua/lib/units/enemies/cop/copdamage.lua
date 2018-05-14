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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CopDamage = CopDamage or class()
CopDamage._all_event_types = {
	"dmg_rcv",
	"light_hurt",
	"hurt",
	"heavy_hurt",
	"death",
	"shield_knock",
	"stun",
	"counter_tased",
	"taser_tased"
}
CopDamage._ATTACK_VARIANTS = {
	"explosion",
	"stun",
	"fire"
}
CopDamage._HEALTH_GRANULARITY = 512
CopDamage.WEAPON_TYPE_GRANADE = 1
CopDamage.WEAPON_TYPE_BULLET = 2
CopDamage.WEAPON_TYPE_FLAMER = 3
CopDamage.DEBUG_HP = CopDamage.DEBUG_HP or false
CopDamage._hurt_severities = {
	heavy = "heavy_hurt",
	fire = "fire_hurt",
	poison = "poison_hurt",
	explode = "expl_hurt",
	light = "light_hurt",
	moderate = "hurt",
	none = false
}
CopDamage._impact_bones = {}
local impact_bones_tmp = {
	"Hips",
	"Spine",
	"Spine1",
	"Spine2",
	"Neck",
	"Head",
	"LeftShoulder",
	"LeftArm",
	"LeftForeArm",
	"RightShoulder",
	"RightArm",
	"RightForeArm",
	"LeftUpLeg",
	"LeftLeg",
	"LeftFoot",
	"RightUpLeg",
	"RightLeg",
	"RightFoot"
}
slot3 = impact_bones_tmp

for i, k in ipairs(slot2) do
	slot8 = impact_bones_tmp[i]
	local name_ids = Idstring(slot7)
	slot10 = name_ids
	CopDamage._impact_bones[name_ids.key(slot9)] = name_ids
end

impact_bones_tmp = nil
local mvec_1 = Vector3()
local mvec_2 = Vector3()
CopDamage.init = function (self, unit)
	self._unit = unit
	slot5 = unit
	local char_tweak = tweak_data.character[unit.base(slot4)._tweak_table]
	self._HEALTH_INIT = char_tweak.HEALTH_INIT
	slot6 = BuffEffectManager.EFFECT_ENEMY_HEALTH

	if managers.buff_effect.is_effect_active(slot4, managers.buff_effect) then
		slot7 = BuffEffectManager.EFFECT_ENEMY_HEALTH
		self._HEALTH_INIT = self._HEALTH_INIT * (managers.buff_effect.get_effect_value(slot5, managers.buff_effect) or 1)
	end

	self._health = self._HEALTH_INIT
	self._health_ratio = 1
	self._HEALTH_INIT_PRECENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
	slot6 = unit
	slot9 = "Spine1"
	self._autotarget_data = {
		fast = unit.get_object(slot5, Idstring(slot8))
	}
	self._pickup = nil
	slot5 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(unit.get_object(slot5, Idstring(slot8)))

	if char_tweak.permanently_invulnerable or self.immortal then
		slot6 = true

		self.set_invulnerable(slot4, self)
	end

	self._char_tweak = char_tweak
	slot5 = unit
	slot8 = "Spine2"
	self._spine2_obj = unit.get_object(slot4, Idstring(slot7))

	if self._head_body_name then
		slot5 = self._head_body_name
		self._ids_head_body_name = Idstring(slot4)
		slot6 = self._head_body_name
		slot5 = self._unit.body(slot4, self._unit)
		self._head_body_key = self._unit.body(slot4, self._unit).key(slot4)
	end

	slot5 = "body_plate"
	self._ids_plate_name = Idstring(slot4)
	self._has_plate = true
	self._last_time_unit_got_fire_damage = nil
	self._last_time_unit_got_fire_effect = nil
	self._temp_flame_redir_res = nil
	self._active_fire_bone_effects = {}

	if CopDamage.DEBUG_HP then
		slot5 = self

		self._create_debug_ws(slot4)
	end

	slot6 = "effects/vanilla/character/taser_hittarget_001"
	self._tase_effect_table = {
		effect = Idstring(slot5),
		parent = self._spine2_obj
	}
	self._last_damage_direction = nil
	self._dismembered_parts = {}

	return 
end
CopDamage.get_last_damage_direction = function (self)
	return self._last_damage_direction
end
CopDamage.get_last_time_unit_got_fire_damage = function (self)
	return self._last_time_unit_got_fire_damage
end
CopDamage.set_last_time_unit_got_fire_damage = function (self, time)
	self._last_time_unit_got_fire_damage = time

	return 
end
CopDamage.get_temp_flame_redir_res = function (self)
	return self._temp_flame_redir_res
end
CopDamage.set_temp_flame_redir_res = function (self, value)
	self._temp_flame_redir_res = value

	return 
end
CopDamage.get_damage_type = function (self, damage_percent, category)
	local hurt_table = self._char_tweak.damage.hurt_severity[category or WeaponTweakData.DAMAGE_TYPE_BULLET]
	local dmg = damage_percent / self._HEALTH_GRANULARITY

	if hurt_table.health_reference == "full" then
	elseif hurt_table.health_reference == "current" then
		slot8 = (self._HEALTH_INIT * dmg) / self._health
		dmg = math.min(slot6, 1)
	else
		slot8 = (self._HEALTH_INIT * dmg) / hurt_table.health_reference
		dmg = math.min(slot6, 1)
	end

	local zone = nil
	slot8 = hurt_table.zones

	for i_zone, test_zone in ipairs(slot7) do
		if i_zone == #hurt_table.zones or dmg < test_zone.health_limit then
			zone = test_zone

			break
		end
	end

	local rand_nr = math.random()
	local total_w = 0
	slot10 = self._hurt_severities

	for sev_name, hurt_type in pairs(slot9) do
		local weight = zone[sev_name]

		if weight and 0 < weight then
			total_w = total_w + weight

			if rand_nr <= total_w then
				return hurt_type or "dmg_rcv"
			end
		end
	end

	return "dmg_rcv"
end
CopDamage.is_head = function (self, body)
	if self._head_body_name and body then
		slot4 = body
		local head = body.name(slot3) == self._ids_head_body_name
	end

	return head
end
CopDamage._dismember_body_part = function (self, attack_data)
	local hit_body_part = attack_data.body_name

	if not hit_body_part then
		slot5 = attack_data.col_ray.body
		hit_body_part = attack_data.col_ray.body.name(slot4)
	end

	slot6 = hit_body_part
	local dismember_part = tweak_data.character.dismemberment_data.dismembers[hit_body_part.key(slot5)]

	if not dismember_part then
		return 
	end

	slot9 = true

	self.dismember(slot5, self, dismember_part, attack_data.variant)

	return 
end
CopDamage.dismember = function (self, dismember_part, variant, allow_network)
	slot7 = dismember_part

	table.insert(slot5, self._dismembered_parts)

	local decal_data = tweak_data.character.dismemberment_data.blood_decal_data[dismember_part]
	slot10 = variant

	self._dismember_part(self._dismembered_parts, self, dismember_part, decal_data)

	if variant == "explosion" then
		slot8 = "_l_"
		local force_left_right = string.match(slot6, dismember_part)

		if force_left_right then
			force_left_right = "r"
		else
			force_left_right = "l"
		end

		slot9 = force_left_right
		local additional_part = self._random_dismember_part(slot7, self)
		slot12 = variant

		self._dismember_part(self, self, additional_part, tweak_data.character.dismemberment_data.blood_decal_data[additional_part])
	end

	if allow_network then
		if false then
			slot7 = managers.network
			slot11 = variant

			managers.network.session(slot6).send_to_peers(slot6, managers.network.session(slot6), "sync_part_dismemberment", self._unit, dismember_part)
		end
	end

	return 
end
CopDamage._random_dismember_part = function (self, force_left_right)
	slot5 = 8
	local head = ({
		true,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	})[math.random(slot4)]

	if not force_left_right then
		slot6 = 2
		local left_right = ({
			"l",
			"r"
		})[math.random(slot5)]
	end

	local up_down = ({
		"upper",
		"lower"
	})[math.random(slot6)]
	slot8 = 2
	local arm_leg = ({
		"arm",
		"leg"
	})[math.random(2)]

	if head then
		return "dismember_head"
	else
		return "dismember_" .. left_right .. "_" .. up_down .. "_" .. arm_leg
	end

	return 
end
CopDamage._dismember_part = function (self, dismember_part, decal_data, variant)
	slot6 = self._unit
	slot7 = dismember_part

	if not self._unit.damage(slot5).has_sequence(slot5, self._unit.damage(slot5)) then
		return 
	end

	slot6 = self._unit
	slot7 = dismember_part

	self._unit.damage(slot5).run_sequence_simple(slot5, self._unit.damage(slot5))

	local materials = self._unit.materials(slot5)
	slot7 = materials

	for i, material in ipairs(self._unit) do
		slot13 = Idstring(slot14)
		slot18 = 0

		material.set_variable(slot11, material, Vector3("gradient_uv_offset", decal_data[1], decal_data[2]))

		slot15 = "gradient_power"
		slot14 = decal_data[3]

		material.set_variable(slot11, material, Idstring(Vector3))
	end

	if variant == WeaponTweakData.DAMAGE_TYPE_BULLET then
		slot7 = self._unit

		self._unit.sound(slot6).play(slot6, self._unit.sound(slot6), "bullet_hit_bone_limboff", nil)
	end

	if variant == "explosion" then
		slot9 = {
			skip_idle_check = true
		}

		managers.dialog.queue_dialog(slot6, managers.dialog, "player_gen_grenade_aftermath")
	end

	return 
end
CopDamage.dismembered_parts = function (self)
	return self._dismembered_parts
end
CopDamage.damage_knockdown = function (self, attack_data)
	if self._dead or self._invulnerable then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return "friendly_fire"
	end

	attack_data.result = {
		variant = attack_data.variant,
		type = "expl_hurt"
	}
	local damage = attack_data.damage
	local damage_percent = 0

	if 0 < damage then
		slot10 = self._HEALTH_GRANULARITY
		damage_percent = math.ceil(math.clamp(slot7, damage / self._HEALTH_INIT_PRECENT, 1))
	end

	local body_index = self._unit.get_body_index(slot5, attack_data.col_ray.body.name(slot8))
	slot10 = self._unit
	slot10 = self._unit.movement(attack_data.col_ray.body)
	slot9 = 300
	local hit_offset_height = math.clamp(self._unit, attack_data.col_ray.position.z - self._unit.movement(attack_data.col_ray.body).m_pos(attack_data.col_ray.body).z, 0)
	slot12 = hit_offset_height

	self._send_knockdown_attack_result(attack_data.col_ray.position.z - self._unit.movement(attack_data.col_ray.body).m_pos(attack_data.col_ray.body).z, self, attack_data.attacker_unit, damage_percent, body_index)

	slot9 = attack_data

	self._on_damage_received(attack_data.col_ray.position.z - self._unit.movement(attack_data.col_ray.body).m_pos(attack_data.col_ray.body).z, self)

	return 
end
CopDamage.damage_bullet = function (self, attack_data)

	-- Decompilation error in this vicinity:
	self._last_damage_direction = attack_data.col_ray.ray

	if attack_data.damage < 0.001 then
		return "no_damage"
	elseif self._dead or self._invulnerable then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return "friendly_fire"
	end

	local death_event_params = {
		damage_type = WeaponTweakData.DAMAGE_TYPE_BULLET
	}
	slot6 = self._unit
	death_event_params.enemy_type = tweak_data.character[self._unit.base(slot5)._tweak_table].type
	slot6 = self._unit
	death_event_params.special_enemy_type = tweak_data.character[self._unit.base(slot5)._tweak_table].special_type

	if self._has_plate and attack_data.col_ray.body then
		slot5 = attack_data.col_ray.body

		if attack_data.col_ray.body.name(slot4) == self._ids_plate_name then
			slot5 = 1
			local armor_pierce_roll = math.rand(slot4)
			local armor_pierce_value = 0
			slot8 = managers.player

			if attack_data.attacker_unit == managers.player.player_unit(slot7) then
				slot7 = attack_data.weapon_unit
			else
				slot7 = attack_data.attacker_unit

				if attack_data.attacker_unit.base(slot6) then
					slot7 = attack_data.attacker_unit

					if attack_data.attacker_unit.base(slot6).sentry_gun then
						slot7 = attack_data.attacker_unit
						local owner = attack_data.attacker_unit.base(slot6).get_owner(slot6)
						slot8 = owner

						if alive(attack_data.attacker_unit.base(slot6)) then
							slot8 = managers.player

							if owner == managers.player.player_unit(slot7) then
								slot11 = 0
								armor_pierce_value = armor_pierce_value + managers.player.upgrade_value(slot7, managers.player, "sentry_gun", "armor_piercing_chance")
								slot11 = 0
								armor_pierce_value = armor_pierce_value + managers.player.upgrade_value(slot7, managers.player, "sentry_gun", "armor_piercing_chance_2")
							else
								slot8 = owner
								slot10 = "armor_piercing_chance"
								armor_pierce_value = armor_pierce_value + (owner.base(slot7).upgrade_value(slot7, owner.base(slot7), "sentry_gun") or 0)
								slot8 = owner
								slot10 = "armor_piercing_chance_2"
								armor_pierce_value = armor_pierce_value + (owner.base(slot7).upgrade_value(slot7, owner.base(slot7), "sentry_gun") or 0)
							end
						end
					end
				end
			end

			if armor_pierce_value <= armor_pierce_roll then
				return 
			end
		end
	end

	local result = nil
	slot6 = self._unit
	slot9 = attack_data.col_ray.body
	local body_index = self._unit.get_body_index(slot5, attack_data.col_ray.body.name(slot8))

	if self._head_body_name and attack_data.col_ray.body then
		slot7 = attack_data.col_ray.body
		local head = attack_data.col_ray.body.name(slot6) == self._ids_head_body_name
	end

	local instakill = false
	local damage = attack_data.damage
	slot10 = self._unit
	slot10 = self._unit.base(slot9)

	if self._unit.base(slot9).char_tweak(slot9).DAMAGE_CLAMP_BULLET then
		slot13 = self._unit
		slot13 = self._unit.base(slot12)
		slot11 = self._unit.base(slot12).char_tweak(slot12).DAMAGE_CLAMP_BULLET
		damage = math.min(slot9, damage)
	end

	damage = damage * (self._marked_dmg_mul or 1)
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)

	if self._unit.movement(slot9).cool(slot9) then
		damage = self._HEALTH_INIT
	end

	slot13 = 1
	slot14 = 1
	damage = damage * managers.player.team_upgrade_value(slot9, managers.player, "player", "warcry_damage_multiplier") * managers.player.team_upgrade_value(managers.player, managers.player, "player", "warcry_damage_buff_bonus")
	local headshot_multiplier = 1
	local weapon_headshot_multiplier = 1
	slot13 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit("player") then
		local percent_dmg = damage / self._HEALTH_INIT
		slot14 = damage
		local critical_hit, crit_damage = self.roll_critical_hit(slot12, self)

		if critical_hit then
			death_event_params.critical_hit = true
			damage = crit_damage
		elseif head then
			death_event_params.headshot = true
		end

		slot18 = 1
		headshot_multiplier = headshot_multiplier * managers.player.upgrade_value(slot14, managers.player, "player", "headshot_damage_multiplier")
		slot16 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_DAMAGE

		if managers.buff_effect.is_effect_active(slot14, managers.buff_effect) and head then
			slot16 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_DAMAGE
			headshot_multiplier = headshot_multiplier * (managers.buff_effect.get_effect_value(slot14, managers.buff_effect) or 1)
		end

		slot16 = self._unit

		if tweak_data.character[self._unit.base(slot15)._tweak_table].priority_shout then
			slot18 = 1
			damage = damage * managers.player.upgrade_value(slot14, managers.player, "weapon", "special_damage_taken_multiplier")
		end

		slot15 = attack_data.weapon_unit

		if alive(slot14) then
			slot15 = attack_data.weapon_unit

			if attack_data.weapon_unit.base(slot14).weapon_tweak_data then
				slot15 = attack_data.weapon_unit
				slot15 = attack_data.weapon_unit.base(slot14)
				weapon_headshot_multiplier = attack_data.weapon_unit.base(slot14).weapon_tweak_data(slot14).headshot_multiplier or 1
			end
		end
	end

	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * weapon_headshot_multiplier * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			instakill = true
			damage = self._health * 10
		end
	end

	slot14 = attack_data
	damage = self._apply_damage_modifier(slot11, self, damage)
	slot12 = self._unit

	if self._unit.unit_data(slot11).turret_weapon then
		death_event_params.mounted_on_turret = true
		slot13 = self._unit
		local turret_tweak_data = tweak_data.weapon[self._unit.unit_data(slot12).turret_weapon._name_id]
		local damage_multiplier = turret_tweak_data.puppet_damage_multiplier or 1
		damage = damage * damage_multiplier
	end

	slot16 = self._HEALTH_GRANULARITY
	local damage_percent = math.ceil(math.clamp(slot13, damage / self._HEALTH_INIT_PRECENT, 1))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot15 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(math.clamp, self, damage)

	if self._immortal then
		damage = 0
		damage_percent = 0
	end

	slot14 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot14 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION
	slot14 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot12, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	slot14 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot13) and 0 < damage then
		if death_event_params.critical_hit then
			slot13 = managers.hud

			managers.hud.on_crit_confirmed(slot12)
		elseif death_event_params.headshot then
			slot13 = managers.hud

			managers.hud.on_headshot_confirmed(slot12)
		else
			local percent_dmg = damage / self._HEALTH_INIT

			if WeaponTweakData.HIT_INDICATOR_ABSOLUTE <= damage or WeaponTweakData.HIT_INDICATOR_PERCENT <= percent_dmg then
				slot14 = managers.hud

				managers.hud.on_hit_confirmed(slot13)
			end
		end

		if head then
			slot14 = self._health <= damage

			managers.player.on_headshot_dealt(slot12, managers.player)
		end
	end

	if self._health <= damage then
		if head then
			slot13 = 100

			if math.random(slot12) < damage then
				slot14 = {
					position = attack_data.col_ray.body.position(slot16),
					rotation = attack_data.col_ray.body.rotation(slot16),
					dir = attack_data.col_ray.ray
				}
				slot17 = attack_data.col_ray.body
				slot17 = attack_data.col_ray.body

				self._spawn_head_gadget(slot12, self)
			end
		end

		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot14 = attack_data

		self.die(attack_data.variant, self)

		slot15 = WeaponTweakData.DAMAGE_TYPE_BULLET

		self.chk_killshot(attack_data.variant, self, attack_data.attacker_unit)

		slot14 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(attack_data.variant, managers.buff_effect) then
			slot14 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot12, managers.buff_effect) or 0
			slot15 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot14) then
				slot14 = managers.player
				slot14 = managers.player.local_player(slot13)
				slot17 = managers.player
				slot17 = managers.player.local_player(slot16)
				slot17 = managers.player.local_player(slot16).character_damage(slot16)
				slot16 = true

				managers.player.local_player(slot13).character_damage(slot13).restore_health(slot13, managers.player.local_player(slot13).character_damage(slot13), health_amount_regen * managers.player.local_player(slot16).character_damage(slot16).get_max_health(slot16))
			end
		end
	else
		attack_data.damage = damage
		slot15 = WeaponTweakData.DAMAGE_TYPE_BULLET
		local result_type = self.get_damage_type(slot12, self, damage_percent)
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		slot15 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local dismember_victim = false

	if result.type == "death" then
		slot16 = false

		if self._dismember_condition(slot13, self, attack_data) then
			death_event_params.dismemberment_occured = true
			slot15 = attack_data

			self._dismember_body_part(slot13, self)

			dismember_victim = true
		end

		local data = {}
		slot15 = self._unit
		data.unit_key = self._unit.key(slot14)
		slot15 = self._unit
		data.name = self._unit.base(slot14)._tweak_table
		slot15 = self._unit
		data.stats_name = self._unit.base(slot14)._stats_name
		data.head_shot = head
		data.weapon_unit = attack_data.weapon_unit
		data.variant = attack_data.variant
		data.dismembered = dismember_victim

		if not attack_data.attacker_unit then
			slot16 = "CopDamage:damage_bullet: missing attacker unit. "
			slot19 = attack_data

			Application.error(slot14, Application, inspect(slot18))
		end

		if attack_data.attacker_unit then
			slot15 = managers.groupai
			slot16 = attack_data.attacker_unit

			if managers.groupai.state(slot14).all_criminals(slot14)[attack_data.attacker_unit.key(managers.groupai.state(slot14))] then
				slot16 = data

				managers.statistics.killed_by_anyone(slot14, managers.statistics)
			end
		end

		slot16 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(slot15) then
			slot15 = self._unit.position(slot16)
			slot18 = attack_data.attacker_unit
			death_event_params.enemy_distance = mvector3.distance(slot14, attack_data.attacker_unit.position(self._unit))
			slot15 = managers.player
			slot15 = managers.player.get_current_state(slot14)
			death_event_params.player_used_steelsight = managers.player.get_current_state(slot14).in_steelsight(slot14)
			death_event_params.weapon_used = attack_data.weapon_unit
			slot15 = managers.player
			death_event_params.using_turret = managers.player.current_state(slot14) == "turret"
			slot18 = false

			if managers.player.upgrade_value(slot14, managers.player, "player", "warcry_health_regen_on_kill") == true then
				slot16 = death_event_params.weapon_used

				if tweak_data.weapon[death_event_params.weapon_used.base(slot15)._name_id] then
					slot16 = death_event_params.weapon_used

					if tweak_data.weapon[death_event_params.weapon_used.base(slot15)._name_id].category == WeaponTweakData.WEAPON_CATEGORY_SNP then
						local unit = managers.player.player_unit(slot14)
						slot16 = unit
						local max_health = unit.character_damage(managers.player).get_max_health(managers.player)
						slot17 = unit
						local current_health = unit.character_damage(unit.character_damage(managers.player)).get_real_health(unit.character_damage(managers.player))
						slot21 = false
						local hp_pickup_amount = managers.player.upgrade_value(unit.character_damage(unit.character_damage(managers.player)), managers.player, "player", "warcry_health_regen_amount")

						if max_health < current_health + hp_pickup_amount then
							slot19 = unit
							slot20 = max_health

							unit.character_damage(slot18).set_health(slot18, unit.character_damage(slot18))
						else
							slot19 = unit
							slot20 = current_health + hp_pickup_amount

							unit.character_damage(slot18).set_health(slot18, unit.character_damage(slot18))
						end

						if managers.hud and managers.hud._sound_source and managers.hud._sound_source.post_event then
							slot20 = tweak_data.warcry.sharpshooter.health_boost_sound

							managers.hud._sound_source.post_event(slot18, managers.hud._sound_source)
						end
					end
				end
			end

			slot19 = self._unit

			self._comment_death(slot14, self, attack_data.attacker_unit)

			slot18 = self._unit
			slot16 = self._unit.base(self._unit.base(slot18)._tweak_table)._tweak_table

			self._show_death_hint(slot14, self)

			local attacker_state = managers.player.current_state(slot14)
			data.attacker_state = attacker_state
			slot17 = data

			managers.statistics.killed(managers.player, managers.statistics)

			slot18 = death_event_params

			managers.system_event_listener.call_listeners(managers.player, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)

			slot16 = attack_data.attacker_unit
			slot16 = attack_data.attacker_unit.character_damage(managers.player)

			if attack_data.attacker_unit.character_damage(managers.player).bleed_out(managers.player) then
				slot18 = self._unit
				slot16 = self._unit.base(slot17)._tweak_table

				if not CopDamage.is_civilian(slot15) then
					local messiah_revive = false
					slot19 = "revive_from_bleed_out"

					if managers.player.has_category_upgrade(slot16, managers.player, "player") then
						slot17 = data.weapon_unit

						if not data.weapon_unit.base(slot16).thrower_unit then
							slot17 = attack_data.attacker_unit
							slot17 = attack_data.attacker_unit.character_damage(slot16)

							if attack_data.attacker_unit.character_damage(slot16).consume_messiah_charge(slot16) then
								messiah_revive = true
							end
						end
					end

					if messiah_revive then
						slot17 = attack_data.attacker_unit
						slot18 = true

						attack_data.attacker_unit.character_damage(slot16).revive(slot16, attack_data.attacker_unit.character_damage(slot16))
					end
				end
			end

			slot18 = self._unit
			slot16 = self._unit.base(slot17)._tweak_table

			if not CopDamage.is_civilian(slot15) then
				slot18 = "overkill_damage_multiplier"

				if managers.player.has_category_upgrade(slot15, managers.player, "temporary") then
					slot16 = attack_data.weapon_unit

					if not attack_data.weapon_unit.base(slot15).thrower_unit then
						slot16 = attack_data.weapon_unit
						slot16 = attack_data.weapon_unit.base(slot15)
						local weapon_category = attack_data.weapon_unit.base(slot15).weapon_tweak_data(slot15).category

						if weapon_category == "shotgun" or weapon_category == "saw" then
							slot19 = "overkill_damage_multiplier"

							managers.player.activate_temporary_upgrade(slot16, managers.player, "temporary")
						end
					end
				end
			end
		else
			slot15 = attack_data.attacker_unit
			slot19 = "criminals_no_deployables"

			if attack_data.attacker_unit.in_slot(slot14, managers.slot.get_mask(slot17, managers.slot)) then
				slot19 = self._unit
				slot17 = self._unit.base(slot18)._tweak_table

				self._AI_comment_death(slot14, self, attack_data.attacker_unit)
			else
				slot15 = attack_data.attacker_unit

				if attack_data.attacker_unit.base(slot14).sentry_gun then
					slot15 = Network

					if Network.is_server(slot14) then
						slot15 = attack_data.weapon_unit
						slot15 = attack_data.weapon_unit.base(slot14)
						local server_info = attack_data.weapon_unit.base(slot14).server_information(slot14)

						if server_info then
							slot17 = managers.network
							slot17 = managers.network.session(slot16)
							slot17 = managers.network.session(slot16).local_peer(slot16)
						else
							slot16 = managers.player
							data.attacker_state = managers.player.current_state(slot15)
							slot17 = data

							managers.statistics.killed(slot15, managers.statistics)
						end
					end
				end
			end
		end
	end

	slot17 = self._unit
	slot17 = self._unit.movement(slot16)
	slot16 = 300
	local hit_offset_height = math.clamp(slot13, attack_data.col_ray.position.z - self._unit.movement(slot16).m_pos(slot16).z, 0)
	local attacker = attack_data.attacker_unit
	slot16 = attacker

	if attacker.id(0) == -1 then
		attacker = self._unit
	end

	slot16 = attack_data.weapon_unit

	if alive(slot15) then
		slot16 = attack_data.weapon_unit

		if attack_data.weapon_unit.base(slot15) then
			slot16 = attack_data.weapon_unit

			if attack_data.weapon_unit.base(slot15).add_damage_result then
				slot16 = attack_data.weapon_unit
				slot20 = damage_percent

				attack_data.weapon_unit.base(slot15).add_damage_result(slot15, attack_data.weapon_unit.base(slot15), self._unit, attacker, result.type == "death")
			end
		end
	end

	slot21 = hit_offset_height

	self._send_bullet_attack_result(slot15, self, attack_data, attacker, damage_percent, body_index)

	slot17 = attack_data

	self._on_damage_received(slot15, self)

	return result
end
CopDamage.is_civilian = function (type)
	return type == "civilian" or type == "civilian_female" or type == "bank_manager"
end
CopDamage.is_gangster = function (type)
	return type == "gangster" or type == "biker_escape" or type == "mobster" or type == "mobster_boss" or type == "biker"
end
CopDamage.is_cop = function (type)
	slot3 = type

	if not CopDamage.is_civilian(slot2) then
		slot3 = type
		slot1 = not CopDamage.is_gangster(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	return slot1
end
CopDamage._show_death_hint = function (self, type)
	slot4 = type

	if CopDamage.is_civilian(slot3) then
		slot4 = self._unit

		if not self._unit.base(slot3).enemy then
		end
	end

	return 
end
CopDamage._comment_death = function (self, unit, type)
	if type == "tank" then
	elseif type == "taser" then
	elseif type == "shield" then
	elseif type == "sniper" or type == "german_sniper" then
		slot7 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot9)
		}
		slot10 = managers.player

		managers.dialog.queue_dialog(slot4, managers.dialog, "enemy_sniper_comment_death")
	elseif type == "german_flamer" then
		slot7 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot9)
		}
		slot10 = managers.player

		managers.dialog.queue_dialog(slot4, managers.dialog, "enemy_flamer_comment_death")
	elseif type == "german_officer" or type == "german_commander" or type == "german_og_commander" then
		slot7 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot9)
		}
		slot10 = managers.player

		managers.dialog.queue_dialog(slot4, managers.dialog, "enemy_officer_comment_death")
	elseif type == "german_spotter" then
		slot7 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot9)
		}
		slot10 = managers.player

		managers.dialog.queue_dialog(slot4, managers.dialog, "enemy_spotter_comment_death")
	end

	return 
end
CopDamage._AI_comment_death = function (self, unit, type)
	if type == "tank" then
	elseif type == "taser" then
	elseif type == "shield" then
	elseif type == "sniper" then
	end

	return 
end
CopDamage.damage_fire = function (self, attack_data)

	-- Decompilation error in this vicinity:
	local result = nil
	local damage = attack_data.damage
	slot7 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot6) then
		slot7 = damage
		local critical_hit, crit_damage = self.roll_critical_hit(slot5, self)
		damage = crit_damage

		if attack_data.weapon_unit and attack_data.variant ~= "stun" and not attack_data.is_fire_dot_damage then
			if critical_hit then
				slot8 = managers.hud

				managers.hud.on_crit_confirmed(slot7)
			else
				slot8 = managers.hud

				managers.hud.on_hit_confirmed(slot7)
			end
		end
	end

	slot7 = damage
	damage = self._apply_damage_modifier(slot5, self)
	slot6 = attack_data.attacker_unit

	if attack_data.attacker_unit.brain(slot5) then
		slot6 = attack_data.attacker_unit

		if attack_data.attacker_unit.brain(slot5).is_flamer then
			slot7 = attack_data.attacker_unit
			local flamer_tweak = tweak_data.character[attack_data.attacker_unit.base(slot6)._tweak_table]
			damage = damage * flamer_tweak.friendly_fire_dmg_mul
		end
	end

	slot8 = self._HEALTH_INIT
	damage = math.clamp(slot5, damage, 0)
	local damage_percent = math.ceil(slot5)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot9 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(damage / self._HEALTH_INIT_PRECENT, self, damage)

	if self._immortal then
		damage = 0
		damage_percent = 0
	end

	if self._head_body_name and attack_data.col_ray.body then
		slot7 = attack_data.col_ray.body
		local head = attack_data.col_ray.body.name(slot6) == self._ids_head_body_name
	end

	slot9 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot9 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION
	slot9 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot9 = attack_data

		self.die(attack_data.variant, self)

		slot10 = "fire"

		self.chk_killshot(attack_data.variant, self, attack_data.attacker_unit)

		slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(attack_data.variant, managers.buff_effect) then
			slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot7, managers.buff_effect) or 0
			slot10 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot9) then
				slot9 = managers.player
				slot9 = managers.player.local_player(slot8)
				slot12 = managers.player
				slot12 = managers.player.local_player(slot11)
				slot12 = managers.player.local_player(slot11).character_damage(slot11)
				slot11 = true

				managers.player.local_player(slot8).character_damage(slot8).restore_health(slot8, managers.player.local_player(slot8).character_damage(slot8), health_amount_regen * managers.player.local_player(slot11).character_damage(slot11).get_max_health(slot11))
			end
		end
	else
		attack_data.damage = damage

		if attack_data.variant == "stun" then
			slot6 = "hurt_sick"
		else
			slot10 = "fire"
			local result_type = self.get_damage_type(slot7, self, damage_percent)
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}
		slot10 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local headshot_multiplier = 1
	slot10 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot9) then
		slot10 = damage
		local critical_hit, crit_damage = self.roll_critical_hit(slot8, self)

		if critical_hit then
			damage = crit_damage
		end

		slot12 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_DAMAGE

		if managers.buff_effect.is_effect_active(slot10, managers.buff_effect) and head then
			slot12 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_DAMAGE
			headshot_multiplier = headshot_multiplier * (managers.buff_effect.get_effect_value(slot10, managers.buff_effect) or 1)
		end

		slot12 = self._unit

		if tweak_data.character[self._unit.base(slot11)._tweak_table].priority_shout then
			slot14 = 1
			damage = damage * managers.player.upgrade_value(slot10, managers.player, "weapon", "special_damage_taken_multiplier")
		end

		if head then
			slot11 = managers.player

			managers.player.on_headshot_dealt(slot10)
		end
	end

	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end

	if self._head_body_name and attack_data.variant ~= "stun" then
		if attack_data.col_ray.body and self._head_body_key then
			slot9 = attack_data.col_ray.body
			head = attack_data.col_ray.body.key(slot8) == self._head_body_key
		end

		slot10 = self._head_body_name
		slot7 = self._unit.body(slot8, self._unit)
	end

	local attacker = attack_data.attacker_unit
	local attacker_unit = attack_data.attacker_unit

	if result.type == "death" then
		local data = {}
		slot12 = self._unit
		data.unit_key = self._unit.key(slot11)
		slot12 = self._unit
		data.name = self._unit.base(slot11)._tweak_table
		slot12 = self._unit
		data.stats_name = self._unit.base(slot11)._stats_name
		data.owner = attack_data.owner
		data.weapon_unit = attack_data.weapon_unit
		data.variant = attack_data.variant
		data.head_shot = head

		if not attack_data.is_fire_dot_damage then
			slot13 = data

			managers.statistics.killed_by_anyone(slot11, managers.statistics)
		end

		if attacker_unit then
			slot12 = attacker_unit

			if attacker_unit.base(slot11) then
				slot12 = attacker_unit

				if attacker_unit.base(slot11).thrower_unit then
					slot12 = attacker_unit
					slot12 = attacker_unit.base(slot11)
					attacker_unit = attacker_unit.base(slot11).thrower_unit(slot11)
					data.weapon_unit = attack_data.attacker_unit
				end
			end
		end

		slot12 = managers.player

		if attacker_unit == managers.player.player_unit(slot11) then
			slot12 = attacker_unit

			if alive(slot11) then
				slot16 = self._unit
				slot14 = self._unit.base(slot15)._tweak_table

				self._comment_death(slot11, self, attacker_unit)
			end

			slot15 = self._unit
			slot13 = self._unit.base(slot14)._tweak_table

			self._show_death_hint(slot11, self)

			if not attack_data.is_fire_dot_damage then
				slot13 = data

				managers.statistics.killed(slot11, managers.statistics)
			end

			slot14 = self._unit
			slot12 = self._unit.base(slot13)._tweak_table

			if CopDamage.is_civilian(slot11) then
			end
		end
	end

	slot11 = attacker

	if alive(slot10) then
		slot11 = attacker

		if attacker.base(slot10) then
			slot11 = attacker

			if attacker.base(slot10).add_damage_result then
				slot11 = attacker
				slot14 = damage_percent

				attacker.base(slot10).add_damage_result(slot10, attacker.base(slot10), self._unit, result.type == "death")
			end
		end
	end

	if not attack_data.is_fire_dot_damage then
		local fire_dot_data = attack_data.fire_dot_data
		local flammable = nil
		slot14 = self._unit
		local char_tweak = tweak_data.character[self._unit.base(slot13)._tweak_table]

		if char_tweak.flammable == nil then
			flammable = true
		else
			flammable = char_tweak.flammable
		end

		local distance = 1000
		local hit_loc = attack_data.col_ray.hit_position

		if hit_loc and attacker_unit and attacker_unit.position then
			slot16 = hit_loc
			slot19 = attacker_unit
			distance = mvector3.distance(slot15, attacker_unit.position(slot18))
		end

		local fire_dot_max_distance = 3000
		local fire_dot_trigger_chance = 30

		if fire_dot_data then
			slot18 = fire_dot_data.dot_trigger_max_distance
			fire_dot_max_distance = tonumber(slot17)
			slot18 = fire_dot_data.dot_trigger_chance
			fire_dot_trigger_chance = tonumber(slot17)
		end

		slot19 = 100
		local start_dot_damage_roll = math.random(slot17, 1)
		local start_dot_dance_antimation = false

		if flammable and not attack_data.is_fire_dot_damage and distance < fire_dot_max_distance and start_dot_damage_roll <= fire_dot_trigger_chance then
			slot24 = TimerManager
			slot24 = TimerManager.game(slot23)
			slot25 = fire_dot_data.dot_damage

			managers.fire.add_doted_enemy(slot19, managers.fire, self._unit, TimerManager.game(slot23).time(slot23), attack_data.weapon_unit, fire_dot_data.dot_length)

			start_dot_dance_antimation = true
		end

		if fire_dot_data then
			fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
			attack_data.fire_dot_data = fire_dot_data
		end
	end

	slot16 = attack_data.col_ray.ray

	self._send_fire_attack_result(slot10, self, attack_data, attacker, damage_percent, attack_data.is_fire_dot_damage)

	slot12 = attack_data

	self._on_damage_received(slot10, self)

	return 
end
CopDamage.damage_dot = function (self, attack_data)

	-- Decompilation error in this vicinity:
	if self._dead or self._invulnerable then
		return 
	end

	local result = nil
	local damage = attack_data.damage
	slot7 = damage
	damage = self._apply_damage_modifier(slot5, self)
	slot8 = self._HEALTH_INIT
	damage = math.clamp(slot5, damage, 0)
	local damage_percent = math.ceil(slot5)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot9 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(damage / self._HEALTH_INIT_PRECENT, self, damage)

	if self._immortal then
		damage = 0
		damage_percent = 0
	end

	if self._head_body_name and attack_data.col_ray.body then
		slot7 = attack_data.col_ray.body
		local head = attack_data.col_ray.body.name(slot6) == self._ids_head_body_name
	end

	slot9 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot9 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION
	slot9 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot9 = attack_data

		self.die(attack_data.variant, self)

		slot10 = attack_data.variant or "dot"

		self.chk_killshot(slot7, self, attack_data.attacker_unit)

		slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) then
			slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot7, managers.buff_effect) or 0
			slot10 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot9) then
				slot9 = managers.player
				slot9 = managers.player.local_player(slot8)
				slot12 = managers.player
				slot12 = managers.player.local_player(slot11)
				slot12 = managers.player.local_player(slot11).character_damage(slot11)
				slot11 = true

				managers.player.local_player(slot8).character_damage(slot8).restore_health(slot8, managers.player.local_player(slot8).character_damage(slot8), health_amount_regen * managers.player.local_player(slot11).character_damage(slot11).get_max_health(slot11))
			end
		end
	else

		-- Decompilation error in this vicinity:
		attack_data.damage = damage
		slot10 = attack_data.variant
		local result_type = self.get_damage_type(slot7, self, damage_percent) or "dmg_rcv"
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		slot10 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	local attacker_unit = attack_data.attacker_unit

	if result.type == "death" then
		local data = {}
		slot11 = self._unit
		data.unit_key = self._unit.key(slot10)
		slot11 = self._unit
		data.name = self._unit.base(slot10)._tweak_table
		slot11 = self._unit
		data.stats_name = self._unit.base(slot10)._stats_name
		data.owner = attack_data.owner
		data.weapon_unit = attack_data.weapon_unit
		data.variant = attack_data.variant
		data.head_shot = head
		slot12 = data

		managers.statistics.killed_by_anyone(slot10, managers.statistics)

		slot11 = managers.player

		if attacker_unit == managers.player.player_unit(slot10) then
			slot11 = attacker_unit

			if alive(slot10) then
				slot15 = self._unit
				slot13 = self._unit.base(slot14)._tweak_table

				self._comment_death(slot10, self, attacker_unit)
			end

			slot14 = self._unit
			slot12 = self._unit.base(slot13)._tweak_table

			self._show_death_hint(slot10, self)
			managers.statistics.killed(slot10, managers.statistics)

			slot13 = self._unit
			slot11 = self._unit.base(data)._tweak_table

			if CopDamage.is_civilian(slot10) then
			end
		end
	end

	slot15 = attack_data.col_ray.ray

	self._send_dot_attack_result(slot9, self, attack_data, attacker, damage_percent, attack_data.variant)

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return 
end
CopDamage.damage_explosion = function (self, attack_data)

	-- Decompilation error in this vicinity:
	self._last_damage_direction = attack_data.col_ray.ray

	if self._dead or self._invulnerable then
		return 
	end

	local death_event_params = {
		damage_type = WeaponTweakData.DAMAGE_TYPE_EXPLOSION,
		enemy_type = tweak_data.character[self._unit.base(slot5)._tweak_table].type
	}
	local result = nil
	local damage = attack_data.damage
	slot7 = self._unit
	slot7 = self._unit.base(self._unit)

	if self._unit.base(self._unit).char_tweak(self._unit).DAMAGE_CLAMP_EXPLOSION then
		slot10 = self._unit
		slot10 = self._unit.base(slot9)
		slot8 = self._unit.base(slot9).char_tweak(slot9).DAMAGE_CLAMP_EXPLOSION
		damage = math.min(slot6, damage)
	end

	damage = damage * (self._char_tweak.damage.explosion_damage_mul or 1)
	damage = damage * (self._marked_dmg_mul or 1)
	slot8 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot7) then
		slot8 = damage
		local critical_hit, crit_damage = self.roll_critical_hit(slot6, self)
		damage = crit_damage

		if attack_data.weapon_unit and attack_data.variant ~= "stun" then
			if critical_hit then
				slot9 = managers.hud

				managers.hud.on_crit_confirmed(slot8)
			else
				slot9 = managers.hud

				managers.hud.on_hit_confirmed(slot8)
			end
		end
	end

	slot8 = damage
	damage = self._apply_damage_modifier(slot6, self)
	slot9 = self._HEALTH_INIT
	damage = math.clamp(slot6, damage, 0)
	local damage_percent = math.ceil(slot6)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot10 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(damage / self._HEALTH_INIT_PRECENT, self, damage)

	if self._immortal then
		damage = 0
		damage_percent = 0
	end

	local head = nil

	if self._head_body_name and attack_data.variant ~= "stun" then
		if attack_data.col_ray.body and self._head_body_key then
			slot9 = attack_data.col_ray.body
			head = attack_data.col_ray.body.key(slot8) == self._head_body_key
		end

		slot10 = self._head_body_name
		local body = self._unit.body(slot8, self._unit)
		slot11 = {
			position = body.position(slot13),
			rotation = body.rotation(slot13),
			dir = -attack_data.col_ray.ray
		}
		slot14 = body
		slot14 = body

		self._spawn_head_gadget(self._unit, self)
	end

	slot10 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot10 = BuffEffectManager.EFFECT_ENEMIES_IMPERVIOUS_TO_EXPLOSIVE_DAMAGE

	if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
		damage = 0
		damage_percent = 0
	end

	slot10 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_MELEE

	if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
		slot10 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION

		if not managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
			damage = 0
			damage_percent = 0
		end
	end

	slot10 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot10 = attack_data

		self.die(attack_data.variant, self)

		slot10 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(attack_data.variant, managers.buff_effect) then
			slot10 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot8, managers.buff_effect) or 0
			slot11 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot10) then
				slot10 = managers.player
				slot10 = managers.player.local_player(slot9)
				slot13 = managers.player
				slot13 = managers.player.local_player(slot12)
				slot13 = managers.player.local_player(slot12).character_damage(slot12)
				slot12 = true

				managers.player.local_player(slot9).character_damage(slot9).restore_health(slot9, managers.player.local_player(slot9).character_damage(slot9), health_amount_regen * managers.player.local_player(slot12).character_damage(slot12).get_max_health(slot12))
			end
		end
	else
		attack_data.damage = damage

		if attack_data.variant == "stun" then
			slot7 = "hurt_sick"
		else
			slot11 = "explosion"
			local result_type = self.get_damage_type(slot8, self, damage_percent)
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}
		slot11 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	result.ignite_character = attack_data.ignite_character

	if result.type == "death" then
		local dismember_victim = false
		slot13 = true

		if self._dismember_condition(slot10, self, attack_data) then
			death_event_params.dismemberment_occured = true
			slot12 = attack_data

			self._dismember_body_part(slot10, self)

			dismember_victim = true
		end

		local data = {}
		slot12 = self._unit
		data.unit_key = self._unit.key(slot11)
		slot12 = self._unit
		data.name = self._unit.base(slot11)._tweak_table
		slot12 = self._unit
		data.stats_name = self._unit.base(slot11)._stats_name
		data.owner = attack_data.owner
		data.weapon_unit = attack_data.weapon_unit
		data.variant = attack_data.variant
		data.head_shot = head
		data.dismembered = dismember_victim
		slot13 = data

		managers.statistics.killed_by_anyone(slot11, managers.statistics)

		local attacker_unit = attack_data.attacker_unit

		if attacker_unit then
			slot13 = attacker_unit

			if attacker_unit.base(slot12) then
				slot13 = attacker_unit

				if attacker_unit.base(slot12).thrower_unit then
					slot13 = attacker_unit
					slot13 = attacker_unit.base(slot12)
					attacker_unit = attacker_unit.base(slot12).thrower_unit(slot12)
					data.weapon_unit = attack_data.attacker_unit
				end
			end
		end

		slot15 = "explosion"

		self.chk_killshot(slot12, self, attacker_unit)

		slot13 = managers.player

		if attacker_unit == managers.player.player_unit(slot12) then
			slot13 = attacker_unit

			if alive(slot12) then
				slot17 = self._unit
				slot15 = self._unit.base(slot16)._tweak_table

				self._comment_death(slot12, self, attacker_unit)
			end

			slot16 = self._unit
			slot14 = self._unit.base(slot15)._tweak_table

			self._show_death_hint(slot12, self)

			slot14 = data

			managers.statistics.killed(slot12, managers.statistics)

			slot15 = death_event_params

			managers.system_event_listener.call_listeners(slot12, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)

			slot15 = self._unit
			slot13 = self._unit.base(CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)._tweak_table

			if CopDamage.is_civilian(slot12) then
			end
		end
	end

	slot10 = attacker

	if alive(slot9) then
		slot10 = attacker

		if attacker.base(slot9) then
			slot10 = attacker

			if attacker.base(slot9).add_damage_result then
				slot10 = attacker
				slot13 = damage_percent

				attacker.base(slot9).add_damage_result(slot9, attacker.base(slot9), self._unit, result.type == "death")
			end
		end
	end

	if not self._no_blood then
		slot12 = attack_data.col_ray.ray

		managers.game_play_central.sync_play_impact_flesh(slot9, managers.game_play_central, attack_data.pos)
	end

	slot17 = attack_data.result.variant
	slot15 = attack_data.col_ray.ray

	self._send_explosion_attack_result(slot9, self, attack_data, attacker, damage_percent, self._get_attack_variant_index(slot15, self))

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return result
end
CopDamage.roll_critical_hit = function (self, damage)
	local critical_hits = self._char_tweak.critical_hits or {}
	local critical_hit = false
	slot7 = managers.player
	local critical_value = (critical_hits.base_chance or 0) + managers.player.critical_hit_chance(slot6) * (critical_hits.player_chance_multiplier or 1)

	if 0 < critical_value then
		slot7 = 1
		local critical_roll = math.rand(slot6)
		critical_hit = critical_roll < critical_value
	end

	if critical_hit then
		local critical_damage_mul = critical_hits.damage_mul or self._char_tweak.headshot_dmg_mul

		if critical_damage_mul then
			damage = damage * critical_damage_mul
		else
			damage = self._health * 10
		end
	end

	return critical_hit, damage
end
CopDamage.damage_tase = function (self, attack_data)

	-- Decompilation error in this vicinity:
	if self._dead or self._invulnerable then
		if self._invulnerable then
			slot4 = "INVULNERABLE!  Not tasing."

			print(slot3)
		end

		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return "friendly_fire"
	end

	if self._tase_effect then
		slot4 = World
		slot5 = self._tase_effect

		World.effect_manager(slot3).fade_kill(slot3, World.effect_manager(slot3))
	end

	slot4 = World
	slot5 = self._tase_effect_table
	self._tase_effect = World.effect_manager(slot3).spawn(slot3, World.effect_manager(slot3))
	local result = nil
	local damage = attack_data.damage
	slot7 = managers.player

	if attack_data.attacker_unit == managers.player.player_unit(slot6) then
		slot7 = damage
		local critical_hit, crit_damage = self.roll_critical_hit(slot5, self)
		damage = crit_damage

		if attack_data.weapon_unit then
			if critical_hit then
				slot8 = managers.hud

				managers.hud.on_crit_confirmed(slot7)
			else
				slot8 = managers.hud

				managers.hud.on_hit_confirmed(slot7)
			end
		end
	end

	slot7 = damage
	damage = self._apply_damage_modifier(slot5, self)
	slot8 = self._HEALTH_INIT
	damage = math.clamp(slot5, damage, 0)
	local damage_percent = math.ceil(slot5)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot9 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(damage / self._HEALTH_INIT_PRECENT, self, damage)
	local head = nil

	if self._head_body_name then
		if attack_data.col_ray.body and self._head_body_key then
			slot8 = attack_data.col_ray.body
			head = attack_data.col_ray.body.key(slot7) == self._head_body_key
		end

		slot9 = self._head_body_name
		local body = self._unit.body(slot7, self._unit)
		slot10 = {
			position = body.position(slot12),
			rotation = body.rotation(slot12),
			dir = -attack_data.col_ray.ray
		}
		slot13 = body
		slot13 = body

		self._spawn_head_gadget(self._unit, self)
	end

	slot9 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot9 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION
	slot9 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	if self._health <= damage then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = WeaponTweakData.DAMAGE_TYPE_BULLET
		}
		slot9 = attack_data

		self.die(WeaponTweakData.DAMAGE_TYPE_BULLET, self)

		slot10 = "tase"

		self.chk_killshot(WeaponTweakData.DAMAGE_TYPE_BULLET, self, attack_data.attacker_unit)

		slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(WeaponTweakData.DAMAGE_TYPE_BULLET, managers.buff_effect) then
			slot9 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot7, managers.buff_effect) or 0
			slot10 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot9) then
				slot9 = managers.player
				slot9 = managers.player.local_player(slot8)
				slot12 = managers.player
				slot12 = managers.player.local_player(slot11)
				slot12 = managers.player.local_player(slot11).character_damage(slot11)
				slot11 = true

				managers.player.local_player(slot8).character_damage(slot8).restore_health(slot8, managers.player.local_player(slot8).character_damage(slot8), health_amount_regen * managers.player.local_player(slot11).character_damage(slot11).get_max_health(slot11))
			end
		end
	else
		attack_data.damage = damage
		local type = "taser_tased"

		if not self._char_tweak.damage.hurt_severity.tase then
			type = "none"
		end

		result = {
			type = type,
			variant = attack_data.variant
		}
		slot10 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit

	if result.type == "death" then
		local data = {}
		slot10 = self._unit
		data.unit_key = self._unit.key(slot9)
		slot10 = self._unit
		data.name = self._unit.base(slot9)._tweak_table
		slot10 = self._unit
		data.stats_name = self._unit.base(slot9)._stats_name
		data.owner = attack_data.owner
		data.weapon_unit = attack_data.weapon_unit
		data.variant = attack_data.variant
		data.head_shot = head
		slot11 = data

		managers.statistics.killed_by_anyone(slot9, managers.statistics)

		local attacker_unit = attack_data.attacker_unit

		if attacker_unit then
			slot11 = attacker_unit

			if attacker_unit.base(slot10) then
				slot11 = attacker_unit

				if attacker_unit.base(slot10).thrower_unit then
					slot11 = attacker_unit
					slot11 = attacker_unit.base(slot10)
					attacker_unit = attacker_unit.base(slot10).thrower_unit(slot10)
					data.weapon_unit = attack_data.attacker_unit
				end
			end
		end

		slot11 = managers.player

		if attacker_unit == managers.player.player_unit(slot10) then
			slot11 = attacker_unit

			if alive(slot10) then
				slot15 = self._unit
				slot13 = self._unit.base(slot14)._tweak_table

				self._comment_death(slot10, self, attacker_unit)
			end

			slot14 = self._unit
			slot12 = self._unit.base(slot13)._tweak_table

			self._show_death_hint(slot10, self)
			managers.statistics.killed(slot10, managers.statistics)

			slot13 = self._unit
			slot11 = self._unit.base(data)._tweak_table

			if CopDamage.is_civilian(slot10) then
			end
		end
	end

	slot9 = attacker

	if alive(slot8) then
		slot9 = attacker

		if attacker.base(slot8) then
			slot9 = attacker

			if attacker.base(slot8).add_damage_result then
				slot9 = attacker
				slot12 = damage_percent

				attacker.base(slot8).add_damage_result(slot8, attacker.base(slot8), self._unit, result.type == "death")
			end
		end
	end

	local variant = (result.variant == "heavy" and 1) or 0
	slot13 = variant

	self._send_tase_attack_result(slot9, self, attack_data, damage_percent)

	slot11 = attack_data

	self._on_damage_received(slot9, self)

	return result
end
CopDamage._dismember_condition = function (self, attack_data, force_dismemberment)
	if not self._char_tweak.dismemberment_enabled then
		return 
	end

	if force_dismemberment or Global.force_dismemberment then
		return true
	end

	if not attack_data.weapon_unit then
		return false
	end

	slot5 = attack_data.weapon_unit
	slot5 = attack_data.weapon_unit.base(slot4)
	local dismember_chance = attack_data.weapon_unit.base(slot4).weapon_tweak_data(slot4).dismember_chance

	if not dismember_chance then
		return false
	end

	slot6 = 1
	local roll = math.rand(slot5)

	return roll <= dismember_chance
end
CopDamage.damage_melee = function (self, attack_data)

	-- Decompilation error in this vicinity:
	self._last_damage_direction = attack_data.col_ray.ray

	if self._dead or self._invulnerable then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return "friendly_fire"
	end

	local result = nil

	if self._head_body_name and attack_data.col_ray.body then
		slot5 = attack_data.col_ray.body
		local head = attack_data.col_ray.body.name(slot4) == self._ids_head_body_name
	end

	local death_event_params = {
		damage_type = WeaponTweakData.DAMAGE_TYPE_MELEE
	}
	slot8 = self._unit
	death_event_params.enemy_type = tweak_data.character[self._unit.base(slot7)._tweak_table].type
	local damage = attack_data.damage

	if attack_data.attacker_unit then
		slot9 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(slot8) then
			slot9 = damage
			local critical_hit, crit_damage = self.roll_critical_hit(slot7, self)

			if critical_hit then
				death_event_params.critical_hit = true
				slot10 = managers.hud

				managers.hud.on_crit_confirmed(slot9)

				damage = crit_damage
			else
				slot10 = managers.hud

				managers.hud.on_hit_confirmed(slot9)
			end
		end
	end

	damage = damage * (self._marked_dmg_mul or 1)
	slot8 = self._unit
	slot8 = self._unit.movement(slot7)

	if self._unit.movement(slot7).cool(slot7) then
		damage = self._HEALTH_INIT
	end

	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	end

	local damage_effect = attack_data.damage_effect
	local damage_effect_percent = nil
	slot11 = damage
	damage = self._apply_damage_modifier(slot9, self)
	slot12 = self._HEALTH_INIT
	damage = math.clamp(slot9, damage, self._HEALTH_INIT_PRECENT)
	local damage_percent = math.ceil(slot9)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	slot13 = damage_percent
	damage, damage_percent = self._apply_min_health_limit(damage / self._HEALTH_INIT_PRECENT, self, damage)

	if self._immortal then
		damage = 0
		damage_percent = 0
	end

	slot12 = BuffEffectManager.EFFECT_ENEMIES_DIE_ONLY_ON_HEADSHOT
	slot12 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_EXPLOSION

	if managers.buff_effect.is_effect_active(slot10, managers.buff_effect) then
		slot12 = BuffEffectManager.EFFECT_ENEMIES_VULNERABLE_ONLY_TO_MELEE

		if not managers.buff_effect.is_effect_active(slot10, managers.buff_effect) then
			damage = 0
			damage_percent = 0
		end
	end

	slot12 = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_AUTO_KILL

	if managers.buff_effect.is_effect_active(slot10, managers.buff_effect) and head then
		damage = self._health
		damage_percent = 100
	end

	if self._health <= damage then
		damage_effect_percent = 1
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		slot12 = attack_data

		self.die(attack_data.variant, self)

		slot13 = WeaponTweakData.DAMAGE_TYPE_MELEE

		self.chk_killshot(attack_data.variant, self, attack_data.attacker_unit)

		slot12 = BuffEffectManager.EFFECT_PLAYER_MELEE_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(attack_data.variant, managers.buff_effect) then
			slot12 = BuffEffectManager.EFFECT_PLAYER_MELEE_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot10, managers.buff_effect) or 0
			slot13 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot12) then
				slot12 = managers.player
				slot12 = managers.player.local_player(slot11)
				slot15 = managers.player
				slot15 = managers.player.local_player(slot14)
				slot15 = managers.player.local_player(slot14).character_damage(slot14)
				slot14 = true

				managers.player.local_player(slot11).character_damage(slot11).restore_health(slot11, managers.player.local_player(slot11).character_damage(slot11), health_amount_regen * managers.player.local_player(slot14).character_damage(slot14).get_max_health(slot14))
			end
		end

		slot12 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH

		if managers.buff_effect.is_effect_active(slot10, managers.buff_effect) then
			slot12 = BuffEffectManager.EFFECT_PLAYER_KILL_REGENERATES_HEALTH
			local health_amount_regen = managers.buff_effect.get_effect_value(slot10, managers.buff_effect) or 0
			slot13 = managers.player

			if attack_data.attacker_unit == managers.player.local_player(slot12) then
				slot12 = managers.player
				slot12 = managers.player.local_player(slot11)
				slot15 = managers.player
				slot15 = managers.player.local_player(slot14)
				slot15 = managers.player.local_player(slot14).character_damage(slot14)
				slot14 = true

				managers.player.local_player(slot11).character_damage(slot11).restore_health(slot11, managers.player.local_player(slot11).character_damage(slot11), health_amount_regen * managers.player.local_player(slot14).character_damage(slot14).get_max_health(slot14))
			end
		end
	else
		attack_data.damage = damage
		slot13 = self._HEALTH_INIT
		damage_effect = math.clamp(slot10, damage_effect, self._HEALTH_INIT_PRECENT)
		slot11 = damage_effect / self._HEALTH_INIT_PRECENT
		damage_effect_percent = math.ceil(slot10)
		slot13 = self._HEALTH_GRANULARITY
		damage_effect_percent = math.clamp(slot10, damage_effect_percent, 1)

		if attack_data.shield_knock and self._char_tweak.damage.shield_knocked then
			slot9 = "shield_knock"
		elseif attack_data.variant == "counter_tased" then
			slot9 = "counter_tased"
		elseif attack_data.variant == "taser_tased" then
			slot9 = "taser_tased"
		else
			slot13 = WeaponTweakData.DAMAGE_TYPE_MELEE
			local result_type = self.get_damage_type(slot10, self, damage_effect_percent) or "fire_hurt"
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}
		slot13 = damage

		self._apply_damage_to_health(attack_data.variant, self)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local dismember_victim = false
	local snatch_pager = false

	if result.type == "death" then
		slot13 = attack_data.weapon_unit

		if attack_data.weapon_unit.base(slot12).is_melee_weapon then
			slot13 = attack_data.weapon_unit
			slot13 = attack_data.weapon_unit.base(slot12)
			local melee_weapon_used = attack_data.weapon_unit.base(slot12).is_melee_weapon(slot12)
		end

		if melee_weapon_used then
			slot16 = false

			if self._dismember_condition(slot13, self, attack_data) then
				death_event_params.dismemberment_occured = true
				slot15 = attack_data

				self._dismember_body_part(slot13, self)

				dismember_victim = true
			end
		end

		local data = {}
		slot15 = self._unit
		data.unit_key = self._unit.key(slot14)
		slot15 = self._unit
		data.name = self._unit.base(slot14)._tweak_table
		slot15 = self._unit
		data.stats_name = self._unit.base(slot14)._stats_name
		data.head_shot = head
		data.weapon_unit = attack_data.weapon_unit
		data.name_id = attack_data.name_id
		data.variant = attack_data.variant
		data.dismembered = dismember_victim
		slot16 = data

		managers.statistics.killed_by_anyone(slot14, managers.statistics)

		slot16 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(managers.statistics) then
			slot19 = self._unit

			self._comment_death(slot14, self, attack_data.attacker_unit)

			slot18 = self._unit
			slot16 = self._unit.base(self._unit.base(slot18)._tweak_table)._tweak_table

			self._show_death_hint(slot14, self)

			slot16 = data

			managers.statistics.killed(slot14, managers.statistics)

			slot17 = death_event_params

			managers.system_event_listener.call_listeners(slot14, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)

			slot18 = 0
			slot16 = 1

			if math.rand(managers.player) < managers.player.upgrade_value(slot14, managers.player, "player", "melee_kill_snatch_pager_chance") then
				snatch_pager = true
				slot15 = self._unit
				self._unit.unit_data(slot14).has_alarm_pager = false
			end
		end
	end

	slot16 = self._unit
	slot16 = self._unit.movement(slot15)
	slot15 = 300
	local hit_offset_height = math.clamp(slot12, attack_data.col_ray.position.z - self._unit.movement(slot15).m_pos(slot15).z, 0)
	local variant = nil

	if result.type == "shield_knock" then
		variant = 1
	elseif result.type == "counter_tased" then
		variant = 2
	elseif result.type == "expl_hurt" then
		variant = 4
	elseif snatch_pager then
		variant = 3
	elseif result.type == "taser_tased" then
		variant = 5
	elseif dismember_victim then
		variant = 6
	else
		variant = 0
	end

	slot18 = attack_data.col_ray.body
	local body_index = self._unit.get_body_index(slot14, attack_data.col_ray.body.name(slot17))
	slot22 = body_index

	self._send_melee_attack_result(self._unit, self, attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant)

	slot17 = attack_data

	self._on_damage_received(self._unit, self)

	return result
end
CopDamage.damage_mission = function (self, attack_data)
	if self._dead or ((self._invulnerable or self._immortal) and not attack_data.forced) then
		return 
	end

	local result = nil
	local damage_percent = self._HEALTH_GRANULARITY
	attack_data.damage = self._health
	result = {
		type = "death",
		variant = attack_data.variant
	}
	slot7 = attack_data

	self.die(attack_data.variant, self)

	attack_data.result = result
	slot6 = self._unit
	slot6 = self._unit.rotation(attack_data.variant)
	attack_data.attack_dir = self._unit.rotation(attack_data.variant).y(attack_data.variant)
	attack_data.pos = self._unit.position(attack_data.variant)
	slot7 = managers.player

	if attack_data.attacker_unit == managers.player.local_player(self._unit) then
		slot8 = self._unit
		slot6 = self._unit.base(slot7)._tweak_table

		if CopDamage.is_civilian(slot5) then
		end
	end

	slot13 = "explosion"
	slot11 = attack_data.col_ray and attack_data.col_ray.ray

	self._send_explosion_attack_result(slot5, self, attack_data, self._unit, damage_percent, self._get_attack_variant_index(slot11, self))

	slot7 = attack_data

	self._on_damage_received(slot5, self)

	return result
end
CopDamage.get_ranged_attack_autotarget_data_fast = function (self)
	return {
		object = self._autotarget_data.fast
	}
end
CopDamage.get_ranged_attack_autotarget_data = function (self, shoot_from_pos, aim_vec)
	local autotarget_data = nil
	autotarget_data = {
		body = self._unit.body(slot6, self._unit)
	}
	slot6 = shoot_from_pos
	slot9 = self._unit
	local dis = mvector3.distance(self._unit.body(slot6, self._unit), self._unit.position("b_spine1"))

	if 3500 < dis then
		slot9 = "b_spine1"
		autotarget_data = {
			body = self._unit.body(slot7, self._unit)
		}
	else
		self._aim_bodies = {}
		slot7 = self._aim_bodies
		slot11 = "b_right_thigh"

		table.insert(slot6, self._unit.body(slot9, self._unit))

		slot7 = self._aim_bodies
		slot11 = "b_left_thigh"

		table.insert(slot6, self._unit.body(slot9, self._unit))

		slot7 = self._aim_bodies
		slot11 = "b_head"

		table.insert(slot6, self._unit.body(slot9, self._unit))

		slot7 = self._aim_bodies
		slot11 = "b_left_lower_arm"

		table.insert(slot6, self._unit.body(slot9, self._unit))

		slot7 = self._aim_bodies
		slot11 = "b_right_lower_arm"

		table.insert(slot6, self._unit.body(slot9, self._unit))

		local uncovered_body, best_angle = nil
		slot9 = self._aim_bodies

		for i, body in ipairs(self._unit.body) do
			slot14 = body
			local body_pos = body.center_of_mass(slot13)
			local body_vec = body_pos - shoot_from_pos
			slot17 = aim_vec
			local body_angle = body_vec.angle(slot15, body_vec)

			if not best_angle or body_angle < best_angle then
				slot25 = "slot_mask"
				slot29 = "melee_equipment"
				local aim_ray = World.raycast(slot16, World, "ray", shoot_from_pos, body_pos, "sphere_cast_radius", 30, "bundle", 4, managers.slot.get_mask(slot27, managers.slot))

				if not aim_ray then
					uncovered_body = body
					best_angle = body_angle
				end
			end
		end

		if uncovered_body then
			autotarget_data = {
				body = uncovered_body
			}
		else
			slot11 = "b_spine1"
			autotarget_data = {
				body = self._unit.body(slot9, self._unit)
			}
		end
	end

	return autotarget_data
end
CopDamage.get_impact_segment = function (self, position)
	local closest_dist_sq, closest_bone = nil
	slot6 = self._impact_bones

	for _, bone_name in pairs(slot5) do
		slot12 = bone_name
		local bone_obj = self._unit.get_object(slot10, self._unit)
		slot12 = position
		slot15 = bone_obj
		local bone_dist_sq = mvector3.distance_sq(self._unit, bone_obj.position(slot14))

		if not closest_bone or bone_dist_sq < closest_dist_sq then
			closest_bone = bone_obj
			closest_dist_sq = bone_dist_sq
		end
	end

	local parent_bone, child_bone, closest_child = nil
	closest_dist_sq = nil
	slot11 = closest_bone

	for _, bone_obj in ipairs(closest_bone.children(slot10)) do
		slot15 = bone_obj
		slot15 = bone_obj.name(slot14)

		if self._impact_bones[bone_obj.name(slot14).key(slot14)] then
			slot14 = position
			slot17 = bone_obj
			local bone_dist_sq = mvector3.distance_sq(slot13, bone_obj.position(slot16))

			if not closest_dist_sq or bone_dist_sq < closest_dist_sq then
				closest_child = bone_obj
				closest_dist_sq = bone_dist_sq
			end
		end
	end

	slot9 = closest_bone
	local bone_obj = closest_bone.parent(slot8)

	if bone_obj then
		slot11 = bone_obj
		slot11 = bone_obj.name(slot10)

		if self._impact_bones[bone_obj.name(slot10).key(slot10)] then
			slot10 = position
			slot13 = bone_obj
			local bone_dist_sq = mvector3.distance_sq(slot9, bone_obj.position(slot12))

			if not closest_dist_sq or bone_dist_sq < closest_dist_sq then
				parent_bone = bone_obj
				child_bone = closest_bone
			end
		end
	end

	if not parent_bone then
		parent_bone = closest_bone
		child_bone = closest_child
	end

	return parent_bone, child_bone
end
CopDamage._spawn_head_gadget = function (self, params)
	if not self._head_gear then
		return 
	end

	if self._head_gear_object then
		if self._nr_head_gear_objects then
			for i = 1, self._nr_head_gear_objects, 1 do
				slot9 = i
				local head_gear_obj_name = self._head_gear_object .. tostring(slot8)
				slot9 = self._unit
				slot12 = head_gear_obj_name
				slot10 = false

				self._unit.get_object(slot8, Idstring(slot11)).set_visibility(slot8, self._unit.get_object(slot8, Idstring(slot11)))
			end
		else
			slot4 = self._unit
			slot7 = self._head_gear_object
			slot5 = false

			self._unit.get_object(slot3, Idstring(slot6)).set_visibility(slot3, self._unit.get_object(slot3, Idstring(slot6)))
		end

		if self._head_gear_decal_mesh then
			local mesh_name_idstr = Idstring(slot3)
			slot6 = mesh_name_idstr
			slot6 = mesh_name_idstr
			slot9 = "flesh"

			self._unit.decal_surface(self._head_gear_decal_mesh, self._unit).set_mesh_material(self._head_gear_decal_mesh, self._unit.decal_surface(self._head_gear_decal_mesh, self._unit), Idstring(slot8))
		end
	end

	slot7 = self._head_gear
	slot7 = params.rotation
	local unit = World.spawn_unit(slot3, World, Idstring(slot6), params.position)

	if not params.skip_push then
		local dir = math.UP - params.dir / 2
		slot7 = 25
		dir = dir.spread(slot5, dir)
		slot7 = 0
		local body = unit.body(slot5, unit)
		slot12 = 650
		slot14 = math.rand(1)
		slot17 = 1
		slot10 = unit.position(300) + Vector3(unit, math.rand(slot14), math.rand(1))

		body.push_at(unit, body, body.mass(slot9), dir * math.lerp(body, 300, math.random()))
	end

	self._head_gear = false

	return 
end
CopDamage.dead = function (self)
	return self._dead
end
CopDamage._remove_debug_gui = function (self)
	slot3 = self._gui

	if alive(slot2) then
		slot3 = self._ws

		if alive(slot2) then
			slot4 = self._ws

			self._gui.destroy_workspace(slot2, self._gui)

			self._ws = nil
			self._gui = nil
		end
	end

	return 
end
CopDamage.die = function (self, attack_data)
	if self._immortal then
		slot4 = "Immortal character died!"

		debug_pause(slot3)
	end

	local variant = attack_data.variant or WeaponTweakData.DAMAGE_TYPE_BULLET
	slot5 = self

	self._remove_debug_gui(slot4)

	slot5 = self._unit
	slot7 = 17

	self._unit.base(slot4).set_slot(slot4, self._unit.base(slot4), self._unit)

	slot7 = managers.interaction

	if alive(managers.interaction.active_unit(self._unit)) then
		slot5 = managers.interaction
		slot5 = managers.interaction.active_unit(slot4)
		slot5 = managers.interaction.active_unit(slot4).interaction(slot4)

		managers.interaction.active_unit(slot4).interaction(slot4).selected(slot4)
	end

	if self._pickup then
		slot5 = self

		self.drop_pickup(slot4)
	elseif attack_data.drop_loot == nil or attack_data.drop_loot == true then

		-- Decompilation error in this vicinity:
		slot5 = self._unit
		local tracker = self._unit.movement(slot4).nav_tracker(slot4)
		slot6 = tracker
		local rotation = self._unit.rotation(slot6)
		slot11 = self._unit
		slot11 = self._unit.base(slot10)
		slot11 = rotation
		local spawned_pickup = managers.drop_loot.drop_item(self._unit, managers.drop_loot, self._unit.base(slot10).char_tweak(slot10).loot_table, position)

		if spawned_pickup then
			slot9 = spawned_pickup
			slot10 = "show_beam"

			spawned_pickup.damage(slot8).run_sequence_simple(slot8, spawned_pickup.damage(slot8))

			slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_DESPAWN_HEALTH

			if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
				slot9 = spawned_pickup
			else
				slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_DESPAWN_AMMO

				if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
					slot9 = spawned_pickup
				else
					slot15 = nil

					managers.queued_tasks.queue(slot8, managers.queued_tasks, "spawned_pickup", managers.drop_loot.despawn_item, managers.drop_loot, spawned_pickup, DropLootManager.DROPED_LOOT_DESPAWN_TIME)
				end
			end
		end
	end

	slot5 = self._unit
	slot5 = self._unit.inventory(slot4)

	self._unit.inventory(slot4).drop_shield(slot4)

	slot5 = self._unit

	if self._unit.unit_data(slot4).mission_element then
		slot5 = self._unit
		slot7 = self._unit

		self._unit.unit_data(slot4).mission_element.event(slot4, self._unit.unit_data(slot4).mission_element, "death")

		slot5 = self._unit

		if not self._unit.unit_data(slot4).alerted_event_called then
			slot5 = self._unit
			self._unit.unit_data(slot4).alerted_event_called = true
			slot5 = self._unit
			slot7 = self._unit

			self._unit.unit_data(true).mission_element.event(true, self._unit.unit_data(true).mission_element, "alerted")
		end
	end

	slot5 = self._unit

	if self._unit.movement(slot4) then
		slot5 = self._unit
		slot5 = self._unit.movement(slot4)

		self._unit.movement(slot4).remove_giveaway(slot4)
	end

	self._health = 0
	self._health_ratio = 0
	self._dead = true
	slot6 = false

	self.set_mover_collision_state(slot4, self)

	if self._death_sequence then
		slot5 = self._unit

		if self._unit.damage(slot4) then
			slot5 = self._unit
			slot6 = self._death_sequence
		else
			slot8 = self._unit

			debug_pause_unit(slot4, self._unit, "[CopDamage:die] does not have death sequence", self._death_sequence)
		end
	end

	slot5 = self._unit
	slot5 = self._unit.base(slot4)

	if self._unit.base(slot4).char_tweak(slot4).die_sound_event then
		slot5 = self._unit
		slot8 = self._unit
		slot8 = self._unit.base(slot7)

		self._unit.sound(slot4).play(slot4, self._unit.sound(slot4), self._unit.base(slot7).char_tweak(slot7).die_sound_event, nil)
	end

	local weapon_data = tweak_data.blackmarket.melee_weapons[attack_data.name_id]

	if weapon_data and weapon_data.sounds and weapon_data.sounds.killing_blow then
		slot6 = self._unit

		self._unit.sound(slot5).play(slot5, self._unit.sound(slot5), weapon_data.sounds.killing_blow, nil)
	end

	slot6 = self._unit
	slot6 = self._unit.damage(slot5)
	slot11 = "clbk_impact"

	self._unit.damage(slot5).add_body_collision_callback(slot5, callback(slot8, self, self))

	return 
end
CopDamage.clbk_impact = function (self, state)
	if self._body_drop_detected then
		return 
	end

	if state then
		slot4 = "large"

		if state == Idstring(slot3) then
			self._body_drop_detected = true
			slot5 = self._unit
			local character_tweak = tweak_data.character[self._unit.base(slot4)._tweak_table]

			if character_tweak and character_tweak.dead_body_drop_sound then
				slot5 = self._unit

				self._unit.sound(slot4).play(slot4, self._unit.sound(slot4), character_tweak.dead_body_drop_sound, nil)
			end
		end
	end

	return 
end
CopDamage.set_mover_collision_state = function (self, state)
	local change_state = nil

	if state then
		if self._mover_collision_state then
			if self._mover_collision_state == -1 then
				self._mover_collision_state = nil
				change_state = true
			else
				self._mover_collision_state = self._mover_collision_state + 1
			end
		end
	elseif self._mover_collision_state then
		self._mover_collision_state = self._mover_collision_state - 1
	else
		self._mover_collision_state = -1
		change_state = true
	end

	if change_state then
		slot6 = "mover_blocker"
		local body = self._unit.body(slot4, self._unit)

		if body then
			slot7 = state

			body.set_enabled(slot5, body)
		end
	end

	return 
end
CopDamage.anim_clbk_mover_collision_state = function (self, unit, state)
	if state == "true" then
		state = true
	else
		state = false
	end

	slot6 = state

	self.set_mover_collision_state(slot4, self)

	return 
end
CopDamage.drop_pickup = function (self)
	if self._pickup then

		-- Decompilation error in this vicinity:
		slot3 = self._unit
		local tracker = self._unit.movement(slot2).nav_tracker(slot2)
		slot4 = tracker
		local rotation = self._unit.rotation(slot4)
		slot7 = {
			name = self._pickup,
			position = position,
			rotation = rotation
		}

		managers.game_play_central.spawn_pickup(self._unit, managers.game_play_central)
	end

	return 
end
CopDamage.sync_damage_knockdown = function (self, attacker_unit, damage_percent, i_body, hit_offset_height, death)
	if self._dead then
		return 
	end

	slot9 = i_body
	local body = self._unit.body(slot7, self._unit)
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	slot13 = self._unit
	slot13 = self._unit.movement(slot12)
	local hit_pos = mvector3.copy(self._unit.movement(slot12).m_pos(slot12))
	slot13 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.movement(slot12).m_pos, hit_pos)

	attack_data.pos = hit_pos
	local attack_dir, distance = nil

	if attacker_unit then
		slot14 = attacker_unit
		slot14 = attacker_unit.movement(slot13)
		attack_dir = hit_pos - attacker_unit.movement(slot13).m_head_pos(slot13)
		slot14 = attack_dir
		distance = mvector3.normalize(slot13)
	else
		slot14 = self._unit
		slot14 = self._unit.rotation(slot13)
		attack_dir = self._unit.rotation(slot13).y(slot13)
	end

	attack_data.attack_dir = attack_dir
	local result = {
		variant = "expl_hurt",
		type = "expl_hurt"
	}
	attack_data.variant = "expl_hurt"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	slot16 = attack_data

	self._on_damage_received(slot14, self)

	return 
end
CopDamage.sync_damage_bullet = function (self, attacker_unit, damage_percent, i_body, hit_offset_height, death)
	if self._dead then
		return 
	end

	slot9 = i_body
	local body = self._unit.body(slot7, self._unit)

	if self._head_body_name and body then
		slot9 = body
		local head = body.name(slot8) == self._ids_head_body_name
	end

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	slot14 = self._unit
	slot14 = self._unit.movement(slot13)
	local hit_pos = mvector3.copy(self._unit.movement(slot13).m_pos(slot13))
	slot14 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.movement(slot13).m_pos, hit_pos)

	attack_data.pos = hit_pos
	local attack_dir, distance = nil

	if attacker_unit then
		slot15 = attacker_unit
		slot15 = attacker_unit.movement(slot14)
		attack_dir = hit_pos - attacker_unit.movement(slot14).m_head_pos(slot14)
		slot15 = attack_dir
		distance = mvector3.normalize(slot14)
	else
		slot15 = self._unit
		slot15 = self._unit.rotation(slot14)
		attack_dir = self._unit.rotation(slot14).y(slot14)
	end

	attack_data.attack_dir = attack_dir
	local shotgun_push, result = nil

	if death then
		if head then
			slot17 = 10

			if math.random(slot16) < damage then
				slot18 = {
					position = body.position(slot20),
					rotation = body.rotation(slot20),
					dir = attack_dir
				}
				slot21 = body
				slot21 = body

				self._spawn_head_gadget(slot16, self)
			end
		end

		result = {
			type = "death",
			variant = WeaponTweakData.DAMAGE_TYPE_BULLET
		}
		slot18 = attack_data

		self.die(WeaponTweakData.DAMAGE_TYPE_BULLET, self)

		slot19 = WeaponTweakData.DAMAGE_TYPE_BULLET

		self.chk_killshot(WeaponTweakData.DAMAGE_TYPE_BULLET, self, attacker_unit)

		local data = {}
		slot18 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot18 = self._unit
		data.stats_name = self._unit.base(self)._stats_name
		data.head_shot = head

		if attacker_unit then
			slot18 = attacker_unit

			if attacker_unit.inventory(slot17) then
				slot18 = attacker_unit
				slot18 = attacker_unit.inventory(slot17)
				slot16 = attacker_unit.inventory(slot17).equipped_unit(slot17)
			end
		end

		data.weapon_unit = slot16
		data.variant = attack_data.variant

		if data.weapon_unit then
			slot19 = data

			managers.statistics.killed_by_anyone(slot17, managers.statistics)

			slot18 = data.weapon_unit
			slot18 = data.weapon_unit.base(slot17)

			if data.weapon_unit.base(slot17).weapon_tweak_data(slot17).is_shotgun and distance and distance < 500 then
				shotgun_push = true
			end
		end
	else
		slot19 = WeaponTweakData.DAMAGE_TYPE_BULLET
		local result_type = self.get_damage_type(slot16, self, damage_percent)
		result = {
			type = result_type,
			variant = WeaponTweakData.DAMAGE_TYPE_BULLET
		}
		slot19 = damage

		self._apply_damage_to_health(WeaponTweakData.DAMAGE_TYPE_BULLET, self)
	end

	attack_data.variant = WeaponTweakData.DAMAGE_TYPE_BULLET
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage

	if not self._no_blood then
		slot19 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot16, managers.game_play_central, hit_pos)
	end

	slot19 = hit_offset_height

	self._send_sync_bullet_attack_result(slot16, self, attack_data)

	slot18 = attack_data

	self._on_damage_received(slot16, self)

	if shotgun_push then
		slot21 = distance

		managers.game_play_central.do_shotgun_push(slot16, managers.game_play_central, self._unit, hit_pos, attack_dir)
	end

	return 
end
CopDamage.chk_killshot = function (self, attacker_unit, variant)
	if attacker_unit then
		slot5 = managers.player

		if attacker_unit == managers.player.player_unit(slot4) then
			slot7 = variant

			managers.player.on_killshot(slot4, managers.player, self._unit)
		end
	end

	return 
end
CopDamage.sync_damage_explosion = function (self, attacker_unit, damage_percent, i_attack_variant, death, direction)
	if self._dead then
		return 
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
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
		slot13 = attack_data

		self.die(slot11, self)

		local data = {
			variant = "explosion",
			head_shot = false
		}
		slot13 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot13 = self._unit
		data.stats_name = self._unit.base(self)._stats_name

		if attacker_unit then
			slot13 = attacker_unit

			if attacker_unit.inventory(slot12) then
				slot13 = attacker_unit
				slot13 = attacker_unit.inventory(slot12)
				slot11 = attacker_unit.inventory(slot12).equipped_unit(slot12)
			end
		end

		data.weapon_unit = slot11
		slot14 = data

		managers.statistics.killed_by_anyone(slot12, managers.statistics)
	else
		if variant == "stun" then
			slot10 = "hurt_sick"
		else
			slot14 = "explosion"
			local result_type = self.get_damage_type(slot11, self, damage_percent)
		end

		result = {
			type = result_type,
			variant = variant
		}
		slot14 = damage

		self._apply_damage_to_health(slot12, self)
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

	if self._head_body_name then
		slot14 = self._head_body_name
		local body = self._unit.body(slot12, self._unit)
		slot15 = {
			skip_push = true,
			position = body.position(slot17),
			rotation = body.rotation(slot17),
			dir = Vector3()
		}
		slot18 = body
		slot18 = body

		self._spawn_head_gadget(self._unit, self)
	end

	if attack_data.attacker_unit then
		slot14 = managers.player

		if attack_data.attacker_unit == managers.player.player_unit(slot13) then
			slot13 = managers.hud

			managers.hud.on_hit_confirmed(slot12)
		end
	end

	if result.type == "death" then
		local data = {
			head_shot = false,
			variant = "explosion"
		}
		slot14 = self._unit
		data.unit_key = self._unit.key(slot13)
		slot14 = self._unit
		data.name = self._unit.base(slot13)._tweak_table
		slot14 = self._unit
		data.stats_name = self._unit.base(slot13)._stats_name

		if attacker_unit then
			slot14 = attacker_unit

			if attacker_unit.inventory(slot13) then
				slot14 = attacker_unit
				slot14 = attacker_unit.inventory(slot13)
				slot12 = attacker_unit.inventory(slot13).equipped_unit(slot13)
			end
		end

		data.weapon_unit = slot12
		local attacker_unit = attack_data.attacker_unit

		if attacker_unit then
			slot15 = attacker_unit

			if attacker_unit.base(slot14) then
				slot15 = attacker_unit

				if attacker_unit.base(slot14).thrower_unit then
					slot15 = attacker_unit
					slot15 = attacker_unit.base(slot14)
					attacker_unit = attacker_unit.base(slot14).thrower_unit(slot14)
					data.weapon_unit = attack_data.attacker_unit
				end
			end
		end

		slot17 = "explosion"

		self.chk_killshot(slot14, self, attacker_unit)

		slot15 = managers.player

		if attacker_unit == managers.player.player_unit(slot14) then
			slot15 = attacker_unit

			if alive(slot14) then
				slot19 = self._unit
				slot17 = self._unit.base(slot18)._tweak_table

				self._comment_death(slot14, self, attacker_unit)
			end

			slot18 = self._unit
			slot16 = self._unit.base(slot17)._tweak_table

			self._show_death_hint(slot14, self)
			managers.statistics.killed(slot14, managers.statistics)

			local death_event_params = {
				damage_type = WeaponTweakData.DAMAGE_TYPE_EXPLOSION
			}
			slot17 = self._unit
			death_event_params.enemy_type = tweak_data.character[self._unit.base(data)._tweak_table].type
			slot18 = true

			if self._dismember_condition(self._unit.base(data)._tweak_table, self, attack_data) then
				death_event_params.dismemberment_occured = true
			end

			slot18 = death_event_params

			managers.system_event_listener.call_listeners(slot15, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)

			slot18 = self._unit
			slot16 = self._unit.base(CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY)._tweak_table

			if CopDamage.is_civilian(slot15) then
			end
		end
	end

	slot13 = attacker_unit

	if alive(slot12) then
		slot13 = attacker_unit

		if attacker_unit.base(slot12) then
			slot13 = attacker_unit

			if attacker_unit.base(slot12).add_damage_result then
				slot13 = attacker_unit
				slot16 = damage_percent

				attacker_unit.base(slot12).add_damage_result(slot12, attacker_unit.base(slot12), self._unit, result.type == "death")
			end
		end
	end

	if not self._no_blood then
		slot15 = self._unit
		slot15 = self._unit.movement(slot14)
		local hit_pos = mvector3.copy(self._unit.movement(slot14).m_pos(slot14))
		slot15 = hit_pos.z + 100

		mvector3.set_z(self._unit.movement(slot14).m_pos, hit_pos)

		slot16 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(self._unit.movement(slot14).m_pos, managers.game_play_central, hit_pos)
	end

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
CopDamage.sync_damage_fire = function (self, attacker_unit, damage_percent, start_dot_dance_antimation, death, direction, weapon_type, weapon_id)
	if self._dead then
		return 
	end

	local variant = "fire"
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local is_fire_dot_damage = false
	local attack_data = {
		variant = variant
	}
	local result = nil

	if weapon_type then
		local fire_dot = nil

		if weapon_type == CopDamage.WEAPON_TYPE_GRANADE then
			fire_dot = tweak_data.grenades[weapon_id].fire_dot_data
		elseif weapon_type == CopDamage.WEAPON_TYPE_BULLET then
			if tweak_data.weapon.factory.parts[weapon_id].custom_stats then
				fire_dot = tweak_data.weapon.factory.parts[weapon_id].custom_stats.fire_dot_data
			end
		elseif weapon_type == CopDamage.WEAPON_TYPE_FLAMER and tweak_data.weapon[weapon_id].fire_dot_data then
			fire_dot = tweak_data.weapon[weapon_id].fire_dot_data
		end

		attack_data.fire_dot_data = fire_dot

		if attack_data.fire_dot_data then
			attack_data.fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
		end
	end

	if death then
		result = {
			type = "death",
			variant = variant
		}
		slot16 = attack_data

		self.die(slot14, self)

		slot17 = "fire"

		self.chk_killshot(slot14, self, attacker_unit)

		local data = {
			variant = "fire",
			head_shot = false
		}
		slot16 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot16 = self._unit
		data.stats_name = self._unit.base(self)._stats_name

		if attacker_unit then
			slot16 = attacker_unit

			if attacker_unit.inventory(slot15) then
				slot16 = attacker_unit
				slot16 = attacker_unit.inventory(slot15)
				slot14 = attacker_unit.inventory(slot15).equipped_unit(slot15)
			end
		end

		data.weapon_unit = slot14
		slot17 = data

		managers.statistics.killed_by_anyone(slot15, managers.statistics)
	else
		if variant == "stun" then
			slot13 = "hurt_sick"
		else
			slot17 = "fire"
			local result_type = self.get_damage_type(slot14, self, damage_percent)
		end

		result = {
			type = result_type,
			variant = variant
		}
		slot17 = damage

		self._apply_damage_to_health(slot15, self)
	end

	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	attack_data.ignite_character = true
	attack_data.is_fire_dot_damage = is_fire_dot_damage
	local attack_dir = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		slot17 = attacker_unit
		attack_dir = self._unit.position(slot15) - attacker_unit.position(self._unit)
		slot16 = attack_dir

		mvector3.normalize(attacker_unit.position(self._unit))
	else
		slot16 = self._unit
		slot16 = self._unit.rotation(slot15)
		attack_dir = self._unit.rotation(slot15).y(slot15)
	end

	attack_data.attack_dir = attack_dir

	if self._head_body_name then
		slot17 = self._head_body_name
		local body = self._unit.body(slot15, self._unit)
		slot18 = {
			skip_push = true,
			position = body.position(slot20),
			rotation = body.rotation(slot20),
			dir = Vector3()
		}
		slot21 = body
		slot21 = body

		self._spawn_head_gadget(self._unit, self)
	end

	if result.type == "death" then
		local data = {
			head_shot = false,
			variant = "fire"
		}
		slot17 = self._unit
		data.unit_key = self._unit.key(slot16)
		slot17 = self._unit
		data.name = self._unit.base(slot16)._tweak_table
		slot17 = self._unit
		data.stats_name = self._unit.base(slot16)._stats_name

		if attacker_unit then
			slot17 = attacker_unit

			if attacker_unit.inventory(slot16) then
				slot17 = attacker_unit
				slot17 = attacker_unit.inventory(slot16)
				slot15 = attacker_unit.inventory(slot16).equipped_unit(slot16)
			end
		end

		data.weapon_unit = slot15
		local attacker_unit = attack_data.attacker_unit

		if attacker_unit then
			slot18 = attacker_unit

			if attacker_unit.base(slot17) then
				slot18 = attacker_unit

				if attacker_unit.base(slot17).thrower_unit then
					slot18 = attacker_unit
					slot18 = attacker_unit.base(slot17)
					attacker_unit = attacker_unit.base(slot17).thrower_unit(slot17)
					data.weapon_unit = attack_data.attacker_unit
				end
			end
		end

		slot18 = managers.player

		if attacker_unit == managers.player.player_unit(slot17) then
			slot18 = attacker_unit

			if alive(slot17) then
				slot22 = self._unit
				slot20 = self._unit.base(slot21)._tweak_table

				self._comment_death(slot17, self, attacker_unit)
			end

			slot21 = self._unit
			slot19 = self._unit.base(slot20)._tweak_table

			self._show_death_hint(slot17, self)
			managers.statistics.killed(slot17, managers.statistics)

			slot20 = self._unit
			slot18 = self._unit.base(data)._tweak_table

			if CopDamage.is_civilian(slot17) then
			end
		end
	end

	slot16 = attacker_unit

	if alive(slot15) then
		slot16 = attacker_unit

		if attacker_unit.base(slot15) then
			slot16 = attacker_unit

			if attacker_unit.base(slot15).add_damage_result then
				slot16 = attacker_unit
				slot19 = damage_percent

				attacker_unit.base(slot15).add_damage_result(slot15, attacker_unit.base(slot15), self._unit, result.type == "death")
			end
		end
	end

	slot16 = self._unit
	attack_data.pos = self._unit.position(slot15)
	slot17 = attack_data.pos.z + math.random() * 180

	mvector3.set_z(slot15, attack_data.pos)

	slot17 = attack_data

	self._send_sync_fire_attack_result(slot15, self)

	slot17 = attack_data

	self._on_damage_received(slot15, self)

	return 
end
CopDamage.sync_damage_dot = function (self, attacker_unit, damage_percent, death, variant, hurt_animation)
	if self._dead then
		return 
	end

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
		slot12 = attack_data

		self.die(slot10, self)

		slot13 = variant or "dot"

		self.chk_killshot(slot10, self, attacker_unit)

		local data = {
			head_shot = false
		}
		slot12 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot12 = self._unit
		data.stats_name = self._unit.base(self)._stats_name

		if attacker_unit then
			slot12 = attacker_unit

			if attacker_unit.inventory(slot11) then
				slot12 = attacker_unit
				slot12 = attacker_unit.inventory(slot11)
				slot10 = attacker_unit.inventory(slot11).equipped_unit(slot11)
			end
		end

		data.weapon_unit = slot10
		data.variant = attack_data.variant

		if data.weapon_unit then
			slot13 = data

			managers.statistics.killed_by_anyone(slot11, managers.statistics)
		end
	else

		-- Decompilation error in this vicinity:
		slot13 = variant
		local result_type = self.get_damage_type(slot10, self, damage_percent) or "dmg_rcv"
		result = {
			type = result_type,
			variant = variant
		}
		slot13 = damage

		self._apply_damage_to_health(slot11, self)
	end

	attack_data.variant = variant
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	slot12 = attack_data

	self._on_damage_received(slot10, self)

	return 
end
CopDamage._sync_dismember = function (self, attacker_unit)
	if not attacker_unit then
		return false
	end

	slot5 = attacker_unit
	local attacker_name = managers.criminals.character_name_by_unit(slot3, managers.criminals)
	slot5 = managers.network
	slot6 = attacker_unit
	local peer_id = managers.network.session(managers.criminals).peer_by_unit(managers.criminals, managers.network.session(managers.criminals)).id(managers.criminals)
	slot6 = managers.network
	slot7 = peer_id
	local peer = managers.network.session(managers.network.session(managers.criminals).peer_by_unit(managers.criminals, managers.network.session(managers.criminals))).peer(managers.network.session(managers.criminals).peer_by_unit(managers.criminals, managers.network.session(managers.criminals)), managers.network.session(managers.network.session(managers.criminals).peer_by_unit(managers.criminals, managers.network.session(managers.criminals))))
	slot7 = peer
	local attacker_weapon = peer.melee_id(managers.network.session(managers.network.session(managers.criminals).peer_by_unit(managers.criminals, managers.network.session(managers.criminals))))

	return true
end
CopDamage.sync_damage_melee = function (self, attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death)
	local attack_data = {}
	slot12 = i_body
	local body = self._unit.body(slot10, self._unit)
	attack_data.attacker_unit = attacker_unit
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local result = nil

	if death then
		slot15 = attacker_unit

		if self._sync_dismember(slot13, self) and variant == 6 then
			slot14 = body
			attack_data.body_name = body.name(slot13)
			slot15 = attack_data

			self._dismember_body_part(slot13, self)
		end

		result = {
			type = "death",
			variant = WeaponTweakData.DAMAGE_TYPE_MELEE
		}
		slot15 = attack_data

		self.die(WeaponTweakData.DAMAGE_TYPE_MELEE, self)

		slot16 = WeaponTweakData.DAMAGE_TYPE_MELEE

		self.chk_killshot(WeaponTweakData.DAMAGE_TYPE_MELEE, self, attacker_unit)

		local data = {
			head_shot = false
		}
		slot15 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot15 = self._unit
		data.stats_name = self._unit.base(self)._stats_name
		data.variant = WeaponTweakData.DAMAGE_TYPE_MELEE
		slot16 = data

		managers.statistics.killed_by_anyone(self, managers.statistics)
	else
		if variant == 1 then
			slot12 = "shield_knock"
		elseif variant == 2 then
			slot12 = "counter_tased"
		elseif variant == 5 then
			slot12 = "taser_tased"
		elseif variant == 4 then
			slot12 = "expl_hurt"
		else
			slot16 = WeaponTweakData.DAMAGE_TYPE_BULLET
			local result_type = self.get_damage_type(slot13, self, damage_effect_percent) or "fire_hurt"
		end

		result = {
			type = result_type,
			variant = WeaponTweakData.DAMAGE_TYPE_MELEE
		}
		slot16 = damage

		self._apply_damage_to_health(WeaponTweakData.DAMAGE_TYPE_MELEE, self)

		attack_data.variant = result_type
	end

	attack_data.variant = WeaponTweakData.DAMAGE_TYPE_MELEE
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir = nil

	if attacker_unit then
		slot16 = attacker_unit
		attack_dir = self._unit.position(slot14) - attacker_unit.position(self._unit)
		slot15 = attack_dir

		mvector3.normalize(attacker_unit.position(self._unit))
	else
		slot15 = self._unit
		slot15 = self._unit.rotation(slot14)
		attack_dir = -self._unit.rotation(slot14).y(slot14)
	end

	attack_data.attack_dir = attack_dir

	if variant == 3 then
		slot15 = self._unit
		self._unit.unit_data(slot14).has_alarm_pager = false
	end

	slot15 = self._unit
	attack_data.pos = self._unit.position(slot14)
	slot16 = attack_data.pos.z + math.random() * 180

	mvector3.set_z(slot14, attack_data.pos)

	if not self._no_blood then
		slot18 = self._unit
		slot21 = hit_offset_height
		slot17 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot14, managers.game_play_central, self._unit.movement(slot17).m_pos(slot17) + Vector3(self._unit.movement(slot17), 0, 0))
	end

	slot17 = hit_offset_height

	self._send_sync_melee_attack_result(slot14, self, attack_data)

	slot16 = attack_data

	self._on_damage_received(slot14, self)

	return 
end
CopDamage.sync_damage_tase = function (self, attacker_unit, damage_percent, variant, death)
	if self._dead then
		return 
	end

	if self._tase_effect then
		slot7 = World
		slot8 = self._tase_effect

		World.effect_manager(slot6).fade_kill(slot6, World.effect_manager(slot6))
	end

	slot7 = World
	slot8 = self._tase_effect_table
	self._tase_effect = World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	local result = nil

	if death then
		result = {
			type = "death",
			variant = WeaponTweakData.DAMAGE_TYPE_BULLET
		}
		slot11 = WeaponTweakData.DAMAGE_TYPE_BULLET

		self.die(WeaponTweakData.DAMAGE_TYPE_BULLET, self)

		slot12 = "tase"

		self.chk_killshot(WeaponTweakData.DAMAGE_TYPE_BULLET, self, attacker_unit)

		local data = {
			head_shot = false
		}
		slot11 = self._unit
		data.name = self._unit.base(self)._tweak_table
		slot11 = self._unit
		data.stats_name = self._unit.base(self)._stats_name
		data.variant = WeaponTweakData.DAMAGE_TYPE_MELEE
		slot12 = data

		managers.statistics.killed_by_anyone(self, managers.statistics)
	else
		result = {
			type = "taser_tased",
			variant = (variant == 1 and "heavy") or "light"
		}
		slot11 = damage

		self._apply_damage_to_health((variant == 1 and "heavy") or "light", self)
	end

	attack_data.variant = result.variant
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir = nil

	if attacker_unit then
		slot12 = attacker_unit
		attack_dir = self._unit.position(slot10) - attacker_unit.position(self._unit)
		slot11 = attack_dir

		mvector3.normalize(attacker_unit.position(self._unit))
	else
		slot11 = self._unit
		slot11 = self._unit.rotation(slot10)
		attack_dir = -self._unit.rotation(slot10).y(slot10)
	end

	attack_data.attack_dir = attack_dir
	slot11 = self._unit
	attack_data.pos = self._unit.position(slot10)
	slot12 = attack_data.pos.z + math.random() * 180

	mvector3.set_z(slot10, attack_data.pos)

	slot12 = attack_data

	self._send_sync_tase_attack_result(slot10, self)

	slot12 = attack_data

	self._on_damage_received(slot10, self)

	return 
end
CopDamage._send_bullet_attack_result = function (self, attack_data, attacker, damage_percent, body_index, hit_offset_height)
	slot8 = self._unit
	slot14 = (self._dead and true) or false

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_bullet", attacker, damage_percent, body_index, hit_offset_height)

	return 
end
CopDamage._send_knockdown_attack_result = function (self, attacker, damage_percent, body_index, hit_offset_height)
	slot7 = self._unit
	slot13 = (self._dead and true) or false

	self._unit.network(slot6).send(slot6, self._unit.network(slot6), "damage_knockdown", attacker, damage_percent, body_index, hit_offset_height)

	return 
end
CopDamage._send_explosion_attack_result = function (self, attack_data, attacker, damage_percent, i_attack_variant, direction)
	slot8 = self._unit
	slot14 = direction

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_explosion_fire", attacker, damage_percent, i_attack_variant, (self._dead and true) or false)

	return 
end
CopDamage._send_fire_attack_result = function (self, attack_data, attacker, damage_percent, is_fire_dot_damage, direction)
	local weapon_type, weapon_unit = nil

	if attack_data.attacker_unit then
		slot10 = attack_data.attacker_unit
	else
		slot10 = attack_data.weapon_unit

		if alive(slot9) then
			slot10 = attack_data.weapon_unit
		else
			slot10 = attack_data.weapon_unit

			if alive(slot9) then
				slot10 = attack_data.weapon_unit

				if attack_data.weapon_unit.base(slot9)._parts then
					slot12 = attack_data.weapon_unit
					slot10 = attack_data.weapon_unit.base(slot11)._parts

					for part_id, part in pairs(slot9) do
						if tweak_data.weapon.factory.parts[part_id].custom_stats and tweak_data.weapon.factory.parts[part_id].custom_stats.fire_dot_data then
							weapon_type = CopDamage.WEAPON_TYPE_BULLET
							weapon_unit = part_id
						end
					end
				end
			end
		end
	end

	local start_dot_dance_antimation = attack_data.fire_dot_data and attack_data.fire_dot_data.start_dot_dance_antimation
	slot11 = self._unit
	slot19 = weapon_unit

	self._unit.network(slot10).send(slot10, self._unit.network(slot10), "damage_fire", attacker, damage_percent, start_dot_dance_antimation, (self._dead and true) or false, direction, weapon_type)

	return 
end
CopDamage._send_dot_attack_result = function (self, attack_data, attacker, damage_percent, variant, direction)
	slot8 = self._unit
	slot14 = attack_data.hurt_animation

	self._unit.network(slot7).send(slot7, self._unit.network(slot7), "damage_dot", attacker, damage_percent, (self._dead and true) or false, variant)

	return 
end
CopDamage._send_tase_attack_result = function (self, attack_data, damage_percent, variant)
	slot6 = self._unit
	slot11 = (self._dead and true) or false

	self._unit.network(slot5).send(slot5, self._unit.network(slot5), "damage_tase", attack_data.attacker_unit, damage_percent, variant)

	return 
end
CopDamage._send_melee_attack_result = function (self, attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant, body_index)
	slot11 = 128
	body_index = math.clamp(slot8, body_index, 0)
	slot9 = self._unit
	slot17 = (self._dead and true) or false

	self._unit.network(slot8).send(slot8, self._unit.network(slot8), "damage_melee", attack_data.attacker_unit, damage_percent, damage_effect_percent, body_index, hit_offset_height, variant)

	return 
end
CopDamage._send_sync_bullet_attack_result = function (self, attack_data, hit_offset_height)
	return 
end
CopDamage._send_sync_explosion_attack_result = function (self, attack_data)
	return 
end
CopDamage._send_sync_tase_attack_result = function (self, attack_data)
	return 
end
CopDamage._send_sync_melee_attack_result = function (self, attack_data, hit_offset_height)
	return 
end
CopDamage._send_sync_fire_attack_result = function (self, attack_data)
	return 
end
CopDamage.sync_death = function (self, damage)
	if self._dead then
		return 
	end

	return 
end
CopDamage._on_damage_received = function (self, damage_info)
	slot6 = nil

	self.build_suppression(slot3, self, "max")

	slot5 = damage_info

	self._call_listeners(slot3, self)

	if damage_info.result.type == "death" then
		slot6 = damage_info

		managers.enemy.on_enemy_died(slot3, managers.enemy, self._unit)

		slot6 = managers.groupai
		slot6 = managers.groupai.state(self._unit)

		for c_key, c_data in pairs(managers.groupai.state(self._unit).all_char_criminals(self._unit)) do
			slot10 = self._unit

			if c_data.engaged[self._unit.key(slot9)] then
				slot11 = self._unit
				slot12 = c_data.unit

				debug_pause_unit(slot8, self._unit.key(slot10), "dead AI engaging player", self._unit)
			end
		end
	end

	if self._dead then
		slot4 = self._unit
		slot4 = self._unit.movement(slot3)

		if self._unit.movement(slot3).attention(slot3) then
			slot6 = self._unit
			slot11 = self._unit
			slot11 = self._unit.movement(slot10)

			debug_pause_unit(slot3, self._unit, "[CopDamage:_on_damage_received] dead AI", inspect(self._unit.movement(slot10).attention(slot10)))
		end
	end

	local attacker_unit = damage_info and damage_info.attacker_unit
	slot5 = attacker_unit

	if alive(slot4) then
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

	slot5 = managers.player

	if attacker_unit == managers.player.player_unit(slot4) and damage_info then
		slot7 = damage_info

		managers.player.on_damage_dealt(slot4, managers.player, self._unit)
	end

	slot6 = damage_info

	self._update_debug_ws(slot4, self)

	return 
end
CopDamage._call_listeners = function (self, damage_info)
	slot7 = damage_info

	self._listener_holder.call(slot3, self._listener_holder, damage_info.result.type, self._unit)

	return 
end
CopDamage.add_listener = function (self, key, events, clbk)
	events = events or self._all_event_types
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
CopDamage.remove_listener = function (self, key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
CopDamage.set_pickup = function (self, pickup)
	self._pickup = pickup

	return 
end
CopDamage.pickup = function (self)
	return self._pickup
end
CopDamage.health_ratio = function (self)
	return self._health_ratio
end
CopDamage.health = function (self)
	return self._health
end
CopDamage.convert_to_criminal = function (self, health_multiplier)
	slot5 = false

	self.set_mover_collision_state(slot3, self)

	self._health = self._HEALTH_INIT
	self._health_ratio = 1
	self._damage_reduction_multiplier = health_multiplier
	slot5 = 16

	self._unit.set_slot(slot3, self._unit)

	return 
end
CopDamage.set_invulnerable = function (self, state)
	if state then
		self._invulnerable = (self._invulnerable or 0) + 1
	elseif self._invulnerable then
		if self._invulnerable == 1 then
			self._invulnerable = nil
		else
			self._invulnerable = self._invulnerable - 1
		end
	end

	return 
end
CopDamage.set_immortal = function (self, immortal)
	self._immortal = immortal

	return 
end
CopDamage.build_suppression = function (self, amount, panic_chance)
	if self._dead or not self._char_tweak.suppression then
		return 
	end

	slot5 = self._unit

	if self._unit.unit_data(slot4).turret_weapon then
		return 
	end

	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	local t = TimerManager.game(slot4).time(slot4)
	local sup_tweak = self._char_tweak.suppression

	if panic_chance and (panic_chance == -1 or (0 < panic_chance and 0 < sup_tweak.panic_chance_mul and math.random() < panic_chance * sup_tweak.panic_chance_mul)) then
		amount = "panic"
	end

	local amount_val = nil

	if amount == "max" or amount == "panic" then
		amount_val = sup_tweak.brown_point or sup_tweak.react_point[2]
	else
		slot8 = Network

		if Network.is_server(slot7) and self._suppression_hardness_t and t < self._suppression_hardness_t then
			amount_val = amount * 0.5
		else
			amount_val = amount
		end
	end

	slot8 = Network

	if not Network.is_server(slot7) then
		local sync_amount = nil

		if amount == "panic" then
			sync_amount = 16
		elseif amount == "max" then
			sync_amount = 15
		else
			local sync_amount_ratio = nil

			if sup_tweak.brown_point then
				if sup_tweak.brown_point[2] <= 0 then
					sync_amount_ratio = 1
				else
					sync_amount_ratio = amount_val / sup_tweak.brown_point[2]
				end
			elseif sup_tweak.react_point[2] <= 0 then
				sync_amount_ratio = 1
			else
				sync_amount_ratio = amount_val / sup_tweak.react_point[2]
			end

			slot12 = sync_amount_ratio * 15
			slot12 = 15
			sync_amount = math.clamp(slot9, math.ceil(slot11), 1)
		end

		slot9 = managers.network
		slot12 = sync_amount

		managers.network.session(slot8).send_to_host(slot8, managers.network.session(slot8), "suppression", self._unit)

		return 
	end

	if self._suppression_data then
		slot10 = self._suppression_data.value + amount_val
		self._suppression_data.value = math.min(slot8, self._suppression_data.brown_point or self._suppression_data.react_point)
		self._suppression_data.last_build_t = t
		self._suppression_data.decay_t = t + self._suppression_data.duration
		slot10 = self._suppression_data.decay_t

		managers.enemy.reschedule_delayed_clbk(t + self._suppression_data.duration, managers.enemy, self._suppression_data.decay_clbk_id)
	else
		slot9 = sup_tweak.duration[2]
		local duration = math.lerp(slot7, sup_tweak.duration[1], math.random())
		local decay_t = t + duration
		slot8 = {
			value = amount_val,
			last_build_t = t,
			decay_t = decay_t,
			duration = duration
		}

		if sup_tweak.react_point then
			slot12 = sup_tweak.react_point[2]
			slot9 = math.lerp(slot10, sup_tweak.react_point[1], math.random())
		end

		slot8.react_point = slot9

		if sup_tweak.brown_point then
			slot12 = sup_tweak.brown_point[2]
			slot9 = math.lerp(slot10, sup_tweak.brown_point[1], math.random())
		end

		slot8.brown_point = slot9
		slot14 = self._unit
		slot8.decay_clbk_id = "CopDamage_suppression" .. tostring(self._unit.key(slot13))
		self._suppression_data = slot8
		slot16 = "clbk_suppression_decay"
		slot13 = decay_t

		managers.enemy.add_delayed_clbk("CopDamage_suppression" .. tostring(self._unit.key(slot13)), managers.enemy, self._suppression_data.decay_clbk_id, callback(slot13, self, self))
	end

	if not self._suppression_data.brown_zone and self._suppression_data.brown_point and self._suppression_data.brown_point <= self._suppression_data.value then
		self._suppression_data.brown_zone = true
		slot8 = self._unit
		slot9 = (amount == "panic" and "panic") or true

		self._unit.brain(true).on_suppressed(slot7, self._unit.brain(true))
	elseif amount == "panic" then
		slot8 = self._unit
		slot9 = "panic"

		self._unit.brain(slot7).on_suppressed(slot7, self._unit.brain(slot7))
	end

	if not self._suppression_data.react_zone and self._suppression_data.react_point and self._suppression_data.react_point <= self._suppression_data.value then
		self._suppression_data.react_zone = true
		slot8 = self._unit
		slot9 = (amount == "panic" and "panic") or true

		self._unit.movement(true).on_suppressed(slot7, self._unit.movement(true))
	elseif amount == "panic" then
		slot8 = self._unit
		slot9 = "panic"

		self._unit.movement(slot7).on_suppressed(slot7, self._unit.movement(slot7))
	end

	return 
end
CopDamage.clbk_suppression_decay = function (self)
	local sup_data = self._suppression_data
	self._suppression_data = nil
	slot4 = self._unit

	if not alive(slot3) or self._dead then
		return 
	end

	if sup_data.react_zone then
		slot4 = self._unit
		slot5 = false

		self._unit.movement(slot3).on_suppressed(slot3, self._unit.movement(slot3))
	end

	if sup_data.brown_zone then
		slot4 = self._unit
		slot5 = false

		self._unit.brain(slot3).on_suppressed(slot3, self._unit.brain(slot3))
	end

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	self._suppression_hardness_t = TimerManager.game(slot3).time(slot3) + 30

	return 
end
CopDamage.last_suppression_t = function (self)
	return self._suppression_data and self._suppression_data.last_build_t
end
CopDamage.focus_delay_mul = function (self)
	return 1
end
CopDamage.shoot_pos_mid = function (self, m_pos)
	slot5 = m_pos

	self._spine2_obj.m_position(slot3, self._spine2_obj)

	return 
end
CopDamage.on_marked_state = function (self, state, multiplier)
	if state then
		self._marked_dmg_mul = multiplier or 1
	else
		self._marked_dmg_mul = nil
	end

	return 
end
CopDamage._get_attack_variant_index = function (self, variant)
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
CopDamage._create_debug_ws = function (self)
	slot3 = World
	self._gui = World.newgui(slot2)
	slot6 = "Head"
	local obj = self._unit.get_object(slot2, Idstring(slot5))
	slot11 = obj
	slot11 = obj.rotation(obj)
	slot11 = obj
	slot12 = obj
	slot12 = obj.rotation(obj.rotation(obj))
	slot10 = obj.rotation(obj.rotation(obj)).y(obj.rotation(obj)) * 50
	self._ws = self._gui.create_linked_workspace(self._unit, self._gui, 100, 100, obj, obj.position(slot9) + obj.rotation(obj).y(obj) * 25, obj.rotation(obj).x(obj) * 50)
	slot5 = self._ws.BILLBOARD_BOTH

	self._ws.set_billboard(self._unit, self._ws)

	slot4 = self._ws
	slot5 = {
		name = "health",
		vertical = "top",
		visible = true,
		font_size = 30,
		align = "left",
		font = "fonts/font_medium_shadow_mf",
		y = 0,
		render_template = "OverlayVertexColorTextured",
		layer = 1,
		text = "" .. self._health,
		color = Color.white
	}

	self._ws.panel(self._unit).text(self._unit, self._ws.panel(self._unit))

	slot4 = self._ws
	slot5 = {
		name = "ld",
		vertical = "top",
		visible = true,
		font_size = 30,
		align = "left",
		text = "",
		font = "fonts/font_medium_shadow_mf",
		y = 30,
		render_template = "OverlayVertexColorTextured",
		layer = 1,
		color = Color.white
	}

	self._ws.panel(self._unit).text(self._unit, self._ws.panel(self._unit))

	slot4 = self._ws
	slot5 = {
		name = "variant",
		vertical = "top",
		visible = true,
		font_size = 30,
		align = "left",
		text = "",
		font = "fonts/font_medium_shadow_mf",
		y = 60,
		render_template = "OverlayVertexColorTextured",
		layer = 1,
		color = Color.white
	}

	self._ws.panel(self._unit).text(self._unit, self._ws.panel(self._unit))

	slot4 = self

	self._update_debug_ws(self._unit)

	return 
end
CopDamage._update_debug_ws = function (self, damage_info)
	slot4 = self._ws

	if alive(slot3) then
		slot5 = self._health
		local str = string.format(slot3, "HP: %.2f")
		slot5 = self._ws
		slot6 = "health"
		slot6 = str

		self._ws.panel("HP: %.2f").child("HP: %.2f", self._ws.panel("HP: %.2f")).set_text("HP: %.2f", self._ws.panel("HP: %.2f").child("HP: %.2f", self._ws.panel("HP: %.2f")))

		slot5 = self._ws
		slot6 = "ld"
		slot5 = self._ws.panel("HP: %.2f").child("HP: %.2f", self._ws.panel("HP: %.2f"))
		slot9 = (damage_info and damage_info.damage) or 0

		self._ws.panel("HP: %.2f").child("HP: %.2f", self._ws.panel("HP: %.2f")).set_text(slot4, string.format(slot7, "LD: %.2f"))

		slot5 = self._ws
		slot6 = "variant"
		slot6 = "V: " .. ((damage_info and damage_info.variant) or "N/A")

		self._ws.panel(slot4).child(slot4, self._ws.panel(slot4)).set_text(slot4, self._ws.panel(slot4).child(slot4, self._ws.panel(slot4)))

		local vc = Color.white

		if damage_info and damage_info.variant then
			vc = (damage_info.variant == "fire" and Color.red) or (damage_info.variant == WeaponTweakData.DAMAGE_TYPE_MELEE and Color.yellow) or Color.white
		end

		slot6 = self._ws
		slot7 = "variant"
		slot7 = vc

		self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)).set_color(slot5, self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)))

		local function func(o)
			local mt = 0.25
			local t = mt

			while 0 <= t do
				local dt = coroutine.yield()
				slot8 = mt
				t = math.clamp(slot5, t - dt, 0)
				local v = t / mt
				local a = 1
				local r = 1
				local g = 0.25 + 0.75 * (1 - v)
				local b = 0.25 + 0.75 * (1 - v)
				slot11 = o
				slot17 = b

				o.set_color(slot10, Color(slot13, a, r, g))
			end

			return 
		end

		slot7 = self._ws
		slot8 = "ld"
		slot8 = func

		self._ws.panel(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5))).child(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)), self._ws.panel(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)))).animate(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)), self._ws.panel(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5))).child(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)), self._ws.panel(self._ws.panel(slot5).child(slot5, self._ws.panel(slot5)))))

		if damage_info and 0 < damage_info.damage then
			slot7 = self._ws
			slot12 = damage_info.damage
			local text = self._ws.panel(slot6).text(slot6, self._ws.panel(slot6))

			local function func2(o, dir)
				local mt = 8
				local t = mt

				while 0 < t do
					local dt = coroutine.yield()
					slot9 = mt
					t = math.clamp(slot6, t - dt, 0)
					local speed = dt * 100
					slot12 = dir
					slot10 = (1 - math.abs(slot11)) * -speed

					o.move(t - dt, o, dir * speed)

					slot9 = t / mt

					text.set_alpha(t - dt, text)
				end

				slot6 = self._ws
				slot7 = o

				self._ws.panel(slot5).remove(slot5, self._ws.panel(slot5))

				return 
			end

			slot11 = Application
			local dir = math.sin({
				font_size = 20,
				vertical = "center",
				h = 40,
				visible = true,
				w = 40,
				align = "center",
				render_template = "OverlayVertexColorTextured",
				font = "fonts/font_medium_shadow_mf",
				y = -20,
				rotation = 360,
				layer = 1,
				text = string.format(slot10, "%.2f"),
				color = Color.white
			})
			slot11 = dir * 90

			text.set_rotation(Application.time(slot10) * 1000, text)

			slot12 = dir

			text.animate(Application.time(slot10) * 1000, text, func2)
		end
	end

	return 
end
CopDamage.save = function (self, data)
	data.char_dmg = data.char_dmg or {}

	if self._health ~= self._HEALTH_INIT then
		data.char_dmg.health = self._health
	end

	if self._invulnerable then
		data.char_dmg.invulnerable = self._invulnerable
	end

	slot5 = 16

	if self._unit.in_slot(slot3, self._unit) then
		data.char_dmg.is_converted = true
	end

	data.char_dmg.dead = self._dead

	return 
end
CopDamage.load = function (self, data)
	if not data.char_dmg then
		return 
	end

	self._dead = data.char_dmg.dead

	if data.char_dmg.health then
		self._health = data.char_dmg.health
		self._health_ratio = self._health / self._HEALTH_INIT
	end

	if data.char_dmg.invulnerable then
		self._invulnerable = data.char_dmg.invulnerable
	end

	if data.char_dmg.is_converted then
		slot5 = 16

		self._unit.set_slot(slot3, self._unit)

		slot4 = managers.groupai
		slot5 = self._unit

		managers.groupai.state(slot3).sync_converted_enemy(slot3, managers.groupai.state(slot3))

		slot4 = self._unit
		slot6 = false

		self._unit.contour(slot3).add(slot3, self._unit.contour(slot3), "friendly")
	end

	return 
end
CopDamage._apply_damage_to_health = function (self, damage)
	self._health = self._health - damage
	self._health_ratio = self._health / self._HEALTH_INIT

	return 
end
CopDamage._apply_min_health_limit = function (self, damage, damage_percent)
	slot5 = self._unit
	slot5 = self._unit.base(slot4)
	local lower_health_percentage_limit = self._unit.base(slot4).char_tweak(slot4).LOWER_HEALTH_PERCENTAGE_LIMIT

	if lower_health_percentage_limit then
		local real_damage_percent = damage_percent / self._HEALTH_GRANULARITY
		local new_health_ratio = self._health_ratio - real_damage_percent

		if new_health_ratio < lower_health_percentage_limit then
			real_damage_percent = self._health_ratio - lower_health_percentage_limit
			damage_percent = real_damage_percent * self._HEALTH_GRANULARITY
			damage = damage_percent * self._HEALTH_INIT_PRECENT
		end
	end

	return damage, damage_percent
end
CopDamage._apply_damage_modifier = function (self, damage, attack_data)
	slot5 = self._unit
	slot5 = self._unit.movement(slot4)
	local damage_reduction = self._unit.movement(slot4).team(slot4).damage_reduction or 0
	local damage_modifier = 1
	slot8 = BuffEffectManager.EFFECT_ENEMIES_RECEIVE_DAMAGE

	if managers.buff_effect.is_effect_active(slot6, managers.buff_effect) then
		slot8 = BuffEffectManager.EFFECT_ENEMIES_RECEIVE_DAMAGE
		damage_modifier = (managers.buff_effect.get_effect_value(slot6, managers.buff_effect) or 1) * damage_modifier
	end

	local health_ratio = 1

	if attack_data and attack_data.attacker_unit and attack_data.attacker_unit.character_damage then
		slot8 = attack_data.attacker_unit
		slot8 = attack_data.attacker_unit.character_damage(slot7)
		health_ratio = attack_data.attacker_unit.character_damage(slot7).health_ratio(slot7)
	end

	slot9 = BuffEffectManager.EFFECT_PLAYER_LOW_HEALTH_DAMAGE

	if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) then
		slot9 = BuffEffectManager.EFFECT_PLAYER_LOW_HEALTH_DAMAGE
		local multiplier = (managers.buff_effect.get_effect_value(slot7, managers.buff_effect) or 1) + 1 - health_ratio
		damage_modifier = multiplier * damage_modifier
	end

	if attack_data then
		slot9 = managers.player

		if attack_data.attacker_unit == managers.player.local_player(slot8) then
			slot9 = BuffEffectManager.EFFECT_PLAYER_PISTOL_DAMAGE

			if managers.buff_effect.is_effect_active(slot7, managers.buff_effect) and attack_data.weapon_unit then
				slot8 = attack_data.weapon_unit

				if attack_data.weapon_unit.base(slot7)._use_data then
					slot8 = attack_data.weapon_unit

					if attack_data.weapon_unit.base(slot7)._use_data.player.selection_index == 1 then
						slot9 = BuffEffectManager.EFFECT_PLAYER_PISTOL_DAMAGE
						damage_modifier = (damage_modifier + (managers.buff_effect.get_effect_value(slot7, managers.buff_effect) or 1)) - 1
					end
				end
			end
		end
	end

	damage_modifier = damage_modifier - damage_reduction
	damage = damage * damage_modifier

	return damage
end
CopDamage.skill_action_knockdown = function (unit, hit_position, direction)
	if unit.movement then
		local hurt_type = "expl_hurt"
		slot6 = unit
		slot7 = 1
		local action = unit.movement(slot5).get_action(slot5, unit.movement(slot5))

		if not action or (action and action._hurt_type ~= hurt_type) then
			local action_data = {
				type = "hurt",
				interrupted = true,
				sync = true,
				body_part = 1,
				direction_vec = direction,
				hit_pos = hit_position,
				hurt_type = hurt_type,
				blocks = {
					act = -1,
					hurt = -1,
					action = -1,
					dodge = -1,
					aim = -1,
					walk = -1
				}
			}
			slot8 = unit
			slot9 = action_data

			unit.movement(slot7).action_request(slot7, unit.movement(slot7))
		end
	end

	return 
end
CopDamage.destroy = function (self, ...)
	slot3 = self

	self._remove_debug_gui(slot2)

	return 
end

return 
