-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreBrushLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreUnit"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

if not BrushLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

BrushLayer = slot0
function BrushLayer:init(owner, dont_load_unit_map)
	BrushLayer.super.init(slot4, self, owner)

	self._brush_names = {}
	self._brush_types = {}
	self._brush_size = 15
	self._brush_density = 3
	self._brush_pressure = 1
	self._random_roll = 0
	self._spraying = false
	self._erasing = false
	self._brush_height = 40
	self._angle_override = 0
	self._offset = 0
	self._visible = true
	self._erase_with_pressure = false
	self._erase_with_units = false
	self._overide_surface_normal = false
	self._brush_on_editor_bodies = false
	slot5 = self
	slot8 = "brush"

	self.load_unit_map_from_vector(slot4, CoreEditorUtils.layer_type("brush"))

	slot6 = "brush_placeable"
	self._place_slot_mask = managers.slot.get_mask(slot4, managers.slot)
	slot6 = "brushes"
	self._brush_slot_mask = managers.slot.get_mask(slot4, managers.slot)
	self._unit_brushes = {}
	self._brushed_path = "core/temp/editor_temp/brushes"
	slot5 = self

	self.load_brushes(slot4)

	return 
end
function BrushLayer:load(world_holder, offset)
	slot8 = offset

	world_holder.create_world(slot4, world_holder, "world", self._save_name)

	self._amount_dirty = true

	return 
end
function BrushLayer:save(save_params)
	local file_name = "massunit"
	local t = {
		single_data_block = true,
		entry = self._save_name,
		data = {
			file = file_name
		}
	}
	slot7 = t.data

	self._add_project_save_data(slot5, self)

	slot7 = t

	managers.editor.add_save_data(slot5, managers.editor)

	slot7 = save_params.dir .. "\\" .. file_name .. ".massunit"

	self._save_brushfile(slot5, self)

	return 
end
function BrushLayer:_save_brushfile(path)
	slot5 = path

	MassUnitManager.save(slot3, MassUnitManager)

	slot8 = managers.database
	slot11 = path

	managers.editor.add_to_world_package(slot3, managers.editor)

	slot6 = MassUnitManager

	for _, unit_name in ipairs(MassUnitManager.list({
		category = "massunits",
		name = managers.database.entry_path(slot7, path.s(slot10))
	})) do
		slot10 = {
			category = "units",
			name = unit_name.s(slot12)
		}
		slot13 = unit_name

		managers.editor.add_to_world_package(slot8, managers.editor)
	end

	return 
end
function BrushLayer:reposition_all()
	slot4 = "Reposition all brushes:"

	managers.editor.output(slot2, managers.editor)

	slot3 = self._unit_map

	for name, unit in pairs(slot2) do
		slot9 = name
		name = self.get_real_name(slot7, self)
		slot9 = Vector3(slot10, 0, 0)
		slot16 = 0
		slot17 = 0
		slot13 = Vector3(1, 0, 1)
		slot18 = 1
		local unit = safe_spawn_unit(slot7, name, Rotation(0, Vector3(20000, 1, 0), Vector3(0, 0, 0)))

		if unit then
			local dynamic_unit = false
			local index = 0
			slot11 = unit

			while index < unit.num_bodies(slot10) and not dynamic_unit do
				slot12 = index
				slot11 = unit.body_by_index(slot10, unit)

				if unit.body_by_index(slot10, unit).dynamic(slot10) then
					dynamic_unit = true
				end

				index = index + 1
			end

			slot12 = unit

			World.delete_unit(slot10, World)

			if dynamic_unit then
				slot12 = " * Skipped unit type " .. name .. " it seems to be dynamic"

				managers.editor.output(slot10, managers.editor)
			else
				local nudged_units = 0
				slot13 = name
				local positions = MassUnitManager.unit_positions(slot11, MassUnitManager)

				if 0 < #positions then
					slot14 = name
					local rotations = MassUnitManager.unit_rotations(slot12, MassUnitManager)
					slot15 = name

					MassUnitManager.delete_units(MassUnitManager, MassUnitManager)

					for counter = 1, #positions, 1 do
						local rot = rotations[counter]
						local pos = positions[counter]
						local from = pos + rot.z(slot19) * 50
						slot21 = rot
						local to = pos - rot.z(rot) * 110
						local ray_type = (self._brush_on_editor_bodies and "body editor") or "body"
						slot27 = to
						local ray = managers.editor.select_unit_by_raycast(slot22, managers.editor, self._place_slot_mask, ray_type, from)

						if ray then
							slot25 = name
							local brush_header = self.add_brush_header(slot23, self)
							slot27 = rotations[counter]
							local correct_pos = brush_header.spawn_brush(self, brush_header, ray.position)
							self._amount_dirty = true
							slot26 = ray.position - correct_pos
							local nudge_length = ray.position - correct_pos.length(brush_header)

							if 0.05 < nudge_length then
								nudged_units = nudged_units + 1
							end
						else
							slot28 = pos

							Application.error(slot23, Application, " * Lost one of type", name, "- it was too alone at:")

							slot25 = " * Lost one of type " .. name .. " - it was too alone at: " .. pos

							managers.editor.output(slot23, managers.editor)
						end
					end
				end

				if 0 < nudged_units then
					slot14 = " * Nudged " .. nudged_units .. " units of type " .. name

					managers.editor.output(slot12, managers.editor)
				end
			end
		end
	end

	return 
end
function BrushLayer:reload()
	slot3 = self._unit_map

	for name, unit in pairs(slot2) do
		slot9 = name
		name = self.get_real_name(slot7, self)
	end

	return 
end
function BrushLayer:clear_all()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "This will delete all brushes in this level, are you sure?", "Brush", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = MassUnitManager

	MassUnitManager.delete_all_units(slot3)

	self._amount_dirty = true

	return 
end
function BrushLayer:clear_unit()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "This will delete all selected brushes in this level, are you sure?", "Brush", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot4 = self._brush_names

	for _, name in ipairs(slot3) do
		slot9 = MassUnitManager
		slot12 = name

		MassUnitManager.delete_units(slot8, Idstring(slot11))
	end

	self._amount_more_dirty = true

	return 
end
function BrushLayer:clear_units_by_name(name)
	slot8 = "YES_NO,ICON_QUESTION"
	slot13 = 0
	local confirm = EWS.message_box(slot3, EWS, Global.frame_panel, "This will delete all " .. name .. " brushes in this level, are you sure?", "Brush", Vector3(slot10, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot5 = MassUnitManager
	slot8 = name

	MassUnitManager.delete_units(slot4, Idstring(slot7))

	self._amount_more_dirty = true

	return 
end
function BrushLayer:_on_amount_updated()
	slot3 = self
	local brush_stats, total = self.get_brush_stats(slot2)
	slot6 = "Units Total: " .. total.amount

	self._debug_units_total.set_label(slot4, self._debug_units_total)

	slot6 = "Units Unique: " .. total.unique

	self._debug_units_unique.set_label(slot4, self._debug_units_unique)

	if self._debug_list then
		slot5 = self._debug_list

		if self._debug_list.visible(slot4) then
			slot5 = self._debug_list

			self._debug_list.fill_unit_list(slot4)
		end
	end

	return 
end
function BrushLayer:set_visibility(cb)
	slot4 = cb
	self._visible = cb.get_value(slot3)
	slot5 = self._visible

	MassUnitManager.set_visibility(slot3, MassUnitManager)

	return 
end
function BrushLayer:select()
	return 
end
function BrushLayer:spray_units()
	if not self._visible then
		return 
	end

	slot3 = self

	self.erase_units_release(slot2)

	self._spraying = true

	return 
end
function BrushLayer:spray_units_release()
	if self._spraying then
		self._spraying = false
	end

	return 
end
function BrushLayer:erase_units()
	if not self._visible then
		return 
	end

	slot3 = self

	self.spray_units_release(slot2)

	self._erasing = true

	return 
end
function BrushLayer:erase_units_release()
	if self._erasing then
		self._erasing = false
	end

	return 
end
function BrushLayer:update(time, rel_time)
	if self._amount_dirty then
		self._amount_dirty = nil
		slot5 = self

		self._on_amount_updated(slot4)
	end

	if self._amount_more_dirty then
		self._amount_more_dirty = nil
		self._amount_dirty = true
	end

	slot6 = 0
	local from = self._owner.get_cursor_look_point(slot4, self._owner)
	slot7 = 5000
	local to = self._owner.get_cursor_look_point(self._owner, self._owner)
	local ray_type = (self._brush_on_editor_bodies and "body editor") or "body"
	slot10 = ray_type
	local ray = managers.editor.select_unit_by_raycast(slot7, managers.editor, self._place_slot_mask)
	local base, tip = nil

	if ray then
		slot17 = ray.normal

		Application.draw_circle(slot10, Application, ray.position + ray.normal * 0.1, self._brush_size, 0, 0.7, 0)

		slot17 = ray.normal

		Application.draw_circle(slot10, Application, ray.position + ray.normal * 0.1 + ray.normal * self._offset, self._brush_size, 0, 1, 0)

		base = ray.position - ray.normal * 40 - ray.normal * self._offset
		tip = ray.position + ray.normal * self._brush_height + ray.normal * self._offset
		slot17 = ray.normal

		Application.draw_circle(ray.normal * self._offset, Application, tip, self._brush_size, 0, 0.7, 0)
	else
		slot11 = to - from
		local ray_normal = to - from.normalized(slot10)
		base = from + ray_normal * 1000
		tip = from + ray_normal * 10000
		local tunnel = 9000

		while 0 < tunnel do
			slot19 = ray_normal

			Application.draw_circle(slot12, Application, base + ray_normal * tunnel, self._brush_size, 0.3 + 0.7 * tunnel / 9000, 0, 0)

			tunnel = tunnel * 0.9 - 100
		end

		slot19 = ray_normal

		Application.draw_circle(slot12, Application, base, self._brush_size, 0.3, 0.2, 0.2)
	end

	if (self._spraying and ray) or self._erasing then
		slot16 = self._brush_slot_mask
		local units = World.find_units_quick(slot10, World, "cylinder", base, tip, self._brush_size)
		slot13 = 2
		local area = 3.1416 * math.pow(World, self._brush_size / 100)
		local density = #units / area

		if self._spraying then
			local created = 0

			while created < self._brush_pressure and density <= self._brush_density do
				slot15 = self._brush_size * self._brush_size
				local nudge_amount = 1 - math.rand(slot14) / (self._brush_size * self._brush_size)
				local rand_nudge = ray.normal.random_orthogonal(self._brush_size) * self._brush_size * nudge_amount
				slot21 = base + rand_nudge
				local place_ray = managers.editor.select_unit_by_raycast(ray.normal, managers.editor, self._place_slot_mask, ray_type, tip + rand_nudge)
				slot19 = place_ray

				self.create_brush(managers.editor, self)

				created = created + 1
				density = (#units + created) / area
			end

			if self._brush_density == 0 then
				slot15 = self

				self.spray_units_release(slot14)
			end
		elseif self._erasing then
			if self._erase_with_pressure and ray then
				local removed = 0

				while removed < self._brush_pressure and removed < #units do
					removed = removed + 1
					local found = true

					if self._erase_with_units then
						found = false

						while not found and removed <= #units do
							slot16 = self._brush_names
							slot19 = units[removed]
							slot19 = units[removed].name(slot18)

							if table.contains(slot15, units[removed].name(slot18).s(slot18)) then
								found = true
							else
								removed = removed + 1
							end
						end
					end

					if found then
						slot17 = units[removed]

						World.delete_unit(slot15, World)

						self._amount_dirty = true
					end
				end

				if self._brush_density == 0 then
					slot15 = self

					self.erase_units_release(slot14)
				end
			else
				slot14 = units

				for _, brush in ipairs(slot13) do
					if self._erase_with_units and self._erase_with_units then
						slot19 = self._brush_names
						slot22 = brush
						slot22 = brush.name(slot21)

						if table.contains(slot18, brush.name(slot21).s(slot21)) then
							slot20 = brush

							World.delete_unit(slot18, World)

							self._amount_dirty = true
						end
					end
				end
			end
		end
	end

	if self._debug_draw_unit_orientation then
		slot11 = self

		self._draw_unit_orientations(slot10)
	end

	return 
end
function BrushLayer:_draw_unit_orientations()
	local brush_stats = self.get_brush_stats(slot2)
	slot4 = brush_stats

	for _, stats in ipairs(self) do
		for i = 1, stats.amount, 1 do
			slot15 = stats.rotations[i]

			Application.draw_rotation(slot12, Application, stats.positions[i])
		end
	end

	return 
end
function BrushLayer:add_brush_header(name)
	if not self._brush_types[name] then
		local header = BrushHeader.new(slot3)
		slot6 = name

		header.set_name(BrushHeader, header)

		self._brush_types[name] = header

		return header
	else
		return self._brush_types[name]
	end

	return 
end
function BrushLayer:create_brush(ray)
	if 0 < #self._brush_names and ray then

		-- Decompilation error in this vicinity:
		slot7 = #self._brush_names
		slot5 = 1 + math.rand(slot6)
		local name = self._brush_names[math.floor(slot4)]
		slot6 = name

		self.add_brush_header(slot4, self)

		local brush_type = self._brush_types[name]
		slot8 = 1
		local at = Vector3(self, 0, 0)
		local right = nil
		slot10 = up.z

		if 0.7 < math.abs(slot9) then
			slot10 = self._owner._vp
			local camera_rot = self._owner._vp.camera(slot9).rotation(slot9)
			slot11 = camera_rot
			slot12 = up

			if camera_rot.z(self._owner._vp.camera(slot9)).dot(self._owner._vp.camera(slot9), camera_rot.z(self._owner._vp.camera(slot9))) < 0.7 then
				slot11 = camera_rot
				slot12 = up
				slot12 = rand_rotator
				right = camera_rot.z(slot10).cross(slot10, camera_rot.z(slot10)).rotate_with(slot10, camera_rot.z(slot10).cross(slot10, camera_rot.z(slot10)))
				slot12 = right
				at = up.cross(slot10, up)
			else
				slot11 = up
				slot14 = camera_rot
				slot12 = rand_rotator
				at = up.cross(slot10, camera_rot.x(slot13)).rotate_with(slot10, up.cross(slot10, camera_rot.x(slot13)))
				slot12 = up
				right = at.cross(slot10, at)
			end
		else
			slot11 = up
			slot11 = rand_rotator
			right = at.cross(slot9, at).rotate_with(slot9, at.cross(slot9, at))
			slot11 = right
			at = up.cross(slot9, up)
		end

		slot11 = ray.position + up * self._offset
		slot16 = up

		brush_type.spawn_brush(slot9, brush_type, Rotation(slot13, right, at))

		self._amount_dirty = true
	end

	return 
end
function BrushLayer:build_panel(notebook)
	slot5 = "BrushLayer:build_panel"

	cat_print(slot3, "editor")

	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "HORIZONTAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot5 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = "VERTICAL"
	local ctrl_sizer = EWS.StaticBoxSizer(slot3, EWS, self._ews_panel)
	slot12 = 360
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider("TAB_TRAVERSAL", self, "Random Roll [deg]", "_random_roll", 0), 0, 0)

	slot12 = 1000
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Radius [cm]", "_brush_size", 1), 0, 0)

	slot12 = 30
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Density [/m2]", "_brush_density", 0), 0, 0)

	slot12 = 20
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Pressure", "_brush_pressure", 1), 0, 0)

	slot12 = 1000
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Height [cm]", "_brush_height", 10), 0, 0)

	slot12 = 360
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Angle [deg]", "_angle_override", 0), 0, 0)

	slot13 = 0
	slot9 = "EXPAND"

	ctrl_sizer.add(EWS, ctrl_sizer, self.create_slider(0, self, "Offset [cm]", "_offset", -30, 1000), 0, 0)

	slot8 = ""
	local pressure_cb = EWS.CheckBox(EWS, EWS, self._ews_panel, "Use Pressure when Erasing")
	slot7 = self._erase_with_pressure

	pressure_cb.set_value(EWS, pressure_cb)

	slot10 = "SHAPED,TOP"

	ctrl_sizer.add(EWS, ctrl_sizer, pressure_cb, 0, 5)

	slot12 = "cb_toogle"
	slot9 = {
		value = "_erase_with_pressure",
		cb = pressure_cb
	}

	pressure_cb.connect(EWS, pressure_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(5, self, self))

	slot9 = ""
	local erase_cb = EWS.CheckBox(EWS, EWS, self._ews_panel, "Erase with selected units")
	slot8 = self._erase_with_units

	erase_cb.set_value(EWS, erase_cb)

	slot11 = "SHAPED"

	ctrl_sizer.add(EWS, ctrl_sizer, erase_cb, 0, 0)

	slot13 = "cb_toogle"
	slot10 = {
		value = "_erase_with_units",
		cb = erase_cb
	}

	erase_cb.connect(EWS, erase_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(0, self, self))

	slot10 = ""
	local force_up_cb = EWS.CheckBox(EWS, EWS, self._ews_panel, "Override surface normal rotation")
	slot9 = self._overide_surface_normal

	force_up_cb.set_value(EWS, force_up_cb)

	slot12 = "SHAPED"

	ctrl_sizer.add(EWS, ctrl_sizer, force_up_cb, 0, 0)

	slot14 = "cb_toogle"
	slot11 = {
		value = "_overide_surface_normal",
		cb = force_up_cb
	}

	force_up_cb.connect(EWS, force_up_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(0, self, self))

	slot11 = ""
	local brush_on_editor_bodies_cb = EWS.CheckBox(EWS, EWS, self._ews_panel, "Brush on editor bodies")
	slot10 = self._brush_on_editor_bodies

	brush_on_editor_bodies_cb.set_value(EWS, brush_on_editor_bodies_cb)

	slot13 = "SHAPED"

	ctrl_sizer.add(EWS, ctrl_sizer, brush_on_editor_bodies_cb, 0, 0)

	slot15 = "cb_toogle"
	slot12 = {
		value = "_brush_on_editor_bodies",
		cb = brush_on_editor_bodies_cb
	}

	brush_on_editor_bodies_cb.connect(EWS, brush_on_editor_bodies_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(0, self, self))

	slot13 = "EXPAND"

	self._sizer.add(EWS, self._sizer, ctrl_sizer, 0, 0)

	slot12 = ""
	local btn_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "HORIZONTAL")
	slot14 = "BU_EXACTFIT,NO_BORDER"
	local reposition_btn = EWS.Button(EWS, EWS, self._ews_panel, "Reposition All", "")
	slot15 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, reposition_btn, 0, 5)

	slot17 = "reposition_all"
	slot14 = nil

	reposition_btn.connect(EWS, reposition_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot15 = "BU_EXACTFIT,NO_BORDER"
	local reload_btn = EWS.Button(EWS, EWS, self._ews_panel, "Reload", "")
	slot13 = false

	reload_btn.set_enabled(EWS, reload_btn)

	slot13 = "Need engine support to implement fully"

	reload_btn.set_tool_tip(EWS, reload_btn)

	slot16 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, reload_btn, 0, 5)

	slot18 = "reload"
	slot15 = nil

	reload_btn.connect(EWS, reload_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot16 = "BU_EXACTFIT,NO_BORDER"
	local clear_unit_btn = EWS.Button(EWS, EWS, self._ews_panel, "Clear Unit", "")
	slot14 = true

	clear_unit_btn.set_enabled(EWS, clear_unit_btn)

	slot14 = "This will clear all brushes"

	clear_unit_btn.set_tool_tip(EWS, clear_unit_btn)

	slot17 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, clear_unit_btn, 0, 5)

	slot19 = "clear_unit"
	slot16 = nil

	clear_unit_btn.connect(EWS, clear_unit_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot17 = "BU_EXACTFIT,NO_BORDER"
	local clear_all_btn = EWS.Button(EWS, EWS, self._ews_panel, "Clear All", "")
	slot15 = true

	clear_all_btn.set_enabled(EWS, clear_all_btn)

	slot15 = "This will clear all brushes"

	clear_all_btn.set_tool_tip(EWS, clear_all_btn)

	slot18 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, clear_all_btn, 0, 5)

	slot20 = "clear_all"
	slot17 = nil

	clear_all_btn.connect(EWS, clear_all_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot18 = "ALIGN_RIGHT"
	local visible_cb = EWS.CheckBox(EWS, EWS, self._ews_panel, "Visible", "")
	slot16 = self._visible

	visible_cb.set_value(EWS, visible_cb)

	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	btn_sizer.add(EWS, btn_sizer, visible_cb, 1, 10)

	slot21 = "set_visibility"
	slot18 = visible_cb

	visible_cb.connect(EWS, visible_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(10, self, self))

	slot19 = "EXPAND"

	self._sizer.add(EWS, self._sizer, btn_sizer, 0, 0)

	slot18 = "Debug"
	local debug_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot20 = "EXPAND"

	self._sizer.add(EWS, self._sizer, debug_sizer, 0, 0)

	slot19 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")

	debug_sizer.add(EWS, debug_sizer, toolbar, 1, 1)

	slot22 = "image_16x16.png"

	toolbar.add_check_tool(EWS, toolbar, "DEBUG_DRAW", "Draw unit orientations", CoreEws.image_path("EXPAND,BOTTOM"))

	slot19 = self._debug_draw_unit_orientation

	toolbar.set_tool_state(EWS, toolbar, "DEBUG_DRAW")

	slot24 = "toolbar_toggle"

	toolbar.connect(EWS, toolbar, "DEBUG_DRAW", "EVT_COMMAND_MENU_SELECTED", callback("Draw unit orientations", nil, CoreEditorUtils))

	slot22 = "magnifying_glass_16x16.png"

	toolbar.add_tool(EWS, toolbar, "DEBUG_LIST", "Open debug list", CoreEws.image_path({
		value = "_debug_draw_unit_orientation",
		class = self,
		toolbar = toolbar
	}))

	slot24 = "_on_gui_open_debug_list"
	slot21 = nil

	toolbar.connect(EWS, toolbar, "DEBUG_LIST", "EVT_COMMAND_MENU_SELECTED", callback("Open debug list", self, self))

	slot17 = toolbar

	toolbar.realize(EWS)

	slot21 = "ALIGN_LEFT"
	self._debug_units_total = EWS.StaticText(EWS, EWS, self._ews_panel, "Units Total:", "")
	slot21 = "ALIGN_LEFT"
	self._debug_units_unique = EWS.StaticText(EWS, EWS, self._ews_panel, "Units Unique:", "")
	slot21 = "EXPAND"

	debug_sizer.add(EWS, debug_sizer, self._debug_units_total, 0, 0)

	slot21 = "EXPAND"

	debug_sizer.add(EWS, debug_sizer, self._debug_units_unique, 0, 0)

	local units_params = {
		style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING",
		unit_events = {
			"EVT_COMMAND_LIST_ITEM_DESELECTED"
		}
	}
	slot22 = units_params
	slot22 = "EXPAND"

	self._sizer.add(debug_sizer, self._sizer, self.build_units(0, self), 1, 0)

	slot19 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(debug_sizer, EWS)
	slot23 = "BU_EXACTFIT,NO_BORDER"
	local create_brush_btn = EWS.Button(EWS, EWS, self._ews_panel, "Create Brush", "")
	slot24 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, create_brush_btn, 0, 5)

	slot24 = "BU_EXACTFIT,NO_BORDER"
	local remove_brush_btn = EWS.Button(EWS, EWS, self._ews_panel, "Remove Brush", "")
	slot25 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, remove_brush_btn, 0, 5)

	slot25 = "EXPAND"

	self._sizer.add(EWS, self._sizer, btn_sizer, 0, 0)

	slot24 = "Brushes"
	local brushes_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "HORIZONTAL")
	slot25 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	local brushes = EWS.ListBox(EWS, EWS, self._ews_panel, "brush_layer_brushes")
	slot23 = self._unit_brushes

	for name, _ in pairs(EWS) do
		slot29 = name

		brushes.append(slot27, brushes)
	end

	slot27 = "EXPAND"

	brushes_sizer.add(slot22, brushes_sizer, brushes, 1, 0)

	slot27 = "EXPAND"

	self._sizer.add(slot22, self._sizer, brushes_sizer, 1, 0)

	slot27 = "LEFT,RIGHT,EXPAND"

	self._main_sizer.add(slot22, self._main_sizer, self._sizer, 2, 2)

	self._brushes_ctrlr = brushes
	slot29 = "select_brush"

	brushes.connect(slot22, brushes, "EVT_COMMAND_LISTBOX_SELECTED", callback(2, self, self))

	slot29 = "show_create_brush"

	create_brush_btn.connect(slot22, create_brush_btn, "EVT_COMMAND_BUTTON_CLICKED", callback({
		brushes = brushes
	}, self, self))

	slot29 = "remove_brush"
	slot26 = brushes

	remove_brush_btn.connect(slot22, remove_brush_btn, "EVT_COMMAND_BUTTON_CLICKED", callback({
		brushes = brushes
	}, self, self))

	return self._ews_panel
end
function BrushLayer:show_create_brush(data)
	if 0 < #self._brush_names then
		slot13 = 0
		local name = EWS.get_text_from_user(slot3, EWS, Global.frame_panel, "Enter name for the new brush configuration:", "Create brush", "new_brush", Vector3(true, -1, -1))

		if name and name ~= "" then
			if self._unit_brushes[name] then
				slot6 = data

				self.show_create_brush(slot4, self)
			else
				slot6 = self._brush_names
				slot4 = CoreTable.clone(slot5)
				self._unit_brushes[name] = slot4
				slot6 = name

				data.brushes.append(slot4, data.brushes)
				self.save_brushes(slot4)

				slot6 = data.brushes

				for i = 0, data.brushes.nr_items(self) - 1, 1 do
					slot10 = i

					if data.brushes.get_string(slot8, data.brushes) == name then
						slot10 = i

						data.brushes.select_index(slot8, data.brushes)

						break
					end
				end

				slot6 = data

				self.select_brush(slot4, self)
			end
		end
	end

	return 
end
function BrushLayer:hide_create_brush(data)
	slot4 = data.dialog

	data.dialog.end_modal(slot3)

	self._cancel_dialog = data.cancel

	return 
end
function BrushLayer:remove_brush(brushes)
	slot4 = brushes
	local i = brushes.selected_index(slot3)

	if 0 <= i then
		slot7 = i
		slot4 = brushes.get_string(slot5, brushes)
		self._unit_brushes[slot4] = nil
		slot6 = i

		brushes.remove(slot4, brushes)

		slot5 = self

		self.save_brushes(slot4)

		self._brush_names = {}
	end

	return 
end
function BrushLayer:save_brushes()
	slot6 = managers.database
	local f = SystemFS.open(slot2, SystemFS, managers.database.base_path("w") .. self._brushed_path .. ".xml")
	slot5 = "<brushes>"

	f.puts(SystemFS, f)

	slot4 = self._unit_brushes

	for name, unit_names in pairs(SystemFS) do
		slot10 = "\t<brush name=\"" .. name .. "\">"

		f.puts(slot8, f)

		slot9 = unit_names

		for _, unit_name in ipairs(slot8) do
			slot15 = "\t\t<unit name=\"" .. unit_name .. "\"/>"

			f.puts(slot13, f)
		end

		slot10 = "\t</brush>"

		f.puts(slot8, f)
	end

	slot5 = "</brushes>"

	f.puts(slot3, f)

	slot4 = f

	f.close(slot3)

	slot5 = self._brushed_path

	managers.database.recompile(slot3, managers.database)

	return 
end
function BrushLayer:load_brushes()
	slot5 = self._brushed_path

	if DB.has(slot2, DB, "xml") then
		slot5 = self._brushed_path
		local node = DB.load_node(slot2, DB, "xml")
		slot4 = node

		for brush in node.children(DB) do
			local name = brush.parameter(slot7, brush)
			local unit_names = {}
			slot10 = brush

			for unit in brush.children("name") do
				slot14 = unit_names
				slot18 = "name"

				table.insert(slot13, unit.parameter(slot16, unit))
			end

			self._unit_brushes[name] = unit_names
		end
	end

	return 
end
function BrushLayer:create_slider(name, value, s_value, e_value, default_value)
	local slider_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = "ALIGN_LEFT"

	slider_sizer.add(EWS, slider_sizer, EWS.StaticText(slot11, EWS, self._ews_panel, name, ""), 0, 0)

	local slider_params = {
		floats = 0,
		slider_ctrlr_proportions = 3,
		number_ctrlr_proportions = 1,
		panel = self._ews_panel,
		sizer = slider_sizer,
		value = default_value or s_value,
		min = s_value,
		max = e_value
	}
	slot10 = slider_params

	CoreEws.slider_and_number_controller("VERTICAL")

	slot16 = "update_slider"

	slider_params.slider_ctrlr.connect("VERTICAL", slider_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback("EXPAND", self, self))

	slot16 = "update_slider"

	slider_params.slider_ctrlr.connect("VERTICAL", slider_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback({
		slider_params = slider_params,
		value = value
	}, self, self))

	slot16 = "update_slider"

	slider_params.number_ctrlr.connect("VERTICAL", slider_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback({
		slider_params = slider_params,
		value = value
	}, self, self))

	slot16 = "update_slider"
	slot13 = {
		slider_params = slider_params,
		value = value
	}

	slider_params.number_ctrlr.connect("VERTICAL", slider_params.number_ctrlr, "EVT_KILL_FOCUS", callback({
		slider_params = slider_params,
		value = value
	}, self, self))

	return slider_sizer
end
function BrushLayer:set_unit_name(units)
	self._brush_names = {}
	local selected = units.selected_items(slot3)
	slot5 = selected

	for _, i in ipairs(units) do
		slot14 = i
		local name = self.get_real_name(slot9, units.get_item_data(slot12, units))
		slot12 = name

		table.insert(self, self._brush_names)
	end

	slot5 = self._brushes_ctrlr
	local i = self._brushes_ctrlr.selected_index(slot4)

	if -1 < i then
		slot7 = i

		self._brushes_ctrlr.deselect_index(slot5, self._brushes_ctrlr)
	end

	return 
end
function BrushLayer:select_brush(data)
	self._brush_names = {}
	slot4 = data.brushes
	local i = data.brushes.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot9 = i
	slot5 = self._unit_brushes[data.brushes.get_string(slot7, data.brushes)]

	for _, name in ipairs(slot4) do
		slot11 = name

		table.insert(slot9, self._brush_names)
	end

	return 
end
function BrushLayer:update_slider(data)
	self[data.value] = data.slider_params.value

	return 
end
function BrushLayer:_on_gui_open_debug_list()
	slot3 = _G.BrushLayerDebug
	self._debug_list = _G.BrushLayerDebug.new(slot2)

	return 
end
function BrushLayer:get_brush_stats()
	local brush_stats = {}
	local total = {
		unique = 0,
		amount = 0
	}
	slot7 = MassUnitManager

	for _, unit_name in ipairs(MassUnitManager.list(slot6)) do
		slot11 = unit_name
		local rotations = MassUnitManager.unit_rotations(slot9, MassUnitManager)
		local positions = MassUnitManager.unit_positions(MassUnitManager, MassUnitManager)
		local stats = {
			unit_name = unit_name,
			amount = #rotations,
			positions = positions,
			rotations = rotations
		}
		slot14 = stats

		table.insert(unit_name, brush_stats)

		total.amount = total.amount + #rotations
		total.unique = total.unique + 1
	end

	return brush_stats, total
end
function BrushLayer:activate(...)
	slot3 = self

	BrushLayer.super.activate(slot2, ...)

	if self._debug_list then
		slot4 = self._was_debug_list_visible

		self._debug_list.set_visible(slot2, self._debug_list)

		self._was_debug_list_visible = nil
	end

	return 
end
function BrushLayer:deactivate(...)
	slot3 = self

	BrushLayer.super.deactivate(slot2, ...)

	if self._debug_list then
		slot3 = self._debug_list
		self._was_debug_list_visible = self._debug_list.visible(slot2)
		slot4 = false

		self._debug_list.set_visible(slot2, self._debug_list)
	end

	return 
end
function BrushLayer:clear()
	slot3 = MassUnitManager

	MassUnitManager.delete_all_units(slot2)

	self._amount_dirty = true

	return 
end
function BrushLayer:add_triggers()
	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "spray_units"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "spray_units_release"

	vc.add_release_trigger(slot3, vc, callback("lmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "erase_units"

	vc.add_trigger(slot3, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "erase_units_release"

	vc.add_release_trigger(slot3, vc, callback("rmb", self, self))

	return 
end
function BrushLayer:get_help(text)
	local t = "\t"
	local n = "\n"
	text = text .. "Spawn brush:   Point and hold down left mouse button" .. n
	text = text .. "Remove brush:  Point and hold down right mouse button" .. n

	return text
end
function BrushLayer:get_layer_name()
	return "Props brush"
end
BrushHeader = BrushHeader or class()
function BrushHeader:init()
	self._name = ""
	self._distance = 0

	return 
end
function BrushHeader:set_name(name)
	self._name = name

	if self._name then
		slot4 = self._name

		CoreUnit.editor_load_unit(slot3)
	end

	slot4 = self

	self.setup_brush_distance(slot3)

	return 
end
function BrushHeader:setup_brush_distance()
	if self._name then
		slot5 = self._name
		slot3 = CoreEngineAccess._editor_unit_data(self._name.id(slot4))
		local node = CoreEngineAccess._editor_unit_data(self._name.id(slot4)).script_data(slot2)

		if node then
			slot4 = node

			for data in node.children(slot3) do
				slot8 = data

				if data.name(slot7) == "brush" then
					slot11 = "distance"
					self._distance = tonumber(data.parameter(slot9, data))
				end
			end
		end
	end

	return 
end
function BrushHeader:get_spawn_dist()
	return self._distance
end
function BrushHeader:spawn_brush(position, rotation)
	slot6 = self
	position = position + rotation.z(slot4) * self.get_spawn_dist(rotation)
	slot8 = self._name
	slot8 = rotation

	MassUnitManager.spawn_unit(self.get_spawn_dist(rotation), MassUnitManager, Idstring(slot7), position)

	return position
end

return 
