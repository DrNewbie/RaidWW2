-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MolotovGrenade then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

MolotovGrenade = slot0
function MolotovGrenade:destroy(unit)
	slot4 = self._molotov_damage_effect_table

	for _, damage_effect_entry in pairs(slot3) do
		slot9 = World
		slot10 = damage_effect_entry.effect_id

		World.effect_manager(slot8).fade_kill(slot8, World.effect_manager(slot8))
	end

	return 
end
function MolotovGrenade:_setup_from_tweak_data()
	local grenade_entry = self.tweak_data or "molotov"
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._init_timer = self._tweak_data.init_timer or 10
	self._mass_look_up_modifier = self._tweak_data.mass_look_up_modifier
	self._range = self._tweak_data.range
	self._effect_name = "effects/vanilla/fire/fire_molotov_grenade_001"
	self._curve_pow = self._tweak_data.curve_pow or 3
	self._damage = self._tweak_data.damage
	self._player_damage = self._tweak_data.player_damage
	self._alert_radius = self._tweak_data.alert_radius
	self._fire_alert_radius = self._tweak_data.fire_alert_radius
	self._fire_dot_data = self._tweak_data.fire_dot_data
	local sound_event = self._tweak_data.sound_event or "grenade_explode"
	local sound_event_burning = self._tweak_data.sound_event_burning or "burn_loop_gen"
	local sound_event_impact_duration = self._tweak_data.sound_event_impact_duration or 1
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = self._range * 2,
		sound_event_burning = sound_event_burning,
		sound_event_impact_duration = sound_event_impact_duration
	}
	self._burn_duration = self._tweak_data.burn_duration
	self._burn_tick_temp_counter = 0
	self._burn_tick_period = self._tweak_data.burn_tick_period
	self._detonated = false
	self._detonated_position = nil
	self._molotov_damage_effect_table = {}
	self._initial_damage_done = false
	self._damaged_bodies = {}
	self._last_position = nil

	return 
end
function MolotovGrenade:update(unit, t, dt)
	if self._hand_held then
		return 
	end

	slot9 = dt

	MolotovGrenade.super.update(slot5, self, unit, t)

	if self._detonated == true and 0 < self._burn_duration then
		self._burn_duration = self._burn_duration - dt
		self._burn_tick_temp_counter = self._burn_tick_temp_counter + dt
		slot6 = self._molotov_damage_effect_table

		for _, damage_effect_entry in pairs(slot5) do
			slot11 = damage_effect_entry.body
			local effect_body_alive = alive(slot10)

			if damage_effect_entry.body ~= nil and effect_body_alive == true then
				slot14 = damage_effect_entry.body
				slot13 = damage_effect_entry.effect_initial_position
				local distance = mvector3.distance(slot11, damage_effect_entry.body.position(slot13))

				if distance ~= nil and 0.1 <= distance then
					local pos_diff = damage_effect_entry.body.position(slot12)
					slot15 = damage_effect_entry.body_initial_position

					mvector3.subtract(damage_effect_entry.body, pos_diff)

					local effect_new_location = damage_effect_entry.effect_initial_position + pos_diff
					damage_effect_entry.effect_current_position = effect_new_location
					slot15 = World
					slot17 = effect_new_location

					World.effect_manager(pos_diff).move(pos_diff, World.effect_manager(pos_diff), damage_effect_entry.effect_id)
				end
			end
		end

		if self._burn_tick_period <= self._burn_tick_temp_counter or self._initial_damage_done == false then
			slot6 = self

			self._do_damage(slot5)

			self._initial_damage_done = true
		end
	else
		slot6 = unit
		self._last_position = unit.position(slot5)
	end

	if self._burn_duration <= 0 then
		slot6 = Network

		if Network.is_server(slot5) then
			slot7 = 0

			self._unit.set_slot(slot5, self._unit)
		end

		self._detonated = false
	end

	return 
end
function MolotovGrenade:_do_damage()
	local pos = self._detonated_position
	local normal = math.UP
	local range = self._range
	slot7 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot5, managers.slot)
	local player_in_range = false
	local player_in_range_count = 0

	if self._molotov_damage_effect_table then
		local collision_safety_distance = Vector3(slot8, 0, 0)
		local effect_position = nil
		local player_damage_range = range
		slot12 = self._molotov_damage_effect_table

		for _, damage_effect_entry in pairs(5) do
			if damage_effect_entry.body ~= nil then
				effect_position = damage_effect_entry.effect_current_position + collision_safety_distance
				local damage_range = range

				if _ == 1 then
					damage_range = range * 1.5
				end

				slot18 = managers.player

				if managers.player.player_unit(slot17) then
					slot18 = damage_effect_entry.effect_current_position
					slot21 = managers.player
					slot21 = managers.player.player_unit(slot20)
					local player_distance = mvector3.distance(slot17, managers.player.player_unit(slot20).position(slot20))

					if player_distance <= damage_range and player_in_range == false then
						slot24 = managers.player
						slot27 = 30
						local raycast = World.raycast(slot18, World, "ray", effect_position, managers.player.player_unit(slot23).position(slot23) + Vector3(managers.player.player_unit(slot23), 0, 0), "slot_mask")
						slot25 = managers.player
						slot28 = 0
						slot25 = slot_mask
						local raycast2 = World.raycast(World, World, "ray", effect_position, managers.player.player_unit(slot_mask).position(slot_mask) + Vector3(managers.player.player_unit(slot_mask), 0, 0), "slot_mask")

						if raycast == nil or raycast2 == nil then
							player_in_range = true
							player_in_range_count = player_in_range_count + 1
							pos = damage_effect_entry.effect_current_position
							player_damage_range = damage_range
						end
					end
				end

				slot18 = Network

				if Network.is_server(slot17) then
					slot19 = {
						player_damage = 0,
						push_units = false,
						hit_pos = effect_position,
						range = damage_range,
						collision_slotmask = slot_mask,
						curve_pow = self._curve_pow,
						damage = self._damage,
						ignore_unit = self._unit,
						user = self._unit,
						alert_radius = self._fire_alert_radius,
						fire_dot_data = self._fire_dot_data
					}
					slot16, slot17 = managers.fire.detect_and_give_dmg(slot17, managers.fire)
				end
			end
		end

		if player_in_range == true then
			slot15 = self._player_damage

			managers.fire.give_local_player_dmg(slot11, managers.fire, pos, player_damage_range)
		end
	end

	self._damaged_bodies = {}
	self._burn_tick_temp_counter = 0

	return 
end
function MolotovGrenade:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)
	slot14 = normal

	self._detonate(slot12, self)

	return 
end
function MolotovGrenade:detonate(normal)

	-- Decompilation error in this vicinity:
	slot5 = {
		range = 250,
		curve_pow = 0.1,
		damage = 3,
		player_damage = 0,
		push_units = false,
		hit_pos = self._unit.position(slot7),
		collision_slotmask = managers.slot.get_mask(slot7, managers.slot),
		alert_radius = self._alert_radius,
		ignore_unit = managers.player.player_unit(slot7),
		user = self._unit
	}
	slot8 = self._unit
	slot9 = "explosion_targets"

	managers.explosion.detect_and_give_dmg(slot3, managers.explosion)

	slot4 = self._unit
	self._detonated_position = self._unit.position(slot3)
	local position = self._detonated_position
	local range = self._range
	local single_effect_radius = range
	slot10 = 2
	slot11 = 2
	slot7 = math.pow(managers.player, single_effect_radius * 2) - math.pow(single_effect_radius * 2, single_effect_radius)
	local diagonal_distance = math.sqrt(self._unit)
	local raycast = nil
	slot10 = "molotov_raycasts"
	local slotmask = managers.slot.get_mask(math.pow(single_effect_radius * 2, single_effect_radius), managers.slot)
	local vector, effect_id = nil
	slot14 = -normal.x - normal.y
	local tangent = Vector3(slot11, normal.z, normal.z)

	if tangent.x == 0 and tangent.y == 0 and tangent.z == 0 then
		slot15 = normal.x
		tangent = Vector3(slot12, -normal.y - normal.z, normal.x)
	end

	mvector3.normalize(slot12)

	local offset = tangent
	slot15 = single_effect_radius * 2

	mvector3.multiply(tangent, offset)

	local rotation = Rotation()
	slot17 = 60

	mrotation.set_axis_angle(offset, rotation, normal)

	slot17 = 0
	vector = position + Vector3(offset, 0, 0)
	slot20 = slotmask
	raycast = World.raycast(offset, World, "ray", position, vector, "slot_mask")
	local ray_cast2, fake_ball_main = nil

	if raycast == nil then
		slot19 = -150
		local vector21 = vector + Vector3(slot16, 0, 0)
		slot24 = 20
		slot23 = slotmask
		raycast = World.raycast(0, World, "ray", vector + Vector3(slot21, 0, 0), vector21, "slot_mask")

		if raycast == nil then
			local vector41 = vector21 - 50 * normal
			slot24 = slotmask
			raycast = World.raycast(slot18, World, "ray", vector21 + 20 * normal, vector41, "slot_mask")

			if raycast ~= nil then
				slot24 = self._molotov_damage_effect_table

				managers.fire.play_sound_and_effects(slot18, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

				ray_cast2 = raycast
			else
				slot21 = -1500
				local vector31 = vector + Vector3(slot18, 0, 0)
				slot26 = 20
				slot25 = slotmask
				raycast = World.raycast(0, World, "ray", vector + Vector3(slot23, 0, 0), vector31, "slot_mask")

				if raycast ~= nil then
					slot25 = self._molotov_damage_effect_table

					managers.fire.play_sound_and_effects(slot19, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

					ray_cast2 = raycast
				end
			end
		else
			slot23 = self._molotov_damage_effect_table

			managers.fire.play_sound_and_effects(slot17, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

			ray_cast2 = raycast
		end

		if ray_cast2 ~= nil then
			self._molotov_damage_effect_table[1].body = ray_cast2.body
			slot19 = ray_cast2.body
			self._molotov_damage_effect_table[1].body_initial_position = ray_cast2.body.position(slot18)
			slot19 = ray_cast2.body
			self._molotov_damage_effect_table[1].body_initial_rotation = ray_cast2.body.rotation(slot18)
			self._molotov_damage_effect_table[1].effect_initial_position = ray_cast2.position
			self._molotov_damage_effect_table[1].effect_initial_normal = ray_cast2.normal
		end
	end

	for i = 1, 6, 1 do
		vector = position + offset
		slot26 = slotmask
		raycast = World.raycast(slot20, World, "ray", position, vector, "slot_mask")
		local ray_cast, fake_ball_outline = nil

		if raycast == nil then
			slot25 = -150
			local vector2 = vector + Vector3(slot22, 0, 0)
			slot30 = 20
			slot29 = slotmask
			raycast = World.raycast(0, World, "ray", vector + Vector3(slot27, 0, 0), vector2, "slot_mask")

			if raycast == nil then
				local vector4 = vector2 - 50 * normal
				slot30 = slotmask
				raycast = World.raycast(slot24, World, "ray", vector2 + 20 * normal, vector4, "slot_mask")

				if raycast ~= nil then
					slot30 = self._molotov_damage_effect_table

					managers.fire.play_sound_and_effects(slot24, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

					ray_cast = raycast
				else
					slot27 = -1500
					local vector3 = vector + Vector3(slot24, 0, 0)
					slot32 = 20
					slot31 = slotmask
					raycast = World.raycast(0, World, "ray", vector + Vector3(slot29, 0, 0), vector3, "slot_mask")

					if raycast ~= nil then
						slot31 = self._molotov_damage_effect_table

						managers.fire.play_sound_and_effects(slot25, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

						ray_cast = raycast
					end
				end
			else
				slot29 = self._molotov_damage_effect_table

				managers.fire.play_sound_and_effects(slot23, managers.fire, raycast.position, raycast.normal, range, self._custom_params)

				ray_cast = raycast
			end

			if ray_cast ~= nil then
				local tableSize = #self._molotov_damage_effect_table
				self._molotov_damage_effect_table[tableSize].body = ray_cast.body
				slot26 = ray_cast.body
				self._molotov_damage_effect_table[tableSize].body_initial_position = ray_cast.body.position(slot25)
				slot26 = ray_cast.body
				self._molotov_damage_effect_table[tableSize].body_initial_rotation = ray_cast.body.rotation(slot25)
				self._molotov_damage_effect_table[tableSize].effect_initial_position = ray_cast.position
				self._molotov_damage_effect_table[tableSize].effect_initial_normal = ray_cast.normal
			end
		else
			slot24 = nil

			table.insert(slot22, self._molotov_damage_effect_table)
		end

		slot24 = rotation

		mvector3.rotate_with(slot22, offset)
	end

	self._detonated = true
	slot17 = self._unit
	slot18 = "disable"

	self._unit.damage(slot16).run_sequence_simple(slot16, self._unit.damage(slot16))

	slot18 = false

	self._unit.set_visible(slot16, self._unit)

	return 
end
function MolotovGrenade:_detonate(normal)
	if self._detonated == false then
		slot5 = normal

		self.detonate(slot3, self)

		slot4 = managers.network
		slot9 = normal

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_detonate_molotov_grenade", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	end

	return 
end
function MolotovGrenade:sync_detonate_molotov_grenade(event_id, normal)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		slot6 = normal

		self._detonate_on_client(slot4, self)
	end

	return 
end
function MolotovGrenade:_detonate_on_client(normal)
	if self._detonated == false then
		slot5 = normal

		self.detonate(slot3, self)
	end

	return 
end
function MolotovGrenade:_detonate_on_client_OLD(normal)
	if self._detonated == false then
		slot4 = self._unit
		self._detonated_position = self._unit.position(slot3)
		local pos = self._detonated_position
		local range = self._range
		slot7 = "explosion_targets"
		local slot_mask = managers.slot.get_mask(slot5, managers.slot)
		slot11 = self._custom_params

		managers.fire.play_sound_and_effects(managers.slot, managers.fire, pos, normal, range)

		self._detonated = true
		slot8 = false

		self._unit.set_visible(managers.slot, self._unit)
	end

	return 
end
function MolotovGrenade:bullet_hit()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	self._timer = nil
	slot3 = self

	self._detonate(slot2)

	return 
end
function MolotovGrenade:add_damage_result(unit, is_dead, damage_percent)

	-- Decompilation error in this vicinity:
	slot6 = self._thrower_unit
	local unit_type = unit.base(slot5)._tweak_table
	slot7 = unit
	local is_civlian = unit.character_damage(unit).is_civilian(unit)
	slot8 = unit
	local is_gangster = unit.character_damage(unit_type).is_gangster(unit_type)
	slot9 = unit
	slot9 = unit_type
	local is_cop = unit.character_damage(unit_type).is_cop(unit_type)

	if is_civlian then
		return 
	end

	if is_dead then
		slot15 = 1

		self._check_achievements(slot9, self, unit, is_dead, damage_percent, 1)
	end

	return 
end

return 
