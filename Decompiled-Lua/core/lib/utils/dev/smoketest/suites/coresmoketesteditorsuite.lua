slot3 = "CoreSmoketestEditorSuite"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreSmoketestCommonSuite"

core.import(slot1, core)

if not EditorSuite then
	slot2 = CoreSmoketestCommonSuite.CommonSuite
	slot0 = class(slot1)
end

EditorSuite = slot0
function EditorSuite:init()
	slot3 = self

	EditorSuite.super.init(slot2)

	slot5 = CoreSmoketestCommonSuite.WaitEventSubstep
	slot10 = "game_state_editor"

	self.add_step(slot2, self, "load_editor", CoreSmoketestCommonSuite.WaitEventSubstep.step_arguments(Idstring(slot9)))

	slot5 = CoreSmoketestCommonSuite.CallAndDoneSubstep
	slot12 = "load_level"

	self.add_step(slot2, self, "load_level", CoreSmoketestCommonSuite.CallAndDoneSubstep.step_arguments(callback(slot9, self, self)))

	return 
end
function EditorSuite:load_level()
	slot7 = "editor_dir"
	slot4 = self.get_argument(slot5, self)
	slot8 = "editor_level"

	managers.editor.load_level(slot2, managers.editor, self.get_argument(self, self))

	return 
end
function EditorSuite:run_mission_simulation()
	slot4 = true

	managers.editor.run_simulation_callback(slot2, managers.editor)

	return 
end
function EditorSuite:stop_mission_simulation()
	slot4 = true

	managers.editor.run_simulation_callback(slot2, managers.editor)

	return 
end
function EditorSuite:environment_editor()
	slot4 = "Environment Editor"

	managers.toolhub.open(slot2, managers.toolhub)

	slot4 = "Environment Editor"

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end

return 
