-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/states/GameState"

require(slot1)

if not BootupState then
	slot2 = GameState
	slot0 = class(slot1)
end

BootupState = slot0
BootupState.MAX_WAIT_TIME = 25
function BootupState:init(game_state_machine, setup)
	slot7 = game_state_machine

	GameState.init(slot4, self, "bootup")

	if setup then
		slot5 = self

		self.setup(slot4)
	end

	return 
end
function BootupState:setup()
	local res = RenderSettings.resolution
	local safe_rect_pixels = managers.gui_data.scaled_size(slot3)
	local gui = Overlay.gui(managers.gui_data)
	slot7 = "WIN32"
	local is_win32 = SystemInfo.platform(Overlay) == Idstring(SystemInfo)
	slot8 = "X360"
	local is_x360 = SystemInfo.platform(slot6) == Idstring(SystemInfo)
	local show_esrb = false
	slot9 = gui
	self._full_workspace = gui.create_screen_workspace(slot8)
	slot9 = managers.gui_data
	self._workspace = managers.gui_data.create_saferect_workspace(slot8)
	slot9 = self._workspace

	self._workspace.hide(slot8)

	slot9 = self._full_workspace

	self._full_workspace.hide(slot8)
	managers.gui_data.layout_workspace(slot8, managers.gui_data)

	local esrb_y = safe_rect_pixels.height / 1.9
	local can_skip = true
	local has_full_game = managers.dlc.has_full_game(self._workspace)
	local legal_text = managers.localization.text(managers.dlc, managers.localization)
	local item_layer = 10
	self._play_data_list = {}
	slot15 = {
		video = "movies/vanilla/splash/splash",
		can_skip = true,
		padding = 200,
		layer = item_layer,
		width = res.x,
		height = res.y
	}

	table.insert("legal_text", self._play_data_list)

	slot15 = {
		video = "movies/vanilla/raid_trailer_1080p_final",
		can_skip = true,
		padding = 200,
		layer = item_layer,
		width = res.x,
		height = res.y
	}

	table.insert("legal_text", self._play_data_list)

	slot15 = {
		texture = "guis/textures/esrb_rating",
		fade_out = 1.25,
		fade_in = 1.25,
		visible = show_esrb,
		layer = item_layer,
		width = esrb_y * 2,
		height = esrb_y,
		can_skip = has_full_game,
		duration = (show_esrb and 6.5) or 0
	}

	table.insert(slot13, self._play_data_list)

	slot14 = Application

	if not Application.production_build(slot13) then
	end

	slot16 = tweak_data.gui.font_sizes.size_16
	local lato_path = tweak_data.gui.get_font_path(slot13, tweak_data.gui, tweak_data.gui.fonts.lato)
	slot15 = self._full_workspace
	self._full_panel = self._full_workspace.panel(tweak_data.gui)
	slot15 = self._workspace
	self._panel = self._workspace.panel(tweak_data.gui)

	self._full_panel.rect(tweak_data.gui, self._full_panel)

	local press_any_key_font_size = tweak_data.gui.font_sizes.medium
	local press_any_key_prompt_params = {
		vertical = "bottom",
		wrap = true,
		align = "center",
		name = "press_any_key_text",
		alpha = 0,
		layer = 3
	}
	slot17 = self._full_panel
	press_any_key_prompt_params.w = self._full_panel.w({
		layer = 0,
		visible = false,
		color = Color.red
	})
	press_any_key_prompt_params.h = press_any_key_font_size
	slot19 = press_any_key_font_size
	press_any_key_prompt_params.font = tweak_data.gui.get_font_path(, tweak_data.gui, MenuTitlescreenState.FONT)
	press_any_key_prompt_params.font_size = press_any_key_font_size
	press_any_key_prompt_params.color = MenuTitlescreenState.TEXT_COLOR
	press_any_key_prompt_params.text = utf8.to_upper(managers.localization.text(MenuTitlescreenState.FONT, managers.localization))
	slot18 = press_any_key_prompt_params
	self._press_any_key_text = self._full_panel.text(, self._full_panel)
	slot17 = self._press_any_key_text
	local _, _, _, h = self._press_any_key_text.text_rect()
	slot22 = h

	self._press_any_key_text.set_h("press_any_key", self._press_any_key_text)

	slot24 = self._full_panel
	slot22 = self._full_panel.h(slot23) * MenuTitlescreenState.LEGAL_TEXT_CENTER_Y

	self._press_any_key_text.set_center_y("press_any_key", self._press_any_key_text)

	slot22 = 0

	self._press_any_key_text.set_alpha("press_any_key", self._press_any_key_text)

	self._controller_list = {}
	slot22 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self._press_any_key_text), 1 do
		slot28 = false
		local con = managers.controller.create_controller(slot24, managers.controller, "boot_" .. index, index)
		slot26 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	slot21 = Application
	self._bootup_t = Application.time(slot20)

	return 
end
function BootupState:at_enter()
	slot4 = false

	managers.menu.input_enabled(slot2, managers.menu)

	if not self._controller_list then
		slot3 = self

		self.setup(slot2)

		slot4 = "Shouldn't enter boot state more than once. Except when toggling freeflight."

		Application.stack_dump_error(slot2, Application)
	end

	slot4 = "main_menu"
	self._sound_listener = SoundDevice.create_listener(slot2, SoundDevice)
	slot4 = true

	self._sound_listener.activate(slot2, self._sound_listener)

	slot3 = self._workspace

	self._workspace.show(slot2)

	slot3 = self._full_workspace

	self._full_workspace.show(slot2)

	slot5 = "clbk_game_has_music_control"
	self._clbk_game_has_music_control_callback = callback(slot2, self, self)
	slot5 = self._clbk_game_has_music_control_callback

	managers.platform.add_event_callback(slot2, managers.platform, "media_player_control")

	slot3 = self

	self.play_next(slot2)

	if Global.exe_argument_level then
		slot3 = self
		slot4 = "menu_titlescreen"

		self.gsm(slot2).change_state_by_name(slot2, self.gsm(slot2))
	end

	return 
end
function BootupState:clbk_game_has_music_control(status)
	if self._play_data and self._play_data.video then
		slot5 = (status and 1) or 0

		self._gui_obj.set_volume_gain(slot3, self._gui_obj)
	end

	return 
end
function BootupState:update(t, dt)
	slot5 = Application
	local now = Application.time(slot4)

	if not self.next_message_t then
		slot6 = Application
		slot4 = Application.time(slot5) + 1
	end

	self.next_message_t = slot4

	if self.next_message_t < now then
		slot6 = PackageManager

		if not PackageManager.all_packages_loaded(slot5) then
			slot7 = "[BootupState:update] Waiting for packages to load..."

			Application.debug(slot5, Application)

			self.next_message_t = now + 1
		end
	end

	slot7 = "WIN32"

	if not SystemInfo.platform(slot5) == Idstring(SystemInfo) then
		slot6 = PackageManager

		if PackageManager.all_packages_loaded(slot5) and self._play_index == 2 then
			slot6 = self._press_any_key_text

			if self._press_any_key_text.alpha(slot5) == 0 then
				slot6 = self._full_panel
				slot11 = "_animate_press_any_key"

				self._full_panel.animate(slot5, callback(slot8, self, self))
			end
		end
	end

	slot6 = self

	self.check_confirm_pressed(slot5)

	slot6 = self

	if self.is_playing(slot5) and (self._play_data.can_skip or Global.override_bootup_can_skip) then
		slot6 = self
	else
		slot6 = self

		self.update_fades(slot5)
	end

	return 
end
function BootupState:check_confirm_pressed()
	slot3 = self._controller_list

	for index, controller in ipairs(slot2) do
		slot9 = "confirm"

		if controller.get_input_pressed(slot7, controller) then
			slot8 = "check_confirm_pressed"

			print(slot7)

			slot9 = "invite_join_message"
			local active, dialog = managers.system_menu.is_active_by_id(slot7, managers.system_menu)

			if active then
				slot10 = "close"

				print(slot9)

				slot10 = dialog

				dialog.button_pressed_callback(slot9)
			end
		end
	end

	return 
end
function BootupState:update_fades()
	local time, duration = nil

	if self._play_data.video then
		slot5 = self._gui_obj
		duration = self._gui_obj.length(slot4)
		slot5 = self._gui_obj
		local frames = self._gui_obj.frames(slot4)

		if 0 < frames then
			slot6 = self._gui_obj
			time = self._gui_obj.frame_num(slot5) / frames * duration
		else
			time = 0
		end
	else
		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		time = TimerManager.game(slot4).time(slot4) - self._play_time
		duration = self._play_data.duration
	end

	local old_fade = self._fade

	if self._play_data.fade_in and time < self._play_data.fade_in then
		if 0 < self._play_data.fade_in then
			self._fade = time / self._play_data.fade_in
		else
			self._fade = 1
		end
	elseif self._play_data.fade_in and duration - time < self._play_data.fade_out then
		if 0 < self._play_data.fade_out then
			self._fade = (duration - time) / self._play_data.fade_out
		else
			self._fade = 0
		end
	else
		self._fade = 1
	end

	if self._fade ~= old_fade then
		slot6 = self

		self.apply_fade(slot5)
	end

	return 
end
function BootupState:apply_fade()
	if self._play_data.gui then
		if self._gui_obj.script then
			slot3 = self._gui_obj
			local script = self._gui_obj.script(slot2)
		end

		if script.set_fade then
			slot5 = self._fade

			script.set_fade(slot3, script)
		else
			slot8 = self._play_data.gui
			slot5 = "GUI \"" .. tostring(slot7) .. "\" lacks a function set_fade( o, fade )."

			Application.error(slot3, Application)
		end
	else
		slot3 = self._gui_obj
		slot6 = self._gui_obj
		slot7 = self._fade

		self._gui_obj.set_color(slot2, self._gui_obj.color(slot5).with_alpha(slot5, self._gui_obj.color(slot5)))
	end

	return 
end
function BootupState:is_skipped()
	slot4 = "WIN32"

	if not SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = PackageManager

		if not PackageManager.all_packages_loaded(slot2) and 1 < self._play_index then
			slot4 = Application

			if Application.time(slot3) < self._bootup_t + BootupState.MAX_WAIT_TIME then
				return false
			end
		end
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
function BootupState:is_playing()
	slot3 = self._gui_obj

	if alive(slot2) then
		if self._gui_obj.loop_count then
			slot3 = self._gui_obj

			return self._gui_obj.loop_count(slot2) < 1
		else
			slot3 = TimerManager
			slot3 = TimerManager.game(slot2)

			return TimerManager.game(slot2).time(slot2) < self._play_time + self._play_data.duration
		end
	else
		return false
	end

	return 
end
function BootupState:_animate_press_any_key()
	local press_any_key_fade_in_duration = 0.3
	local t = 0

	while t < press_any_key_fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = press_any_key_fade_in_duration
		local current_alpha = Easing.quintic_in_out(slot5, t, 0, 0.8)
		slot8 = current_alpha

		self._press_any_key_text.set_alpha(t, self._press_any_key_text)
	end

	slot6 = 0.8

	self._press_any_key_text.set_alpha(slot4, self._press_any_key_text)

	return 
end
function BootupState:play_next(is_skipped)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	self._play_time = TimerManager.game(slot3).time(slot3)
	self._play_index = (self._play_index or 0) + 1
	self._play_data = self._play_data_list[self._play_index]

	if self._play_index == 2 then
		slot6 = 1

		Application.set_file_streamer_settings(slot3, Application, 4194304)
	end

	if is_skipped then
		while self._play_data and self._play_data.auto_skip do
			self._play_index = self._play_index + 1
			self._play_data = self._play_data_list[self._play_index]
		end
	end

	if self._play_data then
		self._fade = (self._play_data.fade_in and 0) or 1
		slot4 = self._gui_obj

		if alive(slot3) then
			slot5 = self._gui_obj

			self._panel.remove(slot3, self._panel)

			slot4 = self._gui_obj

			if alive(slot3) then
				slot5 = self._gui_obj

				self._full_panel.remove(slot3, self._full_panel)
			end

			self._gui_obj = nil
		end

		local res = RenderSettings.resolution
		local width, height = nil
		local padding = self._play_data.padding or 0

		if self._play_data.gui then
			if res.x / res.y < self._play_data.width / self._play_data.height then
				width = res.x - padding * 2
				height = (self._play_data.height * width) / self._play_data.width
			else
				height = self._play_data.height
				width = self._play_data.width
			end
		else
			height = self._play_data.height
			width = self._play_data.width
		end

		local x = (self._panel.w(slot7) - width) / 2
		slot9 = self._panel
		local y = (self._panel.h(self._panel) - height) / 2
		local gui_config = {
			x = x,
			y = y,
			width = width,
			height = height,
			layer = tweak_data.gui.BOOT_SCREEN_LAYER
		}

		if self._play_data.video then
			gui_config.video = self._play_data.video
			gui_config.layer = self._play_data.layer or gui_config.layer
			slot12 = gui_config
			self._gui_obj = self._full_panel.video(slot10, self._full_panel)
			slot11 = managers.music

			if not managers.music.has_music_control(slot10) then
				slot12 = 0

				self._gui_obj.set_volume_gain(slot10, self._gui_obj)
			else
				slot12 = 0.75

				self._gui_obj.set_volume_gain(slot10, self._gui_obj)
			end

			local w = self._gui_obj.video_width(slot10)
			slot12 = self._gui_obj
			local h = self._gui_obj.video_height(self._gui_obj)
			local m = h / w
			slot16 = res.x * m

			self._gui_obj.set_size(slot13, self._gui_obj, res.x)

			slot16 = res.y / 2

			self._gui_obj.set_center(slot13, self._gui_obj, res.x / 2)

			slot14 = self._gui_obj

			self._gui_obj.play(slot13)
		elseif self._play_data.texture then
			gui_config.texture = self._play_data.texture
			slot12 = gui_config
			self._gui_obj = self._panel.bitmap(slot10, self._panel)
		elseif self._play_data.text then
			gui_config.text = self._play_data.text
			gui_config.font = self._play_data.font
			gui_config.font_size = self._play_data.font_size
			gui_config.wrap = self._play_data.wrap
			gui_config.word_wrap = self._play_data.word_wrap
			gui_config.y = 850
			slot12 = gui_config
			self._gui_obj = self._panel.text(slot10, self._panel)
		elseif self._play_data.gui then
			slot12 = self._play_data.gui
			self._gui_obj = self._panel.gui(slot10, self._panel)
			slot15 = height

			self._gui_obj.set_shape(slot10, self._gui_obj, x, y, width)

			slot11 = self._gui_obj
			local script = self._gui_obj.script(slot10)

			if script.setup then
				slot12 = script

				script.setup(slot11)
			end
		end

		slot11 = self

		self.apply_fade(slot10)
	else
		slot4 = self
		slot5 = "menu_titlescreen"

		self.gsm(slot3).change_state_by_name(slot3, self.gsm(slot3))
	end

	return 
end
function BootupState:at_exit()
	slot5 = self._clbk_game_has_music_control_callback

	managers.platform.remove_event_callback(slot2, managers.platform, "media_player_control")

	slot3 = self._workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._workspace = nil
		self._gui_obj = nil
	end

	slot3 = self._full_workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._full_workspace

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._full_workspace = nil
	end

	if self._controller_list then
		slot3 = self._controller_list

		for _, controller in ipairs(slot2) do
			slot8 = controller

			controller.destroy(slot7)
		end

		self._controller_list = nil
	end

	if self._sound_listener then
		slot3 = self._sound_listener

		self._sound_listener.delete(slot2)

		self._sound_listener = nil
	end

	self._play_data_list = nil
	self._play_index = nil
	self._play_data = nil
	slot4 = true

	managers.menu.input_enabled(slot2, managers.menu)

	slot4 = "packages/boot_screen"

	if PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/boot_screen"

		PackageManager.unload(slot2, PackageManager)
	end

	return 
end
function BootupState:is_joinable()
	return false
end

return 
