-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSubtitleCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSubtitleCutsceneKey = slot0
CoreSubtitleCutsceneKey.ELEMENT_NAME = "subtitle"
CoreSubtitleCutsceneKey.NAME = "Subtitle"
slot4 = ""

CoreSubtitleCutsceneKey.register_serialized_attribute("Subtitle", CoreSubtitleCutsceneKey, "category")

slot4 = ""

CoreSubtitleCutsceneKey.register_serialized_attribute("Subtitle", CoreSubtitleCutsceneKey, "string_id")

slot5 = tonumber

CoreSubtitleCutsceneKey.register_serialized_attribute("Subtitle", CoreSubtitleCutsceneKey, "duration", 3)

slot3 = "divider"

CoreSubtitleCutsceneKey.register_control("Subtitle", CoreSubtitleCutsceneKey)

slot3 = "localized_text"

CoreSubtitleCutsceneKey.register_control("Subtitle", CoreSubtitleCutsceneKey)

slot4 = "string_id"

CoreSubtitleCutsceneKey.attribute_affects("Subtitle", CoreSubtitleCutsceneKey, "category")

slot4 = "localized_text"

CoreSubtitleCutsceneKey.attribute_affects("Subtitle", CoreSubtitleCutsceneKey, "string_id")

CoreSubtitleCutsceneKey.control_for_category = CoreCutsceneKeyBase.standard_combo_box_control
CoreSubtitleCutsceneKey.control_for_string_id = CoreCutsceneKeyBase.standard_combo_box_control
CoreSubtitleCutsceneKey.control_for_divider = CoreCutsceneKeyBase.standard_divider_control
function CoreSubtitleCutsceneKey:__tostring()
	slot4 = self

	return "Display subtitle \"" .. self.string_id(slot3) .. "\"."
end
function CoreSubtitleCutsceneKey:can_evaluate_with_player(player)
	return true
end
function CoreSubtitleCutsceneKey:unload(player)
	slot4 = managers.subtitle

	managers.subtitle.clear_subtitle(slot3)

	return 
end
function CoreSubtitleCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot6 = managers.subtitle

		managers.subtitle.clear_subtitle(slot5)
	elseif not fast_forward then
		slot7 = self.string_id(slot8)
		slot10 = self

		managers.subtitle.show_subtitle(slot5, managers.subtitle, self.duration(self))
	end

	return 
end
function CoreSubtitleCutsceneKey:is_valid_category(value)
	return value and value ~= ""
end
function CoreSubtitleCutsceneKey:is_valid_string_id(value)
	return value and value ~= ""
end
function CoreSubtitleCutsceneKey:is_valid_duration(value)
	return value and 0 < value
end
function CoreSubtitleCutsceneKey:control_for_localized_text(parent_frame)
	slot8 = "NO_BORDER,TE_RICH,TE_MULTILINE,TE_READONLY"
	local control = EWS.TextCtrl(slot3, EWS, parent_frame, "", "")
	slot5 = control
	slot8 = control
	slot9 = 160

	control.set_min_size(EWS, control.get_min_size("").with_y("", control.get_min_size("")))

	slot5 = control
	slot8 = parent_frame
	slot8 = parent_frame.background_colour("")

	control.set_background_colour(EWS, parent_frame.background_colour("").unpack(""))

	return control
end
function CoreSubtitleCutsceneKey:refresh_control_for_category(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	local categories = managers.localization.xml_names(slot3)
	slot5 = categories

	if table.empty(managers.localization) then
		slot6 = false

		control.set_enabled(slot4, control)
	else
		slot6 = true

		control.set_enabled(slot4, control)

		local value = self.category(slot4)
		slot6 = categories

		for _, category in ipairs(self) do
			slot12 = category

			control.append(slot10, control)

			if category == value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSubtitleCutsceneKey:refresh_control_for_string_id(control)

	-- Decompilation error in this vicinity:
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSubtitleCutsceneKey:refresh_control_for_localized_text(control)
	slot4 = self
	slot7 = self

	if self.is_valid_category(slot3, self.category(slot6)) then
		slot4 = self
		slot7 = self
	else
		slot5 = "<No String Id>"

		control.set_value(slot3, control)
	end

	return 
end
function CoreSubtitleCutsceneKey:validate_control_for_attribute(attribute_name)
	if attribute_name ~= "localized_text" then
		slot5 = attribute_name

		return self.super.validate_control_for_attribute(slot3, self)
	end

	return true
end

return 
