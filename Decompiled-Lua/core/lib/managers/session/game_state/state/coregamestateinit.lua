slot3 = "CoreGameStateInit"

core.module(slot1, core)

slot3 = "CoreGameStateInEditor"

core.import(slot1, core)

slot3 = "CoreGameStatePreFrontEnd"

core.import(slot1, core)

Init = Init or class()
function Init:init()
	self.game_state._is_in_init = true

	return 
end
function Init:destroy()
	self.game_state._is_in_init = false

	return 
end
function Init:transition()
	slot3 = Application

	if Application.editor(slot2) then
		return CoreGameStateInEditor.InEditor
	else
		return CoreGameStatePreFrontEnd.PreFrontEnd
	end

	return 
end

return 
