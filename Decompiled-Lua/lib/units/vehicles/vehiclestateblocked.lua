if not VehicleStateBlocked then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateBlocked = slot0
function VehicleStateBlocked:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
function VehicleStateBlocked:enter(state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._stop_engine_sound(slot4)

	slot5 = self._unit
	slot6 = VehicleDrivingExt.TIME_ENTER

	self._unit.interaction(slot4).set_override_timer_value(slot4, self._unit.interaction(slot4))

	slot5 = self

	self.adjust_interactions(slot4)

	slot5 = self._unit
	slot12 = 2

	self._unit.vehicle_driving(slot4).set_input(slot4, self._unit.vehicle_driving(slot4), 0, 0, 1, 1, false, false)

	return 
end
function VehicleStateBlocked:adjust_interactions()
	slot3 = self

	VehicleStateParked.super.adjust_interactions(slot2)

	slot3 = self._unit
	slot3 = self._unit.vehicle_driving(slot2)

	if self._unit.vehicle_driving(slot2).is_interaction_allowed(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_INTERACTION_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_LOOT_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_REPAIR_DISABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end

		slot3 = self._unit
		self._unit.vehicle_driving(slot2)._interaction_enter_vehicle = true
		slot3 = self._unit

		if self._unit.vehicle_driving(true)._has_trunk then
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_trunk = true
		else
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_loot = true
		end

		slot3 = self._unit
		self._unit.vehicle_driving(slot2)._interaction_repair = false
	end

	return 
end
function VehicleStateBlocked:allow_exit()
	return true
end
function VehicleStateBlocked:stop_vehicle()
	return true
end
function VehicleStateBlocked:is_vulnerable()
	return false
end

return 
