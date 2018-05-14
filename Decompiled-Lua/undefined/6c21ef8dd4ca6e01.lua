EventSystemManager = EventSystemManager or class()
EventSystemManager.VERSION = 1
EventSystemManager.DAY_IN_SECONDS = 86400
EventSystemManager.get_instance = function ()
	if not Global.event_manager then
		slot3 = EventSystemManager
		Global.event_manager = EventSystemManager.new(slot2)
	end

	slot3 = EventSystemManager

	setmetatable(slot1, Global.event_manager)

	return Global.event_manager
end
EventSystemManager.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
EventSystemManager.reset = function (self)
	self._last_login_utc = 0
	self._last_login_day = 0
	self._last_login_year = 0
	self._consecutive_logins = 0

	return 
end
EventSystemManager.save_profile_slot = function (self, data)
	local state = {
		version = EventSystemManager.VERSION,
		consecutive_logins = self._consecutive_logins,
		last_login_day = self._last_login_day,
		last_login_year = self._last_login_year,
		last_login_utc = self._last_login_utc
	}
	data.EventSystemManager = state

	return 
end
EventSystemManager.load_profile_slot = function (self, data)
	local state = data.EventSystemManager

	if not state then
		return 
	end

	if state.version and state.version ~= EventSystemManager.VERSION then
	end

	self._consecutive_logins = state.consecutive_logins or 0
	self._last_login_day = state.last_login_day or 0
	self._last_login_year = state.last_login_year or 0
	self._last_login_utc = state.last_login_utc or 0

	return 
end
EventSystemManager.on_camp_entered = function (self)
	local server_time = Steam.server_time(slot2)
	slot5 = server_time
	local time_table = os.date(Steam, "!*t")

	if not time_table then
		return 
	end

	local next_day = self._last_login_day + 1

	if (time_table.yday ~= 365 or next_day ~= 365) and next_day == 365 then
		next_day = 1
	end

	if self._last_login_utc == 0 or next_day == time_table.yday then
		slot6 = self

		self._fire_daily_event(slot5)
	elseif time_table.yday ~= self._last_login_day then
		self._consecutive_logins = 0
		slot6 = self

		self._fire_daily_event(slot5)
	end

	self._last_login_day = time_table.yday
	self._last_login_year = time_table.year
	self._last_login_utc = server_time
	Global.savefile_manager.setting_changed = true
	slot7 = true

	managers.savefile.save_setting(true, managers.savefile)

	return 
end
EventSystemManager.consecutive_logins = function (self)
	return self._consecutive_logins
end
EventSystemManager._fire_daily_event = function (self)
	self._consecutive_logins = self._consecutive_logins + 1

	if #tweak_data.events.active_duty_bonus_rewards < self._consecutive_logins then
		self._consecutive_logins = 1
	end

	slot5 = self._consecutive_logins

	Application.debug(slot2, Application, "[EventSystemManager:_fire_daily_event()] Award daily reward!")

	local reward = tweak_data.events.active_duty_bonus_rewards[self._consecutive_logins].reward

	if reward == EventsTweakData.REWERD_TYPE_GOLD then
		slot5 = tweak_data.events.active_duty_bonus_rewards[self._consecutive_logins].amount

		managers.gold_economy.add_gold(slot3, managers.gold_economy)

		local notification_params = {
			priority = 4,
			id = "active_duty_bonus",
			duration = 6,
			notification_type = HUDNotification.ACTIVE_DUTY_BONUS,
			consecutive = self._consecutive_logins,
			amount = tweak_data.events.active_duty_bonus_rewards[self._consecutive_logins].amount,
			total = #tweak_data.events.active_duty_bonus_rewards
		}
		slot6 = notification_params

		managers.notification.add_notification(self._consecutive_logins, managers.notification)
	else
		slot6 = reward

		Application.warn(slot3, Application, "[EventSystemManager:_fire_daily_event()] Not implemented!")
	end

	return 
end

return 
