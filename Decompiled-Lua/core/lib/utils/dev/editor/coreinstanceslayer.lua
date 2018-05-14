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
slot3 = "CoreInstancesLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreInput"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreWorldDefinition"

core.import(slot1, core)

if not InstancesLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

InstancesLayer = slot0
function InstancesLayer:init(owner)
	slot8 = "statics_layer"

	InstancesLayer.super.init(slot3, self, owner, "instances", {
		"nothing"
	})

	self._uses_continents = true
	self._stashed_instance_units = {}
	self._predefined_instances_file = "lib/utils/dev/editor/xml/predefined_instances"
	slot4 = self

	self._load_predefined_instances(slot3)

	slot4 = self

	self._create_overlay_gui(slot3)

	return 
end
function InstancesLayer:_load_predefined_instances()
	slot5 = self._predefined_instances_file

	if DB.has(slot2, DB, "xml") then
		slot5 = self._predefined_instances_file
		local file = DB.open(slot2, DB, "xml")
		slot4 = ScriptSerializer
		slot7 = file
		self._predefined_instances = ScriptSerializer.from_generic_xml(DB, file.read(slot6))
	end

	return 
end
function InstancesLayer:load(world_holder, offset)
	slot8 = offset

	world_holder.create_world(slot4, world_holder, "world", self._save_name)

	slot5 = self

	self._update_instances_listbox(slot4)

	slot5 = self

	self._update_overlay_gui(slot4)

	return 
end
function InstancesLayer:save(save_params)
	slot6 = managers.world_instance

	for _, data in ipairs(managers.world_instance.instance_save_data(slot5)) do
		local t = {
			entry = self._save_name,
			continent = data.continent,
			data = data
		}
		slot11 = t

		managers.editor.add_save_data(slot9, managers.editor)
	end

	return 
end
function InstancesLayer:clone_unit()
	slot3 = self

	if self.ctrl(slot2) then
		slot3 = self

		self.clone(slot2)
	end

	return 
end
function InstancesLayer:clone()
	if self._selected_instance then
		local data = self._selected_instance.data(slot2)
		slot6 = data.name
		local suggested_name = managers.world_instance.get_safe_name(self._selected_instance, managers.world_instance, nil)
		slot12 = data.predef

		self.add_instance(managers.world_instance, self, suggested_name, data.folder, data.index_size, data.script, data.position, data.rotation)
	end

	return 
end
function InstancesLayer:spawn_unit()
	self._wants_to_create = false

	if not self._grab then
		slot3 = self

		if not self.condition(slot2) then
			self._wants_to_create = true
			slot4 = self._unit_name

			self.do_spawn_unit(slot2, self)
		end
	end

	return 
end
function InstancesLayer:do_spawn_unit(name, pos, rot)
	return 
end
function InstancesLayer:_mouse_create_instance()
	if not self._grab then
		slot3 = self

		if not self.condition(slot2) and self._wants_to_create then
			self._wants_to_create = false
			slot3 = self

			self._get_instance_info_from_user(slot2)
		end
	end

	return 
end
function InstancesLayer:_get_instance_info_from_user()
	if not managers.worlddefinition then
		slot4 = "Instance cannot be placed in new level. Open a saved level first."

		managers.editor.output_error(slot2, managers.editor)

		return 
	end

	local predef = self._selected_predefined_instance

	if not predef then
		return 
	end

	slot4 = self
	local script = self._get_instance_script(slot3)

	if not script then
		return 
	end

	slot6 = predef
	local name = self._get_name_from_user(slot4, self)

	if name then
		local folder = self._predefined_instances[predef].folder
		local size = self._predefined_instances[predef].size
		slot15 = predef

		self.add_instance(slot7, self, name, folder, size, script, nil, nil)

		return 
	end

	return 
end
function InstancesLayer:_get_instance_script()
	slot3 = managers.editor
	local continent = managers.editor.current_continent(slot2).name(slot2)
	slot5 = "Mission"
	slot5 = continent
	local scripts = managers.editor.layer(managers.editor.current_continent(slot2), managers.editor).scripts_by_continent(managers.editor.current_continent(slot2), managers.editor.layer(managers.editor.current_continent(slot2), managers.editor))

	if #scripts < 1 then
		slot6 = "There are now mission scripts in continent '" .. continent .. "'. Create one first."

		managers.editor.output_error(slot4, managers.editor)

		return 
	end

	local script = scripts[1]

	if 1 < #scripts then
		slot11 = ""
		local dialog = EWS.SingleChoiceDialog(slot5, EWS, Global.frame_panel, "Select which script the instance should be placed in:", "Scripts", scripts)
		slot7 = dialog

		dialog.show_modal(EWS)

		slot7 = dialog
		script = dialog.get_string_selection(EWS)

		if not script or script == "" then
			return nil
		end
	end

	return script
end
function InstancesLayer:_get_name_from_user(predef)

	-- Decompilation error in this vicinity:
	slot14 = 0
	local name = EWS.get_text_from_user(slot4, EWS, Global.frame_panel, "Enter name for the instance:", "Create instance", suggested_name, Vector3(true, -1, -1))

	if name and name ~= "" then
		slot7 = name

		if managers.world_instance.has_instance(slot5, managers.world_instance) then
			slot6 = self

			return self._get_name_from_user(slot5)
		end

		return name
	end

	return nil
end
function InstancesLayer:use_grab_info()
	slot3 = self

	InstancesLayer.super.super.use_grab_info(slot2)

	if self._grab then
		self._grab = false
		slot3 = self
		slot6 = self._grab_info

		self.set_instance_positions(slot2, self._grab_info.position(slot5))

		slot7 = self._selected_instance_data.rotation
		slot4 = self._grab_info.rotation(slot5) * self._selected_instance_data.rotation.inverse(self._grab_info)

		self.set_instance_rotations(slot2, self)
	end

	return 
end
function InstancesLayer:move_unit(btn, pressed)
	if self._selected_instance then
		self._grab = true
		slot8 = self._selected_instance_data.rotation
		self._grab_info = CoreEditorUtils.GrabInfo.new(slot4, CoreEditorUtils.GrabInfo, nil, self._selected_instance_data.position)
		slot5 = managers.editor
	end

	return 
end
function InstancesLayer:rotate_unit(btn, pressed)
	if self._selected_instance then
		slot5 = self

		if not self.condition(slot4) then
			local rot_axis = nil
			local snap_axis = self.snap_rotation_axis(slot5)
			slot7 = self

			if self.local_rot(self) then
				if snap_axis == "x" then
					slot7 = self._selected_instance_data.rotation
					rot_axis = self._selected_instance_data.rotation.x(slot6)
				elseif snap_axis == "y" then
					slot7 = self._selected_instance_data.rotation
					rot_axis = self._selected_instance_data.rotation.y(slot6)
				elseif snap_axis == "z" then
					slot7 = self._selected_instance_data.rotation
					rot_axis = self._selected_instance_data.rotation.z(slot6)
				end
			elseif snap_axis == "x" then
				slot9 = 0
				rot_axis = Vector3(slot6, 1, 0)
			elseif snap_axis == "y" then
				slot9 = 0
				rot_axis = Vector3(slot6, 0, 1)
			elseif snap_axis == "z" then
				slot9 = 1
				rot_axis = Vector3(slot6, 0, 0)
			end

			local step = self.snap_rotation(slot6)
			slot8 = self

			if self.shift(self) then
				step = -step
			end

			slot9 = step
			local rot = Rotation(slot7, rot_axis)
			slot10 = rot

			self.set_instance_rotations(rot_axis, self)
		end
	end

	return 
end
function InstancesLayer:position_as()
	if self._selected_instance then
		slot3 = self

		if not self.condition(slot2) then
			local data = {
				ray_type = "body editor",
				sample = true,
				mask = self._position_as_slot_mask
			}
			slot5 = data
			local ray = managers.editor.unit_by_raycast(slot3, managers.editor)

			if ray and ray.unit then
				slot5 = self
				slot8 = ray.unit

				self.set_instance_positions(slot4, ray.unit.position(slot7))

				slot9 = self._selected_instance
				slot9 = self._selected_instance.data(ray.unit).rotation
				slot6 = ray.unit.rotation(slot7) * self._selected_instance.data(ray.unit).rotation.inverse(ray.unit)

				self.set_instance_rotations(slot4, self)
			end
		end
	end

	return 
end
function InstancesLayer:click_select_unit()

	-- Decompilation error in this vicinity:
	slot3 = self
	slot4 = self

	managers.editor.click_select_unit(slot2, managers.editor)

	return 
end
function InstancesLayer:select_instance(instance_name)
	self._selected_instance = nil
	self._selected_instance_data = nil
	slot5 = (instance_name and true) or false

	self._mission_placed_ctrlr.set_enabled(slot3, self._mission_placed_ctrlr)

	slot5 = instance_name

	self._set_selection_instances_listbox(slot3, self)

	if instance_name then
		slot4 = Instance
		slot8 = instance_name
		self._selected_instance = Instance.new(slot3, managers.world_instance.get_instance_data_by_name(slot6, managers.world_instance))
		slot5 = instance_name
		self._selected_instance_data = managers.world_instance.get_instance_data_by_name(slot3, managers.world_instance)
		slot7 = self._selected_instance
		slot5 = self._selected_instance.data(slot6).position.z

		managers.editor.set_grid_altitude(slot3, managers.editor)

		slot5 = instance_name
		local instance_data = managers.world_instance.get_instance_data_by_name(slot3, managers.world_instance)
		local continent_data = managers.editor.continents(managers.world_instance)[instance_data.continent]
		slot7 = managers.world_instance
		local start_index = continent_data.base_id(managers.editor) + managers.world_instance.start_offset_index(continent_data) + instance_data.start_index
		slot8 = "" .. start_index

		self._instance_info_guis.start_index.set_label(continent_data, self._instance_info_guis.start_index)

		slot8 = "" .. start_index + instance_data.index_size

		self._instance_info_guis.end_index.set_label(continent_data, self._instance_info_guis.end_index)

		slot8 = instance_data.mission_placed

		self._mission_placed_ctrlr.set_value(continent_data, self._mission_placed_ctrlr)
	else
		slot5 = "N/A"

		self._instance_info_guis.start_index.set_label(slot3, self._instance_info_guis.start_index)

		slot5 = "N/A"

		self._instance_info_guis.end_index.set_label(slot3, self._instance_info_guis.end_index)
	end

	slot4 = self

	self.update_unit_settings(slot3)

	slot4 = self

	self._update_overlay_gui(slot3)

	return 
end
function InstancesLayer:set_select_unit(unit)

	-- Decompilation error in this vicinity:
	slot4 = self
	slot2 = self.select_instance
end
function InstancesLayer:release_unit()
	slot3 = self

	InstancesLayer.super.release_unit(slot2)

	return 
end
function InstancesLayer:get_instance_units_by_name(name)
	if self._stashed_instance_units[name] then
		return self._stashed_instance_units[name]
	end

	local layer_names = {
		"Statics",
		"Dynamics"
	}
	local t = {}
	slot6 = layer_names

	for _, layer_name in ipairs(slot5) do
		t[layer_name] = t[layer_name] or {}
		slot14 = layer_name
		slot13 = managers.editor.layer(slot12, managers.editor)

		for _, unit in ipairs(managers.editor.layer(slot12, managers.editor).created_units(slot12)) do
			slot16 = unit

			if alive(slot15) then
				slot16 = unit

				if unit.unit_data(slot15).instance then
					slot16 = unit

					if unit.unit_data(slot15).instance == name then
						slot17 = unit

						table.insert(slot15, t[layer_name])
					end
				end
			end
		end
	end

	self._stashed_instance_units[name] = t

	return t
end
function InstancesLayer:_delete_instance_by_name(name)
	slot4 = managers.editor

	managers.editor.freeze_gui_lists(slot3)

	if self._selected_instance then
		slot4 = self

		if not self.condition(slot3) then
			slot5 = name
			local instance_units = self.get_instance_units_by_name(slot3, self)
			slot5 = instance_units

			for name, units in pairs(self) do
				slot10 = units

				for _, unit in ipairs(slot9) do
					slot16 = name
					slot16 = unit

					managers.editor.layer(slot14, managers.editor).delete_unit(slot14, managers.editor.layer(slot14, managers.editor))
				end
			end

			slot7 = managers.world_instance

			for i, instance in ipairs(managers.world_instance.instance_data(slot6)) do
				if instance.name == name then
					slot12 = managers.world_instance

					table.remove(slot9, managers.world_instance.instance_data(i))

					self._stashed_instance_units[name] = nil
					slot11 = "Mission"
					slot11 = {
						"func_instance_input_event",
						"func_instance_output_event",
						"func_instance_point",
						"func_instance_set_params"
					}
					local mission_units = managers.editor.layer(nil, managers.editor).get_created_unit_by_pattern(nil, managers.editor.layer(nil, managers.editor))
					slot11 = mission_units

					for _, mission_unit in ipairs(managers.editor.layer(nil, managers.editor)) do
						slot16 = mission_unit

						if mission_unit.mission_element(slot15).on_instance_deleted then
							slot16 = mission_unit
							slot17 = name

							mission_unit.mission_element(slot15).on_instance_deleted(slot15, mission_unit.mission_element(slot15))
						end
					end

					slot11 = self._selected_instance

					if self._selected_instance.name(slot10) == name then
						self._selected_instance = nil
						self._selected_instance_data = nil
					end

					slot11 = self

					self._update_instances_listbox(slot10)

					break
				end
			end
		end
	end

	slot4 = managers.editor

	managers.editor.thaw_gui_lists(slot3)

	slot4 = self

	self.update_unit_settings(slot3)

	slot4 = self

	self._update_overlay_gui(slot3)

	return 
end
function InstancesLayer:delete_selected_unit(btn, pressed)
	if self._selected_instance then
		slot5 = self
		slot8 = self._selected_instance

		self._delete_instance_by_name(slot4, self._selected_instance.name(slot7))
	end

	return 
end
function InstancesLayer:reset_rotation()
	return 
end
function InstancesLayer:add_instance(name, folder, index_size, script, pos, rot, predef)
	folder = folder or "levels/tests/inst/world"
	slot10 = managers.editor
	slot10 = managers.editor.current_continent(slot9)
	continent = managers.editor.current_continent(slot9).name(slot9)
	script = script or "default"
	local instance = {
		continent = continent,
		folder = folder,
		name = name,
		position = pos or self._current_pos,
		rotation = rot or self._current_rot or Rotation(),
		script = script,
		index_size = index_size
	}
	slot13 = instance.continent
	instance.start_index = managers.world_instance.get_safe_start_index(slot10, managers.world_instance, instance.index_size)
	instance.predef = predef
	slot12 = instance

	managers.world_instance.add_instance_data(slot10, managers.world_instance)

	slot11 = managers.editor
	local continent_data = managers.editor.current_continent(slot10).values(slot10)
	slot14 = continent_data
	local prepared_unit_data = managers.world_instance.prepare_unit_data(managers.editor.current_continent(slot10), managers.world_instance, instance)

	if prepared_unit_data.statics then
		slot13 = prepared_unit_data.statics

		for _, static in ipairs(slot12) do
			slot19 = static
			local unit = managers.worlddefinition._create_statics_unit(slot17, managers.worlddefinition, Vector3())
			slot20 = "Statics"
			slot20 = unit

			managers.editor.layer(managers.worlddefinition, managers.editor).add_unit_to_created_units(managers.worlddefinition, managers.editor.layer(managers.worlddefinition, managers.editor))
		end
	end

	if prepared_unit_data.dynamics then
		slot13 = prepared_unit_data.dynamics

		for _, entry in ipairs(slot12) do
			slot19 = entry
			local unit = managers.worlddefinition._create_dynamics_unit(slot17, managers.worlddefinition, Vector3())
			slot20 = "Dynamics"
			slot20 = unit

			managers.editor.layer(managers.worlddefinition, managers.editor).add_unit_to_created_units(managers.worlddefinition, managers.editor.layer(managers.worlddefinition, managers.editor))

			slot20 = unit

			for i = 0, unit.num_bodies(managers.editor.layer(managers.worlddefinition, managers.editor)) - 1, 1 do
				slot24 = i
				slot24 = true

				unit.body(slot22, unit).set_keyframed(slot22, unit.body(slot22, unit))

				slot24 = true

				unit.set_keyframed(slot22, unit)
			end
		end
	end

	slot13 = self

	self._update_instances_listbox(slot12)

	slot14 = instance.name

	self.select_instance(slot12, self)

	slot13 = self

	self._update_overlay_gui(slot12)

	return 
end
function InstancesLayer:update(t, dt)
	slot7 = dt

	InstancesLayer.super.super.update(slot4, self, t)

	slot7 = managers.world_instance
	slot10 = managers.editor
	slot10 = managers.editor.current_continent(slot9)

	for _, instance_data in ipairs(managers.world_instance.instances_data_by_continent(t, managers.editor.current_continent(slot9).name(slot9))) do
		slot11 = instance_data.name
		local instance_units = self.get_instance_units_by_name(slot9, self)

		if #instance_units == 0 then
			slot16 = 0.5

			Application.draw_sphere(slot10, Application, instance_data.position, 50, 0.5, 0.5)
		end
	end

	if self._selected_instance then
		slot7 = dt
		slot10 = self._selected_instance

		self._draw_instance(slot4, self, t, self._selected_instance.name(slot9))
	end

	slot5 = self

	if not self.condition(slot4) then

		-- Decompilation error in this vicinity:
		slot7 = self._selected_unit
		local current_pos, current_rot = managers.editor.current_orientation(slot4, managers.editor, self._offset_move_vec)
		self._current_pos = current_pos or self._current_pos
		self._current_rot = current_rot

		if self._current_pos and self._grab then
			if self._selected_instance then
				slot8 = self._current_pos

				self.set_instance_positions(slot6, self)
			else
				self._grab = false
			end
		end

		if self._current_rot then
			slot7 = self._ctrl
			slot10 = "assign_suface_normal"

			if self._ctrl.down(slot6, Idstring(slot9)) then
				slot8 = self._current_rot

				self.set_unit_rotations(slot6, self)
			end

			if self._grab then
				slot7 = self._ctrl
				slot10 = "surface_move_align_normal"

				if self._ctrl.down(slot6, Idstring(slot9)) then
					slot8 = self._current_rot

					self.set_unit_rotations(slot6, self)
				end

				slot7 = self

				if self.use_snappoints(slot6) then
					slot8 = self._current_rot

					self.set_unit_rotations(slot6, self)
				end
			end
		end

		slot9 = dt

		self.draw_marker(slot6, self, t)

		slot9 = dt

		self.draw_grid(slot6, self, t)
	end

	slot7 = dt

	self.update_move_triggers(slot4, self, t)

	slot7 = dt

	self.update_rotate_triggers(slot4, self, t)

	return 
end
function InstancesLayer:update_move_triggers(t, dt)

	-- Decompilation error in this vicinity:
	slot7 = dt

	if not self._move_unit_rep.update(slot4, self._move_unit_rep, d) or CoreInput.shift() then
		return 
	end

	local mov_vec = nil
	local u_rot = self._selected_instance_data.rotation
	slot7 = self._ctrl
	slot10 = "move_forward"

	if self._ctrl.down(slot6, Idstring(slot9)) then

		-- Decompilation error in this vicinity:
		slot7 = self
	else
		slot7 = self._ctrl
		slot10 = "move_back"

		if self._ctrl.down(slot6, Idstring(slot9)) then

			-- Decompilation error in this vicinity:
			slot7 = self
		else
			slot7 = self._ctrl
			slot10 = "move_left"

			if self._ctrl.down(slot6, Idstring(slot9)) then

				-- Decompilation error in this vicinity:
				slot7 = self
			else
				slot7 = self._ctrl
				slot10 = "move_right"

				if self._ctrl.down(slot6, Idstring(slot9)) then

					-- Decompilation error in this vicinity:
					slot7 = self
				else
					slot7 = self._ctrl
					slot10 = "move_up"

					if self._ctrl.down(slot6, Idstring(slot9)) then

						-- Decompilation error in this vicinity:
						slot7 = self
					else
						slot7 = self._ctrl
						slot10 = "move_down"

						if self._ctrl.down(slot6, Idstring(slot9)) then
							slot7 = self
						end
					end
				end
			end
		end
	end

	if mov_vec then
		slot11 = self
		slot8 = self._selected_instance_data.position + mov_vec * self.grid_size(slot10)

		self.set_instance_positions(slot6, self)
	end

	return 
end
function InstancesLayer:update_rotate_triggers(t, dt)

	-- Decompilation error in this vicinity:
	local rot_speed = self.rotation_speed(slot4) * dt
	slot6 = self

	if self.shift(self) then
		rot_speed = rot_speed / 2
	end

	local rot_axis = nil
	local u_rot = self._selected_instance_data.rotation
	slot8 = self._ctrl
	slot11 = "roll_left"

	if self._ctrl.down(slot7, Idstring(slot10)) then

		-- Decompilation error in this vicinity:
		slot8 = self
	else
		slot8 = self._ctrl
		slot11 = "roll_right"

		if self._ctrl.down(slot7, Idstring(slot10)) then

			-- Decompilation error in this vicinity:
			slot8 = self
			rot_axis = slot6 * -1
		else
			slot8 = self._ctrl
			slot11 = "pitch_right"

			if self._ctrl.down(slot7, Idstring(slot10)) then

				-- Decompilation error in this vicinity:
				slot8 = self
			else
				slot8 = self._ctrl
				slot11 = "pitch_left"

				if self._ctrl.down(slot7, Idstring(slot10)) then

					-- Decompilation error in this vicinity:
					slot8 = self
					rot_axis = slot6 * -1
				else
					slot8 = self._ctrl
					slot11 = "yaw_backward"

					if self._ctrl.down(slot7, Idstring(slot10)) then

						-- Decompilation error in this vicinity:
						slot8 = self
					else
						slot8 = self._ctrl
						slot11 = "yaw_forward"

						if self._ctrl.down(slot7, Idstring(slot10)) then

							-- Decompilation error in this vicinity:
							slot8 = self
							rot_axis = slot6 * -1
						end
					end
				end
			end
		end
	end

	if rot_axis then
		slot9 = rot_speed
		local rot = Rotation(slot7, rot_axis)
		slot10 = rot

		self.set_instance_rotations(rot_axis, self)
	end

	return 
end
function InstancesLayer:external_draw_instance(t, dt, instance_name, r, g, b)
	slot15 = b

	self._draw_instance(slot8, self, t, dt, instance_name, r, g)

	return 
end
function InstancesLayer:_draw_instance(t, dt, instance_name, r, g, b)
	r = r or 1
	g = g or 1
	b = b or 1
	slot15 = b
	local unit_brush = Draw.brush(slot8, Color(slot11, 0.15, r, g))
	slot11 = instance_name
	local instance_units = self.get_instance_units_by_name(Draw, self)
	slot11 = instance_units

	for name, units in pairs(self) do
		slot16 = units

		for _, unit in ipairs(slot15) do
			slot21 = unit

			if alive(slot20) then
				slot21 = unit

				if unit.unit_data(slot20).instance then
					slot21 = unit

					if unit.unit_data(slot20).instance == instance_name then
						slot25 = b

						Application.draw(slot20, Application, unit, r, g)

						slot22 = unit

						unit_brush.unit(slot20, unit_brush)
					end
				end
			end
		end
	end

	if #instance_units == 0 then
		slot12 = instance_name
		local instance_data = managers.world_instance.get_instance_data_by_name(slot10, managers.world_instance)
		slot15 = 2

		unit_brush.sphere(managers.world_instance, unit_brush, instance_data.position, 50)

		slot17 = b

		Application.draw_sphere(managers.world_instance, Application, instance_data.position, 50, r, g)
	end

	slot16 = 0.5
	local name_brush = Draw.brush(slot10, Color(slot13, 0.3, 1))
	slot15 = "core/fonts/diesel"

	name_brush.set_font(Draw, name_brush, Idstring(0.3))

	slot12 = name_brush
	slot15 = "OverlayVertexColorTextured"

	name_brush.set_render_template(Draw, Idstring(8))

	slot15 = instance_name
	slot12 = managers.world_instance.prepare_mission_data_by_name(Idstring, managers.world_instance).default.elements

	for _, element in pairs(Draw) do
		slot17 = unit_brush
		slot23 = b

		unit_brush.set_color(slot16, Color(slot19, 1, r, g))

		if element.values.position then
			slot20 = 2

			unit_brush.sphere(slot16, unit_brush, element.values.position, 2)

			slot17 = managers.viewport

			if managers.viewport.get_current_camera(slot16) then
				slot17 = managers.viewport
				slot17 = managers.viewport.get_current_camera(slot16)
				local cam_up = managers.viewport.get_current_camera(slot16).rotation(slot16).z(slot16)
				slot18 = managers.viewport
				slot18 = managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot16).rotation(slot16))
				local cam_right = managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot16).rotation(slot16)).rotation(managers.viewport.get_current_camera(slot16).rotation(slot16)).x(managers.viewport.get_current_camera(slot16).rotation(slot16))
				slot25 = 25
				slot23 = element.editor_name
				slot23 = -cam_up

				name_brush.center_text(managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot16).rotation(slot16)).rotation(managers.viewport.get_current_camera(slot16).rotation(slot16)), name_brush, element.values.position + Vector3(slot22, 0, 0), utf8.from_latin1(slot22), cam_right)
			end

			if element.values.rotation then
				slot17 = element.values.rotation

				if CoreClass.type_name(slot16) ~= "Rotation" or not element.values.rotation then
					slot19 = 0
					local rotation = Rotation(slot16, element.values.rotation, 0)
				end

				slot18 = unit_brush
				slot24 = 0

				unit_brush.set_color(slot17, Color(slot20, 0.15, 1, 0))

				slot23 = rotation
				slot21 = 1

				unit_brush.cylinder(slot17, unit_brush, element.values.position, element.values.position + rotation.x(1) * 20)

				slot18 = unit_brush
				slot24 = 0

				unit_brush.set_color(slot17, Color(element.values.position + rotation.x(1) * 20, 0.15, 0, 1))

				slot23 = rotation
				slot21 = 1

				unit_brush.cylinder(slot17, unit_brush, element.values.position, element.values.position + rotation.y(0) * 20)

				slot18 = unit_brush
				slot24 = 1

				unit_brush.set_color(slot17, Color(element.values.position + rotation.y(0) * 20, 0.15, 0, 0))

				slot23 = rotation
				slot21 = 1

				unit_brush.cylinder(slot17, unit_brush, element.values.position, element.values.position + rotation.z(0) * 20)
			end
		end
	end

	return 
end
function InstancesLayer:draw_rotation(t, dt)
	return 
end
function InstancesLayer:draw_units(t, dt)
	return 
end
function InstancesLayer:widget_affect_object()
	return self._selected_instance
end
function InstancesLayer:use_widget_position(pos)
	slot5 = pos

	self.set_instance_positions(slot3, self)

	return 
end
function InstancesLayer:use_widget_rotation(rot)
	slot7 = self
	slot7 = self.widget_affect_object(slot6)
	slot7 = self.widget_affect_object(slot6).rotation(slot6)
	slot5 = rot * self.widget_affect_object(slot6).rotation(slot6).inverse(slot6)

	self.set_instance_rotations(slot3, self)

	return 
end
function InstancesLayer:set_unit_positions(pos)
	slot5 = pos

	self.set_instance_positions(slot3, self)

	return 
end
function InstancesLayer:set_unit_rotations(rot)
	slot5 = rot

	self.set_instance_rotations(slot3, self)

	return 
end
function InstancesLayer:set_instance_positions(pos)
	slot6 = self
	slot9 = self._selected_instance

	for name, units in pairs(self.get_instance_units_by_name(slot5, self._selected_instance.name(slot8))) do
		slot9 = units

		for _, unit in ipairs(slot8) do
			slot15 = unit
			slot20 = self._selected_instance_data.rotation

			self.recalc_locals(slot13, self, Reference.new(slot17, Reference, self._selected_instance_data.position))

			slot15 = "Statics"
			slot17 = self._selected_instance_data.rotation

			managers.editor.layer(slot13, managers.editor).set_unit_position(slot13, managers.editor.layer(slot13, managers.editor), unit, pos)
		end
	end

	self._selected_instance_data.position = pos

	return 
end
function InstancesLayer:set_instance_rotations(rot)
	local rot = rot * self._selected_instance_data.rotation
	slot7 = self
	slot10 = self._selected_instance

	for name, units in pairs(self.get_instance_units_by_name(slot6, self._selected_instance.name(slot9))) do
		slot10 = units

		for _, unit in ipairs(slot9) do
			slot16 = unit
			slot21 = self._selected_instance_data.rotation

			self.recalc_locals(slot14, self, Reference.new(slot18, Reference, self._selected_instance_data.position))

			slot16 = "Statics"
			slot18 = rot

			managers.editor.layer(slot14, managers.editor).set_unit_position(slot14, managers.editor.layer(slot14, managers.editor), unit, self._selected_instance_data.position)

			slot16 = "Statics"
			slot17 = rot

			managers.editor.layer(slot14, managers.editor).set_unit_rotation(slot14, managers.editor.layer(slot14, managers.editor), unit)
		end
	end

	self._selected_instance_data.rotation = rot

	return 
end
function InstancesLayer:build_panel(notebook, settings)
	slot6 = notebook

	InstancesLayer.super.super.build_panel(slot4, self)

	slot6 = "InstancesLayer:build_panel"

	cat_print(slot4, "editor")

	slot8 = "VSCROLL"
	self._ews_panel = EWS.ScrolledWindow(slot4, EWS, notebook, "")
	slot5 = self._ews_panel
	slot10 = 0

	self._ews_panel.set_scroll_rate(slot4, Vector3("", 0, 1))

	slot10 = 0
	slot6 = Vector3("", 0, 0)

	self._ews_panel.set_virtual_size_hints(slot4, self._ews_panel, Vector3(0, 1, -1))

	slot6 = "VERTICAL"
	self._main_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._main_sizer

	self._ews_panel.set_sizer(slot4, self._ews_panel)

	slot6 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot4, EWS)
	slot9 = "EXPAND"

	self._main_sizer.add(slot4, self._main_sizer, self._sizer, 1, 0)

	slot8 = "Instances"
	local instances_sizer = EWS.StaticBoxSizer(slot4, EWS, self._ews_panel, "VERTICAL")
	slot10 = "EXPAND"

	self._sizer.add(EWS, self._sizer, instances_sizer, 3, 0)

	slot9 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot12 = "folder_open_16x16.png"

	toolbar.add_tool(EWS, toolbar, "OPEN", "Open world file", CoreEws.image_path(-1))

	slot14 = "_on_gui_open_selected_instance_path"

	toolbar.connect(EWS, toolbar, "OPEN", "EVT_COMMAND_MENU_SELECTED", callback("Open selected instance world", self, self))

	slot12 = "toolbar\\rename2_16x16.png"

	toolbar.add_tool(EWS, toolbar, "RENAME", "Rename instance", CoreEws.image_path(nil))

	slot14 = "_on_gui_rename_instance"

	toolbar.connect(EWS, toolbar, "RENAME", "EVT_COMMAND_MENU_SELECTED", callback("Rename instance", self, self))

	slot12 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "DELETE", "Delete instance", CoreEws.image_path(nil))

	slot14 = "_on_gui_delete_instance"
	slot11 = nil

	toolbar.connect(EWS, toolbar, "DELETE", "EVT_COMMAND_MENU_SELECTED", callback("Delete instance", self, self))

	slot7 = toolbar

	toolbar.realize(EWS)

	slot11 = "EXPAND,BOTTOM"

	instances_sizer.add(EWS, instances_sizer, toolbar, 0, 1)

	slot10 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._instances_listbox = EWS.ListBox(EWS, EWS, self._ews_panel, "instances_layer_instances")
	slot11 = "EXPAND"

	instances_sizer.add(EWS, instances_sizer, self._instances_listbox, 1, 0)

	slot13 = "_on_gui_select_instance"
	slot10 = self._instances_listbox

	self._instances_listbox.connect(EWS, self._instances_listbox, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot11 = "ALIGN_LEFT"
	self._mission_placed_ctrlr = EWS.CheckBox(EWS, EWS, self._ews_panel, "Mission placed", "")
	slot8 = false

	self._mission_placed_ctrlr.set_value(EWS, self._mission_placed_ctrlr)

	slot13 = "_on_gui_mission_placed"
	slot10 = nil

	self._mission_placed_ctrlr.connect(EWS, self._mission_placed_ctrlr, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot11 = "EXPAND"

	instances_sizer.add(EWS, instances_sizer, self._mission_placed_ctrlr, 0, 0)

	self._instance_info_guis = {}

	local function _info(name)
		slot4 = "HORIZONTAL"
		local text_sizer = EWS.BoxSizer(slot2, EWS)
		slot8 = "EXPAND"

		instances_sizer.add(EWS, instances_sizer, text_sizer, 0, 0)

		slot12 = true
		slot11 = ""
		slot8 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

		text_sizer.add(EWS, text_sizer, EWS.StaticText(0, EWS, self._ews_panel, string.pretty(slot10, name) .. ": ", ""), 1, 2)

		slot9 = ""
		self._instance_info_guis[name] = EWS.StaticText(text_sizer, EWS, self._ews_panel, "", "")
		slot8 = "RIGHT,TOP,EXPAND"

		text_sizer.add(EWS.StaticText(text_sizer, EWS, self._ews_panel, "", ""), text_sizer, self._instance_info_guis[name], 2, 2)

		return 
	end

	slot8 = "start_index"

	_info(instances_sizer)

	slot8 = "end_index"

	_info(instances_sizer)

	slot11 = "Predefined instances"
	local predefined_instances_sizer = EWS.StaticBoxSizer(instances_sizer, EWS, self._ews_panel, "VERTICAL")
	slot13 = "EXPAND"

	self._sizer.add(EWS, self._sizer, predefined_instances_sizer, 4, 0)

	slot12 = self
	slot13 = "EXPAND"

	predefined_instances_sizer.add(EWS, predefined_instances_sizer, self._build_predefined_instances_notebook(4), 1, 0)

	self._predefined_instances_info_guis = {}

	local function _info(name)
		slot4 = "HORIZONTAL"
		local text_sizer = EWS.BoxSizer(slot2, EWS)
		slot8 = "EXPAND"

		predefined_instances_sizer.add(EWS, predefined_instances_sizer, text_sizer, 0, 0)

		slot12 = true
		slot11 = ""
		slot8 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

		text_sizer.add(EWS, text_sizer, EWS.StaticText(0, EWS, self._ews_panel, string.pretty(slot10, name) .. ": ", ""), 1, 2)

		slot9 = ""
		self._predefined_instances_info_guis[name] = EWS.StaticText(text_sizer, EWS, self._ews_panel, "", "")
		slot8 = "RIGHT,TOP,EXPAND"

		text_sizer.add(EWS.StaticText(text_sizer, EWS, self._ews_panel, "", ""), text_sizer, self._predefined_instances_info_guis[name], 2, 2)

		return 
	end

	slot10 = "folder"

	_info(predefined_instances_sizer)

	slot10 = "size"

	_info(predefined_instances_sizer)

	slot10 = "actual_size"

	_info(predefined_instances_sizer)

	slot10 = "highest_id"

	_info(predefined_instances_sizer)

	slot10 = "mission_elements"

	_info(predefined_instances_sizer)

	slot10 = "statics"

	_info(predefined_instances_sizer)

	slot10 = "dynamics"

	_info(predefined_instances_sizer)

	slot13 = "TB_FLAT,TB_NODIVIDER,ALIGN_BOTTOM"
	local pi_toolbar = EWS.ToolBar(predefined_instances_sizer, EWS, self._ews_panel, "")
	slot16 = "folder_open_16x16.png"

	pi_toolbar.add_tool(EWS, pi_toolbar, "TB_OPEN_INSTANCE_WORLD", "Open world file", CoreEws.image_path(slot15))

	slot18 = "_on_gui_open_instance_path"

	pi_toolbar.connect(EWS, pi_toolbar, "TB_OPEN_INSTANCE_WORLD", "EVT_COMMAND_MENU_SELECTED", callback("Open predefined instance world", self, self))

	slot16 = "document_16x16.png"

	pi_toolbar.add_tool(EWS, pi_toolbar, "TB_OPEN_PREDEFINED_INSTANCES_FILE", "Open predefined instances file", CoreEws.image_path(nil))

	slot18 = "_on_gui_open_predefined_instances_file"

	pi_toolbar.connect(EWS, pi_toolbar, "TB_OPEN_PREDEFINED_INSTANCES_FILE", "EVT_COMMAND_MENU_SELECTED", callback("Open predefined instances file", self, self))

	slot16 = "toolbar\\refresh_16x16.png"

	pi_toolbar.add_tool(EWS, pi_toolbar, "TB_OPEN_RELOAD_PREDEFINED_INSTANCES_FILE", "Reload predefined instances file", CoreEws.image_path(nil))

	slot18 = "_on_gui_reload_predefined_instances_file"
	slot15 = nil

	pi_toolbar.connect(EWS, pi_toolbar, "TB_OPEN_RELOAD_PREDEFINED_INSTANCES_FILE", "EVT_COMMAND_MENU_SELECTED", callback("Reload predefined instances file", self, self))

	slot11 = pi_toolbar

	pi_toolbar.realize(EWS)

	slot15 = "EXPAND,BOTTOM"

	predefined_instances_sizer.add(EWS, predefined_instances_sizer, pi_toolbar, 0, 1)

	slot15 = "TE_MULTILINE,TE_READONLY,TE_WORDWRAP,TE_CENTRE"
	local help = EWS.TextCtrl(EWS, EWS, self._ews_panel, "Predefined instances can be added in " .. self._predefined_instances_file .. ".xml.", 0)
	slot16 = "EXPAND"

	self._sizer.add(EWS, self._sizer, help, 0, 0)

	return self._ews_panel
end
function InstancesLayer:_build_predefined_instances_notebook()
	slot4 = "VERTICAL"
	local notebook_sizer = EWS.BoxSizer(slot2, EWS)
	self._predefined_instances_notebook = EWS.Notebook(EWS, EWS, self._ews_panel, "")
	slot10 = "_on_gui_instances_page_changed"
	slot7 = nil

	self._predefined_instances_notebook.connect(EWS, self._predefined_instances_notebook, "EVT_COMMAND_NOTEBOOK_PAGE_CHANGING", callback("NB_TOP,NB_MULTILINE", self, self))

	slot8 = "EXPAND"

	notebook_sizer.add(EWS, notebook_sizer, self._predefined_instances_notebook, 1, 0)

	slot4 = self

	self._add_predefined_instances_notebook_pages(EWS)

	return notebook_sizer
end
function InstancesLayer:_add_predefined_instances_notebook_pages()
	local style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING,LC_SINGLE_SEL"
	self._predefined_instances_notebook_lists = {}
	local predefined_data_by_category = self._predefined_data_by_category(slot3)
	slot5 = predefined_data_by_category

	for c, names in pairs(self) do
		slot13 = "TAB_TRAVERSAL"
		local panel = EWS.Panel(slot9, EWS, self._predefined_instances_notebook, "")
		slot12 = "VERTICAL"
		local instance_sizer = EWS.BoxSizer(EWS, EWS)
		slot13 = instance_sizer

		panel.set_sizer(EWS, panel)

		slot19 = ""
		slot16 = "ALIGN_CENTER_HORIZONTAL"

		instance_sizer.add(EWS, instance_sizer, EWS.StaticText(slot14, EWS, panel, "Filter", 0), 0, 0)

		slot16 = "TE_CENTRE"
		local instance_filter = EWS.TextCtrl(EWS, EWS, panel, "", "")
		slot17 = "EXPAND"

		instance_sizer.add(EWS, instance_sizer, instance_filter, 0, 0)

		slot16 = style
		local instances = EWS.ListCtrl(EWS, EWS, panel, "")
		slot14 = instances

		instances.clear_all(EWS)

		slot15 = "Name"

		instances.append_column(EWS, instances)

		slot14 = names

		for _, name in ipairs(EWS) do
			slot20 = name
			local i = instances.append_item(slot18, instances)
			slot22 = name

			instances.set_item_data(instances, instances, i)
		end

		slot15 = 0

		instances.autosize_column(slot13, instances)

		slot18 = "EXPAND"

		instance_sizer.add(slot13, instance_sizer, instances, 1, 0)

		slot20 = "_on_gui_select_predefined_instance"

		instances.connect(slot13, instances, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(0, self, self))

		slot20 = "_on_gui_instances_update_filter"
		slot17 = {
			filter = instance_filter,
			instances = instances,
			category = c
		}

		instance_filter.connect(slot13, instance_filter, "EVT_COMMAND_TEXT_UPDATED", callback(instances, self, self))

		local page_name = c
		self._predefined_instances_notebook_lists[page_name] = {
			instances = instances,
			filter = instance_filter
		}
		slot18 = page_name == "ALL"

		self._predefined_instances_notebook.add_page(slot14, self._predefined_instances_notebook, panel, page_name)
	end

	return 
end
function InstancesLayer:_clear_predefined_instances_notebook()
	self._predefined_instances_notebook_lists = {}
	slot3 = self._predefined_instances_notebook

	while 0 < self._predefined_instances_notebook.get_page_count(slot2) do
		slot6 = self._predefined_instances_notebook
		slot4 = self._predefined_instances_notebook.get_page_count(slot5) - 1

		self._predefined_instances_notebook.delete_page(slot2, self._predefined_instances_notebook)
	end

	return 
end
function InstancesLayer:_predefined_data_by_category()
	local t = {
		ALL = {}
	}
	slot4 = self._predefined_instances

	for name, data in pairs(slot3) do
		local category = data.category or "N/A"
		t[category] = t[category] or {}
		slot11 = name

		table.insert(slot9, t[category])

		slot11 = name

		table.insert(slot9, t.ALL)
	end

	return t
end
function InstancesLayer:_on_gui_instances_page_changed()
	slot3 = self._predefined_instances_notebook_lists

	for _, data in pairs(slot2) do
		slot10 = data.instances

		for _, item in ipairs(data.instances.selected_items(slot9)) do
			slot15 = false

			data.instances.set_item_selected(slot12, data.instances, item)
		end
	end

	return 
end
function InstancesLayer:_on_gui_instances_update_filter(data)
	local filter = data.filter.get_value(slot3)
	slot5 = data.instances

	data.instances.delete_all_items(data.filter)

	local instances_names = self._predefined_data_by_category(data.filter)[data.category]
	slot6 = instances_names

	for _, name in ipairs(self) do
		slot14 = true

		if string.find(slot10, name, filter, 1) then
			slot12 = name
			local i = data.instances.append_item(slot10, data.instances)
			slot14 = name

			data.instances.set_item_data(data.instances, data.instances, i)
		end
	end

	slot7 = 0

	data.instances.autosize_column(slot5, data.instances)

	return 
end
function InstancesLayer:_on_gui_new_instance()
	slot3 = self

	self._get_instance_info_from_user(slot2)

	return 
end
function InstancesLayer:_on_gui_open_selected_instance_path()
	slot3 = self
	local name = self._get_selection_instances_listbox(slot2)

	if name then
		slot5 = name
		local instance_data = managers.world_instance.get_instance_data_by_name(slot3, managers.world_instance)
		slot6 = instance_data.folder

		self._open_instance_path(managers.world_instance, self)
	end

	return 
end
function InstancesLayer:_on_gui_rename_instance()
	slot3 = self
	local name = self._get_selection_instances_listbox(slot2)

	if name then
		slot4 = self
		local new_name = self._get_name_from_user(slot3)

		if new_name then
			slot6 = name
			local instance_units = self.get_instance_units_by_name(slot4, self)
			self._stashed_instance_units[name] = nil
			slot8 = new_name

			managers.world_instance.rename_instance(nil, managers.world_instance, name)

			slot6 = instance_units

			for name, units in pairs(nil) do
				slot11 = units

				for _, unit in ipairs(slot10) do
					slot16 = unit
					unit.unit_data(slot15).instance = new_name
				end
			end

			slot7 = "Mission"
			slot7 = {
				"func_instance_input_event",
				"func_instance_output_event",
				"func_instance_point",
				"func_instance_set_params"
			}
			local mission_units = managers.editor.layer(slot5, managers.editor).get_created_unit_by_pattern(slot5, managers.editor.layer(slot5, managers.editor))
			slot7 = mission_units

			for _, mission_unit in ipairs(managers.editor.layer(slot5, managers.editor)) do
				slot12 = mission_unit

				if mission_unit.mission_element(slot11).on_instance_changed_name then
					slot12 = mission_unit
					slot14 = new_name

					mission_unit.mission_element(slot11).on_instance_changed_name(slot11, mission_unit.mission_element(slot11), name)
				else
					slot12 = mission_unit

					if mission_unit.mission_element_data(slot11).instance == name then
						slot12 = mission_unit
						slot13 = new_name

						mission_unit.mission_element(slot11).external_change_instance(slot11, mission_unit.mission_element(slot11))
					end
				end
			end

			slot7 = self

			self._update_instances_listbox(slot6)

			slot8 = new_name

			self._set_selection_instances_listbox(slot6, self)
		end
	end

	return 
end
function InstancesLayer:_on_gui_delete_instance()
	slot3 = self
	local name = self._get_selection_instances_listbox(slot2)

	if name then
		slot5 = name

		self._delete_instance_by_name(slot3, self)
	end

	return 
end
function InstancesLayer:_on_gui_mission_placed()
	slot3 = self
	local name = self._get_selection_instances_listbox(slot2)

	if name then
		slot5 = name
		slot5 = self._mission_placed_ctrlr
		managers.world_instance.get_instance_data_by_name(slot3, managers.world_instance).mission_placed = (self._mission_placed_ctrlr.get_value(managers.world_instance) and true) or nil
	end

	return 
end
function InstancesLayer:_on_gui_select_predefined_instance(predefined_instances_list_box)
	slot5 = predefined_instances_list_box
	local name = self._get_selection_predefined_instances_listbox(slot3, self)
	slot6 = name

	self._set_selected_predefined_instance(self, self)

	return 
end
function InstancesLayer:_set_selected_predefined_instance(name)
	self._selected_predefined_instance = name

	if not name then
		slot5 = ""

		self._predefined_instances_info_guis.folder.set_label(slot3, self._predefined_instances_info_guis.folder)

		slot5 = ""

		self._predefined_instances_info_guis.size.set_label(slot3, self._predefined_instances_info_guis.size)

		slot5 = ""

		self._predefined_instances_info_guis.actual_size.set_label(slot3, self._predefined_instances_info_guis.actual_size)

		slot5 = ""

		self._predefined_instances_info_guis.mission_elements.set_label(slot3, self._predefined_instances_info_guis.mission_elements)

		slot5 = ""

		self._predefined_instances_info_guis.statics.set_label(slot3, self._predefined_instances_info_guis.statics)

		slot5 = ""

		self._predefined_instances_info_guis.dynamics.set_label(slot3, self._predefined_instances_info_guis.dynamics)

		slot5 = ""

		self._predefined_instances_info_guis.highest_id.set_label(slot3, self._predefined_instances_info_guis.highest_id)

		return 
	end

	local folder = self._predefined_instances[name].folder
	local size = self._predefined_instances[name].size
	slot7 = {
		folder = folder
	}
	local id, amount, type_amount = managers.world_instance.check_highest_id(slot5, managers.world_instance)
	slot10 = folder

	self._predefined_instances_info_guis.folder.set_label(slot8, self._predefined_instances_info_guis.folder)

	slot10 = "" .. size

	self._predefined_instances_info_guis.size.set_label(slot8, self._predefined_instances_info_guis.size)

	slot10 = "" .. amount

	self._predefined_instances_info_guis.actual_size.set_label(slot8, self._predefined_instances_info_guis.actual_size)

	slot10 = "" .. type_amount.mission

	self._predefined_instances_info_guis.mission_elements.set_label(slot8, self._predefined_instances_info_guis.mission_elements)

	slot10 = "" .. type_amount.statics

	self._predefined_instances_info_guis.statics.set_label(slot8, self._predefined_instances_info_guis.statics)

	slot10 = "" .. type_amount.dynamics

	self._predefined_instances_info_guis.dynamics.set_label(slot8, self._predefined_instances_info_guis.dynamics)

	slot10 = "" .. id

	self._predefined_instances_info_guis.highest_id.set_label(slot8, self._predefined_instances_info_guis.highest_id)

	if size < amount then
		local message = "Actual size (" .. amount .. ") of instance \"" .. name .. "\" is higher than size in predefined instances xml (" .. size .. "). It will not be allowed to be placed. Any previously placed instances needs to be looked over and replaced if needed."
		slot14 = "OK,ICON_ERROR"
		slot19 = 0

		EWS.message_box(") of instance \"", EWS, Global.frame_panel, message, "Instances", Vector3(slot16, -1, -1))

		slot11 = nil

		self._set_selected_predefined_instance(") of instance \"", self)

		return 
	end

	if size < id then
		local message = "Highest id (" .. id .. ") of instance \"" .. name .. "\" is higher than size in predefined instances xml (" .. size .. "). It will not be allowed to be placed. Any previously placed instances needs to be looked over and replaced if needed."
		slot14 = "OK,ICON_ERROR"
		slot19 = 0

		EWS.message_box(") of instance \"", EWS, Global.frame_panel, message, "Instances", Vector3(slot16, -1, -1))

		slot11 = nil

		self._set_selected_predefined_instance(") of instance \"", self)
	end

	return 
end
function InstancesLayer:_get_selection_predefined_instances_listbox(predefined_instances_list_box)
	predefined_instances_list_box = predefined_instances_list_box or self._predefined_instances_listbox
	slot4 = predefined_instances_list_box
	local i = predefined_instances_list_box.selected_item(slot3)

	if -1 < i then
		slot7 = 0

		return predefined_instances_list_box.get_item(slot4, predefined_instances_list_box, i)
	end

	return nil
end
function InstancesLayer:_on_gui_select_instance()
	slot3 = self._instances_listbox
	local i = self._instances_listbox.selected_index(slot2)

	if -1 < i then
		slot5 = i
		local name = self._instances_listbox.get_string(slot3, self._instances_listbox)
		slot6 = name

		self.select_instance(self._instances_listbox, self)
	end

	return 
end
function InstancesLayer:_get_selection_instances_listbox()
	slot3 = self._instances_listbox
	local i = self._instances_listbox.selected_index(slot2)

	if -1 < i then
		slot5 = i

		return self._instances_listbox.get_string(slot3, self._instances_listbox)
	end

	return nil
end
function InstancesLayer:_update_instances_listbox()
	slot3 = self._instances_listbox

	self._instances_listbox.clear(slot2)

	slot5 = managers.world_instance
	slot8 = managers.editor
	slot8 = managers.editor.current_continent(slot7)

	for _, name in ipairs(managers.world_instance.instance_names(slot4, managers.editor.current_continent(slot7).name(slot7))) do
		slot9 = name

		self._instances_listbox.append(slot7, self._instances_listbox)
	end

	return 
end
function InstancesLayer:_set_selection_instances_listbox(name)
	if not name then
		slot4 = self._instances_listbox
		local i = self._instances_listbox.selected_index(slot3)

		if -1 < i then
			slot6 = i

			self._instances_listbox.deselect_index(slot4, self._instances_listbox)
		end

		return 
	end

	slot5 = self._instances_listbox

	for i = 0, self._instances_listbox.nr_items(slot4) - 1, 1 do
		slot9 = i

		if name == self._instances_listbox.get_string(slot7, self._instances_listbox) then
			slot9 = i

			self._instances_listbox.select_index(slot7, self._instances_listbox)
		end
	end

	return 
end
function InstancesLayer:_on_gui_open_instance_path(name)
	name = name or self._selected_predefined_instance

	if not name then
		return 
	end

	local folder = self._predefined_instances[name].folder
	slot6 = folder

	self._open_instance_path(slot4, self)

	return 
end
function InstancesLayer:_open_instance_path(folder)
	slot4 = managers.editor

	if managers.editor.confirm_on_new(slot3) then
		return 
	end

	local reverse = string.reverse(slot3)
	slot6 = "/"
	local i = string.find(folder, reverse)
	slot9 = i + 1
	local p_folder = string.reverse(string.sub(slot7, reverse))
	local abs_folder = managers.database.entry_expanded_directory(string.sub, managers.database)
	local abs_file = abs_folder .. "\\world.world"
	slot11 = abs_file

	managers.editor.load_level(p_folder, managers.editor, abs_folder)

	return 
end
function InstancesLayer:_on_gui_open_predefined_instances_file()
	slot7 = self._predefined_instances_file .. ".xml"
	slot3 = "start " .. managers.database.entry_expanded_directory(slot5, managers.database)

	os.execute(slot2)

	return 
end
function InstancesLayer:_on_gui_reload_predefined_instances_file()
	local t = {
		target_db_name = "all",
		send_idstrings = false,
		preprocessor_definitions = "preprocessor_definitions",
		verbose = false
	}
	slot6 = SystemInfo
	slot6 = SystemInfo.platform(slot5)
	t.platform = string.lower(SystemInfo.platform(slot5).s(slot5))
	slot4 = managers.database
	t.source_root = managers.database.base_path(slot3)
	slot4 = Application
	t.target_db_root = Application.base_path(slot3) .. "assets"
	t.source_files = {
		self._predefined_instances_file .. ".xml"
	}
	slot5 = t

	Application.data_compile(self._predefined_instances_file .. ".xml", Application)

	slot4 = DB

	DB.reload(self._predefined_instances_file .. ".xml")

	slot4 = self

	self._load_predefined_instances(self._predefined_instances_file .. ".xml")

	local current_page_index = CoreEws.get_notebook_current_page_index(self._predefined_instances_file .. ".xml")
	slot5 = self._predefined_instances_notebook

	self._predefined_instances_notebook.freeze(self._predefined_instances_notebook)

	slot5 = self

	self._clear_predefined_instances_notebook(self._predefined_instances_notebook)

	slot5 = self

	self._add_predefined_instances_notebook_pages(self._predefined_instances_notebook)

	slot5 = self._predefined_instances_notebook

	self._predefined_instances_notebook.thaw(self._predefined_instances_notebook)

	slot5 = self._predefined_instances_notebook
	slot11 = self._predefined_instances_notebook
	slot9 = self._predefined_instances_notebook.get_page_count(slot10) - 1

	self._predefined_instances_notebook.set_page(self._predefined_instances_notebook, math.min(slot7, current_page_index))

	return 
end
function InstancesLayer:on_continent_changed(...)
	slot3 = self

	InstancesLayer.super.on_continent_changed(slot2, ...)

	slot4 = nil

	self.select_instance(slot2, self)

	slot3 = self

	self._update_instances_listbox(slot2)

	slot3 = self

	self._update_overlay_gui(slot2)

	return 
end
function InstancesLayer:on_hide_selected()
	if not self._selected_instance then
		return 
	end

	slot5 = self
	slot8 = self._selected_instance

	for name, units in pairs(self.get_instance_units_by_name(slot4, self._selected_instance.name(slot7))) do
		slot8 = units

		for _, unit in ipairs(slot7) do
			slot15 = false

			managers.editor.set_unit_visible(slot12, managers.editor, unit)
		end
	end

	slot4 = nil

	self.select_instance(slot2, self)

	return 
end
function InstancesLayer:_create_overlay_gui()
	if self._workspace then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	slot3 = Overlay
	slot7 = 1
	self._workspace = Overlay.newgui(slot2).create_screen_workspace(slot2, Overlay.newgui(slot2), 0, 0, 1)
	slot3 = self._workspace

	self._workspace.hide(slot2)

	slot3 = self._workspace
	slot4 = {
		halign = "scale",
		valign = "scale",
		h = 16,
		y = self._workspace.panel(1).h(1) - 16
	}
	slot7 = self._workspace
	slot7 = self._workspace.panel(1)
	self._gui_panel = self._workspace.panel(slot2).panel(slot2, self._workspace.panel(slot2))

	return 
end
function InstancesLayer:_update_overlay_gui()
	slot3 = self._gui_panel

	self._gui_panel.clear(slot2)

	slot4 = {
		valign = "scale",
		halign = "scale",
		color = Color.black
	}

	self._gui_panel.rect(slot2, self._gui_panel)

	if self._selected_instance then
		slot3 = self._selected_instance
		local instance_data = self._selected_instance.data(slot2)
	end

	slot4 = self._workspace
	slot4 = self._workspace.panel(slot3)
	local tot_w = self._workspace.panel(slot3).w(slot3)
	local tot_indices = 70000
	slot6 = managers.world_instance
	slot9 = managers.editor
	slot9 = managers.editor.current_continent(slot8)
	local start_indices, end_indices = managers.world_instance.get_used_indices(slot5, managers.editor.current_continent(slot8).name(slot8))
	slot8 = start_indices

	for i, start_index in ipairs(managers.editor.current_continent(slot8).name) do
		local x = start_index * tot_w / tot_indices
		local w = end_indices[i] * tot_w / tot_indices - x
		slot16 = {
			layer = 2,
			x = x,
			w = w,
			color = Color.green
		}

		self._gui_panel.rect(slot14, self._gui_panel)
	end

	if instance_data then
		local x = instance_data.start_index * tot_w / tot_indices
		local w = instance_data.index_size * tot_w / tot_indices
		slot11 = {
			layer = 3,
			x = x,
			w = w,
			color = Color.blue
		}

		self._gui_panel.rect(slot9, self._gui_panel)
	end

	return 
end
function InstancesLayer:on_simulation_started()
	slot5 = managers.world_instance

	for _, instance_data in ipairs(managers.world_instance.instance_data(slot4)) do
		if instance_data.mission_placed then
			slot9 = instance_data.name
			local instance_units = self.get_instance_units_by_name(slot7, self)
			slot9 = instance_units

			for name, units in pairs(self) do
				slot14 = units

				for _, unit in ipairs(slot13) do
					slot20 = name
					slot20 = unit

					managers.editor.layer(slot18, managers.editor).delete_unit(slot18, managers.editor.layer(slot18, managers.editor))
				end
			end

			self._stashed_instance_units[instance_data.name] = nil
		end
	end

	return 
end
function InstancesLayer:update_unit_settings(...)
	slot3 = self

	InstancesLayer.super.update_unit_settings(slot2, ...)

	slot4 = self._selected_instance

	managers.editor.on_reference_unit(slot2, managers.editor)

	return 
end
function InstancesLayer:activate()
	slot3 = self

	InstancesLayer.super.activate(slot2)

	if self._workspace then
		slot3 = self._workspace

		self._workspace.show(slot2)
	end

	return 
end
function InstancesLayer:deactivate()
	self._stashed_instance_units = {}
	slot3 = self

	InstancesLayer.super.deactivate(slot2)

	if self._workspace then
		slot3 = self._workspace

		self._workspace.hide(slot2)
	end

	return 
end
function InstancesLayer:add_triggers()
	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "_mouse_create_instance"

	vc.add_release_trigger(slot3, vc, callback("rmb", self, self))

	slot4 = self

	InstancesLayer.super.add_triggers(slot3)

	return 
end
function InstancesLayer:selected_amount_string()
	return "Selected " .. self._save_name .. ": " .. ((self._selected_instance and 1) or 0)
end
function InstancesLayer:clear()
	self._stashed_instance_units = {}
	self._selected_instance = nil
	slot3 = managers.world_instance

	managers.world_instance.clear(slot2)

	slot3 = self

	self._update_instances_listbox(slot2)

	slot3 = self

	self._update_overlay_gui(slot2)

	slot3 = self

	InstancesLayer.super.clear(slot2)

	return 
end
Reference = Reference or class()
function Reference:init(pos, rot)
	self._pos = pos
	self._rot = rot

	return 
end
function Reference:position()
	return self._pos
end
function Reference:rotation()
	return self._rot
end
Instance = Instance or class()
function Instance:init(data)
	self._data = data

	return 
end
function Instance:name()
	return self._data.name
end
function Instance:alive()
	return true
end
function Instance:data()
	return self._data
end
function Instance:position()
	return self._data.position or Vector3()
end
function Instance:rotation()
	return self._data.rotation or Rotation()
end

return 
