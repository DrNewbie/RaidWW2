ChallengeTask = ChallengeTask or class()
ChallengeTask.STATE_INACTIVE = "inactive"
ChallengeTask.STATE_ACTIVE = "active"
ChallengeTask.STATE_COMPLETED = "completed"
ChallengeTask.STATE_FAILED = "failed"
ChallengeTask.create = function (task_type, challenge_category, challenge_id, task_data)
	if task_type == ChallengeTweakData.TASK_KILL_ENEMIES then
		slot9 = task_data

		return ChallengeTaskKillEnemies.new(slot5, ChallengeTaskKillEnemies, challenge_category, challenge_id)
	elseif task_type == ChallengeTweakData.TASK_COLLECT_AMMO then
		slot9 = task_data

		return ChallengeTaskCollectAmmo.new(slot5, ChallengeTaskCollectAmmo, challenge_category, challenge_id)
	end

	return 
end
ChallengeTask.get_metatable = function (task_type)
	if task_type == ChallengeTweakData.TASK_KILL_ENEMIES then
		return ChallengeTaskKillEnemies
	elseif task_type == ChallengeTweakData.TASK_COLLECT_AMMO then
		return ChallengeTaskCollectAmmo
	end

	return 
end
ChallengeTask.init = function (self)
	self._state = ChallengeTask.STATE_INACTIVE

	return 
end
ChallengeTask.setup = function (self)
	if self._state == ChallengeTask.STATE_ACTIVE then
		self._state = ChallengeTask.STATE_INACTIVE
		slot3 = self

		self.activate(slot2)
	end

	return 
end
ChallengeTask.activate = function (self)
	self._state = ChallengeTask.STATE_ACTIVE

	return 
end
ChallengeTask.deactivate = function (self)
	self._state = ChallengeTask.STATE_INACTIVE

	return 
end
ChallengeTask.reset = function (self)
	if self._state == Challenge.STATE_COMPLETED or self._state == Challenge.STATE_FAILED then
		self._state = Challenge.STATE_INACTIVE
	end

	return 
end
ChallengeTask.active = function (self)
	return (self._state == ChallengeTask.STATE_ACTIVE and true) or false
end
ChallengeTask.completed = function (self)
	return (self._state == ChallengeTask.STATE_COMPLETED and true) or false
end
ChallengeTask.id = function (self)
	return self._id
end
ChallengeTask.type = function (self)
	return self._type
end
ChallengeTask.force_complete = function (self)
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED

	return 
end

if not ChallengeTaskKillEnemies then
	slot2 = ChallengeTask
	slot0 = class(slot1)
end

ChallengeTaskKillEnemies = slot0
ChallengeTaskKillEnemies.init = function (self, challenge_category, challenge_id, task_data)
	slot6 = self

	ChallengeTaskKillEnemies.super.init(slot5)

	self._count = 0
	self._target = task_data.target
	self._min_range = task_data.min_range
	self._parent_challenge_category = challenge_category
	self._parent_challenge_id = challenge_id
	self._id = self._parent_challenge_id .. "_kill_enemies"
	self._type = ChallengeTweakData.TASK_KILL_ENEMIES
	self._modifiers = task_data.modifiers or {}
	self._reminders = task_data.reminders or {}

	return 
end
ChallengeTaskKillEnemies.activate = function (self)
	slot3 = self

	ChallengeTaskKillEnemies.super.activate(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, self._id, callback(slot7, self, self))

	return 
end
ChallengeTaskKillEnemies.deactivate = function (self)
	slot3 = self

	ChallengeTaskKillEnemies.super.deactivate(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
ChallengeTaskKillEnemies.reset = function (self)
	slot3 = self

	ChallengeTaskKillEnemies.super.reset(slot2)

	self._count = 0

	return 
end
ChallengeTaskKillEnemies.current_count = function (self)
	return self._count
end
ChallengeTaskKillEnemies.target = function (self)
	return self._target
end
ChallengeTaskKillEnemies.min_range = function (self)
	return self._modifiers.min_range or 0
end
ChallengeTaskKillEnemies.set_reminders = function (self, reminders)
	self._reminders = reminders

	return 
end
ChallengeTaskKillEnemies.set_modifiers = function (self, modifiers)
	self._modifiers = modifiers

	return 
end
ChallengeTaskKillEnemies.on_enemy_killed = function (self, kill_data)
	if kill_data.using_turret then
		return 
	end

	if self._modifiers.damage_type and self._modifiers.damage_type ~= kill_data.damage_type then
		return 
	end

	if self._modifiers.headshot and not kill_data.headshot then
		return 
	end

	if self._modifiers.hip_fire and kill_data.player_used_steelsight then
		return 
	end

	if self._modifiers.min_range and kill_data.enemy_distance < self._modifiers.min_range then
		return true
	end

	if self._modifiers.enemy_type then
		local is_correct_enemy_type = false
		slot5 = self._modifiers.enemy_type

		for i, enemy_type in pairs(slot4) do
			if kill_data.enemy_type == enemy_type or kill_data.special_enemy_type == enemy_type then
				is_correct_enemy_type = true
			end
		end

		if not is_correct_enemy_type then
			return 
		end
	end

	if self._modifiers.last_round_in_magazine and kill_data.damage_type == "bullet" then
		slot4 = kill_data.weapon_used
		slot4 = kill_data.weapon_used.base(slot3)

		if 0 < kill_data.weapon_used.base(slot3).get_ammo_remaining_in_clip(slot3) then
			return 
		end
	end

	self._count = self._count + 1

	for i = 1, #self._reminders, 1 do
		if self._count == self._reminders[i] then
			slot10 = self._parent_challenge_id
			local challenge_data = managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category).data(slot7)
			slot12 = challenge_data.skill_index

			managers.weapon_skills.remind_weapon_challenge(managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category), managers.weapon_skills, challenge_data.weapon, challenge_data.tier)
		end
	end

	slot4 = self

	self._check_status(slot3)

	return 
end
ChallengeTaskKillEnemies._check_status = function (self)
	if self._target <= self._count then
		slot3 = self

		self._on_completed(slot2)
	end

	return 
end
ChallengeTaskKillEnemies._on_completed = function (self)
	self._state = ChallengeTask.STATE_COMPLETED
	slot5 = self._parent_challenge_id
	slot3 = managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category)

	managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category).on_task_completed(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
ChallengeTaskKillEnemies.force_complete = function (self)
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED
	self._count = self._target
	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end

if not ChallengeTaskCollectAmmo then
	slot2 = ChallengeTask
	slot0 = class(slot1)
end

ChallengeTaskCollectAmmo = slot0
ChallengeTaskCollectAmmo.init = function (self, challenge_category, challenge_id, task_data)
	slot6 = self

	ChallengeTaskCollectAmmo.super.init(slot5)

	self._count = 0
	self._target = task_data.target
	self._parent_challenge_category = challenge_category
	self._parent_challenge_id = challenge_id
	self._id = self._parent_challenge_id .. "_collect_ammo"
	self._type = ChallengeTweakData.TASK_COLLECT_AMMO
	self._reminders = task_data.reminders or {}

	return 
end
ChallengeTaskCollectAmmo.activate = function (self)
	slot3 = self

	ChallengeTaskCollectAmmo.super.activate(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_PICKED_UP_AMMO
	}
	slot10 = "on_ammo_collected"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, self._id, callback(slot7, self, self))

	return 
end
ChallengeTaskCollectAmmo.deactivate = function (self)
	slot3 = self

	ChallengeTaskCollectAmmo.super.deactivate(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
ChallengeTaskCollectAmmo.reset = function (self)
	slot3 = self

	ChallengeTaskKillEnemies.super.reset(slot2)

	self._count = 0

	return 
end
ChallengeTaskCollectAmmo.current_count = function (self)
	return self._count
end
ChallengeTaskCollectAmmo.target = function (self)
	return self._target
end
ChallengeTaskCollectAmmo.min_range = function (self)
	return 0
end
ChallengeTaskCollectAmmo.set_reminders = function (self, reminders)
	self._reminders = reminders

	return 
end
ChallengeTaskCollectAmmo.set_modifiers = function (self, modifiers)
	self._modifiers = modifiers

	return 
end
ChallengeTaskCollectAmmo.on_ammo_collected = function (self, ammo_info)
	slot4 = managers.raid_job

	if managers.raid_job.is_camp_loaded(slot3) then
		return 
	end

	self._count = self._count + ammo_info.amount

	if self._target < self._count then
		self._count = self._target
	end

	for i = 1, #self._reminders, 1 do
		if self._count == self._reminders[i] then
			slot10 = self._parent_challenge_id
			local challenge_data = managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category).data(slot7)
			slot12 = challenge_data.skill_index

			managers.weapon_skills.remind_weapon_challenge(managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category), managers.weapon_skills, challenge_data.weapon, challenge_data.tier)
		end
	end

	slot4 = self

	self._check_status(slot3)

	return 
end
ChallengeTaskCollectAmmo._check_status = function (self)
	if self._target <= self._count then
		slot3 = self

		self._on_completed(slot2)
	end

	return 
end
ChallengeTaskCollectAmmo._on_completed = function (self)
	self._state = ChallengeTask.STATE_COMPLETED
	slot5 = self._parent_challenge_id
	slot3 = managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category)

	managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category).on_task_completed(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
ChallengeTaskCollectAmmo.force_complete = function (self)
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED
	self._count = self._target
	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end

return 
