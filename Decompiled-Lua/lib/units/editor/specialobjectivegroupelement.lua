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
if not SpecialObjectiveGroupElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpecialObjectiveGroupElement = slot0
function SpecialObjectiveGroupElement:init(unit)
	slot5 = unit

	SpecialObjectiveGroupElement.super.init(slot3, self)

	self._hed.base_chance = 1
	self._hed.use_instigator = false
	self._hed.followup_elements = nil
	self._hed.followup_patrol_elements = {}
	self._hed.spawn_instigator_ids = nil
	self._hed.mode = "randomizer"
	slot5 = "base_chance"

	table.insert("randomizer", self._save_values)

	slot5 = "use_instigator"

	table.insert("randomizer", self._save_values)

	slot5 = "followup_elements"

	table.insert("randomizer", self._save_values)

	slot5 = "followup_patrol_elements"

	table.insert("randomizer", self._save_values)

	slot5 = "spawn_instigator_ids"

	table.insert("randomizer", self._save_values)

	slot5 = "mode"

	table.insert("randomizer", self._save_values)

	return 
end
function SpecialObjectiveGroupElement:post_init(...)
	slot3 = self

	SpecialObjectiveGroupElement.super.post_init(slot2, ...)

	return 
end
function SpecialObjectiveGroupElement:draw_links(t, dt, selected_unit, all_units)
	slot8 = all_units

	self._remove_deleted_units(slot6, self)

	if self._hed.mode == "patrol_group" then
		if self._hed.followup_patrol_elements then
			slot7 = self._hed.followup_patrol_elements

			for _, element in ipairs(slot6) do
				local unit = all_units[element.id]
				slot13 = unit

				if alive(slot12) then
					slot13 = unit
					local unit_data = unit.mission_element_data(slot12)
					unit_data._patrol_group = true
					local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

					if draw then
						slot16 = {
							g = 0,
							b = 0.75,
							r = 0,
							from_unit = self._unit,
							to_unit = unit
						}

						self._draw_link(slot14, self)
					end
				end
			end
		end
	else
		slot10 = selected_unit

		SpecialObjectiveUnitElement.super.draw_links(slot6, self, t, dt)

		slot9 = all_units

		self._draw_follow_up(slot6, self, selected_unit)
	end

	return 
end
function SpecialObjectiveGroupElement:update_selected(t, dt, selected_unit, all_units)
	slot9 = all_units

	self._draw_follow_up(slot6, self, selected_unit)

	if self._hed.spawn_instigator_ids then
		slot7 = self._hed.spawn_instigator_ids

		for _, id in ipairs(slot6) do
			local unit = all_units[id]
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

			if draw then
				slot15 = {
					g = 0,
					b = 0.75,
					r = 0,
					from_unit = unit,
					to_unit = self._unit
				}

				self._draw_link(slot13, self)
			end
		end
	end

	return 
end
function SpecialObjectiveGroupElement:update_unselected(t, dt, selected_unit, all_units)
	if self._hed.followup_elements then
		local followup_elements = self._hed.followup_elements
		local i = #followup_elements

		while 0 < i do
			local element_id = followup_elements[i]
			slot10 = all_units[element_id]

			if not alive(slot9) then
				slot11 = i

				table.remove(slot9, followup_elements)
			end

			i = i - 1
		end
	end

	if self._hed.spawn_instigator_ids then
		local spawn_instigator_ids = self._hed.spawn_instigator_ids
		local i = #spawn_instigator_ids

		while 0 < i do
			local id = spawn_instigator_ids[i]
			slot10 = all_units[id]

			if not alive(slot9) then
				slot11 = i

				table.remove(slot9, self._hed.spawn_instigator_ids)
			end

			i = i - 1
		end
	end

	return 
end
function SpecialObjectiveGroupElement:_remove_deleted_units(all_units)
	if self._hed.followup_patrol_elements then
		local followup_elements = self._hed.followup_patrol_elements
		local i = #followup_elements

		while 0 < i do
			local element_id = followup_elements[i].id
			slot7 = all_units[element_id]

			if not alive(slot6) then
				slot8 = i

				table.remove(slot6, followup_elements)
			end

			i = i - 1
		end
	end

	return 
end
function SpecialObjectiveGroupElement:_draw_follow_up(selected_unit, all_units)
	slot7 = all_units

	SpecialObjectiveUnitElement._draw_follow_up(slot4, self, selected_unit)

	return 
end
function SpecialObjectiveGroupElement:update_editing()
	slot3 = self

	self._so_raycast(slot2)

	slot3 = self

	self._spawn_raycast(slot2)

	slot3 = self

	self._raycast(slot2)

	return 
end
function SpecialObjectiveGroupElement:_so_raycast()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true
	end

	return nil
end
function SpecialObjectiveGroupElement:_spawn_raycast()

	-- Decompilation error in this vicinity:
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return 
	end

	local id = nil
	slot7 = ray.unit
	slot7 = ray.unit.name(slot6)
	slot8 = true

	return id
end
function SpecialObjectiveGroupElement:_raycast()
	slot4 = 0
	local from = managers.editor.get_cursor_look_point(slot2, managers.editor)
	slot5 = 100000
	local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
	slot8 = nil
	slot12 = "all"
	local ray = World.raycast(managers.editor, World, from, to, managers.slot.get_mask(slot10, managers.slot))

	if ray and ray.position then
		slot11 = 1

		Application.draw_sphere(slot5, Application, ray.position, 10, 1, 1)

		return ray.position
	end

	return nil
end
function SpecialObjectiveGroupElement:_element_type(element_id)
	slot5 = element_id
	local unit = managers.editor.unit_with_id(slot3, managers.editor)
	slot7 = unit
	slot7 = unit.name(slot6)
	slot6 = ".*/(.*)"

	return string.match(managers.editor, unit.name(slot6).s(slot6))
end
function SpecialObjectiveGroupElement:_clear_followups(element_id)
	slot5 = element_id
	local pso = managers.editor.unit_with_id(slot3, managers.editor)
	slot5 = pso
	local pso_med = pso.mission_element_data(managers.editor)
	pso_med.followup_elements = {}
	pso_med._patrol_group = true

	return 
end
function SpecialObjectiveGroupElement:_relink_patrol_followups()
	local ai_so_group_targets = {}
	slot4 = self._hed.followup_patrol_elements

	for _, patrol_element_data in ipairs(slot3) do
		if patrol_element_data.type == "point_special_objective" then
			slot10 = patrol_element_data.id

			self._clear_followups(slot8, self)
		elseif patrol_element_data.type == "ai_so_group" then
			slot10 = patrol_element_data.id

			table.insert(slot8, ai_so_group_targets)
		end
	end

	slot4 = self._hed.followup_patrol_elements

	for _, patrol_element_data in ipairs(slot3) do
		if patrol_element_data.type == "point_special_objective" then
			slot10 = patrol_element_data.id
			local pso = managers.editor.unit_with_id(slot8, managers.editor)
			local pso_med = pso.mission_element_data(managers.editor)
			slot11 = ai_so_group_targets

			for _, group_id in ipairs(pso) do
				slot17 = group_id

				table.insert(slot15, pso_med.followup_elements)
			end
		end
	end

	return 
end
function SpecialObjectiveGroupElement:_lmb()
	slot3 = self
	local id = self._so_raycast(slot2)

	if id then
		if self._hed.mode == "patrol_group" then
			if self._hed.followup_patrol_elements then
				slot4 = self._hed.followup_patrol_elements

				for i, element in ipairs(slot3) do
					if element.id == id then
						slot10 = i

						table.remove(slot8, self._hed.followup_patrol_elements)

						if element.type == "point_special_objective" then
							slot10 = element.id

							self._clear_followups(slot8, self)
						end

						slot9 = self

						self._relink_patrol_followups(slot8)

						return 
					end
				end
			end
		elseif self._hed.followup_elements then
			slot4 = self._hed.followup_elements

			for i, element_id in ipairs(slot3) do
				if element_id == id then
					slot10 = i

					table.remove(slot8, self._hed.followup_elements)

					return 
				end
			end
		end

		if self._hed.mode == "patrol_group" then
			self._hed.followup_patrol_elements = self._hed.followup_patrol_elements or {}
			slot5 = {
				id = id,
				type = self._element_type(slot7, self)
			}
			slot9 = id

			table.insert(self._hed.followup_patrol_elements or , self._hed.followup_patrol_elements)
		else
			self._hed.followup_elements = self._hed.followup_elements or {}
			slot5 = id

			table.insert(self._hed.followup_elements or , self._hed.followup_elements)
		end

		if self._hed.mode == "patrol_group" then
			slot4 = self

			self._relink_patrol_followups(slot3)
		end

		return 
	end

	slot4 = self
	local id = self._spawn_raycast(slot3)

	if id then
		if self._hed.spawn_instigator_ids then
			slot5 = self._hed.spawn_instigator_ids

			for i, si_id in ipairs(slot4) do
				if si_id == id then
					slot11 = i

					table.remove(slot9, self._hed.spawn_instigator_ids)

					return 
				end
			end
		end

		self._hed.spawn_instigator_ids = self._hed.spawn_instigator_ids or {}
		slot6 = id

		table.insert(self._hed.spawn_instigator_ids or , self._hed.spawn_instigator_ids)

		return 
	end

	return 
end
function SpecialObjectiveGroupElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function SpecialObjectiveGroupElement:selected()
	slot3 = self

	SpecialObjectiveUnitElement.super.selected(slot2)

	return 
end
function SpecialObjectiveGroupElement:add_unit_list_btn()
	slot3 = self._unit
	local script = self._unit.mission_element_data(slot2).script

	local function f(unit)

		-- Decompilation error in this vicinity:
		slot3 = unit
		slot3 = unit
		local id = unit.unit_data(slot2).unit_id

		if self._hed.spawn_instigator_ids then
			slot5 = id

			if table.contains(slot3, self._hed.spawn_instigator_ids) then
				return false
			end
		end

		if self._hed.followup_elements then
			slot5 = id

			if table.contains(slot3, self._hed.followup_elements) then
				return false
			end
		end

		slot6 = unit
		slot6 = unit.name(slot5)
		slot7 = true

		return false
	end

	local dialog = SelectUnitByNameModal.new(slot4, SelectUnitByNameModal, "Add Unit")
	slot8 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do

		-- Decompilation error in this vicinity:
		local id = unit.unit_data(slot10).unit_id
		slot14 = unit
		slot14 = unit.name(slot13)
		slot15 = true
	end

	return 
end
function SpecialObjectiveGroupElement:remove_unit_list_btn()
	local function f(unit)
		return slot1
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do

		-- Decompilation error in this vicinity:
		slot10 = unit
		local id = unit.unit_data(slot9).unit_id

		if self._hed.spawn_instigator_ids then
			slot12 = id

			table.delete(slot10, self._hed.spawn_instigator_ids)
		end

		if self._hed.followup_elements then
			slot12 = id

			table.delete(slot10, self._hed.followup_elements)
		end
	end

	return 
end
function SpecialObjectiveGroupElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local mode_params = {
		name = "Mode:",
		name_proportions = 1,
		tooltip = "Randomizer: assigns SOs to instigators. Forced Spawn: Will spawn a new group of choice. Recurring: Spawns new group. After failure, a new group will be spawned with a delay.",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = panel_sizer,
		options = {
			"randomizer",
			"forced_spawn",
			"recurring_cloaker_spawn",
			"recurring_spawn_1",
			"patrol_group"
		},
		value = self._hed.mode
	}
	local mode = CoreEws.combobox(slot5)
	slot13 = "set_element_data"
	slot10 = {
		value = "mode",
		ctrlr = mode
	}

	mode.connect(mode_params, mode, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	slot10 = ""
	local use_instigator = EWS.CheckBox(mode_params, EWS, panel, "Use instigator")
	slot9 = self._hed.use_instigator

	use_instigator.set_value(EWS, use_instigator)

	slot14 = "set_element_data"
	slot11 = {
		value = "use_instigator",
		ctrlr = use_instigator
	}

	use_instigator.connect(EWS, use_instigator, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, self))

	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, use_instigator, 0, 0)

	local base_chance_params = {
		name_proportions = 1,
		name = "Base chance:",
		ctrlr_proportions = 2,
		tooltip = "Used to specify chance to happen (1==absolutely!)",
		min = 0,
		floats = 2,
		max = 1,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.base_chance
	}
	local base_chance = CoreEws.number_controller(panel_sizer)
	slot16 = "set_element_data"

	base_chance.connect(base_chance_params, base_chance, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot16 = "set_element_data"
	slot13 = {
		value = "base_chance",
		ctrlr = base_chance
	}

	base_chance.connect(base_chance_params, base_chance, "EVT_KILL_FOCUS", callback({
		value = "base_chance",
		ctrlr = base_chance
	}, self, self))

	slot13 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(base_chance_params, EWS, panel, "")
	slot15 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(base_chance_params, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(self))

	slot17 = "add_unit_list_btn"

	self._btn_toolbar.connect(base_chance_params, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot15 = "toolbar\\delete_16x16.png"

	self._btn_toolbar.add_tool(base_chance_params, self._btn_toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(nil))

	slot17 = "remove_unit_list_btn"
	slot14 = nil

	self._btn_toolbar.connect(base_chance_params, self._btn_toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = self._btn_toolbar

	self._btn_toolbar.realize(base_chance_params)

	slot14 = "EXPAND,LEFT"

	panel_sizer.add(base_chance_params, panel_sizer, self._btn_toolbar, 0, 1)

	return 
end
function SpecialObjectiveGroupElement:add_to_mission_package()
	return 
end

return 
