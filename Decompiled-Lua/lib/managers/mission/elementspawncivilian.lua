-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpawnCivilian then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnCivilian = slot0
function ElementSpawnCivilian:init(...)

	-- Decompilation error in this vicinity:
	slot3 = self

	ElementSpawnCivilian.super.init(slot2, ...)

	self._enemy_name = slot1
	self._units = {}
	slot3 = self

	self._finalize_values(slot2)

	return 
end
function ElementSpawnCivilian:_finalize_values()
	slot5 = "state"
	self._values.state = self.value(slot3, self)
	slot4 = self._values.state
	local state_index = table.index_of(self.value(slot3, self), CopActionAct._act_redirects.civilian_spawn)
	self._values.state = (state_index ~= -1 and state_index) or nil
	self._values.force_pickup = (self._values.force_pickup ~= "none" and self._values.force_pickup) or nil
	self._values.team = (self._values.team ~= "default" and self._values.team) or nil

	return 
end
function ElementSpawnCivilian:enemy_name()
	return self._enemy_name
end
function ElementSpawnCivilian:units()
	return self._units
end
function ElementSpawnCivilian:produce(params)
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).is_AI_enabled(slot3) then
		return 
	end

	if (not params or not params.team) and not self._values.team then
		slot5 = "non_combatant"
		local default_team_id = tweak_data.levels.get_default_team_ID(slot3, tweak_data.levels)
	end

	slot8 = self
	local unit = safe_spawn_unit(slot4, self.get_orientation(slot7))
	slot6 = unit
	unit.unit_data(self._enemy_name).mission_element = self
	slot7 = unit

	table.insert(self._enemy_name, self._units)

	if self._values.state then
		local state = CopActionAct._act_redirects.civilian_spawn[self._values.state]
		slot7 = unit

		if unit.brain(slot6) then
			local action_data = {
				align_sync = true,
				body_part = 1,
				type = "act",
				variant = state
			}
			local spawn_ai = {
				init_state = "idle",
				objective = {
					interrupt_health = 1,
					interrupt_dis = -1,
					type = "act",
					action = action_data
				}
			}
			slot9 = unit
			slot10 = spawn_ai

			unit.brain(slot8).set_spawn_ai(slot8, unit.brain(slot8))
		else
			slot7 = unit
			slot8 = state

			unit.base(slot6).play_state(slot6, unit.base(slot6))
		end
	end

	if self._values.force_pickup then
		slot6 = unit
		slot7 = self._values.force_pickup

		unit.character_damage(slot5).set_pickup(slot5, unit.character_damage(slot5))
	end

	slot6 = unit
	slot6 = unit.movement(slot5)
	slot9 = managers.groupai
	slot10 = default_team_id

	unit.movement(slot5).set_team(slot5, managers.groupai.state(slot8).team_data(slot8, managers.groupai.state(slot8)))

	slot8 = unit

	self.event(slot5, self, "spawn")

	return unit
end
function ElementSpawnCivilian:event(name, unit)
	if self._events and self._events[name] then
		slot5 = self._events[name]

		for _, callback in ipairs(slot4) do
			slot10 = unit

			callback(slot9)
		end
	end

	return 
end
function ElementSpawnCivilian:add_event_callback(name, callback)
	self._events = self._events or {}
	self._events[name] = self._events[name] or {}
	slot6 = callback

	table.insert(self._events[name] or , self._events[name])

	return 
end
function ElementSpawnCivilian:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).is_AI_enabled(slot3) then
		slot4 = Application

		if not Application.editor(slot3) then
			return 
		end
	end

	local unit = self.produce(slot3)
	slot6 = unit

	ElementSpawnCivilian.super.on_executed(self, self)

	return 
end
function ElementSpawnCivilian:unspawn_all_units()
	slot3 = self

	ElementSpawnEnemyDummy.unspawn_all_units(slot2)

	return 
end
function ElementSpawnCivilian:kill_all_units()
	slot3 = self

	ElementSpawnEnemyDummy.kill_all_units(slot2)

	return 
end
function ElementSpawnCivilian:execute_on_all_units(func)
	slot5 = func

	ElementSpawnEnemyDummy.execute_on_all_units(slot3, self)

	return 
end

return 
