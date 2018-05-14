slot3 = "CoreSmoketestLoadLevelSuite"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreSmoketestCommonSuite"

core.import(slot1, core)

if not LoadLevelSuite then
	slot2 = CoreSmoketestCommonSuite.CommonSuite
	slot0 = class(slot1)
end

LoadLevelSuite = slot0
function LoadLevelSuite:init()
	slot3 = self

	LoadLevelSuite.super.init(slot2)

	slot5 = CoreSmoketestCommonSuite.CallAndWaitEventSubstep
	slot12 = "load_level"
	slot8 = callback(slot9, self, self)
	slot11 = "game_state_ingame"

	self.add_step(slot2, self, "load_level", CoreSmoketestCommonSuite.CallAndWaitEventSubstep.step_arguments(slot7, Idstring(self)))

	slot5 = CoreSmoketestCommonSuite.DelaySubstep
	slot8 = 1

	self.add_step(slot2, self, "in_game", CoreSmoketestCommonSuite.DelaySubstep.step_arguments(slot7))

	return 
end
function LoadLevelSuite:load_level()
	local session_info = self._session_state.session_info(slot2)
	slot4 = session_info
	slot8 = "level"

	session_info.set_level_name(self._session_state, self.get_argument(slot6, self))

	slot4 = self._session_state
	slot4 = self._session_state.player_slots(self._session_state)
	slot4 = self._session_state.player_slots(self._session_state).primary_slot(self._session_state)

	self._session_state.player_slots(self._session_state).primary_slot(self._session_state).request_debug_local_user_binding(self._session_state)

	slot4 = self._session_state

	self._session_state.join_standard_session(self._session_state)

	return 
end

return 
