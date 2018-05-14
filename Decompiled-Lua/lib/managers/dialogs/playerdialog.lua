slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not PlayerDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

PlayerDialog = slot0
function PlayerDialog:done_callback()
	if self._data.callback_func then
		self._data.callback_func()
	end

	slot3 = self

	self.fade_out_close(slot2)

	return 
end
function PlayerDialog:player_id()
	return self._data.player_id
end
function PlayerDialog:to_string()
	slot8 = self
	slot4 = tostring(BaseDialog.to_string(slot7))
	slot7 = self._data.player_id

	return string.format(slot2, "%s, Player id: %s", tostring(BaseDialog.to_string))
end

return 
