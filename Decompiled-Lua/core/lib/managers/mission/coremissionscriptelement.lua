-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.module(slot1, core)

slot3 = "CoreXml"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

MissionScriptElement = MissionScriptElement or class()
function MissionScriptElement:save(data)
	data.enabled = self._values.enabled

	return 
end
function MissionScriptElement:load(data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end
function MissionScriptElement:init(mission_script, data)
	self._mission_script = mission_script
	self._id = data.id
	self._editor_name = data.editor_name
	self._values = data.values
	slot5 = mission_script
	self._sync_id = mission_script.sync_id(slot4)

	return 
end
function MissionScriptElement:on_created()
	return 
end
function MissionScriptElement:on_script_activated()
	if self._values.rules_elements then
		self._rules_elements = {}
		slot3 = self._values.rules_elements

		for _, id in ipairs(slot2) do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._rules_elements)
		end
	end

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function MissionScriptElement:get_mission_element(id)
	slot5 = id

	return self._mission_script.element(slot3, self._mission_script)
end
function MissionScriptElement:editor_name()
	return self._editor_name
end
function MissionScriptElement:id()
	return self._id
end
function MissionScriptElement:_unique_string_id()
	return "" .. self._sync_id .. "_" .. self._id
end
function MissionScriptElement:values()
	return self._values
end
function MissionScriptElement:value(name)
	if self._values.instance_name and self._values.instance_var_names and self._values.instance_var_names[name] then
		slot7 = self._values.instance_var_names[name]
		local value = managers.world_instance.get_instance_param(slot3, managers.world_instance, self._sync_id, self._values.instance_name)

		if value then
			return value
		end
	end

	return self._values[name]
end
function MissionScriptElement:get_random_table_value(value)
	slot4 = value

	if tonumber(slot3) then
		return value
	end

	slot5 = value[2] + 1

	return (value[1] + math.random(slot4)) - 1
end
function MissionScriptElement:enabled()
	return self._values.enabled
end
function MissionScriptElement:_check_instigator(instigator)
	slot4 = instigator

	if CoreClass.type_name(slot3) == "Unit" then
		return instigator
	end

	slot4 = managers.player

	return managers.player.player_unit(slot3)
end
function MissionScriptElement:on_executed(instigator, alternative, skip_execute_on_executed)
	if not self._values.enabled then
		return 
	end

	slot7 = instigator
	instigator = self._check_instigator(slot5, self)
	slot6 = Network

	if Network.is_server(slot5) then
		if instigator then
			slot6 = instigator
		else
			slot6 = managers.network
			slot10 = self._last_orientation_index or 0

			managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "run_mission_element_no_instigator", self._sync_id, self._id)
		end
	end

	self._last_orientation_index = nil
	slot7 = instigator

	self._print_debug_on_executed(slot5, self)

	slot6 = self

	self._reduce_trigger_times(slot5)

	slot6 = Network

	if Network.is_server(slot5) then
	end

	return 
end
function MissionScriptElement:_calc_base_delay()
	if not self._values.base_delay_rand then
		return self._values.base_delay
	end

	slot4 = self._values.base_delay_rand

	return self._values.base_delay + math.rand(slot3)
end
function MissionScriptElement:_trigger_execute_on_executed(instigator, alternative)
	slot5 = self
	local base_delay = self._calc_base_delay(slot4)

	if 0 < base_delay then
		slot12 = {
			instigator = instigator,
			alternative = alternative
		}
		slot9 = 1

		self._mission_script.add(slot5, self._mission_script, callback(slot8, self, self, "_execute_on_executed"), base_delay)
	else
		slot7 = {
			instigator = instigator,
			alternative = alternative
		}

		self.execute_on_executed(slot5, self)
	end

	return 
end
function MissionScriptElement:_print_debug_on_executed(instigator)
	slot4 = self

	if self.is_debug(slot3) then
		slot6 = instigator

		self._print_debug(slot3, self, "Element '" .. self._editor_name .. "' executed.")

		if instigator then
		end
	end

	return 
end
function MissionScriptElement:_print_debug(debug, instigator)
	slot5 = self

	if self.is_debug(slot4) then
		slot6 = debug

		self._mission_script.debug_output(slot4, self._mission_script)
	end

	return 
end
function MissionScriptElement:_reduce_trigger_times()
	if 0 < self._values.trigger_times then
		self._values.trigger_times = self._values.trigger_times - 1

		if self._values.trigger_times <= 0 then
			self._values.enabled = false
		end
	end

	return 
end
function MissionScriptElement:_execute_on_executed(params)
	slot5 = params

	self.execute_on_executed(slot3, self)

	return 
end
function MissionScriptElement:_calc_element_delay(params)
	if not params.delay_rand then
		return params.delay
	end

	slot5 = params.delay_rand

	return params.delay + math.rand(slot4)
end
function MissionScriptElement:execute_on_executed(execute_params)
	slot4 = self._values.on_executed

	for _, params in ipairs(slot3) do
		if not execute_params.alternative or not params.alternative or execute_params.alternative == params.alternative then
			slot10 = params.id
			local element = self.get_mission_element(slot8, self)

			if element then
				slot11 = params
				local delay = self._calc_element_delay(slot9, self)

				if 0 < delay then

					-- Decompilation error in this vicinity:
					slot11 = self
					slot17 = execute_params.instigator
					slot14 = 1

					self._mission_script.add(slot10, self._mission_script, callback(slot13, element, element, "on_executed"), delay)
				else

					-- Decompilation error in this vicinity:
					slot11 = self
					slot12 = execute_params.instigator

					element.on_executed(slot10, element)
				end
			end
		end
	end

	return 
end
function MissionScriptElement:on_execute_element(element, instigator)
	slot6 = instigator

	element.on_executed(slot4, element)

	return 
end
function MissionScriptElement:_has_on_executed_alternative(alternative)
	slot4 = self._values.on_executed

	for _, params in ipairs(slot3) do
		if params.alternative and params.alternative == alternative then
			return true
		end
	end

	return false
end
function MissionScriptElement:set_enabled(enabled)
	self._values.enabled = enabled

	return 
end
function MissionScriptElement:on_toggle(value)
	return 
end
function MissionScriptElement:set_trigger_times(trigger_times)
	self._values.trigger_times = trigger_times

	return 
end
function MissionScriptElement:is_debug()
	if not self._values.debug then
		slot3 = self._mission_script
		slot1 = self._mission_script.is_debug(slot2)
	end

	return slot1
end
function MissionScriptElement:stop_simulation(...)
	return 
end
function MissionScriptElement:operation_add()
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have an 'add' operator implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
function MissionScriptElement:operation_remove()
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have a 'remove' operator implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
function MissionScriptElement:apply_job_value()
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have a 'apply_job_value' function implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
function MissionScriptElement:set_synced_orientation_element_index(orientation_element_index)
	if orientation_element_index and 0 < orientation_element_index then
		self._synced_orientation_element_index = orientation_element_index
	else
		self._synced_orientation_element_index = nil
	end

	return 
end
function MissionScriptElement:get_orientation_by_index(index)
	if not index or index == 0 then
		return self._values.position, self._values.rotation
	end

	local id = self._values.orientation_elements[index]
	slot6 = id
	local element = self.get_mission_element(slot4, self)

	if self._values.disable_orientation_on_use then
		slot7 = false

		element.set_enabled(slot5, element)
	end

	slot7 = 0

	return element.get_orientation_by_index(slot5, element)
end
function MissionScriptElement:get_orientation_index()
	if self._values.orientation_elements and 0 < #self._values.orientation_elements then
		if not self._unused_orientation_indices then
			self._unused_orientation_indices = {}
			slot3 = self._values.orientation_elements

			for index, id in ipairs(slot2) do
				slot9 = index

				table.insert(slot7, self._unused_orientation_indices)
			end
		end

		local alternatives = {}
		slot4 = self._unused_orientation_indices

		for i, index in ipairs(slot3) do
			local element_id = self._values.orientation_elements[index]
			slot11 = element_id
			local element = self.get_mission_element(slot9, self)
			slot11 = element

			if element.enabled(self) then
				slot12 = i

				table.insert(slot10, alternatives)
			end
		end

		if #alternatives == 0 then
			if #self._unused_orientation_indices == #self._values.orientation_elements then
				slot4 = "There where no enabled orientation elements!"
				slot7 = self

				_G.debug_pause(slot3, self.editor_name(slot6))

				return 
			elseif #self._unused_orientation_indices < #self._values.orientation_elements then
				self._unused_orientation_indices = nil
				slot4 = self

				return self.get_orientation_index(slot3)
			end
		end

		if self._values.use_orientation_sequenced then
			slot2 = 1
		else
			slot4 = #alternatives
			slot2 = math.random(slot3)
		end

		local use_i = alternatives[slot2]
		slot6 = use_i
		local index = table.remove(slot4, self._unused_orientation_indices)
		self._unused_orientation_indices = (0 < #self._unused_orientation_indices and self._unused_orientation_indices) or nil

		return index
	else
		return 0
	end

	return 
end
function MissionScriptElement:get_orientation(use_last_orientation_index)
	local index = use_last_orientation_index and self._last_orientation_index

	if not index and not self._synced_orientation_element_index then
		slot5 = self
		index = self.get_orientation_index(slot4)
	end

	self._last_orientation_index = index
	slot6 = index
	local pos, rot = self.get_orientation_by_index(slot4, self)

	return pos, rot
end
function MissionScriptElement:debug_draw()
	return 
end
function MissionScriptElement:pre_destroy()
	return 
end
function MissionScriptElement:destroy()
	return 
end

return 
