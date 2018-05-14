if not VehicleStateInvalid then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateInvalid = slot0
function VehicleStateInvalid:init(unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end

return 
