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
slot2 = "lib/units/vehicles/BaseVehicleState"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateBroken"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateDriving"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateInactive"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateInvalid"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateLocked"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateParked"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateSecured"

require(slot1)

slot2 = "lib/units/vehicles/VehicleStateFrozen"

require(slot1)
require(slot1)

VehicleDrivingExt = VehicleDrivingExt or class()
VehicleDrivingExt.SEAT_PREFIX = "v_"
VehicleDrivingExt.INTERACTION_PREFIX = "interact_"
VehicleDrivingExt.EXIT_PREFIX = "v_exit_"
VehicleDrivingExt.THIRD_PREFIX = "v_third_"
VehicleDrivingExt.LOOT_PREFIX = "v_"
VehicleDrivingExt.INTERACT_INVALID = -1
VehicleDrivingExt.INTERACT_ENTER = 0
VehicleDrivingExt.INTERACT_LOOT = 1
VehicleDrivingExt.INTERACT_REPAIR = 2
VehicleDrivingExt.INTERACT_DRIVE = 3
VehicleDrivingExt.INTERACT_TRUNK = 4
VehicleDrivingExt.STATE_INVALID = "invalid"
VehicleDrivingExt.STATE_INACTIVE = "inactive"
VehicleDrivingExt.STATE_PARKED = "parked"
VehicleDrivingExt.STATE_DRIVING = "driving"
VehicleDrivingExt.STATE_BROKEN = "broken"
VehicleDrivingExt.STATE_LOCKED = "locked"
VehicleDrivingExt.STATE_SECURED = "secured"
VehicleDrivingExt.STATE_FROZEN = "frozen"
VehicleDrivingExt.STATE_BLOCKED = "blocked"
VehicleDrivingExt.TIME_ENTER = 0.3
VehicleDrivingExt.TIME_REPAIR = 10
VehicleDrivingExt.INTERACT_ENTRY_ENABLED = "state_vis_icon_entry_enabled"
VehicleDrivingExt.INTERACT_ENTRY_DISABLED = "state_vis_icon_entry_disabled"
VehicleDrivingExt.INTERACT_LOOT_ENABLED = "state_vis_icon_loot_enabled"
VehicleDrivingExt.INTERACT_LOOT_DISABLED = "state_vis_icon_loot_disabled"
VehicleDrivingExt.INTERACT_REPAIR_ENABLED = "state_vis_icon_repair_enabled"
VehicleDrivingExt.INTERACT_REPAIR_DISABLED = "state_vis_icon_repair_disabled"
VehicleDrivingExt.INTERACT_INTERACTION_ENABLED = "state_interaction_enabled"
VehicleDrivingExt.INTERACT_INTERACTION_DISABLED = "state_interaction_disabled"
VehicleDrivingExt.SEQUENCE_HALF_DAMAGED = "int_seq_med_damaged"
VehicleDrivingExt.SEQUENCE_FULL_DAMAGED = "int_seq_full_damaged"
VehicleDrivingExt.SEQUENCE_REPAIRED = "int_seq_repaired"
VehicleDrivingExt.SEQUENCE_TRUNK_OPEN = "anim_trunk_open"
VehicleDrivingExt.SEQUENCE_TRUNK_CLOSE = "anim_trunk_close"
VehicleDrivingExt.cumulative_dt = 0
VehicleDrivingExt.cumulative_gravity = 0
slot5 = -150
VehicleDrivingExt.PLAYER_CAPSULE_OFFSET = Vector3("lib/units/vehicles/VehicleStateBlocked", 0, 0)
VehicleDrivingExt.SPECIAL_OBJECTIVE_TYPE_DRIVING = "special_objective_type_driving"
VehicleDrivingExt.SPECIAL_LOOT_GERMAN_SPY_CARRY_ID = "german_spy"
function VehicleDrivingExt:init(unit)
	self._unit = unit
	slot7 = "vehicle_driving"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	slot4 = self._unit
	self._vehicle = self._unit.vehicle(slot3)

	if self._vehicle == nil then
		slot4 = "[DRIVING] unit doesn't contain a vehicle"

		print(slot3)
	end

	slot4 = self._unit
	slot7 = "v_driver"
	self._vehicle_view = self._unit.get_object(slot3, Idstring(slot6))

	if self._vehicle_view == nil then
		slot4 = "[DRIVING] vehicle doesn't contain driver view point"

		print(slot3)
	end

	self._drop_time_delay = nil
	slot6 = 0
	self._last_synced_position = Vector3(slot3, 0, 0)
	self._shooting_stance_allowed = true
	self._position_counter = 0
	self._position_dt = 0
	self._positions = {}
	self._could_not_move = false
	self._last_input_fwd_dt = 0
	self._last_input_bwd_dt = 0
	self._pos_reservation_id = nil
	self._pos_reservation = nil
	self.inertia_modifier = self.inertia_modifier or 1
	self._old_speed = Vector3(slot3, 0, 0)
	slot5 = self._unit

	managers.vehicle.add_vehicle(slot3, managers.vehicle)

	slot4 = self._unit
	slot9 = "collision_callback"

	self._unit.set_body_collision_callback(slot3, callback(0, self, self))

	slot5 = tweak_data.vehicle[self.tweak_data]

	self.set_tweak_data(slot3, self)

	self._interaction_allowed = true
	slot4 = self

	self._setup_states(slot3)

	slot6 = true

	self.set_state(slot3, self, VehicleDrivingExt.STATE_INACTIVE)

	self._interaction_enter_vehicle = true
	self._interaction_trunk = true
	self._interaction_loot = false
	self._interaction_repair = false
	self._trunk_open = false
	slot4 = self._unit
	slot5 = VehicleDrivingExt.SEQUENCE_TRUNK_OPEN
	self._has_trunk = self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3))

	if not self._has_trunk then
		self._interaction_loot = true
	end

	slot4 = self

	self.enable_loot_interaction(slot3)

	slot4 = self

	self.enable_accepting_loot(slot3)

	slot4 = self

	self._setup_sound(slot3)

	self._loot = {}

	if not self._tweak_data.hud_label_offset then
		slot4 = self._unit
		slot4 = self._unit.oobb(slot3)
		slot2 = self._unit.oobb(slot3).size(slot3).z
	end

	self.hud_label_offset = slot2

	return 
end
function VehicleDrivingExt:_setup_sound()
	self._playing_slip_sound_dt = 0
	self._playing_reverse_sound_dt = 0
	self._playing_engine_sound = false
	slot4 = "vehicle_hit"
	self._hit_soundsource = SoundDevice.create_source(slot2, SoundDevice)
	slot4 = "vehicle_slip"
	self._slip_soundsource = SoundDevice.create_source(slot2, SoundDevice)

	if self._tweak_data.sound.slip_locator then
		slot3 = self._slip_soundsource
		slot6 = self._unit
		slot9 = self._tweak_data.sound.slip_locator

		self._slip_soundsource.link(slot2, self._unit.get_object(slot5, Idstring(slot8)))
	else
		slot3 = "[VehicleDrivingExt][init] Slip sound source locator not specified for the vehicle:  "
		slot6 = self._unit

		debug_pause(slot2, inspect(slot5))
	end

	slot4 = "vehicle_bump"
	self._bump_soundsource = SoundDevice.create_source(slot2, SoundDevice)

	if self._tweak_data.sound.bump_locator then
		slot3 = self._bump_soundsource
		slot6 = self._unit
		slot9 = self._tweak_data.sound.bump_locator

		self._bump_soundsource.link(slot2, self._unit.get_object(slot5, Idstring(slot8)))
	else
		slot3 = "[VehicleDrivingExt][init] Bump sound source locator not specified for the vehicle:  "
		slot6 = self._unit

		debug_pause(slot2, inspect(slot5))
	end

	slot3 = self._bump_soundsource
	slot6 = self._unit
	slot9 = self._tweak_data.sound.bump_locator

	self._bump_soundsource.link(slot2, self._unit.get_object(slot5, Idstring(slot8)))

	slot4 = "vehicle_door"
	self._door_soundsource = SoundDevice.create_source(slot2, SoundDevice)
	slot3 = self._door_soundsource
	slot6 = self._unit
	slot9 = "v_driver"

	self._door_soundsource.link(slot2, self._unit.get_object(slot5, Idstring(slot8)))

	self._engine_soundsource = nil
	slot3 = self._unit
	slot6 = "snd_engine"
	local snd_engine = self._unit.get_object(slot2, Idstring(slot5))

	if snd_engine then
		slot5 = "vehicle_engine"
		self._engine_soundsource = SoundDevice.create_source(slot3, SoundDevice)
		slot5 = snd_engine

		self._engine_soundsource.link(slot3, self._engine_soundsource)
	end

	self._wheel_jounce = {}
	self._reverse_sound = self._tweak_data.sound.going_reverse
	self._reverse_sound_stop = self._tweak_data.sound.going_reverse_stop
	self._slip_sound = self._tweak_data.sound.slip
	self._slip_sound_stop = self._tweak_data.sound.slip_stop
	self._bump_sound = self._tweak_data.sound.bump
	self._bump_rtpc = self._tweak_data.sound.bump_rtpc
	self._hit_sound = self._tweak_data.sound.hit
	self._hit_rtpc = self._tweak_data.sound.hit_rtpc
	self._hit_enemy = self._tweak_data.sound.hit_enemy

	return 
end
function VehicleDrivingExt:_setup_states()
	local unit = self._unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	slot6 = unit
	self._states = {
		broken = VehicleStateBroken.new(slot4, VehicleStateBroken),
		driving = VehicleStateDriving.new(slot4, VehicleStateDriving),
		inactive = VehicleStateInactive.new(slot4, VehicleStateInactive),
		invalid = VehicleStateInvalid.new(slot4, VehicleStateInvalid),
		locked = VehicleStateLocked.new(slot4, VehicleStateLocked),
		parked = VehicleStateParked.new(slot4, VehicleStateParked),
		secured = VehicleStateSecured.new(slot4, VehicleStateSecured),
		frozen = VehicleStateFrozen.new(slot4, VehicleStateFrozen),
		blocked = VehicleStateBlocked.new(slot4, VehicleStateBlocked)
	}

	return 
end
function VehicleDrivingExt:get_tweak_data()
	return self._tweak_data
end
function VehicleDrivingExt:set_tweak_data(data)
	self._tweak_data = data
	slot4 = self._tweak_data.seats
	self._seats = deep_clone(slot3)
	slot4 = self._tweak_data.loot_points
	self._loot_points = deep_clone(slot3)
	slot4 = self._seats

	for _, seat in pairs(slot3) do
		seat.occupant = nil
		slot9 = self._unit
		slot12 = VehicleDrivingExt.SEAT_PREFIX .. seat.name
		seat.object = self._unit.get_object(slot8, Idstring(slot11))
		slot9 = self._unit
		slot12 = VehicleDrivingExt.THIRD_PREFIX .. seat.name
		seat.third_object = self._unit.get_object(slot8, Idstring(slot11))
		slot9 = self._unit
		slot12 = VehicleDrivingExt.EXIT_PREFIX .. seat.name
		seat.SO_object = self._unit.get_object(slot8, Idstring(slot11))

		if not seat.SO_object then
			slot11 = seat.name

			Application.error(slot8, Application, "[VehicleDrivingExt:set_tweak_data] No exit point for seat ")
		end
	end

	slot4 = self._loot_points

	for _, loot_point in pairs(slot3) do
		slot9 = self._unit
		slot12 = VehicleDrivingExt.LOOT_PREFIX .. loot_point.name
		loot_point.object = self._unit.get_object(slot8, Idstring(slot11))
	end

	slot4 = self._unit

	if self._unit.character_damage(slot3) then
		slot4 = self._unit
		slot5 = data

		self._unit.character_damage(slot3).set_tweak_data(slot3, self._unit.character_damage(slot3))
	end

	slot4 = self._unit
	slot7 = self._tweak_data.loot_drop_point
	slot4 = self._unit.get_object(slot3, Idstring(slot6))
	self._last_drop_position = self._unit.get_object(slot3, Idstring(slot6)).position(slot3)
	slot4 = Network

	if Network.is_server(slot3) and self._tweak_data.skins then
		slot4 = self._tweak_data.skins

		for skin_name, skin in pairs(slot3) do
			if not skin.sequence then
				slot11 = skin_name

				Application.error(slot8, Application, "[VehicleDrivingExt][set_tweak_data] Vehicle skin without a sequence:  ")

				break
			end

			if skin.dlc then
				slot10 = skin.dlc

				if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
					slot9 = self._unit
					slot10 = skin.sequence

					if not self._unit.damage(slot8).has_sequence(slot8, self._unit.damage(slot8)) then
						slot11 = skin_name
						slot14 = skin

						Application.error(slot8, Application, "[VehicleDrivingExt][set_tweak_data] Vehicle doesn't have a sequence for the skin:  ", inspect(slot13))

						break
					end

					if managers.network then
						slot9 = managers.network

						if managers.network.session(slot8) then
							slot9 = managers.network
							slot12 = skin.sequence

							managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_vehicle_skin", self._unit)
						end
					end

					slot10 = skin.sequence

					self.set_skin(slot8, self)

					break
				end
			end
		end
	end

	return 
end
function VehicleDrivingExt:set_skin(skin_name)
	slot4 = self._unit
	slot5 = skin_name

	self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))

	self._skin_sequence = skin_name

	return 
end
function VehicleDrivingExt:get_view()
	return self._vehicle_view
end
function VehicleDrivingExt:update(unit, t, dt)

	-- Decompilation error in this vicinity:
	slot6 = self._unit
	slot6 = self

	self._manage_position_reservation(slot5)

	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = self._vehicle

		if self._vehicle.is_active(slot5) then
			slot6 = self

			self.drop_loot(slot5)
		end

		slot6 = self

		self._catch_loot(slot5)
	end

	slot6 = self._seats

	for _, seat in pairs(slot5) do
		slot11 = seat.occupant

		if alive(slot10) then
			slot11 = seat.occupant

			if seat.occupant.brain(slot10) then
				local ai_movement = seat.occupant.movement(slot10)
				slot12 = ai_movement
				slot15 = seat.third_object

				ai_movement.set_position(seat.occupant, seat.third_object.position(slot14))

				slot12 = ai_movement
				slot15 = seat.third_object

				ai_movement.set_rotation(seat.occupant, seat.third_object.rotation(slot14))
			end
		end
	end

	slot6 = self._seats

	for _, seat in pairs(slot5) do
		slot11 = seat.occupant

		if alive(slot10) then
			slot11 = seat.occupant

			if seat.occupant.brain(slot10) then
				slot11 = seat.occupant
				slot11 = seat.occupant.character_damage(slot10)

				if seat.occupant.character_damage(slot10).is_downed(slot10) then
					slot12 = seat

					self._evacuate_seat(slot10, self)
				end
			end
		end
	end

	slot8 = dt

	self._current_state.update(slot5, self._current_state, t)

	return 
end
function VehicleDrivingExt:_create_position_reservation()
	slot3 = managers.navigation
	self._pos_reservation_id = managers.navigation.get_pos_reservation_id(slot2)

	if self._pos_reservation_id then
		slot4 = self._unit
		self._pos_reservation = {
			radius = 500,
			position = self._unit.position(slot3),
			filter = self._pos_reservation_id
		}
		slot4 = self._pos_reservation

		managers.navigation.add_pos_reservation(self._pos_reservation_id, managers.navigation)

		slot6 = self._unit
		local nav_seg_id = managers.navigation.get_nav_seg_from_pos(self._pos_reservation_id, managers.navigation, self._unit.position(true))
		slot5 = nav_seg_id
		self.current_world_id = managers.navigation.get_world_for_nav_seg(managers.navigation, managers.navigation)
	end

	return 
end
function VehicleDrivingExt:_manage_position_reservation()
	if not self._pos_reservation_id and managers.navigation then
		slot3 = managers.navigation

		if managers.navigation.is_data_ready(slot2) then
			slot3 = self

			self._create_position_reservation(slot2)

			return 
		end
	end

	if self._pos_reservation then
		local pos = self._unit.position(slot2)
		slot5 = self._pos_reservation.position
		local distance = mvector3.distance(self._unit, pos)

		if 100 < distance then
			self._pos_reservation.position = pos
			slot6 = self._pos_reservation

			managers.navigation.move_pos_rsrv(slot4, managers.navigation)

			slot7 = true
			local nav_seg_id = managers.navigation.get_nav_seg_from_pos(slot4, managers.navigation, pos)
			slot7 = nav_seg_id
			self.current_world_id = managers.navigation.get_world_for_nav_seg(managers.navigation, managers.navigation)
		end
	end

	return 
end
function VehicleDrivingExt:_delete_position_reservation()
	slot4 = "[VehicleDrivingExt][_delete_position_reservation] "

	Application.trace(slot2, Application)

	if self._pos_reservation then
		slot4 = "[VehicleDrivingExt][_delete_position_reservation] deleting position reservation"

		Application.trace(slot2, Application)

		slot4 = self._pos_reservation

		managers.navigation.unreserve_pos(slot2, managers.navigation)

		self._pos_reservation = nil
		self._pos_reservation_id = nil
	end

	return 
end
function VehicleDrivingExt:get_action_for_interaction(pos, locator)
	slot8 = self._tweak_data

	return self._current_state.get_action_for_interaction(slot4, self._current_state, pos, locator)
end
function VehicleDrivingExt:set_interaction_allowed(allowed)
	self._interaction_allowed = allowed
	slot4 = self._current_state

	self._current_state.adjust_interactions(slot3)

	return 
end
function VehicleDrivingExt:is_interaction_allowed()
	return self._interaction_allowed
end
function VehicleDrivingExt:is_interaction_enabled(action)
	slot4 = self

	if not self.is_interaction_allowed(slot3) then
		return false
	end

	local result = false

	if action == VehicleDrivingExt.INTERACT_ENTER or action == VehicleDrivingExt.INTERACT_DRIVE then
		result = self._interaction_enter_vehicle
	elseif action == VehicleDrivingExt.INTERACT_LOOT then
		if self._interaction_loot then
			slot5 = self
			result = self.is_loot_interaction_enabled(slot4)
		end
	elseif action == VehicleDrivingExt.INTERACT_REPAIR then
		result = self._interaction_repair
	elseif action == VehicleDrivingExt.INTERACT_TRUNK then
		result = self._interaction_trunk
	end

	return result
end
function VehicleDrivingExt:set_state(name, do_not_sync)
	if name == self._current_state_name or self._current_state_name == VehicleDrivingExt.STATE_SECURED then
		return 
	end

	local exit_data = nil

	if self._current_state then
		slot8 = name
		exit_data = self._current_state.exit(slot5, self._current_state, self._state_data)
	end

	local new_state = self._states[name]

	if not new_state then
		new_state = self._states[VehicleDrivingExt.STATE_PARKED]
		self._current_state = new_state
		self._current_state_name = VehicleDrivingExt.STATE_PARKED
		slot7 = managers.player
		slot7 = managers.player.player_timer(VehicleDrivingExt.STATE_PARKED)
		self._state_enter_t = managers.player.player_timer(VehicleDrivingExt.STATE_PARKED).time(VehicleDrivingExt.STATE_PARKED)
		slot9 = exit_data

		new_state.enter(VehicleDrivingExt.STATE_PARKED, new_state, self._state_data)
	else
		self._current_state = new_state
		self._current_state_name = name
		slot7 = managers.player
		slot7 = managers.player.player_timer(slot6)
		self._state_enter_t = managers.player.player_timer(slot6).time(slot6)
		slot9 = exit_data

		new_state.enter(slot6, new_state, self._state_data)
	end

	if managers.network then
		slot7 = managers.network

		if managers.network.session(slot6) and not do_not_sync then
			slot7 = managers.network
			slot12 = nil

			managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_ai_vehicle_action", "state", self._unit, name)
		end
	end

	return 
end
function VehicleDrivingExt:get_state_name()
	return self._current_state_name
end
function VehicleDrivingExt:lock()
	slot4 = VehicleDrivingExt.STATE_LOCKED

	self.set_state(slot2, self)

	return 
end
function VehicleDrivingExt:unlock()
	slot3 = self._vehicle

	if not self._vehicle.is_active(slot2) then
		slot4 = VehicleDrivingExt.STATE_INACTIVE

		self.set_state(slot2, self)
	else
		slot4 = VehicleDrivingExt.STATE_PARKED

		self.set_state(slot2, self)
	end

	return 
end
function VehicleDrivingExt:secure()
	local carry_ext = self._unit.carry_data(slot2)
	slot4 = Network

	if Network.is_server(self._unit) then
		local silent = false
		local carry_id = carry_ext.carry_id(slot4)
		local multiplier = carry_ext.multiplier(carry_ext)
		slot10 = silent

		managers.loot.secure(carry_ext, managers.loot, carry_id, multiplier)
	end

	slot5 = VehicleDrivingExt.STATE_SECURED

	self.set_state(slot3, self)

	return 
end
function VehicleDrivingExt:break_down()
	slot3 = self._unit
	slot4 = 100000

	self._unit.character_damage(slot2).damage_mission(slot2, self._unit.character_damage(slot2))

	slot4 = VehicleDrivingExt.STATE_BROKEN

	self.set_state(slot2, self)

	return 
end
function VehicleDrivingExt:damage(damage)
	slot4 = self._unit
	slot5 = damage

	self._unit.character_damage(slot3).damage_mission(slot3, self._unit.character_damage(slot3))

	return 
end
function VehicleDrivingExt:activate()
	slot3 = self

	if 0 < self.num_players_inside(slot2) then
		slot4 = VehicleDrivingExt.STATE_DRIVING

		self.set_state(slot2, self)
	else
		slot4 = VehicleDrivingExt.STATE_PARKED

		self.set_state(slot2, self)
	end

	return 
end
function VehicleDrivingExt:deactivate()
	slot4 = VehicleDrivingExt.STATE_FROZEN

	self.set_state(slot2, self)

	return 
end
function VehicleDrivingExt:block()
	slot4 = VehicleDrivingExt.STATE_BLOCKED

	self.set_state(slot2, self)

	return 
end
function VehicleDrivingExt:add_loot(carry_id, multiplier)
	if not carry_id or carry_id == "" then
		return false
	end

	if self._tweak_data.max_loot_bags <= #self._loot then
		return false
	end

	slot6 = {
		carry_id = carry_id,
		multiplier = multiplier
	}

	table.insert(slot4, self._loot)

	slot8 = self._unit
	slot8 = #self._loot

	managers.hud.set_vehicle_label_carry_info(slot4, managers.hud, self._unit.unit_data(slot7).name_label_id, true)

	local carry_tweak_data = tweak_data.carry[carry_id]
	self._max_loot = (carry_tweak_data.is_corpse and 1) or self._tweak_data.max_loot_bags
	slot10 = self._max_loot

	managers.hud.set_vehicle_loot_info(slot5, managers.hud, self._unit, self._loot, #self._loot)

	local bag_type_seq = "action_add_bag_" .. carry_id
	slot7 = self._unit
	slot8 = bag_type_seq

	if self._unit.damage(managers.hud).has_sequence(managers.hud, self._unit.damage(managers.hud)) then
		slot7 = self._unit
		slot8 = bag_type_seq

		self._unit.damage(slot6).run_sequence_simple(slot6, self._unit.damage(slot6))
	else
		slot7 = self._unit
		slot8 = "action_add_bag"

		if self._unit.damage(slot6).has_sequence(slot6, self._unit.damage(slot6)) then
			slot7 = self._unit
			slot8 = "action_add_bag"

			self._unit.damage(slot6).run_sequence_simple(slot6, self._unit.damage(slot6))
		end
	end

	return 
end
function VehicleDrivingExt:sync_loot(carry_id, multiplier)
	if not carry_id or carry_id == "" then
		return false
	end

	slot6 = {
		carry_id = carry_id,
		multiplier = multiplier
	}

	table.insert(slot4, self._loot)

	slot8 = self._unit
	slot8 = #self._loot

	managers.hud.set_vehicle_label_carry_info(slot4, managers.hud, self._unit.unit_data(slot7).name_label_id, true)

	local carry_tweak_data = tweak_data.carry[carry_id]
	self._max_loot = (carry_tweak_data.is_corpse and 1) or self._tweak_data.max_loot_bags
	slot10 = self._max_loot

	managers.hud.set_vehicle_loot_info(slot5, managers.hud, self._unit, self._loot, #self._loot)

	local count = #self._loot
	local bag_type_seq_carry = "int_seq_sync_slot_" .. count .. "_" .. carry_id
	local bag_type_seq = "int_seq_sync_slot_" .. count
	slot9 = self._unit
	slot10 = bag_type_seq_carry

	if self._unit.damage(carry_id).has_sequence(carry_id, self._unit.damage(carry_id)) then
		slot9 = self._unit
		slot10 = bag_type_seq_carry

		self._unit.damage(slot8).run_sequence_simple(slot8, self._unit.damage(slot8))
	else
		slot9 = self._unit
		slot10 = bag_type_seq

		if self._unit.damage(slot8).has_sequence(slot8, self._unit.damage(slot8)) then
			slot9 = self._unit
			slot10 = bag_type_seq

			self._unit.damage(slot8).run_sequence_simple(slot8, self._unit.damage(slot8))
		end
	end

	return 
end
function VehicleDrivingExt:remove_loot(carry_id, multiplier)
	if not carry_id or carry_id == "" then
		return false
	end

	for i = #self._loot, 1, -1 do
		local loot = self._loot[i]

		if loot.carry_id == carry_id and loot.multiplier == multiplier then
			slot11 = i

			table.remove(slot9, self._loot)

			local bag_type_seq = "action_remove_bag_" .. carry_id
			slot11 = self._unit
			slot12 = bag_type_seq

			if self._unit.damage(self._loot).has_sequence(self._loot, self._unit.damage(self._loot)) then
				slot11 = self._unit
				slot12 = bag_type_seq

				self._unit.damage(slot10).run_sequence_simple(slot10, self._unit.damage(slot10))
			else
				slot11 = self._unit
				slot12 = "action_remove_bag"

				if self._unit.damage(slot10).has_sequence(slot10, self._unit.damage(slot10)) then
					slot11 = self._unit
					slot12 = "action_remove_bag"

					self._unit.damage(slot10).run_sequence_simple(slot10, self._unit.damage(slot10))
				end
			end

			local display_bag = true

			if #self._loot == 0 then
				display_bag = false
			end

			slot15 = self._unit
			slot15 = #self._loot

			managers.hud.set_vehicle_label_carry_info(slot11, managers.hud, self._unit.unit_data(slot14).name_label_id, display_bag)

			local carry_tweak_data = tweak_data.carry[carry_id]
			self._max_loot = (carry_tweak_data.is_corpse and 1) or self._tweak_data.max_loot_bags
			slot17 = self._max_loot

			managers.hud.set_vehicle_loot_info(slot12, managers.hud, self._unit, self._loot, #self._loot)

			return true
		end
	end

	return false
end
function VehicleDrivingExt:get_random_loot()
	slot3 = #self._loot
	local entry = math.random(slot2)

	return entry
end
function VehicleDrivingExt:get_loot()
	return self._loot
end
function VehicleDrivingExt:get_current_loot_amount()
	local entry = #self._loot

	return entry
end
function VehicleDrivingExt:get_max_loot()
	return self._max_loot or self._tweak_data.max_loot_bags
end
function VehicleDrivingExt:has_loot_stored()
	if self._loot and 0 < #self._loot then
		return true
	end

	return false
end
function VehicleDrivingExt:give_vehicle_loot_to_player(peer_id)
	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = peer_id

		self.server_give_vehicle_loot_to_player(slot3, self)
	else
		slot4 = managers.network
		slot7 = peer_id

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "server_give_vehicle_loot_to_player", self._unit)
	end

	return 
end
function VehicleDrivingExt:server_give_vehicle_loot_to_player(peer_id)
	slot5 = self
	local loot = self._loot[self.get_current_loot_amount(slot4)]

	if loot then
		slot5 = managers.network
		slot10 = peer_id

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_give_vehicle_loot_to_player", self._unit, loot.carry_id, loot.multiplier)

		slot8 = peer_id

		self.sync_give_vehicle_loot_to_player(slot4, self, loot.carry_id, loot.multiplier)
	end

	return 
end
function VehicleDrivingExt:sync_give_vehicle_loot_to_player(carry_id, multiplier, peer_id)
	slot8 = multiplier

	if not self.remove_loot(slot5, self, carry_id) then
		slot8 = carry_id

		Application.error(slot5, Application, "[VehicleDrivingExt] Trying to remove loot that is not in the vehicle: ")

		return 
	end

	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	slot6 = managers.network.session(slot5).local_peer(slot5)

	if peer_id == managers.network.session(slot5).local_peer(slot5).id(slot5) then
		slot11 = 1

		managers.player.set_carry(slot5, managers.player, carry_id, multiplier, true, false)
	end

	return 
end
function VehicleDrivingExt:drop_loot()
	slot3 = self

	if not self._should_drop_loot(slot2) then
		return 
	end

	slot4 = self
	local loot = self._loot[self.get_current_loot_amount(slot3)]

	if loot then
		slot4 = self._unit
		slot7 = self._tweak_data.loot_drop_point
		local pos = self._unit.get_object(slot3, Idstring(slot6)).position(slot3)
		local velocity = self._vehicle.velocity(self._unit.get_object(slot3, Idstring(slot6)))
		slot6 = velocity

		mvector3.normalize(self._vehicle)

		slot7 = -300

		mvector3.multiply(self._vehicle, velocity)

		local drop_point = pos + velocity
		slot13 = self._unit
		slot13 = drop_point
		slot8 = "dropping loot    " .. inspect(self._unit.position(slot12)) .. "      " .. inspect(slot12)

		Application.debug(velocity, Application)

		local rot = self._unit.rotation(velocity)
		slot10 = 0
		local dir = Vector3(self._unit, 0, 0)

		managers.player.server_drop_carry(0, managers.player, loot.carry_id, loot.multiplier, true, false, 1, drop_point, rot, dir, 0, nil)
	end

	return 
end
function VehicleDrivingExt:_should_drop_loot()
	return false
end
function VehicleDrivingExt:_store_loot(unit)
	if self._tweak_data and self._tweak_data.max_loot_bags <= #self._loot then
		return 
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = unit

		self.server_store_loot_in_vehicle(slot3, self)
	else
		slot4 = managers.network
		slot7 = unit

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "server_store_loot_in_vehicle", self._unit)
	end

	return 
end
function VehicleDrivingExt:server_store_loot_in_vehicle(unit)
	local carry_ext = unit.carry_data(slot3)
	local carry_id = carry_ext.carry_id(unit)
	local multiplier = carry_ext.multiplier(carry_ext)
	slot7 = managers.network
	slot12 = multiplier

	managers.network.session(carry_ext).send_to_peers_synched(carry_ext, managers.network.session(carry_ext), "sync_store_loot_in_vehicle", self._unit, unit, carry_id)

	slot10 = multiplier

	self.sync_store_loot_in_vehicle(carry_ext, self, unit, carry_id)

	return 
end
function VehicleDrivingExt:sync_store_loot_in_vehicle(unit, carry_id, multiplier)
	local carry_ext = unit.carry_data(slot5)
	slot7 = carry_ext

	carry_ext.disarm(unit)

	slot9 = multiplier

	self.add_loot(unit, self, carry_id)

	slot8 = 0

	unit.set_slot(unit, unit)

	slot8 = 0

	carry_ext.set_value(unit, carry_ext)

	slot7 = unit
	slot8 = "secured"

	if unit.damage(unit).has_sequence(unit, unit.damage(unit)) then
		slot7 = unit
		slot8 = "secured"

		unit.damage(slot6).run_sequence_simple(slot6, unit.damage(slot6))
	end

	return 
end
function VehicleDrivingExt:_loot_filter_func(carry_data)
	slot4 = carry_data
	local carry_id = carry_data.carry_id(slot3)

	if carry_id == "gold" or carry_id == "money" or carry_id == "diamonds" or carry_id == "coke" or carry_id == "weapon" or carry_id == "painting" or carry_id == "circuit" or carry_id == "diamonds" or carry_id == "engine_01" or carry_id == "engine_02" or carry_id == "engine_03" or carry_id == "engine_04" or carry_id == "engine_05" or carry_id == "engine_06" or carry_id == "engine_07" or carry_id == "engine_08" or carry_id == "engine_09" or carry_id == "engine_10" or carry_id == "engine_11" or carry_id == "engine_12" or carry_id == "meth" or carry_id == "lance_bag" or carry_id == "lance_bag_large" or carry_id == "grenades" or carry_id == "ammo" or carry_id == "cage_bag" or carry_id == "turret" or carry_id == "artifact_statue" or carry_id == "samurai_suit" or carry_id == "equipment_bag" or carry_id == "cro_loot1" or carry_id == "cro_loot2" or carry_id == "ladder_bag" or carry_id == "warhead" or carry_id == "paper_roll" or carry_id == "counterfeit_money" or carry_id == "gold_tile" or carry_id == "flak_shell" or carry_id == "spiked_wine_barrel" or carry_id == "german_spy" or carry_id == "plank" or carry_id == "painting_sto" or carry_id == "gold_bar" then
		return true
	else
		slot6 = carry_data

		if tweak_data.carry[carry_data.carry_id(slot5)].is_unique_loot then
			return true
		end
	end

	return false
end
function VehicleDrivingExt:_catch_loot()
	slot3 = self

	if not self.is_accepting_loot_enabled(slot2) then
		return 
	end

	if (self._tweak_data and self._tweak_data.max_loot_bags <= #self._loot) or not self._interaction_loot then
		return false
	end

	slot3 = self._loot_points

	for _, loot_point in pairs(slot2) do
		if loot_point.object then
			local pos = loot_point.object.position(slot7)
			slot13 = 14
			local equipement = World.find_units_quick(loot_point.object, World, "sphere", pos, 150)
			slot10 = equipement

			for _, unit in ipairs(World) do
				slot15 = unit
				local carry_data = unit.carry_data(slot14)

				if carry_data then
					slot17 = carry_data

					if self._loot_filter_func(slot15, self) then
						slot17 = unit

						self._store_loot(slot15, self)

						break
					end
				end
			end
		end
	end

	return 
end
function VehicleDrivingExt:get_nearest_loot_point(pos)
	local nearest_loot_point = nil
	local min_distance = 1e+20
	slot6 = self._loot_points

	for name, loot_point in pairs(slot5) do
		if loot_point.object then
			local loot_point_pos = loot_point.object.position(slot10)
			slot13 = pos
			local distance = mvector3.distance(loot_point.object, loot_point_pos)

			if distance < min_distance then
				min_distance = distance
				nearest_loot_point = loot_point
			end
		end
	end

	return nearest_loot_point, min_distance
end
function VehicleDrivingExt:loot_contains_german_spy()
	if self._loot then
		slot3 = self._loot

		for _, loot_data in pairs(slot2) do
			if loot_data.carry_id == VehicleDrivingExt.SPECIAL_LOOT_GERMAN_SPY_CARRY_ID then
				return true
			end
		end
	end

	return false
end
function VehicleDrivingExt:interact_trunk()
	local vehicle = self._unit
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	local peer_id = managers.network.session(slot3).local_peer(slot3).id(slot3)
	slot5 = managers.network
	slot8 = peer_id

	managers.network.session(managers.network.session(slot3).local_peer(slot3)).send_to_peers_synched(managers.network.session(slot3).local_peer(slot3), managers.network.session(managers.network.session(slot3).local_peer(slot3)), "sync_vehicle_interact_trunk", vehicle)

	slot6 = vehicle

	self._interact_trunk(managers.network.session(slot3).local_peer(slot3), self)

	return 
end
function VehicleDrivingExt:_interact_trunk(vehicle)
	slot4 = vehicle
	local driving_ext = vehicle.vehicle_driving(slot3)

	if driving_ext._trunk_open then
		slot5 = vehicle
		slot6 = VehicleDrivingExt.SEQUENCE_TRUNK_CLOSE

		vehicle.damage(slot4).run_sequence_simple(slot4, vehicle.damage(slot4))

		driving_ext._trunk_open = false
		driving_ext._interaction_loot = false
	else
		slot5 = vehicle
		slot6 = VehicleDrivingExt.SEQUENCE_TRUNK_OPEN

		vehicle.damage(slot4).run_sequence_simple(slot4, vehicle.damage(slot4))

		driving_ext._trunk_open = true
		driving_ext._interaction_loot = true
	end

	return 
end
function VehicleDrivingExt:enable_loot_interaction()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot6 = true

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_vehicle_loot_enabled", self._unit)
	end

	self._loot_interaction_enabled = true

	return 
end
function VehicleDrivingExt:disable_loot_interaction()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot6 = false

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_vehicle_loot_enabled", self._unit)
	end

	self._loot_interaction_enabled = false

	return 
end
function VehicleDrivingExt:is_loot_interaction_enabled()
	return self._loot_interaction_enabled
end
function VehicleDrivingExt:enable_accepting_loot()
	slot4 = "[VehicleDrivingExt][enable_accepting_loot] Accepting loot enabled"

	Application.trace(slot2, Application)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot6 = true

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_vehicle_accepting_loot", self._unit)
	end

	self._accepting_loot_enabled = true

	return 
end
function VehicleDrivingExt:disable_accepting_loot()
	slot4 = "[VehicleDrivingExt][enable_accepting_loot] Accepting loot disabled"

	Application.trace(slot2, Application)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot6 = false

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_vehicle_accepting_loot", self._unit)
	end

	self._accepting_loot_enabled = false

	return 
end
function VehicleDrivingExt:is_accepting_loot_enabled()
	return self._accepting_loot_enabled
end
function VehicleDrivingExt:enter_vehicle(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)

	if seat == nil then
		return 
	end

	return 
end
function VehicleDrivingExt:is_player_in_vehicle()
	slot3 = self._seats

	for _, seat in pairs(slot2) do
		slot8 = seat.occupant

		if alive(slot7) then
			slot8 = seat.occupant

			if seat.occupant.brain(slot7) == nil then
				return true
			end
		end
	end

	return 
end
function VehicleDrivingExt:reserve_seat(player, position, seat_name)
	local seat = nil

	if position then
		slot8 = position
		seat = self.get_available_seat(slot6, self)
	else
		slot7 = self._seats

		for _, s in pairs(slot6) do
			if s.name == seat_name then
				seat = s
			end
		end

		slot7 = seat.occupant

		if alive(slot6) then
			slot7 = seat.occupant

			if seat.occupant.brain(slot6) == nil then
				slot7 = self
				slot10 = player
				seat = self.get_available_seat(slot6, player.position(slot9))
			end
		end
	end

	if seat == nil then
		return nil
	end

	slot7 = seat.occupant

	if alive(slot6) then
		slot7 = seat.occupant

		if seat.occupant.brain(slot6) then
			seat.previous_occupant = seat.occupant
		end
	end

	seat.occupant = player

	if seat.drive_SO_data then
		local SO_data = seat.drive_SO_data
		seat.drive_SO_data = nil

		if SO_data.SO_registered then
			slot8 = managers.groupai
			slot9 = SO_data.SO_id

			managers.groupai.state(slot7).remove_special_objective(slot7, managers.groupai.state(slot7))
		end

		slot8 = SO_data.unit

		if alive(slot7) then
			slot8 = SO_data.unit
			slot9 = nil

			SO_data.unit.brain(slot7).set_objective(slot7, SO_data.unit.brain(slot7))
		end
	end

	return seat
end
function VehicleDrivingExt:place_player_on_seat(player, seat_name, move, previous_seat)
	local number_of_seats = 0
	slot8 = self._seats

	for _, seat in pairs(slot7) do
		number_of_seats = number_of_seats + 1

		if seat.name == seat_name then
			if not move and seat.occupant and seat.occupant ~= player then
				slot13 = self
				local empty_seat = self.find_empty_seat(slot12)
				local ps = previous_seat or empty_seat
				slot15 = seat.occupant

				if alive(slot14) then
					slot18 = seat.occupant

					self._move_ai_to_seat(slot14, self, seat, ps)
				end
			end

			slot13 = managers.player

			if player == managers.player.local_player(slot12) then
				slot15 = previous_seat

				self._activate_seat_sound_environment(slot12, self, seat)
			end

			seat.occupant = player

			if not move then
				slot13 = self._door_soundsource
				slot16 = seat.object

				self._door_soundsource.set_position(slot12, seat.object.position(slot15))

				slot14 = self._tweak_data.sound.door_close

				self._door_soundsource.post_event(slot12, self._door_soundsource)

				slot13 = self
				local count = self._number_in_the_vehicle(slot12)

				if count == 1 then
				end

				if count == 1 and self._current_state_name ~= VehicleDrivingExt.STATE_BROKEN and self._current_state_name ~= VehicleDrivingExt.STATE_BLOCKED then
					slot15 = player

					self.start(slot13, self)
				end
			end

			slot13 = self

			self._chk_register_drive_SO(slot12)

			slot13 = self._seats.driver.occupant

			if alive(slot12) and (self._current_state_name == VehicleDrivingExt.STATE_INACTIVE or self._current_state_name == VehicleDrivingExt.STATE_PARKED) then
				slot14 = VehicleDrivingExt.STATE_DRIVING

				self.set_state(slot12, self)
			end
		end
	end

	slot8 = self

	if number_of_seats == self._number_in_the_vehicle(slot7) then
		self._interaction_enter_vehicle = false
		slot10 = {
			skip_idle_check = true
		}

		managers.dialog.queue_dialog(slot7, managers.dialog, "gen_vehicle_good_to_go")
	end

	slot8 = self

	if 0 < self.num_players_inside(slot7) then
		local attention_setting_name = "vehicle_enemy_cbt"
		local attention_desc = tweak_data.attention.settings[attention_setting_name]
		slot12 = attention_setting_name
		local attention_setting = PlayerMovement._create_attention_setting_from_descriptor(slot9, self, attention_desc)
		slot11 = self._unit

		self._unit.attention(self).set_attention(self, self._unit.attention(self), attention_setting)

		slot11 = self._unit
		slot11 = self._unit.attention(self)
		slot14 = player
		slot14 = player.movement(nil)

		self._unit.attention(self).set_team(self, player.movement(nil).team(nil))
	end

	return 
end
function VehicleDrivingExt:_activate_seat_sound_environment(seat, previous_seat)
	slot5 = self._unit
	local sound_source = self._unit.sound_source(slot4)
	local same_environment = previous_seat and seat.sound_environment_start and previous_seat.sound_environment_start and seat.sound_environment_start == previous_seat.sound_environment_start
	local play_environment_end = previous_seat and previous_seat.sound_environment_end and not same_environment

	if play_environment_end then
		slot10 = previous_seat.sound_environment_end

		Application.trace(slot7, Application, "[VehicleDrivingExt][_activate_seat_sound_environment] Stopping sound environment for the previous seat, playing: ")

		slot9 = previous_seat.sound_environment_end

		sound_source.post_event(slot7, sound_source)
	end

	if seat.sound_environment_start and (not previous_seat or not same_environment) then
		slot10 = seat.sound_environment_start

		Application.trace(slot7, Application, "[VehicleDrivingExt][_activate_seat_sound_environment] Starting sound environment for the new seat playing: ")

		slot9 = seat.sound_environment_start

		sound_source.post_event(slot7, sound_source)
	end

	return 
end
function VehicleDrivingExt:_stop_seat_sound_environment()
	slot3 = self
	slot6 = managers.player
	local seat = self.find_seat_for_player(slot2, managers.player.local_player(slot5))

	if seat and seat.sound_environment_end then
		slot6 = seat.sound_environment_start

		Application.trace(slot3, Application, "[VehicleDrivingExt][_stop_seat_sound_environment] Starting sound environment for the new seat playing: ")

		local sound_source = self._unit.sound_source(slot3)
		slot6 = seat.sound_environment_end

		sound_source.post_event(self._unit, sound_source)
	end

	return 
end
function VehicleDrivingExt:move_player_to_seat(player, new_player_seat, previous_seat, previous_occupant)
	if previous_occupant then
		slot10 = previous_occupant

		self._move_ai_to_seat(slot6, self, new_player_seat, previous_seat)
	elseif previous_seat then
		previous_seat.occupant = nil
	end

	local move = previous_seat ~= nil or previous_occupant ~= nil
	slot12 = previous_seat

	self.place_player_on_seat(slot7, self, player, new_player_seat.name, move)

	new_player_seat.previous_occupant = nil

	if previous_seat.driving then
		slot14 = false

		self.set_input(slot7, self, 0, 0, 0, 0, false)
	end

	slot8 = managers.hud

	managers.hud.player_changed_vehicle_seat(slot7)

	return 
end
function VehicleDrivingExt:find_empty_seat()
	slot3 = self._seats

	for name, seat in pairs(slot2) do
		if not seat.occupant then
			return seat
		end
	end

	return 
end
function VehicleDrivingExt:_move_ai_to_seat(from_seat, to_seat, previous_occupant)
	local ai_unit = previous_occupant
	slot7 = ai_unit

	ai_unit.unlink(slot6)

	from_seat.occupant = nil
	local ai_movement = ai_unit.movement(slot6)
	slot8 = ai_unit
	ai_unit.movement(ai_unit).vehicle_seat = to_seat

	if to_seat then
		to_seat.occupant = ai_unit
		slot8 = ai_movement
		slot11 = to_seat.third_object

		ai_movement.set_position(slot7, to_seat.third_object.position(slot10))

		slot8 = ai_movement
		slot11 = to_seat.third_object

		ai_movement.set_rotation(slot7, to_seat.third_object.rotation(slot10))

		ai_movement.vehicle_unit = self._unit
		ai_movement.vehicle_seat = to_seat
		slot11 = VehicleDrivingExt.THIRD_PREFIX .. ai_movement.vehicle_seat.name
		slot13 = ai_unit
		slot13 = ai_unit.orientation_object(ai_movement.vehicle_seat.name)

		ai_movement.vehicle_unit.link(slot7, ai_movement.vehicle_unit, Idstring(ai_unit), ai_unit.orientation_object(ai_movement.vehicle_seat.name).name(ai_movement.vehicle_seat.name))

		local team_ai_animation = self._tweak_data.animations[to_seat.name]
		slot9 = self

		if self.shooting_stance_mandatory(ai_movement.vehicle_unit) and to_seat.shooting_pos and to_seat.has_shooting_mode then
			team_ai_animation = team_ai_animation .. "_shooting"
		end

		slot9 = ai_unit
		slot11 = 0

		ai_unit.movement(slot8).play_redirect(slot8, ai_unit.movement(slot8), team_ai_animation)
	end

	return 
end
function VehicleDrivingExt:allow_exit()
	slot3 = self._current_state

	return self._current_state.allow_exit(slot2)
end
function VehicleDrivingExt:kick()
	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	return 
end
function VehicleDrivingExt:exit_vehicle(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)

	if seat == nil then
		return 
	end

	slot5 = self

	self._stop_seat_sound_environment(slot4)

	seat.occupant = nil
	self._interaction_enter_vehicle = true
	slot5 = self._seats.driver.occupant

	if not alive(slot4) and self._current_state_name ~= VehicleDrivingExt.STATE_BROKEN and self._current_state_name ~= VehicleDrivingExt.STATE_LOCKED and self._current_state_name ~= VehicleDrivingExt.STATE_BLOCKED then
		slot6 = VehicleDrivingExt.STATE_PARKED

		self.set_state(slot4, self)
	end

	slot5 = self
	local count = self._number_in_the_vehicle(slot4)

	if count == 0 then
		slot6 = self

		self._unregister_drive_SO(slot5)

		slot6 = self

		self._evacuate_vehicle(slot5)
	end

	return 
end
function VehicleDrivingExt:_evacuate_vehicle()
	slot3 = self._seats

	for _, seat in pairs(slot2) do
		slot8 = seat.occupant

		if alive(slot7) then
			slot8 = seat.occupant

			if seat.occupant.brain(slot7) then
				slot9 = seat

				self._evacuate_seat(slot7, self)
			end
		end
	end

	slot3 = self

	self._unregister_drive_SO(slot2)

	slot3 = self._unit

	self._unit.attention(slot2).set_attention(slot2, self._unit.attention(slot2), nil)

	return 
end
function VehicleDrivingExt:_evacuate_seat(seat)
	slot4 = seat.occupant

	seat.occupant.unlink(slot3)

	slot4 = seat.occupant
	seat.occupant.movement(slot3).vehicle_unit = nil
	slot4 = seat.occupant
	seat.occupant.movement(nil).vehicle_seat = nil
	slot4 = seat.occupant
	slot4 = seat.occupant.character_damage(nil)

	if seat.occupant.character_damage(nil).dead(nil) then
	else
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = seat.occupant
			slot5 = {
				sync = true,
				body_part = 1,
				type = "idle"
			}

			seat.occupant.movement(slot3).action_request(slot3, seat.occupant.movement(slot3))
		end
	end

	local rot = seat.SO_object.rotation(slot3)
	local pos = seat.SO_object.position(seat.SO_object)
	slot6 = seat.occupant
	slot7 = rot

	seat.occupant.movement(seat.SO_object).set_rotation(seat.SO_object, seat.occupant.movement(seat.SO_object))

	slot6 = seat.occupant
	slot7 = pos

	seat.occupant.movement(seat.SO_object).set_position(seat.SO_object, seat.occupant.movement(seat.SO_object))

	seat.occupant = nil

	return 
end
function VehicleDrivingExt:find_exit_position(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)
	slot5 = self._unit
	slot8 = VehicleDrivingExt.EXIT_PREFIX .. seat.name
	local exit_position = self._unit.get_object(self, Idstring(slot7))
	local result = {}
	slot7 = exit_position
	result.position = exit_position.position(Idstring)
	slot7 = exit_position
	result.rotation = exit_position.rotation(Idstring)
	local rot = self._vehicle.rotation(Idstring)
	slot10 = 100
	local offset = Vector3(self._vehicle, 0, 0)
	slot10 = rot

	mvector3.rotate_with(0, offset)

	local found_exit = true
	slot13 = 39
	local slot_mask = World.make_slot_mask(offset, World, 1, 11)
	slot18 = exit_position
	slot22 = self._unit
	local ray = World.raycast(World, World, "ray_type", "body bag mover", "ray", player.position(slot16) + offset, exit_position.position(player) + offset, "sphere_cast_radius", 35, "slot_mask", slot_mask, "ignore_unit")

	if ray and ray.unit then
		found_exit = false
		slot12 = self._tweak_data.seats

		for _, seat in pairs(slot11) do
			slot20 = VehicleDrivingExt.EXIT_PREFIX .. seat.name
			local seat_exit_position = self._unit.get_object(slot16, Idstring(slot19))
			slot25 = seat_exit_position
			slot29 = self._unit
			ray = World.raycast(self._unit, World, "ray_type", "body bag mover", "ray", player.position(slot23) + offset, seat_exit_position.position(player) + offset, "sphere_cast_radius", 35, "slot_mask", slot_mask, "ignore_unit")

			if not ray or not ray.unit then
				exit_position = seat_exit_position
				found_exit = true

				break
			end
		end

		if not found_exit then
			local i_alt = 1
			slot13 = self._unit
			slot16 = "v_exit_alternate_" .. i_alt
			local alt_exit_position = self._unit.get_object(slot12, Idstring(slot15))

			while alt_exit_position do
				slot21 = alt_exit_position
				slot25 = self._unit
				ray = World.raycast(slot13, World, "ray_type", "body bag mover", "ray", player.position(slot19) + offset, alt_exit_position.position(player) + offset, "sphere_cast_radius", 35, "slot_mask", slot_mask, "ignore_unit")

				if not ray or not ray.unit then
					exit_position = alt_exit_position
					found_exit = true

					break
				end

				i_alt = i_alt + 1
				slot14 = self._unit
				slot17 = "v_exit_alternate_" .. i_alt
				alt_exit_position = self._unit.get_object(slot13, Idstring(slot16))
			end
		end

		slot13 = exit_position
		slot13 = exit_position
		result = {
			position = exit_position.position(slot12),
			rotation = exit_position.rotation(slot12)
		}
	end

	if not found_exit then
		slot13 = "[VehicleDrivingExt]  find_exit_position - no exit position"

		Application.error(slot11, Application)

		slot15 = 100
		result.position = result.position + Vector3(Application, 0, 0)

		return nil
	end

	return result
end
function VehicleDrivingExt:get_object_placement(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)

	if seat then
		slot6 = seat.object
		local obj_pos = self._vehicle.object_position(slot4, self._vehicle)
		slot7 = seat.object
		local obj_rot = self._vehicle.object_rotation(self._vehicle, self._vehicle)

		return obj_pos, obj_rot
	end

	slot5 = "[VehicleDrivingExt:get_object_placement] Seat not found for player!"

	print(slot4)

	return nil, nil
end
function VehicleDrivingExt:get_available_seat(position)
	local nearest_seat = nil
	local min_distance = 1e+20
	local min_seat_distance = 1e+20
	slot7 = self._seats

	for name, seat in pairs(slot6) do
		slot12 = self._unit
		slot15 = VehicleDrivingExt.INTERACTION_PREFIX .. seat.name
		local object = self._unit.get_object(slot11, Idstring(slot14))

		if object ~= nil then
			local seat_pos = object.position(slot12)
			slot15 = position
			local distance = mvector3.distance(object, seat_pos)

			if distance < min_distance then
				min_distance = distance
			end

			slot15 = seat.occupant

			if not alive(slot14) and distance < min_seat_distance then
				nearest_seat = seat
				min_seat_distance = distance
			end
		end
	end

	if not nearest_seat then
		slot7 = self._seats

		for name, seat in pairs(slot6) do
			slot12 = self._unit
			slot15 = VehicleDrivingExt.INTERACTION_PREFIX .. seat.name
			local object = self._unit.get_object(slot11, Idstring(slot14))

			if object ~= nil then
				local seat_pos = object.position(slot12)
				slot15 = position
				local distance = mvector3.distance(object, seat_pos)

				if distance < min_distance then
					min_distance = distance
				end

				slot15 = seat.occupant

				if seat.occupant.brain(slot14) and distance < min_seat_distance then
					nearest_seat = seat
					min_seat_distance = distance
				end
			end
		end
	end

	return nearest_seat, min_distance
end
function VehicleDrivingExt:has_driving_seat()
	slot3 = self._seats

	for _, seat in pairs(slot2) do
		if seat.driving then
			return true
		end
	end

	return false
end
function VehicleDrivingExt:get_next_seat(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)
	local next_seat = self._seats[seat.next_seat]

	while next_seat and next_seat ~= seat do
		if next_seat.occupant and next_seat.occupant then
			slot6 = next_seat.occupant

			if next_seat.occupant.brain(slot5) then
				return next_seat
			end
		end

		next_seat = self._seats[next_seat.next_seat]
	end

	return nil
end
function VehicleDrivingExt:find_seat_for_player(player)
	slot4 = self._seats

	for _, seat in pairs(slot3) do
		slot9 = seat.occupant

		if alive(slot8) and seat.occupant == player then
			return seat
		end
	end

	return nil
end
function VehicleDrivingExt:num_players_inside()
	local num_players = 0
	slot4 = self._seats

	for _, seat in pairs(slot3) do
		slot9 = seat.occupant

		if alive(slot8) then
			slot9 = seat.occupant

			if not seat.occupant.brain(slot8) then
				num_players = num_players + 1
			end
		end
	end

	return num_players
end
function VehicleDrivingExt:on_team_ai_enter(ai_unit)
	slot4 = ai_unit
	local original_seat = ai_unit.movement(slot3).vehicle_seat
	local target_seat = original_seat

	if target_seat.occupant then
		if target_seat.occupant == ai_unit then
			return 
		end

		slot6 = self
		target_seat = self.find_empty_seat(slot5)

		if not target_seat then
			slot10 = ai_unit
			slot8 = ai_unit.movement(slot9).vehicle_seat.name

			Application.error(slot5, Application, "[VehicleDrivingExt][on_team_ai_enter] Team AI failed to enter the vehicle - all seats are taken. Target seat: ")

			slot6 = ai_unit
			ai_unit.movement(slot5).vehicle_unit = nil
			slot6 = ai_unit
			ai_unit.movement(nil).vehicle_seat = nil
			slot6 = Network

			if Network.is_server(nil) then
				slot6 = ai_unit
				slot7 = {
					sync = true,
					body_part = 1,
					type = "idle"
				}

				ai_unit.movement(slot5).action_request(slot5, ai_unit.movement(slot5))
			end

			local rot = original_seat.SO_object.rotation(slot5)
			local pos = original_seat.SO_object.position(original_seat.SO_object)
			slot8 = ai_unit
			slot9 = rot

			ai_unit.movement(original_seat.SO_object).set_rotation(original_seat.SO_object, ai_unit.movement(original_seat.SO_object))

			slot8 = ai_unit
			slot9 = pos

			ai_unit.movement(original_seat.SO_object).set_position(original_seat.SO_object, ai_unit.movement(original_seat.SO_object))

			return 
		end
	end

	slot9 = VehicleDrivingExt.THIRD_PREFIX .. target_seat.name
	slot11 = ai_unit
	slot11 = ai_unit.orientation_object(target_seat.name)

	self._unit.link(slot5, self._unit, Idstring(ai_unit), ai_unit.orientation_object(target_seat.name).name(target_seat.name))

	target_seat.occupant = ai_unit

	managers.hud.ai_entered_vehicle(slot5, managers.hud, ai_unit)

	slot7 = "VehicleDrivingExt:on_team_ai_enter"

	Application.debug(slot5, Application)

	slot6 = self._door_soundsource
	slot9 = target_seat.object

	self._door_soundsource.set_position(slot5, target_seat.object.position(self._unit))

	slot7 = self._tweak_data.sound.door_close

	self._door_soundsource.post_event(slot5, self._door_soundsource)

	slot6 = ai_unit

	if target_seat ~= ai_unit.movement(slot5).vehicle_seat then
		local team_ai_animation = self._tweak_data.animations[target_seat.name]
		slot7 = self

		if self.shooting_stance_mandatory(slot6) and target_seat.shooting_pos and target_seat.has_shooting_mode then
			team_ai_animation = team_ai_animation .. "_shooting"
		end

		slot7 = ai_unit
		ai_unit.movement(slot6).vehicle_seat = target_seat
		slot7 = ai_unit
		slot9 = 0

		ai_unit.movement(slot6).play_redirect(slot6, ai_unit.movement(slot6), team_ai_animation)
	end

	return 
end
function VehicleDrivingExt:seats()
	return self._seats
end
function VehicleDrivingExt:get_seat_data_by_seat_name(seat_name)
	if self._seats then
		slot4 = self._seats

		for index, seat_data in pairs(slot3) do
			if seat_data.name == seat_name then
				return seat_data
			end
		end

		return nil
	end

	return nil
end
function VehicleDrivingExt:sync_occupant(seat, occupant)
	slot8 = VehicleDrivingExt.SEAT_PREFIX .. seat.name

	self._unit.link(slot4, self._unit, Idstring(occupant))

	slot5 = occupant

	if occupant.brain(slot4) then
		slot5 = occupant
		occupant.movement(slot4).vehicle_unit = self._unit
		slot5 = occupant
		occupant.movement(self._unit).vehicle_seat = seat
	end

	return 
end
function VehicleDrivingExt:on_vehicle_death()
	slot4 = VehicleDrivingExt.STATE_BROKEN

	self.set_state(slot2, self)

	return 
end
function VehicleDrivingExt:repair_vehicle()
	slot4 = VehicleDrivingExt.STATE_PARKED

	self.set_state(slot2, self)

	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	self._unit.character_damage(slot2).revive(slot2)

	return 
end
function VehicleDrivingExt:is_vulnerable()
	slot3 = self._current_state

	return self._current_state.is_vulnerable(slot2)
end
function VehicleDrivingExt:start(player)
	slot7 = "vehicle_driving"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	slot5 = player

	self._start(slot3, self)

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot8 = player

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_vehicle_driving", "start", self._unit)
	end

	return 
end
function VehicleDrivingExt:sync_start(player)
	slot5 = player

	self._start(slot3, self)

	return 
end
function VehicleDrivingExt:_start(player)
	slot5 = player
	local seat = self.find_seat_for_player(slot3, self)

	if seat == nil then
		return 
	end

	slot5 = self

	self.activate_vehicle(slot4)

	return 
end
function VehicleDrivingExt:activate_vehicle()
	slot3 = self._vehicle

	if not self._vehicle.is_active(slot2) then
		slot3 = self._unit
		slot4 = "driving"

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

		slot4 = true

		self._vehicle.set_active(slot2, self._vehicle)

		slot4 = VehicleDrivingExt.STATE_DRIVING

		self.set_state(slot2, self)
	end

	slot3 = self._unit
	slot6 = self._tweak_data.loot_drop_point
	slot3 = self._unit.get_object(slot2, Idstring(slot5))
	self._last_drop_position = self._unit.get_object(slot2, Idstring(slot5)).position(slot2)
	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._drop_time_delay = TimerManager.main(slot2).time(slot2)

	return 
end
function VehicleDrivingExt:stop()
	slot3 = self

	self._stop(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot7 = nil

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_vehicle_driving", "stop", self._unit)
	end

	return 
end
function VehicleDrivingExt:sync_stop()
	slot3 = self

	self._stop(slot2)

	return 
end
function VehicleDrivingExt:_stop(do_not_sync_state)
	slot4 = "[DRIVING] VehicleDrivingExt: _stop()"

	print(slot3)

	slot4 = self

	self.stop_all_sound_events(slot3)

	slot4 = self._unit
	slot5 = "not_driving"

	self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))

	slot5 = false

	self._vehicle.set_active(slot3, self._vehicle)

	self._drop_time_delay = nil
	slot6 = do_not_sync_state

	self.set_state(slot3, self, VehicleDrivingExt.STATE_INACTIVE)

	return 
end
function VehicleDrivingExt:set_input(accelerate, steer, brake, handbrake, gear_up, gear_down, forced_gear, dt, y_axis)
	slot12 = self._current_state

	if self._current_state.stop_vehicle(slot11) then
		accelerate = 0
		steer = 0
		gear_up = false
		gear_down = false
		brake = 1
	elseif dt and 0 < y_axis then
		self._last_input_fwd_dt = self._last_input_fwd_dt + dt
	elseif dt and y_axis < 0 then
		self._last_input_bwd_dt = self._last_input_bwd_dt + dt
	end

	slot19 = forced_gear

	self._set_input(slot11, self, accelerate, steer, brake, handbrake, gear_up, gear_down)

	slot12 = managers.network

	if managers.network.session(slot11) then
		local pos = self._vehicle.position(slot11)
		slot13 = managers.network
		slot22 = forced_gear

		managers.network.session(self._vehicle).send_to_peers_synched(self._vehicle, managers.network.session(self._vehicle), "sync_vehicle_set_input", self._unit, accelerate, steer, brake, handbrake, gear_up, gear_down)

		slot14 = pos
		local distance = mvector3.distance(self._vehicle, self._last_synced_position)

		if 1 < distance then
			slot14 = managers.network
			slot21 = self._vehicle

			managers.network.session(slot13).send_to_peers_synched(slot13, managers.network.session(slot13), "sync_vehicle_state", self._unit, self._vehicle.position(self._vehicle.rotation(self._vehicle)), self._vehicle.velocity(self._vehicle))

			self._last_synced_position = pos
		end
	end

	return 
end
function VehicleDrivingExt:sync_set_input(accelerate, steer, brake, handbrake, gear_up, gear_down, forced_gear)
	slot17 = forced_gear

	self._set_input(slot9, self, accelerate, steer, brake, handbrake, gear_up, gear_down)

	return 
end
function VehicleDrivingExt:sync_state(position, rotation, velocity)
	slot9 = velocity

	self._vehicle.adjust_vehicle_state(slot5, self._vehicle, position, rotation)

	return 
end
function VehicleDrivingExt:sync_vehicle_state(new_state)
	slot6 = true

	self.set_state(slot3, self, new_state)

	return 
end
function VehicleDrivingExt:_set_input(accelerate, steer, brake, handbrake, gear_up, gear_down, forced_gear)
	local gear_shift = 0

	if gear_up then
		gear_shift = 1
	end

	if gear_down then
		gear_shift = -1
	end

	slot17 = forced_gear

	self._vehicle.set_input(slot10, self._vehicle, accelerate, steer, brake, handbrake, gear_shift)

	return 
end
function VehicleDrivingExt:_wake_nearby_dynamics()
	slot4 = 1
	local slotmask = World.make_slot_mask(slot2, World)
	slot8 = self._vehicle
	slot8 = slotmask
	local units = World.find_units_quick(World, World, "sphere", self._vehicle.position(slot7), 500)
	slot5 = units

	for _, unit in pairs(World) do
		slot10 = unit

		if unit.damage(slot9) then
			slot10 = unit
			slot11 = "car_destructable"

			if unit.damage(slot9).has_sequence(slot9, unit.damage(slot9)) then
				slot10 = unit
				slot11 = "car_destructable"

				unit.damage(slot9).run_sequence_simple(slot9, unit.damage(slot9))
			end
		end
	end

	return 
end
function VehicleDrivingExt:_should_push(unit)
	slot4 = self._seats

	for _, seat in pairs(slot3) do
		if seat.occupant == unit or (seat.drive_SO_data and seat.drive_SO_data.unit == unit) then
			return false
		end
	end

	return true
end
function VehicleDrivingExt:_detect_npc_collisions()
	local vel = self._vehicle.velocity(slot2)
	slot4 = vel

	if vel.length(self._vehicle) < 150 then
		return 
	end

	local oobb = self._unit.oobb(slot3)
	slot6 = "flesh"
	local slotmask = managers.slot.get_mask(self._unit, managers.slot)
	slot14 = oobb
	slot13 = slotmask
	local units = World.find_units(managers.slot, World, "intersect", "obb", oobb.center(slot10), oobb.x(oobb), oobb.y(oobb), oobb.z(oobb))
	slot7 = units

	for _, unit in pairs(World) do
		slot12 = unit
		slot16 = "all_criminals"
		local unit_is_criminal = unit.in_slot(slot11, managers.slot.get_mask(slot14, managers.slot))

		if unit_is_criminal then
		else
			slot13 = unit

			if unit.character_damage(slot12) then
				slot13 = unit
				slot13 = unit.character_damage(slot12)

				if not unit.character_damage(slot12).dead(slot12) then
					slot13 = self._hit_soundsource

					self._hit_soundsource.set_position(slot12, unit.position(slot15))

					slot14 = self._hit_rtpc
					slot19 = vel
					slot19 = 100

					self._hit_soundsource.set_rtpc(slot12, self._hit_soundsource, math.clamp(unit, vel.length(slot18) / 100 * 2, 0))

					slot14 = self._hit_enemy

					self._hit_soundsource.post_event(slot12, self._hit_soundsource)

					slot14 = "[VehicleDrivingExt][_detect_npc_collisions] SPLAT"

					Application.trace(slot12, Application)

					slot15 = {
						skip_idle_check = true
					}

					managers.dialog.queue_dialog(slot12, managers.dialog, "gen_vehicle_hits_enemy")

					slot13 = unit
					local damage_ext = unit.character_damage(slot12)
					local attack_data = {
						variant = "explosion",
						damage = damage_ext._HEALTH_INIT or 1000
					}
					slot16 = managers.player

					if self._seats.driver.occupant == managers.player.local_player(slot15) then
						slot15 = managers.player
						attack_data.attacker_unit = managers.player.local_player(slot14)
					end

					slot16 = attack_data

					damage_ext.damage_mission(slot14, damage_ext)

					slot15 = unit

					if unit.movement(slot14)._active_actions[1] then
						slot15 = unit
						slot15 = unit.movement(slot14)._active_actions[1]

						if unit.movement(slot14)._active_actions[1].type(slot14) == "hurt" then
							slot15 = unit
							slot15 = unit.movement(slot14)._active_actions[1]

							unit.movement(slot14)._active_actions[1].force_ragdoll(slot14)
						end
					end

					slot15 = unit
					local nr_u_bodies = unit.num_bodies(slot14)
					local i_u_body = 0

					while i_u_body < nr_u_bodies do
						slot18 = i_u_body
						local u_body = unit.body(slot16, unit)
						slot18 = u_body

						if u_body.enabled(unit) then
							slot18 = u_body

							if u_body.dynamic(slot17) then
								local body_mass = u_body.mass(slot17)
								slot22 = 2
								slot24 = u_body

								u_body.push_at(u_body, u_body, body_mass / math.random(vel * 2.5), u_body.position(slot23))
							end
						end

						i_u_body = i_u_body + 1
					end

					slot18 = managers.player

					if self._seats.driver.occupant == managers.player.local_player(slot17) then
						slot17 = managers.statistics

						managers.statistics.add_to_killed_by_vehicle(slot16)
					end
				end
			end
		end
	end

	return 
end
function VehicleDrivingExt:_detect_collisions(t, dt)
	slot5 = self._vehicle
	local current_speed = self._vehicle.velocity(slot4)

	if dt ~= 0 then
		slot6 = self._vehicle

		if self._vehicle.is_active(slot5) then
			local dv = self._old_speed - current_speed
			slot9 = dv
			slot7 = dv.length(slot8) / 100 / dt
			local gforce = math.abs(slot6) / 9.81

			if 15 < gforce then
				slot11 = 100
				local ray_from = self._seats.driver.object.position(slot7) + Vector3(self._seats.driver.object, 0, 0)
				local distance = mvector3.copy(self._seats.driver.object)
				slot10 = distance

				mvector3.normalize(self._old_speed)

				slot11 = 300

				mvector3.multiply(self._old_speed, distance)

				slot16 = "slot_mask"
				slot20 = "world_geometry"
				local ray = World.raycast(self._old_speed, World, "ray", ray_from, ray_from + distance, "sphere_cast_radius", 75, managers.slot.get_mask(slot18, managers.slot))

				if ray and ray.unit then
					slot14 = self._old_speed

					self.on_impact(slot10, self, ray, gforce)
				elseif self._seats.passenger_front then
					slot14 = 100
					ray_from = self._seats.passenger_front.object.position(slot10) + Vector3(self._seats.passenger_front.object, 0, 0)
					slot17 = "slot_mask"
					slot21 = "world_geometry"
					ray = World.raycast(Vector3(self._seats.passenger_front.object, 0, 0), World, "ray", ray_from, ray_from + distance, "sphere_cast_radius", 75, managers.slot.get_mask(slot19, managers.slot))

					if ray and ray.unit then
						slot14 = self._old_speed

						self.on_impact(slot10, self, ray, gforce)
					else
						slot14 = self._old_speed

						self.on_impact(slot10, self, nil, gforce)
					end
				end
			end
		end
	end

	self._old_speed = current_speed

	return 
end
function VehicleDrivingExt:_detect_invalid_possition(t, dt)
	local respawn = false
	local rot = self._vehicle.rotation(slot5)
	slot7 = rot

	if rot.z(self._vehicle).z < 0.6 and not self._invalid_position_since then
		self._invalid_position_since = t
	else
		slot7 = rot

		if 0.6 <= rot.z(slot6).z and self._invalid_position_since then
			self._invalid_position_since = nil
		end
	end

	slot7 = self._vehicle
	slot7 = self._vehicle.velocity(slot6)
	local velocity = self._vehicle.velocity(slot6).length(slot6)

	if velocity < 10 and not self._stopped_since then
		self._stopped_since = t
	elseif 10 <= velocity and self._stopped_since then
		self._stopped_since = nil
	end

	if self._stopped_since and 0.2 < t - self._stopped_since and self._invalid_position_since and 0.2 < t - self._invalid_position_since then
		respawn = true
	end

	local state = self._vehicle.get_state(slot7)
	local speed = state.get_speed(self._vehicle)
	slot10 = state
	local gear = state.get_gear(state)

	if self._current_state_name == VehicleDrivingExt.STATE_DRIVING then
		local condition = gear ~= 1 and velocity < 10 and speed < 0.5 and 0.2 < self._last_input_fwd_dt and 0.2 < self._last_input_bwd_dt and self._stopped_since and 0.5 < t - self._stopped_since

		if condition then
			self._could_not_move = condition
		elseif 0.5 < speed then
			self._could_not_move = false
			self._last_input_bwd_dt = 0
			self._last_input_fwd_dt = 0
		end
	end

	self.respawn_available = respawn or self._could_not_move
	self._position_dt = self._position_dt + dt

	if 1 < self._position_dt then
		if not self.respawn_available and 2 < speed then
			slot11 = rot

			if 0.9 <= rot.z(slot10).z then
				if not self._positions[self._position_counter] then
					self._positions[self._position_counter] = {}
				end

				slot12 = self._vehicle
				self._positions[self._position_counter].pos = self._vehicle.position(slot11)
				slot12 = self._vehicle
				self._positions[self._position_counter].rot = self._vehicle.rotation(slot11)
				slot12 = self._unit
				self._positions[self._position_counter].oobb = self._unit.oobb(slot11)
				self._position_counter = self._position_counter + 1

				if self._position_counter == 20 then
					self._position_counter = 0
					self._position_counter_turnover = true
				end
			end
		end

		self._position_dt = 0
	end

	if self.respawn_available and not self._respawn_available_since then
		self._respawn_available_since = t
	elseif not self.respawn_available then
		self._respawn_available_since = nil
	end

	if self._respawn_available_since and 10 < t - self._respawn_available_since then
		slot12 = true

		self.respawn_vehicle(slot10, self)
	end

	return 
end
function VehicleDrivingExt:respawn_vehicle(auto_respawn)
	self.respawn_available = false

	if auto_respawn then
	end

	slot4 = "Respawning vehicle on last valid position"

	print(slot3)

	self._stopped_since = nil
	self._invalid_position_since = nil
	self._last_input_bwd_dt = 0
	self._last_input_fwd_dt = 0
	self._could_not_move = false
	local counter = self._position_counter - 4

	if counter < 0 then
		if self._position_counter_turnover then
			counter = 20 + counter
		else
			counter = 0
		end
	end

	self._position_counter = self._position_counter - 1

	if self._position_counter < 0 then
		if self._position_counter_turnover then
			self._position_counter = 20 + self._position_counter
		else
			self._position_counter = 0
		end
	end

	slot7 = counter

	Application.debug(slot4, Application, "Using respawn position on the index:")

	while 0 <= counter do
		if self._positions[counter] then
			slot6 = counter
		else
			slot7 = counter

			Application.debug(slot4, Application, "[VehicleDrivingExt:respawn_vehicle] Trying to respawn vehicle on occupied position")

			counter = counter - 1
		end
	end

	return 
end
function VehicleDrivingExt:_check_respawn_spot_valid(counter)
	local oobb = self._positions[counter].oobb
	slot6 = "all"
	local slotmask = managers.slot.get_mask(slot4, managers.slot)
	slot15 = oobb
	slot14 = slotmask
	local units = World.find_units(managers.slot, World, self._unit, "intersect", "obb", oobb.center(slot11), oobb.x(oobb) * 0.8, oobb.y(oobb) * 0.8, oobb.z(oobb) * 0.8)

	if 0 < #units then
		return false
	else
		return true
	end

	return 
end
function VehicleDrivingExt:_play_sound_events(t, dt)
	slot5 = self._vehicle
	local state = self._vehicle.get_state(slot4)
	local slip = false
	local bump = false
	local going_reverse = false
	slot9 = state
	local speed = state.get_speed(slot8) * 3.6
	slot12 = state

	for id, wheel_state in pairs(state.wheel_states(slot11)) do
		slot15 = wheel_state
		local current_jounce = wheel_state.jounce(slot14)
		local last_frame_jounce = self._wheel_jounce[id]

		if last_frame_jounce == nil then
			last_frame_jounce = 0
		end

		local dj = current_jounce - last_frame_jounce
		local jerk = dj / dt

		if self._tweak_data.sound.bump_treshold < jerk then
			bump = true
		end

		self._wheel_jounce[id] = current_jounce
		slot21 = wheel_state

		if self._tweak_data.sound.lateral_slip_treshold < math.abs(wheel_state.lat_slip(slot20)) then
			slip = true
		else
			slot21 = wheel_state

			if self._tweak_data.sound.longitudal_slip_treshold < math.abs(wheel_state.long_slip(slot20)) then
				slot19 = state

				if 500 < state.get_rpm(slot18) then
					slip = true
				end
			end
		end
	end

	slot10 = state

	if state.get_gear(slot9) == 0 and 0.5 < speed then
		going_reverse = true
	end

	if slip and self._slip_sound then
		if self._playing_slip_sound_dt == 0 then
			slot11 = self._slip_sound

			self._slip_soundsource.post_event(slot9, self._slip_soundsource)

			self._playing_slip_sound_dt = self._playing_slip_sound_dt + dt
		end
	elseif 0.1 < self._playing_slip_sound_dt then
		slot11 = self._slip_sound_stop

		self._slip_soundsource.post_event(slot9, self._slip_soundsource)

		self._playing_slip_sound_dt = 0
	end

	if 0 < self._playing_slip_sound_dt then
		self._playing_slip_sound_dt = self._playing_slip_sound_dt + dt
	end

	if going_reverse and self._reverse_sound then
		if self._playing_reverse_sound_dt == 0 then
			slot11 = self._reverse_sound

			self._door_soundsource.post_event(slot9, self._door_soundsource)

			self._playing_reverse_sound_dt = self._playing_reverse_sound_dt + dt
		end
	elseif 0.1 < self._playing_reverse_sound_dt then
		slot11 = self._reverse_sound_stop

		self._door_soundsource.post_event(slot9, self._door_soundsource)

		self._playing_reverse_sound_dt = 0
	end

	if 0 < self._playing_reverse_sound_dt then
		self._playing_reverse_sound_dt = self._playing_reverse_sound_dt + dt
	end

	if bump and self._bump_sound then
		slot16 = 100
		slot12 = 2 * math.clamp(slot13, speed, 0)

		self._bump_soundsource.set_rtpc(slot9, self._bump_soundsource, self._bump_rtpc)

		slot11 = self._bump_sound

		self._bump_soundsource.post_event(slot9, self._bump_soundsource)

		slot12 = {
			skip_idle_check = true
		}

		managers.dialog.queue_dialog(slot9, managers.dialog, "gen_vehicle_rough_ride")
	end

	slot10 = self._vehicle
	slot10 = self._vehicle.get_state(slot9)
	local current_gear = self._vehicle.get_state(slot9).get_gear(slot9)

	if not self._last_gear then
		self._last_gear = current_gear
	end

	if self._last_gear ~= 1 and current_gear ~= self._last_gear and self._tweak_data.sound.gear_shift then
		slot12 = self._tweak_data.sound.gear_shift

		self._engine_soundsource.post_event(slot10, self._engine_soundsource)
	end

	self._last_gear = current_gear
	slot12 = state

	self._play_engine_sound(slot10, self)

	return 
end
function VehicleDrivingExt:_start_engine_sound()
	if not self._playing_engine_sound and self._engine_soundsource then
		self._playing_engine_sound = true

		if self._tweak_data.sound.engine_start then
			slot4 = self._tweak_data.sound.engine_start

			self._engine_soundsource.post_event(slot2, self._engine_soundsource)
		else
			slot4 = "[Vehicle] No sound specified for engine_start"

			Application.error(slot2, Application)
		end

		if self._tweak_data.sound.engine_sound_event then
			slot4 = self._tweak_data.sound.engine_sound_event

			self._engine_soundsource.post_event(slot2, self._engine_soundsource)

			self._playing_engine_sound = true
		else
			slot4 = "[Vehicle] No sound specified for engine_sound_event"

			Application.error(slot2, Application)
		end

		slot4 = "VehicleDrivingExt:_start_engine_sound() engine start: "
		slot7 = self._tweak_data.sound.engine_start

		Application.trace(slot2, Application, inspect(slot6))

		slot4 = "VehicleDrivingExt:_start_engine_sound(): engine sound event"
		slot7 = self._tweak_data.sound.engine_start

		Application.trace(slot2, Application, inspect(slot6))
	end

	return 
end
function VehicleDrivingExt:_stop_engine_sound()
	if self._playing_engine_sound and self._engine_soundsource then
		if self._tweak_data.sound.engine_stop then
			slot4 = self._tweak_data.sound.engine_stop

			self._engine_soundsource.post_event(slot2, self._engine_soundsource)
		else
			slot3 = self._engine_soundsource

			self._engine_soundsource.stop(slot2)
		end

		self._playing_engine_sound = false
	end

	return 
end
function VehicleDrivingExt:_start_broken_engine_sound()
	if not self._playing_engine_sound and self._engine_soundsource and self._tweak_data.sound.broken_engine then
		slot4 = self._tweak_data.sound.broken_engine

		self._engine_soundsource.post_event(slot2, self._engine_soundsource)

		self._playing_engine_sound = true
	end

	return 
end
function VehicleDrivingExt:_play_engine_sound(state)
	local speed = state.get_speed(slot3) * 3.6
	slot5 = state
	local rpm = state.get_rpm(state)
	local max_speed = self._tweak_data.max_speed
	slot7 = self._vehicle
	local max_rpm = self._vehicle.get_max_rpm(slot6)
	local relative_speed = speed / max_speed

	if 1 < relative_speed then
		relative_speed = 1
	end

	self._relative_rpm = rpm / max_rpm

	if 1 < self._relative_rpm then
		self._relative_rpm = 1
	end

	if self._engine_soundsource == nil then
		return 
	end

	if not self._playing_engine_sound then
		return 
	end

	local rpm_rtpc = math.round(slot8)
	local speed_rtpc = math.round(self._relative_rpm * 100)
	slot13 = rpm_rtpc

	self._engine_soundsource.set_rtpc(relative_speed * 100, self._engine_soundsource, self._tweak_data.sound.engine_rpm_rtpc)

	slot13 = speed_rtpc

	self._engine_soundsource.set_rtpc(relative_speed * 100, self._engine_soundsource, self._tweak_data.sound.engine_speed_rtpc)

	return 
end
function VehicleDrivingExt:play_horn_sound()
	if self._tweak_data.sound.horn_start then
		slot3 = self._unit
		slot4 = self._tweak_data.sound.horn_start

		self._unit.sound_source(slot2).post_event(slot2, self._unit.sound_source(slot2))
	end

	return 
end
function VehicleDrivingExt:stop_horn_sound()
	if self._tweak_data.sound.horn_stop then
		slot3 = self._unit
		slot4 = self._tweak_data.sound.horn_stop

		self._unit.sound_source(slot2).post_event(slot2, self._unit.sound_source(slot2))
	end

	return 
end
function VehicleDrivingExt:stop_all_sound_events()
	slot3 = self._hit_soundsource

	self._hit_soundsource.stop(slot2)

	slot3 = self._slip_soundsource

	self._slip_soundsource.stop(slot2)

	slot3 = self._bump_soundsource

	self._bump_soundsource.stop(slot2)

	if self._engine_soundsource then
		slot3 = self._engine_soundsource

		self._engine_soundsource.stop(slot2)
	end

	self._playing_slip_sound_dt = 0

	return 
end
function VehicleDrivingExt:_unregister_drive_SO()
	slot3 = self._seats

	for _, seat in pairs(slot2) do
		slot9 = seat

		self._unregister_drive_SO_seat(slot7, self)
	end

	return 
end
function VehicleDrivingExt:_unregister_drive_SO_seat(seat)
	if seat.drive_SO_data then
		local SO_data = seat.drive_SO_data
		seat.drive_SO_data = nil

		if SO_data.SO_registered then
			slot5 = managers.groupai
			slot6 = SO_data.SO_id

			managers.groupai.state(slot4).remove_special_objective(slot4, managers.groupai.state(slot4))
		end

		slot5 = SO_data.unit

		if alive(slot4) then
			slot5 = SO_data.unit
			slot6 = nil

			SO_data.unit.brain(slot4).set_objective(slot4, SO_data.unit.brain(slot4))
		end
	end

	return 
end
function VehicleDrivingExt:_chk_register_drive_SO()

	-- Decompilation error in this vicinity:
	slot3 = Network
	slot3 = self._seats

	for _, seat in pairs(slot2) do
		slot8 = seat.occupant

		if alive(slot7) then
			slot8 = seat.occupant
		elseif not seat.drive_SO_data then
			slot9 = seat

			self._create_seat_SO(slot7, self)
		end
	end

	return 
end
function VehicleDrivingExt:_create_seat_SO(seat)
	if seat.drive_SO_data then
		return 
	end

	slot4 = managers.groupai
	slot5 = "criminal"
	local SO_filter = managers.groupai.state(slot3).get_unit_type_filter(slot3, managers.groupai.state(slot3))
	slot8 = seat.SO_object
	local tracker_align = managers.navigation.create_nav_tracker(managers.groupai.state(slot3), managers.navigation, seat.SO_object.position(false))
	local align_nav_seg = tracker_align.nav_segment(managers.navigation)
	local align_pos = seat.SO_object.position(tracker_align)
	local align_rot = seat.SO_object.rotation(seat.SO_object)
	slot9 = managers.groupai
	slot10 = align_nav_seg
	local align_area = managers.groupai.state(seat.SO_object).get_area_from_nav_seg_id(seat.SO_object, managers.groupai.state(seat.SO_object))
	slot11 = tracker_align

	managers.navigation.destroy_nav_tracker(managers.groupai.state(seat.SO_object), managers.navigation)

	local team_ai_animation = self._tweak_data.animations[seat.name]
	slot11 = self

	if self.shooting_stance_mandatory(managers.navigation) and seat.shooting_pos and seat.has_shooting_mode then
		team_ai_animation = team_ai_animation .. "_shooting"
	end

	local haste = "walk"
	slot12 = managers.groupai

	if managers.groupai.state(slot11)._police_called then
		haste = "run"
	end

	local ride_objective = {
		pose = "stand",
		destroy_clbk_key = false,
		type = "act",
		haste = haste,
		nav_seg = align_nav_seg,
		area = align_area,
		pos = align_pos,
		rot = align_rot
	}
	slot16 = seat
	ride_objective.fail_clbk = callback(slot12, self, self, "on_drive_SO_failed")
	ride_objective.action = {
		align_sync = false,
		needs_full_blend = true,
		type = "act",
		body_part = 1,
		variant = team_ai_animation,
		blocks = {
			act = 1,
			hurt = -1,
			action = -1,
			heavy_hurt = -1,
			walk = -1
		}
	}
	ride_objective.objective_type = VehicleDrivingExt.SPECIAL_OBJECTIVE_TYPE_DRIVING
	local SO_descriptor = {
		interval = 0,
		chance_inc = 0,
		base_chance = 1,
		usage_amount = 1,
		AI_group = "friendlies",
		objective = ride_objective,
		search_pos = ride_objective.pos
	}
	slot17 = seat
	SO_descriptor.admin_clbk = callback(self, self, self, "on_drive_SO_administered")
	slot17 = self._unit
	local SO_id = "ride_" .. tostring(self._unit.key("on_drive_SO_administered")) .. seat.name
	seat.drive_SO_data = {
		SO_registered = true,
		SO_id = SO_id,
		align_area = align_area,
		ride_objective = ride_objective
	}
	slot15 = managers.groupai
	slot17 = SO_descriptor

	managers.groupai.state(seat.name).add_special_objective(seat.name, managers.groupai.state(seat.name), SO_id)

	return 
end
function VehicleDrivingExt:clbk_drive_SO_verification(candidate_unit)
	return true
end
function VehicleDrivingExt:on_drive_SO_administered(seat, unit)
	slot5 = self._unit

	if not alive(slot4) then
		return 
	end

	if seat.drive_SO_data.unit then
		slot8 = seat.drive_SO_data.unit

		debug_pause(slot4, "[VehicleDrivingExt:on_drive_SO_administered] Already had a unit!!!!", seat.name, unit)
	end

	seat.drive_SO_data.unit = unit
	seat.drive_SO_data.SO_registered = false
	slot5 = unit
	unit.movement(false).vehicle_unit = self._unit
	slot5 = unit
	unit.movement(self._unit).vehicle_seat = seat
	slot5 = managers.network
	slot10 = unit

	managers.network.session(self._unit).send_to_peers_synched(self._unit, managers.network.session(self._unit), "sync_ai_vehicle_action", "enter", self._unit, seat.name)

	return 
end
function VehicleDrivingExt:on_drive_SO_started(seat, unit)
	return 
end
function VehicleDrivingExt:on_drive_SO_completed(seat, unit)
	slot5 = self._unit

	if not alive(slot4) then
		return 
	end

	slot7 = unit

	self._place_ai_on_seat(slot4, self, seat)

	return 
end
function VehicleDrivingExt:on_drive_SO_failed(seat, unit)
	slot5 = self._unit

	if not alive(slot4) then
		return 
	end

	if not seat.drive_SO_data then
		return 
	end

	if unit ~= seat.drive_SO_data.unit then
		slot7 = unit

		debug_pause_unit(slot4, unit, "[VehicleDrivingExt:on_drive_SO_failed] team ai thinks he is riding")

		return 
	end

	seat.drive_SO_data = nil
	slot6 = seat

	self._create_seat_SO(slot4, self)

	return 
end
function VehicleDrivingExt:_place_ai_on_seat(seat, unit)
	local rot = seat.third_object.rotation(slot4)
	local pos = seat.third_object.position(seat.third_object)
	slot8 = rot

	unit.set_rotation(seat.third_object, unit)

	slot8 = pos

	unit.set_position(seat.third_object, unit)

	seat.occupant = unit
	slot10 = VehicleDrivingExt.THIRD_PREFIX .. seat.name

	self._unit.link(seat.third_object, self._unit, Idstring(unit))

	slot7 = managers.network

	if managers.network.session(seat.third_object) then
	end

	slot7 = unit
	slot8 = false

	unit.brain(slot6).set_active(slot6, unit.brain(slot6))

	return 
end
function VehicleDrivingExt:sync_ai_vehicle_action(action, seat_name, unit)
	if action == "enter" then
		slot6 = self._seats

		for _, seat in pairs(slot5) do
			if seat.name == seat_name then
				local rot = seat.third_object.rotation(slot10)
				local pos = seat.third_object.position(seat.third_object)
				slot13 = unit
				unit.movement(seat.third_object).vehicle_unit = self._unit
				slot13 = unit
				unit.movement(self._unit).vehicle_seat = seat
				slot14 = self._tweak_data.sound.door_close

				self._door_soundsource.post_event(self._unit, self._door_soundsource)
			end
		end
	elseif action == "exit" then
		slot6 = unit
		unit.movement(slot5).vehicle_unit = nil
		slot6 = unit
		unit.movement(nil).vehicle_seat = nil
	else
		slot8 = action

		debug_pause(slot5, "[VehicleDrivingExt:sync_ai_vehicle_action] Unknown value for parameter action!", "action")
	end

	return 
end
function VehicleDrivingExt:collision_callback(tag, unit, body, other_unit, other_body, position, normal, velocity, ...)
	if other_unit then
		slot11 = other_unit
	elseif other_unit then
		slot11 = other_unit

		if other_unit.damage(slot10) and other_body then
			slot11 = other_body

			if other_body.extension(slot10) then
				local damage = 1
				slot12 = other_body
				slot18 = velocity

				other_body.extension(slot11).damage.damage_collision(slot11, other_body.extension(slot11).damage, self._unit, normal, position, velocity, damage)
			end
		end
	end

	return 
end
function VehicleDrivingExt:on_impact(ray, gforce, velocity)
	if ray then
		slot7 = ray.hit_position

		self._hit_soundsource.set_position(slot5, self._hit_soundsource)
	else
		slot6 = self._hit_soundsource
		slot9 = self._unit

		self._hit_soundsource.set_position(slot5, self._unit.position(slot8))
	end

	if self._hit_sound then
		slot7 = self._hit_rtpc
		slot12 = 100

		self._hit_soundsource.set_rtpc(slot5, self._hit_soundsource, math.clamp(slot9, gforce / 2.5, 0))

		slot7 = self._hit_sound

		self._hit_soundsource.post_event(slot5, self._hit_soundsource)
	end

	local damage_ammount = gforce / 20

	if ray then
		local body = ray.body

		if ray.unit then
			slot8 = ray.unit

			if ray.unit.damage(slot7) and ray.body then
				slot8 = ray.body

				if ray.body.extension(slot7) then
					slot8 = ray.body
					slot14 = velocity

					ray.body.extension(slot7).damage.damage_collision(slot7, ray.body.extension(slot7).damage, self._unit, ray.normal, ray.position, velocity, damage_ammount)
				end
			end
		end
	end

	local attack_data = {
		damage = damage_ammount,
		col_ray = ray
	}
	slot8 = self._unit
	slot9 = attack_data

	self._unit.character_damage(slot7).damage_collision(slot7, self._unit.character_damage(slot7))

	slot10 = {
		skip_idle_check = true
	}

	managers.dialog.queue_dialog(slot7, managers.dialog, "gen_vehicle_taking_damage")

	slot8 = self._seats

	for _, seat in pairs(slot7) do
		slot13 = seat.occupant

		if alive(slot12) then
			slot13 = seat.occupant

			if seat.occupant.camera(slot12) then
				slot13 = seat.occupant
				slot15 = gforce / 500

				seat.occupant.camera(slot12).play_shaker(slot12, seat.occupant.camera(slot12), "player_land")
			end
		end
	end

	return 
end
function VehicleDrivingExt:shooting_stance_allowed()
	return self._shooting_stance_allowed
end
function VehicleDrivingExt:shooting_stance_mandatory()
	slot3 = self

	return self.loot_contains_german_spy(slot2)
end
function VehicleDrivingExt:_number_in_the_vehicle()
	local count = 0
	slot4 = self._seats

	for _, seat in pairs(slot3) do
		slot9 = seat.occupant

		if alive(slot8) then
			slot9 = seat.occupant

			if seat.occupant.brain(slot8) == nil then
				count = count + 1
			end
		end
	end

	return count
end
function VehicleDrivingExt:pre_destroy(unit)
	slot4 = self

	self._stop_seat_sound_environment(slot3)

	slot4 = self._hit_soundsource

	self._hit_soundsource.stop(slot3)

	slot4 = self._slip_soundsource

	self._slip_soundsource.stop(slot3)

	slot4 = self._bump_soundsource

	self._bump_soundsource.stop(slot3)

	slot4 = self._door_soundsource

	self._door_soundsource.stop(slot3)

	if self._engine_soundsource then
		slot4 = self._engine_soundsource

		self._engine_soundsource.stop(slot3)
	end

	slot4 = self

	self._delete_position_reservation(slot3)

	return 
end
function VehicleDrivingExt:destroy()
	slot6 = self._unit
	slot4 = self._unit.unit_data(slot5).name_label_id

	managers.hud._remove_name_label(slot2, managers.hud)

	slot6 = self._unit
	slot4 = self._unit.unit_data(slot5).name_label_id

	managers.hud.remove_vehicle_name_label(slot2, managers.hud)

	return 
end
function VehicleDrivingExt:save(data)
	data.vehicle_driving = {
		loot_interaction_enabled = self._loot_interaction_enabled,
		accepting_loot_enabled = self._accepting_loot_enabled,
		sequence_applied = self._skin_sequence
	}

	return 
end
function VehicleDrivingExt:load(data)
	if data.vehicle_driving and data.vehicle_driving.loot_interaction_enabled then
		slot4 = self

		self.enable_loot_interaction(slot3)
	else
		slot4 = self

		self.disable_loot_interaction(slot3)
	end

	if data.vehicle_driving and data.vehicle_driving.accepting_loot_enabled then
		slot4 = self

		self.enable_accepting_loot(slot3)
	else
		slot4 = self

		self.disable_accepting_loot(slot3)
	end

	local sequence_applied = data.vehicle_driving.sequence_applied

	if sequence_applied then
		slot6 = sequence_applied

		self.set_skin(slot4, self)
	end

	return 
end

return 
