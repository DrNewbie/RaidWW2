ChallengeManager = ChallengeManager or class()
ChallengeManager.VERSION = 2
ChallengeManager.CATEGORY_GENERIC = "generic"
ChallengeManager.CATEGORY_WEAPON_UPGRADE = "weapon_upgrade"
ChallengeManager.get_instance = function ()
	if not Global.challenge_manager then
		slot3 = ChallengeManager
		Global.challenge_manager = ChallengeManager.new(slot2)
	end

	slot3 = ChallengeManager

	setmetatable(slot1, Global.challenge_manager)

	slot2 = Global.challenge_manager

	Global.challenge_manager._setup(slot1)

	return Global.challenge_manager
end
ChallengeManager.init = function (self)
	self._challenges = {}

	return 
end
ChallengeManager._setup = function (self)
	slot3 = self._challenges

	for category_id, category in pairs(slot2) do
		slot8 = category

		for challenge_id, challenge in pairs(slot7) do
			slot14 = Challenge

			setmetatable(slot12, challenge)

			slot13 = challenge

			challenge.setup(slot12)
		end
	end

	return 
end
ChallengeManager.reset = function (self)
	slot3 = self._challenges

	for category_id, category in pairs(slot2) do
		slot8 = category

		for challenge_id, challenge in pairs(slot7) do
			slot13 = challenge

			challenge.deactivate(slot12)
		end
	end

	self._challenges = {}

	return 
end
ChallengeManager.create_challenge = function (self, challenge_category, challenge_id, tasks, complete_callback, challenge_data)
	challenge_category = challenge_category or ChallengeManager.CATEGORY_GENERIC
	slot13 = challenge_data
	local challenge = Challenge.new(slot7, Challenge, challenge_category, challenge_id, tasks, complete_callback)

	if not self._challenges[challenge_category] then
		self._challenges[challenge_category] = {}
	end

	self._challenges[challenge_category][challenge_id] = challenge

	return 
end
ChallengeManager.activate_challenge = function (self, challenge_category, challenge_id)
	if not self._challenges[challenge_category] or not self._challenges[challenge_category][challenge_id] then
		slot7 = challenge_id

		debug_pause(slot4, "CANNOT ACTIVATE CHALLENGE", challenge_category)

		return 
	end

	slot5 = self._challenges[challenge_category][challenge_id]

	self._challenges[challenge_category][challenge_id].activate(slot4)

	return 
end
ChallengeManager.deactivate_challenge = function (self, challenge_category, challenge_id)
	if not self._challenges[challenge_category] or not self._challenges[challenge_category][challenge_id] then
		slot7 = challenge_id

		debug_pause(slot4, "CANNOT DEACTIVATE CHALLENGE", challenge_category)

		return 
	end

	slot5 = self._challenges[challenge_category][challenge_id]

	self._challenges[challenge_category][challenge_id].deactivate(slot4)

	return 
end
ChallengeManager.deactivate_all_challenges = function (self)
	slot3 = self._challenges

	for category_index, category in pairs(slot2) do
		slot8 = category

		for challenge_id, challenge in pairs(slot7) do
			slot15 = challenge_id

			self.deactivate_challenge(slot12, self, category_index)
		end
	end

	return 
end
ChallengeManager.reset_challenge = function (self, challenge_category, challenge_id)
	if not self._challenges[challenge_category] or not self._challenges[challenge_category][challenge_id] then
		slot7 = challenge_id

		debug_pause(slot4, "CANNOT RESET CHALLENGE", challenge_category)

		return 
	end

	slot5 = self._challenges[challenge_category][challenge_id]

	self._challenges[challenge_category][challenge_id].reset(slot4)

	return 
end
ChallengeManager.reset_all_challenges = function (self)
	slot3 = self._challenges

	for category_index, category in pairs(slot2) do
		slot8 = category

		for challenge_id, challenge in pairs(slot7) do
			slot15 = challenge_id

			self.reset_challenge(slot12, self, category_index)
		end
	end

	return 
end
ChallengeManager.get_challenge = function (self, challenge_category, challenge_id)
	if not self._challenges[challenge_category] or not self._challenges[challenge_category][challenge_id] then
		return 
	end

	return self._challenges[challenge_category][challenge_id]
end
ChallengeManager.challenge_exists = function (self, challenge_category, challenge_id)
	return (self._challenges[challenge_category] and self._challenges[challenge_category][challenge_id] and true) or false
end
ChallengeManager.save_character_slot = function (self, data)
	return 
end
ChallengeManager.load_character_slot = function (self, data, version)
	return 
end
ChallengeManager.save_profile_slot = function (self, data)
	local state = {
		version = ChallengeManager.VERSION,
		challenges = self._challenges
	}
	data.ChallengeManager = state

	return 
end
ChallengeManager.load_profile_slot = function (self, data, version)
	local state = data.ChallengeManager

	if not state then
		return 
	end

	if not state.version or (state.version and state.version ~= ChallengeManager.VERSION) then
		self.version = ChallengeManager.VERSION
		slot6 = self

		self.reset(slot5)
	else
		self.version = state.version or 1
		self._challenges = state.challenges or {}
		slot6 = self

		self._setup(slot5)
	end

	return 
end

return 
