-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
DOTManager = DOTManager or class()
local tmp_vec3 = Vector3()
function DOTManager:init()
	self._doted_enemies = {}
	self._dot_grace_period = 0.25

	return 
end
function DOTManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]

		if dot_info.dot_damage_received_time + self._dot_grace_period < t and 0.5 <= dot_info.dot_counter then
			slot11 = dot_info

			self._damage_dot(slot9, self)

			dot_info.dot_counter = 0
		end

		if dot_info.dot_damage_received_time + dot_info.dot_length < t then
			slot11 = index

			table.remove(slot9, self._doted_enemies)
		else
			dot_info.dot_counter = dot_info.dot_counter + dt
		end
	end

	return 
end
function DOTManager:add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation, variant)
	slot17 = variant
	local dot_info = self._add_doted_enemy(slot9, self, enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation)

	return 
end
function DOTManager:sync_add_dot_damage(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage)
	if enemy_unit then
		slot8 = TimerManager
		local t = TimerManager.game(slot7).time(slot7)
		slot14 = dot_damage

		self._add_doted_enemy(TimerManager.game(slot7), self, enemy_unit, t, weapon_unit, dot_length)
	end

	return 
end
function DOTManager:_add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation, variant)
	local contains = false

	if self._doted_enemies then
		slot11 = self._doted_enemies

		for _, dot_info in ipairs(slot10) do
			if dot_info.enemy_unit == enemy_unit then
				if dot_info.dot_damage_received_time + dot_info.dot_length < dot_damage_received_time + dot_length then
					dot_info.dot_damage_received_time = dot_damage_received_time
					dot_info.dot_length = dot_length
				end

				dot_info.hurt_animation = dot_info.hurt_animation or hurt_animation
				contains = true
			end
		end

		if not contains then
			local dot_info = {
				dot_counter = 0,
				enemy_unit = enemy_unit,
				dot_damage_received_time = dot_damage_received_time,
				weapon_unit = weapon_unit,
				dot_length = dot_length,
				dot_damage = dot_damage,
				hurt_animation = hurt_animation,
				variant = variant
			}
			slot13 = dot_info

			table.insert(slot11, self._doted_enemies)

			slot14 = dot_damage_received_time

			self.check_achievemnts(slot11, self, enemy_unit)
		end
	end

	return 
end
function DOTManager:check_achievemnts(unit, t)

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

	local dotted_enemies_by_variant = {}
	slot6 = self._doted_enemies

	for _, data in ipairs(slot5) do
		dotted_enemies_by_variant[data.variant] = dotted_enemies_by_variant[data.variant] or {}
		slot12 = data

		table.insert(dotted_enemies_by_variant[data.variant] or , dotted_enemies_by_variant[data.variant])
	end

	return 
end
function DOTManager:_damage_dot(dot_info)
	slot4 = managers.player
	local attacker_unit = managers.player.player_unit(slot3)
	local col_ray = {
		unit = dot_info.enemy_unit
	}
	local damage = dot_info.dot_damage
	local ignite_character = false
	local weapon_unit = dot_info.weapon_unit

	if dot_info.variant and dot_info.variant == "poison" then
		slot14 = dot_info.hurt_animation

		PoisonBulletBase.give_damage_dot(slot8, PoisonBulletBase, col_ray, weapon_unit, attacker_unit, damage)
	end

	return 
end
function DOTManager:create_dot_data(type, custom_data)
	slot8 = type
	local dot_data = deep_clone(tweak_data.get_dot_type_data(slot6, tweak_data))

	if custom_data then
		dot_data.dot_length = custom_data.dot_length or dot_data.dot_length
		dot_data.hurt_animation_chance = custom_data.hurt_animation_chance or dot_data.hurt_animation_chance
	end

	return dot_data
end
function DOTManager:on_simulation_ended()
	self._doted_enemies = {}

	return 
end

return 
