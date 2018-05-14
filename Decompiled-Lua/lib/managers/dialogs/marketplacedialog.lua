slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not MarketplaceDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

MarketplaceDialog = slot0
function MarketplaceDialog:done_callback()
	if self._data.callback_func then
		self._data.callback_func()
	end

	slot3 = self

	self.fade_out_close(slot2)

	return 
end
function MarketplaceDialog:item_type()
	return self._data.item_type
end
function MarketplaceDialog:item_id()
	return self._data.item_id
end
function MarketplaceDialog:to_string()
	slot8 = self
	slot5 = tostring(BaseDialog.to_string)
	slot8 = self._data.item_id

	return string.format(slot2, "%s, Item type: %s, Item id: %s", tostring(BaseDialog.to_string(slot7)), tostring(self._data.item_type))
end

return 
