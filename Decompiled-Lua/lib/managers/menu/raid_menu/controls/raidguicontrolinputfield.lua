if not RaidGUIControlInputField then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlInputField = slot0
RaidGUIControlInputField.CORNER_WIDTH = 10
RaidGUIControlInputField.VERTICAL_PADDING = 20
RaidGUIControlInputField.ICON_LEFT = "if_left_base"
RaidGUIControlInputField.ICON_CENTER = "if_center_base"
RaidGUIControlInputField.ICON_RIGHT = "if_right_base"
RaidGUIControlInputField.ICON_ACTIVE_LEFT = "kb_left_base"
RaidGUIControlInputField.ICON_ACTIVE_CENTER = "kb_center_base"
RaidGUIControlInputField.ICON_ACTIVE_RIGHT = "kb_right_base"
RaidGUIControlInputField.INACTIVE_ALPHA = 0.3
RaidGUIControlInputField.ACTIVE_ALPHA = 0.5
RaidGUIControlInputField.CARET_Y = 11
RaidGUIControlInputField.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlInputField.super.init(slot4, self, parent)

	self._ws = params.ws
	local panel_params = {
		is_root_panel = true,
		name = "input_field_panel_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h
	}
	slot8 = panel_params
	self._panel = RaidGUIPanel.new(self._name, RaidGUIPanel, parent)
	self._object = self._panel
	local background_params = {
		name = "background_bar",
		y = 0,
		x = 0,
		w = self._params.w,
		h = self._params.h,
		left = RaidGUIControlInputField.ICON_LEFT,
		center = RaidGUIControlInputField.ICON_CENTER,
		right = RaidGUIControlInputField.ICON_RIGHT
	}
	slot8 = RaidGUIControlInputField.INACTIVE_ALPHA
	background_params.color = Color.white.with_alpha(RaidGUIPanel, Color.white)
	slot8 = background_params
	self._background = self._object.three_cut_bitmap(RaidGUIPanel, self._object)
	self._output_width = 256
	self._panel_width = 256
	slot8 = {
		y = 0,
		x = 0,
		name = "test_rect_input_field_" .. self._name,
		w = params.w,
		h = params.h,
		color = Color.red.with_alpha(self._name, Color.red)
	}
	slot12 = 0
	self._character_name_frame = self._object.rect(RaidGUIPanel, self._object)
	self._lines = {}
	slot9 = "esc_key_callback"
	self._esc_callback = callback(RaidGUIPanel, self, self)
	slot9 = "enter_key_callback"
	self._enter_callback = callback(RaidGUIPanel, self, self)
	self._typing_callback = 0
	self._on_text_changed_callback = params.text_changed_callback
	self._skip_first = false
	slot8 = {
		alpha = 0,
		name = "input_panel",
		y = 0,
		x = 0,
		layer = 10,
		w = self._params.w,
		h = self._params.h
	}
	self._input_panel = self._panel.panel(RaidGUIPanel, self._panel)
	local text_value = ""

	if params and params.text then
		text_value = params.text
	end

	slot9 = {
		name = "input_text",
		halign = "left",
		wrap = true,
		align = "left",
		hvertical = "center",
		vertical = "center",
		y = 0,
		word_wrap = false,
		x = 30,
		w = self._params.w - 60,
		text = text_value,
		font = params.font or tweak_data.gui.fonts.din_compressed,
		font_size = params.font_size or tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_white,
		selection_color = Color.white,
		layer = self._character_name_frame.layer(slot11) + 10
	}
	slot12 = self._character_name_frame
	self._input_text = self._input_panel.text(slot7, self._input_panel)
	slot9 = {
		vertical = "center",
		name = "caret",
		w = 0,
		x = 0,
		y = RaidGUIControlInputField.CARET_Y,
		h = self._input_text.h(slot11),
		color = Color(slot11, 0.05, 1, 0.5),
		layer = self._character_name_frame.layer(slot11) + 10
	}
	slot12 = self._input_text
	slot15 = 1
	slot12 = self._character_name_frame
	local caret = self._input_panel.rect(slot7, self._input_panel)
	slot10 = 0
	slot15 = self._input_text

	self._input_text.set_selection(self._input_panel, self._input_text, utf8.len(self._input_text.text(0.5)))

	return 
end
RaidGUIControlInputField.get_text = function (self)
	slot3 = self._input_text

	return self._input_text.text(slot2)
end
RaidGUIControlInputField.mouse_released = function (self, o, button, x, y)
	slot8 = button

	self.on_mouse_released(slot6, self)

	return 
end
RaidGUIControlInputField.on_mouse_released = function (self, button)
	slot4 = self

	self.on_click_rect(slot3)

	return 
end
RaidGUIControlInputField.highlight_on = function (self)
	slot4 = "active"

	self._set_background_state(slot2, self)

	return 
end
RaidGUIControlInputField.highlight_off = function (self)
	if not self._focus then
		slot4 = "normal"

		self._set_background_state(slot2, self)
	end

	return 
end
RaidGUIControlInputField._set_background_state = function (self, bg_state)
	if bg_state == "active" then
		slot4 = self._background
		slot8 = RaidGUIControlInputField.ACTIVE_ALPHA

		self._background.set_color(slot3, Color.white.with_alpha(slot6, Color.white))

		slot5 = tweak_data.gui.colors.raid_white

		self._input_text.set_color(slot3, self._input_text)
	else
		slot4 = self._background
		slot8 = RaidGUIControlInputField.INACTIVE_ALPHA

		self._background.set_color(slot3, Color.white.with_alpha(slot6, Color.white))

		slot5 = tweak_data.gui.colors.raid_black

		self._input_text.set_color(slot3, self._input_text)
	end

	return 
end
RaidGUIControlInputField.on_click_rect = function (self)
	slot3 = self

	self.input_focus(slot2)

	slot3 = self

	self._on_focus(slot2)

	return 
end
RaidGUIControlInputField.set_chat_focus = function (self, focus)
	if focus then
		slot4 = self

		self._on_focus(slot3)
	else
		slot4 = self

		self._loose_focus(slot3)
	end

	return 
end
RaidGUIControlInputField.set_layer = function (self, layer)
	slot5 = layer

	self._panel.set_layer(slot3, self._panel)

	return 
end
RaidGUIControlInputField.set_channel_id = function (self, channel_id)
	return 
end
RaidGUIControlInputField.esc_key_callback = function (self)
	slot4 = false

	self.set_chat_focus(slot2, self)

	return 
end
RaidGUIControlInputField.enter_key_callback = function (self)
	slot4 = "input_text"
	local text = self._input_panel.child(slot2, self._input_panel)
	slot4 = text
	local message = text.text(self._input_panel)

	return true
end
RaidGUIControlInputField.input_focus = function (self)
	return self._focus
end
RaidGUIControlInputField.set_skip_first = function (self, skip_first)
	self._skip_first = skip_first

	return 
end
RaidGUIControlInputField._on_focus = function (self)
	if self._focus then
		return 
	end

	slot3 = self._input_panel

	self._input_panel.stop(slot2)

	slot3 = self._input_panel
	slot8 = "_animate_show_component"

	self._input_panel.animate(slot2, callback(slot5, self, self))

	self._focus = true
	slot3 = self._ws
	slot6 = Input

	self._ws.connect_keyboard(slot2, Input.keyboard(slot5))

	slot3 = self._input_panel
	slot8 = "key_press"

	self._input_panel.key_press(slot2, callback(slot5, self, self))

	slot3 = self._input_panel
	slot8 = "key_release"

	self._input_panel.key_release(slot2, callback(slot5, self, self))

	self._enter_text_set = false
	slot3 = self

	self.update_caret(slot2)

	return 
end
RaidGUIControlInputField._loose_focus = function (self)
	if not self._focus then
		return 
	end

	self._focus = false
	slot3 = self._ws

	self._ws.disconnect_keyboard(slot2)

	slot4 = nil

	self._input_panel.key_press(slot2, self._input_panel)

	slot4 = nil

	self._input_panel.enter_text(slot2, self._input_panel)

	slot4 = nil

	self._input_panel.key_release(slot2, self._input_panel)

	slot3 = self._input_panel

	self._input_panel.stop(slot2)

	slot4 = "input_text"
	local text = self._input_panel.child(slot2, self._input_panel)
	slot4 = text

	text.stop(self._input_panel)

	slot4 = self

	self.highlight_off(self._input_panel)

	slot4 = self

	self.update_caret(self._input_panel)

	return 
end
RaidGUIControlInputField.clear = function (self)
	slot4 = "input_text"
	local text = self._input_panel.child(slot2, self._input_panel)
	slot5 = ""

	text.set_text(self._input_panel, text)

	slot6 = 0

	text.set_selection(self._input_panel, text, 0)

	slot4 = self

	self._loose_focus(self._input_panel)

	slot5 = false

	self.set_chat_focus(self._input_panel, self)

	return 
end
RaidGUIControlInputField._shift = function (self)
	local k = Input.keyboard(slot2)
	slot5 = "left shift"

	if not k.down(Input, k) then
		slot5 = "right shift"

		if not k.down(slot3, k) then
			slot5 = "shift"

			if k.has_button(slot3, k) then
				slot5 = "shift"
				slot2 = k.down(slot3, k)
			end
		end
	end

	return slot2
end
RaidGUIControlInputField.blink = function (o)
	while true do
		slot3 = o
		slot9 = 1

		o.set_color(slot2, Color(slot5, 0, 1, 1))

		slot3 = 0.3

		wait(slot2)

		slot4 = Color.white

		o.set_color(slot2, o)

		slot3 = 0.3

		wait(slot2)
	end

	return 
end
RaidGUIControlInputField.set_blinking = function (self, b)
	slot5 = "caret"
	local caret = self._input_panel.child(slot3, self._input_panel)

	if b == self._blinking then
		return 
	end

	if b then
		slot6 = self.blink

		caret.animate(slot4, caret)
	else
		slot5 = caret

		caret.stop(slot4)
	end

	self._blinking = b

	if not self._blinking then
		slot5 = caret
		slot9 = 0.3

		caret.set_color(slot4, tweak_data.gui.colors.raid_red.with_alpha(slot7, tweak_data.gui.colors.raid_red))
	end

	return 
end
RaidGUIControlInputField.update_caret = function (self)
	slot4 = "input_text"
	local text = self._input_panel.child(slot2, self._input_panel)
	slot5 = "caret"
	local caret = self._input_panel.child(self._input_panel, self._input_panel)
	slot5 = text
	local s, e = text.selection(self._input_panel)
	slot7 = text
	local x, y, w, h = text.selection_rect(slot6)

	if s == 0 and e == 0 then
		slot11 = text

		if text.align(slot10) == "center" then
			slot12 = text
			x = text.world_x(slot10) + text.w(text) / 2
		else
			slot11 = text
			x = text.world_x(slot10)
		end

		slot11 = text
		y = text.world_y(slot10)
	end

	slot11 = text
	h = text.h(slot10)

	if w < 3 then
		w = 3
	end

	if not self._focus then
		w = 0
		h = 0
	end

	y = RaidGUIControlInputField.CARET_Y
	slot15 = tweak_data.gui.font_sizes.small

	caret.set_world_shape(slot10, caret, x, y, w)

	slot12 = y

	caret.set_y(slot10, caret)

	slot12 = s == e and self._focus

	self.set_blinking(slot10, self)

	if self._on_text_changed_callback then
		self._on_text_changed_callback()
	end

	return 
end
RaidGUIControlInputField.enter_text = function (self, o, s)
	slot5 = s
	s = utf8.to_upper(slot4)

	if self._skip_first then
		self._skip_first = false

		return 
	end

	slot6 = "input_text"
	local text = self._input_panel.child(slot4, self._input_panel)
	slot6 = self._typing_callback

	if type(self._input_panel) ~= "number" then
		self._typing_callback()
	end

	slot7 = s

	text.replace_text(slot5, text)

	slot6 = text
	local lbs = text.line_breaks(slot5)

	if 1 < #lbs then
		local s = lbs[2]
		slot10 = text
		local e = utf8.len(text.text(slot9))
		slot11 = e

		text.set_selection(text.text, text, s)

		slot10 = ""

		text.replace_text(text.text, text)
	end

	slot7 = self

	self.update_caret(slot6)

	return 
end
RaidGUIControlInputField.update_key_down = function (self, o, k)
	slot5 = 0.6

	wait(slot4)

	slot6 = "input_text"
	local text = self._input_panel.child(slot4, self._input_panel)

	while self._key_pressed == k do
		slot6 = text
		local s, e = text.selection(slot5)
		local n = utf8.len(text.text(slot9))
		slot9 = e - s
		local d = math.abs(text.text)
		slot11 = "backspace"

		if self._key_pressed == Idstring(text) then
			if s == e and 0 < s then
				slot12 = e

				text.set_selection(slot9, text, s - 1)
			end

			text.replace_text(slot9, text)

			slot12 = text

			if utf8.len(text.text("")) < 1 then
				slot10 = self._esc_callback

				if type(slot9) ~= "number" then
				end
			end
		else
			slot11 = "delete"

			if self._key_pressed == Idstring(slot10) then
				if s == e and s < n then
					slot12 = e + 1

					text.set_selection(slot9, text, s)
				end

				text.replace_text(slot9, text)

				slot12 = text

				if utf8.len(text.text("")) < 1 then
					slot10 = self._esc_callback

					if type(slot9) ~= "number" then
					end
				end
			else
				slot11 = "left"

				if self._key_pressed == Idstring(slot10) then
					if s < e then
						slot12 = s

						text.set_selection(slot9, text, s)
					elseif 0 < s then
						slot12 = s - 1

						text.set_selection(slot9, text, s - 1)
					end
				else
					slot11 = "right"

					if self._key_pressed == Idstring(slot10) then
						if s < e then
							slot12 = e

							text.set_selection(slot9, text, e)
						elseif s < n then
							slot12 = s + 1

							text.set_selection(slot9, text, s + 1)
						end
					else
						self._key_pressed = false
					end
				end
			end
		end

		slot10 = self

		self.update_caret(slot9)

		slot10 = 0.03

		wait(slot9)
	end

	return 
end
RaidGUIControlInputField.key_release = function (self, o, k)
	if self._key_pressed == k then
		self._key_pressed = false
	end

	return 
end
RaidGUIControlInputField.key_press = function (self, o, k)
	if self._skip_first then
		self._skip_first = false

		return 
	end

	if not self._enter_text_set then
		slot5 = self._input_panel
		slot10 = "enter_text"

		self._input_panel.enter_text(slot4, callback(slot7, self, self))

		self._enter_text_set = true
	end

	slot6 = "input_text"
	local text = self._input_panel.child(slot4, self._input_panel)
	slot6 = text
	local s, e = text.selection(self._input_panel)
	slot10 = text
	local n = utf8.len(text.text(slot9))
	local d = math.abs(text.text)
	self._key_pressed = k
	slot10 = text

	text.stop(e - s)

	slot15 = "update_key_down"
	slot12 = k

	text.animate(e - s, text, callback(slot12, self, self))

	slot10 = "backspace"

	if k == Idstring(e - s) then
		if s == e and 0 < s then
			slot12 = e

			text.set_selection(slot9, text, s - 1)
		end

		text.replace_text(slot9, text)

		slot12 = text

		if utf8.len(text.text("")) < 1 then
			slot10 = self._esc_callback

			if type(slot9) ~= "number" then
			end
		end
	else
		slot10 = "delete"

		if k == Idstring(slot9) then
			if s == e and s < n then
				slot12 = e + 1

				text.set_selection(slot9, text, s)
			end

			text.replace_text(slot9, text)

			slot12 = text

			if utf8.len(text.text("")) < 1 then
				slot10 = self._esc_callback

				if type(slot9) ~= "number" then
				end
			end
		else
			slot10 = "left"

			if k == Idstring(slot9) then
				if s < e then
					slot12 = s

					text.set_selection(slot9, text, s)
				elseif 0 < s then
					slot12 = s - 1

					text.set_selection(slot9, text, s - 1)
				end
			else
				slot10 = "right"

				if k == Idstring(slot9) then
					if s < e then
						slot12 = e

						text.set_selection(slot9, text, e)
					elseif s < n then
						slot12 = s + 1

						text.set_selection(slot9, text, s + 1)
					end
				else
					slot11 = "end"

					if self._key_pressed == Idstring(slot10) then
						slot12 = n

						text.set_selection(slot9, text, n)
					else
						slot11 = "home"

						if self._key_pressed == Idstring(slot10) then
							slot12 = 0

							text.set_selection(slot9, text, 0)
						else
							slot10 = "enter"

							if k == Idstring(slot9) then
								slot10 = self._enter_callback

								if type(slot9) ~= "number" then
									self._enter_callback()
								end
							else
								slot10 = "esc"

								if k == Idstring(slot9) then
									slot10 = self._esc_callback

									if type(slot9) ~= "number" then
										slot11 = ""

										text.set_text(slot9, text)

										slot12 = 0

										text.set_selection(slot9, text, 0)
										self._esc_callback()
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot10 = self

	self.update_caret(slot9)

	return true
end
RaidGUIControlInputField._animate_fade_output = function (self)
	local wait_t = 10
	local fade_t = 1
	local t = 0

	while t < wait_t do
		local dt = coroutine.yield()
		t = t + dt
	end

	local t = 0

	while t < fade_t do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = 1 - t / fade_t

		self.set_output_alpha(slot7, self)
	end

	slot8 = 0

	self.set_output_alpha(slot6, self)

	return 
end
RaidGUIControlInputField._animate_show_component = function (self, input_panel, start_alpha)
	local TOTAL_T = 0.25
	local t = 0
	start_alpha = start_alpha or 0

	while t < TOTAL_T do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = start_alpha + t / TOTAL_T * (1 - start_alpha)

		input_panel.set_alpha(slot7, input_panel)
	end

	slot8 = 1

	input_panel.set_alpha(slot6, input_panel)

	return 
end
RaidGUIControlInputField._animate_hide_input = function (self, input_panel)
	local TOTAL_T = 0.25
	local t = 0

	while t < TOTAL_T do
		local dt = coroutine.yield()
		t = t + dt
		slot8 = 1 - t / TOTAL_T

		input_panel.set_alpha(slot6, input_panel)
	end

	slot7 = 0

	input_panel.set_alpha(slot5, input_panel)

	return 
end
RaidGUIControlInputField.set_output_alpha = function (self, alpha)
	return 
end
RaidGUIControlInputField.remove = function (self)
	slot3 = self._input_panel

	self._input_panel.stop(slot2)

	slot4 = self._panel

	self._hud_panel.remove(slot2, self._hud_panel)

	slot5 = self

	managers.chat.unregister_receiver(slot2, managers.chat, self._channel_id)

	return 
end
RaidGUIControlInputField.confirm_pressed = function (self)
	return true
end

return 
