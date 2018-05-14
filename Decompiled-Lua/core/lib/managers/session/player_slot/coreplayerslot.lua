slot3 = "CorePlayerSlot"

core.module(slot1, core)

slot3 = "CoreRequester"

core.import(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CorePlayerSlotStateInit"

core.import(slot1, core)

slot3 = "CorePlayer"

core.import(slot1, core)

PlayerSlot = PlayerSlot or class()
function PlayerSlot:init(player_slots_parent, local_user_manager)
	slot5 = CoreRequester.Requester
	self._perform_local_user_binding = CoreRequester.Requester.new(slot4)
	slot5 = CoreRequester.Requester
	self._perform_debug_local_user_binding = CoreRequester.Requester.new(slot4)
	slot5 = CoreRequester.Requester
	self._init = CoreRequester.Requester.new(slot4)
	slot8 = self
	self._user_state = CoreFiniteStateMachine.FiniteStateMachine.new(slot4, CoreFiniteStateMachine.FiniteStateMachine, CorePlayerSlotStateInit.Init, "player_slot")
	self._player_slots_parent = player_slots_parent
	self._local_user_manager = local_user_manager

	return 
end
function PlayerSlot:destroy()
	slot4 = self

	self._player_slots_parent._remove_player_slot(slot2, self._player_slots_parent)

	if self._player then
		slot3 = self._player

		self._player.destroy(slot2)
	end

	return 
end
function PlayerSlot:clear_session()
	if self._player then
		slot3 = self._player

		self._player.destroy(slot2)

		self._player = nil
	end

	return 
end
function PlayerSlot:remove()
	slot3 = self

	self.destroy(slot2)

	return 
end
function PlayerSlot:_release_user_from_slot()
	if self._assigned_user then
		slot4 = self

		self._assigned_user._player_slot_lost(slot2, self._assigned_user)
	end

	self._assigned_user = nil
	slot3 = self._init

	self._init.request(slot2)

	return 
end
function PlayerSlot:request_local_user_binding()
	slot3 = self._perform_local_user_binding

	self._perform_local_user_binding.request(slot2)

	return 
end
function PlayerSlot:stop_local_user_binding()
	slot3 = self._perform_local_user_binding

	self._perform_local_user_binding.cancel_request(slot2)

	return 
end
function PlayerSlot:request_debug_local_user_binding()
	slot3 = self._perform_debug_local_user_binding

	self._perform_debug_local_user_binding.request(slot2)

	return 
end
function PlayerSlot:has_assigned_user()
	return self._assigned_user ~= nil
end
function PlayerSlot:assigned_user()
	return self._assigned_user
end
function PlayerSlot:assign_local_user(local_user)
	slot5 = "Must specify a valid user"

	assert(slot3, local_user)

	slot5 = "A user has already been assigned to this slot"

	assert(slot3, self._assigned_user == nil)

	self._assigned_user = local_user
	slot5 = self

	self._assigned_user._player_slot_assigned(slot3, self._assigned_user)

	return 
end
function PlayerSlot:transition()
	slot3 = self._user_state

	self._user_state.transition(slot2)

	return 
end
function PlayerSlot:create_player()
	slot4 = "Player already created for this slot"

	assert(slot2, self._player == nil)

	local factory = self._player_slots_parent._factory
	local player_handler = factory.create_player_handler(self._player == nil)
	slot7 = player_handler
	self._player = CorePlayer.Player.new(factory, CorePlayer.Player, self)
	player_handler.core_player = self._player

	if self._assigned_user then
		slot6 = self._player

		self._assigned_user.assign_player(slot4, self._assigned_user)
	end

	return 
end
function PlayerSlot:remove_player()
	if self._assigned_user then
		slot4 = self._player

		self._assigned_user.release_player(slot2, self._assigned_user)
	end

	slot3 = self._player

	self._player.destroy(slot2)

	self._player = nil

	return 
end
function PlayerSlot:has_player()
	return self._player ~= nil
end
function PlayerSlot:player()
	return self._player
end

return 
