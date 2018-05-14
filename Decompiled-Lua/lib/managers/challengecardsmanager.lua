slot2 = "lib/managers/BuffEffectManager"

require(slot1)

ChallengeCardsManager = ChallengeCardsManager or class()
ChallengeCardsManager.EVENT_NAME_SUGGEST_CARD = "received_suggest_card"
ChallengeCardsManager.EVENT_NAME_ACTIVATE_CARD = "received_activate_card"
ChallengeCardsManager.EVENT_NAME_DEACTIVATE_CARD = "received_deactivate_card"
ChallengeCardsManager.EVENT_NAME_REMOVE_CARD = "received_remove_card"
ChallengeCardsManager.EVENT_NAME_DROP_IN = "player_droped_in"
ChallengeCardsManager.EVENT_NAME_DROP_OUT = "player_droped_out"
ChallengeCardsManager.MAX_INVENTORY_COUNT = 1
ChallengeCardsManager.CARD_STATUS_NORMAL = "normal"
ChallengeCardsManager.CARD_STATUS_ACTIVE = "active"
ChallengeCardsManager.CARD_STATUS_FAILED = "failed"
ChallengeCardsManager.CARD_STATUS_SUCCESS = "success"
ChallengeCardsManager.CARD_PASS_KEY_NAME = "empty"
ChallengeCardsManager.CARD_PASS_TEXTURE = "ui/main_menu/textures/cards_atlas"
ChallengeCardsManager.READYUP_INVENTORY_LOAD_FREQUENCY = 10
function ChallengeCardsManager:init()
	if not Global.challenge_cards_manager then
		Global.challenge_cards_manager = {
			owned_challenge_cards = {}
		}
	end

	self._active_card = nil
	self._suggested_cards = {}
	self._delay_start = false
	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_IN
	}
	slot10 = "player_droped_in"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "challenge_cards_manager_drop_in", callback(slot7, self, self))

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_OUT
	}
	slot10 = "player_droped_out"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "challenge_cards_manager_drop_out", callback(slot7, self, self))

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_LOADED
	}
	slot10 = "_steam_challenge_cards_inventory_loaded"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "challenge_cards_manager_inventory_loaded", callback(slot7, self, self))

	self._readyup_card_cache = {}
	self._readyup_inventory_load_frequency_counter = 0

	return 
end
function ChallengeCardsManager:update(t, dt)
	if self._delay_start == true then
		slot5 = self

		self.system_pre_start_raid(slot4)
	end

	if self._automatic_steam_inventory_refresh then
		if ChallengeCardsManager.READYUP_INVENTORY_LOAD_FREQUENCY < self._readyup_inventory_load_frequency_counter then
			slot5 = managers.network.account

			managers.network.account.inventory_load(slot4)

			self._readyup_inventory_load_frequency_counter = 0
		end

		self._readyup_inventory_load_frequency_counter = self._readyup_inventory_load_frequency_counter + dt
	end

	return 
end
function ChallengeCardsManager:set_automatic_steam_inventory_refresh(flag)
	self._automatic_steam_inventory_refresh = flag

	return 
end
function ChallengeCardsManager:get_readyup_card_cache()
	return self._readyup_card_cache
end
function ChallengeCardsManager:set_readyup_card_cache(card_list)
	self._readyup_card_cache = card_list

	return 
end
function ChallengeCardsManager:_process_fresh_steam_inventory(params)
	if params.list then
		slot5 = self

		if #params.list ~= #self.get_readyup_card_cache(slot4) then
			slot5 = "[ChallengeCardsManager:_process_fresh_steam_inventory] new list has different number of elements "

			Application.trace(slot3, Application)

			slot5 = params.list

			self.set_readyup_card_cache(slot3, self)

			slot6 = params

			managers.system_event_listener.call_listeners(slot3, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_PROCESSED)

			return 
		end

		local cached_list = self.get_readyup_card_cache(slot3)

		function slot6(a, b)
			return a.key_name < b.key_name
		end

		table.sort(self, cached_list)

		function slot6(a, b)
			return a.key_name < b.key_name
		end

		table.sort(self, params.list)

		slot5 = cached_list

		for card_index, card_data in ipairs(self) do
			local cached_card_data = cached_list[card_index]
			local steam_card_data = params.list[card_index]

			if cached_card_data.key_name ~= steam_card_data.key_name then
				slot14 = card_index

				Application.trace(slot11, Application, "[ChallengeCardsManager:_process_fresh_steam_inventory] missmatch in cached and fresh list index ")

				slot13 = params.list

				self.set_readyup_card_cache(slot11, self)

				slot14 = params

				managers.system_event_listener.call_listeners(slot11, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_PROCESSED)

				return 
			end

			if cached_card_data.key_name == steam_card_data.key_name and #cached_card_data.steam_instance_ids ~= #steam_card_data.steam_instance_ids then
				slot14 = card_index

				Application.trace(slot11, Application, "[ChallengeCardsManager:_process_fresh_steam_inventory] missmatch in cached and fresh list index ")

				slot13 = params.list

				self.set_readyup_card_cache(slot11, self)

				slot14 = params

				managers.system_event_listener.call_listeners(slot11, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_PROCESSED)

				return 
			end
		end
	end

	return 
end
function ChallengeCardsManager:get_cards_count_per_type(card_list)
	local raid_count = 0
	local operation_count = 0

	if card_list then
		slot6 = card_list

		for _, card_data in pairs(slot5) do
			if card_data.card_type == ChallengeCardsTweakData.CARD_TYPE_RAID then
				raid_count = raid_count + 1
			elseif card_data.card_type == ChallengeCardsTweakData.CARD_TYPE_OPERATION then
				operation_count = operation_count + 1
			end
		end
	end

	return raid_count, operation_count
end
function ChallengeCardsManager:set_temp_steam_loot(loot_list)
	self._temp_steam_loot = loot_list

	return 
end
function ChallengeCardsManager:get_temp_steam_loot()
	return self._temp_steam_loot
end
function ChallengeCardsManager:get_card_description(card_key_name)
	local positive_description = ""
	local negative_description = ""
	slot7 = card_key_name
	local card_data = self.get_challenge_card_data(slot5, self)

	if card_data then
		if card_data.positive_description then
			if card_data.positive_description.desc_params then
				slot9 = card_data.positive_description.desc_params
				positive_description = managers.localization.text(slot6, managers.localization, card_data.positive_description.desc_id)
			else
				slot8 = card_data.positive_description.desc_id
				positive_description = managers.localization.text(slot6, managers.localization)
			end
		end

		if card_data.negative_description then
			if card_data.negative_description.desc_params then
				slot9 = card_data.negative_description.desc_params
				negative_description = managers.localization.text(slot6, managers.localization, card_data.negative_description.desc_id)
			else
				slot8 = card_data.negative_description.desc_id
				negative_description = managers.localization.text(slot6, managers.localization)
			end
		end
	end

	return positive_description, negative_description
end
function ChallengeCardsManager:_steam_challenge_cards_inventory_loaded(params)
	slot5 = params

	self._process_fresh_steam_inventory(slot3, self)

	return 
end
function ChallengeCardsManager:system_pre_start_raid(params)
	local _peer_still_connecting = false

	Application.trace(slot4, Application)

	slot7 = managers.network
	slot5 = managers.network.session("Starting raid")._peers

	for _, p in pairs(slot4) do
		if p._peer_connecting == true and not p._synced then
			_peer_still_connecting = true

			break
		end
	end

	if _peer_still_connecting == false then
		slot5 = managers.raid_menu

		managers.raid_menu.close_all_menus(slot4)

		slot6 = "ready_up_menu"

		managers.raid_menu.open_menu(slot4, managers.raid_menu)

		self._delay_start = false
	else
		self._delay_start = true
	end

	return 
end
function ChallengeCardsManager:player_droped_in(params)
	return 
end
function ChallengeCardsManager:player_droped_out(params)
	if self._suggested_cards and self._suggested_cards[params._id] then
		self._suggested_cards[params._id] = nil
	end

	if self._active_card and self._active_card.peer_id == params._id and self._active_card.spent then
		slot4 = self

		self.remove_active_challenge_card(slot3)
	end

	slot5 = CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED

	managers.system_event_listener.call_listeners(slot3, managers.system_event_listener)

	return 
end
function ChallengeCardsManager:get_all_challenge_cards_indexed()
	slot3 = tweak_data.challenge_cards

	return tweak_data.challenge_cards.get_all_cards_indexed(slot2)
end
function ChallengeCardsManager:get_challenge_card_data(challenge_card_key)
	slot5 = challenge_card_key

	return tweak_data.challenge_cards.get_card_by_key_name(slot3, tweak_data.challenge_cards)
end
function ChallengeCardsManager:get_active_card()
	return self._active_card
end
function ChallengeCardsManager:set_active_card(card)
	self._active_card = card

	if self._active_card and self._active_card.status == ChallengeCardsManager.CARD_STATUS_ACTIVE then
		slot4 = self._active_card.effects

		for _, effect in pairs(slot3) do
			effect.challenge_card_key = self._active_card.key_name
			slot10 = effect
			local effect_id = managers.buff_effect.activate_effect(slot8, managers.buff_effect)
			effect.effect_id = effect_id
		end
	end

	slot4 = Network

	if Network.is_server(slot3) then
		local card_key = card.key_name
		local locked = card.locked_suggestion or true
		local card_status = card.status or ChallengeCardsManager.CARD_STATUS_ACTIVE
		slot7 = managers.network
		slot11 = card_status

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_active_challenge_card", card_key, locked)
	end

	return 
end
function ChallengeCardsManager:sync_active_challenge_card(card_key, locked, card_status)
	slot9 = card_key
	local card = deep_clone(tweak_data.challenge_cards.get_card_by_key_name(slot7, tweak_data.challenge_cards))
	card.locked_suggestion = locked
	card.status = card_status
	slot8 = card

	self.set_active_card(tweak_data.challenge_cards.get_card_by_key_name, self)

	return 
end
function ChallengeCardsManager:get_suggested_cards()
	if not self._suggested_cards then
		self._suggested_cards = {}
	end

	return self._suggested_cards
end
function ChallengeCardsManager:did_everyone_locked_sugested_card()
	local result = true
	slot4 = self
	local suggested_cards = self.get_suggested_cards(slot3)

	if suggested_cards then
		slot7 = managers.network
		slot7 = managers.network.session(slot6)

		for peer_id, _ in pairs(managers.network.session(slot6).all_peers(slot6)) do
			local card_data = suggested_cards[peer_id]

			if not card_data then
				result = false
			elseif card_data and not card_data.locked_suggestion then
				result = false
			end
		end
	else
		result = false
	end

	return result
end
function ChallengeCardsManager:get_active_card_status()
	if not self._active_card then
		return nil
	end

	return self._active_card.status
end
function ChallengeCardsManager:mark_active_card_as_spent()
	if self._active_card then
		self._active_card.spent = true
	end

	return 
end
function ChallengeCardsManager:select_challenge_card(peer_id)
	if not peer_id then
		self._active_card = nil
	else
		slot4 = self
		self._active_card = self.get_suggested_cards(slot3)[peer_id]

		if self._active_card then
			self._active_card.status = ChallengeCardsManager.CARD_STATUS_NORMAL
		end
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot6 = peer_id

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "select_challenge_card")
	end

	return 
end
function ChallengeCardsManager:activate_challenge_card()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self

		self._activate_challenge_card(slot2)

		slot3 = self

		self.sync_activate_challenge_card(slot2)
	end

	return 
end
function ChallengeCardsManager:sync_activate_challenge_card()
	slot3 = managers.network
	slot4 = "sync_activate_challenge_card"

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))

	return 
end
function ChallengeCardsManager:_activate_challenge_card()
	managers.challenge_cards._suggested_cards = nil
	managers.challenge_cards._temp_steam_loot = nil

	if not self._active_card or (self._active_card and self._active_card.status ~= ChallengeCardsManager.CARD_STATUS_NORMAL) then
		return 
	end

	if self._active_card.key_name == ChallengeCardsManager.CARD_PASS_KEY_NAME then
		return 
	end

	self._active_card.status = ChallengeCardsManager.CARD_STATUS_ACTIVE
	slot3 = self._active_card.effects

	for _, effect in pairs(ChallengeCardsManager.CARD_STATUS_ACTIVE) do
		effect.challenge_card_key = self._active_card.key_name
		slot9 = effect
		local effect_id = managers.buff_effect.activate_effect(slot7, managers.buff_effect)
		effect.effect_id = effect_id
	end

	slot4 = managers.network
	slot4 = managers.network.session(slot3)

	if self._active_card.peer_id == managers.network.session(slot3).local_peer(slot3)._id then
		slot4 = self._active_card.steam_instance_id

		self.consume_steam_challenge_card(slot2, self)
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network.matchmake

		managers.network.matchmake.set_challenge_card_info(slot2)
	end

	return 
end
function ChallengeCardsManager:consume_steam_challenge_card(steam_instance_id)
	if not steam_instance_id or steam_instance_id == 0 then
		return 
	end

	slot5 = steam_instance_id
	local consume_status = managers.network.account.inventory_remove(slot3, managers.network.account)

	return 
end
function ChallengeCardsManager:set_successfull_raid_end()
	if not self._active_card then
		return 
	end

	self._active_card.status = ChallengeCardsManager.CARD_STATUS_SUCCESS

	if self._active_card.effects then
		slot3 = self._active_card.effects

		for _, effect in pairs(slot2) do
			slot9 = effect.effect_id

			managers.buff_effect.deactivate_special_effect_and_timer(slot7, managers.buff_effect)
		end
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot4 = "set_successfull_raid_end"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
function ChallengeCardsManager:deactivate_active_challenge_card()
	if self._active_card then
		if self._active_card.effects then
			slot3 = self._active_card.effects

			for _, effect in pairs(slot2) do
				slot9 = effect.effect_id

				managers.buff_effect.deactivate_effect(slot7, managers.buff_effect)
			end
		end

		self._active_card.status = ChallengeCardsManager.CARD_STATUS_FAILED
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot4 = "deactivate_active_challenge_card"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
function ChallengeCardsManager:remove_active_challenge_card()
	if not self._active_card then
		return 
	end

	slot3 = self

	self.deactivate_active_effects(slot2)

	self._active_card = nil

	return 
end
function ChallengeCardsManager:deactivate_active_effects()
	if self._active_card and self._active_card.effects then
		slot3 = self._active_card.effects

		for _, effect in pairs(slot2) do
			slot9 = effect.effect_id

			managers.buff_effect.deactivate_effect(slot7, managers.buff_effect)
		end
	end

	return 
end
function ChallengeCardsManager:suggest_challenge_card(challenge_card_key, steam_instance_id)
	slot5 = managers.network
	local local_peer = managers.network.session(slot4).local_peer(slot4)
	slot7 = challenge_card_key
	local card = tweak_data.challenge_cards.get_card_by_key_name(managers.network.session(slot4), tweak_data.challenge_cards)
	card.steam_instance_id = steam_instance_id
	self._suggested_cards[local_peer._id] = card
	slot7 = managers.network
	slot11 = steam_instance_id

	managers.network.session(local_peer._id).send_to_peers_synched(local_peer._id, managers.network.session(local_peer._id), "send_suggested_card_to_peers", challenge_card_key, local_peer._id)

	slot9 = nil

	managers.system_event_listener.call_listeners(local_peer._id, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:sync_suggested_card_from_peer(challenge_card_key, peer_id, steam_instance_id)
	slot7 = challenge_card_key
	local card = tweak_data.challenge_cards.get_card_by_key_name(slot5, tweak_data.challenge_cards)
	card.steam_instance_id = steam_instance_id
	self._suggested_cards[peer_id] = card
	slot9 = nil

	managers.system_event_listener.call_listeners(tweak_data.challenge_cards, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:remove_suggested_challenge_card()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	local remove_suggested_card = self._suggested_cards[local_peer._id]

	if not remove_suggested_card then
		return 
	end

	slot5 = self
	local active_card = self.get_active_card(slot4)

	if active_card and remove_suggested_card.key_name == active_card.key_name then
		slot6 = self

		self.remove_active_challenge_card(slot5)
	end

	self._suggested_cards[local_peer._id] = nil
	slot6 = managers.network
	slot8 = local_peer._id

	managers.network.session(local_peer._id).send_to_peers_synched(local_peer._id, managers.network.session(local_peer._id), "send_remove_suggested_card_to_peers")

	slot8 = nil

	managers.system_event_listener.call_listeners(local_peer._id, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:sync_remove_suggested_card_from_peer(peer_id)
	local remove_suggested_card = self._suggested_cards[peer_id]
	slot5 = self
	local active_card = self.get_active_card(slot4)

	if active_card and remove_suggested_card.key_name == active_card.key_name then
		slot6 = self

		self.remove_active_challenge_card(slot5)
	end

	self._suggested_cards[peer_id] = nil
	slot8 = nil

	managers.system_event_listener.call_listeners(nil, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:clear_suggested_cards()
	self._suggested_cards = {}
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot4 = "clear_suggested_cards"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
function ChallengeCardsManager:toggle_lock_suggested_challenge_card()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	local suggested_card = self._suggested_cards[local_peer._id]

	if not suggested_card then
		return 
	end

	suggested_card.locked_suggestion = not suggested_card.locked_suggestion
	slot5 = managers.network
	slot7 = local_peer._id

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "send_toggle_lock_suggested_card_to_peers")

	slot7 = nil

	managers.system_event_listener.call_listeners(slot4, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:sync_toggle_lock_suggested_challenge_card(peer_id)
	local suggested_card = self._suggested_cards[peer_id]
	suggested_card.locked_suggestion = not suggested_card.locked_suggestion
	slot7 = nil

	managers.system_event_listener.call_listeners(slot4, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED)

	return 
end
function ChallengeCardsManager:on_restart_to_camp()
	slot3 = self

	self._on_restart_to_camp(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot4 = "sync_challenge_cards_on_restart_to_camp"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
function ChallengeCardsManager:sync_challenge_cards_on_restart_to_camp()
	slot3 = self

	self._on_restart_to_camp(slot2)

	return 
end
function ChallengeCardsManager:_on_restart_to_camp()
	slot3 = self

	self.remove_active_challenge_card(slot2)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network.matchmake

		managers.network.matchmake.set_challenge_card_info(slot2)
	end

	return 
end
function ChallengeCardsManager:card_failed_warning(challenge_card_key, effect_id, peer_id)
	local notification_data = {
		priority = 1,
		duration = 10,
		id = challenge_card_key,
		notification_type = HUDNotification.CARD_FAIL,
		card = challenge_card_key,
		reaction = {
			callback = managers.hud.show_stats_screen,
			callback_self = managers.hud
		}
	}
	slot8 = notification_data

	managers.notification.add_notification(managers.hud, managers.notification)

	slot7 = Network

	if Network.is_server(managers.hud) then
		slot7 = managers.network
		slot11 = peer_id

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "card_failed_warning", challenge_card_key, effect_id)
	end

	return 
end
function ChallengeCardsManager:save_dropin(data)
	local state = {
		active_card = self._active_card,
		suggested_cards = self._suggested_cards
	}
	data.ChallengeCardsManager = state

	return 
end
function ChallengeCardsManager:load_dropin(data)
	local state = data.ChallengeCardsManager

	if state then
		self._active_card = state.active_card
		self._suggested_cards = state.suggested_cards
	end

	return 
end
function ChallengeCardsManager:get_victory_xp_amount()
	local result = 0

	if self._active_card and self._active_card.status == ChallengeCardsManager.CARD_STATUS_SUCCESS then
		local card = tweak_data.challenge_cards.cards[self._active_card[ChallengeCardsTweakData.KEY_NAME_FIELD]]
		result = card.bonus_xp or 0
	end

	return result
end
function ChallengeCardsManager:get_victory_xp_multiplier()
	local result = 1

	if self._active_card and self._active_card.status == ChallengeCardsManager.CARD_STATUS_SUCCESS then
		result = self._active_card.bonus_xp_multiplier or 1
	end

	return result
end
function ChallengeCardsManager:get_card_xp_amount(card_key_name)
	local result = 0
	slot6 = card_key_name
	local card_data = tweak_data.challenge_cards.get_card_by_key_name(slot4, tweak_data.challenge_cards)

	if card_data then
		result = card_data.bonus_xp or 0
	end

	return result
end
function ChallengeCardsManager:get_card_xp_multiplier(card_key_name)
	local result = 0
	slot6 = card_key_name
	local card_data = tweak_data.challenge_cards.get_card_by_key_name(slot4, tweak_data.challenge_cards)

	if card_data then
		result = card_data.bonus_xp_multiplier or 0
	end

	return result
end
function ChallengeCardsManager:get_card_xp_label(card_key_name, hide_xp_suffix)
	local result = ""
	slot7 = card_key_name
	local card_data = tweak_data.challenge_cards.get_card_by_key_name(slot5, tweak_data.challenge_cards)

	if not card_data then
		return result
	end

	if card_data.bonus_xp and 0 < card_data.bonus_xp then
		result = "+" .. card_data.bonus_xp
	elseif card_data.bonus_xp_multiplier and 0 < card_data.bonus_xp_multiplier then
		slot9 = card_data.bonus_xp_multiplier
		result = "x" .. string.format(slot7, "%.2f")
	end

	if not hide_xp_suffix and not result == "" then
		result = result .. "xp"
	end

	return result
end
function ChallengeCardsManager:get_loot_drop_group(card_name)
	if not card_name then
		return 
	end

	slot6 = card_name

	Application.debug(slot3, Application, "[ChallengeCardsManager:get_loot_drop_group]")

	slot5 = card_name
	local card_data = tweak_data.challenge_cards.get_card_by_key_name(slot3, tweak_data.challenge_cards)

	return card_data.loot_drop_group
end
function ChallengeCardsManager:get_cards_stacking_texture(card_data)
	if card_data and card_data.steam_instance_ids and 1 < #card_data.steam_instance_ids and not card_data.card_back then
		if card_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_BOOSTER and #card_data.steam_instance_ids == 2 then
			return tweak_data.challenge_cards.challenge_card_stackable_booster_2_texture_path, tweak_data.challenge_cards.challenge_card_stackable_booster_2_texture_rect
		elseif card_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_BOOSTER and 2 < #card_data.steam_instance_ids then
			return tweak_data.challenge_cards.challenge_card_stackable_booster_3_texture_path, tweak_data.challenge_cards.challenge_card_stackable_booster_3_texture_rect
		elseif card_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_CHALLENGE_CARD and #card_data.steam_instance_ids == 2 then
			return tweak_data.challenge_cards.challenge_card_stackable_2_texture_path, tweak_data.challenge_cards.challenge_card_stackable_2_texture_rect
		elseif card_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_CHALLENGE_CARD and 2 < #card_data.steam_instance_ids then
			return tweak_data.challenge_cards.challenge_card_stackable_3_texture_path, tweak_data.challenge_cards.challenge_card_stackable_3_texture_rect
		end
	end

	return nil, nil
end
function ChallengeCardsManager:get_cards_back_texture(card_data)
	if card_data then
		if card_data.card_back then
			return tweak_data.challenge_cards[card_data.card_back].texture, tweak_data.challenge_cards[card_data.card_back].texture_rect
		elseif card_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_BOOSTER then
			return tweak_data.challenge_cards.card_back_boosters.texture, tweak_data.challenge_cards.card_back_boosters.texture_rect
		else
			return tweak_data.challenge_cards.card_back_challenge_cards.texture, tweak_data.challenge_cards.card_back_challenge_cards.texture_rect
		end
	end

	return nil, nil
end
function ChallengeCardsManager:debug_inventory_insert(item_def_id)
	return 
end
function ChallengeCardsManager:debug_inventory_insert_all()
	return 
end
function ChallengeCardsManager:debug_clear_inventory()
	return 
end
function ChallengeCardsManager:debug_clear_inventory_callback(error, list)
	return 
end
function ChallengeCardsManager:inventory_alter_stacks(source_steam_instance_id, destination_steam_instance_id, amount)
	return 
end
function ChallengeCardsManager:start_inventory_fix_all_stacks()
	return 
end
function ChallengeCardsManager:inventory_fix_all_stacks(error, list)
	return 
end
function ChallengeCardsManager:inventory_reward_unlock(instance_id_1, instance_id_2, reward_item_def_id)
	return 
end
function ChallengeCardsManager:_clbk_inventory_reward_unlock(error, items_new, items_removed)
	return 
end

return 
