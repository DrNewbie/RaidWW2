slot3 = "CoreLocalUserManager"

core.module(slot1, core)

slot3 = "CoreLocalUser"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

if not Manager then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

Manager = slot0
function Manager:init(factory, profile_settings_handler, profile_progress_handler, input_manager)
	self._factory = factory
	self._controller_to_user = {}
	self._profile_settings_handler = profile_settings_handler
	self._profile_progress_handler = profile_progress_handler
	self._profile_data_loaded_callback = profile_data_loaded_callback
	self._input_manager = input_manager

	return 
end
function Manager:has_local_user_with_input_provider_id(controller)
	slot5 = controller

	return self._controller_to_user[controller.key(slot4)] ~= nil
end
function Manager:debug_bind_primary_input_provider_id(player_slot)
	slot4 = Input
	local count = Input.num_real_controllers(slot3)
	local best_controller = nil

	for i = 0, count, 1 do
		slot11 = i
		local controller = Input.controller(slot9, Input)
		slot11 = controller

		if controller.connected(Input) then
			slot11 = controller
			local c_type = controller.type(slot10)

			if c_type == "xbox_controller" then
				best_controller = controller

				break
			elseif best_controller == nil then
				best_controller = controller
			end
		end
	end

	slot8 = best_controller

	return self.bind_local_user(slot5, self, player_slot)
end
function Manager:bind_local_user(slot, input_provider_id)
	local input_provider = self._input_manager._create_input_provider_for_controller(slot4, self._input_manager)
	slot7 = input_provider_id
	local local_user = self._controller_to_user[input_provider_id.key(input_provider_id)]

	if not local_user then
		local user_index = nil

		if input_provider_id.user_index then
			slot8 = input_provider_id
			user_index = input_provider_id.user_index(slot7)
		end

		slot10 = user_index
		local_user = self._create_local_user(slot7, self, input_provider)
		slot9 = input_provider_id
		self._controller_to_user[input_provider_id.key(self)] = local_user
	end

	slot8 = local_user

	slot.assign_local_user(slot6, slot)

	return local_user
end
function Manager:_create_local_user(input_provider, user_index)
	local local_user_handler = self._factory.create_local_user_handler(slot4)
	slot12 = self._profile_data_loaded_callback
	local created_user = CoreLocalUser.User.new(self._factory, CoreLocalUser.User, local_user_handler, input_provider, user_index, self._profile_settings_handler, self._profile_progress_handler)
	local_user_handler._core_local_user = created_user

	return created_user
end
function Manager:transition()
	slot3 = self._controller_to_user

	for _, user in pairs(slot2) do
		slot8 = user

		user.transition(slot7)
	end

	return 
end
function Manager:is_stable_for_loading()
	slot3 = self._controller_to_user

	for _, user in pairs(slot2) do
		slot8 = user

		if not user.is_stable_for_loading(slot7) then
			return false
		end
	end

	return true
end
function Manager:users()
	return self._controller_to_user
end
function Manager:update(t, dt)
	slot5 = self._controller_to_user

	for _, user in pairs(slot4) do
		slot12 = dt

		user.update(slot9, user, t)
	end

	return 
end
function Manager:enter_level_handler(level_handler)
	slot4 = self._controller_to_user

	for _, user in pairs(slot3) do
		slot10 = level_handler

		user.enter_level(slot8, user)
	end

	return 
end
function Manager:leave_level_handler(level_handler)
	slot4 = self._controller_to_user

	for _, user in pairs(slot3) do
		slot10 = level_handler

		user.leave_level(slot8, user)
	end

	return 
end

return 
