slot3 = "CoreInternalGameState"

core.module(slot1, core)

GameState = GameState or class()
function GameState:init(name, game_state_machine)
	self._name = name
	self._gsm = game_state_machine

	return 
end
function GameState:destroy()
	return 
end
function GameState:name()
	return self._name
end
function GameState:gsm()
	return self._gsm
end
function GameState:at_enter(previous_state)
	return 
end
function GameState:at_exit(next_state)
	return 
end
function GameState:default_transition(next_state)
	slot5 = next_state

	self.at_exit(slot3, self)

	slot5 = self

	next_state.at_enter(slot3, next_state)

	return 
end
function GameState:force_editor_state()
	slot4 = "editor"

	self._gsm.change_state_by_name(slot2, self._gsm)

	return 
end
function GameState:allow_world_camera_sequence()
	return false
end
function GameState:play_world_camera_sequence(name, sequence)
	slot5 = "NotImplemented"

	error(slot4)

	return 
end
function GameState:allow_freeflight()
	return true
end
function GameState:freeflight_drop_player(pos, rot)
	slot9 = self
	slot6 = "[FreeFlight] Drop player not implemented for state '" .. self.name(slot8) .. "'"

	Application.error(slot4, Application)

	return 
end

return 
