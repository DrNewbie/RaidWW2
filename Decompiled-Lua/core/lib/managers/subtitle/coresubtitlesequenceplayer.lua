-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSubtitleSequencePlayer"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

SubtitleSequencePlayer = SubtitleSequencePlayer or CoreClass.class()
function SubtitleSequencePlayer:init(sequence, presenter)
	slot6 = "Invalid sequence."

	assert(slot4, sequence)

	slot6 = "Invalid presenter."

	assert(slot4, presenter)

	self.__presenter = presenter
	slot6 = sequence
	self.__sequence = self.__presenter.preprocess_sequence(slot4, self.__presenter)

	return 
end
function SubtitleSequencePlayer:is_done()
	slot4 = self.__sequence

	return self.__sequence.duration(slot3) <= (self.__time or 0)
end
function SubtitleSequencePlayer:update(time, delta_time)
	self.__time = (self.__time or 0) + delta_time
	slot6 = self.__time

	self.evaluate_at_time(slot4, self)

	return 
end
function SubtitleSequencePlayer:evaluate_at_time(time)
	if time ~= self._last_evaluated_time then
		slot6 = self.__sequence

		function slot6(latest, subtitle)
			slot5 = time

			return (subtitle.is_active_at_time(slot3, subtitle) and subtitle) or latest
		end

		local subtitle = table.inject(slot3, self.__sequence.subtitles(slot5), nil)

		if subtitle ~= self.__previous_subtitle then

			-- Decompilation error in this vicinity:
			slot5 = self.__presenter
			slot3 = self.__presenter.show_text

			if subtitle then
				slot10 = subtitle
				slot8 = subtitle.color(slot9)
			end

			if subtitle then
				slot11 = subtitle
				slot9 = subtitle.nationality_icon(slot10)
			end

			slot3(slot4, slot5, slot6, slot7, slot8)

			self.__previous_subtitle = subtitle
		end

		self._last_evaluated_time = time
	end

	return 
end

return 
