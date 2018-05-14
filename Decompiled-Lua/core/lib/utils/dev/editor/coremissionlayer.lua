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
slot3 = "CoreMissionLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreEditorSave"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not MissionLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

MissionLayer = slot0
function MissionLayer:init(owner)
	slot4 = "mission"
	local types = CoreEditorUtils.layer_type(slot3) or {
		"mission_element"
	}
	slot9 = "mission_elements"

	MissionLayer.super.init(slot4, self, owner, "mission", types)

	self._default_script_name = "default"
	self._editing_mission_element = false
	self._update_all = false
	self._simulate_with_current_script = false
	self._only_draw_selected_connections = true
	self._visualize_flow = false
	self._use_colored_links = true
	self._show_all_scripts = false
	slot5 = Draw
	self._name_brush = Draw.brush(slot4)
	slot5 = self._name_brush
	slot11 = 1

	self._name_brush.set_color(slot4, Color("mission", 1, 1, 1))

	slot8 = "core/fonts/nice_editor_font"

	self._name_brush.set_font(slot4, self._name_brush, Idstring("mission"))

	slot5 = self._name_brush
	slot8 = "OverlayVertexColorTextured"

	self._name_brush.set_render_template(slot4, Idstring(16))

	self._uses_continents = true

	return 
end
function MissionLayer:load(world_holder, offset)
	slot8 = offset
	local data = world_holder.create_world(slot4, world_holder, "world", "mission_scripts")
	self._scripts = data.scripts or self._scripts
	slot6 = self._scripts

	for name, values in pairs(slot5) do
		if not values.continent then
			slot11 = managers.editor
			slot11 = managers.editor.current_continent(slot10)
			slot9 = managers.editor.current_continent(slot10).name(slot10)
		end

		values.continent = slot9
	end

	slot8 = offset
	local world_units = MissionLayer.super.load(slot5, self, world_holder)

	if world_units then
		slot7 = world_units

		for _, unit in ipairs(slot6) do
			slot12 = unit
			slot12 = unit.mission_element(slot11)

			unit.mission_element(slot11).layer_finished(slot11)

			slot13 = unit
			unit.mission_element_data(slot11).script = unit.mission_element_data(unit).script or self._default_script_name
		end
	end

	slot7 = self

	self._populate_scripts_combobox(slot6)

	slot8 = self._default_script_name

	self._set_scripts_combobox(slot6, self)

	slot7 = self

	self._on_set_script(slot6)

	return 
end
function MissionLayer:save()
	slot3 = self._created_units

	for _, unit in ipairs(slot2) do
		local t = {
			entry = self._save_name
		}
		slot9 = unit

		if unit.unit_data(slot8).continent then
			slot9 = unit
			slot9 = unit.unit_data(slot8).continent
			slot7 = unit.unit_data(slot8).continent.name(slot8)
		end

		t.continent = slot7
		slot10 = unit
		slot10 = unit
		slot10 = unit
		slot10 = unit.mission_element(slot9)
		t.data = {
			unit_data = CoreEditorSave.save_data_table(slot9),
			script = unit.mission_element_data(slot9).script,
			script_data = unit.mission_element(slot9).new_save_values(slot9)
		}
		t.data.script_data.position = nil
		t.data.script_data.rotation = nil
		slot11 = t.data

		self._add_project_unit_save_data(nil, self, unit)

		slot9 = unit
		slot9 = unit.mission_element(nil)

		unit.mission_element(nil).add_to_mission_package(nil)

		slot10 = t

		managers.editor.add_save_data(nil, managers.editor)
	end

	slot3 = self._scripts

	for name, data in pairs(slot2) do
		local t = {
			entry = "mission_scripts",
			continent = data.continent,
			data = {
				[name] = data
			}
		}
		slot10 = t

		managers.editor.add_save_data(slot8, managers.editor)
	end

	return 
end
function MissionLayer:save_mission(params)
	local all_script_units = {}
	slot5 = self._created_units

	for _, unit in ipairs(slot4) do
		slot11 = unit
		all_script_units[unit.mission_element_data(slot9).script] = all_script_units[unit.mission_element_data(unit).script] or {}
		slot12 = unit

		table.insert(all_script_units[unit.mission_element_data(unit).script] or , all_script_units[unit.mission_element_data(unit).script])
	end

	local scripts = {}
	slot6 = self._scripts

	for script, _ in pairs(slot5) do
		local script_units = all_script_units[script] or {}

		if not params.name or (params.name and self._scripts[script].continent == params.name) then
			scripts[script] = {
				activate_on_parsed = self._scripts[script].activate_on_parsed
			}
			local elements = {}
			slot13 = script_units

			for _, unit in ipairs(slot12) do
				local t = {}
				slot19 = unit
				t.class = unit.mission_element_data(slot18).element_class
				slot19 = unit
				t.module = unit.mission_element_data(slot18).element_module
				slot19 = unit
				t.id = unit.unit_data(slot18).unit_id
				slot19 = unit
				t.editor_name = unit.unit_data(slot18).name_id
				slot19 = unit
				slot19 = unit.mission_element(slot18)
				t.values = unit.mission_element(slot18).new_save_values(slot18)
				slot20 = t

				table.insert(slot18, elements)
			end

			scripts[script].elements = elements
			scripts[script].instances = {}
			slot15 = managers.world_instance

			for _, instance in ipairs(managers.world_instance.instance_data(slot14)) do
				if instance.script == script then
					slot19 = instance.name

					table.insert(slot17, scripts[script].instances)
				end
			end
		end
	end

	return scripts
end
function MissionLayer:do_spawn_unit(name, pos, rot)
	slot6 = self

	if not self.current_script(slot5) then
		slot7 = "You need to create a mission script first."

		managers.editor.output_warning(slot5, managers.editor)

		return 
	end

	slot7 = self
	slot7 = managers.editor
	slot7 = managers.editor.current_continent(slot6)

	if self._scripts[self.current_script(slot6)].continent ~= managers.editor.current_continent(slot6).name(slot6) then
		slot7 = "Can't create mission element because the current script doesn't belong to current continent."

		managers.editor.output_warning(slot5, managers.editor)

		return 
	end

	slot9 = rot

	return MissionLayer.super.do_spawn_unit(slot5, self, name, pos)
end
function MissionLayer:_on_unit_created(unit, ...)
	slot5 = unit

	MissionLayer.super._on_unit_created(slot3, self, ...)

	slot5 = self
	unit.mission_element_data(slot3).script = self.current_script(unit)

	return 
end
function MissionLayer:condition()
	slot3 = self

	return MissionLayer.super.condition(slot2) or self._editing_mission_element
end
function MissionLayer:select_unit_ray_authorised(ray)
	slot5 = ray.unit

	return self.authorised_unit_type(slot3, self)
end
function MissionLayer:select_unit_authorised(unit)
	if unit then
		slot5 = ray.unit
		slot2 = self.authorised_unit_type(slot3, self)
	end

	return slot2
end
function MissionLayer:adding_to_mission()
	local vc = self._editor_data.virtual_controller
	slot4 = vc
	slot7 = "add_on_executed"

	if not vc.down(slot3, Idstring(slot6)) then
		slot4 = vc
		slot7 = "add_trigger"

		if not vc.down(slot3, Idstring(slot6)) then
			slot4 = vc
			slot7 = "remove_connection"

			if not vc.down(slot3, Idstring(slot6)) then
				slot4 = vc
				slot7 = "select_action_with_unit"
				slot2 = vc.down(slot3, Idstring(slot6))
			end
		end
	end

	return slot2
end
function MissionLayer:set_select_unit(unit, ...)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.mission_element_data(slot3).script then
			slot5 = self

			if unit.mission_element_data(slot3).script ~= self.current_script(unit) then
				return 
			end
		end
	end

	slot5 = unit

	if not self._add_on_executed(slot3, self) then
		slot5 = unit

		MissionLayer.super.set_select_unit(slot3, self, ...)
	end

	if self._list_flow then
		slot4 = self._list_flow

		if self._list_flow.visible(slot3) then
			slot5 = self._selected_unit

			self._list_flow.on_unit_selected(slot3, self._list_flow)
		end
	end

	return 
end
function MissionLayer:_add_on_executed(unit)
	slot4 = unit

	if not alive(slot3) then
		slot4 = self

		if self.adding_to_mission(slot3) then
			return true
		end

		return false
	end

	if self._selected_unit then
		slot4 = self

		if self.adding_to_mission(slot3) and unit ~= self._selected_unit then
			local vc = self._editor_data.virtual_controller
			slot5 = vc
			slot8 = "add_on_executed"

			if vc.down(slot4, Idstring(slot7)) then
				slot5 = self._selected_unit
				slot6 = unit

				self._selected_unit.mission_element(slot4).add_on_executed(slot4, self._selected_unit.mission_element(slot4))

				slot5 = self

				if self.shift(slot4) then
					slot5 = self._selected_units

					for _, u in ipairs(slot4) do
						if u ~= self._selected_unit and u ~= unit then
							slot10 = u
							slot11 = unit

							u.mission_element(slot9).add_on_executed(slot9, u.mission_element(slot9))
						end
					end
				end

				return true
			end
		end
	end

	return false
end
function MissionLayer:delete_unit(del_unit)
	if not self._editing_mission_element then
		slot4 = del_unit

		if del_unit.mission_element(slot3) then
			slot4 = del_unit

			if del_unit.mission_element(slot3).on_world_deleted then
				slot4 = del_unit
				slot4 = del_unit.mission_element(slot3)

				del_unit.mission_element(slot3).on_world_deleted(slot3)
			end
		end

		slot4 = del_unit
		slot5 = self._created_units

		del_unit.mission_element(slot3).delete_unit(slot3, del_unit.mission_element(slot3))

		slot4 = del_unit
		slot4 = del_unit.mission_element(slot3)

		del_unit.mission_element(slot3).clear(slot3)

		slot5 = del_unit

		MissionLayer.super.delete_unit(slot3, self)
	end

	if self._list_flow then
		slot5 = self._selected_unit

		self._list_flow.on_unit_selected(slot3, self._list_flow)
	end

	return 
end
function MissionLayer:refresh_list_flow()
	if self._list_flow then
		slot3 = self._list_flow

		if self._list_flow.visible(slot2) then
			slot4 = self._selected_unit

			self._list_flow.on_unit_selected(slot2, self._list_flow)
		end
	end

	return 
end
function MissionLayer:clone_edited_values(unit, source)
	slot7 = source

	MissionLayer.super.clone_edited_values(slot4, self, unit)

	slot5 = unit
	slot6 = source
	slot6 = source.name(unit.name(slot4))

	if unit.name(slot4).s(slot4) ~= source.name(unit.name(slot4)).s(unit.name(slot4)) then
		return 
	end

	slot7 = source

	for name, value in pairs(source.mission_element_data(slot6)) do
		slot10 = value

		if CoreClass.type_name(slot9) == "table" then
			slot10 = value
			value = CoreTable.deep_clone(slot9)
		end

		slot10 = unit
		unit.mission_element_data(slot9)[name] = value
	end

	slot5 = unit
	slot5 = unit.mission_element(slot4)
	slot9 = self._created_units

	unit.mission_element(slot4).clone_data(slot4, self._units_as_pairs(slot7, self))

	return 
end
function MissionLayer:hide_all()
	slot3 = self._created_units

	for _, unit in ipairs(slot2) do
		slot9 = self

		if unit.mission_element_data(slot7).script == self.current_script(unit) then
			slot10 = false

			managers.editor.set_unit_visible(slot7, managers.editor, unit)
		end
	end

	slot3 = self

	self.clear_selected_units(slot2)

	slot3 = self

	self.update_unit_settings(slot2)

	return 
end
function MissionLayer:set_enabled(enabled)
	self._layer_enabled = enabled
	slot4 = self._created_units

	for _, unit in ipairs(slot3) do
		if enabled then
			slot10 = self

			if unit.mission_element_data(slot8).script == self.current_script(unit) then
				slot9 = unit
				slot9 = unit.mission_element(slot8)

				unit.mission_element(slot8).set_enabled(slot8)

				slot10 = true

				unit.set_enabled(slot8, unit)

				slot9 = unit

				unit.anim_play(slot8)
			end
		else
			slot9 = unit
			slot9 = unit.mission_element(slot8)

			unit.mission_element(slot8).set_disabled(slot8)

			slot10 = false

			unit.set_enabled(slot8, unit)
		end
	end

	return true
end
function MissionLayer:widget_affect_object()
	slot3 = self
	local object = MissionLayer.super.widget_affect_object(slot2)

	if self._editing_mission_element then
		slot4 = self._selected_unit

		if alive(slot3) then
			slot4 = self._selected_unit
			slot4 = self._selected_unit.mission_element(slot3)

			if not self._selected_unit.mission_element(slot3).widget_affect_object(slot3) then
			end
		end
	end

	return object
end
function MissionLayer:use_widget_position(pos)
	if self._editing_mission_element then
		slot4 = self._selected_unit

		if alive(slot3) then
			slot4 = self._selected_unit
			slot5 = pos

			if self._selected_unit.mission_element(slot3).use_widget_position(slot3, self._selected_unit.mission_element(slot3)) then
				return 
			end
		end
	end

	slot5 = pos

	MissionLayer.super.use_widget_position(slot3, self)

	return 
end
function MissionLayer:_units_as_pairs(units)
	local t = {}
	slot5 = units

	for _, unit in ipairs(slot4) do
		slot10 = unit
		t[unit.unit_data(slot9).unit_id] = unit
	end

	return t
end
function MissionLayer:_on_reference_unit_unselected(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.mission_element(slot3).on_unselected ~= nil then
			slot4 = unit
			slot4 = unit.mission_element(slot3)

			unit.mission_element(slot3).on_unselected(slot3)
		end
	end

	return 
end
function MissionLayer:update(time, rel_time)
	slot7 = rel_time

	MissionLayer.super.update(slot4, self, time)

	local update_selected_on_brush = Draw.brush(slot4)
	slot6 = update_selected_on_brush
	slot12 = 1

	update_selected_on_brush.set_color(Draw, Color(slot8, 0.25, 0, 0))

	local unit_disabled = Draw.brush(Draw)
	slot13 = 0

	unit_disabled.set_color(Draw, Color(0.25, 0.15, 1, 0))

	local all_units = self._created_units_pairs
	slot12 = self
	slot9 = self._scripts[self.current_script(1)].continent
	slot9 = "locked"
	local current_continent_locked = managers.editor.continent(unit_disabled, managers.editor).value(unit_disabled, managers.editor.continent(unit_disabled, managers.editor))
	local current_script = self.current_script(managers.editor.continent(unit_disabled, managers.editor))
	slot10 = managers.editor
	local cam_pos = managers.editor.camera(self).position(self)
	slot11 = managers.editor
	local cam_up = managers.editor.camera_rotation(managers.editor.camera(self)).z(managers.editor.camera(self))
	slot12 = managers.editor
	slot12 = managers.editor.camera_rotation(managers.editor.camera_rotation(managers.editor.camera(self)))
	local cam_right = managers.editor.camera_rotation(managers.editor.camera_rotation(managers.editor.camera(self))).x(managers.editor.camera_rotation(managers.editor.camera(self)))
	local lod_draw_distance = 100000
	lod_draw_distance = lod_draw_distance * lod_draw_distance

	if not self._selected_unit and self._only_draw_selected_connections then
		return 
	end

	slot14 = self._created_units

	for _, unit in ipairs(slot13) do
		slot19 = unit

		if (unit.mission_element_data(slot18).script == current_script and not current_continent_locked) or self._show_all_scripts then
			slot21 = unit
			slot19 = unit.position(slot20)
			slot20 = cam_pos
			local distance = mvector3.distance_sq(slot18, slot19)
			slot20 = unit
			unit.mission_element(slot19)._distance_to_camera = distance
			slot20 = unit
			slot20 = unit.mission_element(slot19)
			local update_selected_on = unit.mission_element(slot19).update_selected_on(slot19)

			if update_selected_on then
				slot22 = unit

				update_selected_on_brush.unit(slot20, update_selected_on_brush)
			end

			local update_selected = self._update_all or update_selected_on
			local selected_unit = unit == self._selected_unit

			if update_selected or selected_unit then
				slot23 = unit
				slot27 = all_units

				unit.mission_element(slot22).update_selected(slot22, unit.mission_element(slot22), time, rel_time, self._only_draw_selected_connections and self._selected_unit)
			end

			slot23 = unit
			slot27 = all_units

			unit.mission_element(slot22).draw_links(slot22, unit.mission_element(slot22), time, rel_time, self._only_draw_selected_connections and self._selected_unit)

			if selected_unit then
				slot23 = unit
				slot26 = self._only_draw_selected_connections and self._selected_unit

				unit.mission_element(slot22).draw_links_selected(slot22, unit.mission_element(slot22), time, rel_time)

				if self._editing_mission_element then
					slot23 = unit

					if unit.mission_element(slot22).base_update_editing then
						slot23 = unit
						slot26 = self._current_pos

						unit.mission_element(slot22).base_update_editing(slot22, unit.mission_element(slot22), time, rel_time)
					end

					slot23 = unit

					if unit.mission_element(slot22).update_editing then
						slot23 = unit
						slot26 = self._current_pos

						unit.mission_element(slot22).update_editing(slot22, unit.mission_element(slot22), time, rel_time)
					end
				end
			end

			slot23 = unit

			if not unit.mission_element_data(slot22).enabled then
				slot24 = unit

				unit_disabled.unit(slot22, unit_disabled)
			end

			if distance < 2250000 then

				-- Decompilation error in this vicinity:
				local a = (distance < 1000000 and 1) or (2250000 - distance) / 250000 / 5
				slot26 = color

				self._name_brush.set_color(slot24, self._name_brush)

				local offset = nil
				slot26 = unit

				if unit.mission_element(self._name_brush)._icon_ws then
					slot26 = unit
					offset = cam_up * unit.bounding_sphere_radius(slot25)
				else
					slot27 = 0
					slot30 = unit
					offset = Vector3(slot25, 0, unit.bounding_sphere_radius(slot29))
				end

				slot32 = unit
				slot30 = unit.unit_data(slot31).name_id
				slot30 = -cam_up

				self._name_brush.center_text(slot25, self._name_brush, unit.position(slot28) + offset, utf8.from_latin1(unit), cam_right)
			end
		end
	end

	if self._only_draw_selected_connections then
		slot14 = self._selected_units

		for _, su in ipairs(slot13) do
			slot19 = su
			slot21 = dt

			su.mission_element(slot18).draw_link_on_executed(slot18, su.mission_element(slot18), t)
		end
	end

	return 
end
function MissionLayer:_cloning_done()
	slot3 = self._selected_unit

	if alive(slot2) then
		slot3 = self._selected_unit
		slot3 = self._selected_unit.mission_element(slot2)

		self._selected_unit.mission_element(slot2).destroy_panel(slot2)

		slot3 = self

		self.update_unit_settings(slot2)
	end

	return 
end
function MissionLayer:update_unit_settings()

	-- Decompilation error in this vicinity:
	slot3 = self

	MissionLayer.super.update_unit_settings(slot2)

	slot4 = false

	self.set_current_panel_visible(slot2, self)

	slot4 = (self._selected_unit and true) or false

	self._element_toolbar.set_enabled(slot2, self._element_toolbar)

	slot5 = self._editing_mission_element

	self._element_toolbar.set_tool_state(slot2, self._element_toolbar, "EDIT_ELEMENT")

	slot5 = false

	self._element_toolbar.set_tool_enabled(slot2, self._element_toolbar, "EDIT_ELEMENT")

	slot5 = false

	self._element_toolbar.set_tool_enabled(slot2, self._element_toolbar, "TEST_ELEMENT")

	slot5 = false

	self._element_toolbar.set_tool_enabled(slot2, self._element_toolbar, "STOP_ELEMENT")

	slot3 = self._element_toolbar
	slot1 = self._element_toolbar.set_tool_state
	slot4 = "UPDATE_SELECTED_ON"
	slot3 = self

	self.do_layout(slot2)

	return 
end
function MissionLayer:set_current_panel_visible(visible)
	if self._current_panel then
		slot4 = self._current_panel
	end

	return 
end
function MissionLayer:show_timeline()
	slot3 = self

	if self.ctrl(slot2) then
		return 
	end

	if self._selected_unit then
		slot3 = self._selected_unit
		slot3 = self._selected_unit.mission_element(slot2)

		self._selected_unit.mission_element(slot2).on_timeline(slot2)
	end

	return 
end
function MissionLayer:test_element()
	slot3 = self._selected_unit
	slot3 = self._selected_unit.mission_element(slot2)

	self._selected_unit.mission_element(slot2).test_element(slot2)

	return 
end
function MissionLayer:stop_test_element()
	slot3 = self._selected_unit
	slot3 = self._selected_unit.mission_element(slot2)

	self._selected_unit.mission_element(slot2).stop_test_element(slot2)

	return 
end
function MissionLayer:toggle_update_selected_on()
	slot3 = self._selected_unit
	slot3 = self._selected_unit.mission_element(slot2)
	slot7 = "UPDATE_SELECTED_ON"

	self._selected_unit.mission_element(slot2).set_update_selected_on(slot2, self._element_toolbar.tool_state(slot5, self._element_toolbar))

	return 
end
function MissionLayer:_on_gui_mission_element_help()
	slot6 = self._selected_unit
	slot6 = self._selected_unit.name(slot5)
	local short_name = self._stripped_unit_name(slot2, self._selected_unit.name(slot5).s(slot5))
	slot5 = "http://serben01/wiki/index.php/" .. short_name

	EWS.launch_url(self, EWS)

	return 
end
function MissionLayer:toolbar_toggle(data, event)
	slot6 = event

	CoreEditorUtils.toolbar_toggle(slot4, data)

	if data.value == "_editing_mission_element" then
		if self[data.value] then
			slot5 = self._selected_unit
			slot5 = self._selected_unit.mission_element(slot4)

			self._selected_unit.mission_element(slot4).begin_editing(slot4)
		else
			slot5 = self._selected_unit
			slot5 = self._selected_unit.mission_element(slot4)

			self._selected_unit.mission_element(slot4).end_editing(slot4)
		end
	end

	return 
end
function MissionLayer:toolbar_toggle_trg(data)
	if data.value == "_editing_mission_element" then
		slot4 = self._selected_unit
	end

	slot4 = data

	CoreEditorUtils.toolbar_toggle_trg(slot3)

	if data.value == "_editing_mission_element" then
		if self[data.value] then
			slot4 = self._selected_unit
			slot4 = self._selected_unit.mission_element(slot3)

			self._selected_unit.mission_element(slot3).begin_editing(slot3)
		else
			slot4 = self._selected_unit
			slot4 = self._selected_unit.mission_element(slot3)

			self._selected_unit.mission_element(slot3).end_editing(slot3)
		end

		slot4 = self

		self.clear_triggers(slot3)

		slot4 = self

		self.add_triggers(slot3)
	end

	return 
end
function MissionLayer:missionelement_panel()
	return self._missionelement_panel
end
function MissionLayer:missionelement_sizer()
	return self._missionelement_sizer
end
function MissionLayer:do_layout()
	slot3 = self._missionelement_panel

	self._missionelement_panel.layout(slot2)

	slot3 = self._ews_panel

	self._ews_panel.refresh(slot2)

	return 
end
function MissionLayer:build_panel(notebook)
	slot6 = {
		units_noteboook_proportion = 0,
		units_notebook_min_size = Vector3(slot8, -1, 160)
	}
	slot11 = 0

	MissionLayer.super.build_panel(slot3, self, notebook)

	slot5 = "MissionLayer:build_panel"

	cat_print(slot3, "editor")

	slot4 = self

	self._build_scripts(slot3)

	slot5 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(slot3, EWS)
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._element_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot10 = "world_editor\\he_edit_element_16x16.png"

	self._element_toolbar.add_check_tool(EWS, self._element_toolbar, "EDIT_ELEMENT", "Edit Element [insert]", CoreEws.image_path(-1))

	slot7 = self._editing_mission_element

	self._element_toolbar.set_tool_state(EWS, self._element_toolbar, "EDIT_ELEMENT")

	slot12 = "toolbar_toggle"
	slot9 = {
		value = "_editing_mission_element",
		toolbar = "_element_toolbar",
		class = self
	}

	self._element_toolbar.connect(EWS, self._element_toolbar, "EDIT_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback("Edit Element [insert]", self, self))

	slot4 = callback(self._element_toolbar, self, self, "toolbar_toggle_trg")
	self._ews_triggers.insert = slot4
	slot10 = "world_editor\\he_timeline_16x16.png"

	self._element_toolbar.add_tool(slot4, self._element_toolbar, "TIMELINE", "Timeline", CoreEws.image_path({
		value = "_editing_mission_element",
		toolbar = "_element_toolbar",
		id = "EDIT_ELEMENT",
		class = self
	}))

	slot12 = "show_timeline"

	self._element_toolbar.connect(slot4, self._element_toolbar, "TIMELINE", "EVT_COMMAND_MENU_SELECTED", callback("Timeline", self, self))

	slot10 = "world_editor\\he_test_element_16x16.png"

	self._element_toolbar.add_tool(slot4, self._element_toolbar, "TEST_ELEMENT", "Test element", CoreEws.image_path(nil))

	slot12 = "test_element"

	self._element_toolbar.connect(slot4, self._element_toolbar, "TEST_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback("Test Element", self, self))

	slot10 = "world_editor\\he_stop_element_16x16.png"

	self._element_toolbar.add_tool(slot4, self._element_toolbar, "STOP_ELEMENT", "Stop element", CoreEws.image_path(nil))

	slot12 = "stop_test_element"

	self._element_toolbar.connect(slot4, self._element_toolbar, "STOP_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback("Stop Element", self, self))

	slot10 = "world_editor\\he_update_selected_on_16x16.png"

	self._element_toolbar.add_check_tool(slot4, self._element_toolbar, "UPDATE_SELECTED_ON", "Turns on/off update off drawing even if not selected", CoreEws.image_path(nil))

	slot12 = "toggle_update_selected_on"

	self._element_toolbar.connect(slot4, self._element_toolbar, "UPDATE_SELECTED_ON", "EVT_COMMAND_MENU_SELECTED", callback("Turns on/off update off drawing even if not selected", self, self))

	slot5 = self._element_toolbar

	self._element_toolbar.add_separator(slot4)

	slot10 = "help_16x16.png"

	self._element_toolbar.add_tool(slot4, self._element_toolbar, "HELP", "Help", CoreEws.image_path(nil))

	slot12 = "_on_gui_mission_element_help"
	slot9 = nil

	self._element_toolbar.connect(slot4, self._element_toolbar, "HELP", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._element_toolbar

	self._element_toolbar.realize(slot4)

	slot9 = "EXPAND,BOTTOM"

	btn_sizer.add(slot4, btn_sizer, self._element_toolbar, 1, 1)

	slot9 = "EXPAND"

	self._sizer.add(slot4, self._sizer, btn_sizer, 0, 0)

	slot8 = "TAB_TRAVERSAL"
	self._missionelement_panel = EWS.Panel(slot4, EWS, self._ews_panel, "")
	slot6 = "VERTICAL"
	self._missionelement_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._missionelement_sizer

	self._missionelement_panel.set_sizer(slot4, self._missionelement_panel)

	slot9 = "EXPAND"

	self._sizer.add(slot4, self._sizer, self._missionelement_panel, 1, 0)

	return self._ews_panel
end
function MissionLayer:_build_scripts()
	slot6 = "Scripts"
	local sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "HORIZONTAL")
	slot7 = "TB_FLAT,TB_NODIVIDER"
	self._scripts_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot9 = "toolbar\\new_16x16.png"

	self._scripts_toolbar.add_tool(EWS, self._scripts_toolbar, "CREATE_SCRIPT", "Create a new script", CoreEws.image_path(slot8))

	slot11 = "_on_create_script"

	self._scripts_toolbar.connect(EWS, self._scripts_toolbar, "CREATE_SCRIPT", "EVT_COMMAND_MENU_SELECTED", callback("Create a new script", self, self))

	slot9 = "toolbar\\delete_16x16.png"

	self._scripts_toolbar.add_tool(EWS, self._scripts_toolbar, "DELETE_SCRIPT", "Delete current script", CoreEws.image_path(nil))

	slot11 = "_on_delete_script"

	self._scripts_toolbar.connect(EWS, self._scripts_toolbar, "DELETE_SCRIPT", "EVT_COMMAND_MENU_SELECTED", callback("Delete current script", self, self))

	slot9 = "toolbar\\options_16x16.png"

	self._scripts_toolbar.add_tool(EWS, self._scripts_toolbar, "RENAME_SCRIPT", "Rename current script", CoreEws.image_path(nil))

	slot11 = "_on_rename_script"

	self._scripts_toolbar.connect(EWS, self._scripts_toolbar, "RENAME_SCRIPT", "EVT_COMMAND_MENU_SELECTED", callback("Rename current script", self, self))

	slot4 = self._scripts_toolbar

	self._scripts_toolbar.add_separator(EWS)

	slot9 = "world_editor\\script_activate_on_parsed_16x16.png"

	self._scripts_toolbar.add_check_tool(EWS, self._scripts_toolbar, "ACTIVATE_ON_PARSED", "Set if this mission should be activated on parsed", CoreEws.image_path(nil))

	slot6 = false

	self._scripts_toolbar.set_tool_state(EWS, self._scripts_toolbar, "ACTIVATE_ON_PARSED")

	slot11 = "_on_activate_on_parsed"
	slot8 = nil

	self._scripts_toolbar.connect(EWS, self._scripts_toolbar, "ACTIVATE_ON_PARSED", "EVT_COMMAND_MENU_SELECTED", callback("Set if this mission should be activated on parsed", self, self))

	slot4 = self._scripts_toolbar

	self._scripts_toolbar.realize(EWS)

	slot8 = "EXPAND"

	sizer.add(EWS, sizer, self._scripts_toolbar, 0, 0)

	slot8 = "CB_DROPDOWN,CB_READONLY"
	self._scripts_combobox = EWS.ComboBox(EWS, EWS, self._ews_panel, "", "")
	slot10 = "_on_set_script"
	slot7 = nil

	self._scripts_combobox.connect(EWS, self._scripts_combobox, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))
	sizer.add(EWS, sizer, self._scripts_combobox, 1, 0)

	slot7 = "TB_FLAT,TB_NODIVIDER"
	self._scripts_right_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot9 = "world_editor\\script_simulate_with_current_16x16.png"

	self._scripts_right_toolbar.add_check_tool(EWS, self._scripts_right_toolbar, "SIMULATE_WITH_CURRENT_SCRIPT", "If used, run simulation will start the current script", CoreEws.image_path("EXPAND"))

	slot6 = self._simulate_with_current_script

	self._scripts_right_toolbar.set_tool_state(EWS, self._scripts_right_toolbar, "SIMULATE_WITH_CURRENT_SCRIPT")

	slot11 = "toolbar_toggle"
	slot8 = {
		value = "_simulate_with_current_script",
		toolbar = "_scripts_right_toolbar",
		class = self
	}

	self._scripts_right_toolbar.connect(EWS, self._scripts_right_toolbar, "SIMULATE_WITH_CURRENT_SCRIPT", "EVT_COMMAND_MENU_SELECTED", callback("If used, run simulation will start the current script", nil, CoreEditorUtils))

	slot4 = self._scripts_right_toolbar

	self._scripts_right_toolbar.realize(EWS)

	slot8 = "EXPAND"

	sizer.add(EWS, sizer, self._scripts_right_toolbar, 0, 0)

	slot8 = "EXPAND"

	self._sizer.add(EWS, self._sizer, sizer, 0, 0)

	return 
end
function MissionLayer:add_btns_to_toolbar(...)
	slot3 = self

	MissionLayer.super.add_btns_to_toolbar(slot2, ...)

	slot3 = self._btn_toolbar

	self._btn_toolbar.add_separator(slot2)

	slot8 = "world_editor\\layer_hubs_only_draw_selected.png"

	self._btn_toolbar.add_check_tool(slot2, self._btn_toolbar, "DRAW_SELECTED_CONNECTIONS_ONLY", "Only draw selected connections", CoreEws.image_path(slot7))

	slot5 = self._only_draw_selected_connections

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, "DRAW_SELECTED_CONNECTIONS_ONLY")

	slot10 = "toolbar_toggle"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "DRAW_SELECTED_CONNECTIONS_ONLY", "EVT_COMMAND_MENU_SELECTED", callback("Only draw selected connections", nil, CoreEditorUtils))

	slot8 = "world_editor\\layer_hubs_update_selected_all.png"

	self._btn_toolbar.add_check_tool(slot2, self._btn_toolbar, "UPDATE_SELECTED_ALL", "Draws all element as if they where selected", CoreEws.image_path({
		value = "_only_draw_selected_connections",
		toolbar = "_btn_toolbar",
		class = self
	}))

	slot5 = self._update_all

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, "UPDATE_SELECTED_ALL")

	slot10 = "toolbar_toggle"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "UPDATE_SELECTED_ALL", "EVT_COMMAND_MENU_SELECTED", callback("Draws all element as if they where selected", nil, CoreEditorUtils))

	slot8 = "world_editor\\mission_persistent_debug_16x16.png"
	slot7 = "Turns on screen debug information on/off"

	self._btn_toolbar.add_check_tool(slot2, self._btn_toolbar, "PERSISTENT_DEBUG", "Turns on screen debug information on/off", CoreEws.image_path({
		value = "_update_all",
		toolbar = "_btn_toolbar",
		class = self
	}))

	slot4 = "PERSISTENT_DEBUG"

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, managers.mission.persistent_debug_enabled(CoreEws.image_path()))

	slot10 = "toggle_persistent_debug"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "PERSISTENT_DEBUG", "EVT_COMMAND_MENU_SELECTED", callback(managers.mission, self, self))

	slot8 = "toolbar\\find_16x16.png"

	self._btn_toolbar.add_check_tool(slot2, self._btn_toolbar, "VISUALIZE_FLOW", "Visualize flow", CoreEws.image_path({
		toolbar = "_btn_toolbar"
	}))

	slot5 = self._visualize_flow

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, "VISUALIZE_FLOW")

	slot10 = "toolbar_toggle"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "VISUALIZE_FLOW", "EVT_COMMAND_MENU_SELECTED", callback("Visualize flow", nil, CoreEditorUtils))

	slot8 = "toolbar\\color_16x16.png"

	self._btn_toolbar.add_check_tool(slot2, self._btn_toolbar, "USE_COLORED_LINKS", "Use colored links", CoreEws.image_path({
		value = "_visualize_flow",
		toolbar = "_btn_toolbar",
		class = self
	}))

	slot5 = self._use_colored_links

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, "USE_COLORED_LINKS")

	slot10 = "toolbar_toggle"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "USE_COLORED_LINKS", "EVT_COMMAND_MENU_SELECTED", callback("Use colored links", nil, CoreEditorUtils))

	slot3 = self._btn_toolbar

	self._btn_toolbar.add_separator(slot2)

	slot8 = "world_editor\\he_timeline_16x16.png"

	self._btn_toolbar.add_tool(slot2, self._btn_toolbar, "SHOW_LIST_FLOW", "Opens mission flow dialog", CoreEws.image_path({
		value = "_use_colored_links",
		toolbar = "_btn_toolbar",
		class = self
	}))

	slot10 = "_show_list_flow"
	slot7 = {}

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "SHOW_LIST_FLOW", "EVT_COMMAND_MENU_SELECTED", callback("Opens mission flow dialog", self, self))

	return 
end
function MissionLayer:toggle_persistent_debug(params)
	slot4 = managers.mission
	slot8 = "PERSISTENT_DEBUG"

	managers.mission.set_persistent_debug_enabled(slot3, self._btn_toolbar.tool_state(slot6, self._btn_toolbar))

	return 
end
function MissionLayer:_show_list_flow()
	if not self._list_flow then
		slot3 = _G.MissionElementListFlow
		slot1 = _G.MissionElementListFlow.new(slot2)
	end

	self._list_flow = slot1
	slot3 = self._list_flow

	if not self._list_flow.visible(slot2) then
		slot4 = true

		self._list_flow.set_visible(slot2, self._list_flow)
	end

	slot4 = self._selected_unit

	self._list_flow.on_unit_selected(slot2, self._list_flow)

	return 
end
function MissionLayer:_on_activate_on_parsed()
	slot4 = self
	slot5 = "ACTIVATE_ON_PARSED"
	self._scripts[self.current_script(slot3)].activate_on_parsed = self._scripts_toolbar.tool_state(slot3, self._scripts_toolbar)

	return 
end
function MissionLayer:_on_create_script()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for new script:", "Create new script", "", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		if self._scripts[name] then
			slot4 = self

			self._on_create_script(slot3)
		else
			slot5 = name

			self._create_script(slot3, self)
		end
	end

	return 
end
function MissionLayer:_on_set_script()
	slot3 = self

	if not self.current_script(slot2) then
		return 
	end

	slot7 = self
	slot4 = self._scripts[self.current_script(slot6)].continent
	slot4 = "locked"

	if managers.editor.continent(slot2, managers.editor).value(slot2, managers.editor.continent(slot2, managers.editor)) then
		return 
	end

	slot3 = self

	self.clear_selected_units(slot2)

	slot4 = self._show_all_scripts

	self.set_show_all_scripts(slot2, self)

	slot3 = self

	self._set_toolbar_settings(slot2)

	return 
end
function MissionLayer:_populate_scripts_combobox()
	slot3 = self._scripts_combobox

	self._scripts_combobox.clear(slot2)

	slot3 = self._scripts

	for name, _ in pairs(slot2) do
		slot9 = name

		self._scripts_combobox.append(slot7, self._scripts_combobox)
	end

	return 
end
function MissionLayer:_clear_scripts_combobox()
	slot3 = self._scripts_combobox

	self._scripts_combobox.clear(slot2)

	return 
end
function MissionLayer:_append_scripts_combobox(name)
	slot5 = name

	self._scripts_combobox.append(slot3, self._scripts_combobox)

	return 
end
function MissionLayer:_set_scripts_combobox(name)
	if self._scripts[name] then
	end

	if not name then
		slot5 = true
		name = self._get_script_combobox_name(slot3, self)
	end

	if not name then
		slot4 = self
		name = self._get_script_combobox_name(slot3)
	end

	slot5 = name

	self._scripts_combobox.set_value(slot3, self._scripts_combobox)

	return 
end
function MissionLayer:_get_script_combobox_name(continent)
	slot4 = self._scripts

	for name, script in pairs(slot3) do
	end

	return 
end
function MissionLayer:_set_toolbar_settings()
	slot4 = self
	local script = self._scripts[self.current_script(slot3)]
	slot6 = script.activate_on_parsed

	self._scripts_toolbar.set_tool_state(slot3, self._scripts_toolbar, "ACTIVATE_ON_PARSED")

	return 
end
function MissionLayer:current_script()

	-- Decompilation error in this vicinity:
	slot3 = self._scripts_combobox

	if self._scripts_combobox.get_value(slot2) ~= "" then
		slot3 = self._scripts_combobox

		return self._scripts_combobox.get_value(slot2)
	else
		return nil
	end

	return 
end
function MissionLayer:scripts_by_continent(continent)
	local scripts = {}
	slot5 = self._scripts

	for name, script in pairs(slot4) do
		if script.continent == continent then
			slot11 = name

			table.insert(slot9, scripts)
		end
	end

	return scripts
end
function MissionLayer:_reset_scripts()
	slot3 = self

	self._clear_scripts_combobox(slot2)

	self._scripts = {}
	slot5 = {
		activate_on_parsed = true
	}

	self._create_script(slot2, self, self._default_script_name)

	return 
end
function MissionLayer:_create_script(name, values)
	if not name then
		return 
	end

	values = values or {}
	values.activate_on_parsed = values.activate_on_parsed or (values.activate_on_parsed == nil and false)
	slot5 = managers.editor
	slot5 = managers.editor.current_continent(slot4)
	values.continent = managers.editor.current_continent(slot4).name(slot4)
	self._scripts[name] = values
	slot6 = name

	self._append_scripts_combobox(slot4, self)

	slot6 = name

	self._set_scripts_combobox(slot4, self)

	slot5 = self

	self._on_set_script(slot4)

	return 
end
function MissionLayer:set_script(name)
	slot5 = name

	self._set_scripts_combobox(slot3, self)

	slot4 = self

	self._on_set_script(slot3)

	return 
end
function MissionLayer:_on_delete_script()
	slot3 = self

	if not self.current_script(slot2) then
		return 
	end

	slot8 = self
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Delete script " .. self.current_script(slot7) .. "? All units(elements) in the script will be deleted.", "Mission", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = self
	slot7 = self

	self._delete_script(slot3, self.current_script(slot6))

	return 
end
function MissionLayer:_delete_script(name)
	slot5 = managers.editor
	slot5 = managers.editor.current_continent(slot4)

	if self._scripts[name].continent ~= managers.editor.current_continent(slot4).name(slot4) then
		slot8 = "CANCEL,ICON_ERROR"
		slot13 = 0

		EWS.message_box(slot3, EWS, Global.frame_panel, "Can't delete script " .. name .. ", it does not belong to current continent.", "Mission", Vector3(slot10, -1, -1))

		return 
	end

	slot6 = self._created_units

	for _, unit in ipairs(CoreTable.clone(slot5)) do
		slot9 = unit

		if unit.mission_element_data(slot8).script == name then
			slot10 = unit

			self.delete_unit(slot8, self)
		end
	end

	self._scripts[name] = nil
	slot4 = self

	self._populate_scripts_combobox(nil)

	slot4 = self

	self._set_scripts_combobox(nil)

	slot4 = self

	self._on_set_script(nil)

	return 
end
function MissionLayer:_on_rename_script()
	slot3 = self

	if not self.current_script(slot2) then
		return 
	end

	slot3 = self
	local name = self.current_script(slot2)
	slot5 = managers.editor
	slot5 = managers.editor.current_continent(slot4)

	if self._scripts[name].continent ~= managers.editor.current_continent(slot4).name(slot4) then
		slot8 = "CANCEL,ICON_ERROR"
		slot13 = 0

		EWS.message_box(slot3, EWS, Global.frame_panel, "Can't rename script " .. name .. ", it does not belong to current continent.", "Mission", Vector3(slot10, -1, -1))

		return 
	end

	slot13 = 0
	slot10 = true
	local new_name = EWS.get_text_from_user(slot3, EWS, Global.frame_panel, "Enter new name for script " .. name .. ":", "Rename script", "", Vector3(slot10, -1, -1))

	if new_name and new_name ~= "" then
		if self._scripts[new_name] then
			slot5 = self

			self._on_rename_script(slot4)
		else
			slot7 = new_name

			self._rename_script(slot4, self, name)
		end
	end

	return 
end
function MissionLayer:_rename_script(name, new_name)
	slot5 = self._created_units

	for _, unit in ipairs(slot4) do
		slot10 = unit

		if unit.mission_element_data(slot9).script == name then
			slot10 = unit
			unit.mission_element_data(slot9).script = new_name
		end
	end

	local values = self._scripts[name]
	self._scripts[name] = nil
	self._scripts[new_name] = values
	slot6 = self

	self._populate_scripts_combobox(nil)

	slot7 = new_name

	self._set_scripts_combobox(nil, self)

	slot6 = self

	self._on_set_script(nil)

	return 
end
function MissionLayer:_set_script(name)
	if not self._scripts[name] then
		return 
	end

	return 
end
function MissionLayer:_hide_all_scripts()
	slot3 = self._scripts

	for name, _ in pairs(slot2) do
		slot9 = name

		self._hide_script(slot7, self)
	end

	return 
end
function MissionLayer:_show_all_mission_scripts()
	slot3 = self._scripts

	for name, _ in pairs(slot2) do
		slot9 = name

		self._show_script(slot7, self)
	end

	return 
end
function MissionLayer:_hide_script(name)
	if not self._scripts[name] then
		return 
	end

	slot4 = self._created_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.mission_element_data(slot8).script == name then
			slot10 = false

			unit.set_enabled(slot8, unit)

			slot9 = unit

			if unit.mission_element(slot8) then
				slot9 = unit
				slot9 = unit.mission_element(slot8)

				unit.mission_element(slot8).set_disabled(slot8)
			end
		end
	end

	return 
end
function MissionLayer:_show_script(name)
	if not self._scripts[name] then
		return 
	end

	slot4 = self._created_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.mission_element_data(slot8).script == name then
			slot9 = unit

			if unit.mission_element(slot8) then
				slot9 = unit
				slot9 = unit.mission_element(slot8)

				unit.mission_element(slot8).set_enabled(slot8)
			end

			slot10 = true

			unit.set_enabled(slot8, unit)

			slot9 = unit

			unit.anim_play(slot8)
		end
	end

	return 
end
function MissionLayer:script_names()
	local names = {}
	slot4 = self._scripts

	for name, _ in pairs(slot3) do
		slot10 = name

		table.insert(slot8, names)
	end

	return names
end
function MissionLayer:set_show_all_scripts(show_all_scripts)
	self._show_all_scripts = show_all_scripts

	if self._show_all_scripts then
		slot4 = self

		self._show_all_mission_scripts(slot3)
	else
		slot4 = self

		self._hide_all_scripts(slot3)

		slot4 = self
		slot7 = self

		self._show_script(slot3, self.current_script(slot6))
	end

	return 
end
function MissionLayer:show_all_scripts(show_all_scripts)
	return self._show_all_scripts
end
function MissionLayer:set_iconsize(size)
	Global.iconsize = size
	slot4 = self._created_units

	for _, unit in ipairs(slot3) do
		slot9 = unit
		slot10 = size

		unit.mission_element(slot8).set_iconsize(slot8, unit.mission_element(slot8))
	end

	return 
end
function MissionLayer:visualize_flow()
	return self._visualize_flow
end
function MissionLayer:use_colored_links()
	return self._use_colored_links
end
function MissionLayer:clear()
	slot3 = self._created_units

	for _, unit in ipairs(slot2) do
		slot8 = unit
		slot8 = unit.mission_element(slot7)

		unit.mission_element(slot7).clear(slot7)
	end

	self._editing_mission_element = false
	slot3 = self

	MissionLayer.super.clear(slot2)

	slot3 = self

	self._reset_scripts(slot2)

	slot3 = self

	self.update_unit_settings(slot2)

	if self._list_flow then
		slot4 = nil

		self._list_flow.on_unit_selected(slot2, self._list_flow)
	end

	return 
end
function MissionLayer:simulate_with_current_script()
	return self._simulate_with_current_script
end
function MissionLayer:get_unit_links(to_unit)
	local links = {
		executers = {},
		on_executed = {}
	}
	slot5 = self._created_units

	for _, unit in ipairs(slot4) do
		slot10 = unit
		slot13 = self._created_units_pairs

		unit.mission_element(slot9).get_links_to_unit(slot9, unit.mission_element(slot9), to_unit, links)
	end

	return links
end
function MissionLayer:activate(...)
	slot3 = self

	MissionLayer.super.activate(slot2, ...)

	if self._list_flow then
		slot4 = self._was_list_flow_visible

		self._list_flow.set_visible(slot2, self._list_flow)

		self._was_list_flow_visible = nil
	end

	return 
end
function MissionLayer:deactivate(...)
	slot3 = self

	MissionLayer.super.deactivate(slot2, ...)

	if self._list_flow then
		slot3 = self._list_flow
		self._was_list_flow_visible = self._list_flow.visible(slot2)
		slot4 = false

		self._list_flow.set_visible(slot2, self._list_flow)
	end

	return 
end
function MissionLayer:add_triggers()
	MissionLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "show_timeline"

	vc.add_trigger(self, vc, callback("show_element_timeline", self, self))

	local vc = self._editor_data.virtual_controller

	if self._editing_mission_element and self._selected_unit then
		slot5 = self._selected_unit
		slot6 = vc

		self._selected_unit.mission_element(slot4).base_add_triggers(slot4, self._selected_unit.mission_element(slot4))

		slot5 = self._selected_unit
		slot6 = vc

		self._selected_unit.mission_element(slot4).add_triggers(slot4, self._selected_unit.mission_element(slot4))

		return 
	end

	return 
end

return 
