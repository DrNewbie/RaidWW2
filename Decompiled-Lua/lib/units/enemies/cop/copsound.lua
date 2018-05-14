-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CopSound = CopSound or class()
CopSound.MAX_DISTANCE_FROM_PLAYER = 2500
CopSound.FOOTSTEP_COOLDOWN = 1.1
CopSound.VO_COOLDOWN = 2
function CopSound:init(unit)

	-- Decompilation error in this vicinity:
	self._unit = unit
	self._speak_expire_t = 0
	self._footstep_expire_t = 0
	slot5 = unit
	local char_tweak = tweak_data.character[unit.base(slot4)._tweak_table]
	slot6 = nil

	self.set_voice_prefix(slot4, self)

	local nr_variations = char_tweak.speech_prefix_count
	slot4 = char_tweak.speech_prefix_p1 or ""
	slot5 = "_"
	slot6 = unit
	slot6 = unit.base(slot5)

	unit.base(slot5).post_init(slot5)

	return 
end
function CopSound:destroy(unit)
	return 
end
function CopSound:set_voice_prefix(index)

	-- Decompilation error in this vicinity:
	slot5 = self._unit
	local char_tweak = tweak_data.character[self._unit.base(slot4)._tweak_table]
	local nr_variations = char_tweak.speech_prefix_count

	if index and (index < 1 or nr_variations < index) then
		slot10 = nr_variations

		debug_pause_unit(slot5, self._unit, "[CopSound:set_voice_prefix] Invalid prefix index:", index, ". nr_variations:")
	end

	slot4 = char_tweak.speech_prefix_p1 or ""
end
function CopSound:_out_of_hearing_range()
	local player_unit = nil
	slot4 = game_state_machine

	if game_state_machine.current_state_name(slot3) == "ingame_waiting_for_respawn" then
		slot4 = game_state_machine
		slot4 = game_state_machine.current_state(slot3)
		player_unit = game_state_machine.current_state(slot3).currently_spectated_unit(slot3)
	else
		slot4 = managers.player
		player_unit = managers.player.local_player(slot3)
	end

	if not player_unit then
		slot5 = "[CopSound:_out_of_hearing_range]: Player unit is nil; couldn't determine the distance. The sound won't be played."

		Application.error(slot3, Application)

		return true
	end

	slot5 = player_unit
	local distance_vector = self._unit.position(slot3) - player_unit.position(self._unit)
	slot5 = distance_vector

	return CopSound.MAX_DISTANCE_FROM_PLAYER < distance_vector.length(self._unit)
end
function CopSound:_play(sound_name, source_name)
	slot5 = self

	if self._out_of_hearing_range(slot4) then
		return 
	end

	local source = nil

	if source_name then
		slot6 = source_name
		source = Idstring(slot5)
	end

	slot7 = source
	slot7 = sound_name
	local event = self._unit.sound_source(slot5, self._unit).post_event(slot5, self._unit.sound_source(slot5, self._unit))

	return event
end
function CopSound:play(sound_name, source_name, sync)
	local event_id = nil
	slot7 = sound_name

	if type(slot6) == "number" then
		event_id = sound_name
		sound_name = nil
	end

	if sync then
		if not event_id then
			slot8 = sound_name
			event_id = SoundDevice.string_to_id(slot6, SoundDevice)
		end

		local sync_source_name = source_name or ""
		slot8 = self._unit
		slot11 = sync_source_name

		self._unit.network(slot7).send(slot7, self._unit.network(slot7), "unit_sound_play", event_id)
	end

	slot9 = source_name
	local event = self._play(slot6, self, sound_name or event_id)

	return event
end
function CopSound:corpse_play(sound_name, source_name, sync)
	local event_id = nil
	slot7 = sound_name

	if type(slot6) == "number" then
		event_id = sound_name
		sound_name = nil
	end

	if sync then
		if not event_id then
			slot8 = sound_name
			event_id = SoundDevice.string_to_id(slot6, SoundDevice)
		end

		local sync_source_name = source_name or ""
		local u_id = self._unit.id(slot7)
		slot9 = managers.network
		slot13 = sync_source_name

		managers.network.session(self._unit).send_to_peers_synched(self._unit, managers.network.session(self._unit), "corpse_sound_play", u_id, event_id)
	end

	slot9 = source_name
	local event = self._play(slot6, self, sound_name or event_id)

	if not event then
		slot12 = self._unit

		Application.error(slot7, Application, "[CopSound:corpse_play] event not found in Wwise", sound_name, event_id)

		slot9 = "error"

		Application.stack_dump(slot7, Application)

		return 
	end

	return event
end
function CopSound:stop(source_name)
	local source = nil

	if source_name then
		slot5 = source_name
		source = Idstring(slot4)
	end

	slot6 = source
	slot5 = self._unit.sound_source(slot4, self._unit)

	self._unit.sound_source(slot4, self._unit).stop(slot4)

	return 
end
function CopSound:say(sound_name, sync, skip_prefix)
	if self._last_speech then
		slot6 = self._last_speech

		self._last_speech.stop(slot5)
	end

	local full_sound = nil

	if skip_prefix then
		full_sound = sound_name
	else
		full_sound = self._prefix .. sound_name
	end

	local event_id = nil
	slot8 = full_sound

	if type(slot7) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		if not event_id then
			slot9 = full_sound
			event_id = SoundDevice.string_to_id(slot7, SoundDevice)
		end

		slot8 = self._unit
		slot10 = event_id

		self._unit.network(slot7).send(slot7, self._unit.network(slot7), "say")
	end

	slot9 = full_sound or event_id
	self._last_speech = self._play(slot7, self)

	if not self._last_speech then
		return 
	end

	slot8 = TimerManager
	slot8 = TimerManager.game(slot7)
	self._speak_expire_t = TimerManager.game(slot7).time(slot7) + CopSound.VO_COOLDOWN

	return 
end
function CopSound:sync_say_str(full_sound)
	if self._last_speech then
		slot4 = self._last_speech

		self._last_speech.stop(slot3)
	end

	slot5 = full_sound
	self._last_speech = self.play(slot3, self)

	return 
end
function CopSound:speaking(t)
	if not t then
		slot4 = TimerManager
		slot4 = TimerManager.game(slot3)
		slot2 = TimerManager.game(slot3).time(slot3)
	end

	return slot2 < self._speak_expire_t
end
function CopSound:playing_footsteps(t)
	if not t then
		slot4 = TimerManager
		slot4 = TimerManager.game(slot3)
		slot2 = TimerManager.game(slot3).time(slot3)
	end

	return slot2 < self._footstep_expire_t
end
function CopSound:anim_clbk_play_sound(unit, queue_name)
	slot5 = self

	if not self.speaking(slot4) then
		slot5 = self

		if not self.playing_footsteps(slot4) then
			self._footstep_expire_t = self._footstep_expire_t + CopSound.FOOTSTEP_COOLDOWN
			slot6 = queue_name

			self._play(CopSound.FOOTSTEP_COOLDOWN, self)
		end
	end

	return 
end

return 
