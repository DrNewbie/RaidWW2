-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidMenuCreditsGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuCreditsGui = slot0
RaidMenuCreditsGui.PATH = "gamedata/"
RaidMenuCreditsGui.FILE_EXTENSION = "credits"
RaidMenuCreditsGui.INTRO_VIDEO = "movies/vanilla/credits/05_credits_v003"
function RaidMenuCreditsGui:init(ws, fullscreen_ws, node, component_name)
	slot7 = managers.music

	managers.music.stop(slot6)

	slot11 = component_name

	RaidMenuOptionsControls.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "menu_credits"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)
	self._node.components.raid_menu_footer.hide_name_and_gold_panel(slot6)

	self._controller_list = {}
	slot8 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self._node.components.raid_menu_footer), 1 do
		slot14 = false
		local con = managers.controller.create_controller(slot10, managers.controller, "boot_" .. index, index)
		slot12 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	slot8 = node._parameters.credits_file

	self._build_credits_panel(slot6, self)

	slot7 = self

	self._show_intro_video(slot6)

	slot7 = self

	self.bind_controller_inputs(slot6)

	slot8 = "event_complete_state"
	slot13 = "on_controller_hotswap"

	managers.controller.add_hotswap_callback(slot6, managers.controller, callback(slot10, self, self))

	return 
end
function RaidMenuCreditsGui:_build_credits_panel(file)
	slot4 = SystemInfo
	slot4 = SystemInfo.language(slot3)
	local lang_key = SystemInfo.language(slot3).key(slot3)
	local files = {}
	slot6 = "german"
	slot6 = Idstring(slot5)
	files[Idstring(slot5).key(slot5)] = "_german"
	slot6 = "french"
	slot6 = Idstring("_german")
	files[Idstring("_german").key("_german")] = "_french"
	slot6 = "spanish"
	slot6 = Idstring("_french")
	files[Idstring("_french").key("_french")] = "_spanish"
	slot6 = "italian"
	slot6 = Idstring("_spanish")
	files[Idstring("_spanish").key("_spanish")] = "_italian"
	slot7 = "eu"

	if Application.region("_italian") == Idstring(Application) and file == "eula" then
		slot6 = "english"
		slot6 = Idstring(slot5)
		files[Idstring(slot5).key(slot5)] = "_uk"
	end

	if (file == "eula" or file == "trial") and files[lang_key] and not (file .. files[lang_key]) then
	end

	slot9 = self.FILE_EXTENSION
	local list = PackageManager.script_data(slot5, PackageManager, self.PATH .. file.id(file))
	local ypos = 0
	slot8 = managers.gui_data
	local safe_rect_pixels = managers.gui_data.scaled_size(self.FILE_EXTENSION.id(slot8))
	local res = RenderSettings.resolution
	local side_padding = 200
	slot11 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_16_9_workspace(self.PATH .. file)
	slot11 = self._fullscreen_ws
	self._full_panel = self._fullscreen_ws.panel(self.PATH .. file)
	slot11 = Overlay
	slot11 = Overlay.gui(self.PATH .. file)
	self._safe_rect_workspace = Overlay.gui(self.PATH .. file).create_screen_workspace(self.PATH .. file)
	slot12 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(self.PATH .. file, managers.gui_data)

	slot11 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(self.PATH .. file)
	slot11 = self._fullscreen_ws
	slot12 = {
		layer = 1
	}
	self._clipping_panel = self._fullscreen_ws.panel(self.PATH .. file).panel(self.PATH .. file, self._fullscreen_ws.panel(self.PATH .. file))
	local text_offset = self._clipping_panel.height(self.PATH .. file) - 50
	slot13 = {
		x = safe_rect_pixels.x + side_padding,
		y = text_offset,
		w = safe_rect_pixels.width - side_padding * 2,
		h = slot14
	}
	slot16 = self._fullscreen_ws
	slot16 = self._fullscreen_ws.panel(side_padding * 2)
	slot14 = self._fullscreen_ws.panel(side_padding * 2).h(side_padding * 2)
	self._credits_panel = self._clipping_panel.panel(self._clipping_panel, self._clipping_panel)
	slot15 = self._credits_panel
	slot15 = self._credits_panel.parent(slot14)
	slot13 = self._credits_panel.parent(slot14).w(slot14) / 2

	self._credits_panel.set_center_x(self._clipping_panel, self._credits_panel)

	local text_width = self._credits_panel.width(self._clipping_panel)
	self._commands = {}
	slot13 = list

	for _, data in ipairs(self._credits_panel) do
		if data._meta == "text" then
			local font_size, color = nil

			if data.type == "title" then
				font_size = tweak_data.gui.font_sizes.size_38
				color = tweak_data.gui.colors.raid_red
			elseif data.type == "name" then
				font_size = tweak_data.gui.font_sizes.small
				color = tweak_data.gui.colors.raid_dirty_white
			elseif data.type == "fill" then
				font_size = tweak_data.gui.font_sizes.small
				color = tweak_data.gui.colors.raid_red
			elseif data.type == "image-text" then
				font_size = tweak_data.gui.font_sizes.size_20
				color = tweak_data.gui.colors.raid_grey
			else
				slot21 = "[RaidMenuCreditsGui][_build_credits_panel] Unknown text type"

				Application.error(slot19, Application)
			end

			local height = font_size + 5
			slot22 = {
				vertical = "top",
				wrap = true,
				align = "center",
				word_wrap = true,
				halign = "left",
				x = 0,
				layer = 3,
				text = data.text,
				y = ypos,
				w = text_width,
				h = height,
				font_size = font_size,
				font = tweak_data.gui.get_font_path(slot24, tweak_data.gui, tweak_data.gui.fonts.din_compressed),
				color = color
			}
			slot27 = font_size
			local text_field = self._credits_panel.text(slot20, self._credits_panel)
			ypos = ypos + height
		elseif data._meta == "image" then
			local bitmap = nil

			if data.src then
				slot20 = {
					x = 0,
					layer = 3,
					y = ypos,
					texture = data.src
				}
				bitmap = self._credits_panel.bitmap(slot18, self._credits_panel)
			elseif data.atlas_src then
				local icon_params = {
					texture = tweak_data.gui.icons[data.atlas_src].texture,
					texture_rect = tweak_data.gui.icons[data.atlas_src].texture_rect
				}
				slot21 = icon_params
				bitmap = self._credits_panel.bitmap(data.atlas_src, self._credits_panel)
			else
				slot20 = "[RaidMenuCreditsGui][_build_credits_panel] Unknown image type"

				Application.error(slot18, Application)
			end

			local scale = data.scale or 1
			slot23 = bitmap
			slot21 = bitmap.width(slot22) * scale

			bitmap.set_width(slot19, bitmap)

			slot23 = bitmap
			slot21 = bitmap.height(slot22) * scale

			bitmap.set_height(slot19, bitmap)

			slot23 = self._credits_panel
			slot21 = self._credits_panel.width(slot22) / 2

			bitmap.set_center_x(slot19, bitmap)

			slot20 = bitmap
			ypos = ypos + bitmap.height(slot19)
		elseif data._meta == "br" then
			ypos = ypos + 32
		elseif data._meta == "command" then
			slot19 = {
				pos = ypos - text_offset + (data.offset or 0) + self._clipping_panel.height(slot22) / 2,
				cmd = data.cmd,
				param = data.param
			}
			slot23 = self._clipping_panel

			table.insert(slot17, self._commands)
		end
	end

	slot14 = ypos + 50

	self._credits_panel.set_height(slot12, self._credits_panel)

	return 
end
function RaidMenuCreditsGui:_show_intro_video()
	local video_panel_params = {
		is_root_panel = true,
		layer = 100
	}
	slot6 = video_panel_params
	self._video_panel = RaidGUIPanel.new(slot3, RaidGUIPanel, self._full_panel)
	local video_panel_background_params = {
		name = "video_background",
		layer = 1,
		color = Color.black
	}
	local video_panel_background = self._video_panel.rect(RaidGUIPanel, self._video_panel)
	local video_params = {
		layer = 2
	}
	slot7 = self._video_panel
	video_params.layer = self._video_panel.layer(video_panel_background_params) + 1
	video_params.video = RaidMenuCreditsGui.INTRO_VIDEO
	slot7 = self._video_panel
	video_params.width = self._video_panel.w(video_panel_background_params)
	slot8 = video_params
	self._credits_intro_video = self._video_panel.video(video_panel_background_params, self._video_panel)
	slot12 = self._credits_intro_video
	slot8 = self._video_panel.w(slot9) * self._credits_intro_video.video_height(self._video_panel) / self._credits_intro_video.video_width(self._credits_intro_video)

	self._credits_intro_video.set_h(video_panel_background_params, self._credits_intro_video)

	slot10 = self._video_panel
	slot8 = self._video_panel.h(self._credits_intro_video.video_height(self._video_panel) / self._credits_intro_video.video_width(self._credits_intro_video)) / 2

	self._credits_intro_video.set_center_y(video_panel_background_params, self._credits_intro_video)

	self._playing_intro_video = true
	slot7 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(video_panel_background_params) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot11 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot8, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot12 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot9 = self._credits_intro_video
	press_any_key_params.layer = self._credits_intro_video.layer(slot8) + 100
	slot10 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot8, self._safe_panel)
	slot10 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot15 = w

	press_any_key_prompt.set_w(slot13, press_any_key_prompt)

	slot15 = h

	press_any_key_prompt.set_h(slot13, press_any_key_prompt)

	slot17 = self._safe_panel
	slot15 = self._safe_panel.w(slot16) - 50

	press_any_key_prompt.set_right(slot13, press_any_key_prompt)

	slot17 = self._safe_panel
	slot15 = self._safe_panel.h(slot16) - 50

	press_any_key_prompt.set_bottom(slot13, press_any_key_prompt)

	slot14 = press_any_key_prompt
	slot19 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot13, callback(slot16, self, self))

	return 
end
function RaidMenuCreditsGui:_animate_show_press_any_key_prompt(prompt)
	local duration = 0.7
	local t = 0
	slot6 = 3

	wait(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 0.85)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0.85

	prompt.set_alpha(slot5, prompt)

	return 
end
function RaidMenuCreditsGui:_animate_change_press_any_key_prompt(prompt)
	local fade_out_duration = 0.25
	slot5 = prompt
	local t = (1 - prompt.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0.85, -0.85)
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
		local current_alpha = Easing.quartic_in_out(slot12, t, 0, 0.85)
		slot15 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot13 = 0.85

	prompt.set_alpha(slot11, prompt)

	return 
end
function RaidMenuCreditsGui:on_controller_hotswap()
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
function RaidMenuCreditsGui:update(t, dt)
	if self._playing_intro_video then
		slot5 = self
	end

	return 
end
function RaidMenuCreditsGui:is_playing()
	slot3 = self._credits_intro_video

	if alive(slot2) then
		slot3 = self._credits_intro_video

		return self._credits_intro_video.loop_count(slot2) < 1
	else
		return false
	end

	return 
end
function RaidMenuCreditsGui:is_skipped()
	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_pressed(slot7) then
			return true
		end
	end

	return false
end
function RaidMenuCreditsGui:_skip_video()
	slot4 = MusicManager.CREDITS_MUSIC

	managers.music.post_event(slot2, managers.music)

	local function scroll_func(o)
		slot3 = o
		local y = o.top(slot2)
		local speed = 50

		while true do
			y = y - coroutine.yield() * speed
			slot5 = o
			slot8 = y

			o.set_top(slot4, math.round(slot7))

			if self._commands[1] and y < -self._commands[1].pos then

				-- Decompilation error in this vicinity:
				slot6 = 1
				local cmd = table.remove(slot4, self._commands)

				return 
			end
		end

		return 
	end

	slot4 = self._credits_panel

	if alive(managers.music) then
		slot5 = scroll_func
		self._credits_panel_thread = self._credits_panel.animate(slot3, self._credits_panel)
	end

	return 
end
function RaidMenuCreditsGui:_setup_panels(node)
	slot5 = node

	RaidMenuCreditsGui.super._setup_panels(slot3, self)

	return 
end
function RaidMenuCreditsGui:_create_menu_item(row_item)
	slot5 = row_item

	RaidMenuCreditsGui.super._create_menu_item(slot3, self)

	return 
end
function RaidMenuCreditsGui:_setup_item_panel_parent(safe_rect)
	slot5 = safe_rect

	RaidMenuCreditsGui.super._setup_item_panel_parent(slot3, self)

	return 
end
function RaidMenuCreditsGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	RaidMenuCreditsGui.super._setup_item_panel(slot4, self, safe_rect)

	return 
end
function RaidMenuCreditsGui:resolution_changed()
	slot3 = self

	RaidMenuCreditsGui.super.resolution_changed(slot2)

	return 
end
function RaidMenuCreditsGui:set_visible(visible)
	slot5 = visible

	RaidMenuCreditsGui.super.set_visible(slot3, self)

	if visible then
		slot4 = self._fullscreen_ws

		self._fullscreen_ws.show(slot3)
	else
		slot4 = self._fullscreen_ws

		self._fullscreen_ws.hide(slot3)
	end

	return 
end
function RaidMenuCreditsGui:close(...)
	slot4 = "event_complete_state"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	slot4 = self._credits_panel_thread

	self._credits_panel.stop(slot2, self._credits_panel)

	slot3 = Overlay
	slot4 = self._fullscreen_ws

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	slot3 = Overlay
	slot4 = self._safe_rect_workspace

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	slot3 = self

	RaidMenuCreditsGui.super.close(slot2, ...)

	slot4 = MusicManager.MENU_MUSIC

	managers.music.post_event(slot2, managers.music)

	return 
end
function RaidMenuCreditsGui:mouse_moved(o, x, y)
	return false
end
function RaidMenuCreditsGui:mouse_released(o, button, x, y)
	return false
end
function RaidMenuCreditsGui:mouse_pressed(button, x, y)
	return false
end
function RaidMenuCreditsGui:mouse_clicked(button, x, y)
	return false
end
function RaidMenuCreditsGui:mouse_double_click(o, button, x, y)
	return true
end
function RaidMenuCreditsGui:confirm_pressed()
	return true
end
function RaidMenuCreditsGui:back_pressed()
	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return true
end
function RaidMenuCreditsGui:move_up()
	return true
end
function RaidMenuCreditsGui:move_down()
	return true
end
function RaidMenuCreditsGui:move_left()
	return true
end
function RaidMenuCreditsGui:move_right()
	return true
end
function RaidMenuCreditsGui:bind_controller_inputs()
	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "back_pressed")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	return 
end

return 
