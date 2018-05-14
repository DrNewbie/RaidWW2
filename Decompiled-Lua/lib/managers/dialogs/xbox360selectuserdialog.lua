slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/SelectUserDialog"

require(slot1)

if not Xbox360SelectUserDialog then
	slot2 = SelectUserDialog
	slot0 = class(slot1)
end

Xbox360SelectUserDialog = slot0
function Xbox360SelectUserDialog:init(manager, data)
	slot7 = data

	SelectUserDialog.init(slot4, self, manager)

	local count = self._data.count

	if count and count ~= 1 and count ~= 2 and count ~= 4 then
		if 2 < count then
			self._data.count = 4
		else
			self._data.count = 1
		end
	end

	return 
end
function Xbox360SelectUserDialog:show()
	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	local wrapper_index = managers.controller.get_default_wrapper_index(slot2)
	slot5 = wrapper_index
	local controller_index = managers.controller.get_controller_index_list(managers.controller, managers.controller)
	slot6 = controller_index
	local controller = Input.controller(managers.controller, Input)
	slot10 = "controller:type()"
	slot13 = controller

	print(Input, "[Xbox360SelectUserDialog:show] wrapper_index", wrapper_index, "controller_index", controller_index, controller.type(slot12))

	slot6 = controller

	if controller.type(Input) == "xb1_controller" then
		slot7 = controller

		XboxLive.show_signin_ui(slot5, XboxLive)

		slot6 = TimerManager
		slot6 = TimerManager.main(slot5)
		self._show_time = TimerManager.main(slot5).time(slot5)
	end

	return true
end
function Xbox360SelectUserDialog:update(t, dt)
	if self._show_time and self._show_time ~= t then
		slot5 = XboxLive

		if not XboxLive.is_showing_user_dialog(slot4) then
			slot5 = self._manager

			if not self._manager._is_engine_delaying_signin_change(slot4) then
				slot5 = self

				self.done_callback(slot4)
			end
		end
	end

	return 
end
function Xbox360SelectUserDialog:done_callback()
	self._show_time = nil
	slot3 = self

	SelectUserDialog.done_callback(slot2)

	return 
end

return 
