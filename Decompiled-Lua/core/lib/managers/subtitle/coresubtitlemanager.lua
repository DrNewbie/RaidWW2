-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSubtitleManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreSubtitlePresenter"

core.import(slot1, core)

slot3 = "CoreSubtitleSequence"

core.import(slot1, core)

slot3 = "CoreSubtitleSequencePlayer"

core.import(slot1, core)

SubtitleManager = SubtitleManager or CoreClass.class()
function SubtitleManager:init()
	self.__subtitle_sequences = {}
	self.__loaded_sequence_file_paths = {}
	slot3 = CoreSubtitlePresenter.DebugPresenter
	self.__presenter = CoreSubtitlePresenter.DebugPresenter.new(slot2)
	slot3 = self

	self._update_presenter_visibility(slot2)

	return 
end
function SubtitleManager:destroy()
	slot4 = nil

	self.set_presenter(slot2, self)

	return 
end
function SubtitleManager:presenter()
	slot4 = "Invalid presenter. SubtitleManager might have been destroyed."

	return assert(slot2, self.__presenter)
end
function SubtitleManager:set_presenter(presenter)

	-- Decompilation error in this vicinity:
	slot2 = assert
	self.__presenter = presenter

	if self.__presenter then
		slot4 = self

		self._update_presenter_visibility(slot3)
	end

	return 
end
function SubtitleManager:load_sequences(sequence_file_path)
	local root_node = DB.load_node(slot3, DB, "subtitle_sequence")
	slot7 = root_node
	slot6 = "File is not a subtitle sequence file."

	assert(slot4, root_node.name(sequence_file_path) == "subtitle_sequence")

	self.__loaded_sequence_file_paths[sequence_file_path] = true
	slot5 = root_node

	for sequence_node in root_node.children(true) do
		slot9 = sequence_node

		if sequence_node.name(slot8) == "sequence" then
			local sequence = CoreSubtitleSequence.SubtitleSequence.new(slot8, CoreSubtitleSequence.SubtitleSequence)
			slot11 = sequence
			self.__subtitle_sequences[sequence.name(sequence_node)] = sequence
		end
	end

	return 
end
function SubtitleManager:reload_sequences()
	self.__subtitle_sequences = {}
	slot3 = self.__loaded_sequence_file_paths

	for sequence_file_path, _ in pairs(slot2) do
		slot9 = sequence_file_path

		self.load_sequences(slot7, self)
	end

	return 
end
function SubtitleManager:update(time, delta_time)
	if self.__player then
		slot7 = delta_time

		self.__player.update(slot4, self.__player, time)

		slot5 = self.__player

		if self.__player.is_done(slot4) then
			self.__player = nil
		end
	end

	slot5 = self
	slot7 = delta_time

	self.presenter(slot4).update(slot4, self.presenter(slot4), time)

	return 
end
function SubtitleManager:enabled()
	return Global.__SubtitleManager__enabled or false
end
function SubtitleManager:set_enabled(enabled)
	Global.__SubtitleManager__enabled = not not enabled
	slot4 = self

	self._update_presenter_visibility(not not enabled)

	return 
end
function SubtitleManager:visible()
	return not self.__hidden
end
function SubtitleManager:set_visible(visible)
	self.__hidden = not visible or nil
	slot4 = self

	self._update_presenter_visibility(slot3)

	return 
end
function SubtitleManager:clear_subtitle()
	slot4 = ""

	self.show_subtitle_localized(slot2, self)

	return 
end
function SubtitleManager:is_showing_subtitles()
	slot3 = self

	if self.enabled(slot2) then
		slot3 = self

		return self.visible(slot2) and self.__player ~= nil
	end
end
function SubtitleManager:show_subtitle(string_id, duration, macros, color, nationality_icon)
	slot13 = macros
	slot12 = nationality_icon

	self.show_subtitle_localized(slot7, self, managers.localization.text(slot10, managers.localization, string_id), duration, color)

	return 
end
function SubtitleManager:show_subtitle_localized(localized_string, duration, color, nationality_icon)
	local sequence = CoreSubtitleSequence.SubtitleSequence.new(slot6)
	slot8 = sequence
	slot16 = nationality_icon

	sequence.add_subtitle(CoreSubtitleSequence.SubtitleSequence, CoreSubtitleSequence.Subtitle.new(slot10, CoreSubtitleSequence.Subtitle, localized_string, 0, duration or 3, color))

	slot9 = sequence
	slot12 = self
	self.__player = CoreSubtitleSequencePlayer.SubtitleSequencePlayer.new(CoreSubtitleSequence.SubtitleSequence, CoreSubtitleSequencePlayer.SubtitleSequencePlayer, self.presenter(CoreSubtitleSequence.Subtitle))

	return 
end
function SubtitleManager:run_subtitle_sequence(sequence_id)
	if sequence_id then
		slot4 = self.__subtitle_sequences[sequence_id]
		slot8 = sequence_id
		local sequence = assert(slot3, string.format(slot6, "Sequence \"%s\" not found."))
	end

	if sequence then
		slot6 = sequence
		slot9 = self
		slot3 = CoreSubtitleSequencePlayer.SubtitleSequencePlayer.new(slot4, CoreSubtitleSequencePlayer.SubtitleSequencePlayer, self.presenter(slot8))
	end

	self.__player = slot3

	return 
end
function SubtitleManager:subtitle_sequence_ids()
	slot3 = self.__subtitle_sequences or {}

	return CoreTable.table.map_keys(slot2)
end
function SubtitleManager:has_subtitle_sequence(sequence_id)
	return (self.__subtitle_sequences and self.__subtitle_sequences[sequence_id]) ~= nil
end
function SubtitleManager:_update_presenter_visibility()
	local presenter = self.presenter(slot2)
	slot4 = self

	if self.enabled(self) then
		slot4 = self

		if self.visible(slot3) then
			if managers.user then
				slot5 = "subtitle"
				slot2 = managers.user.get_setting(slot3, managers.user)

				if managers.user.get_setting(slot3, managers.user) then
					slot2 = false
				end
			else
				local show_presenter = true
			end
		end
	end

	slot5 = presenter

	presenter[(show_presenter and "show") or "hide"](slot4)

	return 
end

return 
