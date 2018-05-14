slot3 = "CoreLocalUser"

core.module(slot1, core)

slot3 = "CorePortableLocalUserStorage"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

if not User then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

User = slot0
User.init = function (self, local_user_handler, input_input_provider, user_index, profile_settings_handler, profile_progress_handler)
	self._local_user_handler = local_user_handler
	self._input_input_provider = input_input_provider
	self._user_index = user_index
	slot12 = profile_data_loaded_callback
	self._storage = CorePortableLocalUserStorage.Storage.new(slot7, CorePortableLocalUserStorage.Storage, self, profile_settings_handler, profile_progress_handler)
	slot9 = self._user_index
	self._game_name = "Player #" .. tostring(CorePortableLocalUserStorage.Storage)

	return 
end
User.default_data = function (data)
	return 
end
User.save = function (self, data)
	return 
end
User.transition = function (self)
	slot3 = self._storage

	self._storage.transition(slot2)

	return 
end
User._player_slot_assigned = function (self, player_slot)
	slot5 = "This user already has an assigned player slot"

	assert(slot3, self._player_slot == nil)

	self._player_slot = player_slot
	slot4 = self._storage

	self._storage.request_load(slot3)

	return 
end
User._player_slot_lost = function (self, player_slot)
	slot5 = "This user can get a lost player slot, no slot was assigned to begin with"

	assert(slot3, self._player_slot ~= nil)

	slot5 = "Player has lost a player slot that wasn't assigned"

	assert(slot3, self._player_slot == player_slot)

	self._player_slot = nil

	return 
end
User.profile_data_is_loaded = function (self)
	slot3 = self._storage

	return self._storage.profile_data_is_loaded(slot2)
end
User.enter_level = function (self, level_handler)
	slot5 = level_handler

	self._local_user_handler.enter_level(slot3, self._local_user_handler)

	return 
end
User.leave_level = function (self, level_handler)
	slot5 = level_handler

	self._local_user_handler.leave_level(slot3, self._local_user_handler)

	slot4 = self

	self.release_player(slot3)

	return 
end
User.gamer_name = function (self)
	return self._game_name
end
User.is_stable_for_loading = function (self)
	slot3 = self._storage

	return self._storage.is_stable_for_loading(slot2)
end
User.assign_player = function (self, player)
	self._player = player
	slot5 = self

	self._local_user_handler.player_assigned(slot3, self._local_user_handler)

	return 
end
User.release_player = function (self)
	slot3 = self._local_user_handler

	self._local_user_handler.player_removed(slot2)

	self._player = nil
	self._avatar = nil

	return 
end
User.assigned_player = function (self)
	return self._player
end
User.local_user_handler = function (self)
	return self._local_user_handler
end
User.profile_settings = function (self)
	slot3 = self._storage

	return self._storage.profile_settings(slot2)
end
User.profile_progress = function (self)
	slot3 = self._storage

	return self._storage.profile_progress(slot2)
end
User.save_profile_settings = function (self)
	slot3 = self._storage

	return self._storage.request_save(slot2)
end
User.save_profile_progress = function (self)
	slot3 = self._storage

	return self._storage.request_save(slot2)
end
User.engine_input_input_input_provider = function (self)
	return self._input_input_provider
end
User.update = function (self, t, dt)
	if not self._avatar and self._player then
		slot5 = self._player

		if self._player.has_avatar(slot4) then
			local input_input_provider = self.engine_input_input_input_provider(slot4)
			local avatar = self._player.avatar(self)
			slot8 = input_input_provider

			avatar.set_input(self._player, avatar)

			self._avatar = avatar
		end
	end

	slot7 = dt

	self._local_user_handler.update(slot4, self._local_user_handler, t)

	return 
end

return 
