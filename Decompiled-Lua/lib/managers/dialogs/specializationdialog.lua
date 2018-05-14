-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/GenericDialog"

require(slot1)

if not SpecializationDialog then
	slot2 = GenericDialog
	slot0 = class(slot1)
end

SpecializationDialog = slot0
function SpecializationDialog:init(manager, data, is_title_outside)
	slot8 = data

	Dialog.init(slot5, self, manager)

	if not self._data.focus_button then
		if 0 < #self._button_text_list then
			self._data.focus_button = #self._button_text_list
		else
			self._data.focus_button = 1
		end
	end

	if not self._data.ws then
		slot6 = manager
		slot4 = manager._get_ws(slot5)
	end

	self._ws = slot4
	local text_config = {
		no_close_legend = true,
		no_scroll_legend = true,
		title_font = data.title_font,
		title_font_size = data.title_font_size,
		font = data.font,
		font_size = data.font_size,
		w = data.w or 420,
		h = data.h or 400,
		is_title_outside = is_title_outside,
		use_text_formating = data.use_text_formating,
		text_formating_color = data.text_formating_color,
		text_formating_color_table = data.text_formating_color_table,
		text_blend_mode = data.text_blend_mode
	}
	slot12 = text_config
	self._panel_script = _G.SpecializationBoxGui.new(slot6, _G.SpecializationBoxGui, self._ws, self._data.title or "", self._data.text or "", self._data)
	slot7 = self._panel_script

	self._panel_script.add_background(slot6)

	slot8 = _G.tweak_data.gui.DIALOG_LAYER

	self._panel_script.set_layer(slot6, self._panel_script)

	slot7 = self._panel_script

	self._panel_script.set_centered(slot6)

	slot8 = 0

	self._panel_script.set_fade(slot6, self._panel_script)

	if not self._data.controller then
		slot7 = manager
		slot5 = manager._get_controller(slot6)
	end

	self._controller = slot5
	slot9 = "button_pressed_callback"
	self._confirm_func = callback(slot6, self, self)
	slot9 = "dialog_cancel_callback"
	self._cancel_func = callback(slot6, self, self)
	slot9 = "resolution_changed_callback"
	self._resolution_changed_callback = callback(slot6, self, self)
	slot8 = self._resolution_changed_callback

	managers.viewport.add_resolution_changed_func(slot6, managers.viewport)

	if data.counter then
		self._counter = data.counter
		self._counter_time = self._counter[1]
	end

	self._sound_event = data.sound_event

	return 
end
function SpecializationDialog:fade_in()
	slot3 = self

	SpecializationDialog.super.fade_in(slot2)

	if self._sound_event then
		slot3 = TimerManager
		slot3 = TimerManager.main(slot2)
		slot1 = TimerManager.main(slot2).time(slot2) + 0.2
	end

	self._start_sound_t = slot1

	return 
end
function SpecializationDialog:update(t, dt)
	slot7 = dt

	SpecializationDialog.super.update(slot4, self, t)

	if self._start_sound_t and self._start_sound_t < t then
		slot6 = self._sound_event

		managers.menu_component.post_event(slot4, managers.menu_component)

		self._start_sound_t = nil
	end

	return 
end
function SpecializationDialog:fade_out_close()
	slot3 = self._panel_script
	self._conversion_ended = self._panel_script.chk_close(slot2)

	if self._conversion_ended then
		slot3 = self

		self.fade_out(slot2)
	end

	slot4 = "prompt_exit"

	managers.menu.post_event(slot2, managers.menu)

	return 
end
function SpecializationDialog:remove_mouse()
	if not self._conversion_ended then
		return 
	end

	if not self._removed_mouse then

		-- Decompilation error in this vicinity:
		self._removed_mouse = true
		slot3 = managers.controller
		self._mouse_id = nil
	end

	return 
end

return 
