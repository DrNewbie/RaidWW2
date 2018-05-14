slot3 = "CoreElementMusic"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMusic then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMusic = slot0
function ElementMusic:init(...)
	slot3 = self

	ElementMusic.super.init(slot2, ...)

	return 
end
function ElementMusic:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementMusic:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot6 = self._values.music_event

	Application.debug(slot3, Application, "[ElementMusic:on_executed()]")

	if self._values.music_event then
		local event_name = self._values.music_event

		if self._values.music_event == "_RANDOM" then
			slot5 = managers.music
			event_name = managers.music.get_random_event(slot4)
		elseif self._values.music_event == "_LEVEL_DEFAULT" then
			slot5 = managers.music
			event_name = managers.music.get_default_event(slot4)
		end

		slot6 = event_name

		managers.music.post_event(slot4, managers.music)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant play music event nil [" .. self._editor_name .. "]"

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementMusic.super.on_executed(slot3, self)

	return 
end

return 
