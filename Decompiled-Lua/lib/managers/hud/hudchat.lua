-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDChat = HUDChat or class()
HUDChat.W = 384
HUDChat.H = 432
HUDChat.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDChat.BORDER_H = 2
HUDChat.BORDER_COLOR = tweak_data.gui.colors.chat_border
HUDChat.NAME_FONT = tweak_data.gui.fonts.din_compressed
HUDChat.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDChat.MESSAGE_FONT = tweak_data.gui.fonts.lato_outlined_18
HUDChat.MESSAGE_FONT_SIZE = tweak_data.gui.font_sizes.size_18
HUDChat.PLAYER_MESSAGE_COLOR = tweak_data.gui.colors.chat_player_message
HUDChat.PEER_MESSAGE_COLOR = tweak_data.gui.colors.chat_peer_message
HUDChat.CHAT_BOX_PADDING = 32
HUDChat.INPUT_PANEL_H = 96
HUDChat.INPUT_TEXT_PANEL_H = 48
HUDChat.INPUT_TEXT_BACKGROUND = "chat_input_rounded_rect"
HUDChat.INPUT_TEXT_X = 12
HUDChat.INPUT_TEXT_PADDING_RIGHT = 6
HUDChat.CARET_W = 2
HUDChat.CARET_H = 18
HUDChat.MESSAGES_KEPT = 10
HUDChat.MESSAGE_PADDING_DOWN = 15
HUDChat.MESSAGE_MAX_SIZE = 100
HUDChat.line_height = 21
HUDChat.init = function (self, ws, panel, background)
	self._messages = {}
	self._recieved_messages = {}
	self._skip_first = false
	slot6 = self

	self._setup_callbacks(slot5)

	slot7 = panel

	self._create_panel(slot5, self)

	if background then
		slot6 = self

		self._create_background(slot5)
	end

	slot6 = self

	self._create_input(slot5)

	slot6 = self

	self._create_message_panel(slot5)

	self._ws = ws
	self._hud_panel = panel
	self._channel_id = ChatManager.GAME
	slot6 = self

	self.set_channel_id(slot5)

	return 
end
HUDChat._setup_callbacks = function (self)
	slot5 = "esc_key_callback"
	self._esc_callback = callback(slot2, self, self)
	slot5 = "enter_key_callback"
	self._enter_callback = callback(slot2, self, self)
	self._typing_callback = 0

	return 
end
HUDChat._create_panel = function (self, panel)
	local panel_params = {
		visible = false,
		name = "chat_panel",
		halign = "left",
		valign = "bottom",
		w = HUDChat.W,
		h = HUDChat.H
	}
	slot6 = panel_params
	self._object = panel.panel(slot4, panel)

	return 
end
HUDChat._create_background = function (self)
	local background_params = {
		name = "background",
		texture = tweak_data.gui.icons[HUDChat.BACKGROUND_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDChat.BACKGROUND_IMAGE].texture_rect
	}
	slot5 = background_params
	local background = self._object.bitmap(HUDChat.BACKGROUND_IMAGE, self._object)

	return 
end
HUDChat._create_input = function (self)
	local input_panel_params = {
		name = "input_panel",
		halign = "scale",
		valign = "bottom"
	}
	slot4 = self._object
	input_panel_params.w = self._object.w(slot3)
	input_panel_params.h = HUDChat.INPUT_PANEL_H
	slot5 = input_panel_params
	self._input_panel = self._object.panel(slot3, self._object)

	self._input_panel.set_bottom(slot3, self._object.h(slot6))

	local input_text_panel_params = {
		name = "input_text_panel",
		halign = "scale",
		valign = "bottom",
		x = HUDChat.CHAT_BOX_PADDING
	}
	slot5 = self._input_panel
	input_text_panel_params.w = self._input_panel.w(self._input_panel) - HUDChat.CHAT_BOX_PADDING * 2
	input_text_panel_params.h = HUDChat.INPUT_TEXT_PANEL_H
	slot6 = input_text_panel_params
	self._input_text_panel = self._input_panel.panel(HUDChat.CHAT_BOX_PADDING * 2, self._input_panel)
	slot8 = self._input_panel
	slot6 = self._input_panel.h(self._object) - HUDChat.CHAT_BOX_PADDING

	self._input_text_panel.set_bottom(HUDChat.CHAT_BOX_PADDING * 2, self._input_text_panel)

	local input_text_background_params = {
		name = "input_text_background",
		valign = "center",
		halign = "center",
		texture = tweak_data.gui.icons[HUDChat.INPUT_TEXT_BACKGROUND].texture,
		texture_rect = tweak_data.gui.icons[HUDChat.INPUT_TEXT_BACKGROUND].texture_rect
	}
	slot7 = input_text_background_params
	local background = self._input_text_panel.bitmap(HUDChat.INPUT_TEXT_BACKGROUND, self._input_text_panel)
	slot10 = self._input_text_panel
	slot8 = self._input_text_panel.w(slot9) / 2

	background.set_center_x(self._input_text_panel, background)

	slot10 = self._input_text_panel
	slot8 = self._input_text_panel.h(slot9) / 2

	background.set_center_y(self._input_text_panel, background)

	local input_text_params = {
		vertical = "center",
		name = "input_text",
		layer = 5,
		align = "left",
		text = "",
		halign = "scale",
		valign = "center",
		x = HUDChat.INPUT_TEXT_X
	}
	slot8 = self._input_text_panel
	input_text_params.w = self._input_text_panel.w(background) - HUDChat.INPUT_TEXT_X - HUDChat.INPUT_TEXT_PADDING_RIGHT
	input_text_params.font = HUDChat.MESSAGE_FONT
	input_text_params.font_size = HUDChat.MESSAGE_FONT_SIZE
	input_text_params.color = HUDChat.PLAYER_MESSAGE_COLOR
	slot9 = input_text_params
	self._input_text = self._input_text_panel.text(HUDChat.INPUT_TEXT_PADDING_RIGHT, self._input_text_panel)
	local caret_params = {
		name = "caret",
		layer = 10,
		x = HUDChat.INPUT_TEXT_X,
		w = HUDChat.CARET_W,
		h = HUDChat.CARET_H,
		color = HUDChat.PLAYER_MESSAGE_COLOR
	}
	slot10 = caret_params
	self._caret = self._input_text_panel.rect(self._input_text_panel, self._input_text_panel)
	slot12 = self._input_text_panel
	slot10 = self._input_text_panel.h(slot11) / 2

	self._caret.set_center_y(self._input_text_panel, self._caret)

	return 
end
HUDChat._create_message_panel = function (self)

	-- Decompilation error in this vicinity:
	slot4 = "background"
	local message_panel_params = {
		halign = "center",
		name = "message_panel",
		y = 0,
		valign = "scale",
		x = HUDChat.CHAT_BOX_PADDING
	}
	slot5 = self._object
	message_panel_params.w = self._object.w(slot4) - HUDChat.CHAT_BOX_PADDING * 2
	slot6 = self._input_panel
	message_panel_params.h = self._object.h(HUDChat.CHAT_BOX_PADDING * 2) - self._input_panel.h(self._object)
	message_panel_params.layer = message_panel_layer
	slot6 = message_panel_params
	self._message_panel = self._object.panel(self._input_panel.h(self._object), self._object)

	return 
end
HUDChat.set_layer = function (self, layer)
	slot5 = layer

	self._object.set_layer(slot3, self._object)

	return 
end
HUDChat.layer = function (self)
	slot3 = self._object

	return self._object.layer(slot2)
end
HUDChat.set_bottom = function (self, y)
	slot5 = y

	self._object.set_bottom(slot3, self._object)

	return 
end
HUDChat.channel_id = function (self)
	return self._channel_id
end
HUDChat.register = function (self)
	slot5 = self

	managers.chat.register_receiver(slot2, managers.chat, self._channel_id)

	return 
end
HUDChat.unregister = function (self)
	slot5 = self

	managers.chat.unregister_receiver(slot2, managers.chat, self._channel_id)

	return 
end
HUDChat.set_channel_id = function (self)
	slot3 = self

	self.unregister(slot2)

	self._channel_id = ChatManager.GAME
	slot3 = self

	self.register(slot2)

	return 
end
HUDChat.esc_key_callback = function (self)
	slot4 = false

	managers.hud.set_chat_focus(slot2, managers.hud)

	return 
end
HUDChat.enter_key_callback = function (self)
	local message = self._input_text.text(slot2)
	slot4 = message

	if 0 < string.len(self._input_text) then
		local u_name = managers.network.account.username(slot3)
		slot8 = message

		managers.chat.send_message(managers.network.account, managers.chat, self._channel_id, u_name or "Offline")
	end

	slot5 = ""

	self._input_text.set_text(slot3, self._input_text)

	slot6 = 0

	self._input_text.set_selection(slot3, self._input_text, 0)

	slot5 = false

	managers.hud.set_chat_focus(slot3, managers.hud)

	return 
end
HUDChat._create_input_panel = function (self)
	slot4 = {
		name = "input_panel",
		h = 24,
		alpha = 0,
		x = 0,
		layer = 1,
		w = self._panel_width
	}
	self._input_panel = self._panel.panel(slot2, self._panel)
	slot4 = {
		name = "focus_indicator",
		layer = 0,
		visible = false,
		color = Color.white.with_alpha(slot6, Color.white)
	}

	self._input_panel.rect(slot2, self._input_panel)

	slot4 = {
		y = 0,
		name = "say",
		vertical = "center",
		hvertical = "center",
		align = "left",
		blend_mode = "normal",
		halign = "left",
		x = 0,
		layer = 1,
		text = utf8.to_upper(managers.localization.text(0.2, managers.localization)),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = Color.white
	}
	slot10 = "menu_chat_say"
	local say = self._input_panel.text(slot2, self._input_panel)
	slot4 = say
	local _, _, w, h = say.text_rect(self._input_panel)
	slot9 = w

	say.set_size(managers.localization.text, say, self._input_panel.h(slot11))

	slot9 = {
		y = 0,
		name = "input_text",
		vertical = "center",
		wrap = true,
		align = "left",
		blend_mode = "normal",
		hvertical = "center",
		text = "",
		word_wrap = false,
		halign = "left",
		x = 0,
		layer = 1,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = Color.white
	}
	local input_text = self._input_panel.text(managers.localization.text, self._input_panel)
	slot10 = {
		name = "caret",
		h = 0,
		y = 0,
		w = 0,
		x = 0,
		layer = 2,
		color = Color(self._input_panel, 0.05, 1, 1)
	}
	slot16 = 1
	local caret = self._input_panel.rect(self._input_panel, self._input_panel)
	slot11 = {
		blend_mode = "sub",
		name = "input_bg",
		valign = "grow",
		layer = -1,
		gradient_points = {
			0,
			Color.white.with_alpha(1, Color.white),
			0.2,
			Color.white.with_alpha(1, Color.white),
			1,
			Color.white.with_alpha(1, Color.white)
		},
		h = self._input_panel.h(Color.white.with_alpha)
	}
	slot16 = 0
	slot16 = 0.25
	slot16 = 0
	slot14 = self._input_panel

	self._input_panel.gradient(self._input_panel, self._input_panel)

	return 
end
HUDChat._layout_output_panel = function (self)
	slot4 = "output_panel"
	local output_panel = self._panel.child(slot2, self._panel)
	slot5 = self._output_width

	output_panel.set_w(self._panel, output_panel)

	local line_height = HUDChat.line_height
	local lines = 0

	for i = #self._lines, 1, -1 do
		local line = self._lines[i][1]
		local icon = self._lines[i][2]
		slot16 = line
		slot13 = output_panel.w(slot14) - line.left(output_panel)

		line.set_w(slot11, line)

		slot12 = line
		local _, _, w, h = line.text_rect(slot11)
		slot17 = h

		line.set_h(output_panel, line)

		slot16 = line
		lines = lines + line.number_of_lines(output_panel)
	end

	slot10 = lines
	slot7 = line_height * math.min(slot8, 10)

	output_panel.set_h(slot5, output_panel)

	local y = 0

	for i = #self._lines, 1, -1 do
		local line = self._lines[i][1]
		local icon = self._lines[i][2]
		slot13 = line
		local _, _, w, h = line.text_rect(slot12)
		slot20 = output_panel
		slot18 = output_panel.h(slot19) - y

		line.set_bottom(slot16, line)

		if icon then
			slot20 = line
			slot18 = line.top(slot19) + 1

			icon.set_top(slot16, icon)
		end

		y = y + h
	end

	slot7 = output_panel
	slot10 = self._input_panel

	output_panel.set_bottom(slot6, self._input_panel.top(slot9))

	return 
end
HUDChat._layout_input_panel = function (self)
	slot4 = self._panel_width

	self._input_panel.set_w(slot2, self._input_panel)

	slot4 = "say"
	local say = self._input_panel.child(slot2, self._input_panel)
	slot5 = "input_text"
	local input_text = self._input_panel.child(self._input_panel, self._input_panel)
	slot8 = say
	slot6 = say.right(slot7) + 4

	input_text.set_left(self._input_panel, input_text)

	slot9 = input_text
	slot6 = self._input_panel.w(slot7) - input_text.left(self._input_panel)

	input_text.set_w(self._input_panel, input_text)

	slot6 = "focus_indicator"
	local focus_indicator = self._input_panel.child(self._input_panel, self._input_panel)
	slot6 = focus_indicator
	slot9 = input_text

	focus_indicator.set_shape(self._input_panel, input_text.shape(self._input_panel))

	slot9 = self._input_panel
	slot10 = self._input_panel
	slot7 = self._input_panel.parent(self._input_panel).h(self._input_panel) - self._input_panel.h(self._input_panel.parent(self._input_panel))

	self._input_panel.set_y(self._input_panel, self._input_panel)

	return 
end
HUDChat.input_focus = function (self)
	return self._focus
end
HUDChat.set_skip_first = function (self, skip_first)
	self._skip_first = skip_first

	return 
end
HUDChat.show = function (self)
	self._shown = true
	slot4 = true

	self._object.set_visible(slot2, self._object)

	slot4 = "hide_chat"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	return 
end
HUDChat.hide = function (self)
	self._shown = false
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
HUDChat.shown = function (self)
	return self._shown
end
HUDChat._on_focus = function (self)
	if self._focus then
		return 
	end

	slot3 = self

	self.show(slot2)

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
	slot4 = 1100

	self.set_layer(slot2, self)

	slot3 = self

	self._layout_message_panel(slot2)

	slot3 = self

	self.update_caret(slot2)

	return 
end
HUDChat._loose_focus = function (self)
	if not self._focus then
		return 
	end

	slot4 = "hide_chat"

	if not managers.queued_tasks.has_task(slot2, managers.queued_tasks) then
		slot9 = nil

		managers.queued_tasks.queue(slot2, managers.queued_tasks, "hide_chat", self.hide, self, nil, 4)
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

	slot3 = self

	self.update_caret(slot2)

	return 
end
HUDChat.clear = function (self)
	slot4 = ""

	self._input_text.set_text(slot2, self._input_text)

	slot5 = 0

	self._input_text.set_selection(slot2, self._input_text, 0)

	slot3 = self

	self._loose_focus(slot2)

	slot4 = false

	managers.hud.set_chat_focus(slot2, managers.hud)

	return 
end
HUDChat._shift = function (self)
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
HUDChat.blink = function (o)
	while true do
		slot3 = o
		slot9 = 1

		o.set_color(slot2, Color(slot5, 0, 1, 1))

		slot3 = 0.8

		wait(slot2)

		slot4 = HUDChat.PLAYER_MESSAGE_COLOR

		o.set_color(slot2, o)

		slot3 = 0.5

		wait(slot2)
	end

	return 
end
HUDChat.set_blinking = function (self, b)
	if b == self._blinking then
		return 
	end

	if b then
		slot5 = self.blink

		self._caret.animate(slot3, self._caret)
	else
		slot4 = self._caret

		self._caret.stop(slot3)
	end

	self._blinking = b

	if not self._blinking then
		slot5 = HUDChat.PLAYER_MESSAGE_COLOR

		self._caret.set_color(slot3, self._caret)
	end

	return 
end
HUDChat.update_caret = function (self)
	slot3 = self._input_text
	local s, e = self._input_text.selection(slot2)
	slot5 = self._input_text
	local x, y, w, h = self._input_text.selection_rect(slot4)

	if s == 0 and e == 0 then
		slot9 = self._input_text

		if self._input_text.align(slot8) == "center" then
			slot10 = self._input_text
			x = self._input_text.world_x(slot8) + self._input_text.w(self._input_text) / 2
		else
			slot9 = self._input_text
			x = self._input_text.world_x(slot8)
		end

		slot9 = self._input_text
		y = self._input_text.world_y(slot8)
	end

	slot9 = self._input_text
	h = self._input_text.h(slot8)

	if w < 3 then
		w = 3
	end

	if not self._focus then
		w = 0
		h = 0
	end

	if not y or y == 0 then
		slot9 = self._input_text_panel
		y = self._input_text_panel.h(slot8) / 2 - HUDChat.CARET_H / 2
	end

	slot13 = self._caret
	slot13 = HUDChat.CARET_H

	self._caret.set_world_shape(slot8, self._caret, x + 2, self._caret.world_y(slot12), HUDChat.CARET_W)

	slot10 = s == e and self._focus

	self.set_blinking(slot8, self)

	return 
end
HUDChat.enter_text = function (self, o, s)
	if managers.hud then
		slot5 = managers.hud

		if managers.hud.showing_stats_screen(slot4) then
			return 
		end
	end

	slot7 = self._input_text

	if HUDChat.MESSAGE_MAX_SIZE < utf8.len(self._input_text.text(s)) + utf8.len(self._input_text.text) then
		return 
	end

	if self._skip_first then
		self._skip_first = false

		return 
	end

	slot5 = self._typing_callback

	if type(slot4) ~= "number" then
		self._typing_callback()
	end

	slot6 = s

	self._input_text.replace_text(slot4, self._input_text)

	slot5 = self._input_text
	local lbs = self._input_text.line_breaks(slot4)

	if 1 < #lbs then
		local s = lbs[2]
		slot9 = self._input_text
		local e = utf8.len(self._input_text.text(slot8))
		slot10 = e

		self._input_text.set_selection(self._input_text.text, self._input_text, s)

		slot9 = ""

		self._input_text.replace_text(self._input_text.text, self._input_text)
	end

	slot6 = self

	self._layout_input_text(slot5)

	slot6 = self

	self.update_caret(slot5)

	return 
end
HUDChat.update_key_down = function (self, o, k)
	slot5 = 0.6

	wait(slot4)

	while self._key_pressed == k do
		slot5 = self._input_text
		local s, e = self._input_text.selection(slot4)
		local n = utf8.len(self._input_text.text(slot8))
		slot8 = e - s
		local d = math.abs(self._input_text.text)
		slot10 = "backspace"

		if self._key_pressed == Idstring(self._input_text) then
			if s == e and 0 < s then
				slot11 = e

				self._input_text.set_selection(slot8, self._input_text, s - 1)
			end

			self._input_text.replace_text(slot8, self._input_text)

			slot11 = self._input_text

			if utf8.len(self._input_text.text("")) < 1 then
				slot9 = self._esc_callback

				if type(slot8) ~= "number" then
				end
			end
		else
			slot10 = "delete"

			if self._key_pressed == Idstring(slot9) then
				if s == e and s < n then
					slot11 = e + 1

					self._input_text.set_selection(slot8, self._input_text, s)
				end

				self._input_text.replace_text(slot8, self._input_text)

				slot11 = self._input_text

				if utf8.len(self._input_text.text("")) < 1 then
					slot9 = self._esc_callback

					if type(slot8) ~= "number" then
					end
				end
			else
				slot10 = "left"

				if self._key_pressed == Idstring(slot9) then
					if s < e then
						slot11 = s

						self._input_text.set_selection(slot8, self._input_text, s)
					elseif 0 < s then
						slot11 = s - 1

						self._input_text.set_selection(slot8, self._input_text, s - 1)
					end
				else
					slot10 = "right"

					if self._key_pressed == Idstring(slot9) then
						if s < e then
							slot11 = e

							self._input_text.set_selection(slot8, self._input_text, e)
						elseif s < n then
							slot11 = s + 1

							self._input_text.set_selection(slot8, self._input_text, s + 1)
						end
					else
						self._key_pressed = false
					end
				end
			end
		end

		slot9 = self

		self._layout_input_text(slot8)

		slot9 = self

		self.update_caret(slot8)

		slot9 = 0.03

		wait(slot8)
	end

	return 
end
HUDChat.key_release = function (self, o, k)
	if self._key_pressed == k then
		self._key_pressed = false
	end

	return 
end
HUDChat.key_press = function (self, o, k)
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

	slot5 = self._input_text
	local s, e = self._input_text.selection(slot4)
	slot9 = self._input_text
	local n = utf8.len(self._input_text.text(slot8))
	local d = math.abs(self._input_text.text)
	self._key_pressed = k
	slot9 = self._input_text

	self._input_text.stop(e - s)

	slot14 = "update_key_down"

	self._input_text.animate(e - s, self._input_text, callback(k, self, self))

	slot9 = "backspace"

	if k == Idstring(e - s) then
		if s == e and 0 < s then
			slot11 = e

			self._input_text.set_selection(slot8, self._input_text, s - 1)
		end

		self._input_text.replace_text(slot8, self._input_text)

		slot11 = self._input_text

		if utf8.len(self._input_text.text("")) < 1 then
			slot9 = self._esc_callback

			if type(slot8) ~= "number" then
			end
		end
	else
		slot9 = "delete"

		if k == Idstring(slot8) then
			if s == e and s < n then
				slot11 = e + 1

				self._input_text.set_selection(slot8, self._input_text, s)
			end

			self._input_text.replace_text(slot8, self._input_text)

			slot11 = self._input_text

			if utf8.len(self._input_text.text("")) < 1 then
				slot9 = self._esc_callback

				if type(slot8) ~= "number" then
				end
			end
		else
			slot9 = "left"

			if k == Idstring(slot8) then
				if s < e then
					slot11 = s

					self._input_text.set_selection(slot8, self._input_text, s)
				elseif 0 < s then
					slot11 = s - 1

					self._input_text.set_selection(slot8, self._input_text, s - 1)
				end
			else
				slot9 = "right"

				if k == Idstring(slot8) then
					if s < e then
						slot11 = e

						self._input_text.set_selection(slot8, self._input_text, e)
					elseif s < n then
						slot11 = s + 1

						self._input_text.set_selection(slot8, self._input_text, s + 1)
					end
				else
					slot10 = "end"

					if self._key_pressed == Idstring(slot9) then
						slot11 = n

						self._input_text.set_selection(slot8, self._input_text, n)
					else
						slot10 = "home"

						if self._key_pressed == Idstring(slot9) then
							slot11 = 0

							self._input_text.set_selection(slot8, self._input_text, 0)
						else
							slot9 = "enter"

							if k == Idstring(slot8) then
								slot9 = self._enter_callback

								if type(slot8) ~= "number" then
									self._enter_callback()
								end
							else
								slot9 = "esc"

								if k == Idstring(slot8) then
									slot9 = self._esc_callback

									if type(slot8) ~= "number" then
										slot10 = ""

										self._input_text.set_text(slot8, self._input_text)

										slot11 = 0

										self._input_text.set_selection(slot8, self._input_text, 0)
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

	slot9 = self

	self._layout_input_text(slot8)

	slot9 = self

	self.update_caret(slot8)

	return 
end
HUDChat._layout_input_text = function (self)
	slot3 = self._input_text
	local _, _, w, _ = self._input_text.text_rect(slot2)
	slot7 = self._input_text_panel
	local default_w = self._input_text_panel.w(slot6) - HUDChat.INPUT_TEXT_X - HUDChat.INPUT_TEXT_PADDING_RIGHT

	if default_w < w then
		slot9 = w

		self._input_text.set_w(slot7, self._input_text)

		slot11 = self._input_text_panel
		slot9 = self._input_text_panel.w(slot10) - HUDChat.INPUT_TEXT_PADDING_RIGHT

		self._input_text.set_right(slot7, self._input_text)
	elseif w <= default_w then
		slot9 = default_w

		self._input_text.set_w(slot7, self._input_text)

		slot9 = HUDChat.INPUT_TEXT_X

		self._input_text.set_x(slot7, self._input_text)
	end

	return 
end
HUDChat.send_message = function (self, name, message)
	return 
end
HUDChat._message_in_same_thread = function (self, peer_id, system_message)
	if #self._messages == 0 then
		return false
	end

	slot5 = self._messages[#self._messages]

	if self._messages[#self._messages].peer_id(#self._messages) ~= peer_id and system_message then
		slot5 = self._messages[#self._messages]

		if self._messages[#self._messages].system_message(#self._messages) then
			return true
		end
	end

	return false
end
HUDChat.receive_message = function (self, name, peer_id, message, color, icon, system_message)
	if peer_id then
		slot9 = managers.network
		slot10 = peer_id
		local peer = managers.network.session(slot8).peer(slot8, managers.network.session(slot8))
	end

	slot10 = message

	table.insert(slot8, self._recieved_messages)

	if ChatManager.MESSAGE_BUFFER_SIZE < #self._recieved_messages then
		slot10 = 1

		table.remove(slot8, self._recieved_messages)
	end

	local message_type = HUDChatMessagePeer
	slot10 = managers.network.account

	if name == managers.network.account.username(slot9) then
		message_type = HUDChatMessagePlayer
	elseif system_message then
		message_type = HUDChatMessageSystem
	end

	slot12 = system_message

	if self._message_in_same_thread(slot9, self, peer_id) then
		slot11 = message

		self._messages[#self._messages].add_message(#self._messages, self._messages[#self._messages])
	else
		slot14 = peer_id
		local message = message_type.new(slot9, message_type, self._message_panel, name, message)

		if #self._messages == HUDChat.MESSAGES_KEPT then
			slot11 = self._messages[1]

			self._messages[1].destroy(slot10)

			slot12 = 1

			table.remove(slot10, self._messages)
		end

		slot12 = message

		table.insert(slot10, self._messages)
	end

	slot10 = self

	self._layout_message_panel(slot9)

	slot10 = self

	if not self.shown(slot9) then
		slot10 = self

		self.show(slot9)
	else
		slot11 = "hide_chat"

		managers.queued_tasks.unqueue(slot9, managers.queued_tasks)
	end

	if not self._focus then
		slot16 = nil

		managers.queued_tasks.queue(slot9, managers.queued_tasks, "hide_chat", self.hide, self, nil, 4)
	end

	return 
end
HUDChat.ct_cached_messages = function (self)
	return #self._recieved_messages
end
HUDChat._layout_message_panel = function (self)
	local h = 0
	slot4 = self._message_panel
	local bottom = self._message_panel.h(slot3)

	for i = #self._messages, 1, -1 do
		slot10 = bottom

		self._messages[i].set_bottom(slot8, self._messages[i])

		slot9 = self._messages[i]
		local message_h = self._messages[i].h(slot8)
		h = h + message_h + HUDChat.MESSAGE_PADDING_DOWN
		bottom = bottom - message_h - HUDChat.MESSAGE_PADDING_DOWN
	end

	slot9 = self._input_panel
	slot6 = self._object.h(slot7) - self._input_panel.h(self._object)

	self._message_panel.set_bottom(slot4, self._message_panel)

	return 
end
HUDChat.set_output_alpha = function (self, alpha)
	slot5 = "output_panel"
	slot5 = alpha

	self._panel.child(slot3, self._panel).set_alpha(slot3, self._panel.child(slot3, self._panel))

	return 
end
HUDChat.remove = function (self)
	slot4 = "output_panel"
	slot3 = self._panel.child(slot2, self._panel)

	self._panel.child(slot2, self._panel).stop(slot2)

	slot3 = self._input_panel

	self._input_panel.stop(slot2)

	slot4 = self._panel

	self._hud_panel.remove(slot2, self._hud_panel)

	slot5 = self

	managers.chat.unregister_receiver(slot2, managers.chat, self._channel_id)

	return 
end

return 
