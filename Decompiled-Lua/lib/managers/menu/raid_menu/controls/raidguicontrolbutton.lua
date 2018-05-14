-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = RaidGUIControlButton

if not slot0 then
	slot0 = class
	slot2 = RaidGUIControl
	slot0 = slot0(slot1)
end

RaidGUIControlButton = slot0
slot0 = RaidGUIControlButton
slot1 = 0.95
slot0.PRESSED_SIZE = slot1
slot0 = RaidGUIControlButton

function slot1(self, parent, params)
	slot3 = RaidGUIControlButton
	slot3 = slot3.super
	slot3 = slot3.init
	slot5 = self
	slot6 = parent
	slot7 = params

	slot3(slot4, slot5, slot6)

	slot3 = self._panel
	slot5 = slot3
	slot3 = slot3.panel
	slot6 = self._params
	slot3 = slot3(slot4, slot5)
	self._object = slot3
	slot3 = {}
	self._controls = slot3
	slot3 = clone
	slot5 = self._params
	local text_params = slot3(slot4)
	slot4 = 0
	text_params.x = slot4
	slot4 = 0
	text_params.y = slot4
	slot4 = text_params.font

	if not slot4 then
		slot4 = tweak_data
		slot4 = slot4.gui
		slot4 = slot4.fonts
		slot4 = slot4.din_compressed
	end

	text_params.font = slot4
	slot4 = text_params.font_size

	if not slot4 then
		slot4 = tweak_data
		slot4 = slot4.gui
		slot4 = slot4.font_sizes
		slot4 = slot4.medium
	end

	text_params.font_size = slot4
	slot4 = text_params.text

	if not slot4 then
		slot4 = managers
		slot4 = slot4.localization
		slot6 = slot4
		slot4 = slot4.text
		slot7 = text_params.text_id
		slot4 = slot4(slot5, slot6)
	end

	text_params.text = slot4
	slot4 = nil
	text_params.text_id = slot4
	slot4 = params.item_background_color
	text_params.background_color = slot4
	slot4 = params.vertical
	text_params.vertical = slot4
	slot4 = text_params.layer
	slot4 = slot4 + 2
	text_params.layer = slot4
	slot4 = text_params.text_padding

	if slot4 then
		slot4 = text_params.x
		slot5 = text_params.text_padding
		slot4 = slot4 + slot5
		text_params.x = slot4
	end

	slot4 = text_params.background_color

	if slot4 then
		slot4 = clone
		slot6 = text_params
		local background_params = slot4(slot5)
		slot5 = text_params.background_color
		background_params.color = slot5
		slot5 = self._panel
		slot7 = slot5
		slot5 = slot5.rect
		slot8 = background_params
		slot5 = slot5(slot6, slot7)
		self._background = slot5
	end

	slot4 = self._object
	slot6 = slot4
	slot4 = slot4.text
	slot7 = text_params
	slot4 = slot4(slot5, slot6)
	self._object_text = slot4
	slot4 = table
	slot4 = slot4.insert
	slot6 = self._controls
	slot7 = self._object_text

	slot4(slot5, slot6)

	slot4 = text_params.text_padding

	if slot4 then
		slot4 = text_params.x
		slot5 = text_params.text_padding
		slot4 = slot4 - slot5
		text_params.x = slot4
		slot4 = self._object_text
		slot6 = slot4
		slot4 = slot4.set_w
		slot7 = self._object_text
		slot9 = slot7
		slot7 = slot7.w
		slot7 = slot7(slot8)
		slot8 = text_params.text_padding
		slot8 = slot8 * 2
		slot7 = slot7 - slot8

		slot4(slot5, slot6)
	end

	slot4 = clone
	slot6 = self._params
	local image_params = slot4(slot5)
	slot5 = image_params.texture

	if slot5 then
		slot5 = 0
		image_params.x = slot5
		slot5 = 0
		image_params.y = slot5
		slot5 = self._object
		slot7 = slot5
		slot5 = slot5.bitmap
		slot8 = image_params
		slot5 = slot5(slot6, slot7)
		self._object_image = slot5
		slot5 = table
		slot5 = slot5.insert
		slot7 = self._controls
		slot8 = self._object_image

		slot5(slot6, slot7)

		slot5 = self._object_image
		slot7 = slot5
		slot5 = slot5.set_color
		slot8 = image_params.texture_color

		if not slot8 then
			slot8 = Color
			slot8 = slot8.white
		end

		slot5(slot6, slot7)

		slot5 = image_params.texture_image_y_add

		if slot5 then
			slot5 = self._object_image
			slot7 = slot5
			slot5 = slot5.set_y
			slot8 = self._object_image
			slot10 = slot8
			slot8 = slot8.y
			slot8 = slot8(slot9)
			slot9 = self._params
			slot9 = slot9.texture_image_y_add
			slot8 = slot8 + slot9

			slot5(slot6, slot7)
		end

		slot5 = self._params
		slot5 = slot5.highlight_texture

		if slot5 then
			slot5 = clone
			slot7 = self._params
			local params_highlight = slot5(slot6)
			slot6 = 0
			params_highlight.x = slot6
			slot6 = 0
			params_highlight.y = slot6
			slot6 = image_params.highlight_texture
			params_highlight.texture = slot6
			slot6 = image_params.highlight_texture_rect
			params_highlight.texture_rect = slot6
			slot6 = self._object
			slot8 = slot6
			slot6 = slot6.bitmap
			slot9 = params_highlight
			slot6 = slot6(slot7, slot8)
			self._object_image_highlight = slot6
			slot6 = table
			slot6 = slot6.insert
			slot8 = self._controls
			slot9 = self._object_image_highlight

			slot6(slot7, slot8)

			slot6 = self._object_image_highlight
			slot8 = slot6
			slot6 = slot6.set_color
			slot9 = image_params.texture_highlight_color

			if not slot9 then
				slot9 = Color
				slot9 = slot9.white
			end

			slot6(slot7, slot8)
		end
	end

	slot5 = params.on_click_callback

	if not slot5 then
	end

	slot5 = {}
	slot6 = params.value
	slot5.value = slot6
	self._data = slot5
	slot5 = "link"
	self._pointer_type = slot5
	slot5 = params.on_click_callback
	self._on_click_callback = slot5
	slot5 = params.on_double_click_callback
	self.on_double_click_callback = slot5
	slot5 = params.on_menu_move
	self._on_menu_move = slot5
	slot7 = self
	slot5 = self.highlight_off

	slot5(slot6)

	slot5 = true
	self._play_mouse_over_sound = slot5
	slot5 = self._object
	slot7 = slot5
	slot5 = slot5.center
	slot5, slot6 = slot5(slot6)
	self._center_y = slot6
	self._center_x = slot5
	slot5 = self._object
	slot7 = slot5
	slot5 = slot5.size
	slot5, slot6 = slot5(slot6)
	self._size_h = slot6
	self._size_w = slot5
	slot5 = self._object_text
	slot7 = slot5
	slot5 = slot5.font_size
	slot5 = slot5(slot6)
	self._font_size = slot5
	slot5 = true
	self._enabled = slot5

	return 
end

slot0.init = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	return 
end

slot0.close = slot1
slot0 = RaidGUIControlButton

function slot1(self, param_name, param_value)
	slot3 = self._params
	slot3[param_name] = param_value

	return 
end

slot0.set_param_value = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._params
	slot1 = slot1.no_highlight

	if slot1 then
		return 
	end

	slot1 = self._object_image

	if slot1 then
		slot1 = self._object_image
		slot3 = slot1
		slot1 = slot1.set_color
		slot4 = self._params
		slot4 = slot4.texture_highlight_color

		if not slot4 then
			slot4 = Color
			slot4 = slot4.white
		end

		slot1(slot2, slot3)
	end

	slot1 = self._object_text

	if slot1 then
		slot1 = self._object_text
		slot3 = slot1
		slot1 = slot1.set_color
		slot4 = self._params
		slot4 = slot4.highlight_color

		if not slot4 then
			slot4 = Color
			slot4 = slot4.white
		end

		slot1(slot2, slot3)
	end

	slot1 = self._object_image_highlight

	if slot1 then
		slot1 = self._object_image_highlight
		slot3 = slot1
		slot1 = slot1.show

		slot1(slot2)

		slot1 = self._object_image
		slot3 = slot1
		slot1 = slot1.hide

		slot1(slot2)
	end

	slot1 = self._play_mouse_over_sound

	if slot1 then
		slot1 = managers
		slot1 = slot1.menu_component
		slot3 = slot1
		slot1 = slot1.post_event
		slot4 = "highlight"

		slot1(slot2, slot3)

		slot1 = false
		self._play_mouse_over_sound = slot1
	end

	return 
end

slot0.highlight_on = slot1
slot0 = RaidGUIControlButton

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._params
	slot1 = slot1.no_highlight
	slot1 = alive
	slot3 = self._object_image
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._object_image
		slot3 = slot1
		slot1 = slot1.set_color
		slot4 = self._params
		slot4 = slot4.texture_color

		if not slot4 then
			slot4 = Color
			slot4 = slot4.white
		end

		slot1(slot2, slot3)
	end

	slot1 = self._object_text

	if slot1 then
		slot1 = alive
		slot3 = self._object_text
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._object_text
			slot3 = slot1
			slot1 = slot1.set_color
			slot4 = self._params
			slot4 = slot4.color

			if not slot4 then
				slot4 = Color
				slot4 = slot4.black
			end

			slot1(slot2, slot3)
		end
	end

	slot1 = self._object_image_highlight

	if slot1 then
		slot1 = self._object_image_highlight
		slot3 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		slot1 = self._object_image
		slot3 = slot1
		slot1 = slot1.show

		slot1(slot2)
	end

	slot1 = true
	self._play_mouse_over_sound = slot1

	return 
end

slot0.highlight_off = slot1
slot0 = RaidGUIControlButton

function slot1(self, o, button, x, y)
	slot5 = self._params
	slot5 = slot5.no_click

	if slot5 then
		slot5 = true

		return slot5
	end

	slot7 = self
	slot5 = self.on_mouse_released
	slot8 = button

	slot5(slot6, slot7)

	slot5 = true

	return slot5
end

slot0.mouse_released = slot1
slot0 = RaidGUIControlButton

function slot1(self, button)
	slot2 = self._params
	slot2 = slot2.no_click

	if slot2 then
		slot2 = true

		return slot2
	end

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.center
	slot2, slot3 = slot2(slot3)
	self._center_y = slot3
	self._center_x = slot2
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.stop

	slot2(slot3)

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.animate
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "_animate_press"

	slot2(slot3, slot5(slot6, slot7, slot8))

	return 
end

slot0.on_mouse_pressed = slot1
slot0 = RaidGUIControlButton

function slot1(self, button)
	slot2 = self._params
	slot2 = slot2.no_click

	if slot2 then
		slot2 = true

		return slot2
	end

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.stop

	slot2(slot3)

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.animate
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "_animate_release"

	slot2(slot3, slot5(slot6, slot7, slot8))

	slot2 = self._on_click_callback

	if slot2 then
		slot2 = self._params
		slot2 = slot2.no_click

		if not slot2 then
			slot2 = self._on_click_callback
			slot4 = button
			slot5 = self
			slot6 = self._data

			slot2(slot3, slot4, slot5)
		end
	end

	slot2 = self._params
	slot2 = slot2.on_click_sound

	if slot2 then
		slot2 = managers
		slot2 = slot2.menu_component
		slot4 = slot2
		slot2 = slot2.post_event
		slot5 = self._params
		slot5 = slot5.on_click_sound

		slot2(slot3, slot4)
	end

	return 
end

slot0.on_mouse_released = slot1
slot0 = RaidGUIControlButton

function slot1(self, button)
	slot2 = self.on_double_click_callback

	if slot2 then
		slot2 = self.on_double_click_callback
		slot4 = button
		slot5 = self
		slot6 = self._data

		slot2(slot3, slot4, slot5)
	end

	return 
end

slot0.on_double_click = slot1
slot0 = RaidGUIControlButton

function slot1(self, x)
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.set_x
	slot5 = x

	slot2(slot3, slot4)

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.center
	slot2, slot3 = slot2(slot3)
	self._center_y = slot3
	self._center_x = slot2

	return 
end

slot0.set_x = slot1
slot0 = RaidGUIControlButton

function slot1(self, y)
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.set_y
	slot5 = y

	slot2(slot3, slot4)

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.center
	slot2, slot3 = slot2(slot3)
	self._center_y = slot3
	self._center_x = slot2

	return 
end

slot0.set_y = slot1
slot0 = RaidGUIControlButton

function slot1(self, bottom)
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.set_bottom
	slot5 = bottom

	slot2(slot3, slot4)

	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.center
	slot2, slot3 = slot2(slot3)
	self._center_y = slot3
	self._center_x = slot2

	return 
end

slot0.set_bottom = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	local bottom = 0
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.bottom
	slot2 = slot2(slot3)
	bottom = slot2

	return bottom
end

slot0.bottom = slot1
slot0 = RaidGUIControlButton

function slot1(self, x, y, w, h)
	slot5 = self._object
	slot7 = slot5
	slot5 = slot5.set_shape
	slot8 = x
	slot9 = y
	slot10 = w
	slot11 = h

	slot5(slot6, slot7, slot8, slot9, slot10)

	return 
end

slot0.set_shape = slot1
slot0 = RaidGUIControlButton

function slot1(self, alpha)
	slot2 = self._panel
	slot4 = slot2
	slot2 = slot2.set_alpha
	slot5 = alpha

	slot2(slot3, slot4)

	return 
end

slot0.set_alpha = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object_text

	if slot1 then
		slot1 = self._object_text
		slot3 = slot1
		slot1 = slot1.text_rect

		return slot1(slot2)
	else
		slot1 = nil

		return slot1
	end

	return 
end

slot0.get_text_rect_shape = slot1
slot0 = RaidGUIControlButton

function slot1(self, text)
	slot2 = self._object_text

	if slot2 then
		slot2 = self._object_text
		slot4 = slot2
		slot2 = slot2.set_text
		slot5 = text

		slot2(slot3, slot4)
	end

	return 
end

slot0.set_text = slot1
slot0 = RaidGUIControlButton

function slot1(self, color)
	slot2 = self._object_text

	if slot2 then
		slot2 = self._object_text
		slot4 = slot2
		slot2 = slot2.set_color
		slot5 = color

		slot2(slot3, slot4)
	end

	return 
end

slot0.set_text_color = slot1
slot0 = RaidGUIControlButton

function slot1(self, value)
	self._selected = value
	slot2 = self._selected

	if slot2 then
		slot4 = self
		slot2 = self.highlight_on

		slot2(slot3)
	else
		slot4 = self
		slot2 = self.highlight_off

		slot2(slot3)
	end

	return 
end

slot0.set_selected = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._selected

	return slot1
end

slot0.selected = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object

	if slot1 then
		slot1 = alive
		slot3 = self._object
		slot3 = slot3._engine_panel
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._object
			slot3 = slot1
			slot1 = slot1.show

			slot1(slot2)

			slot1 = self._object
			slot3 = slot1
			slot1 = slot1.set_alpha
			slot4 = 1

			slot1(slot2, slot3)

			slot1 = self._object_text

			if slot1 then
				slot1 = self._object_text
				slot3 = slot1
				slot1 = slot1.set_visible
				slot4 = true

				slot1(slot2, slot3)
			end
		end
	end

	return 
end

slot0.show = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.hide

	slot1(slot2)

	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.set_alpha
	slot4 = 0

	slot1(slot2, slot3)

	slot1 = self._object_text

	if slot1 then
		slot1 = self._object_text
		slot3 = slot1
		slot1 = slot1.set_visible
		slot4 = false

		slot1(slot2, slot3)
	end

	return 
end

slot0.hide = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.animate
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "_animate_show"

	slot1(slot2, slot4(slot5, slot6, slot7))

	return 
end

slot0.animate_show = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._object
	slot3 = slot1
	slot1 = slot1.animate
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "_animate_hide"

	slot1(slot2, slot4(slot5, slot6, slot7))

	return 
end

slot0.animate_hide = slot1
slot0 = RaidGUIControlButton

function slot1(self, active_texture_color)
	slot2 = self._object_image

	if slot2 and active_texture_color then
		slot2 = self._object_image
		slot4 = slot2
		slot2 = slot2.set_color
		slot5 = active_texture_color

		slot2(slot3, slot4)
	end

	slot2 = self._object_text

	if slot2 and active_texture_color then
		slot2 = self._object_text
		slot4 = slot2
		slot2 = slot2.set_color
		slot5 = active_texture_color

		slot2(slot3, slot4)
	end

	slot4 = self
	slot2 = self.set_param_value
	slot5 = "no_highlight"
	slot6 = false

	slot2(slot3, slot4, slot5)

	slot4 = self
	slot2 = self.set_param_value
	slot5 = "no_click"
	slot6 = false

	slot2(slot3, slot4, slot5)

	slot2 = true
	self._enabled = slot2

	return 
end

slot0.enable = slot1
slot0 = RaidGUIControlButton

function slot1(self, inactive_texture_color)
	slot2 = self._object_image

	if slot2 and inactive_texture_color then
		slot2 = self._object_image
		slot4 = slot2
		slot2 = slot2.set_color
		slot5 = inactive_texture_color

		slot2(slot3, slot4)
	end

	slot2 = self._object_text

	if slot2 and inactive_texture_color then
		slot2 = self._object_text
		slot4 = slot2
		slot2 = slot2.set_color
		slot5 = inactive_texture_color

		slot2(slot3, slot4)
	end

	slot4 = self
	slot2 = self.set_param_value
	slot5 = "no_highlight"
	slot6 = true

	slot2(slot3, slot4, slot5)

	slot4 = self
	slot2 = self.set_param_value
	slot5 = "no_click"
	slot6 = true

	slot2(slot3, slot4, slot5)

	slot2 = false
	self._enabled = slot2

	return 
end

slot0.disable = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._enabled

	return slot1
end

slot0.enabled = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	slot1 = self._selected

	if slot1 then
		slot1 = self._on_click_callback

		if slot1 then
			slot3 = self
			slot1 = self._on_click_callback

			slot1(slot2)

			slot1 = self._on_menu_move

			if slot1 then
				slot1 = self._on_menu_move
				slot1 = slot1.confirm

				if slot1 then
					slot3 = self
					slot1 = self._menu_move_to
					slot4 = self._on_menu_move
					slot4 = slot4.confirm

					slot1(slot2, slot3)
				end
			end

			slot1 = true

			return slot1
		end
	end

	return 
end

slot0.confirm_pressed = slot1
slot0 = RaidGUIControlButton

function slot1(self, set_w, set_h)
	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_size
	slot6 = set_w
	slot7 = set_h

	slot3(slot4, slot5, slot6)

	slot3 = ipairs
	slot5 = self._controls
	slot3, slot4, slot5 = slot3(slot4)

	for _, control in slot3, slot4, slot5 do
		slot10 = control
		slot8 = control.set_size
		slot11 = set_w
		slot12 = set_h

		slot8(slot9, slot10, slot11)
	end

	return 
end

slot0.set_size = slot1
slot0 = RaidGUIControlButton

function slot1(self, set_x, set_y)
	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_center
	slot6 = set_x
	slot7 = set_y

	slot3(slot4, slot5, slot6)

	slot3 = ipairs
	slot5 = self._controls
	slot3, slot4, slot5 = slot3(slot4)

	for _, control in slot3, slot4, slot5 do
		slot10 = control
		slot8 = control.set_center
		slot11 = self._object
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._object
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)
	end

	return 
end

slot0.set_center = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	local t = 0
	local duration = 0.05

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_in
		slot6 = t
		slot7 = 1
		slot8 = RaidGUIControlButton
		slot8 = slot8.PRESSED_SIZE
		slot8 = 1 - slot8
		slot8 = -slot8
		slot9 = duration
		local scale = slot4(slot5, slot6, slot7, slot8)
		slot7 = self
		slot5 = self.set_size
		slot8 = self._size_w
		slot8 = slot8 * scale
		slot9 = self._size_h
		slot9 = slot9 * scale

		slot5(slot6, slot7, slot8)

		slot7 = self
		slot5 = self.set_center
		slot8 = self._center_x
		slot9 = self._center_y

		slot5(slot6, slot7, slot8)

		slot5 = self._object_text
		slot7 = slot5
		slot5 = slot5.set_center
		slot8 = self._object
		slot10 = slot8
		slot8 = slot8.w
		slot8 = slot8(slot9)
		slot8 = slot8 / 2
		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.h
		slot9 = slot9(slot10)
		slot9 = slot9 / 2

		slot5(slot6, slot7, slot8)

		slot5 = self._object_text
		slot7 = slot5
		slot5 = slot5.set_font_size
		slot8 = self._font_size
		slot8 = slot8 * scale

		slot5(slot6, slot7)
	end

	slot5 = self
	slot3 = self.set_size
	slot6 = self._size_w
	slot7 = RaidGUIControlButton
	slot7 = slot7.PRESSED_SIZE
	slot6 = slot6 * slot7
	slot7 = self._size_h
	slot8 = RaidGUIControlButton
	slot8 = slot8.PRESSED_SIZE
	slot7 = slot7 * slot8

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.set_center
	slot6 = self._center_x
	slot7 = self._center_y

	slot3(slot4, slot5, slot6)

	slot3 = self._object_text
	slot5 = slot3
	slot3 = slot3.set_center
	slot6 = self._object
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 / 2
	slot7 = self._object
	slot9 = slot7
	slot7 = slot7.h
	slot7 = slot7(slot8)
	slot7 = slot7 / 2

	slot3(slot4, slot5, slot6)

	slot3 = self._object_text
	slot5 = slot3
	slot3 = slot3.set_font_size
	slot6 = self._font_size
	slot7 = RaidGUIControlButton
	slot7 = slot7.PRESSED_SIZE
	slot6 = slot6 * slot7

	slot3(slot4, slot5)

	return 
end

slot0._animate_press = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	local t = 0
	local duration = 0.25
	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_size
	slot6 = self._size_w
	slot7 = RaidGUIControlButton
	slot7 = slot7.PRESSED_SIZE
	slot6 = slot6 * slot7
	slot7 = self._size_h
	slot8 = RaidGUIControlButton
	slot8 = slot8.PRESSED_SIZE
	slot7 = slot7 * slot8

	slot3(slot4, slot5, slot6)

	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_center
	slot6 = self._center_x
	slot7 = self._center_y

	slot3(slot4, slot5, slot6)

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_out
		slot6 = t
		slot7 = RaidGUIControlButton
		slot7 = slot7.PRESSED_SIZE
		slot8 = RaidGUIControlButton
		slot8 = slot8.PRESSED_SIZE
		slot8 = 1 - slot8
		slot9 = duration
		local scale = slot4(slot5, slot6, slot7, slot8)
		slot7 = self
		slot5 = self.set_size
		slot8 = self._size_w
		slot8 = slot8 * scale
		slot9 = self._size_h
		slot9 = slot9 * scale

		slot5(slot6, slot7, slot8)

		slot7 = self
		slot5 = self.set_center
		slot8 = self._center_x
		slot9 = self._center_y

		slot5(slot6, slot7, slot8)

		slot5 = self._object_text
		slot7 = slot5
		slot5 = slot5.set_center
		slot8 = self._object
		slot10 = slot8
		slot8 = slot8.w
		slot8 = slot8(slot9)
		slot8 = slot8 / 2
		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.h
		slot9 = slot9(slot10)
		slot9 = slot9 / 2

		slot5(slot6, slot7, slot8)

		slot5 = self._object_text
		slot7 = slot5
		slot5 = slot5.set_font_size
		slot8 = self._font_size
		slot8 = slot8 * scale

		slot5(slot6, slot7)
	end

	slot5 = self
	slot3 = self.set_size
	slot6 = self._size_w
	slot7 = self._size_h

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.set_center
	slot6 = self._center_x
	slot7 = self._center_y

	slot3(slot4, slot5, slot6)

	slot3 = self._object_text
	slot5 = slot3
	slot3 = slot3.set_center
	slot6 = self._object
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 / 2
	slot7 = self._object
	slot9 = slot7
	slot7 = slot7.h
	slot7 = slot7(slot8)
	slot7 = slot7 / 2

	slot3(slot4, slot5, slot6)

	slot3 = self._object_text
	slot5 = slot3
	slot3 = slot3.set_font_size
	slot6 = self._font_size

	slot3(slot4, slot5)

	return 
end

slot0._animate_release = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	local duration = 0.25
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.alpha
	slot2 = slot2(slot3)
	local t = slot2 * duration
	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_visible
	slot6 = true

	slot3(slot4, slot5)

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_in_out
		slot6 = t
		slot7 = 0
		slot8 = 1
		slot9 = duration
		local alpha = slot4(slot5, slot6, slot7, slot8)
		slot5 = self._object
		slot7 = slot5
		slot5 = slot5.set_alpha
		slot8 = alpha

		slot5(slot6, slot7)
	end

	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_alpha
	slot6 = 1

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self.show

	slot3(slot4)

	return 
end

slot0._animate_show = slot1
slot0 = RaidGUIControlButton

function slot1(self)
	local duration = 0.25
	slot2 = self._object
	slot4 = slot2
	slot2 = slot2.alpha
	slot2 = slot2(slot3)
	slot2 = 1 - slot2
	local t = slot2 * duration

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_in_out
		slot6 = t
		slot7 = 1
		slot8 = -1
		slot9 = duration
		local alpha = slot4(slot5, slot6, slot7, slot8)
		slot5 = self._object
		slot7 = slot5
		slot5 = slot5.set_alpha
		slot8 = alpha

		slot5(slot6, slot7)
	end

	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_visible
	slot6 = false

	slot3(slot4, slot5)

	slot3 = self._object
	slot5 = slot3
	slot3 = slot3.set_alpha
	slot6 = 0

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self.hide

	slot3(slot4)

	return 
end

slot0._animate_hide = slot1

return 
