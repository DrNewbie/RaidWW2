slot3 = "CoreSubtitlePresenter"

core.import(slot1, core)

DramaExt = DramaExt or class()
function DramaExt:init(unit)
	self._unit = unit
	self._cue = nil

	return 
end
function DramaExt:name()
	return self.character_name
end
function DramaExt:play_sound(sound, sound_source)
	self._cue = self._cue or {}
	self._cue.sound = sound
	self._cue.sound_source = sound_source
	slot6 = sound_source
	slot10 = "end_of_event"
	local playing = self._unit.sound_source(slot4, self._unit).post_event(slot4, self._unit.sound_source(slot4, self._unit), sound, self.sound_callback, self._unit, "marker")

	if not playing then
		slot7 = "[DramaExt:play_sound] Wasn't able to play sound event " .. sound

		Application.error(slot5, Application)

		slot6 = Application

		Application.stack_dump(slot5)
		self.sound_callback(slot5, self, nil, "end_of_event", self._unit, sound_source, nil, nil)
	end

	return 
end
function DramaExt:play_subtitle(string_id, duration, color, nationality_icon)
	self._cue = self._cue or {}
	self._cue.string_id = string_id
	slot8 = false

	managers.subtitle.set_visible(slot6, managers.subtitle)

	if not duration or duration == 0 then
		slot12 = nationality_icon

		managers.subtitle.show_subtitle(slot6, managers.subtitle, string_id, 100000, nil, color)
	else
		slot12 = nationality_icon

		managers.subtitle.show_subtitle(slot6, managers.subtitle, string_id, duration, nil, color)
	end

	slot13 = nil

	managers.queued_tasks.queue(slot6, managers.queued_tasks, nil, self._do_show_subtitle, self, nil, 0.1)

	return 
end
function DramaExt:_do_show_subtitle()
	slot4 = true

	managers.subtitle.set_visible(slot2, managers.subtitle)

	slot4 = true

	managers.subtitle.set_enabled(slot2, managers.subtitle)

	return 
end
function DramaExt:stop_cue()
	if self._cue then
		if self._cue.string_id then
			slot3 = managers.subtitle

			managers.subtitle.clear_subtitle(slot2)

			slot4 = false

			managers.subtitle.set_visible(slot2, managers.subtitle)

			slot4 = false

			managers.subtitle.set_enabled(slot2, managers.subtitle)
		end

		if self._cue.sound then
			slot4 = self._cue.sound_source
			slot3 = self._unit.sound_source(slot2, self._unit)

			self._unit.sound_source(slot2, self._unit).stop(slot2)
		end

		self._cue = nil
	end

	return 
end
function DramaExt:sound_callback(instance, event_type, unit, sound_source, label, identifier, position)
	if event_type == "end_of_event" then
		slot10 = managers.subtitle

		managers.subtitle.clear_subtitle(slot9)

		slot11 = false

		managers.subtitle.set_visible(slot9, managers.subtitle)

		slot11 = false

		managers.subtitle.set_enabled(slot9, managers.subtitle)

		slot16 = nil

		managers.queued_tasks.queue(slot9, managers.queued_tasks, nil, managers.dialog.finished, managers.dialog, nil, 0.1)
	elseif event_type == "marker" and sound_source then
		slot11 = true

		managers.subtitle.set_visible(slot9, managers.subtitle)

		slot11 = true

		managers.subtitle.set_enabled(slot9, managers.subtitle)

		slot11 = sound_source
		slot15 = sound_source

		managers.subtitle.show_subtitle(slot9, managers.subtitle, DramaExt._subtitle_len(slot13, DramaExt))
	end

	return 
end
function DramaExt:_subtitle_len(id)
	slot5 = id
	local text = managers.localization.text(slot3, managers.localization)
	slot5 = text
	local duration = text.len(managers.localization) * tweak_data.dialog.DURATION_PER_CHAR

	if duration < tweak_data.dialog.MINIMUM_DURATION then
		duration = tweak_data.dialog.MINIMUM_DURATION
	end

	return duration
end
function DramaExt:set_voice(voice)
	local ss = self._unit.sound_source(slot3)
	slot7 = voice

	ss.set_switch(self._unit, ss, "hero_switch")

	slot7 = "third"

	ss.set_switch(self._unit, ss, "int_ext")

	return 
end

return 
