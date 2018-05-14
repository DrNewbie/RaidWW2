slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementTeammateComment then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTeammateComment = slot0
function ElementTeammateComment:init(...)
	slot3 = self

	ElementTeammateComment.super.init(slot2, ...)

	return 
end
function ElementTeammateComment:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementTeammateComment:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.comment ~= "none" then
		local radius = (self._values.radius ~= 0 and self._values.radius) or nil
		local trigger_unit = (self._values.use_instigator and instigator) or nil

		if trigger_unit then
			slot6 = trigger_unit

			if type(slot5) ~= "userdata" then
				slot8 = trigger_unit

				debug_pause(slot5, "[ElementTeammateComment:on_executed] instigator is not a unit", instigator)

				trigger_unit = nil
			end
		end

		slot6 = managers.groupai
		slot12 = false

		managers.groupai.state(slot5).teammate_comment(slot5, managers.groupai.state(slot5), trigger_unit, self._values.comment, self._values.position, self._values.close_to_element, radius)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant play comment " .. self._values.comment .. " in element " .. self._editor_name .. "."

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementTeammateComment.super.on_executed(slot3, self)

	return 
end

return 
