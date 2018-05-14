slot3 = "CorePlayerSlots"

core.module(slot1, core)

slot3 = "CorePlayerSlot"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

if not PlayerSlots then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

PlayerSlots = slot0
function PlayerSlots:init(local_user_manager, factory)
	self._slots = {}
	self._local_user_manager = local_user_manager
	slot5 = self

	self._set_stable_for_loading(slot4)

	self._factory = factory

	return 
end
function PlayerSlots:clear()
	self._slots = {}

	return 
end
function PlayerSlots:clear_session()
	slot3 = self._slots

	for _, slot in pairs(slot2) do
		slot8 = slot

		slot.clear_session(slot7)
	end

	return 
end
function PlayerSlots:add_player_slot()
	local new_index = #self._slots + 1
	slot6 = self._local_user_manager
	local new_slot = CorePlayerSlot.PlayerSlot.new(slot3, CorePlayerSlot.PlayerSlot, self)
	self._slots[new_index] = new_slot

	return new_slot
end
function PlayerSlots:_remove_player_slot(player_slot)
	slot4 = self._slots

	for index, slot in pairs(slot3) do
		if slot == player_slot then
			self._slots[index] = nil

			return 
		end
	end

	slot5 = "couldn't find that player slot"

	assert(slot3, false)

	return 
end
function PlayerSlots:slots()
	return self._slots
end
function PlayerSlots:transition()
	slot3 = self._slots

	for _, slot in pairs(slot2) do
		slot8 = slot

		slot.transition(slot7)
	end

	return 
end
function PlayerSlots:primary_slot()
	local primary_slot = self._slots[1]
	slot5 = "No primary slot defined"

	assert(slot3, primary_slot)

	return primary_slot
end
function PlayerSlots:has_primary_local_user()
	local primary_slot = self._slots[1]

	if primary_slot ~= nil then
		slot4 = primary_slot
		slot2 = primary_slot.has_assigned_user(slot3)
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end
function PlayerSlots:primary_local_user()
	local primary_slot = self._slots[1]

	assert(slot3, primary_slot)

	slot6 = primary_slot
	slot5 = "No user assigned to primary slot"

	assert(slot3, primary_slot.has_assigned_user("No primary slot defined"))

	slot4 = primary_slot

	return primary_slot.assigned_user(slot3)
end
function PlayerSlots:create_players()
	slot3 = self._slots

	for index, slot in pairs(slot2) do
		slot8 = slot

		if slot.has_assigned_user(slot7) then
			slot8 = slot

			slot.create_player(slot7)
		end
	end

	return 
end
function PlayerSlots:remove_players()
	slot3 = self._slots

	for index, slot in pairs(slot2) do
		slot8 = slot

		if slot.has_player(slot7) then
			slot8 = slot

			slot.remove_player(slot7)
		end
	end

	return 
end
function PlayerSlots:enter_level_handler(level_handler)
	slot4 = self._slots

	for index, slot in pairs(slot3) do
		slot9 = slot
		local player = slot.player(slot8)

		if player then
			slot11 = level_handler

			player.enter_level(slot9, player)
		end
	end

	return 
end
function PlayerSlots:leave_level_handler(level_handler)
	slot4 = self._slots

	for index, slot in pairs(slot3) do
		slot9 = slot
		local player = slot.player(slot8)

		if player then
			slot11 = level_handler

			player.leave_level(slot9, player)
		end
	end

	return 
end

return 
