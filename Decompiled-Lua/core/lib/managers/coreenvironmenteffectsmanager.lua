slot3 = "CoreEnvironmentEffectsManager"

core.module(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

EnvironmentEffectsManager = EnvironmentEffectsManager or class()
function EnvironmentEffectsManager:init()
	self._effects = {}
	self._current_effects = {}
	self._mission_effects = {}
	self._repeat_mission_effects = {}

	return 
end
function EnvironmentEffectsManager:add_effect(name, effect)
	self._effects[name] = effect
	slot5 = effect

	if effect.default(slot4) then
		slot6 = name

		self.use(slot4, self)
	end

	return 
end
function EnvironmentEffectsManager:effect(name)
	return self._effects[name]
end
function EnvironmentEffectsManager:effects()
	return self._effects
end
function EnvironmentEffectsManager:effects_names()
	local t = {}
	slot4 = self._effects

	for name, effect in pairs(slot3) do
		slot9 = effect

		if not effect.default(slot8) then
			slot10 = name

			table.insert(slot8, t)
		end
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function EnvironmentEffectsManager:use(effect)
	if self._effects[effect] then
		slot5 = self._effects[effect]

		if not table.contains(slot3, self._current_effects) then
			slot4 = self._effects[effect]

			self._effects[effect].load_effects(slot3)

			slot4 = self._effects[effect]

			self._effects[effect].start(slot3)

			slot5 = self._effects[effect]

			table.insert(slot3, self._current_effects)
		end
	else
		slot5 = "No effect named, " .. effect .. " availible to use"

		Application.error(slot3, Application)
	end

	return 
end
function EnvironmentEffectsManager:load_effects(effect)
	if self._effects[effect] then
		slot4 = self._effects[effect]

		self._effects[effect].load_effects(slot3)
	end

	return 
end
function EnvironmentEffectsManager:stop(effect)
	if self._effects[effect] then
		slot4 = self._effects[effect]

		self._effects[effect].stop(slot3)

		slot5 = self._effects[effect]

		table.delete(slot3, self._current_effects)
	end

	return 
end
function EnvironmentEffectsManager:stop_all()
	slot3 = self._current_effects

	for _, effect in ipairs(slot2) do
		slot8 = effect

		effect.stop(slot7)
	end

	self._current_effects = {}

	return 
end
function EnvironmentEffectsManager:update(t, dt)
	slot5 = self._current_effects

	for _, effect in ipairs(slot4) do
		slot12 = dt

		effect.update(slot9, effect, t)
	end

	slot5 = self._repeat_mission_effects

	for name, params in pairs(slot4) do
		params.next_time = params.next_time - dt

		if params.next_time <= 0 then
			slot11 = params.random_time
			slot9 = math.rand(slot10)
			params.next_time = params.base_time + slot9
			slot10 = World
			slot11 = params
			params.effect_id = World.effect_manager(slot9).spawn(slot9, World.effect_manager(slot9))

			if params.max_amount then
				params.max_amount = params.max_amount - 1

				if params.max_amount <= 0 then
					self._repeat_mission_effects[name] = nil
				end
			end
		end
	end

	return 
end
function EnvironmentEffectsManager:gravity_and_wind_dir()
	local wind_importance = 0.5
	slot6 = -982
	slot5 = Wind

	return Vector3(slot3, 0, 0) + Wind.wind_at(0, Vector3()) * wind_importance
end
function EnvironmentEffectsManager:spawn_mission_effect(name, params, world_id)
	if 0 < params.base_time or 0 < params.random_time then
		if self._repeat_mission_effects[name] then
			slot7 = name

			self.kill_mission_effect(slot5, self)
		end

		params.next_time = 0
		params.effect_id = nil
		self._repeat_mission_effects[name] = params

		return 
	end

	slot6 = World
	slot7 = params
	params.effect_id = World.effect_manager(slot5).spawn(slot5, World.effect_manager(slot5))
	params.world_id = world_id
	self._mission_effects[name] = self._mission_effects[name] or {}
	slot7 = params

	table.insert(self._mission_effects[name] or , self._mission_effects[name])

	return 
end
function EnvironmentEffectsManager:kill_world_mission_effects(world_id)
	slot4 = self._repeat_mission_effects

	for name, params in pairs(slot3) do
		if params.effect_id and params.world_id == world then
			slot9 = World
			slot10 = params.effect_id

			World.effect_manager(slot8).kill(slot8, World.effect_manager(slot8))

			self._repeat_mission_effects[name] = nil
		end
	end

	self._repeat_mission_effects = {}
	slot4 = self._mission_effects

	for name, effects in pairs(slot3) do
		if effects.world_id == world then
			slot9 = effects

			for _, params in ipairs(slot8) do
				slot14 = World
				slot15 = params.effect_id

				World.effect_manager(slot13).kill(slot13, World.effect_manager(slot13))
			end

			self._mission_effects[name] = nil
		end
	end

	return 
end
function EnvironmentEffectsManager:kill_all_mission_effects()
	slot3 = self._repeat_mission_effects

	for _, params in pairs(slot2) do
		if params.effect_id then
			slot8 = World
			slot9 = params.effect_id

			World.effect_manager(slot7).kill(slot7, World.effect_manager(slot7))
		end
	end

	self._repeat_mission_effects = {}
	slot3 = self._mission_effects

	for _, effects in pairs(slot2) do
		slot8 = effects

		for _, params in ipairs(slot7) do
			slot13 = World
			slot14 = params.effect_id

			World.effect_manager(slot12).kill(slot12, World.effect_manager(slot12))
		end
	end

	self._mission_effects = {}

	return 
end
function EnvironmentEffectsManager:kill_mission_effect(name)
	slot6 = "kill"

	self._kill_mission_effect(slot3, self, name)

	return 
end
function EnvironmentEffectsManager:fade_kill_mission_effect(name)
	slot6 = "fade_kill"

	self._kill_mission_effect(slot3, self, name)

	return 
end
function EnvironmentEffectsManager:_kill_mission_effect(name, type)
	slot8 = World
	slot7 = type
	local kill = callback(slot4, World.effect_manager(slot6), World.effect_manager(World))
	local params = self._repeat_mission_effects[name]

	if params then
		if params.effect_id then
			slot7 = params.effect_id

			kill(slot6)
		end

		self._repeat_mission_effects[name] = nil

		return 
	end

	local effects = self._mission_effects[name]

	if not effects then
		return 
	end

	slot8 = effects

	for _, params in ipairs(slot7) do
		slot13 = params.effect_id

		kill(slot12)
	end

	self._mission_effects[name] = nil

	return 
end
function EnvironmentEffectsManager:save(data)
	local state = {
		mission_effects = {}
	}
	slot5 = self._mission_effects

	for name, effects in pairs(slot4) do
		state.mission_effects[name] = {}
		slot10 = effects

		for _, params in pairs() do
			slot15 = World
			slot16 = params.effect_id

			if World.effect_manager(slot14).alive(slot14, World.effect_manager(slot14)) then
				slot16 = params

				table.insert(slot14, state.mission_effects[name])
			end
		end
	end

	data.EnvironmentEffectsManager = state

	return 
end
function EnvironmentEffectsManager:load(data)
	local state = data.EnvironmentEffectsManager
	slot5 = state.mission_effects

	for name, effects in pairs(slot4) do
		slot10 = effects

		for _, params in ipairs(slot9) do
			slot17 = params

			self.spawn_mission_effect(slot14, self, name)
		end
	end

	return 
end
EnvironmentEffect = EnvironmentEffect or class()
function EnvironmentEffect:init(default)
	self._default = default

	return 
end
function EnvironmentEffect:load_effects()
	return 
end
function EnvironmentEffect:update(t, dt)
	return 
end
function EnvironmentEffect:start()
	return 
end
function EnvironmentEffect:stop()
	return 
end
function EnvironmentEffect:default()
	return self._default
end

return 
