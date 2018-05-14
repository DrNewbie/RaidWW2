-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CriminalsManager = CriminalsManager or class()
CriminalsManager.MAX_NR_TEAM_AI = 3
CriminalsManager.MAX_NR_CRIMINALS = 4
CriminalsManager.init = function (self)
	slot3 = self

	self._create_characters(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_IN
	}
	slot10 = "player_droped_in"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "criminals_manager_drop_in", callback(slot7, self, self))

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_OUT
	}
	slot10 = "player_droped_out"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "criminals_manager_drop_out", callback(slot7, self, self))

	return 
end
CriminalsManager.sync_teamai_to_peer = function (self, peer)
	slot4 = self._characters

	for _, character in ipairs(slot3) do
		if character.taken and character.data.ai then
			slot15 = 0
			slot19 = "player"

			peer.send_queued_sync(slot8, peer, "set_unit", character.unit, character.name, "", 0, tweak_data.levels.get_default_team_ID(slot17, tweak_data.levels))
		end
	end

	return 
end
CriminalsManager._create_characters = function (self)
	self._characters = {}
	slot3 = tweak_data.criminals.characters

	for _, character in ipairs(slot2) do
		slot8 = character.static_data
		local static_data = deep_clone(slot7)
		local character_data = {
			peer_id = 0,
			taken = false,
			name = character.name,
			static_data = static_data,
			data = {}
		}
		slot11 = character_data

		table.insert(slot9, self._characters)
	end

	return 
end
CriminalsManager.player_droped_in = function (self, params)
	slot5 = "system_player_connected"

	managers.global_state.fire_event(slot3, managers.global_state)

	return 
end
CriminalsManager.player_droped_out = function (self, params)
	slot5 = "system_player_disconnected"

	managers.global_state.fire_event(slot3, managers.global_state)

	return 
end
CriminalsManager.convert_old_to_new_character_workname = function (workname)
	return workname
end
CriminalsManager.character_names = function ()
	return tweak_data.criminals.character_names
end
CriminalsManager.get_num_characters = function ()
	return #tweak_data.criminals.character_names
end
CriminalsManager.character_workname_by_peer_id = function (peer_id)
	return CriminalsManager.character_names()[peer_id]
end
CriminalsManager.comm_wheel_callout_from_nationality = function (nationality)
	slot3 = nationality
	local lower = string.lower(slot2)

	if lower == "russian" then
		return "rus"
	elseif lower == "german" then
		return "ger"
	elseif lower == "british" then
		return "brit"
	elseif lower == "american" then
		return "amer"
	end

	return "brit"
end
CriminalsManager.on_simulation_ended = function (self)
	slot3 = self._characters

	for id, data in pairs(slot2) do
		slot9 = id

		self._remove(slot7, self)
	end

	return 
end
CriminalsManager.local_character_name = function (self)
	return self._local_character
end
CriminalsManager.characters = function (self)
	return self._characters
end
CriminalsManager.get_any_unit = function (self)
	slot3 = self._characters

	for id, data in pairs(slot2) do
		if data.taken then
			slot8 = data.unit

			if alive(slot7) then
				slot8 = data.unit

				if data.unit.id(slot7) ~= -1 then
					return data.unit
				end
			end
		end
	end

	return 
end
CriminalsManager.get_valid_player_spawn_pos_rot = function (self)
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local server_unit = managers.network.session(slot2).local_peer(slot2).unit(slot2)
	slot4 = server_unit

	if alive(managers.network.session(slot2).local_peer(slot2)) then
		slot4 = managers.player._sync_states
		slot7 = server_unit
		slot7 = server_unit.movement(slot6)

		if table.contains(slot3, server_unit.movement(slot6).current_state_name(slot6)) then
			slot6 = true

			return self._get_unit_pos_rot(slot3, self, server_unit)
		end
	end

	slot6 = managers.groupai
	slot6 = managers.groupai.state(slot5)

	for u_key, u_data in pairs(managers.groupai.state(slot5).all_player_criminals(slot5)) do
		if u_data then
			slot9 = u_data.unit

			if alive(slot8) then
				slot9 = managers.player._sync_states
				slot12 = u_data.unit
				slot12 = u_data.unit.movement(slot11)

				if table.contains(slot8, u_data.unit.movement(slot11).current_state_name(slot11)) then
					slot11 = true

					return self._get_unit_pos_rot(slot8, self, u_data.unit)
				end
			end
		end
	end

	slot6 = managers.groupai
	slot6 = managers.groupai.state(slot5)

	for u_key, u_data in pairs(managers.groupai.state(slot5).all_AI_criminals(slot5)) do
		if u_data then
			slot9 = u_data.unit

			if alive(slot8) then
				slot11 = false

				return self._get_unit_pos_rot(slot8, self, u_data.unit)
			end
		end
	end

	if self._last_valid_player_spawn_pos_rot then
		return self._last_valid_player_spawn_pos_rot
	end

	return nil
end
CriminalsManager.get_valid_player_respawn_pos_rot = function (self)
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local server_unit = managers.network.session(slot2).local_peer(slot2).unit(slot2)
	local foxhole_player = nil
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)

	for u_key, u_data in pairs(managers.groupai.state(slot6).all_player_criminals(slot6)) do
		if u_data then
			slot10 = u_data.unit

			if alive(slot9) then
				slot10 = u_data.unit
				slot10 = u_data.unit.movement(slot9)

				if u_data.unit.movement(slot9).is_in_foxhole(slot9) then
					foxhole_player = u_data.unit

					break
				end
			end
		end
	end

	if foxhole_player then
		slot7 = false
		local pos_rot = self._get_unit_pos_rot(slot4, self, foxhole_player)

		return {
			pos_rot[1],
			pos_rot[2],
			"foxhole"
		}
	end

	local driving_player = nil
	slot8 = managers.groupai
	slot8 = managers.groupai.state(slot7)

	for u_key, u_data in pairs(managers.groupai.state(slot7).all_player_criminals(slot7)) do
		if u_data then
			slot11 = u_data.unit

			if alive(slot10) then
				slot11 = u_data.unit
				slot11 = u_data.unit.movement(slot10)

				if u_data.unit.movement(slot10).current_state_name(slot10) == "driving" then
					driving_player = u_data.unit

					break
				end
			end
		end
	end

	if driving_player then
		slot8 = false
		local pos_rot = self._get_unit_pos_rot(slot5, self, driving_player)

		return {
			pos_rot[1],
			pos_rot[2],
			"driving"
		}
	end

	local acceptable_states = {
		"standard",
		"turret",
		"bipod",
		"carry",
		"carry_corpse"
	}
	slot9 = managers.groupai
	slot9 = managers.groupai.state(slot8)

	for u_key, u_data in pairs(managers.groupai.state(slot8).all_player_criminals(slot8)) do
		if u_data then
			slot12 = u_data.unit

			if alive(slot11) then
				slot12 = acceptable_states
				slot15 = u_data.unit
				slot15 = u_data.unit.movement(slot14)

				if table.contains(slot11, u_data.unit.movement(slot14).current_state_name(slot14)) then
					slot14 = false

					return self._get_unit_pos_rot(slot11, self, u_data.unit)
				end
			end
		end
	end

	local acceptable_logics = {
		"travel",
		"assault",
		"idle"
	}
	slot10 = managers.groupai
	slot10 = managers.groupai.state(slot9)

	for u_key, u_data in pairs(managers.groupai.state(slot9).all_AI_criminals(slot9)) do
		if u_data then
			slot13 = u_data.unit

			if alive(slot12) then
				slot13 = acceptable_logics
				slot16 = u_data.unit
				slot16 = u_data.unit.brain(slot15)

				if table.contains(slot12, u_data.unit.brain(slot15).current_logic_name(slot15)) then
					slot15 = false

					return self._get_unit_pos_rot(slot12, self, u_data.unit)
				end
			end
		end
	end

	return self._last_valid_player_spawn_pos_rot
end
CriminalsManager._get_unit_pos_rot = function (self, unit, check_zipline)
	if check_zipline then
		slot5 = unit
		slot5 = unit.movement(slot4)
		local zipline_unit = unit.movement(slot4).zipline_unit(slot4)

		if zipline_unit then
			unit = zipline_unit
		end
	end

	slot5 = unit

	if unit.movement(slot4) then
		slot5 = unit
		slot5 = unit.movement(slot4)
		local state = unit.movement(slot4).current_state_name(slot4)

		if state == "freefall" or state == "parachuting" then
			return nil
		end
	end

	slot5 = unit
	slot9 = "players"

	if unit.in_slot(slot4, managers.slot.get_mask(slot7, managers.slot)) then
		slot5 = unit
	else
		slot6 = unit
		slot8 = unit
		slot8 = unit.rotation(slot7)

		return {
			unit.position(slot5),
			Rotation(unit.rotation(slot7).yaw(slot7))
		}
	end

	return 
end
CriminalsManager.on_last_valid_player_spawn_point_updated = function (self, unit)
	slot6 = true
	self._last_valid_player_spawn_pos_rot = self._get_unit_pos_rot(slot3, self, unit)

	return 
end
CriminalsManager._remove = function (self, id)
	local data = self._characters[id]

	if data.name == self._local_character then
		self._local_character = nil
	end

	if data.unit then
		slot6 = data.name

		managers.hud.remove_mugshot_by_character_name(slot4, managers.hud)

		if not data.ai then
			slot5 = data.unit

			if alive(slot4) then
				slot6 = data.unit

				self.on_last_valid_player_spawn_point_updated(slot4, self)
			end
		end
	else
		slot6 = data.name

		managers.hud.remove_teammate_panel_by_name_id(slot4, managers.hud)
	end

	if not data.ai then
		slot6 = data.name

		managers.trade.on_player_criminal_removed(slot4, managers.trade)
	else
		slot6 = data.unit

		managers.vehicle.remove_teamai_from_all_vehicles(slot4, managers.vehicle)
	end

	data.taken = false
	data.unit = nil
	data.peer_id = 0
	data.data = {}

	return 
end
CriminalsManager.add_character = function (self, name, unit, peer_id, ai)
	slot7 = self._characters

	for id, data in pairs(slot6) do
		if data.name == name then
			if data.taken then
				slot13 = id

				self._remove(slot11, self)
			end

			data.taken = true
			data.unit = unit
			data.peer_id = peer_id
			data.data.ai = ai or false
			slot13 = name

			managers.hud.remove_mugshot_by_character_name(ai or false, managers.hud)

			if unit then
				slot15 = unit
				data.data.mugshot_id, data.data.name_label_id = managers.hud.add_mugshot_by_unit(slot13, managers.hud)
				slot12 = unit

				if unit.base(data.data).is_local_player then
					self._local_character = name
					slot12 = managers.hud

					managers.hud.reset_player_hpbar(slot11)

					slot12 = managers.hud

					managers.hud.refresh_player_panel(slot11)
				end

				slot12 = unit
				slot13 = data.static_data.voice

				unit.sound(slot11).set_voice(slot11, unit.sound(slot11))
			else

				-- Decompilation error in this vicinity:
				slot10 = data.data
				slot13 = managers.hud
				slot11 = managers.hud.add_mugshot_without_unit
				slot14 = name
				slot15 = ai
				slot16 = peer_id
				slot10.mugshot_id = slot11(slot12, slot13, slot14, slot15, slot16)
			end

			return 
		end
	end

	slot11 = ai

	debug_pause(slot6, "[CriminalsManager:add_character] Failed", name, unit, peer_id)

	return 
end
CriminalsManager.set_unit = function (self, name, unit)
	slot5 = self._characters

	for id, data in pairs(slot4) do
		if data.name == name then
			if not data.taken then
				slot11 = "[CriminalsManager:set_character] Error: Trying to set a unit on a slot that has not been taken!"

				Application.error(slot9, Application)

				slot10 = Application

				Application.stack_dump(slot9)

				return 
			end

			data.unit = unit

			managers.hud.remove_mugshot_by_character_name(slot9, managers.hud)

			slot13 = unit
			data.data.mugshot_id, data.data.name_label_id = managers.hud.add_mugshot_by_unit(data.name, managers.hud)
			slot10 = unit

			if unit.base(data.data).is_local_player then
				self._local_character = name
				slot10 = managers.hud

				managers.hud.reset_player_hpbar(slot9)
			end

			slot10 = unit
			slot11 = data.static_data.voice

			unit.sound(slot9).set_voice(slot9, unit.sound(slot9))

			break
		end
	end

	return 
end
CriminalsManager.set_data = function (self, name)
	slot5 = name

	print(slot3, "[CriminalsManager:set_data] name")

	slot4 = self._characters

	for id, data in pairs(slot3) do
		if data.name == name then
			if not data.taken then
				return 
			end

			break
		end
	end

	return 
end
CriminalsManager.is_taken = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if name == data.name then
			return data.taken
		end
	end

	return false
end
CriminalsManager.character_name_by_peer_id = function (self, peer_id)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and peer_id == data.peer_id then
			return data.name
		end
	end

	return 
end
CriminalsManager.character_color_id_by_peer_id = function (self, peer_id)
	local workname = self.character_workname_by_peer_id(slot3)
	slot6 = workname

	return self.character_color_id_by_name(peer_id, self)
end
CriminalsManager.character_color_id_by_unit = function (self, unit)
	local search_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if search_key == data.unit.key(slot9) then
				if data.data.ai then
					return 5
				end

				return data.peer_id
			end
		end
	end

	return 
end
CriminalsManager.character_color_id_by_name = function (self, name)
	slot4 = self._characters

	for id, data in pairs(slot3) do
		if name == data.name then
			return data.static_data.color_id
		end
	end

	return 
end
CriminalsManager.character_data_by_name = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and name == data.name then
			return data.data
		end
	end

	return 
end
CriminalsManager.character_data_by_peer_id = function (self, peer_id)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and peer_id == data.peer_id then
			return data.data
		end
	end

	return 
end
CriminalsManager.character_data_by_unit = function (self, unit)
	local search_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if search_key == data.unit.key(slot9) then
				return data.data
			end
		end
	end

	return 
end
CriminalsManager.character_static_data_by_name = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if name == data.name then
			return data.static_data
		end
	end

	return 
end
CriminalsManager.character_unit_by_name = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and name == data.name then
			return data.unit
		end
	end

	return 
end
CriminalsManager.character_unit_by_peer_id = function (self, peer_id)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and peer_id == data.peer_id then
			return data.unit
		end
	end

	return 
end
CriminalsManager.character_index_by_peer_id = function (self, peer_id)
	slot4 = self._characters

	for character_index, data in pairs(slot3) do
		if data.taken and peer_id == data.peer_id then
			return character_index
		end
	end

	return 
end
CriminalsManager.character_taken_by_name = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if name == data.name then
			return data.taken
		end
	end

	return 
end
CriminalsManager.character_peer_id_by_name = function (self, name)
	slot4 = self._characters

	for _, data in pairs(slot3) do
		if data.taken and name == data.name then
			return data.peer_id
		end
	end

	return 
end
CriminalsManager.character_peer_id_by_unit = function (self, unit)
	slot4 = unit

	if type_name(slot3) ~= "Unit" then
		return nil
	end

	local search_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if search_key == data.unit.key(slot9) then
				return data.peer_id
			end
		end
	end

	return 
end
CriminalsManager.get_free_character_name = function (self)
	local available = {}
	slot4 = self._characters

	for id, data in pairs(slot3) do
		local taken = data.taken

		if not taken then
			slot11 = data.name

			if not self.is_character_as_AI_level_blocked(slot9, self) then
				slot11 = data.name

				table.insert(slot9, available)
			end
		end
	end

	if 0 < #available then
		slot4 = #available

		return available[math.random(slot3)]
	end

	return 
end
CriminalsManager.get_num_player_criminals = function (self)
	local num = 0
	slot4 = self._characters

	for id, data in pairs(slot3) do
		if data.taken and not data.data.ai then
			num = num + 1
		end
	end

	return num
end
CriminalsManager.on_peer_left = function (self, peer_id)
	slot4 = self._characters

	for id, data in pairs(slot3) do
		slot9 = data.unit

		if alive(slot8) then
			slot9 = data.unit
			local char_dmg = data.unit.character_damage(slot8)
		end

		if char_dmg and char_dmg.get_paused_counter_name_by_peer then
			slot11 = peer_id
			local counter_name = char_dmg.get_paused_counter_name_by_peer(slot9, char_dmg)

			if counter_name then
				if counter_name == "downed" then
					slot12 = peer_id

					char_dmg.unpause_downed_timer(slot10, char_dmg)
				elseif counter_name == "arrested" then
					slot12 = peer_id

					char_dmg.unpause_arrested_timer(slot10, char_dmg)
				elseif counter_name == "bleed_out" then
					slot12 = peer_id

					char_dmg.unpause_bleed_out(slot10, char_dmg)
				else
					slot15 = counter_name
					slot17 = peer_id
					slot12 = "Unknown counter name \"" .. tostring(slot14) .. "\" by peer id " .. tostring(slot16)

					Application.stack_dump_error(slot10, Application)
				end

				slot11 = data.unit
				local interact_ext = data.unit.interaction(slot10)

				if interact_ext then
					slot13 = false

					interact_ext.set_waypoint_paused(slot11, interact_ext)
				end

				slot12 = managers.network
				slot15 = false

				managers.network.session(slot11).send_to_peers_synched(slot11, managers.network.session(slot11), "interaction_set_waypoint_paused", data.unit)
			end
		end
	end

	return 
end
CriminalsManager.remove_character_by_unit = function (self, unit)
	slot4 = unit

	if type_name(slot3) ~= "Unit" then
		return 
	end

	local rem_u_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if rem_u_key == data.unit.key(slot9) then
				slot11 = id

				self._remove(slot9, self)

				return 
			end
		end
	end

	return 
end
CriminalsManager.remove_character_by_peer_id = function (self, peer_id)
	slot4 = self._characters

	for id, data in pairs(slot3) do
		if data.taken and peer_id == data.peer_id then
			slot10 = id

			self._remove(slot8, self)

			return 
		end
	end

	return 
end
CriminalsManager.remove_character_by_name = function (self, name)
	slot4 = self._characters

	for id, data in pairs(slot3) do
		if data.taken and name == data.name then
			slot10 = id

			self._remove(slot8, self)

			return 
		end
	end

	return 
end
CriminalsManager.character_name_by_unit = function (self, unit)
	slot4 = unit

	if type_name(slot3) ~= "Unit" then
		return nil
	end

	local search_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if search_key == data.unit.key(slot9) then
				return data.name
			end
		end
	end

	return 
end
CriminalsManager.character_name_by_panel_id = function (self, panel_id)
	slot4 = self._characters

	for id, data in pairs(slot3) do
		if data.taken and data.data.panel_id == panel_id then
			return data.name
		end
	end

	return 
end
CriminalsManager.character_static_data_by_unit = function (self, unit)
	slot4 = unit

	if type_name(slot3) ~= "Unit" then
		return nil
	end

	local search_key = unit.key(slot3)
	slot5 = self._characters

	for id, data in pairs(unit) do
		if data.unit and data.taken then
			slot10 = data.unit

			if search_key == data.unit.key(slot9) then
				return data.static_data
			end
		end
	end

	return 
end
CriminalsManager.nr_AI_criminals = function (self)
	local nr_AI_criminals = 0
	slot4 = self._characters

	for i, char_data in pairs(slot3) do
		if char_data.data.ai then
			nr_AI_criminals = nr_AI_criminals + 1
		end
	end

	return nr_AI_criminals
end
CriminalsManager.ai_criminals = function (self)
	local ai_criminals = {}
	slot4 = self._characters

	for i, char_data in pairs(slot3) do
		if char_data.data.ai then
			slot10 = char_data

			table.insert(slot8, ai_criminals)
		end
	end

	return ai_criminals
end
CriminalsManager.nr_taken_criminals = function (self)
	local nr_taken_criminals = 0
	slot4 = self._characters

	for i, char_data in pairs(slot3) do
		if char_data.taken then
			nr_taken_criminals = nr_taken_criminals + 1
		end
	end

	return nr_taken_criminals
end
CriminalsManager.taken_criminal_names = function (self)
	local result = {}
	slot4 = self._characters

	for i, char_data in pairs(slot3) do
		if char_data.taken then
			slot10 = char_data.name

			table.insert(slot8, result)
		end
	end

	return result
end
CriminalsManager.is_character_as_AI_level_blocked = function (self, name)
	if not Global.game_settings.level_id then
		return false
	end

	local block_AIs = tweak_data.levels[Global.game_settings.level_id].block_AIs

	return (block_AIs and block_AIs[name]) or false
end
CriminalsManager.on_mission_end_callback = function (self)
	Global.game_settings.team_ai = true

	return 
end
CriminalsManager.on_mission_start_callback = function (self)
	local current_save_slot = managers.raid_job.get_current_save_slot(slot2)
	slot4 = managers.raid_job
	local operation_save_data = managers.raid_job.get_save_slots(managers.raid_job)[current_save_slot]

	if operation_save_data then
		Global.game_settings.team_ai = operation_save_data.team_ai
	end

	return 
end

return 
