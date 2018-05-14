if not NpcVehicleStateManeuver then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStateManeuver = slot0
function NpcVehicleStateManeuver:init(unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
function NpcVehicleStateManeuver:on_enter(npc_driving_ext)
	local unit_id = npc_driving_ext._unit.unit_data(slot3).unit_id
	slot6 = unit_id

	managers.motion_path.remove_ground_unit_from_path(npc_driving_ext._unit, managers.motion_path)

	return 
end
function NpcVehicleStateManeuver:on_exit(npc_driving_ext)
	local unit_id = npc_driving_ext._unit.unit_data(slot3).unit_id
	slot6 = unit_id
	local path_info = managers.motion_path.find_nearest_ground_path(npc_driving_ext._unit, managers.motion_path)

	if path_info then
		path_info.unit_id = unit_id
		slot7 = path_info

		managers.motion_path.put_unit_on_path(slot5, managers.motion_path)
	end

	return 
end
function NpcVehicleStateManeuver:update(npc_driving_ext, t, dt)
	return 
end
function NpcVehicleStateManeuver:name()
	return NpcVehicleDrivingExt.STATE_MANEUVER
end
function NpcVehicleStateManeuver:change_state(npc_driving_ext)
	return 
end
function NpcVehicleStateManeuver:is_maneuvering()
	return true
end

return 
