slot3 = "CoreSessionManager"

core.module(slot1, core)

slot3 = "CoreMenuState"

core.import(slot1, core)

slot3 = "CoreGameState"

core.import(slot1, core)

slot3 = "CoreDialogState"

core.import(slot1, core)

slot3 = "CoreFreezeState"

core.import(slot1, core)

slot3 = "CorePlayerSlots"

core.import(slot1, core)

slot3 = "CoreLocalUserManager"

core.import(slot1, core)

slot3 = "CoreSessionState"

core.import(slot1, core)

slot3 = "CoreSessionDebug"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

SessionManager = SessionManager or class()
function SessionManager:init(session_factory, input_manager)
	if not session_factory then
		return 
	end

	slot6 = "SessionManager must have a valid session_factory to work"

	assert(slot4, session_factory ~= nil)

	self._factory = session_factory
	local settings_handler = self._factory.create_profile_settings_handler(slot4)
	local progress_handler = self._factory.create_profile_progress_handler(self._factory)
	slot11 = input_manager
	self._local_user_manager = CoreLocalUserManager.Manager.new(self._factory, CoreLocalUserManager.Manager, self._factory, settings_handler, progress_handler)
	slot9 = self._factory
	self._player_slots = CorePlayerSlots.PlayerSlots.new(self._factory, CorePlayerSlots.PlayerSlots, self._local_user_manager)
	slot7 = self._player_slots

	self._player_slots.add_player_slot(self._factory)

	slot9 = self
	local game_state = CoreGameState.GameState.new(self._factory, CoreGameState.GameState, self._player_slots)
	local menu_handler = self._factory.create_menu_handler(CoreGameState.GameState)
	slot12 = self._player_slots
	local menu_state = CoreMenuState.MenuState.new(self._factory, CoreMenuState.MenuState, game_state, menu_handler)
	local dialog_state = CoreDialogState.DialogState.new(CoreMenuState.MenuState)
	local freeze_state = CoreFreezeState.FreezeState.new(CoreDialogState.DialogState)
	slot15 = game_state
	self._session_state = CoreSessionState.SessionState.new(CoreFreezeState.FreezeState, CoreSessionState.SessionState, self._factory, self._player_slots)
	self._factory.session_establisher = self._session_state
	self._state_machines = {
		game_state,
		menu_state,
		dialog_state,
		freeze_state,
		self._player_slots,
		self._local_user_manager,
		self._session_state
	}
	self._state_machines_except_menu_and_game = {
		dialog_state,
		freeze_state,
		self._player_slots,
		self._local_user_manager,
		self._session_state
	}
	slot13 = self._session_state
	self._debug = CoreSessionDebug.SessionDebug.new(self._session_state, CoreSessionDebug.SessionDebug)

	return 
end
function SessionManager:destroy()
	return 
end
function SessionManager:_main_systems_are_stable_for_loading()
	slot4 = self._state_machines_except_menu_and_game

	return self._check_if_stable_for_loading(slot2, self)
end
function SessionManager:all_systems_are_stable_for_loading()
	slot4 = self._state_machines

	return self._check_if_stable_for_loading(slot2, self)
end
function SessionManager:_check_if_stable_for_loading(collection)
	slot4 = collection

	for _, state in pairs(slot3) do
		slot9 = state

		if not state.is_stable_for_loading(slot8) then
			slot12 = state
			slot10 = CoreDebug.full_class_name(slot11) .. " is not ready...."

			cat_print(slot8, "debug")

			return false
		end
	end

	return true
end
function SessionManager:_update(t, dt)
	if not self._factory then
		return 
	end

	slot7 = dt

	self._local_user_manager.update(slot4, self._local_user_manager, t)

	self._debug_timer = (self._debug_timer or 0) + dt
	slot5 = self._state_machines

	for _, state in pairs(slot4) do
		if state.update then
			slot12 = dt

			state.update(slot9, state, t)
		end

		slot10 = state

		state.transition(slot9)
	end

	return 
end
function SessionManager:end_update(t, dt)
	if not self._factory then
		return 
	end

	slot5 = self._state_machines

	for _, state in pairs(slot4) do
		if state.end_update then
			slot12 = dt

			state.end_update(slot9, state, t)
		end
	end

	return 
end
function SessionManager:update(t, dt)
	slot7 = dt

	self._update(slot4, self, t)

	return 
end
function SessionManager:paused_update(t, dt)
	slot7 = dt

	self._update(slot4, self, t)

	return 
end
function SessionManager:player_slots()
	return self._player_slots
end
function SessionManager:session()
	return self._session_state
end
function SessionManager:_debug_time()
	return self._debug_timer
end

return 
