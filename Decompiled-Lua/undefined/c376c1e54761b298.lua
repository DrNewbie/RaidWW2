-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NavLinkUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

NavLinkUnitElement = slot0
NavLinkUnitElement.INSTANCE_VAR_NAMES = {
	{
		value = "so_action",
		type = "special_objective_action"
	}
}
NavLinkUnitElement._AI_SO_types = {
	"AI_defend",
	"AI_security",
	"AI_hunt",
	"AI_search",
	"AI_idle",
	"AI_escort",
	"AI_sniper"
}
function NavLinkUnitElement:init(unit)
	slot5 = unit

	NavLinkUnitElement.super.init(slot3, self)

	self._enemies = {}
	self._nav_link_filter = {}
	self._nav_link_filter_check_boxes = {}
	self._hed.ai_group = "none"
	self._hed.align_rotation = true
	self._hed.align_position = true
	self._hed.needs_pos_rsrv = true
	self._hed.is_navigation_link = true
	self._hed.so_action = "none"
	slot5 = self._unit
	self._hed.search_position = self._unit.position(self)
	self._hed.interval = ElementNavLink._DEFAULT_VALUES.interval
	self._hed.attitude = "none"
	self._hed.SO_access = "0"
	self._hed.test_unit = "default"
	self._hed._patrol_group = false
	slot5 = "ai_group"

	table.insert(false, self._save_values)

	slot5 = "align_rotation"

	table.insert(false, self._save_values)

	slot5 = "align_position"

	table.insert(false, self._save_values)

	slot5 = "needs_pos_rsrv"

	table.insert(false, self._save_values)

	slot5 = "so_action"

	table.insert(false, self._save_values)

	slot5 = "search_position"

	table.insert(false, self._save_values)

	slot5 = "interval"

	table.insert(false, self._save_values)

	slot5 = "attitude"

	table.insert(false, self._save_values)

	slot5 = "followup_elements"

	table.insert(false, self._save_values)

	slot5 = "SO_access"

	table.insert(false, self._save_values)

	slot5 = "is_navigation_link"

	table.insert(false, self._save_values)

	return 
end
function NavLinkUnitElement:post_init(...)
	slot3 = self

	NavLinkUnitElement.super.post_init(slot2, ...)

	slot4 = self._hed.SO_access
	self._nav_link_filter = managers.navigation.convert_access_filter_to_table(slot2, managers.navigation)
	slot3 = self._hed.SO_access

	if type_name(slot2) == "number" then
		slot4 = self._hed.SO_access
		self._hed.SO_access = tostring(slot3)
	end

	return 
end
function NavLinkUnitElement:test_element()
	slot4 = "NavLinkUnitElement:test_element: "

	Application.trace(slot2, Application)

	slot3 = managers.navigation

	if not managers.navigation.is_data_ready(slot2) then
		slot7 = "OK,ICON_ERROR"
		slot12 = 0

		EWS.message_box(slot2, EWS, Global.frame_panel, "Can't test spawn unit without ready navigation data (AI-graph)", "Spawn", Vector3(slot9, -1, -1))

		return 
	end

	local spawn_unit_name = nil

	if self._hed.test_unit == "default" then
		slot5 = self._hed.SO_access
		local SO_access_strings = managers.navigation.convert_access_filter_to_table(slot3, managers.navigation)
		slot5 = SO_access_strings

		for slot6, slot7 in ipairs(managers.navigation) do
		end
	else
		spawn_unit_name = self._hed.test_unit
	end

	if not spawn_unit_name then
		slot4 = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light"
		spawn_unit_name = Idstring(slot3)
	end

	slot5 = self._unit.position(slot6)
	slot8 = self._unit
	local enemy = safe_spawn_unit(slot3, spawn_unit_name, self._unit.rotation(self._unit))

	if not enemy then
		return 
	end

	slot6 = enemy

	table.insert(slot4, self._enemies)

	slot5 = managers.groupai
	slot6 = enemy
	slot10 = "non_combatant"

	managers.groupai.state(slot4).set_char_team(slot4, managers.groupai.state(slot4), tweak_data.levels.get_default_team_ID(slot8, tweak_data.levels))

	slot5 = enemy
	slot6 = false

	enemy.movement(slot4).set_root_blend(slot4, enemy.movement(slot4))

	local t = {}
	slot6 = self._unit
	t.id = self._unit.unit_data(enemy.movement(slot4)).unit_id
	slot6 = self._unit
	t.editor_name = self._unit.unit_data(enemy.movement(slot4)).name_id
	slot6 = self
	t.values = self.new_save_values(enemy.movement(slot4))
	t.values.followup_elements = nil
	slot7 = {
		elements = {}
	}
	self._script = MissionScript.new(nil, MissionScript)
	slot8 = t
	self._so_class = ElementNavLink.new(nil, ElementNavLink, self._script)
	self._so_class._values.align_position = nil
	self._so_class._values.align_rotation = nil
	slot7 = enemy

	self._so_class.on_executed(nil, self._so_class)

	slot6 = Application
	self._start_test_t = Application.time(nil)

	return 
end
function NavLinkUnitElement:stop_test_element()

	-- Decompilation error in this vicinity:
	slot3 = self._enemies

	for _, enemy in ipairs(slot2) do
		slot9 = 0

		enemy.set_slot(slot7, enemy)
	end

	self._enemies = {}
	slot1 = print
	slot3 = "Stop test time"
end
function NavLinkUnitElement:draw_links(t, dt, selected_unit, all_units)
	if self._hed._patrol_group then
		return 
	end

	slot10 = selected_unit

	NavLinkUnitElement.super.draw_links(slot6, self, t, dt)

	slot9 = all_units

	self._draw_follow_up(slot6, self, selected_unit)

	return 
end
function NavLinkUnitElement:update_selected(t, dt, selected_unit, all_units)
	local brush = Draw.brush(slot6)
	slot8 = brush
	slot14 = 1

	brush.set_color(Draw, Color(slot10, 0.15, 1, 1))

	slot14 = 0.5
	local pen = Draw.pen(Draw, Color(slot10, 0.15, 0.5, 0.5))
	slot12 = 4

	brush.sphere(Draw, brush, self._hed.search_position, 0)

	slot11 = 0

	pen.sphere(Draw, pen, self._hed.search_position)
	brush.sphere(Draw, brush, self._hed.search_position, 10)

	slot13 = self._unit
	slot14 = 0

	Application.draw_line(Draw, Application, self._hed.search_position, self._unit.position(4), 0, 1)

	slot11 = all_units

	self._draw_follow_up(Draw, self, selected_unit)

	slot10 = t

	self._highlight_if_outside_the_nav_field(Draw, self)

	return 
end
function NavLinkUnitElement:_highlight_if_outside_the_nav_field(t)
	slot4 = managers.navigation

	if managers.navigation.is_data_ready(slot3) then
		local my_pos = self._unit.position(slot3)
		slot7 = true
		local nav_tracker = managers.navigation._quad_field.create_nav_tracker(self._unit, managers.navigation._quad_field, my_pos)
		slot6 = nav_tracker

		if nav_tracker.lost(managers.navigation._quad_field) then
			local t1 = t % 0.5
			local t2 = t % 1
			local alpha = nil

			if 0.5 < t2 then
				alpha = t1
			else
				alpha = 0.5 - t1
			end

			slot11 = alpha
			alpha = math.lerp(slot8, 0.1, 0.5)
			slot12 = 0
			local nav_color = Color(slot8, alpha, 1, 0)
			slot11 = nav_color
			slot14 = 4

			Draw.brush(alpha, Draw).cylinder(alpha, Draw.brush(alpha, Draw), my_pos, my_pos + math.UP * 80, 20)
		end

		slot7 = nav_tracker

		managers.navigation.destroy_nav_tracker(slot5, managers.navigation)
	end

	return 
end
function NavLinkUnitElement:update_unselected(t, dt, selected_unit, all_units)
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

		slot9 = followup_elements

		if not next(slot8) then
			self._hed.followup_elements = nil
		end
	end

	return 
end
function NavLinkUnitElement:_draw_follow_up(selected_unit, all_units)
	if self._hed.followup_elements then
		slot5 = self._hed.followup_elements

		for _, element_id in ipairs(slot4) do
			local unit = all_units[element_id]
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

			if draw then
				slot13 = {
					g = 0.75,
					b = 0,
					r = 0,
					from_unit = self._unit,
					to_unit = unit
				}

				self._draw_link(slot11, self)
			end
		end
	end

	return 
end
function NavLinkUnitElement:update_editing()
	slot3 = self

	self._so_raycast(slot2)

	slot3 = self

	self._spawn_raycast(slot2)

	slot3 = self

	self._raycast(slot2)

	return 
end
function NavLinkUnitElement:_so_raycast()
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
function NavLinkUnitElement:_spawn_raycast()

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
function NavLinkUnitElement:_raycast()
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
function NavLinkUnitElement:_lmb()
	slot3 = self
	local id = self._so_raycast(slot2)

	if id then
		if self._hed.followup_elements then
			slot4 = self._hed.followup_elements

			for i, element_id in ipairs(slot3) do
				if element_id == id then
					slot10 = i

					table.remove(slot8, self._hed.followup_elements)

					slot9 = self._hed.followup_elements

					if not next(slot8) then
						self._hed.followup_elements = nil
					end

					return 
				end
			end
		end

		self._hed.followup_elements = self._hed.followup_elements or {}
		slot5 = id

		table.insert(self._hed.followup_elements or , self._hed.followup_elements)

		return 
	end

	slot5 = self
	self._hed.search_position = self._raycast(slot4) or self._hed.search_position

	return 
end
function NavLinkUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function NavLinkUnitElement:selected()
	slot3 = self

	NavLinkUnitElement.super.selected(slot2)

	return 
end
function NavLinkUnitElement:_apply_preset(params)
	local value = params.ctrlr.get_value(slot3)
	slot9 = "YES_NO,ICON_QUESTION"
	slot14 = 0
	local confirm = EWS.message_box(params.ctrlr, EWS, Global.frame_panel, "Apply preset " .. value .. "?", "Special objective", Vector3(slot11, -1, -1))

	if confirm == "NO" then
		return 
	end

	if value == "clear" then
		slot6 = self

		self._clear_all_nav_link_filters(slot5)
	elseif value == "all" then
		slot6 = self

		self._enable_all_nav_link_filters(slot5)
	else
		slot8 = "yet."

		print(slot5, "Didn't have preset", value)
	end

	return 
end
function NavLinkUnitElement:_enable_all_nav_link_filters()
	slot3 = self._nav_link_filter_check_boxes

	for name, ctrlr in pairs(slot2) do
		slot9 = true

		ctrlr.set_value(slot7, ctrlr)

		slot9 = {
			ctrlr = ctrlr,
			name = name
		}

		self._toggle_nav_link_filter_value(slot7, self)
	end

	return 
end
function NavLinkUnitElement:_clear_all_nav_link_filters()
	slot3 = self._nav_link_filter_check_boxes

	for name, ctrlr in pairs(slot2) do
		slot9 = false

		ctrlr.set_value(slot7, ctrlr)

		slot9 = {
			ctrlr = ctrlr,
			name = name
		}

		self._toggle_nav_link_filter_value(slot7, self)
	end

	return 
end
function NavLinkUnitElement:_toggle_nav_link_filter_value(params)
	slot4 = params.ctrlr
	local value = params.ctrlr.get_value(slot3)

	if value then
		slot5 = self._nav_link_filter

		for i, k in ipairs(slot4) do
			if k == params.name then
				return 
			end
		end

		slot6 = params.name

		table.insert(slot4, self._nav_link_filter)
	else
		slot6 = params.name

		table.delete(slot4, self._nav_link_filter)
	end

	slot7 = self._nav_link_filter
	self._hed.SO_access = managers.navigation.convert_access_filter_to_string(slot5, managers.navigation)

	return 
end
function NavLinkUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = self._hed.SO_access
	self._nav_link_filter = managers.navigation.convert_access_filter_to_table(slot4, managers.navigation)
	slot8 = "Filter"
	local opt_sizer = EWS.StaticBoxSizer(slot4, EWS, panel, "VERTICAL")
	local filter_preset_params = {
		sorted = true,
		name = "Preset:",
		name_proportions = 1,
		ctrlr_proportions = 2,
		tooltip = "Select a preset.",
		panel = panel,
		sizer = opt_sizer,
		options = {
			"clear",
			"all"
		}
	}
	local filter_preset = CoreEWS.combobox(panel)
	slot14 = "_apply_preset"
	slot11 = {
		ctrlr = filter_preset
	}

	filter_preset.connect(filter_preset_params, filter_preset, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot11, self, self))

	slot9 = "HORIZONTAL"
	local filter_sizer = EWS.BoxSizer(filter_preset_params, EWS)
	slot10 = "VERTICAL"
	local opt1_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "VERTICAL"
	local opt2_sizer = EWS.BoxSizer(EWS, EWS)
	local opt3_sizer = EWS.BoxSizer(EWS, EWS)
	local opt = NavigationManager.ACCESS_FLAGS
	slot13 = opt

	for i, o in ipairs("VERTICAL") do
		local check = EWS.CheckBox(slot17, EWS, panel, o)
		slot19 = check
		slot23 = o

		check.set_value(EWS, table.contains("", self._nav_link_filter))

		slot25 = "_toggle_nav_link_filter_value"
		slot22 = {
			ctrlr = check,
			name = o
		}

		check.connect(EWS, check, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self._nav_link_filter, self, self))

		self._nav_link_filter_check_boxes[o] = check
		slot19 = #opt / 3

		if i <= math.round(EWS) then
			slot23 = "EXPAND"

			opt1_sizer.add(slot18, opt1_sizer, check, 0, 0)
		else
			slot19 = #opt / 3

			if i <= math.round(slot18) * 2 then
				slot23 = "EXPAND"

				opt2_sizer.add(slot18, opt2_sizer, check, 0, 0)
			else
				slot23 = "EXPAND"

				opt3_sizer.add(slot18, opt3_sizer, check, 0, 0)
			end
		end
	end

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt1_sizer, 1, 0)

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt2_sizer, 1, 0)

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt3_sizer, 1, 0)

	slot17 = "EXPAND"

	opt_sizer.add(slot12, opt_sizer, filter_sizer, 1, 0)

	slot17 = "EXPAND"

	panel_sizer.add(slot12, panel_sizer, opt_sizer, 0, 0)

	slot22 = ElementSpecialObjective._AI_GROUPS
	slot18 = "Select an ai group."

	self._build_value_combobox(slot12, self, panel, panel_sizer, "ai_group", table.list_add(slot18, clone(slot21)))

	slot16 = CopActionAct._act_redirects.SO
	local options = table.list_add(slot12, clone(panel_sizer))
	slot21 = self._AI_SO_types

	self._build_value_combobox({
		"none"
	}, self, panel, panel_sizer, "so_action", table.list_add({
		"none"
	}, options))

	slot21 = ElementSpecialObjective._ATTITUDES
	slot19 = "Select combat attitude."

	self._build_value_combobox(, self, panel, panel_sizer, "attitude", table.list_add("Select a action that the unit should start with.", {
		"none"
	}))

	slot19 = "Used to specify how often the SO should search for an actor. A negative value means it will check only once."

	self._build_value_number(, self, panel, panel_sizer, "interval", {
		floats = 2,
		min = -1
	})

	slot17 = managers.enemy
	local test_units = table.list_add(, managers.enemy.enemy_units(panel_sizer))
	slot17 = "default"

	table.insert(SpawnCivilianUnitElement._options, test_units, 1)

	slot20 = "Select the unit to be used when testing."

	self._build_value_combobox(SpawnCivilianUnitElement._options, self, panel, panel_sizer, "test_unit", test_units)

	return 
end
function NavLinkUnitElement:add_to_mission_package()
	return 
end

return 
