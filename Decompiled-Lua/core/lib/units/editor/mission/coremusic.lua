if not CoreMusicUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreMusicUnitElement = slot0

if not MusicUnitElement then
	slot2 = CoreMusicUnitElement
	slot0 = class(slot1)
end

MusicUnitElement = slot0
function MusicUnitElement:init(...)
	slot3 = self

	CoreMusicUnitElement.init(slot2, ...)

	return 
end
function CoreMusicUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.music_event = "_LEVEL_DEFAULT"
	slot5 = "music_event"

	table.insert("_LEVEL_DEFAULT", self._save_values)

	return 
end
function CoreMusicUnitElement:test_element()
	if self._hed.music_event then
		slot4 = false

		managers.editor.set_wanted_mute(slot2, managers.editor)

		slot4 = self._hed.music_event

		managers.music.post_event(slot2, managers.music)
	end

	return 
end
function CoreMusicUnitElement:stop_test_element()
	slot4 = true

	managers.editor.set_wanted_mute(slot2, managers.editor)

	slot3 = managers.music

	managers.music.stop(slot2)

	return 
end
function CoreMusicUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot7 = managers.music
	local events = deep_clone(managers.music.music_events_list(slot6))
	slot7 = "_LEVEL_DEFAULT"

	table.insert(managers.music.music_events_list, events)

	slot7 = "_RANDOM"

	table.insert(managers.music.music_events_list, events)

	slot7 = "music_camp"

	table.insert(managers.music.music_events_list, events)

	slot6 = events

	table.sort(managers.music.music_events_list)

	slot11 = "Music events:"

	self._build_value_combobox(managers.music.music_events_list, self, panel, panel_sizer, "music_event", events)

	return 
end

return 
