-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSubtitleSequence"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

SubtitleSequence = SubtitleSequence or CoreClass.class()
Subtitle = Subtitle or CoreClass.class()

if not StringIDSubtitle then
	slot2 = Subtitle
	slot0 = CoreClass.class(slot1)
end

StringIDSubtitle = slot0
function SubtitleSequence:init(sequence_node)
	if sequence_node then
		slot5 = sequence_node

		self._load_from_xml(slot3, self)
	end

	return 
end
function SubtitleSequence:name()
	slot3 = self

	return self.parameters(slot2).name or ""
end
function SubtitleSequence:duration()
	if self.__subtitles then
		slot3 = self.__subtitles[#self.__subtitles]
		slot1 = self.__subtitles[#self.__subtitles].end_time(#self.__subtitles)
	end

	return slot1
end
function SubtitleSequence:parameters()
	return self.__parameters or {}
end
function SubtitleSequence:subtitles()
	return self.__subtitles or {}
end
function SubtitleSequence:add_subtitle(subtitle)
	self.__subtitles = self.__subtitles or {}

	function slot6(a, b)
		slot5 = b

		return a.start_time(slot3) < b.start_time(a)
	end

	table.insert_sorted(slot3, self.__subtitles, subtitle)

	return 
end
function SubtitleSequence:_load_from_xml(sequence_node)
	slot5 = "Localization Manager not ready."

	assert(slot3, managers.localization)

	slot2 = assert

	if sequence_node then
		slot6 = sequence_node

		slot2(slot3, sequence_node.name(slot5) == "sequence")

		slot7 = "name"
		slot5 = "Sequence must have a name."

		assert(slot3, sequence_node.parameter("Attempting to construct from non-sequence XML node.", sequence_node))

		slot4 = sequence_node
		self.__parameters = sequence_node.parameter_map(slot3)
		self.__subtitles = {}
		slot4 = sequence_node
	end

	for node in sequence_node.children(slot3) do
		slot10 = node
		slot13 = "Sequence \"%s\" has entries without text_ids."
		slot16 = self
		local string_id = self._xml_assert(slot7, self, node.parameter(slot10, node), string.format("text_id", self.name(slot15)))
		slot10 = string_id

		if not managers.localization.exists(self, managers.localization) then
			slot10 = string_id

			self._report_bad_string_id(slot8, self)
		end

		slot15 = "time"
		slot11 = node
		slot17 = self
		local start_time = self._xml_assert(slot8, self, tonumber(node.parameter(slot13, node)), string.format(slot13, self.name(slot16)))
		slot12 = start_time
		slot18 = "duration"
		slot15 = node.parameter(slot16, node) or 2
		local subtitle = StringIDSubtitle.new(slot9, StringIDSubtitle, string_id, tonumber("Sequence \"%s\" has entries without valid times."))
		slot11 = self
		slot14 = subtitle

		self.add_subtitle(StringIDSubtitle, CoreClass.freeze(tonumber))
	end

	slot4 = self.__subtitles

	CoreClass.freeze(slot3)

	return 
end
function SubtitleSequence:_report_bad_string_id(string_id)
	slot5 = string_id

	Localizer.lookup(slot3, Localizer)

	return 
end
function SubtitleSequence:_xml_assert(condition, node, message)
	if not condition then
		slot13 = node
		slot13 = ""
		slot10 = message
		slot4 = error(string.format(slot7, "Error parsing \"%s\" - %s", string.gsub(slot10, node.file(slot12), "^.*[/\\]")))
	end

	return slot4
end
function Subtitle:init(string_data, start_time, duration, color, nationality_icon)
end
function Subtitle:string()
	return self.__string_data
end
function Subtitle:color()
	return self.__color
end
function Subtitle:start_time()
	return self.__start_time
end
function Subtitle:nationality_icon()
	return self.__nationality_icon
end
function Subtitle:end_time()

	-- Decompilation error in this vicinity:
	slot4 = self

	return self.start_time(slot2) + (self.duration(self) or math.huge)
end
function Subtitle:duration()
	return self.__duration
end
function Subtitle:is_active_at_time(time)

	-- Decompilation error in this vicinity:
	slot4 = self
end
function StringIDSubtitle:string()
	slot4 = "Localization Manager not ready."

	assert(slot2, managers.localization)

	slot4 = self.__string_data

	return managers.localization.text(slot2, managers.localization)
end

return 
