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
slot3 = "CoreStaticLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreInput"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

if not StaticLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

StaticLayer = slot0
function StaticLayer:init(owner, save_name, units_vector, slot_mask)
	slot9 = save_name

	StaticLayer.super.init(slot6, self, owner)

	slot8 = units_vector

	self.load_unit_map_from_vector(slot6, self)

	self._unit_name = ""
	slot9 = 0
	self._current_pos = Vector3(slot6, 0, 0)
	slot9 = 0
	self._offset_move_vec = Vector3(slot6, 0, 0)
	slot8 = {
		"move_forward",
		"move_back",
		"move_right",
		"move_left",
		"move_up",
		"move_down"
	}
	self._move_unit_rep = CoreInput.RepKey.new(slot6, CoreInput.RepKey)
	slot8 = self._editor_data.virtual_controller

	self._move_unit_rep.set_input(slot6, self._move_unit_rep)

	self._will_use_widgets = true
	slot8 = slot_mask
	self._slot_mask = managers.slot.get_mask(slot6, managers.slot)
	self._position_as_slot_mask = self._slot_mask
	self._ews_triggers = {}

	return 
end
function StaticLayer:clone_unit()
	slot3 = self

	if self.ctrl(slot2) then
		slot3 = self

		self.clone(slot2)

		slot3 = self

		self.cloned_group(slot2)
	end

	return 
end
function StaticLayer:move_to_continent(name)
	local delete_units = self._selected_units
	slot6 = name

	self.clone(slot4, self)

	slot5 = managers.editor

	managers.editor.freeze_gui_lists(slot4)

	slot5 = delete_units

	for _, unit in ipairs(slot4) do
		slot11 = unit

		print(slot9, "delete_unit")

		slot11 = unit

		self.delete_unit(slot9, self)
	end

	slot6 = name

	managers.editor.set_continent(slot4, managers.editor)

	slot5 = managers.editor

	managers.editor.thaw_gui_lists(slot4)

	return 
end
function StaticLayer:clone(to_continent)
	slot4 = managers.editor

	managers.editor.freeze_gui_lists(slot3)

	if self._selected_unit then
		slot4 = self

		if not self.condition(slot3) then
			local clone_units = self._selected_units
			slot5 = managers.editor

			if managers.editor.using_groups(slot4) then
				self._clone_create_group = true
			end

			self._selected_units = {}
			slot5 = clone_units

			for _, unit in ipairs(slot4) do
				local pos = unit.position(slot9)
				local rot = unit.rotation(unit)
				slot12 = unit
				self._unit_name = unit.name(unit).s(unit)
				local old_unit = unit
				slot17 = to_continent
				local new_unit = self.do_spawn_unit(unit.name(unit), self, self._unit_name, pos, rot)
				slot15 = new_unit

				self.remove_name_id(self, self)

				slot19 = old_unit
				slot17 = old_unit.unit_data(slot18).name_id
				slot13 = self.get_name_id(new_unit, self, new_unit)
				new_unit.unit_data(self).name_id = slot13
				slot15 = new_unit

				managers.editor.unit_name_changed(slot13, managers.editor)

				slot16 = old_unit

				self.clone_edited_values(slot13, self, new_unit)
			end

			slot5 = self

			self.update_unit_settings(slot4)
		end
	end

	slot4 = managers.editor

	managers.editor.thaw_gui_lists(slot3)

	slot4 = self

	self._cloning_done(slot3)

	return 
end
function StaticLayer:spawn_unit()
	if not self._grab then
		slot3 = self

		if not self.condition(slot2) then
			slot4 = self._unit_name

			self.do_spawn_unit(slot2, self)
		end
	end

	return 
end
function StaticLayer:do_spawn_unit(...)
	slot3 = self
	local unit = StaticLayer.super.do_spawn_unit(slot2, ...)

	if unit then
		slot5 = unit

		self.set_bodies_keyframed(slot3, self)
	end

	return unit
end
function StaticLayer:set_bodies_keyframed(unit)
	slot4 = unit
	local bodies = unit.num_bodies(slot3)

	for i = 0, bodies - 1, 1 do
		slot10 = i
		slot9 = unit.body(slot8, unit)

		if unit.body(slot8, unit).keyframed(slot8) then
			return 
		end
	end

	for i = 0, bodies - 1, 1 do
		slot10 = i
		local body = unit.body(slot8, unit)
		slot10 = body

		body.set_keyframed(unit)
	end

	return 
end
function StaticLayer:use_grab_info()
	slot3 = self

	StaticLayer.super.use_grab_info(slot2)

	if self._grab then
		self._grab = false
		slot3 = self
		slot6 = self._grab_info

		self.set_unit_positions(slot2, self._grab_info.position(slot5))

		slot7 = self._selected_unit
		slot7 = self._selected_unit.rotation(self._grab_info)
		slot4 = self._grab_info.rotation(slot5) * self._selected_unit.rotation(self._grab_info).inverse(self._grab_info)

		self.set_unit_rotations(slot2, self)
	end

	return 
end
function StaticLayer:set_unit_positions(pos)
	if not self._grab then
		slot5 = pos.z

		managers.editor.set_grid_altitude(slot3, managers.editor)
	end

	slot4 = managers.editor

	if managers.editor.use_beta_undo(slot3) then
		slot4 = TimerManager
		self._undo_last_move_t = TimerManager.now(slot3)
	end

	local reference = self._selected_unit
	slot5 = self._selected_units

	for _, unit in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		if unit ~= reference then
			slot12 = pos
			slot15 = reference

			self.set_unit_position(slot9, self, unit, reference.rotation(slot14))
		end
	end

	slot6 = pos

	reference.set_position(slot4, reference)

	slot5 = reference
	reference.unit_data(slot4).world_pos = pos
	slot7 = pos

	self._on_unit_moved(slot4, self, reference)

	return 
end
function StaticLayer:set_unit_position(unit, pos, rot)
	slot6 = unit
	slot7 = rot
	local new_pos = pos + unit.unit_data(slot5).local_pos.rotate_with(slot5, unit.unit_data(slot5).local_pos)
	slot8 = new_pos

	unit.set_position(unit.unit_data(slot5).local_pos, unit)

	slot7 = unit
	unit.unit_data(unit.unit_data(slot5).local_pos).world_pos = new_pos
	slot9 = new_pos

	self._on_unit_moved(unit.unit_data(slot5).local_pos, self, unit)

	slot7 = unit

	unit.set_moving(unit.unit_data(slot5).local_pos)

	return 
end
function StaticLayer:set_unit_rotations(rot)
	slot4 = managers.editor

	if managers.editor.use_beta_undo(slot3) then
		slot4 = TimerManager
		self._undo_last_move_t = TimerManager.now(slot3)
	end

	local reference = self._selected_unit
	local rot = rot * reference.rotation(slot4)
	slot7 = rot

	reference.set_rotation(reference, reference)

	slot8 = rot

	self._on_unit_rotated(reference, self, reference)

	slot6 = self._selected_units

	for _, unit in ipairs(reference) do

		-- Decompilation error in this vicinity:
		if unit ~= reference then
			slot15 = reference
			slot14 = rot

			self.set_unit_position(slot10, self, unit, reference.position(slot14))

			slot13 = rot

			self.set_unit_rotation(slot10, self, unit)
		end
	end

	return 
end
function StaticLayer:set_unit_rotation(unit, rot)
	local rot = rot * unit.unit_data(slot4).local_rot
	slot7 = rot

	unit.set_rotation(unit, unit)

	slot8 = rot

	self._on_unit_rotated(unit, self, unit)

	return 
end
function StaticLayer:_on_unit_moved(unit, pos)
	slot5 = unit

	if unit.ladder(slot4) then
		slot6 = pos

		unit.set_position(slot4, unit)

		slot5 = unit
		slot5 = unit.ladder(slot4)

		unit.ladder(slot4).set_config(slot4)
	end

	slot5 = unit

	if unit.zipline(slot4) then
		slot5 = unit
		slot6 = pos

		unit.zipline(slot4).set_start_pos(slot4, unit.zipline(slot4))
	end

	return 
end
function StaticLayer:_on_unit_rotated(unit, rot)
	slot5 = unit

	if unit.ladder(slot4) then
		slot6 = rot

		unit.set_rotation(slot4, unit)

		slot5 = unit
		slot5 = unit.ladder(slot4)

		unit.ladder(slot4).set_config(slot4)
	end

	return 
end
function StaticLayer:move_unit(btn, pressed)
	if self._selected_unit then
		self._grab = true
		slot6 = self._selected_unit
		self._grab_info = CoreEditorUtils.GrabInfo.new(slot4, CoreEditorUtils.GrabInfo)
		slot5 = managers.editor
	end

	return 
end
function StaticLayer:rotate_unit(btn, pressed)
	if self._selected_unit then
		slot5 = self

		if not self.condition(slot4) then
			local rot_axis = nil
			local snap_axis = self.snap_rotation_axis(slot5)
			slot7 = self

			if self.local_rot(self) then
				if snap_axis == "x" then
					slot7 = self._selected_unit
					slot7 = self._selected_unit.rotation(slot6)
					rot_axis = self._selected_unit.rotation(slot6).x(slot6)
				elseif snap_axis == "y" then
					slot7 = self._selected_unit
					slot7 = self._selected_unit.rotation(slot6)
					rot_axis = self._selected_unit.rotation(slot6).y(slot6)
				elseif snap_axis == "z" then
					slot7 = self._selected_unit
					slot7 = self._selected_unit.rotation(slot6)
					rot_axis = self._selected_unit.rotation(slot6).z(slot6)
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

			self.set_unit_rotations(rot_axis, self)
		end
	end

	return 
end
function StaticLayer:position_as()
	if self._selected_unit then
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

				self.set_unit_positions(slot4, ray.unit.position(slot7))

				slot9 = self._selected_unit
				slot9 = self._selected_unit.rotation(ray.unit)
				slot6 = ray.unit.rotation(slot7) * self._selected_unit.rotation(ray.unit).inverse(ray.unit)

				self.set_unit_rotations(slot4, self)
			end
		end
	end

	return 
end
function StaticLayer:set_select_unit(unit)
	slot5 = unit

	StaticLayer.super.set_select_unit(slot3, self)

	if unit then
		slot5 = unit

		self.set_bodies_keyframed(slot3, self)
	end

	slot4 = self._selected_unit

	if alive(slot3) then
		slot7 = self._selected_unit
		slot5 = self._selected_unit.position(slot6).z

		managers.editor.set_grid_altitude(slot3, managers.editor)
	end

	return 
end
function StaticLayer:release_unit()
	self._grab = false
	slot5 = 0
	self._offset_move_vec = Vector3(slot2, 0, 0)

	if self._selected_unit then
		slot6 = self._selected_unit
		slot4 = self._selected_unit.position(slot5).z

		managers.editor.set_grid_altitude(slot2, managers.editor)
	end

	return 
end
function StaticLayer:delete_selected_unit(btn, pressed)
	slot5 = managers.editor

	managers.editor.freeze_gui_lists(slot4)

	if self._selected_unit then
		slot5 = self

		if not self.condition(slot4) then
			local to_delete = CoreTable.clone(slot4)
			slot6 = to_delete

			for _, unit in ipairs(self._selected_units) do
				slot12 = unit

				if table.contains(slot10, self._created_units) then
					slot12 = unit

					self.delete_unit(slot10, self)
				else
					slot17 = unit
					slot15 = unit.unit_data(slot16).name_id
					slot20 = unit
					slot12 = "" .. tostring(slot14) .. " belongs to " .. tostring(managers.editor.unit_in_layer_name(slot18, managers.editor)) .. " and cannot be deleted from here."

					managers.editor.output_warning(slot10, managers.editor)
				end
			end
		end
	end

	slot5 = managers.editor

	managers.editor.thaw_gui_lists(slot4)

	return 
end
function StaticLayer:create_marker(marker)
	if self._selected_unit then
		slot4 = marker
		slot7 = self._selected_unit

		marker.set_pos(slot3, self._selected_unit.position(slot6))

		slot4 = marker
		slot7 = self._selected_unit

		marker.set_rot(slot3, self._selected_unit.rotation(slot6))

		return true
	end

	return 
end
function StaticLayer:use_marker(marker)
	if self._selected_unit then
		slot5 = marker._pos

		self.set_unit_positions(slot3, self)

		slot8 = self._selected_unit
		slot8 = self._selected_unit.rotation(slot7)
		slot5 = marker._rot * self._selected_unit.rotation(slot7).inverse(slot7)

		self.set_unit_rotations(slot3, self)
	end

	return 
end
function StaticLayer:reset_rotation()
	if self._selected_unit then
		slot3 = self
	end

	return 
end
function StaticLayer:update(t, dt)
	slot7 = dt

	self.draw_units(slot4, self, t)

	slot7 = dt

	self.draw_rotation(slot4, self, t)

	slot7 = dt

	StaticLayer.super.update(slot4, self, t)

	slot5 = self

	if not self.condition(slot4) then

		-- Decompilation error in this vicinity:
		slot7 = self._selected_unit
		local current_pos, current_rot = managers.editor.current_orientation(slot4, managers.editor, self._offset_move_vec)
		self._current_pos = current_pos or self._current_pos
		self._current_rot = current_rot

		if self._current_pos and self._grab then
			slot7 = self._selected_unit

			if alive(slot6) then
				slot8 = self._current_pos

				self.set_unit_positions(slot6, self)
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
function StaticLayer:draw_marker(t, dt)
	slot5 = managers.editor

	if not managers.editor.layer_draw_marker(slot4) then
		return 
	end

	local ray = nil
	slot6 = self._selected_unit

	if alive(slot5) then
		slot12 = 2000
		slot13 = -500
		slot10 = self._slot_mask
		ray = self._selected_unit.raycast(slot5, self._selected_unit, self._current_pos + Vector3(slot9, 0, 0), self._current_pos + Vector3(0, 0, 0), nil)
	else
		slot12 = 2000
		slot13 = -500
		slot10 = self._slot_mask
		ray = World.raycast(slot5, World, self._current_pos + Vector3(slot9, 0, 0), self._current_pos + Vector3(0, 0, 0), nil)
	end

	if ray and ray.unit then
		slot12 = 2000
		slot13 = 2000
		slot11 = 0

		Application.draw_line(slot5, Application, self._current_pos - Vector3(slot9, 0, 0), self._current_pos + Vector3(0, 0, 0), 1, 0)

		slot11 = 0

		Application.draw_sphere(slot5, Application, self._current_pos, self._marker_sphere_size, 1, 0)
	else
		slot12 = 2000
		slot13 = 2000
		slot11 = 0

		Application.draw_line(slot5, Application, self._current_pos - Vector3(slot9, 0, 0), self._current_pos + Vector3(0, 0, 0), 0, 1)

		slot11 = 0

		Application.draw_sphere(slot5, Application, self._current_pos, self._marker_sphere_size, 0, 1)
	end

	return 
end
function StaticLayer:update_move_triggers(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = self._selected_unit
	slot7 = dt

	if not self._move_unit_rep.update(slot4, self._move_unit_rep, d) or CoreInput.shift() then
		return 
	end

	local mov_vec = nil
	local u_rot = self._selected_unit.rotation(slot5)
	slot7 = self._ctrl
	slot10 = "move_forward"

	if self._ctrl.down(self._selected_unit, Idstring(slot9)) then

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
		slot8 = self._selected_unit.position(slot9) + mov_vec * self.grid_size(self._selected_unit)

		self.set_unit_positions(slot6, self)
	end

	return 
end
function StaticLayer:update_rotate_triggers(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = self._selected_unit
	local rot_speed = self.rotation_speed(slot4) * dt
	slot6 = self

	if self.shift(self) then
		rot_speed = rot_speed / 2
	end

	local rot_axis = nil
	local u_rot = self._selected_unit.rotation(slot6)
	slot8 = self._ctrl
	slot11 = "roll_left"

	if self._ctrl.down(self._selected_unit, Idstring(slot10)) then

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

		self.set_unit_rotations(rot_axis, self)
	end

	return 
end
function StaticLayer:draw_rotation(t, dt)
	slot5 = self._selected_unit

	if not alive(slot4) then
		return 
	end

	slot6 = 500
	local p_rot = self._owner.get_cursor_look_point(slot4, self._owner)
	slot6 = self

	if self.local_rot(self._owner) then
		slot7 = p_rot
		slot10 = self._selected_unit

		Application.draw_rotation(slot5, Application, self._selected_unit.rotation(slot9))
	else
		slot7 = p_rot
		slot12 = 0

		Application.draw_rotation(slot5, Application, Rotation(slot9, 0, 0))
	end

	return 
end
function StaticLayer:draw_units(t, dt)
	if self._selected_units then
		slot5 = self._selected_units

		for _, unit in ipairs(slot4) do
			slot10 = unit

			if alive(slot9) and unit ~= self._selected_unit then
				slot14 = 1

				Application.draw(slot9, Application, unit, 1, 1)
			end
		end
	end

	slot5 = self._selected_unit

	if not alive(slot4) then
		return 
	end

	slot6 = self._selected_unit.position(slot7)
	slot9 = self._selected_unit

	Application.draw_rotation(slot4, Application, self._selected_unit.rotation(self._selected_unit))

	slot9 = 0

	Application.draw(slot4, Application, self._selected_unit, 0, 1)

	return 
end
function StaticLayer:build_panel(notebook, settings)
	slot6 = "StaticLayer:build_panel"

	cat_print(slot4, "editor")

	slot8 = "VSCROLL"
	self._ews_panel = EWS.ScrolledWindow(slot4, EWS, notebook, "")
	slot10 = 0

	self._ews_panel.set_scroll_rate(slot4, Vector3("", 0, 20))

	slot10 = 0
	slot6 = Vector3("", 0, 0)
	slot11 = -1

	self._ews_panel.set_virtual_size_hints(slot4, self._ews_panel, Vector3(0, 1, -1))

	slot6 = "VERTICAL"
	self._main_sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = self._main_sizer

	self._ews_panel.set_sizer(slot4, self._ews_panel)

	slot6 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot4, EWS)
	slot6 = "HORIZONTAL"
	local static_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND"

	self._sizer.add(EWS, self._sizer, static_sizer, 0, 0)

	slot6 = self

	self.build_name_id(EWS)

	slot9 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot6 = self

	self.add_btns_to_toolbar(EWS)

	slot6 = self._btn_toolbar

	self._btn_toolbar.realize(EWS)

	slot10 = "EXPAND,BOTTOM"

	self._sizer.add(EWS, self._sizer, self._btn_toolbar, 0, 1)

	slot10 = settings
	slot10 = "EXPAND"

	self._sizer.add(self._ews_panel, self._sizer, self.build_units(0, self), (settings and settings.units_noteboook_proportion) or 1, 0)

	slot10 = "EXPAND"

	self._main_sizer.add(self._ews_panel, self._main_sizer, self._sizer, 1, 0)

	return self._ews_panel
end
function StaticLayer:build_btn_toolbar()
	return 
end
function StaticLayer:add_btns_to_toolbar()
	slot8 = "toolbar\\hide_16x16.png"

	self._btn_toolbar.add_tool(slot2, self._btn_toolbar, "HIDE_ALL", "Hide All", CoreEws.image_path(slot7))

	slot10 = "hide_all"

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "HIDE_ALL", "EVT_COMMAND_MENU_SELECTED", callback("Hide All", self, self))

	slot8 = "toolbar\\show_16x16.png"

	self._btn_toolbar.add_tool(slot2, self._btn_toolbar, "UNHIDE_ALL", "Unhide All", CoreEws.image_path(nil))

	slot10 = "unhide_all"
	slot7 = nil

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "UNHIDE_ALL", "EVT_COMMAND_MENU_SELECTED", callback("Unhide All", self, self))

	return 
end
function StaticLayer:get_help(text)
	local t = "\t"
	local n = "\n"
	text = text .. "Create unit:        Right mouse button" .. n
	text = text .. "Select unit:        Left mouse button" .. n
	text = text .. "Snap rotate:        Middle mouse button or K" .. n
	text = text .. "Move unit:          Thumb mouse button (keep pressed to drag)" .. n
	text = text .. "Remove unit:        Delete" .. n
	text = text .. "Align with unit:    Point and press P" .. n
	text = text .. "Sample unit:        Point and press B" .. n
	text = text .. "Replace unit:       Press R" .. n
	text = text .. "Clone unit:         Ctrl+V" .. n
	text = text .. "Clone values:       Point and press M, selected unit will apply its values to targeted unit. Combined with shift the selected unit will inherit the target unit values." .. n
	text = text .. "Toggle local/world: Numpad 0" .. n
	text = text .. "Rotate around X:    Numpad 8 and 2" .. n
	text = text .. "Rotate around Y:    Numpad 1 and 3" .. n
	text = text .. "Rotate around Z:    Numpad 4 and 6" .. n
	text = text .. "Reset rotation:     Numpad-Enter (reset but keeps Z-rotation, combine with shift to reset Z as well)" .. n
	text = text .. "Hide / Unide:       Ctrl+J will hide the selected units, CTRL+SHIFT+J will unide all hidden units" .. n

	return text
end
function StaticLayer:undo()
	slot3 = managers.editor

	if not managers.editor.use_beta_undo(slot2) then
		return 
	end

	if self._undo_last_move_pos then
		self._redo_last_move_pos = {}
		slot3 = self._undo_last_move_pos

		for _, pos_info in ipairs(slot2) do
			local unit = pos_info.unit
			slot9 = unit

			if alive(slot8) then
				local new_pos = pos_info.pos
				local new_rot = pos_info.rot
				slot14 = unit
				slot14 = unit
				self._redo_last_move_pos[#self._redo_last_move_pos + 1] = {
					unit = unit,
					pos = unit.position(slot13),
					rot = unit.rotation(slot13)
				}
				slot12 = new_pos

				unit.set_position(#self._redo_last_move_pos + 1, unit)

				slot11 = unit
				unit.unit_data(#self._redo_last_move_pos + 1).world_pos = new_pos
				slot13 = new_pos

				self._on_unit_moved(#self._redo_last_move_pos + 1, self, unit)

				slot11 = unit

				unit.set_moving(#self._redo_last_move_pos + 1)

				slot12 = new_rot

				unit.set_rotation(#self._redo_last_move_pos + 1, unit)

				slot13 = new_rot

				self._on_unit_rotated(#self._redo_last_move_pos + 1, self, unit)
			end
		end

		self._undo_last_move_pos = self._redo_last_move_pos
		self._redo_last_move_pos = nil
	end

	return 
end
function StaticLayer:deactivate()
	slot3 = self

	StaticLayer.super.deactivate(slot2)

	return 
end
function StaticLayer:add_triggers()
	StaticLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "spawn_unit"

	vc.add_trigger(self, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "use_grab_info"

	vc.add_trigger(self, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "rotate_unit"

	vc.add_trigger(self, vc, callback("mmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "move_unit"

	vc.add_trigger(self, vc, callback("move_unit", self, self))

	slot5 = Idstring(callback)
	slot10 = "release_unit"

	vc.add_release_trigger(self, vc, callback("move_unit", self, self))

	slot5 = Idstring(callback)
	slot10 = "delete_selected_unit"

	vc.add_trigger(self, vc, callback("destroy", self, self))

	slot5 = Idstring(callback)
	slot10 = "position_as"

	vc.add_trigger(self, vc, callback("position_as", self, self))

	slot5 = Idstring(callback)
	slot10 = "show_replace_units"

	vc.add_trigger(self, vc, callback("show_replace_units", self, self))

	slot5 = Idstring(callback)
	slot10 = "reset_rotation"

	vc.add_trigger(self, vc, callback("reset_rotation", self, self))

	slot5 = Idstring(callback)
	slot10 = "clone_unit"

	vc.add_trigger(self, vc, callback("clone", self, self))

	slot5 = Idstring(callback)
	slot10 = "rotate_unit"

	vc.add_trigger(self, vc, callback("snap_rotate", self, self))

	slot4 = self._ews_triggers

	for k, cb in pairs(self) do
		slot12 = k
		slot11 = cb

		vc.add_trigger(slot8, vc, Idstring(slot11))
	end

	return 
end

return 
