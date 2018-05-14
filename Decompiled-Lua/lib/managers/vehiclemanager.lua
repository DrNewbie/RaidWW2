-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
VehicleManager = VehicleManager or class()
function VehicleManager:init()
	self._vehicles = {}
	self._queue_state_change = {}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = Application
		slot1 = Application.production_build(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	self._debug = slot1
	self._draw_enabled = false

	return 
end
function VehicleManager:on_simulation_started()
	slot3 = self._vehicles

	for i, v in pairs(slot2) do
		slot8 = v

		if not alive(slot7) then
			self._vehicles[i] = nil
		end
	end

	return 
end
function VehicleManager:on_simulation_ended()
	slot3 = self._vehicles

	for i, v in pairs(slot2) do
		slot8 = v

		if alive(slot7) then
			slot8 = v
			slot10 = 0

			v.interaction(slot7).set_contour(slot7, v.interaction(slot7), "standard_color")

			slot8 = v
			slot8 = v.vehicle_driving(slot7)

			v.vehicle_driving(slot7).stop_all_sound_events(slot7)

			if v.character_damage then
				slot8 = v

				if v.character_damage(slot7)._broken_effect_id then
					slot8 = World
					slot11 = v
					slot9 = v.character_damage(slot10)._broken_effect_id

					World.effect_manager(slot7).fade_kill(slot7, World.effect_manager(slot7))

					slot8 = v
					v.character_damage(slot7)._broken_effect_id = nil
				end
			end
		end
	end

	self._vehicles = {}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)

	return 
end
function VehicleManager:_call_listeners(event, params)
	slot7 = params

	self._listener_holder.call(slot4, self._listener_holder, event)

	return 
end
function VehicleManager:add_listener(key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function VehicleManager:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function VehicleManager:add_vehicle(vehicle)
	slot5 = vehicle
	self._vehicles[vehicle.key(slot4)] = vehicle

	return 
end
function VehicleManager:remove_vehicle(vehicle)
	Application.debug(slot3, Application, "[VehicleManager:remove_vehicle]")

	slot5 = vehicle
	slot3 = vehicle.key(Application)
	self._vehicles[slot3] = nil
	slot7 = vehicle
	slot5 = vehicle.unit_data(vehicle).name_label_id

	managers.hud._remove_name_label(slot3, managers.hud)

	slot5 = vehicle

	managers.interaction.remove_unit(slot3, managers.interaction)

	slot5 = 0

	vehicle.set_slot(slot3, vehicle)

	return 
end
function VehicleManager:get_all_vehicles()
	return self._vehicles
end
function VehicleManager:get_vehicle(animation_id)
	slot4 = self._vehicles

	for i, v in pairs(slot3) do
		slot9 = v

		if v.vehicle_driving(slot8)._tweak_data.animations.vehicle_id == animation_id then
			return v
		end
	end

	return nil
end
function VehicleManager:on_player_entered_vehicle(vehicle_unit, player)
	slot7 = player

	self._listener_holder.call(slot4, self._listener_holder, "on_enter")

	slot5 = self

	if self.all_players_in_vehicles(slot4) then
		slot7 = player

		self._listener_holder.call(slot4, self._listener_holder, "on_all_inside")
	end

	return 
end
function VehicleManager:all_players_in_vehicles()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local total_players = managers.network.session(slot2).amount_of_alive_players(slot2)
	local players_in_vehicles = 0
	slot5 = self._vehicles

	for _, vehicle in pairs(slot4) do
		slot10 = vehicle
		slot10 = vehicle.vehicle_driving(slot9)
		players_in_vehicles = players_in_vehicles + vehicle.vehicle_driving(slot9).num_players_inside(slot9)
	end

	local all_in = total_players == players_in_vehicles

	return all_in
end
function VehicleManager:on_player_exited_vehicle(vehicle_unit, player)
	slot7 = player

	self._listener_holder.call(slot4, self._listener_holder, "on_exit")

	return 
end
function VehicleManager:remove_player_from_all_vehicles(player)
	slot4 = self._vehicles

	for i, v in pairs(slot3) do
		slot9 = v

		if alive(slot8) then
			slot9 = v
			slot10 = player

			v.vehicle_driving(slot8).exit_vehicle(slot8, v.vehicle_driving(slot8))
		end
	end

	return 
end
function VehicleManager:remove_teamai_from_all_vehicles(unit)
	slot4 = self._vehicles

	for i, v in pairs(slot3) do
		slot9 = v

		if alive(slot8) then
			slot11 = v
			slot9 = v.vehicle_driving(slot10)._seats

			for seat_name, seat in pairs(slot8) do
				if unit == seat.occupant then
					seat.occupant = nil
				end
			end
		end
	end

	return 
end
function VehicleManager:update_vehicles_data_to_peer(peer)
	slot4 = peer

	if peer.ip_verified(slot3) then
		slot4 = self._vehicles

		for i, v in pairs(slot3) do
			local v_ext = v.vehicle_driving(slot8)
			local v_npc_ext = v.npc_vehicle_driving(v)
			slot11 = v
			local vehicle_damage_ext = v.character_damage(v)
			local driver, passenger_front, passenger_back_left, passenger_back_right = nil

			if v_ext._seats.driver then
				slot16 = v_ext._seats.driver.occupant

				if alive(slot15) then
					driver = v_ext._seats.driver.occupant
				end
			end

			if v_ext._seats.passenger_front then
				slot16 = v_ext._seats.passenger_front.occupant

				if alive(slot15) then
					passenger_front = v_ext._seats.passenger_front.occupant
				end
			end

			if v_ext._seats.passenger_back_left then
				slot16 = v_ext._seats.passenger_back_left.occupant

				if alive(slot15) then
					passenger_back_left = v_ext._seats.passenger_back_left.occupant
				end
			end

			if v_ext._seats.passenger_back_right then
				slot16 = v_ext._seats.passenger_back_right.occupant

				if alive(slot15) then
					passenger_back_right = v_ext._seats.passenger_back_right.occupant
				end
			end

			local is_trunk_open = nil

			if v_ext._has_trunk then
				is_trunk_open = v_ext._trunk_open
			end

			local vehicle_health = nil

			if vehicle_damage_ext and vehicle_damage_ext.get_real_health then
				slot18 = vehicle_damage_ext
				vehicle_health = vehicle_damage_ext.get_real_health(slot17)
			end

			slot27 = vehicle_health

			peer.send_queued_sync(slot17, peer, "sync_vehicle_data", v_ext._unit, v_ext._current_state_name, driver, passenger_front, passenger_back_left, passenger_back_right, is_trunk_open)

			if v_npc_ext then
				slot22 = v_npc_ext._target_unit

				peer.send_queued_sync(slot17, peer, "sync_npc_vehicle_data", v_npc_ext._unit, v_npc_ext._current_state_name)
			end

			local stored_loot = v_ext._loot
			local loot_index = 1

			while loot_index <= #stored_loot do
				local loot1 = stored_loot[loot_index]
				loot_index = loot_index + 1
				local loot2 = {
					multiplier = 0
				}

				if loot_index <= #stored_loot then
					loot2 = stored_loot[loot_index]
				end

				loot_index = loot_index + 1
				local loot3 = {
					multiplier = 0
				}

				if loot_index <= #stored_loot then
					loot3 = stored_loot[loot_index]
				end

				loot_index = loot_index + 1
				slot31 = loot3.multiplier

				peer.send_queued_sync(slot22, peer, "sync_vehicle_loot", v_ext._unit, loot1.carry_id, loot1.multiplier, loot2.carry_id, loot2.multiplier, loot3.carry_id)
			end
		end
	end

	return 
end
function VehicleManager:sync_npc_vehicle_data(vehicle_unit, state_name, target_unit)
	slot9 = true

	self.queue_vehicle_state_change(slot5, self, vehicle_unit, state)

	return 
end
function VehicleManager:sync_vehicle_data(vehicle_unit, state, occupant_driver, occupant_left, occupant_back_left, occupant_back_right, is_trunk_open, vehicle_health)
	local v_ext = vehicle_unit.vehicle_driving(slot10)
	slot12 = vehicle_unit
	local vehicle_damage_ext = vehicle_unit.character_damage(vehicle_unit)

	if v_ext._seats.driver then
		v_ext._seats.driver.occupant = occupant_driver

		if occupant_driver then
			slot15 = occupant_driver

			v_ext.sync_occupant(slot12, v_ext, v_ext._seats.driver)

			slot13 = managers.network
			slot14 = occupant_driver
			local peer = managers.network.session(slot12).peer_by_unit(slot12, managers.network.session(slot12))

			if peer then
				slot15 = peer
				managers.player._global.synced_vehicle_data[peer.id(slot14)] = {
					vehicle_unit = vehicle_unit,
					seat = v_ext._seats.driver.name
				}
			end
		end
	end

	if v_ext._seats.passenger_front then
		v_ext._seats.passenger_front.occupant = occupant_left

		if occupant_left then
			slot15 = occupant_left

			v_ext.sync_occupant(slot12, v_ext, v_ext._seats.passenger_front)

			slot13 = managers.network
			slot14 = occupant_left
			local peer = managers.network.session(slot12).peer_by_unit(slot12, managers.network.session(slot12))

			if peer then
				slot15 = peer
				managers.player._global.synced_vehicle_data[peer.id(slot14)] = {
					vehicle_unit = vehicle_unit,
					seat = v_ext._seats.passenger_front.name
				}
			end
		end
	end

	if v_ext._seats.passenger_back_left then
		v_ext._seats.passenger_back_left.occupant = occupant_back_left

		if occupant_back_left then
			slot15 = occupant_back_left

			v_ext.sync_occupant(slot12, v_ext, v_ext._seats.passenger_back_left)

			slot13 = managers.network
			slot14 = occupant_back_left
			local peer = managers.network.session(slot12).peer_by_unit(slot12, managers.network.session(slot12))

			if peer then
				slot15 = peer
				managers.player._global.synced_vehicle_data[peer.id(slot14)] = {
					vehicle_unit = vehicle_unit,
					seat = v_ext._seats.passenger_back_left.name
				}
			end
		end
	end

	if v_ext._seats.passenger_back_right then
		v_ext._seats.passenger_back_right.occupant = occupant_back_right

		if occupant_back_right then
			slot15 = occupant_back_right

			v_ext.sync_occupant(slot12, v_ext, v_ext._seats.passenger_back_right)

			slot13 = managers.network
			slot14 = occupant_back_right
			local peer = managers.network.session(slot12).peer_by_unit(slot12, managers.network.session(slot12))

			if peer then
				slot15 = peer
				managers.player._global.synced_vehicle_data[peer.id(slot14)] = {
					vehicle_unit = vehicle_unit,
					seat = v_ext._seats.passenger_back_right.name
				}
			end
		end
	end

	if state ~= VehicleDrivingExt.STATE_INACTIVE then
		slot16 = false

		self.queue_vehicle_state_change(slot12, self, vehicle_unit, state)
	end

	if is_trunk_open then
		slot13 = vehicle_unit
		slot14 = VehicleDrivingExt.SEQUENCE_TRUNK_OPEN

		vehicle_unit.damage(slot12).run_sequence_simple(slot12, vehicle_unit.damage(slot12))

		v_ext._trunk_open = true
		v_ext._interaction_loot = true
	end

	if vehicle_health and vehicle_damage_ext and vehicle_damage_ext.set_health then
		slot14 = vehicle_health

		vehicle_damage_ext.set_health(slot12, vehicle_damage_ext)

		slot13 = managers.hud

		managers.hud.refresh_vehicle_health(slot12)
	end

	local number_of_seats = 0
	slot14 = v_ext._seats

	for _, seat in pairs(slot13) do
		number_of_seats = number_of_seats + 1
	end

	slot14 = v_ext

	if number_of_seats == v_ext._number_in_the_vehicle(slot13) then
		v_ext._interaction_enter_vehicle = false
	end

	return 
end
function VehicleManager:sync_vehicle_loot(vehicle_unit, carry_id1, multiplier1, carry_id2, multiplier2, carry_id3, multiplier3)
	slot10 = vehicle_unit

	if not alive(slot9) then
		return 
	end

	local v_ext = vehicle_unit.vehicle_driving(slot9)
	slot13 = multiplier1

	v_ext.sync_loot(vehicle_unit, v_ext, carry_id1)

	slot13 = multiplier2

	v_ext.sync_loot(vehicle_unit, v_ext, carry_id2)

	slot13 = multiplier3

	v_ext.sync_loot(vehicle_unit, v_ext, carry_id3)

	return 
end
function VehicleManager:find_active_vehicle_with_player()
	slot3 = self._vehicles

	for i, v in pairs(slot2) do
		slot8 = v

		if alive(slot7) then
			slot8 = v
			slot8 = v.vehicle_driving(slot7)._vehicle

			if v.vehicle_driving(slot7)._vehicle.is_active(slot7) then
				slot8 = v
				local v_ext = v.vehicle_driving(slot7)
				local has_free_seat = false
				local has_player = false
				slot11 = v_ext._seats

				for _, seat in pairs(slot10) do
					local occupant = seat.occupant

					if occupant == nil then
						has_free_seat = true
					else
						slot17 = occupant
					end
				end

				if has_free_seat and has_player then
					return v
				end
			end
		end
	end

	return nil
end
function VehicleManager:find_npc_vehicle_target()
	local target_unit = nil
	slot4 = self._vehicles

	for i, v in pairs(slot3) do
		slot9 = v

		if alive(slot8) then
			slot9 = v
			slot9 = v.vehicle_driving(slot8)._vehicle

			if v.vehicle_driving(slot8)._vehicle.is_active(slot8) then
				slot9 = v

				if v.npc_vehicle_driving(slot8) == nil then
					slot9 = v
					slot9 = v.vehicle_driving(slot8)

					if 0 <= v.vehicle_driving(slot8).num_players_inside(slot8) then
						target_unit = v
					end
				end
			end
		end
	end

	if not target_unit then
		slot4 = managers.player

		if managers.player.players(slot3) then
			slot4 = managers.player
			target_unit = managers.player.players(slot3)[1]
		end
	end

	return target_unit
end
function VehicleManager:update(t, dt)
	if self._debug and self._draw_enabled then
		slot5 = self._vehicles

		for i, v in pairs(slot4) do
			slot10 = v

			if v.interaction(slot9) then
				slot10 = v

				if v.interaction(slot9)._interact_object then
					slot15 = v
					slot13 = v.interaction(slot14)._interact_object
					local obj = v.get_object(slot9, Idstring(slot12))
					local interact_radius = v.vehicle_driving(v)._tweak_data.interact_distance
					slot15 = obj
					slot17 = 0.7

					Application.draw_sphere(v, Application, obj.position(slot14), interact_radius, 0, 0)
				end
			end
		end
	end

	return 
end
function VehicleManager:freeze_vehicles_on_world(world_id)
	slot6 = world_id
	slot9 = self._vehicles

	Application.debug(slot3, Application, "[VehicleManager:freeze_vehicles_on_world]", inspect(slot8))

	slot4 = self._vehicles

	for i, v in pairs(slot3) do
		slot9 = v

		if alive(slot8) then
			slot9 = v

			if v.vehicle_driving(slot8).current_world_id == world_id then
				slot12 = v
				slot10 = v.unit_data(slot11).name_label_id

				managers.hud._remove_name_label(slot8, managers.hud)

				slot9 = v
				slot10 = true

				v.vehicle_driving(slot8)._stop(slot8, v.vehicle_driving(slot8))

				slot9 = v
				v.vehicle_driving(slot8)._pos_reservation_id = nil
				slot12 = "vehicle_driving"

				v.set_extension_update_enabled(nil, v, Idstring(false))
			end
		end
	end

	slot4 = self

	self.clean_up_dead_vehicles(slot3)

	return 
end
function VehicleManager:delete_all_vehicles()
	slot4 = "[VehicleManager:delete_all_vehicles]"

	Application.debug(slot2, Application)

	slot3 = self._vehicles

	for i, v in pairs(slot2) do
		slot8 = v

		if alive(slot7) then
			slot9 = v

			self.remove_vehicle(slot7, self)
		end
	end

	return 
end
function VehicleManager:clean_up_dead_vehicles()
	slot3 = self._vehicles

	for i, v in pairs(slot2) do
		slot8 = v

		if not alive(slot7) then
			slot10 = i

			Application.debug(slot7, Application, "[VehicleManager:clean_up_dead_vehicles()] Removeing DEAD vehicle")

			self._vehicles[i] = nil
		end
	end

	return 
end
function VehicleManager:process_state_change_queue()
	slot3 = self._queue_state_change

	for _, data in ipairs(slot2) do
		slot9 = "[VehicleManager:process_state_change_queue()]"
		slot12 = data

		Application.debug(slot7, Application, inspect(slot11))

		if data.npc then
			local v_npc_ext = data.vehicle_unit.npc_vehicle_driving(slot7)
			slot10 = data.state

			v_npc_ext._set_state(data.vehicle_unit, v_npc_ext)

			slot9 = v_npc_ext

			v_npc_ext.start(data.vehicle_unit)
		else
			slot8 = data.vehicle_unit
			slot9 = "driving"

			data.vehicle_unit.damage(slot7).run_sequence_simple(slot7, data.vehicle_unit.damage(slot7))

			slot8 = data.vehicle_unit
			slot9 = true

			data.vehicle_unit.vehicle(slot7).set_active(slot7, data.vehicle_unit.vehicle(slot7))

			slot8 = data.vehicle_unit
			slot10 = true

			data.vehicle_unit.vehicle_driving(slot7).set_state(slot7, data.vehicle_unit.vehicle_driving(slot7), data.state)

			slot8 = data.vehicle_unit
			slot9 = "local_driving_exit"

			if data.vehicle_unit.damage(slot7).has_sequence(slot7, data.vehicle_unit.damage(slot7)) then
				slot8 = data.vehicle_unit
				slot9 = "local_driving_exit"

				data.vehicle_unit.damage(slot7).run_sequence(slot7, data.vehicle_unit.damage(slot7))
			end
		end
	end

	self._queue_state_change = {}

	return 
end
function VehicleManager:queue_vehicle_state_change(vehicle_unit, state, npc)
	slot10 = npc

	Application.debug(slot5, Application, "[VehicleManager:queue_vehicle_state_change]", vehicle_unit, state)

	slot7 = {
		vehicle_unit = vehicle_unit,
		state = state,
		npc = npc
	}

	table.insert(slot5, self._queue_state_change)

	return 
end
function VehicleManager:on_restart_to_camp()
	slot3 = managers.hud

	managers.hud.hide_vehicle_hud(slot2)

	return 
end

return 
