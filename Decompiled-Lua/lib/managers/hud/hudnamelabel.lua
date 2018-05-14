-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDNameLabel = HUDNameLabel or class()
HUDNameLabel.W = 200
HUDNameLabel.H = 70
HUDNameLabel.PLAYER_NAME_H = 30
HUDNameLabel.PLAYER_NAME_FONT = tweak_data.gui.fonts.din_compressed_outlined_22
HUDNameLabel.PLAYER_NAME_FONT_SIZE = tweak_data.gui.font_sizes.extra_small
HUDNameLabel.INTERACTION_PANEL_W = 40
HUDNameLabel.INTERACTION_PANEL_H = 40
HUDNameLabel.PROGRESS_BAR_ICON_BG = "player_panel_interaction_teammate_bg"
HUDNameLabel.PROGRESS_BAR_ICON_FILL = "teammate_interact_fill_large"
HUDNameLabel.MOUNTED_WEAPON_ICON = "player_panel_status_mounted_weapon"
HUDNameLabel.LOCKPICK_ICON = "player_panel_status_lockpick"
HUDNameLabel.TIMER_BG_ICON = "player_panel_ai_downed_and_objective_countdown_bg"
HUDNameLabel.TIMER_BAR_ICON = "teammate_circle_fill_small"
HUDNameLabel.TIMER_FONT = "din_compressed_outlined_24"
HUDNameLabel.TIMER_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNameLabel.STATES = {
	{
		id = "downed",
		control = "timer_panel"
	},
	{
		id = "interaction",
		control = "interaction_panel"
	},
	{
		id = "carry",
		control = "carry_icon"
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
		control = "character_name"
	}
}
function HUDNameLabel:init(hud, params)
	self._name = params.name
	self._nationality = params.nationality
	self._id = params.id
	self._peer_id = params.peer_id
	self._movement = params.movement
	self._states = HUDNameLabel.STATES
	self._displayed_state = self._states[#self._states]
	self._active_states = {}

	self._add_active_state(#self._states, self)

	slot7 = managers.network
	slot7 = managers.network.session(self._displayed_state.id)

	for peer_id, peer in pairs(managers.network.session(self._displayed_state.id).all_peers(self._displayed_state.id)) do
		if peer._name == self._name then
			self._peer_id = peer_id
			self.class = peer._class
			self.warcry = WarcryManager.CLASS_TO_WARCRY[self.class]
		end
	end

	slot6 = hud

	self._create_panel(slot4, self)

	slot5 = self

	self._create_name(slot4)

	slot5 = self

	self._create_timer(slot4)

	slot5 = self

	self._create_carry_icon(slot4)

	slot5 = self

	self._create_warcry_icon(slot4)

	slot5 = self

	self._create_lockpick_icon(slot4)

	slot5 = self

	self._create_mounted_weapon_icon(slot4)

	slot5 = self

	self._create_interaction_progress_bar(slot4)

	return 
end
function HUDNameLabel:_create_panel(hud)
	local panel_params = {}
	slot6 = self._nationality
	panel_params.name = "name_label_" .. tostring(slot5)
	panel_params.w = HUDNameLabel.W
	panel_params.h = HUDNameLabel.H
	slot6 = panel_params
	self._object = hud.panel.panel(tostring(slot5), hud.panel)

	return 
end
function HUDNameLabel:_create_name()
	local name_params = {
		align = "center",
		vertical = "center",
		name = "character_name"
	}
	slot4 = self._object
	name_params.w = self._object.w(slot3)
	name_params.h = HUDNameLabel.PLAYER_NAME_H
	name_params.font = HUDNameLabel.PLAYER_NAME_FONT
	name_params.font_size = HUDNameLabel.PLAYER_NAME_FONT_SIZE
	slot4 = self._name
	name_params.text = utf8.to_upper(slot3)
	slot5 = name_params
	self._character_name = self._object.text(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._character_name.set_center_x(slot3, self._character_name)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._character_name.set_center_y(slot3, self._character_name)

	return 
end
function HUDNameLabel:_create_nationality_icon()
	local nationality_icon = "player_panel_nationality_" .. tostring(slot3)
	local icon_params = {
		name = "nationality_icon"
	}
	slot5 = self._object
	icon_params.w = self._object.w(self._nationality)
	slot5 = self._object
	icon_params.h = self._object.h(self._nationality)
	icon_params.texture = tweak_data.gui.icons[nationality_icon].texture
	icon_params.texture_rect = tweak_data.gui.icons[nationality_icon].texture_rect
	slot6 = icon_params
	self._nationality_icon = self._object.bitmap(self._nationality, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	self._nationality_icon.set_center_x(self._nationality, self._nationality_icon)

	slot8 = self._object
	slot6 = self._object.h(slot7) / 2

	self._nationality_icon.set_center_y(self._nationality, self._nationality_icon)

	return 
end
function HUDNameLabel:_create_carry_icon()
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
	self._carry_icon = self._object.bitmap(slot4, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	self._carry_icon.set_center_x(slot4, self._carry_icon)

	slot8 = self._object
	slot6 = self._object.h(slot7) / 2

	self._carry_icon.set_center_y(slot4, self._carry_icon)

	return 
end
function HUDNameLabel:_create_warcry_icon(icon)
	icon = icon or tweak_data.warcry.sharpshooter.hud_icon
	local warcry_icon_params = {
		name = "warcry_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect
	}
	slot6 = warcry_icon_params
	self._warcry_icon = self._object.bitmap(slot4, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	self._warcry_icon.set_center_x(slot4, self._warcry_icon)

	slot8 = self._object
	slot6 = self._object.h(slot7) / 2

	self._warcry_icon.set_center_y(slot4, self._warcry_icon)

	slot6 = tweak_data.gui.colors.warcry_active

	self._warcry_icon.set_color(slot4, self._warcry_icon)

	return 
end
function HUDNameLabel:_create_lockpick_icon()
	local lockpick_icon_params = {
		name = "lockpick_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDNameLabel.LOCKPICK_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNameLabel.LOCKPICK_ICON].texture_rect
	}
	slot5 = lockpick_icon_params
	self._lockpick_icon = self._object.bitmap(HUDNameLabel.LOCKPICK_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._lockpick_icon.set_center_x(HUDNameLabel.LOCKPICK_ICON, self._lockpick_icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._lockpick_icon.set_center_y(HUDNameLabel.LOCKPICK_ICON, self._lockpick_icon)

	return 
end
function HUDNameLabel:_create_mounted_weapon_icon()
	local mounted_weapon_icon_params = {
		name = "mounted_weapon_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDNameLabel.MOUNTED_WEAPON_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNameLabel.MOUNTED_WEAPON_ICON].texture_rect
	}
	slot5 = mounted_weapon_icon_params
	self._mounted_weapon_icon = self._object.bitmap(HUDNameLabel.MOUNTED_WEAPON_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._mounted_weapon_icon.set_center_x(HUDNameLabel.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._mounted_weapon_icon.set_center_y(HUDNameLabel.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	return 
end
function HUDNameLabel:_create_timer()
	local timer_panel_params = {
		alpha = 0,
		name = "timer_panel",
		layer = 5
	}
	slot5 = timer_panel_params
	self._timer_panel = self._object.panel(slot3, self._object)
	local timer_background_params = {
		name = "timer_background",
		halign = "center",
		layer = 1,
		valign = "center",
		texture = tweak_data.gui.icons[HUDNameLabel.TIMER_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNameLabel.TIMER_BG_ICON].texture_rect
	}
	slot6 = timer_background_params
	local timer_background = self._timer_panel.bitmap(HUDNameLabel.TIMER_BG_ICON, self._timer_panel)
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
		texture = tweak_data.gui.icons[HUDNameLabel.TIMER_BAR_ICON].texture
	}
	slot9 = HUDNameLabel.TIMER_BAR_ICON
	slot9 = HUDNameLabel.TIMER_BAR_ICON
	timer_bar_params.texture_rect = {
		tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._timer_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDNameLabel.TIMER_BAR_ICON
	timer_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDNameLabel.TIMER_BAR_ICON
	timer_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = timer_bar_params
	self._timer_bar = self._timer_panel.bitmap(tweak_data.gui.icon_h, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.w(HUDNameLabel.TIMER_BAR_ICON) / 2

	self._timer_bar.set_center_x(tweak_data.gui.icon_h, self._timer_bar)

	slot10 = self._timer_panel
	slot8 = self._timer_panel.h(HUDNameLabel.TIMER_BAR_ICON) / 2

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
	timer_text_params.font = tweak_data.gui.fonts[HUDNameLabel.TIMER_FONT]
	timer_text_params.font_size = HUDNameLabel.TIMER_FONT_SIZE
	slot9 = timer_text_params
	self._timer_text = self._timer_panel.text(HUDNameLabel.TIMER_FONT, self._timer_panel)
	slot8 = self._timer_text
	local _, _, _, h = self._timer_text.text_rect(HUDNameLabel.TIMER_FONT)
	slot13 = h

	self._timer_text.set_h(slot11, self._timer_text)

	slot15 = self._timer_panel
	slot13 = self._timer_panel.h(slot14) / 2

	self._timer_text.set_center_y(slot11, self._timer_text)

	return 
end
function HUDNameLabel:_create_interaction_progress_bar()
	local interaction_panel_params = {
		alpha = 0,
		name = "interaction_panel",
		halign = "center",
		valign = "top",
		w = HUDNameLabel.INTERACTION_PANEL_W,
		h = HUDNameLabel.INTERACTION_PANEL_H
	}
	slot5 = interaction_panel_params
	self._interaction_panel = self._object.panel(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._interaction_panel.set_center_x(slot3, self._interaction_panel)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._interaction_panel.set_center_y(slot3, self._interaction_panel)

	local interaction_progress_background_params = {
		name = "interaction_progress_background",
		texture = tweak_data.gui.icons[HUDNameLabel.PROGRESS_BAR_ICON_BG].texture,
		texture_rect = tweak_data.gui.icons[HUDNameLabel.PROGRESS_BAR_ICON_BG].texture_rect
	}
	slot5 = self._interaction_panel
	interaction_progress_background_params.w = self._interaction_panel.w(HUDNameLabel.PROGRESS_BAR_ICON_BG)
	slot5 = self._interaction_panel
	interaction_progress_background_params.h = self._interaction_panel.h(HUDNameLabel.PROGRESS_BAR_ICON_BG)
	slot6 = interaction_progress_background_params
	local interaction_progress_background = self._interaction_panel.bitmap(HUDNameLabel.PROGRESS_BAR_ICON_BG, self._interaction_panel)
	slot9 = self._interaction_panel
	slot7 = self._interaction_panel.w(slot8) / 2

	interaction_progress_background.set_center_x(self._interaction_panel, interaction_progress_background)

	slot9 = self._interaction_panel

	interaction_progress_background.set_center_y(self._interaction_panel, interaction_progress_background)

	local interaction_progress_fill_params = {
		name = "interaction_progress_fill",
		position_z = 0,
		render_template = "VertexColorTexturedRadial",
		texture = tweak_data.gui.icons[HUDNameLabel.PROGRESS_BAR_ICON_FILL].texture
	}
	slot9 = HUDNameLabel.PROGRESS_BAR_ICON_FILL
	slot9 = HUDNameLabel.PROGRESS_BAR_ICON_FILL
	interaction_progress_fill_params.texture_rect = {
		tweak_data.gui.icon_w(self._interaction_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._interaction_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._interaction_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot7 = self._interaction_panel
	interaction_progress_fill_params.w = self._interaction_panel.w(tweak_data.gui.icon_h) + 6
	slot7 = self._interaction_panel
	interaction_progress_fill_params.h = self._interaction_panel.h(tweak_data.gui.icon_h) + 6
	slot7 = interaction_progress_background
	interaction_progress_fill_params.layer = interaction_progress_background.layer(tweak_data.gui.icon_h) + 1
	interaction_progress_fill_params.color = tweak_data.gui.colors.teammate_interaction_bar
	slot8 = interaction_progress_fill_params
	self._interaction_progress_fill = self._interaction_panel.bitmap(tweak_data.gui.icon_h, self._interaction_panel)
	slot10 = self._interaction_panel
	slot8 = self._interaction_panel.w(HUDNameLabel.PROGRESS_BAR_ICON_FILL) / 2

	self._interaction_progress_fill.set_center_x(tweak_data.gui.icon_h, self._interaction_progress_fill)

	slot10 = self._interaction_panel
	slot8 = self._interaction_panel.h(HUDNameLabel.PROGRESS_BAR_ICON_FILL) / 2

	self._interaction_progress_fill.set_center_y(tweak_data.gui.icon_h, self._interaction_progress_fill)

	return 
end
function HUDNameLabel:nationality()
	return self._nationality
end
function HUDNameLabel:id()
	return self._id
end
function HUDNameLabel:peer_id()
	return self._peer_id
end
function HUDNameLabel:movement()
	return self._movement
end
function HUDNameLabel:panel()
	return self._object
end
function HUDNameLabel:destroy()
	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	self._nationality = nil

	return 
end
function HUDNameLabel:go_into_bleedout()
	slot4 = "downed"

	self._add_active_state(slot2, self)

	return 
end
function HUDNameLabel:on_revived()
	slot4 = "downed"

	self._remove_active_state(slot2, self)

	slot3 = self

	self.stop_timer(slot2)

	return 
end
function HUDNameLabel:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDNameLabel:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDNameLabel:is_overlapping(name_label)
	local c1x = self._object.center_x(slot3)
	local c1y = self._object.center_y(self._object)
	slot6 = name_label
	local c2x = name_label.panel(self._object).center_x(self._object)
	slot7 = name_label
	local c2y = name_label.panel(name_label.panel(self._object)).center_y(name_label.panel(self._object))
	local h = self._object.h(name_label.panel(name_label.panel(self._object)))
	slot9 = self._object
	local w = self._object.w(self._object)
	local y_overlap = c1y - h / 2 < c2y + h / 2 or c2y - h / 2 < c1y + h / 2
	local x_overlap = c2x - h / 2 < c1x + h / 2 or c1x - h / 2 < c2x + h / 2

	return y_overlap and x_overlap
end
function HUDNameLabel:set_carry_info(carry_id)
	local carry_tweak_data = tweak_data.carry[carry_id]

	if carry_tweak_data and carry_tweak_data.hud_icon then
		slot6 = tweak_data.gui.icons[carry_tweak_data.hud_icon].texture

		self._carry_icon.set_image(slot4, self._carry_icon)

		slot5 = self._carry_icon
		slot8 = tweak_data.gui.icons[carry_tweak_data.hud_icon].texture_rect

		self._carry_icon.set_texture_rect(slot4, unpack(carry_tweak_data.hud_icon))

		slot8 = self._object
		slot6 = self._object.w(carry_tweak_data.hud_icon) / 2

		self._carry_icon.set_center_x(slot4, self._carry_icon)

		slot8 = self._object
		slot6 = self._object.h(carry_tweak_data.hud_icon) / 2

		self._carry_icon.set_center_y(slot4, self._carry_icon)

		slot6 = "carry"

		self._add_active_state(slot4, self)
	else
		slot9 = carry_id
		slot6 = "[HUDNameLabel] set_carry_info(): no tweak data or HUD icon for item " .. tostring(slot8)

		Application.debug(slot4, Application)
	end

	return 
end
function HUDNameLabel:remove_carry_info()
	slot4 = "carry"

	self._remove_active_state(slot2, self)

	return 
end
function HUDNameLabel:show_lockpick_icon()
	slot4 = "lockpick"

	self._add_active_state(slot2, self)

	return 
end
function HUDNameLabel:hide_lockpick_icon()
	slot4 = "lockpick"

	self._remove_active_state(slot2, self)

	return 
end
function HUDNameLabel:set_warcry(warcry)
	if self._warcry_icon then
		slot5 = self._warcry_icon

		self._object.remove(slot3, self._object)
	end

	local icon = tweak_data.warcry[warcry].hud_icon
	slot6 = icon

	self._create_warcry_icon(slot4, self)

	return 
end
function HUDNameLabel:activate_warcry()
	slot4 = "warcry"

	self._add_active_state(slot2, self)

	return 
end
function HUDNameLabel:deactivate_warcry()
	slot4 = "warcry"

	self._remove_active_state(slot2, self)

	return 
end
function HUDNameLabel:show_turret_icon()
	slot4 = "mounted_weapon"

	self._add_active_state(slot2, self)

	return 
end
function HUDNameLabel:hide_turret_icon()
	slot4 = "mounted_weapon"

	self._remove_active_state(slot2, self)

	return 
end
function HUDNameLabel:start_interact(duration)
	slot5 = "interaction"

	self._add_active_state(slot3, self)

	slot4 = self._interaction_progress_fill

	self._interaction_progress_fill.stop(slot3)

	slot9 = "_animate_interact"

	self._interaction_progress_fill.animate(slot3, self._interaction_progress_fill, callback(duration, self, self))

	return 
end
function HUDNameLabel:cancel_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_progress_fill

	self._interaction_progress_fill.stop(slot2)

	slot3 = self._interaction_progress_fill
	slot8 = "_animate_cancel_interact"

	self._interaction_progress_fill.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDNameLabel:complete_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_progress_fill

	self._interaction_progress_fill.stop(slot2)

	slot3 = self._interaction_progress_fill
	slot8 = "_animate_complete_interact"

	self._interaction_progress_fill.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDNameLabel:_add_active_state(state_id)
	self._active_states[state_id] = true
	slot4 = self

	self._check_state_change(true)

	return 
end
function HUDNameLabel:_remove_active_state(state_id)
	self._active_states[state_id] = nil
	slot4 = self

	self._check_state_change(nil)

	return 
end
function HUDNameLabel:_check_state_change()
	local new_state = nil

	for i = 1, #self._states, 1 do
		if self._active_states[self._states[i].id] then
			if self._states[i].id == self._displayed_state.id then
				return 
			end

			new_state = self._states[i]

			break
		end
	end

	if new_state then
		slot4 = self._object

		self._object.stop(slot3)

		slot9 = "_animate_state_change"

		self._object.animate(slot3, self._object, callback(new_state, self, self))
	end

	return 
end
function HUDNameLabel:start_timer(time, current)
	self._timer_total = time
	self._timer_current = current or time
	self._is_timer_running = true
	slot5 = self._timer_text
	slot10 = "_animate_timer_countdown"

	self._timer_text.animate(slot4, callback(slot7, self, self))

	return 
end
function HUDNameLabel:set_pause_timer(pause)
	self._is_timer_running = not pause

	return 
end
function HUDNameLabel:is_timer_running()
	return self._is_timer_running
end
function HUDNameLabel:stop_timer()
	self._timer_total = nil
	self._is_timer_running = false
	slot3 = self._timer_text

	self._timer_text.stop(slot2)

	return 
end
function HUDNameLabel:_animate_timer_countdown()
	while 0 < self._timer_current and self._timer_total and 0 < self._timer_total do
		local dt = coroutine.yield()

		if self._is_timer_running and self._timer_total and 0 < self._timer_total then

			-- Decompilation error in this vicinity:
			self._timer_current = self._timer_current - dt
			slot5 = self._timer_current / self._timer_total

			self._timer_bar.set_position_z(slot3, self._timer_bar)

			slot4 = self._timer_current
			slot6 = time_text

			self._timer_text.set_text(slot4, self._timer_text)
		end
	end

	return 
end
function HUDNameLabel:_animate_state_change(status_panel, new_state)
	local old_state = self._displayed_state
	local fade_out_duration = 0.15
	slot7 = self._object
	local t = (1 - self._object.alpha(slot6)) * fade_out_duration
	self._displayed_state = new_state

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._object.set_alpha(t, self._object)

		if new_state.hidden then
			slot10 = new_state.hidden

			for index, control_id in pairs(slot9) do
				slot16 = control_id
				local control = self._object.child(slot14, self._object)
				slot17 = current_alpha

				control.set_alpha(self._object, control)
			end
		end
	end

	slot8 = self._states

	for index, state in pairs(slot7) do
		slot14 = state.control
		slot14 = 0

		self._object.child(slot12, self._object).set_alpha(slot12, self._object.child(slot12, self._object))
	end

	slot9 = self._displayed_state.control
	slot9 = 1

	self._object.child(slot7, self._object).set_alpha(slot7, self._object.child(slot7, self._object))

	local fade_in_duration = 0.15
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot9, t, 0, 1)
		slot12 = current_alpha

		self._object.set_alpha(t, self._object)

		if old_state.hidden then
			slot11 = old_state.hidden

			for index, control_id in pairs(slot10) do
				slot17 = control_id
				local control = self._object.child(slot15, self._object)
				slot18 = current_alpha

				control.set_alpha(self._object, control)
			end
		end
	end

	slot10 = 1

	self._object.set_alpha(slot8, self._object)

	return 
end
function HUDNameLabel:_animate_interact(interact_image, duration)
	local size_increase_duration = 0.18
	local t = 0
	slot8 = 0

	self._interaction_progress_fill.set_position_z(slot6, self._interaction_progress_fill)

	slot8 = 0

	self._interaction_progress_fill.set_rotation(slot6, self._interaction_progress_fill)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_progress = Easing.linear(slot7, t, 0, 1)
		slot10 = current_progress

		self._interaction_progress_fill.set_position_z(t, self._interaction_progress_fill)
	end

	slot8 = 1

	self._interaction_progress_fill.set_position_z(slot6, self._interaction_progress_fill)

	return 
end
function HUDNameLabel:_animate_cancel_interact()
	local size_decrease_duration = 0.18
	local duration = 0.2
	slot5 = self._interaction_progress_fill
	local t = (1 - self._interaction_progress_fill.position_z(slot4)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 1, -1)
		slot9 = current_progress

		self._interaction_progress_fill.set_position_z(t, self._interaction_progress_fill)
	end

	slot7 = 0

	self._interaction_progress_fill.set_position_z(slot5, self._interaction_progress_fill)

	return 
end
function HUDNameLabel:_animate_complete_interact()
	local size_decrease_duration = 0.18
	local duration = 0.2
	local t = 0
	slot7 = 1

	self._interaction_progress_fill.set_position_z(slot5, self._interaction_progress_fill)

	slot7 = 0

	self._interaction_progress_fill.set_rotation(slot5, self._interaction_progress_fill)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 1, -1)
		slot9 = current_progress

		self._interaction_progress_fill.set_position_z(t, self._interaction_progress_fill)

		slot11 = duration
		local current_rotation = Easing.linear(t, t, 360, -360)
		slot10 = current_rotation

		self._interaction_progress_fill.set_rotation(t, self._interaction_progress_fill)
	end

	slot7 = 0

	self._interaction_progress_fill.set_position_z(slot5, self._interaction_progress_fill)

	slot7 = 0

	self._interaction_progress_fill.set_rotation(slot5, self._interaction_progress_fill)

	return 
end

return 
