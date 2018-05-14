WeaponSkillsManager = WeaponSkillsManager or class()
WeaponSkillsManager.VERSION = 85
WeaponSkillsManager.SCOPE_WEAPON_PART_TYPE = "scope"
WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE = "activate"
WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE = "deactivate"
function WeaponSkillsManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function WeaponSkillsManager:_setup(reset)
	if not Global.weapon_skills_manager or reset then
		Global.weapon_skills_manager = {
			version = WeaponSkillsManager.VERSION,
			reset_message = false,
			available_weapon_skill_points = 0,
			gained_weapon_skill_points = 0,
			weapon_skills_skill_tree = {}
		}
		slot4 = self

		self.set_character_default_weapon_skills()

		self._global = Global.weapon_skills_manager
	end

	self._global = Global.weapon_skills_manager

	return 
end
function WeaponSkillsManager:set_character_default_weapon_skills()
	slot4 = tweak_data.weapon_skills.skill_trees
	Global.weapon_skills_manager.weapon_skills_skill_tree = deep_clone(slot3)
	slot3 = Global.weapon_skills_manager.weapon_skills_skill_tree

	for weapon_name, skill_tree_data in pairs(deep_clone(slot3)) do
		if skill_tree_data.use_weapon_parts_cosmetics == nil then
			skill_tree_data.use_weapon_parts_cosmetics = true
		end
	end

	slot3 = self

	self._initialize_weapon_skill_challenges(slot2)

	return 
end
function WeaponSkillsManager:set_cosmetics_flag_for_weapon_id(weapon_id, use_cosmetics_flag)
	Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id].use_weapon_parts_cosmetics = use_cosmetics_flag

	return 
end
function WeaponSkillsManager:get_cosmetics_flag_for_weapon_id(weapon_id)
	local cosmetics_flag = nil

	if Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] then
		cosmetics_flag = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id].use_weapon_parts_cosmetics
	end

	return cosmetics_flag
end
function WeaponSkillsManager:_initialize_weapon_skill_challenges()
	slot3 = Global.weapon_skills_manager.weapon_skills_skill_tree

	for weapon_id, skill_tree in pairs(slot2) do
		for tier_index = 1, #skill_tree, 1 do
			local tier_skills = skill_tree[tier_index]
			slot13 = tier_skills

			for skill_index, skill in pairs(slot12) do
				if skill[1].challenge_tasks then
					slot22 = tier_index
					local challenge_id = weapon_id .. "_" .. skill[1].skill_name .. "_" .. tostring(slot21)
					slot21 = challenge_id

					if not managers.challenge.challenge_exists(skill[1].skill_name, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE) then
						local challenge_tasks = skill[1].challenge_tasks
						local challenge_callback = {
							target = "managers.weapon_skills",
							method = "on_weapon_challenge_completed",
							params = {
								weapon_id,
								tier_index,
								skill_index
							}
						}
						local challenge_data = {
							weapon = weapon_id,
							tier = tier_index,
							skill_index = skill_index
						}
						slot27 = challenge_data

						managers.challenge.create_challenge(slot21, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE, challenge_id, challenge_tasks, challenge_callback)
					else
						slot21 = challenge_id
						local tasks = managers.challenge.get_challenge(slot18, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE).tasks(slot18)
						slot20 = tasks

						for task_index, task in pairs(managers.challenge.get_challenge(slot18, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)) do
							local reminders = skill[1].challenge_tasks[task_index].reminders or {}
							slot27 = reminders

							task.set_reminders(slot25, task)

							local modifiers = skill[1].challenge_tasks[task_index].modifiers or {}
							slot28 = modifiers

							task.set_modifiers(slot26, task)
						end
					end

					skill[1].challenge_id = challenge_id
					skill[1].weapon_id = weapon_id
					skill[1].tier = tier_index
					skill[1].index_in_tier = skill_index

					if tier_skills[skill_index - 1] then
						slot21 = tier_skills[skill_index - 1][1].challenge_id
						slot19 = managers.challenge.get_challenge(slot18, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
						local previous_challenge_unlocked = managers.challenge.get_challenge(slot18, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE).completed(slot18)
					end

					if tier_index == 1 or previous_challenge_unlocked then
						skill[1].challenge_unlocked = true
					elseif skill_tree[tier_index - 1][skill_index] == nil then
						skill[1].challenge_unlocked = true
					else
						skill[1].challenge_unlocked = false
					end
				end
			end
		end
	end

	return 
end
function WeaponSkillsManager:activate_current_challenges_for_weapon(weapon_id)
	local weapon_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

	if not weapon_skill_tree then
		return 
	end

	for tier_index = 1, #weapon_skill_tree, 1 do
		local tier_skills = weapon_skill_tree[tier_index]
		slot12 = tier_index
		local tier_unlocked = managers.weapon_skills.is_weapon_tier_unlocked(slot9, managers.weapon_skills, weapon_id)

		if tier_unlocked then
			slot11 = tier_skills

			for skill_index, skill in pairs(slot10) do
				if skill[1].challenge_unlocked == true and not skill[1].active then
					slot18 = skill[1].challenge_id

					managers.challenge.activate_challenge(slot15, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
				end
			end
		end
	end

	return 
end
function WeaponSkillsManager:deactivate_challenges_for_weapon(weapon_id)
	local weapon_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

	if not weapon_skill_tree then
		return 
	end

	for tier_index = 1, #weapon_skill_tree, 1 do
		local tier_skills = weapon_skill_tree[tier_index]
		slot10 = tier_skills

		for skill_index, skill in pairs(slot9) do
			if skill[1].challenge_id then
				slot17 = skill[1].challenge_id

				managers.challenge.deactivate_challenge(slot14, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
			end
		end
	end

	return 
end
function WeaponSkillsManager:get_active_weapon_challenges_for_weapon(weapon_id)
	local weapon_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

	if not weapon_skill_tree then
		return 
	end

	local active_weapon_challenges = {}

	for tier_index = #weapon_skill_tree, 1, -1 do
		local tier_skills = weapon_skill_tree[tier_index]
		slot13 = tier_index
		local tier_unlocked = managers.weapon_skills.is_weapon_tier_unlocked(slot10, managers.weapon_skills, weapon_id)

		if tier_unlocked then
			slot12 = tier_skills

			for skill_index, skill in pairs(slot11) do
				if skill[1].challenge_unlocked then
					slot19 = skill[1].challenge_id
					slot17 = managers.challenge.get_challenge(slot16, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)

					if not managers.challenge.get_challenge(slot16, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE).completed(slot16) then
						slot18 = skill[1]

						table.insert(slot16, active_weapon_challenges)
					end
				end
			end
		end
	end

	return (0 < #active_weapon_challenges and active_weapon_challenges) or nil
end
function WeaponSkillsManager:update_weapon_challenges(weapon_id)
	if Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] then
		local skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

		for tier_index = 1, #skill_tree, 1 do
			local tier_skills = skill_tree[tier_index]
			slot10 = tier_skills

			for skill_index, skill in pairs(slot9) do
				if skill[1].challenge_id then
					local challenge_from_manager = managers.challenge._challenges[ChallengeManager.CATEGORY_WEAPON_UPGRADE][skill[1].challenge_id]

					if challenge_from_manager._state and challenge_from_manager._state ~= "completed" then
						local tweak_data_challenge_data = tweak_data.weapon_skills.skill_trees[weapon_id][tier_index][skill_index][1].challenge_tasks[1]
						skill[1].challenge_tasks[1].target = tweak_data_challenge_data.target
						skill[1].challenge_tasks[1].reminders = tweak_data_challenge_data.reminders
						challenge_from_manager._tasks[1]._target = tweak_data_challenge_data.target
						challenge_from_manager._tasks[1]._reminders = tweak_data_challenge_data.reminders

						if tweak_data_challenge_data.modifiers then
							challenge_from_manager._tasks[1]._modifiers = tweak_data_challenge_data.modifiers
							skill[1].challenge_tasks[1].modifiers = tweak_data_challenge_data.modifiers
						end

						if challenge_from_manager._tasks[1]._target <= challenge_from_manager._tasks[1]._count then
							slot18 = "[WeaponSkillsManager:update_weapon_challenges] Target for new Weapon challenge already met! Challenge_id: " .. skill[1].challenge_id .. ", Count is: " .. challenge_from_manager._tasks[1]._count .. " ,  New target is: " .. challenge_from_manager._tasks[1]._target .. ", Forcing a challenge completetion"

							Application.trace(slot16, Application)

							challenge_from_manager._tasks[1]._count = challenge_from_manager._tasks[1]._target
							slot17 = challenge_from_manager

							challenge_from_manager.force_complete(challenge_from_manager._tasks[1]._target)
						end
					end
				end
			end
		end
	end

	slot4 = managers.savefile

	managers.savefile.set_resave_required(slot3)

	return 
end
function WeaponSkillsManager:check_weapon_challenges_for_changes(weapon_id)
	local challenges_changed = false

	if Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] then
		local skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

		for tier_index = 1, #skill_tree, 1 do
			local tier_skills = skill_tree[tier_index]
			slot11 = tier_skills

			for skill_index, skill in pairs(slot10) do
				if skill[1].challenge_id then
					local tweak_data_challenge_data = tweak_data.weapon_skills.skill_trees[weapon_id][tier_index][skill_index][1].challenge_tasks[1]
					local challenge_from_manager = managers.challenge._challenges[ChallengeManager.CATEGORY_WEAPON_UPGRADE][skill[1].challenge_id]

					for i = 1, #tweak_data_challenge_data.reminders, 1 do
						if skill[1].challenge_tasks[1].reminders[i] ~= tweak_data_challenge_data.reminders[i] then
							challenges_changed = true
							slot24 = skill[1].challenge_tasks[1].reminders[i]
							slot26 = tweak_data_challenge_data.reminders[i]
							slot22 = inspect(slot23) .. ", " .. inspect(slot25)

							print(slot21)
						end

						if challenge_from_manager._tasks[1]._reminders[i] ~= tweak_data_challenge_data.reminders[i] then
							challenges_changed = true
							slot22 = challenge_from_manager._tasks[1]._reminders[i] .. ", " .. tweak_data_challenge_data.reminders[i]

							print(slot21)
						end
					end

					if tweak_data_challenge_data.modifiers then
						slot18 = tweak_data_challenge_data.modifiers

						for modifier, _ in pairs(slot17) do
							if modifier ~= "enemy_type" then
								if challenge_from_manager._tasks[1]._modifiers[modifier] ~= tweak_data_challenge_data.modifiers[modifier] then
									challenges_changed = true
									slot25 = challenge_from_manager._tasks[1]._modifiers[modifier]
									slot27 = tweak_data_challenge_data.modifiers[modifier]
									slot23 = inspect(slot24) .. ", " .. inspect(slot26)

									print(slot22)
								end

								if skill[1].challenge_tasks[1].modifiers[modifier] ~= tweak_data_challenge_data.modifiers[modifier] then
									challenges_changed = true
									slot25 = skill[1].challenge_tasks[1].modifiers[modifier]
									slot27 = skill[1].challenge_tasks[1].modifiers[modifier]
									slot23 = inspect(slot24) .. ", " .. inspect(slot26)

									print(slot22)
								end
							else
								if challenge_from_manager._tasks[1]._modifiers[modifier][1] ~= tweak_data_challenge_data.modifiers[modifier][1] then
									challenges_changed = true
									slot25 = challenge_from_manager._tasks[1]._modifiers[modifier]
									slot27 = tweak_data_challenge_data.modifiers[modifier]
									slot23 = inspect(slot24) .. ", " .. inspect(slot26)

									print(slot22)
								end

								if skill[1].challenge_tasks[1].modifiers[modifier][1] ~= tweak_data_challenge_data.modifiers[modifier][1] then
									challenges_changed = true
									slot25 = skill[1].challenge_tasks[1].modifiers[modifier]
									slot27 = skill[1].challenge_tasks[1].modifiers[modifier]
									slot23 = inspect(slot24) .. ", " .. inspect(slot26)

									print(slot22)
								end
							end
						end
					end

					if skill[1].challenge_tasks[1].target ~= tweak_data_challenge_data.target then
						challenges_changed = true
						slot18 = skill[1].challenge_tasks[1].target .. ", " .. tweak_data_challenge_data.target

						print(slot17)
					end

					if challenge_from_manager._tasks[1]._target ~= tweak_data_challenge_data.target then
						challenges_changed = true
						slot18 = challenge_from_manager._tasks[1]._target .. ", " .. tweak_data_challenge_data.target

						print(slot17)
					end
				end
			end
		end
	end

	return challenges_changed
end
function WeaponSkillsManager:remind_weapon_challenge(weapon_id, tier_index, skill_index)
	local weapon_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]
	local notification_data = {
		priority = 1,
		duration = 4,
		id = weapon_skill_tree[tier_index][skill_index][1],
		notification_type = HUDNotification.WEAPON_CHALLENGE,
		challenge = weapon_skill_tree[tier_index][skill_index][1]
	}
	slot9 = notification_data

	managers.notification.add_notification(slot7, managers.notification)

	return 
end
function WeaponSkillsManager:on_weapon_challenge_completed(weapon_id, tier_index, skill_index)
	local weapon_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]
	local notification_data = {
		priority = 1,
		duration = 4,
		id = weapon_skill_tree[tier_index][skill_index][1],
		notification_type = HUDNotification.WEAPON_CHALLENGE,
		challenge = weapon_skill_tree[tier_index][skill_index][1]
	}
	slot9 = notification_data

	managers.notification.add_notification(slot7, managers.notification)

	local weapon_selection_index = tweak_data.weapon[weapon_id].use_data.selection_index
	slot10 = weapon_selection_index
	local weapon_category = managers.weapon_inventory.get_weapon_category_name_by_bm_category_id(managers.notification, managers.weapon_inventory)
	slot11 = "weapon_challenge_complete"

	managers.hud._sound_source.post_event(managers.weapon_inventory, managers.hud._sound_source)

	slot12 = {
		weapon_category,
		weapon_id,
		tier_index,
		skill_index
	}

	managers.breadcrumb.add_breadcrumb(managers.weapon_inventory, managers.breadcrumb, BreadcrumbManager.CATEGORY_WEAPON_UPGRADE)

	slot11 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(managers.weapon_inventory, managers.savefile)

	return 
end
function WeaponSkillsManager:has_new_weapon_upgrades(params)
	if not params or not params.weapon_category or params.weapon_category == WeaponInventoryManager.CATEGORY_NAME_PRIMARY then
		slot5 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID
		local owned_primary_weapons = managers.weapon_inventory.get_owned_weapons(slot3, managers.weapon_inventory)
		slot5 = owned_primary_weapons

		for index, weapon in pairs(managers.weapon_inventory) do
			if weapon.unlocked then
				slot12 = {
					WeaponInventoryManager.CATEGORY_NAME_PRIMARY,
					weapon.weapon_id
				}

				if managers.breadcrumb.category_has_breadcrumbs(slot9, managers.breadcrumb, BreadcrumbManager.CATEGORY_WEAPON_UPGRADE) and (not params or not params.weapon_id or params.weapon_id == weapon.weapon_id) then
					return true
				end
			end
		end
	end

	if not params or not params.weapon_category or params.weapon_category == WeaponInventoryManager.CATEGORY_NAME_SECONDARY then
		slot5 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID
		local owned_secondary_weapons = managers.weapon_inventory.get_owned_weapons(slot3, managers.weapon_inventory)
		slot5 = owned_secondary_weapons

		for index, weapon in pairs(managers.weapon_inventory) do
			if weapon.unlocked then
				slot12 = {
					WeaponInventoryManager.CATEGORY_NAME_SECONDARY,
					weapon.weapon_id
				}

				if managers.breadcrumb.category_has_breadcrumbs(slot9, managers.breadcrumb, BreadcrumbManager.CATEGORY_WEAPON_UPGRADE) and (not params or not params.weapon_id or params.weapon_id == weapon.weapon_id) then
					return true
				end
			end
		end
	end

	return false
end
function WeaponSkillsManager:is_weapon_skills_tree_empty()
	local result = true

	if Global.weapon_skills_manager and Global.weapon_skills_manager.weapon_skills_skill_tree then
		slot4 = Global.weapon_skills_manager.weapon_skills_skill_tree

		for index, data in pairs(slot3) do
			result = false

			break
		end
	end

	return result
end
function WeaponSkillsManager:get_weapon_skills(weapon_id)
	local skill_tree = self._global.weapon_skills_skill_tree[weapon_id]

	return skill_tree
end
function WeaponSkillsManager:get_available_weapon_skill_points()
	return Global.weapon_skills_manager.available_weapon_skill_points
end
function WeaponSkillsManager:set_available_weapon_skill_points(value)
	Global.weapon_skills_manager.available_weapon_skill_points = value

	return 
end
function WeaponSkillsManager:add_available_weapon_skill_points(value)
	if not Global.weapon_skills_manager.available_weapon_skill_points then
		Global.weapon_skills_manager.available_weapon_skill_points = 0
	end

	Global.weapon_skills_manager.available_weapon_skill_points = Global.weapon_skills_manager.available_weapon_skill_points + value

	return 
end
function WeaponSkillsManager:add_weapon_skill_points_as_drops(value)
	if not Global.weapon_skills_manager.gained_weapon_skill_points then
		Global.weapon_skills_manager.gained_weapon_skill_points = 0
	end

	Global.weapon_skills_manager.gained_weapon_skill_points = Global.weapon_skills_manager.gained_weapon_skill_points + value
	slot5 = value

	self.add_available_weapon_skill_points(Global.weapon_skills_manager.gained_weapon_skill_points + value, self)

	return 
end
function WeaponSkillsManager:remove_weapon_skill_points_as_drops(value)
	Global.weapon_skills_manager.gained_weapon_skill_points = Global.weapon_skills_manager.gained_weapon_skill_points - value

	if Global.weapon_skills_manager.gained_weapon_skill_points < 0 then
		Global.weapon_skills_manager.gained_weapon_skill_points = 0
	end

	slot5 = Global.weapon_skills_manager.available_weapon_skill_points - value

	self.set_available_weapon_skill_points(slot3, self)

	slot4 = self

	if self.get_available_weapon_skill_points(slot3) < 0 then
		slot5 = 0

		self.set_available_weapon_skill_points(slot3, self)
	end

	return 
end
function WeaponSkillsManager:apply_skill(weapon_id, tier_number, tier_skill_number)
	local weapon_skills = self._global.weapon_skills_skill_tree[weapon_id][tier_number][tier_skill_number]
	weapon_skills[1].active = true

	if self._global.weapon_skills_skill_tree[weapon_id][tier_number + 1] and self._global.weapon_skills_skill_tree[weapon_id][tier_number + 1][tier_skill_number] then
		self._global.weapon_skills_skill_tree[weapon_id][tier_number + 1][tier_skill_number][1].challenge_unlocked = true
	end

	return 
end
function WeaponSkillsManager:activate_skill(weapon_skill, bm_weapon_category_id)
	weapon_skill.active = true
	local weapon_id = weapon_skill.weapon_id
	local tier = weapon_skill.tier
	local index_in_tier = weapon_skill.index_in_tier

	if self._global.weapon_skills_skill_tree[weapon_id][tier + 1] and self._global.weapon_skills_skill_tree[weapon_id][tier + 1][index_in_tier] then
		self._global.weapon_skills_skill_tree[weapon_id][tier + 1][index_in_tier][1].challenge_unlocked = true
	end

	slot9 = "ach_weap_apply_upgrade"

	managers.achievment.award(slot7, managers.achievment)

	slot9 = weapon_id
	local is_weapon_fully_upgraded, weapon_tier_count = managers.weapon_skills.is_weapon_fully_upgraded(slot7, managers.weapon_skills)

	if is_weapon_fully_upgraded then
		if bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID and weapon_tier_count == 4 then
			slot11 = "ach_weap_prim_apply_all_upgrades"

			managers.achievment.award(slot9, managers.achievment)
		elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
			slot11 = "ach_weap_sec_apply_all_upgrades"

			managers.achievment.award(slot9, managers.achievment)
		end
	end

	return 
end
function WeaponSkillsManager:deactivate_skill(weapon_skill)
	weapon_skill.active = nil

	return 
end
function WeaponSkillsManager:is_skill_active(weapon_id, tier_number, tier_skill_number)
	local weapon_skill = self._global.weapon_skills_skill_tree[weapon_id][tier_number][tier_skill_number]

	return weapon_skill and weapon_skill.active
end
function WeaponSkillsManager:get_weapon_skills_skill_tree()
	return Global.weapon_skills_manager.weapon_skills_skill_tree
end
function WeaponSkillsManager:is_weapon_fully_upgraded(weapon_id)
	local weapon_skill_tree = managers.weapon_skills._global.weapon_skills_skill_tree[weapon_id]
	local result = true
	local weapon_tier_count = 0

	if weapon_skill_tree then
		slot7 = weapon_skill_tree

		for tier_counter, tier_data in ipairs(slot6) do
			slot12 = tier_data

			for tier_skill_counter, tier_skill_data in pairs(slot11) do
				local skill_data = tier_skill_data[1]

				if not skill_data or (skill_data and not skill_data.active) then
					result = false

					break
				end
			end

			weapon_tier_count = weapon_tier_count + 1
		end
	end

	return result, weapon_tier_count
end
function WeaponSkillsManager:update_weapon_skills(weapon_category_id, weapon_id, action)
	local weapon_skills = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

	if not weapon_skills then
		slot11 = action

		Application.error(slot6, Application, "[WeaponSkillsManager:update_weapon_skills] Trying to update weapons skills for a weapon without a skill tree: ", weapon_category_id, weapon_id)

		return 
	end

	for tier_counter = 1, #weapon_skills, 1 do
		for tier_skill_counter = 1, #weapon_skills[tier_counter], 1 do
			local skill_data = weapon_skills[tier_counter][tier_skill_counter][1]

			if not self._temp_weapon_skills then
				self._temp_weapon_skills = {}
			end

			if skill_data.active then
				if not self._temp_weapon_skills[skill_data.skill_name] then
					self._temp_weapon_skills[skill_data.skill_name] = {
						value = skill_data.value
					}
				else
					self._temp_weapon_skills[skill_data.skill_name].value = skill_data.value
				end
			end
		end
	end

	if self._temp_weapon_skills then
		slot7 = self._temp_weapon_skills

		for upgrade_name, count_data in pairs(slot6) do
			slot16 = action

			self.update_weapon_skill(slot11, self, upgrade_name, count_data, weapon_category_id)
		end
	end

	self._temp_weapon_skills = nil

	return 
end
function WeaponSkillsManager:_clear_all_weapon_part_animation_weights()
	slot3 = managers.player

	if not managers.player.local_player(slot2) then
		return 
	end

	slot3 = tweak_data.weapon._all_fps_animation_weights

	for _, weapon_part_anim in ipairs(slot2) do
		slot8 = managers.player
		slot8 = managers.player.local_player(slot7)
		slot8 = managers.player.local_player(slot7).camera(slot7)
		slot8 = managers.player.local_player(slot7).camera(slot7).camera_unit(slot7)
		slot10 = 0

		managers.player.local_player(slot7).camera(slot7).camera_unit(slot7).anim_state_machine(slot7).set_global(slot7, managers.player.local_player(slot7).camera(slot7).camera_unit(slot7).anim_state_machine(slot7), weapon_part_anim)

		slot10 = weapon_part_anim

		Application.trace(slot7, Application, "TURNING OFF WEAPON PART ANIM: ")
	end

	return 
end
function WeaponSkillsManager:update_weapon_part_animation_weights()
	slot3 = managers.player

	if not managers.player.local_player(slot2) then
		return 
	end

	slot3 = self

	self._clear_all_weapon_part_animation_weights(slot2)

	local equipped_primary_weapon_data = managers.weapon_inventory.get_equipped_primary_weapon(slot2)
	local equipped_secondary_weapon_data = managers.weapon_inventory.get_equipped_secondary_weapon(managers.weapon_inventory)
	slot5 = equipped_primary_weapon_data.blueprint

	for _, weapon_part_name in ipairs(managers.weapon_inventory) do
		local weapon_part_data = tweak_data.weapon.factory.parts[weapon_part_name]

		if weapon_part_data and weapon_part_data.fps_animation_weight then
			slot11 = managers.player
			slot11 = managers.player.local_player(slot10)
			slot11 = managers.player.local_player(slot10).camera(slot10)
			slot11 = managers.player.local_player(slot10).camera(slot10).camera_unit(slot10)
			slot13 = 1

			managers.player.local_player(slot10).camera(slot10).camera_unit(slot10).anim_state_machine(slot10).set_global(slot10, managers.player.local_player(slot10).camera(slot10).camera_unit(slot10).anim_state_machine(slot10), weapon_part_data.fps_animation_weight)

			slot13 = weapon_part_data.fps_animation_weight

			Application.trace(slot10, Application, "TURNING ON WEAPON PART ANIM: ")
		end
	end

	slot5 = equipped_secondary_weapon_data.blueprint

	for _, weapon_part_name in ipairs(slot4) do
		local weapon_part_data = tweak_data.weapon.factory.parts[weapon_part_name]

		if weapon_part_data and weapon_part_data.fps_animation_weight then
			slot11 = managers.player
			slot11 = managers.player.local_player(slot10)
			slot11 = managers.player.local_player(slot10).camera(slot10)
			slot11 = managers.player.local_player(slot10).camera(slot10).camera_unit(slot10)
			slot13 = 1

			managers.player.local_player(slot10).camera(slot10).camera_unit(slot10).anim_state_machine(slot10).set_global(slot10, managers.player.local_player(slot10).camera(slot10).camera_unit(slot10).anim_state_machine(slot10), weapon_part_data.fps_animation_weight)

			slot13 = weapon_part_data.fps_animation_weight

			Application.trace(slot10, Application, "TURNING ON WEAPON PART ANIM: ")
		end
	end

	return 
end
function WeaponSkillsManager:update_weapon_skill(raid_stat_name, data, weapon_category_id, action)
	slot8 = raid_stat_name
	local upgrade_name = self.get_upgrade_name_from_raid_stat_name(slot6, self)
	local weapon_category_string = (weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID and "primary_weapon") or "secondary_weapon"
	local upgrade_full_name = weapon_category_string .. "_" .. upgrade_name .. "_" .. data.value

	if action == WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE then
		slot12 = weapon_category_id
		local upgrade_level = self.get_weapon_skills_current_upgrade_level(slot9, self, raid_stat_name)

		if 0 < upgrade_level then
			slot15 = WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE

			self.update_weapon_skill(slot10, self, raid_stat_name, data, weapon_category_id)
		end

		slot12 = "ACTIVATE UPGRADE: >>" .. upgrade_full_name .. "<<"

		Application.trace(slot10, Application)

		slot14 = UpgradesManager.AQUIRE_STRINGS[6]

		managers.upgrades.aquire(slot10, managers.upgrades, upgrade_full_name, nil)
	elseif action == WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE then
		slot11 = "DEACTIVATE UPGRADE: >>" .. upgrade_full_name .. "<<"

		Application.trace(slot9, Application)

		slot12 = UpgradesManager.AQUIRE_STRINGS[6]

		managers.upgrades.unaquire(slot9, managers.upgrades, upgrade_full_name)
	end

	return 
end
function WeaponSkillsManager:update_weapon_skill_by_upgrade_name(upgrade_category, upgrade_name, upgrade_level, action)
	local upgrade_full_name = upgrade_category .. "_" .. upgrade_name .. "_" .. upgrade_level

	if action == WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE then
		slot11 = 0
		local upgrade_level = managers.player.upgrade_level(slot7, managers.player, upgrade_category, upgrade_name)

		if 0 < upgrade_level then
			slot11 = UpgradesManager.AQUIRE_STRINGS[6]

			managers.upgrades.unaquire(slot8, managers.upgrades, upgrade_full_name)
		end

		slot12 = UpgradesManager.AQUIRE_STRINGS[6]

		managers.upgrades.aquire(slot8, managers.upgrades, upgrade_full_name, nil)
	elseif action == WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE then
		slot10 = UpgradesManager.AQUIRE_STRINGS[6]

		managers.upgrades.unaquire(slot7, managers.upgrades, upgrade_full_name)
	end

	return 
end
function WeaponSkillsManager:get_upgrade_name_from_raid_stat_name(raid_stat_name)
	local upgrade_name = ""

	if raid_stat_name == WeaponSkillsTweakData.SKILL_INCREASE_DAMAGE then
		upgrade_name = "damage_multiplier"
	elseif raid_stat_name == WeaponSkillsTweakData.SKILL_DECREASE_RECOIL then
		upgrade_name = "recoil_reduction"
	elseif raid_stat_name == WeaponSkillsTweakData.SKILL_FASTER_RELOAD then
		upgrade_name = "reload_speed_multiplier"
	elseif raid_stat_name == WeaponSkillsTweakData.SKILL_FASTER_ADS then
		upgrade_name = "enter_steelsight_speed_multiplier"
	elseif raid_stat_name == WeaponSkillsTweakData.SKILL_TIGHTER_SPREAD then
		upgrade_name = "spread_multiplier"
	elseif raid_stat_name == WeaponSkillsTweakData.SKILL_INCREASE_MAGAZINE then
		upgrade_name = "magazine_upgrade"
	end

	return upgrade_name
end
function WeaponSkillsManager:get_character_level_needed_for_tier(weapon_id, tier)
	slot5 = self
	local skill_tree = self.get_weapon_skills_skill_tree(slot4)
	local upgrade_name = (skill_tree[weapon_id] and skill_tree[weapon_id].tier_unlock and skill_tree[weapon_id].tier_unlock[tier]) or ""

	if tier < WeaponSkillsTweakData.MAX_TIERS then
		slot9 = tier
		upgrade_name = upgrade_name .. "_" .. tostring(slot8)
	end

	local max_level = 0
	local character_automatic_progression = managers.skilltree.get_character_automatic_unlock_progression(slot7)
	slot9 = character_automatic_progression

	for level, level_unlocks in pairs(managers.skilltree) do
		slot14 = level_unlocks

		for category_name, category in pairs(slot13) do
			slot19 = category

			for index, unlock in pairs(slot18) do
				if unlock == upgrade_name then
					return level
				end
			end
		end

		slot15 = level
		max_level = math.max(slot13, max_level)
	end

	local current_character_class = managers.skilltree.get_character_profile_class(slot8)
	slot10 = tweak_data.skilltree.base_classes

	for index, class_name_id in ipairs(managers.skilltree) do
		if class_name_id ~= current_character_class then
			slot16 = tweak_data.skilltree.classes[class_name_id].name_id
			local class_name = managers.localization.text(slot14, managers.localization)
			slot17 = class_name_id
			local class_automatic_progression = managers.skilltree.get_character_automatic_unlock_progression(managers.localization, managers.skilltree)
			slot17 = class_automatic_progression

			for level, level_unlocks in pairs(managers.skilltree) do
				slot22 = level_unlocks

				for category_name, category in pairs(slot21) do
					slot27 = category

					for index, unlock in pairs(slot26) do
						if unlock == upgrade_name then
							return level, class_name
						end
					end
				end
			end
		end
	end

	slot13 = tier

	Application.error(slot9, Application, "[WeaponSkillsManager] Could not find unlock level for weapon: ", weapon_id)

	return max_level
end
function WeaponSkillsManager:is_weapon_tier_unlocked(weapon_id, tier)
	local result = false
	slot6 = self
	local skill_tree = self.get_weapon_skills_skill_tree(slot5)
	local upgrade_name = (skill_tree[weapon_id] and skill_tree[weapon_id].tier_unlock and skill_tree[weapon_id].tier_unlock[tier]) or ""

	if upgrade_name == "" then
		result = true
	elseif upgrade_name == "weapon_tier_unlocked" then
		slot11 = 1
		local unlocked_tier = managers.player.upgrade_value(slot7, managers.player, "player", "weapon_tier_unlocked")

		if tier <= unlocked_tier then
			result = true
		end
	elseif upgrade_name == "recon_tier_4_unlocked" or upgrade_name == "assault_tier_4_unlocked" or upgrade_name == "infiltrator_tier_4_unlocked" or upgrade_name == "demolitions_tier_4_unlocked" then
		slot11 = false
		local tier_4_result = managers.player.upgrade_value(slot7, managers.player, "player", upgrade_name)
		result = tier_4_result ~= 0
	end

	return result
end
function WeaponSkillsManager:get_weapon_skills_current_upgrade_level(raid_stat_name, weapon_category_id)
	local weapon_category_string = (weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID and "primary_weapon") or "secondary_weapon"
	slot7 = raid_stat_name
	local upgrade_name = self.get_upgrade_name_from_raid_stat_name(slot5, self)
	slot10 = 0
	local upgrade_level = managers.player.upgrade_level(self, managers.player, weapon_category_string, upgrade_name)

	return upgrade_level
end
function WeaponSkillsManager:deactivate_all_upgrades_for_bm_weapon_category_id(weapon_category_id)
	local upgrades_table = nil
	local weapon_category_name = ""

	if weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		upgrades_table = tweak_data.upgrades.values.primary_weapon
		weapon_category_name = "primary_weapon"
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		upgrades_table = tweak_data.upgrades.values.secondary_weapon
		weapon_category_name = "secondary_weapon"
	end

	if not upgrades_table or weapon_category_name == "" then
		return 
	end

	slot6 = upgrades_table

	for upgrade_name, upgrade_values in pairs(slot5) do
		slot14 = 0
		local current_upgrade_level = managers.player.upgrade_level(slot10, managers.player, weapon_category_name, upgrade_name)

		if 0 < current_upgrade_level then
			local upgrade_full_name = weapon_category_name .. "_" .. upgrade_name .. "_" .. current_upgrade_level
			slot15 = UpgradesManager.AQUIRE_STRINGS[6]

			managers.upgrades.unaquire(upgrade_name, managers.upgrades, upgrade_full_name)

			slot14 = "WeaponSkillsManager:deactivate_all_upgrades_for_bm_weapon_category_id] unaquire upgrade_full_name "

			Application.trace(upgrade_name, Application)
		end
	end

	return 
end
function WeaponSkillsManager:get_player_using_scope(weapon_id)
	return (Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] and Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id].use_scope) or false
end
function WeaponSkillsManager:set_player_using_scope(weapon_id, flag)
	Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id].use_scope = flag

	return 
end
function WeaponSkillsManager:get_scope_weapon_part_name(weapon_id)
	local result = nil

	if weapon_id == "mp44" then
		slot6 = "mp44"

		if managers.weapon_skills.get_weapon_skills(slot4, managers.weapon_skills)[2][4][1].active ~= true then
			return result
		end
	end

	slot6 = weapon_id
	local factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot4, managers.weapon_factory)

	if tweak_data.weapon.factory[factory_id] and tweak_data.weapon.factory[factory_id].uses_parts then
		slot6 = tweak_data.weapon.factory[factory_id].uses_parts

		for _, weapon_part_name in ipairs(slot5) do
			if tweak_data.weapon.factory.parts[weapon_part_name].type == WeaponSkillsManager.SCOPE_WEAPON_PART_TYPE then
				result = weapon_part_name

				break
			end
		end
	end

	return result
end
function WeaponSkillsManager:save(data)
	local state = {
		version = Global.weapon_skills_manager.version,
		available_weapon_skill_points = Global.weapon_skills_manager.available_weapon_skill_points,
		weapon_skills_skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree,
		gained_weapon_skill_points = Global.weapon_skills_manager.gained_weapon_skill_points
	}
	data.WeaponSkillsManager = state

	return 
end
function WeaponSkillsManager:load(data, version)
	slot6 = true

	self._setup(slot4, self)

	local state = data.WeaponSkillsManager

	if not state then
		return 
	end

	if not state.version or (state.version and state.version ~= WeaponSkillsManager.VERSION) then
		slot7 = "[WeaponSkillsManager:load] The save data and manager version are mismatched! Migrating..."

		Application.trace(slot5, Application)

		Global.weapon_skills_manager.version = WeaponSkillsManager.VERSION
		Global.weapon_skills_manager.available_weapon_skill_points = state.gained_weapon_skill_points or 0
		Global.weapon_skills_manager.gained_weapon_skill_points = state.gained_weapon_skill_points or 0
		slot6 = self

		self.set_character_default_weapon_skills(state.gained_weapon_skill_points or 0)

		slot6 = managers.savefile

		managers.savefile.set_resave_required(state.gained_weapon_skill_points or 0)
	else
		Global.weapon_skills_manager.version = state.version or 1
		Global.weapon_skills_manager.available_weapon_skill_points = state.available_weapon_skill_points or 0
		Global.weapon_skills_manager.gained_weapon_skill_points = state.gained_weapon_skill_points or 0
		slot4 = Global.weapon_skills_manager

		if not state.weapon_skills_skill_tree then
			slot7 = tweak_data.weapon_skills.skill_trees
			slot5 = deep_clone(slot6)
		end

		slot4.weapon_skills_skill_tree = slot5
		local new_weapon_added = false
		slot7 = tweak_data.weapon_skills.skill_trees

		for weapon_id, weapon_skill_tree_data in pairs(slot6) do
			if not Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] then
				slot13 = weapon_skill_tree_data
				Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] = deep_clone(slot12)
				local skill_tree = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id]

				for tier_index = 1, #skill_tree, 1 do
					local tier_skills = skill_tree[tier_index]
					slot18 = tier_skills

					for skill_index, skill in pairs(slot17) do
						if skill[1].challenge_tasks then
							slot27 = tier_index
							local challenge_id = weapon_id .. "_" .. skill[1].skill_name .. "_" .. tostring(slot26)
							local challenge_tasks = skill[1].challenge_tasks
							local challenge_callback = {
								target = "managers.weapon_skills",
								method = "on_weapon_challenge_completed",
								params = {
									weapon_id,
									tier_index,
									skill_index
								}
							}
							local challenge_data = {
								weapon = weapon_id,
								tier = tier_index,
								skill_index = skill_index
							}
							slot32 = challenge_data

							managers.challenge.create_challenge(slot26, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE, challenge_id, challenge_tasks, challenge_callback)

							skill[1].challenge_id = challenge_id
							skill[1].weapon_id = weapon_id
							skill[1].tier = tier_index
							skill[1].index_in_tier = skill_index

							if tier_skills[skill_index - 1] then
								slot29 = tier_skills[skill_index - 1][1].challenge_id
								slot27 = managers.challenge.get_challenge(slot26, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
								local previous_challenge_unlocked = managers.challenge.get_challenge(slot26, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE).completed(slot26)
							end

							if tier_index == 1 or previous_challenge_unlocked then
								skill[1].challenge_unlocked = true
							elseif skill_tree[tier_index - 1][skill_index] == nil then
								skill[1].challenge_unlocked = true
							else
								skill[1].challenge_unlocked = false
							end
						end
					end
				end

				new_weapon_added = true
			else
				slot13 = weapon_id

				if managers.weapon_skills.check_weapon_challenges_for_changes(slot11, managers.weapon_skills) then
					slot13 = "[WeaponSkillsManager:load] Weapon challenges for " .. weapon_id .. " are mismatched, Updating..."

					Application.trace(slot11, Application)

					slot13 = weapon_id

					managers.weapon_skills.update_weapon_challenges(slot11, managers.weapon_skills)
				end
			end
		end

		if new_weapon_added then
			slot7 = managers.savefile

			managers.savefile.set_resave_required(slot6)
		end
	end

	slot6 = Global.weapon_skills_manager.weapon_skills_skill_tree

	for weapon_name, skill_tree_data in pairs(slot5) do
		if skill_tree_data.use_weapon_parts_cosmetics == nil then
			skill_tree_data.use_weapon_parts_cosmetics = true
		end
	end

	slot6 = self

	self._force_complete_stuck_weapon_challenges(slot5)

	slot10 = managers.weapon_inventory

	self.update_weapon_skills(slot5, self, WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID, managers.weapon_inventory.get_equipped_primary_weapon_id(slot9))

	slot10 = managers.weapon_inventory
	slot9 = "activate"

	self.update_weapon_skills(slot5, self, WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID, managers.weapon_inventory.get_equipped_secondary_weapon_id("activate"))

	return 
end
function WeaponSkillsManager:_force_complete_stuck_weapon_challenges()
	local need_resave = false
	slot4 = Global.weapon_skills_manager.weapon_skills_skill_tree

	for weapon_id, weapon_skill_tree in pairs(slot3) do
		slot9 = weapon_skill_tree

		for tier_index, tier_skill_data in ipairs(slot8) do
			slot14 = tier_skill_data

			for skill_index, skill_data in pairs(slot13) do
				slot19 = skill_data

				for mod_index, mod_data in pairs(slot18) do
					if mod_data.active == true then
						slot26 = mod_data.challenge_id
						local challenge = managers.challenge.get_challenge(slot23, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
						slot25 = challenge

						if not challenge.completed(managers.challenge) then
							slot28 = skill_index

							debug_pause(slot24, "[WeaponSkillsManager][_force_complete_stuck_weapon_challenges] Stuck weapon challenge found: ", weapon_id, tier_index)

							slot25 = challenge

							challenge.force_complete(slot24)

							need_resave = true
						end
					end
				end
			end
		end
	end

	if need_resave then
		slot5 = SavefileManager.SETTING_SLOT

		managers.savefile.save_game(slot3, managers.savefile)
	end

	return 
end
function WeaponSkillsManager:recreate_all_weapons_blueprints(weapon_category_id)
	slot5 = weapon_category_id
	local datasource = managers.weapon_inventory.get_owned_weapons(slot3, managers.weapon_inventory)
	slot5 = datasource

	for index, weapon_data in pairs(managers.weapon_inventory) do
		slot14 = true

		self.recreate_weapon_blueprint(slot9, self, weapon_data.weapon_id, weapon_category_id, nil)
	end

	return 
end
function WeaponSkillsManager:recreate_weapon_blueprint(weapon_id, weapon_category_id, temp_skills, apply_blueprint)
	local new_blueprint = nil

	if Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id] then
		local tier_counter = 1

		for tier_counter = 1, #Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id], 1 do
			local tier_skill_counter = 1

			for tier_skill_counter = 1, #Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id][tier_counter], 1 do
				local skill_data = Global.weapon_skills_manager.weapon_skills_skill_tree[weapon_id][tier_counter][tier_skill_counter][1]

				if not self._temp_weapon_skills then
					self._temp_weapon_skills = {}
				end

				if (skill_data.active or (temp_skills and temp_skills[skill_data])) and skill_data.weapon_parts then
					slot19 = skill_data.weapon_parts

					for index, weapon_part_name in ipairs(slot18) do
						local weapon_mod_type = tweak_data.weapon.factory.parts[weapon_part_name].type
						self._temp_weapon_skills[weapon_mod_type] = weapon_part_name
					end
				end
			end
		end
	end

	slot9 = weapon_id
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot7, managers.weapon_factory)
	slot12 = weapon_factory_id
	new_blueprint = clone(managers.weapon_factory.get_default_blueprint_by_factory_id(slot10, managers.weapon_factory))
	slot12 = new_blueprint

	self.update_scope_in_blueprint(managers.weapon_factory, self, weapon_id, weapon_factory_id)

	if self._temp_weapon_skills then
		slot10 = weapon_id
		local use_cosmetics_flag = managers.weapon_skills.get_cosmetics_flag_for_weapon_id(slot8, managers.weapon_skills)

		if use_cosmetics_flag then
			slot10 = self._temp_weapon_skills

			for weapon_part_type, weapon_part_name in pairs(slot9) do
				if weapon_part_type ~= "scope" then
					slot19 = false

					managers.weapon_factory.change_part_blueprint_only(slot14, managers.weapon_factory, weapon_factory_id, weapon_part_name, new_blueprint)
				end
			end
		end
	end

	if apply_blueprint then
		slot12 = new_blueprint

		self.apply_weapon_blueprint(slot8, self, weapon_id, weapon_category_id)
	end

	self._temp_weapon_skills = nil

	return new_blueprint
end
function WeaponSkillsManager:update_scope_in_blueprint(weapon_id, weapon_category_id, blueprint)
	slot7 = weapon_id
	local scope_weapon_part_name = self.get_scope_weapon_part_name(slot5, self)
	slot8 = weapon_id
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(self, managers.weapon_factory)

	if scope_weapon_part_name then
		slot9 = weapon_id

		if self.get_player_using_scope(slot7, self) then
			slot12 = false

			managers.weapon_factory.change_part_blueprint_only(slot7, managers.weapon_factory, weapon_factory_id, scope_weapon_part_name, blueprint)

			slot11 = blueprint

			self.apply_weapon_blueprint(slot7, self, weapon_id, weapon_category_id)
		end
	end

	return blueprint
end
function WeaponSkillsManager:apply_weapon_blueprint(weapon_id, weapon_category_id, new_blueprint)
	slot9 = weapon_category_id
	slot12 = new_blueprint

	Application.trace(slot5, Application, "[WeaponSkillsManager:apply_weapon_blueprint] weapon_id, weapon_category_id, new_blueprint ", weapon_id, inspect(slot11))

	local weapon_category_name = (weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID and WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME) or WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME

	if Global.blackmarket_manager.crafted_items and Global.blackmarket_manager.crafted_items[weapon_category_name] then
		slot7 = Global.blackmarket_manager.crafted_items[weapon_category_name]

		for weapon_index, weapon_data in pairs(slot6) do
			if weapon_data.weapon_id == weapon_id then
				Global.blackmarket_manager.crafted_items[weapon_category_name][weapon_index].blueprint = new_blueprint
				slot12 = managers.network
				local local_peer = managers.network.session(slot11).local_peer(slot11)
				local outfit_version = local_peer.outfit_version(managers.network.session(slot11))
				slot17 = managers.blackmarket

				local_peer.set_outfit_string(local_peer, local_peer, managers.blackmarket.outfit_string(outfit_version))

				break
			end
		end
	end

	return 
end

return 
