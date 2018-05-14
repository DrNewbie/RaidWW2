-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not DialogueUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DialogueUnitElement = slot0
DialogueUnitElement.SAVE_UNIT_POSITION = false
DialogueUnitElement.SAVE_UNIT_ROTATION = false
function DialogueUnitElement:init(unit)
	slot5 = unit

	DialogueUnitElement.super.init(slot3, self)

	self._hed.dialogue = "none"
	self._hed.random = "none"
	self._hed.execute_on_executed_when_done = false
	self._hed.use_position = false
	slot5 = "dialogue"

	table.insert(false, self._save_values)

	slot5 = "random"

	table.insert(false, self._save_values)

	slot5 = "execute_on_executed_when_done"

	table.insert(false, self._save_values)

	slot5 = "use_position"

	table.insert(false, self._save_values)

	slot5 = "use_instigator"

	table.insert(false, self._save_values)

	return 
end
function DialogueUnitElement:new_save_values(...)

	-- Decompilation error in this vicinity:
	slot3 = self
	local t = DialogueUnitElement.super.new_save_values(slot2, ...)
end
function DialogueUnitElement:test_element()
	if self._hed.dialogue == "none" then
		return 
	end

	slot3 = managers.dialog

	managers.dialog.quit_dialog(slot2)

	slot6 = true

	managers.dialog.queue_dialog(slot2, managers.dialog, self._hed.dialogue, {
		skip_idle_check = true,
		on_unit = managers.dialog._ventrilo_unit
	})

	slot4 = false

	managers.editor.set_wanted_mute(slot2, managers.editor)

	slot4 = true

	managers.editor.set_listener_enabled(slot2, managers.editor)

	return 
end
function DialogueUnitElement:stop_test_element()
	slot3 = managers.dialog

	managers.dialog.quit_dialog(slot2)

	slot4 = true

	managers.editor.set_wanted_mute(slot2, managers.editor)

	slot4 = false

	managers.editor.set_listener_enabled(slot2, managers.editor)

	return 
end
function DialogueUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = {
		"none"
	}
	slot14 = managers.dialog

	self._build_value_combobox(slot4, self, panel, panel_sizer, "dialogue", table.list_add(slot10, managers.dialog.conversation_names(slot13)))

	slot11 = {
		"none"
	}
	slot14 = managers.dialog
	slot10 = "Select a random container from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "random", table.list_add("Select a dialogue from the combobox", managers.dialog.random_names(slot13)))

	slot9 = "Execute on executed when done"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "execute_on_executed_when_done")

	slot8 = "use_position"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot8 = "use_instigator"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	return 
end

return 
