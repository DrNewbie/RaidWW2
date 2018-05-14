-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
GreedManager = GreedManager or class()
GreedManager.VERSION = 1
GreedManager.get_instance = function ()
	if not Global.greed_manager then
		slot3 = GreedManager
		Global.greed_manager = GreedManager.new(slot2)
	end

	slot3 = GreedManager

	setmetatable(slot1, Global.greed_manager)

	return Global.greed_manager
end
GreedManager.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
GreedManager.reset = function (self)
	self._registered_greed_items = {}
	self._registered_greed_cache_items = {}
	self._current_loot_counter = 0
	self._mission_loot_counter = 0
	self._gold_awarded_in_mission = 0
	self._active_greed_items = {}

	return 
end
GreedManager.register_greed_item = function (self, unit, tweak_table, world_id)
	self._registered_greed_items[world_id] = self._registered_greed_items[world_id] or {}
	local item_tweak_data = tweak_data.greed.greed_items[tweak_table]
	local greed_item_data = {
		unit = unit,
		value = item_tweak_data.value,
		world_id = world_id
	}
	slot9 = greed_item_data

	table.insert(slot7, self._registered_greed_items[world_id])

	return 
end
GreedManager.register_greed_cache_item = function (self, unit, world_id)
	self._registered_greed_cache_items[world_id] = self._registered_greed_cache_items[world_id] or {}
	local greed_cache_item_data = {
		unit = unit,
		world_id = world_id
	}
	slot7 = greed_cache_item_data

	table.insert(slot5, self._registered_greed_cache_items[world_id])

	return 
end
GreedManager.plant_greed_items_on_level = function (self, world_id)

	-- Decompilation error in this vicinity:
	slot4 = Network
	slot4 = managers.raid_job
	local job_data = managers.raid_job.current_job(slot3)
	local total_value = tweak_data.greed.points_spawned_on_level_default
	local job_id = job_data and job_data.job_id

	if job_data and job_data.greed_items then
		slot8 = job_data.greed_items.max
		total_value = math.random(slot6, job_data.greed_items.min)
	end

	local difficulty = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY
	slot9 = difficulty
	local current_difficulty = tweak_data.difficulty_to_index(slot7, tweak_data)
	total_value = total_value * tweak_data.greed.difficulty_level_point_multipliers[current_difficulty]
	self._greed_items_spawned_value = 0
	self._registered_greed_items[world_id] = self._registered_greed_items[world_id] or {}
	self._active_greed_items = {}

	if #self._registered_greed_items[world_id] == 0 then
		slot13 = job_id
		slot10 = "Job id: " .. tostring(world_id)

		print(slot8, "[GreedManager][plant_greed_items_on_level] No greed units registered on the level! Not spawning anything. World id: " .. tostring(slot11))

		return 
	end

	slot9 = self._registered_greed_items[world_id]

	math.shuffle(slot8)

	slot9 = self._registered_greed_items[world_id]

	for _, greed_item in ipairs(slot8) do
		slot14 = greed_item.unit

		if not alive(slot13) then
			greed_item.deleted = true
		else
			local should_remove_greed_item = total_value <= self._greed_items_spawned_value

			if should_remove_greed_item then
				slot16 = 0

				greed_item.unit.set_slot(slot14, greed_item.unit)

				greed_item.deleted = true
			else
				self._greed_items_spawned_value = self._greed_items_spawned_value + greed_item.value
				slot16 = greed_item.unit

				table.insert(greed_item.value, self._active_greed_items)
			end
		end
	end

	self._registered_greed_cache_items[world_id] = self._registered_greed_cache_items[world_id] or {}
	local cache_spawn_chance = tweak_data.greed.cache_base_spawn_chance
	cache_spawn_chance = cache_spawn_chance * tweak_data.greed.difficulty_cache_chance_multipliers[current_difficulty]
	local chosen_cache_unit = nil

	if 0 < #self._registered_greed_cache_items[world_id] then
		slot14 = 1

		if math.random() <= math.clamp(slot11, cache_spawn_chance, -1) then
			slot11 = self._registered_greed_cache_items[world_id]

			math.shuffle(slot10)

			chosen_cache_unit = self._registered_greed_cache_items[world_id][1].unit
			slot14 = chosen_cache_unit
			slot11 = "[GreedManager][plant_greed_items_on_level] A cache item will be spawned! Unit: " .. tostring(slot13)

			print(slot10)
		end
	end

	slot11 = self._registered_greed_cache_items[world_id]

	for index, cache_item in pairs(slot10) do
		slot16 = cache_item.unit

		if alive(slot15) and cache_item.unit ~= chosen_cache_unit then
			slot17 = 0

			cache_item.unit.set_slot(slot15, cache_item.unit)

			cache_item.deleted = true
		end
	end

	if self._greed_items_spawned_value < total_value then
		slot13 = total_value

		print(slot10, "[GreedManager][plant_loot_on_level] All greed units on level used, level greed cap still not reached (curr_value, total_value):", self._greed_items_spawned_value)
	else
		slot12 = self._greed_items_spawned_value

		print(slot10, "[GreedManager][plant_loot_on_level] Greed value placed on level:")
	end

	return 
end
GreedManager.remove_greed_items_from_level = function (self, world_id)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	self._registered_greed_items[world_id] = self._registered_greed_items[world_id] or {}
	slot4 = self._registered_greed_items[world_id]

	for _, greed_item_data in ipairs(slot3) do
		slot10 = 0

		greed_item_data.unit.set_slot(slot8, greed_item_data.unit)

		greed_item_data.deleted = true
	end

	self._registered_greed_items[world_id] = {}
	self._active_greed_items = {}
	self._registered_greed_cache_items[world_id] = self._registered_greed_cache_items[world_id] or {}
	slot4 = self._registered_greed_cache_items[world_id]

	for _, greed_item_data in ipairs(slot3) do
		slot10 = 0

		greed_item_data.unit.set_slot(slot8, greed_item_data.unit)

		greed_item_data.deleted = true
	end

	self._registered_greed_cache_items[world_id] = {}

	return 
end
GreedManager.pickup_greed_item = function (self, value, unit)
	slot6 = value

	self.on_loot_picked_up(slot4, self)

	for i = #self._active_greed_items, 1, -1 do
		if self._active_greed_items[i] == unit then
			slot10 = i

			table.remove(slot8, self._active_greed_items)

			break
		end
	end

	return 
end
GreedManager.pickup_cache_loot = function (self, value)
	slot5 = value

	self.on_loot_picked_up(slot3, self)

	return 
end
GreedManager.on_loot_picked_up = function (self, value)
	self._mission_loot_counter = self._mission_loot_counter + value
	local acquired_new_goldbar = tweak_data.greed.points_needed_for_gold_bar <= (self._current_loot_counter + self._mission_loot_counter) - self._gold_awarded_in_mission * tweak_data.greed.points_needed_for_gold_bar

	if acquired_new_goldbar then
		self._gold_awarded_in_mission = self._gold_awarded_in_mission + 1
	end

	slot7 = self._current_loot_counter + self._mission_loot_counter

	managers.hud.on_greed_loot_picked_up(slot4, managers.hud, (self._current_loot_counter + self._mission_loot_counter) - value)

	return 
end
GreedManager.current_loot_counter = function (self)
	return self._current_loot_counter
end
GreedManager.loot_needed_for_gold_bar = function (self)
	return tweak_data.greed.points_needed_for_gold_bar
end
GreedManager.on_level_exited = function (self, success)
	self._registered_greed_items = {}
	self._registered_greed_cache_items = {}
	self._greed_items_spawned_value = 0
	self._cache_current = self._current_loot_counter
	self._cache_mission = self._mission_loot_counter

	if not success then
		self._gold_awarded_in_mission = 0
	else
		self._current_loot_counter = (self._current_loot_counter + self._mission_loot_counter) - self._gold_awarded_in_mission * tweak_data.greed.points_needed_for_gold_bar
	end

	self._mission_loot_counter = 0

	if managers.hud then
		slot4 = managers.hud

		managers.hud.reset_greed_indicators(slot3)
	end

	return 
end
GreedManager.cache = function (self)
	return self._cache_current, self._cache_mission
end
GreedManager.clear_cache = function (self)
	self._cache_current = nil
	self._cache_mission = nil

	return 
end
GreedManager.acquired_gold_in_mission = function (self)
	return 0 < self._gold_awarded_in_mission
end
GreedManager.award_gold_picked_up_in_mission = function (self)
	slot4 = self._gold_awarded_in_mission

	managers.gold_economy.add_gold(slot2, managers.gold_economy)

	self._gold_awarded_in_mission = 0

	return 
end
GreedManager.save_profile_slot = function (self, data)
	local state = {
		version = GreedManager.VERSION,
		current_loot_counter = self._current_loot_counter
	}
	data.GreedManager = state

	return 
end
GreedManager.load_profile_slot = function (self, data, version)
	local state = data.GreedManager

	if not state then
		return 
	end

	if state.version and state.version ~= GreedManager.VERSION then
		slot6 = self

		self.reset(slot5)

		return 
	end

	self._current_loot_counter = state.current_loot_counter

	return 
end

return 
