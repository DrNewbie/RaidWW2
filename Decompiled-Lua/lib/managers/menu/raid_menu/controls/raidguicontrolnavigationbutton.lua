-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = RaidGUIControlNavigationButton

if not slot0 then
	slot0 = class
	slot2 = RaidGUIControl
	slot0 = slot0(slot1)
end

RaidGUIControlNavigationButton = slot0
slot0 = RaidGUIControlNavigationButton
slot1 = 32
slot0.ICON_SIZE = slot1
slot0 = RaidGUIControlNavigationButton
slot1 = 10
slot0.ICON_TEXT_PADDING = slot1
slot0 = RaidGUIControlNavigationButton
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_grey_effects
slot0.COLOR_NORMAL = slot1
slot0 = RaidGUIControlNavigationButton
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_red
slot0.COLOR_HOVER = slot1
slot0 = RaidGUIControlNavigationButton
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_dark_red
slot0.COLOR_ACTIVE = slot1
slot0 = RaidGUIControlNavigationButton

function slot1(self, parent, params)
	slot3 = RaidGUIControlNavigationButton
	slot3 = slot3.super
	slot3 = slot3.init
	slot5 = self
	slot6 = parent
	slot7 = params

	slot3(slot4, slot5, slot6)

	if not params then
		slot3 = Application
		slot5 = slot3
		slot3 = slot3.error
		slot6 = "Trying to create a navigation button without parameters!"
		slot7 = debug
		slot7 = slot7.traceback

		slot3(slot4, slot5, slot7())

		return 
	end

	slot3 = self._panel
	slot5 = slot3
	slot3 = slot3.panel
	slot6 = {}
	slot7 = "navigation_button_panel_"
	slot8 = self._name
	slot7 = slot7 .. slot8
	slot6.name = slot7
	slot7 = params.x
	slot6.x = slot7
	slot7 = params.y
	slot6.y = slot7
	slot7 = params.h
	slot6.h = slot7
	slot7 = self._panel
	slot9 = slot7
	slot7 = slot7.layer
	slot7 = slot7(slot8)
	slot7 = slot7 + 1
	slot6.layer = slot7
	slot3 = slot3(slot4, slot5)
	self._object = slot3
	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.fonts
	slot3 = slot3.din_compressed
	params.font = slot3
	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.font_sizes
	slot3 = slot3.large
	params.font_size = slot3
	slot3 = params.icon_align
	params.icon_align = slot3
	slot3 = "center"
	params.vertical = slot3
	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.colors
	slot3 = slot3.raid_black
	params.highlight_color = slot3
	slot3 = params.icon
	slot3 = slot3.texture
	params.icon_texture = slot3
	slot3 = params.icon
	slot3 = slot3.texture_rect
	params.icon_texture_rect = slot3
	slot3 = params.text
	params.text = slot3
	slot3 = params.on_click_callback
	self._on_click_callback = slot3
	local icon_coord_x = 0
	local text_coord_x = 0
	slot5 = params.icon_align

	if slot5 == "right" then
		icon_coord_x = (params.w or 100) - RaidGUIControlNavigationButton.ICON_SIZE
		text_coord_x = 0
	else
		icon_coord_x = 0
		slot5 = RaidGUIControlNavigationButton
		slot5 = slot5.ICON_SIZE
		slot6 = RaidGUIControlNavigationButton
		slot6 = slot6.ICON_TEXT_PADDING
		text_coord_x = slot5 + slot6
	end

	slot5 = self._object
	slot7 = slot5
	slot5 = slot5.image
	slot8 = {
		y = 0
	}
	slot9 = "navigation_button_icon_"
	slot10 = self._name
	slot9 = slot9 .. slot10
	slot8.name = slot9
	slot8.x = icon_coord_x
	slot9 = RaidGUIControlNavigationButton
	slot9 = slot9.ICON_SIZE
	slot8.w = slot9
	slot9 = RaidGUIControlNavigationButton
	slot9 = slot9.ICON_SIZE
	slot8.h = slot9
	slot9 = params.icon_texture
	slot8.texture = slot9
	slot9 = params.icon_texture_rect
	slot8.texture_rect = slot9
	slot9 = RaidGUIControlNavigationButton
	slot9 = slot9.COLOR_NORMAL
	slot8.color = slot9
	slot9 = self._object
	slot11 = slot9
	slot9 = slot9.layer
	slot9 = slot9(slot10)
	slot9 = slot9 - 1
	slot8.layer = slot9
	slot5 = slot5(slot6, slot7)
	self._icon = slot5
	slot5 = self._object
	slot7 = slot5
	slot5 = slot5.label
	slot8 = {
		vertical = "center",
		align = "left",
		y = 0
	}
	slot9 = "navigation_button_text_"
	slot10 = self._name
	slot9 = slot9 .. slot10
	slot8.name = slot9
	slot8.x = text_coord_x
	slot9 = RaidGUIControlNavigationButton
	slot9 = slot9.ICON_SIZE
	slot8.h = slot9
	slot9 = params.font
	slot8.font = slot9
	slot9 = params.font_size
	slot8.font_size = slot9
	slot9 = RaidGUIControlNavigationButton
	slot9 = slot9.COLOR_NORMAL
	slot8.color = slot9
	slot9 = params.text
	slot8.text = slot9
	slot9 = self._object
	slot11 = slot9
	slot9 = slot9.layer
	slot9 = slot9(slot10)
	slot9 = slot9 - 1
	slot8.layer = slot9
	slot5 = slot5(slot6, slot7)
	self._text = slot5
	slot5 = self._text
	slot7 = slot5
	slot5 = slot5.text_rect
	local x, y, w, h = slot5(slot6)
	slot9 = self._text
	slot11 = slot9
	slot9 = slot9.set_w
	slot12 = w

	slot9(slot10, slot11)

	slot9 = params.icon_align

	if slot9 == "left" then
		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.set_w
		slot12 = self._icon
		slot14 = slot12
		slot12 = slot12.w
		slot12 = slot12(slot13)
		slot13 = self._text
		slot15 = slot13
		slot13 = slot13.w
		slot13 = slot13(slot14)
		slot12 = slot12 + slot13
		slot13 = RaidGUIControlNavigationButton
		slot13 = slot13.ICON_TEXT_PADDING
		slot12 = slot12 + slot13

		slot9(slot10, slot11)

		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.center
		slot9, slot10 = slot9(slot10)
		self._center_y = slot10
		self._center_x = slot9
		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.size
		slot9, slot10 = slot9(slot10)
		self._size_h = slot10
		self._size_w = slot9
		slot9 = params.font_size
		self._font_size = slot9
	else
		slot9 = self._object
		slot11 = slot9
		slot9 = slot9.set_w
		slot12 = self._icon
		slot14 = slot12
		slot12 = slot12.w
		slot12 = slot12(slot13)
		slot13 = self._text
		slot15 = slot13
		slot13 = slot13.w
		slot13 = slot13(slot14)
		slot12 = slot12 + slot13
		slot13 = RaidGUIControlNavigationButton
		slot13 = slot13.ICON_TEXT_PADDING
		slot12 = slot12 + slot13

		slot9(slot10, slot11)

		slot9 = self._text
		slot11 = slot9
		slot9 = slot9.set_x
		slot12 = 0

		slot9(slot10, slot11)

		slot9 = self._icon
		slot11 = slot9
		slot9 = slot9.set_x
		slot12 = self._text
		slot14 = slot12
		slot12 = slot12.right
		slot12 = slot12(slot13)
		slot13 = RaidGUIControlNavigationButton
		slot13 = slot13.ICON_TEXT_PADDING
		slot12 = slot12 + slot13

		slot9(slot10, slot11)
	end

	return 
end

slot0.init = slot1
slot0 = RaidGUIControlNavigationButton

function slot1(self)
	slot1 = self._icon
	slot3 = slot1
	slot1 = slot1.set_color
	slot4 = RaidGUIControlNavigationButton
	slot4 = slot4.COLOR_HOVER

	slot1(slot2, slot3)

	slot1 = self._text
	slot3 = slot1
	slot1 = slot1.set_color
	slot4 = RaidGUIControlNavigationButton
	slot4 = slot4.COLOR_HOVER

	slot1(slot2, slot3)

	return 
end

slot0.highlight_on = slot1
slot0 = RaidGUIControlNavigationButton

function slot1(self)
	slot1 = self._icon
	slot3 = slot1
	slot1 = slot1.set_color
	slot4 = RaidGUIControlNavigationButton
	slot4 = slot4.COLOR_NORMAL

	slot1(slot2, slot3)

	slot1 = self._text
	slot3 = slot1
	slot1 = slot1.set_color
	slot4 = RaidGUIControlNavigationButton
	slot4 = slot4.COLOR_NORMAL

	slot1(slot2, slot3)

	return 
end

slot0.highlight_off = slot1
slot0 = RaidGUIControlNavigationButton

function slot1(self, button)
	slot2 = self._icon
	slot4 = slot2
	slot2 = slot2.set_color
	slot5 = RaidGUIControlNavigationButton
	slot5 = slot5.COLOR_HOVER

	slot2(slot3, slot4)

	slot2 = self._text
	slot4 = slot2
	slot2 = slot2.set_color
	slot5 = RaidGUIControlNavigationButton
	slot5 = slot5.COLOR_HOVER

	slot2(slot3, slot4)

	slot2 = self._on_click_callback

	if slot2 then
		slot2 = self._on_click_callback
		slot4 = button
		slot5 = self
		slot6 = self._data

		slot2(slot3, slot4, slot5)
	end

	return 
end

slot0.on_mouse_released = slot1
slot0 = RaidGUIControlNavigationButton

function slot1(self, button)
	slot2 = self._icon
	slot4 = slot2
	slot2 = slot2.set_color
	slot5 = RaidGUIControlNavigationButton
	slot5 = slot5.COLOR_ACTIVE

	slot2(slot3, slot4)

	slot2 = self._text
	slot4 = slot2
	slot2 = slot2.set_color
	slot5 = RaidGUIControlNavigationButton
	slot5 = slot5.COLOR_ACTIVE

	slot2(slot3, slot4)

	return 
end

slot0.on_mouse_pressed = slot1

return 
