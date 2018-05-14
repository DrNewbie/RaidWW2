slot3 = "CoreSubtitlePresenter"

core.import(slot1, core)

VoiceBriefingManager = VoiceBriefingManager or class()
function VoiceBriefingManager:init()
	slot3 = self

	self._clear_event(slot2)

	slot3 = self

	self._setup(slot2)

	return 
end
function VoiceBriefingManager:_setup()
	slot4 = "VoiceBriefingManager"
	self._sound_source = SoundDevice.create_source(slot2, SoundDevice)
	slot3 = managers.subtitle
	slot8 = 22

	managers.subtitle.set_presenter(slot2, CoreSubtitlePresenter.OverlayPresenter.new(slot5, CoreSubtitlePresenter.OverlayPresenter, tweak_data.gui.fonts.din_compressed_outlined_22))

	return 
end
function VoiceBriefingManager:_set_parameters(params)
	params = params or {}
	self._params.show_subtitle = (params.show_subtitle and true) or false

	if params.listener then
		slot5 = params.listener

		self.add_listener(slot3, self)
	end

	if params.listeners then
		slot4 = params.listeners

		for _, listener in pairs(slot3) do
			slot10 = listener

			self.add_listener(slot8, self)
		end
	end

	return 
end
function VoiceBriefingManager:_debug_callback(...)
	slot3 = self

	self._sound_callback(slot2, ...)

	return 
end
function VoiceBriefingManager:_sound_callback(instance, sound_source, event_type, cookie, label, identifier, position)
	if event_type == "end_of_event" then
		slot11 = cookie

		self._end_of_event(slot9, self)
	elseif event_type == "marker" then
		if label then
			slot12 = cookie

			self._play_subtitle(slot9, self, label)
		end
	elseif event_type == "duration" then
		slot12 = cookie

		self._set_duration(slot9, self, label)
	end

	return 
end
function VoiceBriefingManager:_end_of_event(cookie)
	if self._listeners_enabled then
		slot4 = self._listeners

		for _, listener in ipairs(slot3) do
			if listener.end_of_event then
				slot11 = cookie

				listener.clbk(slot8, "end_of_event", self._event_name)
			end
		end
	end

	slot4 = self

	self._clear_event(slot3)

	return 
end
function VoiceBriefingManager:_play_subtitle(string_id, cookie)
	slot6 = string_id
	local duration = self._subtitle_len(slot4, self)

	if self._params.show_subtitle then
		slot7 = true

		managers.subtitle.set_visible(slot5, managers.subtitle)

		slot7 = true

		managers.subtitle.set_enabled(slot5, managers.subtitle)

		slot8 = duration

		managers.subtitle.show_subtitle(slot5, managers.subtitle, string_id)
	end

	if self._listeners_enabled then
		slot6 = self._listeners

		for _, listener in ipairs(slot5) do
			if listener.marker then
				slot14 = cookie

				listener.clbk(slot10, "marker", string_id, duration)
			end
		end
	end

	return 
end
function VoiceBriefingManager:_set_duration(duration, cookie)
	if self._listeners_enabled then
		slot5 = self._listeners

		for _, listener in ipairs(slot4) do
			if listener.duration then
				slot12 = cookie

				listener.clbk(slot9, "duration", duration)
			end
		end
	end

	return 
end
function VoiceBriefingManager:_subtitle_len(id)
	slot5 = id
	local text = managers.localization.text(slot3, managers.localization)
	slot5 = text
	local duration = text.len(managers.localization) * tweak_data.dialog.DURATION_PER_CHAR

	if duration < tweak_data.dialog.MINIMUM_DURATION then
		duration = tweak_data.dialog.MINIMUM_DURATION
	end

	return duration
end
function VoiceBriefingManager:_check_event_ok()
	if not self._event_instance then
		if self._event_name ~= "nothing" then
			slot7 = self._event_name
			slot4 = "[VoiceBriefingManager:_check_event_ok] Wasn't able to play sound event " .. tostring(slot6)

			Application.error(slot2, Application)

			slot3 = Application

			Application.stack_dump(slot2)
		end

		self._post_event_enabled = false

		self._sound_callback(slot2, self, nil, nil, "end_of_event", nil, self._event_name, nil, nil)

		self._post_event_enabled = true

		return false
	end

	return true
end
function VoiceBriefingManager:_clear_event()
	self._event_name = nil
	self._event_instance = nil
	self._listeners = {}
	self._params = {}
	slot4 = false

	managers.subtitle.set_visible(slot2, managers.subtitle)

	slot4 = false

	managers.subtitle.set_enabled(slot2, managers.subtitle)

	self._post_event_enabled = true
	self._listeners_enabled = true

	return 
end
function VoiceBriefingManager:post_event_simple(event_name)
	if not event_name or not self._post_event_enabled then
		return 
	end

	slot4 = self

	self.stop_event(slot3)

	slot5 = {
		show_subtitle = true
	}

	self._set_parameters(slot3, self)

	self._event_name = event_name
	slot10 = "_sound_callback"
	slot9 = "end_of_event"
	self._event_instance = self._sound_source.post_event(slot3, self._sound_source, event_name, callback(slot7, self, self), nil, "marker")
	slot4 = self

	return self._check_event_ok(slot3)
end
function VoiceBriefingManager:post_event(event_name, params)
	if not event_name or not self._post_event_enabled then
		return 
	end

	slot5 = self

	self.stop_event(slot4)

	slot6 = params

	self._set_parameters(slot4, self)

	self._event_name = event_name
	slot11 = "_sound_callback"
	slot11 = "end_of_event"
	self._event_instance = self._sound_source.post_event(slot4, self._sound_source, event_name, callback(slot8, self, self), (params and params.cookie) or nil, "marker", "duration")
	self._event_cookie = params and params.cookie
	slot5 = self

	return self._check_event_ok(slot4)
end
function VoiceBriefingManager:event_playing()
	return (self._event_instance and true) or false
end
function VoiceBriefingManager:stop_event(skip_end_of_event)
	if self._event_instance then
		slot4 = self._event_instance

		self._event_instance.stop(slot3)

		if not skip_end_of_event then
			slot5 = self._event_cookie

			self._end_of_event(slot3, self)
		else
			slot4 = self

			self._clear_event(slot3)
		end
	end

	self._event_cookie = nil

	return 
end
function VoiceBriefingManager:add_listener(listener)
	slot5 = listener

	table.insert(slot3, self._listeners)

	return 
end

return 
