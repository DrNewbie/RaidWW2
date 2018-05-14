slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/GenericDialog"

require(slot1)

if not NewUnlockDialog then
	slot2 = GenericDialog
	slot0 = class(slot1)
end

NewUnlockDialog = slot0
function NewUnlockDialog:init(manager, data, is_title_outside)
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
	local image_config = {
		layer = 2,
		keep_ratio = true,
		padding = 10,
		w = data.image_w or 128,
		h = data.image_h or 128,
		textures = data.textures,
		texture = data.texture,
		render_template = data.render_template,
		shapes = data.shapes,
		halign = data.image_halign,
		valign = data.image_valign,
		video = data.video,
		blend_mode = data.image_blend_mode,
		video_loop = data.video_loop
	}

	if not data.texture and not data.video and not data.shapes and not data.textures then
		image_config.w = 0
		image_config.h = 0
	end

	slot14 = image_config
	self._panel_script = _G.ImageBoxGui.new(slot7, _G.ImageBoxGui, self._ws, self._data.title or "", self._data.text or "", self._data, text_config)
	slot8 = self._panel_script

	self._panel_script.add_background(slot7)

	slot9 = _G.tweak_data.gui.DIALOG_LAYER

	self._panel_script.set_layer(slot7, self._panel_script)

	slot8 = self._panel_script

	self._panel_script.set_centered(slot7)

	slot9 = 0

	self._panel_script.set_fade(slot7, self._panel_script)

	if not self._data.controller then
		slot8 = manager
		slot6 = manager._get_controller(slot7)
	end

	self._controller = slot6
	slot10 = "button_pressed_callback"
	self._confirm_func = callback(slot7, self, self)
	slot10 = "dialog_cancel_callback"
	self._cancel_func = callback(slot7, self, self)
	slot10 = "resolution_changed_callback"
	self._resolution_changed_callback = callback(slot7, self, self)
	slot9 = self._resolution_changed_callback

	managers.viewport.add_resolution_changed_func(slot7, managers.viewport)

	if data.counter then
		self._counter = data.counter
		self._counter_time = self._counter[1]
	end

	self._sound_event = data.sound_event

	return 
end
function NewUnlockDialog:fade_in()
	slot3 = self

	NewUnlockDialog.super.fade_in(slot2)

	if self._sound_event then
		slot3 = TimerManager
		slot3 = TimerManager.main(slot2)
		slot1 = TimerManager.main(slot2).time(slot2) + 0.2
	end

	self._start_sound_t = slot1

	return 
end
function NewUnlockDialog:update(t, dt)
	slot7 = dt

	NewUnlockDialog.super.update(slot4, self, t)

	if self._start_sound_t and self._start_sound_t < t then
		slot6 = self._sound_event

		managers.menu_component.post_event(slot4, managers.menu_component)

		self._start_sound_t = nil
	end

	return 
end

return 
