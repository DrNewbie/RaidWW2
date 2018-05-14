-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAIAttention then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAIAttention = slot0
ElementAIAttention.init = function (self, ...)
	slot3 = self

	ElementAIAttention.super.init(slot2, ...)

	return 
end
ElementAIAttention.on_executed = function (self, instigator)

	-- Decompilation error in this vicinity:
	if self._values.use_instigator then
		slot6 = nil

		self._apply_attention_on_unit(slot3, self, instigator)
	elseif self._values.instigator_ids then
		slot4 = self
		local units = self._select_units_from_spawners(slot3)

		if units then
			slot5 = units

			for _, unit in ipairs(slot4) do
				slot12 = nil

				self._apply_attention_on_unit(slot9, self, unit)
			end
		end
	elseif self._values.att_obj_u_id then
		slot5 = self._values.att_obj_u_id
		local unit = self._fetch_unit_by_unit_id(slot3, self)

		if unit then
			local handler = unit.attention(slot4)
			slot8 = handler

			self._chk_link_att_object(unit, self, unit)

			slot8 = handler

			self._apply_attention_on_unit(unit, self, unit)
		end
	end

	slot5 = instigator

	ElementSpecialObjective.super.on_executed(slot3, self)

	return 
end
ElementAIAttention.operation_remove = function (self)
	return 
end
ElementAIAttention._select_units_from_spawners = function (self)
	local candidates = {}
	slot4 = self._values.instigator_ids

	for _, element_id in ipairs(slot3) do
		slot10 = element_id
		local spawn_element = self.get_mission_element(slot8, self)
		slot12 = spawn_element

		for _, unit in ipairs(spawn_element.units(slot11)) do
			slot15 = unit

			if alive(slot14) then
				slot19 = unit
				slot19 = unit.brain(slot18)
				slot18 = 0

				if managers.navigation.check_access(slot14, managers.navigation, self._values.SO_access, unit.brain(slot18).SO_access(slot18)) then
					slot15 = unit
					slot15 = unit.brain(slot14)

					if unit.brain(slot14).is_available_for_assignment(slot14) then
						slot16 = unit

						table.insert(slot14, candidates)
					end
				end
			end
		end
	end

	local wanted_nr_units = nil

	if self._values.trigger_times <= 0 then
		wanted_nr_units = 1
	else
		wanted_nr_units = self._values.trigger_times
	end

	slot6 = #candidates
	wanted_nr_units = math.min(slot4, wanted_nr_units)
	local chosen_units = {}

	for i = 1, wanted_nr_units, 1 do
		slot13 = #candidates
		local chosen_unit = table.remove(slot9, math.random(slot12))
		slot12 = chosen_unit

		table.insert(candidates, chosen_units)
	end

	return chosen_units
end
ElementAIAttention._get_attention_handler_from_unit = function (self, unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit
	end

	return slot2
end
ElementAIAttention._create_attention_settings = function (self)
	local preset = self._values.preset

	if preset == "none" then
		return 
	end

	local setting_desc = tweak_data.attention.settings[preset]

	if setting_desc then
		slot7 = preset
		local settings = PlayerMovement._create_attention_setting_from_descriptor(slot4, self, setting_desc)

		return settings
	else
		slot8 = self._id

		debug_pause(slot4, "[ElementAIAttention:_get_attention_settings] inexistent preset", preset, "element ID")
	end

	return 
end
ElementAIAttention._create_override_attention_settings = function (self, unit)
	local preset = self._values.override

	if preset == "none" then
		return 
	end

	local setting_desc = tweak_data.attention.settings[preset]

	if setting_desc then

		-- Decompilation error in this vicinity:
		local clbk_receiver_class = nil
		slot7 = unit

		if not clbk_receiver_class then
			slot9 = unit

			debug_pause_unit(slot6, unit, "[ElementAIAttention:_create_override_attention_settings] cannot override attention for:")

			return 
		end

		slot9 = self._values.preset
		local settings = PlayerMovement._create_attention_setting_from_descriptor(slot6, clbk_receiver_class, setting_desc)

		return settings
	else
		slot9 = self._id

		debug_pause(slot5, "[ElementAIAttention:_get_attention_settings] inexistent preset", preset, "element ID")
	end

	return 
end
ElementAIAttention._apply_attention_on_unit = function (self, unit, handler)
	if not handler then
		slot6 = unit
		local handler = self._get_attention_handler_from_unit(slot4, self)
	end

	if handler then
		if self._values.operation == "add" then
			slot6 = self
			local settings = self._create_attention_settings(slot5)

			if settings then
				slot8 = settings

				handler.add_attention(slot6, handler)
			else
				slot10 = self._id

				debug_pause(slot6, "[ElementAIAttention:_apply_attention_on_unit] inexistent preset", self._values.preset, "element ID")
			end
		elseif self._values.operation == "set" then
			if self._values.preset == "none" then
				slot7 = nil

				handler.set_attention(slot5, handler)
			else
				slot6 = self
				local settings = self._create_attention_settings(slot5)

				if settings then
					slot8 = settings

					handler.set_attention(slot6, handler)
				else
					slot10 = self._id

					debug_pause(slot6, "[ElementAIAttention:_apply_attention_on_unit] inexistent preset", self._values.preset, "element ID")
				end
			end
		elseif self._values.operation == "override" then
			if self._values.preset == "none" then
				slot8 = self._values.override

				debug_pause(slot5, "[ElementAIAttention:_apply_attention_on_unit] override operation missing preset param", self._values.preset)
			else
				if self._values.override ~= "none" then
					slot7 = unit
					slot4 = self._create_override_attention_settings(slot5, self)
				else
					slot4 = false

					if false then
						local settings = true
					end
				end

				slot9 = settings

				handler.override_attention(slot6, handler, self._values.preset)
			end
		end
	else
		slot6 = unit

		if alive(slot5) then
			slot9 = self._id

			debug_pause(slot5, "[ElementAIAttention:_apply_attention_on_unit] unit missing attention handler", instigator, "element ID")
		end
	end

	return 
end
ElementAIAttention._chk_link_att_object = function (self, unit, handler)
	if not self._values.parent_u_id then
		return 
	end

	slot6 = self._values.parent_u_id
	local parent_unit = self._fetch_unit_by_unit_id(slot4, self)

	if not parent_unit then
		slot7 = self._id

		debug_pause(slot5, "[ElementAIAttention:_chk_link_att_object] could not find parent unit. element ID")

		return 
	end

	slot9 = self._values.local_pos

	handler.link(slot5, handler, parent_unit, self._values.parent_obj_name)

	return 
end
ElementAIAttention._fetch_unit_by_unit_id = function (self, unit_id)
	local unit = nil

	if false then
		slot5 = managers.editor
		slot8 = unit_id
		unit = managers.editor.unit_with_id(slot4, tonumber(slot7))
	else
		slot5 = self._mission_script
		slot6 = tonumber(slot7)
		slot11 = "_load_unit"
		unit = self._mission_script.worlddefinition(slot4).get_unit_on_load(slot4, self._mission_script.worlddefinition(slot4), callback(unit_id, self, self))
	end

	return unit
end
ElementAIAttention._load_unit = function (unit)
	return 
end

return 
