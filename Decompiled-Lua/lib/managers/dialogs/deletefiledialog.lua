slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not DeleteFileDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

DeleteFileDialog = slot0
function DeleteFileDialog:done_callback(success)
	if self._data.callback_func then
		slot4 = success

		self._data.callback_func(slot3)
	end

	slot4 = self

	self.fade_out_close(slot3)

	return 
end

return 
