slot2 = "lib/network/matchmaking/NetworkAccount"

require(slot1)

if not NetworkAccountSTEAM then
	slot2 = NetworkAccount
	slot0 = class(slot1)
end

NetworkAccountSTEAM = slot0
NetworkAccountSTEAM.lb_diffs = {
	hard = "Hard",
	overkill = "Very Hard",
	overkill_145 = "Overkill",
	normal = "Normal",
	overkill_290 = "Death Wish",
	easy = "Easy"
}
NetworkAccountSTEAM.lb_levels = {
	slaughter_house = "Slaughterhouse",
	diamond_heist = "Diamond Heist",
	hospital = "No Mercy",
	suburbia = "Counterfeit",
	bridge = "Green Bridge",
	secret_stash = "Undercover",
	apartment = "Panic Room",
	bank = "First World Bank",
	heat_street = "Heat Street"
}
NetworkAccountSTEAM.init = function (self)
	slot3 = self

	NetworkAccount.init(slot2)

	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	slot3 = Steam

	Steam.init(slot2)

	slot5 = NetworkAccountSTEAM._on_server_request

	Steam.request_listener(slot2, Steam, NetworkAccountSTEAM._on_join_request)

	slot6 = NetworkAccountSTEAM._on_connect_fail

	Steam.error_listener(slot2, Steam, NetworkAccountSTEAM._on_disconnected, NetworkAccountSTEAM._on_ipc_fail)

	slot8 = "_on_open_overlay"
	slot4 = callback(NetworkAccountSTEAM._on_ipc_fail, self, self)
	slot9 = "_on_close_overlay"

	Steam.overlay_listener(slot2, Steam, callback(self, self, self))

	self._gamepad_text_listeners = {}
	slot3 = Steam

	if Steam.overlay_open(slot2) then
		slot3 = self

		self._on_open_overlay(slot2)
	end

	slot3 = Steam
	slot4 = NetworkAccountSTEAM._on_stats_stored

	Steam.sa_handler(slot2).stats_store_callback(slot2, Steam.sa_handler(slot2))

	slot3 = Steam
	slot3 = Steam.sa_handler(slot2)

	Steam.sa_handler(slot2).init(slot2)

	slot3 = self

	self._set_presences(slot2)

	slot3 = managers.savefile
	slot8 = "_load_done"

	managers.savefile.add_load_done_callback(slot2, callback(slot5, self, self))

	slot3 = Steam
	slot4 = NetworkAccountSTEAM._on_leaderboard_stored

	Steam.lb_handler(slot2).register_storage_done_callback(slot2, Steam.lb_handler(slot2))

	slot3 = Steam
	slot4 = NetworkAccountSTEAM._on_leaderboard_mapped

	Steam.lb_handler(slot2).register_mappings_done_callback(slot2, Steam.lb_handler(slot2))

	slot3 = self

	self.set_lightfx(slot2)

	slot3 = self

	self.inventory_load(slot2)

	return 
end
NetworkAccountSTEAM._load_done = function (self, ...)
	slot3 = "NetworkAccountSTEAM:_load_done()"

	print(slot2, ...)

	slot3 = self

	self._set_presences(slot2)

	return 
end
NetworkAccountSTEAM.update = function (self)
	slot3 = self

	self._chk_inventory_outfit_refresh(slot2)

	return 
end
NetworkAccountSTEAM._set_presences = function (self)
	slot4 = "level"
	slot7 = managers.experience

	Steam.set_rich_presence(slot2, Steam, managers.experience.current_level(slot6))

	return 
end
NetworkAccountSTEAM.set_presences_peer_id = function (self, peer_id)
	slot6 = peer_id

	Steam.set_rich_presence(slot3, Steam, "peer_id")

	return 
end
NetworkAccountSTEAM.get_win_ratio = function (self, difficulty, level)
	slot5 = Steam
	slot7 = 30
	local plays = Steam.sa_handler(slot4).get_global_stat(slot4, Steam.sa_handler(slot4), difficulty .. "_" .. level .. "_plays")
	slot6 = Steam
	slot8 = 30
	local wins = Steam.sa_handler(Steam.sa_handler(slot4)).get_global_stat(Steam.sa_handler(slot4), Steam.sa_handler(Steam.sa_handler(slot4)), difficulty .. "_" .. level .. "_wins")
	local ratio = {}

	if #plays == 0 or #wins == 0 then
		return 
	end

	slot8 = plays

	for i, plays_n in pairs(slot7) do
		ratio[i] = wins[i] / ((plays_n == 0 and 1) or plays_n)
	end

	slot8 = ratio

	table.sort(slot7)

	return ratio[#ratio / 2]
end
NetworkAccountSTEAM.set_lightfx = function (self)
	slot4 = "use_lightfx"

	if managers.user.get_setting(slot2, managers.user) then
		slot3 = "[NetworkAccountSTEAM:init] Initializing LightFX..."

		print(slot2)

		slot3 = LightFX

		if LightFX.initialize(slot2) then
			slot3 = LightFX
			slot1 = LightFX.has_lamps(slot2)
		end

		self._has_alienware = slot1

		if self._has_alienware then
			slot7 = 255

			LightFX.set_lamps(slot2, LightFX, 0, 255, 0)
		end

		slot3 = "[NetworkAccountSTEAM:init] Initializing LightFX done"

		print(slot2)
	else
		self._has_alienware = nil
	end

	return 
end
NetworkAccountSTEAM._on_troll_group_recieved = function (success, page)
	if success then
		slot8 = Steam
		slot5 = "<steamID64>" .. Steam.userid(slot7) .. "</steamID64>"

		if string.find(slot3, page) then
			managers.network.account._masks.troll = true
		end
	end

	slot6 = NetworkAccountSTEAM._on_com_group_recieved

	Steam.http_request(slot3, Steam, "http://steamcommunity.com/gid/103582791432592205/memberslistxml/?xml=1")

	return 
end
NetworkAccountSTEAM._on_com_group_recieved = function (success, page)
	if success then
		slot8 = Steam
		slot5 = "<steamID64>" .. Steam.userid(slot7) .. "</steamID64>"

		if string.find(slot3, page) then
			managers.network.account._masks.hockey_com = true
		end
	end

	slot6 = NetworkAccountSTEAM._on_dev_group_recieved

	Steam.http_request(slot3, Steam, "http://steamcommunity.com/gid/103582791432508229/memberslistxml/?xml=1")

	return 
end
NetworkAccountSTEAM._on_dev_group_recieved = function (success, page)
	if success then
		slot8 = Steam
		slot5 = "<steamID64>" .. Steam.userid(slot7) .. "</steamID64>"

		if string.find(slot3, page) then
			managers.network.account._masks.developer = true
		end
	end

	return 
end
NetworkAccountSTEAM.has_alienware = function (self)
	return self._has_alienware
end
NetworkAccountSTEAM._call_listeners = function (self, event, params)
	if self._listener_holder then
		slot7 = params

		self._listener_holder.call(slot4, self._listener_holder, event)
	end

	return 
end
NetworkAccountSTEAM.add_overlay_listener = function (self, key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
NetworkAccountSTEAM.remove_overlay_listener = function (self, key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
NetworkAccountSTEAM._on_open_overlay = function (self)
	if self._overlay_opened then
		return 
	end

	self._overlay_opened = true
	slot4 = "overlay_open"

	self._call_listeners(slot2, self)

	slot4 = false

	game_state_machine._set_controller_enabled(slot2, game_state_machine)

	return 
end
NetworkAccountSTEAM._on_close_overlay = function (self)
	if not self._overlay_opened then
		return 
	end

	self._overlay_opened = false
	slot4 = "overlay_close"

	self._call_listeners(slot2, self)

	slot3 = managers.raid_menu

	if not managers.raid_menu.is_any_menu_open(slot2) then
		slot4 = true

		game_state_machine._set_controller_enabled(slot2, game_state_machine)
	end

	slot3 = managers.dlc

	managers.dlc.chk_content_updated(slot2)

	return 
end
NetworkAccountSTEAM._on_gamepad_text_submitted = function (self, submitted, submitted_text)
	slot9 = submitted_text

	print(slot4, "[NetworkAccountSTEAM:_on_gamepad_text_submitted]", "submitted", submitted, "submitted_text")

	slot5 = self._gamepad_text_listeners

	for id, clbk in pairs(slot4) do
		slot11 = submitted_text

		clbk(slot9, submitted)
	end

	self._gamepad_text_listeners = {}

	return 
end
NetworkAccountSTEAM.show_gamepad_text_input = function (self, id, callback, params)
	return false
end
NetworkAccountSTEAM.add_gamepad_text_listener = function (self, id, clbk)
	if self._gamepad_text_listeners[id] then
		slot10 = clbk

		debug_pause(slot4, "[NetworkAccountSTEAM:add_gamepad_text_listener] ID already added!", id, "Old Clbk", self._gamepad_text_listeners[id], "New Clbk")
	end

	self._gamepad_text_listeners[id] = clbk

	return 
end
NetworkAccountSTEAM.remove_gamepad_text_listener = function (self, id)
	if not self._gamepad_text_listeners[id] then
		slot5 = id

		debug_pause(slot3, "[NetworkAccountSTEAM:remove_gamepad_text_listener] ID do not exist!")
	end

	self._gamepad_text_listeners[id] = nil

	return 
end
NetworkAccountSTEAM.achievements_fetched = function (self)
	self._achievements_fetched = true

	return 
end
NetworkAccountSTEAM.challenges_loaded = function (self)
	self._challenges_loaded = true

	return 
end
NetworkAccountSTEAM.experience_loaded = function (self)
	self._experience_loaded = true

	return 
end
NetworkAccountSTEAM._on_leaderboard_stored = function (status)
	slot5 = "."

	print(slot2, "[NetworkAccountSTEAM:_on_leaderboard_stored] Leaderboard stored, ", status)

	return 
end
NetworkAccountSTEAM._on_leaderboard_mapped = function ()
	slot2 = "[NetworkAccountSTEAM:_on_leaderboard_stored] Leaderboard mapped."

	print(slot1)

	slot2 = Steam
	slot2 = Steam.lb_handler(slot1)

	Steam.lb_handler(slot1).request_storage(slot1)

	return 
end
NetworkAccountSTEAM._on_stats_stored = function (status)
	slot5 = ". Publishing leaderboard score to Steam!"

	print(slot2, "[NetworkAccountSTEAM:_on_stats_stored] Statistics stored, ", status)

	return 
end
NetworkAccountSTEAM.get_stat = function (self, key)
	slot4 = Steam
	slot5 = key

	return Steam.sa_handler(slot3).get_stat(slot3, Steam.sa_handler(slot3))
end
NetworkAccountSTEAM.get_lifetime_stat = function (self, key)
	slot4 = Steam
	slot5 = key

	return Steam.sa_handler(slot3).get_lifetime_stat(slot3, Steam.sa_handler(slot3))
end
NetworkAccountSTEAM.get_global_stat = function (self, key, days)
	local value = 0
	local global_stat = nil

	if days and days < 0 then
		local day = math.abs(slot6) + 1
		slot8 = Steam
		slot10 = day
		global_stat = Steam.sa_handler(days).get_global_stat(days, Steam.sa_handler(days), key)

		return global_stat[day] or 0
	elseif days then
		slot7 = Steam
		slot9 = (days == 1 and 1) or days + 1
		global_stat = Steam.sa_handler(slot6).get_global_stat(slot6, Steam.sa_handler(slot6), key)
		slot5 = (1 < days and 2) or 1

		for i = slot5, #global_stat, 1 do
			value = value + global_stat[i]
		end
	else
		slot7 = Steam
		slot8 = key
		global_stat = Steam.sa_handler(slot6).get_global_stat(slot6, Steam.sa_handler(slot6))
		slot7 = global_stat

		for _, day in ipairs(slot6) do
			value = value + day
		end
	end

	return value
end
NetworkAccountSTEAM.publish_statistics = function (self, stats, force_store)
	slot5 = managers.dlc

	if managers.dlc.is_trial(slot4) then
		return 
	end

	slot5 = Steam
	local handler = Steam.sa_handler(slot4)
	local err = false
	slot7 = stats

	for key, stat in pairs(slot6) do
		local res = nil

		if stat.type == "int" then
			slot13 = 0
			slot17 = key
			local val = math.max(slot12, handler.get_stat(slot15, handler))

			if stat.method == "lowest" then
				if stat.value < val then
					slot16 = stat.value
					res = handler.set_stat(slot13, handler, key)
				else
					res = true
				end
			elseif stat.method == "highest" then
				if val < stat.value then
					slot16 = stat.value
					res = handler.set_stat(slot13, handler, key)
				else
					res = true
				end
			elseif stat.method == "set" then
				slot15 = key
				slot20 = 2147483000
				res = handler.set_stat(slot13, handler, math.clamp(slot17, stat.value, 0))
			elseif 0 < stat.value then
				local mval = val / 1000 + stat.value / 1000

				if 2147483 <= mval then
					slot17 = 2147483000
					res = handler.set_stat(slot14, handler, key)
				else
					slot17 = val + stat.value
					res = handler.set_stat(slot14, handler, key)
				end
			else
				res = true
			end
		elseif stat.type == "float" then
			if 0 < stat.value then
				slot14 = key
				local val = handler.get_stat_float(slot12, handler)
				slot16 = val + stat.value
				res = handler.set_stat_float(handler, handler, key)
			else
				res = true
			end
		elseif stat.type == "avgrate" then
			slot16 = stat.hours
			res = handler.set_stat_float(slot12, handler, key, stat.value)
		end

		if not res then
			slot14 = "[NetworkAccountSTEAM:publish_statistics] Error, could not set stat " .. key

			Application.error(slot12, Application)

			err = true
		end
	end

	if not err then
		slot7 = handler

		handler.store_data(slot6)
	end

	return 
end
NetworkAccountSTEAM._on_disconnected = function (lobby_id, friend_id)
	slot6 = friend_id

	print(slot3, "[NetworkAccountSTEAM._on_disconnected]", lobby_id)

	slot4 = Application

	if Application.editor(slot3) then
		return 
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.raid_menu

		managers.raid_menu.show_dialog_disconnected_from_steam(slot3)

		Global.game_settings.single_player = true

		if managers.network.matchmake.lobby_handler then
			slot4 = managers.network.matchmake.lobby_handler

			managers.network.matchmake.lobby_handler.leave_lobby(slot3)
		end
	end

	slot6 = 12

	Application.warn(slot3, Application, "Disconnected from Steam!! Please wait")

	return 
end
NetworkAccountSTEAM._on_ipc_fail = function (lobby_id, friend_id)
	slot4 = "[NetworkAccountSTEAM._on_ipc_fail]"

	print(slot3)

	return 
end
NetworkAccountSTEAM._on_join_request = function (lobby_id, friend_id)
	slot5 = "[NetworkAccountSTEAM._on_join_request]"

	Application.trace(slot3, Application)

	slot4 = managers.savefile

	if managers.savefile.get_active_characters_count(slot3) < 1 then
		slot4 = managers.raid_menu

		managers.raid_menu.show_dialog_join_others_forbidden(slot3)

		return 
	end

	if managers.network.matchmake.lobby_handler then
		slot4 = managers.network.matchmake.lobby_handler

		if managers.network.matchmake.lobby_handler.id(slot3) == lobby_id then
			return 
		end
	end

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if managers.network.session(slot3).has_other_peers(slot3) then
			slot4 = managers.raid_menu

			managers.raid_menu.show_dialog_already_in_game(slot3)

			return 
		end
	end

	if managers.raid_job then
		slot4 = managers.raid_job

		if managers.raid_job.is_in_tutorial(slot3) then
			slot6 = "dialog_err_cant_join_from_game"

			managers.menu.show_ok_only_dialog(slot3, managers.menu, "dialog_warning_title")

			return 
		end
	end

	if managers.raid_job then
		slot4 = managers.raid_job

		if not managers.raid_job.played_tutorial(slot3) then
			slot6 = "dialog_err_tutorial_not_finished"

			managers.menu.show_ok_only_dialog(slot3, managers.menu, "dialog_warning_title")

			return 
		end
	end

	slot4 = game_state_machine

	if game_state_machine.current_state_name(slot3) ~= "menu_main" then
		slot4 = "INGAME INVITE"

		print(slot3)

		if managers.groupai then
			slot4 = managers.groupai

			managers.groupai.kill_all_AI(slot3)
		end

		Global.game_settings.single_player = false
		Global.boot_invite = lobby_id
		slot4 = MenuCallbackHandler

		MenuCallbackHandler._dialog_end_game_yes(false)

		return 
	else
		if not Global.user_manager.user_index or not Global.user_manager.active_user_state_change_quit then
			slot4 = "BOOT UP INVITE"

			print(slot3)

			Global.boot_invite = lobby_id

			return 
		end

		Global.game_settings.single_player = false
		slot6 = true

		managers.network.matchmake.join_server_with_check(false, managers.network.matchmake, lobby_id)
	end

	return 
end
NetworkAccountSTEAM._on_server_request = function (ip, pw)
	slot4 = "[NetworkAccountSTEAM._on_server_request]"

	print(slot3)

	return 
end
NetworkAccountSTEAM._on_connect_fail = function (ip, pw)
	slot4 = "[NetworkAccountSTEAM._on_connect_fail]"

	print(slot3)

	return 
end
NetworkAccountSTEAM.signin_state = function (self)
	slot3 = self

	if self.local_signin_state(slot2) == true then
		return "signed in"
	end

	return "not signed in"
end
NetworkAccountSTEAM.local_signin_state = function (self)
	slot3 = Steam

	return Steam.logged_on(slot2)
end
NetworkAccountSTEAM.username_id = function (self)
	slot3 = Steam

	return Steam.username(slot2)
end
NetworkAccountSTEAM.username_by_id = function (self, id)
	slot5 = id

	return Steam.username(slot3, Steam)
end
NetworkAccountSTEAM.player_id = function (self)
	slot3 = Steam

	return Steam.userid(slot2)
end
NetworkAccountSTEAM.is_connected = function (self)
	return true
end
NetworkAccountSTEAM.lan_connection = function (self)
	return true
end
NetworkAccountSTEAM.set_playing = function (self, state)
	slot5 = state

	Steam.set_playing(slot3, Steam)

	return 
end
NetworkAccountSTEAM._load_globals = function (self)
	if Global.steam and Global.steam.account then
		if Global.steam.account.outfit_signature then
			slot3 = Global.steam.account.outfit_signature
			slot1 = Global.steam.account.outfit_signature.get_data(slot2)
		end

		self._outfit_signature = slot1

		if Global.steam.account.outfit_signature then
			slot3 = Global.steam.account.outfit_signature

			Global.steam.account.outfit_signature.destroy(slot2)
		end

		Global.steam.account = nil
	end

	return 
end
NetworkAccountSTEAM._save_globals = function (self)
	Global.steam = Global.steam or {}
	Global.steam.account = {}
	slot1 = Global.steam.account

	if self._outfit_signature then
		slot5 = self._outfit_signature
		slot2 = Application.create_luabuffer(slot3, Application)
	end

	slot1.outfit_signature = slot2

	return 
end
NetworkAccountSTEAM.is_ready_to_close = function (self)
	return not self._inventory_is_loading and not self._inventory_outfit_refresh_requested and not self._inventory_outfit_refresh_in_progress
end
NetworkAccountSTEAM.inventory_load = function (self, callback_ref)
	if self._inventory_is_loading then
		return 
	end

	slot4 = managers.raid_menu

	if managers.raid_menu.is_offline_mode(slot3) then
		slot6 = {}

		self._clbk_inventory_load(slot3, self, nil)

		return 
	end

	if callback_ref then
		slot5 = callback_ref

		Steam.inventory_load(slot3, Steam)
	else
		slot4 = Steam
		slot9 = "_clbk_inventory_load"

		Steam.inventory_load(slot3, callback(slot6, self, self))
	end

	return 
end
NetworkAccountSTEAM._clbk_inventory_load = function (self, error, list)
	self._inventory_is_loading = nil

	if error then
		slot9 = error
		slot6 = "[NetworkAccountSTEAM:_clbk_inventory_load] Failed to update tradable inventory (" .. tostring(slot8) .. ")"

		Application.error(slot4, Application)
	end

	slot6 = list
	local filtered_list = self._verify_filter_cards(slot4, self)
	slot8 = {
		error = error,
		list = filtered_list
	}

	managers.system_event_listener.call_listeners(self, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_LOADED)

	return 
end
NetworkAccountSTEAM._verify_filter_cards = function (self, card_list)
	local filtered_list = {}
	local result = {}

	if card_list then
		slot6 = card_list

		for _, card_steam_data in pairs(slot5) do
			if card_steam_data.category == "challenge_card" then
				slot12 = card_steam_data.entry
				local challenge_card_data = managers.challenge_cards.get_challenge_card_data(slot10, managers.challenge_cards)

				if challenge_card_data then
					if not filtered_list[challenge_card_data.key_name] then
						filtered_list[challenge_card_data.key_name] = challenge_card_data
						filtered_list[challenge_card_data.key_name].steam_instance_ids = {}
					end

					slot13 = card_steam_data.instance_id

					table.insert(slot11, filtered_list[challenge_card_data.key_name].steam_instance_ids)
				end
			end
		end
	end

	if filtered_list then
		slot6 = filtered_list

		for card_key_name, card_data in pairs(slot5) do
			slot12 = card_data

			table.insert(slot10, result)
		end
	end

	return result
end
NetworkAccountSTEAM.inventory_is_loading = function (self)
	return self._inventory_is_loading
end
NetworkAccountSTEAM.inventory_reward = function (self, item_def_id, callback_ref)
	item_def_id = item_def_id or 1

	if callback_ref then
		slot7 = item_def_id

		Steam.inventory_reward(slot4, Steam, callback_ref)
	else
		slot10 = "_clbk_inventory_reward"
		slot7 = item_def_id

		Steam.inventory_reward(slot4, Steam, callback(slot7, self, self))
	end

	return true
end
NetworkAccountSTEAM._clbk_inventory_reward = function (self, error, tradable_list)
	slot6 = "[NetworkAccountSTEAM:_clbk_inventory_reward]"

	Application.trace(slot4, Application)

	slot6 = "error "
	slot9 = error

	Application.trace(slot4, Application, inspect(slot8))

	slot6 = "tradable_list "
	slot9 = tradable_list

	Application.trace(slot4, Application, inspect(slot8))

	return 
end
NetworkAccountSTEAM.inventory_remove = function (self, instance_id)
	slot6 = instance_id

	Application.trace(slot3, Application, "[ChallengeCardsManager:inventory_remove] instance_id ")

	slot5 = instance_id
	local return_status = Steam.inventory_remove(slot3, Steam)

	return 
end
NetworkAccount.inventory_reward_open = function (self, safe, safe_instance_id, reward_unlock_callback)
	return 
end
NetworkAccountSTEAM.inventory_reward_dlc = function (self, def_id, reward_promo_callback)
	return 
end
NetworkAccountSTEAM.inventory_outfit_refresh = function (self)
	self._inventory_outfit_refresh_requested = true

	return 
end
NetworkAccountSTEAM._inventory_outfit_refresh = function (self)
	local outfit = managers.blackmarket.tradable_outfit(slot2)
	slot5 = "outfit: "
	slot8 = outfit

	print(managers.blackmarket, "[NetworkAccountSTEAM:_inventory_outfit_refresh]", inspect(slot7))

	slot4 = outfit

	if 0 < table.size(managers.blackmarket) then
		self._outfit_signature = nil
		self._inventory_outfit_refresh_in_progress = true
		slot5 = outfit
		slot10 = "_clbk_tradable_outfit_data"

		Steam.inventory_signature_create(slot3, Steam, callback(slot7, self, self))
	else
		self._outfit_signature = ""
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		managers.network.session(slot3).check_send_outfit(slot3)
	end

	return 
end
NetworkAccountSTEAM._chk_inventory_outfit_refresh = function (self)
	if not self._inventory_outfit_refresh_requested then
		return 
	end

	if self._inventory_outfit_refresh_in_progress then
		return 
	end

	self._inventory_outfit_refresh_requested = nil
	slot3 = self

	self._inventory_outfit_refresh(slot2)

	return 
end
NetworkAccountSTEAM.inventory_outfit_verify = function (self, steam_id, outfit_data, outfit_callback)
	if outfit_data == "" then
		if outfit_callback then
			slot8 = {}
			slot4 = outfit_callback(slot5, nil, false)
		end

		return slot4
	end

	slot9 = outfit_callback

	Steam.inventory_signature_verify(slot5, Steam, steam_id, outfit_data)

	return 
end
NetworkAccountSTEAM.inventory_outfit_signature = function (self)
	return self._outfit_signature
end
NetworkAccountSTEAM.inventory_repair_list = function (self, list)
	return 
end
NetworkAccountSTEAM._clbk_tradable_outfit_data = function (self, error, outfit_signature)
	slot11 = "\n"

	print(slot4, "[NetworkAccountSTEAM:_clbk_tradable_outfit_data] error: ", error, ", self._outfit_signature: ", self._outfit_signature, "\n outfit_signature: ", outfit_signature)

	self._inventory_outfit_refresh_in_progress = nil

	if self._inventory_outfit_refresh_requested then
		return 
	end

	if error then
		slot9 = error
		slot6 = "[NetworkAccountSTEAM:_clbk_tradable_outfit_data] Failed to check tradable inventory (" .. tostring(slot8) .. ")"

		Application.error(slot4, Application)
	end

	self._outfit_signature = outfit_signature
	slot5 = managers.network

	if managers.network.session(slot4) then
		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		managers.network.session(slot4).check_send_outfit(slot4)
	end

	return 
end
NetworkAccountSTEAM.output_global_stats = function (file)
	local num_days = 100
	local sa = Steam.sa_handler(slot3)
	slot7 = num_days
	local invalid = sa.get_global_stat(Steam, sa, "easy_slaughter_house_plays")
	invalid[1] = 1
	invalid[3] = 1
	invalid[11] = 1
	invalid[12] = 1
	invalid[19] = 1
	invalid[28] = 1
	invalid[51] = 1
	invalid[57] = 1

	local function get_lvl_stat(diff, heist, stat, i)
		if i == 0 then
			local st = NetworkAccountSTEAM.lb_levels[heist] .. ", " .. NetworkAccountSTEAM.lb_diffs[diff] .. " - "
			slot7 = stat

			if type(NetworkAccountSTEAM.lb_diffs[diff]) == "string" then
				return st .. stat
			else
				return st .. stat[1] .. "/" .. stat[2]
			end
		end

		local num = nil
		slot7 = stat

		if type(slot6) == "string" then
			slot9 = num_days
			num = sa.get_global_stat(slot6, sa, diff .. "_" .. heist .. "_" .. stat)[i] or 0
		else
			slot9 = num_days
			local f = sa.get_global_stat(slot6, sa, diff .. "_" .. heist .. "_" .. stat[1])[i] or 0
			slot10 = num_days
			local s = sa.get_global_stat(slot7, sa, diff .. "_" .. heist .. "_" .. stat[2])[i] or 1
			num = f / ((s == 0 and 1) or s)
		end

		return num
	end

	local function get_weapon_stat(weapon, stat, i)
		if i == 0 then
			local st = weapon .. " - "
			slot6 = stat

			if type(slot5) == "string" then
				return st .. stat
			else
				return st .. stat[1] .. "/" .. stat[2]
			end
		end

		local num = nil
		slot6 = stat

		if type(slot5) == "string" then
			slot8 = num_days
			num = sa.get_global_stat(slot5, sa, weapon .. "_" .. stat)[i] or 0
		else
			slot8 = num_days
			local f = sa.get_global_stat(slot5, sa, weapon .. "_" .. stat[1])[i] or 0
			slot9 = num_days
			local s = sa.get_global_stat(slot6, sa, weapon .. "_" .. stat[2])[i] or 1
			num = f / ((s == 0 and 1) or s)
		end

		return num
	end

	local diffs = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	local heists = {
		"bank",
		"heat_street",
		"bridge",
		"apartment",
		"slaughter_house",
		"diamond_heist"
	}
	local weapons = {
		"beretta92",
		"c45",
		"raging_bull",
		"r870_shotgun",
		"mossberg",
		"m4",
		"mp5",
		"mac11",
		"m14",
		"hk21"
	}
	local lvl_stats = {
		"plays",
		{
			"wins",
			"plays"
		},
		{
			"kills",
			"plays"
		}
	}
	local wep_stats = {
		"kills",
		{
			"kills",
			"shots"
		},
		{
			"headshots",
			"shots"
		}
	}
	local lines = {}

	for i = 0, #invalid, 1 do
		if i == 0 or invalid[i] == 0 then
			local out = "" .. i
			slot19 = lvl_stats

			for _, lvl_stat in ipairs(slot18) do
				slot24 = diffs

				for _, diff in ipairs(slot23) do
					slot29 = heists

					for _, heist in ipairs(slot28) do
						slot39 = i
						out = out .. ";" .. get_lvl_stat(slot35, diff, heist, lvl_stat)
					end
				end
			end

			slot19 = wep_stats

			for _, wep_stat in ipairs(slot18) do
				slot24 = weapons

				for _, weapon in ipairs(slot23) do
					slot33 = i
					out = out .. ";" .. get_weapon_stat(slot30, weapon, wep_stat)
				end
			end

			slot20 = out

			table.insert(slot18, lines)
		end
	end

	slot16 = "w"
	local file_handle = SystemFS.open(slot13, SystemFS, file)

	for i = 1, #lines, 1 do
		slot20 = lines[(i == 1 and 1) or #lines - i + 2]

		file_handle.puts(slot18, file_handle)
	end

	return 
end

return 
