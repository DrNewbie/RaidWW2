GlobalStateManager = GlobalStateManager or class()
GlobalStateManager.PATH = "gamedata/global_state"
GlobalStateManager.FILE_EXTENSION = "state"
GlobalStateManager.FULL_PATH = GlobalStateManager.PATH .. "." .. GlobalStateManager.FILE_EXTENSION
GlobalStateManager.GLOBAL_STATE_NAME = "global_init"
GlobalStateManager.EVENT_PRE_START_RAID = "system_pre_start_raid"
GlobalStateManager.EVENT_START_RAID = "system_start_raid"
GlobalStateManager.EVENT_END_RAID = "system_end_raid"
GlobalStateManager.EVENT_END_TUTORIAL = "system_end_tutorial"
GlobalStateManager.EVENT_RESTART_CAMP = "system_restart_camp"
GlobalStateManager.EVENT_CHARACTER_CREATED = "system_character_created"
GlobalStateManager.TYPE_BOOL = "bool"
GlobalStateManager.TYPE_VALUE = "value"
function GlobalStateManager:init()
	self._triggers = {}
	self._states = {}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	slot3 = self

	self._parse_states(slot2)

	slot5 = {
		GlobalStateManager.EVENT_PRE_START_RAID
	}
	slot10 = "system_pre_start_raid"

	self.add_listener(slot2, self, "CCM_PRE_START_RAID", callback(slot7, managers.challenge_cards, managers.challenge_cards))

	slot5 = {
		GlobalStateManager.EVENT_START_RAID
	}
	slot10 = "system_start_raid"

	self.add_listener(slot2, self, "RM_START_RAID", callback(slot7, managers.raid_menu, managers.raid_menu))

	slot5 = {
		GlobalStateManager.EVENT_START_RAID
	}
	slot10 = "external_start_mission"

	self.add_listener(slot2, self, "JM_START_MISSION", callback(slot7, managers.raid_job, managers.raid_job))

	slot5 = {
		GlobalStateManager.EVENT_END_RAID
	}
	slot10 = "external_end_mission"

	self.add_listener(slot2, self, "JM_END_MISSION", callback(slot7, managers.raid_job, managers.raid_job))

	slot5 = {
		GlobalStateManager.EVENT_END_TUTORIAL
	}
	slot10 = "tutorial_ended"

	self.add_listener(slot2, self, "JM_END_TUTORIAL", callback(slot7, managers.raid_job, managers.raid_job))

	slot5 = {
		GlobalStateManager.EVENT_START_RAID
	}
	slot10 = "on_mission_start_callback"

	self.add_listener(slot2, self, "OM_START_MISSION", callback(slot7, managers.objectives, managers.objectives))

	slot5 = {
		GlobalStateManager.EVENT_END_RAID
	}
	slot10 = "on_mission_end_callback"

	self.add_listener(slot2, self, "WM_END_MISSION", callback(slot7, managers.warcry, managers.warcry))

	slot5 = {
		GlobalStateManager.EVENT_END_RAID
	}
	slot10 = "on_mission_end_callback"

	self.add_listener(slot2, self, "TAI_END_MISSION", callback(slot7, managers.criminals, managers.criminals))

	slot5 = {
		GlobalStateManager.EVENT_START_RAID
	}
	slot10 = "on_mission_start_callback"

	self.add_listener(slot2, self, "TAI_START_MISSION", callback(slot7, managers.criminals, managers.criminals))

	return 
end
function GlobalStateManager:add_listener(key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function GlobalStateManager:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function GlobalStateManager:register_trigger(trigger, flag)
	if not flag then
		slot6 = "[GlobalStateManager:register_trigger] Trying to register trigger without flag!"
		slot9 = trigger

		Application.error(slot4, Application, inspect(slot8))

		return 
	end

	self._triggers[flag] = self._triggers[flag] or {}
	slot6 = trigger

	table.insert(self._triggers[flag] or , self._triggers[flag])

	return 
end
function GlobalStateManager:unregister_trigger(trigger, flag)
	if not flag then
		slot6 = "[GlobalStateManager:register_trigger] Trying to unregister trigger without flag!"
		slot9 = trigger

		Application.error(slot4, Application, inspect(slot8))

		return 
	end

	local found = nil
	slot6 = self._triggers[flag]

	for i, trig in ipairs(slot5) do
		if trig == trigger then
			found = i
		end
	end

	if found then
		slot7 = found

		table.remove(slot5, self._triggers[flag])
	end

	return 
end
function GlobalStateManager:flag_names()
	local flag_names = {}
	slot4 = self._states[GlobalStateManager.GLOBAL_STATE_NAME]

	for name, value in pairs(slot3) do
		slot10 = name

		table.insert(slot8, flag_names)
	end

	return flag_names
end
function GlobalStateManager:flag(flag_name)
	local flag = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name]

	if not flag then
		slot6 = flag_name

		debug_pause(slot4, "[GlobalStateManager:set_flag] Trying to get a flag that is not defined, check and resave level, or add it to global_state.state. Flag:")

		return 
	end

	return flag.value
end
function GlobalStateManager:set_flag(flag_name)
	local flag = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name]

	if not flag then
		slot6 = flag_name

		debug_pause(slot4, "[GlobalStateManager:set_flag] Trying to set a flag that is not defined, check and resave level, or add it to global_state.state. Flag:")

		return 
	end

	local old_state = flag.value
	flag.value = true
	slot9 = true

	self._fire_triggers(slot5, self, flag_name, old_state)

	return 
end
function GlobalStateManager:set_value_flag(flag_name, value)
	local flag = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name]

	if not flag then
		slot7 = flag_name

		debug_pause(slot5, "[GlobalStateManager:set_flag] Trying to set a flag that is not defined, check and resave level, or add it to global_state.state. Flag:")

		return 
	end

	local old_state = flag.value
	flag.value = value
	slot10 = value

	self._fire_triggers(slot6, self, flag_name, old_state)

	return 
end
function GlobalStateManager:set_implicit_flag(flag_name)
	slot7 = true

	self._fire_triggers(slot3, self, flag_name, false)

	return 
end
function GlobalStateManager:clear_implicit_flag(flag_name)
	slot7 = false

	self._fire_triggers(slot3, self, flag_name, true)

	return 
end
function GlobalStateManager:clear_flag(flag_name)
	local flag = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name]

	if not flag then
		slot6 = flag_name

		debug_pause(slot4, "[GlobalStateManager:set_flag] Trying to set a flag that is not defined, check and resave level, or add it to global_state.state. Flag:")

		return 
	end

	local old_state = flag.value
	flag.value = false
	slot9 = false

	self._fire_triggers(slot5, self, flag_name, old_state)

	return 
end
function GlobalStateManager:fire_event(flag_name)
	if flag_name == GlobalStateManager.EVENT_START_RAID then
		slot5 = false

		managers.raid_menu.set_pause_menu_enabled(slot3, managers.raid_menu)
	end

	if GlobalStateManager.EVENT_START_RAID == flag_name or GlobalStateManager.EVENT_END_RAID == flag_name then
		slot4 = managers.network
		slot5 = true

		if not managers.network.session(slot3).chk_all_peers_spawned(slot3, managers.network.session(slot3)) then
			slot5 = "[GlobalStateManager:fire_event] Reschedule level start!"

			Application.debug(slot3, Application)

			slot10 = nil

			managers.queued_tasks.queue(slot3, managers.queued_tasks, nil, managers.global_state.fire_event, managers.global_state, flag_name, 1)

			self._fire_event_delay = true
			slot4 = Application
			local t = Application.time(slot3)

			if not self._next_hint_t or self._next_hint_t < t then
				self._next_hint_t = t + 6
				slot6 = {
					duration = 2,
					shelf_life = 5,
					id = "hud_waiting_for_player_dropin",
					text = managers.localization.text(slot8, managers.localization)
				}
				slot10 = "hud_waiting_for_player_dropin"

				managers.notification.add_notification(slot4, managers.notification)
			end

			return 
		else
			slot4 = managers.vote

			if not managers.vote.is_restarting(slot3) and not managers.raid_job.reload_mission_flag then
				slot4 = managers.game_play_central

				if managers.game_play_central.is_restarting(slot3) then
					return 
				end
			end
		end
	end

	if self._fire_event_delay then
		self._fire_event_delay = nil
		slot10 = nil

		managers.queued_tasks.queue(slot3, managers.queued_tasks, nil, managers.global_state.fire_event, managers.global_state, flag_name, ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY + 0.1)

		return 
	end

	local flag = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name]

	if not flag then
		slot6 = flag_name

		debug_pause(slot4, "[GlobalStateManager:set_flag] Trying to set a flag that is not defined, check and resave level, or add it to global_state.state. Flag:")

		return 
	end

	if self._listener_holder._listeners and self._listener_holder._listeners[flag_name] then
		slot6 = flag_name

		self._call_listeners(slot4, self)
	end

	if not self._triggers[flag_name] then
		return 
	end

	slot5 = self._triggers[flag_name]

	for _, trigger in ipairs(slot4) do
		slot13 = true

		trigger.execute(slot9, trigger, flag_name, nil)
	end

	return 
end
function GlobalStateManager:set_to_default(flag_name)
	self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name].value = self._states[GlobalStateManager.GLOBAL_STATE_NAME][flag_name].default

	return 
end
function GlobalStateManager:reset_flags_for_job(job_id)
	slot4 = self._states[GlobalStateManager.GLOBAL_STATE_NAME]

	for name, flag in pairs(slot3) do
		if flag.job_id == job_id then
			flag.value = flag.default
		end
	end

	return 
end
function GlobalStateManager:reset_all_flags()
	slot3 = self._states[GlobalStateManager.GLOBAL_STATE_NAME]

	for name, flag in pairs(slot2) do
		flag.value = flag.default
	end

	return 
end
function GlobalStateManager:sync_save(data)
	local state = {
		data = self._states
	}
	data.GlobalStateManager = state

	return 
end
function GlobalStateManager:sync_load(data)
	local state = data.GlobalStateManager

	if state then
		self._states = state.data
	end

	return 
end
function GlobalStateManager:get_all_global_states()
	local global_states = {}
	slot4 = self._states.global_init

	for id, data in pairs(slot3) do
		local state = {
			{
				id = id,
				value = data.value
			}
		}
		slot11 = {
			id = id,
			value = data.value
		}

		table.insert(data.value, global_states)
	end

	return global_states
end
function GlobalStateManager:set_global_states(states)
	for i = 1, #states, 1 do
		self._states.global_init[states[i].id].value = states[i].value
	end

	return 
end
function GlobalStateManager:save_game(data)
	local global_states = {}
	slot5 = self._states.global_init

	for id, data in pairs(slot4) do
		local state = {
			{
				id = id,
				value = data.value
			}
		}
		slot12 = {
			id = id,
			value = data.value
		}

		table.insert(data.value, global_states)
	end

	data.global_state = global_states

	return 
end
function GlobalStateManager:load_game(data)
	if data.global_state then
		for i = 1, #data.global_state, 1 do
			self._states.global_init[data.global_state[i].id].value = data.global_state[i].value
		end
	end

	return 
end
function GlobalStateManager:on_simulation_ended()
	self._triggers = {}
	self._states = {}
	slot3 = self

	self._parse_states(slot2)

	return 
end
function GlobalStateManager:check_flag_value(check_type, value1, value2)
	if check_type == "equal" then
		return value1 == value2
	end

	if check_type == "less_or_equal" then
		return value2 <= value1
	end

	if check_type == "greater_or_equal" then
		return value1 <= value2
	end

	if check_type == "less_than" then
		return value2 < value1
	end

	if check_type == "greater_than" then
		return value1 < value2
	end

	return 
end
function GlobalStateManager:_parse_states()
	slot7 = self.PATH
	local list = PackageManager.script_data(slot2, PackageManager, self.PATH.id(self.FILE_EXTENSION))
	local states = list.states
	slot5 = states

	for _, state in ipairs(self.FILE_EXTENSION.id(slot5)) do
		slot10 = state

		for _, flag in ipairs(slot9) do
			if flag._meta == "flag" then
				self._states = self._states or {}
				self._states[state.id] = self._states[state.id] or {}
				self._states[state.id][flag.id] = self._states[state.id][flag.id] or {}
				self._states[state.id][flag.id].job_id = flag.job_id
				self._states[state.id][flag.id].data_type = flag.data_type or GlobalStateManager.TYPE_BOOL
				slot18 = self._states[state.id][flag.id].data_type
				self._states[state.id][flag.id].value = self._parse_value(self._states[state.id][flag.id] or , self, flag.value)
				slot18 = self._states[state.id][flag.id].data_type
				self._states[state.id][flag.id].default = self._parse_value(self._states[state.id][flag.id] or , self, flag.value)
			else
				slot19 = data._meta
				slot16 = "Unknown node \"" .. tostring(slot18) .. "\" in \"" .. self.FULL_PATH .. "\". Expected \"flag\" node."

				Application.error(slot14, Application)
			end
		end
	end

	return 
end
function GlobalStateManager:_parse_value(value, data_type)
	if data_type == GlobalStateManager.TYPE_VALUE then
		return value
	elseif value == "set" then
		return true
	elseif value == "cleared" then
		return false
	end

	return 
end
function GlobalStateManager:_fire_triggers(flag, old_state, new_state)
	if old_state == new_state then
		return 
	end

	if not self._triggers[flag] then
		return 
	end

	slot6 = self._triggers[flag]

	for _, trigger in ipairs(slot5) do
		slot13 = new_state

		trigger.execute(slot10, trigger, flag)
	end

	return 
end
function GlobalStateManager:_call_listeners(event, params)
	slot7 = params

	self._listener_holder.call(slot4, self._listener_holder, event)

	return 
end

return 
