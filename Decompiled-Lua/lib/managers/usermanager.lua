-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "UserManager"

core.module(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

UserManager = UserManager or class()
UserManager.PLATFORM_CLASS_MAP = {}
function UserManager:new(...)
	local platform = SystemInfo.platform(slot2)
	slot5 = platform
	slot4 = self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericUserManager

	return self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericUserManager.new(SystemInfo, ...)
end
GenericUserManager = GenericUserManager or class()
GenericUserManager.STORE_SETTINGS_ON_PROFILE = false
GenericUserManager.CAN_SELECT_USER = false
GenericUserManager.CAN_SELECT_STORAGE = false
GenericUserManager.NOT_SIGNED_IN_STATE = nil
GenericUserManager.CAN_CHANGE_STORAGE_ONLY_ONCE = true
function GenericUserManager:init()
	self._setting_changed_callback_handler_map = {}
	slot3 = CoreEvent.CallbackEventHandler
	self._user_state_changed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._active_user_state_changed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._storage_changed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = self

	if not self.is_global_initialized(slot2) then
		Global.user_manager = {
			initializing = true,
			setting_map = {},
			setting_data_map = {},
			setting_data_id_to_name_map = {},
			user_map = {}
		}
		slot3 = self

		self.setup_setting_map()

		Global.user_manager.initializing = nil
	end

	self._key_rebind_skip_first_activate_key = true
	self._key_rebind_started = false
	slot4 = "user_manager"
	slot9 = "reapply_control_options_after_controller_hotswap"

	managers.controller.add_hotswap_callback(slot2, managers.controller, callback(slot6, self, self))

	return 
end
function GenericUserManager:reapply_control_options_after_controller_hotswap()
	slot6 = "camera_sensitivity"
	local camera_sensitivity = math.clamp(slot2, managers.user.get_setting(slot4, managers.user), 0)
	slot7 = "camera_zoom_sensitivity"
	slot4 = managers.user.get_setting(100, managers.user)
	slot6 = 100
	local camera_zoom_sensitivity = math.clamp(managers.user.get_setting(slot4, managers.user), slot4, 0)
	slot7 = camera_sensitivity

	managers.user.set_setting(slot4, managers.user, "camera_sensitivity")

	slot7 = camera_zoom_sensitivity

	managers.user.set_setting(slot4, managers.user, "camera_zoom_sensitivity")

	return 
end
function GenericUserManager:get_key_rebind_skip_first_activate_key()
	return self._key_rebind_skip_first_activate_key
end
function GenericUserManager:set_key_rebind_skip_first_activate_key(flag)
	self._key_rebind_skip_first_activate_key = flag

	return 
end
function GenericUserManager:get_key_rebind_started()
	return self._key_rebind_started
end
function GenericUserManager:set_key_rebind_started(flag)
	self._key_rebind_started = flag

	return 
end
function GenericUserManager:init_finalize()
	slot3 = self

	self.update_all_users(slot2)

	return 
end
function GenericUserManager:is_global_initialized()
	return Global.user_manager and not Global.user_manager.initializing
end
slot3 = "PS3"
local is_ps3 = SystemInfo.platform(function (self)
	if Global.user_manager then
		slot1 = not Global.user_manager.initializing
	end

	return slot1
end) == Idstring(SystemInfo)
slot4 = "X360"
local is_x360 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
slot5 = "PS4"
local is_ps4 = SystemInfo.platform(slot3) == Idstring(SystemInfo)
slot6 = "XB1"
local is_xb1 = SystemInfo.platform(slot4) == Idstring(SystemInfo)
function GenericUserManager:setup_setting_map()
	slot6 = false

	self.setup_setting(slot2, self, 1, "invert_camera_x")

	slot6 = false

	self.setup_setting(slot2, self, 2, "invert_camera_y")

	slot6 = 1

	self.setup_setting(slot2, self, 3, "camera_sensitivity")

	slot6 = true

	self.setup_setting(slot2, self, 4, "rumble")

	slot6 = 50

	self.setup_setting(slot2, self, 5, "music_volume")

	slot6 = 50

	self.setup_setting(slot2, self, 6, "sfx_volume")

	slot6 = true

	self.setup_setting(slot2, self, 7, "subtitle")

	slot6 = 1

	self.setup_setting(slot2, self, 8, "brightness")

	slot6 = true

	self.setup_setting(slot2, self, 9, "hold_to_steelsight")

	slot6 = not is_ps3 and not is_x360 and not is_ps4 and not is_xb1 and true

	self.setup_setting(slot2, self, 10, "hold_to_run")

	slot6 = 50

	self.setup_setting(slot2, self, 11, "voice_volume")

	slot6 = {}

	self.setup_setting(slot2, self, 12, "controller_mod")

	slot6 = true

	self.setup_setting(slot2, self, 13, "alienware_mask")

	slot6 = true

	self.setup_setting(slot2, self, 14, "developer_mask")

	slot6 = true

	self.setup_setting(slot2, self, 15, "voice_chat")

	slot6 = true

	self.setup_setting(slot2, self, 16, "push_to_talk")

	slot6 = false

	self.setup_setting(slot2, self, 17, "hold_to_duck")

	slot6 = "color_off"

	self.setup_setting(slot2, self, 18, "video_color_grading")

	slot6 = "AA"

	self.setup_setting(slot2, self, 19, "video_anti_alias")

	slot6 = (not is_ps3 and not is_x360 and 3) or 2

	self.setup_setting(slot2, self, 20, "video_animation_lod")

	slot6 = true

	self.setup_setting(slot2, self, 21, "video_streaks")

	slot6 = "clowns"

	self.setup_setting(slot2, self, 22, "mask_set")

	slot6 = false

	self.setup_setting(slot2, self, 23, "use_lightfx")

	slot6 = 75

	self.setup_setting(slot2, self, 24, "fov_standard")

	slot6 = 75

	self.setup_setting(slot2, self, 25, "fov_zoom")

	slot6 = 1

	self.setup_setting(slot2, self, 26, "camera_zoom_sensitivity")

	slot6 = false

	self.setup_setting(slot2, self, 27, "enable_camera_zoom_sensitivity")

	slot6 = true

	self.setup_setting(slot2, self, 28, "light_adaption")

	slot6 = "fire"

	self.setup_setting(slot2, self, 29, "menu_theme")

	slot6 = "fire"

	self.setup_setting(slot2, self, 30, "newest_theme")

	slot6 = true

	self.setup_setting(slot2, self, 31, "hit_indicator")

	slot6 = true

	self.setup_setting(slot2, self, 32, "aim_assist")

	slot6 = "pc"

	self.setup_setting(slot2, self, 33, "controller_mod_type")

	slot6 = true

	self.setup_setting(slot2, self, 34, "objective_reminder")

	slot6 = _G.tweak_data.EFFECT_QUALITY

	self.setup_setting(slot2, self, 35, "effect_quality")

	slot6 = 1.25

	self.setup_setting(slot2, self, 36, "fov_multiplier")

	slot6 = false

	self.setup_setting(slot2, self, 37, "southpaw")

	slot6 = "standard"

	self.setup_setting(slot2, self, 38, "dof_setting")

	slot6 = 60

	self.setup_setting(slot2, self, 39, "fps_cap")

	slot6 = true

	self.setup_setting(slot2, self, 40, "use_headbob")

	slot6 = 4096

	self.setup_setting(slot2, self, 41, "max_streaming_chunk")

	slot6 = false

	self.setup_setting(slot2, self, 42, "net_packet_throttling")

	slot6 = false

	self.setup_setting(slot2, self, 43, "__unused")

	slot6 = true

	self.setup_setting(slot2, self, 44, "net_use_compression")

	slot6 = true

	self.setup_setting(slot2, self, 45, "net_forwarding")

	slot6 = false

	self.setup_setting(slot2, self, 46, "flush_gpu_command_queue")

	slot6 = false

	self.setup_setting(slot2, self, 47, "use_thq_weapon_parts")

	slot6 = "standard"

	self.setup_setting(slot2, self, 48, "ssao_setting")

	slot6 = "FXAA"

	self.setup_setting(slot2, self, 49, "AA_setting")

	slot6 = 11

	self.setup_setting(slot2, self, 50, "last_selected_character_profile_slot")

	slot6 = "standard"

	self.setup_setting(slot2, self, 51, "motion_blur_setting")

	slot6 = "standard"

	self.setup_setting(slot2, self, 52, "vls_setting")

	slot6 = 1

	self.setup_setting(slot2, self, 53, "detail_distance")

	slot6 = true

	self.setup_setting(slot2, self, 54, "use_parallax")

	slot6 = "off"

	self.setup_setting(slot2, self, 55, "colorblind_setting")

	slot6 = 50

	self.setup_setting(slot2, self, 56, "voice_over_volume")

	slot6 = 50

	self.setup_setting(slot2, self, 57, "master_volume")

	slot6 = 1

	self.setup_setting(slot2, self, 58, "camera_sensitivity_x")

	slot6 = 1

	self.setup_setting(slot2, self, 59, "camera_sensitivity_y")

	slot6 = false

	self.setup_setting(slot2, self, 60, "enable_camera_sensitivity_separate")

	slot6 = 1

	self.setup_setting(slot2, self, 61, "camera_zoom_sensitivity_x")

	slot6 = 1

	self.setup_setting(slot2, self, 62, "camera_zoom_sensitivity_y")

	slot6 = true

	self.setup_setting(slot2, self, 63, "sticky_aim")

	slot6 = true

	self.setup_setting(slot2, self, 64, "use_camera_accel")

	return 
end
function GenericUserManager:setup_setting(id, name, default_value)
	slot10 = name
	slot7 = "[UserManager] Setting name \"" .. tostring(slot9) .. "\" already exists."

	assert(slot5, not Global.user_manager.setting_data_map[name])

	slot10 = id
	slot7 = "[UserManager] Setting id \"" .. tostring("\" already exists.") .. "\" already exists."

	assert(slot5, not Global.user_manager.setting_data_id_to_name_map[id])

	local setting_data = {
		id = id
	}
	slot8 = default_value
	setting_data.default_value = self.get_clone_value(not Global.user_manager.setting_data_id_to_name_map[id], self)
	Global.user_manager.setting_data_map[name] = setting_data
	Global.user_manager.setting_data_id_to_name_map[id] = name
	slot9 = name
	Global.user_manager.setting_map[id] = self.get_default_setting(self, self)

	return 
end
function GenericUserManager:update(t, dt)
	return 
end
function GenericUserManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function GenericUserManager:reset_setting_map()
	slot3 = Global.user_manager.setting_data_map

	for name in pairs(slot2) do
		slot8 = name
		slot12 = name

		self.set_setting(slot6, self, self.get_default_setting(slot10, self))
	end

	return 
end
function GenericUserManager:reset_controls_setting_map()
	local settings = {
		"camera_sensitivity",
		"camera_zoom_sensitivity",
		"enable_camera_zoom_sensitivity",
		"invert_camera_y",
		"hold_to_steelsight",
		"hold_to_run",
		"hold_to_duck",
		"rumble",
		"aim_assist",
		"southpaw",
		"invert_camera_x",
		"camera_sensitivity_x",
		"camera_sensitivity_y",
		"enable_camera_sensitivity_separate",
		"camera_zoom_sensitivity_x",
		"camera_zoom_sensitivity_y",
		"sticky_aim"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:reset_controls_keybinds_setting_map()
	local settings = {
		"controller_mod",
		"controller_mod_type"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:reset_video_setting_map()
	local settings = {
		"subtitle",
		"hit_indicator",
		"brightness",
		"effect_quality",
		"use_headbob",
		"use_camera_accel"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:reset_advanced_video_setting_map()
	local settings = {
		"ssao_setting",
		"use_parallax",
		"motion_blur_setting",
		"vls_setting",
		"flush_gpu_command_queue",
		"use_lightfx",
		"fov_multiplier",
		"detail_distance",
		"AA_setting",
		"video_animation_lod",
		"fps_cap",
		"max_streaming_chunk",
		"colorblind_setting",
		"dof_setting",
		"fov_multiplier"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:reset_sound_setting_map()
	local settings = {
		"music_volume",
		"sfx_volume",
		"voice_volume",
		"voice_over_volume",
		"voice_chat",
		"push_to_talk",
		"master_volume"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:reset_network_setting_map()
	local settings = {
		"net_packet_throttling",
		"net_forwarding",
		"net_use_compression"
	}
	slot4 = settings

	for _, name in pairs(slot3) do
		slot10 = name
		slot14 = name

		self.set_setting(slot8, self, self.get_default_setting(slot12, self))
	end

	return 
end
function GenericUserManager:get_clone_value(value)
	slot4 = value

	if type(slot3) == "table" then
		slot4 = value

		return CoreTable.deep_clone(slot3)
	else
		return value
	end

	return 
end
function GenericUserManager:get_setting(name)
	local setting_data = Global.user_manager.setting_data_map[name]
	slot9 = name
	slot6 = "[UserManager] Tried to get non-existing setting \"" .. tostring(slot8) .. "\"."

	assert(slot4, setting_data)

	return Global.user_manager.setting_map[setting_data.id]
end
function GenericUserManager:get_default_setting(name)
	local setting_data = Global.user_manager.setting_data_map[name]
	slot9 = name
	slot6 = "[UserManager] Tried to get non-existing default setting \"" .. tostring(slot8) .. "\"."

	assert(slot4, setting_data)

	slot6 = setting_data.default_value

	return self.get_clone_value(slot4, self)
end
function GenericUserManager:set_setting(name, value, force_change)
	local setting_data = Global.user_manager.setting_data_map[name]

	if not setting_data then
		slot11 = name
		slot8 = "[UserManager] Tried to set non-existing default setting \"" .. tostring(slot10) .. "\"."

		Application.error(slot6, Application)

		return 
	end

	local old_value = Global.user_manager.setting_map[setting_data.id]
	Global.user_manager.setting_map[setting_data.id] = value
	slot10 = value

	if self.has_setting_changed(setting_data.id, self, old_value) or force_change then
		slot8 = managers.savefile

		managers.savefile.setting_changed(slot7)

		local callback_handler = self._setting_changed_callback_handler_map[name]

		if callback_handler then
			slot12 = value

			callback_handler.dispatch(slot8, callback_handler, name, old_value)
		end
	end

	return 
end
function GenericUserManager:add_setting_changed_callback(setting_name, callback_func, trigger_changed_from_default_now)
	slot10 = setting_name
	slot7 = "[UserManager] Tried to add setting changed callback for non-existing setting \"" .. tostring(slot9) .. "\"."

	assert(slot5, Global.user_manager.setting_data_map[setting_name])

	if not self._setting_changed_callback_handler_map[setting_name] then
		slot6 = CoreEvent.CallbackEventHandler
		local callback_handler = CoreEvent.CallbackEventHandler.new(slot5)
	end

	self._setting_changed_callback_handler_map[setting_name] = callback_handler
	slot8 = callback_func

	callback_handler.add(slot6, callback_handler)

	if trigger_changed_from_default_now then
		slot8 = setting_name
		local value = self.get_setting(slot6, self)
		slot9 = setting_name
		local default_value = self.get_default_setting(self, self)
		slot11 = value

		if self.has_setting_changed(self, self, default_value) then
			slot11 = value

			callback_func(slot8, setting_name, default_value)
		end
	end

	return 
end
function GenericUserManager:remove_setting_changed_callback(setting_name, callback_func)
	local callback_handler = self._setting_changed_callback_handler_map[setting_name]
	slot10 = setting_name
	slot7 = "[UserManager] Tried to remove setting changed callback for non-existing setting \"" .. tostring(slot9) .. "\"."

	assert(slot5, Global.user_manager.setting_data_map[name])

	slot10 = setting_name
	slot7 = "[UserManager] Tried to remove non-existing setting changed callback for setting \"" .. tostring("\".") .. "\"."

	assert(slot5, callback_handler)

	slot7 = callback_func

	callback_handler.remove(slot5, callback_handler)

	return 
end
function GenericUserManager:has_setting_changed(old_value, new_value)
	slot5 = old_value

	if type(slot4) == "table" then
		slot5 = new_value
	else
		return old_value ~= new_value
	end

	return 
end
function GenericUserManager:is_online_menu()
	return false
end
function GenericUserManager:update_all_users()
	return 
end
function GenericUserManager:update_user(user_index, ignore_username_change)
	return 
end
function GenericUserManager:add_user_state_changed_callback(callback_func)
	slot5 = callback_func

	self._user_state_changed_callback_handler.add(slot3, self._user_state_changed_callback_handler)

	return 
end
function GenericUserManager:remove_user_state_changed_callback(callback_func)
	slot5 = callback_func

	self._user_state_changed_callback_handler.remove(slot3, self._user_state_changed_callback_handler)

	return 
end
function GenericUserManager:add_active_user_state_changed_callback(callback_func)
	slot5 = callback_func

	self._active_user_state_changed_callback_handler.add(slot3, self._active_user_state_changed_callback_handler)

	return 
end
function GenericUserManager:remove_active_user_state_changed_callback(callback_func)
	slot5 = callback_func

	self._active_user_state_changed_callback_handler.remove(slot3, self._active_user_state_changed_callback_handler)

	return 
end
function GenericUserManager:add_storage_changed_callback(callback_func)
	slot5 = callback_func

	self._storage_changed_callback_handler.add(slot3, self._storage_changed_callback_handler)

	return 
end
function GenericUserManager:remove_storage_changed_callback(callback_func)
	slot5 = callback_func

	self._storage_changed_callback_handler.remove(slot3, self._storage_changed_callback_handler)

	return 
end
function GenericUserManager:set_user_soft(user_index, platform_id, storage_id, username, signin_state, ignore_username_change)
	slot10 = user_index
	local old_user_data = self._get_user_data(slot8, self)
	local user_data = {
		user_index = user_index,
		platform_id = platform_id,
		storage_id = storage_id,
		username = username,
		signin_state = signin_state
	}
	Global.user_manager.user_map[user_index] = user_data

	return 
end
function GenericUserManager:set_user(user_index, platform_id, storage_id, username, signin_state, ignore_username_change)
	local old_user_data = self._get_user_data(slot8, self)
	local user_data = {
		user_index = user_index,
		platform_id = platform_id,
		storage_id = storage_id,
		username = username,
		signin_state = signin_state
	}
	Global.user_manager.user_map[user_index] = user_data
	slot14 = ignore_username_change

	self.check_user_state_change(user_index, self, old_user_data, user_data)

	return 
end
function GenericUserManager:check_user_state_change(old_user_data, user_data, ignore_username_change)
	local username = user_data and user_data.username
	local signin_state = (user_data and user_data.signin_state) or self.NOT_SIGNED_IN_STATE
	local old_signin_state = (old_user_data and old_user_data.signin_state) or self.NOT_SIGNED_IN_STATE
	local old_username = old_user_data and old_user_data.username
	local old_user_has_signed_out = old_user_data and old_user_data.has_signed_out
	local user_changed, active_user_changed = nil
	local was_signed_in = old_signin_state ~= self.NOT_SIGNED_IN_STATE
	local is_signed_in = signin_state ~= self.NOT_SIGNED_IN_STATE
	local user_index = (user_data and user_data.user_index) or (old_user_data and old_user_data.user_index)

	if was_signed_in ~= is_signed_in or (not ignore_username_change and old_username ~= username) or old_user_has_signed_out then
		slot16 = self

		if user_index == self.get_index(slot15) then
			active_user_changed = true
		end

		if Global.category_print.user_manager then
			if active_user_changed then
				slot17 = "[UserManager] Active user changed."

				cat_print(slot15, "user_manager")
			else
				slot17 = "[UserManager] User index changed."

				cat_print(slot15, "user_manager")
			end

			slot21 = old_user_data
			slot17 = "[UserManager] Old user: " .. self.get_user_data_string(slot19, self) .. "."

			cat_print(slot15, "user_manager")

			slot21 = user_data
			slot17 = "[UserManager] New user: " .. self.get_user_data_string(".", self) .. "."

			cat_print(slot15, "user_manager")
		end

		user_changed = true
	end

	if user_changed then
		if active_user_changed then
			slot18 = user_data

			self.active_user_change_state(slot15, self, old_user_data)
		end

		slot18 = user_data

		self._user_state_changed_callback_handler.dispatch(slot15, self._user_state_changed_callback_handler, old_user_data)
	end

	local storage_id = user_data and user_data.storage_id
	local old_storage_id = old_user_data and old_user_data.storage_id
	local ignore_storage_change = self.CAN_CHANGE_STORAGE_ONLY_ONCE and Global.user_manager.storage_changed

	if not ignore_storage_change then
	end

	return 
end
function GenericUserManager:active_user_change_state(old_user_data, user_data)
	slot5 = self

	if not self.get_active_user_state_change_quit(slot4) and is_x360 then
		slot5 = managers.savefile

		if managers.savefile.is_in_loading_sequence(slot4) then
			slot6 = self.get_active_user_state_change_quit(slot7)
			slot9 = managers.savefile

			print(slot4, "-- Cause loading", managers.savefile.is_in_loading_sequence(self))

			local dialog_data = {}
			slot7 = "dialog_signin_change_title"
			dialog_data.title = managers.localization.text("-- Cause loading", managers.localization)
			slot7 = "dialog_signin_change"
			dialog_data.text = managers.localization.text("-- Cause loading", managers.localization)
			dialog_data.id = "user_changed"
			local ok_button = {}
			slot8 = "dialog_ok"
			ok_button.text = managers.localization.text(managers.localization, managers.localization)
			dialog_data.button_list = {
				ok_button
			}
			slot8 = dialog_data

			managers.system_menu.add_init_show(managers.localization, managers.system_menu)

			slot7 = self

			self.perform_load_start_menu(managers.localization)
		end
	end

	slot7 = user_data

	self._active_user_state_changed_callback_handler.dispatch(slot4, self._active_user_state_changed_callback_handler, old_user_data)

	return 
end
function GenericUserManager:perform_load_start_menu()
	slot3 = managers.system_menu

	managers.system_menu.force_close_all(slot2)

	slot3 = managers.menu

	managers.menu.on_user_sign_out(slot2)

	if managers.groupai then
		slot3 = managers.groupai
		slot4 = false

		managers.groupai.state(slot2).set_AI_enabled(slot2, managers.groupai.state(slot2))
	end

	slot3 = _G.setup

	_G.setup.load_start_menu(slot2)

	slot4 = true

	_G.game_state_machine.set_boot_from_sign_out(slot2, _G.game_state_machine)

	slot4 = false

	self.set_active_user_state_change_quit(slot2, self)

	slot4 = nil

	self.set_index(slot2, self)

	return 
end
function GenericUserManager:storage_changed(old_user_data, user_data)
	slot5 = managers.savefile

	managers.savefile.storage_changed(slot4)

	slot7 = user_data

	self._storage_changed_callback_handler.dispatch(slot4, self._storage_changed_callback_handler, old_user_data)

	return 
end
function GenericUserManager:load_platform_setting_map(callback_func)
	if callback_func then
		slot4 = nil

		callback_func(slot3)
	end

	return 
end
function GenericUserManager:get_user_string(user_index)
	slot5 = user_index
	local user_data = self._get_user_data(slot3, self)
	slot6 = user_data

	return self.get_user_data_string(self, self)
end
function GenericUserManager:get_user_data_string(user_data)
	if user_data then
		local user_index = tostring(slot3)
		local signin_state = tostring(user_data.user_index)
		local username = tostring(user_data.signin_state)
		local platform_id = tostring(user_data.username)
		local storage_id = tostring(user_data.platform_id)
		slot14 = username

		return string.format(user_data.storage_id, "User index: %s, Platform id: %s, Storage id: %s, Signin state: %s, Username: %s", user_index, platform_id, storage_id, signin_state)
	else
		return "nil"
	end

	return 
end
function GenericUserManager:get_index()
	return Global.user_manager.user_index
end
function GenericUserManager:set_index(user_index)
	if Global.user_manager.user_index ~= user_index then
		local old_user_index = Global.user_manager.user_index
		slot9 = old_user_index
		slot11 = user_index
		slot6 = "[UserManager] Changed user index from " .. tostring(slot8) .. " to " .. tostring(slot10) .. "."

		cat_print(slot4, "user_manager")

		Global.user_manager.user_index = user_index

		if old_user_index then
			slot6 = old_user_index
			local old_user_data = self._get_user_data(slot4, self)
		end

		if not user_index and old_user_data and not is_xb1 then
			old_user_data.storage_id = nil
		end

		if not user_index and not is_xb1 then
			slot6 = Global.user_manager.user_map

			for _, data in pairs(slot5) do
				data.storage_id = nil
			end
		end

		slot7 = user_index
		local user_data = self._get_user_data(slot5, self)
		slot10 = false

		self.check_user_state_change(self, self, old_user_data, user_data)
	end

	return 
end
function GenericUserManager:get_active_user_state_change_quit()
	return Global.user_manager.active_user_state_change_quit
end
function GenericUserManager:set_active_user_state_change_quit(active_user_state_change_quit)
	if not Global.user_manager.active_user_state_change_quit ~= not active_user_state_change_quit then
		slot8 = not not active_user_state_change_quit
		slot5 = "[UserManager] User state change quits to title screen: " .. tostring(slot7)

		cat_print(slot3, "user_manager")

		Global.user_manager.active_user_state_change_quit = active_user_state_change_quit
	end

	return 
end
function GenericUserManager:get_platform_id(user_index)
	slot5 = user_index
	local user_data = self._get_user_data(slot3, self)

	return user_data and user_data.platform_id
end
function GenericUserManager:is_signed_in(user_index)
	slot5 = user_index
	local user_data = self._get_user_data(slot3, self)

	return user_data and user_data.signin_state ~= self.NOT_SIGNED_IN_STATE
end
function GenericUserManager:signed_in_state(user_index)
	slot5 = user_index
	local user_data = self._get_user_data(slot3, self)

	return user_data and user_data.signin_state
end
function GenericUserManager:get_storage_id(user_index)
	slot5 = user_index
	local user_data = self._get_user_data(slot3, self)

	return user_data and user_data.storage_id
end
function GenericUserManager:is_storage_selected(user_index)
	if self.CAN_SELECT_STORAGE then
		slot5 = user_index
		local user_data = self._get_user_data(slot3, self)

		return user_data and not not user_data.storage_id
	else
		return true
	end

	return 
end
function GenericUserManager:_get_user_data(user_index)
	if not user_index then
		slot4 = self
		local user_index = self.get_index(slot3)
	end

	return user_index and Global.user_manager.user_map[user_index]
end
function GenericUserManager:check_user(callback_func, show_select_user_question_dialog)
	return 
end
function GenericUserManager:_success_callback(callback_func)

	-- Decompilation error in this vicinity:
	if callback_func then
		slot4 = true

		callback_func(slot3)
	end

	return 
end
function GenericUserManager:_fail_callback(callback_func)
	if callback_func then
		slot4 = false

		callback_func(slot3)
	end

	return 
end
function GenericUserManager:confirm_select_user_callback(callback_func, success)
	self._active_check_user_callback_func = nil

	if success then
		slot6 = {
			count = 1,
			callback_func = callback(slot8, self, self, "select_user_callback")
		}
		slot12 = callback_func

		managers.system_menu.show_select_user(slot4, managers.system_menu)
	elseif callback_func then
		slot5 = false

		callback_func(slot4)
	end

	return 
end
function GenericUserManager:select_user_callback(callback_func)
	slot4 = self

	self.update_all_users(slot3)

	if callback_func then
		self._active_check_user_callback_func = nil
		slot7 = nil

		callback_func(self.is_signed_in(slot5, self))
	end

	return 
end
function GenericUserManager:check_storage(callback_func, auto_select)
	return 
end
function GenericUserManager:get_setting_map()
	slot3 = Global.user_manager.setting_map

	return CoreTable.deep_clone(slot2)
end
function GenericUserManager:set_setting_map(setting_map)

	-- Decompilation error in this vicinity:
	slot4 = setting_map

	for id, value in pairs(slot3) do
		local name = Global.user_manager.setting_data_id_to_name_map[id]
		slot12 = value

		self.set_setting(slot9, self, name)
	end

	return 
end
function GenericUserManager:save_setting_map(setting_map, callback_func)
	if callback_func then
		slot6 = "[UserManager] Setting map cannot be saved on this platform."

		Appliction.error(slot4, Appliction)

		slot5 = false

		callback_func(slot4)
	end

	return 
end
function GenericUserManager:save(data)
	slot4 = self
	local state = self.get_setting_map(slot3)
	data.UserManager = state

	if Global.DEBUG_MENU_ON then
		data.debug_post_effects_enabled = Global.debug_post_effects_enabled
	end

	return 
end
function GenericUserManager:load(data, cache_version)
	if cache_version == 0 then
		slot6 = data

		self.set_setting_map(slot4, self)
	else
		slot6 = data.UserManager

		self.set_setting_map(slot4, self)
	end

	slot6 = "PS3"

	if SystemInfo.platform(slot4) ~= Idstring(SystemInfo) then
		local NEWEST_THEME = "zombie"
		slot7 = "newest_theme"

		if self.get_setting(slot5, self) ~= NEWEST_THEME then
			slot8 = NEWEST_THEME

			self.set_setting(slot5, self, "newest_theme")

			slot8 = NEWEST_THEME

			self.set_setting(slot5, self, "menu_theme")
		end
	end

	if Global.DEBUG_MENU_ON then
		Global.debug_post_effects_enabled = data.debug_post_effects_enabled ~= false
	else
		Global.debug_post_effects_enabled = true
	end

	slot5 = self

	self._apply_loaded_user_settings(slot4)

	return 
end
function GenericUserManager:_apply_loaded_user_settings()
	slot4 = "option_music_volume"
	slot10 = "music_volume"
	slot9 = 100

	SoundDevice.set_rtpc(slot2, SoundDevice, math.clamp(slot6, self.get_setting(slot8, self), 0))

	slot4 = "option_sfx_volume"
	slot10 = "sfx_volume"
	slot9 = 100

	SoundDevice.set_rtpc(slot2, SoundDevice, math.clamp(slot6, self.get_setting(0, self), 0))

	slot4 = "option_vo_volume"
	slot10 = "voice_over_volume"
	slot9 = 100

	SoundDevice.set_rtpc(slot2, SoundDevice, math.clamp(slot6, self.get_setting(0, self), 0))

	slot4 = "option_master_volume"
	slot10 = "master_volume"
	slot9 = 100

	SoundDevice.set_rtpc(slot2, SoundDevice, math.clamp(slot6, self.get_setting(0, self), 0))

	return 
end

if not Xbox360UserManager then
	slot6 = GenericUserManager
	slot4 = class(slot5)
end

Xbox360UserManager = slot4
Xbox360UserManager.NOT_SIGNED_IN_STATE = "not_signed_in"
Xbox360UserManager.STORE_SETTINGS_ON_PROFILE = true
Xbox360UserManager.CAN_SELECT_USER = true
Xbox360UserManager.CAN_SELECT_STORAGE = true
Xbox360UserManager.CUSTOM_PROFILE_VARIABLE_COUNT = 3
Xbox360UserManager.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT = 999
Xbox360UserManager.CAN_CHANGE_STORAGE_ONLY_ONCE = false
slot7 = "X360"
slot7 = Idstring(slot6)
UserManager.PLATFORM_CLASS_MAP[Idstring(slot6).key(slot6)] = Xbox360UserManager
function Xbox360UserManager:init()
	slot2 = callback(slot3, self, self)
	self._platform_setting_conversion_func_map = {
		gamer_control_sensitivity = slot2
	}
	slot3 = self

	GenericUserManager.init(slot2)

	slot4 = "signin_changed"
	slot9 = "signin_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "profile_setting_changed"
	slot9 = "profile_setting_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "storage_devices_changed"
	slot9 = "storage_devices_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "disconnect"
	slot9 = "disconnect_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "connect"
	slot9 = "connect_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	self._setting_map_save_counter = 0

	return 
end
function Xbox360UserManager:disconnect_callback(reason)
	slot5 = reason
	slot9 = 0

	print(slot3, "  Xbox360UserManager:disconnect_callback", XboxLive.signin_state(slot7, XboxLive))

	if Global.game_settings.single_player then
		return 
	end

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
	elseif self._in_online_menu then
		slot4 = managers.menu

		managers.menu.xbox_disconnected(slot3)
	else
		slot4 = managers.network

		if managers.network.session(slot3) then
			slot4 = managers.network
			slot4 = managers.network.session(slot3)

			managers.network.session(slot3).xbox_disconnected(slot3)
		end
	end

	return 
end
function Xbox360UserManager:connect_callback()
	return 
end
function Xbox360UserManager:on_entered_online_menus()
	self._in_online_menu = true

	return 
end
function Xbox360UserManager:on_exit_online_menus()
	self._in_online_menu = false

	return 
end
function Xbox360UserManager:is_online_menu()
	return self._in_online_menu
end
function Xbox360UserManager:setup_setting_map()
	local platform_default_type_map = {
		invert_camera_y = "gamer_yaxis_inversion",
		camera_sensitivity = "gamer_control_sensitivity"
	}
	Global.user_manager.platform_setting_map = nil
	Global.user_manager.platform_default_type_map = platform_default_type_map
	slot4 = self

	GenericUserManager.setup_setting_map(nil)

	return 
end
function Xbox360UserManager:convert_gamer_control_sensitivity(value)
	if value == "low" then
		return 0.5
	elseif value == "medium" then
		return 1
	else
		return 1.5
	end

	return 
end
function Xbox360UserManager:get_default_setting(name)
	if Global.user_manager.platform_setting_map then
		local platform_default_type = Global.user_manager.platform_default_type_map[name]

		if platform_default_type then
			local platform_default = Global.user_manager.platform_setting_map[platform_default_type]
			local conversion_func = self._platform_setting_conversion_func_map[platform_default_type]

			if conversion_func then
				slot7 = platform_default

				return conversion_func(slot6)
			else
				return platform_default
			end
		end
	end

	slot5 = name

	return GenericUserManager.get_default_setting(slot3, self)
end
function Xbox360UserManager:active_user_change_state(old_user_data, user_data)
	Global.user_manager.platform_setting_map = nil
	slot5 = managers.savefile

	managers.savefile.active_user_changed(nil)

	slot7 = user_data

	GenericUserManager.active_user_change_state(nil, self, old_user_data)

	return 
end
function Xbox360UserManager:load_platform_setting_map(callback_func)
	slot5 = "[UserManager] Loading platform setting map."

	cat_print(slot3, "user_manager")

	slot8 = nil
	slot5 = self.get_platform_id(slot6, self)
	slot11 = callback_func

	XboxLive.read_profile_settings(slot3, XboxLive, callback(self, self, self, "_load_platform_setting_map_callback"))

	return 
end
function Xbox360UserManager:_load_platform_setting_map_callback(callback_func, platform_setting_map)
	slot9 = not not platform_setting_map
	slot6 = "[UserManager] Done loading platform setting map. Success: " .. tostring(slot8)

	cat_print(slot4, "user_manager")

	Global.user_manager.platform_setting_map = platform_setting_map
	slot5 = self

	self.reset_setting_map(slot4)

	if callback_func then
		slot5 = platform_setting_map

		callback_func(slot4)
	end

	return 
end
function Xbox360UserManager:save_platform_setting(setting_name, setting_value, callback_func)
	slot10 = setting_name
	slot12 = setting_value
	slot7 = "[UserManager] Saving platform setting \"" .. tostring(slot9) .. "\": " .. tostring(slot11)

	cat_print(slot5, "user_manager")

	slot10 = nil
	slot9 = setting_value
	slot15 = callback_func

	XboxLive.write_profile_setting(slot5, XboxLive, self.get_platform_id(tostring(slot9), self), setting_name, callback(slot11, self, self, "_save_platform_setting_callback"))

	return 
end
function Xbox360UserManager:_save_platform_setting_callback(callback_func, success)
	slot9 = "Dont get setting name in callback"
	slot11 = success
	slot6 = "[UserManager] Done saving platform setting \"" .. tostring(slot8) .. "\". Success: " .. tostring(slot10)

	cat_print(slot4, "user_manager")

	if callback_func then
		slot5 = success

		callback_func(slot4)
	end

	return 
end
function Xbox360UserManager:get_setting_map()
	local platform_setting_map = Global.user_manager.platform_setting_map
	local setting_map = nil

	if platform_setting_map then
		local packed_string_value = ""

		for i = 1, self.CUSTOM_PROFILE_VARIABLE_COUNT, 1 do
			local setting_name = "title_specific" .. i
			packed_string_value = packed_string_value .. (platform_setting_map[setting_name] or "")
		end

		slot7 = packed_string_value
		setting_map = Utility.unpack(slot5, Utility) or {}
	end

	return setting_map
end
function Xbox360UserManager:save_setting_map(callback_func)
	if 0 < self._setting_map_save_counter then
		slot5 = "[UserManager] Tried to set setting map again before it was done with previous set."

		Appliction.error(slot3, Appliction)

		if callback_func then
			slot4 = false

			callback_func(slot3)

			return 
		end
	end

	slot5 = Global.user_manager.setting_map
	local complete_setting_value = Utility.pack(slot3, Utility)
	local current_char = 1
	local char_count = #complete_setting_value
	local setting_count = 1
	local max_char_count = self.CUSTOM_PROFILE_VARIABLE_COUNT * self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT

	if max_char_count < char_count then
		slot10 = "[UserManager] Exceeded (" .. char_count .. ") maximum character count that can be stored in the profile (" .. max_char_count .. ")."

		Application.stack_dump_error(slot8, Application)

		slot9 = false

		callback_func(slot8)

		return 
	end

	self._setting_map_save_success = true

	repeat
		local setting_name = "title_specific" .. setting_count
		slot11 = char_count
		local end_char = math.min(slot9, (current_char + self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT) - 1)
		slot13 = end_char
		local setting_value = string.sub((current_char + self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT) - 1, complete_setting_value, current_char)
		slot13 = "[UserManager] Saving profile setting \"" .. setting_name .. "\" (" .. current_char .. " to " .. end_char .. " of " .. char_count .. " characters)."

		cat_print(complete_setting_value, "save_manager")

		Global.user_manager.platform_setting_map[setting_name] = setting_value
		self._setting_map_save_counter = self._setting_map_save_counter + 1
		slot14 = setting_value
		slot20 = callback_func

		self.save_platform_setting(complete_setting_value, self, setting_name, callback(current_char, self, self, "_save_setting_map_callback"))

		current_char = end_char + 1
		setting_count = setting_count + 1
	until char_count <= current_char

	return 
end
function Xbox360UserManager:_save_setting_map_callback(callback_func, success)
	self._setting_map_save_success = self._setting_map_save_success and success
	self._setting_map_save_counter = self._setting_map_save_counter - 1

	if callback_func and self._setting_map_save_counter == 0 then
		slot5 = self._setting_map_save_success

		callback_func(slot4)
	end

	return 
end
function Xbox360UserManager:signin_changed_callback(...)
	slot3 = {
		...
	}

	for user_index, signed_in in ipairs(slot2) do
		slot9 = user_index
		local was_signed_in = self.is_signed_in(slot7, self)
		Global.user_manager.user_map[user_index].has_signed_out = was_signed_in and not signed_in

		if Global.user_manager.user_index == user_index and not was_signed_in and signed_in and self._active_check_user_callback_func then
			slot9 = "RUN ACTIVE USER CALLBACK FUNC"

			print(slot8)

			slot10 = "show_select_user_question_dialog"

			managers.system_menu.close(slot8, managers.system_menu)

			slot9 = true

			self._active_check_user_callback_func(slot8)

			self._active_check_user_callback_func = nil
		end

		if not signed_in ~= not was_signed_in then
			slot11 = false

			self.update_user(slot8, self, user_index)
		else
			local platform_id = user_index - 1
			slot11 = platform_id
			local signin_state = XboxLive.signin_state(slot9, XboxLive)
			local old_signin_state = Global.user_manager.user_map[user_index].signin_state

			if old_signin_state ~= signin_state then
				Global.user_manager.user_map[user_index].signin_state = signin_state
			end
		end
	end

	return 
end
function Xbox360UserManager:profile_setting_changed_callback(...)
	return 
end
function Xbox360UserManager:update_all_users()
	for user_index = 1, 4, 1 do
		slot9 = false

		self.update_user(slot6, self, user_index)
	end

	return 
end
function Xbox360UserManager:update_user(user_index, ignore_username_change)
	local platform_id = user_index - 1
	slot7 = platform_id
	local signin_state = XboxLive.signin_state(slot5, XboxLive)
	local is_signed_in = signin_state ~= self.NOT_SIGNED_IN_STATE
	local storage_id, username = nil

	if is_signed_in then
		slot11 = platform_id
		username = XboxLive.name(slot9, XboxLive)
		slot11 = platform_id
		storage_id = Application.current_storage_device_id(slot9, Application)

		if storage_id == 0 then
			storage_id = nil
		end
	end

	slot16 = ignore_username_change

	self.set_user(slot9, self, user_index, platform_id, storage_id, username, signin_state)

	return 
end
function Xbox360UserManager:storage_devices_changed_callback()
	slot3 = self

	self.update_all_users(slot2)

	return 
end
function Xbox360UserManager:check_privilege(user_index, privilege, callback_func)
	slot7 = user_index
	local platform_id = self.get_platform_id(slot5, self)
	slot9 = privilege
	local result = XboxLive.check_privilege(self, XboxLive, platform_id)

	if callback_func then
		slot8 = result

		func(slot7)
	end

	return result
end
function Xbox360UserManager:get_xuid(user_index)
	slot5 = user_index
	local platform_id = self.get_platform_id(slot3, self)
	slot6 = platform_id

	return XboxLive.xuid(self, XboxLive)
end
function Xbox360UserManager:invite_accepted_by_inactive_user()
	slot4 = "Idle"

	managers.platform.set_rich_presence(slot2, managers.platform)

	slot3 = self

	self.perform_load_start_menu(slot2)

	slot3 = managers.menu

	managers.menu.reset_all_loaded_data(slot2)

	return 
end

if not PS3UserManager then
	slot6 = GenericUserManager
	slot4 = class(slot5)
end

PS3UserManager = slot4
slot7 = "PS3"
slot7 = Idstring(slot6)
UserManager.PLATFORM_CLASS_MAP[Idstring(slot6).key(slot6)] = PS3UserManager
function PS3UserManager:init()
	slot3 = self
	self._init_finalize_index = not self.is_global_initialized(slot2)
	slot3 = self

	GenericUserManager.init(slot2)

	return 
end
function PS3UserManager:init_finalize()
	slot3 = self

	GenericUserManager.init_finalize(slot2)

	if self._init_finalize_index then
		slot9 = false

		self.set_user(slot2, self, 1, nil, true, nil, true)

		self._init_finalize_index = nil
	end

	return 
end
function PS3UserManager:set_index(user_index)
	if user_index then
		slot10 = false

		self.set_user_soft(slot3, self, user_index, nil, true, nil, true)
	end

	slot5 = user_index

	GenericUserManager.set_index(slot3, self)

	return 
end

if not PS4UserManager then
	slot6 = GenericUserManager
	slot4 = class(slot5)
end

PS4UserManager = slot4
slot7 = "PS4"
slot7 = Idstring(slot6)
UserManager.PLATFORM_CLASS_MAP[Idstring(slot6).key(slot6)] = PS4UserManager
function PS4UserManager:init()
	slot3 = self
	self._init_finalize_index = not self.is_global_initialized(slot2)
	slot3 = self

	GenericUserManager.init(slot2)

	slot4 = "disconnect"
	slot9 = "disconnect_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))

	return 
end
function PS4UserManager:disconnect_callback()
	if Global.game_settings.single_player then
		return 
	end

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
	else
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot3 = managers.network
			slot3 = managers.network.session(slot2)

			managers.network.session(slot2).psn_disconnected(slot2)
		end
	end

	return 
end
function PS4UserManager:init_finalize()
	slot3 = self

	GenericUserManager.init_finalize(slot2)

	if self._init_finalize_index then
		slot9 = false

		self.set_user(slot2, self, 1, nil, true, nil, true)

		self._init_finalize_index = nil
	end

	return 
end
function PS4UserManager:set_index(user_index)
	if user_index then
		slot10 = false

		self.set_user_soft(slot3, self, user_index, nil, true, nil, true)
	end

	slot5 = user_index

	GenericUserManager.set_index(slot3, self)

	return 
end

if not WinUserManager then
	slot6 = GenericUserManager
	slot4 = class(slot5)
end

WinUserManager = slot4
slot7 = "WIN32"
slot7 = Idstring(slot6)
UserManager.PLATFORM_CLASS_MAP[Idstring(slot6).key(slot6)] = WinUserManager
function WinUserManager:init()
	slot3 = self
	self._init_finalize_index = not self.is_global_initialized(slot2)
	slot3 = self

	GenericUserManager.init(slot2)

	return 
end
function WinUserManager:init_finalize()
	slot3 = self

	GenericUserManager.init_finalize(slot2)

	if self._init_finalize_index then
		slot3 = Application

		if Application.editor(slot2) then
			slot4 = 1

			self.set_index(slot2, self)
		else
			slot9 = false

			self.set_user(slot2, self, 1, nil, true, nil, true)
		end

		self._init_finalize_index = nil
	end

	return 
end
function WinUserManager:set_index(user_index)
	if user_index then
		slot10 = false

		self.set_user_soft(slot3, self, user_index, nil, true, nil, true)
	end

	slot5 = user_index

	GenericUserManager.set_index(slot3, self)

	return 
end

if not XB1UserManager then
	slot6 = GenericUserManager
	slot4 = class(slot5)
end

XB1UserManager = slot4
XB1UserManager.NOT_SIGNED_IN_STATE = "not_signed_in"
XB1UserManager.STORE_SETTINGS_ON_PROFILE = false
XB1UserManager.CAN_SELECT_USER = true
XB1UserManager.CAN_SELECT_STORAGE = true
XB1UserManager.CUSTOM_PROFILE_VARIABLE_COUNT = 3
XB1UserManager.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT = 999
XB1UserManager.CAN_CHANGE_STORAGE_ONLY_ONCE = false
slot7 = "XB1"
slot7 = Idstring(slot6)
UserManager.PLATFORM_CLASS_MAP[Idstring(slot6).key(slot6)] = XB1UserManager
function XB1UserManager:init()
	slot2 = callback(slot3, self, self)
	self._platform_setting_conversion_func_map = {
		gamer_control_sensitivity = slot2
	}
	slot3 = self

	GenericUserManager.init(slot2)

	slot4 = "signin_changed"
	slot9 = "signin_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "profile_setting_changed"
	slot9 = "profile_setting_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "storage_devices_changed"
	slot9 = "storage_devices_changed_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "disconnect"
	slot9 = "disconnect_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	slot4 = "connect"
	slot9 = "connect_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback("convert_gamer_control_sensitivity", self, self))

	self._setting_map_save_counter = 0

	return 
end
function XB1UserManager:update(t, dt)
	slot7 = dt

	XB1UserManager.super.update(slot4, self, t)

	if not self._disconnected and not self._in_online_menu and not Global.game_settings.single_player then
		slot6 = "setup"
	elseif self._privilege_check_enabled then
		self._privilege_check_enabled = nil
		self._next_privilege_check_time = nil
		self._privilege_check_fail_count = nil
	end

	return 
end
function XB1UserManager:_check_privilege_callback(is_success)
	if not self._privilege_check_enabled then
		return 
	end

	self._privilege_check_enabled = false

	if not is_success and not self._in_online_menu and not Global.game_settings.single_player then
		slot5 = "setup"
	else
		self._privilege_check_fail_count = nil
	end

	return 
end
function XB1UserManager:disconnect_callback(reason)
	slot5 = reason
	slot9 = 0

	print(slot3, "  XB1UserManager:disconnect_callback", XboxLive.signin_state(slot7, XboxLive))

	if Global.game_settings.single_player then
		return 
	end

	self._disconnected = true
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
	elseif self._in_online_menu then
		slot4 = managers.menu

		managers.menu.xbox_disconnected(slot3)
	else
		slot4 = managers.network

		if managers.network.session(slot3) then
			slot4 = managers.network
			slot4 = managers.network.session(slot3)

			managers.network.session(slot3).xbox_disconnected(slot3)
		end
	end

	return 
end
function XB1UserManager:connect_callback()
	return 
end
function XB1UserManager:on_entered_online_menus()
	self._disconnected = nil
	self._in_online_menu = true

	return 
end
function XB1UserManager:on_exit_online_menus()
	self._in_online_menu = false

	return 
end
function XB1UserManager:is_online_menu()
	return self._in_online_menu
end
function XB1UserManager:convert_gamer_control_sensitivity(value)
	if value == "low" then
		return 0.5
	elseif value == "medium" then
		return 1
	else
		return 1.5
	end

	return 
end
function XB1UserManager:active_user_change_state(old_user_data, user_data)
	Global.user_manager.platform_setting_map = nil
	slot5 = managers.savefile

	managers.savefile.active_user_changed(nil)

	slot7 = user_data

	GenericUserManager.active_user_change_state(nil, self, old_user_data)

	return 
end
function XB1UserManager:load_platform_setting_map(callback_func)
	slot5 = "[UserManager] Loading platform setting map."

	cat_print(slot3, "user_manager")

	slot8 = nil
	slot5 = self.get_platform_id(slot6, self)
	slot11 = callback_func

	XboxLive.read_profile_settings(slot3, XboxLive, callback(self, self, self, "_load_platform_setting_map_callback"))

	return 
end
function XB1UserManager:_load_platform_setting_map_callback(callback_func, platform_setting_map)
	slot9 = not not platform_setting_map
	slot6 = "[UserManager] Done loading platform setting map. Success: " .. tostring(slot8)

	cat_print(slot4, "user_manager")

	Global.user_manager.platform_setting_map = platform_setting_map
	slot5 = self

	self.reset_setting_map(slot4)

	if callback_func then
		slot5 = platform_setting_map

		callback_func(slot4)
	end

	return 
end
function XB1UserManager:save_platform_setting(setting_name, setting_value, callback_func)
	slot10 = setting_name
	slot12 = setting_value
	slot7 = "[UserManager] Saving platform setting \"" .. tostring(slot9) .. "\": " .. tostring(slot11)

	cat_print(slot5, "user_manager")

	slot10 = nil
	slot9 = setting_value
	slot15 = callback_func

	XboxLive.write_profile_setting(slot5, XboxLive, self.get_platform_id(tostring(slot9), self), setting_name, callback(slot11, self, self, "_save_platform_setting_callback"))

	return 
end
function XB1UserManager:_save_platform_setting_callback(callback_func, success)
	slot9 = "Dont get setting name in callback"
	slot11 = success
	slot6 = "[UserManager] Done saving platform setting \"" .. tostring(slot8) .. "\". Success: " .. tostring(slot10)

	cat_print(slot4, "user_manager")

	if callback_func then
		slot5 = success

		callback_func(slot4)
	end

	return 
end
function XB1UserManager:save_setting_map(callback_func)
	if 0 < self._setting_map_save_counter then
		slot5 = "[UserManager] Tried to set setting map again before it was done with previous set."

		Appliction.error(slot3, Appliction)

		if callback_func then
			slot4 = false

			callback_func(slot3)

			return 
		end
	end

	slot5 = Global.user_manager.setting_map
	local complete_setting_value = Utility.pack(slot3, Utility)
	local current_char = 1
	local char_count = #complete_setting_value
	local setting_count = 1
	local max_char_count = self.CUSTOM_PROFILE_VARIABLE_COUNT * self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT

	if max_char_count < char_count then
		slot10 = "[UserManager] Exceeded (" .. char_count .. ") maximum character count that can be stored in the profile (" .. max_char_count .. ")."

		Application.stack_dump_error(slot8, Application)

		slot9 = false

		callback_func(slot8)

		return 
	end

	self._setting_map_save_success = true

	repeat
		local setting_name = "title_specific" .. setting_count
		slot11 = char_count
		local end_char = math.min(slot9, (current_char + self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT) - 1)
		slot13 = end_char
		local setting_value = string.sub((current_char + self.CUSTOM_PROFILE_VARIABLE_CHAR_COUNT) - 1, complete_setting_value, current_char)
		slot13 = "[UserManager] Saving profile setting \"" .. setting_name .. "\" (" .. current_char .. " to " .. end_char .. " of " .. char_count .. " characters)."

		cat_print(complete_setting_value, "save_manager")

		Global.user_manager.platform_setting_map[setting_name] = setting_value
		self._setting_map_save_counter = self._setting_map_save_counter + 1
		slot14 = setting_value
		slot20 = callback_func

		self.save_platform_setting(complete_setting_value, self, setting_name, callback(current_char, self, self, "_save_setting_map_callback"))

		current_char = end_char + 1
		setting_count = setting_count + 1
	until char_count <= current_char

	return 
end
function XB1UserManager:_save_setting_map_callback(callback_func, success)
	self._setting_map_save_success = self._setting_map_save_success and success
	self._setting_map_save_counter = self._setting_map_save_counter - 1

	if callback_func and self._setting_map_save_counter == 0 then
		slot5 = self._setting_map_save_success

		callback_func(slot4)
	end

	return 
end
function XB1UserManager:signin_changed_callback(...)
	slot3 = {
		...
	}

	for user_index, signed_in in ipairs(slot2) do
		slot9 = user_index
		local was_signed_in = self.is_signed_in(slot7, self)
		Global.user_manager.user_map[user_index].has_signed_out = was_signed_in and not signed_in

		if Global.user_manager.user_index == user_index and not was_signed_in and signed_in and self._active_check_user_callback_func then
			slot9 = "RUN ACTIVE USER CALLBACK FUNC"

			print(slot8)

			slot10 = "show_select_user_question_dialog"

			managers.system_menu.close(slot8, managers.system_menu)

			slot9 = true

			self._active_check_user_callback_func(slot8)

			self._active_check_user_callback_func = nil
		end

		if not signed_in ~= not was_signed_in then
			slot11 = false

			self.update_user(slot8, self, user_index)
		else
			local platform_id = user_index - 1
			slot11 = platform_id
			local signin_state = XboxLive.signin_state(slot9, XboxLive)
			local old_signin_state = Global.user_manager.user_map[user_index].signin_state

			if old_signin_state ~= signin_state then
				Global.user_manager.user_map[user_index].signin_state = signin_state
			end
		end
	end

	return 
end
function XB1UserManager:profile_setting_changed_callback(...)
	return 
end
function XB1UserManager:update_all_users()
	for user_index = 1, 4, 1 do
		slot9 = false

		self.update_user(slot6, self, user_index)
	end

	return 
end
function XB1UserManager:update_user(user_index, ignore_username_change)
	local platform_id = user_index - 1
	slot7 = platform_id
	local signin_state = XboxLive.signin_state(slot5, XboxLive)
	local is_signed_in = signin_state ~= self.NOT_SIGNED_IN_STATE
	local storage_id, username = nil

	if is_signed_in then
		slot11 = platform_id
		username = XboxLive.name(slot9, XboxLive)
		slot11 = platform_id
		storage_id = Application.current_storage_device_id(slot9, Application)

		if storage_id == 0 then
			storage_id = nil
		end
	end

	slot16 = ignore_username_change

	self.set_user(slot9, self, user_index, platform_id, storage_id, username, signin_state)

	return 
end
function XB1UserManager:storage_devices_changed_callback()
	slot3 = self

	self.update_all_users(slot2)

	return 
end
function XB1UserManager:check_privilege(user_index, privilege, callback_func)
	slot7 = user_index
	local platform_id = self.get_platform_id(slot5, self)
	slot10 = callback_func

	return XboxLive.check_privilege(self, XboxLive, platform_id, privilege)
end
function XB1UserManager:get_xuid(user_index)
	slot5 = user_index
	local platform_id = self.get_platform_id(slot3, self)
	slot6 = platform_id

	return XboxLive.xuid(self, XboxLive)
end
function XB1UserManager:invite_accepted_by_inactive_user()
	return 
end

return 
