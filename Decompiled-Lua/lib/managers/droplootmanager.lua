DropLootManager = DropLootManager or class()
DropLootManager.DROPED_LOOT_DESPAWN_TIME = 120
function DropLootManager:init()
	self._enabled = true
	self._spawned_units = {}

	return 
end
function DropLootManager:_choose_item(current_level_table, level, multiplier)
	local chance = math.random()
	local chance_interval = {
		upper = 0,
		lower = 0
	}
	slot8 = current_level_table

	for u_key, u_data in pairs(slot7) do
		local drop_rate = u_data.drop_rate / 100

		if multiplier ~= nil then
			drop_rate = drop_rate * multiplier
		end

		slot15 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_CHANCE_HEALTH

		if managers.buff_effect.is_effect_active(slot13, managers.buff_effect) and u_key == "health" then
			slot15 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_CHANCE_HEALTH
			drop_rate = drop_rate * managers.buff_effect.get_effect_value(slot13, managers.buff_effect)
		else
			slot15 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_CHANCE_AMMO

			if managers.buff_effect.is_effect_active(slot13, managers.buff_effect) and u_key == "ammo" then
				slot15 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_CHANCE_AMMO
				drop_rate = drop_rate * managers.buff_effect.get_effect_value(slot13, managers.buff_effect)
			else
				slot15 = BuffEffectManager.EFFECT_ONLY_MELEE_AVAILABLE

				if managers.buff_effect.is_effect_active(slot13, managers.buff_effect) and (u_key == "ammo" or u_key == "grenade") then
					drop_rate = 0
				end
			end
		end

		chance_interval.upper = chance_interval.upper + drop_rate

		if chance_interval.lower < chance and chance <= chance_interval.upper then
			if u_data.subtypes == nil then
				return u_data.unit
			else
				slot16 = level + 1

				return self._choose_item(slot13, self, u_data.subtypes)
			end
		end

		chance_interval.lower = chance_interval.upper
	end

	return 
end
function DropLootManager:drop_item(tweak_table, position, rotation)
	if not self._enabled then
		return nil
	end

	slot6 = Network

	if not Network.is_server(slot5) then
		slot6 = managers.network
		slot14 = rotation

		managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "spawn_loot", tweak_table, position, rotation.yaw(rotation.pitch(rotation)), rotation.roll(rotation))

		return 
	end

	if self._difficulty_index == nil then
		slot7 = Global.game_settings.difficulty
		self._difficulty_index = tweak_data.difficulty_to_index(slot5, tweak_data)
	end

	local loot_tweak = tweak_table or "demo_tier"
	local drop_loot_multiplier = 1

	if tweak_data.drop_loot[loot_tweak].difficulty_multipliers ~= nil then
		drop_loot_multiplier = tweak_data.drop_loot[loot_tweak].difficulty_multipliers[self._difficulty_index]
	end

	if tweak_data.drop_loot[loot_tweak].buff_effects_applied then
		slot8 = tweak_data.drop_loot[loot_tweak].buff_effects_applied

		for effect, value in pairs(slot7) do
			slot14 = effect

			if managers.buff_effect.is_effect_active(slot12, managers.buff_effect) then
				slot14 = effect
				drop_loot_multiplier = drop_loot_multiplier * (managers.buff_effect.get_effect_value(slot12, managers.buff_effect) or 1)
			end
		end
	end

	slot11 = drop_loot_multiplier
	local item = self._choose_item(slot7, self, tweak_data.drop_loot[loot_tweak].units, 1)

	if item then
		slot10 = {
			name = item,
			position = position,
			rotation = rotation
		}
		local spawned_unit = managers.game_play_central.spawn_pickup(slot8, managers.game_play_central)
		slot11 = spawned_unit

		table.insert(managers.game_play_central, self._spawned_units)

		return spawned_unit
	end

	return nil
end
function DropLootManager:clear()
	self._spawned_units = {}

	return 
end
function DropLootManager:set_enabled(enabled)
	self._enabled = enabled

	return 
end
function DropLootManager:on_simulation_ended()
	self._difficulty_index = nil

	return 
end
function DropLootManager:despawn_item(unit)
	slot4 = self._spawned_units

	for index, spawned_unit in pairs(slot3) do
		slot9 = spawned_unit

		if alive(slot8) and unit == spawned_unit then
			slot10 = 0

			spawned_unit.set_slot(slot8, spawned_unit)

			slot10 = index

			table.remove(slot8, self._spawned_units)
		end
	end

	return 
end

return 
