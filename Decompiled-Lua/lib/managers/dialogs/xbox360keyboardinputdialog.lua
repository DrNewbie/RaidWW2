slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/KeyboardInputDialog"

require(slot1)

if not Xbox360KeyboardInputDialog then
	slot2 = KeyboardInputDialog
	slot0 = class(slot1)
end

Xbox360KeyboardInputDialog = slot0
function Xbox360KeyboardInputDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	local end_parameter_list = {}
	slot4 = end_parameter_list
	slot7 = self

	table.insert(self._manager, self.max_count(slot6))

	slot4 = end_parameter_list
	slot9 = "done_callback"

	table.insert(self._manager, callback(slot6, self, self))

	slot9 = self.text(self)
	slot12 = end_parameter_list

	XboxLive.show_keyboard_ui(self._manager, XboxLive, self.get_platform_id(slot6), self.input_type(self), self.input_text(self), self.title(self), unpack(self))

	return true
end
function Xbox360KeyboardInputDialog:done_callback(input_text)
	slot6 = input_text

	KeyboardInputDialog.done_callback(slot3, self, true)

	return 
end

return 
