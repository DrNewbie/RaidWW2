CoreCutsceneFrameVisitor = CoreCutsceneFrameVisitor or class()
function CoreCutsceneFrameVisitor:init(parent_window, cutscene_editor, start_frame, end_frame)
	slot7 = parent_window
	self.__parent_window = assert(slot6)
	slot7 = cutscene_editor
	self.__cutscene_editor = assert(slot6)
	slot9 = start_frame
	self.__start_frame = assert(tonumber(slot8))
	slot9 = end_frame
	self.__end_frame = assert(tonumber(slot8))
	self.__frame = self.__start_frame
	slot9 = self._visit_frame
	slot8 = "Subclasses of CoreCutsceneFrameVisitor must define _visit_frame(frame)."

	assert(slot6, type(slot8) == "function")

	return 
end
function CoreCutsceneFrameVisitor:begin()
	slot5 = self.__parent_window

	assert(slot2, alive("Parent window has been destroyed."))

	slot3 = self.__progress_dialog

	if not alive(slot2) then
		slot8 = "PD_AUTO_HIDE,PD_APP_MODAL,PD_CAN_ABORT,PD_REMAINING_TIME"
		self.__progress_dialog = EWS.ProgressDialog(slot2, EWS, self.__parent_window, "Exporting Frames...", "Preparing for export", self.__end_frame - self.__start_frame)
	end

	slot4 = true

	self.__progress_dialog.set_visible(slot2, self.__progress_dialog)

	self.__frame = self.__start_frame
	slot4 = self.__frame

	self.__cutscene_editor.set_playhead_position(slot2, self.__cutscene_editor)

	slot3 = self.__cutscene_editor

	self.__cutscene_editor.refresh_player(slot2)

	return 
end
function CoreCutsceneFrameVisitor:update(time, delta_time)
	slot6 = 0.03333333333333333

	Application.set_forced_timestep(slot4, Application)

	slot5 = self

	if not self._is_ready_to_go(slot4) then
		return false
	end

	slot6 = self.__frame - self.__start_frame
	slot10 = self.__frame
	local was_aborted = not self.__progress_dialog.update_bar(slot4, self.__progress_dialog, self._progress_message(slot8, self))
	local is_done = was_aborted or self.__end_frame <= self.__frame

	if is_done then
		slot8 = was_aborted

		self._done(slot6, self)

		slot7 = self.__progress_dialog

		if alive(slot6) then
			slot7 = self.__progress_dialog

			self.__progress_dialog.destroy(slot6)
		end

		self.__progress_dialog = nil
		slot7 = self.__cutscene_editor
		slot12 = "_cleanup"

		self.__cutscene_editor.enqueue_update_action(slot6, callback(slot9, self, self))
	else
		slot8 = self.__frame

		self.__cutscene_editor.set_playhead_position(slot6, self.__cutscene_editor)

		slot7 = self.__cutscene_editor

		self.__cutscene_editor.refresh_player(slot6)

		self.__should_visit_frame_at_end_update = true
	end

	return is_done
end
function CoreCutsceneFrameVisitor:end_update(time, delta_time)
	if self.__should_visit_frame_at_end_update then
		slot6 = self.__frame

		self._visit_frame(slot4, self)

		self.__frame = self.__frame + 1
		self.__should_visit_frame_at_end_update = nil
	end

	return 
end
function CoreCutsceneFrameVisitor:_done(aborted)
	return 
end
function CoreCutsceneFrameVisitor:_is_ready_to_go()
	self.__sync_frames = (self.__sync_frames or 30) - 1

	return self.__sync_frames <= 0
end
function CoreCutsceneFrameVisitor:_progress_message(frame)
	return "Processing frame " .. frame
end
function CoreCutsceneFrameVisitor:_cleanup()
	slot4 = 0

	Application.set_forced_timestep(slot2, Application)

	self.__sync_frames = nil

	return 
end

return 
