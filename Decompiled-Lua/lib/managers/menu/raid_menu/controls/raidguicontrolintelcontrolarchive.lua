-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlIntelControlArchive then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelControlArchive = slot0
function RaidGUIControlIntelControlArchive:init(parent, params)
	RaidGUIControlIntelControlArchive.super.init(slot4, self, parent)

	slot5 = managers.raid_menu
	slot10 = "on_escape"

	managers.raid_menu.register_on_escape_callback(slot4, callback(params, self, self))

	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	self._category_name = "control_archive"

	self._layout(slot4)

	self._play_panel_inside = false
	self._controller_list = {}
	slot6 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self), 1 do
		slot12 = false
		local con = managers.controller.create_controller(slot8, managers.controller, "boot_" .. index, index)
		slot10 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	self._disable_input_timer = 0

	return 
end
function RaidGUIControlIntelControlArchive:_layout()
	slot4 = {
		y = 0,
		visible = false,
		x = 0,
		w = tweak_data.gui.icons.intel_table_archive.texture_rect[3],
		h = tweak_data.gui.icons.intel_table_archive.texture_rect[4],
		texture = tweak_data.gui.icons.intel_table_archive.texture,
		texture_rect = tweak_data.gui.icons.intel_table_archive.texture_rect,
		layer = self._object.layer(slot6) + 1
	}
	slot7 = self._object
	self._bg_image = self._object.bitmap(slot2, self._object)
	slot4 = {
		visible = false,
		h = 448,
		y = 128,
		w = 796,
		x = 112,
		layer = self._object.layer(slot6) + 2,
		texture = tweak_data.gui.icons.intel_table_archive.texture,
		texture_rect = tweak_data.gui.icons.intel_table_archive.texture_rect
	}
	slot7 = self._object
	self._image = self._object.bitmap(slot2, self._object)
	slot4 = {
		visible = false,
		y = 0,
		x = 0,
		w = tweak_data.gui.icons.play_icon_outline.texture_rect[3],
		h = tweak_data.gui.icons.play_icon_outline.texture_rect[4],
		layer = self._object.layer(slot6) + 2
	}
	slot7 = self._object
	self._play_panel = self._object.panel(slot2, self._object)
	slot4 = {
		visible = false,
		y = 0,
		x = 0,
		layer = self._object.layer(slot6) + 3,
		color = tweak_data.gui.colors.raid_dirty_white,
		texture = tweak_data.gui.icons.play_icon_outline.texture,
		texture_rect = tweak_data.gui.icons.play_icon_outline.texture_rect
	}
	slot7 = self._object
	self._play_circle = self._play_panel.bitmap(slot2, self._play_panel)
	slot4 = {
		visible = false,
		y = 0,
		x = 0,
		layer = self._object.layer(slot6) + 4,
		texture = tweak_data.gui.icons.play_icon.texture,
		texture_rect = tweak_data.gui.icons.play_icon.texture_rect
	}
	slot7 = self._object
	self._play_icon = self._play_panel.bitmap(slot2, self._play_panel)

	return 
end
function RaidGUIControlIntelControlArchive:set_data(item_value)
	self._data = tweak_data.intel.get_item_data(slot3, tweak_data.intel, self._category_name)
	slot5 = true

	self._bg_image.set_visible(slot3, self._bg_image)

	slot5 = self._data.texture

	self._image.set_image(slot3, self._image)

	slot4 = self._image
	slot7 = self._data.texture_rect

	self._image.set_texture_rect(slot3, unpack(item_value))

	slot5 = true

	self._image.set_visible(slot3, self._image)

	slot7 = self._bg_image
	slot5 = self._bg_image.w(item_value) / 2

	self._play_panel.set_center_x(slot3, self._play_panel)

	slot7 = self._bg_image
	slot5 = self._bg_image.h(item_value) / 2

	self._play_panel.set_center_y(slot3, self._play_panel)

	slot5 = true

	self._play_panel.set_visible(slot3, self._play_panel)

	slot7 = self._play_panel
	slot5 = self._play_panel.w(item_value) / 2

	self._play_circle.set_center_x(slot3, self._play_circle)

	slot7 = self._play_panel
	slot5 = self._play_panel.h(item_value) / 2

	self._play_circle.set_center_y(slot3, self._play_circle)

	slot5 = true

	self._play_circle.set_visible(slot3, self._play_circle)

	slot7 = self._play_panel
	slot5 = self._play_panel.w(item_value) / 2

	self._play_icon.set_center_x(slot3, self._play_icon)

	slot7 = self._play_panel
	slot5 = self._play_panel.h(item_value) / 2

	self._play_icon.set_center_y(slot3, self._play_icon)

	slot5 = true

	self._play_icon.set_visible(slot3, self._play_icon)

	return 
end
function RaidGUIControlIntelControlArchive:get_data()
	return self._data
end
function RaidGUIControlIntelControlArchive:mouse_released(o, button, x, y)
	if self._play_panel then
		slot9 = y

		if self._play_panel.inside(slot6, self._play_panel, x) and (not self._disable_input_timer or (self._disable_input_timer and self._disable_input_timer == 0)) then
			slot7 = self

			self._play_video(slot6)
		end
	end

	return 
end
function RaidGUIControlIntelControlArchive:mouse_moved(o, x, y)
	slot8 = y

	if self.inside(slot5, self, x) then
		slot8 = y

		if self._play_panel.inside(slot5, self._play_panel, x) and not self._play_panel_inside then
			self._play_panel_inside = true
			slot6 = self._play_panel
			slot11 = "_animate_play_button"

			self._play_panel.animate(slot5, callback(slot8, self, self))

			slot7 = tweak_data.gui.colors.raid_red

			self._play_circle.set_color(slot5, self._play_circle)
		end

		slot8 = y

		if not self._play_panel.inside(slot5, self._play_panel, x) and self._play_panel_inside then
			self._play_panel_inside = false
			slot6 = self._play_panel

			self._play_panel.stop(slot5)

			slot7 = tweak_data.gui.colors.raid_dirty_white

			self._play_circle.set_color(slot5, self._play_circle)
		end
	end

	return false
end
function RaidGUIControlIntelControlArchive:update(t, dt)
	if self._control_video then
		slot5 = self
	end

	if self._disable_input_timer and 0 < self._disable_input_timer then
		self._disable_input_timer = self._disable_input_timer - dt

		if self._disable_input_timer < 0 then
			self._disable_input_timer = 0
		end
	end

	return 
end
function RaidGUIControlIntelControlArchive:close()
	if self._control_video and self._panel then
		slot3 = self._control_video

		self._control_video.destroy(slot2)

		slot4 = self._control_video

		self._panel.remove(slot2, self._panel)

		slot3 = self._panel

		self._panel.remove_background(slot2)

		slot3 = self._panel
		slot7 = "disclaimer"

		self._panel.remove(slot2, self._panel.child(slot5, self._panel))

		self._control_video = nil
		self._panel = nil
		slot4 = "press_any_key_prompt"
		slot3 = self._safe_panel.child(slot2, self._safe_panel)

		self._safe_panel.child(slot2, self._safe_panel).stop(slot2)

		slot3 = self._safe_panel
		slot7 = "press_any_key_prompt"

		self._safe_panel.remove(slot2, self._safe_panel.child(slot5, self._safe_panel))
	end

	return 
end
function RaidGUIControlIntelControlArchive:on_escape()
	slot3 = self

	if self.is_playing(slot2) then
		return true
	end

	return 
end
function RaidGUIControlIntelControlArchive:_animate_play_button()
	local duration = 0.1
	local t = 0
	local original_width = self._play_panel.w(slot4)
	local original_height = self._play_panel.h(self._play_panel)
	local original_center_x = self._play_panel.center_x(self._play_panel)
	slot8 = self._play_panel
	local original_center_y = self._play_panel.center_y(self._play_panel)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local current_size_modifier = Easing.quartic_in_out(slot9, t, 1, 0.1)
		slot12 = original_width * current_size_modifier

		self._play_panel.set_w(t, self._play_panel)

		slot12 = original_height * current_size_modifier

		self._play_panel.set_h(t, self._play_panel)

		slot12 = original_center_x

		self._play_panel.set_center_x(t, self._play_panel)

		slot12 = original_center_y

		self._play_panel.set_center_y(t, self._play_panel)

		slot12 = original_width * current_size_modifier

		self._play_circle.set_w(t, self._play_circle)

		slot12 = original_height * current_size_modifier

		self._play_circle.set_h(t, self._play_circle)

		slot12 = original_width / 2 * current_size_modifier

		self._play_circle.set_center_x(t, self._play_circle)

		slot12 = original_height / 2 * current_size_modifier

		self._play_circle.set_center_y(t, self._play_circle)

		slot12 = original_width * current_size_modifier

		self._play_icon.set_w(t, self._play_icon)

		slot12 = original_height * current_size_modifier

		self._play_icon.set_h(t, self._play_icon)

		slot12 = original_width / 2 * current_size_modifier

		self._play_icon.set_center_x(t, self._play_icon)

		slot12 = original_height / 2 * current_size_modifier

		self._play_icon.set_center_y(t, self._play_icon)
	end

	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local current_size_modifier = Easing.quartic_in_out(slot10, t, 1.1, -0.1)
		slot13 = original_width * current_size_modifier

		self._play_panel.set_w(t, self._play_panel)

		slot13 = original_height * current_size_modifier

		self._play_panel.set_h(t, self._play_panel)

		slot13 = original_center_x

		self._play_panel.set_center_x(t, self._play_panel)

		slot13 = original_center_y

		self._play_panel.set_center_y(t, self._play_panel)

		slot13 = original_width * current_size_modifier

		self._play_circle.set_w(t, self._play_circle)

		slot13 = original_height * current_size_modifier

		self._play_circle.set_h(t, self._play_circle)

		slot13 = original_width / 2 * current_size_modifier

		self._play_circle.set_center_x(t, self._play_circle)

		slot13 = original_height / 2 * current_size_modifier

		self._play_circle.set_center_y(t, self._play_circle)

		slot13 = original_width * current_size_modifier

		self._play_icon.set_w(t, self._play_icon)

		slot13 = original_height * current_size_modifier

		self._play_icon.set_h(t, self._play_icon)

		slot13 = original_width / 2 * current_size_modifier

		self._play_icon.set_center_x(t, self._play_icon)

		slot13 = original_height / 2 * current_size_modifier

		self._play_icon.set_center_y(t, self._play_icon)
	end

	slot11 = original_width

	self._play_panel.set_w(slot9, self._play_panel)

	slot11 = original_height

	self._play_panel.set_h(slot9, self._play_panel)

	slot11 = original_center_x

	self._play_panel.set_center_x(slot9, self._play_panel)

	slot11 = original_center_y

	self._play_panel.set_center_y(slot9, self._play_panel)

	slot11 = original_width

	self._play_circle.set_w(slot9, self._play_circle)

	slot11 = original_height

	self._play_circle.set_h(slot9, self._play_circle)

	slot11 = original_width / 2

	self._play_circle.set_center_x(slot9, self._play_circle)

	slot11 = original_height / 2

	self._play_circle.set_center_y(slot9, self._play_circle)

	slot11 = original_width

	self._play_icon.set_w(slot9, self._play_icon)

	slot11 = original_height

	self._play_icon.set_h(slot9, self._play_icon)

	slot11 = original_width / 2

	self._play_icon.set_center_x(slot9, self._play_icon)

	slot11 = original_height / 2

	self._play_icon.set_center_y(slot9, self._play_icon)

	return 
end
function RaidGUIControlIntelControlArchive:play_video()
	slot3 = self

	if not self.is_playing(slot2) then
		self._disable_input_timer = 0.1
		slot3 = self

		self._play_video(slot2)
	end

	return 
end
function RaidGUIControlIntelControlArchive:_play_video()
	local gui = Overlay.gui(slot2)
	slot4 = gui
	self._full_workspace = gui.create_screen_workspace(Overlay)
	slot4 = gui
	self._safe_rect_workspace = gui.create_screen_workspace(Overlay)
	slot4 = self._full_workspace
	local full_panel = self._full_workspace.panel(Overlay)
	local params_root_panel = {
		name = "control_video_root_panel",
		is_root_panel = true
	}
	slot6 = full_panel
	params_root_panel.x = full_panel.x(slot5)
	slot6 = full_panel
	params_root_panel.y = full_panel.y(slot5)
	slot6 = full_panel
	params_root_panel.h = full_panel.h(slot5)
	slot6 = full_panel
	params_root_panel.w = full_panel.w(slot5)
	params_root_panel.layer = tweak_data.gui.DEBRIEF_VIDEO_LAYER + 10
	params_root_panel.background_color = Color.black
	slot8 = params_root_panel
	self._panel = RaidGUIPanel.new(slot5, RaidGUIPanel, full_panel)
	local video = self._data.video_path
	local control_video_params = {
		name = "control_video"
	}
	slot8 = self._panel
	control_video_params.layer = self._panel.layer(full_panel) + 1
	control_video_params.video = video
	slot8 = self._panel
	control_video_params.width = self._panel.w(full_panel)
	slot9 = control_video_params
	self._control_video = self._panel.video(full_panel, self._panel)
	slot13 = self._control_video
	slot9 = self._panel.w(slot10) * self._control_video.video_height(self._panel) / self._control_video.video_width(self._control_video)

	self._control_video.set_h(full_panel, self._control_video)

	slot11 = self._panel
	slot9 = self._panel.h(self._control_video.video_height(self._panel) / self._control_video.video_width(self._control_video)) / 2

	self._control_video.set_center_y(full_panel, self._control_video)

	slot9 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(full_panel, managers.gui_data)

	slot8 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(full_panel)
	slot8 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(full_panel) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot12 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot9, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot13 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot10 = self._control_video
	press_any_key_params.layer = self._control_video.layer(slot9) + 100
	slot11 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot9, self._safe_panel)
	slot11 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot16 = w

	press_any_key_prompt.set_w(slot14, press_any_key_prompt)

	slot16 = h

	press_any_key_prompt.set_h(slot14, press_any_key_prompt)

	slot18 = self._safe_panel
	slot16 = self._safe_panel.w(slot17) - 50

	press_any_key_prompt.set_right(slot14, press_any_key_prompt)

	slot18 = self._safe_panel
	slot16 = self._safe_panel.h(slot17) - 50

	press_any_key_prompt.set_bottom(slot14, press_any_key_prompt)

	slot15 = press_any_key_prompt
	slot20 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot14, callback(slot17, self, self))

	return 
end
function RaidGUIControlIntelControlArchive:is_playing()
	if self._control_video then
		slot3 = self._control_video

		return self._control_video.loop_count(slot2) < 1
	end
end
function RaidGUIControlIntelControlArchive:is_skipped()
	if 0 < self._disable_input_timer then
		return 
	end

	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_pressed(slot7) then
			return true
		end
	end

	return false
end
function RaidGUIControlIntelControlArchive:_animate_show_press_any_key_prompt(prompt)
	local duration = 0.7
	local t = 0
	slot6 = 6

	wait(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 0.75)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0.75

	prompt.set_alpha(slot5, prompt)

	return 
end
function RaidGUIControlIntelControlArchive:_animate_change_press_any_key_prompt(prompt)
	local fade_out_duration = 0.25
	slot5 = prompt
	local t = (1 - prompt.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0.75, -0.75)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0

	prompt.set_alpha(slot5, prompt)

	slot6 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(slot5) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	slot7 = prompt

	prompt.set_text(slot6, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

	slot7 = prompt
	local _, _, w, h = prompt.text_rect(slot6)
	slot12 = w

	prompt.set_w(managers.localization.text, prompt)

	slot12 = h

	prompt.set_h(managers.localization.text, prompt)

	slot14 = self._safe_panel
	slot12 = self._safe_panel.w(press_any_key_text) - 50

	prompt.set_right(managers.localization.text, prompt)

	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot12, t, 0, 0.75)
		slot15 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot13 = 0.75

	prompt.set_alpha(slot11, prompt)

	return 
end
function RaidGUIControlIntelControlArchive:on_controller_hotswap()
	slot4 = "press_any_key_prompt"
	local press_any_key_prompt = self._safe_panel.child(slot2, self._safe_panel)

	if press_any_key_prompt then
		slot4 = press_any_key_prompt

		press_any_key_prompt.stop(slot3)

		slot4 = press_any_key_prompt
		slot9 = "_animate_change_press_any_key_prompt"

		press_any_key_prompt.animate(slot3, callback(slot6, self, self))
	end

	return 
end
function RaidGUIControlIntelControlArchive:confirm_pressed()
	return true
end

return 
