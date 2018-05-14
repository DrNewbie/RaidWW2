if not NpcVehicleStateInactive then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStateInactive = slot0
function NpcVehicleStateInactive:init(unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
function NpcVehicleStateInactive:update(t, dt)
	return 
end
function NpcVehicleStateInactive:name()
	return NpcVehicleDrivingExt.STATE_INACTIVE
end

return 
