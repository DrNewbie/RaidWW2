-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDialogue then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDialogue = slot0
function ElementDialogue:init(...)
	slot3 = self

	ElementDialogue.super.init(slot2, ...)

	return 
end
function ElementDialogue:client_on_executed(...)
	return 
end
function ElementDialogue:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	local char = nil

	if self._values.use_instigator then
		slot6 = instigator
		char = managers.criminals.character_name_by_unit(slot4, managers.criminals)
	end

	if self._values.random and self._values.random ~= "none" then
		slot8 = {
			skip_idle_check = true,
			instigator = char,
			done_cbk = done_cbk,
			position = self._values.position
		}

		managers.dialog.queue_random(slot5, managers.dialog, self._values.random)
	end

	slot9 = self._values.execute_on_executed_when_done

	ElementDialogue.super.on_executed(slot5, self, instigator, nil)

	return 
end
function ElementDialogue:_done_callback(instigator, reason)
	slot7 = reason

	Application.debug(slot4, Application, "[ElementDialogue:_done_callback] reason")

	if reason == "done" then
		self._instigator = instigator
		slot11 = nil

		managers.queued_tasks.queue(slot4, managers.queued_tasks, nil, self._queueud_done, self, nil, 0.1)
	end

	return 
end
function ElementDialogue:_queueud_done()
	slot4 = self._instigator

	ElementDialogue.super._trigger_execute_on_executed(slot2, self)

	return 
end

return 
