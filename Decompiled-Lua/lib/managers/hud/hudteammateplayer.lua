-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not HUDTeammatePlayer then
	slot2 = HUDTeammateBase
	slot0 = class(slot1)
end

HUDTeammatePlayer = slot0
HUDTeammatePlayer.DEFAULT_X = 0
HUDTeammatePlayer.DEFAULT_W = 384
HUDTeammatePlayer.DEFAULT_H = 84
HUDTeammatePlayer.LEFT_PANEL_X = 0
HUDTeammatePlayer.LEFT_PANEL_Y = 0
HUDTeammatePlayer.LEFT_PANEL_W = 84
HUDTeammatePlayer.STAMINA_BG_ICON = "player_panel_stamina_bg"
HUDTeammatePlayer.STAMINA_BAR_ICON = "stamina_bar_fill"
HUDTeammatePlayer.STAMINA_COLORS = tweak_data.gui.colors.player_stamina_colors
HUDTeammatePlayer.WARCRY_BG_ICON = "player_panel_warcry_bg"
HUDTeammatePlayer.WARCRY_BAR_ICON = "warcry_bar_fill"
HUDTeammatePlayer.WARCRY_COLORS = tweak_data.gui.colors.player_warcry_colors
HUDTeammatePlayer.WARCRY_INACTIVE_COLOR = tweak_data.gui.colors.warcry_inactive
HUDTeammatePlayer.WARCRY_ACTIVE_COLOR = tweak_data.gui.colors.warcry_active
HUDTeammatePlayer.TIMER_BG_ICON = "player_panel_downed_bg"
HUDTeammatePlayer.TIMER_BAR_ICON = "teammate_circle_fill_large"
HUDTeammatePlayer.TIMER_FONT = "din_compressed_outlined_42"
HUDTeammatePlayer.TIMER_FONT_SIZE = 42
HUDTeammatePlayer.RIGHT_PANEL_X = 96
HUDTeammatePlayer.RIGHT_PANEL_Y = 0
HUDTeammatePlayer.PLAYER_NAME_H = 24
HUDTeammatePlayer.PLAYER_NAME_FONT = "din_compressed_outlined_22"
HUDTeammatePlayer.PLAYER_NAME_FONT_SIZE = 22
HUDTeammatePlayer.PLAYER_LEVEL_Y = 4
HUDTeammatePlayer.PLAYER_LEVEL_W = 24
HUDTeammatePlayer.PLAYER_LEVEL_H = 16
HUDTeammatePlayer.PLAYER_LEVEL_FONT = "din_compressed_outlined_22"
HUDTeammatePlayer.PLAYER_LEVEL_FONT_SIZE = 20
HUDTeammatePlayer.PLAYER_HEALTH_H = 10
HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON = "backgrounds_health_bg"
HUDTeammatePlayer.PLAYER_HEALTH_COLORS = tweak_data.gui.colors.player_health_colors
HUDTeammatePlayer.EQUIPMENT_H = 37
HUDTeammatePlayer.EQUIPMENT_PADDING = 6
HUDTeammatePlayer.HOST_ICON = "player_panel_host_indicator"
HUDTeammatePlayer.STATES = {
	{
		id = "downed",
		control = "timer_panel",
		hidden = {
			"stamina_panel",
			"warcry_panel"
		}
	},
	{
		id = "warcry",
		control = "warcry_icon"
	},
	{
		id = "normal",
		control = "nationality_icon"
	}
}
function HUDTeammatePlayer:init(i, teammates_panel)
	self._id = i
	self._max_stamina = 1
	self._equipment = {}
	self._states = HUDTeammatePlayer.STATES
	self._displayed_state = self._states[#self._states]
	self._active_states = {}
	slot6 = self._displayed_state.id

	self._add_active_state(#self._states, self)

	slot6 = teammates_panel

	self._create_panel(#self._states, self)

	slot5 = self

	self._create_left_panel(#self._states)

	slot5 = self

	self._create_status_panel(#self._states)

	slot5 = self

	self._create_stamina_bar(#self._states)

	slot5 = self

	self._create_warcry_bar(#self._states)

	slot5 = self

	self._create_nationality_icon(#self._states)

	slot5 = self

	self._create_timer(#self._states)

	slot5 = self

	self._create_host_indicator(#self._states)

	slot5 = self

	self._create_right_panel(#self._states)

	slot5 = self

	self._create_player_name(#self._states)

	slot5 = self

	self._create_player_level(#self._states)

	slot5 = self

	self._create_player_health(#self._states)

	slot5 = self

	self._create_equipment_panel(#self._states)

	return 
end
function HUDTeammatePlayer:_create_panel(teammates_panel)
	local panel_params = {
		halign = "left",
		valign = "bottom",
		x = HUDTeammatePlayer.DEFAULT_X
	}
	slot5 = teammates_panel
	panel_params.y = teammates_panel.h(slot4) - HUDTeammatePlayer.DEFAULT_H
	panel_params.w = HUDTeammatePlayer.DEFAULT_W
	panel_params.h = HUDTeammatePlayer.DEFAULT_H
	panel_params.layer = tweak_data.gui.PLAYER_PANELS_LAYER
	slot6 = panel_params
	self._object = teammates_panel.panel(HUDTeammatePlayer.DEFAULT_H, teammates_panel)

	return 
end
function HUDTeammatePlayer:_create_status_panel()
	local status_panel_params = {
		name = "status_panel"
	}
	slot5 = status_panel_params
	self._status_panel = self._left_panel.panel(slot3, self._left_panel)

	return 
end
function HUDTeammatePlayer:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		x = HUDTeammatePlayer.LEFT_PANEL_X,
		y = HUDTeammatePlayer.LEFT_PANEL_Y,
		w = HUDTeammatePlayer.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function HUDTeammatePlayer:_create_stamina_bar()
	local stamina_panel_params = {
		name = "stamina_panel"
	}
	slot4 = self._left_panel
	stamina_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	stamina_panel_params.h = self._left_panel.h(slot3)
	slot5 = stamina_panel_params
	local stamina_panel = self._left_panel.panel(slot3, self._left_panel)
	local stamina_background_params = {
		name = "stamina_background",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.STAMINA_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.STAMINA_BG_ICON].texture_rect
	}
	slot7 = stamina_background_params
	local stamina_background = stamina_panel.bitmap(HUDTeammatePlayer.STAMINA_BG_ICON, stamina_panel)
	slot10 = stamina_panel
	slot8 = stamina_panel.w(slot9) / 2

	stamina_background.set_center_x(stamina_panel, stamina_background)

	slot10 = stamina_panel

	stamina_background.set_center_y(stamina_panel, stamina_background)

	local stamina_bar_params = {
		name = "stamina_bar",
		halign = "center",
		render_template = "VertexColorTexturedRadial",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.STAMINA_BAR_ICON].texture
	}
	slot10 = HUDTeammatePlayer.STAMINA_BAR_ICON
	slot10 = HUDTeammatePlayer.STAMINA_BAR_ICON
	stamina_bar_params.texture_rect = {
		tweak_data.gui.icon_w(stamina_panel.h(slot9) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(stamina_panel.h(slot9) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(stamina_panel.h(slot9) / 2, tweak_data.gui)
	}
	slot9 = HUDTeammatePlayer.STAMINA_BAR_ICON
	stamina_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot9 = HUDTeammatePlayer.STAMINA_BAR_ICON
	stamina_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = stamina_background
	stamina_bar_params.layer = stamina_background.layer(tweak_data.gui.icon_h) + 1
	slot9 = stamina_bar_params
	self._stamina_bar = stamina_panel.bitmap(tweak_data.gui.icon_h, stamina_panel)
	slot11 = stamina_panel
	slot9 = stamina_panel.w(HUDTeammatePlayer.STAMINA_BAR_ICON) / 2

	self._stamina_bar.set_center_x(tweak_data.gui.icon_h, self._stamina_bar)

	slot11 = stamina_panel
	slot9 = stamina_panel.h(HUDTeammatePlayer.STAMINA_BAR_ICON) / 2

	self._stamina_bar.set_center_y(tweak_data.gui.icon_h, self._stamina_bar)

	slot9 = self._max_stamina

	self.set_stamina(tweak_data.gui.icon_h, self)

	return 
end
function HUDTeammatePlayer:_create_warcry_bar()
	local warcry_panel_params = {
		name = "warcry_panel"
	}
	slot4 = self._left_panel
	warcry_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	warcry_panel_params.h = self._left_panel.h(slot3)
	slot5 = warcry_panel_params
	self._warcry_panel = self._left_panel.panel(slot3, self._left_panel)
	local warcry_background_params = {
		name = "warcry_background",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.WARCRY_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.WARCRY_BG_ICON].texture_rect
	}
	slot6 = warcry_background_params
	local warcry_background = self._warcry_panel.bitmap(HUDTeammatePlayer.WARCRY_BG_ICON, self._warcry_panel)
	slot9 = self._warcry_panel
	slot7 = self._warcry_panel.w(slot8) / 2

	warcry_background.set_center_x(self._warcry_panel, warcry_background)

	slot9 = self._warcry_panel

	warcry_background.set_center_y(self._warcry_panel, warcry_background)

	local warcry_bar_params = {
		name = "warcry_bar",
		halign = "center",
		render_template = "VertexColorTexturedRadial",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.WARCRY_BAR_ICON].texture
	}
	slot9 = HUDTeammatePlayer.WARCRY_BAR_ICON
	slot9 = HUDTeammatePlayer.WARCRY_BAR_ICON
	warcry_bar_params.texture_rect = {
		tweak_data.gui.icon_w(self._warcry_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._warcry_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._warcry_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDTeammatePlayer.WARCRY_BAR_ICON
	warcry_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDTeammatePlayer.WARCRY_BAR_ICON
	warcry_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	warcry_bar_params.color = HUDTeammatePlayer.WARCRY_INACTIVE_COLOR
	slot7 = warcry_background
	warcry_bar_params.layer = warcry_background.layer(tweak_data.gui.icon_h) + 1
	slot8 = warcry_bar_params
	self._warcry_bar = self._warcry_panel.bitmap(tweak_data.gui.icon_h, self._warcry_panel)
	slot10 = self._warcry_panel
	slot8 = self._warcry_panel.w(HUDTeammatePlayer.WARCRY_BAR_ICON) / 2

	self._warcry_bar.set_center_x(tweak_data.gui.icon_h, self._warcry_bar)

	slot10 = self._warcry_panel
	slot8 = self._warcry_panel.h(HUDTeammatePlayer.WARCRY_BAR_ICON) / 2

	self._warcry_bar.set_center_y(tweak_data.gui.icon_h, self._warcry_bar)

	slot8 = 0

	self._warcry_bar.set_position_z(tweak_data.gui.icon_h, self._warcry_bar)

	slot7 = managers.warcry
	local active_warcry = managers.warcry.get_active_warcry_name(tweak_data.gui.icon_h)

	if active_warcry then
		slot9 = active_warcry

		self.set_active_warcry(slot7, self)
	end

	return 
end
function HUDTeammatePlayer:_create_nationality_icon()
	slot3 = managers.player
	local nationality = managers.player.get_character_profile_nation(slot2)

	if not nationality or nationality == "" then
		nationality = "british"
	end

	local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
	local nationality_icon_params = {
		name = "nationality_icon",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[nationality_icon].texture,
		texture_rect = tweak_data.gui.icons[nationality_icon].texture_rect
	}
	slot7 = nationality_icon_params
	self._nationality_icon = self._status_panel.bitmap(nationality, self._status_panel)
	slot9 = self._status_panel
	slot7 = self._status_panel.w(slot8) / 2

	self._nationality_icon.set_center_x(nationality, self._nationality_icon)

	slot9 = self._status_panel
	slot7 = self._status_panel.h(slot8) / 2

	self._nationality_icon.set_center_y(nationality, self._nationality_icon)

	return 
end
function HUDTeammatePlayer:_create_timer()
	local timer_panel_params = {
		alpha = 0,
		name = "timer_panel",
		layer = 5
	}
	slot5 = timer_panel_params
	self._timer_panel = self._status_panel.panel(slot3, self._status_panel)
	local timer_background_params = {
		name = "timer_background",
		halign = "center",
		layer = 1,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.TIMER_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.TIMER_BG_ICON].texture_rect
	}
	slot6 = timer_background_params
	local timer_background = self._timer_panel.bitmap(HUDTeammatePlayer.TIMER_BG_ICON, self._timer_panel)
	slot9 = self._timer_panel
	slot7 = self._timer_panel.w(slot8) / 2

	timer_background.set_center_x(self._timer_panel, timer_background)

	slot9 = self._timer_panel

	timer_background.set_center_y(self._timer_panel, timer_background)

	local timer_bar_params = {
		name = "timer_bar",
		layer = 2,
		halign = "center",
		render_template = "VertexColorTexturedRadial",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.TIMER_BAR_ICON].texture
	}
	slot9 = HUDTeammatePlayer.TIMER_BAR_ICON
	slot9 = HUDTeammatePlayer.TIMER_BAR_ICON
	timer_bar_params.texture_rect = {
		tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._timer_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDTeammatePlayer.TIMER_BAR_ICON
	timer_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDTeammatePlayer.TIMER_BAR_ICON
	timer_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = timer_bar_params
	self._timer_bar = self._timer_panel.bitmap(tweak_data.gui.icon_h, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.w(HUDTeammatePlayer.TIMER_BAR_ICON) / 2

	self._timer_bar.set_center_x(tweak_data.gui.icon_h, self._timer_bar)

	slot10 = self._timer_panel
	slot8 = self._timer_panel.h(HUDTeammatePlayer.TIMER_BAR_ICON) / 2

	self._timer_bar.set_center_y(tweak_data.gui.icon_h, self._timer_bar)

	local timer_text_params = {
		name = "timer_text",
		vertical = "center",
		align = "center",
		text = "37",
		y = 0,
		x = 0,
		layer = 3
	}
	slot8 = self._timer_panel
	timer_text_params.w = self._timer_panel.w(self._timer_bar)
	slot8 = self._timer_panel
	timer_text_params.h = self._timer_panel.h(self._timer_bar)
	timer_text_params.font = tweak_data.gui.fonts[HUDTeammatePlayer.TIMER_FONT]
	timer_text_params.font_size = HUDTeammatePlayer.TIMER_FONT_SIZE
	slot9 = timer_text_params
	self._timer_text = self._timer_panel.text(HUDTeammatePlayer.TIMER_FONT, self._timer_panel)
	slot8 = self._timer_text
	local _, _, _, h = self._timer_text.text_rect(HUDTeammatePlayer.TIMER_FONT)
	slot13 = h

	self._timer_text.set_h(slot11, self._timer_text)

	slot15 = self._timer_panel
	slot13 = self._timer_panel.h(slot14) / 2 - 3

	self._timer_text.set_center_y(slot11, self._timer_text)

	return 
end
function HUDTeammatePlayer:_create_host_indicator()
	slot4 = "warcry_background"
	local warcry_background = self._warcry_panel.child(slot2, self._warcry_panel)
	local host_indicator_params = {
		name = "host_indicator",
		layer = 30,
		alpha = 0,
		texture = tweak_data.gui.icons[HUDTeammatePlayer.HOST_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.HOST_ICON].texture_rect
	}
	slot6 = host_indicator_params
	local host_indicator = self._left_panel.bitmap(HUDTeammatePlayer.HOST_ICON, self._left_panel)
	slot10 = warcry_background
	slot10 = warcry_background
	slot7 = (self._warcry_panel.x(slot8) + warcry_background.x(self._warcry_panel) + warcry_background.w(self._warcry_panel)) - 4

	host_indicator.set_right(self._left_panel, host_indicator)

	slot10 = warcry_background
	slot10 = warcry_background
	slot7 = (self._warcry_panel.y(warcry_background.w(self._warcry_panel)) + warcry_background.y(self._warcry_panel) + warcry_background.h(self._warcry_panel)) - 4

	host_indicator.set_bottom(self._left_panel, host_indicator)

	return 
end
function HUDTeammatePlayer:_create_right_panel()
	local right_panel_params = {
		name = "right_panel",
		x = HUDTeammatePlayer.RIGHT_PANEL_X,
		y = HUDTeammatePlayer.RIGHT_PANEL_Y
	}
	slot4 = self._object
	right_panel_params.w = self._object.w(slot3) - HUDTeammatePlayer.RIGHT_PANEL_X
	slot4 = self._object
	right_panel_params.h = self._object.h(HUDTeammatePlayer.RIGHT_PANEL_X)
	slot5 = right_panel_params
	self._right_panel = self._object.panel(HUDTeammatePlayer.RIGHT_PANEL_X, self._object)

	return 
end
function HUDTeammatePlayer:_create_player_name()
	local player_name_params = {
		name = "player_name",
		vertical = "center",
		align = "left",
		text = "",
		y = 1,
		x = 0
	}
	slot4 = self._right_panel
	player_name_params.w = self._right_panel.w(slot3) - HUDTeammatePlayer.PLAYER_LEVEL_W
	player_name_params.h = HUDTeammatePlayer.PLAYER_NAME_H
	player_name_params.font = tweak_data.gui.fonts[HUDTeammatePlayer.PLAYER_NAME_FONT]
	player_name_params.font_size = HUDTeammatePlayer.PLAYER_NAME_FONT_SIZE
	slot5 = player_name_params
	self._player_name = self._right_panel.text(HUDTeammatePlayer.PLAYER_NAME_FONT, self._right_panel)

	return 
end
function HUDTeammatePlayer:_create_player_level()
	local player_level_params = {
		vertical = "center",
		name = "player_level",
		align = "right",
		text = ""
	}
	slot4 = self._right_panel
	player_level_params.x = self._right_panel.w(slot3) - HUDTeammatePlayer.PLAYER_LEVEL_W
	player_level_params.y = HUDTeammatePlayer.PLAYER_LEVEL_Y
	player_level_params.w = HUDTeammatePlayer.PLAYER_LEVEL_W
	player_level_params.h = HUDTeammatePlayer.PLAYER_LEVEL_H
	player_level_params.font = tweak_data.gui.fonts[HUDTeammatePlayer.PLAYER_LEVEL_FONT]
	player_level_params.font_size = HUDTeammatePlayer.PLAYER_LEVEL_FONT_SIZE
	slot5 = player_level_params
	self._player_level = self._right_panel.text(HUDTeammatePlayer.PLAYER_LEVEL_FONT, self._right_panel)
	slot4 = managers.experience
	local current_level = managers.experience.current_level(HUDTeammatePlayer.PLAYER_LEVEL_FONT)

	if current_level then
		slot6 = current_level

		self._player_level.set_text(slot4, self._player_level)
	end

	return 
end
function HUDTeammatePlayer:_create_player_health()
	local health_panel_params = {
		name = "health_panel",
		x = 0
	}
	slot4 = self._right_panel
	health_panel_params.y = self._right_panel.h(slot3) / 2 - HUDTeammatePlayer.PLAYER_HEALTH_H
	slot4 = self._right_panel
	health_panel_params.w = self._right_panel.w(HUDTeammatePlayer.PLAYER_HEALTH_H)
	health_panel_params.h = HUDTeammatePlayer.PLAYER_HEALTH_H
	slot5 = health_panel_params
	local health_panel = self._right_panel.panel(HUDTeammatePlayer.PLAYER_HEALTH_H, self._right_panel)
	local health_background_params = {
		name = "health_background",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect
	}
	slot7 = health_background_params
	local health_background = health_panel.bitmap(HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON, health_panel)
	slot10 = health_panel
	slot8 = health_panel.w(slot9) / 2

	health_background.set_center_x(health_panel, health_background)

	slot8 = health_panel.h(slot9) / 2

	health_background.set_center_y(health_panel, health_background)

	local health_bar_params = {
		name = "health_bar"
	}
	slot8 = health_background
	health_bar_params.w = health_background.w(health_background) - 2
	slot8 = health_background
	health_bar_params.h = health_background.h(health_background) - 2
	health_bar_params.color = tweak_data.gui.colors.progress_75
	slot8 = health_background
	health_bar_params.layer = health_background.layer(health_background) + 1
	slot9 = health_bar_params
	self._health_bar = health_panel.rect(health_background, health_panel)
	slot11 = health_panel
	slot9 = health_panel.w(health_panel) / 2

	self._health_bar.set_center_x(health_background, self._health_bar)

	slot11 = health_panel
	slot9 = health_panel.h(health_panel) / 2

	self._health_bar.set_center_y(health_background, self._health_bar)

	slot8 = self._health_bar
	self._full_health_bar_w = self._health_bar.w(health_background)

	return 
end
function HUDTeammatePlayer:_create_equipment_panel()
	local equipment_panel_params = {
		name = "equipment_panel",
		x = 0
	}
	slot4 = self._right_panel
	equipment_panel_params.y = self._right_panel.h(slot3) / 2
	slot4 = self._right_panel
	equipment_panel_params.w = self._right_panel.w(slot3)
	equipment_panel_params.h = HUDTeammatePlayer.EQUIPMENT_H
	slot5 = equipment_panel_params
	self._equipment_panel = self._right_panel.panel(slot3, self._right_panel)

	return 
end
function HUDTeammatePlayer:show()
	slot3 = self

	HUDTeammatePlayer.super.show(slot2)

	slot3 = self

	self.refresh(slot2)

	return 
end
function HUDTeammatePlayer:refresh()
	slot3 = managers.criminals
	local nationality = managers.criminals.local_character_name(slot2)

	if nationality then
		slot5 = nationality

		self.set_nationality(slot3, self)
	end

	local current_level = managers.experience.current_level(slot3)
	slot6 = current_level

	self.set_level(managers.experience, self)

	slot6 = current_level

	self._player_level.set_text(managers.experience, self._player_level)

	return 
end
function HUDTeammatePlayer:reset_state()
	slot3 = self

	self.clear_special_equipment(slot2)

	slot4 = 1

	self._nationality_icon.set_alpha(slot2, self._nationality_icon)

	slot4 = "stamina_panel"
	slot4 = 1

	self._left_panel.child(slot2, self._left_panel).set_alpha(slot2, self._left_panel.child(slot2, self._left_panel))

	slot4 = 1

	self._warcry_panel.set_alpha(slot2, self._warcry_panel)

	slot4 = self._displayed_state.control
	slot4 = 0

	self._status_panel.child(slot2, self._status_panel).set_alpha(slot2, self._status_panel.child(slot2, self._status_panel))

	slot4 = false

	self.set_warcry_ready(slot2, self)

	self._displayed_state = self._states[#self._states]
	self._active_states = {}
	slot4 = self._displayed_state.id

	self._add_active_state(#self._states, self)

	slot4 = self._displayed_state.control
	slot4 = 1

	self._status_panel.child(#self._states, self._status_panel).set_alpha(#self._states, self._status_panel.child(#self._states, self._status_panel))

	return 
end
function HUDTeammatePlayer:set_character_data(data)
	if data.nationality then
		slot5 = data.nationality
		local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
		slot6 = tweak_data.gui.icons[nationality_icon].texture

		self._nationality_icon.set_image(slot4, self._nationality_icon)

		slot5 = self._nationality_icon
		slot8 = tweak_data.gui.icons[nationality_icon].texture_rect

		self._nationality_icon.set_texture_rect(slot4, unpack(slot7))
	end

	if data.character_level then
		slot5 = data.character_level

		self._player_level.set_text(slot3, self._player_level)
	end

	return 
end
function HUDTeammatePlayer:set_health(data)
	slot6 = 1
	local health_percentage = math.clamp(slot3, data.current / data.total, 0)
	slot6 = health_percentage * self._full_health_bar_w

	self._health_bar.set_w(data.current / data.total, self._health_bar)

	slot5 = self._health_bar
	slot10 = health_percentage

	self._health_bar.set_color(data.current / data.total, self._get_color_for_percentage(slot7, self, HUDTeammatePlayer.PLAYER_HEALTH_COLORS))

	return 
end
function HUDTeammatePlayer:set_stamina(value)
	slot6 = 1
	local stamina_percentage = math.clamp(slot3, value / self._max_stamina, 0)
	slot6 = stamina_percentage

	self._stamina_bar.set_position_z(value / self._max_stamina, self._stamina_bar)

	slot5 = managers.player
	local player_unit = managers.player.player_unit(value / self._max_stamina)

	if player_unit then
		slot6 = player_unit
	else
		slot6 = self._stamina_bar
		slot11 = stamina_percentage

		self._stamina_bar.set_color(slot5, self._get_color_for_percentage(slot8, self, HUDTeammatePlayer.STAMINA_COLORS))
	end

	return 
end
function HUDTeammatePlayer:set_max_stamina(value)
	self._max_stamina = value

	return 
end
function HUDTeammatePlayer:set_active_warcry(warcry)
	if self._warcry_icon then
		slot5 = self._warcry_icon

		self._status_panel.remove(slot3, self._status_panel)
	end

	local warcry_icon_name = tweak_data.warcry[warcry].hud_icon
	local warcry_icon_params = {
		name = "warcry_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[warcry_icon_name].texture,
		texture_rect = tweak_data.gui.icons[warcry_icon_name].texture_rect,
		color = HUDTeammatePlayer.WARCRY_ACTIVE_COLOR
	}
	slot7 = warcry_icon_params
	self._warcry_icon = self._status_panel.bitmap(slot5, self._status_panel)
	slot9 = self._status_panel
	slot7 = self._status_panel.w(slot8) / 2

	self._warcry_icon.set_center_x(slot5, self._warcry_icon)

	slot9 = self._status_panel
	slot7 = self._status_panel.h(slot8) / 2

	self._warcry_icon.set_center_y(slot5, self._warcry_icon)

	return 
end
function HUDTeammatePlayer:set_warcry_meter_fill(data)
	local warcry_percentage = data.current / data.total
	slot6 = warcry_percentage

	self._warcry_bar.set_position_z(slot4, self._warcry_bar)

	return 
end
function HUDTeammatePlayer:activate_warcry(duration)
	return 
end
function HUDTeammatePlayer:deactivate_warcry()
	slot3 = self._warcry_panel

	self._warcry_panel.stop(slot2)

	slot3 = self._warcry_panel
	slot8 = "_animate_warcry_not_ready"

	self._warcry_panel.animate(slot2, callback(slot5, self, self))

	slot4 = "warcry"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammatePlayer:set_warcry_ready(value)
	slot4 = self._warcry_panel

	self._warcry_panel.stop(slot3)

	if value == true then
		slot5 = "warcry"

		self._add_active_state(slot3, self)

		slot4 = self._warcry_panel
		slot9 = "_animate_warcry_ready"

		self._warcry_panel.animate(slot3, callback(slot6, self, self))
	else
		slot5 = "warcry"

		self._remove_active_state(slot3, self)

		slot4 = self._warcry_panel
		slot9 = "_animate_warcry_not_ready"

		self._warcry_panel.animate(slot3, callback(slot6, self, self))
	end

	return 
end
function HUDTeammatePlayer:set_name(name)
	slot4 = self._player_name
	slot7 = name

	self._player_name.set_text(slot3, utf8.to_upper(slot6))

	return 
end
function HUDTeammatePlayer:set_nationality(nationality)
	slot5 = nationality
	local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
	slot6 = tweak_data.gui.icons[nationality_icon].texture

	self._nationality_icon.set_image(slot4, self._nationality_icon)

	slot5 = self._nationality_icon
	slot8 = tweak_data.gui.icons[nationality_icon].texture_rect

	self._nationality_icon.set_texture_rect(slot4, unpack(slot7))

	return 
end
function HUDTeammatePlayer:set_level(level)
	slot5 = level

	self._player_level.set_text(slot3, self._player_level)

	return 
end
function HUDTeammatePlayer:set_cheater(state)
	return 
end
function HUDTeammatePlayer:on_revived()
	slot4 = "warcry"

	self._remove_active_state(slot2, self)

	slot3 = self

	HUDTeammatePlayer.super.on_revived(slot2)

	return 
end
function HUDTeammatePlayer:set_carry_info(carry_id)
	return 
end
function HUDTeammatePlayer:remove_carry_info()
	return 
end
function HUDTeammatePlayer:show_turret_icon()
	return 
end
function HUDTeammatePlayer:hide_turret_icon()
	return 
end
function HUDTeammatePlayer:show_host_indicator()
	slot4 = "host_indicator"
	local host_indicator = self._left_panel.child(slot2, self._left_panel)
	slot4 = host_indicator

	host_indicator.stop(self._left_panel)

	slot4 = host_indicator
	slot9 = "_animate_show_host_indicator"

	host_indicator.animate(self._left_panel, callback(slot6, self, self))

	return 
end
function HUDTeammatePlayer:hide_host_indicator()
	slot4 = "host_indicator"
	local host_indicator = self._left_panel.child(slot2, self._left_panel)
	slot4 = host_indicator

	host_indicator.stop(self._left_panel)

	slot4 = host_indicator
	slot9 = "_animate_hide_host_indicator"

	host_indicator.animate(self._left_panel, callback(slot6, self, self))

	return 
end
function HUDTeammatePlayer:add_special_equipment(data)
	local existing_equipment = nil

	for i = 1, #self._equipment, 1 do
		slot9 = self._equipment[i]

		if self._equipment[i].id(slot8) == data.id then
			existing_equipment = self._equipment[i]

			break
		end
	end

	if existing_equipment then
		local new_amount = (data and data.amount) or 1
		slot9 = existing_equipment
		slot7 = existing_equipment.amount(slot8) + new_amount

		existing_equipment.set_amount(slot5, existing_equipment)
	else
		slot9 = data.amount
		local equipment = HUDEquipment.new(slot4, HUDEquipment, self._equipment_panel, data.icon, data.id)
		slot7 = equipment

		table.insert(HUDEquipment, self._equipment)

		slot6 = self

		self._layout_special_equipment(HUDEquipment)
	end

	return 
end
function HUDTeammatePlayer:remove_special_equipment(id)
	for i = #self._equipment, 1, -1 do
		slot8 = self._equipment[i]

		if self._equipment[i].id(slot7) == id then
			slot8 = self._equipment[i]

			self._equipment[i].destroy(slot7)

			slot9 = i

			table.remove(slot7, self._equipment)

			break
		end
	end

	slot4 = self

	self._layout_special_equipment(slot3)

	return 
end
function HUDTeammatePlayer:set_special_equipment_amount(equipment_id, amount)
	for i = 1, #self._equipment, 1 do
		slot9 = self._equipment[i]

		if self._equipment[i].id(slot8) == equipment_id then
			slot10 = amount

			self._equipment[i].set_amount(slot8, self._equipment[i])
		end
	end

	return 
end
function HUDTeammatePlayer:clear_special_equipment()
	slot3 = self._equipment_panel

	self._equipment_panel.clear(slot2)

	self._equipment = {}

	return 
end
function HUDTeammatePlayer:_layout_special_equipment()
	local x = 0

	for i = 1, #self._equipment, 1 do
		slot9 = x

		self._equipment[i].set_x(slot7, self._equipment[i])

		slot8 = self._equipment[i]
		x = x + self._equipment[i].w(slot7) + HUDTeammatePlayer.EQUIPMENT_PADDING
	end

	return 
end
function HUDTeammatePlayer:set_condition(icon_data, text)
	return 
end
function HUDTeammatePlayer:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end
function HUDTeammatePlayer:_animate_warcry_ready()
	local duration = 0.3
	slot4 = self._warcry_bar
	local t = (self._warcry_bar.color(slot3).r - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r) / (HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.r - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_r = Easing.quartic_out(slot5, t, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.r - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r)
		slot10 = duration
		local current_g = Easing.quartic_out(t, t, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.g, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.g - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.g)
		local current_b = Easing.quartic_out(t, t, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.b, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.b - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.b)
		slot9 = self._warcry_bar
		slot14 = current_b

		self._warcry_bar.set_color(t, Color(duration, current_r, current_g))
	end

	slot6 = HUDTeammatePlayer.WARCRY_ACTIVE_COLOR

	self._warcry_bar.set_color(slot4, self._warcry_bar)

	return 
end
function HUDTeammatePlayer:_animate_warcry_not_ready()
	local duration = 0.3
	slot4 = self._warcry_bar
	local t = (1 - (self._warcry_bar.color(slot3).r - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r) / (HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.r - HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_r = Easing.quartic_out(slot5, t, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.r, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.r - HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.r)
		slot10 = duration
		local current_g = Easing.quartic_out(t, t, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.g, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.g - HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.g)
		local current_b = Easing.quartic_out(t, t, HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.b, HUDTeammatePlayer.WARCRY_INACTIVE_COLOR.b - HUDTeammatePlayer.WARCRY_ACTIVE_COLOR.b)
		slot9 = self._warcry_bar
		slot14 = current_b

		self._warcry_bar.set_color(t, Color(duration, current_r, current_g))
	end

	slot6 = HUDTeammatePlayer.WARCRY_INACTIVE_COLOR

	self._warcry_bar.set_color(slot4, self._warcry_bar)

	return 
end
function HUDTeammatePlayer:_animate_show_host_indicator(host_indicator)
	local duration = 0.15
	slot5 = host_indicator
	local t = host_indicator.alpha(slot4) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 1)
		slot9 = current_alpha

		host_indicator.set_alpha(t, host_indicator)
	end

	slot7 = 1

	host_indicator.set_alpha(slot5, host_indicator)

	return 
end
function HUDTeammatePlayer:_animate_hide_host_indicator(host_indicator)
	local duration = 0.15
	slot5 = host_indicator
	local t = (1 - host_indicator.alpha(slot4)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 1, -1)
		slot9 = current_alpha

		host_indicator.set_alpha(t, host_indicator)
	end

	slot7 = 0

	host_indicator.set_alpha(slot5, host_indicator)

	return 
end

return 
