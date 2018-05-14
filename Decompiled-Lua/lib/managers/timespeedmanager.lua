TimeSpeedManager = TimeSpeedManager or class()
function TimeSpeedManager:init()
	slot3 = TimerManager
	self._pausable_timer = TimerManager.pausable(slot2)
	slot3 = TimerManager
	self._game_timer = TimerManager.game(slot2)
	slot3 = TimerManager
	self._game_anim_timer = TimerManager.game_animation(slot2)
	self._game_speed_rtpc = 1

	return 
end
function TimeSpeedManager:update()
	if self._playing_effects then
		slot3 = self

		self._update_playing_effects(slot2)
	end

	return 
end
function TimeSpeedManager:_update_playing_effects()
	local slowest_speed = nil
	local playing_effects = self._playing_effects

	if playing_effects then
		local all_affected_timers = self._affected_timers
		slot6 = all_affected_timers

		for timer_key, timer_info in pairs(slot5) do
			timer_info.mul = 1
		end

		slot6 = playing_effects

		for effect_id, effect in pairs(slot5) do
			slot11 = effect.timer
			local time = effect.timer.time(slot10)
			local effect_speed = nil

			if time < effect.fade_in_delay_end_t then
			elseif time < effect.fade_in_end_t then
				slot15 = ((time - effect.fade_in_delay_end_t) / effect.desc.fade_in)^0.5
				effect_speed = math.lerp(slot12, 1, effect.desc.speed)
			elseif not effect.sustain_end_t or time < effect.sustain_end_t then
				effect_speed = effect.desc.speed
			elseif time < effect.effect_end_t then
				slot15 = ((time - effect.sustain_end_t) / effect.desc.fade_out)^0.5
				effect_speed = math.lerp(slot12, effect.desc.speed, 1)
			else
				slot14 = effect_id

				self._on_effect_expired(slot12, self)
			end

			if effect_speed then
				slot13 = effect.affect_timers

				for timer_key, affect_timer in pairs(slot12) do
					local timer_info = self._affected_timers[timer_key]
					slot20 = effect_speed
					timer_info.mul = math.min(slot18, timer_info.mul)
				end

				if slowest_speed or not effect_speed then
					slot14 = effect_speed
					slowest_speed = math.min(slot12, slowest_speed)
				end
			end
		end

		local game_speed_rtpc_changed = false

		if slowest_speed then
			if slowest_speed < 0.5 then
				if self._game_speed_rtpc ~= 0 then
					self._game_speed_rtpc = 0
					game_speed_rtpc_changed = true
				end
			elseif 1.5 < slowest_speed then
				if self._game_speed_rtpc ~= 2 then
					self._game_speed_rtpc = 2
					game_speed_rtpc_changed = true
				end
			elseif self._game_speed_rtpc ~= 1 then
				self._game_speed_rtpc = 1
				game_speed_rtpc_changed = true
			end
		elseif self._game_speed_rtpc ~= 1 then
			self._game_speed_rtpc = 1
			game_speed_rtpc_changed = true
		end

		if game_speed_rtpc_changed then
			slot9 = self._game_speed_rtpc

			SoundDevice.set_rtpc(slot6, SoundDevice, "game_speed")
		end

		if self._affected_timers then
			slot7 = all_affected_timers

			for timer_key, timer_info in pairs(slot6) do
				slot13 = timer_info.mul

				timer_info.timer.set_multiplier(slot11, timer_info.timer)
			end
		end
	end

	return 
end
function TimeSpeedManager:play_effect(id, effect_desc)
	local effect = {
		desc = effect_desc,
		timer = (effect_desc.timer == "pausable" and self._pausable_timer) or self._game_timer
	}
	slot6 = effect.timer
	effect.start_t = effect.timer.time(slot5)
	effect.fade_in_delay_end_t = effect.start_t + (effect_desc.fade_in_delay or 0)
	effect.fade_in_end_t = effect.fade_in_delay_end_t + effect_desc.fade_in
	effect.sustain_end_t = effect_desc.sustain and effect.fade_in_end_t + effect_desc.sustain

	if effect.sustain_end_t then
		slot4 = effect.sustain_end_t + (effect_desc.fade_out or 0)
	end

	effect.effect_end_t = slot4

	if effect_desc.affect_timer then
		slot6 = effect_desc.affect_timer

		if type(slot5) == "table" then
			effect.affect_timers = {}
			slot6 = effect_desc.affect_timer

			for _, timer_name in ipairs(slot5) do
				slot11 = TimerManager
				slot14 = timer_name
				local timer = TimerManager.timer(slot10, Idstring(slot13))
				slot13 = timer
				effect.affect_timers[timer.key(Idstring)] = timer
			end
		else
			slot6 = TimerManager
			slot9 = effect_desc.affect_timer
			local timer = TimerManager.timer(slot5, Idstring(slot8))
			slot8 = timer
			effect.affect_timers = {
				[timer.key(Idstring)] = timer
			}
		end
	else
		slot7 = self._game_timer
		slot7 = self._game_anim_timer
		effect.affect_timers = {
			[self._game_timer.key(slot6)] = self._game_timer,
			[self._game_anim_timer.key(self._game_timer)] = self._game_anim_timer
		}
	end

	self._affected_timers = self._affected_timers or {}
	slot6 = effect.affect_timers

	for timer_key, affect_timer in pairs(slot5) do
		if self._affected_timers[timer_key] then
			self._affected_timers[timer_key].ref_count = self._affected_timers[timer_key].ref_count + 1
		else
			self._affected_timers[timer_key] = {
				ref_count = 1,
				mul = 1,
				timer = affect_timer
			}
		end
	end

	self._playing_effects = self._playing_effects or {}
	self._playing_effects[id] = effect

	if effect_desc.sync then
		slot6 = managers.network

		if managers.network.session(slot5) then
			slot6 = managers.network
			slot6 = managers.network.session(slot5)

			if not managers.network.session(slot5).closing(slot5) then
				local affect_timers_str = ""

				if effect_desc.affect_timer then
					slot7 = effect_desc.affect_timer

					if type(slot6) == "table" then
						slot7 = effect_desc.affect_timer

						for _, timer_name in ipairs(slot6) do
							affect_timers_str = affect_timers_str .. timer_name .. ";"
						end
					else
						affect_timers_str = effect_desc.affect_timer .. ";"
					end
				end

				slot7 = managers.network
				slot15 = effect_desc.fade_out or 0

				managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "start_timespeed_effect", id, effect_desc.timer, affect_timers_str, effect_desc.speed, effect_desc.fade_in or 0, effect_desc.sustain or 0)
			end
		end
	end

	return 
end
function TimeSpeedManager:stop_effect(id, fade_out_duration)
	if not self._playing_effects then
		return 
	end

	slot5 = managers.network

	if managers.network.session(slot4) then
		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		if not managers.network.session(slot4).closing(slot4) then
			local effect_instance = self._playing_effects[id]

			if effect_instance and effect_instance.desc.sync then
				local sync_fade_out_duration = nil

				if fade_out_duration and fade_out_duration ~= 0 then
					sync_fade_out_duration = fade_out_duration
				else
					sync_fade_out_duration = 0
				end

				slot7 = managers.network
				slot10 = sync_fade_out_duration

				managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "start_timespeed_effect", id)
			end
		end
	end

	if fade_out_duration and fade_out_duration ~= 0 then
		local effect_instance = self._playing_effects[id]

		if not effect_instance then
			return 
		end

		slot6 = effect_instance.timer
		local t = effect_instance.timer.time(slot5)
		effect_instance.sustain_end_t = t
		effect_instance.effect_end_t = t + fade_out_duration
	else
		slot6 = id

		self._on_effect_expired(slot4, self)
	end

	return 
end
function TimeSpeedManager:_on_effect_expired(effect_id)
	local effect = self._playing_effects[effect_id]
	slot5 = effect.affect_timers

	for timer_key, affect_timer in pairs(slot4) do
		local timer_info = self._affected_timers[timer_key]

		if timer_info.ref_count == 1 then
			slot12 = 1

			timer_info.timer.set_multiplier(slot10, timer_info.timer)

			self._affected_timers[timer_key] = nil
		else
			timer_info.ref_count = timer_info.ref_count - 1
		end
	end

	self._playing_effects[effect_id] = nil
	slot5 = self._playing_effects

	if not next(nil) then
		self._playing_effects = nil
		self._affected_timers = nil
	end

	return 
end
function TimeSpeedManager:in_effect()
	return self._playing_effects and true
end
function TimeSpeedManager:destroy()
	while self._playing_effects do
		slot3 = self._playing_effects
		local eff_id, eff = next(slot2)
		slot6 = eff_id

		self._on_effect_expired(slot4, self)
	end

	slot5 = 1

	SoundDevice.set_rtpc(slot2, SoundDevice, "game_speed")

	return 
end

return 
