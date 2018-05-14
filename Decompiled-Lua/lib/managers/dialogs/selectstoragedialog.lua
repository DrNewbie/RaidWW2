slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not SelectStorageDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

SelectStorageDialog = slot0
function SelectStorageDialog:content_type()
	return self._data.content_type or 1
end
function SelectStorageDialog:min_bytes()
	return self._data.min_bytes or 0
end
function SelectStorageDialog:auto_select()
	return self._data.auto_select
end
function SelectStorageDialog:done_callback(success, result)
	if self._data.callback_func then
		slot6 = result

		self._data.callback_func(slot4, success)
	end

	slot5 = self

	self.fade_out_close(slot4)

	return 
end
function SelectStorageDialog:to_string()
	slot8 = self
	slot6 = tostring(self._data.content_type)
	slot9 = self._data.auto_select

	return string.format(slot2, "%s, Content type: %s, Min bytes: %s, Auto select: %s", tostring(BaseDialog.to_string(slot7)), tostring(BaseDialog.to_string), tostring(self._data.min_bytes))
end

return 
