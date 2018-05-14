slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/FriendsDialog"

require(slot1)

if not Xbox360FriendsDialog then
	slot2 = FriendsDialog
	slot0 = class(slot1)
end

Xbox360FriendsDialog = slot0
function Xbox360FriendsDialog:init(manager, data)
	slot7 = data

	FriendsDialog.init(slot4, self, manager)

	return 
end
function Xbox360FriendsDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	slot3 = XboxLive
	slot6 = self

	XboxLive.show_friends_ui(slot2, self.get_platform_id(slot5))

	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._show_time = TimerManager.main(slot2).time(slot2)

	return true
end
function Xbox360FriendsDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = Application

		if not Application.is_showing_system_dialog(slot4) then
			slot5 = self

			self.done_callback(slot4)
		end
	end

	return 
end
function Xbox360FriendsDialog:done_callback()
	self._show_time = nil
	slot3 = self

	FriendsDialog.done_callback(slot2)

	return 
end

return 
