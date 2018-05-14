if not PlayerEmpty then
	slot2 = PlayerMovementState
	slot0 = class(slot1)
end

PlayerEmpty = slot0
function PlayerEmpty:init(unit)
	slot5 = unit

	PlayerMovementState.init(slot3, self)

	return 
end
function PlayerEmpty:enter(state_data, enter_data)
	slot6 = state_data

	PlayerMovementState.enter(slot4, self)

	return 
end
function PlayerEmpty:exit(state_data)
	slot5 = state_data

	PlayerMovementState.exit(slot3, self)

	return 
end
function PlayerEmpty:update(t, dt)
	slot7 = dt

	PlayerMovementState.update(slot4, self, t)

	return 
end
function PlayerEmpty:destroy()
	return 
end

return 
