HUDSpecialInteraction = HUDSpecialInteraction or class()
function HUDSpecialInteraction:init(hud, params)
	slot5 = managers.gui_data
	self._workspace = managers.gui_data.create_fullscreen_workspace(slot4)
	slot5 = self._workspace
	slot8 = TimerManager

	self._workspace.set_timer(slot4, TimerManager.game(slot7))

	slot5 = self._workspace
	self._bg_panel = self._workspace.panel(slot4)
	self._hud_panel = hud.panel
	self._tweak_data = params
	self._sides = 64
	self._child_name_text = "interact_child_text"
	self._child_ivalid_name_text = "interact_child_invalid_text"
	self._is_active = false
	self._circles = {}
	slot6 = self._child_name_text

	if self._hud_panel.child(slot4, self._hud_panel) then
		slot5 = self._hud_panel
		slot9 = self._child_name_text

		self._hud_panel.remove(slot4, self._hud_panel.child(slot7, self._hud_panel))
	end

	slot6 = self._child_ivalid_name_text

	if self._hud_panel.child(slot4, self._hud_panel) then
		slot5 = self._hud_panel
		slot9 = self._child_ivalid_name_text

		self._hud_panel.remove(slot4, self._hud_panel.child(slot7, self._hud_panel))
	end

	slot6 = {
		layer = 1,
		h = 64,
		font_size = 24,
		align = "center",
		text = "HELLO",
		visible = false,
		valign = "center",
		name = self._child_name_text,
		color = Color.white,
		font = tweak_data.gui.fonts.din_compressed_outlined_24
	}
	self._interact_text = self._hud_panel.text(slot4, self._hud_panel)
	slot6 = {
		layer = 3,
		h = 64,
		text = "HELLO",
		font_size = 24,
		align = "center",
		blend_mode = "normal",
		visible = false,
		valign = "center",
		name = self._child_ivalid_name_text,
		color = Color(slot8, 1, 0.3),
		font = tweak_data.gui.fonts.din_compressed_outlined_24
	}
	slot11 = 0.3
	self._invalid_text = self._hud_panel.text(slot4, self._hud_panel)
	slot8 = self._hud_panel
	slot6 = self._hud_panel.h(tweak_data.gui.fonts.din_compressed_outlined_24) / 2 + 64 + 16

	self._interact_text.set_y(slot4, self._interact_text)

	slot5 = self._invalid_text
	slot8 = self._interact_text

	self._invalid_text.set_center_y(slot4, self._interact_text.center_y(tweak_data.gui.fonts.din_compressed_outlined_24))

	local res_x = tweak_data.gui.base_resolution.x
	local res_y = tweak_data.gui.base_resolution.y
	slot8 = {
		name = "_background_texture",
		layer = 1,
		visible = false,
		y = 0,
		x = 0,
		texture = tweak_data.gui.backgrounds.secondary_menu.texture,
		texture_rect = tweak_data.gui.backgrounds.secondary_menu.texture_rect,
		w = res_x * 1.2,
		h = res_y
	}
	self._background_texture = self._bg_panel.bitmap(self._interact_text.center_y, self._bg_panel)
	slot8 = {
		name = "_lockpick_texture",
		layer = 2,
		visible = false,
		x = self._hud_panel.w(0.3) / 2,
		y = self._hud_panel.h(0.3) / 2,
		texture = tweak_data.gui.icons.interact_lockpick_tool.texture,
		texture_rect = tweak_data.gui.icons.interact_lockpick_tool.texture_rect
	}
	slot11 = self._hud_panel
	slot11 = self._hud_panel
	self._lockpick_texture = self._hud_panel.bitmap(self._interact_text.center_y, self._hud_panel)
	slot8 = {
		vertical = "center",
		name = "_legend_exit_text",
		layer = 2,
		wrap = false,
		font_size = 24,
		align = "center",
		word_wrap = false,
		text = "EXIT[SPACE]",
		x = 0,
		valign = "bottom",
		y = -self._hud_panel.y(0.3),
		font = tweak_data.gui.fonts.din_compressed_outlined_24,
		color = Color.white
	}
	slot11 = self._hud_panel
	self._legend_exit_text = self._hud_panel.text(self._interact_text.center_y, self._hud_panel)
	slot10 = self._hud_panel
	slot8 = self._hud_panel.center_x(Color.white) + 302

	self._legend_exit_text.set_center_x(self._interact_text.center_y, self._legend_exit_text)

	slot8 = self._hud_panel.center_y(Color.white) - 13

	self._legend_exit_text.set_center_y(self._interact_text.center_y, self._legend_exit_text)

	slot8 = {
		vertical = "center",
		name = "_legend_interact_text",
		layer = 2,
		wrap = false,
		font_size = 24,
		align = "center",
		word_wrap = false,
		text = "INTERACT[F]",
		x = 0,
		valign = "bottom",
		y = -self._hud_panel.y(self._hud_panel),
		font = tweak_data.gui.fonts.din_compressed_outlined_24,
		color = Color.white
	}
	slot11 = self._hud_panel
	self._legend_interact_text = self._hud_panel.text(self._interact_text.center_y, self._hud_panel)
	slot10 = self._hud_panel
	slot8 = self._hud_panel.center_x(Color.white) - 302

	self._legend_interact_text.set_center_x(self._interact_text.center_y, self._legend_interact_text)

	slot10 = self._hud_panel
	slot8 = self._hud_panel.center_y(Color.white) - 13

	self._legend_interact_text.set_center_y(self._interact_text.center_y, self._legend_interact_text)

	return 
end
function HUDSpecialInteraction:show()
	slot3 = self._lockpick_texture

	self._lockpick_texture.stop(slot2)

	slot4 = true

	self._background_texture.set_visible(slot2, self._background_texture)

	slot4 = 0.5

	self._background_texture.set_alpha(slot2, self._background_texture)

	slot4 = true

	self._legend_exit_text.set_visible(slot2, self._legend_exit_text)

	slot3 = self._legend_exit_text
	slot1 = self._legend_exit_text.set_text
	slot4 = utf8.to_upper
	slot8 = managers.localization
	slot6 = managers.localization.text
	slot9 = self._tweak_data.legend_exit_text_id or "hud_legend_lockpicking_exit"
	slot10 = {}
	slot14 = "jump"

	if not managers.localization.btn_macro(slot12, managers.localization) then
		slot13 = 57344
		slot11 = utf8.char(slot12)
	end

	slot10.BTN_CANCEL = slot11

	slot1(slot2, slot4(slot6(slot7, slot8, slot9)))

	slot4 = true

	self._legend_interact_text.set_visible(slot2, self._legend_interact_text)

	slot3 = self._legend_interact_text
	slot10 = {
		BTN_INTERACT = managers.localization.btn_macro(slot12, managers.localization)
	}
	slot14 = "interact"

	self._legend_interact_text.set_text(slot2, utf8.to_upper(managers.localization.text(slot7, managers.localization, self._tweak_data.legend_interact_text_id or "hud_legend_lockpicking_interact")))

	slot4 = true

	self._lockpick_texture.set_visible(slot2, self._lockpick_texture)

	slot7 = self._lockpick_texture
	slot8 = self._lockpick_texture

	self._lockpick_texture.set_position(slot2, self._lockpick_texture, self._hud_panel.w(self._hud_panel.h(self._hud_panel) / 2 - self._lockpick_texture.h(self._hud_panel) / 2) / 2 - self._lockpick_texture.w(self._hud_panel) / 2)

	slot3 = self

	self._remove_circles(slot2)

	for i = 1, self._tweak_data.number_of_circles, 1 do
		local circle_radius = self._tweak_data.circle_radius[i]
		slot10 = {
			use_bg = false,
			blend_mode = "add",
			layer = 2,
			image = tweak_data.gui.icons.interact_lockpick_circles[i].texture,
			radius = circle_radius,
			sides = self._sides,
			current = self._sides,
			total = self._sides,
			color = Color.white
		}
		local circle = CircleBitmapGuiObject.new(slot7, CircleBitmapGuiObject, self._hud_panel)
		slot13 = self._hud_panel
		slot11 = self._hud_panel.h(self._hud_panel) / 2 - circle_radius

		circle.set_position(CircleBitmapGuiObject, circle, self._hud_panel.w(Color.white) / 2 - circle_radius)

		local start_rotation = math.random() * 360
		slot11 = start_rotation

		circle._circle.set_rotation(circle, circle._circle)

		local circle_diff = self._tweak_data.circle_difficulty[i]
		slot12 = circle_diff

		circle.set_current(circle._circle, circle)

		self._circles[i] = {
			completed = false,
			valid = true,
			circle = circle
		}
	end

	self._is_active = true
	self._active_stage = 1

	return 
end
function HUDSpecialInteraction:complete_stage(index)
	local circle_data = self._circles[index]

	if circle_data then
		circle_data.completed = true
		local color = Color(slot4, self._tweak_data.circle_difficulty[index], 0.3, 0.3)
		slot7 = color

		circle_data.circle.set_color(self._tweak_data.circle_difficulty[index], circle_data.circle)

		slot7 = (1 - self._tweak_data.circle_difficulty[index]) * 180

		circle_data.circle._circle.set_rotation(self._tweak_data.circle_difficulty[index], circle_data.circle._circle)

		slot6 = self._hud_panel
		slot11 = "_animate_stage_complete"

		self._hud_panel.animate(self._tweak_data.circle_difficulty[index], callback(0.3, self, self))

		self._active_stage = index + 1
	end

	return 
end
function HUDSpecialInteraction:hide(complete)
	if complete then
		slot4 = self._lockpick_texture
		slot9 = "_animate_interaction_complete"

		self._lockpick_texture.animate(slot3, callback(slot6, self, self))
	else
		slot4 = self

		self._remove_circles(slot3)
	end

	slot5 = false

	self._background_texture.set_visible(slot3, self._background_texture)

	slot5 = false

	self._legend_exit_text.set_visible(slot3, self._legend_exit_text)

	slot5 = false

	self._legend_interact_text.set_visible(slot3, self._legend_interact_text)

	slot5 = false

	self._lockpick_texture.set_visible(slot3, self._lockpick_texture)

	self._is_active = false

	return 
end
function HUDSpecialInteraction:set_bar_valid(circle_id, valid)
	if circle_id < 1 then
		return 
	elseif self._tweak_data.number_of_circles < circle_id then
		return 
	end

	local circle_data = self._circles[circle_id]
	circle_data.valid = valid
	slot9 = 1
	local color = Color(slot5, self._tweak_data.circle_difficulty[circle_id], 1, 1)

	if not valid then
		slot10 = 0.180392
		color = Color(slot6, self._tweak_data.circle_difficulty[circle_id], 0.7215686, 0.22353)
	end

	slot8 = color

	circle_data.circle.set_color(slot6, circle_data.circle)

	return 
end
function HUDSpecialInteraction:rotate_circles(dt)
	slot4 = self._circles

	for i, circle_data in pairs(slot3) do
		if not circle_data.completed and i == self._active_stage then
			local circle = circle_data.circle._circle
			slot10 = circle
			local current_rot = circle.rotation(slot9)
			local rotation_speed = self._tweak_data.circle_rotation_speed[i]

			if not circle_data.valid then
				rotation_speed = rotation_speed * 10
			end

			local delta = rotation_speed * dt * self._tweak_data.circle_rotation_direction[i]
			local new_rot = (current_rot + delta) % 360
			slot15 = new_rot

			circle.set_rotation(slot13, circle)
		end
	end

	return 
end
function HUDSpecialInteraction:_remove_circles()
	if self ~= nil then
		slot3 = self._circles

		for _, circle_data in pairs(slot2) do
			slot8 = circle_data.circle

			circle_data.circle.remove(slot7)
		end

		self._circles = {}
	end

	return 
end
function HUDSpecialInteraction:destroy()
	slot3 = self._hud_panel

	self._hud_panel.clear(slot2)

	slot3 = self

	self._remove_circles(slot2)

	return 
end
function HUDSpecialInteraction:set_circle_value(index, value)
	local circle_data = self._circles[index]

	if circle_data then
		slot7 = value

		circle_data.circle.set_current(slot5, circle_data.circle)
	end

	return 
end
function HUDSpecialInteraction:is_visible()
	return self._is_active
end
function HUDSpecialInteraction:circles()
	return self._circles
end
function HUDSpecialInteraction:set_tweak_data(data)
	self._tweak_data = data

	return 
end
function HUDSpecialInteraction:_animate_interaction_complete()
	local TOTAL_T = 0.5
	local starting_rotations = {}

	for i = 1, #self._circles, 1 do
		starting_rotations[i] = (1 - self._tweak_data.circle_difficulty[i]) * 180
	end

	local t = TOTAL_T

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		local progress = t / TOTAL_T

		for i = 1, #self._circles, 1 do
			slot15 = self._tweak_data.circle_difficulty[i] - 1 - progress
			slot12 = math.max(slot13, 0)
			slot15 = progress
			local color = Color(slot11, slot12, progress, progress)
			slot14 = color

			self._circles[i].circle.set_color(slot12, self._circles[i].circle)

			slot14 = starting_rotations[i] + (1 - progress) * 180

			self._circles[i].circle._circle.set_rotation(slot12, self._circles[i].circle._circle)
		end
	end

	for i = 1, #self._circles, 1 do
		slot11 = false

		self._circles[i].circle.set_visible(slot9, self._circles[i].circle)
	end

	self._remove_circles()

	return 
end
function HUDSpecialInteraction:_animate_stage_complete()
	local TOTAL_T = 0.7
	local DELTA_Y = 24
	slot5 = self._lockpick_texture
	local start_y = self._lockpick_texture.y(slot4)
	local end_y = start_y - DELTA_Y
	local t = 0.3

	while t <= TOTAL_T do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = TOTAL_T
		local cur_delta_y = HUDSpecialInteraction._ease_in_quint(slot8, HUDSpecialInteraction, t, 0, DELTA_Y)
		slot11 = start_y - cur_delta_y

		self._lockpick_texture.set_y(HUDSpecialInteraction, self._lockpick_texture)
	end

	slot9 = end_y

	self._lockpick_texture.set_y(slot7, self._lockpick_texture)

	return 
end
function HUDSpecialInteraction:_ease_in_quint(time, begin, change, duration)
	local alpha = time / duration

	return begin + change * alpha * alpha * alpha * alpha * alpha
end

return 
