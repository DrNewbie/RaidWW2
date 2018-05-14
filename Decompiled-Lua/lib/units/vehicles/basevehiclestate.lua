BaseVehicleState = BaseVehicleState or class()
function BaseVehicleState:init(unit)
	self._unit = unit

	return 
end
function BaseVehicleState:update(t, dt)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._wake_nearby_dynamics(slot4)

	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._detect_npc_collisions(slot4)

	slot5 = self._unit
	slot7 = dt

	self._unit.vehicle_driving(slot4)._detect_collisions(slot4, self._unit.vehicle_driving(slot4), t)

	slot5 = self._unit
	slot7 = dt

	self._unit.vehicle_driving(slot4)._detect_invalid_possition(slot4, self._unit.vehicle_driving(slot4), t)

	slot5 = self._unit
	slot7 = dt

	self._unit.vehicle_driving(slot4)._play_sound_events(slot4, self._unit.vehicle_driving(slot4), t)

	return 
end
function BaseVehicleState:enter(state_data, enter_data)
	return 
end
function BaseVehicleState:exit(state_data)
	return 
end
function BaseVehicleState:get_action_for_interaction(pos, locator, tweak_data)
	local locator_name = locator.name(slot5)
	slot7 = self._unit
	local seats = self._unit.vehicle_driving(locator).seats(locator)
	slot8 = seats

	for _, seat in pairs(self._unit.vehicle_driving(locator)) do
		slot13 = VehicleDrivingExt.INTERACTION_PREFIX .. seat.name

		if locator_name == Idstring(slot12) then
			if seat.driving and not seat.occupant then
				return VehicleDrivingExt.INTERACT_DRIVE
			else
				return VehicleDrivingExt.INTERACT_ENTER
			end
		end
	end

	slot8 = self._unit
	slot8 = self._unit.vehicle_driving(slot7)

	if self._unit.vehicle_driving(slot7).is_loot_interaction_enabled(slot7) then
		slot8 = managers.player

		if not managers.player.is_carrying(slot7) then
			slot8 = self._unit
			slot8 = self._unit.vehicle_driving(slot7)

			if self._unit.vehicle_driving(slot7).has_loot_stored(slot7) then
				slot8 = tweak_data.loot_points

				for _, loot_point in pairs(slot7) do
					slot13 = VehicleDrivingExt.INTERACTION_PREFIX .. loot_point.name

					if locator_name == Idstring(slot12) then
						return VehicleDrivingExt.INTERACT_LOOT
					end
				end
			end
		end
	end

	if tweak_data.repair_point then
		slot8 = VehicleDrivingExt.INTERACTION_PREFIX .. tweak_data.repair_point

		if locator_name == Idstring(slot7) then
			return VehicleDrivingExt.INTERACT_REPAIR
		end
	end

	if tweak_data.trunk_point then
		slot8 = VehicleDrivingExt.INTERACTION_PREFIX .. tweak_data.trunk_point

		if locator_name == Idstring(slot7) then
			return VehicleDrivingExt.INTERACT_TRUNK
		end
	end

	return VehicleDrivingExt.INTERACT_INVALID
end
function BaseVehicleState:adjust_interactions()
	slot3 = self._unit
	slot3 = self._unit.vehicle_driving(slot2)

	if not self._unit.vehicle_driving(slot2).is_interaction_allowed(slot2) then
		slot3 = self

		self.disable_interactions(slot2)
	end

	return 
end
function BaseVehicleState:disable_interactions()
	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_ENTRY_DISABLED

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_LOOT_DISABLED

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_REPAIR_DISABLED

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_INTERACTION_DISABLED

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_enter_vehicle = false
			slot3 = self._unit
			self._unit.vehicle_driving(false)._interaction_loot = false
			slot3 = self._unit
			self._unit.vehicle_driving(false)._interaction_trunk = false
			slot3 = self._unit
			self._unit.vehicle_driving(false)._interaction_repair = false
		end
	end

	return 
end
function BaseVehicleState:allow_exit()
	return true
end
function BaseVehicleState:is_vulnerable()
	return false
end
function BaseVehicleState:stop_vehicle()
	return false
end

return 
