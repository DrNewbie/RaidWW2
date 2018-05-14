-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
FireManager = FireManager or class()
FireManager.MAX_FLAMETHROWER_FIRES = 3
FireManager.FLAMETHROWER_FIRE_CHANCE = 0.2
local idstr_explosion_std = Idstring(0.2)
slot3 = ""
local empty_idstr = Idstring("explosion_std")
local molotov_effect = "effects/vanilla/fire/fire_molotov_grenade_001"
local tmp_vec3 = Vector3()
function FireManager:init()
	self._enemies_on_fire = {}
	self._dozers_on_fire = {}
	self._flamethrower_fire_patches = {}
	self._doted_enemies = {}
	self._fire_dot_grace_period = 1
	self._fire_dot_tick_period = 1

	return 
end
function FireManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]

		if dot_info.fire_damage_received_time + self._fire_dot_grace_period < t and 0.5 <= dot_info.fire_dot_counter then
			slot11 = dot_info

			self._damage_fire_dot(slot9, self)

			dot_info.fire_dot_counter = 0
		end

		if dot_info.fire_damage_received_time + dot_info.dot_length < t then
			if dot_info.fire_effects then
				slot10 = dot_info.fire_effects

				for _, fire_effect_id in ipairs(slot9) do
					slot15 = World
					slot16 = fire_effect_id

					World.effect_manager(slot14).fade_kill(slot14, World.effect_manager(slot14))
				end
			end

			slot11 = dot_info.enemy_unit

			self._remove_flame_effects_from_doted_unit(slot9, self)

			slot11 = dot_info.sound_source

			self._stop_burn_body_sound(slot9, self)

			slot11 = index

			table.remove(slot9, self._doted_enemies)

			if dot_info.enemy_unit then
				slot10 = dot_info.enemy_unit

				if alive(slot9) then
					slot11 = dot_info.enemy_unit
					self._dozers_on_fire[dot_info.enemy_unit.id(slot10)] = nil
				end
			end
		else
			dot_info.fire_dot_counter = dot_info.fire_dot_counter + dt
		end
	end

	for i = #self._flamethrower_fire_patches, 1, -1 do
		slot9 = Application

		if self._flamethrower_fire_patches[i].expire_t < Application.time(slot8) then
			slot10 = i

			table.remove(slot8, self._flamethrower_fire_patches)
		end
	end

	return 
end
function FireManager:leave_flamethrower_patch(player)
	slot4 = Network

	if Network.is_server(slot3) then
		if FireManager.MAX_FLAMETHROWER_FIRES <= #self._flamethrower_fire_patches then
			return 
		end

		slot4 = self._flamethrower_fire_patches

		for _, data in ipairs(slot3) do
			slot12 = player

			if self._patches_intersect(slot8, self, player.position(data.pos)) then
				return 
			end
		end

		if FireManager.FLAMETHROWER_FIRE_CHANCE < math.random() then
			return 
		end

		local rot = player.rotation(slot3)
		local pos = player.position(player) + rot.y(player) * -30
		local td = tweak_data.projectiles[NPCFlamethrowerBase.EXPLOSION_TYPE]
		slot8 = NPCFlamethrowerBase.EXPLOSION_TYPE
		local index = tweak_data.blackmarket.get_index_from_projectile_id(rot, tweak_data.blackmarket)
		slot12 = rot
		slot10 = rot.z(slot11) * 0.01

		ProjectileBase.throw_projectile(tweak_data.blackmarket, index, pos)

		slot9 = {
			pos = pos,
			expire_t = Application.time(slot11) + td.burn_duration
		}
		slot12 = Application

		table.insert(tweak_data.blackmarket, self._flamethrower_fire_patches)
	else
		slot4 = player
		slot5 = "leave_flamethrower_patch"

		player.network(slot3).send_to_host(slot3, player.network(slot3))
	end

	return 
end
function FireManager:_patches_intersect(pos1, pos2)
	local r = 200
	slot7 = 2
	slot8 = 2
	local x = math.pow(slot5, pos1.x - pos2.x) + math.pow(pos1.x - pos2.x, pos1.y - pos2.y)
	slot8 = 2
	local y = math.pow(pos1.x - pos2.x, r + r)
	local result = false

	if 0 <= x and x <= y then
		result = true
	end

	return result
end
function FireManager:check_achievemnts(unit, t)

	-- Decompilation error in this vicinity:
	if not unit then
		slot5 = unit

		if not alive(slot4) then
			return 
		end
	end

	slot5 = unit
	slot7 = unit
	slot5 = unit.base(slot6)._tweak_table

	if CopDamage.is_civilian(slot4) then
		return 
	end

	for i = #self._enemies_on_fire, 1, -1 do
		local data = self._enemies_on_fire[i]

		if 5 < t - data.t or data.unit == unit then
			slot11 = i

			table.remove(slot9, self._enemies_on_fire)
		end
	end

	slot6 = {
		unit = unit,
		t = t
	}

	table.insert(slot4, self._enemies_on_fire)

	local unit_type = unit.base(slot4)._tweak_table
	slot6 = unit
	local unit_id = unit.id(unit)

	if unit_type == "tank" or unit_type == "tank_hw" then
		self._dozers_on_fire[unit_id] = self._dozers_on_fire[unit_id] or {
			t = t,
			unit = unit
		}
	end

	return 
end
function FireManager:remove_dead_dozer_from_overgrill(dozer_id)
	self._dozers_on_fire[dozer_id] = nil

	return 
end
function FireManager:is_set_on_fire(unit)
	slot4 = self._doted_enemies

	for key, dot_info in ipairs(slot3) do
		if dot_info.enemy_unit == unit then
			return true
		end
	end

	return false
end
function FireManager:_add_doted_enemy(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage)
	local contains = false

	if self._doted_enemies then
		slot9 = self._doted_enemies

		for _, dot_info in ipairs(slot8) do
			if dot_info.enemy_unit == enemy_unit then
				dot_info.fire_damage_received_time = fire_damage_received_time
				contains = true
			end
		end

		if not contains then
			local dot_info = {
				fire_dot_counter = 0,
				enemy_unit = enemy_unit,
				fire_damage_received_time = fire_damage_received_time,
				weapon_unit = weapon_unit,
				dot_length = dot_length,
				dot_damage = dot_damage
			}
			slot11 = dot_info

			table.insert(slot9, self._doted_enemies)

			slot11 = dot_info

			self._start_enemy_fire_effect(slot9, self)

			slot11 = dot_info

			self.start_burn_body_sound(slot9, self)
		end

		slot11 = fire_damage_received_time

		self.check_achievemnts(slot8, self, enemy_unit)
	end

	return 
end
function FireManager:sync_add_fire_dot(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage)
	if enemy_unit then
		slot8 = TimerManager
		local t = TimerManager.game(slot7).time(slot7)
		slot14 = dot_damage

		self._add_doted_enemy(TimerManager.game(slot7), self, enemy_unit, t, weapon_unit, dot_length)
	end

	return 
end
function FireManager:add_doted_enemy(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage)
	slot13 = dot_damage
	local dot_info = self._add_doted_enemy(slot7, self, enemy_unit, fire_damage_received_time, weapon_unit, dot_length)
	slot9 = managers.network
	slot15 = dot_damage

	managers.network.session(self).send_to_peers_synched(self, managers.network.session(self), "sync_add_doted_enemy", enemy_unit, fire_damage_received_time, weapon_unit, dot_length)

	return 
end
function FireManager:_remove_flame_effects_from_doted_unit(enemy_unit)
	if self._doted_enemies then
		slot4 = self._doted_enemies

		for _, dot_info in ipairs(slot3) do
			if dot_info.fire_effects then
				slot9 = dot_info.fire_effects

				for __, fire_effect_id in ipairs(slot8) do
					slot14 = World
					slot15 = fire_effect_id

					World.effect_manager(slot13).fade_kill(slot13, World.effect_manager(slot13))
				end
			end
		end
	end

	return 
end
function FireManager:start_burn_body_sound(dot_info, delay)
	slot6 = "FireBurnBody"
	local sound_loop_burn_body = SoundDevice.create_source(slot4, SoundDevice)
	slot6 = sound_loop_burn_body
	slot9 = dot_info.enemy_unit

	sound_loop_burn_body.set_position(SoundDevice, dot_info.enemy_unit.position(slot8))

	slot7 = "burn_loop_body"

	sound_loop_burn_body.post_event(SoundDevice, sound_loop_burn_body)

	dot_info.sound_source = sound_loop_burn_body

	if delay then
		slot13 = {
			sound_source = sound_loop_burn_body
		}
		slot11 = TimerManager
		slot11 = TimerManager.game(self)

		managers.enemy.add_delayed_clbk(slot5, managers.enemy, "FireBurnBody", callback(TimerManager.game(self).time(self) + delay, self, self, "_release_sound_source"))
	end

	return 
end
function FireManager:_stop_burn_body_sound(sound_source)
	slot5 = sound_source

	self._release_sound_source(slot3, self)

	return 
end
function FireManager:_release_sound_source(...)
	return 
end
function FireManager:_start_enemy_fire_effect(dot_info)
	local enemy_effect_name = Idstring(slot3)
	local bone_spine = dot_info.enemy_unit.get_object("effects/vanilla/fire/fire_character_burning_001_endless", Idstring(slot7))
	local bone_left_arm = dot_info.enemy_unit.get_object(dot_info.enemy_unit, Idstring("Spine"))
	local bone_right_arm = dot_info.enemy_unit.get_object(dot_info.enemy_unit, Idstring("LeftArm"))
	local bone_left_leg = dot_info.enemy_unit.get_object(dot_info.enemy_unit, Idstring("RightArm"))
	slot9 = dot_info.enemy_unit
	slot12 = "RightLeg"
	local bone_right_leg = dot_info.enemy_unit.get_object(dot_info.enemy_unit, Idstring("LeftLeg"))
	local bone_spine_effect_id, bone_left_arm_effect_id, bone_right_arm_effect_id, bone_left_leg_effect_id, bone_right_leg_effect_id = nil

	if bone_spine then
		slot15 = World
		slot16 = {
			effect = enemy_effect_name,
			parent = bone_spine
		}
		bone_spine_effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
	end

	if bone_left_arm then
		slot15 = World
		slot16 = {
			effect = enemy_effect_name,
			parent = bone_left_arm
		}
		bone_left_arm_effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
	end

	if bone_right_arm then
		slot15 = World
		slot16 = {
			effect = enemy_effect_name,
			parent = bone_right_arm
		}
		bone_right_arm_effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
	end

	if bone_left_leg then
		slot15 = World
		slot16 = {
			effect = enemy_effect_name,
			parent = bone_left_leg
		}
		bone_left_leg_effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
	end

	if bone_right_leg then
		slot15 = World
		slot16 = {
			effect = enemy_effect_name,
			parent = bone_right_leg
		}
		bone_right_leg_effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
	end

	local effects_table = {
		bone_spine_effect_id,
		bone_left_arm_effect_id,
		bone_right_arm_effect_id,
		bone_left_leg_effect_id,
		bone_right_leg_effect_id
	}
	dot_info.fire_effects = effects_table

	return 
end
function FireManager:_damage_fire_dot(dot_info)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.player
		local attacker_unit = managers.player.player_unit(slot3)
		local col_ray = {
			unit = dot_info.enemy_unit
		}
		local damage = dot_info.dot_damage
		local ignite_character = false
		local variant = "fire"
		local weapon_unit = dot_info.weapon_unit
		local is_fire_dot_damage = true
		slot16 = is_fire_dot_damage

		FlameBulletBase.give_fire_damage_dot(slot10, FlameBulletBase, col_ray, weapon_unit, attacker_unit, damage)
	end

	return 
end
function FireManager:give_local_player_dmg(pos, range, damage, ignite_character)
	slot7 = managers.player
	local player = managers.player.player_unit(slot6)

	if player then
		slot8 = player
		slot9 = {
			variant = "fire",
			position = pos,
			range = range,
			damage = damage,
			ignite_character = ignite_character
		}

		player.character_damage(slot7).damage_fire(slot7, player.character_damage(slot7))
	end

	return 
end
function FireManager:detect_and_give_dmg(params)
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
	local push_units = false
	local fire_dot_data = params.fire_dot_data
	local results = {}
	local alert_radius = params.alert_radius or 3000

	if params.push_units ~= nil then
		push_units = params.push_units
	end

	local player = managers.player.player_unit(slot18)
	slot20 = player

	if alive(managers.player) and player_dmg ~= 0 then
		slot20 = player
		slot21 = {
			variant = "fire",
			position = hit_pos,
			range = range,
			damage = player_dmg,
			ignite_character = params.ignite_character
		}

		player.character_damage(slot19).damage_fire(slot19, player.character_damage(slot19))
	end

	slot25 = slotmask
	local bodies = World.find_bodies(slot19, World, "intersect", "sphere", hit_pos, range)
	local alert_unit = user_unit
	slot22 = alert_unit

	if alive("intersect") then
		slot22 = alert_unit

		if alert_unit.base(slot21) then
			slot22 = alert_unit

			if alert_unit.base(slot21).thrower_unit then
				slot22 = alert_unit
				slot22 = alert_unit.base(slot21)
				alert_unit = alert_unit.base(slot21).thrower_unit(slot21)
			end
		end
	end

	slot22 = managers.groupai
	slot23 = {
		"fire",
		hit_pos,
		alert_radius,
		alert_filter,
		alert_unit
	}

	managers.groupai.state(slot21).propagate_alert(slot21, managers.groupai.state(slot21))

	local splinters = {
		mvector3.copy(managers.groupai.state(slot21))
	}
	local dirs = {}
	slot26 = 0
	dirs[1] = Vector3(hit_pos, range, 0)
	slot26 = 0
	dirs[2] = Vector3(hit_pos, -range, 0)
	slot26 = 0
	dirs[3] = Vector3(hit_pos, 0, range)
	slot26 = 0
	dirs[4] = Vector3(hit_pos, 0, -range)
	slot26 = range
	dirs[5] = Vector3(hit_pos, 0, 0)
	slot26 = -range
	dirs[MULTRES] = Vector3(hit_pos, 0, 0)
	local pos = Vector3()
	slot25 = dirs

	for _, dir in ipairs(0) do
		slot31 = dir

		mvector3.set(slot29, pos)

		slot31 = hit_pos

		mvector3.add(slot29, pos)

		local splinter_ray = nil

		if ignore_unit then
			slot38 = slotmask
			splinter_ray = World.raycast(slot30, World, "ray", hit_pos, pos, "ignore_unit", ignore_unit, "slot_mask")
		else
			slot36 = slotmask
			splinter_ray = World.raycast(slot30, World, "ray", hit_pos, pos, "slot_mask")
		end

		slot34 = 10
		pos = ((splinter_ray and splinter_ray.position) or pos) - dir.normalized(slot31) * math.min(dir, (splinter_ray and splinter_ray.distance) or 0)
		local near_splinter = false
		slot32 = splinters

		for _, s_pos in ipairs(math.min(dir, (splinter_ray and splinter_ray.distance) or 0)) do
			slot38 = s_pos

			if mvector3.distance_sq(slot36, pos) < 900 then
				near_splinter = true

				break
			end
		end

		if not near_splinter then
			slot32 = splinters
			slot35 = pos

			table.insert(slot31, mvector3.copy(slot34))
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
	slot35 = bodies

	for _, hit_body in ipairs(slot34) do
		slot40 = hit_body
		slot40 = hit_body.unit(slot39)

		if hit_body.unit(slot39).character_damage(slot39) then
			slot40 = hit_body
			slot40 = hit_body.unit(slot39)
			local character = hit_body.unit(slot39).character_damage(slot39).damage_fire
		end

		slot41 = hit_body

		if hit_body.extension(slot40) then
			slot41 = hit_body
			local apply_dmg = hit_body.extension(slot40).damage
		end

		slot42 = hit_body
		slot43 = hit_body
		units_to_push[hit_body.unit(slot41).key(slot41)] = hit_body.unit(hit_body.unit(slot41))
		local dir, len, damage, ray_hit = nil

		if character then
			slot46 = hit_body
			slot46 = hit_body.unit(slot45)
		end

		if ray_hit then
			slot46 = hit_body
			dir = hit_body.center_of_mass(slot45)
			slot48 = dir
			len = mvector3.direction(slot45, dir, hit_pos)
			damage = dmg

			if apply_dmg then
				slot51 = damage

				self._apply_body_damage(slot45, self, true, hit_body, user_unit, dir)
			end

			slot47 = 1
			damage = math.max(slot45, damage)
			local hit_unit = hit_body.unit(slot45)
			slot47 = hit_unit
			hit_units[hit_unit.key(hit_body)] = hit_unit

			if character then
				slot47 = hit_unit
				slot47 = hit_unit.character_damage(slot46)
				local dead_before = hit_unit.character_damage(slot46).dead(slot46)
				local action_data = {
					variant = "fire",
					damage = damage,
					attacker_unit = user_unit,
					weapon_unit = owner,
					ignite_character = params.ignite_character
				}

				if not self._col_ray then
					slot47 = {
						position = hit_body.position(slot49),
						ray = dir
					}
					slot50 = hit_body
				end

				action_data.col_ray = slot47
				action_data.is_fire_dot_damage = false
				action_data.fire_dot_data = fire_dot_data
				slot49 = TimerManager
				local t = TimerManager.game(slot48).time(slot48)
				slot50 = hit_unit
				slot51 = action_data

				hit_unit.character_damage(TimerManager.game(slot48)).damage_fire(TimerManager.game(slot48), hit_unit.character_damage(TimerManager.game(slot48)))

				if not dead_before then
					slot50 = hit_unit

					if hit_unit.base(slot49) then
						slot50 = hit_unit

						if hit_unit.base(slot49)._tweak_table then
							slot50 = hit_unit
							slot50 = hit_unit.character_damage(slot49)

							if hit_unit.character_damage(slot49).dead(slot49) then
								slot50 = hit_unit
								type = hit_unit.base(slot49)._tweak_table
								slot50 = type

								if CopDamage.is_civilian(slot49) then
									count_civilian_kills = count_civilian_kills + 1
								else
									slot50 = type

									if CopDamage.is_gangster(slot49) then
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
		slot38 = range

		managers.explosion.units_to_push(slot34, managers.explosion, units_to_push, hit_pos)
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
function FireManager:units_to_push(units_to_push, hit_pos, range)
	return 
end
function FireManager:_apply_body_damage(is_server, hit_body, user_unit, dir, damage)
	slot8 = hit_body
	local hit_unit = hit_body.unit(slot7)

	if not is_server then
		slot9 = hit_unit
		local local_damage = hit_unit.id(slot8) == -1
	end

	if is_server then
		slot10 = hit_unit
		local sync_damage = hit_unit.id(slot9) ~= -1
	end

	if not local_damage and not sync_damage then
		slot11 = "_apply_body_damage skipped"

		print(slot10)

		return 
	end

	local normal = dir
	slot13 = 200
	local prop_damage = math.min(slot11, damage)

	if prop_damage < 0.25 then
		slot14 = 0.25
		prop_damage = math.round(slot12, prop_damage)
	end

	if prop_damage == 0 then
	end

	if 0 < prop_damage then
		if not is_server then
			slot13 = hit_unit
			local local_damage = hit_unit.id(slot12) == -1
		end

		if is_server then
			slot14 = hit_unit
			local sync_damage = hit_unit.id(slot13) ~= -1
		end

		slot15 = prop_damage * 163.84
		local network_damage = math.ceil(slot14)
		prop_damage = network_damage / 163.84

		if local_damage then
			slot16 = hit_body
			slot21 = hit_body
			slot21 = prop_damage

			hit_body.extension(slot15).damage.damage_fire(slot15, hit_body.extension(slot15).damage, user_unit, normal, hit_body.position(slot20), dir)

			slot16 = hit_body
			slot21 = hit_body
			slot21 = prop_damage

			hit_body.extension(slot15).damage.damage_damage(slot15, hit_body.extension(slot15).damage, user_unit, normal, hit_body.position(dir), dir)
		end

		if sync_damage then
			slot16 = managers.network

			if managers.network.session(slot15) then
				slot16 = user_unit

				if alive(slot15) then
					slot16 = managers.network
					slot23 = hit_body
					slot26 = network_damage

					managers.network.session(slot15).send_to_peers_synched(slot15, managers.network.session(slot15), "sync_body_damage_fire", hit_body, user_unit, normal, hit_body.position(dir), math.min(slot24, 32768))
				else
					slot16 = managers.network
					slot22 = hit_body
					slot25 = network_damage

					managers.network.session(slot15).send_to_peers_synched(slot15, managers.network.session(slot15), "sync_body_damage_fire_no_attacker", hit_body, normal, hit_body.position(dir), math.min(slot23, 32768))
				end
			end
		end
	end

	return 
end
function FireManager:explode_on_client(position, normal, user_unit, dmg, range, curve_pow, custom_params)
	slot14 = custom_params

	self.play_sound_and_effects(slot9, self, position, normal, range)

	slot16 = curve_pow

	self.client_damage_and_push(slot9, self, position, normal, user_unit, dmg, range)

	return 
end
function FireManager:client_damage_and_push(position, normal, user_unit, dmg, range, curve_pow)
	slot13 = range
	slot17 = "bullet_impact_targets"
	local bodies = World.find_bodies(slot8, World, "intersect", "sphere", position, managers.slot.get_mask(slot15, managers.slot))
	local units_to_push = {}
	slot11 = bodies

	for _, hit_body in ipairs("intersect") do
		local hit_unit = hit_body.unit(slot15)
		slot17 = hit_body

		if hit_body.extension(hit_body) then
			slot17 = hit_body

			if hit_body.extension(slot16).damage then
				slot17 = hit_unit
				local apply_dmg = hit_unit.id(slot16) == -1
			end
		end

		local dir, len, damage = nil

		if apply_dmg then
			slot21 = hit_body
			dir = hit_body.center_of_mass(slot20)
			slot23 = dir
			len = mvector3.direction(slot20, dir, position)
			slot25 = 1
			slot22 = curve_pow
			damage = dmg * math.pow(slot20, math.clamp(position, 1 - len / range, 0))
			slot26 = damage

			self._apply_body_damage(slot20, self, false, hit_body, user_unit, dir)
		end
	end

	slot14 = range

	self.units_to_push(slot10, self, units_to_push, position)

	return 
end
function FireManager:play_sound_and_effects(position, normal, range, custom_params, molotov_damage_effect_table)
	slot12 = custom_params

	self.player_feedback(slot7, self, position, normal, range)

	slot19 = custom_params.sound_event_impact_duration

	self.spawn_sound_and_effects(slot7, self, position, normal, range, custom_params and custom_params.effect, custom_params and custom_params.sound_event, custom_params and custom_params.on_unit, custom_params and custom_params.idstr_decal, custom_params and custom_params.idstr_effect, molotov_damage_effect_table, custom_params.sound_event_burning)

	return 
end
function FireManager:player_feedback(position, normal, range, custom_params)
	return 
end
local decal_ray_from = Vector3()
local decal_ray_to = Vector3()
function FireManager:spawn_sound_and_effects(position, normal, range, effect_name, sound_event, on_unit, idstr_decal, idstr_effect, molotov_damage_effect_table, sound_event_burning, sound_event_impact_duration)
	effect_name = effect_name or "effects/vanilla/fire/fire_molotov_grenade_001"
	local effect_id = nil

	if molotov_damage_effect_table ~= nil then
		if effect_name ~= "none" then
			slot15 = World
			slot16 = {
				effect = Idstring(slot18),
				position = position,
				normal = normal
			}
			slot19 = effect_name
			effect_id = World.effect_manager(slot14).spawn(slot14, World.effect_manager(slot14))
		end

		slot16 = {
			effect_id = effect_id,
			detonation_position = position,
			detonation_normal = normal
		}

		table.insert(slot14, molotov_damage_effect_table)
	end

	slot16 = "world_geometry"
	local slotmask_world_geometry = managers.slot.get_mask(slot14, managers.slot)

	if on_unit then
		slot17 = position

		mvector3.set(slot15, decal_ray_from)

		slot17 = normal

		mvector3.set(slot15, decal_ray_to)

		slot17 = 100

		mvector3.multiply(slot15, decal_ray_to)

		slot17 = decal_ray_to

		mvector3.add(slot15, decal_ray_from)

		slot17 = -2

		mvector3.multiply(slot15, decal_ray_to)

		slot17 = decal_ray_from

		mvector3.add(slot15, decal_ray_to)
	else
		slot17 = position

		mvector3.set(slot15, decal_ray_from)

		slot17 = math.UP

		mvector3.set(slot15, decal_ray_to)

		slot17 = -100

		mvector3.multiply(slot15, decal_ray_to)

		slot17 = decal_ray_from

		mvector3.add(slot15, decal_ray_to)
	end

	slot21 = slotmask_world_geometry
	local ray = World.raycast(slot15, World, "ray", decal_ray_from, decal_ray_to, "slot_mask")
	local sound_switch_name = nil

	if ray then
		slot22 = slotmask_world_geometry
		local material_name, _, _ = World.pick_decal_material(slot17, World, ray.unit, decal_ray_from, decal_ray_to)
		sound_switch_name = material_name ~= empty_idstr and material_name
	end

	if ((effect_name == molotov_effect and molotov_damage_effect_table ~= nil and #molotov_damage_effect_table <= 1) or effect_name ~= molotov_effect) and sound_event ~= "no_sound" then
		slot19 = "MolotovImpact"
		local sound_source = SoundDevice.create_source(slot17, SoundDevice)
		slot20 = position

		sound_source.set_position(SoundDevice, sound_source)

		if sound_switch_name then
			slot20 = "materials"
			slot24 = sound_switch_name

			sound_source.set_switch(slot18, sound_source, managers.game_play_central.material_name(slot22, managers.game_play_central))
		end

		slot20 = sound_event

		sound_source.post_event(slot18, sound_source)

		slot26 = {
			position = position,
			sound_event_impact_duration = sound_event_impact_duration
		}
		slot24 = TimerManager
		slot24 = TimerManager.game(FireManager)

		managers.enemy.add_delayed_clbk(slot18, managers.enemy, "MolotovImpact", callback(slot22, FireManager, FireManager, "_dispose_of_impact_sound"))

		slot26 = {
			sound_source = sound_source
		}
		slot24 = TimerManager
		slot24 = TimerManager.game(GrenadeBase)
		slot22 = TimerManager.game(GrenadeBase).time(GrenadeBase) + sound_event_impact_duration

		managers.enemy.add_delayed_clbk(slot18, managers.enemy, "MolotovImpact", callback(TimerManager.game(FireManager).time(FireManager) + sound_event_impact_duration, GrenadeBase, GrenadeBase, "_dispose_of_sound"))
	end

	slot24 = idstr_effect

	self.project_decal(slot17, self, ray, decal_ray_from, decal_ray_to, on_unit and ray and ray.unit, idstr_decal)

	return 
end
function FireManager:project_decal(ray, from, to, on_unit, idstr_decal, idstr_effect)
	return 
end
function FireManager:_dispose_of_impact_sound(custom_params)
	slot5 = "MolotovBurning"
	local sound_source_burning_loop = SoundDevice.create_source(slot3, SoundDevice)
	slot6 = custom_params.position

	sound_source_burning_loop.set_position(SoundDevice, sound_source_burning_loop)

	slot6 = "burn_loop_body"

	sound_source_burning_loop.post_event(SoundDevice, sound_source_burning_loop)

	local molotov_tweak = tweak_data.projectiles.molotov
	slot13 = {
		sound_source = sound_source_burning_loop
	}
	slot11 = TimerManager
	slot12 = molotov_tweak.burn_duration

	managers.enemy.add_delayed_clbk(sound_source_burning_loop, managers.enemy, "MolotovBurning", callback((TimerManager.game(GrenadeBase).time(GrenadeBase) + tonumber(TimerManager.game(GrenadeBase))) - custom_params.sound_event_impact_duration, GrenadeBase, GrenadeBase, "_dispose_of_sound"))

	return 
end
function FireManager:on_simulation_ended()
	self._enemies_on_fire = {}
	self._dozers_on_fire = {}
	self._flamethrower_fire_patches = {}

	return 
end

return 
