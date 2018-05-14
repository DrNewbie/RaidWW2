-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = GreedLootScreenGui

if not slot0 then
	slot0 = class
	slot2 = RaidGuiBase
	slot0 = slot0(slot1)
end

GreedLootScreenGui = slot0
slot0 = GreedLootScreenGui
slot1 = "loot_greed_items"
slot0.CENTRAL_LOOT_IMAGE = slot1
slot0 = GreedLootScreenGui
slot1 = "rewards_extra_loot_frame"
slot0.FRAME_ICON = slot1
slot0 = GreedLootScreenGui
slot1 = "rewards_extra_loot_middle_loot"
slot0.LOOT_ICON = slot1
slot0 = GreedLootScreenGui
slot1 = "rewards_extra_loot_middle_gold"
slot0.GOLD_ICON = slot1
slot0 = GreedLootScreenGui
slot1 = "menu_save_info_loot_title"
slot0.TITLE_STRING = slot1
slot0 = GreedLootScreenGui
slot1 = "loot_meter_parts_l"
slot0.LOOT_BAR_ICON_L = slot1
slot0 = GreedLootScreenGui
slot1 = "loot_meter_parts_m"
slot0.LOOT_BAR_ICON_M = slot1
slot0 = GreedLootScreenGui
slot1 = "loot_meter_parts_r"
slot0.LOOT_BAR_ICON_R = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_dark_grey
slot0.LOOT_BAR_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_gold
slot0.LOOT_BAR_FOREGROUND_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = 3
slot0.REWARD_QUANTITY_FEW = slot1
slot0 = GreedLootScreenGui
slot1 = 10
slot0.REWARD_QUANTITY_MANY = slot1
slot0 = GreedLootScreenGui
slot1 = "gold_bar_single"
slot0.GOLD_ICON_SINGLE = slot1
slot0 = GreedLootScreenGui
slot1 = "gold_bar_3"
slot0.GOLD_ICON_FEW = slot1
slot0 = GreedLootScreenGui
slot1 = "gold_bar_box"
slot0.GOLD_ICON_MANY = slot1
slot0 = GreedLootScreenGui
slot1 = 60
slot0.ICON_HIDDEN_OFFSET = slot1
slot0 = GreedLootScreenGui
slot1 = 32
slot0.COUNTER_H = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.fonts
slot1 = slot1.din_compressed
slot0.COUNTER_FONT = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.font_sizes
slot1 = slot1.size_18
slot0.COUNTER_FONT_SIZE = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_dark_grey
slot0.COUNTER_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = 6
slot0.COUNTER_OFFSET = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_gold
slot0.COUNTER_INCREASE_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = 690
slot0.TITLE_DESCRIPTION_Y = slot1
slot0 = GreedLootScreenGui
slot1 = 50
slot0.TITLE_DESCRIPTION_H = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.font_sizes
slot1 = slot1.size_32
slot0.TITLE_DESCRIPTION_FONT_SIZE = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_white
slot0.TITLE_DESCRIPTION_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = -14
slot0.TITLE_PADDING_TOP = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.font_sizes
slot1 = slot1.size_76
slot0.TITLE_FONT_SIZE = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_red
slot0.TITLE_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = 304
slot0.DESCRIPTION_Y = slot1
slot0 = GreedLootScreenGui
slot1 = 416
slot0.DESCRIPTION_W = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.fonts
slot1 = slot1.lato
slot0.DESCRIPTION_FONT = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.font_sizes
slot1 = slot1.size_20
slot0.DESCRIPTION_FONT_SIZE = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_grey
slot0.DESCRIPTION_COLOR = slot1
slot0 = GreedLootScreenGui
slot1 = 64
slot0.ITEM_TYPE_H = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.font_sizes
slot1 = slot1.size_38
slot0.ITEM_TYPE_FONT_SIZE = slot1
slot0 = GreedLootScreenGui
slot1 = tweak_data
slot1 = slot1.gui
slot1 = slot1.colors
slot1 = slot1.raid_white
slot0.ITEM_TYPE_COLOR = slot1
slot0 = GreedLootScreenGui

function slot1(self, ws, fullscreen_ws, node, component_name)
	slot5 = print
	slot7 = "[GreedLootScreenGui:init()]"

	slot5(slot6)

	slot5 = false
	self._closing = slot5
	slot5 = game_state_machine
	slot7 = slot5
	slot5 = slot5.current_state
	slot5 = slot5(slot6)
	self.current_state = slot5
	slot5 = GreedLootScreenGui
	slot5 = slot5.super
	slot5 = slot5.init
	slot7 = self
	slot8 = ws
	slot9 = fullscreen_ws
	slot10 = node
	slot11 = component_name

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = self._node
	slot5 = slot5.components
	slot5 = slot5.raid_menu_header
	slot7 = slot5
	slot5 = slot5.set_screen_name
	slot8 = "menu_greed_loot_title"

	slot5(slot6, slot7)

	slot5 = managers
	slot5 = slot5.raid_menu
	slot7 = slot5
	slot5 = slot5.register_on_escape_callback
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "on_escape"

	slot5(slot6, slot8(slot9, slot10, slot11))

	slot5 = managers
	slot5 = slot5.greed
	slot7 = slot5
	slot5 = slot5.cache
	slot5, slot6 = slot5(slot6)
	self._greed_counter_in_mission = slot6
	self._greed_counter_before_mission = slot5
	slot7 = self
	slot5 = self._set_progress
	slot8 = self._greed_counter_before_mission

	slot5(slot6, slot7)

	return 
end

slot0.init = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = GreedLootScreenGui
	slot1 = slot1.super
	slot1 = slot1._layout
	slot3 = self

	slot1(slot2)

	slot3 = self
	slot1 = self._create_fullscreen_panel

	slot1(slot2)

	slot3 = self
	slot1 = self._create_flares

	slot1(slot2)

	slot3 = self
	slot1 = self._create_loot_image

	slot1(slot2)

	slot3 = self
	slot1 = self._create_greed_bar

	slot1(slot2)

	slot3 = self
	slot1 = self._create_second_panel

	slot1(slot2)

	slot3 = self
	slot1 = self._create_gold_bar_image

	slot1(slot2)

	slot3 = self
	slot1 = self._create_description_panel

	slot1(slot2)

	slot3 = self
	slot1 = self.bind_controller_inputs

	slot1(slot2)

	slot1 = self._loot_image
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._loot_image
	slot3 = slot1
	slot1 = slot1.animate
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "_animate_giving_points"

	slot1(slot2, slot4(slot5, slot6, slot7))

	return 
end

slot0._layout = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = Overlay
	slot3 = slot1
	slot1 = slot1.gui
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.create_screen_workspace
	slot1 = slot1(slot2)
	self._full_workspace = slot1
	slot1 = self._full_workspace
	slot3 = slot1
	slot1 = slot1.panel
	slot1 = slot1(slot2)
	self._fullscreen_panel = slot1

	return 
end

slot0._create_fullscreen_panel = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local flare_panel_params = {
		layer = 1,
		name = "loot_screen_flare_panel"
	}
	slot2 = self._fullscreen_panel
	slot4 = slot2
	slot2 = slot2.panel
	slot5 = flare_panel_params
	slot2 = slot2(slot3, slot4)
	self._flare_panel = slot2
	slot2 = self._flare_panel
	slot4 = slot2
	slot2 = slot2.w
	slot2 = slot2(slot3)
	slot2 = slot2 / 2
	local flare_center_x = slot2 + 200
	slot3 = self._flare_panel
	slot5 = slot3
	slot3 = slot3.h
	slot3 = slot3(slot4)
	local flare_center_y = slot3 / 2
	local lens_glint_params = {
		blend_mode = "add",
		name = "loot_screen_glint",
		alpha = 0
	}
	slot5 = tweak_data
	slot5 = slot5.gui
	slot5 = slot5.icons
	slot5 = slot5.lens_glint
	slot5 = slot5.texture
	lens_glint_params.texture = slot5
	slot5 = tweak_data
	slot5 = slot5.gui
	slot5 = slot5.icons
	slot5 = slot5.lens_glint
	slot5 = slot5.texture_rect
	lens_glint_params.texture_rect = slot5
	slot5 = self._flare_panel
	slot7 = slot5
	slot5 = slot5.bitmap
	slot8 = lens_glint_params
	slot5 = slot5(slot6, slot7)
	self._lens_glint = slot5
	slot5 = self._lens_glint
	slot7 = slot5
	slot5 = slot5.set_center
	slot8 = flare_center_x
	slot9 = flare_center_y

	slot5(slot6, slot7, slot8)

	local lens_iris_params = {
		blend_mode = "add",
		name = "loot_screen_iris",
		alpha = 0
	}
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.icons
	slot6 = slot6.lens_iris
	slot6 = slot6.texture
	lens_iris_params.texture = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.icons
	slot6 = slot6.lens_iris
	slot6 = slot6.texture_rect
	lens_iris_params.texture_rect = slot6
	slot6 = self._flare_panel
	slot8 = slot6
	slot6 = slot6.bitmap
	slot9 = lens_iris_params
	slot6 = slot6(slot7, slot8)
	self._lens_iris = slot6
	slot6 = self._lens_iris
	slot8 = slot6
	slot6 = slot6.set_center
	slot9 = flare_center_x
	slot10 = flare_center_y

	slot6(slot7, slot8, slot9)

	local lens_orbs_params = {
		blend_mode = "add",
		name = "loot_screen_orbs",
		alpha = 0
	}
	slot7 = tweak_data
	slot7 = slot7.gui
	slot7 = slot7.icons
	slot7 = slot7.lens_orbs
	slot7 = slot7.texture
	lens_orbs_params.texture = slot7
	slot7 = tweak_data
	slot7 = slot7.gui
	slot7 = slot7.icons
	slot7 = slot7.lens_orbs
	slot7 = slot7.texture_rect
	lens_orbs_params.texture_rect = slot7
	slot7 = self._flare_panel
	slot9 = slot7
	slot7 = slot7.bitmap
	slot10 = lens_orbs_params
	slot7 = slot7(slot8, slot9)
	self._lens_orbs = slot7
	slot7 = self._lens_orbs
	slot9 = slot7
	slot7 = slot7.set_center
	slot10 = flare_center_x
	slot11 = flare_center_y

	slot7(slot8, slot9, slot10)

	local lens_shimmer_params = {
		blend_mode = "add",
		name = "loot_screen_shimmer",
		alpha = 0
	}
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.icons
	slot8 = slot8.lens_shimmer
	slot8 = slot8.texture
	lens_shimmer_params.texture = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.icons
	slot8 = slot8.lens_shimmer
	slot8 = slot8.texture_rect
	lens_shimmer_params.texture_rect = slot8
	slot8 = self._flare_panel
	slot10 = slot8
	slot8 = slot8.bitmap
	slot11 = lens_shimmer_params
	slot8 = slot8(slot9, slot10)
	self._lens_shimmer = slot8
	slot8 = self._lens_shimmer
	slot10 = slot8
	slot8 = slot8.set_center
	slot11 = flare_center_x
	slot12 = flare_center_y

	slot8(slot9, slot10, slot11)

	local lens_spike_ball_params = {
		blend_mode = "add",
		name = "loot_screen_spike_ball",
		alpha = 0
	}
	slot9 = tweak_data
	slot9 = slot9.gui
	slot9 = slot9.icons
	slot9 = slot9.lens_spike_ball
	slot9 = slot9.texture
	lens_spike_ball_params.texture = slot9
	slot9 = tweak_data
	slot9 = slot9.gui
	slot9 = slot9.icons
	slot9 = slot9.lens_spike_ball
	slot9 = slot9.texture_rect
	lens_spike_ball_params.texture_rect = slot9
	slot9 = self._flare_panel
	slot11 = slot9
	slot9 = slot9.bitmap
	slot12 = lens_spike_ball_params
	slot9 = slot9(slot10, slot11)
	self._lens_spike_ball = slot9
	slot9 = self._lens_spike_ball
	slot11 = slot9
	slot9 = slot9.set_center
	slot12 = flare_center_x
	slot13 = flare_center_y

	slot9(slot10, slot11, slot12)

	return 
end

slot0._create_flares = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local loot_image_params = {
		name = "loot_image",
		layer = 15
	}
	slot2 = tweak_data
	slot2 = slot2.gui
	slot2 = slot2.icons
	slot3 = GreedLootScreenGui
	slot3 = slot3.CENTRAL_LOOT_IMAGE
	slot2 = slot2[slot3]
	slot2 = slot2.texture
	loot_image_params.texture = slot2
	slot2 = tweak_data
	slot2 = slot2.gui
	slot2 = slot2.icons
	slot3 = GreedLootScreenGui
	slot3 = slot3.CENTRAL_LOOT_IMAGE
	slot2 = slot2[slot3]
	slot2 = slot2.texture_rect
	loot_image_params.texture_rect = slot2
	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.bitmap
	slot5 = loot_image_params
	slot2 = slot2(slot3, slot4)
	self._loot_image = slot2
	slot2 = self._loot_image
	slot4 = slot2
	slot2 = slot2.set_center_x
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.w
	slot5 = slot5(slot6)
	slot5 = slot5 / 2
	slot5 = slot5 + 26

	slot2(slot3, slot4)

	slot2 = self._loot_image
	slot4 = slot2
	slot2 = slot2.set_center_y
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.h
	slot5 = slot5(slot6)
	slot5 = slot5 / 2

	slot2(slot3, slot4)

	return 
end

slot0._create_loot_image = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local greed_bar_panel_params = {
		halign = "center",
		name = "greed_bar_panel",
		h = 160,
		y = 32,
		w = 642,
		valign = "top"
	}
	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.panel
	slot5 = greed_bar_panel_params
	slot2 = slot2(slot3, slot4)
	self._greed_bar_panel = slot2
	slot2 = self._greed_bar_panel
	slot4 = slot2
	slot2 = slot2.set_center_x
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.w
	slot5 = slot5(slot6)
	slot5 = slot5 / 2

	slot2(slot3, slot4)

	local frame_params = {
		name = "frame"
	}
	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.icons
	slot4 = GreedLootScreenGui
	slot4 = slot4.FRAME_ICON
	slot3 = slot3[slot4]
	slot3 = slot3.texture
	frame_params.texture = slot3
	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.icons
	slot4 = GreedLootScreenGui
	slot4 = slot4.FRAME_ICON
	slot3 = slot3[slot4]
	slot3 = slot3.texture_rect
	frame_params.texture_rect = slot3
	slot3 = self._greed_bar_panel
	slot5 = slot3
	slot3 = slot3.bitmap
	slot6 = frame_params
	slot3 = slot3(slot4, slot5)
	self._frame = slot3
	slot3 = self._frame
	slot5 = slot3
	slot3 = slot3.set_center_x
	slot6 = self._greed_bar_panel
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 / 2

	slot3(slot4, slot5)

	slot3 = self._frame
	slot5 = slot3
	slot3 = slot3.set_center_y
	slot6 = self._greed_bar_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot6 = slot6 / 2

	slot3(slot4, slot5)

	local loot_icon_params = {
		name = "loot_icon"
	}
	slot4 = tweak_data
	slot4 = slot4.gui
	slot4 = slot4.icons
	slot5 = GreedLootScreenGui
	slot5 = slot5.LOOT_ICON
	slot4 = slot4[slot5]
	slot4 = slot4.texture
	loot_icon_params.texture = slot4
	slot4 = tweak_data
	slot4 = slot4.gui
	slot4 = slot4.icons
	slot5 = GreedLootScreenGui
	slot5 = slot5.LOOT_ICON
	slot4 = slot4[slot5]
	slot4 = slot4.texture_rect
	loot_icon_params.texture_rect = slot4
	slot4 = self._greed_bar_panel
	slot6 = slot4
	slot4 = slot4.bitmap
	slot7 = loot_icon_params
	slot4 = slot4(slot5, slot6)
	self._loot_icon = slot4
	slot4 = self._loot_icon
	slot6 = slot4
	slot4 = slot4.set_center_x
	slot7 = self._greed_bar_panel
	slot9 = slot7
	slot7 = slot7.w
	slot7 = slot7(slot8)
	slot7 = slot7 / 2

	slot4(slot5, slot6)

	slot4 = self._loot_icon
	slot6 = slot4
	slot4 = slot4.set_center_y
	slot7 = self._greed_bar_panel
	slot9 = slot7
	slot7 = slot7.h
	slot7 = slot7(slot8)
	slot7 = slot7 / 2

	slot4(slot5, slot6)

	local gold_icon_params = {
		name = "gold_icon",
		alpha = 0
	}
	slot5 = tweak_data
	slot5 = slot5.gui
	slot5 = slot5.icons
	slot6 = GreedLootScreenGui
	slot6 = slot6.GOLD_ICON
	slot5 = slot5[slot6]
	slot5 = slot5.texture
	gold_icon_params.texture = slot5
	slot5 = tweak_data
	slot5 = slot5.gui
	slot5 = slot5.icons
	slot6 = GreedLootScreenGui
	slot6 = slot6.GOLD_ICON
	slot5 = slot5[slot6]
	slot5 = slot5.texture_rect
	gold_icon_params.texture_rect = slot5
	slot5 = tweak_data
	slot5 = slot5.gui
	slot5 = slot5.colors
	slot5 = slot5.raid_gold
	gold_icon_params.color = slot5
	slot5 = self._greed_bar_panel
	slot7 = slot5
	slot5 = slot5.bitmap
	slot8 = gold_icon_params
	slot5 = slot5(slot6, slot7)
	self._gold_icon = slot5
	slot5 = self._gold_icon
	slot7 = slot5
	slot5 = slot5.set_center_x
	slot8 = self._greed_bar_panel
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	slot8 = slot8 / 2

	slot5(slot6, slot7)

	slot5 = self._gold_icon
	slot7 = slot5
	slot5 = slot5.set_center_y
	slot8 = self._greed_bar_panel
	slot10 = slot8
	slot8 = slot8.h
	slot8 = slot8(slot9)
	slot8 = slot8 / 2

	slot5(slot6, slot7)

	local loot_title_params = {
		name = "loot_title",
		vertical = "center",
		h = 64,
		align = "center",
		halign = "left",
		valign = "center"
	}
	slot6 = tweak_data
	slot6 = slot6.gui
	slot8 = slot6
	slot6 = slot6.get_font_path
	slot9 = tweak_data
	slot9 = slot9.gui
	slot9 = slot9.fonts
	slot9 = slot9.din_compressed
	slot10 = tweak_data
	slot10 = slot10.gui
	slot10 = slot10.font_sizes
	slot10 = slot10.size_56
	slot6 = slot6(slot7, slot8, slot9)
	loot_title_params.font = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.font_sizes
	slot6 = slot6.size_56
	loot_title_params.font_size = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.colors
	slot6 = slot6.raid_dirty_white
	loot_title_params.color = slot6
	slot6 = utf8
	slot6 = slot6.to_upper
	slot8 = managers
	slot8 = slot8.localization
	slot10 = slot8
	slot8 = slot8.text
	slot11 = GreedLootScreenGui
	slot11 = slot11.TITLE_STRING
	slot6 = slot6(slot8(slot9, slot10))
	loot_title_params.text = slot6
	slot6 = self._greed_bar_panel
	slot8 = slot6
	slot6 = slot6.text
	slot9 = loot_title_params
	slot6 = slot6(slot7, slot8)
	self._title = slot6
	slot6 = self._title
	slot8 = slot6
	slot6 = slot6.set_center_x
	slot9 = self._greed_bar_panel
	slot11 = slot9
	slot9 = slot9.w
	slot9 = slot9(slot10)
	slot9 = slot9 * 3
	slot9 = slot9 / 4

	slot6(slot7, slot8)

	slot6 = self._title
	slot8 = slot6
	slot6 = slot6.set_center_y
	slot9 = self._greed_bar_panel
	slot11 = slot9
	slot9 = slot9.h
	slot9 = slot9(slot10)
	slot9 = slot9 / 2
	slot9 = slot9 - 16

	slot6(slot7, slot8)

	local progress_bar_background_params = {
		name = "greed_loot_menu_progress_bar_background",
		layer = 1,
		w = 160
	}
	slot7 = GreedLootScreenGui
	slot7 = slot7.LOOT_BAR_ICON_L
	progress_bar_background_params.left = slot7
	slot7 = GreedLootScreenGui
	slot7 = slot7.LOOT_BAR_ICON_M
	progress_bar_background_params.center = slot7
	slot7 = GreedLootScreenGui
	slot7 = slot7.LOOT_BAR_ICON_R
	progress_bar_background_params.right = slot7
	slot7 = GreedLootScreenGui
	slot7 = slot7.LOOT_BAR_COLOR
	progress_bar_background_params.color = slot7
	slot7 = self._greed_bar_panel
	slot9 = slot7
	slot7 = slot7.three_cut_bitmap
	slot10 = progress_bar_background_params
	slot7 = slot7(slot8, slot9)
	self._progress_bar_background = slot7
	slot7 = self._progress_bar_background
	slot9 = slot7
	slot7 = slot7.set_center_x
	slot10 = self._greed_bar_panel
	slot12 = slot10
	slot10 = slot10.w
	slot10 = slot10(slot11)
	slot10 = slot10 * 3
	slot10 = slot10 / 4

	slot7(slot8, slot9)

	slot7 = self._progress_bar_background
	slot9 = slot7
	slot7 = slot7.set_center_y
	slot10 = self._greed_bar_panel
	slot12 = slot10
	slot10 = slot10.h
	slot10 = slot10(slot11)
	slot10 = slot10 / 2
	slot10 = slot10 + 32

	slot7(slot8, slot9)

	local progress_bar_progress_panel_params = {
		name = "progress_bar_progress_panel"
	}
	slot8 = self._progress_bar_background
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	progress_bar_progress_panel_params.w = slot8
	slot8 = self._progress_bar_background
	slot10 = slot8
	slot8 = slot8.h
	slot8 = slot8(slot9)
	progress_bar_progress_panel_params.h = slot8
	slot8 = self._progress_bar_background
	slot10 = slot8
	slot8 = slot8.layer
	slot8 = slot8(slot9)
	slot8 = slot8 + 1
	progress_bar_progress_panel_params.layer = slot8
	slot8 = self._greed_bar_panel
	slot10 = slot8
	slot8 = slot8.panel
	slot11 = progress_bar_progress_panel_params
	slot8 = slot8(slot9, slot10)
	self._progress_bar_progress_panel = slot8
	slot8 = self._progress_bar_progress_panel
	slot10 = slot8
	slot8 = slot8.set_x
	slot11 = self._progress_bar_background
	slot13 = slot11
	slot11 = slot11.x

	slot8(slot9, slot11(slot12))

	slot8 = self._progress_bar_progress_panel
	slot10 = slot8
	slot8 = slot8.set_center_y
	slot11 = self._progress_bar_background
	slot13 = slot11
	slot11 = slot11.center_y

	slot8(slot9, slot11(slot12))

	local progress_bar_foreground_params = {
		name = "loot_bar_foreground",
		alpha = 0
	}
	slot9 = self._progress_bar_background
	slot11 = slot9
	slot9 = slot9.w
	slot9 = slot9(slot10)
	progress_bar_foreground_params.w = slot9
	slot9 = GreedLootScreenGui
	slot9 = slot9.LOOT_BAR_ICON_L
	progress_bar_foreground_params.left = slot9
	slot9 = GreedLootScreenGui
	slot9 = slot9.LOOT_BAR_ICON_M
	progress_bar_foreground_params.center = slot9
	slot9 = GreedLootScreenGui
	slot9 = slot9.LOOT_BAR_ICON_R
	progress_bar_foreground_params.right = slot9
	slot9 = GreedLootScreenGui
	slot9 = slot9.LOOT_BAR_FOREGROUND_COLOR
	progress_bar_foreground_params.color = slot9
	slot9 = self._progress_bar_progress_panel
	slot11 = slot9
	slot9 = slot9.three_cut_bitmap
	slot12 = progress_bar_foreground_params
	slot9 = slot9(slot10, slot11)
	self._loot_bar_foreground = slot9
	local counter_params = {
		name = "greed_bar_counter",
		vertical = "center",
		align = "left",
		text = "0"
	}
	slot10 = self._progress_bar_progress_panel
	slot12 = slot10
	slot10 = slot10.right
	slot10 = slot10(slot11)
	slot10 = slot10 + 10
	counter_params.x = slot10
	slot10 = GreedLootScreenGui
	slot10 = slot10.COUNTER_H
	counter_params.h = slot10
	slot10 = GreedLootScreenGui
	slot10 = slot10.COUNTER_FONT
	counter_params.font = slot10
	slot10 = GreedLootScreenGui
	slot10 = slot10.COUNTER_FONT_SIZE
	counter_params.font_size = slot10
	slot10 = GreedLootScreenGui
	slot10 = slot10.COUNTER_COLOR
	counter_params.color = slot10
	slot10 = self._greed_bar_panel
	slot12 = slot10
	slot10 = slot10.text
	slot13 = counter_params
	slot10 = slot10(slot11, slot12)
	self._counter = slot10
	slot10 = self._counter
	slot12 = slot10
	slot10 = slot10.set_center_y
	slot13 = self._progress_bar_background
	slot15 = slot13
	slot13 = slot13.center_y

	slot10(slot11, slot13(slot14))

	return 
end

slot0._create_greed_bar = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local second_panel_params = {
		name = "second_panel"
	}
	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.panel
	slot5 = second_panel_params
	slot2 = slot2(slot3, slot4)
	self._second_panel = slot2

	return 
end

slot0._create_second_panel = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local gold_bar_image_params = {
		name = "central_gold_bar_image",
		alpha = 0
	}
	slot2 = tweak_data
	slot2 = slot2.gui
	slot2 = slot2.icons
	slot3 = GreedLootScreenGui
	slot3 = slot3.GOLD_ICON_SINGLE
	slot2 = slot2[slot3]
	slot2 = slot2.texture
	gold_bar_image_params.texture = slot2
	slot2 = tweak_data
	slot2 = slot2.gui
	slot2 = slot2.icons
	slot3 = GreedLootScreenGui
	slot3 = slot3.GOLD_ICON_SINGLE
	slot2 = slot2[slot3]
	slot2 = slot2.texture_rect
	gold_bar_image_params.texture_rect = slot2
	slot2 = self._second_panel
	slot4 = slot2
	slot2 = slot2.bitmap
	slot5 = gold_bar_image_params
	slot2 = slot2(slot3, slot4)
	self._central_gold_bar_image = slot2
	slot2 = self._central_gold_bar_image
	slot4 = slot2
	slot2 = slot2.set_center_x
	slot5 = self._second_panel
	slot7 = slot5
	slot5 = slot5.w
	slot5 = slot5(slot6)
	slot5 = slot5 / 2

	slot2(slot3, slot4)

	slot2 = self._central_gold_bar_image
	slot4 = slot2
	slot2 = slot2.set_center_y
	slot5 = self._second_panel
	slot7 = slot5
	slot5 = slot5.h
	slot5 = slot5(slot6)
	slot5 = slot5 / 2
	slot5 = slot5 - 80

	slot2(slot3, slot4)

	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left"
	}
	slot3 = GreedLootScreenGui
	slot3 = slot3.TITLE_DESCRIPTION_Y
	title_description_params.y = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.TITLE_DESCRIPTION_H
	title_description_params.h = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.COUNTER_FONT
	title_description_params.font = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.TITLE_DESCRIPTION_FONT_SIZE
	title_description_params.font_size = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.TITLE_DESCRIPTION_COLOR
	title_description_params.color = slot3
	slot5 = self
	slot3 = self.translate
	slot6 = "menu_loot_screen_bracket_unlocked_title"
	slot7 = true
	slot3 = slot3(slot4, slot5, slot6)
	title_description_params.text = slot3
	slot3 = self._second_panel
	slot5 = slot3
	slot3 = slot3.text
	slot6 = title_description_params
	slot3 = slot3(slot4, slot5)
	self._title_description = slot3
	slot3 = self._title_description
	slot5 = slot3
	slot3 = slot3.text_rect
	local _, _, w, _ = slot3(slot4)
	slot7 = self._title_description
	slot9 = slot7
	slot7 = slot7.set_w
	slot10 = w

	slot7(slot8, slot9)

	local title_params = {
		vertical = "top",
		name = "gold_bars_name",
		alpha = 0,
		align = "center",
		text = "GOLD BAR"
	}
	slot8 = self._title_description
	slot10 = slot8
	slot8 = slot8.y
	slot8 = slot8(slot9)
	slot9 = self._title_description
	slot11 = slot9
	slot9 = slot9.h
	slot9 = slot9(slot10)
	slot8 = slot8 + slot9
	slot9 = GreedLootScreenGui
	slot9 = slot9.TITLE_PADDING_TOP
	slot8 = slot8 + slot9
	title_params.y = slot8
	slot8 = GreedLootScreenGui
	slot8 = slot8.COUNTER_FONT
	title_params.font = slot8
	slot8 = GreedLootScreenGui
	slot8 = slot8.TITLE_FONT_SIZE
	title_params.font_size = slot8
	slot8 = GreedLootScreenGui
	slot8 = slot8.TITLE_COLOR
	title_params.color = slot8
	slot8 = self._second_panel
	slot10 = slot8
	slot8 = slot8.text
	slot11 = title_params
	slot8 = slot8(slot9, slot10)
	self._gold_bar_value = slot8
	slot10 = self
	slot8 = self._layout_gold_bar_value_text

	slot8(slot9)

	return 
end

slot0._create_gold_bar_image = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local description_panel_params = {
		alpha = 0,
		name = "description_panel",
		halign = "right",
		w = 416,
		valign = "scale"
	}
	slot2 = self._second_panel
	slot4 = slot2
	slot2 = slot2.h
	slot2 = slot2(slot3)
	description_panel_params.h = slot2
	slot2 = self._second_panel
	slot4 = slot2
	slot2 = slot2.panel
	slot5 = description_panel_params
	slot2 = slot2(slot3, slot4)
	self._description_panel = slot2
	slot2 = self._description_panel
	slot4 = slot2
	slot2 = slot2.set_right
	slot5 = self._second_panel
	slot7 = slot5
	slot5 = slot5.w

	slot2(slot3, slot5(slot6))

	local item_type_params = {
		name = "item_type",
		vertical = "center",
		align = "left",
		halign = "left",
		valign = "center"
	}
	slot3 = GreedLootScreenGui
	slot3 = slot3.ITEM_TYPE_H
	item_type_params.h = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.COUNTER_FONT
	item_type_params.font = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.ITEM_TYPE_FONT_SIZE
	item_type_params.font_size = slot3
	slot3 = GreedLootScreenGui
	slot3 = slot3.ITEM_TYPE_COLOR
	item_type_params.color = slot3
	slot5 = self
	slot3 = self.translate
	slot6 = "menu_loot_screen_gold_bars_type"
	slot7 = true
	slot3 = slot3(slot4, slot5, slot6)
	item_type_params.text = slot3
	slot3 = self._description_panel
	slot5 = slot3
	slot3 = slot3.text
	slot6 = item_type_params
	local item_type = slot3(slot4, slot5)
	local item_type_description_params = {
		name = "item_type_description",
		vertical = "top",
		wrap = true,
		align = "left",
		halign = "left",
		valign = "center"
	}
	slot5 = GreedLootScreenGui
	slot5 = slot5.DESCRIPTION_FONT
	item_type_description_params.font = slot5
	slot5 = GreedLootScreenGui
	slot5 = slot5.DESCRIPTION_FONT_SIZE
	item_type_description_params.font_size = slot5
	slot5 = GreedLootScreenGui
	slot5 = slot5.DESCRIPTION_COLOR
	item_type_description_params.color = slot5
	slot7 = self
	slot5 = self.translate
	slot8 = "menu_loot_screen_gold_bars_description"
	slot9 = false
	slot5 = slot5(slot6, slot7, slot8)
	item_type_description_params.text = slot5
	slot5 = self._description_panel
	slot7 = slot5
	slot5 = slot5.text
	slot8 = item_type_description_params
	local item_type_description = slot5(slot6, slot7)
	slot8 = item_type_description
	slot6 = item_type_description.text_rect
	local _, _, _, h = slot6(slot7)
	slot12 = item_type_description
	slot10 = item_type_description.set_h
	slot13 = h

	slot10(slot11, slot12)

	slot12 = item_type_description
	slot10 = item_type_description.set_bottom
	slot13 = self._description_panel
	slot15 = slot13
	slot13 = slot13.h
	slot13 = slot13(slot14)
	slot13 = slot13 / 2
	slot13 = slot13 - 54

	slot10(slot11, slot12)

	slot12 = item_type
	slot10 = item_type.set_bottom
	slot15 = item_type_description
	slot13 = item_type_description.y
	slot13 = slot13(slot14)
	slot13 = slot13 - 14

	slot10(slot11, slot12)

	local greed_bar_params = {
		y = 464
	}
	slot11 = HUDTabGreedBar
	slot13 = slot11
	slot11 = slot11.new
	slot14 = self._description_panel
	slot15 = greed_bar_params
	slot11 = slot11(slot12, slot13, slot14)
	self._second_panel_greed_bar = slot11
	local greed_description_params = {
		name = "greed_description_params",
		vertical = "top",
		wrap = true,
		align = "left",
		halign = "left",
		valign = "center"
	}
	slot12 = GreedLootScreenGui
	slot12 = slot12.DESCRIPTION_FONT
	greed_description_params.font = slot12
	slot12 = GreedLootScreenGui
	slot12 = slot12.DESCRIPTION_FONT_SIZE
	greed_description_params.font_size = slot12
	slot12 = GreedLootScreenGui
	slot12 = slot12.DESCRIPTION_COLOR
	greed_description_params.color = slot12
	slot14 = self
	slot12 = self.translate
	slot15 = "menu_greed_description"
	slot16 = false
	slot12 = slot12(slot13, slot14, slot15)
	greed_description_params.text = slot12
	slot12 = self._description_panel
	slot14 = slot12
	slot12 = slot12.text
	slot15 = greed_description_params
	local greed_description = slot12(slot13, slot14)
	slot15 = greed_description
	slot13 = greed_description.text_rect
	local _, _, _, h = slot13(slot14)
	slot19 = greed_description
	slot17 = greed_description.set_h
	slot20 = h

	slot17(slot18, slot19)

	slot19 = greed_description
	slot17 = greed_description.set_y
	slot20 = self._second_panel_greed_bar
	slot20 = slot20._object
	slot22 = slot20
	slot20 = slot20.bottom

	slot17(slot18, slot20(slot21))

	return 
end

slot0._create_description_panel = slot1
slot0 = GreedLootScreenGui

function slot1(self, points)
	self._current_points = points
	slot2 = self._current_points
	slot3 = managers
	slot3 = slot3.greed
	slot5 = slot3
	slot3 = slot3.loot_needed_for_gold_bar
	slot3 = slot3(slot4)
	slot2 = slot2 % slot3
	slot3 = managers
	slot3 = slot3.greed
	slot5 = slot3
	slot3 = slot3.loot_needed_for_gold_bar
	slot3 = slot3(slot4)
	local current_percentage = slot2 / slot3
	slot3 = self._progress_bar_progress_panel
	slot5 = slot3
	slot3 = slot3.set_w
	slot6 = self._progress_bar_background
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 * current_percentage

	slot3(slot4, slot5)

	slot3 = self._loot_bar_foreground
	slot5 = slot3
	slot3 = slot3.set_alpha
	slot6 = 1

	slot3(slot4, slot5)

	slot3 = self._second_panel_greed_bar
	slot5 = slot3
	slot3 = slot3.set_progress
	slot6 = current_percentage

	slot3(slot4, slot5)

	return current_percentage
end

slot0._set_progress = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = self._gold_bar_value
	slot3 = slot1
	slot1 = slot1.text_rect
	local _, _, w, _ = slot1(slot2)
	slot5 = self._gold_bar_value
	slot7 = slot5
	slot5 = slot5.set_w
	slot8 = w

	slot5(slot6, slot7)

	slot5 = self._gold_bar_value
	slot7 = slot5
	slot5 = slot5.set_center_x
	slot8 = self._second_panel
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	slot8 = slot8 / 2

	slot5(slot6, slot7)

	slot5 = self._title_description
	slot7 = slot5
	slot5 = slot5.set_x
	slot8 = self._gold_bar_value
	slot10 = slot8
	slot8 = slot8.x

	slot5(slot6, slot8(slot9))

	return 
end

slot0._layout_gold_bar_value_text = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local t = 0
	local duration = 2
	slot3 = 0
	self._gold_bars_added = slot3
	local sound_on_point_value = {}

	while t < duration do
		slot4 = coroutine
		slot4 = slot4.yield
		local dt = slot4()
		t = t + dt
		slot5 = Easing
		slot5 = slot5.quintic_in_out
		slot7 = t
		slot8 = self._greed_counter_before_mission
		slot9 = self._greed_counter_in_mission
		slot10 = duration
		local current_progress = slot5(slot6, slot7, slot8, slot9)
		slot6 = math
		slot6 = slot6.floor
		slot8 = self._greed_counter_before_mission
		slot8 = current_progress - slot8
		slot6 = slot6(slot7)
		slot6 = slot6 % 4

		if slot6 == 0 then
			slot6 = math
			slot6 = slot6.floor
			slot8 = self._greed_counter_before_mission
			slot8 = current_progress - slot8
			slot6 = slot6(slot7)
			slot6 = sound_on_point_value[slot6]

			if not slot6 then
				slot6 = managers
				slot6 = slot6.menu_component
				slot8 = slot6
				slot6 = slot6.post_event
				slot9 = "one_number_one_click"

				slot6(slot7, slot8)

				slot6 = math
				slot6 = slot6.floor
				slot8 = self._greed_counter_before_mission
				slot8 = current_progress - slot8
				slot6 = slot6(slot7)
				slot7 = true
				sound_on_point_value[slot6] = slot7
			end
		end

		slot8 = self
		slot6 = self._set_progress
		slot9 = current_progress
		local percentage = slot6(slot7, slot8)
		slot7 = self._last_percentage

		if slot7 then
			slot7 = self._last_percentage

			if percentage < slot7 then
				slot9 = self
				slot7 = self._add_gold_bar

				slot7(slot8)
			end
		end

		self._last_percentage = percentage
	end

	slot4 = wait
	slot6 = 1

	slot4(slot5)

	slot4 = self._title
	slot6 = slot4
	slot4 = slot4.stop

	slot4(slot5)

	slot4 = self._title
	slot6 = slot4
	slot4 = slot4.animate
	slot7 = callback
	slot9 = self
	slot10 = self
	slot11 = "_animate_central_image_hide"

	slot4(slot5, slot7(slot8, slot9, slot10))

	slot4 = managers
	slot4 = slot4.menu_component
	slot6 = slot4
	slot4 = slot4.post_event
	slot7 = "generic_loot_reward_sound"

	slot4(slot5, slot6)

	slot4 = self._lens_iris
	slot6 = slot4
	slot4 = slot4.stop

	slot4(slot5)

	slot4 = self._lens_iris
	slot6 = slot4
	slot4 = slot4.animate
	slot7 = callback
	slot9 = self
	slot10 = self
	slot11 = "_animate_hide_lens_flares"

	slot4(slot5, slot7(slot8, slot9, slot10))

	slot4 = self._central_gold_bar_image
	slot6 = slot4
	slot4 = slot4.stop

	slot4(slot5)

	slot4 = self._central_gold_bar_image
	slot6 = slot4
	slot4 = slot4.animate
	slot7 = callback
	slot9 = self
	slot10 = self
	slot11 = "_animate_second_panel"

	slot4(slot5, slot7(slot8, slot9, slot10))

	return 
end

slot0._animate_giving_points = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = self._gold_bars_added
	slot1 = slot1 + 1
	self._gold_bars_added = slot1
	slot1 = self._animating_lens_flare

	if not slot1 then
		slot1 = self._lens_glint
		slot3 = slot1
		slot1 = slot1.stop

		slot1(slot2)

		slot1 = self._lens_glint
		slot3 = slot1
		slot1 = slot1.animate
		slot4 = callback
		slot6 = self
		slot7 = self
		slot8 = "_animate_lens_flares"

		slot1(slot2, slot4(slot5, slot6, slot7))

		slot1 = true
		self._animating_lens_flare = slot1
		slot1 = self._loot_icon
		slot3 = slot1
		slot1 = slot1.stop

		slot1(slot2)

		slot1 = self._loot_icon
		slot3 = slot1
		slot1 = slot1.animate
		slot4 = callback
		slot6 = self
		slot7 = self
		slot8 = "_animate_change_icon"

		slot1(slot2, slot4(slot5, slot6, slot7))
	end

	slot1 = self._counter
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._counter
	slot3 = slot1
	slot1 = slot1.animate
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "_animate_counter_add_gold_bar"

	slot1(slot2, slot4(slot5, slot6, slot7))

	slot1 = managers
	slot1 = slot1.menu_component
	slot3 = slot1
	slot1 = slot1.post_event
	slot4 = "greed_item_picked_up"

	slot1(slot2, slot3)

	slot1 = self._gold_icon
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._gold_icon
	slot3 = slot1
	slot1 = slot1.animate
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "_animate_pulse"

	slot1(slot2, slot4(slot5, slot6, slot7))

	local text = ""
	slot2 = self._gold_bars_added

	if slot2 == 1 then
		slot4 = self
		slot2 = self.translate
		slot5 = "menu_loot_screen_gold_bars_single"
		slot6 = true
		slot2 = slot2(slot3, slot4, slot5)
		text = slot2
	else
		slot8 = true
		text = (self._gold_bars_added or 0) .. " " .. self.translate(slot5, self, "menu_loot_screen_gold_bars")
	end

	slot2 = self._gold_bar_value
	slot4 = slot2
	slot2 = slot2.set_text
	slot5 = text

	slot2(slot3, slot4)

	slot4 = self
	slot2 = self._layout_gold_bar_value_text

	slot2(slot3)

	return 
end

slot0._add_gold_bar = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local fade_in_duration = 1.1
	local t = 0
	slot3 = self._lens_glint
	slot5 = slot3
	slot3 = slot3.w
	local icon_w = slot3(slot4)
	slot4 = self._lens_glint
	slot6 = slot4
	slot4 = slot4.h
	local icon_h = slot4(slot5)

	while t < fade_in_duration do
		slot5 = coroutine
		slot5 = slot5.yield
		local dt = slot5()
		t = t + dt
		slot6 = Easing
		slot6 = slot6.quartic_in_out
		slot8 = t
		slot9 = 0
		slot10 = 0.65
		slot11 = fade_in_duration
		local current_alpha = slot6(slot7, slot8, slot9, slot10)
		slot7 = self._lens_glint
		slot9 = slot7
		slot7 = slot7.set_alpha
		slot10 = current_alpha

		slot7(slot8, slot9)

		slot7 = self._lens_orbs
		slot9 = slot7
		slot7 = slot7.set_alpha
		slot10 = current_alpha

		slot7(slot8, slot9)

		slot7 = self._lens_shimmer
		slot9 = slot7
		slot7 = slot7.set_alpha
		slot10 = current_alpha

		slot7(slot8, slot9)

		slot7 = self._lens_spike_ball
		slot9 = slot7
		slot7 = slot7.set_alpha
		slot10 = current_alpha

		slot7(slot8, slot9)

		slot7 = Easing
		slot7 = slot7.quartic_in_out
		slot9 = t
		slot10 = 0.6
		slot11 = 0.4
		slot12 = fade_in_duration
		local current_scale = slot7(slot8, slot9, slot10, slot11)
		slot8 = self._lens_glint
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_orbs
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_shimmer
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_spike_ball
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_glint
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_orbs
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_shimmer
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_spike_ball
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_glint
		slot10 = slot8
		slot8 = slot8.rotate
		slot11 = math
		slot11 = slot11.random
		slot11 = slot11()
		slot11 = slot11 * 0.06
		slot11 = slot11 + 0.1

		slot8(slot9, slot10)

		slot8 = self._lens_shimmer
		slot10 = slot8
		slot8 = slot8.rotate
		slot11 = math
		slot11 = slot11.random
		slot11 = slot11()
		slot11 = slot11 * -0.08
		slot11 = slot11 - 0.13

		slot8(slot9, slot10)

		slot8 = self._lens_spike_ball
		slot10 = slot8
		slot8 = slot8.rotate
		slot11 = math
		slot11 = slot11.random
		slot11 = slot11()
		slot11 = slot11 * 0.11
		slot11 = slot11 + 0.06

		slot8(slot9, slot10)
	end

	while true do
		slot5 = coroutine
		slot5 = slot5.yield
		local dt = slot5()
		t = t + dt
		slot6 = self._lens_glint
		slot8 = slot6
		slot6 = slot6.rotate
		slot9 = math
		slot9 = slot9.random
		slot9 = slot9()
		slot9 = slot9 * 0.06
		slot9 = slot9 + 0.1

		slot6(slot7, slot8)

		slot6 = self._lens_shimmer
		slot8 = slot6
		slot6 = slot6.rotate
		slot9 = math
		slot9 = slot9.random
		slot9 = slot9()
		slot9 = slot9 * -0.08
		slot9 = slot9 - 0.13

		slot6(slot7, slot8)

		slot6 = self._lens_spike_ball
		slot8 = slot6
		slot6 = slot6.rotate
		slot9 = math
		slot9 = slot9.random
		slot9 = slot9()
		slot9 = slot9 * 0.11
		slot9 = slot9 + 0.06

		slot6(slot7, slot8)
	end

	return 
end

slot0._animate_lens_flares = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local fade_out_duration = 0.2
	local t = 0
	slot3 = wait
	slot5 = 0.1

	slot3(slot4)

	slot3 = self._lens_glint
	slot5 = slot3
	slot3 = slot3.w
	local icon_w = slot3(slot4)
	slot4 = self._lens_glint
	slot6 = slot4
	slot4 = slot4.h
	local icon_h = slot4(slot5)

	while t < fade_out_duration do
		slot5 = coroutine
		slot5 = slot5.yield
		local dt = slot5()
		t = t + dt
		slot6 = Easing
		slot6 = slot6.quartic_in_out
		slot8 = t
		slot9 = 0.65
		slot10 = -0.65
		slot11 = fade_out_duration
		local current_alpha = slot6(slot7, slot8, slot9, slot10)
		slot7 = self._flare_panel
		slot9 = slot7
		slot7 = slot7.set_alpha
		slot10 = current_alpha

		slot7(slot8, slot9)

		slot7 = Easing
		slot7 = slot7.quartic_in_out
		slot9 = t
		slot10 = 1
		slot11 = -0.7
		slot12 = fade_out_duration
		local current_scale = slot7(slot8, slot9, slot10, slot11)
		slot8 = self._lens_glint
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_orbs
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_shimmer
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_spike_ball
		slot10 = slot8
		slot8 = slot8.set_size
		slot11 = icon_w * current_scale
		slot12 = icon_h * current_scale

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_glint
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_orbs
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_shimmer
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)

		slot8 = self._lens_spike_ball
		slot10 = slot8
		slot8 = slot8.set_center
		slot11 = self._flare_panel
		slot13 = slot11
		slot11 = slot11.w
		slot11 = slot11(slot12)
		slot11 = slot11 / 2
		slot12 = self._flare_panel
		slot14 = slot12
		slot12 = slot12.h
		slot12 = slot12(slot13)
		slot12 = slot12 / 2

		slot8(slot9, slot10, slot11)
	end

	slot5 = self._flare_panel
	slot7 = slot5
	slot5 = slot5.set_alpha
	slot8 = 0

	slot5(slot6, slot7)

	return 
end

slot0._animate_hide_lens_flares = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local duration = 0.2
	local t = 0
	slot3 = self._loot_image
	slot5 = slot3
	slot3 = slot3.size
	local initial_w, initial_h = slot3(slot4)
	slot5 = self._loot_image
	slot7 = slot5
	slot5 = slot5.center
	local center_x, center_y = slot5(slot6)

	while t < duration do
		slot7 = coroutine
		slot7 = slot7.yield
		local dt = slot7()
		t = t + dt
		slot8 = Easing
		slot8 = slot8.quartic_in
		slot10 = t
		slot11 = 1
		slot12 = -1
		slot13 = duration
		local crate_alpha = slot8(slot9, slot10, slot11, slot12)
		slot9 = self._loot_image
		slot11 = slot9
		slot9 = slot9.set_alpha
		slot12 = crate_alpha

		slot9(slot10, slot11)

		slot9 = self._greed_bar_panel
		slot11 = slot9
		slot9 = slot9.set_alpha
		slot12 = crate_alpha

		slot9(slot10, slot11)

		slot9 = Easing
		slot9 = slot9.quartic_in
		slot11 = t
		slot12 = 1
		slot13 = -0.4
		slot14 = duration
		local crate_scale = slot9(slot10, slot11, slot12, slot13)
		slot10 = self._loot_image
		slot12 = slot10
		slot10 = slot10.set_size
		slot13 = initial_w * crate_scale
		slot14 = initial_h * crate_scale

		slot10(slot11, slot12, slot13)

		slot10 = self._loot_image
		slot12 = slot10
		slot10 = slot10.set_center_x
		slot13 = center_x

		slot10(slot11, slot12)

		slot10 = self._loot_image
		slot12 = slot10
		slot10 = slot10.set_center_y
		slot13 = center_y

		slot10(slot11, slot12)
	end

	slot7 = self._loot_image
	slot9 = slot7
	slot7 = slot7.set_alpha
	slot10 = 0

	slot7(slot8, slot9)

	slot7 = self._greed_bar_panel
	slot9 = slot7
	slot7 = slot7.set_alpha
	slot10 = 0

	slot7(slot8, slot9)

	return 
end

slot0._animate_central_image_hide = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local duration = 0.5
	local t = 0
	slot3 = self._counter
	slot5 = slot3
	slot3 = slot3.set_text
	slot6 = tostring
	slot8 = self._gold_bars_added

	slot3(slot4, slot6(slot7))

	slot3 = self._counter
	slot5 = slot3
	slot3 = slot3.set_color
	slot6 = GreedLootScreenGui
	slot6 = slot6.COUNTER_INCREASE_COLOR

	slot3(slot4, slot5)

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_in
		slot6 = t
		slot7 = GreedLootScreenGui
		slot7 = slot7.COUNTER_OFFSET
		slot8 = GreedLootScreenGui
		slot8 = slot8.COUNTER_OFFSET
		slot8 = -slot8
		slot9 = duration
		local current_offset = slot4(slot5, slot6, slot7, slot8)
		slot5 = self._counter
		slot7 = slot5
		slot5 = slot5.set_center_y
		slot8 = self._progress_bar_background
		slot10 = slot8
		slot8 = slot8.center_y
		slot8 = slot8(slot9)
		slot8 = slot8 - current_offset

		slot5(slot6, slot7)
	end

	slot3 = self._counter
	slot5 = slot3
	slot3 = slot3.set_center_y
	slot6 = self._progress_bar_background
	slot8 = slot6
	slot6 = slot6.center_y

	slot3(slot4, slot6(slot7))

	return 
end

slot0._animate_counter_add_gold_bar = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local duration = 0.5
	local t = 0

	while t < duration do
		slot3 = coroutine
		slot3 = slot3.yield
		local dt = slot3()
		t = t + dt
		slot4 = Easing
		slot4 = slot4.quartic_in_out
		slot6 = t
		slot7 = 0
		slot8 = GreedLootScreenGui
		slot8 = slot8.ICON_HIDDEN_OFFSET
		slot9 = duration
		local current_offset = slot4(slot5, slot6, slot7, slot8)
		slot5 = Easing
		slot5 = slot5.quartic_in_out
		slot7 = t
		slot8 = 1
		slot9 = -1
		slot10 = duration / 2
		local current_loot_icon_alpha = slot5(slot6, slot7, slot8, slot9)
		slot6 = self._loot_icon
		slot8 = slot6
		slot6 = slot6.set_alpha
		slot9 = current_loot_icon_alpha

		slot6(slot7, slot8)

		slot6 = self._loot_icon
		slot8 = slot6
		slot6 = slot6.set_center_y
		slot9 = self._greed_bar_panel
		slot11 = slot9
		slot9 = slot9.h
		slot9 = slot9(slot10)
		slot9 = slot9 / 2
		slot9 = slot9 - current_offset

		slot6(slot7, slot8)

		slot6 = duration / 2

		if slot6 <= t then
			slot6 = Easing
			slot6 = slot6.quartic_in_out
			slot8 = duration / 2
			slot8 = t - slot8
			slot9 = 0
			slot10 = 1
			slot11 = duration / 2
			local current_gold_icon_alpha = slot6(slot7, slot8, slot9, slot10)
			slot7 = self._gold_icon
			slot9 = slot7
			slot7 = slot7.set_alpha
			slot10 = current_gold_icon_alpha

			slot7(slot8, slot9)
		end

		slot6 = self._gold_icon
		slot8 = slot6
		slot6 = slot6.set_center_y
		slot9 = self._greed_bar_panel
		slot11 = slot9
		slot9 = slot9.h
		slot9 = slot9(slot10)
		slot9 = slot9 / 2
		slot10 = GreedLootScreenGui
		slot10 = slot10.ICON_HIDDEN_OFFSET
		slot9 = slot9 + slot10
		slot9 = slot9 - current_offset

		slot6(slot7, slot8)
	end

	slot3 = self._loot_icon
	slot5 = slot3
	slot3 = slot3.set_alpha
	slot6 = 0

	slot3(slot4, slot5)

	slot3 = self._gold_icon
	slot5 = slot3
	slot3 = slot3.set_alpha
	slot6 = 1

	slot3(slot4, slot5)

	slot3 = self._loot_icon
	slot5 = slot3
	slot3 = slot3.set_center_y
	slot6 = self._greed_bar_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot6 = slot6 / 2

	slot3(slot4, slot5)

	slot3 = self._gold_icon
	slot5 = slot3
	slot3 = slot3.set_center_y
	slot6 = self._greed_bar_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot6 = slot6 / 2

	slot3(slot4, slot5)

	return 
end

slot0._animate_change_icon = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = tweak_data
	slot1 = slot1.gui
	slot3 = slot1
	slot1 = slot1.icon_w
	slot4 = GreedLootScreenGui
	slot4 = slot4.FRAME_ICON
	local frame_default_w = slot1(slot2, slot3)
	slot2 = tweak_data
	slot2 = slot2.gui
	slot4 = slot2
	slot2 = slot2.icon_h
	slot5 = GreedLootScreenGui
	slot5 = slot5.FRAME_ICON
	local frame_default_h = slot2(slot3, slot4)
	local duration_in = 0.5
	local t = 0

	while t < duration_in do
		slot5 = coroutine
		slot5 = slot5.yield
		local dt = slot5()
		t = t + dt
		slot6 = Easing
		slot6 = slot6.quartic_out
		slot8 = t
		slot9 = 1.4
		slot10 = -0.4
		slot11 = duration_in
		local current_frame_scale = slot6(slot7, slot8, slot9, slot10)
		slot7 = self._frame
		slot9 = slot7
		slot7 = slot7.set_w
		slot10 = frame_default_w * current_frame_scale

		slot7(slot8, slot9)

		slot7 = self._frame
		slot9 = slot7
		slot7 = slot7.set_h
		slot10 = frame_default_h * current_frame_scale

		slot7(slot8, slot9)

		slot7 = self._frame
		slot9 = slot7
		slot7 = slot7.set_center_x
		slot10 = self._greed_bar_panel
		slot12 = slot10
		slot10 = slot10.w
		slot10 = slot10(slot11)
		slot10 = slot10 / 2

		slot7(slot8, slot9)

		slot7 = self._frame
		slot9 = slot7
		slot7 = slot7.set_center_y
		slot10 = self._greed_bar_panel
		slot12 = slot10
		slot10 = slot10.h
		slot10 = slot10(slot11)
		slot10 = slot10 / 2

		slot7(slot8, slot9)

		slot7 = Easing
		slot7 = slot7.quartic_out
		slot9 = t
		slot10 = tweak_data
		slot10 = slot10.gui
		slot10 = slot10.colors
		slot10 = slot10.raid_light_gold
		slot10 = slot10.r
		slot11 = tweak_data
		slot11 = slot11.gui
		slot11 = slot11.colors
		slot11 = slot11.raid_gold
		slot11 = slot11.r
		slot12 = tweak_data
		slot12 = slot12.gui
		slot12 = slot12.colors
		slot12 = slot12.raid_light_gold
		slot12 = slot12.r
		slot11 = slot11 - slot12
		slot12 = duration_in
		local current_r = slot7(slot8, slot9, slot10, slot11)
		slot8 = Easing
		slot8 = slot8.quartic_out
		slot10 = t
		slot11 = tweak_data
		slot11 = slot11.gui
		slot11 = slot11.colors
		slot11 = slot11.raid_light_gold
		slot11 = slot11.g
		slot12 = tweak_data
		slot12 = slot12.gui
		slot12 = slot12.colors
		slot12 = slot12.raid_gold
		slot12 = slot12.g
		slot13 = tweak_data
		slot13 = slot13.gui
		slot13 = slot13.colors
		slot13 = slot13.raid_light_gold
		slot13 = slot13.g
		slot12 = slot12 - slot13
		slot13 = duration_in
		local current_g = slot8(slot9, slot10, slot11, slot12)
		slot9 = Easing
		slot9 = slot9.quartic_out
		slot11 = t
		slot12 = tweak_data
		slot12 = slot12.gui
		slot12 = slot12.colors
		slot12 = slot12.raid_light_gold
		slot12 = slot12.b
		slot13 = tweak_data
		slot13 = slot13.gui
		slot13 = slot13.colors
		slot13 = slot13.raid_gold
		slot13 = slot13.b
		slot14 = tweak_data
		slot14 = slot14.gui
		slot14 = slot14.colors
		slot14 = slot14.raid_light_gold
		slot14 = slot14.b
		slot13 = slot13 - slot14
		slot14 = duration_in
		local current_b = slot9(slot10, slot11, slot12, slot13)
		slot10 = self._frame
		slot12 = slot10
		slot10 = slot10.set_color
		slot13 = Color
		slot15 = current_r
		slot16 = current_g
		slot17 = current_b

		slot10(slot11, slot13(slot14, slot15, slot16))
	end

	return 
end

slot0._animate_pulse = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local duration = 1.9
	local t = 0
	slot3 = self._central_gold_bar_image
	slot5 = slot3
	slot3 = slot3.size
	local original_image_w, original_image_h = slot3(slot4)
	slot5 = self._central_gold_bar_image
	slot7 = slot5
	slot5 = slot5.center
	local center_x, center_y = slot5(slot6)
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	slot9 = self._title_description
	slot11 = slot9
	slot9 = slot9.y
	local title_description_y = slot9(slot10)
	local title_description_offset = 35
	slot11 = self._gold_bar_value
	slot13 = slot11
	slot11 = slot11.y
	local gold_bar_value_y = slot11(slot12)
	local gold_bar_value_offset = 20
	local title_delay = 0
	local title_duration = 1
	local description_panel_offset = 50
	slot16 = wait
	slot18 = 0.15

	slot16(slot17)

	while t < duration do
		slot16 = coroutine
		slot16 = slot16.yield
		local dt = slot16()
		t = t + dt
		slot17 = Easing
		slot17 = slot17.quartic_out
		slot19 = t
		slot20 = 0
		slot21 = 1
		slot22 = image_duration
		local current_alpha = slot17(slot18, slot19, slot20, slot21)
		slot18 = self._central_gold_bar_image
		slot20 = slot18
		slot18 = slot18.set_alpha
		slot21 = current_alpha

		slot18(slot19, slot20)

		if t < image_duration then
			slot18 = Easing
			slot18 = slot18.linear
			slot20 = t
			slot21 = 1.4
			slot22 = -0.35
			slot23 = image_duration
			local current_scale = slot18(slot19, slot20, slot21, slot22)
			slot19 = self._central_gold_bar_image
			slot21 = slot19
			slot19 = slot19.set_size
			slot22 = original_image_w * current_scale
			slot23 = original_image_h * current_scale

			slot19(slot20, slot21, slot22)
		elseif image_duration < t then
			slot18 = image_duration + image_duration_slowdown
		else
			slot18 = image_duration + image_duration_slowdown

			if slot18 < t then
				slot18 = self._central_gold_bar_image
				slot20 = slot18
				slot18 = slot18.set_size
				slot21 = original_image_w
				slot22 = original_image_h

				slot18(slot19, slot20, slot21)
			end
		end

		slot18 = self._central_gold_bar_image
		slot20 = slot18
		slot18 = slot18.set_center_x
		slot21 = center_x

		slot18(slot19, slot20)

		slot18 = self._central_gold_bar_image
		slot20 = slot18
		slot18 = slot18.set_center_y
		slot21 = center_y

		slot18(slot19, slot20)

		if title_delay < t then
			slot18 = Easing
			slot18 = slot18.quartic_out
			slot20 = t - title_delay
			slot21 = 0
			slot22 = 1
			slot23 = title_duration
			local current_title_alpha = slot18(slot19, slot20, slot21, slot22)
			slot19 = self._title_description
			slot21 = slot19
			slot19 = slot19.set_alpha
			slot22 = current_title_alpha

			slot19(slot20, slot21)

			slot19 = self._gold_bar_value
			slot21 = slot19
			slot19 = slot19.set_alpha
			slot22 = current_title_alpha

			slot19(slot20, slot21)

			slot19 = Easing
			slot19 = slot19.quartic_out
			slot21 = t - title_delay
			slot22 = title_description_offset
			slot23 = -title_description_offset
			slot24 = title_duration
			local title_description_current_offset = slot19(slot20, slot21, slot22, slot23)
			slot20 = self._title_description
			slot22 = slot20
			slot20 = slot20.set_y
			slot23 = title_description_y - title_description_current_offset

			slot20(slot21, slot22)

			slot20 = Easing
			slot20 = slot20.quartic_out
			slot22 = t - title_delay
			slot23 = gold_bar_value_offset
			slot24 = -gold_bar_value_offset
			slot25 = title_duration
			local customization_name_current_offset = slot20(slot21, slot22, slot23, slot24)
			slot21 = self._gold_bar_value
			slot23 = slot21
			slot21 = slot21.set_y
			slot24 = gold_bar_value_y - customization_name_current_offset

			slot21(slot22, slot23)

			slot21 = Easing
			slot21 = slot21.quartic_out
			slot23 = t - title_delay
			slot24 = description_panel_offset
			slot25 = -description_panel_offset
			slot26 = title_duration
			local current_description_panel_offset = slot21(slot22, slot23, slot24, slot25)
			slot22 = self._description_panel
			slot24 = slot22
			slot22 = slot22.set_right
			slot25 = self._second_panel
			slot27 = slot25
			slot25 = slot25.w
			slot25 = slot25(slot26)
			slot25 = slot25 - current_description_panel_offset

			slot22(slot23, slot24)

			slot22 = self._description_panel
			slot24 = slot22
			slot22 = slot22.set_alpha
			slot25 = current_title_alpha

			slot22(slot23, slot24)
		end
	end

	slot16 = self._central_gold_bar_image
	slot18 = slot16
	slot16 = slot16.set_alpha
	slot19 = 1

	slot16(slot17, slot18)

	slot16 = self._central_gold_bar_image
	slot18 = slot16
	slot16 = slot16.set_size
	slot19 = original_image_w
	slot20 = original_image_h

	slot16(slot17, slot18, slot19)

	slot16 = self._central_gold_bar_image
	slot18 = slot16
	slot16 = slot16.set_center_x
	slot19 = center_x

	slot16(slot17, slot18)

	slot16 = self._central_gold_bar_image
	slot18 = slot16
	slot16 = slot16.set_center_y
	slot19 = center_y

	slot16(slot17, slot18)

	slot16 = self._title_description
	slot18 = slot16
	slot16 = slot16.set_alpha
	slot19 = 1

	slot16(slot17, slot18)

	slot16 = self._title_description
	slot18 = slot16
	slot16 = slot16.set_y
	slot19 = title_description_y

	slot16(slot17, slot18)

	slot16 = self._gold_bar_value
	slot18 = slot16
	slot16 = slot16.set_alpha
	slot19 = 1

	slot16(slot17, slot18)

	slot16 = self._gold_bar_value
	slot18 = slot16
	slot16 = slot16.set_y
	slot19 = gold_bar_value_y

	slot16(slot17, slot18)

	return 
end

slot0._animate_second_panel = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.get_engine_panel
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._loot_image
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._title
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._lens_iris
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._central_gold_bar_image
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._lens_glint
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._loot_icon
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._counter
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._gold_icon
	slot3 = slot1
	slot1 = slot1.stop

	slot1(slot2)

	slot1 = self._closing

	if slot1 then
		return 
	end

	slot1 = true
	self._closing = slot1
	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.current_state_name
	slot1 = slot1(slot2)

	if slot1 == "event_complete_screen" then
		slot1 = game_state_machine
		slot3 = slot1
		slot1 = slot1.current_state
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.continue

		slot1(slot2)
	end

	slot1 = Overlay
	slot3 = slot1
	slot1 = slot1.gui
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.destroy_workspace
	slot4 = self._full_workspace

	slot1(slot2, slot3)

	slot1 = GreedLootScreenGui
	slot1 = slot1.super
	slot1 = slot1.close
	slot3 = self

	slot1(slot2)

	return 
end

slot0.close = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = true

	return slot1
end

slot0.on_escape = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	local bindings = {}
	slot2 = {}
	slot3 = Idstring
	slot5 = "menu_controller_face_bottom"
	slot3 = slot3(slot4)
	slot2.key = slot3
	slot3 = callback
	slot5 = self
	slot6 = self
	slot7 = "_continue_button_on_click"
	slot3 = slot3(slot4, slot5, slot6)
	slot2.callback = slot3
	bindings[1] = slot2
	local legend = {}
	slot3 = {
		"menu_legend_continue"
	}
	legend.controller = slot3
	slot3 = {}
	slot4 = {
		key = "footer_continue"
	}
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "_continue_button_on_click"
	slot10 = nil
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot4.callback = slot5
	slot3[1] = slot4
	legend.keyboard = slot3
	slot5 = self
	slot3 = self.set_controller_bindings
	slot6 = bindings
	slot7 = true

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.set_legend
	slot6 = legend

	slot3(slot4, slot5)

	return 
end

slot0.bind_controller_inputs = slot1
slot0 = GreedLootScreenGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.raid_menu
	slot3 = slot1
	slot1 = slot1.close_menu

	slot1(slot2)

	return 
end

slot0._continue_button_on_click = slot1

return 
