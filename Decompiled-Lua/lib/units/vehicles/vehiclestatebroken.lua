-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not VehicleStateBroken then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateBroken = slot0
function VehicleStateBroken:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
function VehicleStateBroken:enter(state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._stop_engine_sound(slot4)

	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._start_broken_engine_sound(slot4)

	slot5 = self

	self.adjust_interactions(slot4)

	slot5 = self._unit
	slot12 = 2

	self._unit.vehicle_driving(slot4).set_input(slot4, self._unit.vehicle_driving(slot4), 0, 0, 1, 1, false, false)

	slot5 = managers.player
	local player_vehicle = managers.player.get_vehicle(slot4)

	if player_vehicle and player_vehicle.vehicle_unit == self._unit then
		slot7 = {
			duration = 3,
			shelf_life = 5,
			id = "hud_vehicle_broken",
			text = managers.localization.text(slot9, managers.localization)
		}
		slot11 = "hud_vehicle_broken"

		managers.notification.add_notification(slot5, managers.notification)
	end

	slot6 = self._unit
	slot7 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

	if self._unit.damage(slot5).has_sequence(slot5, self._unit.damage(slot5)) then
		slot6 = self._unit
		slot7 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

		self._unit.damage(slot5).run_sequence_simple(slot5, self._unit.damage(slot5))
	end

	slot6 = self._unit
	slot8 = 1

	self._unit.interaction(slot5).set_contour(slot5, self._unit.interaction(slot5), "standard_color")

	return 
end
function VehicleStateBroken:adjust_interactions()
	slot3 = self

	VehicleStateBroken.super.adjust_interactions(slot2)

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
				slot4 = VehicleDrivingExt.INTERACT_ENTRY_DISABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_LOOT_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_REPAIR_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				self._unit.vehicle_driving(slot2)._interaction_enter_vehicle = false
				slot3 = self._unit

				if self._unit.vehicle_driving(false)._has_trunk then
					slot3 = self._unit
					self._unit.vehicle_driving(slot2)._interaction_trunk = true
				else
					slot3 = self._unit
					self._unit.vehicle_driving(slot2)._interaction_loot = true
				end

				slot3 = self._unit
				self._unit.vehicle_driving(slot2)._interaction_repair = true
			end
		end
	end

	return 
end
function VehicleStateBroken:get_action_for_interaction(pos, locator, tweak_data)
	local action = VehicleDrivingExt.INTERACT_INVALID
	slot7 = self._unit
	local seat, seat_distance = self._unit.vehicle_driving(slot6).get_available_seat(slot6, self._unit.vehicle_driving(slot6))
	slot9 = self._unit
	local loot_point, loot_point_distance = self._unit.vehicle_driving(pos).get_nearest_loot_point(pos, self._unit.vehicle_driving(pos))
	slot11 = self._unit
	slot11 = self._unit.vehicle_driving(pos)

	if self._unit.vehicle_driving(pos).is_loot_interaction_enabled(pos) and seat and loot_point and loot_point_distance <= seat_distance then
		slot11 = managers.player
	else
		action = VehicleDrivingExt.INTERACT_REPAIR
		slot11 = self._unit
		slot12 = VehicleDrivingExt.TIME_REPAIR

		self._unit.interaction(slot10).set_override_timer_value(slot10, self._unit.interaction(slot10))
	end

	return action
end
function VehicleStateBroken:stop_vehicle()
	return true
end
function VehicleStateBroken:exit(state_data)
	slot4 = self._unit
	slot4 = self._unit.vehicle_driving(slot3)

	self._unit.vehicle_driving(slot3)._stop_engine_sound(slot3)

	return 
end

return 
