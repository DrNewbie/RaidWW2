slot2 = "core/lib/utils/dev/editor/WorldHolder"

require(slot1)

slot3 = "CoreGameStateLoadingGame"

core.module(slot1, core)

slot3 = "CoreGameStateInGame"

core.import(slot1, core)

LoadingGame = LoadingGame or class()
function LoadingGame:init()
	slot3 = self.game_state._session_manager
	self._debug_time = self.game_state._session_manager._debug_time(slot2)
	slot6 = "all"

	for _, unit in ipairs(World.find_units_quick(slot4, World)) do
		slot9 = 0

		unit.set_slot(slot7, unit)
	end

	slot3 = self.game_state._session_manager
	slot3 = self.game_state._session_manager.session(slot2)
	local session_info = self.game_state._session_manager.session(slot2).session_info(slot2)
	local factory = self.game_state._session_manager._factory
	local level_name = session_info.level_name(slot4)
	slot6 = session_info
	local stage_name = session_info.stage_name(session_info) or "stage1"
	slot8 = level_name
	local level = Level.load(slot6, Level)
	slot10 = "statics"

	level.create(Level, level, "dynamics")

	slot12 = "mission"

	managers.mission.parse(Level, managers.mission, level_name, stage_name, nil)

	slot8 = factory
	self._level_handler = factory.create_level_handler(Level)
	slot8 = self._level_handler
	slot11 = self.game_state

	self._level_handler.set_player_slots(Level, self.game_state.player_slots(stage_name))

	slot8 = self.game_state
	slot9 = self._level_handler

	self.game_state.player_slots(Level).enter_level_handler(Level, self.game_state.player_slots(Level))

	local local_user_manager = self.game_state._session_manager._local_user_manager
	slot10 = self._level_handler

	local_user_manager.enter_level_handler(self.game_state.player_slots(Level), local_user_manager)

	return 
end
function LoadingGame:destroy()
	return 
end
function LoadingGame:transition()
	slot3 = self.game_state._session_manager
	local current_time = self.game_state._session_manager._debug_time(slot2)

	if self._debug_time + 2 < current_time then
		return CoreGameStateInGame.InGame, self._level_handler
	end

	return 
end

return 
