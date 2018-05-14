slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreGuiCallbackCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreGuiCallbackCutsceneKey = slot0
CoreGuiCallbackCutsceneKey.ELEMENT_NAME = "gui_callback"
CoreGuiCallbackCutsceneKey.NAME = "Gui Callback"
slot4 = ""

CoreGuiCallbackCutsceneKey.register_serialized_attribute("Gui Callback", CoreGuiCallbackCutsceneKey, "name")

slot4 = ""

CoreGuiCallbackCutsceneKey.register_serialized_attribute("Gui Callback", CoreGuiCallbackCutsceneKey, "function_name")

slot5 = toboolean

CoreGuiCallbackCutsceneKey.register_serialized_attribute("Gui Callback", CoreGuiCallbackCutsceneKey, "enabled", true)

CoreGuiCallbackCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreGuiCallbackCutsceneKey:__tostring()
	slot4 = self
	slot6 = self

	return "Call " .. self.function_name(slot3) .. " in gui \"" .. self.name(slot5) .. "\"."
end
function CoreGuiCallbackCutsceneKey:evaluate(player, fast_forward)
	slot5 = self

	if self.enabled(slot4) then
		slot9 = self
		slot8 = player

		player.invoke_callback_in_gui(slot4, player, self.name(slot7), self.function_name(self))
	end

	return 
end
function CoreGuiCallbackCutsceneKey:is_valid_name(name)
	slot6 = name

	return DB.has(slot3, DB, "gui")
end
function CoreGuiCallbackCutsceneKey:refresh_control_for_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.name(slot3)
	slot8 = "gui"

	for _, name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		slot11 = name

		control.append(slot9, control)

		if name == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end

return 
