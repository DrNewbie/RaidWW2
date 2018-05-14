-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItem"

core.import(slot1, core)

if not MenuItemInput then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

MenuItemInput = slot0
MenuItemInput.TYPE = "input"
MenuItemInput.init = function (self, data_node, parameters)
	slot7 = parameters

	MenuItemInput.super.init(slot4, self, data_node)

	self._esc_callback = 0
	self._enter_callback = 0
	self._typing_callback = 0
	self._type = MenuItemInput.TYPE
	self._input_text = ""
	self._input_limit = self._parameters.input_limit or 30
	self._empty_gui_input_limit = self._parameters.empty_gui_input_limit or self._input_limit / 2

	return 
end
MenuItemInput.input_text = function (self)
	return self._input_text
end
MenuItemInput.set_input_text = function (self, input_text)
	self._input_text = input_text

	return 
end
MenuItemInput.add_input_text = function (self, input_text)
	self._input_text = self._input_text .. input_text

	return 
end
MenuItemInput.set_value = function (self, value)
	slot5 = value

	self.set_input_text(slot3, self)

	return 
end
MenuItemInput.value = function (self)
	slot3 = self

	return self.input_text(slot2)
end
MenuItemInput.setup_gui = function (self, node, row_item)
	local right_align = node._right_align(slot4)
	slot7 = {
		alpha = 0.9,
		w = node.item_panel.w(slot9)
	}
	slot10 = node.item_panel
	row_item.gui_panel = node.item_panel.panel(node, node.item_panel)
	slot10 = row_item.align
	row_item.gui_text = node._text_item_part(node, node, row_item, row_item.gui_panel, right_align)
	slot10 = row_item.align
	row_item.empty_gui_text = node._text_item_part(node, node, row_item, row_item.gui_panel, right_align)
	slot7 = {
		alpha = 0,
		vertical = "scale",
		blend_mdoe = "add",
		halign = "scale",
		align = "scale",
		valign = "scale",
		color = Color(right_align, 0.5, 0.5),
		layer = node.layers.items - 1
	}
	slot12 = 0.5
	row_item.input_bg = row_item.gui_panel.rect(node, row_item.gui_panel)
	slot7 = 0.8

	row_item.empty_gui_text.set_alpha(node, row_item.empty_gui_text)

	slot7 = ""

	row_item.gui_text.set_text(node, row_item.gui_text)

	slot7 = {
		rotation = 360,
		name = "caret",
		h = 0,
		w = 0,
		blend_mode = "add",
		y = 0,
		x = 0,
		color = Color(right_align, 0.1, 1, 1),
		layer = node.layers.items + 2
	}
	slot13 = 1
	row_item.caret = row_item.gui_panel.rect(node, row_item.gui_panel)
	slot8 = row_item

	self._layout_gui(node, self, node)

	return true
end
MenuItemInput._layout_gui = function (self, node, row_item)

	-- Decompilation error in this vicinity:
	local safe_rect = managers.gui_data.scaled_size(slot4)
	local right_align = node._right_align(managers.gui_data)
	local left_align = node._left_align(node)

	row_item.gui_text.set_text(node, row_item.gui_text)

	slot10 = row_item.gui_text
	local n = utf8.len(row_item.gui_text.text(self._input_text or ""))
	slot11 = n

	row_item.gui_text.set_selection(row_item.gui_text.text, row_item.gui_text, n)

	slot9 = row_item.empty_gui_text
	local _, _, w, h = row_item.empty_gui_text.text_rect(row_item.gui_text.text)
	slot14 = h

	row_item.gui_panel.set_height(slot12, row_item.gui_panel)

	slot17 = node
	slot14 = safe_rect.width - node._mid_align(node)

	row_item.gui_panel.set_width(slot12, row_item.gui_panel)

	slot13 = row_item.gui_panel

	row_item.gui_panel.set_x(slot12, node._mid_align(node._mid_align(node)))

	self._align_x = slot11
	slot14 = row_item

	self._layout(slot12, self)

	return 
end
MenuItemInput._layout = function (self, row_item)
	slot4 = row_item.gui_text
	local _, _, w = row_item.gui_text.text_rect(slot3)
	slot8 = w + 5

	row_item.gui_text.set_width(slot6, row_item.gui_text)

	slot7 = row_item.empty_gui_text
	local _, _, w, h = row_item.empty_gui_text.text_rect(slot6)
	slot12 = h

	row_item.gui_text.set_h(slot10, row_item.gui_text)

	slot12 = h

	row_item.empty_gui_text.set_h(slot10, row_item.empty_gui_text)

	slot12 = w + 5

	row_item.empty_gui_text.set_width(slot10, row_item.empty_gui_text)

	if row_item.align == "right" then
		slot12 = self._align_x

		row_item.gui_text.set_right(slot10, row_item.gui_text)

		slot12 = self._align_x

		row_item.empty_gui_text.set_right(slot10, row_item.empty_gui_text)
	else
		slot12 = self._align_x

		row_item.gui_text.set_left(slot10, row_item.gui_text)

		slot12 = self._align_x

		row_item.empty_gui_text.set_left(slot10, row_item.empty_gui_text)
	end

	slot14 = row_item.gui_text
	slot12 = row_item.gui_text.text(slot13) == ""

	row_item.empty_gui_text.set_visible(slot10, row_item.empty_gui_text)

	slot12 = row_item

	self._update_caret(slot10, self)

	slot12 = row_item

	self._update_input_bg(slot10, self)

	return true
end
MenuItemInput._update_input_bg = function (self, row_item)

	-- Decompilation error in this vicinity:
	slot8 = row_item.gui_text
	slot5 = (self._input_text ~= row_item.gui_text.text(slot7) and 0.6) or 0

	row_item.input_bg.set_alpha(slot3, row_item.input_bg)

	slot8 = row_item.gui_text
	slot5 = (self._input_text == row_item.gui_text.text(slot7) and 0.75) or 0

	row_item.empty_gui_text.set_alpha(slot3, row_item.empty_gui_text)

	return 
end
MenuItemInput.reload = function (self, row_item, node)
	slot7 = row_item

	self._layout_gui(slot4, self, node)

	return true
end
MenuItemInput.highlight_row_item = function (self, node, row_item, mouse_over)
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot7 = row_item.color

	row_item.empty_gui_text.set_color(slot5, row_item.empty_gui_text)

	slot7 = row_item

	self._on_focus(slot5, self)

	return true
end
MenuItemInput.fade_row_item = function (self, node, row_item, mouse_over)
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot7 = row_item.color

	row_item.empty_gui_text.set_color(slot5, row_item.empty_gui_text)

	slot7 = row_item

	self._loose_focus(slot5, self)

	return true
end
MenuItemInput.esc_key_callback = function (self, row_item)
	slot5 = row_item

	self._loose_focus(slot3, self)

	return 
end
MenuItemInput.enter_key_callback = function (self, row_item)
	local text = row_item.gui_text
	local message = text.text(slot4)
	slot7 = message

	self.set_input_text(text, self)

	slot7 = row_item

	self._layout(text, self)

	return 
end
MenuItemInput._animate_show_input = function (self, input_panel)
	local TOTAL_T = 0.2
	slot5 = input_panel
	local start_alpha = input_panel.alpha(slot4)
	local end_alpha = 1

	function slot8(p)
		slot3 = input_panel
		slot8 = p

		input_panel.set_alpha(slot2, math.lerp(slot5, start_alpha, end_alpha))

		return 
	end

	over(slot6, TOTAL_T)

	return 
end
MenuItemInput._animate_hide_input = function (self, input_panel)
	local TOTAL_T = 0.2
	slot5 = input_panel
	local start_alpha = input_panel.alpha(slot4)
	local end_alpha = 0.95

	function slot8(p)
		slot3 = input_panel
		slot8 = p

		input_panel.set_alpha(slot2, math.lerp(slot5, start_alpha, end_alpha))

		return 
	end

	over(slot6, TOTAL_T)

	return 
end
MenuItemInput._animate_input_bg = function (self, input_bg)

	-- Decompilation error in this vicinity:
	local t = 0

	while true do
		local dt = coroutine.yield()
		t = t + dt
		local a = 0.75 + (1 + math.sin(slot5)) / 8
		slot8 = a

		input_bg.set_alpha(t * 200, input_bg)
	end

	return 
end
MenuItemInput.trigger = function (self)

	-- Decompilation error in this vicinity:
	slot3 = self._enter_callback

	if type(slot2) ~= "number" then
		self._enter_callback()
	end

	slot1 = pairs
	slot5 = self

	for _, callback in slot1(slot2) do
		slot8 = self

		callback(slot7)
	end

	return 
end
MenuItemInput._on_focus = function (self, row_item)
	if self._focus then
		return 
	end

	self._focus = true
	slot4 = row_item.gui_panel

	row_item.gui_panel.stop(slot3)

	slot4 = row_item.gui_panel
	slot9 = "_animate_show_input"

	row_item.gui_panel.animate(slot3, callback(slot6, self, self))

	slot4 = row_item.node_gui.ws
	slot7 = Input

	row_item.node_gui.ws.connect_keyboard(slot3, Input.keyboard(slot6))

	slot4 = row_item.gui_panel
	slot10 = row_item

	row_item.gui_panel.key_press(slot3, callback(slot6, self, self, "key_press"))

	slot4 = row_item.gui_panel
	slot10 = row_item

	row_item.gui_panel.enter_text(slot3, callback(slot6, self, self, "enter_text"))

	slot4 = row_item.gui_panel
	slot10 = row_item

	row_item.gui_panel.key_release(slot3, callback(slot6, self, self, "key_release"))

	slot7 = row_item
	self._esc_callback = callback(slot3, self, self, "esc_key_callback")
	slot7 = row_item
	self._enter_callback = callback(slot3, self, self, "enter_key_callback")
	self._typing_callback = 0
	self._enter_text_set = false
	slot5 = row_item

	self._layout(slot3, self)

	return 
end
MenuItemInput.focus = function (self)
	return self._focus
end
MenuItemInput._loose_focus = function (self, row_item)
	if not self._focus then
		return false
	end

	self._focus = false
	self._one_scroll_up_delay = nil
	self._one_scroll_dn_delay = nil
	local text = row_item.gui_text

	text.set_text(slot4, text)

	slot7 = text
	local n = utf8.len(text.text(self._input_text or ""))

	text.set_selection(text.text, text, n)

	slot6 = row_item.node_gui.ws

	row_item.node_gui.ws.disconnect_keyboard(text.text)

	slot7 = nil

	row_item.gui_panel.key_press(text.text, row_item.gui_panel)

	slot7 = nil

	row_item.gui_panel.enter_text(text.text, row_item.gui_panel)

	slot7 = nil

	row_item.gui_panel.key_release(text.text, row_item.gui_panel)

	self._esc_callback = 0
	self._enter_callback = 0
	self._typing_callback = 0
	slot6 = row_item.gui_panel

	row_item.gui_panel.stop(text.text)

	slot11 = "_animate_hide_input"

	row_item.gui_panel.animate(text.text, callback(n, self, self))

	local text = row_item.gui_text
	slot7 = text

	text.stop(row_item.gui_panel)

	slot8 = row_item

	self._layout(row_item.gui_panel, self)

	return true
end
MenuItemInput._shift = function (self)
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
MenuItemInput.blink = function (o)
	while true do
		slot3 = o
		slot9 = 1

		o.set_color(slot2, Color(slot5, 0.05, 1, 1))

		slot3 = 0.4

		wait(slot2)

		slot3 = o
		slot9 = 1

		o.set_color(slot2, Color(slot5, 0.9, 1, 1))

		slot3 = 0.4

		wait(slot2)
	end

	return 
end
MenuItemInput.set_blinking = function (self, b, row_item)
	local caret = row_item.caret

	if b == self._blinking then
		return 
	end

	if b then
		slot7 = self.blink

		caret.animate(slot5, caret)
	else
		slot6 = caret

		caret.stop(slot5)
	end

	self._blinking = b

	if not self._blinking then
		slot6 = caret
		slot12 = 1

		caret.set_color(slot5, Color(slot8, 0.9, 1, 1))
	end

	return 
end
MenuItemInput._update_caret = function (self, row_item)
	local text = row_item.gui_text
	local caret = row_item.caret
	slot6 = text
	local s, e = text.selection(slot5)
	slot8 = text
	local x, y, w, h = text.selection_rect(slot7)

	if s == 0 and e == 0 then
		slot12 = text

		if text.align(slot11) == "center" then
			slot13 = text
			x = text.world_x(slot11) + text.w(text) / 2
		elseif row_item.align == "right" then
			slot12 = text
			x = text.world_right(slot11)
		else
			slot12 = text
			x = text.world_left(slot11)
		end

		slot12 = text
		y = text.world_y(slot11)
	end

	slot12 = text
	h = text.h(slot11)

	if w < 3 then
		w = 3
	end

	if not self._focus then
		w = 0
		h = 0
	end

	slot16 = h - 4

	caret.set_world_shape(slot11, caret, x, y + 2, w)

	if row_item.align == "right" then
		slot13 = x

		caret.set_world_right(slot11, caret)
	end

	slot14 = row_item

	self.set_blinking(slot11, self, s == e and self._focus)

	return 
end
MenuItemInput.enter_text = function (self, row_item, o, s)

	-- Decompilation error in this vicinity:
	if self._skip_first then
		self._skip_first = false

		return 
	end

	local text = row_item.gui_text
	local m = self._input_limit
	slot10 = text
	local n = utf8.len(text.text(slot9))
	slot11 = m - n
	s = utf8.sub(text.text, s, 1)
	slot9 = self._typing_callback

	if type(text.text) ~= "number" then
		self._typing_callback()
	end

	slot10 = s

	text.replace_text(slot8, text)

	slot10 = row_item

	self._layout(slot8, self)

	return 
end
MenuItemInput.update_key_down = function (self, row_item, o, k)

	-- Decompilation error in this vicinity:
	slot6 = 0.6

	wait(slot5)

	local text = row_item.gui_text

	while self._key_pressed == k do
		slot7 = text
		local s, e = text.selection(slot6)
		local n = utf8.len(text.text(slot10))
		slot10 = e - s
		local d = math.abs(text.text)
		slot12 = "backspace"

		if self._key_pressed == Idstring(text) then
			if s == e and 0 < s then
				slot13 = e

				text.set_selection(slot10, text, s - 1)
			end

			text.replace_text(slot10, text)

			slot13 = text

			if utf8.len(text.text("")) < 1 then
				slot11 = self._esc_callback

				if type(slot10) ~= "number" then
				end
			end
		else
			slot12 = "delete"

			if self._key_pressed == Idstring(slot11) then
				if s == e and s < n then
					slot13 = e + 1

					text.set_selection(slot10, text, s)
				end

				text.replace_text(slot10, text)

				slot13 = text

				if utf8.len(text.text("")) < 1 then
					slot11 = self._esc_callback

					if type(slot10) ~= "number" then
					end
				end
			else
				slot12 = "left"

				if self._key_pressed == Idstring(slot11) then
					if s < e then
						slot13 = s

						text.set_selection(slot10, text, s)
					elseif 0 < s then
						slot13 = s - 1

						text.set_selection(slot10, text, s - 1)
					end
				else
					slot12 = "right"

					if self._key_pressed == Idstring(slot11) then
						if s < e then
							slot13 = e

							text.set_selection(slot10, text, e)
						elseif s < n then
							slot13 = s + 1

							text.set_selection(slot10, text, s + 1)
						end
					else
						self._key_pressed = false
					end
				end
			end
		end

		slot12 = row_item

		self._layout(slot10, self)

		slot11 = 0.03

		wait(slot10)
	end

	return 
end
MenuItemInput.key_release = function (self, row_item, o, k)

	-- Decompilation error in this vicinity:
	if self._key_pressed == k then
		self._key_pressed = false
	end

	return 
end
MenuItemInput.key_press = function (self, row_item, o, k)

	-- Decompilation error in this vicinity:
	if self._skip_first then
		slot6 = "enter"

		if k == Idstring(slot5) then
			self._skip_first = false
		end

		return 
	end

	local text = row_item.gui_text
	slot7 = text
	local s, e = text.selection(slot6)
	slot11 = text
	local n = utf8.len(text.text(slot10))
	local d = math.abs(text.text)
	self._key_pressed = k
	slot11 = text

	text.stop(e - s)

	slot17 = row_item
	slot13 = k

	text.animate(e - s, text, callback(slot13, self, self, "update_key_down"))

	slot11 = "backspace"

	if k == Idstring(e - s) then
		if s == e and 0 < s then
			slot13 = e

			text.set_selection(slot10, text, s - 1)
		end

		text.replace_text(slot10, text)

		slot13 = text

		if utf8.len(text.text("")) < 1 then
			slot11 = self._esc_callback

			if type(slot10) ~= "number" then
			end
		end
	else
		slot11 = "delete"

		if k == Idstring(slot10) then
			if s == e and s < n then
				slot13 = e + 1

				text.set_selection(slot10, text, s)
			end

			text.replace_text(slot10, text)

			slot13 = text

			if utf8.len(text.text("")) < 1 then
				slot11 = self._esc_callback

				if type(slot10) ~= "number" then
				end
			end
		else
			slot11 = "left"

			if k == Idstring(slot10) then
				if s < e then
					slot13 = s

					text.set_selection(slot10, text, s)
				elseif 0 < s then
					slot13 = s - 1

					text.set_selection(slot10, text, s - 1)
				end
			else
				slot11 = "right"

				if k == Idstring(slot10) then
					if s < e then
						slot13 = e

						text.set_selection(slot10, text, e)
					elseif s < n then
						slot13 = s + 1

						text.set_selection(slot10, text, s + 1)
					end
				else
					slot12 = "end"

					if self._key_pressed == Idstring(slot11) then
						slot13 = n

						text.set_selection(slot10, text, n)
					else
						slot12 = "home"

						if self._key_pressed == Idstring(slot11) then
							slot13 = 0

							text.set_selection(slot10, text, 0)
						else
							slot11 = "enter"

							if k == Idstring(slot10) then
								slot11 = self._enter_callback

								if type(slot10) ~= "number" then
								end
							else
								slot11 = "esc"

								if k == Idstring(slot10) then
									slot11 = self._esc_callback

									if type(slot10) ~= "number" then
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

	slot12 = row_item

	self._layout(slot10, self)

	return 
end

return 
