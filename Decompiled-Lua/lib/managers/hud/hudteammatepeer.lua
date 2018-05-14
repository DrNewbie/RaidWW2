if not HUDTeammatePeer then
	slot2 = HUDTeammateBase
	slot0 = class(slot1)
end

HUDTeammatePeer = slot0
HUDTeammatePeer.PADDING_DOWN = 10
HUDTeammatePeer.DEFAULT_X = 0
HUDTeammatePeer.DEFAULT_W = 384
HUDTeammatePeer.DEFAULT_H = 84
HUDTeammatePeer.LEFT_PANEL_X = 0
HUDTeammatePeer.LEFT_PANEL_Y = 0
HUDTeammatePeer.LEFT_PANEL_W = 84
HUDTeammatePeer.WARCRY_BG_ICON = "player_panel_warcry_bg"
HUDTeammatePeer.WARCRY_BAR_ICON = "warcry_bar_fill"
HUDTeammatePeer.WARCRY_BAR_COLORS = tweak_data.gui.colors.player_warcry_colors
HUDTeammatePeer.WARCRY_INACTIVE_COLOR = tweak_data.gui.colors.warcry_inactive
HUDTeammatePeer.WARCRY_ACTIVE_COLOR = tweak_data.gui.colors.warcry_active
HUDTeammatePeer.TIMER_BG_ICON = "player_panel_teammate_downed_bg"
HUDTeammatePeer.TIMER_BAR_ICON = "teammate_circle_fill_medium"
HUDTeammatePeer.TIMER_FONT = "din_compressed_outlined_42"
HUDTeammatePeer.TIMER_FONT_SIZE = 42
HUDTeammatePeer.INTERACTION_METER_BG = "player_panel_interaction_teammate_bg"
HUDTeammatePeer.INTERACTION_METER_FILL = "teammate_interact_fill_large"
HUDTeammatePeer.RIGHT_PANEL_X = 96
HUDTeammatePeer.RIGHT_PANEL_Y = 0
HUDTeammatePeer.PLAYER_NAME_H = 30
HUDTeammatePeer.PLAYER_NAME_FONT = "din_compressed_outlined_22"
HUDTeammatePeer.PLAYER_NAME_FONT_SIZE = 22
HUDTeammatePeer.PLAYER_LEVEL_Y = 4
HUDTeammatePeer.PLAYER_LEVEL_W = 24
HUDTeammatePeer.PLAYER_LEVEL_H = 16
HUDTeammatePeer.PLAYER_LEVEL_FONT = "din_compressed_outlined_22"
HUDTeammatePeer.PLAYER_LEVEL_FONT_SIZE = 20
HUDTeammatePeer.PLAYER_HEALTH_H = 10
HUDTeammatePeer.PLAYER_HEALTH_BG_ICON = "backgrounds_health_bg"
HUDTeammatePeer.PLAYER_HEALTH_COLORS = tweak_data.gui.colors.player_health_colors
HUDTeammatePeer.EQUIPMENT_H = 37
HUDTeammatePeer.EQUIPMENT_PADDING = 6
HUDTeammatePeer.MOUNTED_WEAPON_ICON = "player_panel_status_mounted_weapon"
HUDTeammatePeer.LOCKPICK_ICON = "player_panel_status_lockpick"
HUDTeammatePeer.DEAD_ICON = "player_panel_status_dead_ai"
HUDTeammatePeer.HOST_ICON = "player_panel_host_indicator"
HUDTeammatePeer.STATES = {
	{
		id = "dead",
		control = "dead_icon",
		hidden = {
			"warcry_panel"
		}
	},
	{
		id = "downed",
		control = "timer_panel",
		hidden = {
			"warcry_panel"
		}
	},
	{
		id = "interaction",
		control = "interaction_meter_panel"
	},
	{
		id = "carry",
		control = "carry_icon",
		hidden = {
			"warcry_panel"
		}
	},
	{
		id = "lockpick",
		control = "lockpick_icon"
	},
	{
		id = "mounted_weapon",
		control = "mounted_weapon_icon"
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
function HUDTeammatePeer:init(i, teammates_panel)
	self._id = i
	self._equipment = {}
	self._states = HUDTeammatePeer.STATES
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

	self._create_nationality_icon(#self._states)

	slot5 = self

	self._create_dead_icon(#self._states)

	slot5 = self

	self._create_carry_icon(#self._states)

	slot5 = self

	self._create_lockpick_icon(#self._states)

	slot5 = self

	self._create_mounted_weapon_icon(#self._states)

	slot5 = self

	self._create_warcry_bar(#self._states)

	slot5 = self

	self._create_timer(#self._states)

	slot5 = self

	self._create_interaction_meter(#self._states)

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

	self._status_icon = self._nationality_icon

	return 
end
function HUDTeammatePeer:_create_panel(teammates_panel)
	local panel_params = {
		halign = "left",
		y = 0,
		valign = "top",
		x = HUDTeammatePeer.DEFAULT_X,
		w = HUDTeammatePeer.DEFAULT_W,
		h = HUDTeammatePeer.DEFAULT_H,
		layer = tweak_data.gui.PLAYER_PANELS_LAYER
	}
	slot6 = panel_params
	self._object = teammates_panel.panel(slot4, teammates_panel)

	return 
end
function HUDTeammatePeer:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		x = HUDTeammatePeer.LEFT_PANEL_X,
		y = HUDTeammatePeer.LEFT_PANEL_Y,
		w = HUDTeammatePeer.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function HUDTeammatePeer:_create_status_panel()
	local status_panel_params = {
		name = "status_panel",
		y = 0,
		x = 0
	}
	slot4 = self._left_panel
	status_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	status_panel_params.h = self._left_panel.h(slot3)
	slot5 = status_panel_params
	self._status_panel = self._left_panel.panel(slot3, self._left_panel)

	return 
end
function HUDTeammatePeer:_create_warcry_bar()
	local warcry_panel_params = {
		name = "warcry_panel"
	}
	slot4 = self._left_panel
	warcry_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	warcry_panel_params.h = self._left_panel.h(slot3)
	slot5 = warcry_panel_params
	local warcry_panel = self._left_panel.panel(slot3, self._left_panel)
	local warcry_background_params = {
		name = "warcry_background",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.WARCRY_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.WARCRY_BG_ICON].texture_rect
	}
	slot7 = warcry_background_params
	local warcry_background = warcry_panel.bitmap(HUDTeammatePeer.WARCRY_BG_ICON, warcry_panel)
	slot10 = warcry_panel
	slot8 = warcry_panel.w(slot9) / 2

	warcry_background.set_center_x(warcry_panel, warcry_background)

	slot10 = warcry_panel

	warcry_background.set_center_y(warcry_panel, warcry_background)

	local warcry_bar_params = {
		name = "warcry_bar",
		halign = "center",
		render_template = "VertexColorTexturedRadial",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.WARCRY_BAR_ICON].texture
	}
	slot10 = HUDTeammatePeer.WARCRY_BAR_ICON
	slot10 = HUDTeammatePeer.WARCRY_BAR_ICON
	warcry_bar_params.texture_rect = {
		tweak_data.gui.icon_w(warcry_panel.h(slot9) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(warcry_panel.h(slot9) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(warcry_panel.h(slot9) / 2, tweak_data.gui)
	}
	slot9 = HUDTeammatePeer.WARCRY_BAR_ICON
	warcry_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot9 = HUDTeammatePeer.WARCRY_BAR_ICON
	warcry_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	warcry_bar_params.color = HUDTeammatePeer.WARCRY_INACTIVE_COLOR
	slot8 = warcry_background
	warcry_bar_params.layer = warcry_background.layer(tweak_data.gui.icon_h) + 1
	slot9 = warcry_bar_params
	self._warcry_bar = warcry_panel.bitmap(tweak_data.gui.icon_h, warcry_panel)
	slot11 = warcry_panel
	slot9 = warcry_panel.w(HUDTeammatePeer.WARCRY_BAR_ICON) / 2

	self._warcry_bar.set_center_x(tweak_data.gui.icon_h, self._warcry_bar)

	slot11 = warcry_panel
	slot9 = warcry_panel.h(HUDTeammatePeer.WARCRY_BAR_ICON) / 2

	self._warcry_bar.set_center_y(tweak_data.gui.icon_h, self._warcry_bar)

	slot9 = 0

	self._warcry_bar.set_position_z(tweak_data.gui.icon_h, self._warcry_bar)

	slot9 = "sharpshooter"

	self.set_active_warcry(tweak_data.gui.icon_h, self)

	return 
end
function HUDTeammatePeer:_create_nationality_icon()
	local nationality = "german"
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
function HUDTeammatePeer:_create_dead_icon()
	local dead_icon_params = {
		name = "dead_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.DEAD_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.DEAD_ICON].texture_rect
	}
	slot5 = dead_icon_params
	self._dead_icon = self._status_panel.bitmap(HUDTeammatePeer.DEAD_ICON, self._status_panel)
	slot7 = self._status_panel
	slot5 = self._status_panel.w(slot6) / 2

	self._dead_icon.set_center_x(HUDTeammatePeer.DEAD_ICON, self._dead_icon)

	slot7 = self._status_panel
	slot5 = self._status_panel.h(slot6) / 2

	self._dead_icon.set_center_y(HUDTeammatePeer.DEAD_ICON, self._dead_icon)

	return 
end
function HUDTeammatePeer:_create_carry_icon()
	local temp_carry_icon = "carry_alive"
	local carry_icon_params = {
		name = "carry_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[temp_carry_icon].texture,
		texture_rect = tweak_data.gui.icons[temp_carry_icon].texture_rect
	}
	slot6 = carry_icon_params
	self._carry_icon = self._status_panel.bitmap(slot4, self._status_panel)
	slot8 = self._status_panel
	slot6 = self._status_panel.w(slot7) / 2

	self._carry_icon.set_center_x(slot4, self._carry_icon)

	slot8 = self._status_panel
	slot6 = self._status_panel.h(slot7) / 2

	self._carry_icon.set_center_y(slot4, self._carry_icon)

	return 
end
function HUDTeammatePeer:_create_lockpick_icon()
	local lockpick_icon_params = {
		name = "lockpick_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.LOCKPICK_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.LOCKPICK_ICON].texture_rect
	}
	slot5 = lockpick_icon_params
	self._lockpick_icon = self._status_panel.bitmap(HUDTeammatePeer.LOCKPICK_ICON, self._status_panel)
	slot7 = self._status_panel
	slot5 = self._status_panel.w(slot6) / 2

	self._lockpick_icon.set_center_x(HUDTeammatePeer.LOCKPICK_ICON, self._lockpick_icon)

	slot7 = self._status_panel
	slot5 = self._status_panel.h(slot6) / 2

	self._lockpick_icon.set_center_y(HUDTeammatePeer.LOCKPICK_ICON, self._lockpick_icon)

	return 
end
function HUDTeammatePeer:_create_mounted_weapon_icon()
	local mounted_weapon_icon_params = {
		name = "mounted_weapon_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.MOUNTED_WEAPON_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.MOUNTED_WEAPON_ICON].texture_rect
	}
	slot5 = mounted_weapon_icon_params
	self._mounted_weapon_icon = self._status_panel.bitmap(HUDTeammatePeer.MOUNTED_WEAPON_ICON, self._status_panel)
	slot7 = self._status_panel
	slot5 = self._status_panel.w(slot6) / 2

	self._mounted_weapon_icon.set_center_x(HUDTeammatePeer.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	slot7 = self._status_panel
	slot5 = self._status_panel.h(slot6) / 2

	self._mounted_weapon_icon.set_center_y(HUDTeammatePeer.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	return 
end
function HUDTeammatePeer:_create_timer()
	local timer_panel_params = {
		alpha = 0,
		name = "timer_panel",
		layer = 5
	}
	slot4 = self._left_panel
	timer_panel_params.x = self._left_panel.x(slot3)
	slot4 = self._left_panel
	timer_panel_params.y = self._left_panel.y(slot3)
	slot4 = self._left_panel
	timer_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	timer_panel_params.h = self._left_panel.h(slot3)
	slot5 = timer_panel_params
	self._timer_panel = self._status_panel.panel(slot3, self._status_panel)
	local timer_background_params = {
		name = "timer_background",
		halign = "center",
		layer = 1,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.TIMER_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.TIMER_BG_ICON].texture_rect
	}
	slot6 = timer_background_params
	local timer_background = self._timer_panel.bitmap(HUDTeammatePeer.TIMER_BG_ICON, self._timer_panel)
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
		texture = tweak_data.gui.icons[HUDTeammatePeer.TIMER_BAR_ICON].texture
	}
	slot9 = HUDTeammatePeer.TIMER_BAR_ICON
	slot9 = HUDTeammatePeer.TIMER_BAR_ICON
	timer_bar_params.texture_rect = {
		tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._timer_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDTeammatePeer.TIMER_BAR_ICON
	timer_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDTeammatePeer.TIMER_BAR_ICON
	timer_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = timer_bar_params
	self._timer_bar = self._timer_panel.bitmap(tweak_data.gui.icon_h, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.w(HUDTeammatePeer.TIMER_BAR_ICON) / 2

	self._timer_bar.set_center_x(tweak_data.gui.icon_h, self._timer_bar)

	slot10 = self._timer_panel
	slot8 = self._timer_panel.h(HUDTeammatePeer.TIMER_BAR_ICON) / 2

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
	timer_text_params.font = tweak_data.gui.fonts[HUDTeammatePeer.TIMER_FONT]
	timer_text_params.font_size = HUDTeammatePeer.TIMER_FONT_SIZE
	slot9 = timer_text_params
	self._timer_text = self._timer_panel.text(HUDTeammatePeer.TIMER_FONT, self._timer_panel)
	slot8 = self._timer_text
	local _, _, _, h = self._timer_text.text_rect(HUDTeammatePeer.TIMER_FONT)
	slot13 = h

	self._timer_text.set_h(slot11, self._timer_text)

	slot15 = self._timer_panel
	slot13 = self._timer_panel.h(slot14) / 2 - 3

	self._timer_text.set_center_y(slot11, self._timer_text)

	return 
end
function HUDTeammatePeer:_create_interaction_meter()
	local interaction_meter_panel_params = {
		layer = 4,
		name = "interaction_meter_panel",
		halign = "left",
		alpha = 0,
		valign = "center"
	}
	slot5 = interaction_meter_panel_params
	self._interaction_meter_panel = self._status_panel.panel(slot3, self._status_panel)
	local interaction_meter_background_params = {
		name = "interaction_meter_background",
		halign = "scale",
		layer = 1,
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammatePeer.INTERACTION_METER_BG].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.INTERACTION_METER_BG].texture_rect
	}
	slot6 = interaction_meter_background_params
	local interaction_meter_background = self._interaction_meter_panel.bitmap(HUDTeammatePeer.INTERACTION_METER_BG, self._interaction_meter_panel)
	slot9 = self._interaction_meter_panel
	slot7 = self._interaction_meter_panel.w(slot8) / 2

	interaction_meter_background.set_center_x(self._interaction_meter_panel, interaction_meter_background)

	slot9 = self._interaction_meter_panel

	interaction_meter_background.set_center_y(self._interaction_meter_panel, interaction_meter_background)

	local interaction_meter_params = {
		name = "interaction_meter",
		layer = 2,
		halign = "scale",
		render_template = "VertexColorTexturedRadial",
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammatePeer.INTERACTION_METER_FILL].texture
	}
	slot9 = HUDTeammatePeer.INTERACTION_METER_FILL
	slot9 = HUDTeammatePeer.INTERACTION_METER_FILL
	interaction_meter_params.texture_rect = {
		tweak_data.gui.icon_w(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDTeammatePeer.INTERACTION_METER_FILL
	interaction_meter_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDTeammatePeer.INTERACTION_METER_FILL
	interaction_meter_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	interaction_meter_params.color = tweak_data.gui.colors.teammate_interaction_bar
	slot8 = interaction_meter_params
	self._interaction_meter = self._interaction_meter_panel.bitmap(tweak_data.gui.icon_h, self._interaction_meter_panel)
	slot10 = self._interaction_meter_panel
	slot8 = self._interaction_meter_panel.w(HUDTeammatePeer.INTERACTION_METER_FILL) / 2

	self._interaction_meter.set_center_x(tweak_data.gui.icon_h, self._interaction_meter)

	slot10 = self._interaction_meter_panel
	slot8 = self._interaction_meter_panel.h(HUDTeammatePeer.INTERACTION_METER_FILL) / 2

	self._interaction_meter.set_center_y(tweak_data.gui.icon_h, self._interaction_meter)

	return 
end
function HUDTeammatePeer:_create_host_indicator()
	slot4 = "warcry_panel"
	local warcry_panel = self._left_panel.child(slot2, self._left_panel)
	slot5 = "warcry_background"
	local warcry_background = warcry_panel.child(self._left_panel, warcry_panel)
	local host_indicator_params = {
		name = "host_indicator",
		layer = 30,
		alpha = 0,
		texture = tweak_data.gui.icons[HUDTeammatePeer.HOST_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.HOST_ICON].texture_rect
	}
	slot7 = host_indicator_params
	local host_indicator = self._left_panel.bitmap(HUDTeammatePeer.HOST_ICON, self._left_panel)
	slot11 = warcry_background
	slot11 = warcry_background
	slot8 = (warcry_panel.x(slot9) + warcry_background.x(warcry_panel) + warcry_background.w(warcry_panel)) - 4

	host_indicator.set_right(self._left_panel, host_indicator)

	slot11 = warcry_background
	slot11 = warcry_background
	slot8 = (warcry_panel.y(warcry_background.w(warcry_panel)) + warcry_background.y(warcry_panel) + warcry_background.h(warcry_panel)) - 4

	host_indicator.set_bottom(self._left_panel, host_indicator)

	return 
end
function HUDTeammatePeer:_create_right_panel()
	local right_panel_params = {
		name = "right_panel",
		x = HUDTeammatePeer.RIGHT_PANEL_X,
		y = HUDTeammatePeer.RIGHT_PANEL_Y
	}
	slot4 = self._object
	right_panel_params.w = self._object.w(slot3) - HUDTeammatePeer.RIGHT_PANEL_X
	slot4 = self._object
	right_panel_params.h = self._object.h(HUDTeammatePeer.RIGHT_PANEL_X)
	slot5 = right_panel_params
	self._right_panel = self._object.panel(HUDTeammatePeer.RIGHT_PANEL_X, self._object)

	return 
end
function HUDTeammatePeer:_create_player_name()
	local player_name_params = {
		name = "player_name",
		vertical = "center",
		align = "left",
		text = "",
		y = -2,
		x = 0
	}
	slot4 = self._right_panel
	player_name_params.w = self._right_panel.w(slot3) - HUDTeammatePeer.PLAYER_LEVEL_W
	player_name_params.h = HUDTeammatePeer.PLAYER_NAME_H
	player_name_params.font = tweak_data.gui.fonts[HUDTeammatePeer.PLAYER_NAME_FONT]
	player_name_params.font_size = HUDTeammatePeer.PLAYER_NAME_FONT_SIZE
	slot5 = player_name_params
	self._player_name = self._right_panel.text(HUDTeammatePeer.PLAYER_NAME_FONT, self._right_panel)

	return 
end
function HUDTeammatePeer:_create_player_level()
	local player_level_params = {
		vertical = "center",
		name = "player_level",
		align = "right",
		text = ""
	}
	slot4 = self._right_panel
	player_level_params.x = self._right_panel.w(slot3) - HUDTeammatePeer.PLAYER_LEVEL_W
	player_level_params.y = HUDTeammatePeer.PLAYER_LEVEL_Y
	player_level_params.w = HUDTeammatePeer.PLAYER_LEVEL_W
	player_level_params.h = HUDTeammatePeer.PLAYER_LEVEL_H
	player_level_params.font = tweak_data.gui.fonts[HUDTeammatePeer.PLAYER_LEVEL_FONT]
	player_level_params.font_size = HUDTeammatePeer.PLAYER_LEVEL_FONT_SIZE
	slot5 = player_level_params
	self._player_level = self._right_panel.text(HUDTeammatePeer.PLAYER_LEVEL_FONT, self._right_panel)
	slot4 = managers.experience
	local current_level = managers.experience.current_level(HUDTeammatePeer.PLAYER_LEVEL_FONT)

	if current_level then
		slot6 = current_level

		self._player_level.set_text(slot4, self._player_level)
	end

	return 
end
function HUDTeammatePeer:_create_player_health()
	local health_panel_params = {
		name = "health_panel",
		x = 0
	}
	slot4 = self._right_panel
	health_panel_params.y = self._right_panel.h(slot3) / 2 - HUDTeammatePeer.PLAYER_HEALTH_H
	slot4 = self._right_panel
	health_panel_params.w = self._right_panel.w(HUDTeammatePeer.PLAYER_HEALTH_H)
	health_panel_params.h = HUDTeammatePeer.PLAYER_HEALTH_H
	slot5 = health_panel_params
	local health_panel = self._right_panel.panel(HUDTeammatePeer.PLAYER_HEALTH_H, self._right_panel)
	local health_background_params = {
		name = "health_background",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammatePeer.PLAYER_HEALTH_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePeer.PLAYER_HEALTH_BG_ICON].texture_rect
	}
	slot7 = health_background_params
	local health_background = health_panel.bitmap(HUDTeammatePeer.PLAYER_HEALTH_BG_ICON, health_panel)
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
function HUDTeammatePeer:_create_equipment_panel()
	local equipment_panel_params = {
		name = "equipment_panel",
		x = 0
	}
	slot4 = self._right_panel
	equipment_panel_params.y = self._right_panel.h(slot3) / 2
	slot4 = self._right_panel
	equipment_panel_params.w = self._right_panel.w(slot3)
	equipment_panel_params.h = HUDTeammatePeer.EQUIPMENT_H
	slot5 = equipment_panel_params
	self._equipment_panel = self._right_panel.panel(slot3, self._right_panel)

	return 
end
function HUDTeammatePeer:padding_down()
	return HUDTeammatePeer.PADDING_DOWN
end
function HUDTeammatePeer:reset_state()
	slot3 = self._equipment_panel

	self._equipment_panel.clear(slot2)

	self._equipment = {}
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

	slot4 = "warcry_panel"
	slot4 = 1

	self._left_panel.child(#self._states, self._left_panel).set_alpha(#self._states, self._left_panel.child(#self._states, self._left_panel))

	return 
end
function HUDTeammatePeer:set_character_data(data)
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
function HUDTeammatePeer:set_health(data)
	slot6 = 1
	local health_percentage = math.clamp(slot3, data.current / data.total, 0)
	slot6 = health_percentage * self._full_health_bar_w

	self._health_bar.set_w(data.current / data.total, self._health_bar)

	slot5 = self._health_bar
	slot10 = health_percentage

	self._health_bar.set_color(data.current / data.total, self._get_color_for_percentage(slot7, self, HUDTeammatePeer.PLAYER_HEALTH_COLORS))

	return 
end
function HUDTeammatePeer:set_active_warcry(warcry)
	if self._warcry_icon then
		slot4 = self._warcry_icon

		self._warcry_icon.stop(slot3)

		slot5 = self._warcry_icon

		self._status_panel.remove(slot3, self._status_panel)
	end

	local warcry_icon_name = tweak_data.warcry[warcry].hud_icon
	local warcry_icon_params = {
		name = "warcry_icon",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[warcry_icon_name].texture,
		texture_rect = tweak_data.gui.icons[warcry_icon_name].texture_rect,
		alpha = (self._active_states.warcry and 1) or 0
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
function HUDTeammatePeer:set_warcry_meter_fill(data)
	slot5 = data.current / data.total

	self._warcry_bar.set_position_z(slot3, self._warcry_bar)

	if 1 <= data.current / data.total then
		slot5 = true

		self.set_warcry_ready(slot3, self)
	end

	return 
end
function HUDTeammatePeer:go_into_bleedout()
	slot3 = self

	HUDTeammatePeer.super.go_into_bleedout(slot2)

	slot3 = self

	self.deactivate_warcry(slot2)

	return 
end
function HUDTeammatePeer:activate_warcry(duration)
	slot4 = self._warcry_bar

	self._warcry_bar.stop(slot3)

	slot9 = "_animate_warcry_active"
	slot6 = duration

	self._warcry_bar.animate(slot3, self._warcry_bar, callback(slot6, self, self))

	return 
end
function HUDTeammatePeer:deactivate_warcry()
	if self._warcry_icon then
		slot3 = self._warcry_icon

		self._warcry_icon.stop(slot2)

		slot3 = self._warcry_icon
		slot8 = "_animate_warcry_not_ready"

		self._warcry_icon.animate(slot2, callback(slot5, self, self))
	end

	slot3 = self._warcry_bar

	self._warcry_bar.stop(slot2)

	slot4 = 0

	self._warcry_bar.set_position_z(slot2, self._warcry_bar)

	slot4 = "warcry"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:set_warcry_ready(value)
	if self._warcry_icon then
		slot4 = self._warcry_icon

		self._warcry_icon.stop(slot3)

		if value == true then
			slot4 = self._warcry_icon
			slot9 = "_animate_warcry_ready"

			self._warcry_icon.animate(slot3, callback(slot6, self, self))

			slot5 = "warcry"

			self._add_active_state(slot3, self)
		else
			slot4 = self._warcry_icon
			slot9 = "_animate_warcry_not_ready"

			self._warcry_icon.animate(slot3, callback(slot6, self, self))

			slot5 = "warcry"

			self._remove_active_state(slot3, self)
		end
	end

	return 
end
function HUDTeammatePeer:set_name(name)
	slot4 = self._player_name
	slot7 = name

	self._player_name.set_text(slot3, utf8.to_upper(slot6))

	return 
end
function HUDTeammatePeer:set_nationality(nationality)
	slot5 = nationality
	local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
	slot6 = tweak_data.gui.icons[nationality_icon].texture

	self._nationality_icon.set_image(slot4, self._nationality_icon)

	slot5 = self._nationality_icon
	slot8 = tweak_data.gui.icons[nationality_icon].texture_rect

	self._nationality_icon.set_texture_rect(slot4, unpack(slot7))

	return 
end
function HUDTeammatePeer:set_level(level)
	slot5 = level

	self._player_level.set_text(slot3, self._player_level)

	return 
end
function HUDTeammatePeer:set_cheater(state)
	return 
end
function HUDTeammatePeer:set_carry_info(carry_id)
	local carry_tweak_data = tweak_data.carry[carry_id]

	if carry_tweak_data and carry_tweak_data.hud_icon then
		slot6 = tweak_data.gui.icons[carry_tweak_data.hud_icon].texture

		self._carry_icon.set_image(slot4, self._carry_icon)

		slot5 = self._carry_icon
		slot8 = tweak_data.gui.icons[carry_tweak_data.hud_icon].texture_rect

		self._carry_icon.set_texture_rect(slot4, unpack(carry_tweak_data.hud_icon))

		slot8 = self._status_panel
		slot6 = self._status_panel.w(carry_tweak_data.hud_icon) / 2

		self._carry_icon.set_center_x(slot4, self._carry_icon)

		slot8 = self._status_panel
		slot6 = self._status_panel.h(carry_tweak_data.hud_icon) / 2

		self._carry_icon.set_center_y(slot4, self._carry_icon)

		slot6 = "carry"

		self._add_active_state(slot4, self)
	else
		slot9 = carry_id
		slot6 = "[HUDTeammatePeer] set_carry_info(): no tweak data or HUD icon for item " .. tostring(slot8)

		Application.debug(slot4, Application)
	end

	return 
end
function HUDTeammatePeer:remove_carry_info()
	slot4 = "carry"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:show_turret_icon()
	slot4 = "mounted_weapon"

	self._add_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:hide_turret_icon()
	slot4 = "mounted_weapon"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:show_lockpick_icon()
	slot4 = "lockpick"

	self._add_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:hide_lockpick_icon()
	slot4 = "lockpick"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammatePeer:show_host_indicator()
	slot4 = "host_indicator"
	local host_indicator = self._left_panel.child(slot2, self._left_panel)
	slot4 = host_indicator

	host_indicator.stop(self._left_panel)

	slot4 = host_indicator
	slot9 = "_animate_show_host_indicator"

	host_indicator.animate(self._left_panel, callback(slot6, self, self))

	return 
end
function HUDTeammatePeer:hide_host_indicator()
	slot4 = "host_indicator"
	local host_indicator = self._left_panel.child(slot2, self._left_panel)
	slot4 = host_indicator

	host_indicator.stop(self._left_panel)

	slot4 = host_indicator
	slot9 = "_animate_hide_host_indicator"

	host_indicator.animate(self._left_panel, callback(slot6, self, self))

	return 
end
function HUDTeammatePeer:add_special_equipment(data)
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
function HUDTeammatePeer:remove_special_equipment(id)
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
function HUDTeammatePeer:set_special_equipment_amount(equipment_id, amount)
	for i = 1, #self._equipment, 1 do
		slot9 = self._equipment[i]

		if self._equipment[i].id(slot8) == equipment_id then
			slot10 = amount

			self._equipment[i].set_amount(slot8, self._equipment[i])
		end
	end

	return 
end
function HUDTeammatePeer:clear_special_equipment()
	slot3 = self._equipment_panel

	self._equipment_panel.clear(slot2)

	self._equipment = {}

	return 
end
function HUDTeammatePeer:_layout_special_equipment()
	local x = 0

	for i = 1, #self._equipment, 1 do
		slot9 = x

		self._equipment[i].set_x(slot7, self._equipment[i])

		slot8 = self._equipment[i]
		x = x + self._equipment[i].w(slot7) + HUDTeammatePeer.EQUIPMENT_PADDING
	end

	return 
end
function HUDTeammatePeer:set_condition(icon_data, text)
	if icon_data == self._state then
		return 
	end

	if icon_data == "mugshot_in_custody" then
		slot6 = false

		self.set_warcry_ready(slot4, self)
	end

	self._state = icon_data

	return 
end
function HUDTeammatePeer:start_interact(timer)
	slot5 = "interaction"

	self._add_active_state(slot3, self)

	slot4 = self._interaction_meter

	self._interaction_meter.stop(slot3)

	slot9 = "_animate_interact"
	slot6 = timer

	self._interaction_meter.animate(slot3, self._interaction_meter, callback(slot6, self, self))

	return 
end
function HUDTeammatePeer:cancel_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_meter

	self._interaction_meter.stop(slot2)

	slot3 = self._interaction_meter
	slot8 = "_animate_cancel_interact"

	self._interaction_meter.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTeammatePeer:complete_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_meter

	self._interaction_meter.stop(slot2)

	slot3 = self._interaction_meter
	slot8 = "_animate_complete_interact"

	self._interaction_meter.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTeammatePeer:_animate_interact(interact_image, duration)
	local t = 0
	slot7 = 0

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 0, 1)
		slot9 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)
	end

	slot7 = 1

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	return 
end
function HUDTeammatePeer:_animate_cancel_interact()
	local duration = 0.2
	slot4 = self._interaction_meter
	local t = (1 - self._interaction_meter.position_z(slot3)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_progress = Easing.linear(slot5, t, 1, -1)
		slot8 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)
	end

	slot6 = 0

	self._interaction_meter.set_position_z(slot4, self._interaction_meter)

	return 
end
function HUDTeammatePeer:_animate_complete_interact()
	local size_decrease_duration = 0.18
	local duration = 0.2
	local t = 0
	slot7 = 1

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 1, -1)
		slot9 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)

		slot11 = duration
		local current_rotation = Easing.linear(t, t, 360, -360)
		slot10 = current_rotation

		self._interaction_meter.set_rotation(t, self._interaction_meter)
	end

	slot7 = 0

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	return 
end
function HUDTeammatePeer:_animate_warcry_active(warcry_bar, duration)
	local t = duration

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		slot8 = t / duration

		warcry_bar.set_position_z(slot6, warcry_bar)
	end

	slot7 = 0

	warcry_bar.set_position_z(slot5, warcry_bar)

	return 
end
function HUDTeammatePeer:_animate_warcry_ready()
	local duration = 0.15
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_r = Easing.quartic_out(slot5, t, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.r, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.r - HUDTeammatePeer.WARCRY_INACTIVE_COLOR.r)
		slot10 = duration
		local current_g = Easing.quartic_out(t, t, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.g, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.g - HUDTeammatePeer.WARCRY_INACTIVE_COLOR.g)
		local current_b = Easing.quartic_out(t, t, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.b, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.b - HUDTeammatePeer.WARCRY_INACTIVE_COLOR.b)
		slot9 = self._warcry_icon
		slot14 = current_b

		self._warcry_icon.set_color(t, Color(duration, current_r, current_g))

		slot9 = self._warcry_bar
		slot14 = current_b

		self._warcry_bar.set_color(t, Color(duration, current_r, current_g))
	end

	slot6 = HUDTeammatePlayer.WARCRY_ACTIVE_COLOR

	self._warcry_icon.set_color(slot4, self._warcry_icon)

	slot6 = HUDTeammatePlayer.WARCRY_ACTIVE_COLOR

	self._warcry_bar.set_color(slot4, self._warcry_bar)

	return 
end
function HUDTeammatePeer:_animate_warcry_not_ready()
	local duration = 0.15
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_r = Easing.quartic_out(slot5, t, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.r, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.r - HUDTeammatePeer.WARCRY_ACTIVE_COLOR.r)
		slot10 = duration
		local current_g = Easing.quartic_out(t, t, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.g, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.g - HUDTeammatePeer.WARCRY_ACTIVE_COLOR.g)
		local current_b = Easing.quartic_out(t, t, HUDTeammatePeer.WARCRY_ACTIVE_COLOR.b, HUDTeammatePeer.WARCRY_INACTIVE_COLOR.b - HUDTeammatePeer.WARCRY_ACTIVE_COLOR.b)
		slot9 = self._warcry_icon
		slot14 = current_b

		self._warcry_icon.set_color(t, Color(duration, current_r, current_g))

		slot9 = self._warcry_bar
		slot14 = current_b

		self._warcry_bar.set_color(t, Color(duration, current_r, current_g))
	end

	slot6 = HUDTeammatePlayer.WARCRY_INACTIVE_COLOR

	self._warcry_icon.set_color(slot4, self._warcry_icon)

	slot6 = HUDTeammatePlayer.WARCRY_INACTIVE_COLOR

	self._warcry_bar.set_color(slot4, self._warcry_bar)

	return 
end
function HUDTeammatePeer:_animate_show_host_indicator(host_indicator)
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
function HUDTeammatePeer:_animate_hide_host_indicator(host_indicator)
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
function HUDTeammatePeer:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end

return 
