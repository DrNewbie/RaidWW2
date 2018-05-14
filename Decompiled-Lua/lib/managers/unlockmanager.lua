UnlockManager = UnlockManager or class()
UnlockManager.CHARACTER_VERSION = 1
UnlockManager.PROFILE_VERSION = 1
UnlockManager.SLOT_CHARACTER = "character"
UnlockManager.SLOT_PROFILE = "profile"
UnlockManager.CATEGORY_CONTROL_ARCHIVE = "control_archive"
UnlockManager.get_instance = function ()
	if not Global.unlock_manager then
		slot3 = UnlockManager
		Global.unlock_manager = UnlockManager.new(slot2)
	end

	slot3 = UnlockManager

	setmetatable(slot1, Global.unlock_manager)

	return Global.unlock_manager
end
UnlockManager.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
UnlockManager.reset = function (self)
	self._categories = {
		[UnlockManager.SLOT_CHARACTER] = {},
		[UnlockManager.SLOT_PROFILE] = {}
	}

	return 
end
UnlockManager.unlock = function (self, category, identifiers)
	if not self._categories[category.slot][category.identifier] then
		self._categories[category.slot][category.identifier] = {}
	end

	local current_level_data = self._categories[category.slot][category.identifier]

	for counter = 1, #identifiers, 1 do
		if counter < #identifiers then
			current_level_data[identifiers[counter]] = {}
			current_level_data = current_level_data[identifiers[counter]]
		else
			current_level_data[identifiers[counter]] = identifiers[counter]
		end
	end

	return 
end
UnlockManager.is_unlocked = function (self, category, identifiers)
	local result = false

	if not self._categories[category.slot][category.identifier] then
		return false
	end

	local current_level_data = self._categories[category.slot][category.identifier]

	for counter = 1, #identifiers, 1 do
		if counter < #identifiers then
			if not current_level_data[identifiers[counter]] then
				return false
			end

			current_level_data = current_level_data[identifiers[counter]]
		elseif current_level_data[identifiers[counter]] then
			return true
		end
	end

	return result
end
UnlockManager.save_profile_slot = function (self, data)
	local state = {
		version = UnlockManager.PROFILE_VERSION,
		profile_unlocks = self._categories[UnlockManager.SLOT_PROFILE]
	}
	data.UnlockManager = state

	return 
end
UnlockManager.load_profile_slot = function (self, data)
	local state = data.UnlockManager

	if not state then
		return 
	end

	self.version = state.version or UnlockManager.PROFILE_VERSION
	self._categories[UnlockManager.SLOT_PROFILE] = state.profile_unlocks or {}

	return 
end

return 
