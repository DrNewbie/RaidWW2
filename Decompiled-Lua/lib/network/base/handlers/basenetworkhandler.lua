BaseNetworkHandler = BaseNetworkHandler or class()
BaseNetworkHandler._gamestate_filter = {
	any_ingame = {
		ingame_access_camera = true,
		ingame_incapacitated = true,
		ingame_driving = true,
		ingame_freefall = true,
		ingame_loading = true,
		event_complete_screen = true,
		ingame_electrified = true,
		ingame_fatal = true,
		gameoverscreen = true,
		ingame_special_interaction = true,
		world_camera = true,
		ingame_bleed_out = true,
		ingame_parachuting = true,
		ingame_standard = true,
		ingame_waiting_for_respawn = true,
		ingame_waiting_for_players = true,
		ingame_menu = true
	},
	any_ingame_playing = {
		ingame_access_camera = true,
		ingame_electrified = true,
		ingame_driving = true,
		ingame_standard = true,
		ingame_incapacitated = true,
		event_complete_screen = true,
		ingame_waiting_for_respawn = true,
		ingame_fatal = true,
		ingame_freefall = true,
		ingame_special_interaction = true,
		world_camera = true,
		ingame_parachuting = true,
		gameoverscreen = true,
		ingame_menu = true,
		ingame_bleed_out = true
	},
	any_ingame_mission = {
		ingame_access_camera = true,
		ingame_electrified = true,
		ingame_driving = true,
		ingame_standard = true,
		ingame_incapacitated = true,
		ingame_parachuting = true,
		ingame_waiting_for_respawn = true,
		ingame_fatal = true,
		ingame_freefall = true,
		ingame_special_interaction = true,
		ingame_bleed_out = true
	},
	downed = {
		ingame_incapacitated = true,
		ingame_bleed_out = true,
		ingame_fatal = true
	},
	need_revive = {
		ingame_incapacitated = true,
		ingame_arrested = true,
		ingame_bleed_out = true,
		ingame_fatal = true
	},
	arrested = {
		ingame_arrested = true
	},
	game_over = {
		gameoverscreen = true
	},
	any_end_game = {
		victoryscreen = true,
		gameoverscreen = true,
		event_complete_screen = true
	},
	waiting_for_players = {
		ingame_waiting_for_players = true
	},
	waiting_for_respawn = {
		ingame_waiting_for_respawn = true
	},
	menu = {
		menu_main = true,
		ingame_menu = true
	},
	player_slot = {
		ingame_lobby_menu = true,
		menu_main = true,
		ingame_waiting_for_players = true
	},
	lobby = {
		menu_main = true,
		ingame_lobby_menu = true
	}
}
function BaseNetworkHandler._verify_in_session()
	slot2 = managers.network
	local session = managers.network.session(slot1)

	if not session then
		slot3 = "[BaseNetworkHandler._verify_in_session] Discarding message"

		print(slot2)

		slot3 = Application

		Application.stack_dump(slot2)
	end

	return session
end
function BaseNetworkHandler._verify_in_server_session()
	slot2 = managers.network
	local session = managers.network.session(slot1)

	if session then
		slot3 = session
		session = session.is_host(slot2)
	end

	if not session then
		slot3 = "[BaseNetworkHandler._verify_in_server_session] Discarding message"

		print(slot2)

		slot3 = Application

		Application.stack_dump(slot2)
	end

	return session
end
function BaseNetworkHandler._verify_in_client_session()
	slot2 = managers.network
	local session = managers.network.session(slot1)

	if session then
		slot3 = session
		session = session.is_client(slot2)
	end

	if not session then
		slot3 = "[BaseNetworkHandler._verify_in_client_session] Discarding message"

		print(slot2)

		slot3 = Application

		Application.stack_dump(slot2)
	end

	return session
end
function BaseNetworkHandler._verify_sender(rpc)
	slot3 = managers.network
	local session = managers.network.session(slot2)
	local peer = nil

	if session then
		slot6 = 0

		if rpc.protocol_at_index(slot4, rpc) == "STEAM" then
			slot5 = session
			slot9 = 0
			peer = session.peer_by_user_id(slot4, rpc.ip_at_index(slot7, rpc))
		else
			slot5 = session
			slot9 = 0
			peer = session.peer_by_ip(slot4, rpc.ip_at_index(slot7, rpc))
		end

		if peer then
			return peer
		end
	end

	slot3 = print
	slot5 = "[BaseNetworkHandler._verify_sender] Discarding message"
	slot6 = session

	if peer then
		slot9 = peer
		slot7 = peer.id(slot8)
	end

	slot3(slot4, slot5, slot6)

	slot5 = Application

	Application.stack_dump(slot4)

	return 
end
function BaseNetworkHandler._verify_character_and_sender(unit, rpc)
	slot4 = rpc

	if BaseNetworkHandler._verify_sender(slot3) then
		slot4 = unit
		slot2 = BaseNetworkHandler._verify_character(slot3)
	end

	return slot2
end
function BaseNetworkHandler._verify_character(unit)
	slot3 = unit

	if alive(slot2) then
		slot3 = unit
		slot3 = unit.character_damage(slot2)
		slot1 = not unit.character_damage(slot2).dead(slot2)
	end

	return slot1
end
function BaseNetworkHandler._verify_gamestate(acceptable_gamestates)
	slot3 = game_state_machine
	local correct_state = acceptable_gamestates[game_state_machine.last_queued_state_name(slot2)]

	if correct_state then
		return true
	end

	slot7 = game_state_machine
	slot9 = acceptable_gamestates

	print(slot3, "[BaseNetworkHandler._verify_gamestate] Discarding message. current state:", game_state_machine.last_queued_state_name("acceptable:"), inspect(slot8))

	slot4 = Application

	Application.stack_dump(slot3)

	return 
end
function BaseNetworkHandler:_chk_flush_unit_too_early_packets(unit)
	if self._flushing_unit_too_early_packets then
		return 
	end

	slot4 = unit

	if not alive(slot3) then
		return 
	end

	slot4 = unit
	local unit_id = unit.id(slot3)

	if unit_id == -1 then
		return 
	end

	if not self._unit_too_early_queue then
		return 
	end

	local unit_rpcs = self._unit_too_early_queue[unit_id]

	if not unit_rpcs then
		return 
	end

	slot7 = unit_id

	print(slot5, "[BaseNetworkHandler:_chk_flush_unit_too_early_packets]")

	self._flushing_unit_too_early_packets = true
	slot6 = unit_rpcs

	for _, rpc_info in ipairs(slot5) do
		slot12 = rpc_info.fun_name

		print(slot10, " calling")

		rpc_info.params[rpc_info.unit_param_index] = unit
		slot11 = self
		slot14 = rpc_info.params

		self[rpc_info.fun_name](rpc_info.unit_param_index, unpack(slot13))
	end

	self._unit_too_early_queue[unit_id] = nil
	slot6 = self._unit_too_early_queue

	if not next(nil) then
		self._unit_too_early_queue = nil
	end

	self._flushing_unit_too_early_packets = nil

	return 
end
function BaseNetworkHandler:_chk_unit_too_early(unit, unit_id_str, fun_name, unit_param_index, ...)
	if self._flushing_unit_too_early_packets then
		return 
	end

	slot7 = unit

	if alive(slot6) then
		return 
	end

	if not self._unit_too_early_queue then
		self._unit_too_early_queue = {}
	end

	local data = {
		unit_param_index = unit_param_index,
		fun_name = fun_name,
		params = {
			...
		}
	}
	slot8 = unit_id_str
	local unit_id = tonumber(slot7)
	self._unit_too_early_queue[unit_id] = self._unit_too_early_queue[unit_id] or {}
	slot10 = data

	table.insert(self._unit_too_early_queue[unit_id] or , self._unit_too_early_queue[unit_id])

	slot11 = fun_name

	print(self._unit_too_early_queue[unit_id] or , "[BaseNetworkHandler:_chk_unit_too_early]", unit_id_str)

	return true
end

return 
