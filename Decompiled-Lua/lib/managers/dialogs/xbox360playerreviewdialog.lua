slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/PlayerReviewDialog"

require(slot1)

if not Xbox360PlayerReviewDialog then
	slot2 = PlayerReviewDialog
	slot0 = class(slot1)
end

Xbox360PlayerReviewDialog = slot0
function Xbox360PlayerReviewDialog:init(manager, data)
	slot7 = data

	PlayerReviewDialog.init(slot4, self, manager)

	return 
end
function Xbox360PlayerReviewDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	slot3 = self
	local player_id = self.player_id(slot2)

	if player_id then
		slot5 = self.get_platform_id(slot6)
		slot8 = self

		XboxLive.show_player_review_ui(slot3, XboxLive, self.player_id(self))
	else
		slot5 = "[SystemMenuManager] Unable to display player review dialog since no player id was specified."

		Application.error(slot3, Application)
	end

	slot4 = TimerManager
	slot4 = TimerManager.main(slot3)
	self._show_time = TimerManager.main(slot3).time(slot3)

	return true
end
function Xbox360PlayerReviewDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = Application

		if not Application.is_showing_system_dialog(slot4) then
			slot5 = self

			self.done_callback(slot4)
		end
	end

	return 
end
function Xbox360PlayerReviewDialog:done_callback()
	self._show_time = nil
	slot3 = self

	PlayerReviewDialog.done_callback(slot2)

	return 
end

return 
