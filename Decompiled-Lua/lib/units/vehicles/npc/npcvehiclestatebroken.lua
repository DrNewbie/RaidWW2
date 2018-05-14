if not NpcVehicleStateBroken then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStateBroken = slot0
function NpcVehicleStateBroken:init(unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
function NpcVehicleStateBroken:update(t, dt)
	return 
end
function NpcVehicleStateBroken:name()
	return NpcVehicleDrivingExt.STATE_BROKEN
end
function NpcVehicleStateBroken:on_enter()
	slot3 = "NpcVehicleStateBroken:on_enter()"

	print(slot2)

	slot3 = self._unit
	slot4 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

	if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
		slot3 = self._unit
		slot4 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	return 
end

return 
