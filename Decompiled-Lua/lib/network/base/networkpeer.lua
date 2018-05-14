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
local ids_unit = Idstring(slot1)
slot3 = "NORMAL"
local ids_NORMAL = Idstring("unit")
NetworkPeer = NetworkPeer or class()
NetworkPeer.PRE_HANDSHAKE_CHK_TIME = 8
NetworkPeer.CHEAT_CHECKS_DISABLED = true
function NetworkPeer:init(name, rpc, id, loading, synced, in_lobby, character, user_id)
	if not name then
		slot15 = character or "russian"
		slot12 = "menu_" .. tostring(slot14)
		slot9 = managers.localization.text(slot10, managers.localization)
	end

	self._name = slot9
	self._rpc = rpc
	self._id = id
	self._user_id = user_id
	self._xuid = ""
	local is_local_peer = nil

	if self._rpc then
		slot13 = 0
		slot14 = "TCP_IP"
		slot14 = 0

		if self._rpc.ip_at_index(slot11, self._rpc) == Network.self(self._rpc, Network).ip_at_index(self._rpc, Network.self(self._rpc, Network)) then
			is_local_peer = true
		else
			slot13 = "PS4"

			if SystemInfo.platform(slot11) == Idstring(SystemInfo) then
				slot14 = self._rpc

				PSNVoice.send_to(slot11, PSNVoice, self._name)
			end
		end
	elseif self._steam_rpc then
		slot13 = 0
		slot14 = "STEAM"
		slot14 = 0

		if self._steam_rpc.ip_at_index(slot11, self._steam_rpc) == Network.self(self._steam_rpc, Network).ip_at_index(self._steam_rpc, Network.self(self._steam_rpc, Network)) then
			is_local_peer = true
		end
	end

	if is_local_peer then
	end

	slot15 = id

	print(slot11, "[NetworkPeer:init] rpc", rpc, "id")

	if self._rpc then
		slot14 = true

		Network.set_connection_persistent(slot11, Network, self._rpc)

		if not is_local_peer then
			slot14 = self._id

			Network.set_connection_id(slot11, Network, self._rpc)
		end

		slot13 = 0
		self._ip = self._rpc.ip_at_index(slot11, self._rpc)
	end

	if user_id then
		slot13 = "STEAM"

		if SystemInfo.distribution(slot11) == Idstring(SystemInfo) then
			slot15 = "STEAM"
			self._steam_rpc = Network.handshake(slot11, Network, user_id, nil)
			slot14 = true

			Network.set_connection_persistent(slot11, Network, self._steam_rpc)

			if not is_local_peer then
				slot14 = self._id

				Network.set_connection_id(slot11, Network, self._steam_rpc)
			end
		end
	end

	slot12 = self
	slot16 = "net_packet_throttling"

	self.set_throttling_enabled(slot11, managers.user.get_setting(slot14, managers.user))

	self._level = nil
	self._in_lobby = in_lobby
	self._loading = loading
	self._synced = synced
	self._waiting_for_player_ready = false
	self._ip_verified = false
	self._is_drop_in = false
	self._dlcs = {
		dlc2 = false,
		dlc3 = false,
		dlc1 = false,
		dlc4 = false
	}
	slot12 = self

	self.chk_enable_queue(slot11)

	self._character = character
	slot12 = managers.network.OVERWRITEABLE_MSGS
	self._overwriteable_msgs = deep_clone(slot11)
	self._overwriteable_queue = {}
	slot12 = self

	self._chk_flush_msg_queues(slot11)

	if in_lobby then
	end

	slot12 = TimerManager
	slot12 = TimerManager.wall_running(slot11)
	self._creation_t = TimerManager.wall_running(slot11).time(slot11)

	if self._rpc and not self._loading and managers.network.voice_chat.on_member_added then
		slot13 = 0
		slot14 = "TCP_IP"
		slot14 = 0

		if self._rpc.ip_at_index(slot11, self._rpc) ~= Network.self(self._rpc, Network).ip_at_index(self._rpc, Network.self(self._rpc, Network)) then
			slot14 = self._muted

			managers.network.voice_chat.on_member_added(slot11, managers.network.voice_chat, self)
		end
	end

	self._profile = {
		outfit_string = ""
	}
	self._handshakes = {}
	self._streaming_status = 0
	self._outfit_assets = {
		unit = {},
		texture = {}
	}
	self._outfit_version = 0
	self._synced_worlds = {}
	self._peer_connecting = true

	return 
end
function NetworkPeer:set_teammate_panel_id(id)
	self._teammate_panel_id = id

	return 
end
function NetworkPeer:teammate_panel_id()
	return self._teammate_panel_id
end
function NetworkPeer:set_active_warcry(warcry)
	self._active_warcry = warcry

	return 
end
function NetworkPeer:active_warcry()
	return self._active_warcry
end
function NetworkPeer:set_nationality(nationality)
	self._nationality = nationality

	return 
end
function NetworkPeer:set_class(class)
	if not class then
		slot5 = "[NetworkPeer:set_class] Trying to set nil player class to peer!"

		Application.error(slot3, Application)
	end

	self._class = class
	slot4 = self._unit

	if alive(slot3) then
		slot4 = self

		self._set_class_to_unit(slot3)
	end

	return 
end
function NetworkPeer:_set_class_to_unit()
	slot3 = self._unit
	slot4 = self._class

	self._unit.movement(slot2).set_player_class(slot2, self._unit.movement(slot2))

	return 
end
function NetworkPeer:nationality()
	return self._nationality
end
function NetworkPeer:class()
	return self._class
end
function NetworkPeer:set_drop_in(value)
	self._is_drop_in = value

	return 
end
function NetworkPeer:is_drop_in()
	return self._is_drop_in
end
function NetworkPeer:set_rpc(rpc)
	self._rpc = rpc

	if self._rpc then
		slot6 = true

		Network.set_connection_persistent(slot3, Network, rpc)

		slot5 = 0
		self._ip = self._rpc.ip_at_index(slot3, self._rpc)
		slot9 = "net_packet_throttling"
		slot6 = not managers.user.get_setting(slot7, managers.user)

		Network.set_throttling_disabled(slot3, Network, self._rpc)

		slot6 = self._id

		Network.set_connection_id(slot3, Network, self._rpc)

		slot4 = self

		self._chk_flush_msg_queues(slot3)

		slot5 = "PS4"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			slot6 = self._rpc

			PSNVoice.send_to(slot3, PSNVoice, self._name)
		end

		if managers.network.voice_chat.on_member_added then
			slot6 = self._muted

			managers.network.voice_chat.on_member_added(slot3, managers.network.voice_chat, self)
		end
	end

	return 
end
function NetworkPeer:create_ticket()
	slot4 = "STEAM"

	if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
		slot4 = self._user_id

		return Steam.create_ticket(slot2, Steam)
	end

	return ""
end
function NetworkPeer:begin_ticket_session(ticket)
	slot5 = "STEAM"

	if SystemInfo.distribution(slot3) == Idstring(SystemInfo) then
		self._ticket_wait_response = true
		self._begin_ticket_session_called = true
		slot6 = ticket
		slot11 = "on_verify_ticket"
		local result = Steam.begin_ticket_session(slot3, Steam, self._user_id, callback(slot8, self, self))
		self._begin_ticket_session_called = nil

		return result
	end

	return true
end
function NetworkPeer:on_verify_ticket(result, reason)
	self._ticket_wait_response = nil

	if not result then
		slot8 = self._name
		slot10 = self._id
		slot12 = reason
		slot5 = "[NetworkPeer:on_verify_ticket] Steam ID Authentication failed for peer '" .. tostring(slot7) .. "' (ID: " .. tostring(slot9) .. ") because '" .. tostring(slot11) .. "'."

		print(slot4)

		slot5 = Network

		if Network.is_server(slot4) then
			if not self._begin_ticket_session_called then
				slot5 = managers.network
				slot8 = 2

				managers.network.session(slot4).send_to_peers(slot4, managers.network.session(slot4), "kick_peer", self._id)

				slot5 = managers.network
				slot8 = 2

				managers.network.session(slot4).on_peer_kicked(slot4, managers.network.session(slot4), self, self._id)
			end
		else
			slot5 = managers.network
			slot8 = managers.network
			slot9 = managers.network
			slot9 = managers.network.session(managers.network.session(slot7))
			slot9 = managers.network.session(managers.network.session(slot7)).local_peer(managers.network.session(slot7))
			slot8 = 3

			managers.network.session(slot4).on_peer_kicked(slot4, managers.network.session(slot4), managers.network.session(slot7).local_peer(slot7), managers.network.session(managers.network.session(slot7)).local_peer(managers.network.session(slot7)).id(managers.network.session(slot7)))
		end
	else
		slot8 = self._name
		slot10 = self._id
		slot5 = "[NetworkPeer:on_verify_ticket] Steam ID Authentication succeeded for peer '" .. tostring(slot7) .. "' (ID: " .. tostring(slot9) .. ")."

		print(slot4)

		if self._profile.outfit_string ~= "" then
			slot5 = self

			self.verify_outfit(slot4)
		end

		slot5 = Network

		if not Network.is_server(slot4) then
			slot5 = self
			slot8 = managers.raid_job

			self.verify_job(slot4, managers.raid_job.current_job_id(slot7))

			slot5 = self

			self.verify_character(slot4)
		end
	end

	return 
end
function NetworkPeer:end_ticket_session()
	slot4 = "STEAM"

	if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
		self._ticket_wait_response = nil
		slot4 = self._user_id

		Steam.end_ticket_session(slot2, Steam)

		slot4 = self._user_id

		Steam.destroy_ticket(slot2, Steam)
	end

	return 
end
function NetworkPeer:change_ticket_callback()
	slot4 = "STEAM"

	if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
		slot4 = self._user_id
		slot9 = "on_verify_ticket"

		Steam.change_ticket_callback(slot2, Steam, callback(slot6, self, self))
	end

	return 
end
function NetworkPeer:verify_job(job)
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) ~= Idstring(SystemInfo) then
		return 
	end

	slot5 = job
	local job_tweak = tweak_data.operations.mission_data(slot3, tweak_data.operations)

	if not job_tweak or not job_tweak.dlc then
		return 
	end

	local dlc_data = Global.dlc_manager.all_dlc_data[job_tweak.dlc]

	if not dlc_data or not dlc_data.app_id or dlc_data.external then
		return 
	end

	slot7 = "STEAM"

	if SystemInfo.distribution(slot5) == Idstring(SystemInfo) then
		slot8 = dlc_data.app_id

		if not Steam.is_user_product_owned(slot5, Steam, self._user_id) then
			slot7 = VoteManager.REASON.invalid_job
			slot10 = Network

			self.mark_cheater(slot5, self, Network.is_server(slot9))
		end
	end

	return 
end
function NetworkPeer:verify_character()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) ~= Idstring(SystemInfo) then
		return 
	end

	slot3 = self

	if not self.is_host(slot2) then
		return 
	end

	local character_data = tweak_data.blackmarket.characters[self._character]

	if not character_data or not character_data.dlc then
		return 
	end

	local dlc_data = Global.dlc_manager.all_dlc_data[character_data.dlc]

	if not dlc_data or not dlc_data.app_id then
		return 
	end

	slot6 = "STEAM"

	if SystemInfo.distribution(slot4) == Idstring(SystemInfo) then
		slot7 = dlc_data.app_id

		if not Steam.is_user_product_owned(slot4, Steam, self._user_id) then
			slot6 = VoteManager.REASON.invalid_character
			slot9 = Network

			self.mark_cheater(slot4, self, Network.is_server(slot8))
		end
	end

	return 
end
function NetworkPeer:verify_outfit()
	slot3 = self
	local failed = self._verify_outfit_data(slot2)

	if failed then
		slot5 = (failed == 1 and VoteManager.REASON.invalid_mask) or VoteManager.REASON.invalid_weapon
		slot8 = Network

		self.mark_cheater(slot3, self, Network.is_server(slot7))
	end

	return 
end
function NetworkPeer:_verify_outfit_data()

	-- Decompilation error in this vicinity:
	slot3 = managers.network
	slot3 = self
	local outfit = self.blackmarket_outfit(slot2)
	local mask_blueprint_lookup = {
		color = "colors",
		pattern = "textures",
		material = "materials"
	}
	slot5 = outfit

	for item_type, item in pairs(slot4) do
		if item_type == "mask" then
			slot12 = item.mask_id

			if not self._verify_content(slot9, self, "masks") then
				slot13 = 1

				return self._verify_cheated_outfit(slot9, self, "masks", item.mask_id)
			end

			slot10 = item.blueprint

			for mask_type, mask_item in pairs(slot9) do
				local mask_type_lookup = mask_blueprint_lookup[mask_type]
				local skip_default = false
				local mask_tweak = tweak_data.blackmarket.masks[item.mask_id]

				if mask_tweak and mask_tweak.default_blueprint and mask_tweak.default_blueprint[mask_type_lookup] == mask_item.id then
					skip_default = true
				end

				if not skip_default then
					slot20 = mask_item.id

					if not self._verify_content(slot17, self, mask_type_lookup) then
						slot21 = 1

						return self._verify_cheated_outfit(slot17, self, mask_type_lookup, mask_item.id)
					end
				end
			end
		elseif item_type == "primary" or item_type == "secondary" then
			slot11 = "weapon"
			slot15 = item.factory_id

			if not self._verify_content(slot9, self, managers.weapon_factory.get_weapon_id_by_factory_id(slot13, managers.weapon_factory)) then
				slot13 = 2

				return self._verify_cheated_outfit(slot9, self, "weapon", item.factory_id)
			end

			local blueprint = managers.weapon_factory.get_default_blueprint_by_factory_id(slot9, managers.weapon_factory)
			local skin_blueprint = {}
			slot12 = item.blueprint

			for _, mod_item in pairs(item.factory_id) do
				slot18 = mod_item

				if not table.contains(slot16, blueprint) then
					slot18 = mod_item

					if not table.contains(slot16, skin_blueprint) then
						slot19 = mod_item

						if not self._verify_content(slot16, self, "weapon_mods") then
							slot20 = 2

							return self._verify_cheated_outfit(slot16, self, "weapon_mods", mod_item)
						end
					end
				end
			end
		elseif item_type == "melee_weapon" then
			slot12 = item

			if not self._verify_content(slot9, self, "melee_weapons") then
				slot13 = 2

				return self._verify_cheated_outfit(slot9, self, "melee_weapons", item)
			end
		end
	end

	return nil
end
function NetworkPeer:_verify_cheated_outfit(item_type, item_id, result)
	slot7 = " ************* [NetworkPeer:_verify_cheated_outfit] ******************* "

	Application.trace(slot5, Application)

	return false
end
function NetworkPeer:_verify_content(item_type, item_id)
	slot6 = "WIN32"

	if SystemInfo.platform(slot4) ~= Idstring(SystemInfo) then
		return true
	end

	local dlc_item, dlc_list, item_data = nil

	if item_type == "weapon" then
		item_data = tweak_data.weapon[item_id]
		dlc_item = item_data and item_data.global_value
	else
		local item = tweak_data.blackmarket[item_type]
		item_data = item and item[item_id]

		if item_data.unatainable then
			return false
		end

		if item_type == "masks" and item_data.name_id == "bm_msk_cheat_error" then
			return false
		end

		dlc_item = item_data and item_data.dlc
		dlc_list = item_data and item_data.dlc_list
	end

	if not item_data then
		return false
	end

	if dlc_list then
		slot8 = dlc_list

		for _, dlc in pairs(slot7) do
			local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

			if dlc_data and dlc_data.app_id and not dlc_data.external then
				slot16 = dlc_data.app_id

				if not Steam.is_user_product_owned(slot13, Steam, self._user_id) then
					return false
				end
			end
		end
	else
		local dlc_data = Global.dlc_manager.all_dlc_data[dlc_item]

		if dlc_data and dlc_data.app_id and not dlc_data.external then
			slot10 = "STEAM"

			if SystemInfo.distribution(slot8) == Idstring(SystemInfo) then
				slot11 = dlc_data.app_id

				return Steam.is_user_product_owned(slot8, Steam, self._user_id)
			end
		end
	end

	return true
end
function NetworkPeer:verify_grenade(value)
	slot4 = self
	local grenade_id = self.grenade_id(slot3)
	local max_amount = (grenade_id and tweak_data.projectiles[grenade_id] and tweak_data.projectiles[grenade_id].max_amount) or tweak_data.equipments.max_amount.grenades

	if self._grenades and max_amount < self._grenades + value then
		slot6 = "max grenade amount: " .. max_amount .. ", nr of grenades: " .. self._grenades + value

		print(slot5)

		slot6 = Network

		if Network.is_server(slot5) then
			slot8 = true

			self.mark_cheater(slot5, self, VoteManager.REASON.many_grenades)
		else
			slot6 = managers.network
			slot6 = managers.network.session(slot5)
			slot7 = VoteManager.REASON.many_grenades
			slot10 = Network

			managers.network.session(slot5).server_peer(slot5).mark_cheater(slot5, managers.network.session(slot5).server_peer(slot5), Network.is_server(slot9))
		end

		slot9 = self
		slot9 = value

		print(slot5, "[NetworkPeer:verify_grenade]: Failed to use grenade", self.id(slot8), self._grenades)

		return true
	end

	self._grenades = (self._grenades and self._grenades + value) or value

	return true
end
function NetworkPeer:verify_deployable(id)
	local max_amount = tweak_data.equipments.max_amount[id]

	if max_amount then
		if max_amount < 0 then
			return true
		elseif self._deployable and not self._deployable[id] then
			slot5 = self._deployable
		elseif self._deployable[id] and self._deployable[id] < max_amount then
			self._deployable[id] = self._deployable[id] + 1

			return true
		end
	end

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self
		slot3 = self.mark_cheater
	else

		-- Decompilation error in this vicinity:
		slot5 = managers.network
		slot5 = managers.network.session(slot4)
		slot5 = managers.network.session(slot4).server_peer(slot4)
		slot3 = managers.network.session(slot4).server_peer(slot4).mark_cheater
		slot6 = (2 < table.size(slot7) and VoteManager.REASON.wrong_equipment) or VoteManager.REASON.many_equipments
		slot9 = Network

		slot3(slot4, slot5, Network.is_server(self._deployable))
	end

	slot8 = self
	slot10 = self._deployable

	print(slot4, "[NetworkPeer:verify_deployable]: Failed to deploy equipment", self.id(id), inspect(slot9))

	return false
end
function NetworkPeer:is_cheater()
	return self._cheater
end
function NetworkPeer:mark_cheater(reason, auto_kick)

	-- Decompilation error in this vicinity:
	slot5 = Application
	self._cheater = true
	slot6 = ChatManager.GAME
	slot14 = self

	managers.chat.feed_system_message(slot4, managers.chat, managers.localization.text(slot8, managers.localization, managers.vote.kick_reason_to_string({
		name = self.name(reason)
	}, managers.vote)))

	if auto_kick and Global.game_settings.auto_kick then
		slot8 = self._begin_ticket_session_called

		managers.vote.kick_auto(slot4, managers.vote, reason, self)
	elseif managers.hud then
		slot6 = self._id

		managers.hud.mark_cheater(slot4, managers.hud)
	end

	return 
end
function NetworkPeer:set_steam_rpc(rpc)
	self._steam_rpc = rpc

	if self._steam_rpc then
		slot6 = true

		Network.set_connection_persistent(slot3, Network, self._steam_rpc)

		slot9 = "net_packet_throttling"
		slot6 = not managers.user.get_setting(slot7, managers.user)

		Network.set_throttling_disabled(slot3, Network, self._steam_rpc)

		slot6 = self._id

		Network.set_connection_id(slot3, Network, self._steam_rpc)
	end

	return 
end
function NetworkPeer:set_dlcs(dlcs)
	slot5 = " "
	local i_dlcs = string.split(slot3, dlcs)
	slot5 = i_dlcs

	for _, dlc in ipairs(dlcs) do
		self._dlcs[dlc] = true
	end

	return 
end
function NetworkPeer:has_dlc(dlc)
	return self._dlcs[dlc]
end
function NetworkPeer:load(data)
	slot5 = "[NetworkPeer:load] data:"
	slot8 = data

	Application.debug(slot3, Application, inspect(slot7))

	self._name = data.name
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot5 = data.user_id
		self._name = managers.network.account.username_by_id(slot3, managers.network.account)
	end

	self._rpc = data.rpc
	self._steam_rpc = data.steam_rpc
	self._id = data.id

	if self._rpc then
		slot5 = 0
		self._ip = self._rpc.ip_at_index(slot3, self._rpc)
	end

	slot2 = print
	slot4 = "LOAD IP"
	slot5 = self._ip
	slot6 = "self._rpc ip"

	if self._rpc then
		slot10 = 0
		slot7 = self._rpc.ip_at_index(slot8, self._rpc)
	end

	slot2(slot3, slot4, slot5, slot6)

	self._synced = data.synced
	self._character = data.character
	self._ip_verified = data.ip_verified
	self._creation_t = data.creation_t
	self._dlcs = data.dlcs
	self._handshakes = data.handshakes
	self._loaded = data.loaded
	self._loading = data.loading
	self._msg_queues = data.msg_queues
	self._user_id = data.user_id
	self._force_open_lobby = data.force_open_lobby
	self._profile = data.profile
	self._xuid = data.xuid
	self._xnaddr = data.xnaddr
	self._join_attempt_identifier = data.join_attempt_identifier
	self._muted = data.muted
	self._streaming_status = data.streaming_status
	self._ticket_wait_response = data.wait_ticket_response
	self._outfit_assets = data.outfit_assets
	self._other_peer_outfits_loaded = data.other_peer_outfits_loaded
	self._outfit_version = data.outfit_version

	if self._ticket_wait_response then
		slot4 = self

		self.change_ticket_callback(slot3)
	end

	slot4 = self

	self.chk_enable_queue(slot3)

	slot4 = self

	self._chk_flush_msg_queues(slot3)

	if self._rpc and not self._loading and managers.network.voice_chat.on_member_added then
		slot6 = self._muted

		managers.network.voice_chat.on_member_added(slot3, managers.network.voice_chat, self)
	end

	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	local local_peer = managers.network.session(slot3).local_peer(slot3)

	if self == local_peer then
		slot5 = managers.blackmarket

		if managers.blackmarket.equipped_deployable(slot4) == "armor_kit" then
			slot5 = local_peer
			slot8 = managers.blackmarket

			local_peer.set_outfit_string(slot4, managers.blackmarket.outfit_string(slot7))

			slot5 = managers.network
			slot6 = local_peer

			managers.network.session(slot4).check_send_outfit(slot4, managers.network.session(slot4))
		end
	end

	self._expected_dropin_pause_confirmations = data.expected_dropin_pause_confirmations

	return 
end
function NetworkPeer:save(data)
	slot5 = self._id

	print(slot3, "[NetworkPeer:save] ID:")

	data.name = self._name
	data.rpc = self._rpc
	data.steam_rpc = self._steam_rpc
	data.id = self._id
	slot2 = print
	slot4 = "SAVE IP"
	slot5 = data.ip
	slot6 = "self._rpc ip"

	if self._rpc then
		slot10 = 0
		slot7 = self._rpc.ip_at_index(slot8, self._rpc)
	end

	slot2(slot3, slot4, slot5, slot6)

	data.synced = self._synced
	data.character = self._character
	data.ip_verified = self._ip_verified
	data.creation_t = self._creation_t
	data.dlcs = self._dlcs
	data.handshakes = self._handshakes
	data.loaded = self._loaded
	data.loading = self._loading
	data.expected_dropin_pause_confirmations = self._expected_dropin_pause_confirmations
	slot4 = self

	self._clean_queue(slot3)

	data.msg_queues = self._msg_queues
	data.user_id = self._user_id
	data.force_open_lobby = self._force_open_lobby
	data.profile = self._profile
	data.xuid = self._xuid
	data.xnaddr = self._xnaddr
	data.join_attempt_identifier = self._join_attempt_identifier
	data.muted = self._muted
	data.streaming_status = self._streaming_status
	data.wait_ticket_response = self._ticket_wait_response
	data.other_peer_outfits_loaded = self._other_peer_outfits_loaded
	data.outfit_version = self._outfit_version
	data.outfit_assets = self._outfit_assets
	slot4 = "[NetworkPeer:save]"
	slot7 = data

	print(slot3, inspect(slot6))

	return 
end
function NetworkPeer:name()
	return self._name
end
function NetworkPeer:ip()
	return self._ip
end
function NetworkPeer:id()
	return self._id
end
function NetworkPeer:rpc()
	return self._rpc
end
function NetworkPeer:steam_rpc()
	return self._steam_rpc
end
function NetworkPeer:connection_info()
	return self._name, self._id, self._user_id or "", self._in_lobby, self._loading, self._synced, self._character, "remove", self._xuid, self._xnaddr
end
function NetworkPeer:synched()
	return self._synced
end
function NetworkPeer:loading()
	return self._loading
end
function NetworkPeer:loaded()
	return self._loaded
end
function NetworkPeer:in_lobby()
	return self._in_lobby
end
function NetworkPeer:character()
	return self._character
end
function NetworkPeer:used_deployable()
	return self._used_deployable
end
function NetworkPeer:outfit_signature()
	return self._signature
end
function NetworkPeer:set_used_deployable(used)
	self._used_deployable = used

	return 
end
function NetworkPeer:qos()
	if not self._rpc then
		return 
	end

	slot4 = self._rpc

	return Network.qos(slot2, Network)
end
function NetworkPeer:set_used_cable_ties(used_cable_ties)
	self._used_cable_ties = used_cable_ties

	return 
end
function NetworkPeer:on_used_cable_tie()
	self._used_cable_ties = (self._used_cable_ties or 0) + 1

	return 
end
function NetworkPeer:used_cable_ties()
	return self._used_cable_ties
end
function NetworkPeer:set_used_body_bags(used_body_bags)
	self._used_body_bags = used_body_bags

	return 
end
function NetworkPeer:on_used_body_bags()
	self._used_body_bags = (self._used_body_bags or 0) + 1

	return 
end
function NetworkPeer:used_body_bags()
	return self._used_body_bags or 0
end
function NetworkPeer:waiting_for_player_ready()
	return self._waiting_for_player_ready
end
function NetworkPeer:ip_verified()
	return self._ip_verified
end
function NetworkPeer:set_ip_verified(state)
	slot8 = self._id

	cat_print(slot3, "multiplayer_base", "NetworkPeer:set_ip_verified", state, self._name)

	self._ip_verified = state
	slot4 = self

	self._chk_flush_msg_queues(slot3)

	return 
end
function NetworkPeer:set_loading(state)
	slot10 = self._id

	Application.debug(slot3, Application, "[NetworkPeer:set_loading]", state, "was loading", self._loading, "id")

	if self._loading and not state then
		self._loaded = true
	end

	self._loading = state

	if state then
		slot4 = self

		self.chk_enable_queue(slot3)
	end

	slot4 = self

	self._chk_flush_msg_queues(slot3)

	slot4 = managers.network
	slot4 = managers.network.session(slot3)

	if self == managers.network.session(slot3).local_peer(slot3) then
		return 
	end

	slot4 = managers.network
	slot6 = state

	managers.network.session(slot3).on_peer_loading(slot3, managers.network.session(slot3), self)

	if state then
		self._default_timeout_check_reset = nil

		if managers.network.voice_chat.on_member_removed then
			slot5 = self

			managers.network.voice_chat.on_member_removed(slot3, managers.network.voice_chat)
		end
	elseif self._rpc and managers.network.voice_chat.on_member_added then
		slot6 = self._muted

		managers.network.voice_chat.on_member_added(slot3, managers.network.voice_chat, self)
	end

	return 
end
function NetworkPeer:set_loaded(state)
	self._loaded = state

	return 
end
function NetworkPeer:set_synched(state)
	if state and self.chk_timeout == self.pre_handshake_chk_timeout then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._default_timeout_check_reset = TimerManager.wall(slot3).time(slot3) + NetworkPeer.PRE_HANDSHAKE_CHK_TIME
	end

	self._synced = state

	if state then
		self._syncing = false
	end

	slot4 = self

	self._chk_flush_msg_queues(slot3)

	return 
end
function NetworkPeer:on_sync_start()
	self._syncing = true

	return 
end
function NetworkPeer:set_entering_lobby(state)
	self._entering_lobby = state

	return 
end
function NetworkPeer:entering_lobby()
	return self._entering_lobby
end
function NetworkPeer:set_in_lobby(state)
	slot7 = self._id

	cat_print(slot3, "multiplayer_base", "NetworkPeer:set_in_lobby", state)

	self._in_lobby = state

	if state and self.chk_timeout == self.pre_handshake_chk_timeout then
		self._entering_lobby = false
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._default_timeout_check_reset = TimerManager.wall(slot3).time(slot3) + NetworkPeer.PRE_HANDSHAKE_CHK_TIME
	end

	if managers.network._synced_worlds_temp then
		self._synced_worlds = managers.network._synced_worlds_temp
		managers.network._synced_worlds_temp = nil
	end

	slot4 = self

	self._chk_flush_msg_queues(slot3)

	return 
end
function NetworkPeer:set_in_lobby_soft(state)
	self._in_lobby = state

	return 
end
function NetworkPeer:set_synched_soft(state)
	self._synced = state
	slot4 = self

	self._chk_flush_msg_queues(slot3)

	return 
end
function NetworkPeer:set_character(character)
	self._character = character
	slot4 = self

	self._reload_outfit(slot3)

	slot4 = self

	self.verify_character(slot3)

	return 
end
function NetworkPeer:set_waiting_for_player_ready(state)
	slot7 = self._id

	cat_print(slot3, "multiplayer_base", "NetworkPeer:waiting_for_player_ready", state)

	self._waiting_for_player_ready = state

	return 
end
function NetworkPeer:set_statistics(kills, specials_kills, head_shots, accuracy, downs, revives)
	self._statistics = {
		kills = kills,
		specials_kills = specials_kills,
		head_shots = head_shots,
		accuracy = accuracy,
		downs = downs,
		revives = revives
	}

	return 
end
function NetworkPeer:statistics()
	return self._statistics
end
function NetworkPeer:has_statistics()
	return (self._statistics and true) or false
end
function NetworkPeer:clear_statistics()
	self._statistics = nil

	return 
end
function NetworkPeer:send(func_name, ...)
	if not self._ip_verified then
		slot5 = func_name

		debug_pause(slot3, "[NetworkPeer:send] ip unverified:", ...)

		return 
	end

	local rpc = self._rpc
	slot5 = rpc

	rpc[func_name](slot4, ...)

	slot6 = rpc
	local send_resume = Network.get_connection_send_status(slot4, Network)

	if send_resume then
		slot6 = send_resume

		if type(slot5) ~= "table" then
			slot8 = func_name

			Application.debug(slot5, Application, "[NetworkPeer:send] sending...")

			slot7 = "[NetworkPeer:send] send_resume wrong type!"
			slot10 = send_resume

			Application.error(slot5, Application, inspect(slot9))

			send_resume = nil
		end
	end

	if send_resume then
		local nr_queued_packets = 0
		slot7 = send_resume

		for delivery_type, amount in pairs(slot6) do
			nr_queued_packets = nr_queued_packets + amount

			if 100 < nr_queued_packets and send_resume.unreliable then
				slot13 = send_resume.unreliable

				print(slot11, "[NetworkPeer:send] dropping unreliable packets")

				slot13 = rpc

				Network.drop_unreliable_packets_for_connection(slot11, Network)

				break
			end
		end
	end

	return 
end
function NetworkPeer:_send_queued(queue_name, func_name, ...)
	if self._msg_queues and self._msg_queues[queue_name] then
		slot7 = func_name

		self._push_to_queue(slot4, self, queue_name, ...)
	else
		local overwrite_data = self._overwriteable_msgs[func_name]

		if overwrite_data then
			slot8 = func_name

			overwrite_data.clbk(slot5, overwrite_data, self._overwriteable_queue, ...)

			return 
		end

		slot7 = func_name

		self.send(slot5, self, ...)
	end

	return 
end
function NetworkPeer:send_after_load(...)
	if not self._ip_verified then
		slot3 = "[NetworkPeer:send_after_load] ip unverified:"

		print(slot2, ...)

		return 
	end

	slot4 = "load"

	self._send_queued(slot2, self, ...)

	return 
end
function NetworkPeer:send_after_dropin(...)
	if not self._ip_verified then
		slot3 = "[NetworkPeer:send_after_dropin] ip unverified:"

		print(slot2, ...)

		return 
	end

	slot4 = "after_dropin"

	self._send_queued(slot2, self, ...)

	return 
end
function NetworkPeer:send_queued_sync(...)
	if not self._ip_verified then
		slot4 = "[NetworkPeer:send_queued_sync] ip unverified:"

		Application.error(slot2, Application, ...)

		return 
	end

	if self._synced or self._syncing then
		slot4 = "sync"

		self._send_queued(slot2, self, ...)
	end

	return 
end
function NetworkPeer:_chk_flush_msg_queues()
	if not self._msg_queues or not self._ip_verified then
		return 
	end

	if not self._loading then
		slot4 = "load"

		self._flush_queue(slot2, self)
	end

	if self._synced then
		slot4 = "sync"

		self._flush_queue(slot2, self)
	end

	if self.ready_for_dropin_spawn then
		slot4 = "after_dropin"

		self._flush_queue(slot2, self)
	end

	slot3 = self._msg_queues

	if not next(slot2) then
		self._msg_queues = nil
	end

	return 
end
function NetworkPeer:chk_enable_queue()
	if self._loading then
		self._msg_queues = self._msg_queues or {}
		self._msg_queues.load = self._msg_queues.load or {}
	end

	if not self._synched then
		self._msg_queues = self._msg_queues or {}
		self._msg_queues.sync = self._msg_queues.sync or {}
	end

	if not self.ready_for_dropin_spawn then
		self._msg_queues = self._msg_queues or {}
		self._msg_queues.after_dropin = self._msg_queues.after_dropin or {}
	end

	return 
end
function NetworkPeer:_push_to_queue(queue_name, ...)
	slot5 = {
		...
	}

	table.insert(slot3, self._msg_queues[queue_name])

	return 
end
function NetworkPeer:_clean_queue()
	if not self._msg_queues then
		return 
	end

	slot3 = self._msg_queues

	for type, msg_queue in pairs(slot2) do
		local ok = nil
		slot9 = msg_queue

		for i, msg in ipairs(slot8) do
			ok = true
			slot14 = msg

			for _, param in ipairs(slot13) do
				slot19 = param
				local param_type = type_name(slot18)

				if param_type == "Unit" then
					slot20 = param
				elseif param_type == "Body" then
					slot20 = param

					if not alive(slot19) then
						ok = nil

						break
					end
				end
			end

			if not ok then
				slot15 = i

				print(slot13, "[NetworkPeer:_clean_queue]: Removing Message:")

				msg_queue[i] = nil
			end
		end
	end

	return 
end
function NetworkPeer:_flush_queue(queue_name)
	local msg_queue = self._msg_queues[queue_name]

	if not msg_queue then
		return 
	end

	self._msg_queues[queue_name] = nil
	local ok = nil
	slot6 = msg_queue

	for i, msg in ipairs(slot5) do
		ok = true
		slot11 = msg

		for _, param in ipairs(slot10) do
			slot16 = param
			local param_type = type_name(slot15)

			if param_type == "Unit" then
				slot17 = param
			elseif param_type == "Body" then
				slot17 = param

				if not alive(slot16) then
					ok = nil

					break
				end
			end
		end

		if ok then
			slot11 = self
			slot14 = msg

			self.send(slot10, unpack(slot13))
		end
	end

	return 
end
function NetworkPeer:chk_timeout(timeout)
	if not self._ip_verified then
		return 
	end

	if self._rpc then
		slot5 = self._rpc
		local silent_time = Network.receive_silent_time(slot3, Network)

		if timeout < silent_time then
			if self._steam_rpc then
				slot5 = silent_time
				slot9 = self._steam_rpc
				silent_time = math.min(slot4, Network.receive_silent_time(slot7, Network))
			end

			if timeout < silent_time then
				slot8 = timeout

				print(slot4, "PINGED OUT", self._ip, silent_time)

				slot5 = self

				self._ping_timedout(slot4)
			end
		else
			local diff = (timeout - silent_time) / timeout

			if diff < 0.3 then
				slot9 = timeout

				print(slot5, "PINGED IN!!!", self._ip, silent_time)
			end
		end
	else
		slot4 = self

		self._ping_timedout(slot3)
	end

	return 
end
function NetworkPeer:pre_handshake_chk_timeout()
	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	local wall_t = TimerManager.wall(slot2).time(slot2)

	if self._default_timeout_check_reset and self._default_timeout_check_reset < wall_t then
		self._default_timeout_check_reset = nil
		self.chk_timeout = nil
	end

	return 
end
function NetworkPeer:on_lost()
	self._in_lobby = false
	self._loading = false
	self._synced = false
	self._waiting_for_player_ready = false
	self._msg_queue = nil

	return 
end
function NetworkPeer:_ping_timedout()
	slot3 = managers.network
	slot5 = self._id

	managers.network.session(slot2).on_peer_lost(slot2, managers.network.session(slot2), self)

	return 
end
function NetworkPeer:set_ip(my_ip)
	self._ip = my_ip

	return 
end
function NetworkPeer:set_id(my_id)
	self._id = my_id
	slot4 = managers.network
	slot4 = managers.network.session(slot3)

	if self == managers.network.session(slot3).local_peer(slot3) then
		slot6 = self._id

		Network.set_connection_id(slot3, Network, nil)
	else
		if self._rpc then
			slot6 = self._id

			Network.set_connection_id(slot3, Network, self._rpc)
		end

		if self._steam_rpc then
			slot6 = self._id

			Network.set_connection_id(slot3, Network, self._steam_rpc)
		end
	end

	return 
end
function NetworkPeer:set_name(name)
	self._name = name

	return 
end
function NetworkPeer:destroy()
	slot3 = "[NetworkPeer:destroy]"
	slot6 = self

	print(slot2, self.id(slot5))

	if self._rpc then
		slot4 = self._rpc

		Network.reset_connection(slot2, Network)

		if managers.network.voice_chat.on_member_removed then
			slot4 = self

			managers.network.voice_chat.on_member_removed(slot2, managers.network.voice_chat)
		end
	end

	if self._steam_rpc then
		slot4 = self._steam_rpc

		Network.reset_connection(slot2, Network)
	end

	slot3 = self

	self._unload_outfit(slot2)

	return 
end
function NetworkPeer:on_send()
	slot3 = self

	self.flush_overwriteable_msgs(slot2)

	return 
end
function NetworkPeer:flush_overwriteable_msgs()

	-- Decompilation error in this vicinity:
	local overwriteable_queue = self._overwriteable_queue
	slot4 = self._overwriteable_msgs

	for msg_name, data in pairs(slot3) do
		slot9 = data

		data.clbk(slot8)
	end

	slot4 = overwriteable_queue

	for msg_name, rpc_params in pairs(slot3) do
		local ok = true
		slot10 = rpc_params

		for _, param in ipairs(slot9) do
			slot15 = param
			local param_type = type_name(slot14)

			if param_type == "Unit" then
				slot16 = param
			elseif param_type == "Body" then
				slot16 = param

				if not alive(slot15) then
					ok = nil

					break
				end
			end
		end

		if ok then
			slot10 = self
			slot13 = rpc_params

			self.send(slot9, unpack(slot12))
		else
			slot15 = "params"
			slot18 = rpc_params

			Application.error(slot9, Application, "[NetworkPeer:flush_overwriteable_msgs] msg with dead params peer_id:", self._id, "msg", msg_name, unpack(slot17))

			slot11 = "error"

			Application.stack_dump(slot9, Application)
		end
	end

	self._overwriteable_queue = {}

	return 
end
function NetworkPeer:set_expecting_drop_in_pause_confirmation(dropin_peer_id, state)
	slot10 = state

	print(slot4, " [NetworkPeer:set_expecting_drop_in_pause_confirmation] peer", self._id, "dropin_peer", dropin_peer_id, "state")

	if state then
		self._expected_dropin_pause_confirmations = self._expected_dropin_pause_confirmations or {}
		self._expected_dropin_pause_confirmations[dropin_peer_id] = state
	elseif self._expected_dropin_pause_confirmations then
		self._expected_dropin_pause_confirmations[dropin_peer_id] = nil
		slot5 = self._expected_dropin_pause_confirmations

		if not next(nil) then
			self._expected_dropin_pause_confirmations = nil
		end
	end

	return 
end
function NetworkPeer:is_expecting_pause_confirmation(dropin_peer_id)
	return self._expected_dropin_pause_confirmations and self._expected_dropin_pause_confirmations[dropin_peer_id]
end
function NetworkPeer:expected_dropin_pause_confirmations()
	return self._expected_dropin_pause_confirmations
end
function NetworkPeer:set_expecting_pause_sequence(state)
	self._expecting_pause_sequence = state

	return 
end
function NetworkPeer:expecting_pause_sequence()
	return self._expecting_pause_sequence
end
function NetworkPeer:set_expecting_dropin(state)
	self._expecting_dropin = state

	return 
end
function NetworkPeer:expecting_dropin()
	return self._expecting_dropin
end
function NetworkPeer:creation_t()
	return self._creation_t
end
function NetworkPeer:set_level(level)
	self._level = level
	slot6 = {
		peer = self
	}

	managers.system_event_listener.call_listeners(slot3, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PEER_LEVEL_UP)

	return 
end
function NetworkPeer:set_class_nation(class_name, nation_name)
	slot6 = class_name

	self.set_class(slot4, self)

	slot6 = nation_name

	self.set_nationality(slot4, self)

	return 
end
function NetworkPeer:level()
	return self._level
end
function NetworkPeer:set_profile(level)
	self._profile.level = level

	return 
end
function NetworkPeer:set_outfit_string(outfit_string, outfit_version, outfit_signature)
	slot9 = outfit_version

	print(slot5, "[NetworkPeer:set_outfit_string] ID", self._id, outfit_string)

	local old_outfit_string = self._profile.outfit_string
	self._profile.outfit_string = outfit_string

	if not self._ticket_wait_response then
		slot7 = self

		self.verify_outfit(slot6)
	end

	if old_outfit_string ~= outfit_string then
		slot7 = self

		self._reload_outfit(slot6)
	end

	slot7 = managers.network
	slot7 = managers.network.session(slot6)

	if self == managers.network.session(slot6).local_peer(slot6) then
		slot7 = self

		self._increment_outfit_version(slot6)

		if old_outfit_string ~= outfit_string then
			slot7 = managers.network.account

			managers.network.account.inventory_outfit_refresh(slot6)
		end
	else
		self._outfit_version = outfit_version or 0

		if outfit_signature and old_outfit_string ~= outfit_string then
			self._signature = outfit_signature
		end
	end

	return self._profile.outfit_string, self._outfit_version, self._signature
end
function NetworkPeer:profile(data)
	if data then
		return self._profile[data]
	end

	return self._profile
end
function NetworkPeer:character_id()
	slot3 = managers.blackmarket
	slot6 = self

	return managers.blackmarket.get_character_id_by_character_name(slot2, self.character(slot5))
end
function NetworkPeer:mask_id()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = " "
	local data = string.split(self, outfit_string)
	slot6 = "mask"

	return data[managers.blackmarket.outfit_string_index(outfit_string, managers.blackmarket)]
end
function NetworkPeer:mask_blueprint()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = outfit_string

	return managers.blackmarket.mask_blueprint_from_outfit_string(self, managers.blackmarket)
end
function NetworkPeer:armor_id(get_current)
	slot5 = "outfit_string"
	local outfit_string = self.profile(slot3, self)
	slot6 = " "
	local data = string.split(self, outfit_string)
	slot7 = "armor"
	local armor_string = data[managers.blackmarket.outfit_string_index(outfit_string, managers.blackmarket)]
	slot8 = "-"
	local armor_data = string.split(managers.blackmarket, armor_string)

	return (get_current and armor_data[3]) or armor_data[2] or armor_data[1]
end
function NetworkPeer:melee_id()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = " "
	local data = string.split(self, outfit_string)
	slot6 = "melee_weapon"

	return data[managers.blackmarket.outfit_string_index(outfit_string, managers.blackmarket)]
end
function NetworkPeer:grenade_id()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = " "
	local data = string.split(self, outfit_string)
	slot6 = "grenade"

	return data[managers.blackmarket.outfit_string_index(outfit_string, managers.blackmarket)]
end
function NetworkPeer:skills()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = " "
	local data = string.split(self, outfit_string)
	slot6 = "skills"

	return data[managers.blackmarket.outfit_string_index(outfit_string, managers.blackmarket)]
end
function NetworkPeer:has_blackmarket_outfit()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)

	return not not outfit_string
end
function NetworkPeer:blackmarket_outfit()
	slot4 = "outfit_string"
	local outfit_string = self.profile(slot2, self)
	slot5 = outfit_string

	return managers.blackmarket.unpack_outfit_from_string(self, managers.blackmarket)
end
function NetworkPeer:set_handshake_status(introduced_peer_id, status)
	slot8 = status

	print(slot4, "[NetworkPeer:set_handshake_status]", self._id, introduced_peer_id)

	slot5 = Application

	Application.stack_dump(slot4)

	self._handshakes[introduced_peer_id] = status

	return 
end
function NetworkPeer:handshakes()
	return self._handshakes
end
function NetworkPeer:has_queued_rpcs()
	if not self._msg_queues then
		return 
	end

	slot3 = self._msg_queues

	for queue_name, queue in pairs(slot2) do
		slot8 = queue

		if next(slot7) then
			slot9 = queue_name

			print(slot7, "queued msgs in")

			slot8 = queue

			for i, rpc_info in ipairs(slot7) do
				slot13 = i

				print(slot12)

				slot13 = rpc_info

				for _, blah in ipairs(slot12) do
					slot18 = blah

					print(slot17)
				end
			end

			return queue_name
		end
	end

	return 
end
function NetworkPeer:set_xuid(xuid)
	self._xuid = xuid

	return 
end
function NetworkPeer:xuid()
	return self._xuid
end
function NetworkPeer:set_xnaddr(xnaddr)
	self._xnaddr = xnaddr

	return 
end
function NetworkPeer:xnaddr()
	return self._xnaddr
end
function NetworkPeer:user_id()
	return self._user_id
end
function NetworkPeer:is_host()
	return self._id == 1
end
function NetworkPeer:next_steam_p2p_send_t()
	return self._next_steam_p2p_send_t
end
function NetworkPeer:set_next_steam_p2p_send_t(t)
	self._next_steam_p2p_send_t = t

	return 
end
function NetworkPeer:set_force_open_lobby_state(state)
	self._force_open_lobby = state or nil

	return 
end
function NetworkPeer:force_open_lobby_state()
	return self._force_open_lobby
end
function NetworkPeer:set_join_attempt_identifier(identifier)
	self._join_attempt_identifier = identifier

	return 
end
function NetworkPeer:join_attempt_identifier()
	return self._join_attempt_identifier
end
function NetworkPeer:set_muted(mute_flag)
	self._muted = mute_flag

	if managers.network.voice_chat then
		slot6 = self._muted

		managers.network.voice_chat.mute_player(slot3, managers.network.voice_chat, self)
	end

	return 
end
function NetworkPeer:is_muted()
	return self._muted
end
function NetworkPeer:set_streaming_status(status)
	self._streaming_status = status

	return 
end
function NetworkPeer:is_streaming_complete()
	return self._streaming_status == 100
end
function NetworkPeer:streaming_status()
	return self._streaming_status
end
function NetworkPeer:is_outfit_loaded()
	return not self._loading_outfit_assets and self._profile.outfit_string ~= ""
end
function NetworkPeer:is_loading_outfit_assets()
	return self._loading_outfit_assets
end
function NetworkPeer:_unload_outfit()
	slot3 = self._outfit_assets.unit

	for asset_id, asset_data in pairs(slot2) do
		slot12 = false

		managers.dyn_resource.unload(slot7, managers.dyn_resource, ids_unit, asset_data.name, DynamicResourceManager.DYN_RESOURCES_PACKAGE)
	end

	slot3 = self._outfit_assets.texture

	for asset_id, asset_data in pairs(slot2) do
		slot9 = asset_data.name

		TextureCache.unretrieve(slot7, TextureCache)
	end

	self._outfit_assets = {
		unit = {},
		texture = {}
	}

	return 
end
function NetworkPeer:force_reload_outfit()
	slot3 = self

	self._reload_outfit(slot2)

	return 
end
function NetworkPeer:_reload_outfit()
	if self._profile.outfit_string == "" then
		return 
	end

	self._loading_outfit_assets = true
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local is_local_peer = self == managers.network.session(slot2).local_peer(slot2)
	local new_outfit_assets = {
		unit = {},
		texture = {}
	}
	local old_outfit_assets = self._outfit_assets
	slot8 = self._profile.outfit_string

	print(slot5, "[NetworkPeer:_reload_outfit]", (is_local_peer and "local_peer") or self._id)

	local asset_load_result_clbk = callback(slot5, self, self, "clbk_outfit_asset_loaded")
	slot10 = new_outfit_assets
	local texture_load_result_clbk = callback(self, self, self, "clbk_outfit_texture_loaded")
	slot8 = self
	local complete_outfit = self.blackmarket_outfit(self)
	local factory_id = complete_outfit.primary.factory_id .. ((is_local_peer and "") or "_npc")
	slot10 = tweak_data.weapon.factory[factory_id].unit
	local ids_primary_u_name = Idstring(new_outfit_assets)
	new_outfit_assets.unit.primary_w = {
		name = ids_primary_u_name
	}

	if not is_local_peer then
		slot11 = managers.weapon_factory
		local use_fps_parts = managers.weapon_factory.use_thq_weapon_parts(slot10) and not tweak_data.weapon.factory[factory_id].skip_thq_parts
	end

	slot17 = true
	local primary_w_parts = managers.weapon_factory.preload_blueprint(slot11, managers.weapon_factory, complete_outfit.primary.factory_id, complete_outfit.primary.blueprint, not use_fps_parts, function ()
		return 
	end)
	slot13 = primary_w_parts

	for part_id, part in pairs(managers.weapon_factory) do
		slot20 = part_id
		new_outfit_assets.unit["prim_w_part_" .. tostring(slot19)] = {
			name = part.name
		}
	end

	local factory_id = complete_outfit.secondary.factory_id .. ((is_local_peer and "") or "_npc")
	slot14 = tweak_data.weapon.factory[factory_id].unit
	local ids_secondary_u_name = Idstring(slot13)
	new_outfit_assets.unit.secondary_w = {
		name = ids_secondary_u_name
	}

	if not is_local_peer then
		slot15 = managers.weapon_factory
		local use_fps_parts = managers.weapon_factory.use_thq_weapon_parts(slot14) and not tweak_data.weapon.factory[factory_id].skip_thq_parts
	end

	slot21 = true
	local secondary_w_parts = managers.weapon_factory.preload_blueprint(slot15, managers.weapon_factory, complete_outfit.secondary.factory_id, complete_outfit.secondary.blueprint, not use_fps_parts, function ()
		return 
	end)
	slot17 = secondary_w_parts

	for part_id, part in pairs(managers.weapon_factory) do
		slot24 = part_id
		new_outfit_assets.unit["sec_w_part_" .. tostring(slot23)] = {
			name = part.name
		}
	end

	local melee_tweak_data = tweak_data.blackmarket.melee_weapons[complete_outfit.melee_weapon]
	local melee_u_name = (is_local_peer and melee_tweak_data.unit) or melee_tweak_data.third_unit

	if melee_u_name then
		slot21 = melee_u_name
		new_outfit_assets.unit.melee_w = {
			name = Idstring(slot20)
		}
	end

	local grenade_tweak_data = tweak_data.projectiles[complete_outfit.grenade]
	local grenade_u_name = grenade_tweak_data.unit

	if grenade_u_name then
		slot23 = grenade_u_name
		new_outfit_assets.unit.grenade_w = {
			name = Idstring(slot22)
		}
	end

	local grenade_sprint_u_name = grenade_tweak_data.sprint_unit

	if grenade_sprint_u_name then
		slot24 = grenade_sprint_u_name
		new_outfit_assets.unit.grenade_sprint_w = {
			name = Idstring(slot23)
		}
	end

	if is_local_peer then
		local grenade_dummy_u_name = grenade_tweak_data.unit_dummy

		if grenade_dummy_u_name then
			slot25 = grenade_dummy_u_name
			new_outfit_assets.unit.grenade_dummy_w = {
				name = Idstring(slot24)
			}
		end
	end

	self._outfit_assets = new_outfit_assets
	slot22 = new_outfit_assets.unit

	for asset_id, asset_data in pairs(slot21) do
		asset_data.is_streaming = true
		slot31 = asset_load_result_clbk

		managers.dyn_resource.load(slot26, managers.dyn_resource, ids_unit, asset_data.name, DynamicResourceManager.DYN_RESOURCES_PACKAGE)
	end

	slot22 = new_outfit_assets.texture

	for asset_id, asset_data in pairs(slot21) do
		asset_data.is_streaming = true
		slot31 = 90

		TextureCache.request(slot26, TextureCache, asset_data.name, ids_NORMAL, texture_load_result_clbk)
	end

	self._all_outfit_load_requests_sent = true
	self._outfit_assets = old_outfit_assets
	slot22 = self

	self._unload_outfit(slot21)

	self._outfit_assets = new_outfit_assets
	slot22 = self

	self._chk_outfit_loading_complete(slot21)

	slot22 = self
	slot25 = managers.skilltree

	self.set_class(slot21, managers.skilltree.get_character_profile_class(slot24))

	return 
end
function NetworkPeer:clbk_outfit_asset_loaded(outfit_assets, status, asset_type, asset_name)
	if not self._loading_outfit_assets or self._outfit_assets ~= outfit_assets then
		return 
	end

	slot7 = outfit_assets.unit

	for asset_id, asset_data in pairs(slot6) do
		if asset_data.name == asset_name then
			asset_data.is_streaming = nil
		end
	end

	if not Global.peer_loading_outfit_assets or not Global.peer_loading_outfit_assets[self._id] then
		slot7 = self

		self._chk_outfit_loading_complete(slot6)
	end

	return 
end
function NetworkPeer:clbk_outfit_texture_loaded(outfit_assets, tex_name)
	if not self._loading_outfit_assets or self._outfit_assets ~= outfit_assets then
		return 
	end

	slot5 = outfit_assets.texture

	for asset_id, asset_data in pairs(slot4) do
		if asset_data.name == tex_name then
			asset_data.is_streaming = nil
		end
	end

	if not Global.peer_loading_outfit_assets or not Global.peer_loading_outfit_assets[self._id] then
		slot5 = self

		self._chk_outfit_loading_complete(slot4)
	end

	return 
end
function NetworkPeer:_chk_outfit_loading_complete()
	if not self._loading_outfit_assets or not self._all_outfit_load_requests_sent then
		return 
	end

	slot3 = self._outfit_assets

	for asset_type, asset_list in pairs(slot2) do
		slot8 = asset_list

		for asset_id, asset_data in pairs(slot7) do
			if asset_data.is_streaming then
				return 
			end
		end
	end

	self._all_outfit_load_requests_sent = nil
	self._loading_outfit_assets = nil
	slot3 = managers.network
	slot4 = self

	managers.network.session(slot2).on_peer_outfit_loaded(slot2, managers.network.session(slot2))

	return 
end
function NetworkPeer:set_other_peer_outfit_loaded_status(status)
	self._other_peer_outfits_loaded = status

	return 
end
function NetworkPeer:other_peer_outfit_loaded_status()
	return self._other_peer_outfits_loaded
end
function NetworkPeer:_increment_outfit_version()
	if self._outfit_version == 100 then
		self._outfit_version = 1
	else
		self._outfit_version = self._outfit_version + 1
	end

	return self._outfit_version
end
function NetworkPeer:outfit_version()
	return self._outfit_version
end
function NetworkPeer:set_throttling_enabled(state)
	if self._rpc then
		slot6 = not state

		Network.set_throttling_disabled(slot3, Network, self._rpc)
	end

	if self._steam_rpc then
		slot6 = not state

		Network.set_throttling_disabled(slot3, Network, self._steam_rpc)
	end

	return 
end
function NetworkPeer:drop_in_progress()
	return self._dropin_progress
end
function NetworkPeer:set_drop_in_progress(dropin_progress)
	self._dropin_progress = dropin_progress

	return 
end
function NetworkPeer:sync_lobby_data(peer)
	slot4 = "[NetworkPeer:sync_lobby_data] to"
	slot7 = peer

	print(slot3, peer.id(slot6))

	local level = managers.experience.current_level(slot3)
	slot5 = self
	local character = self.character(managers.experience)
	local mask_set = "remove"
	local progress = managers.upgrades.progress(slot6)
	slot11 = self
	local menu_state = managers.menu.get_peer_state(managers.upgrades, self.id(slot10))
	slot10 = menu_state
	local menu_state_index = tweak_data.menu_sync_state_to_index(managers.menu, tweak_data)
	slot14 = peer
	slot16 = self

	cat_print(tweak_data, "multiplayer_base", "NetworkPeer:sync_lobby_data to", peer.id(slot13), " : ", self.id(level))

	slot14 = mask_set

	peer.send_after_load(tweak_data, peer, "lobby_info", level, character)

	slot13 = self._class

	peer.send_after_load(tweak_data, peer, "sync_profile", level)

	slot10 = managers.network
	slot10 = managers.network.session(tweak_data)

	managers.network.session(tweak_data).check_send_outfit(tweak_data)

	if menu_state_index then
		slot12 = menu_state_index

		peer.send_after_load(slot9, peer, "set_menu_sync_state_index")
	end

	slot10 = Network

	if Network.is_server(slot9) then
		slot11 = "lobby_sync_update_level_id"
		slot15 = Global.game_settings.level_id

		peer.send_after_load(slot9, peer, tweak_data.levels.get_index_from_level_id(slot13, tweak_data.levels))

		slot12 = Global.game_settings.difficulty

		peer.send_after_load(slot9, peer, "lobby_sync_update_difficulty")
	end

	return 
end
function NetworkPeer:sync_data(peer)
	slot4 = "[NetworkPeer:sync_data] to"
	slot7 = peer

	print(slot3, peer.id(slot6))

	local level = managers.experience.current_level(slot3)
	slot8 = self._class

	peer.send_queued_sync(managers.experience, peer, "sync_profile", level)

	slot5 = managers.network
	slot6 = peer

	managers.network.session(managers.experience).check_send_outfit(managers.experience, managers.network.session(managers.experience))

	slot6 = peer

	managers.player.update_deployable_equipment_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_cable_ties_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_grenades_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_equipment_possession_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_ammo_info_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_team_upgrades_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_husk_bipod_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.player.update_husk_turret_to_peer(managers.experience, managers.player)

	slot6 = peer

	managers.worldcollection.update_synced_worlds_to_peer(managers.experience, managers.worldcollection)

	return 
end
function NetworkPeer:unit()
	return self._unit
end
function NetworkPeer:spawn_unit(spawn_point_id, is_drop_in, state_transition)
	if self._unit then
		return 
	end

	slot6 = self

	if not self.synched(slot5) then
		return 
	end

	if is_drop_in then
		slot6 = self

		return self._spawn_unit_on_dropin(slot5)
	end

	slot8 = state_transition

	return self._spawn_unit_on_respawn(slot5, self, spawn_point_id)
end
function NetworkPeer:_spawn_unit_on_dropin()
	slot3 = managers.criminals
	local pos_rot = managers.criminals.get_valid_player_spawn_pos_rot(slot2)

	if not pos_rot then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if not managers.network.session(slot3).get_next_spawn_point(slot3) then
			slot5 = 1
			local spawn_point = managers.network.spawn_point(slot3, managers.network)
		end

		pos_rot = spawn_point.pos_rot
	end

	local character_name = self.character(slot3)
	slot5 = self
	local member_downed, member_dead, health, used_deployable, used_cable_ties, used_body_bags, hostages_killed, respawn_penalty, old_plr_entry = self._get_old_entry(self)

	if old_plr_entry then
		old_plr_entry.member_downed = nil
		old_plr_entry.member_dead = nil
		old_plr_entry.hostages_killed = nil
		old_plr_entry.respawn_penalty = nil
	end

	slot14 = managers.groupai
	slot16 = member_downed or member_dead
	local trade_entry, old_unit = managers.groupai.state(slot13).remove_one_teamAI(slot13, managers.groupai.state(slot13), character_name)

	if trade_entry and member_dead then
		trade_entry.peer_id = self._id
	end

	slot16 = old_unit
	local has_old_unit = alive(slot15)
	local ai_is_downed = false
	slot18 = old_unit

	if alive(slot17) then
		slot18 = old_unit
		slot18 = old_unit.character_damage(slot17)

		if not old_unit.character_damage(slot17).bleed_out(slot17) then
			slot18 = old_unit
			slot18 = old_unit.character_damage(slot17)

			if not old_unit.character_damage(slot17).fatal(slot17) then
				slot18 = old_unit
				slot18 = old_unit.character_damage(slot17)

				if not old_unit.character_damage(slot17).arrested(slot17) then
					slot18 = old_unit
					slot18 = old_unit.character_damage(slot17)

					if not old_unit.character_damage(slot17).need_revive(slot17) then
						slot18 = old_unit
						slot18 = old_unit.character_damage(slot17)
						ai_is_downed = old_unit.character_damage(slot17).dead(slot17)
					end
				end
			end
		end

		slot19 = old_unit

		World.delete_unit(slot17, World)
	end

	local spawn_in_custody = (member_downed or member_dead) and (trade_entry or ai_is_downed or (not trade_entry and not has_old_unit))
	slot20 = managers.network
	slot20 = managers.network.session(slot19)
	slot20 = managers.network.session(slot19).local_peer(slot19)
	local is_local_peer = self._id == managers.network.session(slot19).local_peer(slot19).id(slot19)
	local unit = nil
	slot24 = self
	slot21 = tweak_data.blackmarket.characters[self.character_id(slot23)].fps_unit
	local unit_name = Idstring(slot20)

	if is_local_peer then
		slot25 = pos_rot[2]
		unit = World.spawn_unit(slot21, World, unit_name, pos_rot[1])
	else
		slot25 = self
		slot26 = pos_rot[2]
		unit = Network.spawn_unit_on_client(slot21, Network, self.rpc(slot24), unit_name, pos_rot[1])
	end

	slot23 = "player"
	local team_id = tweak_data.levels.get_default_team_ID(slot21, tweak_data.levels)
	slot26 = team_id

	self.set_unit(tweak_data.levels, self, unit, character_name)

	slot23 = managers.network
	slot30 = self
	slot30 = team_id

	managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), "set_unit", unit, character_name, self.profile(slot28).outfit_string, self.outfit_version(self), self._id)

	if not is_local_peer then
		slot24 = self

		managers.criminals.sync_teamai_to_peer(slot22, managers.criminals)
	end

	slot23 = managers.groupai
	slot26 = respawn_penalty

	managers.groupai.state(slot22).set_dropin_hostages_killed(slot22, managers.groupai.state(slot22), unit, hostages_killed)

	slot24 = used_deployable

	self.set_used_deployable(slot22, self)

	slot24 = used_body_bags

	self.set_used_body_bags(slot22, self)

	if is_local_peer then
		slot29 = used_body_bags

		managers.player.spawn_dropin_penalty(slot22, managers.player, spawn_in_custody, spawn_in_custody, health, used_deployable, used_cable_ties)

		slot23 = managers.player

		managers.player.sync_upgrades(slot22)
	else
		slot30 = used_body_bags

		self.send_queued_sync(slot22, self, "spawn_dropin_penalty", spawn_in_custody, spawn_in_custody, health, used_deployable, used_cable_ties)
	end

	slot23 = Network

	if Network.is_server(slot22) then
		slot24 = self

		managers.vehicle.update_vehicles_data_to_peer(slot22, managers.vehicle)
	end

	slot23 = managers.vehicle
	local vehicle = managers.vehicle.find_active_vehicle_with_player(slot22)

	if vehicle and not spawn_in_custody then
		slot25 = "[NetworkPeer] Spawning peer_id in vehicle, peer_id:" .. self._id

		Application.trace(slot23, Application)

		slot27 = unit

		managers.player.server_enter_vehicle(slot23, managers.player, vehicle, self._id)
	end

	if self._class then
		slot24 = self

		self._set_class_to_unit(slot23)
	end

	self._peer_connecting = false
	slot24 = managers.hud

	managers.hud._fix_peer_warcry_icons(slot23)

	return unit
end
function NetworkPeer:_spawn_unit_on_respawn(spawn_point_id, state_transition)
	slot6 = spawn_point_id
	local pos_rot = managers.network.spawn_point(slot4, managers.network).pos_rot
	slot6 = self
	local character_name = self.character(managers.network)
	slot8 = managers.network
	slot8 = managers.network.session(slot7)
	slot8 = managers.network.session(slot7).local_peer(slot7)
	local is_local_peer = self._id == managers.network.session(slot7).local_peer(slot7).id(slot7)
	local unit = nil
	slot12 = self
	slot9 = tweak_data.blackmarket.characters[self.character_id(slot11)].fps_unit
	local unit_name = Idstring(slot8)

	if is_local_peer then
		slot13 = pos_rot[2]
		unit = World.spawn_unit(slot9, World, unit_name, pos_rot[1])
	else
		slot13 = self
		slot14 = pos_rot[2]
		unit = Network.spawn_unit_on_client(slot9, Network, self.rpc(slot12), unit_name, pos_rot[1])
	end

	slot11 = "player"
	local team_id = tweak_data.levels.get_default_team_ID(slot9, tweak_data.levels)
	slot14 = team_id

	self.set_unit(tweak_data.levels, self, unit, character_name)

	slot11 = managers.network
	slot18 = self
	slot18 = team_id

	managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), "set_unit", unit, character_name, self.profile(slot16).outfit_string, self.outfit_version(self), self._id)

	if not is_local_peer then
		slot12 = self

		managers.criminals.sync_teamai_to_peer(slot10, managers.criminals)
	else
		slot11 = managers.player

		managers.player.sync_upgrades(slot10)
	end

	slot11 = Network

	if Network.is_server(slot10) then
		slot12 = self

		managers.vehicle.update_vehicles_data_to_peer(slot10, managers.vehicle)
	end

	if state_transition then
		if state_transition == "driving" then
			local vehicle = managers.vehicle.find_active_vehicle_with_player(slot10)
			slot15 = unit

			managers.player.server_enter_vehicle(managers.vehicle, managers.player, vehicle, self._id)
		elseif state_transition == "foxhole" then
		end
	end

	if self._class then
		slot11 = self

		self._set_class_to_unit(slot10)
	end

	return unit
end
function NetworkPeer:_get_old_entry(null_old_entry_elements)

	-- Decompilation error in this vicinity:
	slot5 = "WIN32"
	slot5 = managers.network
	local old_plr_entry = managers.network.session(slot4)._old_players[peer_ident]
	local member_downed = nil
	local health = 1
	local used_deployable = false
	local used_cable_ties = 0
	local used_body_bags = 0
	local member_dead, hostages_killed, respawn_penalty = nil

	if old_plr_entry then
		slot15 = Application

		if Application.time(slot14) < old_plr_entry.t + 180 then
			member_downed = old_plr_entry.member_downed
			health = old_plr_entry.health
			used_deployable = old_plr_entry.used_deployable
			used_cable_ties = old_plr_entry.used_cable_ties
			used_body_bags = old_plr_entry.used_body_bags
			member_dead = old_plr_entry.member_dead
			hostages_killed = old_plr_entry.hostages_killed
			respawn_penalty = old_plr_entry.respawn_penalty
		end
	end

	return member_downed, member_dead, health, used_deployable, used_cable_ties, used_body_bags, hostages_killed, respawn_penalty, old_plr_entry
end
function NetworkPeer:spawn_unit_called()
	return self._spawn_unit_called
end
function NetworkPeer:set_unit(unit, character_name, team_id)

	-- Decompilation error in this vicinity:
	if is_new_unit then
		slot7 = unit
		slot8 = self

		unit.inventory(slot6).set_melee_weapon_by_peer(slot6, unit.inventory(slot6))
	end

	if unit then
		slot8 = character_name
		slot8 = self

		if managers.criminals.character_peer_id_by_name(slot6, managers.criminals) == self.id(managers.criminals) then
			slot9 = unit

			managers.criminals.set_unit(slot6, managers.criminals, character_name)
		else
			slot8 = character_name

			if managers.criminals.is_taken(slot6, managers.criminals) then
				slot8 = character_name

				managers.criminals.remove_character_by_name(slot6, managers.criminals)
			end

			slot12 = self

			managers.criminals.add_character(slot6, managers.criminals, character_name, unit, self.id(false))
		end

		if self._class then
			slot7 = self

			self._set_class_to_unit(slot6)
		end
	end

	if is_new_unit then
		slot7 = unit
		slot7 = unit.movement(slot6)
		slot10 = managers.groupai
		slot10 = managers.groupai.state(slot9)
		slot14 = "player"

		unit.movement(slot6).set_team(slot6, managers.groupai.state(slot9).team_data(slot9, tweak_data.levels.get_default_team_ID(slot12, tweak_data.levels)))

		slot7 = unit
		slot7 = unit.movement(slot6)

		unit.movement(slot6).set_character_anim_variables(slot6)
	end

	slot8 = managers.network
	slot8 = managers.network.session(slot7)
	slot8 = managers.network.session(slot7).local_peer(slot7)

	if self._id == managers.network.session(slot7).local_peer(slot7).id(slot7) then
		slot7 = managers.weapon_skills

		managers.weapon_skills.update_weapon_part_animation_weights(slot6)
	end

	slot7 = self

	self.set_character_customization(slot6)

	self._spawn_unit_called = true

	return 
end
function NetworkPeer:set_character_customization()
	slot3 = self
	local complete_outfit = self.blackmarket_outfit(slot2)
	local head_name = complete_outfit.character_customization_head
	local upper_name = complete_outfit.character_customization_upper
	local lower_name = complete_outfit.character_customization_lower
	local character_nationality_name = complete_outfit.character_customization_nationality or "american"
	slot8 = self._unit

	if alive(slot7) then
		slot8 = self._unit
	else
		slot8 = self._unit

		if alive(slot7) then
			slot8 = self._unit

			if self._unit.camera(slot7) then
				slot8 = self._unit
				slot8 = self._unit.camera(slot7)

				if self._unit.camera(slot7).camera_unit(slot7) then
					slot8 = self._unit
					slot8 = self._unit.camera(slot7)
					slot8 = self._unit.camera(slot7).camera_unit(slot7)

					if self._unit.camera(slot7).camera_unit(slot7).customizationfps(slot7) then
						slot8 = self._unit
						slot8 = self._unit.camera(slot7)
						slot8 = self._unit.camera(slot7).camera_unit(slot7)
						slot10 = upper_name

						self._unit.camera(slot7).camera_unit(slot7).customizationfps(slot7).attach_fps_hands(slot7, self._unit.camera(slot7).camera_unit(slot7).customizationfps(slot7), character_nationality_name)
					end
				end
			end
		end
	end

	return 
end
function NetworkPeer:unit_delete()
	if managers.criminals then
		slot4 = self._id

		managers.criminals.remove_character_by_peer_id(slot2, managers.criminals)
	end

	slot3 = self._unit

	if alive(slot2) then
		slot3 = Network

		if Network.is_server(slot2) then
			slot3 = managers.network
			slot6 = self._unit

			managers.network.session(slot2).send_to_peers_loaded_except(slot2, managers.network.session(slot2), self._id, "remove_unit")
		end

		slot3 = self._unit

		if self._unit.id(slot2) ~= -1 then
			slot4 = self._unit

			Network.detach_unit(slot2, Network)
		end

		slot3 = self._unit
		slot3 = self._unit.inventory(slot2)

		self._unit.inventory(slot2).destroy_all_items(slot2)

		slot3 = self._unit

		if self._unit.customization(slot2) then
			slot3 = self._unit
			slot3 = self._unit.customization(slot2)

			self._unit.customization(slot2).destroy_all_parts_on_character(slot2)
		end

		slot4 = 0

		self._unit.set_slot(slot2, self._unit)
	end

	self._unit = nil

	return 
end
function NetworkPeer:update_character_sequence(character_switch_sequence)
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	slot6 = character_switch_sequence

	print(slot3, "[NetworkPeer:_update_character]", "character_switch_sequence")

	if character_switch_sequence then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = character_switch_sequence

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = character_switch_sequence

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end
	end

	return 
end

return 
