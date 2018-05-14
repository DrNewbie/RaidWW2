-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "SystemMenuManager"

core.module(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot2 = "lib/managers/dialogs/GenericDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360Dialog"

require(slot1)

slot2 = "lib/managers/dialogs/PS3Dialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360SelectStorageDialog"

require(slot1)

slot2 = "lib/managers/dialogs/PS3DeleteFileDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360KeyboardInputDialog"

require(slot1)

slot2 = "lib/managers/dialogs/PS3KeyboardInputDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360SelectUserDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360AchievementsDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360FriendsDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360PlayerReviewDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360PlayerDialog"

require(slot1)

slot2 = "lib/managers/dialogs/Xbox360MarketplaceDialog"

require(slot1)

slot2 = "lib/managers/dialogs/NewUnlockDialog"

require(slot1)

slot2 = "lib/managers/dialogs/SpecializationDialog"

require(slot1)

SystemMenuManager = SystemMenuManager or class()
SystemMenuManager.PLATFORM_CLASS_MAP = {}
function SystemMenuManager:new(...)
	local platform = SystemInfo.platform(slot2)
	slot5 = platform
	slot4 = self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericSystemMenuManager

	return self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericSystemMenuManager.new(SystemInfo, ...)
end
GenericSystemMenuManager = GenericSystemMenuManager or class()
GenericSystemMenuManager.DIALOG_CLASS = GenericDialog
GenericSystemMenuManager.GENERIC_DIALOG_CLASS = GenericDialog
GenericSystemMenuManager.PLATFORM_DIALOG_CLASS = GenericDialog
GenericSystemMenuManager.NEW_UNLOCK_CLASS = NewUnlockDialog
GenericSystemMenuManager.GENERIC_NEW_UNLOCK_CLASS = NewUnlockDialog
GenericSystemMenuManager.SPECIALIZATION_CLASS = SpecializationDialog
GenericSystemMenuManager.GENERIC_SPECIALIZATION_CLASS = SpecializationDialog
function GenericSystemMenuManager:init()
	if not Global.dialog_manager then
		Global.dialog_manager = {}
	end

	slot3 = CoreEvent.CallbackEventHandler
	self._dialog_shown_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._dialog_hidden_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._dialog_closed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._active_changed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "dialog", nil)
	slot3 = managers.controller
	slot8 = "changed_controller_index"

	managers.controller.add_default_wrapper_index_change_callback(slot2, callback(nil, self, self))

	slot3 = managers.viewport
	slot8 = "resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot2, callback(nil, self, self))
	slot9 = "controller_hotswap_triggered"
	slot6 = 2

	managers.controller.add_hotswap_callback(slot2, managers.controller, "system_menu", callback(self, self, self))

	return 
end
function GenericSystemMenuManager:init_finalize()
	local gui = Overlay.gui(slot2)
	slot4 = Overlay
	slot4 = Overlay.gui(Overlay)
	self._ws = Overlay.gui(Overlay).create_screen_workspace(Overlay)
	slot5 = self._ws

	managers.gui_data.layout_1280_workspace(Overlay, managers.gui_data)

	slot4 = self._ws

	self._ws.hide(Overlay)

	if Global.dialog_manager.init_show_data_list then
		local init_show_data_list = Global.dialog_manager.init_show_data_list
		Global.dialog_manager.init_show_data_list = nil
		slot5 = init_show_data_list

		for index, data in ipairs(nil) do
			slot14 = index
			slot16 = #init_show_data_list
			slot11 = "[SystemMenuManager] Processing init dialog. Index: " .. tostring(slot13) .. "/" .. tostring(slot15)

			cat_print(slot9, "dialog_manager")

			slot11 = data

			self.show(slot9, self)
		end
	end

	return 
end
function GenericSystemMenuManager:controller_hotswap_triggered()
	if self._active_dialog then
		slot4 = self._controller

		self._active_dialog.set_controller(slot2, self._active_dialog)

		slot3 = self._active_dialog

		self._active_dialog.controller_hotswap_triggered(slot2)
	end

	return 
end
function GenericSystemMenuManager:resolution_changed()
	slot4 = self._ws

	managers.gui_data.layout_1280_workspace(slot2, managers.gui_data)

	return 
end
function GenericSystemMenuManager:add_init_show(data)
	local init_show_data_list = Global.dialog_manager.init_show_data_list
	local priority = data.priority or 0
	slot10 = priority
	slot7 = "[SystemMenuManager] Adding an init dialog with priority \"" .. tostring(slot9) .. "\"."

	cat_print(slot5, "dialog_manager")

	if init_show_data_list then
		for index = #init_show_data_list, 1, -1 do
			local next_data = init_show_data_list[index]
			local next_priority = next_data.priority or 0

			if priority < next_priority then
				slot16 = next_priority
				slot18 = index
				slot20 = #init_show_data_list
				slot13 = "[SystemMenuManager] Ignoring request to show init dialog since it had lower priority than the existing priority \"" .. tostring(slot15) .. "\". Index: " .. tostring(slot17) .. "/" .. tostring(slot19)

				cat_print(slot11, "dialog_manager")

				return false
			elseif next_priority < priority then
				slot16 = next_priority
				slot18 = index
				slot20 = #init_show_data_list
				slot13 = "[SystemMenuManager] Removed an already added init dialog with the lower priority of \"" .. tostring(slot15) .. "\". Index: " .. tostring(slot17) .. "/" .. tostring(slot19)

				cat_print(slot11, "dialog_manager")

				slot13 = index

				table.remove(slot11, init_show_data_list)
			end
		end
	else
		init_show_data_list = {}
	end

	slot7 = data

	table.insert(slot5, init_show_data_list)

	Global.dialog_manager.init_show_data_list = init_show_data_list

	return 
end
function GenericSystemMenuManager:destroy()
	slot4 = "system_menu"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	slot3 = self._ws

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._ws

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._ws = nil
	end

	if self._controller then
		slot3 = self._controller

		self._controller.destroy(slot2)

		self._controller = nil
	end

	return 
end
function GenericSystemMenuManager:changed_controller_index(default_wrapper_index)
	local was_enabled = self._controller.enabled(slot3)
	slot5 = self._controller

	self._controller.destroy(self._controller)

	slot8 = false
	self._controller = managers.controller.create_controller(self._controller, managers.controller, "dialog", nil)
	slot6 = was_enabled

	self._controller.set_enabled(self._controller, self._controller)

	return 
end
function GenericSystemMenuManager:update(t, dt)
	if self._active_dialog and self._active_dialog.update then
		slot7 = dt

		self._active_dialog.update(slot4, self._active_dialog, t)
	end

	slot5 = self

	self.update_queue(slot4)

	slot5 = self

	self.check_active_state(slot4)

	return 
end
function GenericSystemMenuManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function GenericSystemMenuManager:update_queue()
	slot4 = true

	if not self.is_active(slot2, self) and self._dialog_queue then
		local dialog, index = nil
		slot5 = self._dialog_queue

		for next_index, next_dialog in ipairs(slot4) do
		end

		slot6 = index

		table.remove(slot4, self._dialog_queue)

		slot5 = self._dialog_queue

		if not next(slot4) then
			self._dialog_queue = nil
		end

		if dialog then
			slot7 = true

			self._show_instance(slot4, self, dialog)
		end
	end

	return 
end
function GenericSystemMenuManager:check_active_state()

	-- Decompilation error in this vicinity:
	slot4 = true
	local active = self.is_active(slot2, self)

	if not self._old_active_state ~= not active then
		slot5 = active

		self.event_active_changed(slot3, self)

		self._old_active_state = active
	end

	return 
end
function GenericSystemMenuManager:block_exec()
	slot3 = self

	return self.is_active(slot2)
end
function GenericSystemMenuManager:is_active()
	return self._active_dialog ~= nil
end
function GenericSystemMenuManager:is_closing()
end
function GenericSystemMenuManager:force_close_all()

	-- Decompilation error in this vicinity:
	if self._active_dialog then
		slot3 = self._active_dialog

		if self._active_dialog.blocks_exec(slot2) then
			slot3 = self._active_dialog

			self._active_dialog.fade_out_close(slot2)
		end
	end

	if self._dialog_queue then
		slot3 = self._dialog_queue

		for i, dialog in ipairs(slot2) do
			if self._active_dialog and self._active_dialog ~= dialog then
				slot8 = dialog

				dialog.force_close(slot7)
			end
		end
	end

	self._dialog_queue = nil

	return 
end
function GenericSystemMenuManager:get_dialog(id)
	if not id then
		return 
	end

	if self._active_dialog then
		slot4 = self._active_dialog

		if self._active_dialog.id(slot3) == id then
			return self._active_dialog
		end
	end

	return 
end
function GenericSystemMenuManager:close(id, hard)
	if not id then
		return 
	end

	slot3 = print
	slot5 = "close active dialog"

	if self._active_dialog then
		slot8 = self._active_dialog
		slot6 = self._active_dialog.id(slot7)
	end

	slot7 = id

	slot3(slot4, slot5, slot6)

	if self._active_dialog then
		slot5 = self._active_dialog

		if self._active_dialog.id(slot4) == id then
			if hard then
				slot5 = self._active_dialog

				self._active_dialog.close(slot4)
			else
				slot5 = self._active_dialog

				self._active_dialog.fade_out_close(slot4)
			end
		end
	end

	if not self._dialog_queue then
		return 
	end

	local remove_list = nil
	slot6 = self._dialog_queue

	for i, dialog in ipairs(slot5) do
		slot11 = dialog

		if dialog.id(slot10) == id then
			slot12 = id

			print(slot10, "remove from queue")

			remove_list = remove_list or {}
			slot13 = i

			table.insert(slot10, remove_list, 1)
		end
	end

	if remove_list then
		slot6 = remove_list

		for _, i in ipairs(slot5) do
			slot12 = i

			table.remove(slot10, self._dialog_queue)
		end
	end

	return 
end
function GenericSystemMenuManager:is_active_by_id(id)
	if not self._active_dialog or not id then
		return false
	end

	slot4 = self._active_dialog

	if self._active_dialog.id(slot3) == id then
		return true, self._active_dialog
	end

	if not self._dialog_queue then
		return false
	end

	slot4 = self._dialog_queue

	for i, dialog in ipairs(slot3) do
		slot9 = dialog

		if dialog.id(slot8) == id then
			return true, dialog
		end
	end

	return false
end
function GenericSystemMenuManager:_show_result(success, data)
	if not success and data then
		local default_button_index = data.focus_button or 1
		local button_list = data.button_list

		if data.button_list then
			local button_data = data.button_list[default_button_index]

			if button_data then
				local callback_func = button_data.callback_func

				if callback_func then
					slot10 = button_data

					callback_func(slot8, default_button_index)
				end
			end
		end

		if data.callback_func then
			slot8 = data

			data.callback_func(slot6, default_button_index)
		end
	end

	return 
end
function GenericSystemMenuManager:show(data)
	if _G.setup then
		slot4 = _G.setup

		if _G.setup.has_queued_exec(slot3) then
			return 
		end
	end

	slot8 = data.force
	local success = self._show_class(slot3, self, data, self.GENERIC_DIALOG_CLASS, self.DIALOG_CLASS)
	slot7 = data

	self._show_result(self, self, success)

	if managers.hud then
		slot6 = true

		managers.hud.hide_comm_wheel(slot4, managers.hud)

		slot5 = managers.hud

		managers.hud.hide_stats_screen(slot4)
	end

	return 
end
function GenericSystemMenuManager:show_platform(data)
	slot8 = data.force
	local success = self._show_class(slot3, self, data, self.GENERIC_DIALOG_CLASS, self.PLATFORM_DIALOG_CLASS)
	slot7 = data

	self._show_result(self, self, success)

	return 
end
function GenericSystemMenuManager:show_select_storage(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_SELECT_STORAGE_DIALOG_CLASS, self.SELECT_STORAGE_DIALOG_CLASS)

	return 
end
function GenericSystemMenuManager:show_delete_file(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_DELETE_FILE_DIALOG_CLASS, self.DELETE_FILE_DIALOG_CLASS)

	return 
end
function GenericSystemMenuManager:show_keyboard_input(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_KEYBOARD_INPUT_DIALOG, self.KEYBOARD_INPUT_DIALOG)

	return 
end
function GenericSystemMenuManager:show_select_user(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_SELECT_USER_DIALOG, self.SELECT_USER_DIALOG)

	return 
end
function GenericSystemMenuManager:show_achievements(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_ACHIEVEMENTS_DIALOG, self.ACHIEVEMENTS_DIALOG)

	return 
end
function GenericSystemMenuManager:show_friends(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_FRIENDS_DIALOG, self.FRIENDS_DIALOG)

	return 
end
function GenericSystemMenuManager:show_player_review(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_PLAYER_REVIEW_DIALOG, self.PLAYER_REVIEW_DIALOG)

	return 
end
function GenericSystemMenuManager:show_player(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_PLAYER_DIALOG, self.PLAYER_DIALOG)

	return 
end
function GenericSystemMenuManager:show_marketplace(data)
	slot8 = false

	self._show_class(slot3, self, data, self.GENERIC_MARKETPLACE_DIALOG, self.MARKETPLACE_DIALOG)

	return 
end
function GenericSystemMenuManager:show_new_unlock(data)
	slot8 = data.force
	local success = self._show_class(slot3, self, data, self.GENERIC_NEW_UNLOCK_CLASS, self.NEW_UNLOCK_CLASS)
	slot7 = data

	self._show_result(self, self, success)

	return 
end
function GenericSystemMenuManager:show_specialization_convert(data)
	slot8 = data.force
	local success = self._show_class(slot3, self, data, self.GENERIC_SPECIALIZATION_CLASS, self.SPECIALIZATION_CLASS)
	slot7 = data

	self._show_result(self, self, success)

	return 
end
function GenericSystemMenuManager:_show_class(data, generic_dialog_class, dialog_class, force)
	local dialog_class = (data and data.is_generic and generic_dialog_class) or dialog_class

	if dialog_class then
		slot10 = data
		local dialog = dialog_class.new(slot7, dialog_class, self)
		slot11 = force

		self._show_instance(dialog_class, self, dialog)

		return true
	else
		if data then
			local callback_func = data.callback_func

			if callback_func then
				callback_func()
			end
		end

		return false
	end

	return 
end
function GenericSystemMenuManager:_show_instance(dialog, force)
	slot6 = true
	local is_active = self.is_active(slot4, self)

	if is_active and force then
		slot6 = self

		self.hide_active_dialog(slot5)
	end

	local queue = true

	if not is_active then
		slot7 = dialog
		queue = not dialog.show(slot6)
	end

	if queue then
		slot9 = (force and 1) or nil

		self.queue_dialog(slot6, self, dialog)
	end

	return 
end
function GenericSystemMenuManager:hide_active_dialog()
	if self._active_dialog then
		slot3 = self._active_dialog

		if not self._active_dialog.is_closing(slot2) and self._active_dialog.hide then
			slot5 = 1

			self.queue_dialog(slot2, self, self._active_dialog)

			slot3 = self._active_dialog

			self._active_dialog.hide(slot2)
		end
	end

	return 
end
function GenericSystemMenuManager:_is_dialog_queued_or_active(dialog)
	if self._active_dialog then
		slot5 = dialog

		if self._active_dialog.is_identical(slot3, self._active_dialog) then
			return true
		end
	end

	slot4 = self._dialog_queue

	for _, d in ipairs(slot3) do
		slot10 = dialog

		if d.is_identical(slot8, d) then
			return true
		end
	end

	return 
end
function GenericSystemMenuManager:queue_dialog(dialog, index)
	if Global.category_print.dialog_manager then
		slot9 = index
		slot11 = self._dialog_queue and #self._dialog_queue
		slot15 = dialog
		slot6 = "[SystemMenuManager] [Queue dialog (index: " .. tostring(slot8) .. "/" .. tostring(slot10) .. ")] " .. tostring(dialog.to_string(slot14))

		cat_print(slot4, "dialog_manager")
	end

	self._dialog_queue = self._dialog_queue or {}
	slot6 = dialog

	if not self._is_dialog_queued_or_active(slot4, self) then
		if index then
			slot7 = dialog

			table.insert(slot4, self._dialog_queue, index)
		else
			slot6 = dialog

			table.insert(slot4, self._dialog_queue)
		end
	end

	return 
end
function GenericSystemMenuManager:set_active_dialog(dialog)
	self._active_dialog = dialog

	if dialog and dialog._get_ws then
		slot4 = dialog
		local is_ws_visible = dialog._get_ws(slot3) == self._ws
	end

	if not self._is_ws_visible ~= not is_ws_visible then
		if is_ws_visible then
			slot5 = self._ws

			self._ws.show(slot4)
		else
			slot5 = self._ws

			self._ws.hide(slot4)
		end

		self._is_ws_visible = is_ws_visible
	end

	if dialog then
		slot5 = dialog
		local is_controller_enabled = dialog._get_controller(slot4) == self._controller
	end

	slot6 = self._controller

	if not self._controller.enabled(slot5) ~= not is_controller_enabled then
		slot7 = is_controller_enabled

		self._controller.set_enabled(slot5, self._controller)
	end

	return 
end
function GenericSystemMenuManager:_is_engine_delaying_signin_change()
	if self._is_engine_delaying_signin_change_delay then
		slot4 = TimerManager
		slot4 = TimerManager.main(slot3)
		self._is_engine_delaying_signin_change_delay = self._is_engine_delaying_signin_change_delay - TimerManager.main(slot3).delta_time(slot3)

		if self._is_engine_delaying_signin_change_delay <= 0 then
			self._is_engine_delaying_signin_change_delay = nil

			return false
		end
	else
		self._is_engine_delaying_signin_change_delay = 1.2
	end

	return true
end
function GenericSystemMenuManager:_get_ws()
	return self._ws
end
function GenericSystemMenuManager:_get_controller()
	return self._controller
end
function GenericSystemMenuManager:add_dialog_shown_callback(func)
	slot5 = func

	self._dialog_shown_callback_handler.add(slot3, self._dialog_shown_callback_handler)

	return 
end
function GenericSystemMenuManager:remove_dialog_shown_callback(func)
	slot5 = func

	self._dialog_shown_callback_handler.remove(slot3, self._dialog_shown_callback_handler)

	return 
end
function GenericSystemMenuManager:add_dialog_hidden_callback(func)
	slot5 = func

	self._dialog_hidden_callback_handler.add(slot3, self._dialog_hidden_callback_handler)

	return 
end
function GenericSystemMenuManager:remove_dialog_hidden_callback(func)
	slot5 = func

	self._dialog_hidden_callback_handler.remove(slot3, self._dialog_hidden_callback_handler)

	return 
end
function GenericSystemMenuManager:add_dialog_closed_callback(func)
	slot5 = func

	self._dialog_closed_callback_handler.add(slot3, self._dialog_closed_callback_handler)

	return 
end
function GenericSystemMenuManager:remove_dialog_closed_callback(func)
	slot5 = func

	self._dialog_closed_callback_handler.remove(slot3, self._dialog_closed_callback_handler)

	return 
end
function GenericSystemMenuManager:add_active_changed_callback(func)
	slot5 = func

	self._active_changed_callback_handler.add(slot3, self._active_changed_callback_handler)

	return 
end
function GenericSystemMenuManager:remove_active_changed_callback(func)
	slot5 = func

	self._active_changed_callback_handler.remove(slot3, self._active_changed_callback_handler)

	return 
end
function GenericSystemMenuManager:event_dialog_shown(dialog)
	if Global.category_print.dialog_manager then
		slot10 = dialog
		slot5 = "[SystemMenuManager] [Show dialog] " .. tostring(dialog.to_string(slot9))

		cat_print(slot3, "dialog_manager")
	end

	if dialog.fade_in then
		slot4 = dialog

		dialog.fade_in(slot3)
	end

	slot5 = dialog

	self.set_active_dialog(slot3, self)

	slot5 = dialog

	self._dialog_shown_callback_handler.dispatch(slot3, self._dialog_shown_callback_handler)

	return 
end
function GenericSystemMenuManager:event_dialog_hidden(dialog)
	if Global.category_print.dialog_manager then
		slot10 = dialog
		slot5 = "[SystemMenuManager] [Hide dialog] " .. tostring(dialog.to_string(slot9))

		cat_print(slot3, "dialog_manager")
	end

	slot5 = nil

	self.set_active_dialog(slot3, self)

	slot5 = dialog

	self._dialog_hidden_callback_handler.dispatch(slot3, self._dialog_hidden_callback_handler)

	return 
end
function GenericSystemMenuManager:event_dialog_closed(dialog)
	if Global.category_print.dialog_manager then
		slot10 = dialog
		slot5 = "[SystemMenuManager] [Close dialog] " .. tostring(dialog.to_string(slot9))

		cat_print(slot3, "dialog_manager")
	end

	slot5 = nil

	self.set_active_dialog(slot3, self)

	slot5 = dialog

	self._dialog_closed_callback_handler.dispatch(slot3, self._dialog_closed_callback_handler)

	return 
end
function GenericSystemMenuManager:event_active_changed(active)
	if Global.category_print.dialog_manager then
		slot8 = not not active
		slot5 = "[SystemMenuManager] [Active changed] Active: " .. tostring(slot7)

		cat_print(slot3, "dialog_manager")
	end

	return 
end

if not WinSystemMenuManager then
	slot2 = GenericSystemMenuManager
	slot0 = class(slot1)
end

WinSystemMenuManager = slot0
slot3 = "win32"
slot3 = Idstring(slot2)
SystemMenuManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = WinSystemMenuManager

if not Xbox360SystemMenuManager then
	slot2 = GenericSystemMenuManager
	slot0 = class(slot1)
end

Xbox360SystemMenuManager = slot0
Xbox360SystemMenuManager.PLATFORM_DIALOG_CLASS = Xbox360Dialog
Xbox360SystemMenuManager.SELECT_STORAGE_DIALOG_CLASS = Xbox360SelectStorageDialog
Xbox360SystemMenuManager.GENERIC_SELECT_STORAGE_DIALOG_CLASS = Xbox360SelectStorageDialog
Xbox360SystemMenuManager.KEYBOARD_INPUT_DIALOG = Xbox360KeyboardInputDialog
Xbox360SystemMenuManager.GENERIC_KEYBOARD_INPUT_DIALOG = Xbox360KeyboardInputDialog
Xbox360SystemMenuManager.GENERIC_SELECT_USER_DIALOG = Xbox360SelectUserDialog
Xbox360SystemMenuManager.SELECT_USER_DIALOG = Xbox360SelectUserDialog
Xbox360SystemMenuManager.GENERIC_ACHIEVEMENTS_DIALOG = Xbox360AchievementsDialog
Xbox360SystemMenuManager.ACHIEVEMENTS_DIALOG = Xbox360AchievementsDialog
Xbox360SystemMenuManager.GENERIC_FRIENDS_DIALOG = Xbox360FriendsDialog
Xbox360SystemMenuManager.FRIENDS_DIALOG = Xbox360FriendsDialog
Xbox360SystemMenuManager.GENERIC_PLAYER_REVIEW_DIALOG = Xbox360PlayerReviewDialog
Xbox360SystemMenuManager.PLAYER_REVIEW_DIALOG = Xbox360PlayerReviewDialog
Xbox360SystemMenuManager.GENERIC_PLAYER_DIALOG = Xbox360PlayerDialog
Xbox360SystemMenuManager.PLAYER_DIALOG = Xbox360PlayerDialog
Xbox360SystemMenuManager.GENERIC_MARKETPLACE_DIALOG = Xbox360MarketplaceDialog
Xbox360SystemMenuManager.MARKETPLACE_DIALOG = Xbox360MarketplaceDialog
slot3 = "X360"
slot3 = Idstring(slot2)
SystemMenuManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = Xbox360SystemMenuManager
function Xbox360SystemMenuManager:is_active(skip_block_exec)
	if self._active_dialog and not skip_block_exec then
		slot4 = self._active_dialog
		local dialog_block = self._active_dialog.blocks_exec(slot3)
	end

	if dialog_block then
		slot5 = self

		if not GenericSystemMenuManager.is_active(slot4) then
			slot5 = Application
			slot3 = Application.is_showing_system_dialog(slot4)
		end
	end

	return slot3
end

if not XB1SystemMenuManager then
	slot2 = GenericSystemMenuManager
	slot0 = class(slot1)
end

XB1SystemMenuManager = slot0
XB1SystemMenuManager.KEYBOARD_INPUT_DIALOG = Xbox360KeyboardInputDialog
XB1SystemMenuManager.GENERIC_KEYBOARD_INPUT_DIALOG = Xbox360KeyboardInputDialog
XB1SystemMenuManager.GENERIC_SELECT_USER_DIALOG = Xbox360SelectUserDialog
XB1SystemMenuManager.SELECT_USER_DIALOG = Xbox360SelectUserDialog
XB1SystemMenuManager.GENERIC_ACHIEVEMENTS_DIALOG = Xbox360AchievementsDialog
XB1SystemMenuManager.ACHIEVEMENTS_DIALOG = Xbox360AchievementsDialog
XB1SystemMenuManager.GENERIC_FRIENDS_DIALOG = Xbox360FriendsDialog
XB1SystemMenuManager.FRIENDS_DIALOG = Xbox360FriendsDialog
XB1SystemMenuManager.GENERIC_PLAYER_REVIEW_DIALOG = Xbox360PlayerReviewDialog
XB1SystemMenuManager.PLAYER_REVIEW_DIALOG = Xbox360PlayerReviewDialog
XB1SystemMenuManager.GENERIC_PLAYER_DIALOG = Xbox360PlayerDialog
XB1SystemMenuManager.PLAYER_DIALOG = Xbox360PlayerDialog
XB1SystemMenuManager.GENERIC_MARKETPLACE_DIALOG = Xbox360MarketplaceDialog
XB1SystemMenuManager.MARKETPLACE_DIALOG = Xbox360MarketplaceDialog
slot3 = "XB1"
slot3 = Idstring(slot2)
SystemMenuManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = XB1SystemMenuManager
function XB1SystemMenuManager:is_active(skip_block_exec)
	if self._active_dialog and not skip_block_exec then
		slot4 = self._active_dialog
		local dialog_block = self._active_dialog.blocks_exec(slot3)
	end

	if dialog_block then
		slot5 = self

		if not GenericSystemMenuManager.is_active(slot4) then
			slot5 = Application
			slot3 = Application.is_showing_system_dialog(slot4)
		end
	end

	return slot3
end

if not PS3SystemMenuManager then
	slot2 = GenericSystemMenuManager
	slot0 = class(slot1)
end

PS3SystemMenuManager = slot0
PS3SystemMenuManager.DELETE_FILE_DIALOG_CLASS = PS3DeleteFileDialog
PS3SystemMenuManager.GENERIC_DELETE_FILE_DIALOG_CLASS = PS3DeleteFileDialog
PS3SystemMenuManager.KEYBOARD_INPUT_DIALOG = PS3KeyboardInputDialog
PS3SystemMenuManager.GENERIC_KEYBOARD_INPUT_DIALOG = PS3KeyboardInputDialog
slot3 = "PS3"
slot3 = Idstring(slot2)
SystemMenuManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = PS3SystemMenuManager
function PS3SystemMenuManager:init()
	slot3 = self

	GenericSystemMenuManager.init(slot2)

	self._is_ps_button_menu_visible = false
	slot3 = PS3
	slot8 = "ps_button_menu_callback"

	PS3.set_ps_button_callback(slot2, callback(slot5, self, self))

	return 
end
function PS3SystemMenuManager:ps_button_menu_callback(is_ps_button_menu_visible)
	self._is_ps_button_menu_visible = is_ps_button_menu_visible

	return 
end
function PS3SystemMenuManager:block_exec()
	slot3 = self

	if not GenericSystemMenuManager.is_active(slot2) then
		slot3 = PS3
		slot1 = PS3.is_displaying_box(slot2)
	end

	return slot1
end
function PS3SystemMenuManager:is_active()
	slot3 = self

	if not GenericSystemMenuManager.is_active(slot2) then
		slot3 = PS3

		return PS3.is_displaying_box(slot2) or self._is_ps_button_menu_visible
	end
end

if not PS4SystemMenuManager then
	slot2 = GenericSystemMenuManager
	slot0 = class(slot1)
end

PS4SystemMenuManager = slot0
PS4SystemMenuManager.DELETE_FILE_DIALOG_CLASS = PS3DeleteFileDialog
PS4SystemMenuManager.GENERIC_DELETE_FILE_DIALOG_CLASS = PS3DeleteFileDialog
PS4SystemMenuManager.KEYBOARD_INPUT_DIALOG = PS3KeyboardInputDialog
PS4SystemMenuManager.GENERIC_KEYBOARD_INPUT_DIALOG = PS3KeyboardInputDialog
slot3 = "PS4"
slot3 = Idstring(slot2)
SystemMenuManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = PS4SystemMenuManager
function PS4SystemMenuManager:init()
	slot3 = self

	GenericSystemMenuManager.init(slot2)

	self._is_ps_button_menu_visible = false
	slot3 = PS3
	slot8 = "ps_button_menu_callback"

	PS3.set_ps_button_callback(slot2, callback(slot5, self, self))

	return 
end
function PS4SystemMenuManager:ps_button_menu_callback(is_ps_button_menu_visible)
	self._is_ps_button_menu_visible = is_ps_button_menu_visible

	return 
end
function PS4SystemMenuManager:block_exec()
	slot3 = self

	if not GenericSystemMenuManager.is_active(slot2) then
		slot3 = PS3
		slot1 = PS3.is_displaying_box(slot2)
	end

	return slot1
end
function PS4SystemMenuManager:is_active()
	slot3 = self

	if not GenericSystemMenuManager.is_active(slot2) then
		slot3 = PS3

		return PS3.is_displaying_box(slot2) or self._is_ps_button_menu_visible
	end
end

return 
