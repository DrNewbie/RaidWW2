-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
LootDropManager = LootDropManager or class()
LootDropManager.EVENT_PEER_LOOT_RECEIVED = "peer_loot_received"
LootDropManager.LOOT_VALUE_TYPE_SMALL = "small"
LootDropManager.LOOT_VALUE_TYPE_MEDIUM = "medium"
LootDropManager.LOOT_VALUE_TYPE_BIG = "big"
function LootDropManager:init()
	slot3 = self

	self._setup(slot2)

	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	self._loot_for_peers = {}
	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_OUT
	}
	slot10 = "player_droped_out"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "loot_drop_manager_drop_out", callback(slot7, self, self))

	slot3 = self

	self.reset_loot_value_counters(slot2)

	return 
end
function LootDropManager:_call_listeners(event, params)
	slot7 = params

	self._listener_holder.call(slot4, self._listener_holder, event)

	return 
end
function LootDropManager:add_listener(key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function LootDropManager:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function LootDropManager:player_droped_out(params)
	local peer_id = params._id
	slot5 = self._loot_for_peers

	for i, drop in ipairs(slot4) do
		if drop.peer_id == peer_id then
			slot11 = i

			table.remove(slot9, self._loot_for_peers)

			break
		end
	end

	return 
end
function LootDropManager:_setup()
	if not Global.lootdrop_manager then
		Global.lootdrop_manager = {}
	end

	self._global = Global.lootdrop_manager

	return 
end
function LootDropManager:produce_consumable_mission_drop()
	local gold_bars_earned = 0
	slot4 = managers.loot
	local loot_secured = managers.loot.get_secured(slot3)

	while loot_secured do
		local loot_tweak_data = tweak_data.carry[loot_secured.carry_id]

		if loot_tweak_data and loot_tweak_data.value_in_gold then
			gold_bars_earned = gold_bars_earned + loot_tweak_data.value_in_gold
		end

		slot6 = managers.loot
		loot_secured = managers.loot.get_secured(slot5)
	end

	local drop = {
		reward_type = LootDropTweakData.REWARD_GOLD_BARS,
		gold_bars_min = gold_bars_earned,
		gold_bars_max = gold_bars_earned
	}

	return drop
end
function LootDropManager:produce_loot_drop(loot_value, use_reroll_drop_tables, forced_loot_group)
	slot9 = forced_loot_group
	local loot_group = self._get_loot_group(slot5, self, loot_value, use_reroll_drop_tables)
	slot8 = loot_group
	local loot_category = self.get_random_item_weighted(self, self)
	slot9 = loot_category
	local loot = self.get_random_item_weighted(self, self)

	return loot
end
function LootDropManager:_get_loot_group(loot_value, use_reroll_drop_tables, forced_loot_group)
	local loot_group = nil
	local data_source = tweak_data.lootdrop.loot_groups

	if forced_loot_group then
		return data_source[forced_loot_group]
	end

	if use_reroll_drop_tables then
		data_source = tweak_data.lootdrop.loot_groups_doubles_fallback
	end

	slot8 = data_source

	for _, group in pairs(slot7) do
		if group.min_loot_value < loot_value and loot_value <= group.max_loot_value then
			loot_group = group

			break
		end
	end

	return loot_group
end
function LootDropManager:get_random_item_weighted(collection)
	local total = 0
	slot5 = collection

	for _, item_entry in ipairs(slot4) do
		total = total + item_entry.chance
	end

	local item = nil
	local value = math.rand(slot5)
	slot7 = collection

	for _, item_entry in ipairs(total) do
		value = value - item_entry.chance

		if value <= 0 then
			item = item_entry.value

			break
		end
	end

	return item
end
function LootDropManager:_get_random_item(collection)
	local num_items = #collection
	slot5 = #collection
	local index = math.random(slot4)
	local item = collection[index]

	return item
end
function LootDropManager:get_dropped_loot()
	return self._dropped_loot
end
function LootDropManager:give_loot_to_player(loot_value, use_reroll_drop_tables, forced_loot_group)
	self._loot_value = loot_value
	local need_reroll = false
	local drop = nil

	if game_state_machine._current_state._current_job_data and game_state_machine._current_state._current_job_data.consumable then
		slot8 = self
		drop = self.produce_consumable_mission_drop(slot7)
	else
		slot11 = forced_loot_group
		drop = self.produce_loot_drop(slot7, self, self._loot_value, use_reroll_drop_tables)
	end

	self._dropped_loot = drop
	slot9 = "[LootDropManager:give_loot_to_player]        loot drop 1: "
	slot12 = self._dropped_loot

	Application.trace(slot7, Application, inspect(slot11))

	if drop.reward_type == LootDropTweakData.REWARD_CARD_PACK then
		if not self._cards_already_rejected then
			slot8 = managers.raid_menu

			if not managers.raid_menu.is_offline_mode(slot7) then
				slot9 = drop.pack_type
				slot14 = "card_drop_callback"

				managers.network.account.inventory_reward(slot7, managers.network.account, callback(slot11, self, self))

				self._card_drop_pack_type = drop.pack_type
				slot8 = managers.network.account

				managers.network.account.inventory_load(slot7)

				return 
			end
		end

		slot9 = " **** REROLLING CARDS **** "

		Application.trace(slot7, Application)

		slot10 = false

		self.give_loot_to_player(slot7, self, self._loot_value)

		return 
	elseif drop.reward_type == LootDropTweakData.REWARD_XP then
		slot9 = drop

		self._give_xp_to_player(slot7, self)
	elseif drop.reward_type == LootDropTweakData.REWARD_CUSTOMIZATION then
		slot9 = drop
		local result = self._give_character_customization_to_player(slot7, self)
		need_reroll = not result
	elseif drop.reward_type == LootDropTweakData.REWARD_WEAPON_POINT then
		slot9 = drop

		self._give_weapon_point_to_player(slot7, self)
	elseif drop.reward_type == LootDropTweakData.REWARD_MELEE_WEAPON then
		slot9 = drop
		local result = self._give_melee_weapon_to_player(slot7, self)
		need_reroll = not result
	elseif drop.reward_type == LootDropTweakData.REWARD_GOLD_BARS then
		slot9 = drop

		self._give_gold_bars_to_player(slot7, self)
	elseif drop.reward_type == LootDropTweakData.REWARD_HALLOWEEN_2017 then
		slot9 = drop
		local result = self._give_halloween_2017_weapon_to_player(slot7, self)
		need_reroll = not result
	end

	if need_reroll then
		slot9 = " **** REROLLING **** "

		Application.trace(slot7, Application)

		slot10 = true

		self.give_loot_to_player(slot7, self, self._loot_value)

		return 
	end

	slot9 = "[LootDropManager:give_loot_to_player]        loot drop 2: "
	slot12 = self._dropped_loot

	Application.trace(slot7, Application, inspect(slot11))

	slot8 = self

	self.on_loot_dropped_for_player(slot7)

	return 
end
function LootDropManager:debug_drop_card_pack()
	local loot_list = {
		{
			bonus = false,
			entry = "op_war_weary",
			instance_id = 1.5012326827715203e+18,
			category = "challenge_card",
			def_id = 150002,
			amount = 1
		},
		{
			bonus = false,
			entry = "ra_b_walk_it_off",
			instance_id = 1.5012326827715203e+18,
			category = "challenge_card",
			def_id = 100005,
			amount = 1
		},
		{
			bonus = false,
			entry = "op_b_recycle_for_victory",
			instance_id = 1.5012326827715203e+18,
			category = "challenge_card",
			def_id = 100011,
			amount = 1
		},
		{
			bonus = false,
			entry = "ra_helmet_shortage",
			instance_id = 1.5012326827715203e+18,
			category = "challenge_card",
			def_id = 100003,
			amount = 1
		},
		{
			bonus = false,
			entry = "ra_no_second_chances",
			instance_id = 1.5012326827715203e+18,
			category = "challenge_card",
			def_id = 100008,
			amount = 1
		}
	}
	slot5 = loot_list

	managers.challenge_cards.set_temp_steam_loot(slot3, managers.challenge_cards)

	slot4 = self

	self.on_loot_dropped_for_player(slot3)

	slot4 = managers.network
	slot8 = self._card_drop_pack_type
	slot11 = managers.network
	slot11 = managers.network.session(slot10)
	slot11 = managers.network.session(slot10).local_peer(slot10)

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_loot_to_peers", LootDropTweakData.REWARD_CARD_PACK, "", managers.network.session(slot10).local_peer(slot10).id(slot10))

	self._card_drop_pack_type = nil

	return 
end
function LootDropManager:card_drop_callback(error, loot_list)
	if not loot_list then
		slot6 = nil

		managers.challenge_cards.set_temp_steam_loot(slot4, managers.challenge_cards)

		self._cards_already_rejected = true
		self._card_drop_pack_type = nil
		slot6 = self._loot_value

		self.give_loot_to_player(slot4, self)
	else
		slot6 = loot_list

		managers.challenge_cards.set_temp_steam_loot(slot4, managers.challenge_cards)

		slot5 = self

		self.on_loot_dropped_for_player(slot4)

		slot5 = managers.network
		slot9 = self._card_drop_pack_type
		slot12 = managers.network
		slot12 = managers.network.session(slot11)
		slot12 = managers.network.session(slot11).local_peer(slot11)

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_loot_to_peers", LootDropTweakData.REWARD_CARD_PACK, "", managers.network.session(slot11).local_peer(slot11).id(slot11))

		self._card_drop_pack_type = nil
	end

	return 
end
function LootDropManager:on_loot_dropped_for_player()
	slot4 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot2, managers.savefile)

	slot3 = game_state_machine
	slot3 = game_state_machine.current_state(slot2)

	game_state_machine.current_state(slot2).on_loot_dropped_for_player(slot2)

	return 
end
function LootDropManager:redeem_dropped_loot_for_xp()
	local drop = self._dropped_loot

	if drop.reward_type == LootDropTweakData.REWARD_CUSTOMIZATION then
		slot5 = drop.character_customization_key

		managers.character_customization.remove_character_customization_from_inventory(slot3, managers.character_customization)

		slot5 = drop.character_customization.redeem_xp

		managers.experience.add_loot_redeemed_xp(slot3, managers.experience)
	elseif drop.reward_type == LootDropTweakData.REWARD_WEAPON_POINT then
		slot5 = 1

		managers.weapon_skills.remove_weapon_skill_points_as_drops(slot3, managers.weapon_skills)

		slot5 = drop.redeemed_xp

		managers.experience.add_loot_redeemed_xp(slot3, managers.experience)
	elseif drop.reward_type == LootDropTweakData.REWARD_MELEE_WEAPON then
		slot5 = drop

		managers.weapon_inventory.remove_melee_weapon_as_drop(slot3, managers.weapon_inventory)

		slot5 = drop.redeemed_xp

		managers.experience.add_loot_redeemed_xp(slot3, managers.experience)
	elseif drop.reward_type == LootDropTweakData.REWARD_HALLOWEEN_2017 then
		slot5 = drop

		managers.weapon_inventory.remove_melee_weapon_as_drop(slot3, managers.weapon_inventory)

		slot5 = drop.redeemed_xp

		managers.experience.add_loot_redeemed_xp(slot3, managers.experience)
	end

	return 
end
function LootDropManager:_give_xp_to_player(drop)
	slot7 = drop.xp_max
	drop.awarded_xp = math.round(math.rand(slot5, drop.xp_min))
	slot5 = drop.awarded_xp

	managers.experience.set_loot_bonus_xp(slot3, managers.experience)

	slot4 = managers.network
	slot8 = drop.awarded_xp
	slot11 = managers.network
	slot11 = managers.network.session(slot10)
	slot11 = managers.network.session(slot10).local_peer(slot10)

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_loot_to_peers", drop.reward_type, "", managers.network.session(slot10).local_peer(slot10).id(slot10))

	return 
end
function LootDropManager:_give_character_customization_to_player(drop)
	slot5 = drop.rarity
	local candidate_customizations = tweak_data.character_customization.get_reward_loot_by_rarity(slot3, tweak_data.character_customization)
	slot6 = candidate_customizations
	drop.character_customization_key = self._get_random_item(tweak_data.character_customization, self)
	drop.character_customization = tweak_data.character_customization.customizations[drop.character_customization_key]
	slot6 = drop.character_customization_key

	if not managers.character_customization.is_character_customization_owned(drop.character_customization_key, managers.character_customization) then
		drop.redeemed_xp = 0
		drop.duplicate = false
		slot6 = drop.character_customization_key

		managers.character_customization.add_character_customization_to_inventory(slot4, managers.character_customization)

		slot5 = managers.network
		slot9 = drop.redeemed_xp
		slot12 = managers.network
		slot12 = managers.network.session(slot11)
		slot12 = managers.network.session(slot11).local_peer(slot11)

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_loot_to_peers", drop.reward_type, drop.character_customization_key, managers.network.session(slot11).local_peer(slot11).id(slot11))

		return true
	else
		return false
	end

	return 
end
function LootDropManager:_give_weapon_point_to_player(drop)
	slot5 = 1

	managers.weapon_skills.add_weapon_skill_points_as_drops(slot3, managers.weapon_skills)

	drop.redeemed_xp = tweak_data.weapon_skills.weapon_point_reedemed_xp
	slot4 = managers.network
	slot8 = drop.reedemed_xp
	slot11 = managers.network
	slot11 = managers.network.session(slot10)
	slot11 = managers.network.session(slot10).local_peer(slot10)

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_loot_to_peers", drop.reward_type, "", managers.network.session(slot10).local_peer(slot10).id(slot10))

	return 
end
function LootDropManager:_give_halloween_2017_weapon_to_player(drop)
	slot8 = drop.weapon_id
	local candidate_melee_weapon = clone(managers.weapon_inventory.get_weapon_data(slot5, managers.weapon_inventory, WeaponInventoryManager.CATEGORY_NAME_MELEE))
	slot6 = candidate_melee_weapon.weapon_id

	if not managers.weapon_inventory.is_melee_weapon_owned(managers.weapon_inventory.get_weapon_data, managers.weapon_inventory) then
		drop.weapon_id = candidate_melee_weapon.weapon_id
		drop.redeemed_xp = candidate_melee_weapon.redeemed_xp
		drop.duplicate = false
		slot6 = drop

		managers.weapon_inventory.add_melee_weapon_as_drop(slot4, managers.weapon_inventory)

		slot5 = managers.network
		slot9 = drop.reedemed_xp
		slot12 = managers.network
		slot12 = managers.network.session(slot11)
		slot12 = managers.network.session(slot11).local_peer(slot11)

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_loot_to_peers", drop.reward_type, drop.weapon_id, managers.network.session(slot11).local_peer(slot11).id(slot11))

		return true
	else
		return false
	end

	return 
end
function LootDropManager:_give_melee_weapon_to_player(drop)
	slot5 = "[LootDropManager:_give_melee_weapon_to_player] drop 1: "
	slot8 = drop

	Application.trace(slot3, Application, inspect(slot7))

	local candidate_melee_weapon = managers.weapon_inventory.get_melee_weapon_loot_drop_candidates(slot3)
	slot6 = candidate_melee_weapon
	local melee_weapon_drop = self._get_random_item(managers.weapon_inventory, self)
	slot7 = melee_weapon_drop.weapon_id

	if not managers.weapon_inventory.is_melee_weapon_owned(self, managers.weapon_inventory) then
		drop.weapon_id = melee_weapon_drop.weapon_id
		drop.redeemed_xp = melee_weapon_drop.redeemed_xp
		drop.duplicate = false
		slot7 = drop

		managers.weapon_inventory.add_melee_weapon_as_drop(slot5, managers.weapon_inventory)

		slot6 = managers.network
		slot10 = drop.reedemed_xp
		slot13 = managers.network
		slot13 = managers.network.session(slot12)
		slot13 = managers.network.session(slot12).local_peer(slot12)

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_loot_to_peers", drop.reward_type, drop.weapon_id, managers.network.session(slot12).local_peer(slot12).id(slot12))

		return true
	else
		return false
	end

	return 
end
function LootDropManager:_give_gold_bars_to_player(drop)
	slot7 = drop.gold_bars_max
	drop.awarded_gold_bars = math.round(math.rand(slot5, drop.gold_bars_min))
	slot5 = drop.awarded_gold_bars

	managers.gold_economy.add_gold(slot3, managers.gold_economy)

	slot4 = managers.gold_economy

	managers.gold_economy.layout_camp(slot3)

	slot4 = managers.network
	slot8 = drop.awarded_gold_bars
	slot11 = managers.network
	slot11 = managers.network.session(slot10)
	slot11 = managers.network.session(slot10).local_peer(slot10)

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_loot_to_peers", drop.reward_type, "", managers.network.session(slot10).local_peer(slot10).id(slot10))

	return 
end
function LootDropManager:on_loot_dropped_for_peer(loot_type, name, value, peer_id)

	-- Decompilation error in this vicinity:
	local drop = {
		peer_id = peer_id
	}
	slot8 = managers.network
	slot9 = peer_id
	slot9 = drop

	table.insert(slot7, self._loot_for_peers)

	slot10 = drop

	self._call_listeners(slot7, self, LootDropManager.EVENT_PEER_LOOT_RECEIVED)

	return 
end
function LootDropManager:get_loot_for_peers()
	return self._loot_for_peers
end
function LootDropManager:clear_dropped_loot()
	self._dropped_loot = nil
	self._loot_for_peers = {}
	self._cards_already_rejected = false
	self._loot_value = nil
	self._card_drop_pack_type = nil

	return 
end
function LootDropManager:register_loot(unit, value_type, world_id)
	local value = nil

	if value_type == LootDropManager.LOOT_VALUE_TYPE_SMALL then
		value = LootDropTweakData.LOOT_VALUE_TYPE_SMALL_AMOUNT
	elseif value_type == LootDropManager.LOOT_VALUE_TYPE_MEDIUM then
		value = LootDropTweakData.LOOT_VALUE_TYPE_MEDIUM_AMOUNT
	elseif value_type == LootDropManager.LOOT_VALUE_TYPE_BIG then
		value = LootDropTweakData.LOOT_VALUE_TYPE_BIG_AMOUNT
	else
		slot8 = value_type

		debug_pause(slot6, "[LootDropManager:register_loot] Unknown loot value size!")

		return 
	end

	slot8 = value

	unit.loot_drop(slot6).set_value(slot6, unit.loot_drop(slot6))

	self._registered_loot_units[world_id] = self._registered_loot_units[world_id] or {}
	local loot_data = {
		unit = unit,
		value = value,
		world_id = world_id
	}
	slot9 = loot_data

	table.insert(unit, self._registered_loot_units[world_id])

	self._loot_registered_last_leg = self._loot_registered_last_leg + value

	return 
end
function LootDropManager:remove_loot_from_level(world_id)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	self._registered_loot_units[world_id] = self._registered_loot_units[world_id] or {}
	slot4 = self._registered_loot_units[world_id]

	for _, loot_data in ipairs(slot3) do
		slot10 = 0

		loot_data.unit.set_slot(slot8, loot_data.unit)

		loot_data.deleted = true
	end

	self._registered_loot_units[world_id] = {}
	self._active_loot_units = {}

	return 
end
function LootDropManager:plant_loot_on_level(world_id, total_value, job_id)

	-- Decompilation error in this vicinity:
	slot6 = Network
	slot8 = job_id

	print(slot5, "[LootDropManager:plant_loot_on_level()] Planting loot on level, loot value (value, mission):", total_value)

	self._loot_spawned_current_leg = 0
	self._registered_loot_units[world_id] = self._registered_loot_units[world_id] or {}
	self._active_loot_units = {}

	if #self._registered_loot_units[world_id] == 0 then
		slot6 = "[LootDropManager:plant_loot_on_level()] no loot units registered on the level"

		print(slot5)

		return 
	end

	local used_all = true
	slot7 = self._registered_loot_units[world_id]

	math.shuffle(slot6)

	slot7 = self._registered_loot_units[world_id]

	for _, loot_data in ipairs(slot6) do
		slot12 = loot_data.unit

		if not alive(slot11) then
			loot_data.deleted = true
		else
			local should_remove_loot_unit = total_value <= self._loot_spawned_current_leg

			if should_remove_loot_unit then
				slot14 = 0

				loot_data.unit.set_slot(slot12, loot_data.unit)

				loot_data.deleted = true
			else
				self._loot_spawned_current_leg = self._loot_spawned_current_leg + loot_data.value
				slot14 = loot_data.unit

				table.insert(loot_data.value, self._active_loot_units)
			end
		end
	end

	if self._loot_spawned_current_leg < total_value then
		slot9 = total_value

		print(slot6, "[LootDropManager:plant_loot_on_level()] All loot units on level used, level loot cap still not reached (curr_value, total_value):", self._loot_spawned_current_leg)
	else
		slot8 = self._loot_spawned_current_leg

		print(slot6, "[LootDropManager:plant_loot_on_level()] Loot value placed on level:")
	end

	self._loot_spawned_total = self._loot_spawned_total + self._loot_spawned_current_leg
	self._picked_up_total = self._picked_up_total + self._picked_up_current_leg
	slot7 = managers.network
	slot9 = managers.lootdrop.loot_spawned_current_leg(slot10)
	slot12 = managers.lootdrop

	managers.network.session(self._picked_up_current_leg).send_to_peers_synched(self._picked_up_current_leg, managers.network.session(self._picked_up_current_leg), "sync_spawned_loot_values", managers.lootdrop.loot_spawned_total(managers.lootdrop))

	slot7 = self._registered_loot_units[world_id]

	for _, loot_data in ipairs(self._picked_up_current_leg) do
		if not loot_data.deleted then
			slot12 = managers.network
			slot15 = loot_data.value

			managers.network.session(slot11).send_to_peers_synched(slot11, managers.network.session(slot11), "sync_loot_value", loot_data.unit)
		end
	end

	self._picked_up_current_leg = 0
	self._registered_loot_units[world_id] = {}
	slot8 = self._picked_up_current_leg

	managers.hud.set_loot_picked_up(, managers.hud)

	slot8 = self._loot_spawned_current_leg

	managers.hud.set_loot_total(, managers.hud)

	return 
end
function LootDropManager:reset_loot_value_counters()
	self._registered_loot_units = {}
	self._active_loot_units = {}
	self._loot_registered_last_leg = 0
	self._picked_up_total = 0
	self._picked_up_current_leg = 0
	self._loot_spawned_total = 0
	self._loot_spawned_current_leg = 0

	if managers.hud then
		slot4 = self._picked_up_current_leg

		managers.hud.set_loot_picked_up(slot2, managers.hud)

		slot4 = self._loot_spawned_current_leg

		managers.hud.set_loot_total(slot2, managers.hud)
	end

	return 
end
function LootDropManager:current_loot_pickup_ratio()
	local result = nil

	if self._loot_spawned_current_leg == 0 then
		result = 0
	else
		result = self._picked_up_current_leg / self._loot_spawned_current_leg * 100
		slot5 = result
		result = string.format(self._loot_spawned_current_leg, "%.1f")
	end

	return result
end
function LootDropManager:pickup_loot(value, unit)
	self._picked_up_current_leg = self._picked_up_current_leg + value
	slot6 = self._picked_up_current_leg

	managers.hud.set_loot_picked_up(slot4, managers.hud)

	return 
end
function LootDropManager:on_simulation_ended()
	slot4 = "LootDropManager:on_simulation_ended()"

	Application.trace(slot2, Application)

	slot3 = self

	self.reset_loot_value_counters(slot2)

	return 
end
function LootDropManager:reset()
	Global.lootdrop_manager = nil
	slot3 = self

	self._setup(nil)

	return 
end
function LootDropManager:picked_up_current_leg()
	return self._picked_up_current_leg
end
function LootDropManager:picked_up_total()
	return self._picked_up_total
end
function LootDropManager:loot_spawned_total()
	return self._loot_spawned_total
end
function LootDropManager:loot_spawned_current_leg()
	return self._loot_spawned_current_leg
end
function LootDropManager:set_picked_up_current_leg(picked_up_current_leg)
	self._picked_up_current_leg = picked_up_current_leg
	slot5 = self._picked_up_current_leg

	managers.hud.set_loot_picked_up(slot3, managers.hud)

	return 
end
function LootDropManager:set_picked_up_total(picked_up_total)
	self._picked_up_total = picked_up_total

	return 
end
function LootDropManager:set_loot_spawned_total(loot_spawned_total)
	self._loot_spawned_total = loot_spawned_total

	return 
end
function LootDropManager:set_loot_spawned_current_leg(loot_spawned_current_leg)
	self._loot_spawned_current_leg = loot_spawned_current_leg
	slot5 = self._loot_spawned_current_leg

	managers.hud.set_loot_total(slot3, managers.hud)

	return 
end
function LootDropManager:sync_load(data)
	local state = data.LootDropManager
	self._picked_up_total = state.picked_up_total
	self._picked_up_current_leg = state.picked_up_current_leg
	self._loot_spawned_total = state.loot_spawned_total
	self._loot_spawned_current_leg = state.loot_spawned_current_leg

	return 
end
function LootDropManager:sync_save(data)
	local state = {
		picked_up_total = self._picked_up_total,
		picked_up_current_leg = self._picked_up_current_leg,
		loot_spawned_total = self._loot_spawned_total,
		loot_spawned_current_leg = self._loot_spawned_current_leg
	}
	data.LootDropManager = state

	return 
end
function LootDropManager:save(data)
	data.LootDropManager = self._global

	return 
end
function LootDropManager:load(data)
	self._global = data.LootDropManager

	return 
end

return 
