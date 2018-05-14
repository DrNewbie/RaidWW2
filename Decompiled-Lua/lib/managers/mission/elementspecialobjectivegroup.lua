-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpecialObjectiveGroup then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpecialObjectiveGroup = slot0
ElementSpecialObjectiveGroup.add_event_callback = ElementSpecialObjective.add_event_callback
ElementSpecialObjectiveGroup.event = ElementSpecialObjective.event
function ElementSpecialObjectiveGroup:init(...)
	slot3 = self

	ElementSpecialObjectiveGroup.super.init(slot2, ...)

	if self._values.SO_access then
		local access_filter_version = self._values.access_flag_version or 1

		if access_filter_version ~= managers.navigation.ACCESS_FLAGS_VERSION then
			slot6 = self._values.SO_access

			print(slot3, "[ElementSpecialObjectiveGroup:init] converting access flag", access_filter_version)

			slot8 = self._values.SO_access
			slot7 = access_filter_version
			self._values.SO_access = managers.navigation.upgrade_access_filter("[ElementSpecialObjectiveGroup:init] converting access flag", managers.navigation, tonumber(slot7))
			slot5 = self._values.SO_access

			print(managers.navigation.upgrade_access_filter("[ElementSpecialObjectiveGroup:init] converting access flag", managers.navigation, tonumber(slot7)), "[ElementSpecialObjectiveGroup:init] converted to")
		else
			slot5 = self._values.SO_access
			self._values.SO_access = tonumber(slot4)
		end
	end

	self._events = {}

	if not self._values.followup_elements then
		self._values.followup_elements = {}
	end

	if self._values.mode == "patrol_group" then
		slot3 = self._values.followup_patrol_elements

		for _, element_data in ipairs(slot2) do
			if element_data.type == "point_special_objective" then
				slot9 = element_data.id

				table.insert(slot7, self._values.followup_elements)
			end
		end
	end

	return 
end
function ElementSpecialObjectiveGroup:clbk_verify_administration(unit)
	slot5 = "ElementSpecialObjectiveGroup:clbk_verify_administration( unit )"

	Application.trace(slot3, Application)

	slot5 = unit

	return ElementSpecialObjective.clbk_verify_administration(slot3, self)
end
function ElementSpecialObjectiveGroup:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).is_AI_enabled(slot3) then
		slot4 = Application
	elseif self._values.mode == "forced_spawn" or self._values.mode == "recurring_cloaker_spawn" or self._values.mode == "recurring_spawn_1" then
		slot4 = self

		self._register_to_group_AI(slot3)
	elseif self._values.spawn_instigator_ids then
		slot4 = self._values.spawn_instigator_ids
	elseif self._values.use_instigator then
		slot4 = instigator

		if alive(slot3) then
			slot4 = instigator

			if instigator.brain(slot3) then
				slot4 = instigator
			else
				slot6 = self._id

				Application.error(slot3, Application, "[ElementSpecialObjectiveGroup:on_executed] Special Objective instigator is not an AI unit. Possibly improper \"use instigator\" flag use. Element id:")
			end
		elseif not instigator then
			slot6 = self._id

			Application.error(slot3, Application, "[ElementSpecialObjectiveGroup:on_executed] Special Objective missing instigator. Possibly improper \"use instigator\" flag use. Element id:")
		end
	else
		slot5 = "ElementSpecialObjectiveGroup:on_executed( instigator ) - exec random: "

		Application.debug(slot3, Application)

		slot5 = nil

		self._execute_random_SO(slot3, self)
	end

	slot5 = instigator

	ElementSpecialObjectiveGroup.super.on_executed(slot3, self)

	return 
end
function ElementSpecialObjectiveGroup:operation_remove()
	if self._registered_in_groupai then
		slot3 = self

		self._unregister_from_group_AI(slot2)
	else
		slot3 = self._values.followup_elements

		for _, followup_element_id in ipairs(slot2) do
			slot8 = managers.groupai
			slot9 = followup_element_id

			managers.groupai.state(slot7).remove_special_objective(slot7, managers.groupai.state(slot7))
		end
	end

	return 
end
function ElementSpecialObjectiveGroup:_unregister_from_group_AI()
	if self._registered_in_groupai then
		self._registered_in_groupai = nil
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		slot6 = self

		managers.groupai.state(slot2).remove_SO_group(slot2, self._unique_string_id(slot5))
	end

	return 
end
function ElementSpecialObjectiveGroup:_register_to_group_AI()
	if self._registered_in_groupai then
		return 
	end

	slot3 = managers.groupai
	slot6 = self
	slot5 = self

	managers.groupai.state(slot2).add_SO_group(slot2, managers.groupai.state(slot2), self._unique_string_id(slot5))

	self._registered_in_groupai = true

	return 
end
function ElementSpecialObjectiveGroup:_select_units_from_spawners()
	slot3 = self

	return ElementSpecialObjective._select_units_from_spawners(slot2)
end
function ElementSpecialObjectiveGroup:choose_followup_SO(unit, skip_element_ids)
	if skip_element_ids and skip_element_ids[self._id] then
		return 
	end

	skip_element_ids[self._id] = true
	slot7 = skip_element_ids
	local res_element = ElementSpecialObjective.choose_followup_SO(true, self, unit)

	if not res_element then
		slot8 = unit

		self.event(slot5, self, "admin_fail")
	end

	return res_element
end
function ElementSpecialObjectiveGroup:get_as_followup(unit, skip_element_ids)
	if skip_element_ids[self._id] then
		return 
	end

	skip_element_ids[self._id] = true
	self._patrol_path_breadcrumb = self._patrol_path_breadcrumb or nil
	local res_element = nil

	if self._patrol_path_breadcrumb then
		res_element = self._patrol_path_breadcrumb
	else
		slot8 = skip_element_ids
		res_element = ElementSpecialObjective.choose_followup_SO(slot5, self, unit)

		if not res_element then
			slot8 = unit

			self.event(slot5, self, "admin_fail")
		end
	end

	if self._values.mode == "patrol_group" then
		self._patrol_path_breadcrumb = res_element
	end

	return res_element, self._values.base_chance
end
function ElementSpecialObjectiveGroup:_execute_random_SO(instigator)
	slot6 = {
		[self._id] = true
	}
	local random_SO = ElementSpecialObjective.choose_followup_SO(slot3, self, instigator)

	if random_SO then
		self._patrol_path_breadcrumb = random_SO
		slot6 = instigator

		random_SO.on_executed(slot4, random_SO)
	else
		slot7 = instigator

		self.event(slot4, self, "admin_fail")
	end

	return 
end
function ElementSpecialObjectiveGroup:get_random_SO(receiver_unit)
	slot6 = {
		[self._id] = true
	}
	local random_SO_element = ElementSpecialObjective.choose_followup_SO(slot3, self, receiver_unit)

	if not random_SO_element then
		return 
	end

	slot6 = receiver_unit
	local objective = random_SO_element.get_objective(slot4, random_SO_element)

	return objective
end
function ElementSpecialObjectiveGroup:get_SO_spawn_group_types()
	return self._values.allowed_group_types
end
function ElementSpecialObjectiveGroup:get_grp_objective()
	if not self._area then
		slot5 = nil
		local nav_seg_id = managers.navigation.get_nav_seg_from_pos(slot2, managers.navigation, self._values.position)
		slot4 = managers.groupai
		slot5 = nav_seg_id
		self._area = managers.groupai.state(managers.navigation).get_area_from_nav_seg_id(managers.navigation, managers.groupai.state(managers.navigation))
	end

	local grp_objective = {
		no_retry = true,
		element = self,
		type = self._values.mode,
		area = self._area
	}
	slot6 = "clbk_objective_failed"
	grp_objective.fail_clbk = callback(slot3, self, self)

	return grp_objective
end
function ElementSpecialObjectiveGroup:clbk_objective_failed(group)
	if managers.editor and managers.editor._stopping_simulation then
		return 
	end

	slot6 = group

	self.event(slot3, self, "fail")

	return 
end

return 
