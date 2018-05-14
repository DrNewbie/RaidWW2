-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
AchievmentManager = AchievmentManager or class()
AchievmentManager.PATH = "gamedata/achievments"
AchievmentManager.FILE_EXTENSION = "achievment"
AchievmentManager.init = function (self)
	self.exp_awards = {
		b = 1500,
		a = 500,
		c = 5000,
		none = 0
	}
	self.script_data = {}
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot4 = "STEAM"

		if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
			AchievmentManager.do_award = AchievmentManager.award_steam

			if not Global.achievment_manager then
				slot4 = "Steam"

				self._parse_achievments(slot2, self)

				slot3 = Steam
				self.handler = Steam.sa_handler(slot2)
				slot4 = AchievmentManager.fetch_achievments

				self.handler.initialized_callback(slot2, self.handler)

				slot3 = self.handler

				self.handler.init(slot2)

				Global.achievment_manager = {
					handler = self.handler,
					achievments = self.achievments
				}
			else
				self.handler = Global.achievment_manager.handler
				self.achievments = Global.achievment_manager.achievments
			end
		else
			AchievmentManager.do_award = AchievmentManager.award_none
			slot3 = self

			self._parse_achievments(AchievmentManager.award_none)

			if not Global.achievment_manager then
				Global.achievment_manager = {
					achievments = self.achievments
				}
			end

			self.achievments = Global.achievment_manager.achievments
		end
	else
		slot4 = "PS3"

		if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
			if not Global.achievment_manager then
				Global.achievment_manager = {
					trophy_requests = {}
				}
			end

			slot4 = "PSN"

			self._parse_achievments(slot2, self)

			AchievmentManager.do_award = AchievmentManager.award_psn
		else
			slot4 = "PS4"

			if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
				if not Global.achievment_manager then
					slot4 = "PS4"

					self._parse_achievments(slot2, self)

					Global.achievment_manager = {
						trophy_requests = {},
						achievments = self.achievments
					}
				else
					self.achievments = Global.achievment_manager.achievments
				end

				AchievmentManager.do_award = AchievmentManager.award_psn
			else
				slot4 = "X360"

				if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
					slot4 = "X360"

					self._parse_achievments(slot2, self)

					AchievmentManager.do_award = AchievmentManager.award_x360
				else
					slot4 = "XB1"

					if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
						if not Global.achievment_manager then
							slot4 = "XB1"

							self._parse_achievments(slot2, self)

							Global.achievment_manager = {
								achievments = self.achievments
							}
						else
							self.achievments = Global.achievment_manager.achievments
						end

						AchievmentManager.do_award = AchievmentManager.award_x360
					else
						slot4 = "[AchievmentManager:init] Unsupported platform"

						Application.error(slot2, Application)
					end
				end
			end
		end
	end

	return 
end
AchievmentManager.init_finalize = function (self)
	slot3 = managers.savefile
	slot8 = "_load_done"

	managers.savefile.add_load_sequence_done_callback_handler(slot2, callback(slot5, self, self))

	return 
end
AchievmentManager.fetch_trophies = function (self)

	-- Decompilation error in this vicinity:
	slot4 = "PS3"

	return 
end
AchievmentManager.unlockstate_result = function (error_str, table)
	if table then
		slot4 = table

		for i, data in ipairs(slot3) do
			local psn_id = data.index
			local unlocked = data.unlocked

			if unlocked then
				slot11 = managers.achievment.achievments

				for id, ach in pairs(slot10) do
					if ach.id == psn_id then
						ach.awarded = true
					end
				end
			end
		end
	end

	slot4 = managers.network.account

	managers.network.account.achievements_fetched(slot3)

	return 
end
AchievmentManager.fetch_achievments = function (error_str)
	if error_str == "success" then
		slot3 = managers.achievment.achievments

		for id, ach in pairs(slot2) do
			slot9 = ach.id

			if managers.achievment.handler.has_achievement(slot7, managers.achievment.handler) then
				ach.awarded = true
			end
		end
	end

	slot3 = managers.network.account

	managers.network.account.achievements_fetched(slot2)

	return 
end
AchievmentManager._load_done = function (self)
	slot4 = "XB1"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = "[AchievmentManager] _load_done()"

		print(slot2)

		slot6 = true
		slot11 = "_achievments_loaded"
		self._is_fetching_achievments = XboxLive.achievements(slot2, XboxLive, 0, 1000, callback(slot8, self, self))
	end

	return 
end
AchievmentManager._achievments_loaded = function (self, achievment_list)
	slot7 = achievment_list and #achievment_list
	slot4 = "[AchievmentManager] Achievment loaded: " .. tostring(slot6)

	print(slot3)

	if not self._is_fetching_achievments then
		slot4 = "[AchievmentManager] Achievment loading aborted."

		print(slot3)

		return 
	end

	slot4 = achievment_list

	for _, achievment in ipairs(slot3) do
		if achievment.type == "achieved" then
			slot9 = managers.achievment.achievments

			for _, achievment2 in pairs(slot8) do
				slot15 = achievment2.id

				if achievment.id == tostring(slot14) then
					slot17 = achievment.id
					slot14 = "[AchievmentManager] Awarded by load: " .. tostring(slot16)

					print(slot13)

					achievment2.awarded = true

					break
				end
			end
		end
	end

	return 
end
AchievmentManager.on_user_signout = function (self)
	slot4 = "XB1"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = "[AchievmentManager] on_user_signout()"

		print(slot2)

		self._is_fetching_achievments = nil
		slot3 = managers.achievment.achievments

		for id, ach in pairs(slot2) do
			ach.awarded = false
		end
	end

	return 
end
AchievmentManager._parse_achievments = function (self, platform)
	slot5 = self.FILE_EXTENSION.id(slot6)
	slot8 = self.PATH
	local list = PackageManager.script_data(slot3, PackageManager, self.PATH.id(self.FILE_EXTENSION))
	self.achievments = {}
	slot5 = list

	for _, ach in ipairs(PackageManager) do
		if ach._meta == "achievment" then
			slot10 = ach

			for _, reward in ipairs(slot9) do
				if reward._meta == "reward" then
					slot15 = Application

					if Application.editor(slot14) or not platform or platform == reward.platform then
						self.achievments[ach.id] = {
							awarded = false,
							id = reward.id,
							name = ach.name,
							exp = self.exp_awards[ach.awards_exp],
							dlc_loot = reward.dlc_loot or false
						}
					end
				end
			end
		end
	end

	return 
end
AchievmentManager.get_script_data = function (self, id)
	return self.script_data[id]
end
AchievmentManager.set_script_data = function (self, id, data)
	self.script_data[id] = data

	return 
end
AchievmentManager.exists = function (self, id)
	return self.achievments[id] ~= nil
end
AchievmentManager.get_info = function (self, id)
	return self.achievments[id]
end
AchievmentManager.total_amount = function (self)
	slot3 = self.achievments

	return table.size(slot2)
end
AchievmentManager.total_unlocked = function (self)
	local i = 0
	slot4 = self.achievments

	for _, ach in pairs(slot3) do
		if ach.awarded then
			i = i + 1
		end
	end

	return i
end
AchievmentManager.award = function (self, id)
	slot7 = id

	Application.debug(slot3, Application, "[AchievmentManager:award] Awarding achievement", "id")

	slot5 = id

	if not self.exists(slot3, self) then
		slot7 = id

		Application.debug(slot3, Application, "[AchievmentManager:award] Awarding non-existing achievement", "id")

		return 
	end

	slot5 = id

	if self.get_info(slot3, self).awarded then
		return 
	end

	if id == "christmas_present" then
		managers.network.account._masks.santa = true
	elseif id == "golden_boy" then
		managers.network.account._masks.gold = true
	end

	slot5 = id

	self.do_award(slot3, self)

	return 
end
AchievmentManager._give_reward = function (self, id)
	slot5 = id
	local data = self.get_info(slot3, self)
	data.awarded = true

	if data.dlc_loot then
		slot5 = managers.dlc

		managers.dlc.on_achievement_award_loot(slot4)
	end

	return 
end
AchievmentManager.award_progress = function (self, stat, value)
	slot5 = Application

	if Application.editor(slot4) then
		return 
	end

	slot6 = "WIN32"

	if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
		slot6 = AchievmentManager.steam_unlock_result

		self.handler.achievement_store_callback(slot4, self.handler)
	end

	local stats = {
		[stat] = {
			type = "int",
			value = value or 1
		}
	}
	slot8 = true

	managers.network.account.publish_statistics(value or 1, managers.network.account, stats)

	return 
end
AchievmentManager.get_stat = function (self, stat)
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot5 = stat

		return managers.network.account.get_stat(slot3, managers.network.account)
	end

	return false
end
AchievmentManager.award_none = function (self, id)
	slot6 = id

	Application.debug(slot3, Application, "[AchievmentManager:award_none] Awarded achievment")

	return 
end
AchievmentManager.award_steam = function (self, id)
	slot4 = self.handler

	if not self.handler.initialized(slot3) then
		slot6 = id

		Application.error(slot3, Application, "[AchievmentManager:award_steam] Achievements are not initialized. Cannot award achievment:")

		return 
	end

	slot5 = AchievmentManager.steam_unlock_result

	self.handler.achievement_store_callback(slot3, self.handler)

	slot8 = id
	slot5 = self.get_info(slot6, self).id

	self.handler.set_achievement(slot3, self.handler)

	slot4 = self.handler

	self.handler.store_data(slot3)

	return 
end
AchievmentManager.clear_steam = function (self, id)
	slot4 = self.handler

	if not self.handler.initialized(slot3) then
		slot6 = id

		Application.error(slot3, Application, "[AchievmentManager:clear_steam] Achievements are not initialized. Cannot clear achievment:")

		return 
	end

	slot8 = id
	slot5 = self.get_info(slot6, self).id

	self.handler.clear_achievement(slot3, self.handler)

	slot4 = self.handler

	self.handler.store_data(slot3)

	return 
end
AchievmentManager.reset_achievements = function (self)
	slot3 = managers.achievment

	managers.achievment.clear_all_steam(slot2)

	Global.achievment_manager = nil
	slot3 = managers.achievment

	managers.achievment.init(nil)

	slot3 = managers.savefile

	managers.savefile.save_setting(nil)

	return 
end
AchievmentManager.clear_all_steam = function (self)
	slot3 = "[AchievmentManager:clear_all_steam]"

	print(slot2)

	slot3 = self.handler

	if not self.handler.initialized(slot2) then
		slot3 = "[AchievmentManager:clear_steam] Achievments are not initialized. Cannot clear steam:"

		print(slot2)

		return 
	end

	slot4 = true
	local result = self.handler.clear_all_stats(slot2, self.handler)
	slot4 = self.handler

	self.handler.store_data(self.handler)

	return 
end
AchievmentManager.steam_unlock_result = function (achievment)
	slot3 = managers.achievment.achievments

	for id, ach in pairs(slot2) do
		if ach.id == achievment then
			slot9 = id

			managers.achievment._give_reward(slot7, managers.achievment)

			return 
		end
	end

	return 
end
AchievmentManager.award_x360 = function (self, id)
	slot5 = id

	print(slot3, "[AchievmentManager:award_x360] Awarded X360 achievment")

	local function x360_unlock_result(result)
		slot4 = result

		print(slot2, "result")

		if result then
			slot4 = id

			managers.achievment._give_reward(slot2, managers.achievment)
		end

		return 
	end

	slot10 = id
	slot8 = x360_unlock_result

	XboxLive.award_achievement("[AchievmentManager:award_x360] Awarded X360 achievment", XboxLive, managers.user.get_platform_id(slot7), self.get_info(managers.user, self).id)

	return 
end
AchievmentManager.award_psn = function (self, id)
	slot9 = id
	slot6 = self.get_info(slot7, self).id

	print(slot3, "[AchievmentManager:award] Awarded PSN achievment", id)

	if not self._trophies_installed then
		slot5 = id

		print(slot3, "[AchievmentManager:award] Trophies are not installed. Cannot award trophy:")

		return 
	end

	slot8 = id
	local request = Trophies.unlock_id(slot3, Trophies, self.get_info(AchievmentManager.psn_unlock_result, self).id)
	Global.achievment_manager.trophy_requests[request] = id

	return 
end
AchievmentManager.psn_unlock_result = function (request, error_str)
	slot6 = error_str

	print(slot3, "[AchievmentManager:psn_unlock_result] Awarded PSN achievment", request)

	local id = Global.achievment_manager.trophy_requests[request]

	if error_str == "success" then
		Global.achievment_manager.trophy_requests[request] = nil
		slot6 = id

		managers.achievment._give_reward(nil, managers.achievment)
	end

	return 
end
AchievmentManager.chk_install_trophies = function (self)
	slot3 = Trophies

	if Trophies.is_installed(slot2) then
		slot3 = "[AchievmentManager:chk_install_trophies] Already installed"

		print(slot2)

		self._trophies_installed = true
		slot4 = self.unlockstate_result

		Trophies.get_unlockstate(slot2, Trophies)

		slot3 = self

		self.fetch_trophies(slot2)
	else
		slot3 = managers.dlc

		if managers.dlc.has_full_game(slot2) then
			slot3 = "[AchievmentManager:chk_install_trophies] Installing"

			print(slot2)

			slot3 = Trophies
			slot8 = "clbk_install_trophies"

			Trophies.install(slot2, callback(slot5, self, self))
		end
	end

	return 
end
AchievmentManager.clbk_install_trophies = function (self, result)
	slot5 = result

	print(slot3, "[AchievmentManager:clbk_install_trophies]")

	if result then
		self._trophies_installed = true
		slot4 = self

		self.fetch_trophies(slot3)
	end

	return 
end
AchievmentManager.check_achievement_complete_raid_with_4_different_classes = function (self)
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local peers = managers.network.session(slot2).all_peers(slot2)

	if peers and #peers == 4 then
		local classes = {}
		slot5 = peers

		for peer_id, peer in ipairs(slot4) do
			slot10 = peer
			local peer_outfit = peer.blackmarket_outfit(slot9)

			if peer_outfit and peer_outfit.skills then
				if classes[peer_outfit.skills] then
					return false
				end

				classes[peer_outfit.skills] = true
			else
				return false
			end
		end

		slot6 = "ach_every_player_different_class"

		managers.achievment.award(slot4, managers.achievment)
	end

	return 
end
AchievmentManager.check_achievement_complete_raid_with_no_kills = function (self)
	if managers.statistics._global.session.killed.total.count == 0 then
		slot4 = "ach_complete_raid_with_no_kills"

		managers.achievment.award(slot2, managers.achievment)
	end

	return 
end
AchievmentManager.check_achievement_kill_30_enemies_with_vehicle_on_bank_level = function (self)
	local is_bank_level = false
	slot4 = managers.raid_job
	local current_job = managers.raid_job.current_job(slot3)
	local bank_level_name = "gold_rush"

	if current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
		is_bank_level = current_job.job_id == bank_level_name
	elseif current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		local current_job_event_index = current_job.current_event
		is_bank_level = current_job.events_index[current_job_event_index] == bank_level_name
	end

	if 30 <= managers.statistics._global.session.killed_by_vehicle.count and is_bank_level then
		slot7 = "Treasury - Bumpy ride"

		managers.achievment.award(slot5, managers.achievment)
	end

	return 
end
AchievmentManager.check_achievement_operation_clear_sky_hardest = function (self, operation_save_data)
	slot4 = Network

	if Network.is_server(slot3) and operation_save_data.difficulty_id == tweak_data.hardest_difficulty.id and operation_save_data.current_job.job_id == "clear_skies" then
		slot5 = "ach_clear_skies_hardest"

		managers.achievment.award(slot3, managers.achievment)

		slot4 = managers.network
		slot6 = "ach_clear_skies_hardest"

		managers.network.session(slot3).send_to_peers(slot3, managers.network.session(slot3), "sync_award_achievement")
	end

	return 
end
AchievmentManager.check_achievement_operation_clear_sky_no_bleedout = function (self, operation_save_data)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if managers.network.session(slot3).count_all_peers(slot3) == 4 then
			local total_downed_count = 0

			if operation_save_data.current_job.job_id == "clear_skies" then
				slot5 = operation_save_data.events_index

				for events_index_index, events_index_level_name in ipairs(slot4) do
					local event_data = operation_save_data.event_data[events_index_index]
					slot11 = event_data.peer_data

					for peer_index, peer_data in pairs(slot10) do
						total_downed_count = total_downed_count + (peer_data.statistics.downs or 0)
					end
				end

				if total_downed_count <= 0 then
					slot6 = "ach_clear_skies_no_bleedout"

					managers.achievment.award(slot4, managers.achievment)

					slot5 = managers.network
					slot7 = "ach_clear_skies_no_bleedout"

					managers.network.session(slot4).send_to_peers(slot4, managers.network.session(slot4), "sync_award_achievement")

					if operation_save_data.difficulty_id == tweak_data.hardest_difficulty.id then
						slot6 = "ach_clear_skies_hardest_no_bleedout"

						managers.achievment.award(slot4, managers.achievment)

						slot5 = managers.network
						slot7 = "ach_clear_skies_hardest_no_bleedout"

						managers.network.session(slot4).send_to_peers(slot4, managers.network.session(slot4), "sync_award_achievement")
					end
				end
			end
		end
	end

	return 
end
AchievmentManager.check_achievement_operation_burn_hardest = function (self, operation_save_data)
	slot4 = Network

	if Network.is_server(slot3) and operation_save_data.difficulty_id == tweak_data.hardest_difficulty.id and operation_save_data.current_job.job_id == "oper_flamable" then
		slot5 = "ach_burn_hardest"

		managers.achievment.award(slot3, managers.achievment)

		slot4 = managers.network
		slot6 = "ach_burn_hardest"

		managers.network.session(slot3).send_to_peers(slot3, managers.network.session(slot3), "sync_award_achievement")
	end

	return 
end
AchievmentManager.check_achievement_operation_burn_no_bleedout = function (self, operation_save_data)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if managers.network.session(slot3).count_all_peers(slot3) == 4 then
			local total_downed_count = 0

			if operation_save_data.current_job.job_id == "oper_flamable" then
				slot5 = operation_save_data.events_index

				for events_index_index, events_index_level_name in ipairs(slot4) do
					local event_data = operation_save_data.event_data[events_index_index]
					slot11 = event_data.peer_data

					for peer_index, peer_data in pairs(slot10) do
						total_downed_count = total_downed_count + (peer_data.statistics.downs or 0)
					end
				end

				if total_downed_count <= 0 then
					slot6 = "ach_burn_no_bleedout"

					managers.achievment.award(slot4, managers.achievment)

					slot5 = managers.network
					slot7 = "ach_burn_no_bleedout"

					managers.network.session(slot4).send_to_peers(slot4, managers.network.session(slot4), "sync_award_achievement")

					if operation_save_data.difficulty_id == tweak_data.hardest_difficulty.id then
						slot6 = "ach_burn_hardest_no_bleedout"

						managers.achievment.award(slot4, managers.achievment)

						slot5 = managers.network
						slot7 = "ach_burn_hardest_no_bleedout"

						managers.network.session(slot4).send_to_peers(slot4, managers.network.session(slot4), "sync_award_achievement")
					end
				end
			end
		end
	end

	return 
end
AchievmentManager.check_achievement_group_bring_them_home = function (self, current_job_data)
	if current_job_data and current_job_data.job_type and current_job_data.job_type == OperationsTweakData.JOB_TYPE_RAID then
		if current_job_data.job_id == "flakturm" then
			slot5 = "ach_bring_them_home_flak"

			managers.achievment.award(slot3, managers.achievment)
		elseif current_job_data.job_id == "ger_bridge" then
			slot5 = "ach_bring_them_home_bridge"

			managers.achievment.award(slot3, managers.achievment)
		elseif current_job_data.job_id == "train_yard" then
			slot5 = "ach_bring_them_home_trainyard"

			managers.achievment.award(slot3, managers.achievment)
		elseif current_job_data.job_id == "gold_rush" then
			slot5 = "ach_bring_them_home_bank"

			managers.achievment.award(slot3, managers.achievment)
		elseif current_job_data.job_id == "settlement" then
			slot5 = "ach_bring_them_home_castle"

			managers.achievment.award(slot3, managers.achievment)
		elseif current_job_data.job_id == "radio_defense" then
			slot5 = "ach_bring_them_home_radiodefence"

			managers.achievment.award(slot3, managers.achievment)
		end
	end

	return 
end

return 
