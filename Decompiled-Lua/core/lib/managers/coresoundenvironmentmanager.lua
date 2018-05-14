-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreShapeManager"

core.import(slot1, core)

CoreSoundEnvironmentManager = CoreSoundEnvironmentManager or class()
function CoreSoundEnvironmentManager:init()
	self._areas = {}
	self._areas_per_frame = 1
	self._check_objects = {}
	self._check_object_id = 0
	self._emitters = {}
	self._area_emitters = {}
	self._ambience_changed_callback = {}
	self._ambience_changed_callbacks = {}
	self._environment_changed_callback = {}
	self.GAME_DEFAULT_ENVIRONMENT = "padded_cell"
	self._default_environment = self.GAME_DEFAULT_ENVIRONMENT
	self._current_environment = self.GAME_DEFAULT_ENVIRONMENT
	slot4 = self.GAME_DEFAULT_ENVIRONMENT

	self._set_environment(slot2, self)

	slot3 = Application
	local in_editor = Application.editor(slot2)

	if in_editor then
		slot4 = self
		self._environments = self._environment_effects(slot3)
		self.GAME_DEFAULT_ENVIRONMENT = self._environments[1] or nil
		self._default_environment = self.GAME_DEFAULT_ENVIRONMENT
		self._current_environment = self.GAME_DEFAULT_ENVIRONMENT
		slot5 = self.GAME_DEFAULT_ENVIRONMENT

		self._set_environment(slot3, self)
	else
		slot5 = self.GAME_DEFAULT_ENVIRONMENT

		self._set_environment(slot3, self)
	end

	if in_editor then
		slot4 = self

		self._find_emitter_events(slot3)

		slot4 = self

		self._find_ambience_events(slot3)

		slot4 = self

		self._find_scene_events(slot3)

		slot4 = self

		self._find_occasional_events(slot3)

		self.GAME_DEFAULT_EMITTER_PATH = self._emitter.paths[1]
		self.GAME_DEFAULT_AMBIENCE = self._ambience.events[1]
		self._default_ambience = self.GAME_DEFAULT_AMBIENCE
		self.GAME_DEFAULT_OCCASIONAL = self._occasional.events[1]
		self._default_occasional = self.GAME_DEFAULT_OCCASIONAL
		self.GAME_DEFAULT_SCENE_PATH = self._scene.paths[1]
	end

	self._ambience_enabled = false
	slot5 = "X360"
	self._occasional_blocked_by_platform = SystemInfo.platform(slot3) == Idstring(SystemInfo)
	self._ambience_sources_count = 1
	self.POSITION_OFFSET = 50
	self._active_ambience_soundbanks = {}
	slot5 = "occasional"
	self._occasional_sound_source = SoundDevice.create_source(slot3, SoundDevice)

	return 
end
function CoreSoundEnvironmentManager:_find_emitter_events()
	self._emitter = {
		events = {},
		paths = {},
		soundbanks = {}
	}
	slot5 = SoundDevice

	for _, soundbank in ipairs(SoundDevice.sound_banks(slot4)) do
		slot11 = soundbank

		for event, data in pairs(SoundDevice.events(slot9, SoundDevice)) do
			slot14 = "emitter"

			if string.match(slot12, event) then
				slot14 = data.path

				if not table.contains(slot12, self._emitter.paths) then
					slot14 = data.path

					table.insert(slot12, self._emitter.paths)
				end

				self._emitter.events[data.path] = self._emitter.events[data.path] or {}
				slot14 = event

				table.insert(data.path, self._emitter.events[data.path])

				self._emitter.soundbanks[event] = soundbank
			end
		end
	end

	slot3 = self._emitter.paths

	table.sort(slot2)

	return 
end
function CoreSoundEnvironmentManager:_find_ambience_events()
	self._ambience = {
		events = {},
		soundbanks = {}
	}
	slot5 = SoundDevice

	for _, soundbank in ipairs(SoundDevice.sound_banks(slot4)) do
		slot11 = soundbank

		for event, data in pairs(SoundDevice.events(slot9, SoundDevice)) do
			slot14 = "ambience"

			if string.match(slot12, event) then
				slot14 = event

				table.insert(slot12, self._ambience.events)

				self._ambience.soundbanks[event] = soundbank
			end
		end
	end

	slot3 = self._ambience.events

	table.sort(slot2)

	return 
end
function CoreSoundEnvironmentManager:_find_scene_events()
	self._scene = {
		events = {},
		paths = {},
		soundbanks = {}
	}
	slot5 = SoundDevice

	for _, soundbank in ipairs(SoundDevice.sound_banks(slot4)) do
		slot11 = soundbank

		for event, data in pairs(SoundDevice.events(slot9, SoundDevice)) do
			slot14 = data.path

			if not table.contains(slot12, self._scene.paths) then
				slot14 = data.path

				table.insert(slot12, self._scene.paths)
			end

			self._scene.events[data.path] = self._scene.events[data.path] or {}
			slot14 = event

			table.insert(data.path, self._scene.events[data.path])

			self._scene.soundbanks[event] = soundbank
		end
	end

	slot3 = self._scene.paths

	table.sort(slot2)

	return 
end
function CoreSoundEnvironmentManager:_find_occasional_events()
	self._occasional = {
		events = {},
		soundbanks = {}
	}
	slot5 = SoundDevice

	for _, soundbank in ipairs(SoundDevice.sound_banks(slot4)) do
		slot11 = soundbank

		for event, data in pairs(SoundDevice.events(slot9, SoundDevice)) do
			slot14 = "occasional"

			if string.match(slot12, event) then
				slot14 = event

				table.insert(slot12, self._occasional.events)

				self._occasional.soundbanks[event] = soundbank
			end
		end
	end

	slot3 = self._occasional.events

	table.sort(slot2)

	return 
end
function CoreSoundEnvironmentManager:areas()
	return self._areas
end
function CoreSoundEnvironmentManager:game_default_ambience()
	return self.GAME_DEFAULT_AMBIENCE
end
function CoreSoundEnvironmentManager:game_default_occasional()
	return self.GAME_DEFAULT_OCCASIONAL
end
function CoreSoundEnvironmentManager:game_default_emitter_path()
	return self.GAME_DEFAULT_EMITTER_PATH
end
function CoreSoundEnvironmentManager:emitter_paths()
	return self._emitter.paths
end
function CoreSoundEnvironmentManager:emitter_events(path)
	return (path and self._emitter.events[path]) or self._emitter.events
end
function CoreSoundEnvironmentManager:emitter_soundbank(event)
	if not self._emitter then
		return 
	end

	return self._emitter.soundbanks[event]
end
function CoreSoundEnvironmentManager:emitter_soundbanks()
	if not self._emitter then
		return 
	end

	return self._emitter.soundbanks
end
function CoreSoundEnvironmentManager:ambience_events()
	return self._ambience.events
end
function CoreSoundEnvironmentManager:ambience_soundbank(event)
	if not self._ambience then
		return 
	end

	return self._ambience.soundbanks[event]
end
function CoreSoundEnvironmentManager:ambience_soundbanks()
	if not self._ambience then
		return 
	end

	return self._ambience.soundbanks
end
function CoreSoundEnvironmentManager:occasional_events()
	if not self._occasional then
		return 
	end

	return self._occasional.events
end
function CoreSoundEnvironmentManager:occasional_soundbank(event)
	if not self._occasional then
		return 
	end

	return self._occasional.soundbanks[event]
end
function CoreSoundEnvironmentManager:occasional_soundbanks()
	if not self._occasional then
		return 
	end

	return self._occasional.soundbanks
end
function CoreSoundEnvironmentManager:game_default_scene_path()
	return self.GAME_DEFAULT_SCENE_PATH
end
function CoreSoundEnvironmentManager:scene_paths()
	return self._scene.paths
end
function CoreSoundEnvironmentManager:scene_events(path)
	return (path and self._scene.events[path]) or self._scene.events
end
function CoreSoundEnvironmentManager:scene_soundbank(event)
	return self._scene.soundbanks[event]
end
function CoreSoundEnvironmentManager:scene_soundbanks()
	return self._scene.soundbanks
end
function CoreSoundEnvironmentManager:scene_path(event)
	slot4 = self._scene.events

	for path, events in pairs(slot3) do
		slot10 = event

		if table.contains(slot8, events) then
			return path
		end
	end

	return 
end
function CoreSoundEnvironmentManager:emitters()
	return self._emitters
end
function CoreSoundEnvironmentManager:area_emitters()
	return self._area_emitters
end
function CoreSoundEnvironmentManager:_environment_effects()
	local effects = {}
	slot6 = SoundDevice

	for name, _ in pairs(SoundDevice.effects(slot5)) do
		slot10 = name

		table.insert(slot8, effects)
	end

	slot4 = effects

	table.sort(slot3)

	return effects
end
function CoreSoundEnvironmentManager:environments()
	return self._environments
end
function CoreSoundEnvironmentManager:game_default_environment()
	return self.GAME_DEFAULT_ENVIRONMENT
end
function CoreSoundEnvironmentManager:default_environment()
	return self._default_environment
end
function CoreSoundEnvironmentManager:set_default_environment(environment)
	self._default_environment = environment
	slot5 = self._default_environment

	self._set_environment(slot3, self)

	slot5 = self._default_environment

	self._change_acoustic(slot3, self)

	return 
end
function CoreSoundEnvironmentManager:_set_environment(environment)
	slot4 = self._environment_changed_callback

	for _, func in ipairs(slot3) do
		slot9 = environment

		func(slot8)
	end

	self._current_environment = environment
	slot5 = {
		gain = 1,
		effect = environment
	}

	SoundDevice.set_default_environment(slot3, SoundDevice)

	return 
end
function CoreSoundEnvironmentManager:current_environment()
	return self._current_environment
end
function CoreSoundEnvironmentManager:set_default_ambience(ambience_event)
	if not ambience_event then
		return 
	end

	self._default_ambience = ambience_event
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = self
		slot8 = self._default_ambience

		self.add_soundbank(slot3, self.ambience_soundbank(slot6, self))
	end

	slot4 = self._check_objects

	for id, data in pairs(slot3) do
		slot10 = data

		self._change_ambience(slot8, self)
	end

	return 
end
function CoreSoundEnvironmentManager:default_ambience()
	return self._default_ambience
end
function CoreSoundEnvironmentManager:set_default_occasional(occasional_event)
	if not occasional_event then
		return 
	end

	if occasional_event then
		slot4 = Application

		if Application.editor(slot3) then
			slot6 = managers.sound_environment

			if not table.contains(slot3, managers.sound_environment.occasional_events(occasional_event)) then
				if managers.editor then
					slot5 = "Default occasional event " .. occasional_event .. " no longer exits. Falls back on default."

					managers.editor.output_error(slot3, managers.editor)
				end

				slot4 = managers.sound_environment
				occasional_event = managers.sound_environment.game_default_occasional(slot3)
			end
		end
	end

	self._default_occasional = occasional_event
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = self
		slot8 = self._default_occasional

		self.add_soundbank(slot3, self.occasional_soundbank(slot6, self))
	end

	return 
end
function CoreSoundEnvironmentManager:default_occasional()
	return self._default_occasional
end
function CoreSoundEnvironmentManager:add_soundbank(soundbank)
	if not soundbank then
		slot5 = "Cant load nil soundbank"

		Application.error(slot3, Application)

		return 
	end

	slot4 = Application

	if Application.editor(slot3) then
		slot4 = "bnk".id(slot5)
		slot7 = soundbank

		CoreEngineAccess._editor_load(slot3, soundbank.id("bnk"))
	end

	return 
end
function CoreSoundEnvironmentManager:set_to_default()
	slot4 = self.GAME_DEFAULT_ENVIRONMENT

	self.set_default_environment(slot2, self)

	slot4 = self.GAME_DEFAULT_AMBIENCE

	self.set_default_ambience(slot2, self)

	slot4 = self.GAME_DEFAULT_OCCASIONAL

	self.set_default_occasional(slot2, self)

	slot4 = false

	self.set_ambience_enabled(slot2, self)

	return 
end
function CoreSoundEnvironmentManager:add_area(area_params, world_id)
	slot6 = area_params
	local area = SoundEnvironmentArea.new(slot4, SoundEnvironmentArea)
	area._world_id = world_id
	slot7 = area

	table.insert(SoundEnvironmentArea, self._areas)

	return area
end
function CoreSoundEnvironmentManager:remove_area(area)
	slot4 = area

	area.remove(slot3)

	slot4 = self._check_objects

	for _, data in pairs(slot3) do
		if area == data.area then
			data.area = nil
			slot10 = data

			self._change_ambience(slot8, self)
		end

		data.sound_area_counter = 1
	end

	slot5 = area

	table.delete(slot3, self._areas)

	return 
end
function CoreSoundEnvironmentManager:enable_area(name, enable)
	slot5 = self._areas

	for _, area in pairs(slot4) do
		slot10 = area

		if area.name(slot9) == name then
			if enable then
				slot10 = area

				area._add_environment(slot9)

				slot11 = true

				area.enable(slot9, area)
			else
				slot10 = area

				area._remove_environment(slot9)

				slot11 = false

				area.enable(slot9, area)
			end

			return 
		end
	end

	return 
end
function CoreSoundEnvironmentManager:add_emitter(emitter_params, world_id)
	slot6 = emitter_params
	local emitter = SoundEnvironmentEmitter.new(slot4, SoundEnvironmentEmitter)
	emitter._world_id = world_id
	slot7 = emitter

	table.insert(SoundEnvironmentEmitter, self._emitters)

	return emitter
end
function CoreSoundEnvironmentManager:remove_emitter(emitter)
	slot4 = emitter

	emitter.destroy(slot3)

	slot5 = emitter

	table.delete(slot3, self._emitters)

	return 
end
function CoreSoundEnvironmentManager:add_area_emitter(emitter_params, world_id)
	slot6 = emitter_params
	local emitter = SoundEnvironmentAreaEmitter.new(slot4, SoundEnvironmentAreaEmitter)
	emitter._world_id = world_id
	slot7 = emitter

	table.insert(SoundEnvironmentAreaEmitter, self._area_emitters)

	return emitter
end
function CoreSoundEnvironmentManager:remove_area_emitter(emitter)
	slot4 = emitter

	emitter.destroy(slot3)

	slot5 = emitter

	table.delete(slot3, self._area_emitters)

	return 
end
function CoreSoundEnvironmentManager:add_listener(data)
	slot5 = "add_listener function is no longer working because of new sound implementation. Use add_check_object instead."

	Application.throw_exception(slot3, Application)

	slot5 = data.listener
	local distance, orientation, occlusion = Sound.listener(slot3, Sound)
	data.object = distance
	slot8 = data

	return self.add_check_object(slot6, self)
end
function CoreSoundEnvironmentManager:add_check_object(data)
	if not data.object then
		slot5 = "Must use an Object3D when adding check objects to sound environment manager."

		Application.error(slot3, Application)

		return nil
	end

	slot4 = self

	self._disable_fallback(slot3)

	self._check_object_id = self._check_object_id + 1
	slot5 = "ambience_source"
	local soundsource = SoundDevice.create_source(slot3, SoundDevice)
	slot6 = true

	soundsource.enable_env(SoundDevice, soundsource)

	local surround = {}

	for i = 1, self._ambience_sources_count, 1 do
		slot11 = "ambience_surround_" .. i
		local source = SoundDevice.create_source(slot9, SoundDevice)
		slot12 = true

		source.enable_env(SoundDevice, source)

		local distance = 15000
		local x = ((i == 1 or i == 4) and -distance) or distance
		local y = ((i == 1 or i == 2) and distance) or -distance
		slot16 = 0
		local offset = Vector3(slot13, x, y)
		slot18 = data.object
		slot16 = data.object.position(slot17) + offset

		source.set_position(x, source)

		slot16 = {
			source = source,
			offset = offset
		}

		table.insert(x, surround)
	end

	local t = {
		sound_area_counter = 1,
		object = data.object,
		soundsource = soundsource,
		surround = surround,
		surround_iterator = (surround and 0) or nil,
		active = data.active,
		listener = data.listener,
		primary = data.primary,
		id = self._check_object_id
	}
	slot7 = self
	t.next_occasional = self._next_occasional(slot6)
	slot8 = t

	self._change_ambience(slot6, self)

	self._check_objects[self._check_object_id] = t

	return self._check_object_id
end
function CoreSoundEnvironmentManager:remove_check_object(id)
	local remove_object = self._check_objects[id]
	slot5 = remove_object.soundsource

	remove_object.soundsource.stop(slot4)

	if remove_object.surround then
		slot5 = remove_object.surround

		for _, surround_data in ipairs(slot4) do
			slot10 = surround_data.source

			surround_data.source.stop(slot9)
		end
	end

	self._check_objects[id] = nil
	slot5 = self

	self._enable_fallback(nil)

	return 
end
function CoreSoundEnvironmentManager:set_check_object_active(id, active)
	local object = self._check_objects[id]

	if object.active == active then
		return 
	end

	object.active = active

	if not active then
		slot6 = object.soundsource

		object.soundsource.stop(slot5)

		if object.surround then
			slot6 = object.surround

			for _, surround_data in ipairs(slot5) do
				slot11 = surround_data.source

				surround_data.source.stop(slot10)
			end
		end
	else
		slot7 = object

		self._check_inside(slot5, self)

		if not object.area then
			slot8 = 1

			self._change_ambience(slot5, self, object)
		end
	end

	return 
end
function CoreSoundEnvironmentManager:obj_alive(id)
	local data = self._check_objects[id]

	if data then
		slot5 = data.object
		slot3 = alive(slot4)
	end

	return slot3
end
function CoreSoundEnvironmentManager:check_object(id)
	return self._check_objects[id]
end
function CoreSoundEnvironmentManager:_disable_fallback()
	local fallback = self._check_objects[self._fallback_id]

	if fallback then
		slot6 = false

		self.set_check_object_active(slot3, self, self._fallback_id)
	end

	return 
end
function CoreSoundEnvironmentManager:_enable_fallback()
	local fallback = self._check_objects[self._fallback_id]

	if fallback and not fallback.active then
		slot4 = self._check_objects

		for id, object in pairs(slot3) do
			if object ~= fallback then
				return 
			end
		end

		slot6 = true

		self.set_check_object_active(slot3, self, self._fallback_id)
	end

	return 
end
function CoreSoundEnvironmentManager:_next_occasional()
	slot4 = 4

	return Application.time(slot2) + 6 + math.rand(Application)
end
local check_pos = Vector3()
local mvec_surround_pos = Vector3()
function CoreSoundEnvironmentManager:_update_object(t, dt, id, data)
	slot8 = check_pos

	data.object.m_position(slot6, data.object)

	local still_inside = nil

	if data.surround then
		local surround_data = data.surround[data.surround_iterator + 1]
		slot10 = check_pos

		mvector3.set(slot8, mvec_surround_pos)

		slot10 = surround_data.offset

		mvector3.add(slot8, mvec_surround_pos)

		slot10 = mvec_surround_pos

		surround_data.source.set_position(slot8, surround_data.source)

		slot10 = self._ambience_sources_count
		data.surround_iterator = math.mod(slot8, data.surround_iterator + 1)
	end

	if data.next_occasional < t then
		slot8 = self
		data.next_occasional = self._next_occasional(slot7)

		if self._ambience_enabled and not self._occasional_blocked_by_platform then
		end
	end

	if data.area then
		slot9 = check_pos
		still_inside = data.area.still_inside(slot7, data.area)

		if still_inside then
			return data.area
		end

		slot9 = data

		if self._check_inside(slot7, self) then
			return data.area
		end

		slot9 = self._default_environment

		self._change_acoustic(slot7, self)

		slot9 = data

		self._change_ambience(slot7, self)
	end

	slot9 = data

	if self._check_inside(slot7, self) then
		return data.area
	end

	return nil
end
function CoreSoundEnvironmentManager:_fallback_on_camera()
	if not self._use_fallback_on_camera then
		return 
	end

	slot3 = managers.viewport
	local vps = managers.viewport.active_viewports(slot2)

	if #vps == 0 then
		return 
	end

	slot4 = vps[1]
	local camera = vps[1].camera(slot3)

	if not camera then
		return 
	end

	local fallback = self._check_objects[self._fallback_id]

	if fallback then
		if fallback.object ~= camera then
			fallback.object = camera
		end
	else
		slot6 = self._check_objects

		if not next(slot5) then
			slot7 = {
				primary = true,
				active = true,
				object = camera
			}
			self._fallback_id = self.add_check_object(slot5, self)
			slot7 = self._fallback_id
			self.check_object(slot5, self).fallback = true
		end
	end

	return 
end
function CoreSoundEnvironmentManager:update(t, dt)
	slot5 = self._check_objects

	for id, data in pairs(slot4) do
		if data.active then
			slot14 = data

			self._update_object(slot9, self, t, dt, id)
		end
	end

	return 
end
function CoreSoundEnvironmentManager:_change_ambience(data, sound_gain)

	-- Decompilation error in this vicinity:
	local area = data.area
	slot7 = self._ambience_changed_callback

	for _, func in ipairs(slot6) do
		slot12 = ambience_event

		func(slot11)
	end

	if not self._ambience_enabled then
		return 
	end

	if data.surround then
		slot7 = data.surround

		for _, surround_data in ipairs(slot6) do
			slot13 = ambience_event

			surround_data.source.post_event(slot11, surround_data.source)
		end
	end

	return 
end
function CoreSoundEnvironmentManager:_change_acoustic(environment)
	self._acoustic = environment

	if tweak_data.sound.acoustics[environment] and tweak_data.sound.acoustics[environment].states then
		slot4 = tweak_data.sound.acoustics[environment].states

		for state, value in pairs(slot3) do
			slot12 = value

			Application.trace(slot8, Application, "set state", state)

			slot11 = value

			SoundDevice.set_state(slot8, SoundDevice, state)
		end
	end

	return 
end
local check_pos2 = Vector3()
function CoreSoundEnvironmentManager:_check_inside(data)
	if 0 < #self._areas then
		local check_pos = check_pos2
		slot6 = check_pos

		data.object.m_position(slot4, data.object)

		for i = 1, self._areas_per_frame, 1 do
			local area = self._areas[data.sound_area_counter]
			slot11 = #self._areas
			data.sound_area_counter = math.mod(slot9, data.sound_area_counter) + 1
			slot11 = check_pos

			if area.is_inside(slot9, area) then
				data.area = area
				slot10 = self

				self._change_acoustic(slot9, data.area.environment(slot12))

				slot11 = data

				self._change_ambience(slot9, self)

				slot11 = "Acoustic flag "
				slot14 = data.area

				Application.trace(slot9, Application, data.area.environment(data.area))

				return area
			end
		end
	end

	data.area = nil

	return data.area
end
function CoreSoundEnvironmentManager:ambience_enabled()
	return self._ambience_enabled
end
function CoreSoundEnvironmentManager:set_ambience_enabled(enabled)
	self._ambience_enabled = enabled

	if not self._default_ambience then
		return 
	end

	slot4 = self._check_objects

	for _, data in pairs(slot3) do
		if self._ambience_enabled and data.active then
			slot10 = data

			self._change_ambience(slot8, self)
		else
			slot9 = data.soundsource

			data.soundsource.stop(slot8)

			if data.surround then
				slot9 = data.surround

				for _, surround_data in ipairs(slot8) do
					slot14 = surround_data.source

					surround_data.source.stop(slot13)
				end
			end
		end
	end

	return 
end
function CoreSoundEnvironmentManager:environment_at_position(pos)
	local environment = self._default_environment
	local ambience = self._default_ambience
	local occasional = self._default_occasional
	slot7 = self._areas

	for _, area in ipairs(slot6) do
		slot13 = pos

		if area.is_inside(slot11, area) then
			slot12 = area
			environment = area.environment(slot11)
			slot12 = area
			ambience = area.ambience_event(slot11)
			slot12 = area
			occasional = area.occasional_event(slot11)

			break
		end
	end

	return environment, ambience, occasional
end
function CoreSoundEnvironmentManager:apply_ambience_switch(switch_name, switch_value)
	self._current_switch_values = self._current_switch_values or {}
	slot5 = self._check_objects

	for _, data in pairs(slot4) do
		slot14 = data
		slot14 = switch_value

		Application.trace(slot9, Application, "[CoreSoundEnvironmentManager:_apply_switch]  ", inspect(slot13), switch_name)

		slot12 = switch_value

		data.soundsource.set_switch(slot9, data.soundsource, switch_name)

		if data.surround then
			slot10 = data.surround

			for _, surround_data in ipairs(slot9) do
				slot17 = switch_value

				surround_data.source.set_switch(slot14, surround_data.source, switch_name)
			end
		end
	end

	self._current_switch_values[switch_name] = switch_value

	return 
end
function CoreSoundEnvironmentManager:add_ambience_changed_callback(func, id)
	if id then
		self._ambience_changed_callbacks[id] = self._ambience_changed_callbacks[id] or {}
		slot6 = func

		table.insert(self._ambience_changed_callbacks[id] or , self._ambience_changed_callbacks[id])

		return 
	end

	slot6 = func

	table.insert(slot4, self._ambience_changed_callback)

	return 
end
function CoreSoundEnvironmentManager:remove_ambience_changed_callback(func, id)
	if id and self._ambience_changed_callbacks[id] then
		slot6 = func

		table.delete(slot4, self._ambience_changed_callbacks[id])

		return 
	end

	slot6 = func

	table.delete(slot4, self._ambience_changed_callback)

	return 
end
function CoreSoundEnvironmentManager:add_environment_changed_callback(func)
	slot5 = func

	table.insert(slot3, self._environment_changed_callback)

	return 
end
function CoreSoundEnvironmentManager:remove_environment_changed_callback(func)
	slot5 = func

	table.delete(slot3, self._environment_changed_callback)

	return 
end
function CoreSoundEnvironmentManager:destroy()
	slot3 = self._emitters

	for i, emitter in ipairs(slot2) do
		slot8 = emitter

		emitter.destroy(slot7)
	end

	self._emitters = {}
	slot3 = self._areas

	for _, env_area in ipairs(slot2) do
		slot8 = env_area

		env_area.remove(slot7)
	end

	self._areas = {}
	slot3 = self._area_emitters

	for i, area_emitter in ipairs(slot2) do
		slot8 = area_emitter

		area_emitter.destroy(slot7)
	end

	self._area_emitters = {}

	if self._occasional_sound_source then
		slot3 = self._occasional_sound_source

		self._occasional_sound_source.stop(slot2)
	end

	return 
end
function CoreSoundEnvironmentManager:destroy_world_sounds(world_id)
	for i = #self._emitters, 1, -1 do
		local emitter = self._emitters[i]

		if emitter._world_id == world_id then
			slot10 = emitter

			self.remove_emitter(slot8, self)
		end
	end

	for i = #self._areas, 1, -1 do
		local env_area = self._areas[i]

		if env_area._world_id == world_id then
			slot10 = env_area

			self.remove_area(slot8, self)
		end
	end

	for i = #self._area_emitters, 1, -1 do
		local area = self._area_emitters[i]

		if area._world_id == world_id then
			slot10 = area

			self.remove_area_emitter(slot8, self)
		end
	end

	return 
end

if not SoundEnvironmentArea then
	slot5 = CoreShapeManager.ShapeBox
	slot3 = class(slot4)
end

SoundEnvironmentArea = slot3
function SoundEnvironmentArea:init(params)
	params.type = "box"
	slot5 = params

	SoundEnvironmentArea.super.init(slot3, self)

	if not params.environment then
		slot4 = managers.sound_environment
		slot2 = managers.sound_environment.game_default_environment(slot3)
	end

	self._environment = slot2

	if not params.ambience_event then
		slot4 = managers.sound_environment
		slot2 = managers.sound_environment.game_default_ambience(slot3)
	end

	self._ambience_event = slot2

	if not params.occasional_event then
		slot4 = managers.sound_environment
		slot2 = managers.sound_environment.game_default_occasional(slot3)
	end

	self._occasional_event = slot2
	self._use_environment = params.use_environment or (params.use_environment == nil and true)
	self._use_ambience = params.use_ambience or (params.use_ambience == nil and true)
	self._use_occasional = params.use_occasional or (params.use_occasional == nil and true)
	self._gain = params.gain or 0
	self._name = params.name or ""
	self._enable = true
	slot4 = self

	self._init_environment_effect(slot3)

	slot4 = self

	self._init_event(slot3)

	slot8 = self
	self._environment_shape = EnvironmentShape(slot3, self.position(self.size(self)), self.rotation(self))
	slot4 = self

	self._add_environment(slot3)

	slot4 = Application

	if Application.editor(slot3) then
		slot4 = managers.sound_environment
		slot8 = self._ambience_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.ambience_soundbank(slot6, managers.sound_environment))

		slot4 = managers.sound_environment
		slot8 = self._occasional_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.occasional_soundbank(slot6, managers.sound_environment))
	end

	return 
end
function SoundEnvironmentArea:_init_event()
	slot3 = Application

	if Application.editor(slot2) then
		slot5 = managers.sound_environment

		if not table.contains(slot2, managers.sound_environment.ambience_events(self._ambience_event)) then
			slot4 = "Ambience event " .. self._ambience_event .. " no longer exits. Falls back on default."

			managers.editor.output_error(slot2, managers.editor)

			slot3 = self
			slot6 = managers.sound_environment

			self.set_environment_ambience(slot2, managers.sound_environment.game_default_ambience(self._ambience_event))
		end

		if self._occasional_event then
			slot5 = managers.sound_environment

			if not table.contains(slot2, managers.sound_environment.occasional_events(self._occasional_event)) then
				slot4 = "Occasional event " .. self._occasional_event .. " no longer exits. Falls back on default."

				managers.editor.output_error(slot2, managers.editor)

				slot3 = self
				slot6 = managers.sound_environment

				self.set_environment_occasional(slot2, managers.sound_environment.game_default_occasional(self._occasional_event))
			end
		end
	end

	return 
end
function SoundEnvironmentArea:_init_environment_effect()
	slot3 = Application

	if Application.editor(slot2) then
		slot5 = managers.sound_environment

		if not table.contains(slot2, managers.sound_environment.environments(self._environment)) then
			slot4 = "Environment effect " .. self._environment .. " no longer exits. Falls back on default."

			managers.editor.output_error(slot2, managers.editor)

			slot3 = self
			slot6 = managers.sound_environment

			self.set_environment(slot2, managers.sound_environment.game_default_environment(self._environment))
		end
	end

	return 
end
function SoundEnvironmentArea:_add_environment()
	if self._use_environment and not self._environment_id then
		slot4 = {
			effect = self._environment,
			gain = self._gain,
			shape = self._environment_shape
		}
		self._environment_id = SoundDevice.add_environment(slot2, SoundDevice)
	end

	return 
end
function SoundEnvironmentArea:_remove_environment()
	if self._environment_id then
		slot4 = self._environment_id

		SoundDevice.remove_environment(slot2, SoundDevice)

		self._environment_id = nil
	end

	return 
end
function SoundEnvironmentArea:enable(enable)
	self._enable = enable

	return 
end
function SoundEnvironmentArea:name()
end
function SoundEnvironmentArea:environment()
	return self._environment
end
function SoundEnvironmentArea:set_environment(environment)
	self._environment = environment
	slot4 = self

	self._update_environment(slot3)

	return 
end
function SoundEnvironmentArea:ambience_event()
	return self._ambience_event
end
function SoundEnvironmentArea:set_environment_ambience(ambience_event)

	-- Decompilation error in this vicinity:
	if not ambience_event then
		return 
	end

	self._ambience_event = ambience_event
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = managers.sound_environment
		slot8 = self._ambience_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.ambience_soundbank(slot6, managers.sound_environment))
	end

	return 
end
function SoundEnvironmentArea:set_use_ambience(use_ambience)
	self._use_ambience = use_ambience

	return 
end
function SoundEnvironmentArea:use_ambience()
	return self._use_ambience
end
function SoundEnvironmentArea:occasional_event()
	return self._occasional_event
end
function SoundEnvironmentArea:set_environment_occasional(occasional_event)
	self._occasional_event = occasional_event

	if not occasional_event then
		return 
	end

	slot4 = Application

	if Application.editor(slot3) then
		slot4 = managers.sound_environment
		slot8 = self._occasional_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.occasional_soundbank(slot6, managers.sound_environment))
	end

	return 
end
function SoundEnvironmentArea:set_use_occasional(use_occasional)
	self._use_occasional = use_occasional

	return 
end
function SoundEnvironmentArea:use_occasional()
	return self._use_occasional
end
function SoundEnvironmentArea:set_use_environment(use_environment)
	self._use_environment = use_environment

	if self._use_environment then
		slot4 = self

		self._add_environment(slot3)
	else
		slot4 = self

		self._remove_environment(slot3)
	end

	return 
end
function SoundEnvironmentArea:use_environment()
	return self._use_environment
end
function SoundEnvironmentArea:set_unit(unit)
	slot5 = unit

	SoundEnvironmentArea.super.set_unit(slot3, self)

	slot4 = self._environment_shape
	slot7 = unit

	self._environment_shape.link(slot3, unit.orientation_object(slot6))

	return 
end
function SoundEnvironmentArea:_update_environment()
	if self._environment_id then
		slot5 = {
			effect = self._environment,
			gain = self._gain,
			shape = self._environment_shape
		}

		SoundDevice.update_environment(slot2, SoundDevice, self._environment_id)
	end

	return 
end
function SoundEnvironmentArea:_update_environment_size()
	slot3 = self._environment_shape
	slot6 = self

	self._environment_shape.set_size(slot2, self.size(slot5))

	slot3 = self

	self._update_environment(slot2)

	return 
end
function SoundEnvironmentArea:set_property(property, value)
	slot7 = value

	SoundEnvironmentArea.super.set_property(slot4, self, property)

	slot5 = self

	self._update_environment_size(slot4)

	return 
end
function SoundEnvironmentArea:set_width(width)
	slot5 = width

	SoundEnvironmentArea.super.set_width(slot3, self)

	slot4 = self

	self._update_environment_size(slot3)

	return 
end
function SoundEnvironmentArea:set_depth(depth)
	slot5 = depth

	SoundEnvironmentArea.super.set_depth(slot3, self)

	slot4 = self

	self._update_environment_size(slot3)

	return 
end
function SoundEnvironmentArea:set_height(height)
	slot5 = height

	SoundEnvironmentArea.super.set_height(slot3, self)

	slot4 = self

	self._update_environment_size(slot3)

	return 
end
function SoundEnvironmentArea:remove()
	slot3 = self

	self._remove_environment(slot2)

	return 
end
function SoundEnvironmentArea:still_inside(pos)
	if not self._enable or not self._use_ambience then
		return false
	end

	slot5 = pos

	return SoundEnvironmentArea.super.still_inside(slot3, self)
end
function SoundEnvironmentArea:is_inside(pos)
	if not self._enable or not self._use_ambience then
		return false
	end

	slot5 = pos

	return SoundEnvironmentArea.super.is_inside(slot3, self)
end
SoundEnvironmentEmitter = SoundEnvironmentEmitter or class()
function SoundEnvironmentEmitter:init(params)
	self._position = params.position or Vector3()
	self._rotation = params.rotation or Rotation()
	self._name = params.name or ""
	slot5 = self._name
	self._soundsource = SoundDevice.create_source(slot3, SoundDevice)
	slot4 = managers.sound_environment
	local emitter_path = managers.sound_environment.game_default_emitter_path(slot3)
	slot5 = self
	slot3 = self.set_emitter_event

	if not params.emitter_event then
		slot9 = emitter_path
		slot6 = managers.sound_environment.emitter_events(slot7, managers.sound_environment)[1]
	end

	slot3(slot4, slot5)

	return 
end
function SoundEnvironmentEmitter:save_xml(t)
	local properties = {}
	slot5 = self
	properties.name = self.name(slot4)
	slot5 = self
	properties.position = self.position(slot4)
	slot5 = self
	properties.rotation = self.rotation(slot4)
	properties.emitter_event = self._emitter_event
	slot7 = t

	return simple_value_string(slot4, "properties", properties)
end
function SoundEnvironmentEmitter:name()
end
function SoundEnvironmentEmitter:emitter_path()

	-- Decompilation error in this vicinity:
	slot5 = managers.sound_environment

	for path, events in pairs(managers.sound_environment.emitter_events(slot4)) do
		slot9 = self._emitter_event

		if table.contains(slot7, events) then
			return path
		end
	end

	return 
end
function SoundEnvironmentEmitter:emitter_event()
	return self._emitter_event
end
function SoundEnvironmentEmitter:set_emitter_path(emitter_path)
	if not emitter_path then
		return 
	end

	slot4 = self
	local current_path = self.emitter_path(slot3)

	if emitter_path == current_path then
		return 
	end

	slot9 = emitter_path
	slot6 = managers.sound_environment.emitter_events(slot7, managers.sound_environment)[1]

	self.set_emitter_event(slot4, self)

	return 
end
function SoundEnvironmentEmitter:set_emitter_event(emitter_event)
	self._emitter_event = emitter_event
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = managers.sound_environment
		slot8 = self._emitter_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.emitter_soundbank(slot6, managers.sound_environment))
	end

	slot4 = self

	self.play_sound(slot3)

	return 
end
function SoundEnvironmentEmitter:set_unit(unit)
	self._unit = unit
	slot4 = self._soundsource
	slot7 = self._unit

	self._soundsource.link(slot3, self._unit.orientation_object(slot6))

	return 
end
function SoundEnvironmentEmitter:position()
end
function SoundEnvironmentEmitter:set_position(position)
	self._position = position

	return 
end
function SoundEnvironmentEmitter:rotation()
end
function SoundEnvironmentEmitter:set_rotation(rotation)
	self._rotation = rotation

	return 
end
function SoundEnvironmentEmitter:play_sound()

	-- Decompilation error in this vicinity:
	if self._sound_event then
		slot3 = self._sound_event

		self._sound_event.stop(slot2)
	end

	slot3 = self._soundsource

	self._soundsource.stop(slot2)

	if self._unit then
		slot3 = self._soundsource
		slot6 = self._unit

		self._soundsource.link(slot2, self._unit.orientation_object(slot5))
	else
		slot3 = self._soundsource
		slot6 = self

		self._soundsource.set_position(slot2, self.position(slot5))
	end

	slot4 = self._emitter_event
	self._sound_event = self._soundsource.post_event(slot2, self._soundsource)

	return 
end
function SoundEnvironmentEmitter:restart()
	slot3 = self

	self.play_sound(slot2)

	return 
end
function SoundEnvironmentEmitter:draw(t, dt, r, g, b)
	slot11 = self
	slot13 = b

	Application.draw_sphere(slot7, Application, self.position(slot10), 75, r, g)

	slot13 = self
	slot13 = self.rotation(self)
	slot14 = b

	Application.draw_cone(slot7, Application, self.position(75), self.position(self) + self.rotation(self).y(self) * 500, 500, r, g)

	slot13 = self
	slot13 = self.rotation(self)
	slot14 = b

	Application.draw_cone(slot7, Application, self.position(self.position(self) + self.rotation(self).y(self) * 500), self.position(self) - self.rotation(self).y(self) * 500, 500, r, g)

	return 
end
function SoundEnvironmentEmitter:destroy()
	if self._sound_event then
		slot3 = self._sound_event

		self._sound_event.stop(slot2)

		self._sound_event = nil
	end

	if self._soundsource then
		slot3 = self._soundsource

		self._soundsource.delete(slot2)

		self._soundsource = nil
	end

	return 
end

if not SoundEnvironmentAreaEmitter then
	slot5 = CoreShapeManager.ShapeBoxMiddle
	slot3 = class(slot4)
end

SoundEnvironmentAreaEmitter = slot3
function SoundEnvironmentAreaEmitter:init(params)
	params.type = "box_middle"
	slot5 = params

	SoundEnvironmentAreaEmitter.super.init(slot3, self)

	self._properties.name = params.name or ""
	slot5 = self._properties.name
	self._soundsource = SoundDevice.create_source(params.name or "", SoundDevice)
	slot4 = managers.sound_environment
	local emitter_path = managers.sound_environment.game_default_emitter_path(params.name or "")
	slot5 = self
	slot3 = self.set_emitter_event

	if not params.emitter_event then
		slot9 = emitter_path
		slot6 = managers.sound_environment.emitter_events(slot7, managers.sound_environment)[1]
	end

	slot3(slot4, slot5)

	return 
end
function SoundEnvironmentAreaEmitter:save(...)
	slot4 = self
	self._properties.name = self.name(slot3)
	slot3 = self

	return SoundEnvironmentAreaEmitter.super.save(self.name(slot3), ...)
end
function SoundEnvironmentAreaEmitter:name()
end
function SoundEnvironmentAreaEmitter:emitter_path()

	-- Decompilation error in this vicinity:
	slot5 = managers.sound_environment

	for path, events in pairs(managers.sound_environment.emitter_events(slot4)) do
		slot9 = self._properties.emitter_event

		if table.contains(slot7, events) then
			return path
		end
	end

	return 
end
function SoundEnvironmentAreaEmitter:emitter_event()
	return self._properties.emitter_event
end
function SoundEnvironmentAreaEmitter:set_emitter_path(emitter_path)
	if not emitter_path then
		return 
	end

	slot4 = self
	local current_path = self.emitter_path(slot3)

	if emitter_path == current_path then
		return 
	end

	slot9 = emitter_path
	slot6 = managers.sound_environment.emitter_events(slot7, managers.sound_environment)[1]

	self.set_emitter_event(slot4, self)

	return 
end
function SoundEnvironmentAreaEmitter:set_emitter_event(emitter_event)
	self._properties.emitter_event = emitter_event
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = managers.sound_environment
		slot8 = self._properties.emitter_event

		managers.sound_environment.add_soundbank(slot3, managers.sound_environment.emitter_soundbank(slot6, managers.sound_environment))
	end

	slot4 = self

	self.play_sound(slot3)

	return 
end
function SoundEnvironmentAreaEmitter:play_sound()
	if self._sound_event then
		slot3 = self._sound_event

		self._sound_event.stop(slot2)
	end

	if self._unit then
		slot3 = self._soundsource
		slot6 = self._unit

		self._soundsource.link(slot2, self._unit.orientation_object(slot5))
	else
		slot3 = self._soundsource
		slot6 = self

		self._soundsource.set_position(slot2, self.position(slot5))
	end

	slot4 = self._properties.emitter_event
	self._sound_event = self._soundsource.post_event(slot2, self._soundsource)

	return 
end
function SoundEnvironmentAreaEmitter:set_extent()
	return 
end
function SoundEnvironmentAreaEmitter:extent()
	slot5 = self._properties.height / 2

	return Vector3(slot2, self._properties.width / 2, self._properties.depth / 2)
end
function SoundEnvironmentAreaEmitter:set_property(...)
	slot3 = self

	SoundEnvironmentAreaEmitter.super.set_property(slot2, ...)

	slot3 = self

	self.set_extent(slot2)

	return 
end
function SoundEnvironmentAreaEmitter:set_unit(unit)
	slot5 = unit

	SoundEnvironmentAreaEmitter.super.set_unit(slot3, self)

	slot4 = self._soundsource
	slot7 = self._unit

	self._soundsource.link(slot3, self._unit.orientation_object(slot6))

	return 
end
function SoundEnvironmentAreaEmitter:restart()
	slot3 = self

	self.play_sound(slot2)

	return 
end
function SoundEnvironmentAreaEmitter:destroy()
	if self._sound_event then
		slot3 = self._sound_event

		self._sound_event.stop(slot2)

		self._sound_event = nil
	end

	if self._soundsource then
		slot3 = self._soundsource

		self._soundsource.delete(slot2)

		self._soundsource = nil
	end

	return 
end

return 
