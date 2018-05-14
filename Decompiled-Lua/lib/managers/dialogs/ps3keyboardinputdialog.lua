slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/KeyboardInputDialog"

require(slot1)

if not PS3KeyboardInputDialog then
	slot2 = KeyboardInputDialog
	slot0 = class(slot1)
end

PS3KeyboardInputDialog = slot0
function PS3KeyboardInputDialog:show()
	local data = {}
	slot4 = self
	data.title = self.title(slot3)
	slot4 = self
	data.text = self.input_text(slot3)
	slot4 = self
	data.filter = self.filter(slot3)
	slot4 = self
	data.limit = self.max_count(slot3) or 0
	slot6 = "done_callback"
	data.callback = callback(slot3, self, self)
	slot5 = data

	PS3.display_keyboard(slot3, PS3)

	slot4 = PS3
	local success = PS3.is_displaying_box(slot3)

	if success then
		slot6 = self

		self._manager.event_dialog_shown(slot4, self._manager)
	end

	return success
end
function PS3KeyboardInputDialog:done_callback(input_text, success)
	slot7 = input_text

	KeyboardInputDialog.done_callback(slot4, self, success)

	return 
end

return 
