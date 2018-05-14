slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpawnEnemyDummy then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnEnemyDummy = slot0
ElementSpawnEnemyDummy._unit_destroy_clbk_key = "ElementSpawnEnemyDummy"
ElementSpawnEnemyDummy.ACCESSIBILITIES = {
	"any",
	"walk",
	"acrobatic"
}
ElementSpawnEnemyDummy.init = function (self, ...)
	slot3 = self

	ElementSpawnEnemyDummy.super.init(slot2, ...)

	self._enemy_name = self._values.enemy
	self._values.enemy = nil
	self._units = {}
	self._events = {}
	slot3 = self

	self._finalize_values(nil)

	return 
end
ElementSpawnEnemyDummy._finalize_values = function (self)
	local values = self._values
	slot5 = "spawn_action"
	values.spawn_action = self.value(slot3, self)

	local function _save_boolean(name_in)
		values[name_in] = values[name_in] or nil

		return 
	end

	local function _nil_if_none(name_in)
		if not values[name_in] or values[name_in] == "none" then
			values[name_in] = nil
		end

		return 
	end

	local function _index_or_nil(table_in, name_in)
		slot5 = values[name_in]
		local found_index = table.index_of(slot3, table_in)
		values[name_in] = (found_index ~= -1 and found_index) or nil

		return 
	end

	slot7 = "force_pickup"

	_nil_if_none(slot6)

	slot8 = "spawn_action"

	_index_or_nil(slot6, CopActionAct._act_redirects.enemy_spawn)

	slot8 = "state"

	_index_or_nil(slot6, CopActionAct._act_redirects.civilian_spawn)

	slot7 = "participate_to_group_ai"

	_save_boolean(slot6)

	slot8 = "accessibility"

	_index_or_nil(slot6, self.ACCESSIBILITIES)

	values.voice = (values.voice and values.voice ~= 0 and values.voice) or nil

	if values.team == "default" then
		values.team = nil
	end

	slot7 = values
	self._values = clone(slot6)

	return 
end
ElementSpawnEnemyDummy.enemy_name = function (self)
	return self._enemy_name
end
ElementSpawnEnemyDummy._get_enemy = function (self)
	slot4 = "enemy"
	local enemy_name = self.value(slot2, self) or self._enemy_name
	enemy_name = enemy_name or "german_flamer"

	if EnemyManager.ENEMIES[enemy_name] then
		slot4 = EnemyManager.ENEMIES[enemy_name]

		return Idstring(slot3)
	else
		slot4 = enemy_name

		return Idstring(slot3)
	end

	return 
end
ElementSpawnEnemyDummy.units = function (self)
	return self._units
end
ElementSpawnEnemyDummy.produce = function (self, params)
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).is_AI_enabled(slot3) then
		return 
	end

	if params and params.name then
		slot7 = self
		local unit = safe_spawn_unit(slot3, self.get_orientation(slot6))
		slot5 = unit
		slot6 = self._unit_destroy_clbk_key
		slot11 = "clbk_unit_destroyed"

		unit.base(params.name).add_destroy_listener(params.name, unit.base(params.name), callback(slot8, self, self))

		slot5 = unit
		unit.unit_data(params.name).mission_element = self
		slot8 = self._values
		local spawn_ai = self._create_spawn_AI_parametric(params.name, self, params.stance, params.objective)
		slot6 = unit
		slot7 = spawn_ai

		unit.brain(self).set_spawn_ai(self, unit.brain(self))

		slot7 = unit

		table.insert(self, self._units)

		slot8 = unit

		self.event(self, self, "spawn")

		if self._values.force_pickup and self._values.force_pickup ~= "none" then
			slot6 = unit
			slot7 = self._values.force_pickup

			unit.character_damage(slot5).set_pickup(slot5, unit.character_damage(slot5))
		end
	else
		local enemy_name = self._get_enemy(slot3)
		slot8 = self
		local unit = safe_spawn_unit(self, self.get_orientation(slot7))
		slot6 = unit
		slot7 = self._unit_destroy_clbk_key
		slot12 = "clbk_unit_destroyed"

		unit.base(enemy_name).add_destroy_listener(enemy_name, unit.base(enemy_name), callback(slot9, self, self))

		unit.unit_data(enemy_name).mission_element = self
		local objective = nil
		local action = self._create_action_data(unit)
		slot8 = managers.groupai
		slot8 = managers.groupai.state(CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action])
		local stance = (managers.groupai.state(CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action]).enemy_weapons_hot(CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action]) and "cbt") or "ntl"

		if action.type == "act" then
			objective = {
				type = "act",
				action = action,
				stance = stance
			}
		end

		local spawn_ai = {
			init_state = "idle",
			objective = objective
		}
		slot10 = unit
		slot11 = spawn_ai

		unit.brain(slot9).set_spawn_ai(slot9, unit.brain(slot9))

		if (not params or not params.team) and not self._values.team then
			slot13 = unit
			slot13 = unit.base(slot12)
			slot11 = (unit.base(slot12).char_tweak(slot12).access == "gangster" and "gangster") or "combatant"
			local team_id = tweak_data.levels.get_default_team_ID(slot9, tweak_data.levels)
		end

		if self._values.participate_to_group_ai then
			slot11 = managers.groupai
			slot13 = team_id

			managers.groupai.state(slot10).assign_enemy_to_group_ai(slot10, managers.groupai.state(slot10), unit)
		else
			slot11 = managers.groupai
			slot13 = team_id

			managers.groupai.state(slot10).set_char_team(slot10, managers.groupai.state(slot10), unit)
		end

		if self._values.voice then
			slot11 = unit
			slot12 = self._values.voice

			unit.sound(slot10).set_voice_prefix(slot10, unit.sound(slot10))
		end

		slot12 = unit

		table.insert(slot10, self._units)

		slot13 = unit

		self.event(slot10, self, "spawn")

		if self._values.force_pickup and self._values.force_pickup ~= "none" then
			slot11 = unit
			slot12 = self._values.force_pickup

			unit.character_damage(slot10).set_pickup(slot10, unit.character_damage(slot10))
		end
	end

	return self._units[#self._units]
end
ElementSpawnEnemyDummy.clbk_unit_destroyed = function (self, unit)
	local u_key = unit.key(slot3)
	slot5 = self._units

	for i, owned_unit in ipairs(unit) do
		slot10 = owned_unit

		if owned_unit.key(slot9) == u_key then
			slot11 = i

			table.remove(slot9, self._units)
		end
	end

	return 
end
ElementSpawnEnemyDummy.event = function (self, name, unit)
	if self._events[name] then
		slot5 = self._events[name]

		for _, callback in ipairs(slot4) do
			slot10 = unit

			callback(slot9)
		end
	end

	return 
end
ElementSpawnEnemyDummy.add_event_callback = function (self, name, callback)
	self._events[name] = self._events[name] or {}
	slot6 = callback

	table.insert(self._events[name] or , self._events[name])

	return 
end
ElementSpawnEnemyDummy.on_executed = function (self, instigator)
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

	ElementSpawnEnemyDummy.super.on_executed(self, self)

	return 
end
ElementSpawnEnemyDummy._create_spawn_AI_parametric = function (self, stance, objective, spawn_properties)
	slot6 = CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action]
	local entry_action = self._create_action_data(slot5)

	if entry_action.type == "act" then
		local followup_objective = objective
		objective = {
			type = "act",
			action = entry_action,
			followup_objective = followup_objective
		}
	end

	return {
		init_state = "idle",
		stance = stance,
		objective = objective,
		params = {
			scan = true
		}
	}
end
ElementSpawnEnemyDummy._create_action_data = function (anim_name)
	if not anim_name or anim_name == "none" then
		return {
			sync = true,
			body_part = 1,
			type = "idle"
		}
	else
		return {
			align_sync = true,
			type = "act",
			body_part = 1,
			variant = anim_name,
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				walk = -1
			}
		}
	end

	return 
end
ElementSpawnEnemyDummy.unspawn_all_units = function (self)
	slot3 = self._units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot9 = false

			unit.brain(slot7).set_active(slot7, unit.brain(slot7))

			slot8 = unit
			slot10 = 0

			unit.base(slot7).set_slot(slot7, unit.base(slot7), unit)
		end
	end

	return 
end
ElementSpawnEnemyDummy.kill_all_units = function (self)
	slot3 = self._units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot9 = {
				damage = 1000
			}

			unit.character_damage(slot7).damage_mission(slot7, unit.character_damage(slot7))
		end
	end

	return 
end
ElementSpawnEnemyDummy.execute_on_all_units = function (self, func)
	slot4 = self._units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			func(slot8)
		end
	end

	return 
end
ElementSpawnEnemyDummy.accessibility = function (self)
	return self.ACCESSIBILITIES[self._values.accessibility]
end

return 
