-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementActivateScript"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementActivateScript then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementActivateScript = slot0
function ElementActivateScript:init(...)
	slot3 = self

	ElementActivateScript.super.init(slot2, ...)

	return 
end
function ElementActivateScript:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementActivateScript:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.activate_script ~= "none" then
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant activate script named \"none\" [" .. self._editor_name .. "]"

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementActivateScript.super.on_executed(slot3, self)

	return 
end

return 
