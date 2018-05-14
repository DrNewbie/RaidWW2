slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/Dialog"

require(slot1)

if not PlayerReviewDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

PlayerReviewDialog = slot0
function PlayerReviewDialog:done_callback()
	if self._data.callback_func then
		self._data.callback_func()
	end

	slot3 = self

	self.fade_out_close(slot2)

	return 
end
function PlayerReviewDialog:player_id()
	return self._data.player_id
end
function PlayerReviewDialog:to_string()
	slot8 = self
	slot4 = tostring(BaseDialog.to_string(slot7))
	slot7 = self._data.player_id

	return string.format(slot2, "%s, Player id: %s", tostring(BaseDialog.to_string))
end

return 
