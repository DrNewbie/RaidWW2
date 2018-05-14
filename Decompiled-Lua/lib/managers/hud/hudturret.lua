HUDTurret = HUDTurret or class()
HUDTurret.W = 380
HUDTurret.H = 288
HUDTurret.BACKGROUND_IMAGE = "backgrounds_machine_gun_empty"
HUDTurret.FOREGROUND_IMAGE = "machine_gun_full"
HUDTurret.HEAT_INDICATOR_W = 380
HUDTurret.HEAT_INDICATOR_H = 84
HUDTurret.HEAT_INDICATOR_COLORS = tweak_data.gui.colors.turret_heat_colors
HUDTurret.HEAT_INDICATOR_OVERHEAT_COLOR = tweak_data.gui.colors.turret_overheat
HUDTurret.DISMOUNT_PROMPT_H = 64
HUDTurret.DISMOUNT_PROMPT_TEXT = "hud_action_exit_turret"
HUDTurret.DISMOUNT_PROMPT_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDTurret.DISMOUNT_PROMPT_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDTurret.DISMOUNT_PROMPT_INITIAL_DELAY = 1
HUDTurret.DISMOUNT_PROMPT_HOLD_TIME = 4
HUDTurret.DISMOUNT_PROMPT_DELAY = 8
HUDTurret.DEFAULT_RETICLE = "weapons_reticles_ass_carbine"
HUDTurret.SHELL_POSITION_CENTER_X = 770
function HUDTurret:init(hud)
	self._hud_panel = hud.panel
	slot5 = "turret_panel"

	if self._hud_panel.child(slot3, self._hud_panel) then
		slot4 = self._hud_panel
		slot8 = "turret_panel"

		self._hud_panel.remove(slot3, self._hud_panel.child(slot6, self._hud_panel))
	end

	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_heat_indicator(slot3)

	slot4 = self

	self._create_dismount_prompt(slot3)

	slot4 = self

	self._create_reticle(slot3)

	slot4 = self

	self._create_shell(slot3)

	self._is_flak = false

	return 
end
function HUDTurret:_create_panel(hud)
	local panel_params = {
		alpha = 0,
		name = "turret_panel",
		halign = "center",
		valign = "center"
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDTurret:_create_heat_indicator()
	local heat_indicator_panel_params = {
		name = "heat_indicator_panel",
		halign = "center",
		valign = "bottom",
		w = HUDTurret.HEAT_INDICATOR_W,
		h = HUDTurret.HEAT_INDICATOR_H
	}
	slot5 = heat_indicator_panel_params
	self._heat_indicator_panel = self._object.panel(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._heat_indicator_panel.set_center_x(slot3, self._heat_indicator_panel)

	slot4 = self._heat_indicator_panel
	slot7 = self._object

	self._heat_indicator_panel.set_bottom(slot3, self._object.h(slot6))

	local heat_indicator_background_params = {
		name = "background",
		texture = tweak_data.gui.icons[HUDTurret.BACKGROUND_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDTurret.BACKGROUND_IMAGE].texture_rect
	}
	slot6 = heat_indicator_background_params
	self._heat_indicator_background = self._heat_indicator_panel.bitmap(HUDTurret.BACKGROUND_IMAGE, self._heat_indicator_panel)
	local heat_indicator_foreground_panel_params = {
		halign = "scale",
		name = "heat_indicator_foreground_panel",
		y = 0,
		x = 0,
		valign = "scale"
	}
	slot6 = self._heat_indicator_panel
	heat_indicator_foreground_panel_params.w = self._heat_indicator_panel.w(self._heat_indicator_panel)
	slot6 = self._heat_indicator_panel
	heat_indicator_foreground_panel_params.h = self._heat_indicator_panel.h(self._heat_indicator_panel)
	slot6 = self._heat_indicator_background
	heat_indicator_foreground_panel_params.layer = self._heat_indicator_background.layer(self._heat_indicator_panel) + 1
	slot7 = heat_indicator_foreground_panel_params
	self._heat_indicator_foreground_panel = self._heat_indicator_panel.panel(self._heat_indicator_panel, self._heat_indicator_panel)
	local heat_indicator_foreground_params = {
		name = "heat_indicator_foreground",
		texture = tweak_data.gui.icons[HUDTurret.FOREGROUND_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDTurret.FOREGROUND_IMAGE].texture_rect
	}
	slot8 = heat_indicator_foreground_params
	self._heat_indicator_foreground = self._heat_indicator_foreground_panel.bitmap(HUDTurret.FOREGROUND_IMAGE, self._heat_indicator_foreground_panel)

	return 
end
function HUDTurret:_create_dismount_prompt()
	local dismount_prompt_panel_params = {
		alpha = 0,
		name = "dismount_prompt_panel",
		halign = "scale",
		valign = "top"
	}
	slot4 = self._object
	dismount_prompt_panel_params.w = self._object.w(slot3)
	dismount_prompt_panel_params.h = HUDTurret.DISMOUNT_PROMPT_H
	slot5 = dismount_prompt_panel_params
	self._dismount_prompt_panel = self._object.panel(slot3, self._object)
	slot7 = self._heat_indicator_panel
	slot5 = self._heat_indicator_panel.y(slot6) - 200

	self._dismount_prompt_panel.set_y(slot3, self._dismount_prompt_panel)

	local dismount_prompt_text_params = {
		layer = 5,
		vertical = "center",
		name = "text",
		align = "center",
		halign = "center",
		valign = "center",
		font = HUDTurret.DISMOUNT_PROMPT_TEXT_FONT,
		font_size = HUDTurret.DISMOUNT_PROMPT_TEXT_FONT_SIZE
	}
	slot9 = {
		BTN_INTERACT = managers.localization.btn_macro(slot11, managers.localization)
	}
	slot13 = "interact"
	dismount_prompt_text_params.text = utf8.to_upper(managers.localization.text(slot6, managers.localization, HUDTurret.DISMOUNT_PROMPT_TEXT))
	slot6 = dismount_prompt_text_params
	self._dismount_prompt_text = self._dismount_prompt_panel.text(self._dismount_prompt_panel, self._dismount_prompt_panel)
	slot5 = self._dismount_prompt_text
	local _, _, w, h = self._dismount_prompt_text.text_rect(self._dismount_prompt_panel)
	slot10 = w

	self._dismount_prompt_text.set_w(HUDTurret.DISMOUNT_PROMPT_TEXT, self._dismount_prompt_text)

	slot10 = h

	self._dismount_prompt_text.set_h(HUDTurret.DISMOUNT_PROMPT_TEXT, self._dismount_prompt_text)

	slot12 = self._dismount_prompt_panel
	slot10 = self._dismount_prompt_panel.w(slot11) / 2

	self._dismount_prompt_text.set_center_x(HUDTurret.DISMOUNT_PROMPT_TEXT, self._dismount_prompt_text)

	slot12 = self._dismount_prompt_panel
	slot10 = self._dismount_prompt_panel.h(slot11) / 2

	self._dismount_prompt_text.set_center_y(HUDTurret.DISMOUNT_PROMPT_TEXT, self._dismount_prompt_text)

	return 
end
function HUDTurret:_create_reticle()
	local reticle_params = {
		name = "turret_reticle",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTurret.DEFAULT_RETICLE].texture,
		texture_rect = tweak_data.gui.icons[HUDTurret.DEFAULT_RETICLE].texture_rect
	}
	slot5 = reticle_params
	self._reticle = self._object.bitmap(HUDTurret.DEFAULT_RETICLE, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._reticle.set_center_x(HUDTurret.DEFAULT_RETICLE, self._reticle)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._reticle.set_center_y(HUDTurret.DEFAULT_RETICLE, self._reticle)

	return 
end
function HUDTurret:_create_shell()
	local params_bg = {
		name = "shell_bg",
		halign = "center",
		alpha = 0,
		layer = 1,
		valign = "center",
		texture = tweak_data.gui.icons.aa_gun_bg.texture,
		texture_rect = tweak_data.gui.icons.aa_gun_bg.texture_rect
	}
	slot5 = params_bg
	self._shell_bg = self._object.bitmap(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._shell_bg.set_center_x(slot3, self._shell_bg)

	slot5 = self._object.h(slot6) - 32

	self._shell_bg.set_bottom(slot3, self._shell_bg)

	local params_fade = {
		name = "shell_fade",
		halign = "center",
		alpha = 0,
		layer = 2,
		valign = "center",
		texture = tweak_data.gui.icons.aa_gun_flak.texture,
		texture_rect = tweak_data.gui.icons.aa_gun_flak.texture_rect
	}
	slot6 = params_fade
	self._shell_fade = self._object.bitmap(self._shell_bg, self._object)
	slot5 = self._shell_fade
	slot8 = self._shell_bg

	self._shell_fade.set_center_y(self._shell_bg, self._shell_bg.center_y(self._object))

	slot6 = self._shell_bg.x(self._object) + 2

	self._shell_fade.set_x(self._shell_bg, self._shell_fade)

	local params_shell = {
		name = "shell",
		halign = "center",
		alpha = 0,
		layer = 3,
		valign = "center",
		texture = tweak_data.gui.icons.aa_gun_flak.texture,
		texture_rect = tweak_data.gui.icons.aa_gun_flak.texture_rect
	}
	slot7 = params_shell
	self._shell = self._object.bitmap(self._shell_fade, self._object)
	slot9 = self._shell_bg
	slot7 = self._shell_bg.x(self._shell_bg) + 2

	self._shell.set_x(self._shell_fade, self._shell)

	slot6 = self._shell
	slot9 = self._shell_bg

	self._shell.set_center_y(self._shell_fade, self._shell_bg.center_y(self._shell_bg))

	return 
end
function HUDTurret:set_reticle(reticle)
	slot5 = tweak_data.gui.icons[reticle].texture

	self._reticle.set_image(slot3, self._reticle)

	slot4 = self._reticle
	slot7 = tweak_data.gui.icons[reticle].texture_rect

	self._reticle.set_texture_rect(slot3, unpack(slot6))

	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._reticle.set_center_x(slot3, self._reticle)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._reticle.set_center_y(slot3, self._reticle)

	slot4 = self._reticle

	self._reticle.stop(slot3)

	slot9 = "_animate_show"

	self._reticle.animate(slot3, self._reticle, callback(0.15, self, self))

	return 
end
function HUDTurret:show(turret_unit, bullet_type)
	slot6 = 0

	self._dismount_prompt_panel.set_alpha(slot4, self._dismount_prompt_panel)

	slot5 = self._object

	self._object.stop(slot4)

	if bullet_type ~= nil and bullet_type == "shell" then
		slot5 = self._object
		slot10 = "_animate_flak_show"

		self._object.animate(slot4, callback(slot7, self, self))

		self._is_flak = true
	else
		slot5 = self._object
		slot10 = "_animate_normal_show"

		self._object.animate(slot4, callback(slot7, self, self))

		self._is_flak = false
	end

	slot5 = managers.hud

	managers.hud.unselect_all_weapons(slot4)

	slot11 = nil

	managers.queued_tasks.queue(slot4, managers.queued_tasks, "hud_turret_prompt", self.show_prompt, self, nil, HUDTurret.DISMOUNT_PROMPT_INITIAL_DELAY)

	local turret_unit = managers.player.get_turret_unit(slot4)
	slot6 = turret_unit
	slot6 = turret_unit.weapon(managers.player)
	local turret_tweak_data = turret_unit.weapon(managers.player).weapon_tweak_data(managers.player)

	if turret_tweak_data.hud and turret_tweak_data.hud.reticle then
		slot8 = turret_tweak_data.hud.reticle

		self.set_reticle(slot6, self)
	end

	return 
end
function HUDTurret:hide()
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	slot4 = "hud_turret_prompt"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	slot3 = self._reticle

	self._reticle.stop(slot2)

	slot8 = "_animate_hide"

	self._reticle.animate(slot2, self._reticle, callback(0.15, self, self))

	return 
end
function HUDTurret:show_prompt()
	slot3 = self._dismount_prompt_panel

	self._dismount_prompt_panel.stop(slot2)

	slot3 = self._dismount_prompt_text
	slot10 = {
		BTN_INTERACT = managers.localization.btn_macro(slot12, managers.localization)
	}
	slot14 = "interact"

	self._dismount_prompt_text.set_text(slot2, utf8.to_upper(managers.localization.text(slot7, managers.localization, HUDTurret.DISMOUNT_PROMPT_TEXT)))

	slot3 = self._dismount_prompt_panel
	slot8 = "_animate_show"

	self._dismount_prompt_panel.animate(slot2, callback(slot5, self, self))

	slot9 = nil

	managers.queued_tasks.queue(slot2, managers.queued_tasks, "hud_turret_prompt", self.hide_prompt, self, nil, HUDTurret.DISMOUNT_PROMPT_HOLD_TIME)

	return 
end
function HUDTurret:hide_prompt()
	slot3 = self._dismount_prompt_panel

	self._dismount_prompt_panel.stop(slot2)

	slot3 = self._dismount_prompt_panel
	slot8 = "_animate_hide"

	self._dismount_prompt_panel.animate(slot2, callback(slot5, self, self))

	slot9 = nil

	managers.queued_tasks.queue(slot2, managers.queued_tasks, "hud_turret_prompt", self.show_prompt, self, nil, HUDTurret.DISMOUNT_PROMPT_DELAY)

	return 
end
function HUDTurret:update_heat_indicator(current)
	if self._is_flak then
		return 
	end

	slot7 = self._heat_indicator_panel
	slot5 = current * self._heat_indicator_panel.w(slot6)

	self._heat_indicator_foreground_panel.set_w(slot3, self._heat_indicator_foreground_panel)

	if not self._overheating then
		slot4 = self._heat_indicator_foreground
		slot9 = current

		self._heat_indicator_foreground.set_color(slot3, self._get_color_for_percentage(slot6, self, HUDTurret.HEAT_INDICATOR_COLORS))
	else
		slot5 = HUDTurret.HEAT_INDICATOR_OVERHEAT_COLOR

		self._heat_indicator_foreground.set_color(slot3, self._heat_indicator_foreground)
	end

	return 
end
function HUDTurret:set_overheating(value)
	self._overheating = value

	return 
end
function HUDTurret:overheat(turret_unit)
	slot4 = turret_unit
	slot4 = turret_unit.weapon(slot3)
	local turret_tweak_data = turret_unit.weapon(slot3).weapon_tweak_data(slot3)

	if turret_tweak_data.name == "turret_flak_88" then
		slot5 = self._shell
		slot10 = "_animate_shell_fire"

		self._shell.animate(slot4, callback(slot7, self, self))
	else
		self._overheating = true
		slot6 = HUDTurret.HEAT_INDICATOR_OVERHEAT_COLOR

		self._heat_indicator_foreground.set_color(slot4, self._heat_indicator_foreground)
	end

	return 
end
function HUDTurret:cooldown()
	self._overheating = false

	return 
end
function HUDTurret:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDTurret:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDTurret:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDTurret:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDTurret:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end
function HUDTurret:_animate_show(object, animation_duration)
	local duration = animation_duration or 0.4
	slot6 = object
	local t = object.alpha(slot5) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_alpha = Easing.quartic_in_out(slot7, t, 0, 1)
		slot10 = current_alpha

		object.set_alpha(t, object)
	end

	slot8 = 1

	object.set_alpha(slot6, object)

	return 
end
function HUDTurret:_animate_normal_show(object, animation_duration)
	local duration = animation_duration or 0.4
	local t = 0
	slot8 = 1

	self._object.set_alpha(slot6, self._object)

	slot8 = 0

	self._heat_indicator_background.set_alpha(slot6, self._heat_indicator_background)

	slot8 = 1

	self._heat_indicator_foreground.set_alpha(slot6, self._heat_indicator_foreground)

	slot8 = 0

	self._shell.set_alpha(slot6, self._shell)

	slot8 = 0

	self._shell_fade.set_alpha(slot6, self._shell_fade)

	slot8 = 0

	self._shell_bg.set_alpha(slot6, self._shell_bg)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_alpha = t / duration
		slot10 = current_alpha

		self._heat_indicator_background.set_alpha(slot8, self._heat_indicator_background)
	end

	slot8 = 1

	self._heat_indicator_background.set_alpha(slot6, self._heat_indicator_background)

	return 
end
function HUDTurret:_animate_flak_show(object, animation_duration)
	local duration = animation_duration or 0.4
	local t = 0
	slot8 = 1

	self._object.set_alpha(slot6, self._object)

	slot8 = 0

	self._heat_indicator_background.set_alpha(slot6, self._heat_indicator_background)

	slot8 = 0

	self._heat_indicator_foreground.set_alpha(slot6, self._heat_indicator_foreground)

	local show_shell = false
	slot8 = self._shell

	if self._shell.alpha(self._heat_indicator_foreground) == 1 then
		show_shell = true
	end

	slot9 = 0

	self._shell_bg.set_alpha(slot7, self._shell_bg)

	slot9 = 0

	self._shell_fade.set_alpha(slot7, self._shell_fade)

	slot9 = 0

	self._shell.set_alpha(slot7, self._shell)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_alpha = t / duration
		slot11 = current_alpha

		self._shell_bg.set_alpha(slot9, self._shell_bg)

		slot11 = 0.1 * current_alpha

		self._shell_fade.set_alpha(slot9, self._shell_fade)

		if show_shell then
			slot11 = current_alpha

			self._shell.set_alpha(slot9, self._shell)
		end
	end

	slot9 = 1

	self._shell_bg.set_alpha(slot7, self._shell_bg)

	slot9 = 0.1

	self._shell_fade.set_alpha(slot7, self._shell_fade)

	if show_shell then
		slot9 = 1

		self._shell.set_alpha(slot7, self._shell)
	end

	return 
end
function HUDTurret:_animate_hide(object, animation_duration)
	local duration = animation_duration or 0.4
	slot6 = object
	local t = (1 - object.alpha(slot5)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_alpha = Easing.quartic_in_out(slot7, t, 1, -1)
		slot10 = current_alpha

		object.set_alpha(t, object)
	end

	slot8 = 0

	object.set_alpha(slot6, object)

	return 
end
function HUDTurret:flak_fire()
	slot3 = self._shell
	slot8 = "_animate_shell_fire"

	self._shell.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTurret:flak_insert()
	if self._is_flak then
		slot3 = self._shell
		slot8 = "_animate_shell_insert"

		self._shell.animate(slot2, callback(slot5, self, self))
	end

	return 
end
function HUDTurret:_animate_shell_insert()
	local duration = 0.7
	local t = 0
	slot6 = 0

	self._shell.set_alpha(slot4, self._shell)

	slot8 = self._shell_bg
	slot6 = self._shell_bg.x(slot7) + 1

	self._shell.set_x(slot4, self._shell)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local alpha = Easing.quadratic_in(slot5, t, 0, 1)
		slot8 = alpha

		self._shell.set_alpha(t, self._shell)
	end

	slot6 = 1

	self._shell.set_alpha(slot4, self._shell)

	return 
end
function HUDTurret:_animate_shell_fire()
	local duration = 0.2
	local t = 0
	local delta_move = tweak_data.gui.icons.aa_gun_bg.texture_rect[3]
	local shell_width = tweak_data.gui.icons.aa_gun_flak.texture_rect[3]

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local pos_alpha = t / duration
		local pos_delta = pos_alpha * tweak_data.gui.icons.aa_gun_bg.texture_rect[3]
		local new_pos = self._shell_bg.x(slot9) + pos_delta
		slot12 = new_pos

		self._shell.set_x(self._shell_bg, self._shell)

		slot11 = self._shell_bg

		if self._shell_bg.x(self._shell_bg) + shell_width < new_pos then
			slot14 = duration
			local alpha_alpha = Easing.quadratic_in(slot10, t, 0, 1)
			slot13 = 1 - alpha_alpha

			self._shell.set_alpha(t, self._shell)
		end
	end

	slot7 = self._shell
	slot10 = self._shell_bg

	self._shell.set_x(slot6, self._shell_bg.x(slot9))

	slot8 = 0

	self._shell.set_alpha(slot6, self._shell)

	return 
end

return 
