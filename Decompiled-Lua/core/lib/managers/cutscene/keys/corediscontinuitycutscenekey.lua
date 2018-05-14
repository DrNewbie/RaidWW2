slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreDiscontinuityCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreDiscontinuityCutsceneKey = slot0
CoreDiscontinuityCutsceneKey.ELEMENT_NAME = "discontinuity"
CoreDiscontinuityCutsceneKey.NAME = "Discontinuity"
slot3 = "description"

CoreDiscontinuityCutsceneKey.register_control("Discontinuity", CoreDiscontinuityCutsceneKey)

CoreDiscontinuityCutsceneKey.refresh_control_for_description = CoreCutsceneKeyBase.VOID
CoreDiscontinuityCutsceneKey.label_for_description = CoreCutsceneKeyBase.VOID
CoreDiscontinuityCutsceneKey.is_valid_description = CoreCutsceneKeyBase.TRUE
function CoreDiscontinuityCutsceneKey:__tostring()
	return "Notifies a discontinuity in linear time."
end
function CoreDiscontinuityCutsceneKey:play(player, undo, fast_forward)
	slot6 = player

	player._notify_discontinuity(slot5)

	return 
end
function CoreDiscontinuityCutsceneKey:control_for_description(parent_frame)
	local text = "Discontinuity keys signify a break in linear time. They enable us to dampen physics, etc. during rapid actor movement.\n\nDiscontinuity keys are inserted by the optimizer as the cutscene is exported to the game, but you can also insert them yourself."
	slot9 = "NO_BORDER,TE_RICH,TE_MULTILINE,TE_READONLY"
	local control = EWS.TextCtrl(slot4, EWS, parent_frame, text, "")
	slot6 = control
	slot9 = control
	slot10 = 160

	control.set_min_size(EWS, control.get_min_size("").with_y("", control.get_min_size("")))

	slot6 = control
	slot9 = parent_frame
	slot9 = parent_frame.background_colour("")

	control.set_background_colour(EWS, parent_frame.background_colour("").unpack(""))

	return control
end
function CoreDiscontinuityCutsceneKey:validate_control_for_attribute(attribute_name)
	if attribute_name ~= "description" then
		slot5 = attribute_name

		return self.super.validate_control_for_attribute(slot3, self)
	end

	return true
end

return 
