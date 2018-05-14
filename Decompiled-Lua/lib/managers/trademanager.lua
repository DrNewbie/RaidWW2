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
TradeManager = TradeManager or class()
TradeManager.TRADE_DELAY = 5
function TradeManager:init()
	self._criminals_to_respawn = {}
	self._criminals_to_add = {}
	self._trade_counter_tick = 1
	self._num_trades = 0
	self._hostage_trade_index = 0
	slot4 = true

	self.set_trade_countdown(slot2, self)

	return 
end
function TradeManager:save(save_data)
	slot4 = self._criminals_to_respawn

	if not next(slot3) then
		local my_save_data = {}
		save_data.trade = my_save_data
		my_save_data.trade_countdown = self._trade_countdown or false

		return 
	end

	local my_save_data = {}
	save_data.trade = my_save_data
	my_save_data.criminals = self._criminals_to_respawn
	my_save_data.trade_countdown = self._trade_countdown or false
	my_save_data.outfits = {}
	slot5 = self._criminals_to_respawn

	for _, crim in ipairs(slot4) do
		if crim.peer_id then
			slot13 = managers.network
			slot14 = crim.peer_id
			slot14 = "outfit_string"
			slot13 = managers.network
			slot14 = crim.peer_id
			slot13 = managers.network.session(slot12).peer(slot12, managers.network.session(slot12))
			my_save_data.outfits[crim.peer_id] = {
				outfit = managers.network.session(slot12).peer(slot12, managers.network.session(slot12)).profile(slot12, managers.network.session(slot12).peer(slot12, managers.network.session(slot12))),
				version = managers.network.session(slot12).peer(slot12, managers.network.session(slot12)).outfit_version(slot12)
			}
		end
	end

	return 
end
function TradeManager:load(load_data)
	local my_load_data = load_data.trade

	if not my_load_data then
		return 
	end

	if my_load_data.trade_countdown ~= nil then
		slot6 = my_load_data.trade_countdown

		self.set_trade_countdown(slot4, self)
	end

	if my_load_data.criminals then
		self._criminals_to_respawn = my_load_data.criminals
		self._criminals_to_add = {}
		slot5 = self._criminals_to_respawn

		for _, crim in ipairs(slot4) do
			if not crim.ai then
				slot10 = managers.network
				slot11 = crim.peer_id

				if not managers.network.session(slot9).peer(slot9, managers.network.session(slot9)) and crim.peer_id then
					self._criminals_to_add[crim.peer_id] = crim
					slot10 = managers.network
					slot11 = crim.peer_id
					local peer = managers.network.session(crim.peer_id).peer(crim.peer_id, managers.network.session(crim.peer_id))
					local outfit = my_load_data.outfits[crim.peer_id]
					crim.outfit = outfit
				end
			elseif crim.peer_id then
				slot10 = managers.network
				local peer = managers.network.session(slot9).peer(slot9, managers.network.session(slot9))
				local outfit = my_load_data.outfits[crim.peer_id]
				slot14 = outfit.version

				peer.set_outfit_string(crim.peer_id, peer, outfit.outfit)
			end
		end
	end

	return 
end
function TradeManager:handshake_complete(peer_id)
	local crim = self._criminals_to_add[peer_id]

	if crim then
		slot5 = managers.network
		slot6 = peer_id
		local peer = managers.network.session(slot4).peer(slot4, managers.network.session(slot4))
		slot7 = crim.outfit

		peer.set_outfit_string(managers.network.session(slot4), peer)

		slot10 = crim.ai

		managers.criminals.add_character(managers.network.session(slot4), managers.criminals, crim.id, nil, crim.peer_id)

		self._criminals_to_add[peer_id] = nil
	end

	return 
end
function TradeManager:is_peer_in_custody(peer_id)
	slot4 = self._criminals_to_respawn

	for _, crim in ipairs(slot3) do
		if crim.peer_id == peer_id then
			return true
		end
	end

	return 
end
function TradeManager:is_criminal_in_custody(name)
	slot4 = self._criminals_to_respawn

	for _, crim in ipairs(slot3) do
		if crim.id == name then
			return true
		end
	end

	return 
end
function TradeManager:is_trading()
	return (self._trading_hostage or self._hostage_trade_clbk or self._speaker_snd_event) and 0 < #self._criminals_to_respawn
end
function TradeManager:respawn_delay_by_name(character_name)
	slot4 = self._criminals_to_respawn

	for _, crim in ipairs(slot3) do
		if crim.id == character_name then
			return crim.respawn_penalty
		end
	end

	return 0
end
function TradeManager:hostages_killed_by_name(character_name)
	slot4 = self._criminals_to_respawn

	for _, crim in ipairs(slot3) do
		if crim.id == character_name then
			return crim.hostages_killed
		end
	end

	return 0
end
function TradeManager:update(t, dt)
	self._t = t

	if not managers.criminals or not managers.hud then
		return 
	end

	local is_trade_allowed = self.is_trade_allowed(slot4)
	slot8 = is_trade_allowed
	local is_auto_assault_ai_trade = self.update_auto_assault_ai_trade(self, self, dt)

	if not self._hostage_remind_t or self._hostage_remind_t < t then
		if not self._trading_hostage and not self._hostage_trade_clbk and 0 < #self._criminals_to_respawn then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)

			if managers.groupai.state(slot6).hostage_count(slot6) <= 0 then
				slot9 = managers.groupai
				slot9 = managers.groupai.state(slot8)

				if not next(managers.groupai.state(slot8).all_converted_enemies(slot8)) then
					slot7 = managers.groupai
					slot7 = managers.groupai.state(slot6)

					if managers.groupai.state(slot6).is_AI_enabled(slot6) then
						slot7 = managers.groupai
						slot7 = managers.groupai.state(slot6)

						if managers.groupai.state(slot6).bain_state(slot6) then
							slot8 = "cable_tie"
							local cable_tie_data = managers.player.has_special_equipment(slot6, managers.player)

							if cable_tie_data then
								slot10 = false
							else
								slot9 = true

								if self.get_criminal_to_trade(slot7, self) ~= nil then
								end
							end
						end
					end
				end
			end
		end

		slot8 = 120
		self._hostage_remind_t = t + math.random(slot6, 60)
	end

	self._trade_counter_tick = self._trade_counter_tick - dt

	if self._trade_counter_tick <= 0 then
		self._trade_counter_tick = self._trade_counter_tick + 1

		if self._hostage_to_trade then
			slot7 = self._hostage_to_trade.unit

			if not alive(slot6) then
				slot7 = self

				self.cancel_trade(slot6)
			end
		end

		slot7 = self._criminals_to_respawn

		for _, crim in ipairs(slot6) do
			slot13 = crim.id
			local criminal_unit = managers.criminals.character_unit_by_name(slot11, managers.criminals)
			slot13 = criminal_unit

			if alive(managers.criminals) then
				slot13 = criminal_unit

				if criminal_unit.unit_data(slot12) then
					slot13 = criminal_unit
					local teammate_panel_id = criminal_unit.unit_data(slot12).teammate_panel_id
				end

				slot14 = criminal_unit

				if criminal_unit.unit_data(slot13) then
					slot14 = criminal_unit
					local name_label_id = criminal_unit.unit_data(slot13).name_label_id
				end

				slot17 = name_label_id

				managers.hud.on_teammate_died(slot14, managers.hud, teammate_panel_id)
			end

			if 0 < crim.respawn_penalty then
			end
		end
	end

	if (self._trade_countdown or is_auto_assault_ai_trade) and is_trade_allowed then
		slot8 = true
		local trade = self.get_criminal_to_trade(slot6, self)
		slot8 = managers.groupai
		slot8 = managers.groupai.state(self)
		local is_ai_trade_possible = managers.groupai.state(self).is_ai_trade_possible(self)

		if trade and Global.game_settings.single_player and not trade.ai and not is_ai_trade_possible then
			trade = nil
		end

		if trade then
			slot9 = self

			self._increment_trade_index(slot8)

			if is_ai_trade_possible then
				slot10 = 1

				self.clbk_begin_hostage_trade_dialog(slot8, self)
			else
				slot11 = 5
				local respawn_t = self._t + math.random(slot9, 2)
				self._hostage_trade_clbk = "TradeManager"
				slot17 = 1

				managers.enemy.add_delayed_clbk(slot9, managers.enemy, self._hostage_trade_clbk, callback(respawn_t, self, self, "clbk_begin_hostage_trade_dialog"))
			end
		end
	end

	return 
end
function TradeManager:is_trade_allowed()
	slot3 = Network

	if Network.is_server(slot2) then
		if not self._trading_hostage and not self._hostage_trade_clbk and 0 < #self._criminals_to_respawn then
			slot3 = managers.groupai
			slot3 = managers.groupai.state(slot2)
		else
			slot1 = false

			if false then
				slot1 = true
			end
		end
	end

	return slot1
end
function TradeManager:_increment_trade_index()
	if 10000 < self._hostage_trade_index then
		self._hostage_trade_index = 1
	else
		self._hostage_trade_index = self._hostage_trade_index + 1
	end

	return 
end
function TradeManager:num_in_trade_queue()
	return #self._criminals_to_respawn
end
function TradeManager:get_criminal_to_trade(wait_for_player)
	local ai_crim, has_player = nil
	slot6 = self._criminals_to_respawn

	for _, crim in ipairs(slot5) do
		has_player = has_player or not crim.ai

		if crim.respawn_penalty <= 0 then
			if not crim.ai then
				return crim
			else
				ai_crim = ai_crim or crim
			end
		end
	end

	return (not wait_for_player or not has_player) and ai_crim
end
function TradeManager:sync_set_trade_death(criminal_name, respawn_penalty, hostages_killed, from_local)
	if not from_local then
		slot8 = criminal_name
		local crim_data = managers.criminals.character_data_by_name(slot6, managers.criminals)

		if not crim_data then
			return 
		end

		if crim_data.ai then
			slot11 = hostages_killed

			self.on_AI_criminal_death(slot7, self, criminal_name, respawn_penalty)
		else
			slot11 = hostages_killed

			self.on_player_criminal_death(slot7, self, criminal_name, respawn_penalty)
		end
	end

	slot8 = criminal_name

	self.play_custody_voice(slot6, self)

	slot7 = managers.criminals

	if managers.criminals.local_character_name(slot6) == criminal_name then
		slot7 = Network

		if not Network.is_server(slot6) then
			slot7 = game_state_machine

			if game_state_machine.current_state_name(slot6) == "ingame_waiting_for_respawn" then
				slot7 = game_state_machine
				slot9 = hostages_killed

				game_state_machine.current_state(slot6).trade_death(slot6, game_state_machine.current_state(slot6), respawn_penalty)
			end
		end
	end

	return 
end
function TradeManager:_announce_spawn(criminal_name)
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).bain_state(slot3) then
		return 
	end

	if criminal_name ~= nil then
		slot5 = criminal_name

		if managers.criminals.character_static_data_by_name(slot3, managers.criminals) ~= nil then
			slot5 = criminal_name

			if managers.criminals.character_static_data_by_name(slot3, managers.criminals).ssuffix ~= nil then
				slot5 = criminal_name
				slot2 = managers.criminals.character_static_data_by_name(slot3, managers.criminals).ssuffix
			end
		end
	end

	return 
end
function TradeManager:sync_set_trade_spawn(criminal_name)
	slot5 = criminal_name
	local crim_data = managers.criminals.character_data_by_name(slot3, managers.criminals)
	slot6 = criminal_name

	self._announce_spawn(managers.criminals, self)

	self._num_trades = self._num_trades + 1

	if crim_data then
		slot6 = crim_data.mugshot_id

		managers.hud.set_mugshot_normal(slot4, managers.hud)
	end

	slot5 = self._criminals_to_respawn

	for i, crim in ipairs(slot4) do
		if crim.id == criminal_name then
			slot11 = i

			table.remove(slot9, self._criminals_to_respawn)

			break
		end
	end

	return 
end
function TradeManager:sync_set_trade_replace(replace_ai, criminal_name1, criminal_name2, respawn_penalty)
	if replace_ai then
		slot10 = respawn_penalty

		self.replace_ai_with_player(slot6, self, criminal_name1, criminal_name2)
	else
		slot10 = respawn_penalty

		self.replace_player_with_ai(slot6, self, criminal_name1, criminal_name2)
	end

	return 
end
function TradeManager:play_custody_voice(criminal_name)
	slot4 = managers.criminals

	if managers.criminals.local_character_name(slot3) == criminal_name then
		return 
	end

	if #self._criminals_to_respawn == 3 then
		local criminal_left = nil
		slot7 = managers.groupai
		slot7 = managers.groupai.state(slot6)

		for _, crim_data in pairs(managers.groupai.state(slot6).all_char_criminals(slot6)) do
			slot10 = crim_data.unit
			slot10 = crim_data.unit.movement(slot9)

			if not crim_data.unit.movement(slot9).downed(slot9) then
				slot11 = crim_data.unit
				criminal_left = managers.criminals.character_name_by_unit(slot9, managers.criminals)

				break
			end
		end

		slot5 = managers.criminals

		if managers.criminals.local_character_name(slot4) == criminal_left then
			slot7 = true

			managers.achievment.set_script_data(slot4, managers.achievment, "last_man_standing")

			slot5 = managers.groupai
			slot5 = managers.groupai.state(slot4)

			if managers.groupai.state(slot4).bain_state(slot4) then
				slot6 = criminal_left
				slot3 = managers.criminals.character_static_data_by_name(slot4, managers.criminals).ssuffix
			end

			return 
		end
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if managers.groupai.state(slot3).bain_state(slot3) then
		slot5 = criminal_name
		slot2 = managers.criminals.character_static_data_by_name(slot3, managers.criminals).ssuffix
	end

	return 
end
function TradeManager:on_AI_criminal_death(criminal_name, respawn_penalty, hostages_killed, skip_netsend)
	slot11 = skip_netsend

	print(slot6, "[TradeManager:on_AI_criminal_death]", criminal_name, respawn_penalty, hostages_killed)

	if not managers.hud then
		return 
	end

	slot8 = criminal_name
	local criminal_unit = managers.criminals.character_unit_by_name(slot6, managers.criminals)
	slot8 = criminal_unit

	if alive(managers.criminals) then
		slot8 = criminal_unit

		if criminal_unit.unit_data(slot7) then
			slot8 = criminal_unit
			local teammate_panel_id = criminal_unit.unit_data(slot7).teammate_panel_id
		end

		slot9 = criminal_unit

		if criminal_unit.unit_data(slot8) then
			slot9 = criminal_unit
			local name_label_id = criminal_unit.unit_data(slot8).name_label_id
		end

		slot12 = name_label_id

		managers.hud.on_teammate_died(slot9, managers.hud, teammate_panel_id)
	end

	local crim = {
		ai = true,
		id = criminal_name,
		respawn_penalty = respawn_penalty,
		hostages_killed = hostages_killed
	}
	slot10 = crim

	table.insert(slot8, self._criminals_to_respawn)

	slot9 = Network

	if Network.is_server(slot8) and not skip_netsend then
		slot9 = managers.network
		slot13 = hostages_killed

		managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "set_trade_death", criminal_name, respawn_penalty)

		slot13 = true

		self.sync_set_trade_death(slot8, self, criminal_name, respawn_penalty, hostages_killed)
	end

	return crim
end
function TradeManager:on_player_criminal_death(criminal_name, respawn_penalty, hostages_killed, skip_netsend)
	slot7 = self._criminals_to_respawn

	for _, crim in ipairs(slot6) do
		if crim.id == criminal_name then
			slot14 = criminal_name

			Application.debug(slot11, Application, "[TradeManager:on_player_criminal_death] criminal already dead")

			return 
		end
	end

	if tweak_data.player.damage.automatic_respawn_time then
		slot8 = tweak_data.player.damage.automatic_respawn_time
		respawn_penalty = math.min(slot6, respawn_penalty)
	end

	slot8 = criminal_name
	local crim_data = managers.criminals.character_data_by_name(slot6, managers.criminals)

	if crim_data then
		if managers.hud then
			slot9 = crim_data.mugshot_id

			managers.hud.set_mugshot_custody(slot7, managers.hud)
		else
			slot9 = criminal_name

			debug_pause(slot7, "[TradeManager:on_player_criminal_death] no hud manager! criminal_name:")
		end
	end

	slot9 = criminal_name
	local peer_id = managers.criminals.character_peer_id_by_name(slot7, managers.criminals)
	local crim = {
		ai = false,
		id = criminal_name,
		respawn_penalty = respawn_penalty,
		hostages_killed = hostages_killed,
		peer_id = peer_id
	}
	local inserted = false
	slot11 = self._criminals_to_respawn

	for i, crim_to_respawn in ipairs(slot10) do
		if crim_to_respawn.ai or respawn_penalty < crim_to_respawn.respawn_penalty then
			slot18 = crim

			table.insert(slot15, self._criminals_to_respawn, i)

			inserted = true

			break
		end
	end

	if not inserted then
		slot12 = crim

		table.insert(slot10, self._criminals_to_respawn)
	end

	slot11 = Network

	if Network.is_server(slot10) and not skip_netsend then
		slot11 = managers.network
		slot15 = hostages_killed

		managers.network.session(slot10).send_to_peers_synched(slot10, managers.network.session(slot10), "set_trade_death", criminal_name, respawn_penalty)

		slot15 = true

		self.sync_set_trade_death(slot10, self, criminal_name, respawn_penalty, hostages_killed)
	end

	slot13 = ". Respawn queue:"

	print(slot10, "[TradeManager:on_player_criminal_death]", criminal_name)

	slot11 = self._criminals_to_respawn

	for i, crim_to_respawn in ipairs(slot10) do
		slot18 = crim_to_respawn

		print(inspect(slot17))
	end

	slot12 = criminal_name

	self.on_player_criminal_removed(slot10, self)

	return crim
end
function TradeManager:set_trade_countdown(enabled)
	self._trade_countdown = enabled
	slot4 = Network

	if Network.is_server(slot3) and managers.network then
		slot4 = managers.network
		slot6 = enabled

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "set_trade_countdown")
	end

	return 
end
function TradeManager:replace_ai_with_player(ai_criminal, player_criminal, new_respawn_penalty)
	local first_crim = self._criminals_to_respawn[1]

	if first_crim and first_crim.id == ai_criminal then
		slot7 = self

		self.cancel_trade(slot6)
	end

	local respawn_penalty, hostages_killed = nil
	slot9 = self._criminals_to_respawn

	for i, c in ipairs(slot8) do
		if c.id == ai_criminal then
			respawn_penalty = new_respawn_penalty or c.respawn_penalty
			hostages_killed = c.hostages_killed
			slot15 = i

			table.remove(slot13, self._criminals_to_respawn)

			break
		end
	end

	if respawn_penalty then
		if respawn_penalty <= 0 then
			respawn_penalty = 1
		end

		slot13 = true

		return self.on_player_criminal_death(slot8, self, player_criminal, respawn_penalty, hostages_killed)
	end

	return 
end
function TradeManager:replace_player_with_ai(player_criminal, ai_criminal, new_respawn_penalty)
	local first_crim = self._criminals_to_respawn[1]

	if first_crim and first_crim.id == player_criminal then
		slot7 = self

		self.cancel_trade(slot6)
	end

	local respawn_penalty, hostages_killed = nil
	slot9 = self._criminals_to_respawn

	for i, c in ipairs(slot8) do
		if c.id == player_criminal then
			respawn_penalty = new_respawn_penalty or c.respawn_penalty
			hostages_killed = c.hostages_killed
			slot17 = hostages_killed

			print(slot13, "replacing player in custody. respawn_penalty", respawn_penalty, ". hostages_killed")

			slot15 = i

			table.remove(slot13, self._criminals_to_respawn)

			break
		end
	end

	if respawn_penalty then
		if respawn_penalty <= 0 then
			respawn_penalty = 1
		end

		slot9 = "managers.criminals:nr_AI_criminals()"
		slot12 = managers.criminals

		print(slot8, managers.criminals.nr_AI_criminals(slot11))

		slot9 = managers.groupai
		slot9 = managers.groupai.state(slot8)

		if managers.groupai.state(slot8).team_ai_enabled(slot8) then
			slot9 = managers.groupai
			slot9 = managers.groupai.state(slot8)

			if managers.groupai.state(slot8).is_AI_enabled(slot8) then
				slot9 = managers.criminals

				if managers.criminals.nr_AI_criminals(slot8) <= CriminalsManager.MAX_NR_TEAM_AI then
					slot13 = true

					return self.on_AI_criminal_death(slot8, self, ai_criminal, respawn_penalty, hostages_killed)
				end
			end
		end
	end

	return 
end
function TradeManager:on_player_criminal_removed(player_criminal)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot5 = player_criminal
	local peer_id = managers.criminals.character_peer_id_by_name(slot3, managers.criminals)
	local is_players_alive = false
	slot8 = managers.groupai
	slot8 = managers.groupai.state(slot7)

	for u_key, u_data in pairs(managers.groupai.state(slot7).all_player_criminals(slot7)) do
		slot11 = managers.network
		slot12 = u_data.unit
		local peer = managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10))

		if u_data.status ~= "dead" and peer then
			slot12 = peer

			if peer.id(slot11) ~= peer_id then
				is_players_alive = true
			end
		end
	end

	if not is_players_alive then
		slot6 = self

		self.cancel_trade(slot5)
	end

	return 
end
function TradeManager:remove_from_trade(criminal)
	local first_crim = self._criminals_to_respawn[1]

	if first_crim and first_crim.id == criminal then
		slot5 = self

		self.cancel_trade(slot4)
	end

	slot5 = self._criminals_to_respawn

	for i, c in ipairs(slot4) do
		if c.id == criminal then
			slot11 = i

			table.remove(slot9, self._criminals_to_respawn)

			break
		end
	end

	return 
end
function TradeManager:remove_all_criminals_to_respawn()
	self._criminals_to_respawn = {}

	return 
end
function TradeManager:_send_finish_trade(criminal, respawn_delay, hostages_killed)
	if criminal.ai == true then
		return 
	end

	slot7 = criminal.id
	local peer_id = managers.criminals.character_peer_id_by_name(slot5, managers.criminals)

	if peer_id == 1 then
		slot7 = game_state_machine

		if game_state_machine.current_state_name(slot6) == "ingame_waiting_for_respawn" then
			slot7 = game_state_machine
			slot7 = game_state_machine.current_state(slot6)

			game_state_machine.current_state(slot6).finish_trade(slot6)
		end
	else
		slot7 = managers.network
		slot8 = peer_id
		local peer = managers.network.session(slot6).peer(slot6, managers.network.session(slot6))

		if peer then
			slot9 = "finish_trade"

			peer.send_queued_sync(slot7, peer)
		end
	end

	return 
end
function TradeManager:_send_begin_trade(criminal)
	if criminal.ai == true then
		return 
	end

	slot5 = criminal.id
	local peer_id = managers.criminals.character_peer_id_by_name(slot3, managers.criminals)

	if peer_id == 1 then
		slot5 = game_state_machine

		if game_state_machine.current_state_name(slot4) == "ingame_waiting_for_respawn" then
			slot5 = game_state_machine
			slot5 = game_state_machine.current_state(slot4)

			game_state_machine.current_state(slot4).begin_trade(slot4)
		end
	else
		slot5 = managers.network
		slot6 = peer_id
		local peer = managers.network.session(slot4).peer(slot4, managers.network.session(slot4))

		if peer then
			slot7 = "begin_trade"

			peer.send_queued_sync(slot5, peer)
		end
	end

	return 
end
function TradeManager:_send_cancel_trade(criminal)
	if criminal.ai == true then
		return 
	end

	slot5 = criminal.id
	local peer_id = managers.criminals.character_peer_id_by_name(slot3, managers.criminals)
	slot5 = managers.network
	slot5 = managers.network.session(managers.criminals)
	slot5 = managers.network.session(managers.criminals).local_peer(managers.criminals)

	if peer_id == managers.network.session(managers.criminals).local_peer(managers.criminals).id(managers.criminals) then
		slot5 = game_state_machine

		if game_state_machine.current_state_name(slot4) == "ingame_waiting_for_respawn" then
			slot5 = game_state_machine
			slot5 = game_state_machine.current_state(slot4)

			game_state_machine.current_state(slot4).cancel_trade(slot4)
		end
	else
		slot5 = managers.network
		slot6 = peer_id
		local peer = managers.network.session(slot4).peer(slot4, managers.network.session(slot4))

		if peer then
			slot7 = "cancel_trade"

			peer.send_queued_sync(slot5, peer)
		end
	end

	return 
end
function TradeManager:change_hostage()
	slot4 = 6

	self.sync_hostage_trade_dialog(slot2, self)

	slot3 = managers.network
	slot5 = 6

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "hostage_trade_dialog")

	slot3 = self

	self.cancel_trade(slot2)

	return 
end
function TradeManager:cancel_trade()
	if self._hostage_trade_clbk then
		slot4 = self._hostage_trade_clbk

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._hostage_trade_clbk = nil
	end

	slot3 = self

	self._increment_trade_index(slot2)

	self._trading_hostage = nil
	slot4 = false
	local criminal = self.get_criminal_to_trade(slot2, self)

	if criminal then
		slot5 = criminal

		self._send_cancel_trade(slot3, self)
	end

	if self._hostage_to_trade then
		slot4 = self._hostage_to_trade.unit

		if alive(slot3) then
			slot4 = self._hostage_to_trade.unit
			slot4 = self._hostage_to_trade.unit.character_damage(slot3)

			if not self._hostage_to_trade.unit.character_damage(slot3).dead(slot3) then
				slot4 = self._hostage_to_trade.unit
				slot4 = self._hostage_to_trade.unit.brain(slot3)

				self._hostage_to_trade.unit.brain(slot3).cancel_trade(slot3)
			end
		end

		if self._hostage_to_trade.death_clbk_key then
			slot4 = self._hostage_to_trade.unit
			slot5 = self._hostage_to_trade.death_clbk_key

			self._hostage_to_trade.unit.character_damage(slot3).remove_listener(slot3, self._hostage_to_trade.unit.character_damage(slot3))
		end

		if self._hostage_to_trade.destroyed_clbk_key then
			slot4 = self._hostage_to_trade.unit
			slot5 = self._hostage_to_trade.destroyed_clbk_key

			self._hostage_to_trade.unit.base(slot3).remove_destroy_listener(slot3, self._hostage_to_trade.unit.base(slot3))
		end

		self._hostage_to_trade = nil
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	managers.groupai.state(slot3).check_gameover_conditions(slot3)

	return 
end
function TradeManager:_get_megaphone_sound_source()
	local level_id = Global.level_data.level_id
	local pos = nil

	if not level_id then
		slot7 = 0
		pos = Vector3(slot4, 0, 0)
		slot6 = "[TradeManager:_get_megaphone_sound_source] This level has no megaphone position!"

		Application.error(slot4, Application)
	elseif not tweak_data.levels[level_id].megaphone_pos then
		slot7 = 0
		pos = Vector3(slot4, 0, 0)
	else
		pos = tweak_data.levels[level_id].megaphone_pos
	end

	slot6 = "megaphone"
	local sound_source = SoundDevice.create_source(slot4, SoundDevice)
	slot7 = pos

	sound_source.set_position(SoundDevice, sound_source)

	return sound_source
end
function TradeManager:sync_hostage_trade_dialog(i)

	-- Decompilation error in this vicinity:
	slot4 = game_state_machine

	if i == 1 then
		slot4 = self
		slot5 = "mga_t01a_con_plu"

		self._get_megaphone_sound_source(slot3).post_event(slot3, self._get_megaphone_sound_source(slot3))
	elseif i == 2 then
	elseif i == 3 then
	elseif i == 4 then
	elseif i == 5 then
	elseif i == 6 then
	elseif i == 7 then
	end

	return 
end
function TradeManager:clbk_vo_end_begin_hostage_trade_dialog(data)
	if data.hostage_trade_index ~= self._hostage_trade_index then
		return 
	end

	self._speaker_snd_event = nil
	slot5 = data.i

	self.clbk_begin_hostage_trade_dialog(slot3, self)

	return 
end
function TradeManager:clbk_begin_hostage_trade_dialog(i)
	self._hostage_trade_clbk = nil
	slot5 = false
	local respawn_criminal = self.get_criminal_to_trade(slot3, self)

	if not respawn_criminal then
		slot5 = managers.groupai
		slot5 = managers.groupai.state(slot4)

		managers.groupai.state(slot4).check_gameover_conditions(slot4)

		return 
	end

	local char_sync_index = i

	if i == 1 then
		slot6 = self
		self._megaphone_sound_source = self._get_megaphone_sound_source(slot5)
		slot13 = {
			i = 2,
			hostage_trade_index = self._hostage_trade_index
		}
		slot10 = "end_of_event"
		self._speaker_snd_event = self._megaphone_sound_source.post_event(slot5, self._megaphone_sound_source, "mga_t01a_con_plu", callback(slot9, self, self, "clbk_vo_end_begin_hostage_trade_dialog"), nil)

		if not self._speaker_snd_event then
			slot7 = 2

			self.clbk_begin_hostage_trade_dialog(slot5, self)

			slot6 = "Megaphone fail"

			print(slot5)
		end
	else
		slot7 = respawn_criminal.id
		local ssuffix = managers.criminals.character_static_data_by_name(slot5, managers.criminals).ssuffix

		if ssuffix == "a" then
			char_sync_index = 2
		elseif ssuffix == "b" then
			char_sync_index = 3
		elseif ssuffix == "c" then
			char_sync_index = 4
		elseif ssuffix == "d" then
			char_sync_index = 5
		else
			char_sync_index = 7
		end

		slot8 = char_sync_index

		self.sync_hostage_trade_dialog(slot6, self)

		local respawn_t = self._t + self.TRADE_DELAY
		self._hostage_trade_clbk = "TradeManager"
		slot14 = "clbk_begin_hostage_trade"

		managers.enemy.add_delayed_clbk(self, managers.enemy, self._hostage_trade_clbk, callback(respawn_t, self, self))
	end

	slot6 = managers.network
	slot8 = char_sync_index

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "hostage_trade_dialog")

	return 
end
function TradeManager:clbk_begin_hostage_trade()
	self._hostage_trade_clbk = nil

	self._send_begin_trade(slot2, self)

	slot3 = self
	local possible_criminals, is_instant_trade = self.get_possible_criminals(slot2)
	slot6 = #possible_criminals
	local rescuing_criminal = possible_criminals[math.random(self._criminals_to_respawn[1], 1)]
	slot6 = managers.groupai
	slot6 = managers.groupai.state(1)
	rescuing_criminal = managers.groupai.state(1).all_criminals(1)[rescuing_criminal]
	local rescuing_criminal_pos = nil

	if rescuing_criminal then
		rescuing_criminal_pos = rescuing_criminal.m_pos
	else
		slot7 = managers.groupai
		slot7 = managers.groupai.state(slot6)

		managers.groupai.state(slot6).check_gameover_conditions(slot6)

		slot13 = "clbk_begin_hostage_trade"

		managers.enemy.add_delayed_clbk(slot6, managers.enemy, self._hostage_trade_clbk, callback(self._t + 5, self, self))

		return 
	end

	slot8 = rescuing_criminal_pos
	local best_hostage = self.get_best_hostage(slot6, self)

	if best_hostage then
		self._trading_hostage = true
		self._hostage_to_trade = best_hostage
		slot8 = best_hostage.unit
		slot9 = "trade"

		best_hostage.unit.brain(slot7).set_logic(slot7, best_hostage.unit.brain(slot7))

		local clbk_key = "TradeManager"
		self._hostage_to_trade.death_clbk_key = clbk_key
		self._hostage_to_trade.destroyed_clbk_key = clbk_key
		slot9 = best_hostage.unit
		slot11 = {
			"death"
		}
		slot16 = "clbk_hostage_died"

		best_hostage.unit.character_damage(best_hostage.unit.brain(slot7)).add_listener(best_hostage.unit.brain(slot7), best_hostage.unit.character_damage(best_hostage.unit.brain(slot7)), clbk_key, callback(slot13, self, self))

		slot9 = best_hostage.unit
		slot10 = clbk_key
		slot15 = "clbk_hostage_destroyed"

		best_hostage.unit.base(best_hostage.unit.brain(slot7)).add_destroy_listener(best_hostage.unit.brain(slot7), best_hostage.unit.base(best_hostage.unit.brain(slot7)), callback(callback, self, self))

		if is_instant_trade then
			self._auto_assault_ai_trade_t = nil
			slot9 = best_hostage.unit
			slot10 = rescuing_criminal.unit

			best_hostage.unit.interaction(slot8).interact(slot8, best_hostage.unit.interaction(slot8))
		end

		if not rescuing_criminal then
		end
	else
		slot8 = self

		self.cancel_trade(slot7)
	end

	return 
end
function TradeManager:get_best_hostage(pos)
	slot4 = managers.enemy
	local civilians = managers.enemy.all_civilians(slot3)
	local trade_dist = tweak_data.group_ai.optimal_trade_distance
	slot7 = trade_dist[2]
	local optimal_trade_dist = math.random(slot5, trade_dist[1])
	optimal_trade_dist = optimal_trade_dist * optimal_trade_dist
	local best_hostage_d, best_hostage = nil
	slot11 = managers.groupai
	slot11 = managers.groupai.state(slot10)

	for _, h_key in ipairs(managers.groupai.state(slot10).all_hostages(slot10)) do
		local civ = civilians[h_key]

		if civ then
			slot15 = civ.unit
			slot15 = civ.unit.character_damage(slot14)

			if civ.unit.character_damage(slot14).pickup(slot14) then
				civ = nil
			end
		end

		if not civ then
			slot15 = managers.enemy
			local hostage = managers.enemy.all_enemies(slot14)[h_key]
		end

		if hostage then
			slot19 = pos
			slot16 = mvector3.distance_sq(slot17, hostage.m_pos) - optimal_trade_dist
			local d = math.abs(slot15)

			if civ then
				d = d * 0.5
			end

			if not best_hostage_d or d < best_hostage_d then
				best_hostage_d = d
				best_hostage = hostage
			end
		end
	end

	if not best_hostage then
		slot11 = managers.groupai
		slot11 = managers.groupai.state(slot10)

		for u_key, unit in pairs(managers.groupai.state(slot10).all_converted_enemies(slot10)) do
			slot14 = managers.enemy
			best_hostage = managers.enemy.all_enemies(slot13)[u_key]
		end
	end

	return best_hostage
end
function TradeManager:clbk_hostage_destroyed(hostage_unit)
	if not self._hostage_to_trade or not self._hostage_to_trade.destroyed_clbk_key then
		return 
	end

	self._hostage_to_trade.destroyed_clbk_key = nil
	slot4 = self

	self.cancel_trade(nil)

	return 
end
function TradeManager:clbk_hostage_died(hostage_unit, damage_info)
	if not self._hostage_to_trade or not self._hostage_to_trade.death_clbk_key then
		return 
	end

	self._hostage_to_trade.death_clbk_key = nil
	slot5 = self

	self.cancel_trade(nil)

	return 
end
function TradeManager:on_hostage_traded(trading_unit)
	slot4 = "RC: Traded hostage!!"

	print(slot3)

	if self._criminal_respawn_clbk then
		return 
	end

	self._hostage_to_trade = nil
	local respawn_criminal = self.get_criminal_to_trade(slot3, self)
	local respawn_delay = respawn_criminal.respawn_penalty
	slot9 = respawn_criminal.hostages_killed

	self._send_finish_trade(false, self, respawn_criminal, respawn_delay)

	local respawn_t = self._t + 2
	local clbk_id = "Respawn_criminal_on_trade"
	self._criminal_respawn_clbk = clbk_id
	slot15 = trading_unit

	managers.enemy.add_delayed_clbk(respawn_criminal, managers.enemy, clbk_id, callback(respawn_t, self, self, "clbk_respawn_criminal"))

	return 
end
function TradeManager:clbk_respawn_criminal(trading_unit)
	self._criminal_respawn_clbk = nil
	self._trading_hostage = nil
	local spawn_on_unit = trading_unit
	slot5 = spawn_on_unit

	if not alive(slot4) then
		local possible_criminals = {}
		slot8 = managers.groupai
		slot8 = managers.groupai.state(slot7)

		for u_key, u_data in pairs(managers.groupai.state(slot7).all_char_criminals(slot7)) do
			if u_data.status ~= "dead" then
				slot12 = u_data.unit

				table.insert(slot10, possible_criminals)
			end
		end

		if #possible_criminals <= 0 then
			return 
		end

		slot7 = #possible_criminals
		spawn_on_unit = possible_criminals[math.random(slot5, 1)]
	end

	slot6 = false
	local respawn_criminal = self.get_criminal_to_trade(slot4, self)

	if not respawn_criminal then
		return 
	end

	slot6 = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

	print(slot5)

	slot4 = print
	slot6 = "Found criminal to respawn "

	if respawn_criminal then
		slot9 = respawn_criminal
		slot7 = inspect(slot8)
	end

	slot4(slot5, slot6)

	slot6 = self._criminals_to_respawn

	for i, crim in ipairs(slot5) do
		if crim == respawn_criminal then
			slot11 = "Removing from list"

			print(slot10)

			slot12 = i

			table.remove(slot10, self._criminals_to_respawn)

			break
		end
	end

	self._num_trades = self._num_trades + 1
	slot6 = managers.network
	slot8 = respawn_criminal.id

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "set_trade_spawn")

	slot7 = respawn_criminal.id

	self._announce_spawn(slot5, self)

	local spawned_unit = nil

	if respawn_criminal.ai then
		slot8 = respawn_criminal.id

		print(slot6, "RC: respawn AI")

		slot7 = managers.groupai
		slot10 = spawn_on_unit
		spawned_unit = managers.groupai.state(slot6).spawn_one_teamAI(slot6, managers.groupai.state(slot6), false, respawn_criminal.id)
	else
		print(slot6, "RC: respawn human")

		local sp_id = "clbk_respawn_criminal"
		local spawn_point = {}
		slot9 = spawn_on_unit
		spawn_point.position = spawn_on_unit.position(respawn_criminal.id)
		slot9 = spawn_on_unit
		spawn_point.rotation = spawn_on_unit.rotation(respawn_criminal.id)
		slot11 = spawn_point

		managers.network.register_spawn_point(respawn_criminal.id, managers.network, sp_id)

		slot10 = respawn_criminal.id
		local peer_id = managers.criminals.character_peer_id_by_name(respawn_criminal.id, managers.criminals)
		slot10 = managers.network
		slot13 = true
		spawned_unit = managers.network.session(managers.criminals).spawn_member_by_id(managers.criminals, managers.network.session(managers.criminals), peer_id, sp_id)
		slot11 = sp_id

		managers.network.unregister_spawn_point(managers.criminals, managers.network)
	end

	slot7 = spawned_unit

	if alive(slot6) then
		slot7 = trading_unit

		if alive(slot6) then
			slot10 = 1

			self.sync_teammate_helped_hint(slot6, self, spawned_unit, trading_unit)

			slot7 = managers.network
			slot11 = trading_unit

			managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_teammate_helped_hint", 1, spawned_unit)
		end
	end

	return 
end
function TradeManager:sync_teammate_helped_hint(helped_unit, helping_unit, hint)

	-- Decompilation error in this vicinity:
	slot6 = helped_unit
	slot6 = managers.criminals
	slot9 = managers.criminals
	local local_unit = managers.criminals.character_unit_by_name(slot5, managers.criminals.local_character_name(slot8))
	local hint_id = "teammate"

	if local_unit == helped_unit then
		hint_id = "you_were"
	elseif local_unit == helping_unit then
		hint_id = "you"
	end

	if not hint or hint == 1 then
		hint_id = hint_id .. "_revived"
	elseif hint == 2 then
		hint_id = hint_id .. "_helpedup"
	elseif hint == 3 then
		hint_id = hint_id .. "_rescued"
	end

	hint_id = "hint_" .. hint_id

	if hint_id then
		slot10 = {
			TEAMMATE = helped_unit.base(slot12).nick_name(slot12),
			HELPER = helping_unit.base(slot12).nick_name(slot12)
		}
		slot13 = helped_unit
		slot13 = helped_unit.base(slot12)
		slot13 = helping_unit
		slot13 = helping_unit.base(slot12)
		local notification_text = managers.localization.text(slot7, managers.localization, hint_id)
		slot10 = {
			duration = 3,
			shelf_life = 5,
			id = hint_id,
			text = notification_text
		}

		managers.notification.add_notification(managers.localization, managers.notification)
	end

	return 
end
function TradeManager:update_auto_assault_ai_trade(dt, is_trade_allowed)

	-- Decompilation error in this vicinity:
	if self._auto_assault_ai_trade_t then
		self._auto_assault_ai_trade_t = self._auto_assault_ai_trade_t - dt
	end

	slot5 = Network

	if not Network.is_server(slot4) then
		return false
	end

	slot5 = self
	local min_crim = self.get_min_criminal_to_trade(slot4)

	if not min_crim then
		slot7 = "AI trade possible even though no one to trade.\n"
		slot10 = self._criminals_to_respawn

		Application.error(slot5, Application, inspect(slot9))

		return false
	end

	if not self._auto_assault_ai_trade_t then
		self._auto_assault_ai_trade_t = tweak_data.player.damage.automatic_assault_ai_trade_time
	end

	slot8 = min_crim.respawn_penalty
	local time = self._auto_assault_ai_trade_t + math.max(slot6, 0)
	slot8 = tweak_data.player.damage.automatic_assault_ai_trade_time_max
	time = math.min(slot6, time)
	slot9 = time

	self._set_auto_assault_ai_trade(slot6, self, min_crim.id)

	return time <= self.TRADE_DELAY
end
function TradeManager:get_min_criminal_to_trade()
	local min_crim = nil
	slot4 = self._criminals_to_respawn

	for _, crim in ipairs(slot3) do
		if not crim.ai and (not min_crim or crim.respawn_penalty < min_crim.respawn_penalty) then
			min_crim = crim
		end
	end

	return min_crim
end
function TradeManager:_set_auto_assault_ai_trade(character_name, time)
	if self._auto_assault_ai_trade_criminal_name ~= character_name then
		self._auto_assault_ai_trade_criminal_name = character_name

		if managers.network and not Global.game_settings.single_player then
			slot5 = managers.network
			slot8 = time

			managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "set_auto_assault_ai_trade", character_name)
		end
	end

	return 
end
function TradeManager:sync_set_auto_assault_ai_trade(character_name, time)
	self._auto_assault_ai_trade_criminal_name = character_name
	self._auto_assault_ai_trade_t = time

	return 
end
function TradeManager:get_auto_assault_ai_trade_time()
	if not self._trade_countdown then
		slot3 = managers.criminals
	else
		return nil
	end

	return 
end
function TradeManager:get_possible_criminals()
	local possible_criminals = {}
	slot6 = managers.groupai
	slot6 = managers.groupai.state(slot5)

	for u_key, u_data in pairs(managers.groupai.state(slot5).all_player_criminals(slot5)) do
		if u_data.status ~= "dead" then
			slot10 = u_key

			table.insert(slot8, possible_criminals)
		end
	end

	local is_instant_trade = nil

	if #possible_criminals == 0 then
		is_instant_trade = true
		slot7 = managers.groupai
		slot7 = managers.groupai.state(slot6)

		for u_key, u_data in pairs(managers.groupai.state(slot6).all_AI_criminals(slot6)) do
			if u_data.status ~= "dead" and u_data.status ~= "disabled" then
				slot11 = u_key

				table.insert(slot9, possible_criminals)
			end
		end
	end

	return possible_criminals, is_instant_trade
end
function TradeManager:get_guard_hostage_time()
	slot3 = self
	local min_crim = self.get_min_criminal_to_trade(slot2)
	local penalty = (min_crim and min_crim.respawn_penalty) or 0
	local guard_time = (self._auto_assault_ai_trade_t or 0) + penalty
	local automatic_respawn_time = tweak_data.player.damage.automatic_respawn_time

	if automatic_respawn_time then
		slot8 = guard_time

		return math.min(slot6, automatic_respawn_time)
	else
		return guard_time
	end

	return 
end

return 
