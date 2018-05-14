-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
VoiceOverManager = VoiceOverManager or class()
function VoiceOverManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function VoiceOverManager:_setup()
	self._disabled = false
	self._investigated = {}
	self._idle_timers = {
		delay = tweak_data.voiceover.idle_delay,
		rnd_delay = tweak_data.voiceover.idle_rnd_delay,
		cooldown = tweak_data.voiceover.idle_cooldown
	}
	self._idle_queue = {}
	self._idle_cooldowns = {}
	self._units_speaking = {}

	return 
end
function VoiceOverManager:update(t, dt)
	if self._disabled then
		return 
	end

	slot5 = managers.groupai
	local group_ai_state = managers.groupai.state(slot4)

	if group_ai_state._police_called then
		self._disabled = true
	end

	local current_time = Application.time(slot5)
	slot7 = self._idle_cooldowns

	for unit_key, data in pairs(Application) do
		local elapsed_time = current_time - data.started_at

		if self._idle_timers.cooldown <= elapsed_time then
			self._idle_cooldowns[unit_key] = nil

			if self._idle_queue[unit_key] then
				slot13 = self._idle_timers.rnd_delay
				local time_offset = math.random(slot12)
				slot16 = Application
				self._idle_queue[unit_key] = {
					unit = self._idle_queue[unit_key].unit,
					registered_at = Application.time(slot15),
					time_offset = time_offset
				}
			end
		end
	end

	slot7 = self._idle_queue

	for unit_key, data in pairs(slot6) do
		local elapsed_time = current_time - data.registered_at

		if self._idle_timers.delay + data.time_offset < elapsed_time and not self._idle_cooldowns[unit_key] then
			slot13 = data.unit

			if alive(slot12) then
				slot13 = data.unit
				slot13 = data.unit.character_damage(slot12)
			else
				self._idle_queue[unit_key] = nil
			end
		end
	end

	return 
end
function VoiceOverManager:guard_register_idle(source_unit)
	if self._disabled then
		return 
	end

	slot4 = self._idle_timers.rnd_delay
	local time_offset = math.random(slot3)
	slot6 = source_unit
	slot8 = Application
	self._idle_queue[source_unit.key(slot5)] = {
		unit = source_unit,
		registered_at = Application.time(slot7),
		time_offset = time_offset
	}

	return 
end
function VoiceOverManager:guard_unregister_idle(source_unit)
	if self._disabled then
		return 
	end

	slot5 = source_unit
	self._idle_queue[source_unit.key(slot4)] = nil

	return 
end
function VoiceOverManager:guard_investigate(source_unit)
	if self._disabled then
		return 
	end

	if not self._sound_source then
		slot5 = "GuardVoiceOver"
		slot2 = SoundDevice.create_source(slot3, SoundDevice)
	end

	self._sound_source = slot2
	slot7 = source_unit

	self._sound_source.set_position(slot3, source_unit.position(slot6))

	slot5 = source_unit

	if not self._investigated[source_unit.key(self._sound_source)] then
		slot6 = Application
		self._investigated[source_unit.key(slot4)] = Application.time(source_unit)
		slot6 = "ste_investigate"

		self._play_sound(source_unit.key(slot4), self, source_unit)
	else
		slot6 = "ste_investigateagain"

		self._play_sound(slot3, self, source_unit)
	end

	return 
end
function VoiceOverManager:guard_saw_something_ot(source_unit)
	if self._disabled then
		return 
	end

	slot4 = 2
	local chance = math.random(slot3)

	if 1 < chance then
		slot7 = "ste_sawsomethingot"

		self._play_sound(slot4, self, source_unit)
	else
		slot7 = "ste_sawsomethingut"

		self._play_sound(slot4, self, source_unit)
	end

	return 
end
function VoiceOverManager:guard_saw_something_ut(source_unit)
	if true or self._disabled then
		return 
	end

	slot6 = "ste_sawsomethingut"

	self._play_sound(slot3, self, source_unit)

	return 
end
function VoiceOverManager:guard_saw_enemy(source_unit)
	if self._disabled then
		return 
	end

	slot6 = "ste_sawenemy"

	self._play_sound(slot3, self, source_unit)

	return 
end
function VoiceOverManager:guard_saw_body(source_unit)
	if self._disabled then
		return 
	end

	slot6 = "ste_sawbody"

	self._play_sound(slot3, self, source_unit)

	return 
end
function VoiceOverManager:guard_saw_bag(source_unit)
	if self._disabled then
		return 
	end

	slot6 = "ste_sawbag"

	self._play_sound(slot3, self, source_unit)

	return 
end
function VoiceOverManager:guard_raise_alarm(source_unit)
	slot6 = "ste_raisealarm"

	self._play_sound(slot3, self, source_unit)

	return 
end
function VoiceOverManager:guard_back_to_patrol(source_unit)
	if self._disabled then
		return 
	end

	slot4 = 2
	local chance = math.random(slot3)

	if 1 < chance then
		slot7 = "ste_patrol"

		self._play_sound(slot4, self, source_unit)
	else
		slot7 = "ste_investigateresult"

		self._play_sound(slot4, self, source_unit)
	end

	return 
end
function VoiceOverManager:enemy_reload(source_unit)
	if self._disabled then
		return 
	end

	slot7 = false

	self._play_sound(slot3, self, source_unit, "reload")

	return 
end
function VoiceOverManager:disable()
	slot4 = "VoiceOverManager:disable()"

	Application.trace(slot2, Application)

	self._disabled = true

	return 
end
function VoiceOverManager:_play_sound(source_unit, event)
	if self._disabled then
		return 
	end

	if source_unit then
		slot5 = source_unit

		if source_unit.base(slot4)._char_tweak ~= nil then
			slot5 = source_unit

			if source_unit.base(slot4)._char_tweak.access == "teamAI1" then
				return 
			end
		end
	end

	slot5 = source_unit

	if alive(slot4) then
		slot5 = source_unit

		if source_unit.sound(slot4) then
			slot5 = source_unit
			slot5 = source_unit.sound(slot4)

			if not source_unit.sound(slot4).speaking(slot4) then
				slot5 = source_unit
				slot8 = false

				source_unit.sound(slot4).say(slot4, source_unit.sound(slot4), event, true)
			end
		end
	end

	return 
end
function VoiceOverManager:on_simulation_ended()
	self._disabled = false

	return 
end
function VoiceOverManager:on_tweak_data_reloaded()
	slot3 = self

	self._setup(slot2)

	return 
end

return 
