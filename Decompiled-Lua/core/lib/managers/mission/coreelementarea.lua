-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot4 = "CoreElementArea"

core.module(slot2, core)

slot4 = "CoreShapeManager"

core.import(slot2, core)

slot4 = "CoreMissionScriptElement"

core.import(slot2, core)

slot4 = "CoreTable"

core.import(slot2, core)

if not ElementAreaTrigger then
	slot3 = CoreMissionScriptElement.MissionScriptElement
	slot1 = class(slot2)
end

ElementAreaTrigger = slot1
function ElementAreaTrigger:init(...)
	slot3 = self

	ElementAreaTrigger.super.init(slot2, ...)

	self._last_project_amount_all = 0
	self._shapes = {}
	self._shape_elements = {}
	self._rules_elements = {}

	if not self._values.use_shape_element_ids then
		if not self._values.shape_type or self._values.shape_type == "box" then
			slot3 = self
			slot7 = {
				position = self._values.position,
				rotation = self._values.rotation,
				width = self._values.width,
				depth = self._values.depth,
				height = self._values.height
			}

			self._add_shape(slot2, CoreShapeManager.ShapeBoxMiddle.new(slot5, CoreShapeManager.ShapeBoxMiddle))
		elseif self._values.shape_type == "cylinder" then
			slot3 = self
			slot7 = {
				position = self._values.position,
				rotation = self._values.rotation,
				height = self._values.height,
				radius = self._values.radius
			}

			self._add_shape(slot2, CoreShapeManager.ShapeCylinderMiddle.new(slot5, CoreShapeManager.ShapeCylinderMiddle))
		end
	end

	self._inside = {}

	return 
end
function ElementAreaTrigger:on_script_activated()
	self._on_script_activated_done = true

	if self._values.use_shape_element_ids then
		slot3 = self._values.use_shape_element_ids

		for _, id in ipairs(slot2) do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._shape_elements)
		end
	end

	if self._values.rules_element_ids then
		slot3 = self._values.rules_element_ids

		for _, id in ipairs(slot2) do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._rules_elements)
		end
	end

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	if self._values.enabled then
		slot3 = self

		self.add_callback(slot2)
	end

	return 
end
function ElementAreaTrigger:_add_shape(shape)
	slot5 = shape

	table.insert(slot3, self._shapes)

	return 
end
function ElementAreaTrigger:get_shapes()
	return self._shapes
end
function ElementAreaTrigger:is_inside(pos)
	slot4 = self._shapes

	for _, shape in ipairs(slot3) do
		slot10 = pos

		if shape.is_inside(slot8, shape) then
			return true
		end
	end

	return false
end
function ElementAreaTrigger:_is_inside(pos)
	slot5 = pos

	if self.is_inside(slot3, self) then
		return true
	end

	slot4 = self._shape_elements

	for _, element in ipairs(slot3) do
		if not self._values.use_disabled_shapes then
			slot9 = element
			local use = element.enabled(slot8)
		end

		if use then
			slot11 = pos

			if element.is_inside(slot9, element) then
				return true
			end
		end
	end

	return false
end
function ElementAreaTrigger:set_enabled(enabled)
	if not enabled then
		slot4 = Network

		if Network.is_server(slot3) and self._values.trigger_on == "both" then
			slot6 = self._inside

			for _, unit in ipairs(CoreTable.clone(slot5)) do
				slot10 = unit

				self.sync_exit_area(slot8, self)
			end
		end
	end

	slot5 = enabled

	ElementAreaTrigger.super.set_enabled(slot3, self)

	if enabled then
		slot4 = self

		self.add_callback(slot3)
	else
		self._inside = {}
		slot4 = self

		self.remove_callback(slot3)
	end

	return 
end
function ElementAreaTrigger:add_callback()
	if not self._callback then
		slot8 = "update_area"
		slot5 = self._values.interval
		self._callback = self._mission_script.add(slot2, self._mission_script, callback(slot5, self, self))
	end

	return 
end
function ElementAreaTrigger:remove_callback()
	if self._callback then
		slot4 = self._callback

		self._mission_script.remove(slot2, self._mission_script)

		self._callback = nil
	end

	return 
end
function ElementAreaTrigger:on_executed(instigator, ...)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementAreaTrigger.super.on_executed(slot3, self, ...)

	if not self._values.enabled then
		slot4 = self

		self.remove_callback(slot3)
	end

	return 
end
function ElementAreaTrigger:instigators()
	if self._values.unit_ids then
		local instigators = {}
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = self._values.unit_ids

			for _, id in ipairs(slot3) do

				-- Decompilation error in this vicinity:
				slot9 = Application
				slot10 = unit

				if alive(slot9) then
					slot11 = unit

					table.insert(slot9, instigators)
				end
			end
		end

		return instigators
	end

	local instigators = self.project_instigators(slot2)
	slot4 = self._values.spawn_unit_elements

	for _, id in ipairs(self) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			slot12 = element

			for _, unit in ipairs(element.units(slot11)) do
				slot16 = unit

				table.insert(slot14, instigators)
			end
		end
	end

	return instigators
end
function ElementAreaTrigger:project_instigators()
	return {}
end
function ElementAreaTrigger:project_amount_all()
	return nil
end
function ElementAreaTrigger:project_amount_inside()
	return #self._inside
end
function ElementAreaTrigger:is_instigator_valid(unit)
	return true
end
function ElementAreaTrigger:debug_draw()
	if self._values.instigator == "loot" or self._values.instigator == "unique_loot" then
		slot3 = self._shapes

		for _, shape in ipairs(slot2) do
			slot14 = 0.2

			shape.draw(slot7, shape, 0, 0, (self._values.enabled and 0) or 1, (self._values.enabled and 1) or 0, 0)
		end

		slot3 = self._shape_elements

		for _, shape_element in ipairs(slot2) do
			slot10 = shape_element

			for _, shape in ipairs(shape_element.get_shapes(slot9)) do
				slot19 = 0.2

				shape.draw(slot12, shape, 0, 0, (self._values.enabled and 0) or 1, (self._values.enabled and 1) or 0, 0)
			end
		end
	end

	return 
end
function ElementAreaTrigger:update_area()
	if not self._values.enabled then
		return 
	end

	if self._values.trigger_on == "on_empty" then
		slot3 = Network

		if Network.is_server(slot2) then
			self._inside = {}
			slot5 = self

			for _, unit in ipairs(self.instigators(slot4)) do
				slot8 = unit

				if alive(slot7) then
					slot9 = unit

					self._should_trigger(slot7, self)
				end
			end

			if #self._inside == 0 then
				slot3 = self

				self.on_executed(slot2)
			end
		end
	else
		slot3 = self
		local instigators = self.instigators(slot2)

		if #instigators == 0 then
			slot4 = Network
		else
			slot4 = instigators

			for _, unit in ipairs(slot3) do
				slot9 = unit

				if alive(slot8) then
					slot9 = Network

					if Network.is_client(slot8) then
						slot10 = unit

						self._client_check_state(slot8, self)
					else
						slot10 = unit

						if self._should_trigger(slot8, self) then
							slot10 = unit

							self._check_amount(slot8, self)
						end
					end
				end
			end
		end
	end

	return 
end
function ElementAreaTrigger:sync_enter_area(unit)
	slot5 = unit

	table.insert(slot3, self._inside)

	if self._values.trigger_on == "on_enter" or self._values.trigger_on == "both" or self._values.trigger_on == "while_inside" then
		slot5 = unit

		self._check_amount(slot3, self)
	end

	return 
end
function ElementAreaTrigger:sync_exit_area(unit)
	slot5 = unit

	table.delete(slot3, self._inside)

	if self._values.trigger_on == "on_exit" or self._values.trigger_on == "both" then
		slot5 = unit

		self._check_amount(slot3, self)
	end

	return 
end
function ElementAreaTrigger:sync_while_in_area(unit)
	slot5 = unit

	self._check_amount(slot3, self)

	return 
end
function ElementAreaTrigger:_check_amount(unit)
	if self._values.trigger_on == "on_enter" then
		slot5 = self

		self._clean_destroyed_units(slot4)

		slot5 = self
		local inside = self.project_amount_inside(slot4)

		if 0 < inside and ((amount and amount <= inside) or not amount) then
			slot7 = unit

			self.on_executed(slot5, self)
		end
	elseif self._values.trigger_on == "while_inside" then
	else
		slot5 = unit

		if self.is_instigator_valid(slot3, self) then
			slot5 = unit

			self.on_executed(slot3, self)
		end
	end

	return 
end
function ElementAreaTrigger:_should_trigger(unit)

	-- Decompilation error in this vicinity:
	slot4 = unit

	if alive(slot3) then
		local rule_ok = self._check_instigator_rules(slot3, self)
		local inside = nil
		slot6 = unit

		if unit.movement(unit) then
			slot6 = self
			slot9 = unit
			slot9 = unit.movement(slot8)
			inside = self._is_inside(slot5, unit.movement(slot8).m_pos(slot8))
		else
			slot7 = tmp_vec1

			unit.m_position(slot5, unit)

			slot7 = tmp_vec1
			inside = self._is_inside(slot5, self)
		end

		slot7 = unit

		if table.contains(slot5, self._inside) then
			if not inside or not rule_ok then
				slot7 = unit

				table.delete(slot5, self._inside)

				if self._values.trigger_on == "on_exit" or self._values.trigger_on == "both" then
					return true
				end
			end
		elseif inside and rule_ok then
			slot7 = unit

			table.insert(slot5, self._inside)

			if self._values.trigger_on == "on_enter" or self._values.trigger_on == "both" then
				return true
			end
		end

		if self._values.trigger_on == "while_inside" and inside and rule_ok then
			return true
		end
	end

	if self._values.amount == "all" then
		slot4 = self
		local project_amount_all = self.project_amount_all(slot3)

		if project_amount_all ~= self._last_project_amount_all then
			self._last_project_amount_all = project_amount_all
			slot5 = self

			self._clean_destroyed_units(slot4)

			return true
		end
	end

	return false
end
function ElementAreaTrigger:_check_instigator_rules(unit)
	slot4 = self._rules_elements

	for _, element in ipairs(slot3) do
		slot11 = unit

		if not element.check_rules(slot8, element, self._values.instigator) then
			return false
		end
	end

	return true
end
function ElementAreaTrigger:_clean_destroyed_units()
	local i = 1
	slot4 = self._inside

	while next(slot3) and i <= #self._inside do
		slot4 = self._inside[i]

		if alive(slot3) then
			i = i + 1
		else
			slot5 = i

			table.remove(slot3, self._inside)
		end
	end

	return 
end
function ElementAreaTrigger:_client_check_state(unit)
	slot5 = unit
	local rule_ok = self._check_instigator_rules(slot3, self)
	slot8 = unit
	local inside = self._is_inside(self, unit.position(slot7))
	slot7 = unit

	if table.contains(self, self._inside) then
		if not inside or not rule_ok then
			slot7 = unit

			table.delete(slot5, self._inside)

			slot6 = managers.network
			slot11 = unit

			managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 2, self._sync_id, self._id)
		elseif self._values.trigger_on == "while_inside" then
			slot6 = managers.network
			slot11 = unit

			managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 3, self._sync_id, self._id)
		end
	elseif inside and rule_ok then
		slot7 = unit

		table.insert(slot5, self._inside)

		slot6 = managers.network
		slot11 = unit

		managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 1, self._sync_id, self._id)
	end

	return 
end
function ElementAreaTrigger:operation_set_interval(interval)
	self._values.interval = interval
	slot4 = self

	self.remove_callback(slot3)

	if self._values.enabled then
		slot4 = self

		self.add_callback(slot3)
	end

	return 
end
function ElementAreaTrigger:operation_set_use_disabled_shapes(use_disabled_shapes)
	self._values.use_disabled_shapes = use_disabled_shapes

	return 
end
function ElementAreaTrigger:operation_clear_inside()
	self._inside = {}

	return 
end
function ElementAreaTrigger:save(data)
	data.enabled = self._values.enabled
	data.interval = self._values.interval
	data.use_disabled_shapes = self._values.use_disabled_shapes

	return 
end
function ElementAreaTrigger:load(data)
	if not self._on_script_activated_done then
		slot4 = self

		self.on_script_activated(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	slot5 = data.interval

	self.operation_set_interval(slot3, self)

	self._values.use_disabled_shapes = data.use_disabled_shapes

	return 
end

if not ElementAreaOperator then
	slot3 = CoreMissionScriptElement.MissionScriptElement
	slot1 = class(slot2)
end

ElementAreaOperator = slot1
function ElementAreaOperator:init(...)
	slot3 = self

	ElementAreaOperator.super.init(slot2, ...)

	return 
end
function ElementAreaOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementAreaOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.apply_on_interval then
				slot11 = self._values.interval

				element.operation_set_interval(slot9, element)
			end

			if self._values.apply_on_use_disabled_shapes then
				slot11 = self._values.use_disabled_shapes

				element.operation_set_use_disabled_shapes(slot9, element)
			end

			if self._values.operation == "clear_inside" then
				slot10 = element

				element.operation_clear_inside(slot9)
			end
		end
	end

	slot5 = instigator

	ElementAreaOperator.super.on_executed(slot3, self)

	return 
end

if not ElementAreaReportTrigger then
	slot3 = ElementAreaTrigger
	slot1 = class(slot2)
end

ElementAreaReportTrigger = slot1
function ElementAreaReportTrigger:update_area()
	if not self._values.enabled then
		return 
	end

	slot3 = self
	local instigators = self.instigators(slot2)

	if #instigators == 0 then
		slot4 = Network
	else
		slot4 = instigators

		for _, unit in ipairs(slot3) do
			slot9 = unit

			if alive(slot8) then
				slot9 = Network

				if Network.is_client(slot8) then
					slot10 = unit

					self._client_check_state(slot8, self)
				else
					slot9 = Network

					if Network.is_server(slot8) then
						slot10 = unit

						self._check_state(slot8, self)
					end
				end
			end
		end
	end

	return 
end
function ElementAreaReportTrigger:_check_state(unit)
	slot4 = self

	self._clean_destroyed_units(slot3)

	slot4 = unit

	if alive(slot3) then
		local rule_ok = self._check_instigator_rules(slot3, self)
		local inside = nil
		slot6 = unit

		if unit.movement(unit) then
			slot6 = self
			slot9 = unit
			slot9 = unit.movement(slot8)
			inside = self._is_inside(slot5, unit.movement(slot8).m_pos(slot8))
		else
			slot7 = tmp_vec1

			unit.m_position(slot5, unit)

			slot7 = tmp_vec1
			inside = self._is_inside(slot5, self)
		end

		if inside and not rule_ok then
			slot7 = unit

			self._rule_failed(slot5, self)
		end

		slot7 = unit

		if table.contains(slot5, self._inside) then
			if not inside or not rule_ok then
				slot7 = unit

				self._remove_inside(slot5, self)
			elseif inside and rule_ok then
				slot7 = unit

				self._while_inside(slot5, self)
			end
		elseif inside and rule_ok then
			slot7 = unit

			self._add_inside(slot5, self)
		end
	end

	slot4 = self
	local project_amount_all = self.project_amount_all(slot3)

	if project_amount_all ~= self._last_project_amount_all then
		self._last_project_amount_all = project_amount_all
		slot5 = self

		self._clean_destroyed_units(slot4)

		return true
	end

	return false
end
function ElementAreaReportTrigger:_add_inside(unit)
	slot5 = unit

	table.insert(slot3, self._inside)

	slot5 = "while_inside"

	if self._has_on_executed_alternative(slot3, self) then
		slot6 = "while_inside"

		self.on_executed(slot3, self, unit)
	else
		slot6 = "enter"

		self.on_executed(slot3, self, unit)
	end

	slot5 = unit

	self._check_on_executed_reached_amount(slot3, self)

	return 
end
function ElementAreaReportTrigger:_check_on_executed_reached_amount(unit)
	if self._values.amount == "all" then
		slot4 = self
		slot2 = self.project_amount_all(slot3)
	else
		slot2 = false

		if false then
			local amount = true
		end
	end

	if not amount then
		slot5 = self._values.amount
		amount = tonumber(slot4)
	end

	if amount == #self._inside then
		slot6 = "reached_amount"

		if self._has_on_executed_alternative(slot4, self) then
			slot7 = "reached_amount"

			self.on_executed(slot4, self, unit)
		end
	end

	return 
end
function ElementAreaReportTrigger:_while_inside(unit)
	slot5 = "while_inside"

	if self._has_on_executed_alternative(slot3, self) then
		slot6 = "while_inside"

		self.on_executed(slot3, self, unit)
	end

	return 
end
function ElementAreaReportTrigger:_rule_failed(unit)
	slot5 = "rule_failed"

	if self._has_on_executed_alternative(slot3, self) then
		slot6 = "rule_failed"

		self.on_executed(slot3, self, unit)
	end

	return 
end
function ElementAreaReportTrigger:_remove_inside(unit)
	slot5 = unit

	table.delete(slot3, self._inside)

	slot6 = "leave"

	self.on_executed(slot3, self, unit)

	if #self._inside == 0 then
		slot6 = "empty"

		self.on_executed(slot3, self, unit)
	end

	slot5 = unit

	self._check_on_executed_reached_amount(slot3, self)

	return 
end
function ElementAreaReportTrigger:_remove_inside_by_index(index)
	slot5 = index

	table.remove(slot3, self._inside)

	slot6 = "leave"

	self.on_executed(slot3, self, nil)

	if #self._inside == 0 then
		slot6 = "empty"

		self.on_executed(slot3, self, nil)
	end

	slot5 = nil

	self._check_on_executed_reached_amount(slot3, self)

	return 
end
function ElementAreaReportTrigger:_clean_destroyed_units()
	local i = 1
	slot4 = self._inside

	while next(slot3) and i <= #self._inside do
		local unit = self._inside[i]
		slot5 = unit

		if alive(slot4) then
			slot5 = unit
		else
			slot5 = unit

			if alive(slot4) then
				slot5 = unit

				if unit.character_damage(slot4) then
					slot5 = unit
					slot5 = unit.character_damage(slot4)

					if unit.character_damage(slot4).dead(slot4) then
						slot7 = "on_death"

						self.on_executed(slot4, self, unit)
					end
				end
			end
		end

		slot6 = i

		self._remove_inside_by_index(slot4, self)
	end

	return 
end
function ElementAreaReportTrigger:_client_check_state(unit)
	slot5 = unit
	local rule_ok = self._check_instigator_rules(slot3, self)
	slot8 = unit
	local inside = self._is_inside(self, unit.position(slot7))
	slot7 = unit

	if table.contains(self, self._inside) then
		if not inside or not rule_ok then
			slot7 = unit

			table.delete(slot5, self._inside)

			slot6 = managers.network
			slot11 = unit

			managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 2, self._sync_id, self._id)
		end
	elseif inside and rule_ok then
		slot7 = unit

		table.insert(slot5, self._inside)

		slot6 = managers.network
		slot11 = unit

		managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 1, self._sync_id, self._id)
	end

	if inside then
		if rule_ok then
			slot7 = "while_inside"

			if self._has_on_executed_alternative(slot5, self) then
				slot6 = managers.network
				slot11 = unit

				managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 3, self._sync_id, self._id)
			end
		else
			slot7 = "rule_failed"

			if self._has_on_executed_alternative(slot5, self) then
				slot6 = managers.network
				slot11 = unit

				managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_area_event", 4, self._sync_id, self._id)
			end
		end
	end

	return 
end
function ElementAreaReportTrigger:sync_enter_area(unit)
	slot5 = unit

	self._add_inside(slot3, self)

	return 
end
function ElementAreaReportTrigger:sync_exit_area(unit)
	slot5 = unit

	self._remove_inside(slot3, self)

	return 
end
function ElementAreaReportTrigger:sync_while_in_area(unit)
	slot5 = unit

	self._while_inside(slot3, self)

	return 
end
function ElementAreaReportTrigger:sync_rule_failed(unit)
	slot5 = unit

	self._rule_failed(slot3, self)

	return 
end

return 
