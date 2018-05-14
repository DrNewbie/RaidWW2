-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/Dialog"

require(slot1)

if not GenericDialog then
	slot2 = Dialog
	slot0 = class(slot1)
end

GenericDialog = slot0
GenericDialog.FADE_IN_DURATION = 0.2
GenericDialog.FADE_OUT_DURATION = 0.2
GenericDialog.MOVE_AXIS_LIMIT = 0.4
GenericDialog.MOVE_AXIS_DELAY = 0.4
function GenericDialog:init(manager, data, is_title_outside)
	slot8 = data

	Dialog.init(slot5, self, manager)

	if not self._data.focus_button then
		if 0 < #self._button_text_list then
			self._data.focus_button = #self._button_text_list
		else
			self._data.focus_button = 1
		end
	else
		self._default_button = self._data.focus_button
	end

	if not self._data.ws then
		slot6 = manager
		slot4 = manager._get_ws(slot5)
	end

	self._ws = slot4
	slot11 = {
		no_close_legend = true,
		type = self._data.type or "system_menu",
		is_title_outside = is_title_outside
	}
	self._panel_script = _G.TextBoxGui.new(slot5, _G.TextBoxGui, self._ws, self._data.title or "", self._data.text or "", self._data)
	slot6 = self._panel_script

	self._panel_script.add_background(slot5)

	slot7 = _G.tweak_data.gui.DIALOG_LAYER

	self._panel_script.set_layer(slot5, self._panel_script)

	slot6 = self._panel_script

	self._panel_script.set_centered(slot5)

	slot7 = 0

	self._panel_script.set_fade(slot5, self._panel_script)

	if not self._data.controller then
		slot6 = manager
		slot4 = manager._get_controller(slot5)
	end

	self._controller = slot4
	slot8 = "button_pressed_callback"
	self._confirm_func = callback(slot5, self, self)
	slot8 = "dialog_cancel_callback"
	self._cancel_func = callback(slot5, self, self)
	slot8 = "resolution_changed_callback"
	self._resolution_changed_callback = callback(slot5, self, self)
	slot7 = self._resolution_changed_callback

	managers.viewport.add_resolution_changed_func(slot5, managers.viewport)

	if data.counter then
		self._counter = data.counter
		self._counter_time = self._counter[1]
	end

	return 
end
function GenericDialog:set_text(text, no_upper)
	slot7 = no_upper

	self._panel_script.set_text(slot4, self._panel_script, text)

	return 
end
function GenericDialog:set_title(text, no_upper)
	slot7 = no_upper

	self._panel_script.set_title(slot4, self._panel_script, text)

	return 
end
function GenericDialog:mouse_moved(o, x, y)

	-- Decompilation error in this vicinity:
	slot8 = y
	local used, pointer = self._panel_script.moved_scroll_bar(slot5, self._panel_script, x)

	if used then
		return used, pointer
	end

	slot10 = y
	local x, y = managers.mouse_pointer.convert_1280_mouse_pos(slot7, managers.mouse_pointer, x)
	slot10 = self._panel_script._buttons

	for i, button in ipairs(x) do
		slot17 = y

		if button.inside(slot14, button, x) then
			slot16 = i

			self._panel_script.set_focus_button(slot14, self._panel_script)
		elseif self._panel_script._text_box_focus_button == i then
			slot16 = i

			self._panel_script.unfocus_button(slot14, self._panel_script)
		end
	end

	return false, "arrow"
end
function GenericDialog:mouse_pressed(o, button, x, y)
	slot7 = "0"

	if button == Idstring(slot6) then
		slot7 = self._panel_script._buttons

		for i, gui_button in ipairs(slot6) do
			slot14 = y

			if gui_button.inside(slot11, gui_button, x) then
				slot13 = button

				gui_button.on_mouse_pressed(slot11, gui_button)
			end
		end

		slot7 = self._panel_script.controls

		for i, control in ipairs(slot6) do
			slot14 = y

			if control.inside(slot11, control, x) then
				slot13 = button

				control.on_mouse_pressed(slot11, control)
			end
		end
	end

	return 
end
function GenericDialog:mouse_released(o, button, x, y)
	slot7 = "0"

	if button == Idstring(slot6) then
		slot9 = y
		local x, y = managers.mouse_pointer.convert_1280_mouse_pos(slot6, managers.mouse_pointer, x)
		slot11 = y

		if self._panel_script.check_grab_scroll_bar(x, self._panel_script, x) then
			return 
		end

		slot9 = "0"

		if button == Idstring(slot8) then
			slot9 = self._panel_script._buttons

			for i, gui_button in ipairs(slot8) do
				slot16 = y

				if gui_button.inside(slot13, gui_button, x) then
					slot15 = button

					gui_button.on_mouse_released(slot13, gui_button)

					slot14 = self

					self.button_pressed_callback(slot13)

					return 
				end
			end

			slot9 = self._panel_script.controls

			for i, control in ipairs(slot8) do
				slot16 = y

				if control.inside(slot13, control, x) then
					slot15 = button

					control.on_mouse_released(slot13, control)
				end
			end
		end
	else
		slot7 = self._panel_script

		self._panel_script.release_scroll_bar(slot6)
	end

	return 
end
function GenericDialog:update(t, dt)
	if self._fade_in_time then
		slot7 = 1
		local alpha = math.clamp(slot4, (t - self._fade_in_time) / self.FADE_IN_DURATION, 0)
		slot7 = alpha

		self._panel_script.set_fade((t - self._fade_in_time) / self.FADE_IN_DURATION, self._panel_script)

		if alpha == 1 then
			slot7 = true

			self.set_input_enabled(slot5, self)

			self._fade_in_time = nil
		end
	end

	if self._fade_out_time then
		slot7 = 1
		local alpha = math.clamp(slot4, 1 - (t - self._fade_out_time) / self.FADE_OUT_DURATION, 0)
		slot7 = alpha

		self._panel_script.set_fade(1 - (t - self._fade_out_time) / self.FADE_OUT_DURATION, self._panel_script)

		if alpha == 0 then
			self._fade_out_time = nil
			slot6 = self

			self.close(slot5)
		end
	end

	if self._input_enabled then
		slot7 = dt

		self.update_input(slot4, self, t)
	end

	if self._counter then
		self._counter_time = self._counter_time - dt

		if self._counter_time < 0 then
			self._counter_time = self._counter_time + self._counter[1]

			self._counter[2]()
		end
	end

	return 
end
function GenericDialog:update_input(t, dt)
	if self._data.no_buttons then
		return 
	end

	local dir, move_time = nil
	slot8 = "menu_move"
	local move = self._controller.get_input_axis(slot6, self._controller)
	slot9 = "menu_right"

	if self._controller.get_input_bool(self._controller, self._controller) or self.MOVE_AXIS_LIMIT < move.x then
		dir = 1
	else
		slot9 = "menu_left"

		if self._controller.get_input_bool(slot7, self._controller) or move.x < -self.MOVE_AXIS_LIMIT then
			dir = -1
		end
	end

	if dir then
		if self._move_button_dir == dir and self._move_button_time and t < self._move_button_time + self.MOVE_AXIS_DELAY then
			move_time = self._move_button_time or t
		else
			slot9 = dir

			self._panel_script.change_focus_button(slot7, self._panel_script)

			move_time = t
		end
	end

	self._move_button_dir = dir
	self._move_button_time = move_time

	return 
end
function GenericDialog:set_controller(controller)
	self._controller = controller

	return 
end
function GenericDialog:controller_hotswap_triggered()
	slot5 = self._confirm_func

	self._controller.add_trigger(slot2, self._controller, "confirm")

	slot3 = managers.controller
	local is_pc_controller = not managers.controller.is_xbox_controller_present(slot2)

	if is_pc_controller then
		slot6 = self._cancel_func

		self._controller.add_trigger(slot3, self._controller, "toggle_menu")

		self._mouse_id = managers.mouse_pointer.get_id(slot3)
		self._removed_mouse = nil
		local data = {}
		slot7 = "mouse_moved"
		data.mouse_move = callback(managers.mouse_pointer, self, self)
		slot7 = "mouse_pressed"
		data.mouse_press = callback(managers.mouse_pointer, self, self)
		slot7 = "mouse_released"
		data.mouse_release = callback(managers.mouse_pointer, self, self)
		data.id = self._mouse_id
		slot6 = data

		managers.mouse_pointer.use_mouse(managers.mouse_pointer, managers.mouse_pointer)
	else
		slot5 = self._mouse_id

		managers.mouse_pointer.remove_mouse(slot3, managers.mouse_pointer)

		self._removed_mouse = true
		self._mouse_id = nil
		slot6 = self._cancel_func

		self._controller.add_trigger(slot3, self._controller, "cancel")

		slot4 = managers.mouse_pointer

		managers.mouse_pointer.disable(slot3)
	end

	return 
end
function GenericDialog:set_input_enabled(enabled)
	if not self._input_enabled ~= not enabled then
		if enabled then
			slot6 = self._confirm_func

			self._controller.add_trigger(slot3, self._controller, "confirm")

			slot4 = managers.controller
		else

			-- Decompilation error in this vicinity:
			slot4 = self._panel_script

			self._panel_script.release_scroll_bar(slot3)

			slot6 = self._confirm_func

			self._controller.remove_trigger(slot3, self._controller, "confirm")

			slot4 = managers.controller
			slot4 = self

			self.remove_mouse(slot3)
		end

		self._input_enabled = enabled
		slot5 = enabled

		managers.controller.set_menu_mode_enabled(slot3, managers.controller)
	end

	return 
end
function GenericDialog:fade_in()
	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._fade_in_time = TimerManager.main(slot2).time(slot2)

	return 
end
function GenericDialog:fade_out_close()
	slot4 = "prompt_exit"

	managers.menu.post_event(slot2, managers.menu)

	slot3 = self

	self.fade_out(slot2)

	return 
end
function GenericDialog:fade_out()
	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._fade_out_time = TimerManager.main(slot2).time(slot2)
	slot3 = managers.menu

	if managers.menu.active_menu(slot2) then
		slot3 = managers.menu
		slot4 = 0.2

		managers.menu.active_menu(slot2).renderer.disable_input(slot2, managers.menu.active_menu(slot2).renderer)
	end

	slot4 = false

	self.set_input_enabled(slot2, self)

	return 
end
function GenericDialog:is_closing()
	return self._fade_out_time ~= nil
end
function GenericDialog:show()
	slot4 = "prompt_enter"

	managers.menu.post_event(slot2, managers.menu)

	slot4 = self

	self._manager.event_dialog_shown(slot2, self._manager)

	return true
end
function GenericDialog:hide()
	slot4 = false

	self.set_input_enabled(slot2, self)

	self._fade_in_time = nil
	slot4 = 0

	self._panel_script.set_fade(slot2, self._panel_script)

	slot4 = self

	self._manager.event_dialog_hidden(slot2, self._manager)

	return 
end
function GenericDialog:_close_generic()
	slot4 = false

	self.set_input_enabled(slot2, self)

	slot3 = self._panel_script

	self._panel_script.close(slot2)

	slot4 = self._resolution_changed_callback

	managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)

	return 
end
function GenericDialog:close()
	slot3 = self

	self._close_generic(slot2)

	slot3 = self

	Dialog.close(slot2)

	return 
end
function GenericDialog:force_close()
	slot3 = self

	self._close_generic(slot2)

	slot3 = self

	Dialog.force_close(slot2)

	return 
end
function GenericDialog:dialog_cancel_callback()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) ~= Idstring(SystemInfo) then
		return 
	end

	if self._data.no_buttons then
		return 
	end

	if #self._data.button_list == 1 then
		slot3 = self

		self.remove_mouse(slot2)

		slot4 = 1

		self.button_pressed(slot2, self)
	end

	slot3 = self._data.button_list

	for i, btn in ipairs(slot2) do
		if btn.cancel_button then
			slot8 = self

			self.remove_mouse(slot7)

			slot9 = i

			self.button_pressed(slot7, self)

			return 
		end
	end

	return 
end
function GenericDialog:button_pressed_callback()
	if self._data.no_buttons then
		return 
	end

	slot3 = self

	self.remove_mouse(slot2)

	slot6 = self._panel_script
	slot4 = self._panel_script.get_focus_button(slot5) or self._default_button

	self.button_pressed(slot2, self)

	return 
end
function GenericDialog:button_pressed(button_index)
	slot8 = button_index
	slot5 = "[SystemMenuManager] Button index pressed: " .. tostring(slot7)

	cat_print(slot3, "dialog_manager")

	local button_list = self._data.button_list
	slot5 = self

	self.fade_out_close("dialog_manager")

	slot5 = self._panel_script
	local callback_data = self._panel_script.get_callback_data("dialog_manager")

	if button_list then
		local button = button_list[button_index]

		if button and button.callback_func then
			slot9 = callback_data

			button.callback_func(slot6, button_index, button)
		end
	end

	local callback_func = self._data.callback_func

	if callback_func then
		slot8 = self._data

		callback_func(slot6, button_index)
	end

	return 
end
function GenericDialog:remove_mouse()
	if not self._removed_mouse then

		-- Decompilation error in this vicinity:
		self._removed_mouse = true
		slot3 = managers.controller
		self._mouse_id = nil
	end

	return 
end
function GenericDialog:resolution_changed_callback()
	return 
end

return 
