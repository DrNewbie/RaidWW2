slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementHint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementHint = slot0
function ElementHint:init(...)
	slot3 = self

	ElementHint.super.init(slot2, ...)

	return 
end
function ElementHint:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementHint:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.hint_id ~= "none" then
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant show hint " .. self._values.hint_id .. " in element " .. self._editor_name .. "."

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementHint.super.on_executed(slot3, self)

	return 
end

return 
