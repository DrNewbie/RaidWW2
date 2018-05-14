-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
AIAttentionObject = AIAttentionObject or class()
AIAttentionObject.REACT_IDLE = 1
AIAttentionObject.REACT_CURIOUS = 2
AIAttentionObject.REACT_CHECK = 3
AIAttentionObject.REACT_SUSPICIOUS = 4
AIAttentionObject.REACT_SURPRISED = 5
AIAttentionObject.REACT_SCARED = 6
AIAttentionObject.REACT_AIM = 7
AIAttentionObject.REACT_ARREST = 8
AIAttentionObject.REACT_DISARM = 9
AIAttentionObject.REACT_SHOOT = 10
AIAttentionObject.REACT_MELEE = 11
AIAttentionObject.REACT_COMBAT = 12
AIAttentionObject.REACT_SPECIAL_ATTACK = 13
AIAttentionObject.REACT_MIN = AIAttentionObject.REACT_IDLE
AIAttentionObject.REACT_MAX = AIAttentionObject.REACT_SPECIAL_ATTACK
function AIAttentionObject:init(unit, is_not_extension)
	self._unit = unit
	self._attention_data = nil
	slot5 = ListenerHolder
	self._listener_holder = ListenerHolder.new(slot4)

	self.setup_attention_positions(slot4, self, nil)

	self._is_extension = not is_not_extension

	if self._is_extension then
		slot6 = true

		self.set_update_enabled(slot4, self)

		slot5 = Network

		if Network.is_client(slot4) then
			slot5 = unit

			if unit.unit_data(slot4).only_visible_in_editor then
				slot6 = false

				unit.set_visible(slot4, unit)
			end
		end

		if self._initial_settings then
			slot6 = " "
			local preset_list = string.split(slot4, self._initial_settings)
			slot6 = preset_list

			for _, preset_name in ipairs(self._initial_settings) do
				local attention_desc = tweak_data.attention.settings[preset_name]
				slot14 = preset_name
				local att_setting = PlayerMovement._create_attention_setting_from_descriptor(slot11, self, attention_desc)
				slot14 = att_setting

				self.add_attention(self, self)
			end
		end
	end

	return 
end
function AIAttentionObject:update(unit, t, dt)
	slot7 = self._observer_info.m_pos

	self._attention_obj.m_position(slot5, self._attention_obj)

	return 
end
function AIAttentionObject:set_update_enabled(state)
	slot7 = "attention"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(state))

	return 
end
function AIAttentionObject:set_detection_object_name(obj_name)
	self._attention_obj_name = obj_name
	slot4 = self

	self.setup_attention_positions(slot3)

	return 
end
function AIAttentionObject:setup_attention_positions()
	if self._attention_obj_name then
		slot3 = self._unit
		slot6 = self._attention_obj_name
		self._attention_obj = self._unit.get_object(slot2, Idstring(slot5))
	else
		slot3 = self._unit
		self._attention_obj = self._unit.orientation_object(slot2)
	end

	slot4 = self._attention_obj
	self._observer_info = {
		m_pos = self._attention_obj.position(slot3)
	}

	return 
end
function AIAttentionObject:attention_data()
	return self._attention_data
end
function AIAttentionObject:unit()
	return self._unit
end
function AIAttentionObject:add_attention(settings)
	local needs_register = nil

	if not self._attention_data then
		self._attention_data = {}
		needs_register = true
	end

	self._attention_data[settings.id] = settings

	if needs_register then
		slot5 = self

		self._register(slot4)
	end

	slot5 = self

	self._call_listeners(slot4)

	return 
end
function AIAttentionObject:remove_attention(id)
	if not self._attention_data then
		return 
	end

	if self._attention_data[id] then
		self._attention_data[id] = nil
		slot4 = self._attention_data

		if not next(nil) then
			slot4 = managers.groupai
			slot4 = managers.groupai.state(slot3)
			slot7 = self._parent_unit or self._unit

			managers.groupai.state(slot3).unregister_AI_attention_object(slot3, self._parent_unit or self._unit.key(slot6))

			self._attention_data = nil
		end

		slot4 = self

		self._call_listeners(slot3)
	end

	return 
end
function AIAttentionObject:set_attention(settings, id)
	if self._attention_data then
		if settings then
			self._attention_data = {
				[id or settings.id] = settings
			}
		else
			self._attention_data = nil
			slot5 = managers.groupai
			slot5 = managers.groupai.state(slot4)
			slot8 = self._parent_unit or self._unit

			managers.groupai.state(slot4).unregister_AI_attention_object(slot4, self._parent_unit or self._unit.key(slot7))
		end

		slot5 = self

		self._call_listeners(slot4)
	elseif settings then
		self._attention_data = {}
		self._attention_data = {
			[id or settings.id] = settings
		}
		slot5 = self

		self._register(id or settings.id)

		slot5 = self

		self._call_listeners(id or settings.id)
	end

	return 
end
function AIAttentionObject:override_attention(original_preset_name, override_preset)
	if override_preset then
		self._overrides = self._overrides or {}
		local call_listeners = (self._attention_data and self._attention_data[original_preset_name]) or self._overrides[original_preset_name]
		self._overrides[original_preset_name] = override_preset

		if call_listeners then
			slot6 = self

			self._call_listeners(slot5)
		end
	elseif self._overrides and self._overrides[original_preset_name] then
		self._overrides[original_preset_name] = nil
		slot5 = self._overrides

		if not next(nil) then
			self._overrides = nil
		end

		slot5 = self

		self._call_listeners(slot4)
	end

	return 
end
function AIAttentionObject:get_attention(filter, min, max, team)
	if not self._attention_data then
		return 
	end

	min = min or AIAttentionObject.REACT_MIN
	max = max or AIAttentionObject.REACT_MAX
	local nav_manager = managers.navigation
	local access_f = nav_manager.check_access
	local settings_match, relation = nil

	if team and self._team then
		if team.foes[self._team.id] then
			relation = "foe"
		else
			relation = "friend"
		end
	end

	slot11 = self._attention_data

	for id, settings in pairs(slot10) do
		if (not self._overrides or not self._overrides[id]) and min <= settings.reaction and settings.reaction <= max and (not settings_match or settings_match.reaction < settings.reaction) and (not relation or not settings.relation or relation == settings.relation) then
			slot19 = 0

			if access_f(slot15, nav_manager, settings.filter, filter) then
				settings_match = settings
			end
		end
	end

	if self._overrides then
		slot11 = self._overrides

		for id, settings in pairs(slot10) do
			if min <= settings.reaction and settings.reaction <= max and (not settings_match or settings_match.reaction < settings.reaction) and (not relation or not settings.relation or relation == settings.relation) then
				slot19 = 0

				if access_f(slot15, nav_manager, settings.filter, filter) then
					settings_match = settings
				end
			end
		end
	end

	return settings_match
end
function AIAttentionObject:verify_attention(test_settings, min, max, team)
	if not self._attention_data then
		return 
	end

	slot11 = team
	local new_settings = self.get_attention(slot6, self, filter, min, max)

	return new_settings == test_settings
end
function AIAttentionObject:get_attention_m_pos(settings)
	return self._observer_info.m_pos
end
function AIAttentionObject:get_detection_m_pos()
	return self._observer_info.m_pos
end
function AIAttentionObject:get_ground_m_pos()
	return self._observer_info.m_pos
end
function AIAttentionObject:add_listener(key, clbk)
	slot7 = clbk

	self._listener_holder.add(slot4, self._listener_holder, key)

	return 
end
function AIAttentionObject:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
function AIAttentionObject:_call_listeners()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = self._parent_unit or self._unit
	local u_key = self._parent_unit or self._unit.key(slot2)
	slot4 = managers.groupai
	slot5 = u_key

	managers.groupai.state(self._parent_unit or self._unit).on_AI_attention_changed(self._parent_unit or self._unit, managers.groupai.state(self._parent_unit or self._unit))

	slot5 = u_key

	self._listener_holder.call(slot1, self._listener_holder)

	return 

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-4, warpins: 1 ---
	slot1 = self._unit
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-22, warpins: 2 ---
	--- END OF BLOCK #2 ---



end
function AIAttentionObject:_register()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	slot1 = managers.groupai.state(slot2).register_AI_attention_object

	if not self._parent_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot4 = self._unit
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-15, warpins: 2 ---
	slot6 = nil

	slot1(slot2, slot3, slot4, self)

	return 
	--- END OF BLOCK #1 ---



end
function AIAttentionObject:link(parent_unit, obj_name, local_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot6 = self._unit

	self._unit.unlink(slot5)

	if parent_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-61, warpins: 1 ---
		self._parent_unit = parent_unit
		self._parent_obj_name = obj_name
		self._local_pos = local_pos
		slot6 = parent_unit
		self._parent_unit_key = parent_unit.key(slot5)
		slot7 = 0
		slot7 = false

		self._unit.body(slot5, self._unit).set_enabled(slot5, self._unit.body(slot5, self._unit))

		slot6 = self._unit

		self._unit.set_moving(slot5)

		slot9 = obj_name
		local parent_obj = parent_unit.get_object(slot5, Idstring(slot8))
		local parent_pos = parent_obj.position(parent_unit)
		local parent_rot = parent_obj.rotation(parent_obj)
		slot10 = parent_rot
		local att_obj_w_pos = local_pos.rotate_with(parent_obj, local_pos) + parent_pos
		slot13 = obj_name

		parent_unit.link(local_pos, parent_unit, Idstring(self._unit))

		slot11 = att_obj_w_pos

		self._unit.set_position(local_pos, self._unit)

		slot10 = Network

		if Network.is_server(local_pos) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 1 ---
			slot10 = self._parent_unit

			if self._parent_unit.id(slot9) == -1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-72, warpins: 1 ---
				slot12 = self._parent_unit

				debug_pause_unit(slot9, self._parent_unit, "[AIAttentionObject:set_parent_unit] attention object parent is not network synched")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-85, warpins: 2 ---
			slot10 = managers.network
			slot15 = local_pos

			managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "link_attention_no_rot", self._parent_unit, self._unit, obj_name)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 86-90, warpins: 2 ---
		slot11 = true

		self.set_update_enabled(slot9, self)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-104, warpins: 1 ---
		self._parent_unit = nil
		self._parent_obj_name = nil
		self._local_pos = nil
		self._parent_unit_key = nil
		slot6 = Network

		if Network.is_server(slot5) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-114, warpins: 1 ---
			slot6 = managers.network
			slot8 = self._unit

			managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "unlink_attention")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 115-118, warpins: 2 ---
		slot7 = false

		self.set_update_enabled(slot5, self)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 119-119, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function AIAttentionObject:set_team(team)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._team == team then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		if team then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 2 ---
		local call_listeners = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-17, warpins: 3 ---
	self._team = team

	if self._attention_data then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		slot5 = self._attention_data

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-24, warpins: 0 ---
		for id, setting in pairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-22, warpins: 1 ---
			setting.team = team
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-24, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-27, warpins: 2 ---
	if self._overrides then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-31, warpins: 1 ---
		slot5 = self._overrides

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-34, warpins: 0 ---
		for id, setting in pairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-32, warpins: 1 ---
			setting.team = team
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 33-34, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-38, warpins: 2 ---
	slot5 = self

	self._call_listeners(slot4)

	return 
	--- END OF BLOCK #3 ---



end
function AIAttentionObject:save(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = self._parent_unit

	if alive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-15, warpins: 1 ---
		slot4 = self._parent_unit
		data.parent_u_id = self._parent_unit.unit_data(slot3).unit_id
		data.parent_obj_name = self._parent_obj_name
		data.local_pos = self._local_pos
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function AIAttentionObject:load(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not data or not data.parent_u_id then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-8, warpins: 2 ---
	local parent_unit = nil

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-17, warpins: 0 ---
		slot6 = data.parent_u_id
		parent_unit = managers.editor.unit_with_id(slot4, managers.editor)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-45, warpins: 2 ---
		slot7 = data.parent_u_id
		local original_unit_id = worlddefinition.get_original_unit_id(slot5, worlddefinition)
		slot8 = original_unit_id
		slot13 = "clbk_load_parent_unit"
		parent_unit = worlddefinition.get_unit_on_load(worlddefinition, worlddefinition, callback(slot10, self, self))
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-47, warpins: 2 ---
	if parent_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-54, warpins: 1 ---
		slot8 = data.local_pos

		self.link(slot4, self, parent_unit, data.parent_obj_name)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-60, warpins: 1 ---
		slot5 = Application

		if not Application.editor(slot4) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-62, warpins: 1 ---
			self._load_data = data
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-67, warpins: 1 ---
			slot7 = self._unit

			debug_pause_unit(slot4, self._unit, "[AIAttentionObject:load] failed to link")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 68-68, warpins: 3 ---
	return 
	--- END OF BLOCK #3 ---



end
function AIAttentionObject:clbk_load_parent_unit(parent_unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if parent_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-10, warpins: 1 ---
		slot7 = self._load_data.local_pos

		self.link(slot3, self, parent_unit, self._load_data.parent_obj_name)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	self._load_data = nil

	return 
	--- END OF BLOCK #1 ---



end
function AIAttentionObject:destroy()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = nil

	self.set_attention(slot2, self)

	return 
	--- END OF BLOCK #0 ---



end

return 
