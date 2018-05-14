slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not FriendsDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

FriendsDialog = slot0
function FriendsDialog:done_callback()
	if self._data.callback_func then
		self._data.callback_func()
	end

	slot3 = self

	self.fade_out_close(slot2)

	return 
end

return 
