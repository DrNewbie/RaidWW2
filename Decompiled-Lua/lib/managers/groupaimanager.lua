slot2 = "lib/managers/group_ai_states/GroupAIStateBase"

require(slot1)

slot2 = "lib/managers/group_ai_states/GroupAIStateEmpty"

require(slot1)

slot2 = "lib/managers/group_ai_states/GroupAIStateBesiege"

require(slot1)

slot2 = "lib/managers/group_ai_states/GroupAIStateRaid"

require(slot1)

slot2 = "lib/managers/group_ai_states/GroupAIStateStreet"

require(slot1)

slot2 = "lib/managers/group_ai_states/GroupAIStateZone"

require(slot1)

GroupAIManager = GroupAIManager or class()
function GroupAIManager:init()
	slot4 = "empty"

	self.set_state(slot2, self)

	return 
end
function GroupAIManager:update(t, dt)
	slot5 = managers.navigation

	if managers.navigation.is_streamed_data_ready(slot4) then
		slot7 = dt

		self._state.update(slot4, self._state, t)
	end

	return 
end
function GroupAIManager:paused_update(t, dt)
	slot7 = dt

	self._state.paused_update(slot4, self._state, t)

	return 
end
function GroupAIManager:set_state(name, world_id)
	if world_id and 0 < world_id then
		slot6 = world_id

		self._state.merge_world_data(slot4, self._state)

		slot7 = world_id

		self.set_current_state(slot4, self, name)
	else
		if name == "empty" then
			slot5 = GroupAIStateEmpty
			self._state = GroupAIStateEmpty.new(slot4)
		elseif name == "street" then
			slot5 = GroupAIStateStreet
			self._state = GroupAIStateStreet.new(slot4)
		elseif name == "besiege" then
			slot5 = GroupAIStateBesiege
			self._state = GroupAIStateBesiege.new(slot4)
		elseif name == "raid" then
			slot5 = GroupAIStateRaid
			self._state = GroupAIStateRaid.new(slot4)
		elseif name == "zone" then
			slot5 = GroupAIStateZone
			self._state = GroupAIStateZone.new(slot4)
		else
			slot7 = name

			Application.error(slot4, Application, "[GroupAIManager:set_state] state doesn't exist")

			return 
		end

		self._state_name = name
	end

	return 
end
function GroupAIManager:set_current_state(name, world_id)
	local new_state = nil

	if name == "empty" then
		new_state = GroupAIStateEmpty
	elseif name == "street" then
		new_state = GroupAIStateStreet
	elseif name == "besiege" then
		new_state = GroupAIStateBesiege
	elseif name == "raid" then
		new_state = GroupAIStateRaid
	elseif name == "zone" then
		new_state = GroupAIStateZone
	else
		slot8 = name

		Application.error(slot5, Application, "[GroupAIManager:set_current_state] state doesn't exist")

		return 
	end

	slot6 = new_state

	for k, v in pairs(slot5) do
		slot12 = "__"

		if not string.begins(slot10, k) then
			slot12 = k

			if not table.contains(slot10, {
				"new",
				"super",
				"init"
			}) then
				self._state[k] = v
			end
		end
	end

	self._state_name = name
	slot6 = self._state

	self._state._queue_police_upd_task(slot5)

	return 
end
function GroupAIManager:unload_nav_data(world_id, all_nav_segs)
	slot7 = all_nav_segs

	self._state.unload_world_nav_data(slot4, self._state, world_id)

	return 
end
function GroupAIManager:state()
	return self._state
end
function GroupAIManager:state_name()
	return self._state_name
end
function GroupAIManager:state_names()
	return {
		"empty",
		"besiege",
		"street",
		"raid",
		"zone"
	}
end
function GroupAIManager:on_simulation_started()
	slot3 = self._state

	self._state.on_simulation_started(slot2)

	return 
end
function GroupAIManager:on_simulation_ended()
	slot3 = self._state

	self._state.on_simulation_ended(slot2)

	return 
end
function GroupAIManager:visualization_enabled()
	return self._state._draw_enabled
end
function GroupAIManager:get_difficulty_dependent_value(tweak_values)
	slot5 = tweak_values

	return self._state.get_difficulty_dependent_value(slot3, self._state)
end
function GroupAIManager:kill_all_AI()
	Application.debug(slot2, Application)

	slot5 = managers.enemy

	for u_key, u_data in pairs(managers.enemy.all_civilians("[GroupAIManager:kill_all_AI()]")) do
		slot8 = u_data.unit
		slot10 = 0

		u_data.unit.base(slot7).set_slot(slot7, u_data.unit.base(slot7), u_data.unit)

		slot9 = u_data.unit

		managers.enemy.on_enemy_unregistered(slot7, managers.enemy)
	end

	slot5 = managers.enemy

	for u_key, u_data in pairs(managers.enemy.all_enemies(slot4)) do
		slot8 = u_data.unit
		slot10 = 0

		u_data.unit.base(slot7).set_slot(slot7, u_data.unit.base(slot7), u_data.unit)

		slot9 = u_data.unit

		managers.enemy.on_enemy_unregistered(slot7, managers.enemy)
	end

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	for _, data in pairs(managers.groupai.state(slot4).all_AI_criminals(slot4)) do
		if data then
			slot8 = data.unit

			if alive(slot7) then
				slot8 = data.unit
				slot9 = true

				data.unit.character_damage(slot7).clbk_exit_to_dead(slot7, data.unit.character_damage(slot7))
			end
		end
	end

	slot3 = managers.enemy

	managers.enemy.unqueue_all_tasks(slot2)

	slot3 = managers.enemy

	managers.enemy.remove_delayed_clbks(slot2)

	managers.enemy._enemy_data.nr_units = 0

	return 
end
function GroupAIManager:kill_all_team_ai()
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	for _, data in pairs(managers.groupai.state(slot4).all_AI_criminals(slot4)) do
		if data then
			slot8 = data.unit

			if alive(slot7) then
				slot8 = data.unit
				slot8 = data.unit.character_damage(slot7)

				data.unit.character_damage(slot7).force_bleedout(slot7)
			end
		end
	end

	return 
end

return 
