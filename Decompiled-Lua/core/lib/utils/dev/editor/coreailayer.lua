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
slot3 = "CoreAiLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot2 = "core/lib/units/data/CoreAiEditorData"

require(slot1)

if not AiLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

AiLayer = slot0
function AiLayer:init(owner)
	slot8 = "ai_layer"

	AiLayer.super.init(slot3, self, owner, "ai", {
		"ai"
	})

	self._brush = Draw.brush(slot3)
	self._graph_types = {
		surface = "surface"
	}
	self._unit_graph_types = {}
	slot5 = "core/units/nav_surface/nav_surface"
	slot3 = Idstring(Draw)
	self._unit_graph_types.surface = slot3
	slot4 = "core/units/nav_surface/nav_surface"
	self._nav_surface_unit = Idstring(slot3)
	slot4 = "core/units/patrol_point/patrol_point"
	self._patrol_point_unit = Idstring(slot3)
	slot4 = self

	self._init_ai_settings(slot3)

	slot4 = self

	self._init_mop_settings(slot3)

	slot4 = Draw
	self._patrol_path_brush = Draw.brush(slot3)
	self._only_draw_selected_patrol_path = false
	self._default_values = {
		all_visible = true
	}

	return 
end
function AiLayer:load(world_holder, offset)
	slot6 = "[AiLayer:load]"

	Application.debug(slot4, Application)

	slot7 = offset

	AiLayer.super.load(slot4, self, world_holder)

	slot8 = offset
	local ai_settings = world_holder.create_world(slot4, world_holder, "world", "ai_settings")
	slot4 = pairs
	slot6 = ai_settings or {}

	for name, value in slot4(slot5) do
		self._ai_settings[name] = value
	end

	slot7 = self._created_units

	managers.ai_data.load_units(slot5, managers.ai_data)

	slot6 = self

	self._update_patrol_paths_list(slot5)

	slot6 = self

	self._update_motion_paths_list(slot5)

	slot6 = self

	self._update_settings(slot5)

	return 
end
function AiLayer:save(save_params)
	slot5 = save_params

	AiLayer.super.save(slot3, self)

	local file_name = "nav_manager_data"
	local path = save_params.dir .. "\\" .. file_name .. ".nav_data"
	local file = managers.editor._open_file(file_name, managers.editor, path, nil)
	slot7 = file
	slot10 = managers.navigation

	file.puts(managers.editor, managers.navigation.get_save_data(true))

	slot8 = file

	SystemFS.close(managers.editor, SystemFS)

	local t = {
		single_data_block = true,
		entry = "ai_nav_graphs",
		data = {
			file = file_name
		}
	}

	managers.editor.add_save_data(SystemFS, managers.editor)

	local t = {
		single_data_block = true,
		entry = "ai_settings"
	}
	slot10 = managers.ai_data
	slot8 = managers.ai_data.save_data(t)
	t.data = {
		ai_settings = self._ai_settings,
		ai_data = slot8
	}
	slot10 = t

	managers.editor.add_save_data(slot8, managers.editor)

	slot9 = managers.motion_path

	if managers.motion_path.paths_exist(slot8) then
		local mop_filename = "mop_manager_data"
		local mop_path = save_params.dir .. "\\" .. mop_filename .. ".mop_data"
		local mop_file = managers.editor._open_file(mop_filename, managers.editor, mop_path, nil)
		slot12 = mop_file
		slot15 = managers.motion_path

		mop_file.puts(managers.editor, managers.motion_path.get_save_data(true))

		slot13 = mop_file

		SystemFS.close(managers.editor, SystemFS)

		local t = {
			single_data_block = true,
			entry = "ai_mop_graphs",
			data = {
				file = mop_filename
			}
		}
		slot14 = t

		managers.editor.add_save_data(SystemFS, managers.editor)
	end

	return 
end
function AiLayer:_add_project_unit_save_data(unit, data)
	slot5 = unit

	if unit.name(slot4) == self._nav_surface_unit then
		slot5 = unit
		data.ai_editor_data = unit.ai_editor_data(slot4)
	end

	return 
end
function AiLayer:update(t, dt)
	slot7 = dt

	AiLayer.super.update(slot4, self, t)

	slot5 = managers.navigation

	if managers.navigation.is_data_ready(slot4) ~= self._graph_status then

		-- Decompilation error in this vicinity:
		slot5 = managers.navigation
		self._graph_status = managers.navigation.is_data_ready(slot4)
		local text = (self._graph_status and "Graph is correct") or "Graph is incomplete"
		slot8 = ""

		self._status_text.change_value(slot6, self._status_text)

		slot8 = color

		self._status_text.set_default_style_colour(slot6, self._status_text)

		slot8 = text

		self._status_text.append(slot6, self._status_text)
	end

	slot7 = dt

	self._draw(slot4, self, t)

	return 
end
function AiLayer:external_draw(t, dt)
	slot7 = dt

	self._draw(slot4, self, t)

	return 
end
function AiLayer:_draw(t, dt)
	slot5 = self._created_units

	for _, unit in ipairs(slot4) do
		local selected = unit == self._selected_unit
		slot11 = unit

		if unit.name(slot10) == self._nav_surface_unit then
			local a = (selected and 0.75) or 0.5
			local r = (selected and 0) or 1
			local g = (selected and 1) or 1
			local b = (selected and 0) or 1
			slot15 = self._brush
			slot21 = b

			self._brush.set_color(slot14, Color(slot17, a, r, g))

			slot22 = b

			self._draw_surface(slot14, self, unit, t, dt, a, r, g)

			if selected then
				slot17 = unit
				slot15 = unit.ai_editor_data(slot16).visibilty_exlude_filter

				for id, _ in pairs(slot14) do
					slot20 = self._created_units

					for _, to_unit in ipairs(slot19) do
						slot25 = to_unit

						if to_unit.unit_data(slot24).unit_id == id then
							slot26 = {
								g = 0,
								b = 0,
								r = 1,
								from_unit = unit,
								to_unit = to_unit
							}

							Application.draw_link(slot24, Application)
						end
					end
				end

				slot17 = unit
				slot15 = unit.ai_editor_data(slot16).visibilty_include_filter

				for id, _ in pairs(slot14) do
					slot20 = self._created_units

					for _, to_unit in ipairs(slot19) do
						slot25 = to_unit

						if to_unit.unit_data(slot24).unit_id == id then
							slot26 = {
								g = 1,
								b = 0,
								r = 0,
								from_unit = unit,
								to_unit = to_unit
							}

							Application.draw_link(slot24, Application)
						end
					end
				end
			end
		else
			slot11 = unit

			if unit.name(slot10) == self._patrol_point_unit then
			end
		end
	end

	slot7 = dt

	self._draw_patrol_paths(slot4, self, t)

	return 
end
function AiLayer:_draw_surface(unit, t, dt, a, r, g, b)
	slot12 = t * 10
	slot12 = 0
	local rot1 = Rotation(slot9, math.sin(slot11) * 180, 0)
	slot13 = 0
	local rot2 = rot1 * Rotation(math.sin(slot11) * 180, 90, 0)
	slot13 = rot1
	local pos1 = unit.position(90) - rot1.y(unit) * 100
	slot14 = rot2
	local pos2 = unit.position(unit) - rot2.y(unit) * 100
	slot18 = rot1
	slot19 = b

	Application.draw_line(unit, Application, pos1, pos1 + rot1.y(slot17) * 200, r, g)

	slot18 = rot2
	slot19 = b

	Application.draw_line(unit, Application, pos2, pos2 + rot2.y(r) * 200, r, g)

	slot20 = rot2
	slot18 = pos2 + rot2.y(rot1) * 200

	self._brush.quad(unit, self._brush, pos1, pos2, pos1 + rot1.y(g) * 200)

	return 
end
function AiLayer:_draw_patrol_paths(t, dt)
	if self._only_draw_selected_patrol_path and self._current_patrol_path then
		slot9 = managers.ai_data
		slot9 = dt

		self._draw_patrol_path(slot4, self, self._current_patrol_path, managers.ai_data.all_patrol_paths(slot8)[self._current_patrol_path], t)
	else
		slot7 = managers.ai_data

		for name, path in pairs(managers.ai_data.all_patrol_paths(slot6)) do
			slot14 = dt

			self._draw_patrol_path(slot9, self, name, path, t)
		end
	end

	return 
end
function AiLayer:_draw_patrol_path(name, path, t, dt)
	local selected_path = name == self._current_patrol_path

	if 0 < #path.points then
		slot8 = path.points

		for i, point in ipairs(slot7) do
			local to_unit = nil

			if i == #path.points then
				to_unit = path.points[1].unit
			else
				to_unit = path.points[i + 1].unit
			end

			slot14 = self._patrol_path_brush
			slot18 = (selected_path and 1) or 0.25

			self._patrol_path_brush.set_color(slot13, Color.white.with_alpha(slot16, Color.white))

			slot15 = {
				g = 1,
				thick = true,
				b = 1,
				r = 1,
				height_offset = 0,
				from_unit = point.unit,
				to_unit = to_unit,
				circle_multiplier = (selected_path and 0.5) or 0.25
			}

			Application.draw_link(slot13, Application)

			slot20 = dt

			self._draw_patrol_point(slot13, self, point.unit, i == 1, i == #path.points, selected_path, t)

			if point.unit == self._selected_unit then
				slot15 = point.unit
				local dir = to_unit.position(slot13) - point.unit.position(to_unit)
				slot15 = point.unit
				self._mid_pos = point.unit.position(to_unit) + dir / 2
				slot20 = 1

				Application.draw_sphere(dir / 2, Application, self._mid_pos, 10, 0, 0)
			end
		end
	end

	return 
end
function AiLayer:_draw_patrol_point(unit, first, last, selected_path, t, dt)
	local selected = unit == self._selected_unit
	local r = (selected and 0) or (first and 0.5) or (last and 1) or 0.65
	local g = (selected and 1) or (first and 1) or (last and 0.5) or 0.65
	local b = (selected and 0) or (first and 0.5) or (last and 0.5) or 0.65
	slot13 = self._patrol_path_brush
	slot18 = b
	slot17 = (selected_path and 1) or 0.25

	self._patrol_path_brush.set_color(slot12, Color(slot15, r, g).with_alpha(slot15, Color(slot15, r, g)))

	slot16 = unit

	self._patrol_path_brush.sphere(slot12, self._patrol_path_brush, unit.position((selected_path and ((first and 20) or 20)) or (first and 10) or 10))

	return 
end
function AiLayer:draw_patrol_path_externaly(name)
	slot5 = name
	slot9 = name

	self._draw_patrol_path(slot3, self, managers.ai_data.patrol_path(slot7, managers.ai_data))

	return 
end
function AiLayer:build_panel(notebook)
	slot5 = notebook

	AiLayer.super.build_panel(slot3, self)

	slot5 = "VERTICAL"
	local ai_sizer = EWS.BoxSizer(slot3, EWS)
	slot8 = "Graphs"
	local graphs_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot9 = "LB_EXTENDED,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	local graphs = EWS.ListBox(EWS, EWS, self._ews_panel, "ai_layer_graph")
	slot7 = self._graph_types

	for name, _ in pairs(EWS) do
		slot13 = name

		graphs.append(slot11, graphs)
	end

	slot8 = graphs

	for i = 0, graphs.nr_items(slot7) - 1, 1 do
		slot12 = i

		graphs.select_index(slot10, graphs)
	end

	slot11 = "EXPAND"

	graphs_sizer.add(slot6, graphs_sizer, graphs, 1, 0)

	slot10 = "Calculate"
	local button_sizer1 = EWS.StaticBoxSizer(slot6, EWS, self._ews_panel, "HORIZONTAL")
	slot12 = "BU_EXACTFIT,NO_BORDER"
	local calc_btn = EWS.Button(EWS, EWS, self._ews_panel, "All", "")
	slot13 = "RIGHT"

	button_sizer1.add(EWS, button_sizer1, calc_btn, 0, 5)

	slot15 = "_calc_graphs"
	slot12 = {
		vis_graph = true,
		build_type = "all"
	}

	calc_btn.connect(EWS, calc_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot13 = "BU_EXACTFIT,NO_BORDER"
	local calc_selected_btn = EWS.Button(EWS, EWS, self._ews_panel, "Selected", "")
	slot14 = "RIGHT"

	button_sizer1.add(EWS, button_sizer1, calc_selected_btn, 0, 5)

	slot16 = "_calc_graphs"
	slot13 = {
		vis_graph = true,
		build_type = "selected"
	}

	calc_selected_btn.connect(EWS, calc_selected_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot14 = "BU_EXACTFIT,NO_BORDER"
	local calc_ground_btn = EWS.Button(EWS, EWS, self._ews_panel, "Ground All", "")
	slot15 = "RIGHT"

	button_sizer1.add(EWS, button_sizer1, calc_ground_btn, 0, 5)

	slot17 = "_calc_graphs"
	slot14 = {
		vis_graph = false,
		build_type = "all"
	}

	calc_ground_btn.connect(EWS, calc_ground_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot15 = "BU_EXACTFIT,NO_BORDER"
	local calc_ground_selected_btn = EWS.Button(EWS, EWS, self._ews_panel, "Ground Selected", "")
	slot16 = "RIGHT"

	button_sizer1.add(EWS, button_sizer1, calc_ground_selected_btn, 0, 5)

	slot18 = "_calc_graphs"
	slot15 = {
		vis_graph = false,
		build_type = "selected"
	}

	calc_ground_selected_btn.connect(EWS, calc_ground_selected_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot16 = "BU_EXACTFIT,NO_BORDER"
	local calc_vis_graph_btn = EWS.Button(EWS, EWS, self._ews_panel, "Visibility", "")
	slot17 = "RIGHT"

	button_sizer1.add(EWS, button_sizer1, calc_vis_graph_btn, 0, 5)

	slot19 = "_build_visibility_graph"
	slot16 = nil

	calc_vis_graph_btn.connect(EWS, calc_vis_graph_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot17 = "EXPAND"

	graphs_sizer.add(EWS, graphs_sizer, button_sizer1, 0, 0)

	slot14 = "HORIZONTAL"
	local button_sizer2 = EWS.BoxSizer(EWS, EWS)
	slot18 = "BU_EXACTFIT,NO_BORDER"
	local clear_btn = EWS.Button(EWS, EWS, self._ews_panel, "Clear All", "")
	slot19 = "RIGHT"

	button_sizer2.add(EWS, button_sizer2, clear_btn, 0, 5)

	slot21 = "_clear_graphs"
	slot18 = nil

	clear_btn.connect(EWS, clear_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot19 = "BU_EXACTFIT,NO_BORDER"
	local clear_selected_btn = EWS.Button(EWS, EWS, self._ews_panel, "Clear Selected", "")
	slot20 = "RIGHT"

	button_sizer2.add(EWS, button_sizer2, clear_selected_btn, 0, 5)

	slot22 = "_clear_selected_nav_segment"
	slot19 = nil

	clear_selected_btn.connect(EWS, clear_selected_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot20 = "EXPAND"

	graphs_sizer.add(EWS, graphs_sizer, button_sizer2, 0, 0)

	slot19 = "Build Settings"
	local build_settings = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot21 = "ALIGN_LEFT"
	self._all_visible = EWS.CheckBox(EWS, EWS, self._ews_panel, "All visible", "")
	slot18 = self._default_values.all_visible

	self._all_visible.set_value(EWS, self._all_visible)

	slot21 = "EXPAND"

	build_settings.add(EWS, build_settings, self._all_visible, 0, 0)

	self._ray_length_params = {
		value = 150,
		name = "Ray length [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Specifies the visible graph ray lenght in centimeter",
		min = 1,
		floats = 0,
		panel = self._ews_panel,
		sizer = build_settings
	}
	slot17 = self._ray_length_params

	CoreEws.number_controller(self._ews_panel)

	slot21 = "EXPAND"

	graphs_sizer.add(self._ews_panel, graphs_sizer, build_settings, 0, 0)

	slot20 = "Visualize"
	local visualize_sizer = EWS.StaticBoxSizer(self._ews_panel, EWS, self._ews_panel, "VERTICAL")
	self._nav_visualization_checkboxes = {}
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.quads = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Quads", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.doors = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Doors", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.segments = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Segments", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.coarse_graph = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Coarse Graph", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.visibility_graph = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Visibility Graph", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.blockers = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Blockers", "")
	slot23 = "ALIGN_LEFT"
	self._nav_visualization_checkboxes.sectors = EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Sectors", "")
	slot18 = self._nav_visualization_checkboxes

	for name, ctrl in pairs(EWS.CheckBox(self._ews_panel, EWS, self._ews_panel, "Sectors", "")) do
		slot27 = "EXPAND"

		visualize_sizer.add(slot22, visualize_sizer, ctrl, 0, 0)

		slot24 = "EVT_COMMAND_CHECKBOX_CLICKED"
		slot29 = "_apply_visualization_options"

		ctrl.connect(slot22, ctrl, callback(0, self, self))
	end

	slot22 = "EXPAND"

	graphs_sizer.add(slot17, graphs_sizer, visualize_sizer, 0, 0)

	slot22 = "TE_NOHIDESEL,TE_RICH2,TE_DONTWRAP,TE_READONLY,TE_CENTRE"
	self._status_text = EWS.TextCtrl(slot17, EWS, self._ews_panel, "", 0)
	slot22 = "EXPAND,ALIGN_CENTER"

	graphs_sizer.add(slot17, graphs_sizer, self._status_text, 0, 0)

	slot22 = "EXPAND"

	ai_sizer.add(slot17, ai_sizer, graphs_sizer, 0, 0)

	slot21 = self
	slot22 = "EXPAND"

	ai_sizer.add(slot17, ai_sizer, self._build_ai_settings(0), 0, 0)

	slot21 = self
	slot22 = "EXPAND"

	ai_sizer.add(slot17, ai_sizer, self._build_ai_unit_settings(0), 0, 0)

	slot21 = self
	slot22 = "EXPAND"

	ai_sizer.add(slot17, ai_sizer, self._build_ai_data(0), 1, 0)

	slot21 = self
	slot22 = "EXPAND"

	ai_sizer.add(slot17, ai_sizer, self._build_motion_path_section(1), 1, 0)

	slot22 = "EXPAND"

	self._sizer.add(slot17, self._sizer, ai_sizer, 4, 0)

	self._graphs = graphs

	return self._ews_panel
end
function AiLayer:_build_ai_settings()
	slot6 = "Settings"
	local graphs_sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "VERTICAL")
	local group_state = {
		name = "Group state:",
		name_proportions = 1,
		tooltip = "Select a group state from the combo box",
		sorted = true,
		ctrlr_proportions = 2,
		panel = self._ews_panel,
		sizer = graphs_sizer
	}
	slot5 = managers.groupai
	group_state.options = managers.groupai.state_names(self._ews_panel)
	group_state.value = self._ai_settings.group_state
	local state = CoreEws.combobox(self._ews_panel)
	slot12 = "_set_group_state"
	slot9 = nil

	state.connect(group_state, state, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot9, self, self))

	self._ai_settings_guis = {
		group_state = group_state
	}

	return graphs_sizer
end
function AiLayer:_build_ai_unit_settings()
	slot6 = "Unit settings"
	local sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "VERTICAL")
	local suspicion_multiplier = {
		value = 1,
		name = "Suspicion Multiplier:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "multiplier applied to suspicion buildup rate",
		min = 1,
		floats = 1,
		panel = self._ews_panel,
		sizer = sizer
	}
	local suspicion_multiplier_ctrlr = CoreEws.number_controller(self._ews_panel)
	slot12 = "_set_suspicion_mul"

	suspicion_multiplier_ctrlr.connect(suspicion_multiplier, suspicion_multiplier_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(slot9, self, self))

	slot12 = "_set_suspicion_mul"
	slot9 = nil

	suspicion_multiplier_ctrlr.connect(suspicion_multiplier, suspicion_multiplier_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	local detection_multiplier = {
		value = 1,
		name = "Detection Multiplier:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "multiplier applied to AI detection speed. min is 0.01",
		min = 0.01,
		floats = 2,
		panel = self._ews_panel,
		sizer = sizer
	}
	local detection_multiplier_ctrlr = CoreEws.number_controller(suspicion_multiplier_ctrlr)
	slot14 = "_set_detection_mul"

	detection_multiplier_ctrlr.connect(detection_multiplier, detection_multiplier_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot14 = "_set_detection_mul"
	slot11 = nil

	detection_multiplier_ctrlr.connect(detection_multiplier, detection_multiplier_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	slot9 = "HORIZONTAL"
	local tag_sizer = EWS.BoxSizer(detection_multiplier, EWS)
	local barrage_allowed = EWS.CheckBox(EWS, EWS, self._ews_panel, "Barrage Allowed", "")
	slot11 = false

	barrage_allowed.set_value(EWS, barrage_allowed)

	slot16 = "_set_barrage_allowed"
	slot13 = nil

	barrage_allowed.connect(EWS, barrage_allowed, "EVT_COMMAND_CHECKBOX_CLICKED", callback("ALIGN_LEFT", self, self))

	slot14 = "EXPAND"

	tag_sizer.add(EWS, tag_sizer, barrage_allowed, 1, 0)

	slot14 = "EXPAND"

	sizer.add(EWS, sizer, tag_sizer, 1, 0)

	self._ai_unit_settings_guis = {
		text = text,
		suspicion_multiplier = suspicion_multiplier,
		detection_multiplier = detection_multiplier,
		barrage_allowed = barrage_allowed
	}

	return sizer
end
function AiLayer:_build_ai_data()
	slot6 = "Ai Data"
	local ai_data_sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "VERTICAL")
	slot7 = "Patrol paths"
	local patrol_paths_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "HORIZONTAL")
	slot8 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	local patrol_path_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot11 = "toolbar\\new_16x16.png"

	patrol_path_toolbar.add_tool(EWS, patrol_path_toolbar, "GT_CREATE_NEW", "Create New", CoreEws.image_path(slot10))

	slot13 = "_create_new_patrol_path"

	patrol_path_toolbar.connect(EWS, patrol_path_toolbar, "GT_CREATE_NEW", "EVT_COMMAND_MENU_SELECTED", callback("Create a new patrol path", self, self))

	slot11 = "toolbar\\delete_16x16.png"

	patrol_path_toolbar.add_tool(EWS, patrol_path_toolbar, "GT_DELETE", "Delete", CoreEws.image_path(nil))

	slot13 = "_delete_patrol_path"

	patrol_path_toolbar.connect(EWS, patrol_path_toolbar, "GT_DELETE", "EVT_COMMAND_MENU_SELECTED", callback("Delete a patrol path", self, self))

	slot11 = "lock_16x16.png"

	patrol_path_toolbar.add_check_tool(EWS, patrol_path_toolbar, "ONLY_DRAW_SELECTED_PATH", "Toggles draw on selected path", CoreEws.image_path(nil))

	slot8 = self._only_draw_selected_patrol_path

	patrol_path_toolbar.set_tool_state(EWS, patrol_path_toolbar, "ONLY_DRAW_SELECTED_PATH")

	slot13 = "_toggle_only_draw_selected_patrol_path"
	slot10 = patrol_path_toolbar

	patrol_path_toolbar.connect(EWS, patrol_path_toolbar, "ONLY_DRAW_SELECTED_PATH", "EVT_COMMAND_MENU_SELECTED", callback("Toggles draw on selected path", self, self))

	slot6 = patrol_path_toolbar

	patrol_path_toolbar.realize(EWS)

	slot10 = "EXPAND"

	patrol_paths_sizer.add(EWS, patrol_paths_sizer, patrol_path_toolbar, 0, 0)

	self._patrol_paths_list = EWS.ListBox(EWS, EWS, self._ews_panel, "ai_layer_patrol_paths")
	slot12 = "_select_patrol_path"
	slot9 = nil

	self._patrol_paths_list.connect(EWS, self._patrol_paths_list, "EVT_COMMAND_LISTBOX_SELECTED", callback("LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT", self, self))

	slot10 = "EXPAND"

	patrol_paths_sizer.add(EWS, patrol_paths_sizer, self._patrol_paths_list, 1, 0)

	slot10 = "EXPAND"

	ai_data_sizer.add(EWS, ai_data_sizer, patrol_paths_sizer, 1, 0)

	return ai_data_sizer
end
function AiLayer:_build_motion_path_section()
	slot6 = "Motion Paths (Work In Progress)"
	local motion_paths_sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "VERTICAL")
	slot8 = "BU_EXACTFIT,NO_BORDER"
	local create_paths_btn = EWS.Button(EWS, EWS, self._ews_panel, "Recreate Paths", "")
	slot9 = "RIGHT"

	motion_paths_sizer.add(EWS, motion_paths_sizer, create_paths_btn, 0, 5)

	slot8 = nil

	create_paths_btn.connect(EWS, create_paths_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot8 = "Generated motion paths list"
	local motion_paths_list_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "HORIZONTAL")
	slot9 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	local motion_path_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot12 = "toolbar\\delete_16x16.png"

	motion_path_toolbar.add_tool(EWS, motion_path_toolbar, "GT_DELETE", "Delete", CoreEws.image_path("_create_motion_paths"))

	slot14 = "_delete_motion_path"

	motion_path_toolbar.connect(EWS, motion_path_toolbar, "GT_DELETE", "EVT_COMMAND_MENU_SELECTED", callback("Delete selected motion path and its markers.", self, self))

	slot12 = "lock_16x16.png"

	motion_path_toolbar.add_check_tool(EWS, motion_path_toolbar, "ONLY_DRAW_SELECTED_MOTION_PATH", "Toggle draw on selected motion path.", CoreEws.image_path(nil))

	slot9 = self._only_draw_selected_motion_path

	motion_path_toolbar.set_tool_state(EWS, motion_path_toolbar, "ONLY_DRAW_SELECTED_MOTION_PATH")

	slot14 = "_toggle_only_draw_selected_motion_path"
	slot11 = motion_path_toolbar

	motion_path_toolbar.connect(EWS, motion_path_toolbar, "ONLY_DRAW_SELECTED_MOTION_PATH", "EVT_COMMAND_MENU_SELECTED", callback("Toggle draw on selected motion path.", self, self))

	slot7 = motion_path_toolbar

	motion_path_toolbar.realize(EWS)

	slot11 = "EXPAND"

	motion_paths_list_sizer.add(EWS, motion_paths_list_sizer, motion_path_toolbar, 0, 0)

	self._motion_paths_list = EWS.ListBox(EWS, EWS, self._ews_panel, "ai_layer_motion_paths")
	slot13 = "_select_motion_path"
	slot10 = nil

	self._motion_paths_list.connect(EWS, self._motion_paths_list, "EVT_COMMAND_LISTBOX_SELECTED", callback("LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT", self, self))

	slot11 = "EXPAND"

	motion_paths_list_sizer.add(EWS, motion_paths_list_sizer, self._motion_paths_list, 1, 0)

	slot11 = "EXPAND"

	motion_paths_sizer.add(EWS, motion_paths_sizer, motion_paths_list_sizer, 1, 0)

	local mop_path_types = {
		"airborne",
		"ground"
	}

	if managers.motion_path then
		slot8 = managers.motion_path
		mop_path_types = managers.motion_path.get_path_types(slot7)
	end

	local mop_type = {
		name = "Selected path type:",
		name_proportions = 1,
		tooltip = "Path is used for either ground or airborne units.",
		sorted = false,
		ctrlr_proportions = 2,
		panel = self._ews_panel,
		sizer = motion_paths_sizer,
		options = mop_path_types,
		value = self._motion_path_settings.path_type
	}
	local path_type_ctrlr = CoreEws.combobox(slot8)
	slot16 = "_set_mop_type"
	slot13 = nil

	path_type_ctrlr.connect(mop_type, path_type_ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot13, self, self))

	local speed_limit = {
		value = 50,
		name = "Default Speed Limit [km/h]:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Default speed limit for units moved along this path. -1 for no limit.",
		min = -1,
		floats = 1,
		panel = self._ews_panel,
		sizer = motion_paths_sizer
	}
	local speed_limit_ctrlr = CoreEws.number_controller(path_type_ctrlr)
	slot18 = "_set_mop_speed_limit"

	speed_limit_ctrlr.connect(speed_limit, speed_limit_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot18 = "_set_mop_speed_limit"
	slot15 = nil

	speed_limit_ctrlr.connect(speed_limit, speed_limit_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self.motion_path_settings_guis = {
		default_speed_limit = speed_limit,
		default_speed_limit_ctrlr = speed_limit_ctrlr,
		path_type = mop_type,
		path_type_ctrlr = path_type_ctrlr
	}

	return motion_paths_sizer
end
function AiLayer:_set_mop_type()
	slot3 = self
	local selected_path = self._selected_motion_path(slot2)

	if selected_path then
		if not self._motion_path_settings[selected_path] then
			self._motion_path_settings[selected_path] = {}
		end

		local path_type = self.motion_path_settings_guis.path_type.value
		self._motion_path_settings[selected_path].path_type = path_type
		slot6 = path_type

		managers.motion_path.set_path_type(slot4, managers.motion_path)
	end

	return 
end
function AiLayer:_set_mop_speed_limit()
	local speed_limit = self.motion_path_settings_guis.default_speed_limit.value
	slot4 = self
	local selected_path = self._selected_motion_path(slot3)

	if selected_path then
		if not self._motion_path_settings[selected_path] then
			self._motion_path_settings[selected_path] = {}
		end

		self._motion_path_settings[selected_path].speed_limit = speed_limit
	end

	slot6 = speed_limit

	managers.motion_path.set_default_speed_limit(slot4, managers.motion_path)

	return 
end
function AiLayer:_delete_motion_path()
	slot4 = "AiLayer:_delete_motion_path()"

	Application.debug(slot2, Application)

	return 
end
function AiLayer:_toggle_only_draw_selected_motion_path(motion_path_toolbar)
	slot5 = "ONLY_DRAW_SELECTED_MOTION_PATH"
	self._only_draw_selected_motion_path = motion_path_toolbar.tool_state(slot3, motion_path_toolbar)

	return 
end
function AiLayer:_update_motion_paths_list()
	slot3 = self._motion_paths_list

	self._motion_paths_list.clear(slot2)

	self._motion_path_settings = {}

	if not managers.motion_path then
		return 
	end

	slot3 = managers.motion_path
	local all_paths = managers.motion_path.get_all_paths(slot2)
	slot6 = managers.motion_path

	for _, path in ipairs(managers.motion_path.get_all_paths(slot5)) do
		slot10 = path.id

		self._motion_paths_list.append(slot8, self._motion_paths_list)

		self._motion_path_settings[path.id] = {}

		if not path.default_speed_limit then
			path.default_speed_limit = -1
		end

		if not path.path_type then
			slot9 = managers.motion_path
			local all_path_types = managers.motion_path.get_path_types(slot8)

			if all_path_types then
				path.path_type = all_path_types[1]
			else
				path.path_type = "airborne"
			end
		end

		slot10 = path.default_speed_limit

		self.motion_path_settings_guis.default_speed_limit_ctrlr.set_value(slot8, self.motion_path_settings_guis.default_speed_limit_ctrlr)

		self._motion_path_settings[path.id].speed_limit = path.default_speed_limit
		self._motion_path_settings[path.id].path_type = path.path_type
		slot10 = path.path_type

		self.motion_path_settings_guis.path_type_ctrlr.set_value(path.path_type, self.motion_path_settings_guis.path_type_ctrlr)
	end

	if 0 < #all_paths then
		slot5 = 0

		self._motion_paths_list.select_index(slot3, self._motion_paths_list)

		slot4 = self
		local selected_path = self._selected_motion_path(slot3)

		if selected_path then
			slot6 = self._motion_path_settings[selected_path].speed_limit

			self.motion_path_settings_guis.default_speed_limit_ctrlr.set_value(slot4, self.motion_path_settings_guis.default_speed_limit_ctrlr)

			slot6 = self._motion_path_settings[selected_path].path_type

			self.motion_path_settings_guis.path_type_ctrlr.set_value(slot4, self.motion_path_settings_guis.path_type_ctrlr)

			slot6 = selected_path

			managers.motion_path.select_path(slot4, managers.motion_path)
		end
	end

	return 
end
function AiLayer:_create_motion_paths()
	slot3 = managers.motion_path

	managers.motion_path.recreate_paths(slot2)

	slot3 = self

	self._update_motion_paths_list(slot2)

	return 
end
function AiLayer:_select_motion_path()
	local motion_path_name = self._selected_motion_path(slot2)
	slot5 = motion_path_name

	managers.motion_path.select_path(self, managers.motion_path)

	if self._motion_path_settings[motion_path_name] then
		slot5 = self._motion_path_settings[motion_path_name].speed_limit

		self.motion_path_settings_guis.default_speed_limit_ctrlr.set_value(slot3, self.motion_path_settings_guis.default_speed_limit_ctrlr)

		slot5 = self._motion_path_settings[motion_path_name].path_type

		self.motion_path_settings_guis.path_type_ctrlr.set_value(slot3, self.motion_path_settings_guis.path_type_ctrlr)
	end

	return 
end
function AiLayer:_selected_motion_path()
	slot3 = self._motion_paths_list
	local index = self._motion_paths_list.selected_index(slot2)

	if index ~= -1 then
		slot5 = index

		return self._motion_paths_list.get_string(slot3, self._motion_paths_list)
	end

	return nil
end
function AiLayer:_toggle_only_draw_selected_patrol_path(patrol_path_toolbar)
	slot5 = "ONLY_DRAW_SELECTED_PATH"
	self._only_draw_selected_patrol_path = patrol_path_toolbar.tool_state(slot3, patrol_path_toolbar)

	return 
end
function AiLayer:_calc_graphs(params)
	local build_type = params.build_type

	if build_type == "all" then
		slot9 = "YES_NO,ICON_QUESTION"
		slot14 = 0
		local confirm = EWS.message_box(slot4, EWS, Global.frame_panel, "Are you sure?", "AI", Vector3(slot11, -1, -1))

		if confirm == "NO" then
			return 
		end
	end

	slot5 = self._graphs
	local selected = self._graphs.selected_indices(slot4)

	if build_type == "all" then
		slot6 = managers.navigation

		managers.navigation.clear(slot5)
	end

	slot6 = selected

	for _, i in ipairs(slot5) do
		slot12 = i
		local selection = self._graphs.get_string(slot10, self._graphs)
		local type = self._graph_types[selection]

		if type then
			slot15 = build_type
			local settings = self._get_build_settings(slot12, self, type)

			if 0 < #settings then
				self._saved_disabled_units = {}
				slot16 = managers.editor

				for name, layer in pairs(managers.editor.layers(slot15)) do
					slot21 = layer

					for _, unit in ipairs(layer.created_units(slot20)) do
						slot24 = unit

						if unit.unit_data(slot23).disable_on_ai_graph then
							slot25 = false

							unit.set_enabled(slot23, unit)

							slot25 = unit

							table.insert(slot23, self._saved_disabled_units)
						end
					end
				end

				slot21 = i
				slot15 = "Make graph " .. type .. "_" .. self._graphs.get_string(slot19, self._graphs)

				managers.editor.output(slot13, managers.editor)

				slot15 = settings
				slot21 = params.vis_graph

				managers.navigation.build_nav_segments(slot13, managers.navigation, callback("_", self, self, "_graphs_done"))
			end
		else
			slot17 = selection
			slot14 = "Invalid selection \"" .. tostring(slot16) .. "\"."

			Application.error(slot12, Application)
		end
	end

	return 
end
function AiLayer:_graphs_done(vis_graph)
	slot5 = "Navigation seqments calculated"

	managers.editor.output(slot3, managers.editor)

	slot4 = self._saved_disabled_units

	for _, unit in ipairs(slot3) do
		slot10 = true

		unit.set_enabled(slot8, unit)
	end

	if vis_graph then
		slot4 = self

		self._build_visibility_graph(slot3)
	end

	return 
end
function AiLayer:_build_visibility_graph()
	slot3 = self._all_visible
	local all_visible = self._all_visible.get_value(slot2) and true
	local exclude, include = nil

	if not all_visible then
		exclude = {}
		include = {}
		slot6 = self._created_units

		for _, unit in ipairs(slot5) do
			slot11 = unit

			if unit.name(slot10) == self._nav_surface_unit then
				slot12 = unit
				exclude[unit.unit_data(slot10).unit_id] = unit.ai_editor_data(unit).visibilty_exlude_filter
				slot12 = unit
				include[unit.unit_data(unit.ai_editor_data(unit).visibilty_exlude_filter).unit_id] = unit.ai_editor_data(unit).visibilty_include_filter
			end
		end
	end

	local ray_lenght = self._ray_length_params.value
	slot12 = "_visibility_graph_done"
	slot12 = ray_lenght

	managers.navigation.build_visibility_graph(slot6, managers.navigation, callback(slot9, self, self), all_visible, exclude, include)

	return 
end
function AiLayer:_visibility_graph_done()
	slot4 = "Visibility graph calculated"

	managers.editor.output(slot2, managers.editor)

	return 
end
function AiLayer:_get_build_settings(type, build_type)
	local settings = {}
	slot8 = build_type
	local units = self._get_units(slot5, self, type)
	slot7 = units

	for _, unit in ipairs(self) do
		slot13 = {
			sample = true,
			mask = managers.slot.get_mask(slot15, managers.slot),
			from = unit.position(slot15) + Vector3(unit, 0, 0),
			to = unit.position(Vector3(unit, 0, 0)) - Vector3(unit, 0, 0)
		}
		slot17 = "all"
		slot19 = 50
		slot19 = 150
		local ray = managers.editor.unit_by_raycast(slot11, managers.editor)

		if ray and ray.position then
			slot14 = {
				position = unit.position(slot16),
				id = unit.unit_data(slot16).unit_id,
				color = Color(),
				location_id = unit.ai_editor_data(slot16).location_id,
				barrage_allowed = unit.ai_editor_data(slot16).barrage_allowed
			}
			slot17 = unit
			slot17 = unit
			slot17 = unit
			slot17 = unit

			table.insert(slot12, settings)
		end
	end

	return settings
end
function AiLayer:_get_units(type, build_type)
	local unit_name = self._unit_graph_types[type]
	local units = {}
	slot5 = ipairs
	slot7 = (build_type == "selected" and self._selected_units) or self._created_units

	for _, unit in slot5(slot6) do
		slot12 = unit

		if unit.name(slot11) == unit_name then
			slot13 = unit

			table.insert(slot11, units)
		end
	end

	return units
end
function AiLayer:_apply_visualization_options()
	local options = {}
	slot4 = self._nav_visualization_checkboxes

	for name, ctrl in pairs(slot3) do
		slot9 = ctrl
		options[name] = ctrl.get_value(slot8)
	end

	slot5 = options

	managers.navigation.set_debug_draw_state(slot3, managers.navigation)

	return 
end
function AiLayer:_set_group_state()
	self._ai_settings.group_state = self._ai_settings_guis.group_state.value
	slot4 = self._ai_settings.group_state

	managers.groupai.set_state(self._ai_settings_guis.group_state.value, managers.groupai)

	return 
end
function AiLayer:_update_settings()
	slot3 = self._ai_settings

	for name, value in pairs(slot2) do
		if self._ai_settings_guis[name] then
			slot9 = value

			CoreEws.change_combobox_value(slot7, self._ai_settings_guis[name])
		end
	end

	return 
end
function AiLayer:_clear_graphs()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Clear all graphs?", "AI", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = managers.navigation

	managers.navigation.clear(slot3)

	return 
end
function AiLayer:_clear_selected_nav_segment()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Clear selected graph segment?", "AI", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = "[AiLayer:_clear_selected_nav_segment]"

	print(slot3)

	local selected = self._graphs.selected_indices(slot3)
	slot7 = "selected"
	local units = self._get_units(self._graphs, self, "surface")
	slot6 = units

	for _, unit in ipairs(self) do
		slot14 = unit
		slot12 = unit.unit_data(slot13).unit_id

		print(slot10, "deleting")

		slot14 = unit
		slot12 = unit.unit_data(slot13).unit_id

		managers.navigation.delete_nav_segment(slot10, managers.navigation)
	end

	return 
end
function AiLayer:set_select_unit(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.name(slot3) == self._patrol_point_unit then
			local name, _ = managers.ai_data.patrol_path_by_unit(slot3, managers.ai_data)
			slot7 = name

			self._set_selection_patrol_paths_listbox(unit, self)
		else
			slot4 = unit

			if unit.name(slot3) == self._nav_surface_unit then
				slot7 = unit
				slot5 = unit.ai_editor_data(slot6).suspicion_mul

				CoreEws.change_entered_number(slot3, self._ai_unit_settings_guis.suspicion_multiplier)

				slot7 = unit
				slot5 = unit.ai_editor_data(slot6).detection_mul

				CoreEws.change_entered_number(slot3, self._ai_unit_settings_guis.detection_multiplier)

				slot7 = unit
				slot5 = unit.ai_editor_data(slot6).barrage_allowed

				self._ai_unit_settings_guis.barrage_allowed.set_value(slot3, self._ai_unit_settings_guis.barrage_allowed)
			end
		end
	end

	slot5 = unit

	if not self._add_to_visible_exlude_filter(slot3, self) then
		slot5 = unit

		AiLayer.super.set_select_unit(slot3, self)

		slot4 = unit
	end

	return 
end
function AiLayer:_add_to_visible_exlude_filter(unit)
	slot4 = unit

	if not alive(slot3) then
		return false
	end

	slot4 = unit

	if unit.name(slot3) ~= self._nav_surface_unit then
		return false
	end

	if self._selected_unit then
		slot4 = self._editor_data.virtual_controller
		slot7 = "visible_exlude_filter"

		if self._editor_data.virtual_controller.down(slot3, Idstring(slot6)) and unit ~= self._selected_unit then
			slot5 = unit

			if self._selected_unit.ai_editor_data(slot3).visibilty_exlude_filter[unit.unit_data(self._selected_unit).unit_id] then
				slot5 = unit
				self._selected_unit.ai_editor_data(slot3).visibilty_exlude_filter[unit.unit_data(self._selected_unit).unit_id] = nil
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_exlude_filter[self._selected_unit.unit_data(unit).unit_id] = nil
			else
				slot5 = unit
				self._selected_unit.ai_editor_data(slot3).visibilty_include_filter[unit.unit_data(self._selected_unit).unit_id] = nil
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_include_filter[self._selected_unit.unit_data(unit).unit_id] = nil
				slot5 = unit
				self._selected_unit.ai_editor_data(self._selected_unit.unit_data(unit).unit_id).visibilty_exlude_filter[unit.unit_data(self._selected_unit).unit_id] = true
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_exlude_filter[self._selected_unit.unit_data(unit).unit_id] = true
			end

			return true
		end
	end

	if self._selected_unit then
		slot4 = self._editor_data.virtual_controller
		slot7 = "visible_include_filter"

		if self._editor_data.virtual_controller.down(slot3, Idstring(slot6)) and unit ~= self._selected_unit then
			slot5 = unit

			if self._selected_unit.ai_editor_data(slot3).visibilty_include_filter[unit.unit_data(self._selected_unit).unit_id] then
				slot5 = unit
				self._selected_unit.ai_editor_data(slot3).visibilty_include_filter[unit.unit_data(self._selected_unit).unit_id] = nil
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_include_filter[self._selected_unit.unit_data(unit).unit_id] = nil
			else
				slot5 = unit
				self._selected_unit.ai_editor_data(slot3).visibilty_exlude_filter[unit.unit_data(self._selected_unit).unit_id] = nil
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_exlude_filter[self._selected_unit.unit_data(unit).unit_id] = nil
				slot5 = unit
				self._selected_unit.ai_editor_data(self._selected_unit.unit_data(unit).unit_id).visibilty_include_filter[unit.unit_data(self._selected_unit).unit_id] = true
				slot5 = self._selected_unit
				unit.ai_editor_data(unit.unit_data(self._selected_unit).unit_id).visibilty_include_filter[self._selected_unit.unit_data(unit).unit_id] = true
			end

			return true
		end
	end

	return false
end
function AiLayer:_set_selection_patrol_paths_listbox(name)
	slot5 = self._patrol_paths_list

	for i = 0, self._patrol_paths_list.nr_items(slot4) - 1, 1 do
		slot9 = i

		if self._patrol_paths_list.get_string(slot7, self._patrol_paths_list) == name then
			slot9 = i

			self._patrol_paths_list.select_index(slot7, self._patrol_paths_list)
		end
	end

	slot4 = self

	self._select_patrol_path(slot3)

	return 
end
function AiLayer:_create_new_patrol_path()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for the new patrol path:", "Create patrol path", "new_patrol_path", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		slot5 = name

		if not managers.ai_data.add_patrol_path(slot3, managers.ai_data) then
			slot4 = self

			self._create_new_patrol_path(slot3)
		else
			self._update_patrol_paths_list(slot3)

			slot5 = self._patrol_paths_list

			for i = 0, self._patrol_paths_list.nr_items(self) - 1, 1 do
				slot9 = i

				if self._patrol_paths_list.get_string(slot7, self._patrol_paths_list) == name then
					slot9 = i

					self._patrol_paths_list.select_index(slot7, self._patrol_paths_list)
				end
			end

			slot4 = self

			self._select_patrol_path(slot3)
		end
	end

	return 
end
function AiLayer:_current_patrol_units(name)
	local t = {}
	slot6 = name
	local path = managers.ai_data.patrol_path(slot4, managers.ai_data)
	slot6 = path.points

	for _, point in ipairs(managers.ai_data) do
		slot12 = point.unit

		table.insert(slot10, t)
	end

	return t
end
function AiLayer:_delete_patrol_path()
	slot3 = self
	local name = self._selected_patrol_path(slot2)

	if name then
		slot8 = "YES_NO,ICON_QUESTION"
		slot13 = 0
		local confirm = EWS.message_box(slot3, EWS, Global.frame_panel, "Delete patrol path " .. name .. "?", "AI", Vector3(slot10, -1, -1))

		if confirm == "NO" then
			return 
		end

		slot6 = name
		local to_delete = self._current_patrol_units(slot4, self)
		slot6 = to_delete

		for _, unit in ipairs(self) do
			slot12 = unit

			self.delete_unit(slot10, self)
		end

		slot7 = name

		managers.ai_data.remove_patrol_path(slot5, managers.ai_data)

		slot6 = self

		self._update_patrol_paths_list(slot5)

		self._current_patrol_path = nil
	end

	return 
end
function AiLayer:_update_patrol_paths_list()
	slot3 = self._patrol_paths_list

	self._patrol_paths_list.clear(slot2)

	slot5 = managers.ai_data

	for name, _ in pairs(managers.ai_data.all_patrol_paths(slot4)) do
		slot9 = name

		self._patrol_paths_list.append(slot7, self._patrol_paths_list)
	end

	return 
end
function AiLayer:_selected_patrol_path()
	slot3 = self._patrol_paths_list
	local index = self._patrol_paths_list.selected_index(slot2)

	if index ~= -1 then
		slot5 = index

		return self._patrol_paths_list.get_string(slot3, self._patrol_paths_list)
	end

	return nil
end
function AiLayer:_select_patrol_path()
	slot3 = self
	local name = self._selected_patrol_path(slot2)

	if name and self._current_patrol_path ~= name then
		self._current_patrol_path = name
		slot4 = self

		self.clear_selected_units(slot3)
	elseif not name then
		self._current_patrol_path = nil
	end

	return 
end
function AiLayer:do_spawn_unit(name, pos, rot)
	slot6 = name

	if Idstring(slot5) == self._patrol_point_unit and not self._current_patrol_path then
		slot7 = "Create or select a patrol path first!"

		managers.editor.output(slot5, managers.editor)

		return 
	end

	slot9 = rot
	local unit = AiLayer.super.do_spawn_unit(slot5, self, name, pos)
	slot7 = unit

	if alive(self) then
		slot7 = unit

		if unit.name(slot6) == self._patrol_point_unit then
			slot9 = pos

			self._add_patrol_point(slot6, self, unit)
		end
	end

	return unit
end
function AiLayer:_add_patrol_point(unit)
	slot4 = self
	local name = self._selected_patrol_path(slot3)

	if not name then
		return 
	end

	slot7 = unit

	managers.ai_data.add_patrol_point(slot4, managers.ai_data, name)

	return 
end
function AiLayer:_insert()

	-- Decompilation error in this vicinity:
	slot3 = self._selected_unit
	local _, path = managers.ai_data.patrol_path_by_unit(slot2, managers.ai_data)
	local i, _ = managers.ai_data.patrol_point_index_by_unit(self._selected_unit, managers.ai_data)
	slot10 = self._patrol_point_unit
	slot9 = self._mid_pos

	self.do_spawn_unit(self._selected_unit, self, self._patrol_point_unit.s(slot9))

	local point = table.remove(self._selected_unit)
	slot10 = point

	table.insert(path.points, path.points, i + 1)

	return 
end
function AiLayer:delete_unit(unit)
	slot4 = self._created_units

	for _, u in ipairs(slot3) do
		slot9 = u

		if u.name(slot8) == self._nav_surface_unit and u ~= unit then
			slot10 = unit
			u.ai_editor_data(slot8).visibilty_exlude_filter[unit.unit_data(u).unit_id] = nil
			slot10 = unit
			u.ai_editor_data(unit.unit_data(u).unit_id).visibilty_include_filter[unit.unit_data(u).unit_id] = nil
		end
	end

	slot4 = unit

	if unit.name(slot3) == self._nav_surface_unit then
		slot7 = unit
		slot5 = unit.unit_data(slot6).unit_id

		managers.navigation.delete_nav_segment(slot3, managers.navigation)
	else
		slot4 = unit

		if unit.name(slot3) == self._patrol_point_unit then
			slot5 = unit

			managers.ai_data.delete_point_by_unit(slot3, managers.ai_data)
		end
	end

	slot5 = unit

	AiLayer.super.delete_unit(slot3, self)

	return 
end
function AiLayer:update_unit_settings()
	slot3 = self

	AiLayer.super.update_unit_settings(slot2)

	return 
end
function AiLayer:_init_ai_settings()
	self._ai_settings = {
		group_state = "raid"
	}
	slot4 = self._ai_settings.group_state

	managers.groupai.set_state("raid", managers.groupai)

	return 
end
function AiLayer:_init_mop_settings()
	self._motion_path_settings = {}

	if managers.motion_path then
		slot3 = managers.motion_path
		local path_types = managers.motion_path.get_path_types(slot2)

		if path_types then
			self._motion_path_settings.path_type = path_types[1]
		end
	end

	return 
end
function AiLayer:clear()
	slot3 = self

	AiLayer.super.clear(slot2)

	if managers.motion_path then
		slot3 = managers.motion_path

		managers.motion_path.delete_paths(slot2)
	end

	slot3 = self

	self._init_ai_settings(slot2)

	slot3 = self

	self._update_settings(slot2)

	slot3 = managers.ai_data

	managers.ai_data.clear(slot2)

	slot3 = self

	self._update_patrol_paths_list(slot2)

	slot3 = self

	self._update_motion_paths_list(slot2)

	slot3 = self

	self._select_patrol_path(slot2)

	slot3 = managers.navigation

	managers.navigation.clear(slot2)

	return 
end
function AiLayer:add_triggers()
	AiLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "_insert"

	vc.add_trigger(self, vc, callback("enter", self, self))

	return 
end
function AiLayer:_set_suspicion_mul()
	slot3 = self._selected_unit
	self._selected_unit.ai_editor_data(slot2).suspicion_mul = self._ai_unit_settings_guis.suspicion_multiplier.value
	slot6 = self._selected_unit
	slot5 = self._ai_unit_settings_guis.suspicion_multiplier.value

	managers.navigation.set_suspicion_multiplier(self._ai_unit_settings_guis.suspicion_multiplier.value, managers.navigation, self._selected_unit.unit_data(slot5).unit_id)

	return 
end
function AiLayer:_set_detection_mul()
	slot3 = self._selected_unit
	self._selected_unit.ai_editor_data(slot2).detection_mul = self._ai_unit_settings_guis.detection_multiplier.value
	slot6 = self._selected_unit
	slot5 = self._ai_unit_settings_guis.detection_multiplier.value

	managers.navigation.set_detection_multiplier(self._ai_unit_settings_guis.detection_multiplier.value, managers.navigation, self._selected_unit.unit_data(slot5).unit_id)

	return 
end
function AiLayer:_set_barrage_allowed()
	slot4 = self._ai_unit_settings_guis.barrage_allowed
	self._selected_unit.ai_editor_data(slot2).barrage_allowed = self._ai_unit_settings_guis.barrage_allowed.get_value(self._selected_unit)
	slot4 = self._selected_unit.unit_data(slot5).unit_id
	slot7 = self._ai_unit_settings_guis.barrage_allowed

	managers.navigation.set_barrage_allowed(self._ai_unit_settings_guis.barrage_allowed.get_value(self._selected_unit), managers.navigation, self._ai_unit_settings_guis.barrage_allowed.get_value(self._selected_unit))

	return 
end

return 
