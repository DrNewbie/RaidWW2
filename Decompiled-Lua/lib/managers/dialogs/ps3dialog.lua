slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/Dialog"

require(slot1)

if not PS3Dialog then
	slot2 = Dialog
	slot0 = class(slot1)
end

PS3Dialog = slot0
PS3Dialog.BUTTON_TYPE_LIST = {
	"ok",
	"yes-no",
	"yes-no-back"
}
function PS3Dialog:show()
	local focus_button = self.focus_button(slot2)
	slot4 = self
	local button_text_list = self.button_text_list(self)
	local ps3_focus_button, button_type = nil
	slot9 = #self.BUTTON_TYPE_LIST

	if math.within(slot6, #button_text_list, 1) then
		button_type = self.BUTTON_TYPE_LIST[#button_text_list]

		if focus_button then
			slot9 = #self.BUTTON_TYPE_LIST

			if math.within(slot6, focus_button, 0) then
				ps3_focus_button = #button_text_list - focus_button
			else
				slot7 = Application
				slot11 = focus_button
				slot14 = self

				Application.error(slot6, string.format(slot9, "[SystemMenuManager] Invalid focus button \"%g\" (it is not between 0 and 3) in dialog: %s", self.to_string(slot13)))
			end
		end
	else
		slot7 = Application
		slot11 = #button_text_list
		slot14 = self

		Application.error(slot6, string.format(slot9, "[SystemMenuManager] Invalid button count \"%g\" (should be between 1 and 3 buttons) in dialog: %s", self.to_string(slot13)))
	end

	button_type = button_type or self.BUTTON_TYPE_LIST[1]
	ps3_focus_button = ps3_focus_button or 0
	slot10 = self
	slot10 = ps3_focus_button
	local result = PS3.show_dialog(slot6, PS3, self.text(slot9), button_type)
	slot9 = self

	self._manager.event_dialog_shown(PS3, self._manager)

	slot9 = (result and 0) or 1

	self.button_pressed(slot7, self)

	return true
end
function PS3Dialog:button_pressed(button_index)
	slot5 = button_index + 1

	Dialog.button_pressed(slot3, self)

	return 
end

return 
