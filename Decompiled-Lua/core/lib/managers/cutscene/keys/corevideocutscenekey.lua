-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreVideoCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreVideoCutsceneKey = slot0
CoreVideoCutsceneKey.ELEMENT_NAME = "video"
CoreVideoCutsceneKey.NAME = "Video Playback"
slot4 = ""

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "video")

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "gui_layer", 2)

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "loop", 0)

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "speed", 1)

function CoreVideoCutsceneKey:__tostring()
	slot3 = "Play video \"%s\"."
	slot6 = self

	return string.format(slot2, self.video(slot5))
end
function CoreVideoCutsceneKey:can_evaluate_with_player(player)
	return true
end
function CoreVideoCutsceneKey:play(player, undo, fast_forward)
	slot6 = managers.cutscene
	local video_ws = managers.cutscene.video_workspace(slot5)
	local was_paused = self._paused
	self._paused = false

	if undo then
		slot8 = self

		self._stop(slot7)
	else
		slot8 = self._video_object

		if alive(slot7) then
			if was_paused then
				slot9 = video_ws

				self._play_video(slot7, self)
			end

			slot9 = self

			if self.loop(self._video_object) < self._video_object.loop_count(slot7) then
				slot8 = self

				self._stop(slot7)

				slot9 = true

				managers.cutscene._cleanup(slot7, managers.cutscene)

				slot9 = tweak_data.player.overlay.cutscene_fade_out

				managers.overlay_effect.play_effect(slot7, managers.overlay_effect)
			end
		else
			slot8 = self

			if self.video(slot7) ~= "" then
				slot9 = video_ws

				self._play_video(slot7, self)
			end
		end

		return true
	end

	return 
end
function CoreVideoCutsceneKey:unload(player)
	slot4 = self

	self._stop(slot3)

	return 
end
function CoreVideoCutsceneKey:update(player, time)
	if self.is_in_cutscene_editor then
		slot6 = time

		self._handle_cutscene_editor_scrubbing(slot4, self)
	end

	return 
end
function CoreVideoCutsceneKey:is_valid_video(value)
	if self.is_in_cutscene_editor then
		if value ~= nil and value ~= "" then
			slot5 = value

			if SystemFS.exists(slot3, SystemFS) then
				slot5 = value
				slot2 = not SystemFS.is_dir(slot3, SystemFS)
			end
		else
			slot2 = false

			if false then
				slot2 = true
			end
		end

		return slot2
	else
		return value ~= nil and value ~= ""
	end

	return 
end
function CoreVideoCutsceneKey:on_attribute_changed(attribute_name, value, previous_value)
	slot6 = self

	self._stop(slot5)

	return 
end
function CoreVideoCutsceneKey:_handle_cutscene_editor_scrubbing(time)
	if self._last_evaluated_time then
		if time == self._last_evaluated_time then
			self._stopped_frame_count = (self._stopped_frame_count or 0) + 1

			if 5 < self._stopped_frame_count then
				self._stopped_frame_count = nil
				slot4 = self

				self.pause(slot3)
			end
		else
			self._stopped_frame_count = nil
			slot4 = self._video_object

			if alive(slot3) and (time < self._last_evaluated_time or 1 < time - self._last_evaluated_time) then
				slot5 = time

				self._video_object.goto_time(slot3, self._video_object)
			end

			slot4 = self

			self.resume(slot3)
		end
	end

	self._last_evaluated_time = time

	return 
end
function CoreVideoCutsceneKey:_play_video(video_ws)

	-- Decompilation error in this vicinity:
	slot4 = self._video_object
	slot4 = self._video_object

	self._video_object.play(slot3)

	return 
end
function CoreVideoCutsceneKey:_stop()
	slot3 = self._video_object

	if alive(slot2) then
		local video_ws = managers.cutscene.video_workspace(slot2)
		slot4 = video_ws
		slot4 = video_ws.panel(managers.cutscene)

		video_ws.panel(managers.cutscene).clear(managers.cutscene)

		slot4 = video_ws

		video_ws.hide(managers.cutscene)

		self._video_object = nil
	end

	self._last_evaluated_time = nil

	return 
end
function CoreVideoCutsceneKey:pause()
	if not self._paused then
		slot3 = self._video_object

		if alive(slot2) then
			slot3 = self._video_object

			self._video_object.pause(slot2)

			self._paused = true
		end
	end

	return 
end
function CoreVideoCutsceneKey:resume()
	if self._paused then
		slot3 = self._video_object

		if alive(slot2) then
			slot3 = self._video_object

			self._video_object.play(slot2)

			self._paused = false
		end
	end

	return 
end

return 
