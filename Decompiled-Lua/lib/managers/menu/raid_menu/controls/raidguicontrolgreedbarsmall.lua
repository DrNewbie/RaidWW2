if not RaidGUIControlGreedBarSmall then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlGreedBarSmall = slot0
RaidGUIControlGreedBarSmall.WIDTH = 192
RaidGUIControlGreedBarSmall.HEIGHT = 96
RaidGUIControlGreedBarSmall.LOOT_ICON = "rewards_extra_loot_small"
RaidGUIControlGreedBarSmall.LOOT_ICON_CENTER_X = 32
RaidGUIControlGreedBarSmall.LOOT_TITLE_STRING = "menu_save_info_loot_title"
RaidGUIControlGreedBarSmall.LOOT_TITLE_H = 64
RaidGUIControlGreedBarSmall.LOOT_TITLE_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlGreedBarSmall.LOOT_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlGreedBarSmall.LOOT_TITLE_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_W = 128
RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_H = 32
RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_CENTER_Y = 64
RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_L = "loot_meter_parts_l"
RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_M = "loot_meter_parts_m"
RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_R = "loot_meter_parts_r"
RaidGUIControlGreedBarSmall.LOOT_BAR_W = 96
RaidGUIControlGreedBarSmall.LOOT_BAR_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlGreedBarSmall.LOOT_BAR_FOREGROUND_COLOR = tweak_data.gui.colors.raid_gold
function RaidGUIControlGreedBarSmall:init(parent, params)
	slot7 = params

	RaidGUIControlGreedBarSmall.super.init(slot4, self, parent)

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_loot_icon(slot4)

	slot5 = self

	self._create_loot_title(slot4)

	slot5 = self

	self._create_loot_bar(slot4)

	slot5 = self

	self._fit_size(slot4)

	return 
end
function RaidGUIControlGreedBarSmall:_create_panel()
	local panel_params = {
		name = "greed_bar_small",
		x = self._params.x or 0,
		y = self._params.y or 0,
		w = RaidGUIControlGreedBarSmall.WIDTH,
		h = RaidGUIControlGreedBarSmall.HEIGHT
	}
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlGreedBarSmall:_create_loot_icon()
	local loot_icon_params = {
		name = "loot_icon",
		valign = "center",
		halign = "left",
		texture = tweak_data.gui.icons[RaidGUIControlGreedBarSmall.LOOT_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlGreedBarSmall.LOOT_ICON].texture_rect
	}
	slot5 = loot_icon_params
	self._loot_icon = self._object.bitmap(RaidGUIControlGreedBarSmall.LOOT_ICON, self._object)
	slot5 = RaidGUIControlGreedBarSmall.LOOT_ICON_CENTER_X

	self._loot_icon.set_center_x(RaidGUIControlGreedBarSmall.LOOT_ICON, self._loot_icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._loot_icon.set_center_y(RaidGUIControlGreedBarSmall.LOOT_ICON, self._loot_icon)

	return 
end
function RaidGUIControlGreedBarSmall:_create_loot_title()
	local loot_title_params = {
		name = "loot_title",
		vertical = "center",
		align = "center",
		halign = "left",
		valign = "center",
		h = RaidGUIControlGreedBarSmall.LOOT_TITLE_H,
		font = RaidGUIControlGreedBarSmall.LOOT_TITLE_FONT,
		font_size = RaidGUIControlGreedBarSmall.LOOT_TITLE_FONT_SIZE,
		color = RaidGUIControlGreedBarSmall.LOOT_TITLE_COLOR
	}
	slot6 = true
	loot_title_params.text = self.translate(slot3, self, RaidGUIControlGreedBarSmall.LOOT_TITLE_STRING)
	slot5 = loot_title_params
	self._title = self._object.text(slot3, self._object)
	slot4 = self._title
	local _, _, w, _ = self._title.text_rect(slot3)
	slot9 = w

	self._title.set_w(slot7, self._title)

	return 
end
function RaidGUIControlGreedBarSmall:_create_loot_bar()
	local loot_bar_panel_params = {
		name = "loot_bar_panel",
		halign = "left",
		valign = "center",
		w = RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_W,
		h = RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_H
	}
	slot5 = loot_bar_panel_params
	self._loot_bar_panel = self._object.panel(slot3, self._object)
	slot5 = RaidGUIControlGreedBarSmall.LOOT_BAR_PANEL_CENTER_Y

	self._loot_bar_panel.set_center_y(slot3, self._loot_bar_panel)

	local loot_bar_background_params = {
		name = "loot_bar_background",
		layer = 1,
		w = RaidGUIControlGreedBarSmall.LOOT_BAR_W,
		left = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_L,
		center = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_M,
		right = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_R,
		color = RaidGUIControlGreedBarSmall.LOOT_BAR_COLOR
	}
	slot6 = loot_bar_background_params
	self._loot_bar_background = self._loot_bar_panel.three_cut_bitmap(self._loot_bar_panel, self._loot_bar_panel)
	slot8 = self._loot_bar_panel
	slot6 = self._loot_bar_panel.w(slot7) / 2

	self._loot_bar_background.set_center_x(self._loot_bar_panel, self._loot_bar_background)

	slot6 = self._loot_bar_panel.h(slot7) / 2

	self._loot_bar_background.set_center_y(self._loot_bar_panel, self._loot_bar_background)

	local loot_bar_progress_panel_params = {
		name = "loot_bar_progress_panel",
		w = RaidGUIControlGreedBarSmall.LOOT_BAR_W
	}
	slot6 = self._loot_bar_background
	loot_bar_progress_panel_params.h = self._loot_bar_background.h(self._loot_bar_background)
	slot6 = self._loot_bar_background
	loot_bar_progress_panel_params.layer = self._loot_bar_background.layer(self._loot_bar_background) + 1
	slot7 = loot_bar_progress_panel_params
	self._loot_bar_progress_panel = self._loot_bar_panel.panel(self._loot_bar_background, self._loot_bar_panel)
	slot6 = self._loot_bar_progress_panel
	slot9 = self._loot_bar_background

	self._loot_bar_progress_panel.set_x(self._loot_bar_background, self._loot_bar_background.x(self._loot_bar_panel))

	slot9 = self._loot_bar_background

	self._loot_bar_progress_panel.set_center_y(self._loot_bar_background, self._loot_bar_background.center_y(self._loot_bar_panel))

	local loot_bar_foreground_params = {
		name = "loot_bar_foreground",
		w = RaidGUIControlGreedBarSmall.LOOT_BAR_W,
		left = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_L,
		center = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_M,
		right = RaidGUIControlGreedBarSmall.LOOT_BAR_ICON_R,
		color = RaidGUIControlGreedBarSmall.LOOT_BAR_FOREGROUND_COLOR
	}
	slot8 = loot_bar_foreground_params
	local loot_bar_foreground = self._loot_bar_progress_panel.three_cut_bitmap(self._loot_bar_progress_panel, self._loot_bar_progress_panel)

	return 
end
function RaidGUIControlGreedBarSmall:_fit_size()
	slot4 = self._loot_bar_background

	if self._loot_bar_background.w(self._title) < self._title.w(slot2) then
		slot4 = 64

		self._title.set_x(slot2, self._title)

		slot3 = self._loot_bar_panel
		slot6 = self._title

		self._loot_bar_panel.set_center_x(slot2, self._title.center_x(slot5))
	else
		slot4 = 64

		self._loot_bar_panel.set_x(slot2, self._loot_bar_panel)

		slot3 = self._title
		slot6 = self._loot_bar_panel

		self._title.set_center_x(slot2, self._loot_bar_panel.center_x(slot5))
	end

	slot3 = self._title.w(slot4)
	slot6 = self._loot_bar_background
	local larger_width = math.max(slot2, self._loot_bar_background.w(self._title))
	slot5 = self._object

	if self._object.w(self._loot_bar_background.w) < larger_width + 64 then
		slot5 = larger_width + 64

		self._object.set_w(slot3, self._object)
	end

	return 
end
function RaidGUIControlGreedBarSmall:set_data_from_manager()
	slot4 = managers.greed
	local progress = managers.greed.current_loot_counter(slot2) / managers.greed.loot_needed_for_gold_bar(managers.greed)
	slot7 = self._loot_bar_background
	slot5 = self._loot_bar_background.w(slot6) * progress

	self._loot_bar_progress_panel.set_w(managers.greed, self._loot_bar_progress_panel)

	slot4 = self._loot_bar_progress_panel
	slot7 = self._loot_bar_background

	self._loot_bar_progress_panel.set_x(managers.greed, self._loot_bar_background.x(slot6))

	slot4 = self._loot_bar_progress_panel
	slot7 = self._loot_bar_background

	self._loot_bar_progress_panel.set_center_y(managers.greed, self._loot_bar_background.center_y(slot6))

	return 
end

return 
