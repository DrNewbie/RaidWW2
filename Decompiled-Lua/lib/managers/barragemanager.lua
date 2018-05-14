-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
BarrageManager = BarrageManager or class()
BarrageManager.MIN_DELAY_VARIANCE = 0.5
BarrageManager.MAX_DELAY_VARIANCE = 2
BarrageManager.DEFAULT_DISTANCE = 3000
BarrageManager.FLARE_SHOOT_ELEVATION = 45
BarrageManager.FLARE_MASS = 0.4
BarrageManager.SPOTTER_COOLDOWN = 10
slot3 = "units/vanilla/props/props_flare/props_spotter_flare"
BarrageManager.FLARE_UNIT = Idstring(slot2)
BarrageManager.default_params = tweak_data.barrage.default
function BarrageManager:init()
	self._running_barrages = {}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	self._spotters = {}
	self._flares = {}
	self._spotter_barrage_type = BarrageManager.default_params
	self._queued_projectiles = {}
	slot4 = "barrage_launch"
	self._soundsource = SoundDevice.create_source(slot2, SoundDevice)

	return 
end
function BarrageManager:on_simulation_ended()
	slot3 = self

	self.cleanup(slot2)

	self._running_barrages = {}
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)
	self._spotters = {}
	self._flares = {}
	self._spotter_barrage_type = BarrageManager.default_params
	self._next_spotter_barrage_time = nil
	slot3 = self._soundsource

	self._soundsource.stop(slot2)

	return 
end
function BarrageManager:cleanup()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._flares

		for _, data in ipairs(slot2) do
			slot8 = data.unit

			if alive(slot7) then
				slot9 = 0

				data.unit.set_slot(slot7, data.unit)
			end
		end
	end

	self._flares = {}

	return 
end
function BarrageManager:spawn_flare(spotter, target)
	slot5 = target

	if not alive(slot4) then
		return 
	end

	slot8 = 150
	local pos = spotter.position(slot4) + Vector3(spotter, 0, 0)
	local rot = spotter.rotation(spotter)
	slot8 = "spotter_flare_thrown"

	self._soundsource.post_event(spotter, self._soundsource)

	slot9 = {
		skip_idle_check = true
	}

	managers.dialog.queue_dialog(spotter, managers.dialog, "player_gen_barrage_flare_drop")

	slot10 = target
	slot9 = pos.z
	local target_pos = Vector3(spotter, target.position("player_gen_barrage_flare_drop").x, target.position(target).y)
	slot9 = target
	local height = pos.z - target.position(target.position(target).y).z
	slot12 = target
	local displacement = mvector3.distance(target.position(target).y, target.position(slot11))
	slot11 = target_pos
	local distance = mvector3.distance(pos, pos)
	slot15 = distance

	Application.debug(pos, Application, "[BarrageManager][spawn_flare] height, displacement, distance", height, displacement)

	local cos_fi = math.cos(pos)
	slot12 = BarrageManager.FLARE_SHOOT_ELEVATION
	local tan_fi = math.tan(BarrageManager.FLARE_SHOOT_ELEVATION)
	local elevation = tan_fi * distance
	slot14 = target_pos
	slot19 = elevation

	mvector3.add(height, Vector3(slot16, 0, 0))

	local v = math.sqrt(height) / 1000
	slot15 = 2 * BarrageManager.FLARE_SHOOT_ELEVATION
	local sin_2fi = math.sin((distance * distance * 981) / 2 * cos_fi * cos_fi * (tan_fi * distance + height))
	local d = distance - height / 1.8

	if d < 0 then
		d = distance
	end

	slot17 = (d * 981) / sin_2fi
	local v0 = math.sqrt(slot16)
	local forward = target_pos - pos
	slot19 = forward

	mvector3.normalize(slot18)

	slot22 = elevation

	Application.debug(slot18, Application, "[BarrageManager][spawn_flare]", v)

	slot20 = pos
	local flare = safe_spawn_unit(slot18, BarrageManager.FLARE_UNIT, Rotation())
	slot26 = spotter

	self.sync_spotter_spawn_flare(BarrageManager.FLARE_UNIT, self, flare, pos, rot, forward, v0)

	slot20 = managers.network
	slot26 = v0

	managers.network.session(BarrageManager.FLARE_UNIT).send_to_peers_synched(BarrageManager.FLARE_UNIT, managers.network.session(BarrageManager.FLARE_UNIT), "sync_spotter_spawn_flare", flare, pos, rot, forward)

	return 
end
function BarrageManager:sync_spotter_spawn_flare(flare, pos, rot, forward, v, spotter)
	slot10 = "static_body"
	slot10 = true

	flare.body(slot8, flare).set_enabled(slot8, flare.body(slot8, flare))

	slot9 = flare
	slot10 = "state_interaction_enabled"

	flare.damage(slot8).run_sequence_simple(slot8, flare.damage(slot8))

	slot9 = flare
	slot10 = "effect_start_red"

	flare.damage(slot8).run_sequence_simple(slot8, flare.damage(slot8))

	local velocity = forward * v
	slot11 = 8
	local rand1 = 4 - math.random(flare.damage(slot8), 0)
	slot12 = 8
	local rand2 = 4 - math.random(0, 0)
	slot13 = 8
	local rand3 = 4 - math.random(0, 0)
	slot21 = rand3
	slot16 = flare.position(slot17) + Vector3(flare, rand1, rand2)

	flare.push_at(0, flare, BarrageManager.FLARE_MASS, velocity)

	local t = Application.time(0) + tweak_data.barrage.flare_timer
	slot15 = {
		spotter = spotter,
		unit = flare,
		barrage_time = t
	}

	table.insert(Application, self._flares)

	return 
end
function BarrageManager:update(t, dt)
	local now = t
	slot6 = Network

	if not Network.is_server(slot5) then
		return 
	end

	local ct_barrages = #self._running_barrages

	for i_barrage = ct_barrages, 1, -1 do
		local barrage = self._running_barrages[i_barrage]

		if barrage.end_time <= now then
			slot13 = i_barrage

			table.remove(slot11, self._running_barrages)

			slot13 = "barrage_ended"

			managers.mission.call_global_event(slot11, managers.mission)

			slot13 = "barrage_ended"

			self._call_listeners(slot11, self)

			slot12 = barrage._spotter

			if alive(slot11) then
				slot12 = barrage._spotter
				slot12 = barrage._spotter.brain(slot11)

				barrage._spotter.brain(slot11).on_barrage_ended(slot11)
			end
		elseif barrage.next_projectile_time <= now then
			slot13 = barrage
			barrage.next_projectile_time = self._get_next_projectile_time(slot11, self)
			slot13 = barrage

			self._queue_projectile(slot11, self)
		end
	end

	local remaining_projectiles = {}
	slot8 = self._queued_projectiles

	for _, projectile in ipairs(slot7) do
		if projectile.time < t then
			slot14 = projectile.barrage_params

			self._spawn_projectile(slot12, self)
		else
			slot14 = projectile

			table.insert(slot12, remaining_projectiles)
		end
	end

	self._queued_projectiles = remaining_projectiles
	slot8 = self

	self._remove_dead_spotters(slot7)

	slot9 = t

	self._check_flare_start_barrage(slot7, self)

	return 
end
function BarrageManager:_check_flare_start_barrage(t)
	slot4 = self._flares

	for _, data in ipairs(slot3) do
		slot9 = data.unit

		if alive(slot8) then
			slot9 = data.unit
			slot9 = data.unit.interaction(slot8)

			if data.unit.interaction(slot8).active(slot8) and not data.called and data.barrage_time < t then
				slot10 = "[BarrageManager][_check_flare_start_barrage] START BARRAGE"

				Application.debug(slot8, Application)

				slot10 = data.spotter
				slot13 = data.unit

				self.start_spotter_barrage(slot8, self, data.unit.position(slot12))

				data.called = true
				slot9 = data.unit
				slot10 = "state_interaction_disabled"

				data.unit.damage(slot8).run_sequence_simple(slot8, data.unit.damage(slot8))

				slot9 = managers.network
				slot11 = data.unit

				managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_spotter_flare_disabled")
			end
		end

		slot9 = data.unit

		if alive(slot8) and data.barrage_time + 20 < t then
			slot10 = 0

			data.unit.set_slot(slot8, data.unit)
		end
	end

	return 
end
function BarrageManager:is_barrage_running()
	local barrage_running = 0 < #self._running_barrages

	return barrage_running
end
function BarrageManager:_call_listeners(event, params)
	slot7 = params

	self._listener_holder.call(slot4, self._listener_holder, event)

	return 
end
function BarrageManager:add_listener(key, events, clbk)
	slot6 = Network

	if not Network.is_server(slot5) then
		return 
	end

	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function BarrageManager:remove_listener(key)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function BarrageManager:start_barrage(params)
	local barrage_params = params

	if barrage_params.type == BarrageType.RANDOM then
		slot6 = barrage_params
		barrage_params = self._choose_random_type(slot4, self)
	end

	slot6 = barrage_params
	barrage_params = self._prepare_barrage_params(slot4, self)
	slot5 = self
	local player_pos = self._get_barrage_position(slot4)

	if not player_pos then
		slot7 = "[BarrageManager][start_barrage] Unable to get player position, no players or team AI active"

		Application.error(slot5, Application)

		return 
	end

	slot8 = player_pos

	self._set_barrage_position(slot5, self, barrage_params)

	slot7 = barrage_params

	self._start_barrage(slot5, self)

	return 
end
function BarrageManager:_start_barrage(barrage_params)
	slot5 = BuffEffectManager.EFFECT_NO_BARRAGE

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		return 
	end

	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local now = TimerManager.game(slot3).time(slot3)

	if barrage_params.type == BarrageType.ARTILLERY then
		local delay = barrage_params.initial_delay or 0
		barrage_params.next_projectile_time = now + delay
		slot7 = barrage_params

		table.insert(slot5, self._running_barrages)
	elseif barrage_params.type == BarrageType.AIRPLANE then
		slot7 = barrage_params.direction
		local airplane_unit = safe_spawn_unit(slot4, barrage_params.airplane_unit, barrage_params.center)
		slot6 = managers.network
		slot9 = barrage_params.sequence_name

		managers.network.session(barrage_params.airplane_unit).send_to_peers_synched(barrage_params.airplane_unit, managers.network.session(barrage_params.airplane_unit), "sync_airplane_barrage", airplane_unit)

		slot8 = barrage_params.sequence_name

		self.sync_airplane_barrage(barrage_params.airplane_unit, self, airplane_unit)
	else
		slot6 = "[BarrageManager] Trying to start invalid barrage type (not artillery nor aircraft)"

		Application.error(slot4, Application)
	end

	slot6 = "barrage_started"

	managers.mission.call_global_event(slot4, managers.mission)

	slot6 = "barrage_started"

	self._call_listeners(slot4, self)

	return 
end
function BarrageManager:sync_airplane_barrage(airplane_unit, sequence_name)
	slot5 = airplane_unit
	slot6 = sequence_name

	airplane_unit.damage(slot4).run_sequence_simple(slot4, airplane_unit.damage(slot4))

	return 
end
function BarrageManager:stop_barrages()
	slot3 = self

	self.on_simulation_ended(slot2)

	return 
end
function BarrageManager:_get_barrage_position()
	slot3 = managers.criminals
	local pos_rot = managers.criminals.get_valid_player_spawn_pos_rot(slot2)

	if pos_rot then
		return pos_rot[1]
	end

	return nil
end
function BarrageManager:_set_barrage_position(barrage_params, target_pos)
	if barrage_params.type == BarrageType.ARTILLERY then
		slot5 = barrage_params.direction
		barrage_params.direction = barrage_params.direction.normalized(slot4)
		local distance = barrage_params.distance or BarrageManager.DEFAULT_DISTANCE
		barrage_params.center = target_pos + barrage_params.direction * -distance
	elseif barrage_params.type == BarrageType.AIRPLANE then
		slot7 = 360
		slot7 = 0
		barrage_params.direction = Rotation(slot4, math.random(slot6), 0)
		barrage_params.center = target_pos
	else
		slot6 = "[BarrageManager] Trying to start nvalid barrage type (not artillery nor aircraft)"

		Application.error(slot4, Application)
	end

	return 
end
function BarrageManager:_get_next_projectile_time(barrage_params)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local now = TimerManager.game(slot3).time(slot3)
	local next_projectile_time = 0

	if barrage_params.spotting_rounds and 0 < barrage_params.spotting_rounds then
		next_projectile_time = now + barrage_params.spotting_rounds_delay
	else
		local average_delay = barrage_params.time_between_projectiles
		local min_delay = average_delay * BarrageManager.MIN_DELAY_VARIANCE
		local max_delay = average_delay * BarrageManager.MAX_DELAY_VARIANCE
		slot10 = max_delay
		local delay = math.lerp(slot8, min_delay, math.random())
		next_projectile_time = now + delay
	end

	return next_projectile_time
end
function BarrageManager:_queue_projectile(barrage_params)
	local queued_projectile = {
		barrage_params = barrage_params
	}
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	queued_projectile.time = TimerManager.game(slot4).time(slot4) + (barrage_params.barrage_launch_sound_delay or 0)

	if barrage_params.barrage_launch_sound_event then
		slot6 = barrage_params.barrage_launch_sound_event

		self.play_barrage_launch_sound(slot4, self)

		slot5 = managers.network
		slot7 = barrage_params.barrage_launch_sound_event

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_barrage_launch_sound")
	end

	slot6 = queued_projectile

	table.insert(slot4, self._queued_projectiles)

	return 
end
function BarrageManager:play_barrage_launch_sound(event_name)
	slot5 = event_name

	self._soundsource.post_event(slot3, self._soundsource)

	return 
end
function BarrageManager:_spawn_projectile(barrage_params)
	slot5 = barrage_params.radius
	local x, y = self._uniform_sample_circle(slot3, self)
	local delta_x = x * barrage_params.ortho_x
	local delta_y = y * barrage_params.ortho_y
	local pos = barrage_params.center + delta_x + delta_y

	if barrage_params.spotting_rounds and 0 < barrage_params.spotting_rounds then
		if barrage_params.spotting_rounds_min_distance then
			slot9 = x * x + y * y
			local distance = math.sqrt(slot8)

			if distance < barrage_params.spotting_rounds_min_distance then
				local adjustment = barrage_params.spotting_rounds_min_distance / distance
				delta_x = delta_x * adjustment
				delta_y = delta_y * adjustment
				pos = barrage_params.center + delta_x + delta_y
			end
		end

		barrage_params.spotting_rounds = barrage_params.spotting_rounds - 1
	end

	slot11 = barrage_params.direction * barrage_params.lauch_power

	ProjectileBase.throw_projectile(slot8, barrage_params.projectile_index, pos)

	return 
end
function BarrageManager:_uniform_sample_circle(radius)
	slot5 = 360
	local t = math.lerp(slot3, 0, math.random())
	slot6 = 1
	slot7 = 1
	local r = math.lerp(0, 0, math.random()) + math.lerp(0, 0, math.random())

	if 1 < r then
		r = 2 - r
	end

	r = radius * r
	local x = r * math.cos(slot5)
	slot7 = t
	local y = r * math.sin(t)

	return x, y
end
function BarrageManager:_prepare_barrage_params(barrage_params)
	slot4 = barrage_params or BarrageManager.default_params
	local prepared_params = clone(slot3)

	if prepared_params.type == BarrageType.ARTILLERY then
		slot6 = barrage_params.projectile_id
		local projectile_index = tweak_data.blackmarket.get_index_from_projectile_id(slot4, tweak_data.blackmarket)

		if not projectile_index then
			slot8 = barrage_params.projectile_id

			Application.error(slot5, Application, "[BarrageManager] Trying to spawn an unknown projectile type: ")

			return 
		end

		prepared_params.projectile_index = projectile_index
		slot7 = prepared_params.duration
		local barrage_duration = managers.groupai.get_difficulty_dependent_value(slot5, managers.groupai)
		slot8 = BuffEffectManager.EFFECT_BARRAGE_LENGTH

		if managers.buff_effect.is_effect_active(managers.groupai, managers.buff_effect) then
			slot8 = BuffEffectManager.EFFECT_BARRAGE_LENGTH
			barrage_duration = barrage_duration * (managers.buff_effect.get_effect_value(slot6, managers.buff_effect) or 1)
		end

		prepared_params.duration = barrage_duration
		slot7 = TimerManager
		slot7 = TimerManager.game(slot6)
		prepared_params.end_time = TimerManager.game(slot6).time(slot6) + prepared_params.duration
		slot8 = prepared_params.projectiles_per_minute
		prepared_params.projectiles_per_minute = managers.groupai.get_difficulty_dependent_value(prepared_params.duration, managers.groupai)
		prepared_params.time_between_projectiles = 60 / prepared_params.projectiles_per_minute
		slot7 = prepared_params.direction
		slot7 = prepared_params.direction.random_orthogonal(prepared_params.duration)
		prepared_params.ortho_x = prepared_params.direction.random_orthogonal(prepared_params.duration).normalized(prepared_params.duration)
		slot8 = prepared_params.ortho_x
		slot7 = math.cross(prepared_params.duration, prepared_params.direction)
		prepared_params.ortho_y = math.cross(prepared_params.duration, prepared_params.direction).normalized(prepared_params.duration)
		slot8 = prepared_params.area_radius
		prepared_params.radius = managers.groupai.get_difficulty_dependent_value(prepared_params.duration, managers.groupai)
	elseif prepared_params.type == BarrageType.AIRPLANE then
	else
		slot6 = "[BarrageManager] Invalid barrage type (not artillery nor aircraft)"

		Application.error(slot4, Application)
	end

	slot6 = prepared_params.cooldown
	prepared_params.cooldown = managers.groupai.get_difficulty_dependent_value(slot4, managers.groupai)

	return prepared_params
end
function BarrageManager:_choose_random_type(barrage_params)
	if not barrage_params.type_table then
		slot5 = "[BarrageManager] Barrage params for random type don't have a table of options"

		Application.error(slot3, Application)

		return nil
	end

	local total_weight = 0
	slot5 = barrage_params.type_table

	for name, weight in pairs(slot4) do
		slot11 = weight
		local w = managers.groupai.get_difficulty_dependent_value(slot9, managers.groupai)
		total_weight = total_weight + w
	end

	local random_value = math.random() * total_weight
	slot6 = barrage_params.type_table

	for name, weight in pairs(slot5) do
		slot12 = weight
		local w = managers.groupai.get_difficulty_dependent_value(slot10, managers.groupai)

		if random_value <= w then
			local barrage_type = tweak_data.barrage[name]

			if not barrage_type then
				slot15 = name

				Application.error(slot12, Application, "[BarrageManager] Barrage type specified in random table isn't present in BarrageTweakData: ")

				return nil
			end

			return barrage_type
		end

		random_value = random_value - w
	end

	return nil
end
function BarrageManager:set_spotter_barrage_type(barrage_params)
	slot4 = barrage_params
	self._spotter_barrage_type = clone(slot3)

	return 
end
function BarrageManager:get_spotter_barrage_type()
	return self._spotter_barrage_type
end
function BarrageManager:register_spotter(spotter_unit)
	slot5 = spotter_unit

	table.insert(slot3, self._spotters)

	return 
end
function BarrageManager:start_spotter_barrage(spotter, target_pos)
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	local t = TimerManager.game(slot4).time(slot4)

	if not self._spotter_barrage_type then
		slot7 = "[BarrageManager] Spotter barrage type not set via func_barrage. Using default to prevent a crash."

		Application.error(slot5, Application)

		slot7 = BarrageManager.default_params

		self.set_spotter_barrage_type(slot5, self)
	end

	if not target_pos then
		slot7 = "[BarrageManager][start_spotter_barrage] Spotter barrage target not provided"

		Application.error(slot5, Application)

		return 
	end

	slot7 = t

	if not self._is_spotter_barrage_off_cooldown(slot5, self) then
		return 
	end

	local barrage_params = self._spotter_barrage_type

	if barrage_params.type == BarrageType.RANDOM then
		slot8 = barrage_params
		barrage_params = self._choose_random_type(slot6, self)
	end

	slot8 = barrage_params
	barrage_params = self._prepare_barrage_params(slot6, self)
	barrage_params._spotter = spotter
	slot9 = target_pos

	self._set_barrage_position(slot6, self, barrage_params)

	slot8 = barrage_params

	self._start_barrage(slot6, self)

	self._next_spotter_barrage_time = t + barrage_params.cooldown
	slot10 = t
	slot13 = barrage_params

	Application.debug(slot6, Application, "[BarrageManager][start_spotter_barrage] Barage called on pos:", target_pos, inspect(slot12))

	return true
end
function BarrageManager:_is_spotter_barrage_off_cooldown(t)
	return true

	local off_cooldown = not self._next_spotter_barrage_time or self._next_spotter_barrage_time < t

	if not off_cooldown then
	end

	return off_cooldown
end
function BarrageManager:_remove_dead_spotters()
	local ct_spotters = #self._spotters

	for i_spotter = ct_spotters, 1, -1 do

		-- Decompilation error in this vicinity:
		local spotter = self._spotters[i_spotter]
		slot9 = spotter
	end

	return 
end

return 
