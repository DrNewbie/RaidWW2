slot3 = "CoreElementWorld"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementWorldOutputEvent then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldOutputEvent = slot0
function ElementWorldOutputEvent:init(...)
	slot3 = self

	ElementWorldOutputEvent.super.init(slot2, ...)

	if self._values.event_list then
		slot3 = self._values.event_list

		for _, event_list_data in ipairs(slot2) do
			slot11 = self

			managers.worldcollection.register_output_element(slot7, managers.worldcollection, event_list_data.world_name, event_list_data.event)
		end
	end

	return 
end
function ElementWorldOutputEvent:on_created()
	return 
end
function ElementWorldOutputEvent:client_on_executed(...)
	return 
end
function ElementWorldOutputEvent:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementWorldOutputEvent.super.on_executed(slot3, self)

	return 
end
function ElementWorldOutputEvent:destroy()
	slot3 = self._values.event_list

	for _, event_list_data in ipairs(slot2) do
		slot11 = self

		managers.worldcollection.unregister_output_element(slot7, managers.worldcollection, event_list_data.world_name, event_list_data.event)
	end

	return 
end

if not ElementWorldOutput then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldOutput = slot0
function ElementWorldOutput:init(...)
	slot3 = self

	ElementWorldOutput.super.init(slot2, ...)

	return 
end
function ElementWorldOutput:client_on_executed(...)
	return 
end
function ElementWorldOutput:on_created()
	slot6 = self._values.event

	Application.debug(slot2, Application, "[ElementWorldOutput:on_created()]", self._sync_id)

	slot5 = self._values.event
	self._output_elements = managers.worldcollection.get_output_elements_for_world(slot2, managers.worldcollection, self._sync_id)

	return 
end
function ElementWorldOutput:on_executed(instigator)
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

	ElementWorldOutput.super.on_executed(slot3, self)

	return 
end

if not ElementWorldInput then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldInput = slot0
function ElementWorldInput:init(...)
	slot3 = self

	ElementWorldInput.super.init(slot2, ...)

	slot6 = self

	managers.worldcollection.register_input_element(slot2, managers.worldcollection, self._sync_id, self._values.event)

	return 
end
function ElementWorldInput:client_on_executed(...)
	return 
end
function ElementWorldInput:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementWorldInput.super.on_executed(slot3, self)

	return 
end
function ElementWorldInput:destroy()
	slot6 = self

	managers.worldcollection.unregister_input_element(slot2, managers.worldcollection, self._sync_id, self._values.event)

	return 
end

if not ElementWorldInputEvent then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldInputEvent = slot0
function ElementWorldInputEvent:init(...)
	slot3 = self

	ElementWorldInputEvent.super.init(slot2, ...)

	return 
end
function ElementWorldInputEvent:on_created()
	slot3 = "ElementWorldInputEvent:on_created()"

	print(slot2)

	return 
end
function ElementWorldInputEvent:client_on_executed(...)
	return 
end
function ElementWorldInputEvent:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.event_list then
		slot4 = self._values.event_list

		for _, event_list_data in ipairs(slot3) do
			slot11 = event_list_data.event
			local input_elements = managers.worldcollection.get_input_elements_for_world(slot8, managers.worldcollection, event_list_data.world_name)

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

	ElementWorldInputEvent.super.on_executed(slot3, self)

	return 
end

if not ElementWorldPoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWorldPoint = slot0
function ElementWorldPoint:init(...)
	slot3 = self

	ElementWorldPoint.super.init(slot2, ...)

	self._spawn_counter = 0

	return 
end
function ElementWorldPoint:value(name)
	return self._values[name]
end
function ElementWorldPoint:client_on_executed(...)
	return 
end
function ElementWorldPoint:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
ElementWorldPoint.DELAY_DESTROY_SINGLE = 1.1
ElementWorldPoint.DELAY_CREATE_SINGLE = 2
ElementWorldPoint.DELAY_DESTROY_MULTI = 3
ElementWorldPoint.DELAY_CREATE_MULTI = 5
function ElementWorldPoint:on_executed(instigator)
	slot9 = self._action

	Application.debug(slot3, Application, "[ElementWorldPoint:on_executed] on_executed", self._values.world, self._values.enabled, self._world_id)

	if not self._values.enabled then
		return 
	end

	local delay_destroy, delay_create = nil
	slot6 = managers.network
	slot6 = managers.network.session(slot5)

	if 1 < managers.network.session(slot5).count_all_peers(slot5) then
		delay_destroy = ElementWorldPoint.DELAY_DESTROY_MULTI
		delay_create = ElementWorldPoint.DELAY_CREATE_MULTI
	else
		delay_destroy = ElementWorldPoint.DELAY_DESTROY_SINGLE
		delay_create = ElementWorldPoint.DELAY_CREATE_SINGLE
	end

	if self._action == "despawn" then
		slot13 = true

		managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self._destroy_world, self, nil, delay_destroy, nil)
	elseif self._action == "enable_plant_loot" then
		slot7 = self._world_id
		local spawn = managers.worldcollection.world_spawn(slot5, managers.worldcollection)

		if not spawn then
			slot7 = "[ElementWorldPoint:on_executed] Tried to enable spawn loot flag on world that is still not spawned!"

			_G.debug_pause(slot6)
		else
			spawn.plant_loot = true
		end
	else
		slot13 = true

		managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self._create_world, self, nil, delay_create, nil)
	end

	slot7 = instigator

	ElementWorldPoint.super.on_executed(slot5, self)

	return 
end
function ElementWorldPoint:_destroy_world()
	slot6 = self._has_created

	Application.debug(slot2, Application, "[ElementWorldPoint:_destroy_world()]", self._world_id)

	if not self._has_created then
		return 
	end

	self._has_created = false
	slot4 = self._world_id

	table.insert(slot2, managers.worldcollection.queued_world_destruction)

	slot5 = self._editor_name

	managers.worldcollection.register_world_despawn(slot2, managers.worldcollection, self._world_id)

	self._world_id = nil

	return 
end
function ElementWorldPoint:_create_world(world_id)
	if self._has_created or not self._values.world then
		slot6 = world_id

		Application.debug(slot3, Application, "[ElementWorldPoint:_create() World is alreaedy created, skipping!]")

		return 
	end

	self._has_created = true
	self._spawn_counter = self._spawn_counter + 1
	slot5 = self._values.world
	local world_meta_data = managers.worldcollection.get_world_meta_data(slot3, managers.worldcollection)
	slot9 = self._values.rotation

	Application.debug(managers.worldcollection, Application, "[ElementWorldPoint:_create() Creating world:]", world_meta_data.file, self._values.position)

	slot6 = self._id
	local world_def = managers.worldcollection.get_worlddefinition_by_unit_id(managers.worldcollection, managers.worldcollection)
	local pos = Vector3()
	local rot = Rotation()
	slot8 = world_def

	if world_def.translation(world_meta_data.file) == nil then
		pos = self._values.position
		rot = self._values.rotation
	else
		slot11 = world_def
		slot9 = world_def.translation(slot10).position

		mvector3.set(slot7, pos)

		slot9 = self._values.position

		mvector3.add(slot7, pos)

		slot8 = rot

		mrotation.set_zero(slot7)

		slot11 = world_def
		slot9 = world_def.translation(slot10).rotation

		mrotation.multiply(slot7, rot)

		slot9 = self._values.rotation

		mrotation.multiply(slot7, rot)
	end

	local world = {
		meta_data = world_meta_data,
		translation = {}
	}
	world.translation.position = pos
	world.translation.rotation = rot

	if not world_id then
		slot9 = managers.worldcollection
		self._world_id = managers.worldcollection.get_next_world_id(slot8)
	else
		self._world_id = world_id
	end

	slot14 = self._excluded_continents

	managers.worldcollection.prepare_world(slot8, managers.worldcollection, world, self._world_id, self._editor_name, self._spawn_counter)

	slot12 = self._spawn_loot

	managers.worldcollection.register_world_spawn(slot8, managers.worldcollection, self._world_id, self._editor_name)

	slot10 = "[ElementWorldPoint:_create] world created"

	Application.debug(slot8, Application)

	return 
end
function ElementWorldPoint:save(data)
	data.has_created = self._has_created
	data.world_id = self._world_id
	data.excluded_continents = self._excluded_continents
	data.enabled = self._values.enabled
	data.world = self._values.world

	return 
end
function ElementWorldPoint:load(data)
	self._values.world = data.world
	self._excluded_continents = data.excluded_continents

	if data.has_created then
		slot5 = data.world_id

		self._create_world(slot3, self)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end
function ElementWorldPoint:stop_simulation(...)
	return 
end
function ElementWorldPoint:execute_action(action)
	slot6 = action

	Application.debug(slot3, Application, "[ElementWorldPoint:execute_action]")

	self._action = action
	slot5 = nil

	self.on_executed(slot3, self)

	return 
end
function ElementWorldPoint:destroy()
	slot3 = self

	self._destroy_world(slot2)

	return 
end

return 
