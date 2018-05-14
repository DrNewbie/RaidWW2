slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMissionEnd then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMissionEnd = slot0
function ElementMissionEnd:init(...)
	slot3 = self

	ElementMissionEnd.super.init(slot2, ...)

	return 
end
function ElementMissionEnd:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementMissionEnd:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.raid_job

	if not managers.raid_job.current_job(slot3) then
		slot7 = self._editor_name
		slot4 = "[ElementMissionEnd] Triggered element " .. tostring(slot6) .. " but not currently in a job!"

		debug_pause(slot3)

		return 
	end

	slot4 = game_state_machine

	if game_state_machine.current_state_name(slot3) == "event_complete_screen" then
		slot9 = self._id
		slot6 = "Element id: " .. tostring(self._editor_name)

		Application.debug(slot3, Application, "Mission end element triggered even though the game is already in that state! Element name: " .. tostring(slot7))
	end

	slot5 = "event_complete_screen"

	game_state_machine.change_state_by_name(slot3, game_state_machine)

	slot5 = instigator

	ElementMissionEnd.super.on_executed(slot3, self)

	return 
end

return 
