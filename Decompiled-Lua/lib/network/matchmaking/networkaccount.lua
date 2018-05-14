NetworkAccount = NetworkAccount or class()
function NetworkAccount:init()
	slot5 = "_standard_username"
	self._postprocess_username = callback(slot2, self, self)
	slot3 = self

	self.set_lightfx(slot2)

	return 
end
function NetworkAccount:update()
	return 
end
function NetworkAccount:create_account(name, password, email)
	return 
end
function NetworkAccount:reset_password(name, email)
	return 
end
function NetworkAccount:login(name, password, cdkey)
	return 
end
function NetworkAccount:logout()
	return 
end
function NetworkAccount:register_callback(event, callback)
	return 
end
function NetworkAccount:register_post_username(cb)
	self._postprocess_username = cb

	return 
end
function NetworkAccount:username()
	slot5 = self

	return self._postprocess_username(self.username_id(slot4))
end
function NetworkAccount:username_id()
	return 0
end
function NetworkAccount:username_by_id()
	return ""
end
function NetworkAccount:signin_state()
	return "not signed in"
end
function NetworkAccount:set_lightfx()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) ~= Idstring(SystemInfo) then
		return 
	end

	slot4 = "use_lightfx"

	if managers.user.get_setting(slot2, managers.user) then
		slot3 = "[NetworkAccount:init] Initializing LightFX..."

		print(slot2)

		slot3 = LightFX

		if LightFX.initialize(slot2) then
			slot3 = LightFX
			slot1 = LightFX.has_lamps(slot2)
		end

		self._has_alienware = slot1

		if self._has_alienware then
			slot7 = 255

			LightFX.set_lamps(slot2, LightFX, 0, 255, 0)
		end
	else
		self._has_alienware = nil
	end

	return 
end
function NetworkAccount:has_alienware()
	return self._has_alienware
end
function NetworkAccount:clan_tag()
	if managers.save.get_profile_setting then
		slot4 = "clan_tag"

		if managers.save.get_profile_setting(slot2, managers.save) then
			slot6 = "clan_tag"

			if 0 < string.len(managers.save.get_profile_setting(slot4, managers.save)) then
				slot5 = "clan_tag"

				return "[" .. managers.save.get_profile_setting(slot3, managers.save) .. "]"
			end
		end
	end

	return ""
end
function NetworkAccount:_standard_username(name)
	return name
end
function NetworkAccount:set_playing(state)
	return 
end
function NetworkAccount:_load_globals()
	return 
end
function NetworkAccount:_save_globals()
	return 
end
function NetworkAccount:inventory_load()
	return 
end
function NetworkAccount:inventory_is_loading()
	return 
end
function NetworkAccount:inventory_reward(item)
	return false
end
function NetworkAccount:inventory_reward_dlc()
	return 
end
function NetworkAccount:inventory_reward_unlock(box, key)
	return 
end
function NetworkAccount:inventory_reward_open(item)
	return 
end
function NetworkAccount:inventory_outfit_refresh()
	return 
end
function NetworkAccount:inventory_outfit_verify(id, outfit_data, outfit_callback)
	return 
end
function NetworkAccount:inventory_outfit_signature()
	return ""
end
function NetworkAccount:inventory_repair_list(list)
	return 
end
function NetworkAccount:is_ready_to_close()
	return true
end

return 
