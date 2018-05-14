-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreGuiCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreGuiCutsceneKey = slot0
CoreGuiCutsceneKey.ELEMENT_NAME = "gui"
CoreGuiCutsceneKey.NAME = "Gui"
CoreGuiCutsceneKey.VALID_ACTIONS = {
	"show",
	"hide"
}
slot4 = "show"

CoreGuiCutsceneKey.register_serialized_attribute(, CoreGuiCutsceneKey, "action")

slot4 = ""

CoreGuiCutsceneKey.register_serialized_attribute(, CoreGuiCutsceneKey, "name")

CoreGuiCutsceneKey.control_for_action = CoreCutsceneKeyBase.standard_combo_box_control
CoreGuiCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
slot5 = CoreGuiCutsceneKey.VALID_ACTIONS
CoreGuiCutsceneKey.refresh_control_for_action = CoreCutsceneKeyBase.standard_combo_box_control_refresh(CoreGuiCutsceneKey, CoreCutsceneKeyBase, "action")
function CoreGuiCutsceneKey:__tostring()
	slot5 = self
	slot5 = self

	return string.capitalize(self.action(slot4)) .. " gui \"" .. self.name(slot4) .. "\"."
end
function CoreGuiCutsceneKey:prime(player)
	slot4 = self

	if self.action(slot3) == "show" then
		slot4 = self
		slot7 = self

		if self.is_valid_name(slot3, self.name(slot6)) then
			slot4 = player
			slot7 = self

			player.load_gui(slot3, self.name(slot6))
		end
	end

	return 
end
function CoreGuiCutsceneKey:unload(player)
	if player then
		slot6 = true

		self.play(slot3, self, player)
	end

	return 
end
function CoreGuiCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot7 = {
			name = self.name(slot9)
		}
		slot10 = self
		local preceeding_key = self.preceeding_key(slot5, self)
	else
		slot9 = self
		slot8 = player

		self._perform_action(slot5, self, self.action(slot8))
	end

	return 
end
function CoreGuiCutsceneKey:inverse_action()
	slot3 = self

	return (self.action(slot2) == "show" and "hide") or "show"
end
function CoreGuiCutsceneKey:_perform_action(action, player)
	slot8 = self
	slot7 = action == "show"

	player.set_gui_visible(slot4, player, self.name(slot7))

	return 
end
function CoreGuiCutsceneKey:is_valid_action(action)
	slot5 = action

	return table.contains(slot3, self.VALID_ACTIONS)
end
function CoreGuiCutsceneKey:is_valid_name(name)
	slot6 = name

	return DB.has(slot3, DB, "gui")
end
function CoreGuiCutsceneKey:refresh_control_for_name(control)
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
