-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

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
slot0 = require
slot2 = "lib/managers/menu/renderers/MenuNodeBaseGui"

slot0(slot1)

slot0 = MenuModInfoGui

if not slot0 then
	slot0 = class
	slot2 = MenuNodeBaseGui
	slot0 = slot0(slot1)
end

MenuModInfoGui = slot0
slot0 = MenuModInfoGui

function slot1(self, node, layer, parameters)
	slot4 = MenuModInfoGui
	slot4 = slot4.super
	slot4 = slot4.init
	slot6 = self
	slot7 = node
	slot8 = layer
	slot9 = parameters

	slot4(slot5, slot6, slot7, slot8)

	slot4 = managers
	slot4 = slot4.menu
	slot6 = slot4
	slot4 = slot4.active_menu
	local active_menu = slot4(slot5)

	if active_menu then
		slot5 = active_menu.input
		slot7 = slot5
		slot5 = slot5.set_force_input
		slot8 = true

		slot5(slot6, slot7)
	end

	return 
end

slot0.init = slot1
slot0 = MenuModInfoGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.menu
	slot3 = slot1
	slot1 = slot1.active_menu
	local active_menu = slot1(slot2)

	if active_menu then
		slot2 = active_menu.input
		slot4 = slot2
		slot2 = slot2.set_force_input
		slot5 = false

		slot2(slot3, slot4)
	end

	slot2 = MenuModInfoGui
	slot2 = slot2.super
	slot2 = slot2.close
	slot4 = self

	slot2(slot3)

	return 
end

slot0.close = slot1
slot0 = MenuModInfoGui

function slot1(self)
	slot1 = MenuModInfoGui
	slot1 = slot1.super
	slot1 = slot1.setup
	slot3 = self

	slot1(slot2)

	slot1 = self.safe_rect_panel
	slot3 = slot1
	slot1 = slot1.panel
	slot4 = {
		name = "mod_main_panel",
		y = 40
	}
	slot5 = self.safe_rect_panel
	slot7 = slot5
	slot5 = slot5.w
	slot5 = slot5(slot6)
	slot5 = slot5 * 0.6
	slot4.w = slot5
	slot5 = self.safe_rect_panel
	slot7 = slot5
	slot5 = slot5.h
	slot5 = slot5(slot6)
	slot5 = slot5 * 0.65
	slot4.h = slot5
	local panel = slot1(slot2, slot3)
	slot4 = panel
	slot2 = panel.set_size
	slot5 = math
	slot5 = slot5.round
	slot9 = panel
	slot7 = panel.w
	slot5 = slot5(slot7(slot8))
	slot6 = math
	slot6 = slot6.round
	slot10 = panel
	slot8 = panel.h

	slot2(slot3, slot4, slot6(slot8(slot9)))

	slot2 = self.safe_rect_panel
	slot4 = slot2
	slot2 = slot2.text
	slot5 = {
		layer = 1
	}
	slot6 = managers
	slot6 = slot6.localization
	slot8 = slot6
	slot6 = slot6.to_upper_text
	slot9 = "menu_mods_installed_title"
	slot6 = slot6(slot7, slot8)
	slot5.text = slot6
	slot6 = self.medium_font
	slot5.font = slot6
	slot6 = self.medium_font_size
	slot5.font_size = slot6
	local title = slot2(slot3, slot4)
	slot3 = self.make_fine_text
	slot5 = title

	slot3(slot4)

	slot5 = title
	slot3 = title.set_right
	slot6 = self.safe_rect_panel
	slot8 = slot6
	slot6 = slot6.right

	slot3(slot4, slot6(slot7))

	slot5 = self
	slot3 = self.create_gui_box
	slot6 = panel

	slot3(slot4, slot5)

	slot5 = panel
	slot3 = panel.rect
	slot6 = {
		name = "bg",
		alpha = 0.4
	}
	slot7 = Color
	slot7 = slot7.black
	slot6.color = slot7

	slot3(slot4, slot5)

	slot5 = panel
	slot3 = panel.bitmap
	slot6 = {
		texture = "guis/textures/test_blur_df",
		name = "blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1
	}
	slot9 = panel
	slot7 = panel.w
	slot7 = slot7(slot8)
	slot6.w = slot7
	slot9 = panel
	slot7 = panel.h
	slot7 = slot7(slot8)
	slot6.h = slot7

	slot3(slot4, slot5)

	slot5 = panel
	slot3 = panel.panel
	slot6 = {}
	slot3 = slot3(slot4, slot5)
	self.mod_info_panel = slot3
	self._mod_main_panel = panel

	return 
end

slot0.setup = slot1
slot0 = MenuModInfoGui

function slot1(self, item)

	-- Decompilation error in this vicinity:
	slot2 = self.mod_info_panel
	slot4 = slot2
	slot2 = slot2.clear

	slot2(slot3)

	slot2 = alive
	slot4 = self._scroll_bar_panel
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = self.safe_rect_panel
		slot4 = slot2
		slot2 = slot2.remove
		slot5 = self._scroll_bar_panel

		slot2(slot3, slot4)
	end

	slot2 = nil
	self._scroll_bar_panel = slot2
	slot2 = self._scroll_up_box

	if slot2 then
		slot2 = self._scroll_up_box
		slot4 = slot2
		slot2 = slot2.close

		slot2(slot3)

		slot2 = nil
		self._scroll_up_box = slot2
	end

	slot2 = self._scroll_down_box

	if slot2 then
		slot2 = self._scroll_down_box
		slot4 = slot2
		slot2 = slot2.close

		slot2(slot3)

		slot2 = nil
		self._scroll_down_box = slot2
	end

	slot2 = self.safe_rect_panel
	slot4 = slot2
	slot2 = slot2.child
	slot5 = "info_title"
	slot2 = slot2(slot3, slot4)

	if slot2 then
		slot2 = self.safe_rect_panel
		slot4 = slot2
		slot2 = slot2.remove
		slot5 = self.safe_rect_panel
		slot7 = slot5
		slot5 = slot5.child
		slot8 = "info_title"

		slot2(slot3, slot5(slot6, slot7))
	end

	slot4 = item
	local params = item.parameters(slot3) or {}
	slot3 = params.back
	local mods = self.node.parameters(slot4).mods
	slot6 = self.node
	local modded_content = self.node.parameters(self.node).modded_content
	local mod_name = params.name
	local mod_data = mods and mods[mod_name]
	slot7 = self.mod_info_panel
	slot9 = slot7
	slot7 = slot7.panel
	slot10 = {
		y = 10,
		name = "conflicted"
	}
	local conflicted_panel = slot7(slot8, slot9)
	slot8 = self.mod_info_panel
	slot10 = slot8
	slot8 = slot8.panel
	slot11 = {
		name = "modded"
	}
	local modded_panel = slot8(slot9, slot10)
	slot9 = self.safe_rect_panel
	slot11 = slot9
	slot9 = slot9.text
	slot12 = {
		name = "info_title",
		layer = 1
	}
	slot13 = managers
	slot13 = slot13.localization
	slot15 = slot13
	slot13 = slot13.to_upper_text
	slot16 = "menu_mods_info_title"
	slot17 = {
		mod = mod_name
	}
	slot13 = slot13(slot14, slot15, slot16)
	slot12.text = slot13
	slot13 = self.medium_font
	slot12.font = slot13
	slot13 = self.medium_font_size
	slot12.font_size = slot13
	local title = slot9(slot10, slot11)
	slot10 = self.make_fine_text
	slot12 = title

	slot10(slot11)

	if mod_data then

		-- Decompilation error in this vicinity:
		slot12 = conflicted_panel
		slot10 = conflicted_panel.text
		slot13 = {
			y = 0,
			x = 10,
			layer = 1
		}
		slot14 = managers
		slot14 = slot14.localization
		slot16 = slot14
		slot14 = slot14.to_upper_text
		slot17 = "menu_mods_conflict_title"
		slot14 = slot14(slot15, slot16)
		slot13.text = slot14
		slot14 = self.medium_font
		slot13.font = slot14
		slot14 = self.medium_font_size
		slot13.font_size = slot14
		slot16 = conflicted_panel
		slot14 = conflicted_panel.w
		slot14 = slot14(slot15)
		slot14 = slot14 - 20
		slot13.w = slot14
		local text = slot10(slot11, slot12)
		slot13 = text
		slot11 = text.text_rect
		local _, _, _, h = slot11(slot12)
		slot17 = text
		slot15 = text.set_h
		slot18 = h

		slot15(slot16, slot17)

		local cy = h
		local conflict_text_title = text
		slot19 = conflict_text_title
		slot17 = conflict_text_title.hide

		slot17(slot18)

		slot19 = modded_panel
		slot17 = modded_panel.text
		slot20 = {
			y = 0,
			x = 10,
			layer = 1
		}
		slot21 = managers
		slot21 = slot21.localization
		slot23 = slot21
		slot21 = slot21.to_upper_text
		slot24 = "menu_mods_modded_title"
		slot21 = slot21(slot22, slot23)
		slot20.text = slot21
		slot21 = self.medium_font
		slot20.font = slot21
		slot21 = self.medium_font_size
		slot20.font_size = slot21
		slot23 = conflicted_panel
		slot21 = conflicted_panel.w
		slot21 = slot21(slot22)
		slot21 = slot21 - 20
		slot20.w = slot21
		local text = slot17(slot18, slot19)
		slot20 = text
		slot18 = text.text_rect
		local _, _, _, h = slot18(slot19)
		slot24 = text
		slot22 = text.set_h
		slot25 = h

		slot22(slot23, slot24)

		local my = h
		local mod_text_title = text
		slot26 = mod_text_title
		slot24 = mod_text_title.hide

		slot24(slot25)

		local conflicted_mods = {}
		slot25 = ipairs
		slot27 = mod_data.content
		slot25, slot26, slot27 = slot25(slot26)

		for _, path in slot25, slot26, slot27 do
			slot30 = mod_data.conflicted
			slot31 = Idstring
			slot33 = path
			slot31 = slot31(slot32)
			slot33 = slot31
			slot31 = slot31.key
			slot31 = slot31(slot32)
			slot30 = slot30[slot31]

			if slot30 then
				slot30 = ipairs
				slot32 = mod_data.conflicted
				slot33 = Idstring
				slot35 = path
				slot33 = slot33(slot34)
				slot35 = slot33
				slot33 = slot33.key
				slot33 = slot33(slot34)
				slot32 = slot32[slot33]
				slot30, slot31, slot32 = slot30(slot31)

				for _, conflict_mod in slot30, slot31, slot32 do
					if conflict_mod ~= mod_name then
						conflicted_mods[conflict_mod] = conflicted_mods[conflict_mod] or {}
						slot35 = table
						slot35 = slot35.insert
						slot37 = conflicted_mods[conflict_mod]
						slot38 = path

						slot35(slot36, slot37)
					end
				end

				slot32 = conflict_text_title
				slot30 = conflict_text_title.show

				slot30(slot31)
			else
				slot32 = modded_panel
				slot30 = modded_panel.text
				slot33 = {
					wrap = true,
					x = 20,
					layer = 1,
					text = path
				}
				slot34 = self.small_font
				slot33.font = slot34
				slot34 = self.small_font_size
				slot33.font_size = slot34
				slot33.y = my
				slot36 = modded_panel
				slot34 = modded_panel.w
				slot34 = slot34(slot35)
				slot34 = slot34 - 30
				slot33.w = slot34
				slot30 = slot30(slot31, slot32)
				text = slot30
				slot32 = text
				slot30 = text.text_rect
				slot30, slot31, slot32, slot33 = slot30(slot31)
				h = slot33
				_ = slot32
				_ = slot31
				_ = slot30
				slot32 = text
				slot30 = text.set_h
				slot33 = h

				slot30(slot31, slot32)

				slot32 = text
				slot30 = text.set_color
				slot33 = tweak_data
				slot33 = slot33.screen_colors
				slot33 = slot33.text

				slot30(slot31, slot32)

				slot30 = math
				slot30 = slot30.ceil
				slot32 = h
				slot30 = slot30(slot31)
				my = my + slot30
				slot32 = mod_text_title
				slot30 = mod_text_title.show

				slot30(slot31)
			end
		end

		local sorted_conflicts = {}
		slot26 = pairs
		slot28 = conflicted_mods
		slot26, slot27, slot28 = slot26(slot27)

		for mod, conflicts in slot26, slot27, slot28 do
			slot31 = table
			slot31 = slot31.insert
			slot33 = sorted_conflicts
			slot34 = mod

			slot31(slot32, slot33)
		end

		slot26 = table
		slot26 = slot26.sort
		slot28 = sorted_conflicts

		slot26(slot27)

		slot26 = ipairs
		slot28 = sorted_conflicts
		slot26, slot27, slot28 = slot26(slot27)

		for _, mod in slot26, slot27, slot28 do
			slot33 = conflicted_panel
			slot31 = conflicted_panel.text
			slot34 = {
				wrap = true,
				x = 20,
				layer = 1
			}
			slot35 = utf8
			slot35 = slot35.to_upper
			slot37 = mod
			slot35 = slot35(slot36)
			slot36 = ":"
			slot35 = slot35 .. slot36
			slot34.text = slot35
			slot35 = self.small_font
			slot34.font = slot35
			slot35 = self.small_font_size
			slot34.font_size = slot35
			slot34.y = cy
			slot37 = conflicted_panel
			slot35 = conflicted_panel.w
			slot35 = slot35(slot36)
			slot35 = slot35 - 30
			slot34.w = slot35
			slot31 = slot31(slot32, slot33)
			text = slot31
			slot33 = text
			slot31 = text.text_rect
			slot31, slot32, slot33, slot34 = slot31(slot32)
			h = slot34
			_ = slot33
			_ = slot32
			_ = slot31
			slot33 = text
			slot31 = text.set_h
			slot34 = h

			slot31(slot32, slot33)

			slot31 = math
			slot31 = slot31.ceil
			slot33 = h
			slot31 = slot31(slot32)
			cy = cy + slot31
			slot31 = ipairs
			slot33 = conflicted_mods[mod]
			slot31, slot32, slot33 = slot31(slot32)

			for _, path in slot31, slot32, slot33 do
				slot38 = conflicted_panel
				slot36 = conflicted_panel.text
				slot39 = {
					wrap = true,
					x = 25,
					layer = 1,
					text = path
				}
				slot40 = self.small_font
				slot39.font = slot40
				slot40 = self.small_font_size
				slot39.font_size = slot40
				slot39.y = cy
				slot42 = conflicted_panel
				slot40 = conflicted_panel.w
				slot40 = slot40(slot41)
				slot40 = slot40 - 35
				slot39.w = slot40
				slot36 = slot36(slot37, slot38)
				text = slot36
				slot38 = text
				slot36 = text.text_rect
				slot36, slot37, slot38, slot39 = slot36(slot37)
				h = slot39
				_ = slot38
				_ = slot37
				_ = slot36
				slot38 = text
				slot36 = text.set_h
				slot39 = h

				slot36(slot37, slot38)

				slot38 = text
				slot36 = text.set_color
				slot39 = tweak_data
				slot39 = slot39.screen_colors
				slot39 = slot39.important_1

				slot36(slot37, slot38)

				slot36 = math
				slot36 = slot36.ceil
				slot38 = h
				slot36 = slot36(slot37)
				cy = cy + slot36
			end

			cy = cy + 10
		end

		slot28 = conflicted_panel
		slot26 = conflicted_panel.set_h
		slot29 = cy

		slot26(slot27, slot28)

		slot28 = modded_panel
		slot26 = modded_panel.set_y
		slot31 = conflict_text_title
		slot29 = conflict_text_title.visible
		slot29 = slot29(slot30)
		slot31 = conflicted_panel
		slot29 = conflicted_panel.bottom(slot30) or 10

		slot26(slot27, slot28)

		slot29 = my

		modded_panel.set_h(slot27, modded_panel)

		slot29 = 0

		self.mod_info_panel.set_y(slot27, self.mod_info_panel)

		slot28 = self.mod_info_panel
		slot26 = self.mod_info_panel.set_h
		slot31 = modded_panel
		slot29 = modded_panel.bottom
		slot29 = slot29(slot30)
		slot29 = slot29 + 10

		slot26(slot27, slot28)

		slot26 = self.mod_info_panel
		slot28 = slot26
		slot26 = slot26.h
		slot26 = slot26(slot27)
		slot27 = self._mod_main_panel
		slot29 = slot27
		slot27 = slot27.h
		slot27 = slot27(slot28)

		if slot27 < slot26 then
			slot26 = BoxGuiObject
			slot28 = slot26
			slot26 = slot26.new
			slot29 = self._mod_main_panel
			slot30 = {}
			slot31 = {
				0,
				0,
				2,
				0
			}
			slot30.sides = slot31
			slot26 = slot26(slot27, slot28, slot29)
			self._scroll_up_box = slot26
			slot26 = BoxGuiObject
			slot28 = slot26
			slot26 = slot26.new
			slot29 = self._mod_main_panel
			slot30 = {}
			slot31 = {
				0,
				0,
				0,
				2
			}
			slot30.sides = slot31
			slot26 = slot26(slot27, slot28, slot29)
			self._scroll_down_box = slot26
			slot26 = self._scroll_up_box
			slot28 = slot26
			slot26 = slot26.hide

			slot26(slot27)

			slot26 = self._scroll_down_box
			slot28 = slot26
			slot26 = slot26.show

			slot26(slot27)

			slot26 = self.safe_rect_panel
			slot28 = slot26
			slot26 = slot26.panel
			slot29 = {
				w = 20,
				name = "scroll_bar_panel"
			}
			slot30 = self._mod_main_panel
			slot32 = slot30
			slot30 = slot30.h
			slot30 = slot30(slot31)
			slot29.h = slot30
			slot26 = slot26(slot27, slot28)
			self._scroll_bar_panel = slot26
			slot26 = self._scroll_bar_panel
			slot28 = slot26
			slot26 = slot26.set_world_left
			slot29 = self._mod_main_panel
			slot31 = slot29
			slot29 = slot29.world_right

			slot26(slot27, slot29(slot30))

			slot26 = self._scroll_bar_panel
			slot28 = slot26
			slot26 = slot26.set_world_top
			slot29 = self._mod_main_panel
			slot31 = slot29
			slot29 = slot29.world_top

			slot26(slot27, slot29(slot30))

			slot26 = tweak_data
			slot26 = slot26.hud_icons
			slot28 = slot26
			slot26 = slot26.get_icon_data
			slot29 = "scrollbar_arrow"
			local texture, rect = slot26(slot27, slot28)
			slot28 = self._scroll_bar_panel
			slot30 = slot28
			slot28 = slot28.bitmap
			slot31 = {
				name = "scroll_up_indicator_arrow",
				layer = 2,
				blend_mode = "add",
				texture = texture,
				texture_rect = rect
			}
			slot32 = Color
			slot32 = slot32.white
			slot31.color = slot32
			local scroll_up_indicator_arrow = slot28(slot29, slot30)
			slot31 = scroll_up_indicator_arrow
			slot29 = scroll_up_indicator_arrow.set_center_x
			slot32 = self._scroll_bar_panel
			slot34 = slot32
			slot32 = slot32.w
			slot32 = slot32(slot33)
			slot32 = slot32 / 2

			slot29(slot30, slot31)

			slot29 = tweak_data
			slot29 = slot29.hud_icons
			slot31 = slot29
			slot29 = slot29.get_icon_data
			slot32 = "scrollbar_arrow"
			local texture, rect = slot29(slot30, slot31)
			slot31 = self._scroll_bar_panel
			slot33 = slot31
			slot31 = slot31.bitmap
			slot34 = {
				name = "scroll_down_indicator_arrow",
				layer = 2,
				blend_mode = "add",
				rotation = 180,
				texture = texture,
				texture_rect = rect
			}
			slot35 = Color
			slot35 = slot35.white
			slot34.color = slot35
			local scroll_down_indicator_arrow = slot31(slot32, slot33)
			slot34 = scroll_down_indicator_arrow
			slot32 = scroll_down_indicator_arrow.set_bottom
			slot35 = self._scroll_bar_panel
			slot37 = slot35
			slot35 = slot35.h

			slot32(slot33, slot35(slot36))

			slot34 = scroll_down_indicator_arrow
			slot32 = scroll_down_indicator_arrow.set_center_x
			slot35 = self._scroll_bar_panel
			slot37 = slot35
			slot35 = slot35.w
			slot35 = slot35(slot36)
			slot35 = slot35 / 2

			slot32(slot33, slot34)

			slot34 = scroll_down_indicator_arrow
			slot32 = scroll_down_indicator_arrow.top
			slot32 = slot32(slot33)
			slot35 = scroll_up_indicator_arrow
			slot33 = scroll_up_indicator_arrow.bottom
			slot33 = slot33(slot34)
			local bar_h = slot32 - slot33
			slot33 = self._scroll_bar_panel
			slot35 = slot33
			slot33 = slot33.rect
			slot36 = {
				alpha = 0.05,
				w = 4
			}
			slot37 = Color
			slot37 = slot37.black
			slot36.color = slot37
			slot39 = scroll_up_indicator_arrow
			slot37 = scroll_up_indicator_arrow.bottom
			slot37 = slot37(slot38)
			slot36.y = slot37
			slot36.h = bar_h
			slot33 = slot33(slot34, slot35)
			slot35 = slot33
			slot33 = slot33.set_center_x
			slot36 = self._scroll_bar_panel
			slot38 = slot36
			slot36 = slot36.w
			slot36 = slot36(slot37)
			slot36 = slot36 / 2

			slot33(slot34, slot35)

			slot35 = scroll_down_indicator_arrow
			slot33 = scroll_down_indicator_arrow.bottom
			slot33 = slot33(slot34)
			slot36 = scroll_up_indicator_arrow
			slot34 = scroll_up_indicator_arrow.top
			slot34 = slot34(slot35)
			bar_h = slot33 - slot34
			slot33 = self._scroll_bar_panel
			slot35 = slot33
			slot33 = slot33.panel
			slot36 = {
				name = "scroll_bar",
				layer = 2,
				h = bar_h
			}
			local scroll_bar = slot33(slot34, slot35)
			slot36 = scroll_bar
			slot34 = scroll_bar.panel
			slot37 = {
				w = 4,
				name = "scroll_bar_box_panel",
				valign = "scale",
				halign = "scale"
			}
			local scroll_bar_box_panel = slot34(slot35, slot36)
			slot35 = BoxGuiObject
			slot37 = slot35
			slot35 = slot35.new
			slot38 = scroll_bar_box_panel
			slot39 = {}
			slot40 = {
				2,
				2,
				0,
				0
			}
			slot39.sides = slot40
			slot35 = slot35(slot36, slot37, slot38)
			self._scroll_bar_box_class = slot35
			slot35 = self._scroll_bar_box_class
			slot37 = slot35
			slot35 = slot35.set_aligns
			slot38 = "scale"
			slot39 = "scale"

			slot35(slot36, slot37, slot38)

			slot35 = self._scroll_bar_box_class
			slot37 = slot35
			slot35 = slot35.set_blend_mode
			slot38 = "add"

			slot35(slot36, slot37)

			slot37 = scroll_bar_box_panel
			slot35 = scroll_bar_box_panel.set_w
			slot38 = 8

			slot35(slot36, slot37)

			slot37 = scroll_bar_box_panel
			slot35 = scroll_bar_box_panel.set_center_x
			slot40 = scroll_bar
			slot38 = scroll_bar.w
			slot38 = slot38(slot39)
			slot38 = slot38 / 2

			slot35(slot36, slot37)

			slot37 = scroll_bar
			slot35 = scroll_bar.set_top
			slot40 = scroll_up_indicator_arrow
			slot38 = scroll_up_indicator_arrow.top

			slot35(slot36, slot38(slot39))

			slot37 = scroll_bar
			slot35 = scroll_bar.set_center_x
			slot40 = scroll_up_indicator_arrow
			slot38 = scroll_up_indicator_arrow.center_x

			slot35(slot36, slot38(slot39))

			slot37 = self
			slot35 = self.set_scroll_indicators
			slot38 = 0

			slot35(slot36, slot37)
		end
	end

	return 
end

slot0.set_mod_info = slot1
slot0 = MenuModInfoGui

function slot1(self, button, x, y)
	slot4 = alive
	slot6 = self._scroll_bar_panel
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = self._scroll_bar_panel
		slot6 = slot4
		slot4 = slot4.visible
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = self._scroll_bar_panel
			slot6 = slot4
			slot4 = slot4.child
			slot7 = "scroll_bar"
			local scroll_bar = slot4(slot5, slot6)
			slot5 = Idstring
			slot7 = "0"
			slot5 = slot5(slot6)

			if button == slot5 then
				slot7 = scroll_bar
				slot5 = scroll_bar.inside
				slot8 = x
				slot9 = y
				slot5 = slot5(slot6, slot7, slot8)

				if slot5 then
					slot5 = true
					self._grabbed_scroll_bar = slot5
					self._current_scroll_bar_y = y
					slot5 = true

					return slot5
				end

				slot5 = self._scroll_bar_panel
				slot7 = slot5
				slot5 = slot5.child
				slot8 = "scroll_up_indicator_arrow"
				slot5 = slot5(slot6, slot7)
				slot7 = slot5
				slot5 = slot5.visible
				slot5 = slot5(slot6)

				if slot5 then
					slot5 = self._scroll_bar_panel
					slot7 = slot5
					slot5 = slot5.child
					slot8 = "scroll_up_indicator_arrow"
					slot5 = slot5(slot6, slot7)
					slot7 = slot5
					slot5 = slot5.inside
					slot8 = x
					slot9 = y
					slot5 = slot5(slot6, slot7, slot8)

					if slot5 then
						slot7 = self
						slot5 = self.set_scroll_indicators
						slot8 = self._scroll_y

						if slot8 then
							slot8 = self._scroll_y
							slot8 = slot8 + 20
						end

						slot5(slot6, slot7)

						slot5 = true

						return slot5
					end
				end

				slot5 = self._scroll_bar_panel
				slot7 = slot5
				slot5 = slot5.child
				slot8 = "scroll_down_indicator_arrow"
				slot5 = slot5(slot6, slot7)
				slot7 = slot5
				slot5 = slot5.visible
				slot5 = slot5(slot6)

				if slot5 then
					slot5 = self._scroll_bar_panel
					slot7 = slot5
					slot5 = slot5.child
					slot8 = "scroll_down_indicator_arrow"
					slot5 = slot5(slot6, slot7)
					slot7 = slot5
					slot5 = slot5.inside
					slot8 = x
					slot9 = y
					slot5 = slot5(slot6, slot7, slot8)

					if slot5 then
						slot7 = self
						slot5 = self.set_scroll_indicators
						slot8 = self._scroll_y

						if slot8 then
							slot8 = self._scroll_y
							slot8 = slot8 - 20
						end

						slot5(slot6, slot7)

						slot5 = true

						return slot5
					end
				end
			else
				slot5 = self._scroll_bar_panel
				slot7 = slot5
				slot5 = slot5.inside
				slot8 = x
				slot9 = y
				slot5 = slot5(slot6, slot7, slot8)
			end
		end
	end

	slot4 = false

	return slot4
end

slot0.check_pressed_scroll_bar = slot1
slot0 = MenuModInfoGui

function slot1(self)
	slot1 = self._grabbed_scroll_bar

	if slot1 then
		slot1 = nil
		self._grabbed_scroll_bar = slot1
		slot1 = true

		return slot1
	end

	slot1 = false

	return slot1
end

slot0.release_scroll_bar = slot1
slot0 = MenuModInfoGui

function slot1(self, x, y)
	slot3 = alive
	slot5 = self._scroll_bar_panel
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._scroll_bar_panel
		slot5 = slot3
		slot3 = slot3.child
		slot6 = "scroll_bar"
		local scroll_bar = slot3(slot4, slot5)
		slot4 = self._grabbed_scroll_bar

		if slot4 then
			slot8 = self._current_scroll_bar_y or 0
			self._current_scroll_bar_y = self.scroll_with_bar(slot5, self, y)

			return true, "grab"
		else
			slot4 = self._scroll_bar_panel
			slot6 = slot4
			slot4 = slot4.visible
			slot4 = slot4(slot5)

			if slot4 then
				slot6 = scroll_bar
				slot4 = scroll_bar.inside
				slot7 = x
				slot8 = y
				slot4 = slot4(slot5, slot6, slot7)
			else
				slot4 = self._scroll_bar_panel
				slot6 = slot4
				slot4 = slot4.child
				slot7 = "scroll_up_indicator_arrow"
				slot4 = slot4(slot5, slot6)
				slot6 = slot4
				slot4 = slot4.visible
				slot4 = slot4(slot5)

				if slot4 then
					slot4 = self._scroll_bar_panel
					slot6 = slot4
					slot4 = slot4.child
					slot7 = "scroll_up_indicator_arrow"
					slot4 = slot4(slot5, slot6)
					slot6 = slot4
					slot4 = slot4.inside
					slot7 = x
					slot8 = y
					slot4 = slot4(slot5, slot6, slot7)
				else
					slot4 = self._scroll_bar_panel
					slot6 = slot4
					slot4 = slot4.child
					slot7 = "scroll_down_indicator_arrow"
					slot4 = slot4(slot5, slot6)
					slot6 = slot4
					slot4 = slot4.visible
					slot4 = slot4(slot5)

					if slot4 then
						slot4 = self._scroll_bar_panel
						slot6 = slot4
						slot4 = slot4.child
						slot7 = "scroll_down_indicator_arrow"
						slot4 = slot4(slot5, slot6)
						slot6 = slot4
						slot4 = slot4.inside
						slot7 = x
						slot8 = y
						slot4 = slot4(slot5, slot6, slot7)

						if slot4 then
							slot4 = true
							slot5 = "link"

							return slot4, slot5
						end
					end
				end
			end
		end
	end

	slot3 = false
	slot4 = "arrow"

	return slot3, slot4
end

slot0.moved_scroll_bar = slot1
slot0 = MenuModInfoGui

function slot1(self, target_y, current_y)
	slot3 = alive
	slot5 = self._scroll_bar_panel
	slot3 = slot3(slot4)

	if slot3 then
		local diff = current_y - target_y

		if diff == 0 then
			return current_y
		end

		slot4 = self._mod_main_panel
		slot6 = slot4
		slot4 = slot4.h
		slot4 = slot4(slot5)
		slot5 = self.mod_info_panel
		slot7 = slot5
		slot5 = slot5.h
		slot5 = slot5(slot6)
		local scroll_diff = slot4 / slot5
		slot7 = self
		slot5 = self.set_scroll_indicators
		slot8 = self._scroll_y

		if slot8 then
			slot8 = self._scroll_y
			slot9 = diff / scroll_diff
			slot8 = slot8 + slot9
		end

		slot5(slot6, slot7)

		return target_y
	end

	return current_y
end

slot0.scroll_with_bar = slot1
slot0 = MenuModInfoGui

function slot1(self, y)
	slot2 = alive
	slot4 = self._scroll_bar_panel
	slot2 = slot2(slot3)

	if slot2 then
		slot8 = self.mod_info_panel
		self._scroll_y = math.clamp(slot3, y or 0, self._mod_main_panel.h(0) - self.mod_info_panel.h(self._mod_main_panel))
		slot5 = self._scroll_y

		self.mod_info_panel.set_y(slot3, self.mod_info_panel)

		slot5 = "scroll_up_indicator_arrow"
		local scroll_up_indicator_arrow = self._scroll_bar_panel.child(slot3, self._scroll_bar_panel)
		slot6 = "scroll_down_indicator_arrow"
		local scroll_down_indicator_arrow = self._scroll_bar_panel.child(self._scroll_bar_panel, self._scroll_bar_panel)
		slot7 = "scroll_bar"
		local scroll_bar = self._scroll_bar_panel.child(self._scroll_bar_panel, self._scroll_bar_panel)
		slot8 = scroll_up_indicator_arrow
		local bar_h = scroll_down_indicator_arrow.bottom(self._scroll_bar_panel) - scroll_up_indicator_arrow.top(scroll_down_indicator_arrow)
		slot9 = self.mod_info_panel
		local scroll_diff = self._mod_main_panel.h(scroll_down_indicator_arrow) / self.mod_info_panel.h(self._mod_main_panel)
		slot10 = bar_h * scroll_diff

		scroll_bar.set_h(self._mod_main_panel, scroll_bar)

		slot10 = -self._scroll_y * scroll_diff

		scroll_bar.set_y(self._mod_main_panel, scroll_bar)

		slot10 = self._scroll_y < 0

		self._scroll_up_box.set_visible(self._mod_main_panel, self._scroll_up_box)

		slot13 = self._mod_main_panel
		slot10 = self._mod_main_panel.h(self.mod_info_panel) < self.mod_info_panel.bottom(0)

		self._scroll_down_box.set_visible(self._mod_main_panel, self._scroll_down_box)

		slot10 = self._scroll_y < 0

		scroll_up_indicator_arrow.set_visible(self._mod_main_panel, scroll_up_indicator_arrow)

		slot13 = self._mod_main_panel
		slot10 = self._mod_main_panel.h(self.mod_info_panel) < self.mod_info_panel.bottom(0)

		scroll_down_indicator_arrow.set_visible(self._mod_main_panel, scroll_down_indicator_arrow)

		slot13 = self._mod_main_panel
		slot10 = self._mod_main_panel.h(self.mod_info_panel) < self.mod_info_panel.h(self._mod_main_panel.h(self.mod_info_panel))

		self._scroll_bar_panel.set_visible(self._mod_main_panel, self._scroll_bar_panel)
	end

	return 
end

slot0.set_scroll_indicators = slot1
slot0 = MenuModInfoGui

function slot1(self, item, mouse_over)
	slot3 = MenuModInfoGui
	slot3 = slot3.super
	slot3 = slot3.highlight_item
	slot5 = self
	slot6 = item
	slot7 = mouse_over

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.set_mod_info
	slot6 = item

	slot3(slot4, slot5)

	return 
end

slot0.highlight_item = slot1
slot0 = MenuModInfoGui

function slot1(self, o, x, y)
	slot4 = MenuModInfoGui
	slot4 = slot4.super
	slot4 = slot4.mouse_moved
	slot6 = self
	slot7 = x
	slot8 = y
	local used, icon = slot4(slot5, slot6, slot7)

	if not used then
		slot8 = self
		slot6 = self.moved_scroll_bar
		slot9 = x
		slot10 = y
		slot6, slot7 = slot6(slot7, slot8, slot9)
		icon = slot7
		used = slot6
	end

	slot6 = used
	slot7 = icon

	return slot6, slot7
end

slot0.mouse_moved = slot1
slot0 = MenuModInfoGui

function slot1(self, button, x, y)
	slot4 = MenuModInfoGui
	slot4 = slot4.super
	slot4 = slot4.mouse_pressed
	slot6 = self
	slot7 = button
	slot8 = x
	slot9 = y
	local used = slot4(slot5, slot6, slot7, slot8)

	if not used then
		slot7 = self
		slot5 = self.check_pressed_scroll_bar
		slot8 = button
		slot9 = x
		slot10 = y
		slot5 = slot5(slot6, slot7, slot8, slot9)
		used = slot5
	end

	return used
end

slot0.mouse_pressed = slot1
slot0 = MenuModInfoGui

function slot1(self, button, x, y)
	slot4 = MenuModInfoGui
	slot4 = slot4.super
	slot4 = slot4.mouse_pressed
	slot6 = self
	slot7 = button
	slot8 = x
	slot9 = y

	slot4(slot5, slot6, slot7, slot8)

	slot6 = self
	slot4 = self.release_scroll_bar

	slot4(slot5)

	return 
end

slot0.mouse_released = slot1
slot0 = MenuModInfoGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.menu
	slot3 = slot1
	slot1 = slot1.is_pc_controller
	slot1 = slot1(slot2)

	if slot1 then
		slot3 = self
		slot1 = self.set_scroll_indicators
		slot4 = self._scroll_y

		if slot4 then
			slot4 = self._scroll_y
			slot4 = slot4 - 40
		end

		slot1(slot2, slot3)
	else
		slot3 = self
		slot1 = self.set_scroll_indicators
		slot4 = self._scroll_y

		if slot4 then
			slot4 = self._scroll_y
			slot4 = slot4 + 40
		end

		slot1(slot2, slot3)
	end

	return 
end

slot0.previous_page = slot1
slot0 = MenuModInfoGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.menu
	slot3 = slot1
	slot1 = slot1.is_pc_controller
	slot1 = slot1(slot2)

	if slot1 then
		slot3 = self
		slot1 = self.set_scroll_indicators
		slot4 = self._scroll_y

		if slot4 then
			slot4 = self._scroll_y
			slot4 = slot4 + 40
		end

		slot1(slot2, slot3)
	else
		slot3 = self
		slot1 = self.set_scroll_indicators
		slot4 = self._scroll_y

		if slot4 then
			slot4 = self._scroll_y
			slot4 = slot4 - 40
		end

		slot1(slot2, slot3)
	end

	return 
end

slot0.next_page = slot1
slot0 = MenuModInfoGui

function slot1(self, t, dt)
	slot3 = managers
	slot3 = slot3.menu_component
	slot5 = slot3
	slot3 = slot3.get_right_controller_axis
	local cx, cy = slot3(slot4)

	if cy ~= 0 then
		slot7 = self
		slot5 = self.set_scroll_indicators
		slot8 = self._scroll_y

		if slot8 then
			slot8 = self._scroll_y
			slot9 = cy * 500
			slot9 = slot9 * dt
			slot8 = slot8 + slot9
		end

		slot5(slot6, slot7)
	end

	return 
end

slot0.update = slot1

return 
