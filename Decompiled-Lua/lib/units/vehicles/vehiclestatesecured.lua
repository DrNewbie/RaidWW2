if not VehicleStateSecured then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateSecured = slot0
function VehicleStateSecured:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
function VehicleStateSecured:enter(state_data, enter_data)
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
function VehicleStateSecured:adjust_interactions()
	slot3 = self

	VehicleStateSecured.super.adjust_interactions(slot2)

	slot3 = self._unit
	slot3 = self._unit.vehicle_driving(slot2)

	if self._unit.vehicle_driving(slot2).is_interaction_allowed(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot3 = self._unit.vehicle_driving(slot2)._unit
				slot4 = VehicleDrivingExt.INTERACT_ENTRY_DISABLED

				self._unit.vehicle_driving(slot2)._unit.damage(slot2).run_sequence_simple(slot2, self._unit.vehicle_driving(slot2)._unit.damage(slot2))

				slot3 = self._unit
				slot3 = self._unit.vehicle_driving(slot2)._unit
				slot4 = VehicleDrivingExt.INTERACT_LOOT_DISABLED

				self._unit.vehicle_driving(slot2)._unit.damage(slot2).run_sequence_simple(slot2, self._unit.vehicle_driving(slot2)._unit.damage(slot2))

				slot3 = self._unit
				slot3 = self._unit.vehicle_driving(slot2)._unit
				slot4 = VehicleDrivingExt.INTERACT_REPAIR_DISABLED

				self._unit.vehicle_driving(slot2)._unit.damage(slot2).run_sequence_simple(slot2, self._unit.vehicle_driving(slot2)._unit.damage(slot2))

				slot3 = self._unit
				slot3 = self._unit.vehicle_driving(slot2)._unit
				slot4 = VehicleDrivingExt.INTERACT_INTERACTION_DISABLED

				self._unit.vehicle_driving(slot2)._unit.damage(slot2).run_sequence_simple(slot2, self._unit.vehicle_driving(slot2)._unit.damage(slot2))
			end
		end

		self._interaction_enter_vehicle = false
		self._interaction_loot = false
		slot3 = self._unit

		if self._unit.vehicle_driving(slot2)._has_trunk then
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_trunk = true
		else
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_loot = true
		end

		self._interaction_repair = false
	end

	return 
end
function VehicleStateSecured:stop_vehicle()
	return true
end

return 
