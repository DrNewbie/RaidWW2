if not VehicleStateFrozen then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateFrozen = slot0
function VehicleStateFrozen:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
function VehicleStateFrozen:enter(state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)._hit_soundsource

	self._unit.vehicle_driving(slot4)._hit_soundsource.stop(slot4)

	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)._slip_soundsource

	self._unit.vehicle_driving(slot4)._slip_soundsource.stop(slot4)

	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)._bump_soundsource

	self._unit.vehicle_driving(slot4)._bump_soundsource.stop(slot4)

	slot5 = self._unit
	slot6 = VehicleDrivingExt.TIME_ENTER

	self._unit.interaction(slot4).set_override_timer_value(slot4, self._unit.interaction(slot4))

	slot5 = self._unit
	self._unit.vehicle_driving(slot4)._shooting_stance_allowed = false
	slot5 = self

	self.disable_interactions(false)

	slot5 = self._unit
	slot12 = 2

	self._unit.vehicle_driving(false).set_input(false, self._unit.vehicle_driving(false), 0, 0, 1, 1, false, false)

	return 
end
function VehicleStateFrozen:allow_exit()
	return false
end
function VehicleStateFrozen:stop_vehicle()
	return true
end
function VehicleStateFrozen:is_vulnerable()
	return false
end

return 
