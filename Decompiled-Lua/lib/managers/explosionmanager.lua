-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ExplosionManager = ExplosionManager or class()
local idstr_small_light_fire = Idstring(slot1)
local idstr_explosion_std = Idstring("effects/vanilla/fire/fire_medium_001")
slot4 = ""
local empty_idstr = Idstring("explosion_std")
local molotov_effect = "effects/vanilla/fire/fire_molotov_grenade_001"
local tmp_vec3 = Vector3()
function ExplosionManager:init()
	self._sustain_effects = {}

	return 
end
function ExplosionManager:update(t, dt)
	slot5 = self._sustain_effects

	for i, effect in ipairs(slot4) do
		if effect.expire_t < t then
			slot10 = World
			slot11 = effect.id

			World.effect_manager(slot9).fade_kill(slot9, World.effect_manager(slot9))

			slot11 = i

			table.remove(slot9, self._sustain_effects)
		end
	end

	return 
end
function ExplosionManager:add_sustain_effect(effect_id, sustain_time)
	slot6 = {
		id = effect_id,
		expire_t = Application.time(slot8) + sustain_time
	}
	slot9 = Application

	table.insert(slot4, self._sustain_effects)

	return 
end
function ExplosionManager:give_local_player_dmg(pos, range, damage, ignite_character)
	slot7 = managers.player
	local player = managers.player.player_unit(slot6)

	if not player then
		return 
	end

	slot8 = player
	local player_pos = player.oobb(slot7).center(slot7)
	slot10 = pos
	local dist_sq = mvector3.distance_sq(player.oobb(slot7), player_pos)

	if range * range < dist_sq then
		return 
	end

	slot11 = "area_damage_blocker"
	local explosion_block_slot_mask = managers.slot.get_mask(slot9, managers.slot)
	slot18 = {
		player
	}
	local path_blocked = World.raycast(managers.slot, World, "ray", pos, player_pos, "slot_mask", explosion_block_slot_mask, "ignore_unit")

	if not path_blocked then
		slot12 = player
		slot13 = {
			variant = "explosion",
			position = pos,
			range = range,
			damage = damage,
			ignite_character = ignite_character
		}

		player.character_damage(slot11).damage_explosion(slot11, player.character_damage(slot11))
	end

	return 
end
function ExplosionManager:detect_and_give_dmg(params)
	local hit_pos = params.hit_pos
	local slotmask = params.collision_slotmask
	local user_unit = params.user
	local dmg = params.damage
	local player_dmg = params.player_damage or dmg
	local range = params.range
	local ignore_unit = params.ignore_unit
	local curve_pow = params.curve_pow
	local col_ray = params.col_ray

	if not params.alert_filter then
		slot13 = managers.groupai
		slot14 = "civilians_enemies"
		local alert_filter = managers.groupai.state(slot12).get_unit_type_filter(slot12, managers.groupai.state(slot12))
	end

	local owner = params.owner
	local push_units = true
	local results = {}
	local alert_radius = params.alert_radius or 10000
	local armor_piercing = params.armor_piercing
	local killzone_range = params.killzone_range

	if params.push_units ~= nil then
		push_units = params.push_units
	end

	local player = managers.player.player_unit(slot19)
	slot21 = player

	if alive(managers.player) and player_dmg ~= 0 then
		slot21 = player
		slot22 = {
			variant = "explosion",
			position = hit_pos,
			range = range,
			damage = player_dmg,
			ignite_character = params.ignite_character
		}

		player.character_damage(slot20).damage_explosion(slot20, player.character_damage(slot20))
	end

	slot26 = slotmask
	local bodies = World.find_bodies(slot20, World, "intersect", "sphere", hit_pos, range)
	local alert_unit = user_unit

	if alert_unit then
		slot23 = alert_unit

		if alert_unit.base(slot22) then
			slot23 = alert_unit

			if alert_unit.base(slot22).thrower_unit then
				slot23 = alert_unit
				slot23 = alert_unit.base(slot22)
				alert_unit = alert_unit.base(slot22).thrower_unit(slot22)
			end
		end
	end

	slot23 = managers.groupai
	slot24 = {
		"explosion",
		hit_pos,
		alert_radius,
		alert_filter,
		alert_unit
	}

	managers.groupai.state(slot22).propagate_alert(slot22, managers.groupai.state(slot22))

	local splinters = {
		mvector3.copy(managers.groupai.state(slot22))
	}
	local dirs = {}
	slot27 = 0
	dirs[1] = Vector3(hit_pos, range, 0)
	slot27 = 0
	dirs[2] = Vector3(hit_pos, -range, 0)
	slot27 = 0
	dirs[3] = Vector3(hit_pos, 0, range)
	slot27 = 0
	dirs[4] = Vector3(hit_pos, 0, -range)
	slot27 = range
	dirs[5] = Vector3(hit_pos, 0, 0)
	slot27 = -range
	dirs[MULTRES] = Vector3(hit_pos, 0, 0)
	local pos = Vector3()
	slot26 = dirs

	for _, dir in ipairs(0) do
		slot32 = dir

		mvector3.set(slot30, pos)

		slot32 = hit_pos

		mvector3.add(slot30, pos)

		local splinter_ray = nil

		if ignore_unit then
			slot39 = slotmask
			splinter_ray = World.raycast(slot31, World, "ray", hit_pos, pos, "ignore_unit", ignore_unit, "slot_mask")
		else
			slot37 = slotmask
			splinter_ray = World.raycast(slot31, World, "ray", hit_pos, pos, "slot_mask")
		end

		slot35 = 10
		pos = ((splinter_ray and splinter_ray.position) or pos) - dir.normalized(slot32) * math.min(dir, (splinter_ray and splinter_ray.distance) or 0)
		local near_splinter = false
		slot33 = splinters

		for _, s_pos in ipairs(math.min(dir, (splinter_ray and splinter_ray.distance) or 0)) do
			slot39 = s_pos

			if mvector3.distance_sq(slot37, pos) < 900 then
				near_splinter = true

				break
			end
		end

		if not near_splinter then
			slot33 = splinters
			slot36 = pos

			table.insert(slot32, mvector3.copy(slot35))
		end
	end

	local count_cops = 0
	local count_gangsters = 0
	local count_civilians = 0
	local count_cop_kills = 0
	local count_gangster_kills = 0
	local count_civilian_kills = 0
	local characters_hit = {}
	local units_to_push = {}
	local hit_units = {}
	local type = nil
	slot36 = bodies

	for _, hit_body in ipairs(slot35) do
		slot41 = hit_body
		slot41 = hit_body.unit(slot40)

		if hit_body.unit(slot40).character_damage(slot40) then
			slot41 = hit_body
			slot41 = hit_body.unit(slot40)

			if hit_body.unit(slot40).character_damage(slot40).damage_explosion then
				slot41 = hit_body
				slot41 = hit_body.unit(slot40)
				slot41 = hit_body.unit(slot40).character_damage(slot40)
				local character = not hit_body.unit(slot40).character_damage(slot40).dead(slot40)
			end
		end

		slot42 = hit_body

		if hit_body.extension(slot41) then
			slot42 = hit_body
			local apply_dmg = hit_body.extension(slot41).damage
		end

		slot43 = hit_body
		slot44 = hit_body
		units_to_push[hit_body.unit(slot42).key(slot42)] = hit_body.unit(hit_body.unit(slot42))
		local dir, len, damage, ray_hit, damage_character = nil

		if character then
			slot48 = hit_body
			slot48 = hit_body.unit(slot47)
		end

		if ignore_unit then
			slot48 = hit_body

			if hit_body.unit(slot47) == ignore_unit then
				ray_hit = false
			end
		end

		if ray_hit then
			slot48 = hit_body
			dir = hit_body.center_of_mass(slot47)
			slot50 = dir
			len = mvector3.direction(slot47, dir, hit_pos)

			if armor_piercing then
				damage = dmg
			elseif killzone_range and len / range < killzone_range then
				damage = dmg
			else
				slot52 = 1
				damage = dmg * math.pow(slot47, math.clamp(curve_pow, 1 - len / range, 0))
			end

			if apply_dmg then
				slot54 = armor_piercing

				self._apply_body_damage(slot47, self, true, hit_body, user_unit, dir, damage)
			end

			slot49 = 1
			damage = math.max(slot47, damage)
			local hit_unit = hit_body.unit(slot47)
			slot49 = hit_unit
			hit_units[hit_unit.key(hit_body)] = hit_unit

			if character and damage_character then
				slot49 = hit_unit
				slot49 = hit_unit.character_damage(slot48)
				local dead_before = hit_unit.character_damage(slot48).dead(slot48)
				local action_data = {
					variant = "explosion",
					damage = damage,
					attacker_unit = user_unit,
					weapon_unit = owner
				}

				if not self._col_ray then
					slot49 = {
						position = hit_body.position(slot51),
						ray = dir,
						body = hit_body
					}
					slot52 = hit_body
				end

				action_data.col_ray = slot49
				action_data.ignite_character = params.ignite_character
				slot51 = hit_unit
				slot52 = action_data

				hit_unit.character_damage(slot50).damage_explosion(slot50, hit_unit.character_damage(slot50))

				if not dead_before then
					slot51 = hit_unit

					if hit_unit.base(slot50) then
						slot51 = hit_unit

						if hit_unit.base(slot50)._tweak_table then
							slot51 = hit_unit
							slot51 = hit_unit.character_damage(slot50)

							if hit_unit.character_damage(slot50).dead(slot50) then
								slot51 = hit_unit
								type = hit_unit.base(slot50)._tweak_table
								slot51 = type

								if CopDamage.is_civilian(slot50) then
									count_civilian_kills = count_civilian_kills + 1
								else
									slot51 = type

									if CopDamage.is_gangster(slot50) then
										count_gangster_kills = count_gangster_kills + 1
									elseif type ~= "russian" and type ~= "german" and type ~= "spanish" then
										if type == "american" then
										else
											count_cop_kills = count_cop_kills + 1
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if push_units and push_units == true then
		slot39 = range

		managers.explosion.units_to_push(slot35, managers.explosion, units_to_push, hit_pos)
	end

	if owner then
		results.count_cops = count_cops
		results.count_gangsters = count_gangsters
		results.count_civilians = count_civilians
		results.count_cop_kills = count_cop_kills
		results.count_gangster_kills = count_gangster_kills
		results.count_civilian_kills = count_civilian_kills
	end

	return hit_units, splinters, results
end
function ExplosionManager:units_to_push(units_to_push, hit_pos, range)
	slot6 = units_to_push

	for u_key, unit in pairs(slot5) do
		slot11 = unit

		if alive(slot10) then
			slot11 = unit

			if unit.character_damage(slot10) then
				slot11 = unit
				local is_character = unit.character_damage(slot10).damage_explosion
			end
		end
	end

	return 
end
function ExplosionManager:_apply_body_damage(is_server, hit_body, user_unit, dir, damage, armor_piercing)
	slot9 = hit_body
	local hit_unit = hit_body.unit(slot8)

	if not is_server then
		slot10 = hit_unit
		local local_damage = hit_unit.id(slot9) == -1
	end

	if is_server then
		slot11 = hit_unit
		local sync_damage = hit_unit.id(slot10) ~= -1
	end

	if not local_damage and not sync_damage then
		slot12 = "_apply_body_damage skipped"

		print(slot11)

		return 
	end

	local normal = dir
	slot14 = 200
	local prop_damage = math.min(slot12, damage)

	if prop_damage < 0.25 then
		slot15 = 0.25
		prop_damage = math.round(slot13, prop_damage)
	end

	if prop_damage == 0 then
	end

	if 0 < prop_damage then
		if not is_server then
			slot14 = hit_unit
			local local_damage = hit_unit.id(slot13) == -1
		end

		if is_server then
			slot15 = hit_unit
			local sync_damage = hit_unit.id(slot14) ~= -1
		end

		slot16 = prop_damage * 163.84
		local network_damage = math.ceil(slot15)
		prop_damage = network_damage / 163.84

		if local_damage then
			slot17 = hit_body
			slot22 = hit_body
			slot23 = armor_piercing

			hit_body.extension(slot16).damage.damage_explosion(slot16, hit_body.extension(slot16).damage, user_unit, normal, hit_body.position(slot21), dir, prop_damage)

			slot17 = hit_body
			slot22 = hit_body
			slot22 = prop_damage

			hit_body.extension(slot16).damage.damage_damage(slot16, hit_body.extension(slot16).damage, user_unit, normal, hit_body.position(dir), dir)
		end

		if sync_damage then
			slot17 = managers.network

			if managers.network.session(slot16) then
				slot17 = hit_body
				slot17 = hit_body.position(slot16)

				if 90000 < hit_body.position(slot16).length(slot16) then
					slot18 = inspect(slot19)
					slot21 = hit_body

					debug_pause(slot16, "[ExplosionManager][_apply_body_damage] Position of the hit body is outside of alowed range and wouldn't be transportable through the network: ", hit_body.position(hit_body))

					return 
				end

				slot17 = user_unit

				if alive(slot16) then
					slot17 = managers.network
					slot24 = hit_body
					slot27 = network_damage

					managers.network.session(slot16).send_to_peers_synched(slot16, managers.network.session(slot16), "sync_body_damage_explosion", hit_body, user_unit, normal, hit_body.position(slot23), dir, math.min(armor_piercing, 32768))
				else
					slot17 = managers.network
					slot23 = hit_body
					slot26 = network_damage

					managers.network.session(slot16).send_to_peers_synched(slot16, managers.network.session(slot16), "sync_body_damage_explosion_no_attacker", hit_body, normal, hit_body.position(slot22), dir, math.min(armor_piercing, 32768))
				end
			end
		end
	end

	return 
end
function ExplosionManager:explode_on_client(position, normal, user_unit, dmg, range, curve_pow, custom_params)
	slot14 = custom_params

	self.play_sound_and_effects(slot9, self, position, normal, range)

	slot16 = curve_pow

	self.client_damage_and_push(slot9, self, position, normal, user_unit, dmg, range)

	return 
end
function ExplosionManager:client_damage_and_push(position, normal, user_unit, dmg, range, curve_pow, armor_piercing)
	slot14 = range
	slot18 = "bullet_impact_targets"
	local bodies = World.find_bodies(slot9, World, "intersect", "sphere", position, managers.slot.get_mask(slot16, managers.slot))
	local units_to_push = {}
	slot12 = bodies

	for _, hit_body in ipairs("intersect") do
		local hit_unit = hit_body.unit(slot16)
		slot18 = hit_body
		slot18 = hit_body.unit(hit_body)
		units_to_push[hit_body.unit(hit_body).key(hit_body)] = hit_unit
		slot18 = hit_body

		if hit_body.extension(hit_body) then
			slot18 = hit_body

			if hit_body.extension(slot17).damage then
				slot18 = hit_unit
				local apply_dmg = hit_unit.id(slot17) == -1
			end
		end

		local dir, len, damage = nil

		if apply_dmg then
			slot22 = hit_body
			dir = hit_body.center_of_mass(slot21)
			slot24 = dir
			len = mvector3.direction(slot21, dir, position)
			slot26 = 1
			slot23 = curve_pow
			damage = dmg * math.pow(slot21, math.clamp(position, 1 - len / range, 0))
			slot28 = armor_piercing

			self._apply_body_damage(slot21, self, false, hit_body, user_unit, dir, damage)
		end
	end

	slot15 = range

	self.units_to_push(slot11, self, units_to_push, position)

	return 
end
function ExplosionManager:play_sound_and_effects(position, normal, range, custom_params, molotov_damage_effect_table)
	slot12 = custom_params

	self.player_feedback(slot7, self, position, normal, range)

	slot17 = molotov_damage_effect_table

	self.spawn_sound_and_effects(slot7, self, position, normal, range, custom_params and custom_params.effect, custom_params and custom_params.sound_event, custom_params and custom_params.on_unit, custom_params and custom_params.idstr_decal, custom_params and custom_params.idstr_effect)

	return 
end
function ExplosionManager:player_feedback(position, normal, range, custom_params)
	slot7 = managers.player
	local player = managers.player.player_unit(slot6)

	if not player then
		return 
	end

	local range = (custom_params and custom_params.feedback_range) or range
	slot10 = "mission_triggered"
	local feedback = managers.feedback.create(slot8, managers.feedback)
	local player_position = player.position(managers.feedback)
	slot12 = player_position
	local distance = mvector3.distance_sq(player, position)
	slot14 = 1
	local mul = math.clamp(position, 1 - distance / (range * range), 0)

	if not custom_params or not custom_params.camera_shake_mul then
		local camera_shake_mul = mul * ((custom_params and custom_params.camera_shake_max_mul) or 1)
	end

	slot15 = player

	feedback.set_unit(slot13, feedback)

	slot16 = true

	feedback.set_enabled(slot13, feedback, "camera_shake")

	slot16 = true

	feedback.set_enabled(slot13, feedback, "rumble")

	slot16 = false

	feedback.set_enabled(slot13, feedback, "above_camera_effect")

	local params = {
		"camera_shake",
		"multiplier",
		camera_shake_mul,
		"camera_shake",
		"amplitude",
		0.5,
		"camera_shake",
		"attack",
		0.05,
		"camera_shake",
		"sustain",
		0.15,
		"camera_shake",
		"decay",
		0.5,
		"rumble",
		"multiplier_data",
		mul,
		"rumble",
		"peak",
		0.5,
		"rumble",
		"attack",
		0.05,
		"rumble",
		"sustain",
		0.15,
		"rumble",
		"release",
		0.5
	}
	slot15 = feedback
	slot18 = params

	feedback.play(feedback, unpack(slot17))

	if custom_params and custom_params.sound_muffle_effect then
		local sound_eff_range = range / 4
		slot18 = 1
		local sound_eff_mul = math.clamp(slot15, 1 - distance / (sound_eff_range * sound_eff_range), 0)

		if 0.3 <= sound_eff_mul then
			slot17 = player
			slot18 = sound_eff_mul

			player.character_damage(slot16).on_flashbanged(slot16, player.character_damage(slot16))
		end
	end

	return 
end
local decal_ray_from = Vector3()
local decal_ray_to = Vector3()
function ExplosionManager:spawn_sound_and_effects(position, normal, range, effect_name, sound_event, on_unit, idstr_decal, idstr_effect, molotov_damage_effect_table)
	effect_name = effect_name or "effects/vanilla/explosions/exp_projectile_001"
	local effect_id = nil

	if effect_name ~= "none" then
		slot13 = World
		slot14 = {
			effect = Idstring(slot16),
			position = position,
			normal = normal
		}
		slot17 = effect_name
		effect_id = World.effect_manager(slot12).spawn(slot12, World.effect_manager(slot12))
	end

	if molotov_damage_effect_table ~= nil then
		slot14 = {
			effect_id = effect_id,
			detonation_position = position,
			detonation_normal = normal
		}

		table.insert(slot12, molotov_damage_effect_table)
	end

	slot14 = "world_geometry"
	local slotmask_world_geometry = managers.slot.get_mask(slot12, managers.slot)

	if on_unit then
		slot15 = position

		mvector3.set(slot13, decal_ray_from)

		slot15 = normal

		mvector3.set(slot13, decal_ray_to)

		slot15 = 100

		mvector3.multiply(slot13, decal_ray_to)

		slot15 = decal_ray_to

		mvector3.add(slot13, decal_ray_from)

		slot15 = -2

		mvector3.multiply(slot13, decal_ray_to)

		slot15 = decal_ray_from

		mvector3.add(slot13, decal_ray_to)
	else
		slot15 = position

		mvector3.set(slot13, decal_ray_from)

		slot15 = math.UP

		mvector3.set(slot13, decal_ray_to)

		slot15 = -100

		mvector3.multiply(slot13, decal_ray_to)

		slot15 = decal_ray_from

		mvector3.add(slot13, decal_ray_to)
	end

	slot19 = slotmask_world_geometry
	local ray = World.raycast(slot13, World, "ray", decal_ray_from, decal_ray_to, "slot_mask")
	local sound_switch_name = nil

	if ray then
		slot20 = slotmask_world_geometry
		local material_name, _, _ = World.pick_decal_material(slot15, World, ray.unit, decal_ray_from, decal_ray_to)
		sound_switch_name = material_name ~= empty_idstr and material_name
	end

	if (effect_name == molotov_effect and molotov_damage_effect_table ~= nil and #molotov_damage_effect_table <= 1) or effect_name ~= molotov_effect then
		sound_event = sound_event or "trip_mine_explode"

		if sound_event ~= "no_sound" then
			slot17 = "ExplosionManager"
			local sound_source = SoundDevice.create_source(slot15, SoundDevice)
			slot18 = position

			sound_source.set_position(SoundDevice, sound_source)

			if sound_switch_name then
				slot18 = "materials"
				slot22 = sound_switch_name

				sound_source.set_switch(slot16, sound_source, managers.game_play_central.material_name(slot20, managers.game_play_central))
			end

			slot18 = sound_event

			sound_source.post_event(slot16, sound_source)

			slot24 = {
				sound_source = sound_source
			}
			slot22 = TimerManager
			slot22 = TimerManager.game(ProjectileBase)

			managers.enemy.add_delayed_clbk(slot16, managers.enemy, "ExplosionManager", callback(TimerManager.game(ProjectileBase).time(ProjectileBase) + 4, ProjectileBase, ProjectileBase, "_dispose_of_sound"))
		end
	end

	slot22 = idstr_effect

	self.project_decal(slot15, self, ray, decal_ray_from, decal_ray_to, on_unit and ray and ray.unit, idstr_decal)

	return 
end
function ExplosionManager:project_decal(ray, from, to, on_unit, idstr_decal, idstr_effect)
	slot10 = "world_geometry"
	local slotmask_world_geometry = managers.slot.get_mask(slot8, managers.slot)

	if ray then
		if not on_unit then
			slot16 = slotmask_world_geometry
			local units = World.find_units(slot9, World, "intersect", "cylinder", from, to, 100)
		end

		slot17 = ray.normal
		local redir_name = World.project_decal(slot10, World, idstr_decal or idstr_explosion_std, ray.position, ray.ray, on_unit or units, nil)

		if redir_name ~= empty_idstr then
			slot12 = World
			slot13 = {
				effect = redir_name,
				position = ray.position,
				normal = ray.normal
			}

			World.effect_manager(slot11).spawn(slot11, World.effect_manager(slot11))
		end

		if not idstr_effect or idstr_effect ~= empty_idstr then
			slot12 = World
			slot13 = {
				effect = idstr_effect or idstr_small_light_fire,
				position = ray.position,
				normal = ray.normal
			}
			local id = World.effect_manager(slot11).spawn(slot11, World.effect_manager(slot11))
			slot17 = 3
			slot15 = 2 + math.rand(slot16)

			self.add_sustain_effect(World.effect_manager(slot11), self, id)
		end
	end

	return 
end

return 
