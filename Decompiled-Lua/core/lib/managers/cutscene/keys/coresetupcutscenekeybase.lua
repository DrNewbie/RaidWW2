slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSetupCutsceneKeyBase then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSetupCutsceneKeyBase = slot0
function CoreSetupCutsceneKeyBase:populate_from_editor(cutscene_editor)
	return 
end
function CoreSetupCutsceneKeyBase:frame()
	return 0
end
function CoreSetupCutsceneKeyBase:set_frame(frame)
	return 
end
function CoreSetupCutsceneKeyBase:on_gui_representation_changed(sender, sequencer_clip)
	return 
end
function CoreSetupCutsceneKeyBase:prime(player)
	slot4 = "Cutscene keys deriving from CoreSetupCutsceneKeyBase must define the \"prime\" method."

	error(slot3)

	return 
end
function CoreSetupCutsceneKeyBase:play(player, undo, fast_forward)
	return 
end

return 
