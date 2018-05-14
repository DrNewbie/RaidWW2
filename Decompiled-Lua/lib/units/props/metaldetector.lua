MetalDetector = MetalDetector or class()
MetalDetector.DEFAULT_RANGE = 5000
MetalDetector.DEFAULT_SOUND_START = "transmission_sound"
MetalDetector.DEFAULT_SOUND_STOP = "transmission_sound_stop"
MetalDetector.DEFAULT_RTPC = "distance"
function MetalDetector:init(unit)
	self._unit = unit

	if not self._max_range then
		self._max_range = MetalDetector.DEFAULT_RANGE
	end

	if not self._sound_event_start then
		self._sound_event_start = MetalDetector.DEFAULT_SOUND_START
	end

	if not self._sound_event_stop then
		self._sound_event_stop = MetalDetector.DEFAULT_SOUND_STOP
	end

	if not self._sound_event_rtpc then
		self._sound_event_rtpc = MetalDetector.DEFAULT_RTPC
	end

	slot4 = self._anim_gauge_name
	self._anim_gauge = Idstring(slot3)
	slot5 = self._anim_gauge
	self._anim_gauge_length = self._unit.anim_length(slot3, self._unit)
	slot5 = "metal_detector"
	self._soundsource = SoundDevice.create_source(slot3, SoundDevice)
	slot4 = self._soundsource
	slot7 = self._unit
	slot10 = self._rp_name

	self._soundsource.link(slot3, self._unit.get_object(slot6, Idstring(slot9)))

	return 
end
function MetalDetector:update(unit, t, dt)
	slot6 = self
	local dist = self.poll_min_distances(slot5)

	if 0 <= dist and dist < self._max_range then
		local ratio = dist / self._max_range * 100

		if not self._sound_event then
			slot9 = self._sound_event_start
			self._sound_event = self._soundsource.post_event(slot7, self._soundsource)
		end

		slot10 = ratio

		self._soundsource.set_rtpc(slot7, self._soundsource, self._sound_event_rtpc)

		slot10 = (self._anim_gauge_length * (100 - ratio)) / 100

		self._unit.anim_set_time(slot7, self._unit, self._anim_gauge)

		slot9 = self._anim_gauge

		self._unit.anim_play(slot7, self._unit)
	else
		if self._sound_event then
			slot8 = self._sound_event_stop

			self._soundsource.post_event(slot6, self._soundsource)

			self._sound_event = nil
		end

		slot8 = self._anim_gauge

		self._unit.anim_stop(slot6, self._unit)
	end

	return 
end
function MetalDetector:poll_min_distances()
	local pos = self._unit.position(slot2)
	slot5 = pos
	local min_dist = managers.mission.find_closest_metal_object_position(self._unit, managers.mission)
	slot5 = managers.worldcollection._missions

	for world_id, mission_manager in pairs(managers.mission) do
		slot11 = pos
		local dist = mission_manager.find_closest_metal_object_position(slot9, mission_manager)

		if 0 <= dist and (min_dist == -1 or dist < min_dist) then
			min_dist = dist
		end
	end

	return min_dist
end

return 
