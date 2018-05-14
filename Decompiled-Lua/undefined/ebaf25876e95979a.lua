-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not EscortUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EscortUnitElement = slot0
EscortUnitElement.init = function (self, unit)
	slot5 = unit

	EscortUnitElement.super.init(slot3, self)

	self._test_units = {}
	self._hed.break_so = "none"
	self._hed.break_point = false
	self._hed.next_points = {}
	self._hed.spawn_elements = {}
	self._hed.usage_times = 0
	self._hed.test_unit = "units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test"
	slot5 = "break_so"

	table.insert("units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test", self._save_values)

	slot5 = "break_point"

	table.insert("units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test", self._save_values)

	slot5 = "next_points"

	table.insert("units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test", self._save_values)

	slot5 = "spawn_elements"

	table.insert("units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test", self._save_values)

	slot5 = "usage_times"

	table.insert("units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test", self._save_values)

	return 
end
EscortUnitElement.post_init = function (self)
	slot4 = self._hed.break_point

	self.set_break_point_icon_color(slot2, self)

	slot3 = self

	return EscortUnitElement.super.post_init(slot2)
end
EscortUnitElement._raycast_get_type = function (self)
	local unit_type, unit, id = nil
	slot7 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot5, managers.editor)

	if ray and ray.unit then
		slot9 = ray.unit
		slot9 = ray.unit.name(slot8)
		slot10 = true

		if string.find(slot6, ray.unit.name(slot8).s(slot8), "point_escort", 1) then
			unit_type = "next_points"
		else
			slot9 = ray.unit
			slot9 = ray.unit.name(slot8)
			slot10 = true
		end

		slot7 = ray.unit

		return ray.unit.unit_data(slot6).unit_id, ray.unit, unit_type
	end

	return 
end
EscortUnitElement._lmb = function (self)
	slot3 = self
	local id, unit, unit_type = self._raycast_get_type(slot2)

	if id then
		slot6 = unit

		if alive(slot5) then
			slot7 = id
			local index = table.get_vector_index(slot5, self._hed[unit_type])

			if index then
				slot8 = index

				table.remove(slot6, self._hed[unit_type])
			else
				slot8 = id

				table.insert(slot6, self._hed[unit_type])
			end

			slot8 = self._hed.break_point or #self._hed.next_points == 0

			self._so_combobox.set_enabled(slot6, self._so_combobox)
		end
	end

	return 
end
EscortUnitElement.test_element = function (self)
	slot3 = managers.navigation

	if not managers.navigation.is_data_ready(slot2) then
		slot7 = "OK,ICON_ERROR"
		slot12 = 0

		EWS.message_box(slot2, EWS, Global.frame_panel, "Can't test spawn unit without ready navigation data (AI-graph)", "Spawn", Vector3(slot9, -1, -1))

		return 
	end

	if not self._hed.test_unit then
		slot3 = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light"
		local spawn_unit_name = Idstring(slot2)
	end

	slot5 = self._unit.position(slot6)
	slot8 = self._unit
	local test_unit = safe_spawn_unit(slot3, spawn_unit_name, self._unit.rotation(self._unit))

	if not test_unit then
		return 
	end

	slot6 = test_unit

	table.insert(slot4, self._test_units)

	slot5 = managers.groupai
	slot6 = test_unit
	slot10 = "non_combatant"

	managers.groupai.state(slot4).set_char_team(slot4, managers.groupai.state(slot4), tweak_data.levels.get_default_team_ID(slot8, tweak_data.levels))

	slot5 = test_unit
	slot6 = false

	test_unit.movement(slot4).set_root_blend(slot4, test_unit.movement(slot4))

	test_unit.anim_data(slot4).panic = true
	local action = {
		clamp_to_graph = true,
		body_part = 1,
		type = "act",
		variant = self._hed.break_so
	}
	slot6 = test_unit
	slot7 = action

	test_unit.movement(test_unit).action_request(test_unit, test_unit.movement(test_unit))

	return 
end
EscortUnitElement.stop_test_element = function (self)
	slot3 = self._test_units

	for _, test_unit in ipairs(slot2) do
		slot9 = 0

		test_unit.set_slot(slot7, test_unit)
	end

	self._test_units = {}

	return 
end
EscortUnitElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
EscortUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Break Point"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "break_point", "The escort will interrupt their walk at this point")

	slot11 = "Usage Times"

	self._build_value_number(slot4, self, panel, panel_sizer, "usage_times", {}, "Sets how many times this point can be used in a path (0 for infinite)")

	local so_options = table.list_add(slot4, clone(panel_sizer))
	slot11 = "Select an SO that will play at this point"
	self._so_combobox = self._build_value_combobox({
		"none",
		"panic"
	}, self, panel, panel_sizer, "break_so", so_options)
	slot7 = self._hed.break_point or #self._hed.next_points == 0

	self._so_combobox.set_enabled(slot5, self._so_combobox)

	slot9 = managers.enemy
	local test_units = table.list_add(slot5, managers.enemy.enemy_units(CopActionAct._act_redirects.SO))
	slot12 = "Select a unit to use when testing the SO"

	self._build_value_combobox(SpawnCivilianUnitElement._options, self, panel, panel_sizer, "test_unit", test_units)

	return 
end
EscortUnitElement.update_editing = function (self)
	return 
end
EscortUnitElement.draw_links = function (self, t, dt, selected_unit, all_units)
	slot11 = all_units

	EscortUnitElement.super.draw_links(slot6, self, t, dt, selected_unit)

	local path = {}
	local next_points_list = {}
	local visited = {}
	slot11 = {
		from = self._ud.unit_id,
		to = self._hed.next_points
	}

	table.insert(dt, next_points_list)

	local draw = self._unit == selected_unit

	while 0 < #next_points_list do
		slot12 = 1
		local data = table.remove(slot10, next_points_list)
		slot12 = data.to

		for _, next_point in ipairs(next_points_list) do
			local unit = all_units[next_point]
			slot18 = unit

			if alive(slot17) then
				if path[data.from] then
					slot19 = unit

					table.insert(slot17, path[data.from])
				else
					path[data.from] = {
						unit
					}
				end

				draw = draw or unit == selected_unit

				if not visited[next_point] then
					slot19 = {
						from = next_point,
						to = unit.mission_element(slot21)._hed.next_points
					}
					slot22 = unit

					table.insert(slot17, next_points_list)
				end

				visited[next_point] = true
			end
		end
	end

	if draw then
		slot11 = path

		for point, units in pairs(slot10) do
			local from_unit = all_units[point]
			slot17 = units

			for _, unit in ipairs(slot16) do
				slot23 = {
					g = 0.85,
					b = 0,
					r = 0,
					from_unit = from_unit,
					to_unit = unit
				}

				self._draw_link(slot21, self)
			end
		end
	end

	slot11 = self._hed.spawn_elements

	for _, spawn_id in ipairs(slot10) do
		local unit = all_units[spawn_id]

		if unit == selected_unit or self._unit == selected_unit then
			slot18 = {
				g = 0.85,
				b = 0.85,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot16, self)
		end
	end

	return 
end
EscortUnitElement.set_break_point_icon_color = function (self, is_break_point)
	slot4 = self._icon_script.icon_bitmap
	slot7 = (is_break_point and "fffc4c4c") or self._iconcolor

	self._icon_script.icon_bitmap.set_color(slot3, Color(slot6))

	return 
end
EscortUnitElement.set_element_data = function (self, data)
	if data.value == "break_point" then
		local is_break_point = data.ctrlr.get_value(slot3)
		slot6 = is_break_point

		self._so_combobox.set_enabled(data.ctrlr, self._so_combobox)

		slot6 = is_break_point

		self.set_break_point_icon_color(data.ctrlr, self)
	end

	slot5 = data

	return EscortUnitElement.super.set_element_data(slot3, self)
end
EscortUnitElement._base_check_removed_units = function (self, all_units)
	EscortUnitElement.super._base_check_removed_units(slot3, self)

	slot6 = self._hed.next_points

	for i, next_point in ipairs(clone(all_units)) do
		slot9 = all_units[next_point]

		if not alive(slot8) then
			slot10 = i

			table.remove(slot8, self._hed.next_points)
		end
	end

	return 
end

return 
