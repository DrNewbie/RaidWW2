if not NpcVehicleStatePlayerProximity then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStatePlayerProximity = slot0
function NpcVehicleStatePlayerProximity:init(unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
function NpcVehicleStatePlayerProximity:on_enter(npc_driving_ext)
	return 
end
function NpcVehicleStatePlayerProximity:on_exit(npc_driving_ext)
	slot4 = managers.motion_path

	managers.motion_path.reset_player_proximity_distance(slot3)

	return 
end
function NpcVehicleStatePlayerProximity:update(t, dt)
	return 
end
function NpcVehicleStatePlayerProximity:name()
	return NpcVehicleDrivingExt.STATE_PLAYER_PROXIMITY
end
function NpcVehicleStatePlayerProximity:change_state(npc_driving_ext)
	slot4 = npc_driving_ext
	local player_unit = npc_driving_ext._get_target_unit(slot3)

	if not player_unit then
		return 
	end

	local player_position = player_unit.position(slot4)
	slot6 = self._unit
	local cop_position = self._unit.position(player_unit)
	slot9 = player_position - cop_position
	local distance_to_player = math.abs(player_position - cop_position.length(slot8)) / 100

	if npc_driving_ext._debug.nav_paths then
		npc_driving_ext._debug.nav_paths.distance_to_player = distance_to_player
	end

	local unit_id = self._unit.unit_data(slot7).unit_id
	slot10 = unit_id
	local unit_to_player_proximity_distance = managers.motion_path.get_player_proximity_distance_for_unit(self._unit, managers.motion_path)

	if unit_to_player_proximity_distance <= distance_to_player then
		slot11 = NpcVehicleDrivingExt.STATE_PURSUIT

		npc_driving_ext.set_state(slot9, npc_driving_ext)
	end

	return 
end

return 
