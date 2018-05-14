slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/PlayerDialog"

require(slot1)

if not Xbox360PlayerDialog then
	slot2 = PlayerDialog
	slot0 = class(slot1)
end

Xbox360PlayerDialog = slot0
function Xbox360PlayerDialog:init(manager, data)
	slot7 = data

	PlayerDialog.init(slot4, self, manager)

	return 
end
function Xbox360PlayerDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	slot3 = self
	local player_id = self.player_id(slot2)

	if player_id then
		slot5 = self.get_platform_id(slot6)
		slot8 = self

		XboxLive.show_gamer_card_ui(slot3, XboxLive, self.player_id(self))
	else
		slot5 = "[SystemMenuManager] Unable to display player dialog since no player id was specified."

		Application.error(slot3, Application)
	end

	slot4 = TimerManager
	slot4 = TimerManager.main(slot3)
	self._show_time = TimerManager.main(slot3).time(slot3)

	return true
end
function Xbox360PlayerDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = Application

		if not Application.is_showing_system_dialog(slot4) then
			slot5 = self

			self.done_callback(slot4)
		end
	end

	return 
end
function Xbox360PlayerDialog:done_callback()
	self._show_time = nil
	slot3 = self

	PlayerDialog.done_callback(slot2)

	return 
end

return 
