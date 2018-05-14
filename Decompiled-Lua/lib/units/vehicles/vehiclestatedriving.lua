if not VehicleStateDriving then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateDriving = slot0
function VehicleStateDriving:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
function VehicleStateDriving:enter(state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._start_engine_sound(slot4)

	slot5 = self._unit
	slot6 = VehicleDrivingExt.TIME_ENTER

	self._unit.interaction(slot4).set_override_timer_value(slot4, self._unit.interaction(slot4))

	slot5 = self

	self.adjust_interactions(slot4)

	slot5 = self._unit
	slot7 = 0

	self._unit.interaction(slot4).set_contour(slot4, self._unit.interaction(slot4), "standard_color")

	return 
end
function VehicleStateDriving:adjust_interactions()
	slot3 = self

	VehicleStateDriving.super.adjust_interactions(slot2)

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
function VehicleStateDriving:is_vulnerable()
	return true
end

return 
