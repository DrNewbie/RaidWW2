slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/Dialog"

require(slot1)

if not Xbox360Dialog then
	slot2 = Dialog
	slot0 = class(slot1)
end

Xbox360Dialog = slot0
function Xbox360Dialog:show()
	slot3 = self
	local focus_button = self.focus_button(slot2)

	if focus_button then
		focus_button = focus_button - 1
	else
		focus_button = 0
	end

	local button_text_list = self.button_text_list(slot3)
	slot10 = self
	slot14 = "button_pressed"
	slot11 = false
	slot14 = button_text_list
	local success = Application.display_message_box_dialog(self, Application, self.get_platform_id(slot7), self.title(self), self.text(self), focus_button, callback(slot11, self, self), unpack(self))

	if success then
		slot7 = self

		self._manager.event_dialog_shown(slot5, self._manager)
	end

	return success
end
function Xbox360Dialog:button_pressed(button_index)
	if button_index == -1 then
		slot4 = self
		button_index = self.focus_button(slot3) or 1
		slot5 = "[SystemMenuManager] Dialog aborted. Defaults to focus button."

		cat_print(slot3, "dialog_manager")
	end

	slot5 = button_index + 1

	Dialog.button_pressed(slot3, self)

	return 
end
function Xbox360Dialog:blocks_exec()
	return false
end

return 
