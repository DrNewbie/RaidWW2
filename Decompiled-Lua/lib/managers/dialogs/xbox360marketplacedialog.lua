slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/MarketplaceDialog"

require(slot1)

if not Xbox360MarketplaceDialog then
	slot2 = MarketplaceDialog
	slot0 = class(slot1)
end

Xbox360MarketplaceDialog = slot0
function Xbox360MarketplaceDialog:init(manager, data)
	slot7 = data

	MarketplaceDialog.init(slot4, self, manager)

	return 
end
function Xbox360MarketplaceDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	local end_parameter_list = {}
	slot4 = end_parameter_list
	slot7 = self

	table.insert(self._manager, self.item_type(slot6))

	slot4 = end_parameter_list
	slot7 = self

	table.insert(self._manager, self.item_id(slot6))

	slot5 = self.get_platform_id(slot6)
	slot8 = end_parameter_list

	XboxLive.show_marketplace_ui(self._manager, XboxLive, unpack(self))

	slot4 = TimerManager
	slot4 = TimerManager.main(self._manager)
	self._show_time = TimerManager.main(self._manager).time(self._manager)

	return true
end
function Xbox360MarketplaceDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = Application

		if not Application.is_showing_system_dialog(slot4) then
			slot5 = self

			self.done_callback(slot4)
		end
	end

	return 
end
function Xbox360MarketplaceDialog:done_callback()
	self._show_time = nil
	slot3 = self

	MarketplaceDialog.done_callback(slot2)

	return 
end

return 
