if not NpcVehicleStatePursuit then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStatePursuit = slot0
function NpcVehicleStatePursuit:init(unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	slot4 = self._unit
	self._vehicle = self._unit.vehicle(slot3)
	self._next_checkpoint_distance = {
		{
			v_min = 30,
			distance = 1200,
			relative_angle_min = 30,
			relative_angle_max = 60,
			v_max = 40
		},
		{
			v_min = 40,
			distance = 1400,
			relative_angle_min = 30,
			relative_angle_max = 90,
			v_max = 60
		},
		{
			v_min = 60,
			distance = 2000,
			relative_angle_min = 30,
			relative_angle_max = 90,
			v_max = 90
		}
	}
	local cop_position = self._unit.position()
	slot5 = Application
	local delayed_tick = Application.time(self._unit) + 5
	self._tachograph = {
		distance = 0,
		timeframe = 1,
		tick_at = delayed_tick,
		last_pos = cop_position
	}

	return 
end
function NpcVehicleStatePursuit:on_enter(npc_driving_ext)
	slot4 = "Npc state change: "
	slot7 = self

	print(slot3, self.name(slot6))

	local cop_position = self._unit.position(slot3)
	slot5 = Application
	local delayed_tick = Application.time(self._unit) + 5
	self._tachograph = {
		distance = 0,
		timeframe = 1,
		tick_at = delayed_tick,
		last_pos = cop_position
	}
	self._next_state = nil
	self._desired_direction = 0

	return 
end
function NpcVehicleStatePursuit:update(t, dt)
	return 
end
function NpcVehicleStatePursuit:name()
	return NpcVehicleDrivingExt.STATE_PURSUIT
end
function NpcVehicleStatePursuit:calc_steering(angle)
	self._desired_direction = angle
	local direction = 0
	local normalized_steer = 0
	local scale_steering = 1
	local final_steer = 0
	local FULL_TURN_ANGLE_THRESHOLD = 20

	if 0 <= angle and angle < 90 then
		direction = 1
		slot11 = 1
		normalized_steer = math.clamp(slot8, angle / FULL_TURN_ANGLE_THRESHOLD, 0)
		final_steer = normalized_steer * direction
	elseif 90 <= angle and angle < 180 then
		direction = 1
		final_steer = direction
	elseif 180 <= angle and angle < 270 then
		direction = -1
		final_steer = direction
	elseif 270 <= angle then
		direction = -1
		slot11 = 1
		normalized_steer = math.clamp(slot8, (90 - angle - 270) / FULL_TURN_ANGLE_THRESHOLD, 0)
		final_steer = normalized_steer * direction
	end

	return final_steer
end
function NpcVehicleStatePursuit:calc_distance_threshold(angle)
	local vehicle_state = self._vehicle.get_state(slot3)
	slot5 = vehicle_state
	local current_speed = vehicle_state.get_speed(self._vehicle) * 3.6
	local threshold = 1000
	slot7 = self._next_checkpoint_distance

	for _, data in ipairs(slot6) do
		if data.v_min < current_speed and current_speed <= data.v_max and data.relative_angle_min < angle and angle <= data.relative_angle_max then
			threshold = data.distance
		end
	end

	return threshold
end
function NpcVehicleStatePursuit:calc_speed_limit(path, unit_and_pos)
	local default_speed_limit = path.default_speed_limit or -1
	local retval = default_speed_limit
	local points_in_direction = nil

	if not unit_and_pos.direction or unit_and_pos.direction == "fwd" then
		points_in_direction = path.points
	else
		points_in_direction = path.points_bck
	end

	local target_speed = points_in_direction[unit_and_pos.target_checkpoint].speed

	if target_speed ~= -1 then
		retval = target_speed / 27.77
	end

	return retval
end
function NpcVehicleStatePursuit:handle_hard_turn(npc_driving_ext, angle_to_target)
	local vehicle_state = self._vehicle.get_state(slot4)
	slot6 = vehicle_state
	local current_speed = vehicle_state.get_speed(self._vehicle) * 3.6

	if 90 < angle_to_target and 20 < current_speed then
		npc_driving_ext._current_drive_controls = "handbrake"
	elseif not self._last_checkpoint_reached then
		npc_driving_ext._current_drive_controls = "accelerate"
	end

	return 
end
function NpcVehicleStatePursuit:evasion_maneuvers(npc_driving_ext, target_steering)
	slot7 = target_steering

	return self._loco_unit_proximity(slot4, self, npc_driving_ext)
end
function NpcVehicleStatePursuit:_loco_unit_proximity(npc_driving_ext, target_steering)
	local retval = nil
	slot6 = npc_driving_ext
	local player_unit = npc_driving_ext._get_target_unit(slot5)

	if not player_unit then
		return retval
	end

	local player_position = player_unit.position(slot6)
	slot8 = self._unit
	local cop_position = self._unit.position(player_unit)
	slot11 = player_position - cop_position
	local distance_to_player = math.abs(player_position - cop_position.length(slot10)) / 100
	local acceleration = 0
	local brake = 0
	local handbrake = 0

	if npc_driving_ext._drive_mode and npc_driving_ext._drive_mode[npc_driving_ext._current_drive_mode] then
		acceleration = npc_driving_ext._drive_mode[npc_driving_ext._current_drive_mode].acceleration
		brake = npc_driving_ext._drive_mode[npc_driving_ext._current_drive_mode].brake
		handbrake = npc_driving_ext._drive_mode[npc_driving_ext._current_drive_mode].handbrake
	end

	if npc_driving_ext._debug.nav_paths then
		npc_driving_ext._debug.nav_paths.distance_to_player = distance_to_player
	end

	slot13 = managers.motion_path
	local current_player_proximity_distance = managers.motion_path.get_player_proximity_distance(slot12)

	if distance_to_player < current_player_proximity_distance then
		local unit_id = self._unit.unit_data(slot13).unit_id
		slot17 = current_player_proximity_distance

		managers.motion_path.set_player_proximity_distance_for_unit(self._unit, managers.motion_path, unit_id)

		slot15 = managers.motion_path

		managers.motion_path.increase_player_proximity_distance(self._unit)

		slot16 = NpcVehicleDrivingExt.STATE_PLAYER_PROXIMITY

		npc_driving_ext.set_state(self._unit, npc_driving_ext)

		retval = {
			acceleration = 0,
			handbrake = 1,
			brake = 1,
			steering = target_steering
		}
	end

	return retval
end
function NpcVehicleStatePursuit:change_state(npc_driving_ext)
	if self._next_state then
		slot5 = self._next_state

		npc_driving_ext.set_state(slot3, npc_driving_ext)
	end

	return 
end
function NpcVehicleStatePursuit:is_maneuvering()
	return false
end
function NpcVehicleStatePursuit:handle_stuck_vehicle(npc_driving_ext, t, dt)
	if not self._tachograph then
		return 
	end

	if self._tachograph.tick_at < t then
		slot6 = self._unit
		local cop_position = self._unit.position(slot5)
		self._tachograph.tick_at = t + self._tachograph.timeframe
		slot8 = cop_position - self._tachograph.last_pos
		self._tachograph.distance = cop_position - self._tachograph.last_pos.length(slot7) / 100
		self._tachograph.last_pos = cop_position

		if self._tachograph.distance <= 1 then
			slot7 = self
			self._next_state = self._choose_recovery_maneuver(slot6)
		end
	end

	return 
end
function NpcVehicleStatePursuit:_choose_recovery_maneuver()
	local recovery_maneuver = nil

	if 0 <= self._desired_direction and self._desired_direction < 90 then
		recovery_maneuver = NpcVehicleDrivingExt.STATE_MANEUVER_BACK_LEFT
	elseif 90 <= self._desired_direction and self._desired_direction < 180 then
		recovery_maneuver = NpcVehicleDrivingExt.STATE_MANEUVER_BACK_LEFT
	elseif 180 <= self._desired_direction and self._desired_direction < 270 then
		recovery_maneuver = NpcVehicleDrivingExt.STATE_MANEUVER_BACK_RIGHT
	elseif 270 <= self._desired_direction then
		recovery_maneuver = NpcVehicleDrivingExt.STATE_MANEUVER_BACK_RIGHT
	end

	return recovery_maneuver
end

return 
