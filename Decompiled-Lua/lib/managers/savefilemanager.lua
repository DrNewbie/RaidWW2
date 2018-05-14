-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEvent"

core.import(slot1, core)

SavefileManager = SavefileManager or class()
SavefileManager.SETTING_SLOT = 0
SavefileManager.AUTO_SAVE_SLOT = 1
slot4 = "WIN32"
SavefileManager.PROGRESS_SLOT = (SystemInfo.platform(slot2) == Idstring(SystemInfo) and 11) or 11
slot4 = "WIN32"
SavefileManager.BACKUP_SLOT = (SystemInfo.platform(slot2) == Idstring(SystemInfo) and 31) or 31
SavefileManager.MIN_SLOT = 0
slot4 = "WIN32"
SavefileManager.MAX_SLOT = (SystemInfo.platform(slot2) == Idstring(SystemInfo) and 15) or 15
SavefileManager.MAX_PROFILE_SAVE_INTERVAL = 300
slot3 = "X360"

if SystemInfo.platform(300) == Idstring(SystemInfo) then
	SavefileManager.TASK_MIN_DURATION = 3
end

SavefileManager.IDLE_TASK_TYPE = 1
SavefileManager.LOAD_TASK_TYPE = 2
SavefileManager.SAVE_TASK_TYPE = 3
SavefileManager.REMOVE_TASK_TYPE = 4
SavefileManager.CHECK_SPACE_REQUIRED_TASK_TYPE = 5
SavefileManager.ENUMERATE_SLOTS_TASK_TYPE = 6
SavefileManager.DEBUG_TASK_TYPE_NAME_LIST = {
	"Idle",
	"Loading",
	"Saving",
	"Removing",
	"CheckSpaceRequired"
}
SavefileManager.RESERVED_BYTES = 204800
SavefileManager.VERSION = 5
slot3 = "PS3"

if SystemInfo.platform(5) == Idstring(SystemInfo) then
	SavefileManager.VERSION_NAME = "1.03"
	SavefileManager.LOWEST_COMPATIBLE_VERSION = "1.02"
else
	slot3 = "PS4"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		SavefileManager.VERSION_NAME = "01.00"
		SavefileManager.LOWEST_COMPATIBLE_VERSION = "01.00"
	else
		slot3 = "XB1"

		if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
			SavefileManager.VERSION_NAME = "1.0.0.0"
			SavefileManager.LOWEST_COMPATIBLE_VERSION = "1.0.0.0"
		else
			SavefileManager.VERSION_NAME = "1.8"
			SavefileManager.LOWEST_COMPATIBLE_VERSION = "1.7"
		end
	end
end

SavefileManager.SAVE_SYSTEM = "steam_cloud"
SavefileManager._USER_ID_OVERRRIDE = nil
SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT = 5
SavefileManager.CHARACTER_PROFILE_STARTING_SLOT = 11
SavefileManager.init = function (self)
	slot3 = CoreEvent.CallbackEventHandler
	self._active_changed_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._save_begin_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._save_done_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._load_begin_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._load_done_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	slot3 = CoreEvent.CallbackEventHandler
	self._load_sequence_done_callback_handler = CoreEvent.CallbackEventHandler.new(slot2)
	self._current_task_type = self.IDLE_TASK_TYPE

	if not Global.savefile_manager then
		Global.savefile_manager = {
			meta_data_list = {}
		}
	end

	slot3 = managers.gui_data
	self._workspace = managers.gui_data.create_saferect_workspace(slot2)
	slot4 = self._workspace
	self._save_icon = HUDSaveIcon.new(slot2, HUDSaveIcon)
	slot3 = self._workspace

	self._workspace.hide(slot2)

	slot3 = managers.viewport
	slot8 = "resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot2, callback(slot5, self, self))
	self._queued_tasks = {}
	self._savegame_hdd_space_required = false
	self._save_slots_to_load = {}
	slot4 = self.MAX_SLOT - self.MIN_SLOT + 1

	SaveGameManager.set_max_nr_slots(slot2, SaveGameManager)

	return 
end
SavefileManager.set_save_progress_slot = function (self, slot_index)
	Global.savefile_manager.save_progress_slot = slot_index

	return 
end
SavefileManager.get_save_progress_slot = function (self)
	return Global.savefile_manager.save_progress_slot or SavefileManager.PROGRESS_SLOT
end
SavefileManager.set_create_character_slot = function (self, slot_index)
	Global.savefile_manager.create_character_slot = slot_index

	return 
end
SavefileManager.get_create_character_slot = function (self)
	return Global.savefile_manager.create_character_slot or SavefileManager.PROGRESS_SLOT
end
SavefileManager.resolution_changed = function (self)
	slot4 = self._workspace

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	return 
end
SavefileManager.destroy = function (self)
	if self._workspace then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		self._workspace = nil
	end

	return 
end
SavefileManager.active_user_changed = function (self)
	if managers.user.STORE_SETTINGS_ON_PROFILE then
		slot4 = true

		self._clean_meta_data_list(slot2, self)

		slot4 = nil
		local is_signed_in = managers.user.is_signed_in(slot2, managers.user)

		if is_signed_in then
			slot4 = self

			self.load_settings(slot3)
		end
	end

	return 
end
SavefileManager.storage_changed = function (self)
	slot4 = nil
	local storage_device_selected = managers.user.is_storage_selected(slot2, managers.user)

	if not managers.user.STORE_SETTINGS_ON_PROFILE then
		slot5 = true

		self._clean_meta_data_list(slot3, self)
	end

	slot5 = false

	self._clean_meta_data_list(slot3, self)

	if storage_device_selected then
		self._loading_sequence = true
		self._save_slots_to_load = {
			all = true
		}
		local task_data = {
			queued_in_save_manager = true,
			task_type = self.ENUMERATE_SLOTS_TASK_TYPE
		}
		slot5 = managers.user
		task_data.user_index = managers.user.get_platform_id(slot4)
		task_data.first_slot = self.MIN_SLOT
		task_data.last_slot = self.MAX_SLOT
		slot6 = "WIN32"

		if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
			task_data.save_system = self.SAVE_SYSTEM
		end

		slot6 = task_data

		self._on_task_queued(slot4, self)

		slot6 = task_data
		slot11 = "clbk_result_iterate_savegame_slots"

		SaveGameManager.iterate_savegame_slots(slot4, SaveGameManager, callback(slot8, self, self))
	else
		slot11 = nil
		slot10 = storage_device_selected
		slot5 = "[SavefileManager:storage_changed] Unable to load meta data. Signed in: " .. tostring(managers.user.is_signed_in(slot9, managers.user)) .. ", Storage device selected: " .. tostring(slot9)

		Application.error(slot3, Application)
	end

	return 
end
SavefileManager.check_space_required = function (self)
	local task_data = {
		queued_in_save_manager = true,
		task_type = self.CHECK_SPACE_REQUIRED_TASK_TYPE
	}
	slot4 = managers.user
	task_data.user_index = managers.user.get_platform_id(slot3)
	task_data.first_slot = self.MIN_SLOT
	task_data.last_slot = self.MAX_SLOT
	slot5 = task_data

	self._on_task_queued(slot3, self)

	slot5 = task_data
	slot10 = "clbk_result_space_required"

	SaveGameManager.iterate_savegame_slots(slot3, SaveGameManager, callback(slot7, self, self))

	return 
end
SavefileManager.clear_progress_data = function (self)
	slot4 = 11

	self._remove(slot2, self)

	slot4 = 12

	self._remove(slot2, self)

	slot4 = 13

	self._remove(slot2, self)

	slot4 = 14

	self._remove(slot2, self)

	slot4 = 15

	self._remove(slot2, self)

	slot3 = managers.weapon_inventory

	managers.weapon_inventory.setup(slot2)

	slot3 = managers.blackmarket

	managers.blackmarket.reset_equipped(slot2)

	slot3 = managers.character_customization

	managers.character_customization.reset(slot2)

	slot3 = managers.raid_job

	managers.raid_job.reset(slot2)

	slot4 = false

	managers.raid_job.set_tutorial_played_flag(slot2, managers.raid_job)

	slot3 = managers.statistics

	managers.statistics.reset(slot2)

	slot3 = managers.challenge

	managers.challenge.reset(slot2)

	slot4 = true

	managers.weapon_skills._setup(slot2, managers.weapon_skills)

	slot3 = managers.consumable_missions

	managers.consumable_missions.reset(slot2)

	slot3 = managers.gold_economy

	managers.gold_economy.reset(slot2)

	slot3 = managers.breadcrumb

	managers.breadcrumb.reset(slot2)

	slot3 = managers.progression

	managers.progression.reset(slot2)

	slot3 = managers.greed

	managers.greed.reset(slot2)

	slot3 = managers.event_system

	managers.event_system.reset(slot2)

	slot3 = managers.unlock

	managers.unlock.reset(slot2)

	slot4 = false

	self._clean_meta_data_list(slot2, self)

	slot5 = false

	self.save_game(slot2, self, SavefileManager.SETTING_SLOT)

	return 
end
SavefileManager.setting_changed = function (self)
	slot4 = true

	self._set_setting_changed(slot2, self)

	return 
end
SavefileManager.save_game = function (self, slot, cache_only)
	slot7 = cache_only

	self._save(slot4, self, slot)

	return 
end
SavefileManager.save_setting = function (self, is_user_initiated_action)
	slot5 = is_user_initiated_action

	if self._is_saving_setting_allowed(slot3, self) then
		slot6 = false

		self._save(slot3, self, self.SETTING_SLOT)
	end

	return 
end
SavefileManager.save_progress = function (self, save_system)
	slot4 = self

	if self._is_saving_progress_allowed(slot3) then
		local progress_slot = self.get_save_progress_slot(slot3)
		slot8 = save_system

		self._save(self, self, progress_slot, nil)

		slot7 = "WIN32"
		Global.savefile_manager.backup_save_enabled = SystemInfo.platform(self) == Idstring(SystemInfo)
	end

	return 
end
SavefileManager.load_progress = function (self, save_system)
	local progress_slot = self.get_save_progress_slot(slot3)
	slot8 = save_system

	self._load(self, self, progress_slot, nil)

	return 
end
SavefileManager.load_game = function (self, slot, cache_only)
	slot7 = cache_only

	self._load(slot4, self, slot)

	return 
end
SavefileManager.load_settings = function (self)
	slot4 = self.SETTING_SLOT

	self._load(slot2, self)

	return 
end
SavefileManager.current_game_cache_slot = function (self)
	return Global.savefile_manager.current_game_cache_slot
end
SavefileManager.update = function (self, t, dt)
	slot5 = self

	self.update_gui_visibility(slot4)

	if self._loading_sequence then
		slot5 = self._save_slots_to_load

		if not next(slot4) then
			slot5 = self

			if not self._is_loading(slot4) then
				managers.savefile._loading_sequence = true
				self._initial_load_done = true
				slot5 = self

				self._on_load_sequence_complete(true)
			end
		end
	end

	return 
end
SavefileManager._is_loading = function (self)
	slot3 = self._queued_tasks

	for i, task_data in ipairs(slot2) do
		if task_data.task_type == self.LOAD_TASK_TYPE or task_data.task_type == self.ENUMERATE_SLOTS_TASK_TYPE then
			return true
		end
	end

	return 
end
SavefileManager._on_load_sequence_complete = function (self)
	slot4 = "[SavefileManager:_on_load_sequence_complete]"
	slot7 = Application

	cat_print(slot2, "savefile_manager", Application.time(slot6))

	self._loading_sequence = nil
	slot3 = self._load_sequence_done_callback_handler

	self._load_sequence_done_callback_handler.dispatch(slot2)

	return 
end
SavefileManager.is_in_loading_sequence = function (self)
	return self._loading_sequence
end
SavefileManager.break_loading_sequence = function (self)
	slot4 = "SavefileManager:break_loading_sequence()"

	cat_print(slot2, "savefile_manager")

	self._try_again = nil
	self._loading_sequence = nil
	self._save_slots_to_load = {}
	slot3 = self._queued_tasks

	for i, task_data in ipairs(slot2) do
		slot9 = task_data

		SaveGameManager.abort(slot7, SaveGameManager)
	end

	self._queued_tasks = {}
	slot4 = "savefile_try_again"

	managers.system_menu.close(slot2, managers.system_menu)

	slot4 = "savefile_new_safefile"

	managers.system_menu.close(slot2, managers.system_menu)

	return 
end
SavefileManager.paused_update = function (self, t, dt)
	slot5 = self

	self.update_gui_visibility(slot4)

	return 
end
SavefileManager.update_current_task_type = function (self)
	local current_task_data = self._queued_tasks[1]
	slot5 = (current_task_data and current_task_data.task_type) or self.IDLE_TASK_TYPE

	self._set_current_task_type(slot3, self)

	return 
end
SavefileManager.update_gui_visibility = function (self)
	if self._hide_gui_time then
		slot3 = TimerManager
		slot3 = TimerManager.wall(slot2)

		if self._hide_gui_time <= TimerManager.wall(slot2).time(slot2) then
			self._hide_gui_time = nil
			slot3 = self._save_icon

			self._save_icon.hide(slot2)
		end
	end

	return 
end
SavefileManager.debug_get_task_name = function (self, task_type)
	return self.DEBUG_TASK_TYPE_NAME_LIST[task_type] or "Invalid"
end
SavefileManager.is_active = function (self)
	slot3 = self._queued_tasks

	return (next(slot2) and true) or false
end
SavefileManager.get_save_info_list = function (self, include_empty_slot)
	local data_list = {}
	local save_info_list = {}
	slot6 = Global.savefile_manager.meta_data_list

	for slot, meta_data in pairs(slot5) do
		if meta_data.is_synched_text and (not include_empty_slot or slot ~= self.AUTO_SAVE_SLOT) and slot ~= self.SETTING_SLOT then
			slot11 = self

			if slot ~= self.get_save_progress_slot(slot10) then
				slot12 = {
					slot = slot,
					text = meta_data.text,
					sort_list = meta_data.sort_list
				}

				table.insert(slot10, data_list)
			end
		end
	end

	local function sort_func(data1, data2)
		slot6 = data2.sort_list

		return self._compare_sort_list(slot3, self, data1.sort_list) < 0
	end

	slot8 = sort_func

	table.sort(slot6, data_list)

	slot7 = data_list

	for _, data in ipairs(slot6) do
		slot12 = save_info_list
		slot17 = data.text

		table.insert(slot11, SavefileInfo.new(slot14, SavefileInfo, data.slot))
	end

	if include_empty_slot then
		for empty_slot = 0, self.MAX_SLOT, 1 do
			local meta_data = Global.savefile_manager.meta_data_list[empty_slot]

			if empty_slot ~= self.SETTING_SLOT then
				slot12 = self

				if empty_slot ~= self.get_save_progress_slot(slot11) and empty_slot ~= self.AUTO_SAVE_SLOT and (not meta_data or not meta_data.is_synched_text) then
					slot13 = empty_slot
					slot17 = "savefile_empty"
					local save_info = SavefileInfo.new(slot11, SavefileInfo, managers.localization.text(slot15, managers.localization))
					slot15 = save_info

					table.insert(SavefileInfo, save_info_list, 1)

					break
				end
			end
		end
	end

	return save_info_list
end
SavefileManager.add_active_changed_callback = function (self, callback_func)
	slot5 = callback_func

	self._active_changed_callback_handler.add(slot3, self._active_changed_callback_handler)

	return 
end
SavefileManager.remove_active_changed_callback = function (self, callback_func)
	slot5 = callback_func

	self._active_changed_callback_handler.remove(slot3, self._active_changed_callback_handler)

	return 
end
SavefileManager.add_save_begin_callback = function (self, callback_func)
	slot5 = callback_func

	self._save_begin_callback_handler.add(slot3, self._save_begin_callback_handler)

	return 
end
SavefileManager.remove_save_begin_callback = function (self, callback_func)
	slot5 = callback_func

	self._save_begin_callback_handler.remove(slot3, self._save_begin_callback_handler)

	return 
end
SavefileManager.add_save_done_callback = function (self, callback_func)
	slot5 = callback_func

	self._save_done_callback_handler.add(slot3, self._save_done_callback_handler)

	return 
end
SavefileManager.remove_save_done_callback = function (self, callback_func)
	slot5 = callback_func

	self._save_done_callback_handler.remove(slot3, self._save_done_callback_handler)

	return 
end
SavefileManager.add_load_begin_callback = function (self, callback_func)
	slot5 = callback_func

	self._load_begin_callback_handler.add(slot3, self._load_begin_callback_handler)

	return 
end
SavefileManager.remove_load_begin_callback = function (self, callback_func)
	slot5 = callback_func

	self._load_begin_callback_handler.remove(slot3, self._load_begin_callback_handler)

	return 
end
SavefileManager.add_load_done_callback = function (self, callback_func)
	slot5 = callback_func

	self._load_done_callback_handler.add(slot3, self._load_done_callback_handler)

	return 
end
SavefileManager.remove_load_done_callback = function (self, callback_func)
	slot5 = callback_func

	self._load_done_callback_handler.remove(slot3, self._load_done_callback_handler)

	return 
end
SavefileManager.add_load_sequence_done_callback_handler = function (self, callback_func)
	slot5 = callback_func

	self._load_sequence_done_callback_handler.add(slot3, self._load_sequence_done_callback_handler)

	return 
end
SavefileManager.remove_load_sequence_done_callback_handler = function (self, callback_func)
	slot5 = callback_func

	self._load_sequence_done_callback_handler.remove(slot3, self._load_sequence_done_callback_handler)

	return 
end
SavefileManager._clean_meta_data_list = function (self, is_setting_slot)
	if is_setting_slot then
		Global.savefile_manager.meta_data_list[self.SETTING_SLOT] = nil
	else
		local empty_list = nil
		slot5 = Global.savefile_manager.meta_data_list

		for slot in pairs(slot4) do
			if slot ~= self.SETTING_SLOT then
				empty_list = true

				break
			end
		end

		if empty_list then
			local setting_meta_data = Global.savefile_manager.meta_data_list[self.SETTING_SLOT]
			Global.savefile_manager.meta_data_list = {
				[self.SETTING_SLOT] = setting_meta_data
			}
		end
	end

	return 
end
SavefileManager._save = function (self, slot, cache_only, save_system)
	local is_setting_slot = slot == self.SETTING_SLOT
	slot7 = self
	local is_progress_slot = slot == self.get_save_progress_slot(slot6)
	slot11 = cache_only

	self._save_begin_callback_handler.dispatch(slot7, self._save_begin_callback_handler, slot, is_setting_slot)

	slot9 = slot

	self._save_cache(slot7, self)

	if cache_only then
		slot13 = true

		self._save_done(slot7, self, slot, cache_only, nil, nil)

		return 
	end

	if is_setting_slot then
		slot9 = false

		self._set_setting_changed(slot7, self)
	end

	if is_setting_slot and managers.user.STORE_SETTINGS_ON_PROFILE then
		slot9 = TimerManager
		slot9 = TimerManager.wall(slot8)
		Global.savefile_manager.safe_profile_save_time = TimerManager.wall(slot8).time(slot8) + self.MAX_PROFILE_SAVE_INTERVAL
		local task_data = {
			queued_in_save_manager = false,
			task_type = self.SAVE_TASK_TYPE,
			first_slot = slot
		}
		slot10 = task_data

		self._on_task_queued(self.MAX_PROFILE_SAVE_INTERVAL, self)

		slot9 = managers.user
		slot15 = task_data

		managers.user.save_setting_map(self.MAX_PROFILE_SAVE_INTERVAL, callback(slot11, self, self, "clbk_result_save_platform_setting"))
	else
		local meta_data = self._meta_data(slot7, self)
		local task_data = {
			queued_in_save_manager = true,
			date_format = "%c",
			max_queue_size = 1,
			first_slot = slot,
			task_type = self.SAVE_TASK_TYPE
		}
		slot10 = managers.user
		task_data.user_index = managers.user.get_platform_id(slot)
		slot11 = "PS3"

		if SystemInfo.platform(slot) == Idstring(SystemInfo) then
			slot11 = "savefile_game_title"
			task_data.title = managers.localization.text(slot9, managers.localization)

			if is_setting_slot then
				task_data.disable_ownership_check = true
			end

			task_data.small_icon_path = "ICON0.PNG"
		end

		slot12 = {
			VERSION = self.LOWEST_COMPATIBLE_VERSION
		}
		task_data.subtitle = managers.localization.text(slot9, managers.localization, (is_setting_slot and "savefile_setting") or "savefile_progress")
		slot11 = (is_setting_slot and "savefile_setting_description") or "savefile_progress_description"
		task_data.details = managers.localization.text(slot9, managers.localization)
		task_data.data = {
			meta_data.cache
		}
		slot11 = "STEAM"

		if SystemInfo.distribution(meta_data.cache) == Idstring(SystemInfo) then
			task_data.save_system = save_system or "steam_cloud"
		end

		slot11 = task_data

		self._on_task_queued(slot9, self)

		slot11 = task_data
		slot16 = "clbk_result_save"

		SaveGameManager.save(slot9, SaveGameManager, callback(slot13, self, self))
	end

	return 
end
SavefileManager._save_cache = function (self, slot)
	slot8 = slot
	slot5 = "[SavefileManager] Saves slot \"" .. tostring(slot7) .. "\" to cache."

	cat_print(slot3, "savefile_manager")

	local is_setting_slot = slot == self.SETTING_SLOT

	if is_setting_slot then
		slot7 = nil

		self._set_cache(slot4, self, slot)
	else
		local old_slot = Global.savefile_manager.current_game_cache_slot

		if old_slot then
			slot8 = nil

			self._set_cache(slot5, self, old_slot)
		end

		slot8 = true

		self._set_current_game_cache_slot(slot5, self, slot)
	end

	local cache = {
		version = SavefileManager.VERSION,
		version_name = SavefileManager.VERSION_NAME
	}

	if is_setting_slot then
		slot7 = cache

		managers.user.save(slot5, managers.user)

		slot7 = cache

		managers.music.save_settings(slot5, managers.music)

		slot7 = cache

		managers.character_customization.save(slot5, managers.character_customization)

		slot7 = cache

		managers.raid_job.save_game(slot5, managers.raid_job)

		slot7 = cache

		managers.statistics.save(slot5, managers.statistics)

		slot7 = cache

		managers.weapon_inventory.save_account_wide_info(slot5, managers.weapon_inventory)

		slot7 = cache

		managers.challenge.save_profile_slot(slot5, managers.challenge)

		slot7 = cache

		managers.breadcrumb.save_profile_slot(slot5, managers.breadcrumb)

		slot7 = cache

		managers.consumable_missions.save(slot5, managers.consumable_missions)

		slot7 = cache

		managers.gold_economy.save(slot5, managers.gold_economy)

		slot7 = cache

		managers.progression.save_profile_slot(slot5, managers.progression)

		slot7 = cache

		managers.unlock.save_profile_slot(slot5, managers.unlock)

		slot7 = cache

		managers.greed.save_profile_slot(slot5, managers.greed)

		slot7 = cache

		managers.event_system.save_profile_slot(slot5, managers.event_system)
	else
		slot7 = cache

		managers.player.save(slot5, managers.player)

		slot7 = cache

		managers.experience.save(slot5, managers.experience)

		slot7 = cache

		managers.upgrades.save(slot5, managers.upgrades)

		slot7 = cache

		managers.skilltree.save(slot5, managers.skilltree)

		slot7 = cache

		managers.blackmarket.save(slot5, managers.blackmarket)

		slot7 = cache

		managers.mission.save_job_values(slot5, managers.mission)

		slot7 = cache

		managers.dlc.save(slot5, managers.dlc)

		slot7 = cache

		managers.music.save_profile(slot5, managers.music)

		slot7 = cache

		managers.challenge.save_character_slot(slot5, managers.challenge)

		slot7 = cache

		managers.warcry.save(slot5, managers.warcry)

		slot7 = cache

		managers.weapon_skills.save(slot5, managers.weapon_skills)

		slot7 = cache

		managers.breadcrumb.save_character_slot(slot5, managers.breadcrumb)
	end

	slot7 = "STEAM"

	if SystemInfo.distribution(slot5) == Idstring(SystemInfo) then
		if not self._USER_ID_OVERRRIDE then
			slot6 = Steam
			slot4 = Steam.userid(slot5)
		end

		cache.user_id = slot4
		slot8 = cache.user_id

		cat_print(slot5, "savefile_manager", "[SavefileManager:_save_cache] user_id:")
	end

	slot8 = cache

	self._set_cache(slot5, self, slot)

	slot8 = false

	self._set_synched_cache(slot5, self, slot)

	return 
end
SavefileManager._save_done = function (self, slot, cache_only, task_data, slot_data, success)
	if not success then
		slot10 = nil

		self._set_cache(slot7, self, slot)
	end

	if not cache_only then
		slot10 = not success

		self._set_corrupt(slot7, self, slot)
	end

	slot10 = success and not cache_only

	self._set_synched_cache(slot7, self, slot)

	local is_setting_slot = slot == self.SETTING_SLOT

	if is_setting_slot and not success then
		slot10 = true

		self._set_setting_changed(slot8, self)
	end

	slot14 = false

	self._save_done_callback_handler.dispatch(slot8, self._save_done_callback_handler, slot, success, is_setting_slot, cache_only)

	if not success then
		local dialog_data = {}
		slot11 = "dialog_error_title"
		dialog_data.title = managers.localization.text(slot9, managers.localization)
		local ok_button = {}
		slot12 = "dialog_ok"
		ok_button.text = managers.localization.text(managers.localization, managers.localization)
		dialog_data.button_list = {
			ok_button
		}
		slot12 = "dialog_fail_save_game_corrupt"
		dialog_data.text = managers.localization.text(managers.localization, managers.localization)
		slot12 = dialog_data

		managers.system_menu.show(managers.localization, managers.system_menu)
	end

	return 
end
SavefileManager._load = function (self, slot, cache_only, save_system)
	local is_setting_slot = slot == self.SETTING_SLOT

	if not is_setting_slot then
		slot9 = true

		self._set_current_game_cache_slot(slot6, self, slot)
	end

	slot10 = cache_only

	self._load_begin_callback_handler.dispatch(slot6, self._load_begin_callback_handler, slot, is_setting_slot)

	slot8 = slot
	local meta_data = self._meta_data(slot6, self)

	if cache_only or (meta_data.is_synched_cache and meta_data.cache) then
		slot10 = cache_only

		self._load_done(slot7, self, slot)
	else
		if is_setting_slot then
			slot10 = nil

			self._set_cache(slot7, self, slot)
		else
			slot10 = nil

			self._set_cache(slot7, self, Global.savefile_manager.current_game_cache_slot)
		end

		if is_setting_slot and managers.user.STORE_SETTINGS_ON_PROFILE then
			local task_data = {
				queued_in_save_manager = false,
				task_type = self.LOAD_TASK_TYPE,
				first_slot = slot
			}
			slot9 = managers.user
			task_data.user_index = managers.user.get_platform_id(slot8)
			slot10 = task_data

			self._on_task_queued(slot8, self)

			slot9 = managers.user
			slot15 = task_data

			managers.user.load_platform_setting_map(slot8, callback(slot11, self, self, "clbk_result_load_platform_setting_map"))
		else

			-- Decompilation error in this vicinity:
			local task_data = {
				queued_in_save_manager = true,
				task_type = self.LOAD_TASK_TYPE,
				first_slot = slot
			}
			slot9 = managers.user
			task_data.user_index = managers.user.get_platform_id(slot8)
			slot10 = "PS3"

			if SystemInfo.platform(slot8) == Idstring(SystemInfo) then
				task_data.disable_ownership_check = is_setting_slot
			end

			slot10 = "STEAM"

			if SystemInfo.distribution(slot8) == Idstring(SystemInfo) then
				task_data.save_system = save_system or "steam_cloud"
			end

			local load_callback_obj_test = (task_data.save_system == "local_hdd" and "clbk_result_load_backup") or "clbk_result_load"
			slot12 = task_data

			self._on_task_queued(slot10, self)

			slot13 = load_callback_obj

			SaveGameManager.load(slot10, SaveGameManager, task_data)
		end
	end

	return 
end
SavefileManager._on_task_queued = function (self, task_data)
	slot5 = "[SavefileManager:_on_task_queued]"
	slot8 = task_data

	cat_print(slot3, "savefile_manager", inspect(slot7))

	if task_data.max_queue_size then
		local nr_tasks_found = 0
		local i_task = 1

		while i_task <= #self._queued_tasks do
			local test_task_data = self._queued_tasks[i_task]

			if test_task_data.task_type == task_data.task_type and test_task_data.save_system == task_data.save_system then
				nr_tasks_found = nr_tasks_found + 1

				if task_data.max_queue_size <= nr_tasks_found then
					slot8 = test_task_data

					SaveGameManager.abort(slot6, SaveGameManager)

					slot8 = i_task

					table.remove(slot6, self._queued_tasks)
				else
					i_task = i_task + 1
				end
			else
				i_task = i_task + 1
			end
		end
	end

	slot5 = task_data

	table.insert(slot3, self._queued_tasks)

	slot4 = self

	self.update_current_task_type(slot3)

	return 
end
SavefileManager._on_task_completed = function (self, task_data)
	slot4 = self._queued_tasks

	for i, test_task_data in ipairs(slot3) do
		if task_data == test_task_data then
			slot10 = i

			table.remove(slot8, self._queued_tasks)

			slot9 = self

			self.update_current_task_type(slot8)

			slot10 = "found and removed"

			cat_print(slot8, "savefile_manager")

			return true
		end
	end

	return 
end
SavefileManager._load_done = function (self, slot, cache_only, wrong_user, wrong_version)
	local is_setting_slot = slot == self.SETTING_SLOT
	slot8 = self
	local is_progress_slot = slot == self.get_save_progress_slot(slot7)
	slot10 = slot
	local meta_data = self._meta_data(slot8, self)
	local success = true

	if not cache_only then
		slot13 = not success

		self._set_corrupt(slot10, self, slot)

		slot13 = success

		self._set_synched_cache(slot10, self, slot)
	end

	if self._backup_data and is_progress_slot then
		slot12 = slot
		local meta_data = self._meta_data(slot10, self)
		local cache = meta_data.cache

		if cache then
			slot15 = self._backup_data.save_data.data

			if managers.experience.chk_ask_use_backup(slot12, managers.experience, cache) then
				slot16 = {
					cache_only,
					wrong_user
				}

				self._ask_load_backup(slot12, self, "low_progress", true)

				return 
			end
		end
	end

	slot12 = slot
	local req_version = self._load_cache(slot10, self)
	success = (req_version == nil and success) or false
	slot16 = cache_only

	self._load_done_callback_handler.dispatch(slot11, self._load_done_callback_handler, slot, success, is_setting_slot)

	if not success and wrong_user then
		if not self._queued_wrong_user then
			self._queued_wrong_user = true
			slot12 = managers.menu

			managers.menu.show_savefile_wrong_user(slot11)
		end

		self._save_slots_to_load[slot] = nil
	elseif not success then
		self._try_again = self._try_again or {}
		local dialog_data = {}
		slot14 = "dialog_error_title"
		dialog_data.title = managers.localization.text(slot12, managers.localization)
		local ok_button = {}
		slot15 = "dialog_ok"
		ok_button.text = managers.localization.text(managers.localization, managers.localization)
		dialog_data.button_list = {
			ok_button
		}

		if is_setting_slot or is_progress_slot then
			local at_init = false
			local error_msg = (is_setting_slot and "dialog_fail_load_setting_") or (is_progress_slot and "dialog_fail_load_progress_")
			error_msg = error_msg .. ((req_version == nil and "corrupt") or "wrong_version")
			slot18 = error_msg

			cat_print((req_version == nil and "corrupt") or "wrong_version", "savefile_manager", "ERROR: ")

			if not self._try_again[slot] then
				local yes_button = {}
				slot18 = "dialog_yes"
				yes_button.text = managers.localization.text(slot16, managers.localization)
				local no_button = {}
				slot19 = "dialog_no"
				no_button.text = managers.localization.text(managers.localization, managers.localization)
				no_button.class = RaidGUIControlButtonShortSecondary
				dialog_data.button_list = {
					yes_button,
					no_button
				}
				dialog_data.id = "savefile_try_again"
				slot20 = {
					VERSION = req_version
				}
				dialog_data.text = managers.localization.text(managers.localization, managers.localization, error_msg .. "_retry")

				if is_setting_slot then
					yes_button.callback_func = function ()
						slot2 = self

						self.load_settings(slot1)

						return 
					end
				elseif is_progress_slot then
					yes_button.callback_func = function ()
						slot2 = self

						self.load_progress(slot1)

						return 
					end
				end

				no_button.callback_func = function ()
					if is_progress_slot and self._backup_data then
						slot4 = (req_version == nil and "corrupt") or "wrong_version"

						self._ask_load_backup(slot1, self, "progress_" .. false)

						return 
					else
						local rem_dialog_data = {}
						slot4 = "dialog_error_title"
						rem_dialog_data.title = managers.localization.text(slot2, managers.localization)
						slot5 = {
							VERSION = req_version
						}
						rem_dialog_data.text = managers.localization.text(slot2, managers.localization, error_msg)
						local ok_button = {}
						slot5 = "dialog_ok"
						ok_button.text = managers.localization.text(managers.localization, managers.localization)
						ok_button.callback_func = function ()
							slot3 = slot

							self._remove(slot1, self)

							return 
						end
						rem_dialog_data.button_list = {
							ok_button
						}
						slot5 = rem_dialog_data

						managers.system_menu.show(managers.localization, managers.system_menu)
					end

					return 
				end
				self._try_again[slot] = true
			else
				at_init = false

				if is_progress_slot and self._backup_data then
					slot18 = (req_version == nil and "corrupt") or "wrong_version"

					self._ask_load_backup(slot15, self, "progress_" .. false)

					return 
				else
					slot18 = {
						VERSION = req_version
					}
					dialog_data.text = managers.localization.text(slot15, managers.localization, error_msg)
					dialog_data.id = "savefile_new_safefile"
					ok_button.callback_func = function ()
						slot3 = slot

						self._remove(slot1, self)

						return 
					end
				end
			end

			if at_init then
				slot17 = dialog_data

				managers.system_menu.add_init_show(slot15, managers.system_menu)
			else
				slot17 = dialog_data

				managers.system_menu.show(slot15, managers.system_menu)
			end

			return 
		end

		slot15 = "dialog_fail_load_game_corrupt"
		dialog_data.text = managers.localization.text(slot13, managers.localization)
		slot15 = dialog_data

		managers.system_menu.add_init_show(slot13, managers.system_menu)
	elseif wrong_user then
		Global.savefile_manager.progress_wrong_user = true
		self._save_slots_to_load[slot] = nil

		if not self._queued_wrong_user then
			self._queued_wrong_user = true
			local dialog_data = {}
			slot14 = "dialog_information_title"
			dialog_data.title = managers.localization.text(slot12, managers.localization)
			slot14 = "dialog_load_wrong_user"
			dialog_data.text = managers.localization.text(slot12, managers.localization)
			dialog_data.id = "wrong_user"
			local ok_button = {}
			slot15 = "dialog_ok"
			ok_button.text = managers.localization.text(managers.localization, managers.localization)
			dialog_data.button_list = {
				ok_button
			}
			slot15 = dialog_data

			managers.system_menu.add_init_show(managers.localization, managers.system_menu)
		end
	else
		self._save_slots_to_load[slot] = nil

		if is_setting_slot then
			slot13 = "last_selected_character_profile_slot"
			local last_selected_character_profile_slot = managers.user.get_setting(slot11, managers.user)
			slot14 = last_selected_character_profile_slot

			managers.savefile.set_save_progress_slot(managers.user, managers.savefile)

			if SavefileManager.MIN_SLOT <= last_selected_character_profile_slot and last_selected_character_profile_slot <= SavefileManager.MAX_SLOT then
				managers.savefile._load(slot12, managers.savefile, last_selected_character_profile_slot, nil)
			end
		end

		Global.savefile_manager.meta_data_list[slot].is_load_done = true

		if meta_data.cache then
			Global.savefile_manager.meta_data_list[slot].is_cached_slot = true
		else
			Global.savefile_manager.meta_data_list[slot].is_cached_slot = false
		end

		if self._resave_required then
			slot14 = slot

			Application.trace(slot11, Application, "[SavefileManager][_load_cache] Resave was required when loading slot ")

			slot14 = false

			self._save(slot11, self, slot)

			self._resave_required = false
		end
	end
end
SavefileManager._remove = function (self, slot, save_system)
	local task_data = {
		queued_in_save_manager = true,
		first_slot = slot,
		task_type = self.REMOVE_TASK_TYPE
	}
	slot6 = managers.user
	task_data.user_index = managers.user.get_platform_id(slot5)
	slot7 = "STEAM"

	if SystemInfo.distribution(slot5) == Idstring(SystemInfo) then
		task_data.save_system = save_system or "steam_cloud"
	end

	self._save_slots_to_load[slot] = nil
	slot7 = task_data

	self._on_task_queued(nil, self)

	slot7 = task_data
	slot12 = "clbk_result_remove"

	SaveGameManager.remove(nil, SaveGameManager, callback(slot9, self, self))

	return 
end
SavefileManager.set_resave_required = function (self)
	self._resave_required = true

	return 
end
SavefileManager._load_cache = function (self, slot)
	slot8 = slot
	slot5 = "[SavefileManager] Loads cached slot \"" .. tostring(slot7) .. "\"."

	cat_print(slot3, "savefile_manager")

	self._resave_required = false
	slot5 = slot
	local meta_data = self._meta_data(slot3, self)
	local cache = meta_data.cache
	local is_setting_slot = slot == self.SETTING_SLOT

	if not is_setting_slot then
		slot9 = true

		self._set_current_game_cache_slot(slot6, self, slot)
	end

	if cache then
		local version = cache.version or 0
		local version_name = cache.version_name

		if SavefileManager.VERSION < version then
			return version_name
		end

		if is_setting_slot then
			slot11 = version

			managers.user.load(slot8, managers.user, cache)

			slot11 = version

			managers.music.load_settings(slot8, managers.music, cache)

			slot11 = version

			managers.character_customization.load(slot8, managers.character_customization, cache)

			slot10 = cache

			managers.raid_job.load_game(slot8, managers.raid_job)

			slot11 = version

			managers.statistics.load(slot8, managers.statistics, cache)

			slot10 = false

			self._set_setting_changed(slot8, self)

			slot10 = cache

			managers.weapon_inventory.load_account_wide_info(slot8, managers.weapon_inventory)

			slot11 = version

			managers.challenge.load_profile_slot(slot8, managers.challenge, cache)

			slot11 = version

			managers.breadcrumb.load_profile_slot(slot8, managers.breadcrumb, cache)

			slot11 = version

			managers.consumable_missions.load(slot8, managers.consumable_missions, cache)

			slot11 = version

			managers.gold_economy.load(slot8, managers.gold_economy, cache)

			slot11 = version

			managers.progression.load_profile_slot(slot8, managers.progression, cache)

			slot10 = cache

			managers.unlock.load_profile_slot(slot8, managers.unlock)

			slot10 = cache

			managers.greed.load_profile_slot(slot8, managers.greed)

			slot10 = cache

			managers.event_system.load_profile_slot(slot8, managers.event_system)
		else
			slot11 = version

			managers.experience.load(slot8, managers.experience, cache)

			slot11 = version

			managers.blackmarket.load(slot8, managers.blackmarket, cache)

			slot11 = version

			managers.upgrades.load(slot8, managers.upgrades, cache)

			slot11 = version

			managers.player.load(slot8, managers.player, cache)

			slot11 = version

			managers.skilltree.load(slot8, managers.skilltree, cache)

			slot11 = version

			managers.mission.load_job_values(slot8, managers.mission, cache)

			slot11 = version

			managers.dlc.load(slot8, managers.dlc, cache)

			slot11 = version

			managers.challenge.load_character_slot(slot8, managers.challenge, cache)

			slot11 = version

			managers.warcry.load(slot8, managers.warcry, cache)

			slot11 = version

			managers.weapon_skills.load(slot8, managers.weapon_skills, cache)

			slot11 = version

			managers.breadcrumb.load_character_slot(slot8, managers.breadcrumb, cache)
		end
	end

	return 
end
SavefileManager._meta_data = function (self, slot)
	local meta_data = Global.savefile_manager.meta_data_list[slot]

	if not meta_data then
		meta_data = {
			is_load_done = false,
			is_cached_slot = false,
			is_synched_cache = false,
			is_synched_text = false,
			is_corrupt = false,
			slot = slot
		}
		Global.savefile_manager.meta_data_list[slot] = meta_data
		slot9 = slot
		slot6 = "[SavefileManager] Created meta data for slot \"" .. tostring(slot8) .. "\"."

		cat_print(slot4, "savefile_manager")
	end

	return meta_data
end
SavefileManager._set_current_task_type = function (self, task_type)
	local old_task_type = self._current_task_type

	if old_task_type ~= task_type then
		if Global.category_print.savefile_manager then
			slot12 = task_type
			slot6 = "[SavefileManager] Changed current task from \"" .. self.debug_get_task_name(slot8, self) .. "\" to \"" .. self.debug_get_task_name(old_task_type, self) .. "\"."

			cat_print(slot4, "savefile_manager")
		end

		self._current_task_type = task_type

		if task_type == self.IDLE_TASK_TYPE then
			slot7 = task_type

			self._active_changed_callback_handler.dispatch(slot4, self._active_changed_callback_handler, false)
		elseif old_task_type == self.IDLE_TASK_TYPE then
			slot7 = task_type

			self._active_changed_callback_handler.dispatch(slot4, self._active_changed_callback_handler, true)
		end

		slot5 = TimerManager
		slot5 = TimerManager.wall(slot4)
		local wall_time = TimerManager.wall(slot4).time(slot4)
		local ps3_ps4_load_enabled = true
		slot8 = "PS3"
	end

	return 
end
SavefileManager._set_current_game_cache_slot = function (self, current_game_cache_slot, dont_clear_old_cache)
	if not dont_clear_old_cache then
		local old_slot = Global.savefile_manager.current_game_cache_slot

		if old_slot ~= current_game_cache_slot then
			slot10 = old_slot
			slot12 = current_game_cache_slot
			slot7 = "[SavefileManager] Changed current cache slot from \"" .. tostring(slot9) .. "\" to \"" .. tostring(slot11) .. "\"."

			cat_print(slot5, "savefile_manager")

			if old_slot then
				slot8 = nil

				self._set_cache(slot5, self, old_slot)
			end

			Global.savefile_manager.current_game_cache_slot = current_game_cache_slot
		end
	else
		Global.savefile_manager.current_game_cache_slot = current_game_cache_slot
	end

	return 
end
SavefileManager._set_corrupt = function (self, slot, is_corrupt)
	slot6 = slot
	local meta_data = self._meta_data(slot4, self)

	if not meta_data.is_corrupt ~= not is_corrupt then
		slot10 = slot
		slot12 = not not is_corrupt
		slot7 = "[SavefileManager] Slot \"" .. tostring(slot9) .. "\" changed corrupt state to \"" .. tostring(slot11) .. "\"."

		cat_print(slot5, "savefile_manager")

		meta_data.is_corrupt = is_corrupt
	end

	return 
end
SavefileManager._set_synched_cache = function (self, slot, is_synched_cache)
	slot6 = slot
	local meta_data = self._meta_data(slot4, self)

	if not meta_data.is_synched_cache ~= not is_synched_cache then
		slot10 = slot
		slot12 = not not is_synched_cache
		slot7 = "[SavefileManager] Slot \"" .. tostring(slot9) .. "\" changed synched cache state to \"" .. tostring(slot11) .. "\"."

		cat_print(slot5, "savefile_manager")

		meta_data.is_synched_cache = is_synched_cache
	end

	return 
end
SavefileManager._set_cache = function (self, slot, cache)
	slot6 = slot
	local meta_data = self._meta_data(slot4, self)

	if meta_data.cache ~= cache then
		slot10 = slot
		slot12 = meta_data.cache
		slot14 = cache
		slot7 = "[SavefileManager] Slot \"" .. tostring(slot9) .. "\" changed cache from \"" .. tostring(slot11) .. "\" to \"" .. tostring(slot13) .. "\"."

		cat_print(slot5, "savefile_manager")

		meta_data.cache = cache
	end

	return 
end
SavefileManager._set_setting_changed = function (self, setting_changed)
	if not Global.savefile_manager.setting_changed ~= not setting_changed then
		slot8 = setting_changed
		slot5 = "[SavefileManager] Setting changed: \"" .. tostring(slot7) .. "\"."

		cat_print(slot3, "savefile_manager")

		Global.savefile_manager.setting_changed = setting_changed
	end

	return 
end
SavefileManager._is_saving_progress_allowed = function (self)
	slot4 = nil

	if not managers.user.is_signed_in(slot2, managers.user) then
		slot4 = "[SavefileManager:_is_saving_progress_allowed()] NOT SIGNED IN"

		Application.debug(slot2, Application)

		return false
	end

	slot4 = nil

	if not managers.user.is_storage_selected(slot2, managers.user) then
		slot4 = "[SavefileManager:_is_saving_progress_allowed()] NO STORAGE SELECTED"

		Application.debug(slot2, Application)

		return false
	end

	if Global.savefile_manager.progress_wrong_user then
		slot4 = "[SavefileManager:_is_saving_progress_allowed()] WRONG USER"

		Application.debug(slot2, Application)

		return false
	end

	return true
end
SavefileManager._is_saving_setting_allowed = function (self, is_user_initiated_action)
	slot5 = nil

	if not managers.user.is_signed_in(slot3, managers.user) then
		slot5 = "[SavefileManager] Skips saving setting. User not signed in."

		cat_print(slot3, "savefile_manager")

		return false
	end

	if not Global.savefile_manager.setting_changed then
		slot5 = "[SavefileManager] Skips saving setting. Setting is already saved."

		cat_print(slot3, "savefile_manager")

		return false
	elseif not is_user_initiated_action then
		local safe_time = Global.savefile_manager.safe_profile_save_time

		if safe_time then
			slot5 = TimerManager
			slot5 = TimerManager.wall(slot4)
			local time = TimerManager.wall(slot4).time(slot4)

			if time <= safe_time then
				slot6 = "savefile_manager"
				slot10 = safe_time - time

				cat_print(slot5, string.format(slot8, "[SavefileManager] Skips saving setting. Needs to be user initiated or triggered after %g seconds."))

				return false
			else
				Global.savefile_manager.safe_profile_save_time = nil
			end
		end
	end

	slot4 = "savefile_manager [SavefileManager] Allowed saving setting."

	cat_print(slot3)

	return true
end
SavefileManager.fetch_savegame_hdd_space_required = function (self)
	return self._savegame_hdd_space_required
end
SavefileManager._ask_load_backup = function (self, reason, dialog_at_init, load_params)
	dialog_at_init = false
	local dialog_data = {}
	slot8 = "dialog_error_title"
	dialog_data.title = managers.localization.text(slot6, managers.localization)
	local yes_button = {}
	slot9 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	local no_button = {}
	slot10 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	yes_button.callback_func = function ()
		slot3 = self
		self._save_slots_to_load[self.get_save_progress_slot(slot2)] = nil
		slot5 = self

		self._set_cache(self.get_save_progress_slot(slot2), self, self.get_save_progress_slot(slot4))

		self._backup_data = nil
		slot2 = self
		slot5 = self

		self._load_cache(nil, self.get_save_progress_slot(self._backup_data.save_data.data))

		return 
	end
	no_button.callback_func = function ()
		self._backup_data = nil
		slot3 = self
		self._save_slots_to_load[self.get_save_progress_slot(slot2)] = nil

		return 
	end

	if reason == "no_progress" or reason == "low_progress" then
		slot10 = "dialog_ask_load_progress_backup_low_lvl"
		dialog_data.text = managers.localization.text(slot8, managers.localization)

		if reason == "low_progress" then
			no_button.callback_func = function ()
				self._backup_data = nil
				slot3 = self.get_save_progress_slot(slot4)
				slot6 = load_params

				self._load_done(nil, self, unpack(self))

				return 
			end
		end
	elseif reason == "progress_corrupt" or reason == "progress_wrong_version" then
		slot10 = "dialog_ask_load_progress_backup_" .. ((reason == "progress_corrupt" and "corrupt") or "wrong_version")
		dialog_data.text = managers.localization.text(slot8, managers.localization)
		no_button.callback_func = function ()
			self._backup_data = nil
			slot2 = self
			slot5 = self

			self._remove(nil, self.get_save_progress_slot(slot4))

			return 
		end
	end

	if dialog_at_init then
		slot10 = dialog_data

		managers.system_menu.add_init_show(slot8, managers.system_menu)
	else
		slot10 = dialog_data

		managers.system_menu.show(slot8, managers.system_menu)
	end

	return 
end
SavefileManager.clbk_result_load_platform_setting_map = function (self, task_data, platform_setting_map)
	slot6 = "[SavefileManager:clbk_result_load_platform_setting_map]"

	cat_print(slot4, "savefile_manager")

	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	local cache = nil

	if platform_setting_map then
		slot6 = managers.user
		cache = managers.user.get_setting_map(slot5)
	end

	slot8 = cache

	self._set_cache(slot5, self, self.SETTING_SLOT)

	slot8 = false

	self._load_done(slot5, self, self.SETTING_SLOT)

	return 
end
SavefileManager.reset_progress_managers = function (self)
	slot3 = managers.blackmarket

	managers.blackmarket._setup(slot2)

	slot3 = managers.upgrades

	managers.upgrades.reset(slot2)

	slot3 = managers.experience

	managers.experience.reset(slot2)

	slot3 = managers.player

	managers.player.reset(slot2)

	slot3 = managers.skilltree

	managers.skilltree.reset(slot2)

	slot3 = managers.mission

	managers.mission._setup(slot2)

	slot3 = managers.warcry

	managers.warcry.clear_active_warcry(slot2)

	slot3 = managers.warcry

	managers.warcry._setup(slot2)

	slot4 = true

	managers.weapon_skills._setup(slot2, managers.weapon_skills)

	return 
end
SavefileManager.save_last_selected_character_profile_slot = function (self)
	local progress_slot = managers.savefile.get_save_progress_slot(slot2)
	slot7 = true

	managers.user.set_setting(managers.savefile, managers.user, "last_selected_character_profile_slot", progress_slot)

	slot4 = managers.savefile

	managers.savefile.setting_changed(managers.savefile)

	slot6 = false

	managers.savefile.save_game(managers.savefile, managers.savefile, SavefileManager.SETTING_SLOT)

	return 
end
SavefileManager.clbk_result_load = function (self, task_data, result_data)
	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	slot5 = result_data

	if type_name(slot4) == "table" then
		slot5 = result_data

		for slot, slot_data in pairs(slot4) do
			slot13 = "\n"
			slot16 = slot_data

			cat_print(slot9, "savefile_manager", "slot:", slot, inspect(slot15))

			local status = slot_data.status
			local cache = nil
			local wrong_user = status == "WRONG_USER"
			local wrong_version = status == "WRONG_VERSION"
			local file_not_found = status == "FILE_NOT_FOUND"

			if status == "OK" or wrong_user then
				cache = slot_data.data
			end

			if cache then
				slot16 = "WIN32"

				if SystemInfo.platform(slot14) == Idstring(SystemInfo) and cache.version ~= SavefileManager.VERSION then
					cache = nil
					wrong_version = true
				end
			end

			if cache then
				slot16 = "STEAM"

				if SystemInfo.distribution(slot14) == Idstring(SystemInfo) then
					slot13 = cache.user_id

					if not self._USER_ID_OVERRRIDE then
						slot16 = Steam
						slot14 = Steam.userid(slot15)
					end

					if slot13 ~= slot14 then
						slot13 = cat_print
						slot15 = "savefile_manager"
						slot16 = "[SavefileManager:clbk_result_load] User ID missmatch. cache.user_id:"
						slot17 = cache.user_id
						slot18 = ". expected user id:"

						if not self._USER_ID_OVERRRIDE then
							slot21 = Steam
							slot19 = Steam.userid(slot20)
						end

						slot13(slot14, slot15, slot16, slot17, slot18)

						cache = nil
						wrong_user = true
					end
				end
			end

			slot17 = cache

			self._set_cache(slot14, self, slot)

			slot19 = wrong_version

			self._load_done(slot14, self, slot, false, wrong_user)

			if file_not_found then
				Global.savefile_manager.meta_data_list[slot].is_load_done = true
				Global.savefile_manager.meta_data_list[slot].is_cached_slot = false
			end
		end
	else
		slot7 = result_data

		Application.error(slot4, Application, "[SavefileManager:clbk_result_load] error:")
	end

	return 
end
SavefileManager.clbk_result_load_backup = function (self, task_data, result_data)
	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	slot5 = result_data

	if type_name(slot4) == "table" then
		slot5 = result_data

		for slot, slot_data in pairs(slot4) do
			local status = slot_data.status

			if slot == self.BACKUP_SLOT then
				self._backup_data = false

				if status == "OK" then
					local cache = slot_data.data
					local version = cache.version or 0
					local version_name = cache.version_name
					slot15 = "STEAM"

					if SystemInfo.distribution(slot13) == Idstring(SystemInfo) then
						slot12 = cache.user_id

						if not self._USER_ID_OVERRRIDE then
							slot15 = Steam
							slot13 = Steam.userid(slot14)
						end
					elseif version <= SavefileManager.VERSION then
						self._backup_data = {
							save_data = slot_data
						}
					else
						slot15 = "[SavefileManager:clbk_result_load_backup] local savegame backup is wrong version"

						Application.error(slot13, Application)
					end
				end
			end
		end
	else
		slot7 = result_data

		Application.error(slot4, Application, "[SavefileManager:clbk_result_load_backup] error:")
	end

	return 
end
SavefileManager.clbk_result_remove = function (self, task_data, result_data)
	slot7 = inspect(slot8)
	slot10 = result_data

	cat_print(slot4, "savefile_manager", "[SavefileManager:clbk_result_remove]", inspect(task_data))

	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	return 
end
SavefileManager.clbk_result_iterate_savegame_slots = function (self, task_data, result_data)
	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	self._save_slots_to_load = {}
	local found_progress_slot = nil
	slot6 = result_data

	if type_name(slot5) == "table" then
		slot6 = result_data

		for slot, slot_data in pairs(slot5) do
			if slot == self.SETTING_SLOT then
				self._save_slots_to_load[slot] = true
				slot11 = self

				self.load_settings(true)

				break
			end
		end
	else
		slot8 = result_data

		Application.error(slot5, Application, "[SavefileManager:clbk_result_iterate_savegame_slots] error:")
	end

	if not found_progress_slot and self._backup_data then
		slot7 = self
		self._save_slots_to_load[self.get_save_progress_slot(slot6)] = true
		slot8 = true

		self._ask_load_backup(self.get_save_progress_slot(slot6), self, "no_progress")
	end

	return 
end
SavefileManager.clbk_result_save = function (self, task_data, result_data)
	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		slot6 = "[SavefileManager:clbk_result_save] SAVE TASK HAS BEEN ABORTED "

		Application.error(slot4, Application)

		slot6 = "[SavefileManager:clbk_result_save] task_data: "
		slot9 = task_data

		Application.error(slot4, Application, inspect(slot8))

		slot6 = "[SavefileManager:clbk_result_save] result_data: "
		slot9 = result_data

		Application.error(slot4, Application, inspect(slot8))

		slot10 = true

		self._save_done_callback_handler.dispatch(slot4, self._save_done_callback_handler, task_data.first_slot, false, task_data.first_slot == SavefileManager.SETTING_SLOT, false)

		return 
	end

	slot5 = result_data

	if type_name(slot4) == "table" then
		slot5 = result_data

		for slot, slot_data in pairs(slot4) do
			slot13 = "\n"
			slot16 = slot_data

			cat_print(slot9, "savefile_manager", "slot:", slot, inspect(slot15))

			local success = slot_data.status == "OK"
			slot16 = success

			self._save_done(slot10, self, slot, false, task_data, slot_data)
		end
	else
		slot7 = result_data

		Application.error(slot4, Application, "[SavefileManager:clbk_result_save] error:")
	end

	return 
end
SavefileManager.clbk_result_save_platform_setting = function (self, task_data, success)
	slot9 = task_data

	cat_print(slot4, "savefile_manager", "[SavefileManager:clbk_result_save_platform_setting]", inspect(success))

	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	slot10 = success

	self._save_done(slot4, self, self.SETTING_SLOT, false, nil, nil)

	if not success then
		slot5 = managers.menu

		managers.menu.show_save_settings_failed(slot4)

		slot6 = false

		self._set_setting_changed(slot4, self)
	end

	return 
end
SavefileManager.clbk_result_space_required = function (self, task_data, result_data)
	slot6 = "[SavefileManager:clbk_result_space_required] table.size(result_data)"
	slot9 = result_data

	cat_print(slot4, "savefile_manager", table.size(slot8))

	slot6 = task_data

	if not self._on_task_completed(slot4, self) then
		return 
	end

	slot5 = result_data

	if type_name(slot4) == "table" then
		slot6 = "PS3"
	else
		slot7 = result_data

		Application.error(slot4, Application, "[SavefileManager:clbk_result_space_required] error:")
	end

	return 
end
SavefileManager.get_active_characters_count = function (self)
	local result = 0

	if Global and Global.savefile_manager and Global.savefile_manager.meta_data_list then
		for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
			if Global.savefile_manager.meta_data_list[slot_index] and Global.savefile_manager.meta_data_list[slot_index].cache then
				result = result + 1
			end
		end
	end

	return result
end
SavefileInfo = SavefileInfo or class()
SavefileInfo.init = function (self, slot, text)
	self._slot = slot
	self._text = text

	return 
end
SavefileInfo.slot = function (self)
	return self._slot
end
SavefileInfo.text = function (self)
	return self._text
end

return 
