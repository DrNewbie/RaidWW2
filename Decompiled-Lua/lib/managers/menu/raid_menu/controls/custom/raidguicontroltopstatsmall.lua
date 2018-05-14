if not RaidGUIControlTopStatSmall then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTopStatSmall = slot0
RaidGUIControlTopStatSmall.WIDTH = 320
RaidGUIControlTopStatSmall.HEIGHT = 64
RaidGUIControlTopStatSmall.STAT_NAME_H = 32
RaidGUIControlTopStatSmall.STAT_NAME_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlTopStatSmall.STAT_NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlTopStatSmall.PLAYER_NAME_H = 32
RaidGUIControlTopStatSmall.PLAYER_NAME_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlTopStatSmall.PLAYER_NAME_FONT_SIZE = tweak_data.gui.font_sizes.small
RaidGUIControlTopStatSmall.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlTopStatSmall.ICON_SIZE = 64
function RaidGUIControlTopStatSmall:init(parent, params)
	slot7 = params

	RaidGUIControlTopStatSmall.super.init(slot4, self, parent)

	if not params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlTopStatSmall:init] Parameters not specified for RaidGUIControlTopStatSmall")

		return 
	end

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_stat_info(slot4)

	return 
end
function RaidGUIControlTopStatSmall:close()
	return 
end
function RaidGUIControlTopStatSmall:_create_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.w = RaidGUIControlTopStatSmall.WIDTH
	control_params.h = RaidGUIControlTopStatSmall.HEIGHT
	control_params.name = control_params.name .. "_top_stat_small_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_top_stat_small_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_top_stat_small_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlTopStatSmall:_create_stat_info()
	local player_name_params = {
		name = "player_name_label",
		vertical = "center",
		align = "right",
		text = "PLAYER NAME",
		y = -3,
		layer = 1,
		x = RaidGUIControlTopStatSmall.ICON_SIZE
	}
	slot4 = self._object
	player_name_params.w = self._object.w(slot3) - RaidGUIControlTopStatSmall.ICON_SIZE
	player_name_params.h = RaidGUIControlTopStatSmall.PLAYER_NAME_H
	player_name_params.font = RaidGUIControlTopStatSmall.FONT
	player_name_params.font_size = RaidGUIControlTopStatSmall.PLAYER_NAME_FONT_SIZE
	player_name_params.color = RaidGUIControlTopStatSmall.PLAYER_NAME_COLOR
	slot5 = player_name_params
	self._player_name_label = self._object.label(RaidGUIControlTopStatSmall.ICON_SIZE, self._object)
	local stat_name_params = {
		vertical = "center",
		wrap = true,
		align = "right",
		name = "stat_name_label",
		word_wrap = true,
		text = "Most specials killed",
		layer = 3
	}
	slot5 = self._object
	stat_name_params.w = self._object.w(self._object)
	stat_name_params.h = RaidGUIControlTopStatSmall.STAT_NAME_H
	stat_name_params.font = RaidGUIControlTopStatSmall.FONT
	stat_name_params.font_size = RaidGUIControlTopStatSmall.STAT_NAME_FONT_SIZE
	stat_name_params.color = RaidGUIControlTopStatSmall.STAT_NAME_COLOR
	slot6 = stat_name_params
	self._stat_name_label = self._object.label(self._object, self._object)
	slot9 = self._player_name_label
	slot6 = self._player_name_label.y(slot7) + self._player_name_label.h(self._player_name_label)

	self._stat_name_label.set_y(self._object, self._stat_name_label)

	return 
end
function RaidGUIControlTopStatSmall:set_data(data)
	slot4 = self._player_name_label
	slot7 = data.player_nickname

	self._player_name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self._stat_name_label
	slot9 = true

	self._stat_name_label.set_text(slot3, self.translate(slot6, self, data.stat))

	local icon_params = {
		name = "stat_icon",
		w = RaidGUIControlTopStatSmall.ICON_SIZE,
		h = RaidGUIControlTopStatSmall.ICON_SIZE,
		texture = tweak_data.gui.icons[data.icon].texture,
		texture_rect = tweak_data.gui.icons[data.icon].texture_rect
	}
	slot6 = icon_params
	self._stat_icon = self._object.bitmap(data.icon, self._object)

	return 
end

return 
