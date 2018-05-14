slot2 = "lib/states/GameState"

require(slot1)

if not EditorState then
	slot2 = GameState
	slot0 = class(slot1)
end

EditorState = slot0
function EditorState:init(game_state_machine)
	slot6 = game_state_machine

	GameState.init(slot3, self, "editor")

	return 
end
function EditorState:at_enter()
	slot4 = "GAME STATE EditorState ENTER"

	cat_print(slot2, "game_state_machine")

	return 
end
function EditorState:at_exit()
	slot4 = "GAME STATE EditorState ENTER"

	cat_print(slot2, "game_state_machine")

	return 
end
function EditorState:is_joinable()
	return false
end

return 
