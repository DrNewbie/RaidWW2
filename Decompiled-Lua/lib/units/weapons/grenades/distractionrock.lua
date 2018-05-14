if not DistractionRock then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

DistractionRock = slot0
function DistractionRock:_setup_from_tweak_data()
	local grenade_entry = self.name_id
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._init_timer = self._tweak_data.init_timer or 2.5
	self._mass_look_up_modifier = self._tweak_data.mass_look_up_modifier
	self._range = self._tweak_data.range
	self._pathing_searches = {}
	local sound_event = self._tweak_data.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	return 
end
function DistractionRock:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot17 = "[DistractionRock:clbk_impact]"

	Application.debug(slot15, Application)

	return 
end
function DistractionRock:_on_collision(col_ray)
	slot5 = "[DistractionRock:_on_collision]"

	Application.debug(slot3, Application)

	return 
end
function DistractionRock:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._hand_held then
		return 
	end

	slot16 = self._unit
	local pos = self._unit.position(slot15)
	local range = self._range
	slot19 = "enemies"
	local slotmask = managers.slot.get_mask(slot17, managers.slot)
	slot23 = slotmask
	local units = World.find_units_quick(managers.slot, World, "sphere", pos, self._range)

	if units then
		local closest_cop = nil
		slot21 = units

		for _, cop in ipairs(slot20) do
			slot29 = cop
			local search_id = "DistractionRock._detonate" .. tostring(cop.key(slot28))
			local search_params = {
				finished = false
			}
			slot28 = cop
			slot28 = cop.movement(cop.key)
			search_params.pos_from = cop.movement(cop.key).m_pos(cop.key)
			search_params.pos_to = pos
			search_params.id = search_id
			slot31 = search_id
			search_params.result_clbk = callback(cop.key, self, self, "clbk_pathing_results")
			slot28 = cop
			search_params.access_pos = cop.brain(cop.key)._SO_access
			search_params.cop = cop
			self._pathing_searches[search_id] = search_params
			slot29 = search_params

			managers.navigation.search_pos_to_pos(cop.key, managers.navigation)
		end
	end

	return 
end
function DistractionRock:clbk_pathing_results(search_id, path)
	local search = self._pathing_searches[search_id]

	if path and search then
		search.finished = true
		search.total_length = 0
		local last_leg = nil
		slot7 = path

		for _, leg in ipairs(slot6) do
			if leg.x then
				if last_leg then
					local length = leg - last_leg
					slot14 = length
					search.total_length = search.total_length + length.length(slot13)
				else
					last_leg = leg
				end
			else
				search.invalid = true
			end
		end

		if not search.invalid and search.total_length < self._range and not self._found_cop then
			slot7 = self

			self._abort_all_unfinished_pathing(slot6)

			slot9 = search.pos_to
			self._found_cop = CopLogicBase.register_search_SO(slot6, search.cop, nil)
		end
	end

	return 
end
function DistractionRock:_abort_all_unfinished_pathing()
	slot3 = self._pathing_searches

	for search_id, search in pairs(slot2) do
		if not search.finished then
			slot9 = search_id

			managers.navigation.cancel_pathing_search(slot7, managers.navigation)
		end
	end

	return 
end
function DistractionRock:_detonate_on_client()
	return 
end
function DistractionRock:bullet_hit()
	slot4 = "[DistractionRock:bullet_hit]"

	Application.debug(slot2, Application)

	return 
end
function DistractionRock:set_attention_state(state)
	if state then
		if not self._attention_setting then
			slot6 = true
			self._attention_handler = AIAttentionObject.new(slot3, AIAttentionObject, self._unit)

			if self._attention_obj_name then
				slot5 = self._attention_obj_name

				self._attention_handler.set_detection_object_name(slot3, self._attention_handler)
			end

			local descriptor = "distraction_ntl"
			slot7 = descriptor
			local attention_setting = PlayerMovement._create_attention_setting_from_descriptor(slot4, self, tweak_data.attention.settings[descriptor])
			slot7 = attention_setting

			self._attention_handler.set_attention(self, self._attention_handler)
		end
	elseif self._attention_handler then
		slot5 = nil

		self._attention_handler.set_attention(slot3, self._attention_handler)

		self._attention_handler = nil
	end

	return 
end
function DistractionRock:update_attention_settings(descriptor)
	local tweak_data = tweak_data.attention.settings[descriptor]

	if tweak_data and self._attention_handler then
		slot7 = descriptor
		local attention_setting = PlayerMovement._create_attention_setting_from_descriptor(slot4, self, tweak_data)
		slot7 = attention_setting

		self._attention_handler.set_attention(self, self._attention_handler)
	end

	return 
end

return 
