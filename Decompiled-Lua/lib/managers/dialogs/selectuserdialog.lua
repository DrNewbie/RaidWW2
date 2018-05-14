slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not SelectUserDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

SelectUserDialog = slot0
function SelectUserDialog:count()
	return self._data.count or 1
end
function SelectUserDialog:done_callback()
	if self._data.callback_func then
		self._data.callback_func()
	end

	slot3 = self

	self.fade_out_close(slot2)

	return 
end
function SelectUserDialog:to_string()
	slot8 = self
	slot4 = tostring(BaseDialog.to_string(slot7))
	slot7 = self._data.count

	return string.format(slot2, "%s, Count: %s", tostring(BaseDialog.to_string))
end

return 
