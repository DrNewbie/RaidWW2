-- Decompilation Error: _run_step(_unwarp_expressions, node)

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
PlayerManager = PlayerManager or class()
PlayerManager.WEAPON_SLOTS = 2
PlayerManager.EQUIPMENT_OBTAINED_MESSAGE_DURATION = 3
PlayerManager.EVENT_LOCAL_PLAYER_ENTER_RESPAWN = "PlayerManager.EVENT_LOCAL_PLAYER_ENTER_RESPAWN"
PlayerManager.EVENT_LOCAL_PLAYER_EXIT_RESPAWN = "PlayerManager.EVENT_LOCAL_PLAYER_EXIT_RESPAWN"
function PlayerManager:init()
	slot3 = CoroutineManager
	self._coroutine_mgr = CoroutineManager.new(slot2)
	slot3 = MessageSystem
	self._message_system = MessageSystem.new(slot2)
	slot3 = TemporaryPropertyManager
	self._temporary_properties = TemporaryPropertyManager.new(slot2)
	slot3 = "units/multiplayer/mp_fps_mover/mp_fps_mover"
	self._player_name = Idstring(slot2)
	self._players = {}
	self._nr_players = Global.nr_players or 1
	self._last_id = 1
	self._viewport_configs = {
		{}
	}
	self._viewport_configs[1][1] = {
		dimensions = {
			w = 1,
			h = 1,
			x = 0,
			y = 0
		}
	}
	self._viewport_configs[2] = {
		{
			dimensions = {
				w = 1,
				h = 0.5,
				x = 0,
				y = 0
			}
		},
		{
			dimensions = {
				w = 1,
				h = 0.5,
				x = 0,
				y = 0.5
			}
		}
	}
	self._view_disabled = false
	slot3 = self

	self._setup_rules()

	self._local_player_minions = 0
	self._local_player_body_bags = nil
	self._player_states = {
		incapacitated = "ingame_incapacitated",
		carry = "ingame_standard",
		carry_corpse = "ingame_standard",
		freefall = "ingame_freefall",
		parachuting = "ingame_parachuting",
		bleed_out = "ingame_bleed_out",
		foxhole = "ingame_standard",
		driving = "ingame_driving",
		turret = "ingame_standard",
		fatal = "ingame_fatal",
		standard = "ingame_standard",
		bipod = "ingame_standard",
		tased = "ingame_electrified"
	}
	self._DEFAULT_STATE = "standard"
	self._current_state = self._DEFAULT_STATE
	self._sync_states = {
		"standard"
	}
	self._current_sync_state = self._DEFAULT_STATE
	local ids_player = Idstring()
	slot5 = ids_player

	if not TimerManager.timer("player", TimerManager) then
		slot5 = ids_player
		slot8 = TimerManager
		slot2 = TimerManager.make_timer(slot3, TimerManager, TimerManager.pausable(slot7))
	end

	self._player_timer = slot2
	self._hostage_close_to_local_t = 0
	slot4 = self

	self._setup(slot3)

	return 
end
function PlayerManager:register_message(message, uid, func)
	slot9 = func

	self._message_system.register(slot5, self._message_system, message, uid)

	return 
end
function PlayerManager:unregister_message(message, uid)
	slot7 = uid

	self._message_system.unregister(slot4, self._message_system, message)

	return 
end
function PlayerManager:send_message(message, uid, ...)
	slot7 = uid

	self._message_system.notify(slot4, self._message_system, message, ...)

	return 
end
function PlayerManager:send_message_now(message, uid, ...)
	slot7 = uid

	self._message_system.notify_now(slot4, self._message_system, message, ...)

	return 
end
function PlayerManager:add_coroutine(name, func, ...)
	slot7 = func

	self._coroutine_mgr.add_coroutine(slot4, self._coroutine_mgr, name, ...)

	return 
end
function PlayerManager:get_temporary_property(name, default)
	slot7 = default

	return self._temporary_properties.get_property(slot4, self._temporary_properties, name)
end
function PlayerManager:activate_temporary_property(name, time, value)
	slot9 = value

	self._temporary_properties.activate_property(slot5, self._temporary_properties, name, time)

	return 
end
function PlayerManager:add_to_temporary_property(name, time, value)
	slot9 = value

	self._temporary_properties.add_to_property(slot5, self._temporary_properties, name, time)

	return 
end
function PlayerManager:has_active_temporary_property(name)
	slot5 = name

	return self._temporary_properties.has_active_property(slot3, self._temporary_properties)
end
function PlayerManager:_setup()
	self._equipment = {
		selections = {},
		specials = {}
	}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new()
	self._player_mesh_suffix = ""
	self._temporary_upgrades = {}

	if not Global.player_manager then
		Global.player_manager = {
			upgrades = {},
			team_upgrades = {},
			weapons = {},
			equipment = {},
			grenades = {},
			kit = {
				weapon_slots = {
					BlackMarketManager.DEFAULT_SECONDARY_WEAPON_ID
				},
				equipment_slots = {},
				special_equipment_slots = {}
			},
			viewed_content_updates = {},
			character_profile_name = "",
			is_character_profile_hardcore = false,
			character_profile_nation = "",
			customization_equiped_head_name = "",
			customization_equiped_upper_name = "",
			customization_equiped_lower_name = "",
			game_settings_difficulty = Global.DEFAULT_DIFFICULTY,
			game_settings_permission = Global.DEFAULT_PERMISSION,
			game_settings_drop_in_allowed = true,
			game_settings_team_ai = true,
			game_settings_auto_kick = true
		}
	end

	Global.player_manager.default_kit = {
		weapon_slots = {
			BlackMarketManager.DEFAULT_SECONDARY_WEAPON_ID
		},
		equipment_slots = {},
		special_equipment_slots = {
			"cable_tie"
		}
	}
	Global.player_manager.synced_bonuses = {}
	Global.player_manager.synced_equipment_possession = {}
	Global.player_manager.synced_deployables = {}
	Global.player_manager.synced_grenades = {}
	Global.player_manager.synced_cable_ties = {}
	Global.player_manager.synced_ammo_info = {}
	Global.player_manager.synced_carry = {}
	Global.player_manager.synced_team_upgrades = {}
	Global.player_manager.synced_vehicle_data = {}
	Global.player_manager.synced_bipod = {}
	Global.player_manager.synced_turret = {}
	Global.player_manager.synced_drag_body = {}
	self._global = Global.player_manager

	return 
end
function PlayerManager:get_customization_equiped_head_name()
	local result = ""

	if Global.player_manager.customization_equiped_head_name and Global.player_manager.customization_equiped_head_name ~= "" then
		result = Global.player_manager.customization_equiped_head_name
	else
		slot4 = self
		result = self.get_character_profile_nation(slot3) .. "_default_head"
	end

	return result
end
function PlayerManager:set_customization_equiped_head_name(head_name)
	slot7 = self
	slot7 = head_name
	local owned_head_name = managers.character_customization.verify_customization_ownership(slot3, managers.character_customization, self.get_character_profile_nation(slot6), CharacterCustomizationTweakData.PART_TYPE_UPPER)
	Global.player_manager.customization_equiped_head_name = owned_head_name

	return 
end
function PlayerManager:get_customization_equiped_upper_name()
	local result = ""

	if Global.player_manager.customization_equiped_upper_name and Global.player_manager.customization_equiped_upper_name ~= "" then
		result = Global.player_manager.customization_equiped_upper_name
	else
		slot4 = self
		result = self.get_character_profile_nation(slot3) .. "_default_upper"
	end

	return result
end
function PlayerManager:set_customization_equiped_upper_name(upper_name)
	slot7 = self
	slot7 = upper_name
	local owned_upper_name = managers.character_customization.verify_customization_ownership(slot3, managers.character_customization, self.get_character_profile_nation(slot6), CharacterCustomizationTweakData.PART_TYPE_UPPER)
	Global.player_manager.customization_equiped_upper_name = owned_upper_name

	return 
end
function PlayerManager:get_customization_equiped_lower_name()
	local result = ""

	if Global.player_manager.customization_equiped_lower_name and Global.player_manager.customization_equiped_lower_name ~= "" then
		result = Global.player_manager.customization_equiped_lower_name
	else
		slot4 = self
		result = self.get_character_profile_nation(slot3) .. "_default_lower"
	end

	return result
end
function PlayerManager:set_customization_equiped_lower_name(lower_name)
	slot7 = self
	slot7 = lower_name
	local owned_lower_name = managers.character_customization.verify_customization_ownership(slot3, managers.character_customization, self.get_character_profile_nation(slot6), CharacterCustomizationTweakData.PART_TYPE_LOWER)
	Global.player_manager.customization_equiped_lower_name = owned_lower_name

	return 
end
function PlayerManager:set_character_class(class)
	slot4 = self

	if not self.player_unit(slot3) then
		return 
	end

	slot4 = self
	slot4 = self.player_unit(slot3)
	slot5 = class

	self.player_unit(slot3).character_damage(slot3).set_player_class(slot3, self.player_unit(slot3).character_damage(slot3))

	slot4 = self
	slot4 = self.player_unit(slot3)
	slot5 = class

	self.player_unit(slot3).movement(slot3).set_player_class(slot3, self.player_unit(slot3).movement(slot3))

	self._need_to_send_player_status = true

	return 
end
function PlayerManager:get_character_profile_name()
	return Global.player_manager.character_profile_name
end
function PlayerManager:set_character_profile_name(character_profile_name)
	Global.player_manager.character_profile_name = character_profile_name

	return 
end
function PlayerManager:get_is_character_profile_hardcore()
	return Global.player_manager.is_character_profile_hardcore
end
function PlayerManager:set_is_character_profile_hardcore(is_character_profile_hardcore)
	Global.player_manager.is_character_profile_hardcore = is_character_profile_hardcore

	return 
end
function PlayerManager:get_character_profile_nation()
	return Global.player_manager.character_profile_nation
end
function PlayerManager:set_character_profile_nation(character_profile_nation)
	Global.player_manager.character_profile_nation = character_profile_nation

	return 
end
function PlayerManager:_setup_rules()
	self._rules = {
		no_run = 0
	}

	return 
end
function PlayerManager:aquire_default_upgrades()
	local default_upgrades = tweak_data.skilltree.default_upgrades or {}
	slot4 = default_upgrades

	for _, upgrade in ipairs(slot3) do
		slot11 = UpgradesManager.AQUIRE_STRINGS[1]

		if not managers.upgrades.aquired(slot8, managers.upgrades, upgrade) then
			slot11 = UpgradesManager.AQUIRE_STRINGS[1]

			managers.upgrades.aquire_default(slot8, managers.upgrades, upgrade)
		end
	end

	for i = 1, PlayerManager.WEAPON_SLOTS, 1 do
		slot9 = i

		if not managers.player.weapon_in_slot(slot7, managers.player) then
			slot10 = i
			self._global.kit.weapon_slots[i] = managers.player.availible_weapons(slot8, managers.player)[1]
		end
	end

	slot5 = true

	self._verify_equipment_kit(slot3, self)

	return 
end
function PlayerManager:update(t, dt)
	slot5 = self._message_system

	self._message_system.update(slot4)

	if self._need_to_send_player_status then
		self._need_to_send_player_status = nil
		slot5 = self

		self.need_send_player_status(slot4)
	end

	self._sent_player_status_this_frame = nil
	local local_player = self.local_player(slot4)
	slot8 = "close_to_hostage_boost"

	if self.has_category_upgrade(self, self, "player") and (not self._hostage_close_to_local_t or self._hostage_close_to_local_t <= t) then
		local local_player = self.local_player(slot5)
		slot7 = local_player

		if alive(self) and managers.groupai then
			slot7 = managers.groupai
			slot10 = local_player
			slot10 = local_player.movement(tweak_data.upgrades.hostage_near_player_radius)
			slot5 = managers.groupai.state(slot6).is_a_hostage_within(slot6, managers.groupai.state(slot6), local_player.movement(tweak_data.upgrades.hostage_near_player_radius).m_pos(tweak_data.upgrades.hostage_near_player_radius))
		end

		self._is_local_close_to_hostage = slot5
		self._hostage_close_to_local_t = t + tweak_data.upgrades.hostage_near_player_check_t
	end

	slot6 = self

	self._update_hostage_skills(slot5)

	slot8 = dt

	self._coroutine_mgr.update(slot5, self._coroutine_mgr, t)

	return 
end
function PlayerManager:add_listener(key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function PlayerManager:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function PlayerManager:preload()
	return 
end
function PlayerManager:need_send_player_status()

	-- Decompilation error in this vicinity:
	local player = self.player_unit(slot2)
	slot5 = CoreWorldCollection.STAGE_LOAD
	local all_peers_spawned_world = managers.worldcollection.check_all_peers_synced_last_world(self, managers.worldcollection)
	slot6 = "[PlayerManager:need_send_player_status()] Player status sent!"

	Application.debug(slot4, Application)

	self._sent_player_status_this_frame = true
	slot5 = player
	slot5 = player.character_damage(slot4)

	player.character_damage(slot4).send_set_status(slot4)

	slot6 = true

	managers.raid_menu.set_pause_menu_enabled(slot4, managers.raid_menu)

	slot5 = managers.player

	managers.player.sync_upgrades(slot4)

	local current_player_level = managers.experience.current_level(slot4)
	slot8 = current_player_level

	player.send(managers.experience, player, "set_player_level", player.id(slot10))

	local nationality = managers.player.get_character_profile_nation(managers.experience)
	slot9 = nationality

	player.send(managers.player, player, "set_player_nationality", player.id(player))

	local class = managers.skilltree.get_character_profile_class(managers.player)
	slot10 = class
	slot13 = player

	player.send(managers.skilltree, player, "set_player_class", player.id(player))

	local active_warcry = managers.warcry.get_active_warcry_name(managers.skilltree)
	local warcry_meter_percentage = managers.warcry.current_meter_percentage(managers.warcry)
	slot13 = warcry_meter_percentage
	slot16 = player

	player.send(managers.warcry, player, "set_active_warcry", active_warcry, player.id(slot15))

	slot10 = player
	slot10 = player.inventory(managers.warcry)

	player.inventory(managers.warcry)._send_equipped_weapon(managers.warcry)

	return 
end
function PlayerManager:_internal_load()
	slot3 = self
	local player = self.player_unit(slot2)

	if not player then
		return 
	end

	slot5 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID

	managers.weapon_skills.recreate_all_weapons_blueprints(slot3, managers.weapon_skills)

	slot4 = managers.blackmarket
	local secondary = managers.blackmarket.equipped_secondary(slot3)

	if secondary then
		slot6 = "secondaries"
		local secondary_slot = managers.blackmarket.equipped_weapon_slot(slot4, managers.blackmarket)
		slot9 = secondary
		local texture_switches = managers.blackmarket.get_weapon_texture_switches(managers.blackmarket, managers.blackmarket, "secondaries", secondary_slot)
		slot7 = player
		slot13 = texture_switches

		player.inventory(managers.blackmarket).add_unit_by_factory_name(managers.blackmarket, player.inventory(managers.blackmarket), secondary.factory_id, true, false, secondary.blueprint, secondary.cosmetics)
	end

	slot6 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID

	managers.weapon_skills.recreate_all_weapons_blueprints(slot4, managers.weapon_skills)

	slot5 = managers.blackmarket
	local primary = managers.blackmarket.equipped_primary(slot4)

	if primary then
		slot7 = "primaries"
		local primary_slot = managers.blackmarket.equipped_weapon_slot(slot5, managers.blackmarket)
		slot10 = primary
		local texture_switches = managers.blackmarket.get_weapon_texture_switches(managers.blackmarket, managers.blackmarket, "primaries", primary_slot)
		slot8 = player
		slot14 = texture_switches

		player.inventory(managers.blackmarket).add_unit_by_factory_name(managers.blackmarket, player.inventory(managers.blackmarket), primary.factory_id, true, false, primary.blueprint, primary.cosmetics)
	end

	slot6 = player
	slot6 = player.inventory(slot5)
	slot9 = managers.blackmarket

	player.inventory(slot5).set_melee_weapon(slot5, managers.blackmarket.equipped_melee_weapon(slot8))

	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	local peer_id = managers.network.session(slot5).local_peer(slot5).id(slot5)
	slot7 = managers.blackmarket
	local grenade, amount = managers.blackmarket.equipped_grenade(managers.network.session(slot5).local_peer(slot5))
	slot10 = peer_id

	if self.has_grenade(slot8, self) then
		slot10 = peer_id

		if not self.get_grenade_amount(slot8, self) then
		end
	end

	slot10 = {
		grenade = grenade,
		amount = math.min(slot12, self.get_max_grenades(slot15))
	}
	slot13 = amount
	slot16 = self

	self._set_grenade(slot8, self)

	slot9 = self

	self.refill_grenades(slot8)

	slot9 = self
	slot7 = self._set_body_bags_amount

	if not self._local_player_body_bags then
		slot12 = self
		slot10 = self.total_body_bags(slot11)
	end

	slot7(slot8, slot9)

	if self._respawn then
	else
		slot10 = player

		self._add_level_equipment(slot8, self)

		slot9 = self._global.default_kit.special_equipment_slots

		for i, name in ipairs(slot8) do
			local ok_name = self._global.equipment[name] and name

			if ok_name then
				local upgrade = tweak_data.upgrades.definitions[ok_name]

				if upgrade and ((upgrade.slot and upgrade.slot < 2) or not upgrade.slot) then
					slot17 = {
						silent = true,
						equipment = upgrade.equipment_id
					}

					self.add_equipment(slot15, self)
				end
			end
		end

		slot9 = self._global.kit.equipment_slots

		for i, name in ipairs(slot8) do

			-- Decompilation error in this vicinity:
			if not self._global.equipment[name] or not name then
				local ok_name = self._global.default_kit.equipment_slots[i]
			end

			break
		end
	end

	return 
end
function PlayerManager:_add_level_equipment(player)
	if Global.running_simulation then
		slot5 = "Level Settings"
		slot5 = "simulation_level_id"
		local id = managers.editor.layer(slot3, managers.editor).get_setting(slot3, managers.editor.layer(slot3, managers.editor))
	end

	if id == "none" or not id then
		id = nil
	end

	if not id then
		id = Global.level_data.level_id
	end

	if not id then
		return 
	end

	local equipment = tweak_data.levels[id].equipment

	if not equipment then
		return 
	end

	slot6 = equipment

	for _, eq in ipairs(slot5) do
		slot12 = {
			silent = true,
			equipment = eq
		}

		self.add_equipment(slot10, self)
	end

	return 
end
function PlayerManager:spawn_dropin_penalty(dead, bleed_out, health, used_deployable, used_cable_ties, used_body_bags)
	local player = self.player_unit(slot8)
	slot16 = used_body_bags

	print(self, "[PlayerManager:spawn_dropin_penalty]", dead, bleed_out, health, used_deployable, used_cable_ties)

	slot10 = player

	if not alive(self) then
		return 
	end

	if used_deployable then
		slot10 = managers.player

		managers.player.clear_equipment(slot9)

		local equipped_deployable = Global.player_manager.kit.equipment_slots[1]
		local deployable_data = tweak_data.equipments[equipped_deployable]

		if deployable_data and deployable_data.dropin_penalty_function_name then
			slot12 = player
			slot14 = player
			local used_one, redirect = player.equipment(slot11)[deployable_data.dropin_penalty_function_name](deployable_data.dropin_penalty_function_name, player.equipment(self._equipment.selected_index))

			if redirect then
				slot14 = player

				redirect(slot13)
			end
		end
	end

	for i = 1, used_cable_ties, 1 do
		slot15 = "cable_tie"

		self.remove_special(slot13, self)
	end

	slot10 = self
	slot15 = self

	self._set_body_bags_amount(slot9, math.max(slot12, self.total_body_bags(0) - used_body_bags))

	local min_health = nil

	if dead or bleed_out then
		min_health = 0
	else
		min_health = 0.25
	end

	slot11 = player
	slot15 = health
	slot15 = player
	slot15 = player.character_damage(min_health)
	slot12 = math.max(slot13, min_health) * player.character_damage(min_health)._max_health(min_health)

	player.character_damage(slot10).set_health(slot10, player.character_damage(slot10))

	if dead or bleed_out then
		slot11 = "[PlayerManager:spawn_dead] Killing"

		print(slot10)

		slot11 = player
		slot16 = player
		slot14 = player.character_damage(slot15).down_time(slot15)
		slot17 = player

		player.network(slot10).send(slot10, player.network(slot10), "sync_player_movement_state", "dead", player.id(player.character_damage(slot15)))

		slot11 = managers.groupai
		slot11 = managers.groupai.state(slot10)
		slot14 = managers.network
		slot14 = managers.network.session("dead")
		slot14 = managers.network.session("dead").local_peer("dead")

		managers.groupai.state(slot10).on_player_criminal_death(slot10, managers.network.session("dead").local_peer("dead").id("dead"))

		slot11 = player
		slot12 = false

		player.base(slot10).set_enabled(slot10, player.base(slot10))

		slot12 = "ingame_waiting_for_respawn"

		game_state_machine.change_state_by_name(slot10, game_state_machine)

		slot11 = player
		slot12 = true

		player.character_damage(slot10).set_invulnerable(slot10, player.character_damage(slot10))

		slot11 = player
		slot12 = 0

		player.character_damage(slot10).set_health(slot10, player.character_damage(slot10))

		slot11 = player
		slot11 = player.base(slot10)

		player.base(slot10)._unregister(slot10)

		slot12 = player

		World.delete_unit(slot10, World)
	end

	slot11 = managers.groupai
	slot11 = managers.groupai.state(slot10)

	if not managers.groupai.state(slot10).enemy_weapons_hot(slot10) then
		slot11 = player
		slot13 = true

		player.inventory(slot10).equip_selection(slot10, player.inventory(slot10), PlayerInventory.SLOT_4)
	end

	return 
end
function PlayerManager:nr_players()
	return self._nr_players
end
function PlayerManager:set_nr_players(nr)
	self._nr_players = nr

	return 
end
function PlayerManager:player_id(unit)
	local id = self._last_id
	slot5 = self._players

	for k, player in ipairs(slot4) do
		if player == unit then
			id = k
		end
	end

	return id
end
function PlayerManager:viewport_config()
	local configs = self._viewport_configs[self._last_id]

	if configs then
		return configs[1]
	end

	return 
end
function PlayerManager:setup_viewports()
	local configs = self._viewport_configs[self._last_id]

	if configs then
		slot4 = self._players

		for slot5, slot6 in ipairs(slot3) do
		end
	else
		slot8 = self._last_id
		slot5 = "Unsupported number of players: " .. tostring(slot7)

		Application.error(slot3, Application)
	end

	return 
end
function PlayerManager:player_states()
	local ret = {}
	slot4 = self._player_states

	for k, _ in pairs(slot3) do
		slot10 = k

		table.insert(slot8, ret)
	end

	return ret
end
function PlayerManager:current_state()
	return self._current_state
end
function PlayerManager:default_player_state()
	return self._DEFAULT_STATE
end
function PlayerManager:current_sync_state()
	return self._current_sync_state
end
function PlayerManager:set_player_state(state, state_data)
	if not state then
		state = self._current_state
	end

	slot5 = self
	local carry_data = self.get_my_carry_data(slot4)

	if state == "standard" and carry_data then
		local carry_tweak = tweak_data.carry[carry_data.carry_id]

		if carry_tweak.is_corpse then
			state = "carry_corpse"
		else
			state = "carry"
		end
	end

	if state == self._current_state then
		return 
	end

	if self._current_state == "foxhole" then
		slot6 = self

		if self.player_unit(slot5) then
			slot6 = self
			slot6 = self.player_unit(slot5)
			slot6 = self.player_unit(slot5).movement(slot5)
			local foxhole = self.player_unit(slot5).movement(slot5).foxhole_unit(slot5)
		end

		if foxhole then
			slot7 = foxhole
			slot7 = foxhole.foxhole(slot6)

			if foxhole.foxhole(slot6).locked(slot6) then
				return 
			end
		end
	end

	if self._current_state == "bleed_out" and (state == "parachuting" or state == "freefall") then
		return 
	end

	if state ~= "standard" and state ~= "carry" and state ~= "carry_corpse" and state ~= "bipod" and state ~= "turret" and state ~= "freefall" and state ~= "parachuting" then
		slot6 = self
		local unit = self.player_unit(slot5)

		if unit then
			slot7 = unit
			slot7 = unit.character_damage(slot6)

			unit.character_damage(slot6).disable_berserker(slot6)
		end
	end

	if not self._player_states[state] then
		slot10 = state
		slot7 = "State '" .. tostring(slot9) .. "' does not exist in list of available states."

		Application.error(slot5, Application)

		state = self._DEFAULT_STATE
	end

	slot7 = state

	if table.contains(slot5, self._sync_states) then
		self._current_sync_state = state
	end

	self._current_state = state
	slot6 = self

	self._change_player_state(slot5)

	return 
end
function PlayerManager:spawn_players(position, rotation, state)
	for var = 1, self._nr_players, 1 do
		self._last_id = var
	end

	slot7 = self._last_id
	slot12 = self
	slot12 = rotation

	self.spawned_player(slot5, self, safe_spawn_unit(slot9, self.player_unit_name(slot11), position))

	return self._players[1]
end
function PlayerManager:spawned_player(id, unit)
	self._players[id] = unit
	slot5 = self

	self.setup_viewports(slot4)

	slot5 = self

	self._internal_load(slot4)

	slot5 = self

	self._change_player_state(slot4)

	return 
end
function PlayerManager:_change_player_state()
	slot3 = self
	local unit = self.player_unit(slot2)

	if not unit then
		return 
	end

	slot6 = unit

	self._listener_holder.call(slot3, self._listener_holder, self._current_state)

	slot4 = game_state_machine

	if game_state_machine.last_queued_state_name(slot3) ~= self._player_states[self._current_state] then
		slot6 = self._player_states[self._current_state]

		Application.debug(slot3, Application, "[PlayerManager:_change_player_state()] Changing state to:")

		slot5 = self._player_states[self._current_state]

		game_state_machine.change_state_by_name(slot3, game_state_machine)
	end

	slot4 = unit
	slot5 = self._current_state

	unit.movement(slot3).change_state(slot3, unit.movement(slot3))

	return 
end
function PlayerManager:player_destroyed(id)
	self._players[id] = nil
	self._respawn = true

	return 
end
function PlayerManager:players()
	return self._players
end
function PlayerManager:player_unit_name()
	return self._player_name
end
function PlayerManager:player_unit(id)
	if not id then
		local p_id = 1
	end

	return self._players[p_id]
end
function PlayerManager:local_player()
	slot3 = self

	return self.player_unit(slot2)
end
function PlayerManager:warp_to(pos, rot, id)
	slot4 = self._players

	if not id then
		slot5 = 1
	end

	local player = slot4[slot5]
	slot7 = player

	if alive(slot6) then
		slot7 = player
		slot9 = rot

		player.movement(slot6).warp_to(slot6, player.movement(slot6), pos)

		slot7 = player
		slot8 = rot

		player.camera(slot6).set_rotation(slot6, player.camera(slot6))

		slot7 = player
		slot7 = player.camera(slot6)
		slot8 = rot

		player.camera(slot6).camera_unit(slot6).set_rotation(slot6, player.camera(slot6).camera_unit(slot6))

		slot7 = player
		slot7 = player.camera(slot6)
		slot7 = player.camera(slot6).camera_unit(slot6)
		slot8 = rot

		player.camera(slot6).camera_unit(slot6).base(slot6).set_rotation(slot6, player.camera(slot6).camera_unit(slot6).base(slot6))

		slot7 = player
		slot7 = player.camera(slot6)
		slot7 = player.camera(slot6).camera_unit(slot6)
		slot8 = rot

		player.camera(slot6).camera_unit(slot6).base(slot6).force_rot(slot6, player.camera(slot6).camera_unit(slot6).base(slot6))
	end

	return 
end
function PlayerManager:on_out_of_world()
	local player_unit = managers.player.player_unit(slot2)
	slot4 = player_unit

	if not alive(managers.player) then
		return 
	end

	slot4 = player_unit
	local player_pos = player_unit.position(slot3)
	local closest_pos, closest_distance = nil
	slot9 = managers.groupai
	slot9 = managers.groupai.state(slot8)

	for _, data in pairs(managers.groupai.state(slot8).all_player_criminals(slot8)) do
		if data.unit ~= player_unit then
			local pos = data.unit.position(slot11)
			slot14 = pos
			local distance = mvector3.distance(data.unit, player_pos)

			if not closest_distance or distance < closest_distance then
				closest_distance = distance
				closest_pos = pos
			end
		end
	end

	if closest_pos then
		slot8 = closest_pos
		slot11 = player_unit

		managers.player.warp_to(slot6, managers.player, player_unit.rotation(slot10))

		return 
	end

	slot7 = player_unit
	slot7 = player_unit.movement(slot6)
	local pos = player_unit.movement(slot6).nav_tracker(slot6).field_position(slot6)
	slot9 = pos
	slot12 = player_unit

	managers.player.warp_to(player_unit.movement(slot6).nav_tracker(slot6), managers.player, player_unit.rotation(slot11))

	return 
end
function PlayerManager:aquire_weapon(upgrade, id)
	if self._global.weapons[id] then
		return 
	end

	self._global.weapons[id] = upgrade

	return 
end
function PlayerManager:unaquire_weapon(upgrade, id)
	self._global.weapons[id] = upgrade

	return 
end
function PlayerManager:aquire_melee_weapon(upgrade, id)
	return 
end
function PlayerManager:unaquire_melee_weapon(upgrade, id)
	return 
end
function PlayerManager:aquire_grenade(upgrade, id)
	return 
end
function PlayerManager:unaquire_grenade(upgrade, id)
	return 
end
function PlayerManager:_verify_equipment_kit(loading)
	slot5 = 1

	if not managers.player.equipment_in_slot(slot3, managers.player) then
		if managers.blackmarket then
			slot8 = 1

			managers.blackmarket.equip_deployable(slot3, managers.blackmarket, managers.player.availible_equipment(loading, managers.player)[1])
		else
			slot6 = 1
			self._global.kit.equipment_slots[1] = managers.player.availible_equipment(slot4, managers.player)[1]
		end
	end

	return 
end
function PlayerManager:aquire_equipment(upgrade, id, loading)
	if self._global.equipment[id] then
		return 
	end

	self._global.equipment[id] = upgrade

	if upgrade.aquire then
		slot8 = UpgradesManager.AQUIRE_STRINGS[1]

		managers.upgrades.aquire_default(slot5, managers.upgrades, upgrade.aquire.upgrade)
	end

	slot7 = loading

	self._verify_equipment_kit(slot5, self)

	return 
end
function PlayerManager:on_killshot(killed_unit, variant)
	slot5 = self
	local player_unit = self.player_unit(slot4)

	if not player_unit then
		return 
	end

	slot8 = killed_unit
	slot6 = killed_unit.base(slot7)._tweak_table

	if CopDamage.is_civilian(slot5) then
		return 
	end

	local t = Application.time(slot5)
	local damage_ext = player_unit.character_damage(Application)
	slot10 = "kill_change_regenerate_speed"

	if managers.player.has_category_upgrade(player_unit, managers.player, "player") then
		slot11 = 1
		local amount = managers.player.body_armor_value(slot7, managers.player, "skill_kill_change_regenerate_speed", nil)
		slot12 = 0
		local multiplier = managers.player.upgrade_value(managers.player, managers.player, "player", "kill_change_regenerate_speed")
		slot12 = tweak_data.upgrades.kill_change_regenerate_speed_percentage

		damage_ext.change_regenerate_speed(managers.player, damage_ext, amount * multiplier)
	end

	if self._on_killshot_t and t < self._on_killshot_t then
		return 
	end

	slot11 = 0
	local regen_armor_bonus = managers.player.upgrade_value(slot7, managers.player, "player", "killshot_regen_armor_bonus")
	slot11 = player_unit
	slot9 = player_unit.movement("killshot_regen_armor_bonus").m_pos("killshot_regen_armor_bonus")
	slot12 = killed_unit
	slot12 = killed_unit.movement(player_unit.movement("killshot_regen_armor_bonus"))
	local dist_sq = mvector3.distance_sq(managers.player, killed_unit.movement(player_unit.movement("killshot_regen_armor_bonus")).m_pos(player_unit.movement("killshot_regen_armor_bonus")))
	local close_combat_sq = tweak_data.upgrades.close_combat_distance * tweak_data.upgrades.close_combat_distance

	if dist_sq <= close_combat_sq then
		slot14 = 0
		regen_armor_bonus = regen_armor_bonus + managers.player.upgrade_value(slot10, managers.player, "player", "killshot_close_regen_armor_bonus")
		slot14 = 0
		local panic_chance = managers.player.upgrade_value(slot10, managers.player, "player", "killshot_close_panic_chance")

		if 0 < panic_chance or panic_chance == -1 then
			slot13 = "enemies"
			local slotmask = managers.slot.get_mask(slot11, managers.slot)
			slot17 = player_unit
			slot17 = player_unit.movement(slot16)
			slot17 = slotmask
			local units = World.find_units_quick(managers.slot, World, "sphere", player_unit.movement(slot16).m_pos(slot16), tweak_data.upgrades.killshot_close_panic_range)
			slot14 = units

			for e_key, unit in pairs(World) do
				slot19 = unit

				if alive(slot18) then
					slot19 = unit

					if unit.character_damage(slot18) then
						slot19 = unit
						slot19 = unit.character_damage(slot18)

						if not unit.character_damage(slot18).dead(slot18) then
							slot19 = unit
							slot21 = panic_chance

							unit.character_damage(slot18).build_suppression(slot18, unit.character_damage(slot18), 0)
						end
					end
				end
			end
		end
	end

	if damage_ext and 0 < regen_armor_bonus then
		slot12 = regen_armor_bonus

		damage_ext.restore_armor(slot10, damage_ext)
	end

	local regen_health_bonus = 0

	if variant == "melee" then
		slot15 = 0
		regen_health_bonus = regen_health_bonus + managers.player.upgrade_value(slot11, managers.player, "player", "melee_kill_life_leech")
	end

	if damage_ext and 0 < regen_health_bonus then
		slot13 = regen_health_bonus

		damage_ext.restore_health(slot11, damage_ext)
	end

	if not tweak_data.upgrades.on_killshot_cooldown then
		slot10 = 0
	end

	self._on_killshot_t = t + slot10

	return 
end
function PlayerManager:chk_store_armor_health_kill_counter(killed_unit, variant)
	slot5 = self
	local player_unit = self.player_unit(slot4)

	if not player_unit then
		return 
	end

	slot8 = killed_unit
	slot6 = killed_unit.base(slot7)._tweak_table

	if CopDamage.is_civilian(slot5) then
		return 
	end

	slot6 = player_unit
	local damage_ext = player_unit.character_damage(slot5)

	if damage_ext then
		slot7 = damage_ext

		if damage_ext.can_store_armor_health(slot6) then
			slot9 = "armor_health_store_amount"

			if managers.player.has_category_upgrade(slot6, managers.player, "player") then
				if not self._armor_health_store_kill_counter then
					slot5 = 0
				end

				self._armor_health_store_kill_counter = slot5
				self._armor_health_store_kill_counter = self._armor_health_store_kill_counter + 1

				if tweak_data.upgrades.armor_health_store_kill_amount <= self._armor_health_store_kill_counter then
					self._armor_health_store_kill_counter = 0
					slot7 = damage_ext
					slot13 = 0

					damage_ext.add_armor_stored_health(slot6, managers.player.upgrade_value(slot9, managers.player, "player", "armor_health_store_amount"))
				end
			end
		end
	end

	return 
end
function PlayerManager:on_damage_dealt(unit, damage_info)
	slot5 = self
	local player_unit = self.player_unit(slot4)

	if not player_unit then
		return 
	end

	local t = Application.time(slot5)
	slot10 = damage_info

	self._check_damage_to_hot(Application, self, t, unit)

	if self._on_damage_dealt_t and t < self._on_damage_dealt_t then
		return 
	end

	if not tweak_data.upgrades.on_damage_dealt_cooldown then
		slot5 = 0
	end

	self._on_damage_dealt_t = t + slot5

	return 
end
function PlayerManager:on_headshot_dealt(is_kill)
	slot4 = self
	local player_unit = self.player_unit(slot3)

	if not player_unit then
		return 
	end

	slot5 = Application
	local t = Application.time(slot4)

	if self._on_headshot_dealt_t and t < self._on_headshot_dealt_t then
		return 
	end

	if not tweak_data.upgrades.on_headshot_dealt_cooldown then
		slot4 = 0
	end

	self._on_headshot_dealt_t = t + slot4
	local damage_ext = player_unit.character_damage(slot5)
	slot10 = 0
	local regen_armor_bonus = managers.player.upgrade_value(player_unit, managers.player, "player", "headshot_regen_armor_bonus")

	if damage_ext and 0 < regen_armor_bonus then
		slot9 = regen_armor_bonus

		damage_ext.restore_armor(slot7, damage_ext)
	end

	if is_kill then
		slot10 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot12)
		}
		slot13 = managers.player

		managers.dialog.queue_dialog(slot7, managers.dialog, "player_gen_critical_hit")
	end

	return 
end
function PlayerManager:_check_damage_to_hot(t, unit, damage_info)

	-- Decompilation error in this vicinity:
	local player_unit = self.player_unit(slot5)
	slot9 = "damage_to_hot"

	if not self.has_category_upgrade(self, self, "player") then
		return 
	end

	slot7 = player_unit
	slot7 = unit

	if damage_info.is_fire_dot_damage then
		return 
	end

	local data = tweak_data.upgrades.damage_to_hot_data

	if not data then
		return 
	end

	if self._next_allowed_doh_t and t < self._next_allowed_doh_t then
		return 
	end

	if not data.add_stack_sources then
		local add_stack_sources = {}
	end

	if not add_stack_sources.swat_van then
		slot9 = unit
	elseif not add_stack_sources.civilian then
		slot11 = unit
		slot9 = unit.base(slot10)._tweak_table

		if CopDamage.is_civilian(slot8) then
			return 
		end
	end

	if not add_stack_sources[damage_info.variant] then
		return 
	end

	slot9 = player_unit
	slot9 = player_unit.character_damage(slot8)

	player_unit.character_damage(slot8).add_damage_to_hot(slot8)

	self._next_allowed_doh_t = t + data.stacking_cooldown

	return 
end
function PlayerManager:unaquire_equipment(upgrade, id)
	if not self._global.equipment[id] then
		return 
	end

	slot6 = upgrade.slot

	if managers.player.equipment_in_slot(slot4, managers.player) ~= id then
		slot3 = false
	else
		local is_equipped = true
	end

	self._global.equipment[id] = nil

	if is_equipped then
		self._global.kit.equipment_slots[upgrade.slot] = nil
		slot7 = false

		self._verify_equipment_kit(upgrade.slot, self)
	end

	if upgrade.aquire then
		slot8 = UpgradesManager.AQUIRE_STRINGS[1]

		managers.upgrades.unaquire(slot5, managers.upgrades, upgrade.aquire.upgrade)
	end

	return 
end
function PlayerManager:aquire_upgrade(upgrade)
	slot2 = self._global.upgrades
	slot3 = upgrade.category

	if not self._global.upgrades[upgrade.category] then
		slot4 = {}
	end

	slot2[slot3] = slot4
	slot2 = self._global.upgrades[upgrade.category]
	slot3 = upgrade.upgrade
	slot4 = math.max
	slot6 = upgrade.value

	if not self._global.upgrades[upgrade.category][upgrade.upgrade] then
		slot7 = 0
	end

	slot2[slot3] = slot4(slot5, slot6)
	local value = tweak_data.upgrades.values[upgrade.category][upgrade.upgrade][upgrade.value]

	if self[upgrade.upgrade] then
		slot6 = value

		self[upgrade.upgrade](slot4, self)
	end

	return 
end
function PlayerManager:unaquire_upgrade(upgrade)
	if not self._global.upgrades[upgrade.category] then
		slot6 = upgrade.category

		Application.error(slot3, Application, "[PlayerManager:unaquire_upgrade] Can't unaquire upgrade of category")

		return 
	end

	if not self._global.upgrades[upgrade.category][upgrade.upgrade] then
		slot6 = upgrade.upgrade

		Application.error(slot3, Application, "[PlayerManager:unaquire_upgrade] Can't unaquire upgrade")

		return 
	end

	self._global.upgrades[upgrade.category][upgrade.upgrade] = nil

	return 
end
function PlayerManager:aquire_incremental_upgrade(upgrade)
	slot2 = self._global.upgrades
	slot3 = upgrade.category

	if not self._global.upgrades[upgrade.category] then
		slot4 = {}
	end

	slot2[slot3] = slot4
	local val = self._global.upgrades[upgrade.category][upgrade.upgrade]
	slot3 = self._global.upgrades[upgrade.category]
	slot4 = upgrade.upgrade

	if not val then
		slot5 = 0
	end

	slot3[slot4] = slot5 + 1
	local value = tweak_data.upgrades.values[upgrade.category][upgrade.upgrade][self._global.upgrades[upgrade.category][upgrade.upgrade]]

	if self[upgrade.upgrade] then
		slot7 = value

		self[upgrade.upgrade](slot5, self)
	end

	return 
end
function PlayerManager:unaquire_incremental_upgrade(upgrade)
	if not self._global.upgrades[upgrade.category] then
		slot6 = upgrade.category

		Application.error(slot3, Application, "[PlayerManager:unaquire_incremental_upgrade] Can't unaquire upgrade of category")

		return 
	end

	if not self._global.upgrades[upgrade.category][upgrade.upgrade] then
		slot6 = upgrade.upgrade

		Application.error(slot3, Application, "[PlayerManager:unaquire_incremental_upgrade] Can't unaquire upgrade")

		return 
	end

	local val = self._global.upgrades[upgrade.category][upgrade.upgrade]
	val = val - 1
	slot3 = self._global.upgrades[upgrade.category]
	slot4 = upgrade.upgrade

	if 0 >= val or not val then
		slot5 = nil
	end

	slot3[slot4] = slot5

	if self._global.upgrades[upgrade.category][upgrade.upgrade] then
		local value = tweak_data.upgrades.values[upgrade.category][upgrade.upgrade][self._global.upgrades[upgrade.category][upgrade.upgrade]]

		if self[upgrade.upgrade] then
			slot7 = value

			self[upgrade.upgrade](slot5, self)
		end
	end

	return 
end
function PlayerManager:sync_upgrades()
	local player = self.local_player(slot2)
	slot8 = 1
	slot11 = player

	player.send(self, player, "sync_upgrade", UpgradesTweakData.CLEAR_UPGRADES_FLAG, "", player.id(slot10))

	slot4 = self._global.upgrades

	for category, upgrades in pairs(self) do
		slot9 = upgrades

		for upgrade, level in pairs(slot8) do
			slot18 = level
			slot21 = player

			player.send(slot13, player, "sync_upgrade", category, upgrade, player.id(slot20))
		end
	end

	return 
end
function PlayerManager:upgrade_value(category, upgrade, default)
	if not self._global.upgrades[category] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	if not self._global.upgrades[category][upgrade] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	local level = self._global.upgrades[category][upgrade]
	local value = tweak_data.upgrades.values[category][upgrade][level]

	return value
end
function PlayerManager:list_level_rewards(dlcs)
	slot5 = dlcs

	return managers.upgrades.list_level_rewards(slot3, managers.upgrades)
end
function PlayerManager:activate_temporary_upgrade(category, upgrade)
	slot7 = upgrade
	local upgrade_value = self.upgrade_value(slot4, self, category)

	if upgrade_value == 0 then
		return 
	end

	local time = upgrade_value[2]
	slot5 = self._temporary_upgrades

	if not self._temporary_upgrades[category] then
		slot6 = {}
	end

	slot5[category] = slot6
	self._temporary_upgrades[category][upgrade] = {}
	slot8 = Application
	self._temporary_upgrades[category][upgrade].expire_time = Application.time(slot7) + time

	return 
end
function PlayerManager:activate_temporary_upgrade_by_level(category, upgrade, level)
	slot9 = 0

	if not self.upgrade_level(slot5, self, category, upgrade) then
		local upgrade_level = 0
	end

	if upgrade_level < level then
		return 
	end

	slot11 = 0
	local upgrade_value = self.upgrade_value_by_level(slot6, self, category, upgrade, level)

	if upgrade_value == 0 then
		return 
	end

	local time = upgrade_value[2]
	slot7 = self._temporary_upgrades

	if not self._temporary_upgrades[category] then
		slot8 = {}
	end

	slot7[category] = slot8
	self._temporary_upgrades[category][upgrade] = {
		upgrade_value = upgrade_value[1]
	}
	slot10 = Application
	self._temporary_upgrades[category][upgrade].expire_time = Application.time(slot9) + time

	return 
end
function PlayerManager:deactivate_temporary_upgrade(category, upgrade)
	slot7 = upgrade
	local upgrade_value = self.upgrade_value(slot4, self, category)

	if upgrade_value == 0 then
		return 
	end

	if not self._temporary_upgrades[category] then
		return 
	end

	self._temporary_upgrades[category][upgrade] = nil

	return 
end
function PlayerManager:has_activate_temporary_upgrade(category, upgrade)
	slot7 = upgrade
	local upgrade_value = self.upgrade_value(slot4, self, category)

	if upgrade_value == 0 then
		return false
	end

	if not self._temporary_upgrades[category] then
		return false
	end

	if not self._temporary_upgrades[category][upgrade] then
		return false
	end

	slot7 = Application

	if Application.time(slot6) >= self._temporary_upgrades[category][upgrade].expire_time then
		slot4 = false
	else
		slot4 = true
	end

	return slot4
end
function PlayerManager:get_activate_temporary_expire_time(category, upgrade)
	slot7 = upgrade
	local upgrade_value = self.upgrade_value(slot4, self, category)

	if upgrade_value == 0 then
		return 0
	end

	if not self._temporary_upgrades[category] then
		return 0
	end

	if not self._temporary_upgrades[category][upgrade] then
		return 0
	end

	if not self._temporary_upgrades[category][upgrade].expire_time then
		slot4 = 0
	end

	return slot4
end
function PlayerManager:temporary_upgrade_value(category, upgrade, default)
	slot8 = upgrade
	local upgrade_value = self.upgrade_value(slot5, self, category)

	if upgrade_value == 0 then
		if not default then
			slot5 = 0
		end

		return slot5
	end

	if not self._temporary_upgrades[category] then
		if not default then
			slot5 = 0
		end

		return slot5
	end

	if not self._temporary_upgrades[category][upgrade] then
		if not default then
			slot5 = 0
		end

		return slot5
	end

	slot8 = Application

	if self._temporary_upgrades[category][upgrade].expire_time < Application.time(slot7) then
		if not default then
			slot5 = 0
		end

		return slot5
	end

	if self._temporary_upgrades[category][upgrade].upgrade_value then
		return self._temporary_upgrades[category][upgrade].upgrade_value
	end

	return upgrade_value[1]
end
function PlayerManager:equiptment_upgrade_value(category, upgrade, default)
	if category == "trip_mine" and upgrade == "quantity" then
		slot9 = default
		slot10 = default
		slot10 = default

		return self.upgrade_value(slot5, self, category, "quantity_1") + self.upgrade_value(self, self, category, "quantity_2") + self.upgrade_value(self, self, category, "quantity_3")
	end

	slot9 = default

	return self.upgrade_value(slot5, self, category, upgrade)
end
function PlayerManager:upgrade_level(category, upgrade, default)
	if not self._global.upgrades[category] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	if not self._global.upgrades[category][upgrade] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	local level = self._global.upgrades[category][upgrade]

	return level
end
function PlayerManager:upgrade_value_by_level(category, upgrade, level, default)
	if not tweak_data.upgrades.values[category][upgrade][level] and not default then
		slot5 = 0
	end

	return slot5
end
function PlayerManager:equipped_upgrade_value(equipped, category, upgrade)
	slot8 = upgrade

	if not self.has_category_upgrade(slot5, self, category) then
		return 0
	end

	slot7 = equipped

	if not table.contains(slot5, self._global.kit.equipment_slots) then
		return 0
	end

	slot8 = upgrade

	return self.upgrade_value(slot5, self, category)
end
function PlayerManager:has_category_upgrade(category, upgrade)
	if not self._global.upgrades[category] then
		return false
	end

	if not self._global.upgrades[category][upgrade] then
		return false
	end

	return true
end
function PlayerManager:body_armor_value(category, override_value, default)
	slot9 = true
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket.equipped_armor(slot6, managers.blackmarket, true)]
	slot11 = {}
	slot5 = self.upgrade_value_by_level(slot6, self, "player", "body_armor", category)

	if not override_value then
		slot6 = armor_data.upgrade_level
	end

	if not slot5[slot6] and not default then
		slot5 = 0
	end

	return slot5
end
function PlayerManager:get_infamy_exp_multiplier()
	local multiplier = 1

	return multiplier
end
function PlayerManager:update_hostage_skills()
	self._hostage_skills_update = true

	return 
end
function PlayerManager:_update_hostage_skills()
	if self._hostage_skills_update then
		slot4 = "health"

		if self.get_hostage_bonus_multiplier(slot2, self) ~= 1 then
			local player_unit = self.player_unit(slot2)
			slot4 = player_unit

			if alive(self) then
				slot4 = player_unit
				local damage_ext = player_unit.character_damage(slot3)

				if damage_ext then
					slot6 = 0

					damage_ext.change_health(slot4, damage_ext)
				end
			end
		end

		self._hostage_skills_update = nil
	end

	return 
end
function PlayerManager:get_hostage_bonus_multiplier(category)

	-- Decompilation error in this vicinity:
	slot5 = self

	if not self.num_local_minions(slot4) then
		local minions = 0
	end

	local multiplier = 0
	local hostages = hostages + minions
	slot10 = category
	local hostage_max_num = tweak_data.get_raw_value(slot6, tweak_data, "upgrades", "hostage_max_num")

	if hostage_max_num then
		slot9 = hostage_max_num
		hostages = math.min(slot7, hostages)
	end

	slot11 = 1
	multiplier = (multiplier + self.team_upgrade_value(slot7, self, category, "hostage_multiplier")) - 1
	slot11 = 1
	multiplier = (multiplier + self.team_upgrade_value(slot7, self, category, "passive_hostage_multiplier")) - 1
	slot11 = 1
	multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "hostage_" .. category .. "_multiplier")) - 1
	slot11 = 1
	multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "passive_hostage_" .. category .. "_multiplier")) - 1
	local local_player = self.local_player(slot7)
	slot11 = "close_to_hostage_boost"

	if self.has_category_upgrade(self, self, "player") and self._is_local_close_to_hostage then
		multiplier = multiplier * tweak_data.upgrades.hostage_near_player_multiplier
	end

	return 1 + multiplier * hostages
end
function PlayerManager:get_hostage_bonus_addend(category)

	-- Decompilation error in this vicinity:
	slot5 = self

	if not self.num_local_minions(slot4) then
		local minions = 0
	end

	local addend = 0
	local hostages = hostages + minions
	slot10 = category
	local hostage_max_num = tweak_data.get_raw_value(slot6, tweak_data, "upgrades", "hostage_max_num")

	if hostage_max_num then
		slot9 = hostage_max_num
		hostages = math.min(slot7, hostages)
	end

	slot11 = 0
	addend = addend + self.team_upgrade_value(slot7, self, category, "hostage_addend")
	slot11 = 0
	addend = addend + self.team_upgrade_value(slot7, self, category, "passive_hostage_addend")
	slot11 = 0
	addend = addend + self.upgrade_value(slot7, self, "player", "hostage_" .. category .. "_addend")
	slot11 = 0
	addend = addend + self.upgrade_value(slot7, self, "player", "passive_hostage_" .. category .. "_addend")
	local local_player = self.local_player(slot7)
	slot11 = "close_to_hostage_boost"

	if self.has_category_upgrade(self, self, "player") and self._is_local_close_to_hostage then
		addend = addend * tweak_data.upgrades.hostage_near_player_multiplier
	end

	return addend * hostages
end
function PlayerManager:movement_speed_multiplier(is_running, is_climbing, is_crouching, in_steelsight)
	local multiplier = 1

	if is_running then
		slot11 = 1
		multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "run_speed_increase")) - 1
	end

	if is_climbing then
		slot11 = 1
		multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "climb_speed_increase")) - 1
	end

	if is_crouching then
		slot11 = 1
		multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "crouch_speed_increase")) - 1
	end

	if in_steelsight then
		slot11 = 1
		multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "steelsight_speed_increase")) - 1
	end

	slot11 = 1
	multiplier = (multiplier + self.upgrade_value(slot7, self, "player", "all_movement_speed_increase")) - 1
	slot11 = 0
	slot12 = 1
	local warcry_multiplier = self.team_upgrade_value(slot7, self, "player", "warcry_movement_speed_multiplier") * self.team_upgrade_value(self, self, "player", "warcry_team_movement_speed_bonus")

	if 0 < warcry_multiplier then
		warcry_multiplier = warcry_multiplier - 1
	end

	multiplier = multiplier + warcry_multiplier

	return multiplier
end
function PlayerManager:mod_movement_penalty(movement_penalty)
	slot7 = 1
	local skill_mods = self.upgrade_value(slot3, self, "player", "passive_armor_movement_penalty_multiplier")

	if skill_mods < 1 and movement_penalty < 1 then
		local penalty = 1 - movement_penalty
		penalty = penalty * skill_mods
		movement_penalty = 1 - penalty
	end

	return movement_penalty
end
function PlayerManager:body_armor_skill_multiplier(override_armor)
	local multiplier = 1
	slot8 = 1
	multiplier = (multiplier + self.upgrade_value(slot4, self, "player", "tier_armor_multiplier")) - 1
	slot8 = 1
	multiplier = (multiplier + self.upgrade_value(slot4, self, "player", "passive_armor_multiplier")) - 1
	slot8 = 1
	multiplier = (multiplier + self.upgrade_value(slot4, self, "player", "armor_multiplier")) - 1
	slot8 = 1
	multiplier = (multiplier + self.team_upgrade_value(slot4, self, "armor", "multiplier")) - 1
	slot6 = "armor"
	multiplier = (multiplier + self.get_hostage_bonus_multiplier(slot4, self)) - 1
	slot8 = 1
	multiplier = (multiplier + self.upgrade_value(slot4, self, "player", "perk_armor_loss_multiplier")) - 1
	slot5 = self
	slot3 = self.upgrade_value
	slot6 = "player"
	slot7 = tostring

	if not override_armor then
		slot13 = true
		slot9 = managers.blackmarket.equipped_armor(slot10, managers.blackmarket, true)
	end

	multiplier = (multiplier + slot3(slot4, slot5, slot6, slot7(1) .. "_armor_multiplier")) - 1

	return multiplier
end
function PlayerManager:body_armor_regen_multiplier(moving, health_ratio)
	local multiplier = 1
	slot9 = 1
	multiplier = multiplier * self.upgrade_value(slot5, self, "player", "armor_regen_timer_multiplier_tier")
	slot9 = 1
	multiplier = multiplier * self.upgrade_value(slot5, self, "player", "armor_regen_timer_multiplier")
	slot9 = 1
	multiplier = multiplier * self.upgrade_value(slot5, self, "player", "armor_regen_timer_multiplier_passive")
	slot9 = 1
	multiplier = multiplier * self.team_upgrade_value(slot5, self, "armor", "regen_time_multiplier")
	slot9 = 1
	multiplier = multiplier * self.team_upgrade_value(slot5, self, "armor", "passive_regen_time_multiplier")
	slot9 = 1
	multiplier = multiplier * self.upgrade_value(slot5, self, "player", "perk_armor_regen_timer_multiplier")

	if not moving then
		slot9 = 1
		multiplier = multiplier * managers.player.upgrade_value(slot5, managers.player, "player", "armor_regen_timer_stand_still_multiplier")
	end

	if health_ratio then
		slot8 = "armor_regen"
		local damage_health_ratio = self.get_damage_health_ratio(slot5, self, health_ratio)
		slot10 = 0
		multiplier = multiplier * (1 - managers.player.upgrade_value(self, managers.player, "player", "armor_regen_damage_health_ratio_multiplier") * damage_health_ratio)
	end

	return multiplier
end
function PlayerManager:body_armor_skill_addend(override_armor)
	local addend = 0
	slot5 = self
	slot3 = self.upgrade_value
	slot6 = "player"
	slot7 = tostring

	if not override_armor then
		slot13 = true
		slot9 = managers.blackmarket.equipped_armor(slot10, managers.blackmarket, true)
	end

	addend = addend + slot3(slot4, slot5, slot6, slot7(0) .. "_armor_addend")

	return addend
end
function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
	slot11 = 0
	local chance = self.upgrade_value(slot7, self, "player", "warcry_dodge")

	return chance
end
function PlayerManager:stamina_multiplier()
	local multiplier = 1
	slot7 = 1
	multiplier = (multiplier + self.upgrade_value(slot3, self, "player", "stamina_multiplier")) - 1
	slot7 = 1
	multiplier = (multiplier + self.team_upgrade_value(slot3, self, "player", "warcry_stamina_multiplier")) - 1

	return multiplier
end
function PlayerManager:critical_hit_chance()
	local multiplier = 0
	slot7 = 1
	multiplier = multiplier + self.upgrade_value(slot3, self, "player", "critical_hit_chance") - 1
	slot5 = BuffEffectManager.EFFECT_PLAYER_CRITICAL_HIT_CHANCE

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot5 = BuffEffectManager.EFFECT_PLAYER_CRITICAL_HIT_CHANCE

		if not managers.buff_effect.get_effect_value(slot3, managers.buff_effect) then
			slot2 = 1
		end

		multiplier = multiplier * slot2
	end

	return multiplier
end
function PlayerManager:get_value_from_risk_upgrade(risk_upgrade, detection_risk)
	local risk_value = 0

	if not detection_risk then
		slot6 = managers.blackmarket
		slot4 = managers.blackmarket.get_suspicion_offset_of_local

		if not tweak_data.player.SUSPICION_OFFSET_LERP then
			slot7 = 0.75
		end

		detection_risk = slot4(slot5, slot6)
		slot6 = detection_risk * 100
		detection_risk = math.round(slot5)
	end

	if risk_upgrade then
		slot6 = risk_upgrade

		if type(slot5) == "table" then
			local value = risk_upgrade[1]
			local step = risk_upgrade[2]
			local operator = risk_upgrade[3]
			local threshold = risk_upgrade[4]
			local cap = risk_upgrade[5]
			local num_steps = 0

			if operator == "above" then
				slot14 = (detection_risk - threshold) / step
				num_steps = math.max(slot11, math.floor(0))
			elseif operator == "below" then
				slot14 = (threshold - detection_risk) / step
				num_steps = math.max(slot11, math.floor(0))
			end

			risk_value = num_steps * value

			if cap then
				slot13 = risk_value

				if not math.min(slot11, cap) then
				end
			end
		end
	end

	return risk_value
end
function PlayerManager:health_skill_multiplier()
	local multiplier = 1
	slot7 = 1
	multiplier = (multiplier + self.upgrade_value(slot3, self, "player", "max_health_multiplier")) - 1

	return multiplier
end
function PlayerManager:health_regen()
	local health_regen = nil

	if self._unit then
		slot4 = self._unit
		slot4 = self._unit.character_damage(slot3)
		health_regen = self._unit.character_damage(slot3).get_base_health_regen(slot3)
	else
		slot4 = tweak_data.player
		slot2 = tweak_data.player.get_tweak_data_for_class
		slot7 = managers.skilltree

		if not managers.skilltree.get_character_profile_class(slot6) then
			slot5 = "recon"
		end

		local class_tweak_data = slot2(slot3, slot4)
		health_regen = class_tweak_data.damage.HEALTH_REGEN
	end

	slot7 = 0
	health_regen = health_regen + self.team_upgrade_value(slot3, self, "player", "warcry_health_regeneration")
	slot5 = BuffEffectManager.EFFECT_PLAYER_HEALTH_REGEN

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot5 = BuffEffectManager.EFFECT_PLAYER_HEALTH_REGEN
		health_regen = health_regen + managers.buff_effect.get_effect_value(slot3, managers.buff_effect)
	end

	return health_regen
end
function PlayerManager:max_health()
	slot3 = self
	slot3 = self.player_unit(slot2)
	local base_health = self.player_unit(slot2).character_damage(slot2).get_base_health(slot2)
	slot4 = self
	local health = base_health * self.health_skill_multiplier(self.player_unit(slot2).character_damage(slot2))

	return health
end
function PlayerManager:damage_reduction_skill_multiplier(damage_type, current_state)
	local multiplier = 1

	if damage_type == "melee" then
		slot9 = 1
		multiplier = multiplier * self.upgrade_value(slot5, self, "player", "melee_damage_reduction")
	end

	if damage_type == "bullet" then
		slot9 = 1
		multiplier = multiplier * self.upgrade_value(slot5, self, "player", "bullet_damage_reduction")
	end

	slot8 = "on_revived_damage_reduction"

	if self.has_activate_temporary_upgrade(slot5, self, "temporary") then
		slot9 = 1
		multiplier = multiplier * self.temporary_upgrade_value(slot5, self, "temporary", "on_revived_damage_reduction")
	end

	if current_state then
		slot6 = current_state

		if current_state._interacting(slot5) then
			slot9 = 1
			multiplier = multiplier * self.upgrade_value(slot5, self, "player", "interacting_damage_reduction")
		end

		slot6 = current_state

		if current_state.running(slot5) then
			slot9 = 1
			multiplier = multiplier * self.upgrade_value(slot5, self, "player", "running_damage_reduction")
		end

		slot6 = current_state

		if current_state.ducking(slot5) then
			slot9 = 1
			multiplier = multiplier * self.upgrade_value(slot5, self, "player", "crouching_damage_reduction")
		end
	end

	slot9 = 1
	slot10 = 1
	multiplier = multiplier * self.team_upgrade_value(slot5, self, "player", "warcry_damage_reduction_multiplier") * self.team_upgrade_value(self, self, "player", "warcry_team_damage_reduction_bonus")

	return multiplier
end
function PlayerManager:thick_skin_value()
	slot5 = "thick_skin"

	if not self.has_category_upgrade(slot2, self, "player") then
		return 0
	end

	slot4 = "thick_skin"

	if not table.contains(slot2, self._global.kit.equipment_slots) then
		return 0
	end

	slot5 = "thick_skin"

	return self.upgrade_value(slot2, self, "player")
end
function PlayerManager:toolset_value()
	slot5 = "toolset"

	if not self.has_category_upgrade(slot2, self, "player") then
		return 1
	end

	slot4 = "toolset"

	if not table.contains(slot2, self._global.kit.equipment_slots) then
		return 1
	end

	slot5 = "toolset"

	return self.upgrade_value(slot2, self, "player")
end
function PlayerManager:inspect_current_upgrades()
	slot3 = self._global.upgrades

	for name, upgrades in pairs(slot2) do
		slot8 = "Weapon " .. name .. ":"

		print(slot7)

		slot8 = upgrades

		for upgrade, level in pairs(slot7) do
			slot17 = "and has value"
			slot21 = tweak_data.upgrades.values[name][upgrade][level]

			print(slot12, "Upgrade:", upgrade, "is at level", level, string.format(slot19, "%.2f"))
		end

		slot8 = "\n"

		print(slot7)
	end

	return 
end
function PlayerManager:spread_multiplier()
	slot5 = self

	if not alive(self.player_unit(slot4)) then
		return 
	end

	slot3 = self
	slot3 = self.player_unit(slot2)
	slot3 = self.player_unit(slot2).movement(slot2)._current_state

	self.player_unit(slot2).movement(slot2)._current_state._update_crosshair_offset(slot2)

	return 
end
function PlayerManager:weapon_upgrade_progress(weapon_id)
	local current = 0
	local total = 0

	if self._global.upgrades[weapon_id] then
		slot6 = self._global.upgrades[weapon_id]

		for upgrade, value in pairs(slot5) do
			current = current + value
		end
	end

	if tweak_data.upgrades.values[weapon_id] then
		slot6 = tweak_data.upgrades.values[weapon_id]

		for _, values in pairs(slot5) do
			total = total + #values
		end
	end

	return current, total
end
function PlayerManager:equipment_upgrade_progress(equipment_id)
	local current = 0
	local total = 0

	if tweak_data.upgrades.values[equipment_id] then
		if self._global.upgrades[equipment_id] then
			slot6 = self._global.upgrades[equipment_id]

			for upgrade, value in pairs(slot5) do
				current = current + value
			end
		end

		slot6 = tweak_data.upgrades.values[equipment_id]

		for _, values in pairs(slot5) do
			total = total + #values
		end

		return current, total
	end

	if tweak_data.upgrades.values.player[equipment_id] then
		if self._global.upgrades.player and self._global.upgrades.player[equipment_id] then
			current = self._global.upgrades.player[equipment_id]
		end

		total = #tweak_data.upgrades.values.player[equipment_id]

		return current, total
	end

	if tweak_data.upgrades.definitions[equipment_id] and tweak_data.upgrades.definitions[equipment_id].aquire then
		local upgrade = tweak_data.upgrades.definitions[tweak_data.upgrades.definitions[equipment_id].aquire.upgrade]
		slot8 = upgrade.upgrade.upgrade

		return self.equipment_upgrade_progress(slot6, self)
	end

	return current, total
end
function PlayerManager:has_weapon(name)
	return managers.player._global.weapons[name]
end
function PlayerManager:has_aquired_equipment(name)
	return managers.player._global.equipment[name]
end
function PlayerManager:availible_weapons(slot)
	local weapons = {}
	slot5 = managers.player._global.weapons

	for name, _ in pairs(slot4) do
		if not slot or (slot and tweak_data.weapon[name].use_data.selection_index == slot) then
			slot11 = name

			table.insert(slot9, weapons)
		end
	end

	return weapons
end
function PlayerManager:weapon_in_slot(slot)
	local weapon = self._global.kit.weapon_slots[slot]

	if self._global.weapons[weapon] then
		return weapon
	end

	local weapon = self._global.default_kit.weapon_slots[slot]

	if self._global.weapons[weapon] then
		slot4 = weapon
	end

	return slot4
end
function PlayerManager:availible_equipment(slot)
	local equipment = {}
	slot5 = self._global.equipment

	for name, _ in pairs(slot4) do
		if not slot or (slot and tweak_data.upgrades.definitions[name].slot == slot) then
			slot11 = name

			table.insert(slot9, equipment)
		end
	end

	return equipment
end
function PlayerManager:equipment_in_slot(slot)
	return self._global.kit.equipment_slots[slot]
end
function PlayerManager:toggle_player_rule(rule)
	self._rules[rule] = not self._rules[rule]

	if rule == "no_run" and self._rules[rule] then
		local player = self.player_unit(slot3)
		slot5 = player
		slot5 = player.movement(self)

		if player.movement(self).current_state(self)._interupt_action_running then
			slot5 = player
			slot5 = player.movement(slot4)
			slot5 = player.movement(slot4).current_state(slot4)
			slot8 = Application

			player.movement(slot4).current_state(slot4)._interupt_action_running(slot4, Application.time(slot7))
		end
	end

	return 
end
function PlayerManager:set_player_rule(rule, value)
	slot3 = self._rules
	slot4 = self._rules[rule]

	if value then
		slot5 = 1
	else
		slot5 = -1
	end

	slot3[rule] = slot4 + slot5

	if rule == "no_run" then
		slot6 = rule

		if self.get_player_rule(slot4, self) then
			local player = self.player_unit(slot4)
			slot6 = player
			slot6 = player.movement(self)

			if player.movement(self).current_state(self)._interupt_action_running then
				slot6 = player
				slot6 = player.movement(slot5)
				slot6 = player.movement(slot5).current_state(slot5)
				slot9 = Application

				player.movement(slot5).current_state(slot5)._interupt_action_running(slot5, Application.time(slot8))
			end
		end
	end

	return 
end
function PlayerManager:get_player_rule(rule)
	if 0 >= self._rules[rule] then
		slot2 = false
	else
		slot2 = true
	end

	return slot2
end
function PlayerManager:has_deployable_been_used()
	if not self._peer_used_deployable then
		slot1 = false
	end

	return slot1
end
function PlayerManager:update_deployable_equipment_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_deployables[peer_id] then
		local deployable = self._global.synced_deployables[peer_id].deployable
		local amount = self._global.synced_deployables[peer_id].amount
		slot10 = amount

		peer.send_queued_sync(slot6, peer, "sync_deployable_equipment", deployable)
	end

	return 
end
function PlayerManager:update_deployable_equipment_amount_to_peers(equipment, amount)
	slot5 = managers.network
	local peer = managers.network.session(slot4).local_peer(slot4)
	slot6 = managers.network
	slot9 = amount

	managers.network.session(managers.network.session(slot4)).send_to_peers_synched(managers.network.session(slot4), managers.network.session(managers.network.session(slot4)), "sync_deployable_equipment", equipment)

	slot9 = amount

	self.set_synced_deployable_equipment(managers.network.session(slot4), self, peer, equipment)

	return 
end
function PlayerManager:set_synced_deployable_equipment(peer, deployable, amount)
	slot6 = peer
	local peer_id = peer.id(slot5)

	if self._global.synced_deployables[peer_id] then
		if self._global.synced_deployables[peer_id].deployable ~= deployable then
			slot5 = false
		else
			local only_update_amount = true
		end
	end

	if not self._peer_used_deployable and self._global.synced_deployables[peer_id] and (self._global.synced_deployables[peer_id].deployable ~= deployable or self._global.synced_deployables[peer_id].amount ~= amount) then
		self._peer_used_deployable = true
	end

	self._global.synced_deployables[peer_id] = {
		deployable = deployable,
		amount = amount
	}
	slot9 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(, managers.criminals)

	if character_data and character_data.panel_id then
		local icon = tweak_data.equipments[deployable].icon

		if only_update_amount then
			slot13 = {
				icon = icon,
				amount = amount
			}

			managers.hud.set_teammate_deployable_equipment_amount(slot9, managers.hud, character_data.panel_id, 1)
		else
			slot12 = {
				icon = icon,
				amount = amount
			}

			managers.hud.set_deployable_equipment(slot9, managers.hud, character_data.panel_id)
		end
	end

	slot9 = managers.network
	slot9 = managers.network.session(slot8)
	slot9 = managers.network.session(slot8).local_peer(slot8)
	local local_peer_id = managers.network.session(slot8).local_peer(slot8).id(slot8)

	if peer_id ~= local_peer_id then
		local unit = peer.unit(slot9)
		slot11 = unit

		if alive(peer) then
			slot11 = unit
			slot13 = amount

			unit.movement(slot10).set_visual_deployable_equipment(slot10, unit.movement(slot10), deployable)
		end
	end

	return 
end
function PlayerManager:get_synced_deployable_equipment(peer_id)
	return self._global.synced_deployables[peer_id]
end
function PlayerManager:update_cable_ties_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_cable_ties[peer_id] then
		local amount = self._global.synced_cable_ties[peer_id].amount
		slot8 = amount

		peer.send_queued_sync(slot5, peer, "sync_cable_ties")
	end

	return 
end
function PlayerManager:update_synced_cable_ties_to_peers(amount)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)
	slot5 = managers.network
	slot7 = amount

	managers.network.session(managers.network.session(slot3).local_peer(slot3)).send_to_peers_synched(managers.network.session(slot3).local_peer(slot3), managers.network.session(managers.network.session(slot3).local_peer(slot3)), "sync_cable_ties")

	slot7 = amount

	self.set_synced_cable_ties(managers.network.session(slot3).local_peer(slot3), self, peer_id)

	return 
end
function PlayerManager:set_synced_cable_ties(peer_id, amount)
	local only_update_amount = false

	if self._global.synced_cable_ties[peer_id] and amount < self._global.synced_cable_ties[peer_id].amount then
		slot6 = managers.network

		if managers.network.session(slot5) then
			slot6 = managers.network
			slot7 = peer_id

			if managers.network.session(slot5).peer(slot5, managers.network.session(slot5)) then
				slot6 = managers.network
				slot7 = peer_id
				local peer = managers.network.session(slot5).peer(slot5, managers.network.session(slot5))
				slot7 = peer

				peer.on_used_cable_tie(managers.network.session(slot5))
			end
		end
	end

	self._global.synced_cable_ties[peer_id] = {
		amount = amount
	}

	return 
end
function PlayerManager:get_synced_cable_ties(peer_id)
	return self._global.synced_cable_ties[peer_id]
end
function PlayerManager:update_ammo_info_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_ammo_info[peer_id] then
		slot5 = self._global.synced_ammo_info[peer_id]

		for selection_index, ammo_info in pairs(slot4) do
			slot12 = selection_index
			slot15 = ammo_info

			peer.send_queued_sync(slot9, peer, "sync_ammo_amount", unpack(slot14))
		end
	end

	return 
end
function PlayerManager:update_synced_ammo_info_to_peers(selection_index, max_clip, current_clip, current_left, max)
	slot8 = managers.network
	slot8 = managers.network.session(slot7)
	local peer_id = managers.network.session(slot7).local_peer(slot7).id(slot7)
	slot9 = managers.network
	slot15 = max

	managers.network.session(managers.network.session(slot7).local_peer(slot7)).send_to_peers_synched(managers.network.session(slot7).local_peer(slot7), managers.network.session(managers.network.session(slot7).local_peer(slot7)), "sync_ammo_amount", selection_index, max_clip, current_clip, current_left)

	slot15 = max

	self.set_synced_ammo_info(managers.network.session(slot7).local_peer(slot7), self, peer_id, selection_index, max_clip, current_clip, current_left)

	return 
end
function PlayerManager:set_synced_ammo_info(peer_id, selection_index, max_clip, current_clip, current_left, max)
	slot7 = self._global.synced_ammo_info

	if not self._global.synced_ammo_info[peer_id] then
		slot8 = {}
	end

	slot7[peer_id] = slot8
	self._global.synced_ammo_info[peer_id][selection_index] = {
		max_clip,
		current_clip,
		current_left,
		max
	}
	slot10 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(, managers.criminals)

	if character_data and character_data.panel_id then
	end

	return 
end
function PlayerManager:get_synced_ammo_info(peer_id)
	return self._global.synced_ammo_info[peer_id]
end
function PlayerManager:update_carry_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_carry[peer_id] then
		local carry_id = self._global.synced_carry[peer_id].carry_id
		local multiplier = self._global.synced_carry[peer_id].multiplier
		local dye_initiated = self._global.synced_carry[peer_id].dye_initiated
		local has_dye_pack = self._global.synced_carry[peer_id].has_dye_pack
		local dye_value_multiplier = self._global.synced_carry[peer_id].dye_value_multiplier
		slot16 = dye_value_multiplier

		peer.send_queued_sync(slot9, peer, "sync_carry", carry_id, multiplier, dye_initiated, has_dye_pack)
	end

	return 
end
function PlayerManager:update_synced_carry_to_peers(carry_id, multiplier, dye_initiated, has_dye_pack, dye_value_multiplier)
	slot8 = managers.network
	local peer = managers.network.session(slot7).local_peer(slot7)
	slot9 = managers.network
	slot15 = dye_value_multiplier

	managers.network.session(managers.network.session(slot7)).send_to_peers_synched(managers.network.session(slot7), managers.network.session(managers.network.session(slot7)), "sync_carry", carry_id, multiplier, dye_initiated, has_dye_pack)

	slot15 = dye_value_multiplier

	self.set_synced_carry(managers.network.session(slot7), self, peer, carry_id, multiplier, dye_initiated, has_dye_pack)

	return 
end
function PlayerManager:set_synced_carry(peer, carry_id, multiplier, dye_initiated, has_dye_pack, dye_value_multiplier)
	slot9 = peer
	local peer_id = peer.id(slot8)
	self._global.synced_carry[peer_id] = {
		carry_id = carry_id,
		multiplier = multiplier,
		dye_initiated = dye_initiated,
		has_dye_pack = has_dye_pack,
		dye_value_multiplier = dye_value_multiplier
	}
	slot11 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(, managers.criminals)
	local teammate_panel_id = nil

	if character_data and character_data.panel_id then
		teammate_panel_id = character_data.panel_id
	end

	slot12 = managers.network
	slot13 = peer_id
	slot12 = managers.network.session(slot11).peer(slot11, managers.network.session(slot11))
	slot12 = managers.network.session(slot11).peer(slot11, managers.network.session(slot11)).unit(slot11)
	local unit_data = managers.network.session(slot11).peer(slot11, managers.network.session(slot11)).unit(slot11).unit_data(slot11)
	local name_label_id = nil

	if unit_data and unit_data.name_label_id then
		name_label_id = unit_data.name_label_id
	end

	slot17 = carry_id

	managers.hud.set_teammate_carry_info(slot13, managers.hud, teammate_panel_id, name_label_id)

	slot14 = managers.network
	slot14 = managers.network.session(slot13)
	slot14 = managers.network.session(slot13).local_peer(slot13)
	local local_peer_id = managers.network.session(slot13).local_peer(slot13).id(slot13)

	if peer_id ~= local_peer_id then
		local unit = peer.unit(slot14)
		slot16 = unit

		if alive(peer) then
			slot16 = unit
			slot17 = carry_id

			unit.movement(slot15).set_visual_carry(slot15, unit.movement(slot15))
		end
	end

	return 
end
function PlayerManager:set_carry_approved(peer)
	slot5 = peer
	self._global.synced_carry[peer.id(slot4)].approved = true

	return 
end
function PlayerManager:update_removed_synced_carry_to_peers()
	slot3 = managers.network
	local peer = managers.network.session(slot2).local_peer(slot2)
	slot4 = managers.network
	slot5 = "sync_remove_carry"

	managers.network.session(managers.network.session(slot2)).send_to_peers_synched(managers.network.session(slot2), managers.network.session(managers.network.session(slot2)))

	slot5 = peer

	self.remove_synced_carry(managers.network.session(slot2), self)

	return 
end
function PlayerManager:remove_synced_carry(peer)
	slot4 = peer
	local peer_id = peer.id(slot3)

	if not self._global.synced_carry[peer_id] then
		return 
	end

	self._global.synced_carry[peer_id] = nil
	slot6 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(nil, managers.criminals)
	local teammate_panel_id = nil

	if character_data and character_data.panel_id then
		teammate_panel_id = character_data.panel_id
	end

	local name_label_id = nil
	slot8 = peer

	if peer.unit(slot7) then
		slot8 = peer
		slot8 = peer.unit(slot7)

		if peer.unit(slot7).unit_data(slot7) then
			slot8 = peer
			slot8 = peer.unit(slot7)
			local unit_data = peer.unit(slot7).unit_data(slot7)

			if unit_data and unit_data.name_label_id then
				name_label_id = unit_data.name_label_id
			end
		end
	end

	slot10 = name_label_id

	managers.hud.remove_teammate_carry_info(slot7, managers.hud, teammate_panel_id)

	slot8 = managers.network
	slot8 = managers.network.session(slot7)
	slot8 = managers.network.session(slot7).local_peer(slot7)
	local local_peer_id = managers.network.session(slot7).local_peer(slot7).id(slot7)

	if peer_id ~= local_peer_id then
		local unit = peer.unit(slot8)
		slot10 = unit

		if alive(peer) then
			slot10 = unit
			slot11 = nil

			unit.movement(slot9).set_visual_carry(slot9, unit.movement(slot9))
		end
	end

	return 
end
function PlayerManager:get_my_carry_data()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)

	return self._global.synced_carry[peer_id]
end
function PlayerManager:get_synced_carry(peer_id)
	return self._global.synced_carry[peer_id]
end
function PlayerManager:get_drag_body_data()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)

	return self._global.synced_drag_body[peer_id]
end
function PlayerManager:get_synced_drag_body(peer_id)
	return self._global.synced_drag_body[peer_id]
end
function PlayerManager:from_server_interaction_reply(status)
	slot4 = self
	slot4 = self.player_unit(slot3)
	slot5 = false

	self.player_unit(slot3).movement(slot3).set_carry_restriction(slot3, self.player_unit(slot3).movement(slot3))

	if not status then
		slot4 = self

		self.clear_carry(slot3)
	end

	return 
end
function PlayerManager:get_all_synced_carry()
	return self._global.synced_carry
end
function PlayerManager:aquire_team_upgrade(upgrade)
	slot2 = self._global.team_upgrades
	slot3 = upgrade.category

	if not self._global.team_upgrades[upgrade.category] then
		slot4 = {}
	end

	slot2[slot3] = slot4
	self._global.team_upgrades[upgrade.category][upgrade.upgrade] = upgrade.value
	slot4 = self

	self.update_team_upgrades_to_peers(upgrade.upgrade)

	return 
end
function PlayerManager:unaquire_team_upgrade(upgrade_definition)
	if not self._global.team_upgrades[upgrade_definition.upgrade.category] then
		slot6 = upgrade_definition.upgrade.category

		Application.error(slot3, Application, "[PlayerManager:unaquire_team_upgrade] Can't unaquire team upgrade of category")

		return 
	end

	if not self._global.team_upgrades[upgrade_definition.upgrade.category][upgrade_definition.upgrade.upgrade] then
		slot6 = upgrade_definition.upgrade.upgrade

		Application.error(slot3, Application, "[PlayerManager:unaquire_team_upgrade] Can't unaquire team upgrade")

		return 
	end

	local val = nil

	if not upgrade_definition.incremental then
		val = 0
	else
		val = self._global.team_upgrades[upgrade_definition.upgrade.category][upgrade_definition.upgrade.upgrade]
		val = val - 1
	end

	if not val then
		slot7 = upgrade_definition.upgrade

		Application.error(slot4, Application, "[PlayerManager:unaquire_team_upgrade] Can't unaquire team upgrade")

		return 
	end

	slot3 = self._global.team_upgrades[upgrade_definition.upgrade.category]
	slot4 = upgrade_definition.upgrade.upgrade

	if 0 >= val or not val then
		slot5 = nil
	end

	slot3[slot4] = slot5
	slot5 = self

	self.update_team_upgrades_to_peers(slot4)

	return 
end
function PlayerManager:team_upgrade_value(category, upgrade, default)
	slot6 = self._global.synced_team_upgrades

	for peer_id, categories in pairs(slot5) do
		if categories[category] and categories[category][upgrade] then
			local level = categories[category][upgrade]

			return tweak_data.upgrades.values.team[category][upgrade][level]
		end
	end

	if not self._global.team_upgrades[category] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	if not self._global.team_upgrades[category][upgrade] then
		if not default then
			slot4 = 0
		end

		return slot4
	end

	local level = self._global.team_upgrades[category][upgrade]
	local value = tweak_data.upgrades.values.team[category][upgrade][level]

	return value
end
function PlayerManager:has_team_category_upgrade(category, upgrade)
	slot5 = self._global.synced_team_upgrades

	for peer_id, categories in pairs(slot4) do
		if categories[category] and categories[category][upgrade] then
			return true
		end
	end

	if not self._global.team_upgrades[category] then
		return false
	end

	if not self._global.team_upgrades[category][upgrade] then
		return false
	end

	return true
end
function PlayerManager:update_team_upgrades_to_peers()

	-- Decompilation error in this vicinity:
	slot3 = managers.network
	slot4 = "clear_synced_team_upgrades"

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))

	slot3 = self._global.team_upgrades

	for category, upgrades in pairs(slot2) do
		slot8 = upgrades

		for upgrade, level in pairs(slot7) do
			slot13 = managers.network
			slot17 = level

			managers.network.session(slot12).send_to_peers_synched(slot12, managers.network.session(slot12), "add_synced_team_upgrade", category, upgrade)
		end
	end

	return 
end
function PlayerManager:update_team_upgrades_to_peer(peer)
	slot4 = self._global.team_upgrades

	for category, upgrades in pairs(slot3) do
		slot9 = upgrades

		for upgrade, level in pairs(slot8) do
			slot18 = level

			peer.send_queued_sync(slot13, peer, "add_synced_team_upgrade", category, upgrade)
		end
	end

	return 
end
function PlayerManager:clear_synced_team_upgrades(peer_id)
	self._global.synced_team_upgrades[peer_id] = nil

	return 
end
function PlayerManager:add_synced_team_upgrade(peer_id, category, upgrade, level)
	slot5 = self._global.synced_team_upgrades

	if not self._global.synced_team_upgrades[peer_id] then
		slot6 = {}
	end

	slot5[peer_id] = slot6
	slot5 = self._global.synced_team_upgrades[peer_id]

	if not self._global.synced_team_upgrades[peer_id][category] then
		slot6 = {}
	end

	slot5[category] = slot6
	self._global.synced_team_upgrades[peer_id][category][upgrade] = level

	return 
end
function PlayerManager:remove_equipment_possession(peer_id, equipment)
	if not self._global.synced_equipment_possession[peer_id] then
		return 
	end

	self._global.synced_equipment_possession[peer_id][equipment] = nil
	slot6 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(nil, managers.criminals)

	if character_data and character_data.panel_id then
		slot8 = equipment

		managers.hud.remove_teammate_special_equipment(slot5, managers.hud, character_data.panel_id)
	end

	return 
end
function PlayerManager:get_synced_equipment_possession(peer_id)
	return self._global.synced_equipment_possession[peer_id]
end
function PlayerManager:update_equipment_possession_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_equipment_possession[peer_id] then
		slot5 = self._global.synced_equipment_possession[peer_id]

		for name, amount in pairs(slot4) do
			slot14 = amount

			peer.send_queued_sync(slot9, peer, "sync_equipment_possession", peer_id, name)
		end
	end

	return 
end
function PlayerManager:update_equipment_possession_to_peers(equipment, amount)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	local peer_id = managers.network.session(slot4).local_peer(slot4).id(slot4)
	slot6 = managers.network
	slot6 = managers.network.session(managers.network.session(slot4).local_peer(slot4))
	slot4 = managers.network.session(managers.network.session(slot4).local_peer(slot4)).send_to_peers_synched
	slot7 = "sync_equipment_possession"
	slot8 = peer_id
	slot9 = equipment

	if not amount then
		slot10 = 1
	end

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot9 = amount

	self.set_synced_equipment_possession(slot5, self, peer_id, equipment)

	return 
end
function PlayerManager:set_synced_equipment_possession(peer_id, equipment, amount)
	if self._global.synced_equipment_possession[peer_id] then
		local only_update_amount = self._global.synced_equipment_possession[peer_id][equipment]
	end

	slot5 = self._global.synced_equipment_possession

	if not self._global.synced_equipment_possession[peer_id] then
		slot6 = {}
	end

	slot5[peer_id] = slot6
	slot5 = self._global.synced_equipment_possession[peer_id]

	if not amount then
		slot6 = 1
	end

	slot5[equipment] = slot6
	slot8 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(slot6, managers.criminals)

	if character_data and character_data.panel_id then
		local equipment_data = tweak_data.equipments.specials[equipment]
		local icon = equipment_data.icon

		if only_update_amount then
			slot13 = amount

			managers.hud.set_teammate_special_equipment_amount(slot9, managers.hud, character_data.panel_id, equipment)
		else
			slot12 = {
				id = equipment,
				icon = icon,
				amount = amount
			}

			managers.hud.add_teammate_special_equipment(slot9, managers.hud, character_data.panel_id)
		end
	end

	return 
end
function PlayerManager:transfer_special_equipment(peer_id, include_custody)
	if self._global.synced_equipment_possession[peer_id] then
		slot5 = managers.network
		local local_peer = managers.network.session(slot4).local_peer(slot4)
		slot6 = local_peer
		local local_peer_id = local_peer.id(managers.network.session(slot4))
		local peers = {}
		local peers_loadout = {}
		local peers_custody = {}

		if local_peer_id ~= peer_id then
			slot10 = local_peer

			if not local_peer.waiting_for_player_ready(slot9) then
				slot11 = local_peer

				table.insert(slot9, peers_loadout)
			else
				slot10 = managers.trade
				slot13 = local_peer

				if managers.trade.is_peer_in_custody(slot9, local_peer.id(slot12)) then
					if include_custody then
						slot11 = local_peer

						table.insert(slot9, peers_custody)
					end
				else
					slot11 = local_peer

					table.insert(slot9, peers)
				end
			end
		end

		slot12 = managers.network
		slot12 = managers.network.session(slot11)

		for _, peer in pairs(managers.network.session(slot11).peers(slot11)) do
			slot15 = peer

			if peer.id(slot14) ~= peer_id then
				slot15 = peer

				if not peer.waiting_for_player_ready(slot14) then
					slot16 = peer

					table.insert(slot14, peers_loadout)
				else
					slot15 = managers.trade
					slot18 = peer

					if managers.trade.is_peer_in_custody(slot14, peer.id(slot17)) then
						if include_custody then
							slot16 = peer

							table.insert(slot14, peers_custody)
						end
					else
						slot15 = peer

						if peer.is_host(slot14) then
							slot17 = peer

							table.insert(slot14, peers, 1)
						else
							slot16 = peer

							table.insert(slot14, peers)
						end
					end
				end
			end
		end

		slot11 = peers_loadout
		peers = table.list_add(slot9, peers)
		slot11 = peers_custody
		peers = table.list_add(slot9, peers)
		slot10 = self._global.synced_equipment_possession[peer_id]

		for name, amount in pairs(slot9) do
			local equipment_data = tweak_data.equipments.specials[name]

			if equipment_data and not equipment_data.avoid_tranfer then
				local equipment_lost = true
				local amount_to_transfer = amount

				if not equipment_data.transfer_quantity then
					local max_amount = 1
				end

				slot19 = peers

				for _, p in ipairs(slot18) do
					slot24 = p
					local id = p.id(slot23)

					if not self._global.synced_equipment_possession[id] or not self._global.synced_equipment_possession[id][name] then
						local peer_amount = 0
					end

					if peer_amount < max_amount then
						slot27 = max_amount - peer_amount
						local transfer_amount = math.min(slot25, amount_to_transfer)
						amount_to_transfer = amount_to_transfer - transfer_amount
						slot27 = Network

						if Network.is_server(amount_to_transfer) then
							if id == local_peer_id then
								slot28 = {
									transfer = true,
									name = name,
									amount = transfer_amount
								}

								managers.player.add_special(slot26, managers.player)
							else
								slot31 = true

								p.send(slot26, p, "give_equipment", name, transfer_amount)
							end
						end

						if amount_to_transfer == 0 then
							equipment_lost = false

							break
						end
					end
				end

				if peer_id == local_peer_id then
					for i = 1, amount - amount_to_transfer, 1 do
						slot24 = name

						self.remove_special(slot22, self)
					end
				end

				if equipment_lost and name == "evidence" then
					slot20 = "equipment_evidence_lost"

					managers.mission.call_global_event(slot18, managers.mission)
				end
			end
		end
	end

	return 
end
function PlayerManager:peer_dropped_out(peer)
	local peer_id = peer.id(slot3)
	slot5 = Network

	if Network.is_server(peer) then
		slot7 = true

		self.transfer_special_equipment(slot4, self, peer_id)

		if self._global.synced_carry[peer_id] and self._global.synced_carry[peer_id].approved then
			local carry_id = self._global.synced_carry[peer_id].carry_id
			local carry_multiplier = self._global.synced_carry[peer_id].multiplier
			local dye_initiated = self._global.synced_carry[peer_id].dye_initiated
			local has_dye_pack = self._global.synced_carry[peer_id].has_dye_pack
			local dye_value_multiplier = self._global.synced_carry[peer_id].dye_value_multiplier
			slot10 = peer
			local peer_unit = peer.unit(slot9)
			local position = Vector3()
			slot12 = peer_unit

			if alive(slot11) then
				slot12 = peer_unit
				slot12 = peer_unit.movement(slot11)

				if peer_unit.movement(slot11).zipline_unit(slot11) then
					slot12 = peer_unit
					slot12 = peer_unit.movement(slot11)
					slot12 = peer_unit.movement(slot11).zipline_unit(slot11)
					position = peer_unit.movement(slot11).zipline_unit(slot11).position(slot11)
				else
					slot12 = peer_unit
					position = peer_unit.position(slot11)
				end
			end

			slot14 = 0
			local dir = Vector3(slot11, 0, 0)
			slot24 = peer

			self.server_drop_carry(0, self, carry_id, carry_multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, Rotation(), dir, 0, nil)
		end

		slot6 = peer

		self._turret_drop_out(slot4, self)
	end

	self._global.synced_equipment_possession[peer_id] = nil
	self._global.synced_deployables[peer_id] = nil
	self._global.synced_cable_ties[peer_id] = nil
	self._global.synced_grenades[peer_id] = nil
	self._global.synced_ammo_info[peer_id] = nil
	self._global.synced_carry[peer_id] = nil
	self._global.synced_team_upgrades[peer_id] = nil
	self._global.synced_bipod[peer_id] = nil
	self._global.synced_turret[peer_id] = nil
	self._global.synced_drag_body[peer_id] = nil
	local peer_unit = peer.unit(nil)
	slot7 = peer_unit

	managers.vehicle.remove_player_from_all_vehicles(peer, managers.vehicle)

	return 
end
function PlayerManager:clear_synced_turret()
	self._global.synced_turret = {}

	return 
end
function PlayerManager:_turret_drop_out(peer)
	slot4 = peer
	local peer_id = peer.id(slot3)
	local husk_data = self._global.synced_turret[peer_id]

	if husk_data then
		slot6 = husk_data.turret_unit

		if alive(slot5) then
			local weapon = husk_data.turret_unit.weapon(slot5)
			slot7 = weapon

			weapon.on_player_exit(husk_data.turret_unit)

			slot8 = nil

			weapon.set_weapon_user(husk_data.turret_unit, weapon)

			slot7 = husk_data.turret_unit
			slot9 = true

			husk_data.turret_unit.interaction(husk_data.turret_unit).set_active(husk_data.turret_unit, husk_data.turret_unit.interaction(husk_data.turret_unit), true)

			slot8 = true

			weapon.enable_automatic_SO(husk_data.turret_unit, weapon)
		end
	end

	return 
end
function PlayerManager:add_equipment(params)
	slot2 = tweak_data.equipments

	if not params.equipment then
		slot3 = params.name
	end

	if slot2[slot3] then
		slot5 = params

		self._add_equipment(slot3, self)

		return 
	end

	slot2 = tweak_data.equipments.specials

	if not params.equipment then
		slot3 = params.name
	end

	if slot2[slot3] then
		slot5 = params

		self.add_special(slot3, self)

		return 
	end

	slot4 = Application
	slot2 = Application.error
	slot5 = "No equipment or special equipment named"

	if not params.equipment then
		slot6 = params.name
	end

	slot2(slot3, slot4, slot5)

	return 
end
function PlayerManager:_add_equipment(params)
	slot5 = params.equipment

	if self.has_equipment(slot3, self) then
		slot5 = params.equipment

		print(slot3, "Allready have equipment")

		return 
	end

	local equipment = params.equipment
	local tweak_data = tweak_data.equipments[equipment]

	if not params.amount then
		if not tweak_data.quantity then
			slot4 = 0
		end

		slot9 = "quantity"
		local amount = slot4 + self.equiptment_upgrade_value(slot6, self, equipment)
	end

	if not params.icon and tweak_data then
		local icon = tweak_data.icon
	end

	if not params.use_function_name and tweak_data then
		local use_function_name = tweak_data.use_function_name
	end

	if not use_function_name then
		local use_function = nil
	end

	slot11 = {
		equipment = equipment,
		amount = Application.digest_value(slot13, Application, 0),
		use_function = use_function,
		action_timer = tweak_data.action_timer
	}
	slot16 = true

	table.insert(slot9, self._equipment.selections)

	slot8 = self._equipment

	if not self._equipment.selected_index then
		slot9 = 1
	end

	slot8.selected_index = slot9
	slot12 = amount

	self.update_deployable_equipment_amount_to_peers(slot9, self, equipment)

	slot11 = {
		amount = amount,
		icon = icon
	}

	managers.hud.add_item(slot9, managers.hud)

	slot12 = amount

	self.add_equipment_amount(slot9, self, equipment)

	return 
end
function PlayerManager:add_equipment_amount(equipment, amount)
	slot6 = equipment
	local data, index = self.equipment_data_by_name(slot4, self)

	if data then
		slot9 = false
		local new_amount = Application.digest_value(slot6, Application, data.amount) + amount
		slot10 = true
		data.amount = Application.digest_value(Application, Application, new_amount)
		slot10 = new_amount

		managers.hud.set_item_amount(Application, managers.hud, index)
	end

	return 
end
function PlayerManager:set_equipment_amount(equipment, amount)
	slot6 = equipment
	local data, index = self.equipment_data_by_name(slot4, self)

	if data then
		local new_amount = amount
		slot10 = true
		data.amount = Application.digest_value(slot7, Application, new_amount)
		slot10 = new_amount

		managers.hud.set_item_amount(slot7, managers.hud, index)
	end

	return 
end
function PlayerManager:equipment_data_by_name(equipment)
	slot4 = self._equipment.selections

	for i, equipments in ipairs(slot3) do
		if equipments.equipment == equipment then
			return equipments, i
		end
	end

	return nil
end
function PlayerManager:get_equipment_amount(equipment)
	slot4 = self._equipment.selections

	for i, equipments in ipairs(slot3) do
		if equipments.equipment == equipment then
			slot11 = false

			return Application.digest_value(slot8, Application, equipments.amount)
		end
	end

	return 0
end
function PlayerManager:has_equipment(equipment)
	slot4 = self._equipment.selections

	for i, equipments in ipairs(slot3) do
		if equipments.equipment == equipment then
			return true
		end
	end

	return false
end
function PlayerManager:has_deployable_left(equipment)
	slot5 = equipment

	if 0 >= self.get_equipment_amount(slot3, self) then
		slot2 = false
	else
		slot2 = true
	end

	return slot2
end
function PlayerManager:select_next_item()
	if not self._equipment.selected_index then
		return 
	end

	slot1 = self._equipment

	if self._equipment.selected_index + 1 > #self._equipment.selections or not (self._equipment.selected_index + 1) then
		slot2 = 1
	end

	slot1.selected_index = slot2

	return 
end
function PlayerManager:select_previous_item()
	if not self._equipment.selected_index then
		return 
	end

	slot1 = self._equipment

	if 1 > self._equipment.selected_index - 1 or not (self._equipment.selected_index - 1) then
		slot2 = #self._equipment.selections
	end

	slot1.selected_index = slot2

	return 
end
function PlayerManager:clear_equipment()
	slot3 = self._equipment.selections

	for i, equipment in ipairs(slot2) do
		slot10 = true
		equipment.amount = Application.digest_value(slot7, Application, 0)
		slot10 = 0

		managers.hud.set_item_amount(slot7, managers.hud, i)

		slot10 = 0

		self.update_deployable_equipment_amount_to_peers(slot7, self, equipment.equipment)
	end

	return 
end
function PlayerManager:from_server_equipment_place_result(selected_index, unit)
	slot5 = unit

	if alive(slot4) then
		slot5 = unit
		slot5 = unit.equipment(slot4)
		slot3 = unit.equipment(slot4).from_server_sentry_gun_place_result

		if selected_index == 0 then
			slot6 = false
		else
			slot6 = true
		end

		slot3(slot4, slot5)
	end

	local equipment = self._equipment.selections[selected_index]

	if not equipment then
		return 
	end

	slot8 = false
	local new_amount = Application.digest_value(slot5, Application, equipment.amount) - 1
	slot9 = true
	equipment.amount = Application.digest_value(Application, Application, new_amount)

	if not self._global.equipment then
		local equipments_available = {}
	end

	slot10 = "carry_sentry_and_trip"

	if managers.player.has_category_upgrade(slot7, managers.player, "player") and equipments_available.sentry_gun and equipments_available.trip_mine and new_amount == 0 then
		if equipment.equipment == "trip_mine" then
			slot9 = "sentry_gun"
		elseif equipment.equipment == "sentry_gun" then
			slot9 = "trip_mine"

			if not self.has_equipment(slot7, self) then
				slot9 = {
					equipment = "trip_mine"
				}

				self.add_equipment(slot7, self)

				slot8 = self

				self.select_next_item(slot7)

				return 
			end
		end
	end

	slot10 = new_amount

	managers.hud.set_item_amount(slot7, managers.hud, self._equipment.selected_index)

	slot10 = new_amount

	self.update_deployable_equipment_amount_to_peers(slot7, self, equipment.equipment)

	return 
end
function PlayerManager:can_use_selected_equipment(unit)

	-- Decompilation error in this vicinity:
	local equipment = self._equipment.selections[self._equipment.selected_index]

	return true
end
function PlayerManager:selected_equipment()

	-- Decompilation error in this vicinity:
	local equipment = self._equipment.selections[self._equipment.selected_index]

	return equipment
end
function PlayerManager:selected_equipment_id()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return nil
	end

	return equipment_data.equipment
end
function PlayerManager:selected_equipment_name()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return ""
	end

	slot4 = managers.localization
	slot2 = managers.localization.text

	if not tweak_data.equipments[equipment_data.equipment].text_id then
		slot5 = ""
	end

	return slot2(slot3, slot4)
end
function PlayerManager:selected_equipment_limit_movement()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return false
	end

	if not tweak_data.equipments[equipment_data.equipment].limit_movement then
		slot2 = false
	end

	return slot2
end
function PlayerManager:selected_equipment_deploying_text()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data or not tweak_data.equipments[equipment_data.equipment].deploying_text_id then
		return false
	end

	slot5 = tweak_data.equipments[equipment_data.equipment].deploying_text_id

	return managers.localization.text(slot3, managers.localization)
end
function PlayerManager:selected_equipment_sound_start()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return false
	end

	if not tweak_data.equipments[equipment_data.equipment].sound_start then
		slot2 = false
	end

	return slot2
end
function PlayerManager:selected_equipment_sound_interupt()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return false
	end

	if not tweak_data.equipments[equipment_data.equipment].sound_interupt then
		slot2 = false
	end

	return slot2
end
function PlayerManager:selected_equipment_sound_done()
	slot3 = self
	local equipment_data = self.selected_equipment(slot2)

	if not equipment_data then
		return false
	end

	if not tweak_data.equipments[equipment_data.equipment].sound_done then
		slot2 = false
	end

	return slot2
end
function PlayerManager:use_selected_equipment(unit)

	-- Decompilation error in this vicinity:
	local equipment = self._equipment.selections[self._equipment.selected_index]
	local used_one = false
	local redirect = nil

	if equipment.use_function then
		slot7 = unit
		slot9 = unit
		used_one, redirect = unit.equipment(slot6)[equipment.use_function](equipment.use_function, unit.equipment(self._equipment.selected_index))
	else
		used_one = true
	end

	if used_one then
		slot8 = equipment.equipment

		self.remove_equipment(slot6, self)

		if redirect then
			slot7 = unit

			redirect(slot6)
		end
	end

	return {
		expire_timer = equipment.action_timer,
		redirect = redirect
	}
end
function PlayerManager:check_selected_equipment_placement_valid(player)
	slot4 = managers.player
	local equipment_data = managers.player.selected_equipment(slot3)

	if not equipment_data then
		return false
	end

	if equipment_data.equipment == "trip_mine" or equipment_data.equipment == "ecm_jammer" then
		slot5 = player
		slot6 = tweak_data.equipments[equipment_data.equipment]

		if player.equipment(slot4).valid_look_at_placement(slot4, player.equipment(slot4)) then
			slot3 = true
		else
			slot3 = false
		end

		return slot3
	elseif equipment_data.equipment == "sentry_gun" or equipment_data.equipment == "ammo_bag" or equipment_data.equipment == "doctor_bag" or equipment_data.equipment == "first_aid_kit" or equipment_data.equipment == "bodybags_bag" then
		slot5 = player
		slot7 = tweak_data.equipments[equipment_data.equipment]

		if player.equipment(slot4).valid_shape_placement(slot4, player.equipment(slot4), equipment_data.equipment) then
			slot3 = true
		else
			slot3 = false
		end

		return slot3
	elseif equipment_data.equipment == "armor_kit" then
		return true
	end

	slot5 = player
	slot6 = tweak_data.equipments[equipment_data.equipment]

	if player.equipment(slot4).valid_placement(slot4, player.equipment(slot4)) then
		slot3 = true
	else
		slot3 = false
	end

	return slot3
end
function PlayerManager:selected_equipment_deploy_timer()
	slot3 = managers.player
	local equipment_data = managers.player.selected_equipment(slot2)

	if not equipment_data then
		return 0
	end

	local equipment_tweak_data = tweak_data.equipments[equipment_data.equipment]
	local multiplier = 1

	if equipment_tweak_data.upgrade_deploy_time_multiplier then
		slot9 = 1
		multiplier = managers.player.upgrade_value(slot5, managers.player, equipment_tweak_data.upgrade_deploy_time_multiplier.category, equipment_tweak_data.upgrade_deploy_time_multiplier.upgrade)
	end

	if not equipment_tweak_data.deploy_time then
		slot4 = 1
	end

	return slot4 * multiplier
end
function PlayerManager:remove_equipment(equipment_id)
	local equipment, index = self.equipment_data_by_name(slot3, self)
	slot8 = false
	local new_amount = Application.digest_value(equipment_id, Application, equipment.amount) - 1
	slot9 = true
	equipment.amount = Application.digest_value(Application, Application, new_amount)

	if not self._global.equipment then
		local equipments_available = {}
	end

	slot10 = "carry_sentry_and_trip"

	if managers.player.has_category_upgrade(slot7, managers.player, "player") and equipments_available.sentry_gun and equipments_available.trip_mine and new_amount == 0 then
		if equipment.equipment == "trip_mine" then
			slot9 = "sentry_gun"
		elseif equipment.equipment == "sentry_gun" then
			slot9 = "trip_mine"

			if not self.has_equipment(slot7, self) then
				slot9 = {
					equipment = "trip_mine"
				}

				self.add_equipment(slot7, self)

				slot8 = self

				self.select_next_item(slot7)

				return 
			end
		end
	end

	slot10 = new_amount

	managers.hud.set_item_amount(slot7, managers.hud, index)

	slot10 = new_amount

	self.update_deployable_equipment_amount_to_peers(slot7, self, equipment.equipment)

	return 
end
function PlayerManager:verify_equipment(peer_id, equipment_id)
	if peer_id == 0 then
		slot6 = equipment_id
		local id = "asset_" .. tostring(slot5)

		if not self._asset_equipment then
			slot4 = {}
		end

		self._asset_equipment = slot4

		if not tweak_data.equipments.max_amount[id] or (self._asset_equipment[id] and tweak_data.equipments.max_amount[id] < self._asset_equipment[id] + 1) then
			slot6 = managers.network
			local peer = managers.network.session(slot5).server_peer(slot5)
			slot8 = VoteManager.REASON.many_assets

			peer.mark_cheater(managers.network.session(slot5), peer)

			return false
		end

		slot4 = self._asset_equipment

		if not self._asset_equipment[id] then
			slot5 = 0
		end

		slot4[id] = slot5 + 1

		return true
	end

	slot5 = managers.network
	slot6 = peer_id
	local peer = managers.network.session(slot4).peer(slot4, managers.network.session(slot4))

	if not peer then
		return false
	end

	slot7 = equipment_id

	return peer.verify_deployable(slot5, peer)
end
function PlayerManager:verify_grenade(peer_id)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return true
	end

	slot4 = managers.network
	slot5 = peer_id
	local peer = managers.network.session(slot3).peer(slot3, managers.network.session(slot3))

	if not peer then
		return false
	end

	slot6 = 1

	return peer.verify_grenade(slot4, peer)
end
function PlayerManager:register_grenade(peer_id)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return true
	end

	slot4 = managers.network
	slot5 = peer_id
	local peer = managers.network.session(slot3).peer(slot3, managers.network.session(slot3))

	if not peer then
		return false
	end

	slot6 = -1

	return peer.verify_grenade(slot4, peer)
end
function PlayerManager:add_special(params)

	-- Decompilation error in this vicinity:
	if not params.equipment then
		local name = params.name
	end

	if not tweak_data.equipments.specials[name] then
		slot6 = "Special equipment " .. name .. " doesn't exist!"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self
	local unit = self.player_unit(slot4)

	if params.amount then
		slot4 = true
	else
		local respawn = false
	end

	local equipment = tweak_data.equipments.specials[name]
	local special_equipment = self._equipment.specials[name]

	if not params.amount then
		local amount = equipment.quantity
	end

	slot11 = equipment
	slot13 = "quantity"
	local extra = self._equipped_upgrade_value(slot9, self) + self.upgrade_value(self, self, name)

	if name == "cable_tie" then
		slot13 = "quantity_1"
		slot14 = "quantity_2"
		extra = self.upgrade_value(slot10, self, name) + self.upgrade_value(self, self, name)
	end

	if special_equipment then
		if equipment.max_quantity or equipment.quantity or (params.transfer and equipment.transfer_quantity) then

			-- Decompilation error in this vicinity:
			slot14 = "quantity_unlimited"

			if self.has_category_upgrade(slot11, self, name) then
				slot10 = -1
			else
				slot10 = math.min
				slot12 = dedigested_amount + amount

				if (not params.transfer or not equipment.transfer_quantity) and not equipment.max_quantity then
					slot13 = equipment.quantity
				end

				slot13 = slot13 + extra
				local new_amount = slot10(slot11, slot12)
			end

			slot15 = true
			special_equipment.amount = Application.digest_value(slot12, Application, new_amount)
			slot15 = new_amount

			managers.hud.set_special_equipment_amount(slot12, managers.hud, name)

			slot15 = new_amount

			self.update_equipment_possession_to_peers(slot12, self, name)
		end

		return 
	end

	local icon = equipment.icon
	local dialog = equipment.dialog_id

	if not params.silent then
		local text = managers.localization.text(slot12, managers.localization)
		local interact_data = {
			id = "equipment_obtained"
		}
		slot19 = {
			EQUIPMENT = text
		}
		interact_data.text = utf8.to_upper(managers.localization.text(slot16, managers.localization, "present_obtained_mission_equipment_title"))
		interact_data.duration = PlayerManager.EQUIPMENT_OBTAINED_MESSAGE_DURATION
		slot22 = true

		managers.queued_tasks.queue(equipment.text_id, managers.queued_tasks, "special_equipment_obtained_message", self._show_special_equipment_obtained_message, self, interact_data, 0.1, nil)

		if dialog then
			slot17 = {}

			managers.dialog.queue_dialog(slot14, managers.dialog, dialog)
		end
	end

	local quantity = nil

	if not params.transfer then
		slot16 = "quantity_unlimited"

		if self.has_category_upgrade(slot13, self, name) then
			quantity = -1
		elseif equipment.quantity then
		end
	else
		quantity = params.amount
	end

	slot14 = managers.hud
	slot12 = managers.hud.add_special_equipment
	slot15 = {
		id = name,
		icon = icon
	}

	if not quantity then
		if equipment.transfer_quantity then
			slot16 = 1
		else
			slot16 = nil
		end
	end

	slot15.amount = slot16

	slot12(slot13, slot14)

	slot16 = quantity

	self.update_equipment_possession_to_peers(slot13, self, name)

	slot12 = self._equipment.specials
	slot13 = {
		amount = slot14
	}
	slot12[name] = slot13

	if equipment.player_rule then
		slot16 = true

		self.set_player_rule(slot13, self, equipment.player_rule)
	end

	return 
end
function PlayerManager:_show_special_equipment_obtained_message(interact_data)
	slot5 = interact_data

	managers.hud.set_big_prompt(slot3, managers.hud)

	return 
end
function PlayerManager:_equipped_upgrade_value(equipment)
	if not equipment.extra_quantity then
		return 0
	end

	local equipped_upgrade = equipment.extra_quantity.equipped_upgrade
	local category = equipment.extra_quantity.category
	local upgrade = equipment.extra_quantity.upgrade
	slot10 = upgrade

	return self.equipped_upgrade_value(slot6, self, equipped_upgrade, category)
end
function PlayerManager:has_special_equipment(name)
	return self._equipment.specials[name]
end
function PlayerManager:_can_pickup_special_equipment(special_equipment, name)
	if special_equipment.amount then
		local equipment = tweak_data.equipments.specials[name]
		slot7 = equipment
		local extra = self._equipped_upgrade_value(slot5, self)
		slot9 = false
		slot5 = Application.digest_value(self, Application, special_equipment.amount)

		if not equipment.max_quantity and not equipment.quantity then
			slot6 = 1
		end

		if slot5 >= slot6 + extra then
			slot5 = false
		else
			slot5 = true
		end

		return slot5, not not equipment.max_quantity
	end

	return false
end
function PlayerManager:can_pickup_equipment(name)
	local special_equipment = self._equipment.specials[name]

	if special_equipment then
		slot7 = name

		return self._can_pickup_special_equipment(slot4, self, special_equipment)
	else
		local equipment = tweak_data.equipments.specials[name]

		if equipment and equipment.shares_pickup_with then
			slot6 = equipment.shares_pickup_with

			for i, special_equipment_name in ipairs(slot5) do
				if special_equipment_name ~= name then
					special_equipment = self._equipment.specials[special_equipment_name]

					if special_equipment then
						slot13 = name

						if not self._can_pickup_special_equipment(slot10, self, special_equipment) then
							return false
						end
					end
				end
			end
		end
	end

	return true
end
function PlayerManager:remove_all_specials()
	slot3 = self._equipment.specials

	for key, value in pairs(slot2) do
		slot10 = true

		self.remove_special(slot7, self, key)
	end

	return 
end
function PlayerManager:remove_special(name, all)
	local special_equipment = self._equipment.specials[name]

	if not special_equipment then
		return 
	end

	if special_equipment.amount then
		slot8 = false
		local special_amount = Application.digest_value(slot5, Application, special_equipment.amount)
	end

	if special_amount and special_amount ~= -1 then
		if all then
			special_amount = 0
		else
			slot8 = special_amount - 1
			special_amount = math.max(slot6, 0)
		end

		slot9 = special_amount

		managers.hud.set_special_equipment_amount(slot6, managers.hud, name)

		slot9 = special_amount

		self.update_equipment_possession_to_peers(slot6, self, name)

		slot9 = true
		special_equipment.amount = Application.digest_value(slot6, Application, special_amount)
	end

	if not special_amount or special_amount == 0 then
		slot8 = name

		managers.hud.remove_special_equipment(slot6, managers.hud)

		slot7 = managers.network
		slot11 = managers.network
		slot11 = managers.network.session(slot10)
		slot11 = managers.network.session(slot10).local_peer(slot10)
		slot9 = managers.network.session(slot10).local_peer(slot10).id(slot10)
		slot10 = name

		managers.network.session(slot6).send_to_peers_loaded(slot6, managers.network.session(slot6), "sync_remove_equipment_possession", slot9)

		slot10 = managers.network
		slot10 = managers.network.session(name)
		slot10 = managers.network.session(name).local_peer(name)

		self.remove_equipment_possession(slot6, self, managers.network.session(name).local_peer(name).id(name))

		self._equipment.specials[name] = nil
		local equipment = tweak_data.equipments.specials[name]

		if equipment.player_rule then
			slot10 = false

			self.set_player_rule(slot7, self, equipment.player_rule)
		end
	end

	return 
end
function PlayerManager:_set_grenade(params)
	local grenade = params.grenade
	local tweak_data = tweak_data.projectiles[grenade]
	local amount = params.amount
	local icon = tweak_data.icon
	local player = self.player_unit(slot7)
	slot11 = amount

	self.update_grenades_amount_to_peers(self, self, grenade)

	slot9 = player
	slot10 = grenade

	player.inventory(self).set_grenade(self, player.inventory(self))

	slot11 = {
		amount = amount,
		icon = icon
	}

	managers.hud.set_teammate_grenades(self, managers.hud, HUDManager.PLAYER_PANEL)

	return 
end
function PlayerManager:add_grenade_amount(amount)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)
	slot7 = self

	if not alive(self.player_unit(slot6)) then
		return 0
	end

	slot5 = self
	slot5 = self.player_unit(slot4)
	local grenade = self.player_unit(slot4).inventory(slot4).equipped_grenade
	local gained_grenades = amount

	if self._global.synced_grenades[peer_id] then
		local icon = tweak_data.projectiles[grenade].icon
		slot10 = false
		gained_grenades = Application.digest_value(slot7, Application, self._global.synced_grenades[peer_id].amount)
		slot12 = false
		slot9 = 0
		slot13 = peer_id
		amount = math.clamp(slot7, Application.digest_value(self._global.synced_grenades[peer_id].amount, Application, self._global.synced_grenades[peer_id].amount) + amount, self.get_max_grenades_by_peer_id(self._global.synced_grenades[peer_id].amount, self))
		gained_grenades = amount - gained_grenades
		slot10 = {
			icon = icon,
			amount = amount
		}

		managers.hud.set_teammate_grenades_amount(slot7, managers.hud, HUDManager.PLAYER_PANEL)
	end

	slot9 = amount

	self.update_grenades_amount_to_peers(slot6, self, grenade)

	return gained_grenades
end
function PlayerManager:refill_grenades(amount)
	if not amount then
		slot4 = self
		local fill_amount = self.get_max_grenades(slot3)
	end

	slot6 = fill_amount

	self.add_grenade_amount(slot4, self)

	return 
end
function PlayerManager:update_grenades_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_grenades[peer_id] then
		local grenade = self._global.synced_grenades[peer_id].grenade
		local amount = self._global.synced_grenades[peer_id].amount
		slot9 = grenade
		slot14 = false

		peer.send_queued_sync(slot6, peer, "sync_grenades", Application.digest_value(slot11, Application, amount))
	end

	return 
end
function PlayerManager:update_grenades_amount_to_peers(grenade, amount)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	local peer_id = managers.network.session(slot4).local_peer(slot4).id(slot4)
	slot6 = managers.network
	slot9 = amount

	managers.network.session(managers.network.session(slot4).local_peer(slot4)).send_to_peers_synched(managers.network.session(slot4).local_peer(slot4), managers.network.session(managers.network.session(slot4).local_peer(slot4)), "sync_grenades", grenade)

	slot9 = amount

	self.set_synced_grenades(managers.network.session(slot4).local_peer(slot4), self, peer_id, grenade)

	return 
end
function PlayerManager:set_synced_grenades(peer_id, grenade, amount)
	slot10 = amount

	Application.debug(slot5, Application, "[PlayerManager:set_synced_grenades]", peer_id, grenade)

	if self._global.synced_grenades[peer_id] then
		if self._global.synced_grenades[peer_id].grenade ~= grenade then
			slot4 = false
		else
			local only_update_amount = true
		end
	end

	slot9 = true
	local digested_amount = Application.digest_value(slot6, Application, amount)
	self._global.synced_grenades[peer_id] = {
		grenade = grenade,
		amount = digested_amount
	}
	slot9 = peer_id
	local character_data = managers.criminals.character_data_by_peer_id(, managers.criminals)

	if character_data and character_data.panel_id then
		local icon = tweak_data.projectiles[grenade].icon

		if only_update_amount then
		end
	end

	slot9 = managers.network
	slot9 = managers.network.session(slot8)
	managers.network.session(slot8).all_peers(slot8)[peer_id]._grenades = 0

	return 
end
function PlayerManager:get_grenade_amount(peer_id)
	slot6 = false

	return Application.digest_value(slot3, Application, self._global.synced_grenades[peer_id].amount)
end
function PlayerManager:get_synced_grenades(peer_id)
	return self._global.synced_grenades[peer_id]
end
function PlayerManager:can_throw_grenade()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
	slot5 = peer_id

	if 0 >= self.get_grenade_amount(managers.network.session(slot2).local_peer(slot2), self) then
		slot2 = false
	else
		slot2 = true
	end

	return slot2
end
function PlayerManager:get_max_grenades_by_peer_id(peer_id)

	-- Decompilation error in this vicinity:
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot5 = peer_id
		local peer = managers.network.session(slot3).peer(slot3, managers.network.session(slot3))
	end

	return slot3
end
function PlayerManager:get_max_grenades(grenade_id)
	if not grenade_id then
		slot4 = managers.blackmarket
		grenade_id = managers.blackmarket.equipped_grenade(slot3)
	end

	slot7 = 0
	local upgrade_amount = self.upgrade_value(slot3, self, "player", "grenade_quantity")

	if tweak_data.projectiles[grenade_id] then
		if not tweak_data.projectiles[grenade_id].max_amount then
			slot3 = 0
		end

		slot3 = slot3 + upgrade_amount
	end

	return slot3
end
function PlayerManager:got_max_grenades()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
	slot5 = peer_id
	slot6 = peer_id

	if self.get_max_grenades_by_peer_id(self, self) > self.get_grenade_amount(managers.network.session(slot2).local_peer(slot2), self) then
		slot2 = false
	else
		slot2 = true
	end

	return slot2
end
function PlayerManager:has_grenade(peer_id)
	if not peer_id then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
		slot4 = managers.network.session(slot3).local_peer(slot3)
		peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)
	end

	slot5 = peer_id
	local synced_grenade = self.get_synced_grenades(slot3, self)

	if synced_grenade and synced_grenade.grenade then
		slot3 = true
	else
		slot3 = false
	end

	return slot3
end
function PlayerManager:on_throw_grenade()
	slot4 = -1

	self.add_grenade_amount(slot2, self)

	return 
end
function PlayerManager:set_drag_body_data(dragged_unit, dragged_body)
	return 
end
function PlayerManager:set_carry(carry_id, carry_multiplier, dye_initiated, has_dye_pack, dye_value_multiplier)
	local carry_tweak = tweak_data.carry[carry_id]
	local carry_type = carry_tweak.type

	if carry_tweak.is_corpse then
		slot11 = "carry_corpse"

		self.set_player_state(slot9, self)
	else
		slot11 = "carry"

		self.set_player_state(slot9, self)
	end

	slot11 = "hud_carrying_announcement_title"
	local title = managers.localization.text(slot9, managers.localization)

	if carry_tweak.name_id then
		slot12 = carry_tweak.name_id
		local type_text = managers.localization.text(slot10, managers.localization)
	end

	slot14 = {
		CARRY_TYPE = type_text
	}
	local text = managers.localization.text(slot11, managers.localization, "hud_carrying_announcement")
	local icon = nil

	if not dye_initiated then
		dye_initiated = true

		if carry_tweak.dye then
			slot18 = 1
			local chance = tweak_data.carry.dye.chance * managers.player.upgrade_value(slot14, managers.player, "player", "dye_pack_chance_multiplier")

			if false then
				has_dye_pack = true
				slot21 = 1
				slot15 = tweak_data.carry.dye.value_multiplier * managers.player.upgrade_value(slot17, managers.player, "player", "dye_pack_cash_loss_multiplier")
				dye_value_multiplier = math.round(slot14)
			end
		end
	end

	slot14 = self
	slot12 = self.update_synced_carry_to_peers
	slot15 = carry_id

	if not carry_multiplier then
		slot16 = 1
	end

	slot19 = dye_value_multiplier

	slot12(slot13, slot14, slot15, slot16, dye_initiated, has_dye_pack)

	slot17 = carry_id

	managers.hud.set_teammate_carry_info(slot13, managers.hud, HUDManager.PLAYER_PANEL, nil)

	slot15 = carry_id

	managers.hud.show_carry_item(slot13, managers.hud)

	slot14 = self
	local player = self.player_unit(slot13)

	if not player then
		return 
	end

	slot15 = player
	slot15 = player.movement(slot14)
	slot16 = carry_type

	player.movement(slot14).current_state(slot14).set_tweak_data(slot14, player.movement(slot14).current_state(slot14))

	return 
end
function PlayerManager:bank_carry()
	local carry_data = self.get_my_carry_data(slot2)
	slot6 = carry_data.multiplier

	managers.loot.secure(self, managers.loot, carry_data.carry_id)

	slot5 = HUDManager.PLAYER_PANEL

	managers.hud.remove_teammate_carry_info(self, managers.hud)

	slot4 = managers.hud

	managers.hud.hide_carry_item(self)

	slot4 = self

	self.update_removed_synced_carry_to_peers(self)

	slot5 = "standard"

	managers.player.set_player_state(self, managers.player)

	return 
end
function PlayerManager:drop_carry(zipline_unit)
	slot5 = "[PlayerManager:drop_carry]"

	Application.debug(slot3, Application)

	slot4 = self
	local carry_data = self.get_my_carry_data(slot3)

	if not carry_data then
		return 
	end

	local carry_needs_headroom = tweak_data.carry[carry_data.carry_id].needs_headroom_to_drop
	slot6 = self
	local player = self.player_unit(slot5)

	if carry_needs_headroom then
		slot7 = player
		slot7 = player.movement(slot6)
		slot7 = player.movement(slot6).current_state(slot6)

		if not player.movement(slot6).current_state(slot6)._can_stand(slot6) then
			slot8 = {
				duration = 2,
				shelf_life = 5,
				id = "cant_throw_body",
				text = managers.localization.text(slot10, managers.localization)
			}
			slot12 = "cant_throw_body"

			managers.notification.add_notification(slot6, managers.notification)

			return 
		end
	end

	slot8 = 0.3
	self._carry_blocked_cooldown_t = Application.time(slot6) + 1.2 + math.rand(Application)
	slot7 = self
	local player = self.player_unit(1.2 + math.rand(Application))

	if player and carry_data.carry_id == "flak_shell" then
		slot8 = player
		slot11 = false

		player.sound(slot7).play(slot7, player.sound(slot7), "flakshell_throw", nil)
	end

	slot8 = player
	local camera_ext = player.camera(slot7)
	local dye_initiated = carry_data.dye_initiated
	local has_dye_pack = carry_data.has_dye_pack
	local dye_value_multiplier = carry_data.dye_value_multiplier
	slot14 = camera_ext
	local position = mvector3.copy(camera_ext.position(slot13))
	slot13 = camera_ext
	local rotation = camera_ext.rotation(camera_ext.position)

	if carry_needs_headroom then
		slot16 = 75
		position = position - Vector3(slot13, 0, 0)
		slot18 = camera_ext
		slot18 = camera_ext.rotation(360)
		slot16 = 0
		rotation = Rotation(slot13, math.mod(0, camera_ext.rotation(360).yaw(360) + 180), 0)
	end

	slot17 = 0
	local throw_distance_multiplier_upgrade_level = managers.player.upgrade_level(slot13, managers.player, "carry", "throw_distance_multiplier")
	slot15 = Network

	if Network.is_client(managers.player) then
		slot15 = managers.network
		slot26 = player
		slot26 = player.camera(slot25)
		slot26 = zipline_unit

		managers.network.session(slot14).send_to_host(slot14, managers.network.session(slot14), "server_drop_carry", carry_data.carry_id, carry_data.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, rotation, player.camera(slot25).forward(slot25), throw_distance_multiplier_upgrade_level)
	else
		slot25 = player
		slot25 = player.camera(slot24)
		slot25 = zipline_unit
		slot28 = managers.network
		slot28 = managers.network.session(slot27)

		self.server_drop_carry(slot14, self, carry_data.carry_id, carry_data.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, rotation, player.camera(slot24).forward(slot24), throw_distance_multiplier_upgrade_level, managers.network.session(slot27).local_peer(slot27))
	end

	slot16 = HUDManager.PLAYER_PANEL

	managers.hud.remove_teammate_carry_info(slot14, managers.hud)

	slot15 = managers.hud

	managers.hud.hide_carry_item(slot14)

	slot15 = self

	self.update_removed_synced_carry_to_peers(slot14)

	if self._current_state == "carry" or self._current_state == "carry_corpse" then
		slot16 = "standard"

		managers.player.set_player_state(slot14, managers.player)
	end

	return 
end
function PlayerManager:switch_carry_to_ragdoll(unit)

	-- Decompilation error in this vicinity:
	slot5 = "[PlayerManager:switch_carry_to_ragdoll]"

	Application.debug(slot3, Application)

	slot4 = unit
	slot5 = "orientation_object"

	unit.set_driving(slot3, unit)

	slot5 = false

	unit.set_animations_enabled(slot3, unit)

	slot4 = unit
	slot5 = "switch_to_ragdoll"

	unit.damage(slot3).run_sequence_simple(slot3, unit.damage(slot3))

	self._root_act_tags = {}
	slot5 = "rag_Hips"
	local hips_body = unit.body(slot3, unit)
	local tag = hips_body.activate_tag(unit)
	slot6 = ""

	if tag == Idstring(hips_body) then
		slot6 = "root_follow"
		tag = Idstring(slot5)
		slot7 = tag

		hips_body.set_activate_tag(slot5, hips_body)
	end

	slot7 = tag
	slot5 = tag.key(slot6)
	self._root_act_tags[slot5] = true
	slot6 = hips_body
	tag = hips_body.deactivate_tag(slot5)
	slot6 = ""

	if tag == Idstring(slot5) then
		slot6 = "root_follow"
		tag = Idstring(slot5)
		slot7 = tag

		hips_body.set_deactivate_tag(slot5, hips_body)
	end

	slot7 = tag
	slot5 = tag.key(slot6)
	self._root_act_tags[slot5] = true
	slot6 = unit
	self._hips_obj = unit.get_object(slot5, Idstring(slot8))
	slot6 = self._hips_obj
	local hips_pos = self._hips_obj.position(slot5)
	self._rag_pos = hips_pos
	slot10 = unit
	self._ragdoll_freeze_clbk_id = "freeze_rag" .. tostring(unit.key("Hips"))

	return 
end
function PlayerManager:server_drop_carry(carry_id, carry_multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, rotation, dir, throw_distance_multiplier_upgrade_level, zipline_unit, peer)

	-- Decompilation error in this vicinity:
	if not tweak_data.carry[carry_id].unit then
		local unit_name = tweak_data.carry.default_lootbag
	end

	slot18 = unit_name
	slot18 = rotation
	local unit = World.spawn_unit(slot14, World, Idstring(slot17), position)
	slot17 = position
	local world = managers.worldcollection.get_world_from_pos(World, managers.worldcollection)

	if world then
		slot18 = unit

		world.register_spawned_unit(slot16, world)
	end

	slot17 = managers.network
	slot17 = managers.network.session(slot16)
	slot15 = managers.network.session(slot16).send_to_peers_synched
	slot18 = "sync_carry_data"
	slot19 = unit
	slot20 = carry_id
	slot21 = carry_multiplier
	slot22 = dye_initiated
	slot23 = has_dye_pack
	slot24 = dye_value_multiplier
	slot25 = position
	slot26 = dir
	slot27 = throw_distance_multiplier_upgrade_level
	slot28 = zipline_unit

	slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28)

	slot17 = self
	slot15 = self.sync_carry_data
	slot18 = unit
	slot19 = carry_id
	slot20 = carry_multiplier
	slot21 = dye_initiated
	slot22 = has_dye_pack
	slot23 = dye_value_multiplier
	slot24 = position
	slot25 = dir
	slot26 = throw_distance_multiplier_upgrade_level
	slot27 = zipline_unit

	slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27)

	return unit
end
function PlayerManager:sync_carry_data(unit, carry_id, carry_multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, dir, throw_distance_multiplier_upgrade_level, zipline_unit, peer_id)
	slot18 = 1
	local throw_distance_multiplier = self.upgrade_value_by_level(slot13, self, "carry", "throw_distance_multiplier", throw_distance_multiplier_upgrade_level)
	local carry_type = tweak_data.carry[carry_id].type
	throw_distance_multiplier = throw_distance_multiplier * tweak_data.carry.types[carry_type].throw_distance_multiplier
	slot16 = unit
	slot17 = carry_id

	unit.carry_data("carry").set_carry_id("carry", unit.carry_data("carry"))

	slot16 = unit
	slot17 = carry_multiplier

	unit.carry_data("carry").set_multiplier("carry", unit.carry_data("carry"))

	slot16 = unit
	slot17 = 0

	unit.carry_data("carry").set_value("carry", unit.carry_data("carry"))

	slot16 = unit
	slot19 = dye_value_multiplier

	unit.carry_data("carry").set_dye_pack_data("carry", unit.carry_data("carry"), dye_initiated, has_dye_pack)

	slot16 = unit
	slot17 = peer_id

	unit.carry_data("carry").set_latest_peer_id("carry", unit.carry_data("carry"))

	slot16 = zipline_unit

	if alive("carry") then
		slot16 = zipline_unit
		slot17 = unit

		zipline_unit.zipline(slot15).attach_bag(slot15, zipline_unit.zipline(slot15))
	else
		if not tweak_data.carry[carry_id].throw_power then
			local throw_power = tweak_data.carry.default_throw_power
		end

		slot18 = unit

		self.switch_carry_to_ragdoll(slot16, self)

		slot19 = dir * throw_power * throw_distance_multiplier

		unit.push(slot16, unit, 100)
	end

	slot16 = unit
	slot16 = unit.carry_data(slot15)

	unit.carry_data(slot15).on_thrown(slot15)

	slot16 = unit
	slot16 = unit.interaction(slot15)

	unit.interaction(slot15).register_collision_callbacks(slot15)

	return 
end
function PlayerManager:force_drop_carry()
	slot3 = self
	local carry_data = self.get_my_carry_data(slot2)

	if not carry_data then
		return 
	end

	local player = self.player_unit(slot3)
	slot5 = player

	if not alive(self) then
		slot5 = "COULDN'T FORCE DROP! DIDN'T HAVE A UNIT"

		print(slot4)

		return 
	end

	local dye_initiated = carry_data.dye_initiated
	local has_dye_pack = carry_data.has_dye_pack
	local dye_value_multiplier = carry_data.dye_value_multiplier
	local camera_ext = player.camera(slot7)
	slot9 = Network

	if Network.is_client(player) then
		slot9 = managers.network
		slot22 = 0
		slot20 = nil

		managers.network.session(slot8).send_to_host(slot8, managers.network.session(slot8), "server_drop_carry", carry_data.carry_id, carry_data.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, camera_ext.position(slot17), camera_ext.rotation(camera_ext), Vector3(camera_ext, 0, 0), 0)
	else
		slot19 = nil
		slot22 = managers.network
		slot22 = managers.network.session(0)

		self.server_drop_carry(slot8, self, carry_data.carry_id, carry_data.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, camera_ext.position(slot16), camera_ext.rotation(camera_ext), Vector3(camera_ext, 0, 0), 0, managers.network.session(0).local_peer(0))
	end

	slot10 = HUDManager.PLAYER_PANEL

	managers.hud.remove_teammate_carry_info(slot8, managers.hud)

	slot9 = managers.hud

	managers.hud.hide_carry_item(slot8)

	slot9 = self

	self.update_removed_synced_carry_to_peers(slot8)

	return 
end
function PlayerManager:set_carry_temporary_data(carry_id, data)
	if not self._temporary_carry_data then
		slot3 = {}
	end

	self._temporary_carry_data = slot3
	self._temporary_carry_data[carry_id] = data

	return 
end
function PlayerManager:carry_temporary_data(carry_id)
	if self._temporary_carry_data then
		return self._temporary_carry_data[carry_id]
	end

	return nil
end
function PlayerManager:clear_carry_temporary_data(carry_id)
	if self._temporary_carry_data then
		self._temporary_carry_data[carry_id] = nil
	end

	return 
end
function PlayerManager:clear_carry(soft_reset)
	slot4 = self
	local carry_data = self.get_my_carry_data(slot3)

	if not carry_data then
		return 
	end

	slot5 = self
	local player = self.player_unit(slot4)

	if not soft_reset then
		slot6 = player

		if not alive(slot5) then
			slot6 = "COULDN'T FORCE DROP! DIDN'T HAVE A UNIT"

			print(slot5)

			return 
		end
	end

	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	managers.network.session(slot5).local_peer(slot5)._carry_id = nil
	slot7 = HUDManager.PLAYER_PANEL

	managers.hud.remove_teammate_carry_info(nil, managers.hud)

	slot6 = managers.hud

	managers.hud.hide_carry_item(nil)

	self._total_bags = nil
	self._temporary_carry_data = {}
	slot6 = self

	self.update_removed_synced_carry_to_peers(nil)

	if self._current_state == "carry" or self._current_state == "carry_corpse" then
		slot7 = "standard"

		managers.player.set_player_state(slot5, managers.player)
	end

	return 
end
function PlayerManager:is_berserker()

	-- Decompilation error in this vicinity:
	local player_unit = self.player_unit(slot2)
	slot4 = player_unit

	return slot2
end
function PlayerManager:get_damage_health_ratio(health_ratio, category)
	slot9 = category
	local damage_ratio = 1 - health_ratio / math.max(slot4, self._get_damage_health_ratio_threshold(slot7, self))
	slot7 = 0

	return math.max(0.01, damage_ratio)
end
function PlayerManager:_get_damage_health_ratio_threshold(category)
	local threshold = tweak_data.upgrades.player_damage_health_ratio_threshold

	if category then
		slot8 = 1
		threshold = threshold * self.upgrade_value(slot4, self, "player", category .. "_damage_health_ratio_threshold_multiplier")
	end

	return threshold
end
function PlayerManager:is_damage_health_ratio_active(health_ratio)

	-- Decompilation error in this vicinity:
	slot6 = "melee_damage_health_ratio_multiplier"

	return slot2
end
function PlayerManager:get_current_state()
	local player = self.player_unit(slot2)
	slot4 = player

	return player.movement(self)._current_state
end
function PlayerManager:is_carrying()
	slot3 = self

	if self.get_my_carry_data(slot2) then
		slot1 = true
	else
		slot1 = false
	end

	return slot1
end
function PlayerManager:current_carry_id()
	slot3 = self
	local my_carry_data = self.get_my_carry_data(slot2)

	if not my_carry_data or not my_carry_data.carry_id then
		slot2 = nil
	end

	return slot2
end
function PlayerManager:carry_blocked_by_cooldown()
	return slot1
end
function PlayerManager:can_carry(carry_id)
	return true
end
function PlayerManager:check_damage_carry(attack_data)

	-- Decompilation error in this vicinity:
	slot4 = self
	local carry_data = self.get_my_carry_data(slot3)

	if not carry_data then
		return 
	end

	local carry_id = carry_data.carry_id
	local type = tweak_data.carry[carry_id].type

	if not tweak_data.carry.types[type].looses_value then
		return 
	end

	local dye_initiated = carry_data.dye_initiated
	local has_dye_pack = carry_data.has_dye_pack
	local dye_value_multiplier = carry_data.dye_value_multiplier
	slot11 = 0
	local value = math.max(slot9, carry_data.value - tweak_data.carry.types[type].looses_value_per_hit * attack_data.damage)
	slot16 = dye_value_multiplier

	self.update_synced_carry_to_peers(carry_data.value - tweak_data.carry.types[type].looses_value_per_hit * attack_data.damage, self, carry_id, carry_data.multiplier, dye_initiated, has_dye_pack)

	slot14 = carry_id

	managers.hud.set_teammate_carry_info(carry_data.value - tweak_data.carry.types[type].looses_value_per_hit * attack_data.damage, managers.hud, HUDManager.PLAYER_PANEL, nil)

	return 
end
function PlayerManager:dye_pack_exploded()
	slot3 = self
	local carry_data = self.get_my_carry_data(slot2)

	if not carry_data then
		return 
	end

	local carry_id = carry_data.carry_id
	local type = tweak_data.carry[carry_id].type
	local dye_initiated = carry_data.dye_initiated
	local has_dye_pack = carry_data.has_dye_pack
	local dye_value_multiplier = carry_data.dye_value_multiplier
	local value = carry_data.value * (1 - dye_value_multiplier / 100)
	slot10 = value
	value = math.round(slot9)
	has_dye_pack = false
	slot15 = dye_value_multiplier

	self.update_synced_carry_to_peers(slot9, self, carry_id, carry_data.multiplier, dye_initiated, has_dye_pack)

	slot13 = carry_id

	managers.hud.set_teammate_carry_info(slot9, managers.hud, HUDManager.PLAYER_PANEL, nil)

	return 
end
function PlayerManager:count_up_player_minions()
	slot3 = self._local_player_minions + 1
	slot9 = 0
	self._local_player_minions = math.min(slot2, self.upgrade_value(slot5, self, "player", "convert_enemies_max_minions"))
	slot3 = self

	self.update_hostage_skills(slot2)

	return 
end
function PlayerManager:count_down_player_minions()
	slot4 = 0
	self._local_player_minions = math.max(slot2, self._local_player_minions - 1)
	slot3 = self

	self.update_hostage_skills(slot2)

	return 
end
function PlayerManager:reset_minions()
	self._local_player_minions = 0

	return 
end
function PlayerManager:num_local_minions()
	return self._local_player_minions
end
function PlayerManager:chk_minion_limit_reached()
	slot7 = 0

	if self.upgrade_value(slot3, self, "player", "convert_enemies_max_minions") > self._local_player_minions then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end
function PlayerManager:on_used_body_bag()
	slot4 = self._local_player_body_bags - 1

	self._set_body_bags_amount(slot2, self)

	return 
end
function PlayerManager:reset_used_body_bag()
	slot3 = self
	slot6 = self

	self._set_body_bags_amount(slot2, self.total_body_bags(slot5))

	return 
end
function PlayerManager:chk_body_bags_depleted()
	if self._local_player_body_bags > 0 then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end
function PlayerManager:_set_body_bags_amount(body_bags_amount)
	slot5 = 0
	slot8 = self
	self._local_player_body_bags = math.clamp(slot3, body_bags_amount, self.max_body_bags(slot7))

	return 
end
function PlayerManager:add_body_bags_amount(body_bags_amount)
	slot5 = self._local_player_body_bags + body_bags_amount

	self._set_body_bags_amount(slot3, self)

	return 
end
function PlayerManager:get_body_bags_amount()
	return self._local_player_body_bags
end
function PlayerManager:has_total_body_bags()
	slot4 = self

	if self._local_player_body_bags ~= self.total_body_bags(slot3) then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end
function PlayerManager:total_body_bags()
	slot6 = 0

	return self.upgrade_value(slot2, self, "player", "corpse_dispose_amount")
end
function PlayerManager:has_max_body_bags()
	slot4 = self

	if self._local_player_body_bags ~= self.max_body_bags(slot3) then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end
function PlayerManager:max_body_bags()
	slot7 = 0

	return self.total_body_bags(slot2) + self.upgrade_value(self, self, "player", "extra_corpse_dispose_amount")
end
function PlayerManager:change_player_look(new_look)
	self._player_mesh_suffix = new_look
	slot6 = managers.groupai
	slot6 = managers.groupai.state(slot5)

	for _, unit in pairs(managers.groupai.state(slot5).all_char_criminals(slot5)) do
		slot9 = unit.unit
		slot9 = unit.unit.movement(slot8)

		unit.unit.movement(slot8).set_character_anim_variables(slot8)
	end

	return 
end
function PlayerManager:player_timer()
	return self._player_timer
end
function PlayerManager:add_weapon_ammo_gain(name_id, amount)
	slot5 = Application

	if Application.production_build(slot4) then
		if not self._debug_weapon_ammo_gains then
			slot3 = {}
		end

		self._debug_weapon_ammo_gains = slot3
		slot3 = self._debug_weapon_ammo_gains

		if not self._debug_weapon_ammo_gains[name_id] then
			slot4 = {
				total = 0,
				index = 0
			}
		end

		slot3[name_id] = slot4
		self._debug_weapon_ammo_gains[name_id].total = self._debug_weapon_ammo_gains[name_id].total + amount
		self._debug_weapon_ammo_gains[name_id].index = self._debug_weapon_ammo_gains[name_id].index + 1
	end

	return 
end
function PlayerManager:report_weapon_ammo_gains()
	slot3 = Application

	if Application.production_build(slot2) then
		if not self._debug_weapon_ammo_gains then
			slot1 = {}
		end

		self._debug_weapon_ammo_gains = slot1
		slot3 = self._debug_weapon_ammo_gains

		for name_id, data in pairs(slot2) do
			slot13 = data.total / data.index * 100
			slot9 = "AVERAGE AMMO PICKUP: " .. string.format(name_id, "%3.2f%%")

			print(slot7, "WEAPON: " .. tostring(slot10))
		end
	end

	return 
end
function PlayerManager:save(data)
	local state = {
		kit = self._global.kit,
		viewed_content_updates = self._global.viewed_content_updates
	}
	slot5 = self
	state.character_profile_name = self.get_character_profile_name(slot4)
	slot5 = self
	state.is_character_profile_hardcore = self.get_is_character_profile_hardcore(slot4)
	slot5 = self
	state.character_profile_nation = self.get_character_profile_nation(slot4)
	slot5 = self
	state.customization_equiped_head_name = self.get_customization_equiped_head_name(slot4)
	slot5 = self
	state.customization_equiped_upper_name = self.get_customization_equiped_upper_name(slot4)
	slot5 = self
	state.customization_equiped_lower_name = self.get_customization_equiped_lower_name(slot4)
	state.game_settings_difficulty = Global.game_settings.difficulty
	state.game_settings_permission = Global.game_settings.permission
	state.game_settings_drop_in_allowed = Global.game_settings.drop_in_allowed
	state.game_settings_team_ai = Global.game_settings.team_ai
	state.game_settings_auto_kick = Global.game_settings.auto_kick
	data.PlayerManager = state

	return 
end
function PlayerManager:load(data)
	slot4 = self

	self.reset(slot3)

	slot4 = self

	self.aquire_default_upgrades(slot3)

	local state = data.PlayerManager

	if state then
		slot3 = self._global

		if not state.kit then
			slot4 = self._global.kit
		end

		slot3.kit = slot4
		slot3 = self._global

		if not state.viewed_content_updates then
			slot4 = self._global.viewed_content_updates
		end

		slot3.viewed_content_updates = slot4
		slot5 = managers.savefile
		slot10 = "_verify_loaded_data"

		managers.savefile.add_load_done_callback(slot4, callback(slot7, self, self))

		slot6 = state.character_profile_name

		self.set_character_profile_name(slot4, self)

		slot6 = state.is_character_profile_hardcore

		self.set_is_character_profile_hardcore(slot4, self)

		slot6 = state.character_profile_nation

		self.set_character_profile_nation(slot4, self)

		slot6 = state.customization_equiped_head_name

		self.set_customization_equiped_head_name(slot4, self)

		slot6 = state.customization_equiped_upper_name

		self.set_customization_equiped_upper_name(slot4, self)

		slot6 = state.customization_equiped_lower_name

		self.set_customization_equiped_lower_name(slot4, self)

		slot3 = self._global

		if not state.game_settings_difficulty then
			slot4 = Global.DEFAULT_DIFFICULTY
		end

		slot3.game_settings_difficulty = slot4
		slot3 = self._global

		if not state.game_settings_permission then
			slot4 = Global.DEFAULT_PERMISSION
		end

		slot3.game_settings_permission = slot4
		slot3 = self._global

		if not state.game_settings_drop_in_allowed then
			slot4 = true
		end

		slot3.game_settings_drop_in_allowed = slot4
		slot3 = self._global

		if not state.game_settings_team_ai then
			slot4 = true
		end

		slot3.game_settings_team_ai = slot4
		slot3 = self._global

		if not state.game_settings_auto_kick then
			slot4 = true
		end

		slot3.game_settings_auto_kick = slot4
		Global.game_settings.permission = self._global.game_settings_permission
		Global.game_settings.drop_in_allowed = self._global.game_settings_drop_in_allowed
		Global.game_settings.team_ai = self._global.game_settings_team_ai
		Global.game_settings.auto_kick = self._global.game_settings_auto_kick
	end

	return 
end
function PlayerManager:set_content_update_viewed(content_update)
	self._global.viewed_content_updates[content_update] = true

	return 
end
function PlayerManager:get_content_update_viewed(content_update)
	if not self._global.viewed_content_updates[content_update] then
		slot2 = false
	end

	return slot2
end
function PlayerManager:_verify_loaded_data()
	local id = self._global.kit.equipment_slots[1]

	if id and not self._global.equipment[id] then
		slot4 = "PlayerManager:_verify_loaded_data()"
		slot7 = self._global.equipment

		print(slot3, inspect(slot6))

		self._global.kit.equipment_slots[1] = nil
		slot5 = true

		self._verify_equipment_kit(nil, self)
	end

	return 
end
function PlayerManager:sync_save(data)
	local state = {
		current_sync_state = self._current_sync_state,
		player_mesh_suffix = self._player_mesh_suffix,
		husk_bipod_data = self._global.synced_bipod,
		husk_turret_data = self._global.synced_turret,
		local_player_in_camp = self._local_player_in_camp
	}
	data.PlayerManager = state

	return 
end
function PlayerManager:sync_load(data)
	local state = data.PlayerManager

	if state then
		slot6 = state.current_sync_state

		self.set_player_state(slot4, self)

		slot6 = state.player_mesh_suffix

		self.change_player_look(slot4, self)

		slot6 = state.husk_bipod_data

		self.set_husk_bipod_data(slot4, self)

		slot6 = state.husk_turret_data

		self.set_husk_turret_data(slot4, self)

		slot6 = state.local_player_in_camp

		self.set_local_player_in_camp(slot4, self)
	end

	self.dropin = true

	return 
end
function PlayerManager:on_simulation_started()
	self._respawn = false

	return 
end
function PlayerManager:reset()
	if managers.hud then
		slot3 = managers.hud

		managers.hud.clear_player_special_equipments(slot2)
	end

	Global.player_manager = nil
	slot3 = self

	self._setup(nil)

	slot3 = self

	self._setup_rules(nil)

	slot3 = self

	self.aquire_default_upgrades(nil)

	return 
end
function PlayerManager:soft_reset()
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	slot3 = self

	self.reset_used_body_bag(slot2)

	self._equipment = {
		selections = {},
		specials = {}
	}
	self._global.synced_grenades = {}
	slot4 = true

	self.clear_carry(, self)

	return 
end
function PlayerManager:on_peer_synch_request(peer)
	slot4 = self
	slot4 = self.player_unit(slot3)
	slot5 = peer

	self.player_unit(slot3).network(slot3).synch_to_peer(slot3, self.player_unit(slot3).network(slot3))

	return 
end
function PlayerManager:update_husk_bipod_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_bipod[peer_id] then
		local bipod_pos = self._global.synced_bipod[peer_id].bipod_pos
		local body_pos = self._global.synced_bipod[peer_id].body_pos
		slot10 = body_pos

		peer.send_queued_sync(slot6, peer, "sync_bipod", bipod_pos)
	end

	return 
end
function PlayerManager:set_husk_bipod_data(data)
	self._global.synced_bipod = data

	return 
end
function PlayerManager:set_bipod_data_for_peer(data)
	if not self._global.synced_bipod then
		self._global.synced_bipod = {}
	end

	self._global.synced_bipod[data.peer_id] = {
		bipod_pos = data.bipod_pos,
		body_pos = data.body_pos
	}

	return 
end
function PlayerManager:get_bipod_data_for_peer(peer_id)
	return self._global.synced_bipod[peer_id]
end
function PlayerManager:set_synced_bipod(peer, bipod_pos, body_pos)
	slot6 = peer
	local peer_id = peer.id(slot5)
	self._global.synced_bipod[peer_id] = {
		bipod_pos = bipod_pos,
		body_pos = body_pos
	}

	return 
end
function PlayerManager:update_husk_turret_to_peer(peer)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)

	if self._global.synced_turret[peer_id] then
		local husk_pos = self._global.synced_turret[peer_id].husk_pos
		local turret_rot = self._global.synced_turret[peer_id].turret_rot
		local enter_animation = self._global.synced_turret[peer_id].enter_animation
		local exit_animation = self._global.synced_turret[peer_id].exit_animation
		local turret_unit = self._global.synced_turret[peer_id].turret_unit
		slot16 = turret_unit

		peer.send_queued_sync(slot9, peer, "sync_ground_turret_husk", husk_pos, turret_rot, enter_animation, exit_animation)
	end

	return 
end
function PlayerManager:set_husk_turret_data(data)
	self._global.synced_turret = data

	return 
end
function PlayerManager:set_turret_data_for_peer(data)
	if not self._global.synced_turret then
		self._global.synced_turret = {}
	end

	self._global.synced_turret[data.peer_id] = {
		husk_pos = data.husk_pos,
		turret_rot = data.turret_rot,
		enter_animation = data.enter_animation,
		exit_animation = data.exit_animation,
		turret_unit = data.turret_unit
	}

	return 
end
function PlayerManager:get_turret_data_for_peer(peer_id)
	return self._global.synced_turret[peer_id]
end
function PlayerManager:set_synced_turret(peer, husk_pos, turret_rot, enter_animation, exit_animation, turret_unit)
	slot9 = peer
	local peer_id = peer.id(slot8)
	self._global.synced_turret[peer_id] = {
		husk_pos = husk_pos,
		turret_rot = turret_rot,
		enter_animation = enter_animation,
		exit_animation = exit_animation,
		turret_unit = turret_unit
	}

	return 
end
function PlayerManager:enter_vehicle(vehicle, locator)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	local peer_id = managers.network.session(slot4).local_peer(slot4).id(slot4)
	local player = self.local_player(managers.network.session(slot4).local_peer(slot4))
	slot7 = vehicle
	slot7 = vehicle.vehicle_driving(self)
	slot10 = locator
	local seat = vehicle.vehicle_driving(self).get_available_seat(self, locator.position(slot9))

	if not seat then
		return 
	end

	slot8 = Network

	if Network.is_server(slot7) then
		slot12 = seat.name

		self.server_enter_vehicle(slot7, self, vehicle, peer_id, player)
	else
		slot8 = managers.network
		slot13 = player

		managers.network.session(slot7).send_to_host(slot7, managers.network.session(slot7), "sync_enter_vehicle_host", vehicle, seat.name, peer_id)
	end

	slot9 = "warcry"

	managers.hud.remove_comm_wheel_option(slot7, managers.hud)

	return 
end
function PlayerManager:server_enter_vehicle(vehicle, peer_id, player, seat_name)
	slot7 = vehicle
	local vehicle_ext = vehicle.vehicle_driving(slot6)
	local seat = nil

	if seat_name == nil then
		local pos = player.position(slot8)
		slot13 = nil
		seat = vehicle_ext.reserve_seat(player, vehicle_ext, player, pos)
	else
		slot12 = seat_name
		seat = vehicle_ext.reserve_seat(slot8, vehicle_ext, player, nil)
	end

	if seat ~= nil then
		slot9 = managers.network
		slot16 = nil

		managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_vehicle_player", "enter", vehicle, peer_id, player, seat.name)

		slot13 = seat.name

		self._enter_vehicle(slot8, self, vehicle, peer_id, player)
	end

	return 
end
function PlayerManager:sync_enter_vehicle(vehicle, peer_id, player, seat_name)
	slot11 = seat_name

	self._enter_vehicle(slot6, self, vehicle, peer_id, player)

	return 
end
function PlayerManager:_enter_vehicle(vehicle, peer_id, player, seat_name)
	self._global.synced_vehicle_data[peer_id] = {
		vehicle_unit = vehicle,
		seat = seat_name
	}
	local vehicle_ext = vehicle.vehicle_driving()

	vehicle_ext.place_player_on_seat(vehicle, vehicle_ext, player)

	slot8 = player

	player.kill_mover(vehicle)

	slot11 = VehicleDrivingExt.SEAT_PREFIX .. seat_name
	slot10 = player

	vehicle.link(vehicle, vehicle, Idstring(seat_name))

	slot8 = self

	if self.local_player(vehicle) == player then
		slot9 = "driving"

		self.set_player_state(slot7, self)
	end

	slot9 = vehicle.unit_data(slot10).name_label_id
	slot12 = vehicle_ext

	managers.hud.update_vehicle_label_by_id(slot7, managers.hud, vehicle_ext._number_in_the_vehicle(vehicle))

	slot10 = vehicle

	managers.hud.peer_enter_vehicle(slot7, managers.hud, peer_id)

	slot10 = player

	managers.vehicle.on_player_entered_vehicle(slot7, managers.vehicle, vehicle)

	slot9 = seat_name
	local seat_data = vehicle_ext.get_seat_data_by_seat_name(slot7, vehicle_ext)
	slot9 = self

	if self.local_player(vehicle_ext) == player then
		slot9 = vehicle_ext

		if vehicle_ext.shooting_stance_mandatory(slot8) then
			slot9 = managers.player

			if managers.player.current_state(slot8) == "driving" and seat_data.shooting_pos and seat_data.has_shooting_mode then
				slot9 = managers.player
				slot9 = managers.player.get_current_state(slot8)

				managers.player.get_current_state(slot8).enter_shooting_stance(slot8)
			end
		end
	end

	return 
end
function PlayerManager:get_vehicle()
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
		slot3 = managers.network.session(slot2).local_peer(slot2)
		local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
		local vehicle = self._global.synced_vehicle_data[peer_id]

		return vehicle
	else
		return nil
	end

	return 
end
function PlayerManager:get_vehicle_for_peer(peer_id)
	slot4 = managers.network

	if managers.network.session(slot3) then
		local vehicle = self._global.synced_vehicle_data[peer_id]

		return vehicle
	else
		return nil
	end

	return 
end
function PlayerManager:exit_vehicle()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
	local vehicle_data = self._global.synced_vehicle_data[peer_id]

	if vehicle_data == nil then
		return 
	end

	local player = self.local_player(slot4)
	slot6 = managers.network

	managers.network.session(self).send_to_peers_synched(self, managers.network.session(self), "sync_vehicle_player", "exit", nil, peer_id, player, nil)

	slot6 = managers.warcry

	if 100 <= managers.warcry.current_meter_percentage(self) then
		slot7 = 1

		managers.warcry.add_warcry_comm_wheel_option(slot5, managers.warcry)
	end

	slot8 = player

	self._exit_vehicle(slot5, self, peer_id)

	return 
end
function PlayerManager:sync_exit_vehicle(peer_id, player)
	slot7 = player

	self._exit_vehicle(slot4, self, peer_id)

	return 
end
function PlayerManager:_exit_vehicle(peer_id, player)
	local vehicle_data = self._global.synced_vehicle_data[peer_id]

	if vehicle_data == nil then
		return 
	end

	slot6 = player

	player.unlink(slot5)

	slot6 = vehicle_data.vehicle_unit

	if alive(slot5) then
		local vehicle_ext = vehicle_data.vehicle_unit.vehicle_driving(slot5)
		slot8 = player

		vehicle_ext.exit_vehicle(vehicle_data.vehicle_unit, vehicle_ext)

		slot8 = vehicle_data.vehicle_unit.unit_data(slot9).name_label_id
		slot11 = vehicle_ext

		managers.hud.update_vehicle_label_by_id(vehicle_data.vehicle_unit, managers.hud, vehicle_ext._number_in_the_vehicle(vehicle_data.vehicle_unit))
	else
		slot7 = "[PlayerManager:_exit_vehicle] Vehicle unit already destroyed!"

		Application.info(slot5, Application)
	end

	self._global.synced_vehicle_data[peer_id] = nil
	slot7 = peer_id

	managers.hud.peer_exit_vehicle(nil, managers.hud)

	slot8 = player

	managers.vehicle.on_player_exited_vehicle(nil, managers.vehicle, vehicle_data.vehicle)

	return 
end
function PlayerManager:move_to_next_seat(vehicle)
	local vehicle_ext = vehicle.vehicle_driving(slot3)
	slot5 = managers.network
	slot5 = managers.network.session(vehicle)
	local peer_id = managers.network.session(vehicle).local_peer(vehicle).id(vehicle)
	local player = self.local_player(managers.network.session(vehicle).local_peer(vehicle))
	slot8 = player
	local next_seat = vehicle_ext.get_next_seat(self, vehicle_ext)
	slot9 = player
	local player_seat = vehicle_ext.find_seat_for_player(vehicle_ext, vehicle_ext)

	if not next_seat or next_seat == player_seat then
		slot13 = player_seat
		slot13 = next_seat

		Application.debug(slot8, Application, "[PlayerManager:move_to_next_seat] unable to move to next seat: current: ", inspect(slot12), ",  next: ")

		return 
	end

	slot9 = Network

	if Network.is_server(slot8) then
		slot13 = next_seat.name

		self.server_move_to_next_seat(slot8, self, vehicle, peer_id, player)
	else
		slot9 = managers.network
		slot14 = next_seat.name

		managers.network.session(slot8).send_to_host(slot8, managers.network.session(slot8), "sync_move_to_next_seat", vehicle, peer_id, player)
	end

	return 
end
function PlayerManager:server_move_to_next_seat(vehicle, peer_id, player, seat_name)
	slot7 = vehicle
	local vehicle_ext = vehicle.vehicle_driving(slot6)
	local seat = nil

	if seat_name == nil then
		slot10 = "[PlayerManager:move_to_next_seat] unable to move to next seat, seat name is nil"

		Application.error(slot8, Application)

		return 
	end

	slot9 = vehicle
	slot10 = player
	local previous_seat = vehicle.vehicle_driving(slot8).find_seat_for_player(slot8, vehicle.vehicle_driving(slot8))
	slot14 = true
	seat = vehicle_ext.reserve_seat(vehicle.vehicle_driving(slot8), vehicle_ext, player, nil, seat_name)

	if seat ~= nil then
		if seat.previous_occupant then
			slot10 = managers.network
			slot18 = seat.previous_occupant

			managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_vehicle_player_swithc_seat", "next_seat", vehicle, peer_id, player, seat.name, previous_seat.name)
		else
			slot10 = managers.network
			slot17 = previous_seat.name

			managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_vehicle_player", "next_seat", vehicle, peer_id, player, seat.name)
		end

		slot16 = seat.previous_occupant

		self._move_to_next_seat(slot9, self, vehicle, peer_id, player, seat, previous_seat)
	end

	return 
end
function PlayerManager:sync_move_to_next_seat(vehicle, peer_id, player, seat_name, previous_seat_name, previous_occupant)
	slot9 = vehicle
	local vehicle_ext = vehicle.vehicle_driving(slot8)
	local seat = vehicle_ext._seats[seat_name]

	if not previous_seat_name or not vehicle_ext._seats[previous_seat_name] then
		local previous_seat = nil
	end

	slot18 = previous_occupant

	self._move_to_next_seat(slot11, self, vehicle, peer_id, player, seat, previous_seat)

	return 
end
function PlayerManager:_move_to_next_seat(vehicle, peer_id, player, seat, previous_seat, previous_occupant)
	self._global.synced_vehicle_data[peer_id] = {
		vehicle_unit = vehicle,
		seat = seat.name
	}
	local vehicle_ext = vehicle.vehicle_driving()

	vehicle_ext.move_player_to_seat(vehicle, vehicle_ext, player, seat, previous_seat)

	slot10 = player
	slot10 = player.movement(vehicle)
	slot10 = player.movement(vehicle).current_state(vehicle)

	player.movement(vehicle).current_state(vehicle).sync_move_to_next_seat(vehicle)

	local rot = seat.object.rotation(vehicle)
	local pos = seat.object.position(seat.object) + VehicleDrivingExt.PLAYER_CAPSULE_OFFSET
	slot13 = rot

	player.set_rotation(seat.object, player)

	slot13 = pos

	player.set_position(seat.object, player)

	slot15 = VehicleDrivingExt.SEAT_PREFIX .. seat.name

	vehicle.link(seat.object, vehicle, Idstring(previous_occupant))

	slot13 = vehicle.unit_data(player).name_label_id
	slot16 = vehicle_ext

	managers.hud.update_vehicle_label_by_id(seat.object, managers.hud, vehicle_ext._number_in_the_vehicle(vehicle))

	if not seat.fov then
		local fov = vehicle_ext._tweak_data.fov
	end

	if fov then
		slot13 = self

		if player == self.local_player(slot12) then
			slot13 = player
			slot13 = player.camera(slot12)._camera_unit
			slot15 = 0.33

			player.camera(slot12)._camera_unit.base(slot12).animate_fov(slot12, player.camera(slot12)._camera_unit.base(slot12), fov)
		end
	end

	local seat_data = seat
	slot14 = self

	if self.local_player(slot13) == player then
		slot14 = vehicle_ext

		if vehicle_ext.shooting_stance_mandatory(slot13) then
			slot14 = managers.player

			if managers.player.current_state(slot13) == "driving" and seat_data.shooting_pos and seat_data.has_shooting_mode then
				slot14 = managers.player
				slot14 = managers.player.get_current_state(slot13)

				managers.player.get_current_state(slot13).enter_shooting_stance(slot13)
			end
		end
	end

	return 
end
function PlayerManager:disable_view_movement()
	slot3 = self
	slot3 = self.player_unit(slot2)
	slot3 = self.player_unit(slot2).camera(slot2)
	slot3 = self.player_unit(slot2).camera(slot2).camera_unit(slot2)
	slot5 = 0.01

	self.player_unit(slot2).camera(slot2).camera_unit(slot2).base(slot2).set_limits(slot2, self.player_unit(slot2).camera(slot2).camera_unit(slot2).base(slot2), 0.01)

	self._view_disabled = true

	return 
end
function PlayerManager:enable_view_movement()
	slot3 = self
	local player_unit = self.player_unit(slot2)

	if player_unit then
		slot4 = player_unit

		if alive(slot3) then
			slot4 = player_unit
			slot4 = player_unit.camera(slot3)
			slot4 = player_unit.camera(slot3).camera_unit(slot3)
			slot4 = player_unit.camera(slot3).camera_unit(slot3).base(slot3)

			player_unit.camera(slot3).camera_unit(slot3).base(slot3).remove_limits(slot3)

			self._view_disabled = false
		end
	end

	return 
end
function PlayerManager:is_view_disabled()
	return self._view_disabled
end
function PlayerManager:use_turret(turret_unit)
	self._turret_unit = turret_unit

	return 
end
function PlayerManager:leave_turret()
	self._turret_unit = nil

	return 
end
function PlayerManager:get_turret_unit()
	return self._turret_unit
end
function PlayerManager:update_player_list(unit, health)
	slot5 = self._player_list

	for i in pairs(slot4) do
		local p = self._player_list[i]

		if p.unit == unit then
			p.health = health

			return 
		end
	end

	slot6 = {
		unit = unit,
		health = health
	}

	table.insert(slot4, self._player_list)

	return 
end
function PlayerManager:debug_print_player_status()
	local count = 0
	slot4 = self._player_list

	for i in pairs(slot3) do
		local p = self._player_list[i]
		slot14 = p.unit

		print(slot8, "Player: ", i, ", health: ", p.health, " , unit: ")

		count = count + 1
	end

	slot5 = count

	print(slot3, "num players: ")

	return 
end
function PlayerManager:remove_from_player_list(unit)
	slot4 = self._player_list

	for i in pairs(slot3) do
		local p = self._player_list[i]

		if p.unit == unit then
			slot10 = i

			table.remove(slot8, self._player_list)

			return 
		end
	end

	return 
end
function PlayerManager:on_ammo_increase(ammo)
	slot4 = self
	local equipped_unit = self.get_current_state(slot3)._equipped_unit.base(slot3)
	slot5 = self
	slot5 = self.get_current_state(self.get_current_state(slot3)._equipped_unit)._ext_inventory
	local equipped_selection = self.get_current_state(self.get_current_state(slot3)._equipped_unit)._ext_inventory.equipped_selection(self.get_current_state(slot3)._equipped_unit)

	if equipped_unit then
		slot6 = equipped_unit

		if not equipped_unit.ammo_full(slot5) then
			local index = self.equipped_weapon_index(slot5)
			slot9 = index

			equipped_unit.add_ammo_to_pool(self, equipped_unit, ammo)
		end
	end

	return 
end
function PlayerManager:equipped_weapon_index()
	local current_state = self.get_current_state(slot2)
	local equipped_unit = current_state._equipped_unit.base(self)._unit
	local available_selections = current_state._ext_inventory.available_selections(current_state._equipped_unit)
	slot6 = available_selections

	for id, weapon in pairs(current_state._ext_inventory) do
		if equipped_unit == weapon.unit then
			return id
		end
	end

	return 1
end
function PlayerManager:equipped_weapon_unit()
	slot3 = self
	local current_state = self.get_current_state(slot2)

	if current_state then
		slot4 = current_state._equipped_unit
		local weapon_unit = current_state._equipped_unit.base(slot3)._unit

		return weapon_unit
	end

	return nil
end
function PlayerManager:kill()
	local player = self.player_unit(slot2)
	slot4 = player

	if not alive(self) then
		return 
	end

	slot4 = managers.player

	managers.player.force_drop_carry(slot3)

	slot5 = {
		death = true
	}

	managers.statistics.downed(slot3, managers.statistics)
	IngameFatalState.on_local_player_dead()

	slot4 = managers.warcry

	managers.warcry.deactivate_warcry(slot3)

	slot4 = player
	slot5 = false

	player.base(slot3).set_enabled(slot3, player.base(slot3))

	slot5 = "ingame_waiting_for_respawn"

	game_state_machine.change_state_by_name(slot3, game_state_machine)

	slot4 = player
	slot5 = true

	player.character_damage(slot3).set_invulnerable(slot3, player.character_damage(slot3))

	slot4 = player
	slot5 = 0

	player.character_damage(slot3).set_health(slot3, player.character_damage(slot3))

	slot4 = player
	slot9 = player
	slot7 = player.character_damage(slot8).down_time(slot8)
	slot10 = player

	player.network(slot3).send(slot3, player.network(slot3), "sync_player_movement_state", "dead", player.id(player.character_damage(slot8)))

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	slot7 = managers.network
	slot7 = managers.network.session("dead")
	slot7 = managers.network.session("dead").local_peer("dead")

	managers.groupai.state(slot3).on_player_criminal_death(slot3, managers.network.session("dead").local_peer("dead").id("dead"))

	slot4 = player
	slot4 = player.base(slot3)

	player.base(slot3)._unregister(slot3)

	slot4 = player
	slot6 = 0

	player.base(slot3).set_slot(slot3, player.base(slot3), player)

	slot5 = player

	World.delete_unit(slot3, World)

	return 
end
function PlayerManager:destroy()
	local player = self.player_unit(slot2)
	slot4 = player
	slot4 = player.base(self)

	player.base(self)._unregister(self)

	slot4 = player
	slot6 = 0

	player.base(self).set_slot(self, player.base(self), player)

	return 
end
function PlayerManager:debug_goto_custody()
	local player = managers.player.player_unit(slot2)
	slot4 = player

	if not alive(managers.player) then
		return 
	end

	slot4 = managers.player

	if managers.player.current_state(slot3) ~= "bleed_out" then
		slot5 = "bleed_out"

		managers.player.set_player_state(slot3, managers.player)
	end

	slot4 = managers.player

	if managers.player.current_state(slot3) ~= "fatal" then
		slot5 = "fatal"

		managers.player.set_player_state(slot3, managers.player)
	end

	slot4 = managers.player

	managers.player.force_drop_carry(slot3)

	slot5 = {
		death = true
	}

	managers.statistics.downed(slot3, managers.statistics)
	IngameFatalState.on_local_player_dead()

	slot5 = "ingame_waiting_for_respawn"

	game_state_machine.change_state_by_name(slot3, game_state_machine)

	slot4 = player
	slot5 = true

	player.character_damage(slot3).set_invulnerable(slot3, player.character_damage(slot3))

	slot4 = player
	slot5 = 0

	player.character_damage(slot3).set_health(slot3, player.character_damage(slot3))

	slot4 = player
	slot4 = player.base(slot3)

	player.base(slot3)._unregister(slot3)

	slot4 = player
	slot6 = 0

	player.base(slot3).set_slot(slot3, player.base(slot3), player)

	return 
end
function PlayerManager:replenish_player()
	local unit = managers.player.player_unit(slot2)
	slot4 = unit

	if alive(managers.player) then
		slot4 = unit

		if unit.character_damage(slot3) then
			slot4 = unit
			slot4 = unit.character_damage(slot3)

			unit.character_damage(slot3).replenish(slot3)
		end
	end

	return 
end
function PlayerManager:replenish_player_weapons()
	slot3 = managers.player

	if managers.player.player_unit(slot2) then
		slot3 = managers.player
		slot3 = managers.player.player_unit(slot2)

		if managers.player.player_unit(slot2).inventory(slot2) then
			slot3 = managers.player
			slot3 = managers.player.player_unit(slot2)
			slot3 = managers.player.player_unit(slot2).inventory(slot2)

			if managers.player.player_unit(slot2).inventory(slot2).available_selections(slot2) then
				slot5 = managers.player
				slot5 = managers.player.player_unit(slot4)
				slot5 = managers.player.player_unit(slot4).inventory(slot4)

				for id, weapon in pairs(managers.player.player_unit(slot4).inventory(slot4).available_selections(slot4)) do
					slot8 = weapon.unit

					if alive(slot7) then
						slot8 = weapon.unit
						slot8 = weapon.unit.base(slot7)

						if weapon.unit.base(slot7).uses_ammo(slot7) then
							slot8 = weapon.unit
							slot8 = weapon.unit.base(slot7)

							weapon.unit.base(slot7).replenish(slot7)

							slot9 = id
							slot12 = weapon.unit
							slot12 = weapon.unit.base(slot11)

							managers.hud.set_ammo_amount(slot7, managers.hud, weapon.unit.base(slot11).ammo_info(slot11))
						end
					end
				end

				slot3 = managers.blackmarket
				local name, amount = managers.blackmarket.equipped_grenade(slot2)
				slot6 = amount

				managers.player.add_grenade_amount(slot4, managers.player)
			end
		end
	end

	return 
end
function PlayerManager:stop_all_speaking_except_dialog()
	local local_player = self.player_unit(slot2)
	slot4 = local_player
	slot4 = local_player.sound(self)

	local_player.sound(self).stop_speaking(self)

	return 
end
function PlayerManager:set_local_player_in_camp(value)
	self._local_player_in_camp = value
	slot4 = self

	self._on_camp_presence_changed(slot3)

	slot5 = CoreSystemEventListenerManager.SystemEventListenerManager.CAMP_PRESENCE_CHANGED

	managers.system_event_listener.call_listeners(slot3, managers.system_event_listener)

	return 
end
function PlayerManager:local_player_in_camp()
	return self._local_player_in_camp
end
function PlayerManager:_on_camp_presence_changed()
	slot3 = self
	local player = self.local_player(slot2)

	if not player then
		return 
	end

	if self._local_player_in_camp then
		slot4 = player
		slot5 = true

		player.character_damage(slot3).set_invulnerable(slot3, player.character_damage(slot3))
	else
		slot4 = player
		slot5 = false

		player.character_damage(slot3).set_invulnerable(slot3, player.character_damage(slot3))
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot6 = self._local_player_in_camp

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_camp_presence")
	end

	return 
end
function PlayerManager:tutorial_make_invulnerable()
	slot3 = managers.raid_job

	managers.raid_job.revert_temp_play_flag(slot2)

	slot3 = managers.player
	local player = managers.player.local_player(slot2)

	if not player then
		return 
	end

	slot4 = player
	slot5 = true

	player.character_damage(slot3).set_invulnerable(slot3, player.character_damage(slot3))

	return 
end
function PlayerManager:tutorial_set_health(value)
	slot4 = managers.player
	local player = managers.player.local_player(slot3)

	if not player then
		return 
	end

	slot5 = player
	slot6 = false

	player.character_damage(slot4).set_invulnerable(slot4, player.character_damage(slot4))

	slot5 = player
	slot6 = value

	player.character_damage(slot4).set_health(slot4, player.character_damage(slot4))

	return 
end
function PlayerManager:tutorial_clear_all_ammo()
	slot4 = "[PlayerManager:tutorial_clear_all_ammo()]"

	Application.debug(slot2, Application)

	slot3 = managers.player
	local player = managers.player.local_player(slot2)

	if not player then
		return 
	end

	slot4 = player
	slot5 = 0

	player.inventory(slot3).set_ammo(slot3, player.inventory(slot3))

	slot5 = -3

	self.add_grenade_amount(slot3, self)

	return 
end
function PlayerManager:tutorial_replenish_all_ammo()
	managers.raid_job._tutorial_spawned = false
	slot3 = managers.player

	if managers.player.player_unit(false) then
		slot3 = managers.player
		slot3 = managers.player.player_unit(slot2)

		if managers.player.player_unit(slot2).inventory(slot2) then
			slot3 = managers.player
			slot3 = managers.player.player_unit(slot2)
			slot3 = managers.player.player_unit(slot2).inventory(slot2)

			if managers.player.player_unit(slot2).inventory(slot2).available_selections(slot2) then
				slot5 = managers.player
				slot5 = managers.player.player_unit(slot4)
				slot5 = managers.player.player_unit(slot4).inventory(slot4)

				for id, weapon in pairs(managers.player.player_unit(slot4).inventory(slot4).available_selections(slot4)) do
					slot8 = weapon.unit

					if alive(slot7) then
						slot8 = weapon.unit
						slot8 = weapon.unit.base(slot7)

						if weapon.unit.base(slot7).uses_ammo(slot7) then
							slot8 = weapon.unit
							slot8 = weapon.unit.base(slot7)

							weapon.unit.base(slot7).replenish(slot7)

							slot9 = id
							slot12 = weapon.unit
							slot12 = weapon.unit.base(slot11)

							managers.hud.set_ammo_amount(slot7, managers.hud, weapon.unit.base(slot11).ammo_info(slot11))
						end
					end
				end
			end
		end
	end

	managers.raid_job._tutorial_spawned = true

	return 
end
function PlayerManager:tutorial_set_ammo(value)
	slot4 = managers.player
	local player = managers.player.local_player(slot3)

	if not player then
		return 
	end

	slot5 = player
	slot6 = value

	player.inventory(slot4).set_ammo_with_empty_clip(slot4, player.inventory(slot4))

	slot6 = 3

	self.add_grenade_amount(slot4, self)

	return 
end
function PlayerManager:tutorial_remove_AI()
	slot3 = managers.player
	local player = managers.player.local_player(slot2)

	if not player then
		return 
	end

	Global.game_settings.team_ai = false
	slot4 = managers.groupai
	slot4 = managers.groupai.state(false)

	managers.groupai.state(false).on_criminal_team_AI_enabled_state_changed(false)

	Global.game_settings.team_ai = true

	return 
end

return 
