if not RaidGUIControlAnimatedBitmap then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlAnimatedBitmap = slot0
function RaidGUIControlAnimatedBitmap:init(parent, params)
	slot7 = params

	RaidGUIControlAnimatedBitmap.super.init(slot4, self, parent)

	slot5 = self

	if not self._params_valid(slot4) then
		self._closed = true

		return 
	end

	slot6 = self._params
	self._object = self._panel.bitmap(slot4, self._panel)
	slot5 = "%05d"
	self._salt = string.format(slot4, math.random(slot7))
	slot9 = self._params.name
	slot6 = "animated_bitmap_" .. tostring(99999) .. "_" .. self._salt
	slot11 = "_update"

	managers.hud.add_updator(slot4, managers.hud, callback("_", self, self))

	self._current_frame = 0
	self._initial_x = self._params.texture_rect[1]
	self._initial_y = self._params.texture_rect[2]
	self._w = self._params.texture_rect[3]
	self._h = self._params.texture_rect[4]
	self._loops_left = self._params.loops
	slot5 = (self._params.texture_width - self._initial_x) / self._w
	self._frames_in_first_row = math.floor(slot4)
	slot5 = self._params.texture_width / self._w
	self._frames_in_row = math.floor(slot4)

	return 
end
function RaidGUIControlAnimatedBitmap:_update(t, dt)
	if self._paused then
		return 
	end

	if not self._current_frame_t then
		self._current_frame_t = t
	end

	slot6 = (t - self._current_frame_t) * self._params.framerate
	local current_frame = (self._current_frame + math.floor(slot5)) % self._params.frames

	if current_frame < self._current_frame and (not self._params.loop_forever or self._stop) then
		if not self._loops_left or self._loops_left == 1 or self._stop then
			slot6 = self

			self.close(slot5)

			return 
		end

		if self._loops_left then
			self._loops_left = self._loops_left - 1
		end
	end

	if current_frame ~= self._current_frame then
		slot7 = current_frame
		local text_rect = self._get_frame(slot5, self)
		slot7 = self._object
		slot11 = current_frame

		self._object.set_texture_rect(self, self._get_frame(slot9, self))

		self._current_frame = current_frame
		self._current_frame_t = t
	end

	return 
end
function RaidGUIControlAnimatedBitmap:_get_frame(frame_index)
	slot5 = frame_index
	local row, row_index = self._get_frame_row(slot3, self)
	local x = row_index * self._w

	if row == 0 then
		x = x + self._initial_x
	end

	local y = self._initial_y + row * self._h

	return x, y, self._w, self._h
end
function RaidGUIControlAnimatedBitmap:_get_frame_row(frame_index)
	local row = 0
	local row_index = frame_index

	if self._frames_in_first_row < frame_index + 1 then
		row = 1
		row_index = row_index - self._frames_in_first_row

		while self._frames_in_first_row + row * self._frames_in_row < frame_index + 1 do
			row = row + 1
			row_index = row_index - self._frames_in_row
		end
	end

	return row, row_index
end
function RaidGUIControlAnimatedBitmap:pause()
	self._paused = true
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	self._pause_time = TimerManager.game(slot2).time(slot2)

	return 
end
function RaidGUIControlAnimatedBitmap:unpause()
	if not self._paused then
		return 
	end

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local current_time = TimerManager.game(slot2).time(slot2)
	self._current_frame_t = self._current_frame_t + current_time - self._pause_time
	self._paused = false
	self._pause_time = nil

	return 
end
function RaidGUIControlAnimatedBitmap:stop()
	self._stop = true

	return 
end
function RaidGUIControlAnimatedBitmap:close()
	if self._closed then
		return 
	end

	if not self._params.hold_last_frame then
		slot4 = false

		self._object.set_visible(slot2, self._object)
	end

	slot7 = self._params.name
	slot4 = "animated_bitmap_" .. tostring(slot6) .. "_" .. self._salt

	managers.hud.remove_updator(slot2, managers.hud)

	self._closed = true

	return 
end
function RaidGUIControlAnimatedBitmap:_params_valid()
	if not self._params.texture then
		slot5 = self._params.name

		Application.error(slot2, Application, "[RaidGUIControlAnimatedBitmap:init] Texture not specified for the animated bitmap control: ")

		return false
	end

	if not self._params.framerate then
		slot5 = self._params.name

		Application.error(slot2, Application, "[RaidGUIControlAnimatedBitmap:init] Framerate not specified for the animated bitmap control: ")

		return false
	end

	if not self._params.frames then
		slot5 = self._params.name

		Application.error(slot2, Application, "[RaidGUIControlAnimatedBitmap:init] Number of frames not specified for the animated bitmap control: ")

		return false
	end

	if not self._params.texture_width then
		slot5 = self._params.name

		Application.error(slot2, Application, "[RaidGUIControlAnimatedBitmap:init] Texture width not specified for the animated bitmap control: ")

		return false
	end

	return true
end

return 
