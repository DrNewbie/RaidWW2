slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/SelectStorageDialog"

require(slot1)

if not Xbox360SelectStorageDialog then
	slot2 = SelectStorageDialog
	slot0 = class(slot1)
end

Xbox360SelectStorageDialog = slot0
function Xbox360SelectStorageDialog:show()
	slot11 = "done_callback"
	slot10 = self
	slot9 = false
	local success = Application.display_device_selection_dialog(slot2, Application, self.get_platform_id(slot5), self.content_type(self), not self.auto_select(self), callback(self, self, self), self.min_bytes(self))

	if success then
		slot5 = self

		self._manager.event_dialog_shown(slot3, self._manager)
	end

	return success
end

return 
