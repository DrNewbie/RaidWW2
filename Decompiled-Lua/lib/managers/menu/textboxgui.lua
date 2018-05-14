-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
TextBoxGui = TextBoxGui or class()
TextBoxGui.PRESETS = {
	system_menu = {
		w = 600,
		h = 270
	},
	weapon_stats = {
		w = 700,
		x = 60,
		h = 270,
		bottom = 620
	}
}
TextBoxGui.init = function (self, ...)
	self._target_alpha = {}
	self._visible = true
	self._enabled = true
	self._minimized = false
	slot3 = self

	self._create_text_box(slot2, ...)

	slot5 = self
	self._thread = self._panel.animate(slot2, self._panel, self._update)

	return 
end
TextBoxGui._update = function (o, self)
	while true do
		local dt = coroutine.yield()

		if self._up_alpha then
			slot8 = dt * 5
			self._up_alpha.current = math.step(slot5, self._up_alpha.current, self._up_alpha.target)
		end

		if self._down_alpha then
			slot8 = dt * 5
			self._down_alpha.current = math.step(slot5, self._down_alpha.current, self._down_alpha.target)
		end
	end

	return 
end
TextBoxGui.set_layer = function (self, layer)
	slot5 = self._init_layer + layer

	self._panel.set_layer(slot3, self._panel)

	if self._background then
		slot7 = self._panel
		slot5 = self._panel.layer(slot6) - 1

		self._background.set_layer(slot3, self._background)
	end

	return 
end
TextBoxGui.layer = function (self)
	slot3 = self._panel

	return self._panel.layer(slot2)
end
TextBoxGui.add_background = function (self)
	slot3 = self._fullscreen_ws

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._fullscreen_ws

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._fullscreen_ws = nil
	end

	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._fullscreen_ws = Overlay.gui(slot2).create_screen_workspace(slot2)
	slot3 = self._fullscreen_ws
	slot4 = {
		name = "bg",
		alpha = 0,
		valign = "grow",
		layer = 0,
		color = Color.black,
		w = self._fullscreen_ws.panel(slot6).w(slot6),
		h = self._fullscreen_ws.panel(slot6).h(slot6)
	}
	slot7 = self._fullscreen_ws
	slot7 = self._fullscreen_ws.panel(slot6)
	slot7 = self._fullscreen_ws
	slot7 = self._fullscreen_ws.panel(slot6)
	self._background = self._fullscreen_ws.panel(slot2).rect(slot2, self._fullscreen_ws.panel(slot2))

	return 
end
TextBoxGui.set_centered = function (self)
	slot3 = self._panel
	slot6 = self._ws
	slot6 = self._ws.panel(slot5)

	self._panel.set_center(slot2, self._ws.panel(slot5).center(slot5))

	return 
end
TextBoxGui.recreate_text_box = function (self, ...)
	slot3 = self

	self.close(slot2)

	slot3 = self

	self._create_text_box(slot2, ...)

	slot5 = self
	self._thread = self._panel.animate(slot2, self._panel, self._update)

	return 
end
TextBoxGui._create_text_box = function (self, ws, title, text, content_data, config)
	self._ws = ws
	slot8 = self._ws
	slot8 = self._ws.panel(slot7)
	self._init_layer = self._ws.panel(slot7).layer(slot7)
	slot8 = self._text_box

	if alive(slot7) then
		slot8 = ws
		slot9 = self._text_box

		ws.panel(slot7).remove(slot7, ws.panel(slot7))

		self._text_box = nil
	end

	self._text_box_focus_button = nil
	slot8 = managers.gui_data
	local scaled_size = managers.gui_data.scaled_size(slot7)
	local type = config and config.type
	local preset = type and self.PRESETS[type]
	local stats_list = content_data and content_data.stats_list
	local stats_text = content_data and content_data.stats_text
	local button_list = content_data and content_data.button_list
	local focus_button = content_data and content_data.focus_button
	local no_close_legend = config and config.no_close_legend
	local no_scroll_legend = config and config.no_scroll_legend
	self._no_scroll_legend = true
	local only_buttons = config and config.only_buttons
	local use_minimize_legend = (config and config.use_minimize_legend) or false
	local w = (preset and preset.w) or (config and config.w) or scaled_size.width / 2.25
	local h = (preset and preset.h) or (config and config.h) or scaled_size.height
	local x = (preset and preset.x) or (config and config.x) or 0
	local y = (preset and preset.y) or (config and config.y) or 0
	local bottom = (preset and preset.bottom) or (config and config.bottom)
	local forced_h = (preset and preset.forced_h) or (config and config.forced_h) or false
	local title_font = (preset and preset.title_font) or (config and config.title_font) or tweak_data.menu.pd2_large_font
	local title_font_size = (preset and preset.title_font_size) or (config and config.title_font_size) or 28
	local font = (preset and preset.font) or (config and config.font) or tweak_data.menu.pd2_medium_font
	local font_size = (preset and preset.font_size) or (config and config.font_size) or tweak_data.menu.pd2_medium_font_size
	local use_text_formating = (preset and preset.use_text_formating) or (config and config.use_text_formating) or false
	local text_formating_color = (preset and preset.text_formating_color) or (config and config.text_formating_color) or Color.white
	local text_formating_color_table = (preset and preset.text_formating_color_table) or (config and config.text_formating_color_table) or nil
	local is_title_outside = (preset and preset.is_title_outside) or (config and config.is_title_outside) or false
	local text_blend_mode = (preset and preset.text_blend_mode) or (config and config.text_blend_mode) or "normal"
	self._allow_moving = (config and config.allow_moving) or false
	local preset_or_config_y = y ~= 0

	if title then
		slot35 = title
		title = utf8.to_upper(slot34)
	end

	if text then
	end

	self.controls = {}
	self._default_button = content_data.focus_button or 1
	slot35 = ws
	slot36 = {
		name = "text_box_gui_panel_main",
		valign = "center",
		visible = self._visible,
		x = x,
		y = y,
		w = w,
		h = h,
		layer = self._init_layer
	}
	local main = ws.panel(slot34).panel(slot34, ws.panel(slot34))
	self._panel = main
	slot36 = self._panel
	self._panel_h = self._panel.h(ws.panel(slot34))
	self._panel_w = self._panel.w(ws.panel(slot34))
	local title_params = {
		name = "title",
		vertical = "top",
		wrap = false,
		word_wrap = false,
		align = "center",
		valign = "top",
		y = 10,
		halign = "center",
		font_size = 32,
		x = 10,
		layer = 1,
		text = title or "none",
		visible = (title and true) or false
	}
	slot37 = main
	title_params.w = main.w(self._panel) - 20
	title_params.color = tweak_data.gui.colors.raid_white
	slot39 = 32
	title_params.font = tweak_data.gui.get_font_path(self._panel, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	slot38 = title_params
	local title_text = main.text(self._panel, main)
	slot38 = title_text
	local _, _, tw, th = title_text.text_rect(main)
	slot43 = th + 5

	title_text.set_h(slot41, title_text)

	th = th + 10

	if is_title_outside then
		th = 0
	end

	slot43 = {
		texture = "core/textures/default_texture_01_df",
		name = "top_line",
		y = 0,
		layer = 0,
		color = Color.white,
		w = main.w(slot45)
	}
	local top_line = main.bitmap(slot41, main)
	slot44 = th

	top_line.set_bottom(main, top_line)

	slot44 = {
		texture = "core/textures/default_texture_01_df",
		name = "bottom_line",
		y = 100,
		rotation = 180,
		layer = 0,
		color = Color.white,
		w = main.w(main)
	}
	slot47 = main
	local bottom_line = main.bitmap(main, main)
	slot45 = main.h(main) - th

	bottom_line.set_top(main, bottom_line)

	slot44 = top_line

	top_line.hide(main)

	slot44 = bottom_line

	bottom_line.hide(main)

	slot45 = {
		name = "text_box_gui_lower_static_panel",
		h = 0,
		y = 0,
		x = 0,
		layer = 0,
		w = main.w(main)
	}
	local lower_static_panel = main.panel(main, main)
	slot46 = lower_static_panel

	self._create_lower_static_panel(main, self)

	slot46 = {
		name = "info_area",
		y = 0,
		x = 0,
		layer = 0,
		w = main.w(main),
		h = main.h(main) - th * 2
	}
	slot49 = main
	slot49 = main
	local info_area = main.panel(main, main)
	local buttons_panel = self._setup_buttons_panel(main, self, info_area, button_list, focus_button)
	slot48 = {
		name = "scroll_panel",
		x = 10,
		layer = 1,
		y = math.round(only_buttons),
		w = info_area.w(only_buttons) - 20,
		h = info_area.h(only_buttons)
	}
	slot51 = th + 15
	slot51 = info_area
	slot51 = info_area
	local scroll_panel = info_area.panel(self, info_area)
	local has_stats = stats_list and 0 < #stats_list
	local stats_panel = self._setup_stats_panel(slot48, self, scroll_panel, stats_list)
	local text_params = {
		word_wrap = true,
		name = "text_box_gui_text",
		halign = "center",
		wrap = true,
		align = "center",
		vertical = "top",
		valign = "top",
		font_size = 22,
		layer = 1
	}
	slot51 = text
	text_params.text = utf8.to_upper(scroll_panel) or "none"
	text_params.visible = (text and true) or false
	slot51 = scroll_panel
	slot54 = stats_panel
	text_params.w = scroll_panel.w(slot50) - math.round(stats_panel.w(slot53)) - ((has_stats and 20) or 0)
	slot53 = stats_panel
	text_params.x = math.round(stats_panel.w(stats_text)) + ((has_stats and 20) or 0)
	text_params.color = tweak_data.gui.colors.raid_grey
	slot53 = 22
	text_params.font = tweak_data.gui.get_font_path((has_stats and 20) or 0, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	slot52 = text_params
	local text = scroll_panel.text((has_stats and 20) or 0, scroll_panel)

	if use_text_formating then
		local text_string = text.text(slot51)
		local text_dissected = utf8.characters(text)
		slot54 = "#"
		local idsp = Idstring(text_string)
		local start_ci = {}
		local end_ci = {}
		local first_ci = true
		slot58 = text_dissected

		for i, c in ipairs(slot57) do
			slot63 = c

			if Idstring(slot62) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c then
					slot64 = next_c

					if Idstring(slot63) == idsp then
						if first_ci then
							slot65 = i

							table.insert(slot63, start_ci)
						else
							slot65 = i

							table.insert(slot63, end_ci)
						end

						first_ci = not first_ci
					end
				end
			end
		end

		if #start_ci ~= #end_ci then
		else
			for i = 1, #start_ci, 1 do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - i * 4 - 1
			end
		end

		slot60 = ""
		text_string = string.gsub(slot57, text_string, "##")
		slot59 = text_string

		text.set_text(slot57, text)

		slot59 = 1
		slot62 = text_string

		text.clear_range_color(slot57, text, utf8.len(slot61))

		if #start_ci ~= #end_ci then
			slot61 = #end_ci

			Application.error(slot57, Application, "TextBoxGui: Not even amount of ##'s in skill description string!", #start_ci)
		else
			for i = 1, #start_ci, 1 do
				slot65 = (text_formating_color_table and text_formating_color_table[i]) or text_formating_color

				text.set_range_color(slot61, text, start_ci[i], end_ci[i])
			end
		end
	end

	slot52 = text

	text.set_w(slot51, scroll_panel.w(slot54))

	slot53 = 0

	text.set_x(slot51, text)

	slot52 = text
	local _, _, ttw, tth = text.text_rect(slot51)
	slot57 = tth

	text.set_h(scroll_panel, text)

	slot58 = content_data.textbox_value
	local textbox_panel = self._setup_textbox(scroll_panel, self, content_data.textbox)
	slot57 = scroll_panel
	slot55 = scroll_panel.set_h

	if not forced_h then
		slot61 = tth
		slot58 = math.min(slot59, h - th)
	end

	slot55(slot56, slot57)

	slot61 = textbox_panel
	slot61 = buttons_panel
	slot59 = buttons_panel.h(scroll_panel)
	slot58 = scroll_panel.bottom(slot59) + textbox_panel.h(scroll_panel) + slot59 + 64

	info_area.set_h(slot56, info_area)

	slot60 = info_area
	slot58 = info_area.h(slot59) - 10

	buttons_panel.set_bottom(slot56, buttons_panel)

	slot60 = buttons_panel
	slot58 = buttons_panel.y(slot59) - 30

	textbox_panel.set_bottom(slot56, textbox_panel)

	if not preset_or_config_y then
		slot57 = main
		slot60 = info_area

		main.set_h(slot56, info_area.h(slot59))

		if bottom then
			slot58 = bottom

			main.set_bottom(slot56, main)
		elseif y == 0 then
			slot60 = main
			slot60 = main.parent(slot59)
			slot58 = main.parent(slot59).h(slot59) / 2

			main.set_center_y(slot56, main)
		end
	end

	slot57 = top_line
	slot60 = scroll_panel

	top_line.set_world_bottom(slot56, scroll_panel.world_top(slot59))

	slot57 = bottom_line
	slot60 = scroll_panel

	bottom_line.set_world_top(slot56, scroll_panel.world_bottom(slot59))

	slot60 = main
	slot58 = main.h(slot59) - h * 2

	lower_static_panel.set_bottom(slot56, lower_static_panel)

	slot58 = {
		text = "MINIMIZE",
		name = "text_box_gui_legend_minimize",
		halign = "left",
		valign = "top",
		layer = 1,
		visible = use_minimize_legend,
		font = tweak_data.gui.font_paths.din_compressed[32],
		font_size = tweak_data.gui.font_sizes.size_32
	}
	local legend_minimize = main.text(slot56, main)
	slot58 = legend_minimize
	local _, _, lw, lh = legend_minimize.text_rect(main)

	legend_minimize.set_size(slot61, legend_minimize, lw)

	slot65 = top_line
	slot63 = top_line.bottom(lh) - 4

	legend_minimize.set_bottom(slot61, legend_minimize)

	slot62 = legend_minimize
	slot65 = top_line

	legend_minimize.set_right(slot61, top_line.right(lh))

	slot63 = {
		text = "CLOSE",
		name = "text_box_gui_legend_close",
		halign = "left",
		valign = "top",
		layer = 1,
		visible = not no_close_legend,
		font = tweak_data.gui.font_paths.din_compressed[32],
		font_size = tweak_data.gui.font_sizes.size_32
	}
	local legend_close = main.text(slot61, main)
	slot63 = legend_close
	local _, _, lw, lh = legend_close.text_rect(main)

	legend_close.set_size(slot66, legend_close, lw)

	slot70 = bottom_line
	slot68 = bottom_line.top(lh) + 4

	legend_close.set_top(slot66, legend_close)

	self._scroll_panel = scroll_panel
	self._text_box = main

	if is_title_outside then
		slot68 = 0

		title_text.set_bottom(slot66, title_text)

		slot68 = 360

		title_text.set_rotation(slot66, title_text)

		self._is_title_outside = is_title_outside
	end

	return main
end
TextBoxGui._setup_stats_panel = function (self, scroll_panel, stats_list, stats_text)

	-- Decompilation error in this vicinity:
	local has_stats = stats_list and 0 < #stats_list
	slot7 = scroll_panel
	slot5 = scroll_panel.panel
	slot8 = {
		name = "text_box_gui_stats_panel",
		x = 10,
		layer = 1
	}
	slot10 = total_h

	stats_panel.set_h(slot8, stats_panel)

	return stats_panel
end
TextBoxGui._setup_buttons_panel = function (self, info_area, button_list, focus_button, only_buttons)
	local has_buttons = button_list and 0 < #button_list
	slot9 = {
		name = "buttons_panel",
		h = 48,
		x = 10,
		layer = 1,
		w = (has_buttons and 800) or 0
	}
	self._text_box_buttons_panel = info_area.panel(slot7, info_area)
	slot8 = self._text_box_buttons_panel
	slot11 = info_area

	self._text_box_buttons_panel.set_right(slot7, info_area.w((has_buttons and 800) or 0))

	self._buttons = {}

	if has_buttons then
		local button_text_config = {
			name = "button_text",
			vertical = "center",
			word_wrap = "true",
			wrap = "true",
			blend_mode = "add",
			halign = "right",
			x = 10,
			layer = 2,
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = tweak_data.screen_colors.button_stage_3
		}
		local button_distance = 35
		local max_w = 0
		local max_h = 0

		if button_list then
			slot12 = button_list

			for i, button in ipairs(slot11) do
				local x = 0

				if 1 < i then
					slot18 = self._buttons[#self._buttons]
					slot19 = self._buttons[#self._buttons]
					x = self._buttons[#self._buttons].x(#self._buttons) + self._buttons[#self._buttons].w(#self._buttons) + button_distance
					max_w = max_w + button_distance
				end

				local button_params = {
					y = 0,
					name = button.id_name,
					x = x
				}
				slot19 = button.text
				button_params.text = utf8.to_upper(slot18) or ""
				slot21 = tweak_data.gui.font_sizes.medium
				button_params.font = tweak_data.gui.get_font_path(slot18, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
				local button_class = button.class or RaidGUIControlButtonShortPrimary
				slot22 = button_params
				local new_button = button_class.new(slot19, button_class, self._text_box_buttons_panel)
				slot21 = new_button
				max_w = max_w + new_button.w(button_class)
				slot21 = self._text_box_buttons_panel
				slot24 = new_button

				self._text_box_buttons_panel.set_h(button_class, new_button.h(slot23))

				slot21 = max_h
				slot24 = new_button
				max_h = math.max(button_class, new_button.h(slot23))
				slot22 = new_button

				table.insert(button_class, self._buttons)

				if i == focus_button then
					slot22 = focus_button

					self.set_focus_button(slot20, self)
				end
			end

			slot13 = max_h

			self._text_box_buttons_panel.set_h(slot11, self._text_box_buttons_panel)

			slot15 = info_area
			slot13 = info_area.h(slot14) - 10

			self._text_box_buttons_panel.set_bottom(slot11, self._text_box_buttons_panel)
		end

		slot13 = max_w

		self._text_box_buttons_panel.set_w(slot11, self._text_box_buttons_panel)

		slot12 = self._text_box_buttons_panel
		slot15 = info_area

		self._text_box_buttons_panel.set_center_x(slot11, info_area.center_x(slot14))
	end

	return self._text_box_buttons_panel
end
TextBoxGui._setup_textbox = function (self, has_textbox, texbox_value)
	slot6 = "info_area"
	local info_area = self._panel.child(slot4, self._panel)
	slot7 = "scroll_panel"
	local scroll_panel = info_area.child(self._panel, info_area)
	slot8 = "title"
	local title = self._panel.child(info_area, self._panel)
	local text = scroll_panel.child(self._panel, scroll_panel)
	local padding_up = 20
	slot14 = title
	slot11 = title.y(slot12) + title.h(title) + padding_up
	local y = math.max("text_box_gui_text", 0)
	slot12 = scroll_panel.y(title) + scroll_panel.h(scroll_panel) + padding_up
	y = math.max(0, y)
	local textbox_panel_params = {
		name = "textbox_panel",
		h = 0,
		w = 433,
		x = 0,
		y = y
	}
	slot13 = textbox_panel_params
	local textbox_panel = info_area.panel(y, info_area)
	slot13 = textbox_panel
	slot16 = info_area

	textbox_panel.set_center_x(info_area, info_area.center_x(scroll_panel))

	if not has_textbox then
		return textbox_panel
	end

	slot14 = 48

	textbox_panel.set_h(slot12, textbox_panel)

	local input_field_params = {
		name = "input_field",
		y = 0,
		x = 0
	}
	slot14 = textbox_panel
	input_field_params.w = textbox_panel.w(textbox_panel)
	slot14 = textbox_panel
	input_field_params.h = textbox_panel.h(textbox_panel)
	input_field_params.ws = self._ws
	slot16 = tweak_data.gui.font_sizes.small
	input_field_params.font = tweak_data.gui.get_font_path(textbox_panel, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	slot16 = "_input_field_text_changed"
	input_field_params.text_changed_callback = callback(textbox_panel, self, self)
	input_field_params.text = texbox_value
	slot16 = input_field_params
	self._input_field = RaidGUIControlInputField.new(textbox_panel, RaidGUIControlInputField, textbox_panel)
	slot15 = self._input_field

	table.insert(textbox_panel, self.controls)

	slot15 = true

	self._input_field.set_chat_focus(textbox_panel, self._input_field)

	return textbox_panel
end
TextBoxGui._input_field_text_changed = function (self)
	if not self._callback_data then
		self._callback_data = {}
	end

	slot4 = self._input_field
	self._callback_data.input_field_text = self._input_field.get_text(slot3)

	return 
end
TextBoxGui._create_lower_static_panel = function (self)
	return 
end
TextBoxGui.get_callback_data = function (self)
	return self._callback_data
end
TextBoxGui.check_focus_button = function (self, x, y)
	slot7 = self._text_box_buttons_panel

	for i, panel in ipairs(self._text_box_buttons_panel.children(slot6)) do
		if panel.child then
			slot12 = y

			if panel.inside(slot9, panel, x) then
				slot11 = i

				self.set_focus_button(slot9, self)

				return true
			end
		end
	end

	return false
end
TextBoxGui.set_focus_button = function (self, focus_button)
	if focus_button ~= self._text_box_focus_button then
		slot5 = "highlight"

		managers.menu.post_event(slot3, managers.menu)

		if self._text_box_focus_button then
			slot6 = false

			self._set_button_selected(slot3, self, self._text_box_focus_button)
		end

		slot6 = true

		self._set_button_selected(slot3, self, focus_button)

		self._text_box_focus_button = focus_button
	end

	return 
end
TextBoxGui.unfocus_button = function (self, index)
	if self._text_box_focus_button == index then
		slot6 = false

		self._set_button_selected(slot3, self, index)

		self._text_box_focus_button = nil
	end

	return 
end
TextBoxGui._set_button_selected = function (self, index, is_selected)
	local button = self._buttons[index]

	if button then
		slot7 = is_selected

		button.set_selected(slot5, button)
	end

	return 
end
TextBoxGui.change_focus_button = function (self, change)
	if self._input_field then
		slot4 = self._input_field

		if self._input_field.input_focus(slot3) then
			slot4 = managers.controller

			if not managers.controller.is_xbox_controller_present(slot3) then
				return 
			end
		end
	end

	local button_count = #self._buttons
	local current_focus_button = self._text_box_focus_button or self._default_button
	slot8 = button_count
	local focus_button = math.clamp(slot5, current_focus_button + change, 1)

	if focus_button == 0 then
		focus_button = button_count
	end

	slot8 = focus_button

	self.set_focus_button(slot6, self)

	return 
end
TextBoxGui.get_focus_button = function (self)
	return self._text_box_focus_button
end
TextBoxGui.get_focus_button_id = function (self)
	slot4 = self._text_box_focus_button - 1
	slot3 = self._text_box_buttons_panel.child(slot2, self._text_box_buttons_panel)

	return self._text_box_buttons_panel.child(slot2, self._text_box_buttons_panel).name(slot2)
end
TextBoxGui.input_focus = function (self)
	return false
end
TextBoxGui.mouse_pressed = function (self, button, x, y)
	return false
end
TextBoxGui.check_close = function (self, x, y)
	slot5 = self

	if not self.can_take_input(slot4) then
		return false
	end

	slot6 = "legend_close"
	local legend_close = self._panel.child(slot4, self._panel)
	slot6 = legend_close

	if not legend_close.visible(self._panel) then
		return false
	end

	slot8 = y

	if legend_close.inside(slot5, legend_close, x) then
		return true
	end

	return false
end
TextBoxGui.check_minimize = function (self, x, y)
	slot5 = self

	if not self.can_take_input(slot4) then
		return false
	end

	slot6 = "legend_minimize"
	local legend_minimize = self._panel.child(slot4, self._panel)
	slot6 = legend_minimize

	if not legend_minimize.visible(self._panel) then
		return false
	end

	slot8 = y

	if legend_minimize.inside(slot5, legend_minimize, x) then
		return true
	end

	return false
end
TextBoxGui.mouse_moved = function (self, x, y)

	-- Decompilation error in this vicinity:
	slot5 = self

	if self._grabbed_title then
		local _x = x + self._grabbed_offset_x
		local _y = y + self._grabbed_offset_y
		slot8 = self._ws
		slot8 = self._ws.panel(self)

		if self._ws.panel(self).w(self) < _x + self.w(slot6) then
			slot7 = self
			self._grabbed_offset_x = self.x(slot6) - x
			slot7 = self._ws
			slot8 = self
			_x = self._ws.panel(slot6).w(slot6) - self.w(self._ws.panel(slot6))
		else
			slot7 = self._ws
			slot7 = self._ws.panel(slot6)

			if _x < self._ws.panel(slot6).x(slot6) then
				slot7 = self
				self._grabbed_offset_x = self.x(slot6) - x
				slot7 = self._ws
				slot7 = self._ws.panel(slot6)
				_x = self._ws.panel(slot6).x(slot6)
			end
		end

		slot8 = self._ws
		slot8 = self._ws.panel(self)

		if self._ws.panel(self).h(self) < _y + self.h(slot6) then
			slot7 = self
			self._grabbed_offset_y = self.y(slot6) - y
			slot7 = self._ws
			slot8 = self
			_y = self._ws.panel(slot6).h(slot6) - self.h(self._ws.panel(slot6))
		else
			slot7 = self._ws
			slot7 = self._ws.panel(slot6)

			if _y < self._ws.panel(slot6).y(slot6) then
				slot7 = self
				self._grabbed_offset_y = self.y(slot6) - y
				slot7 = self._ws
				slot7 = self._ws.panel(slot6)
				_y = self._ws.panel(slot6).y(slot6)
			end
		end

		slot9 = _y

		self.set_position(slot6, self, _x)

		return true, "grab"
	else
		slot7 = self._text_box_buttons_panel

		for i, panel in ipairs(self._text_box_buttons_panel.children(slot6)) do
			if panel.child then
				slot12 = y

				if panel.inside(slot9, panel, x) then
					return true, "link"
				end
			end
		end
	end

	return false, "arrow"
end
TextBoxGui.check_grab_scroll_bar = function (self)
	return false
end
TextBoxGui.moved_scroll_bar = function (self)
	return false, "arrow"
end
TextBoxGui.release_scroll_bar = function (self)
	return 
end
TextBoxGui.set_fade = function (self, fade)
	slot5 = fade

	self._set_alpha(slot3, self)

	slot4 = self._background

	if alive(slot3) then
		slot5 = fade * 0.8

		self._background.set_alpha(slot3, self._background)
	end

	return 
end
TextBoxGui._set_alpha = function (self, alpha)
	slot5 = alpha

	self._panel.set_alpha(slot3, self._panel)

	slot5 = alpha ~= 0

	self._panel.set_visible(slot3, self._panel)

	return 
end
TextBoxGui._set_alpha_recursive = function (self, obj, alpha)
	if obj.set_color then
		slot6 = obj
	end

	if obj.children then
		slot7 = obj

		for _, child in ipairs(obj.children(slot6)) do
			slot12 = alpha

			self._set_alpha_recursive(slot9, self, child)
		end
	end

	return 
end
TextBoxGui.set_title = function (self, title)
	slot5 = "title"
	local title_text = self._panel.child(slot3, self._panel)
	slot6 = title or "none"

	title_text.set_text(slot4, title_text)

	slot5 = title_text
	local _, _, w, h = title_text.text_rect(slot4)
	slot10 = h

	title_text.set_h(slot8, title_text)

	slot9 = title_text
	slot12 = self._panel

	title_text.set_center_x(slot8, self._panel.center_x(slot11))

	slot10 = (title and true) or false

	title_text.set_visible(slot8, title_text)

	return 
end
TextBoxGui.set_text = function (self, txt, no_upper)
	slot6 = "info_area"
	slot6 = "scroll_panel"
	slot6 = "text_box_gui_text"
	local text = self._panel.child(slot4, self._panel).child(slot4, self._panel.child(slot4, self._panel)).child(slot4, self._panel.child(slot4, self._panel).child(slot4, self._panel.child(slot4, self._panel)))
	slot6 = text
	slot4 = text.set_text

	if not no_upper or not txt then
		slot9 = txt or ""
		slot7 = utf8.to_upper(slot8)
	end

	slot4(slot5, slot6)

	return 
end
TextBoxGui.set_use_minimize_legend = function (self, use)
	slot5 = "legend_minimize"
	slot5 = use

	self._panel.child(slot3, self._panel).set_visible(slot3, self._panel.child(slot3, self._panel))

	return 
end
TextBoxGui.in_focus = function (self, x, y)
	slot7 = y

	return self._panel.inside(slot4, self._panel, x)
end
TextBoxGui.in_info_area_focus = function (self, x, y)
	slot6 = "info_area"
	slot7 = y

	return self._panel.child(slot4, self._panel).inside(slot4, self._panel.child(slot4, self._panel), x)
end
TextBoxGui._set_visible_state = function (self)
	local visible = self._visible and self._enabled
	slot5 = visible

	self._panel.set_visible(slot3, self._panel)

	slot4 = self._background

	if alive(slot3) then
		slot5 = visible

		self._background.set_visible(slot3, self._background)
	end

	return 
end
TextBoxGui.can_take_input = function (self)
	return self._visible and self._enabled
end
TextBoxGui.set_visible = function (self, visible)
	self._visible = visible
	slot4 = self

	self._set_visible_state(slot3)

	return 
end
TextBoxGui.set_enabled = function (self, enabled)
	if self._enabled == enabled then
		return 
	end

	self._enabled = enabled
	slot4 = self

	self._set_visible_state(slot3)

	if self._minimized then
		if not self._enabled then
			slot5 = self._minimized_id

			self._remove_minimized(slot3, self)
		else
			slot4 = self

			self._add_minimized(slot3)
		end
	end

	return 
end
TextBoxGui.enabled = function (self)
	return self._enabled
end
TextBoxGui._maximize = function (self, data)
	slot5 = true

	self.set_visible(slot3, self)

	slot6 = nil

	self.set_minimized(slot3, self, false)

	slot5 = data.id

	self._remove_minimized(slot3, self)

	return 
end
TextBoxGui.set_minimized = function (self, minimized, minimized_data)
	self._minimized = minimized
	self._minimized_data = minimized_data

	if self._minimized then
		slot5 = self

		self._add_minimized(slot4)
	end

	return 
end
TextBoxGui._add_minimized = function (self)
	slot6 = "_maximize"
	slot2 = callback(slot3, self, self)
	self._minimized_data.callback = slot2
	slot4 = false

	self.set_visible(slot2, self)

	slot4 = self._minimized_data
	self._minimized_id = managers.menu_component.add_minimized(slot2, managers.menu_component)

	return 
end
TextBoxGui._remove_minimized = function (self, id)
	self._minimized_id = nil
	slot5 = id

	managers.menu_component.remove_minimized(slot3, managers.menu_component)

	return 
end
TextBoxGui.minimized = function (self)
	return self._minimized
end
TextBoxGui.set_position = function (self, x, y)
	slot7 = y

	self._panel.set_position(slot4, self._panel, x)

	return 
end
TextBoxGui.position = function (self)
	slot3 = self._panel

	return self._panel.position(slot2)
end
TextBoxGui.set_size = function (self, x, y)
	slot7 = y

	self._panel.set_size(slot4, self._panel, x)

	slot6 = "title"
	slot5 = self._panel.child(slot4, self._panel)
	local _, _, w, h = self._panel.child(slot4, self._panel).text_rect(slot4)
	slot10 = "lower_static_panel"
	local lower_static_panel = self._panel.child(slot8, self._panel)
	slot10 = lower_static_panel
	slot13 = self._panel

	lower_static_panel.set_w(self._panel, self._panel.w(slot12))

	slot13 = self._panel
	slot11 = self._panel.h(slot12) - h

	lower_static_panel.set_bottom(self._panel, lower_static_panel)

	local lsp_h = lower_static_panel.h(self._panel)
	slot12 = "info_area"
	local info_area = self._panel.child(lower_static_panel, self._panel)

	info_area.set_size(self._panel, info_area, self._panel.w(self._panel.h(self._panel) - h * 2 - lsp_h))

	slot13 = "buttons_panel"
	local buttons_panel = info_area.child(self._panel, info_area)
	slot14 = "scroll_panel"
	local scroll_panel = info_area.child(info_area, info_area)
	slot18 = buttons_panel
	slot16 = buttons_panel.w(info_area)
	slot15 = info_area.w(self._panel) - slot16 - 30

	scroll_panel.set_w(info_area, scroll_panel)

	slot17 = scroll_panel
	slot15 = scroll_panel.y(slot16) - 1

	scroll_panel.set_y(info_area, scroll_panel)

	slot15 = scroll_panel.y(slot16) + 1

	scroll_panel.set_y(info_area, scroll_panel)

	slot15 = "top_line"
	local top_line = self._panel.child(info_area, self._panel)
	slot15 = top_line

	top_line.set_w(self._panel, self._panel.w(scroll_panel))

	slot16 = h

	top_line.set_bottom(self._panel, top_line)

	slot16 = "bottom_line"
	local bottom_line = self._panel.child(self._panel, self._panel)
	slot16 = bottom_line
	slot19 = self._panel

	bottom_line.set_w(self._panel, self._panel.w(self._panel))

	slot17 = self._panel.h(self._panel) - h

	bottom_line.set_top(self._panel, bottom_line)

	slot17 = "legend_close"
	local legend_close = self._panel.child(self._panel, self._panel)
	slot18 = bottom_line.top(self._panel) + 4

	legend_close.set_top(self._panel, legend_close)

	slot18 = "legend_minimize"
	local legend_minimize = self._panel.child(self._panel, self._panel)
	slot21 = top_line
	slot19 = top_line.bottom(bottom_line) - 4

	legend_minimize.set_bottom(self._panel, legend_minimize)

	slot18 = legend_minimize
	slot21 = top_line

	legend_minimize.set_right(self._panel, top_line.right(bottom_line))

	return 
end
TextBoxGui.size = function (self)
	slot3 = self._panel

	return self._panel.size(slot2)
end
TextBoxGui.open_page = function (self)
	return 
end
TextBoxGui.close_page = function (self)
	return 
end
TextBoxGui.x = function (self)
	slot3 = self._panel

	return self._panel.x(slot2)
end
TextBoxGui.y = function (self)
	slot3 = self._panel

	return self._panel.y(slot2)
end
TextBoxGui.h = function (self)
	slot3 = self._panel

	return self._panel.h(slot2)
end
TextBoxGui.w = function (self)
	slot3 = self._panel

	return self._panel.w(slot2)
end
TextBoxGui.h = function (self)
	slot3 = self._panel

	return self._panel.h(slot2)
end
TextBoxGui.visible = function (self)
	return self._visible
end
TextBoxGui.close = function (self)
	if self._minimized then
		slot4 = self._minimized_id

		self._remove_minimized(slot2, self)
	end

	if self._thread then
		slot4 = self._thread

		self._panel.stop(slot2, self._panel)

		self._thread = nil
	end

	slot3 = self._ws
	slot4 = self._panel

	self._ws.panel(slot2).remove(slot2, self._ws.panel(slot2))

	slot3 = self._background

	if alive(slot2) then
		slot3 = self._fullscreen_ws
		slot4 = self._background

		self._fullscreen_ws.panel(slot2).remove(slot2, self._fullscreen_ws.panel(slot2))
	end

	slot3 = self._fullscreen_ws

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._fullscreen_ws

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._fullscreen_ws = nil
	end

	return 
end

return 
