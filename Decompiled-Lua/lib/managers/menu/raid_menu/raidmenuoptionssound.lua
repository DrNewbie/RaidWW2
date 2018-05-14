if not RaidMenuOptionsSound then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsSound = slot0
function RaidMenuOptionsSound:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuOptionsSound.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function RaidMenuOptionsSound:_set_initial_data()
	slot5 = "menu_header_options_sound_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
function RaidMenuOptionsSound:_layout()
	slot3 = self

	RaidMenuOptionsSound.super._layout(slot2)

	slot3 = self

	self._layout_sound(slot2)

	slot3 = self

	self._load_sound_values(slot2)

	slot4 = true

	self._progress_bar_menu_master_volume.set_selected(slot2, self._progress_bar_menu_master_volume)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function RaidMenuOptionsSound:close()
	slot3 = self

	self._save_sound_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot3 = self

	RaidMenuOptionsSound.super.close(true)

	return 
end
function RaidMenuOptionsSound:_layout_sound()
	local start_x = 0
	local start_y = 320
	local default_width = 512
	local master_params = {
		name = "slider_master",
		value_format = "%02d%%",
		value = 100
	}
	slot10 = "menu_master_volume"
	master_params.description = utf8.to_upper(managers.localization.text(slot8, managers.localization))
	master_params.x = start_x
	master_params.y = start_y
	master_params.on_value_change_callback = callback(slot6, self, self)
	master_params.on_menu_move = {
		down = "slider_music"
	}
	slot8 = master_params
	self._progress_bar_menu_master_volume = self._root_panel.slider(slot6, self._root_panel)
	local music_params = {
		name = "slider_music",
		value_format = "%02d%%",
		value = 100
	}
	slot11 = "menu_music_volume"
	music_params.description = utf8.to_upper(managers.localization.text("on_value_change_master_volume", managers.localization))
	music_params.x = start_x
	music_params.y = master_params.y + RaidGuiBase.PADDING
	music_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	music_params.on_menu_move = {
		down = "slider_sfx",
		up = "slider_master"
	}
	slot9 = music_params
	self._progress_bar_menu_music_volume = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local sfx_params = {
		name = "slider_sfx",
		value_format = "%02d%%",
		value = 100
	}
	slot12 = "menu_sfx_volume"
	sfx_params.description = utf8.to_upper(managers.localization.text("on_value_change_music_volume", managers.localization))
	sfx_params.x = start_x
	sfx_params.y = music_params.y + RaidGuiBase.PADDING
	sfx_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	sfx_params.on_menu_move = {
		down = "slider_voice_over",
		up = "slider_music"
	}
	slot10 = sfx_params
	self._progress_bar_menu_sfx_volume = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local voice_over_params = {
		name = "slider_voice_over",
		value_format = "%02d%%",
		value = 100
	}
	slot13 = "menu_voice_over_volume"
	voice_over_params.description = utf8.to_upper(managers.localization.text("on_value_change_sfx_volume", managers.localization))
	voice_over_params.x = start_x
	voice_over_params.y = sfx_params.y + RaidGuiBase.PADDING
	voice_over_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	voice_over_params.on_menu_move = {
		down = "slider_voice_chat",
		up = "slider_sfx"
	}
	slot11 = voice_over_params
	self._progress_bar_menu_voice_over_volume = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local voice_chat_params = {
		name = "slider_voice_chat",
		value_format = "%02d%%",
		value = 100
	}
	slot14 = "menu_voice_volume"
	voice_chat_params.description = utf8.to_upper(managers.localization.text("on_value_change_voice_over_volume", managers.localization))
	voice_chat_params.x = start_x
	voice_chat_params.y = voice_over_params.y + RaidGuiBase.PADDING
	voice_chat_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	voice_chat_params.on_menu_move = {
		down = "use_voice_chat",
		up = "slider_voice_over"
	}
	slot12 = voice_chat_params
	self._progress_bar_menu_voice_volume = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local use_voice_chat_params = {
		name = "use_voice_chat"
	}
	slot15 = "menu_voicechat_toggle"
	use_voice_chat_params.description = utf8.to_upper(managers.localization.text("on_value_change_voice_volume", managers.localization))
	use_voice_chat_params.x = start_x
	use_voice_chat_params.y = voice_chat_params.y + RaidGuiBase.PADDING
	use_voice_chat_params.w = default_width
	use_voice_chat_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	use_voice_chat_params.on_menu_move = {
		down = "push_to_talk",
		up = "slider_voice_chat"
	}
	slot13 = use_voice_chat_params
	self._toggle_menu_voicechat_toggle = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local push_to_talk_params = {
		name = "push_to_talk"
	}
	slot16 = "menu_push_to_talk_toggle"
	push_to_talk_params.description = utf8.to_upper(managers.localization.text("on_click_voice_chat", managers.localization))
	push_to_talk_params.x = start_x
	push_to_talk_params.y = use_voice_chat_params.y + RaidGuiBase.PADDING
	push_to_talk_params.w = default_width
	slot15 = "on_click_push_to_talk"
	push_to_talk_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	push_to_talk_params.on_menu_move = {
		up = "use_voice_chat"
	}
	slot14 = push_to_talk_params
	self._toggle_menu_push_to_talk_toggle = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)

	return 
end
function RaidMenuOptionsSound:_load_sound_values()
	slot6 = "master_volume"
	local master_volume = math.clamp(slot2, managers.user.get_setting(slot4, managers.user), 0)
	slot7 = "music_volume"
	local music_volume = math.clamp(managers.user.get_setting(slot4, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot8 = "sfx_volume"
	local sfx_volume = math.clamp(managers.user.get_setting(100, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot9 = "voice_volume"
	local voice_volume = math.clamp(managers.user.get_setting(100, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot10 = "voice_over_volume"
	slot9 = 100
	local voice_over_volume = math.clamp(managers.user.get_setting(100, managers.user), managers.user.get_setting(1, managers.user), 0)
	slot9 = "voice_chat"
	local voice_chat = managers.user.get_setting(managers.user.get_setting(1, managers.user), managers.user)
	slot10 = "push_to_talk"
	local push_to_talk = managers.user.get_setting(managers.user, managers.user)
	slot11 = master_volume

	self._progress_bar_menu_master_volume.set_value(managers.user, self._progress_bar_menu_master_volume)

	slot11 = voice_over_volume

	self._progress_bar_menu_voice_over_volume.set_value(managers.user, self._progress_bar_menu_voice_over_volume)

	slot11 = music_volume

	self._progress_bar_menu_music_volume.set_value(managers.user, self._progress_bar_menu_music_volume)

	slot11 = sfx_volume

	self._progress_bar_menu_sfx_volume.set_value(managers.user, self._progress_bar_menu_sfx_volume)

	slot11 = voice_volume * 100

	self._progress_bar_menu_voice_volume.set_value(managers.user, self._progress_bar_menu_voice_volume)

	slot11 = voice_chat

	self._toggle_menu_voicechat_toggle.set_value_and_render(managers.user, self._toggle_menu_voicechat_toggle)

	slot11 = push_to_talk

	self._toggle_menu_push_to_talk_toggle.set_value_and_render(managers.user, self._toggle_menu_push_to_talk_toggle)

	return 
end
function RaidMenuOptionsSound:_save_sound_values()
	slot3 = self

	self.on_value_change_master_volume(slot2)

	slot3 = self

	self.on_value_change_music_volume(slot2)

	slot3 = self

	self.on_value_change_sfx_volume(slot2)

	slot3 = self

	self.on_value_change_voice_volume(slot2)

	slot3 = self

	self.on_value_change_voice_over_volume(slot2)

	slot3 = self

	self.on_click_voice_chat(slot2)

	slot3 = self

	self.on_click_push_to_talk(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	return 
end
function RaidMenuOptionsSound:on_value_change_master_volume()
	slot5 = self._progress_bar_menu_master_volume
	slot3 = self._progress_bar_menu_master_volume.get_value(slot4)
	slot5 = 100
	local master_volume = math.clamp(slot2, slot3, 0)
	slot4 = managers.menu
	slot5 = master_volume

	managers.menu.active_menu(slot3).callback_handler.set_master_volume_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
function RaidMenuOptionsSound:on_value_change_music_volume()
	slot5 = self._progress_bar_menu_music_volume
	slot3 = self._progress_bar_menu_music_volume.get_value(slot4)
	slot5 = 100
	local music_volume = math.clamp(slot2, slot3, 0)
	slot4 = managers.menu
	slot5 = music_volume

	managers.menu.active_menu(slot3).callback_handler.set_music_volume_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
function RaidMenuOptionsSound:on_value_change_sfx_volume()
	slot5 = self._progress_bar_menu_sfx_volume
	slot3 = self._progress_bar_menu_sfx_volume.get_value(slot4)
	slot5 = 100
	local sfx_volume = math.clamp(slot2, slot3, 0)
	slot4 = managers.menu
	slot5 = sfx_volume

	managers.menu.active_menu(slot3).callback_handler.set_sfx_volume_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
function RaidMenuOptionsSound:on_value_change_voice_over_volume()
	slot5 = self._progress_bar_menu_voice_over_volume
	slot3 = self._progress_bar_menu_voice_over_volume.get_value(slot4)
	slot5 = 100
	local voice_over_volume = math.clamp(slot2, slot3, 0)
	slot4 = managers.menu
	slot5 = voice_over_volume

	managers.menu.active_menu(slot3).callback_handler.set_voice_over_volume_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
function RaidMenuOptionsSound:on_value_change_voice_volume()
	slot5 = self._progress_bar_menu_voice_volume
	slot3 = self._progress_bar_menu_voice_volume.get_value(slot4)
	slot5 = 100
	local voice_volume = math.clamp(slot2, slot3, 0)
	slot4 = managers.menu
	slot5 = voice_volume

	managers.menu.active_menu(slot3).callback_handler.set_voice_volume_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
function RaidMenuOptionsSound:on_click_voice_chat()
	local voice_chat = self._toggle_menu_voicechat_toggle.get_value(slot2)
	slot4 = managers.menu
	slot5 = voice_chat

	managers.menu.active_menu(self._toggle_menu_voicechat_toggle).callback_handler.toggle_voicechat_raid(self._toggle_menu_voicechat_toggle, managers.menu.active_menu(self._toggle_menu_voicechat_toggle).callback_handler)

	slot4 = managers.network.voice_chat

	managers.network.voice_chat.update_settings(self._toggle_menu_voicechat_toggle)

	return 
end
function RaidMenuOptionsSound:on_click_push_to_talk()
	local push_to_talk = self._toggle_menu_push_to_talk_toggle.get_value(slot2)
	slot4 = managers.menu
	slot5 = push_to_talk

	managers.menu.active_menu(self._toggle_menu_push_to_talk_toggle).callback_handler.toggle_push_to_talk_raid(self._toggle_menu_push_to_talk_toggle, managers.menu.active_menu(self._toggle_menu_push_to_talk_toggle).callback_handler)

	slot4 = managers.network.voice_chat

	managers.network.voice_chat.update_settings(self._toggle_menu_push_to_talk_toggle)

	return 
end
function RaidMenuOptionsSound:close()
	slot4 = "RaidMenuOptionsSound:close()"

	Application.trace(slot2, Application)

	slot3 = self

	self._save_sound_values(slot2)

	slot3 = self

	RaidMenuOptionsSound.super.close(slot2)

	return 
end
function RaidMenuOptionsSound:bind_controller_inputs()
	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	return 
end

return 
