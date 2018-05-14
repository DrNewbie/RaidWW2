slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/DeleteFileDialog"

require(slot1)

if not PS3DeleteFileDialog then
	slot2 = DeleteFileDialog
	slot0 = class(slot1)
end

PS3DeleteFileDialog = slot0
function PS3DeleteFileDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	slot4 = true

	self.done_callback(slot2, self)

	return true
end

return 
