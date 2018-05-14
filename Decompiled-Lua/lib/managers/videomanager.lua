VideoManager = VideoManager or class()
function VideoManager:init()
	self._videos = {}
	self._updators = {}

	return 
end
function VideoManager:add_video(video)
	slot5 = "master_volume"
	local volume = managers.user.get_setting(slot3, managers.user)
	slot6 = volume / 100

	video.set_volume_gain(managers.user, video)

	slot6 = video

	table.insert(managers.user, self._videos)

	return 
end
function VideoManager:remove_video(video)
	slot5 = video

	table.delete(slot3, self._videos)

	return 
end
function VideoManager:volume_changed(volume)
	slot4 = self._videos

	for _, video in ipairs(slot3) do
		slot10 = volume

		video.set_volume_gain(slot8, video)
	end

	return 
end
function VideoManager:add_updator(id, callback)
	self._updators[id] = callback

	return 
end
function VideoManager:remove_updator(id)
	self._updators[id] = nil

	return 
end
function VideoManager:update(t, dt)
	slot5 = self._updators

	for _, cb in pairs(slot4) do
		slot11 = dt

		cb(slot9, t)
	end

	return 
end

return 
