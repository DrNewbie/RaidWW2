slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/AchievementsDialog"

require(slot1)

if not Xbox360AchievementsDialog then
	slot2 = AchievementsDialog
	slot0 = class(slot1)
end

Xbox360AchievementsDialog = slot0
function Xbox360AchievementsDialog:init(manager, data)
	slot7 = data

	AchievementsDialog.init(slot4, self, manager)

	return 
end
function Xbox360AchievementsDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	slot3 = XboxLive
	slot6 = self

	XboxLive.show_achievements_ui(slot2, self.get_platform_id(slot5))

	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._show_time = TimerManager.main(slot2).time(slot2)

	return true
end
function Xbox360AchievementsDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = Application

		if not Application.is_showing_system_dialog(slot4) then
			slot5 = self

			self.done_callback(slot4)
		end
	end

	return 
end
function Xbox360AchievementsDialog:done_callback()
	self._show_time = nil
	slot3 = self

	AchievementsDialog.done_callback(slot2)

	return 
end

return 
