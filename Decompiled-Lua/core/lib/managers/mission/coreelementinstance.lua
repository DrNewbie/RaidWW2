slot3 = "CoreElementInstance"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementInstanceInput then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceInput = slot0
function ElementInstanceInput:init(...)
	slot3 = self

	ElementInstanceInput.super.init(slot2, ...)

	if self._values.instance_name then
		slot7 = self

		managers.world_instance.register_input_element(slot2, managers.world_instance, self._sync_id, self._values.instance_name, self._values.event)
	end

	return 
end
function ElementInstanceInput:client_on_executed(...)
	return 
end
function ElementInstanceInput:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementInstanceInput.super.on_executed(slot3, self)

	return 
end

if not ElementInstanceOutput then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceOutput = slot0
function ElementInstanceOutput:init(...)
	slot3 = self

	ElementInstanceOutput.super.init(slot2, ...)

	return 
end
function ElementInstanceOutput:on_created()
	slot6 = self._values.event
	self._output_elements = managers.world_instance.get_registered_output_event_elements(slot2, managers.world_instance, self._sync_id, self._values.instance_name)

	return 
end
function ElementInstanceOutput:client_on_executed(...)
	return 
end
function ElementInstanceOutput:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._output_elements then
		slot4 = self._output_elements

		for _, element in ipairs(slot3) do
			slot10 = instigator

			element.on_executed(slot8, element)
		end
	end

	slot5 = instigator

	ElementInstanceOutput.super.on_executed(slot3, self)

	return 
end

if not ElementInstanceInputEvent then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceInputEvent = slot0
function ElementInstanceInputEvent:init(...)
	slot3 = self

	ElementInstanceInputEvent.super.init(slot2, ...)

	return 
end
function ElementInstanceInputEvent:on_created()
	return 
end
function ElementInstanceInputEvent:client_on_executed(...)
	return 
end
function ElementInstanceInputEvent:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.instance then
		slot7 = self._values.event
		local input_elements = managers.world_instance.get_registered_input_elements(slot3, managers.world_instance, self._sync_id, self._values.instance)

		if input_elements then
			slot5 = input_elements

			for _, element in ipairs(slot4) do
				slot11 = instigator

				element.on_executed(slot9, element)
			end
		end
	elseif self._values.event_list then
		slot4 = self._values.event_list

		for _, event_list_data in ipairs(slot3) do
			slot12 = event_list_data.event
			local input_elements = managers.world_instance.get_registered_input_elements(slot8, managers.world_instance, self._sync_id, event_list_data.instance)

			if input_elements then
				slot10 = input_elements

				for _, element in ipairs(slot9) do
					slot16 = instigator

					element.on_executed(slot14, element)
				end
			end
		end
	end

	slot5 = instigator

	ElementInstanceInputEvent.super.on_executed(slot3, self)

	return 
end

if not ElementInstanceOutputEvent then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceOutputEvent = slot0
function ElementInstanceOutputEvent:init(...)
	slot3 = self

	ElementInstanceOutputEvent.super.init(slot2, ...)

	if self._values.instance then
		slot6 = self

		managers.world_instance.register_output_event_element(slot2, managers.world_instance, self._values.instance, self._values.event)
	end

	if self._values.event_list then
		slot3 = self._values.event_list

		for _, event_list_data in ipairs(slot2) do
			slot12 = self

			managers.world_instance.register_output_event_element(slot7, managers.world_instance, self._sync_id, event_list_data.instance, event_list_data.event)
		end
	end

	return 
end
function ElementInstanceOutputEvent:client_on_executed(...)
	return 
end
function ElementInstanceOutputEvent:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementInstanceOutputEvent.super.on_executed(slot3, self)

	return 
end

if not ElementInstancePoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstancePoint = slot0
function ElementInstancePoint:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	slot3 = managers.worldcollection

	managers.worldcollection.check_queued_client_mission_executions(slot2)

	return 
end
function ElementInstancePoint:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self._create(slot3)

	slot5 = instigator

	ElementInstancePoint.super.on_executed(slot3, self)

	return 
end
function ElementInstancePoint:_create()
	if self._has_created then
		return 
	end

	self._has_created = true
	slot3 = Network

	if Network.is_server(slot2) then
		slot4 = self._id

		self._mission_script.add_save_state_cb(slot2, self._mission_script)
	end

	if self._values.instance then
		slot6 = {
			position = self._values.position,
			rotation = self._values.rotation
		}

		managers.world_instance.custom_create_instance(slot2, managers.world_instance, self._values.instance, self._sync_id)
	else
		slot3 = Application

		if Application.editor(slot2) then
			slot4 = "[ElementInstancePoint:_create()] No instance defined in [" .. self._editor_name .. "]"

			managers.editor.output_error(slot2, managers.editor)
		end
	end

	return 
end
function ElementInstancePoint:save(data)
	data.has_created = self._has_created
	data.enabled = self._values.enabled

	return 
end
function ElementInstancePoint:load(data)
	if data.has_created then
		slot4 = self

		self._create(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end

if not ElementInstanceParams then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceParams = slot0

if not ElementInstanceSetParams then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstanceSetParams = slot0
function ElementInstanceSetParams:init(...)
	slot3 = self

	ElementInstanceOutputEvent.super.init(slot2, ...)

	if not self._values.apply_on_execute then
		slot3 = self

		self._apply_instance_params(slot2)
	end

	return 
end
function ElementInstanceSetParams:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementInstanceSetParams:_apply_instance_params()
	if self._values.instance then
		slot6 = self._values.params

		managers.world_instance.set_instance_params(slot2, managers.world_instance, self._sync_id, self._values.instance)
	else
		slot3 = Application

		if Application.editor(slot2) then
			slot4 = "[ElementInstanceSetParams:_apply_instance_params()] No instance defined in [" .. self._editor_name .. "]"

			managers.editor.output_error(slot2, managers.editor)
		end
	end

	return 
end
function ElementInstanceSetParams:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.apply_on_execute then
		slot4 = self

		self._apply_instance_params(slot3)
	end

	slot5 = instigator

	ElementInstanceSetParams.super.on_executed(slot3, self)

	return 
end

return 
