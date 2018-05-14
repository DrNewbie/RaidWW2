-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/utils/Bezier3"
local bezier3 = require(slot1)

if not MotionpathMarkerUnitElement then
	slot3 = MissionElement
	slot1 = class(slot2)
end

MotionpathMarkerUnitElement = slot1
MotionpathMarkerUnitElement._bezier_points = {}
MotionpathMarkerUnitElement._linked_markers = {}
MotionpathMarkerUnitElement.PATH_TYPES = {
	"airborne",
	"ground"
}
function MotionpathMarkerUnitElement:init(unit)
	slot5 = unit

	MotionpathMarkerUnitElement.super.init(slot3, self)

	slot4 = self

	self._add_wp_options(slot3)

	self._hed.icon = "pd2_goto"
	self._hed.text_id = "debug_none"
	self._hed.cp_length = 10
	self._hed.path_type = "airborne"
	self._hed.marker_target_speed = 50
	self._hed.bridges = {}
	self._hed.markers = {
		units = {}
	}
	self._hed.path_id = nil
	self._hed.motion_state = "move"
	slot5 = "cp_length"

	table.insert("move", self._save_values)

	slot5 = "markers"

	table.insert("move", self._save_values)

	slot5 = "bridges"

	table.insert("move", self._save_values)

	slot5 = "path_type"

	table.insert("move", self._save_values)

	slot5 = "marker_target_speed"

	table.insert("move", self._save_values)

	slot5 = "path_id"

	table.insert("move", self._save_values)

	slot5 = "motion_state"

	table.insert("move", self._save_values)

	return 
end
function MotionpathMarkerUnitElement:_add_wp_options()
	self._text_options = {
		"debug_none"
	}

	return 
end
function MotionpathMarkerUnitElement:_set_text()
	slot3 = self._text
	slot7 = self._hed.text_id

	self._text.set_value(slot2, managers.localization.text(slot5, managers.localization))

	return 
end
function MotionpathMarkerUnitElement:set_element_data(params, ...)
	slot5 = params

	MotionpathMarkerUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "text_id" then
		slot4 = self

		self._set_text(slot3)
	end

	slot7 = false

	self._recreate_motion_path(slot3, self, self._unit, true)

	return 
end
function MotionpathMarkerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function MotionpathMarkerUnitElement:add_trigger(id, outcome, callback)
	self._triggers[id] = {
		outcome = outcome,
		callback = callback
	}

	return 
end
function MotionpathMarkerUnitElement:on_unselected()
	return 
end
function MotionpathMarkerUnitElement:clear()
	slot6 = self._unit
	slot4 = self._unit.unit_data(slot5).unit_id
	local path = managers.motion_path.get_path_of_marker(slot2, managers.motion_path)

	if path then
		MotionpathMarkerUnitElement._linked_markers = {}
		slot4 = path.markers

		for _, marker_id in ipairs() do
			slot10 = marker_id
			local marker_unit = self._get_unit(slot8, self)

			if marker_unit then
				slot11 = marker_unit

				table.insert(slot9, MotionpathMarkerUnitElement._linked_markers)
			end
		end
	end

	local victim_id = self._unit.unit_data(slot3).unit_id
	slot6 = self._hed.markers.child
	local victim_child_unit = self._get_unit(self._unit, self)
	slot7 = self._hed.markers.parent
	local victim_parent_unit = self._get_unit(self, self)

	if victim_child_unit then
		slot7 = victim_child_unit
		victim_child_unit.mission_element_data(slot6).markers.parent = self._hed.markers.parent
	end

	if victim_parent_unit then
		slot7 = victim_parent_unit
		victim_parent_unit.mission_element_data(slot6).markers.child = self._hed.markers.child
	end

	local linked_markers = MotionpathMarkerUnitElement._linked_markers
	slot8 = linked_markers

	for i, candidate in ipairs(slot7) do

		-- Decompilation error in this vicinity:
		slot13 = candidate
	end

	slot8 = self._hed.bridges

	for i, candidate in ipairs(slot7) do
		slot14 = candidate.marker_to
		local marker_to = self._get_unit(slot12, self)
		slot14 = marker_to

		if alive(self) then
			slot14 = marker_to
			local marker_to_bridges = marker_to.mission_element_data(slot13).bridges

			if marker_to_bridges then
				slot15 = marker_to_bridges

				for i_bridge, bridge in ipairs(slot14) do
					if bridge.marker_to == candidate.marker_from then
						slot21 = i_bridge

						table.remove(slot19, marker_to_bridges)

						slot23 = false

						self._recreate_motion_path(slot19, self, marker_to, true)
					end
				end
			end
		end
	end

	if linked_markers[1] then
		slot11 = false

		self._recreate_motion_path(slot7, self, linked_markers[1], true)
	end

	slot8 = managers.motion_path

	managers.motion_path.sanitize_paths(slot7)

	return 
end
function MotionpathMarkerUnitElement:_is_infinite_loop(candidate_unit)
	local linked_markers = MotionpathMarkerUnitElement._linked_markers
	local candidate_unit_id = candidate_unit.unit_data(slot4).unit_id
	slot6 = linked_markers

	for _, marker_unit in ipairs(candidate_unit) do

		-- Decompilation error in this vicinity:
		slot11 = marker_unit
	end

	return false
end
function MotionpathMarkerUnitElement:_bridge_exists(unit_id_from, unit_id_to)
	slot5 = self._hed.bridges

	for idx, bridge in ipairs(slot4) do
		if (bridge.marker_from == unit_id_from and bridge.marker_to == unit_id_to) or (bridge.marker_from == unit_id_to and bridge.marker_to == unit_id_from) then
			return idx
		end
	end

	return -1
end
function MotionpathMarkerUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		local unit_to = ray.unit
		local unit_id = unit_to.unit_data(slot4).unit_id
		slot7 = "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker"

		if ray.unit.name(unit_to) == Idstring(ray.unit) then
			local unit_id_from = self._unit.unit_data(slot5).unit_id
			slot8 = unit_id_from
			local path_from = managers.motion_path.get_path_of_marker(self._unit, managers.motion_path)
			slot9 = unit_id
			local path_to = managers.motion_path.get_path_of_marker(managers.motion_path, managers.motion_path)

			if path_from and path_to and path_from.id ~= path_to.id then
				slot11 = unit_id
				local bridge_id = self._bridge_exists(slot8, self, unit_id_from)

				if -1 < bridge_id then
					slot11 = bridge_id

					table.remove(slot9, self._hed.bridges)
				else
					slot11 = {
						marker_from = unit_id_from,
						marker_to = unit_id,
						path_id = path_to.id,
						distance = mvector3.distance(slot13, unit_to.position(self._unit))
					}
					slot14 = self._unit.position(slot15)
					slot17 = unit_to

					table.insert(slot9, self._hed.bridges)
				end

				slot13 = false

				self._recreate_motion_path(slot9, self, self._unit, true)

				return 
			end

			slot10 = ray.unit

			if not self._is_infinite_loop(slot8, self) then
				if self._hed.markers.child == unit_id then
					self._hed.markers.child = nil
					slot9 = ray.unit
					ray.unit.mission_element_data(nil).markers.parent = nil
				else
					self._hed.markers.child = unit_id
					slot10 = self._unit
					ray.unit.mission_element_data(slot8).markers.parent = self._unit.unit_data(ray.unit).unit_id
				end
			else
				slot10 = "MotionpathMarkerUnitElement:add_element() - Possible infinite loop detected. Unit not linked."

				Application.error(slot8, Application)
			end
		else
			slot7 = unit_id
			local index = table.index_of(slot5, self._hed.markers.units)

			if self._hed.markers.units and -1 < index then
				slot8 = index

				table.remove(slot6, self._hed.markers.units)
			else
				if not self._hed.markers.units then
					self._hed.markers.units = {}
				end

				slot8 = unit_id

				managers.motion_path.remove_unit_from_paths(slot6, managers.motion_path)

				slot8 = unit_id

				table.insert(slot6, self._hed.markers.units)
			end
		end

		slot9 = false

		self._recreate_motion_path(slot5, self, self._unit, true)
	end

	return 
end
function MotionpathMarkerUnitElement:remove_unit(unit_id)
	slot5 = unit_id
	local index = table.index_of(slot3, self._hed.markers.units)

	if self._hed.markers.units and -1 < index then
		slot6 = index

		table.remove(slot4, self._hed.markers.units)
	end

	return 
end
function MotionpathMarkerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MotionpathMarkerUnitElement.super.draw_links(slot6, self, t, dt)

	if self._hed.markers.child then
		local unit = all_units[self._hed.markers.child]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw and unit then
			slot10 = {
				g = 0.849,
				b = 0.01,
				r = 0.514,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot8, self)
		end
	end

	if self._hed.markers.units then
		slot7 = self._hed.markers.units

		for _, linked_unit in ipairs(slot6) do
			slot13 = linked_unit
			local unit = self._get_unit(slot11, self)
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

			if draw then
				slot14 = unit

				if alive(slot13) then
					slot14 = self._unit

					if alive(slot13) then
						slot15 = {
							g = 0.449,
							b = 0.01,
							r = 0.8,
							from_unit = unit,
							to_unit = self._unit
						}

						self._draw_link(slot13, self)
					end
				end
			end
		end
	end

	if self._hed.bridges then
		slot7 = self._hed.bridges

		for _, bridge in ipairs(slot6) do
			local marker_from = all_units[bridge.marker_from]
			local marker_to = all_units[bridge.marker_to]
			slot14 = marker_from

			if alive(slot13) then
				slot14 = marker_to

				if alive(slot13) then
					slot15 = {
						g = 1,
						b = 0.01,
						r = 1,
						from_unit = marker_from,
						to_unit = marker_to
					}

					self._draw_link(slot13, self)
				end
			end
		end
	end

	return 
end
function MotionpathMarkerUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
function MotionpathMarkerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local cp_length_params = {
		name = "Control Point Length:",
		ctrlr_proportions = 2,
		slider_ctrlr_proportions = 3,
		name_proportions = 1,
		number_ctrlr_proportions = 1,
		min = 1,
		floats = 3,
		max = 10000,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.cp_length
	}
	slot6 = cp_length_params

	CoreEws.slider_and_number_controller(slot5)

	slot12 = "set_element_data"

	cp_length_params.slider_ctrlr.connect(slot5, cp_length_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(slot9, self, self))

	slot12 = "set_element_data"

	cp_length_params.slider_ctrlr.connect(slot5, cp_length_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback({
		value = "cp_length",
		ctrlr = cp_length_params.number_ctrlr
	}, self, self))

	slot12 = "set_element_data"

	cp_length_params.number_ctrlr.connect(slot5, cp_length_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback({
		value = "cp_length",
		ctrlr = cp_length_params.number_ctrlr
	}, self, self))

	slot12 = "set_element_data"
	slot9 = {
		value = "cp_length",
		ctrlr = cp_length_params.number_ctrlr
	}

	cp_length_params.number_ctrlr.connect(slot5, cp_length_params.number_ctrlr, "EVT_KILL_FOCUS", callback({
		value = "cp_length",
		ctrlr = cp_length_params.number_ctrlr
	}, self, self))
	self._build_value_combobox(slot5, self, panel, panel_sizer, "motion_state", {
		"move",
		"wait"
	})

	local speed_params = {
		name_proportions = 1,
		name = "Speed [km/h]:",
		ctrlr_proportions = 2,
		tooltip = "Set the target unit speed at this marker in km/h. Set to -1 to ignore.",
		min = -1,
		floats = 1,
		max = 1000,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.marker_target_speed
	}
	local speed_ctrlr = CoreEWS.number_controller(self)
	slot14 = "set_element_data"

	speed_ctrlr.connect(speed_params, speed_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback("Units on this marker will either wait or move through it.", self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "marker_target_speed",
		ctrlr = speed_ctrlr
	}

	speed_ctrlr.connect(speed_params, speed_ctrlr, "EVT_KILL_FOCUS", callback({
		value = "marker_target_speed",
		ctrlr = speed_ctrlr
	}, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local add_marker_btn = EWS.Button(speed_params, EWS, panel, "Insert Marker", "")
	slot13 = "RIGHT"

	panel_sizer.add(EWS, panel_sizer, add_marker_btn, 0, 5)

	slot15 = "_add_marker_to_path"
	slot12 = nil

	add_marker_btn.connect(EWS, add_marker_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot10 = "De Casteljau - Bezier spline end point and control point vector."

	self._add_help_text(EWS, self)

	return 
end
local b2 = {
	100,
	500,
	100,
	200,
	1000,
	100,
	1000,
	500
}
local b21 = {
	1000,
	100,
	1000,
	100,
	1600,
	500,
	1600,
	500
}
local scale = 0.1
local width = 0
local angle_tolerance = 0
local cusp_limit = 0
function MotionpathMarkerUnitElement:update_unselected(t, dt, selected_unit, all_units)
	return 
end
function MotionpathMarkerUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot12 = self._unit
	slot12 = self._unit.rotation(self._unit)
	slot13 = 0.01

	Application.draw_cylinder(slot6, Application, self._unit.position(slot9), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * self._hed.cp_length, 10, 0.514, 0.849)

	slot7 = selected_unit

	if type(slot6) == "table" then
		slot10 = true

		self._recreate_motion_path(slot6, self, selected_unit, false)
	end

	return 
end
function MotionpathMarkerUnitElement:_add_marker_to_path()
	local target_marker_id = self._hed.markers.child or self._hed.markers.parent

	if not target_marker_id then
		return 
	end

	slot5 = target_marker_id
	local target_marker = self._get_unit(slot3, self)
	slot6 = target_marker_id
	local path = managers.motion_path.get_path_of_marker(self, managers.motion_path)

	if not path then
		return 
	end

	slot10 = self._unit
	slot9 = target_marker_id
	local middle_point = self._get_middle_point(slot5, self, path, self._unit.unit_data(slot9).unit_id)
	slot7 = managers.editor
	local continent_name = managers.editor.current_continent(self).name(self)
	slot15 = 0
	slot12 = continent_name
	local new_unit = managers.editor._current_layer.create_unit(managers.editor.current_continent(self), managers.editor._current_layer, "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker", middle_point.point, Rotation(slot12, 0, 0))

	if new_unit then
		slot10 = new_unit

		managers.editor._current_layer.add_unit_to_created_units(slot8, managers.editor._current_layer)
	end

	if target_marker_id == self._hed.markers.child then
		slot10 = new_unit
		self._hed.markers.child = new_unit.unit_data(slot9).unit_id
		slot10 = self._unit
		new_unit.mission_element_data(new_unit.unit_data(slot9).unit_id).markers.parent = self._unit.unit_data(new_unit).unit_id
		slot9 = new_unit
		new_unit.mission_element_data(self._unit.unit_data(new_unit).unit_id).markers.child = target_marker_id
		slot10 = new_unit
		target_marker.mission_element_data(self._unit.unit_data(new_unit).unit_id).markers.parent = new_unit.unit_data(target_marker).unit_id
	else
		slot10 = new_unit
		self._hed.markers.parent = new_unit.unit_data(slot9).unit_id
		slot10 = self._unit
		new_unit.mission_element_data(new_unit.unit_data(slot9).unit_id).markers.child = self._unit.unit_data(new_unit).unit_id
		slot9 = new_unit
		new_unit.mission_element_data(self._unit.unit_data(new_unit).unit_id).markers.parent = target_marker_id
		slot10 = new_unit
		target_marker.mission_element_data(self._unit.unit_data(new_unit).unit_id).markers.child = new_unit.unit_data(target_marker).unit_id
	end

	slot12 = false

	self._recreate_motion_path(slot8, self, self._unit, true)

	return 
end
function MotionpathMarkerUnitElement:_get_middle_point(path, selected_marker_id, target_marker_id)
	local selected_point_offset, target_point_offset = nil
	slot8 = path.marker_checkpoints

	for idx, checkpoint in pairs(slot7) do
		if checkpoint == selected_marker_id then
			selected_point_offset = idx
		end

		if checkpoint == target_marker_id then
			target_point_offset = idx
		end
	end

	slot9 = target_point_offset
	slot11 = selected_point_offset - target_point_offset
	slot9 = math.abs(slot10) / 2
	local offset = math.min(slot7, selected_point_offset) + math.round(selected_point_offset) + 1

	return path.points[offset]
end
function MotionpathMarkerUnitElement:_recreate_motion_path(selected_unit, force_update, skip_recreate)
	if not force_update then
		slot7 = selected_unit
	end

	slot6 = selected_unit
	self._last_marker_pos = selected_unit.position(slot5)
	self._last_marker_rot = selected_unit.rotation(slot5)
	local current_marker_unit = selected_unit
	slot10 = selected_unit
	slot8 = selected_unit.mission_element_data(slot9).markers.parent
	local parent_marker_unit = self._get_unit(selected_unit, self)

	while parent_marker_unit and alive(slot7) do
		current_marker_unit = parent_marker_unit
		slot11 = parent_marker_unit
		slot9 = parent_marker_unit.mission_element_data(slot10).markers.parent
		parent_marker_unit = self._get_unit(slot7, self)
	end

	MotionpathMarkerUnitElement._linked_markers = {}
	local linked_markers = MotionpathMarkerUnitElement._linked_markers
	slot10 = current_marker_unit

	table.insert(slot8, linked_markers)

	local path_length = 0
	slot13 = current_marker_unit
	slot11 = current_marker_unit.mission_element_data(slot12).markers.child
	local child_marker_unit = self._get_unit(linked_markers, self)
	local last_child = current_marker_unit

	while child_marker_unit and alive(slot11) do
		slot15 = child_marker_unit
		local distance = mvector3.distance(slot11, child_marker_unit.position(last_child))
		path_length = path_length + distance

		table.insert(last_child.position(slot13), linked_markers, 1)

		last_child = child_marker_unit
		slot16 = child_marker_unit
		slot14 = child_marker_unit.mission_element_data(child_marker_unit).markers.child
		child_marker_unit = self._get_unit(last_child.position(slot13), self)
	end

	local bline = {}
	local entire_path_points = {}
	local units_on_path = {}
	local marker_checkpoints = {}
	local bridges_from_this_path = {}
	local points_until_marker = 0

	for i = 1, #linked_markers, 1 do
		local from_unit = linked_markers[i]
		local to_unit = linked_markers[i + 1]

		if from_unit and to_unit then
			slot26 = from_unit
			slot24 = from_unit.mission_element_data(slot25).bridges

			for i, bridge in ipairs(slot23) do
				slot30 = bridge

				table.insert(slot28, bridges_from_this_path)
			end

			slot25 = from_unit
			marker_checkpoints[#entire_path_points + 1] = from_unit.unit_data(slot24).unit_id
			slot26 = to_unit
			bline = self._build_points(from_unit.unit_data(slot24).unit_id, self, from_unit)
			slot27 = 1
			local n1 = self.bez_draw(from_unit.unit_data(slot24).unit_id, self, "bline", bline)
			slot26 = 1
			slot33 = from_unit
			slot31 = from_unit.position(from_unit).z

			table.insert(self, self._bezier_points, Vector3(slot28, from_unit.position(slot30).x, from_unit.position(from_unit).y))

			if from_unit then
				slot25 = from_unit

				if not from_unit.mission_element_data(slot24).markers.child then
					slot25 = from_unit
					local units_on_marker = from_unit.mission_element_data(slot24).markers.units

					if units_on_marker then
						slot26 = units_on_marker

						for _, linked_unit_id in ipairs(slot25) do
							local unit_and_position = {
								unit = linked_unit_id,
								target_checkpoint = #entire_path_points + 1,
								initial_checkpoint = #entire_path_points + 1
							}
							slot33 = unit_and_position

							table.insert(slot31, units_on_path)
						end
					end
				end
			end

			slot25 = to_unit
			local units_on_marker = to_unit.mission_element_data(slot24).markers.units

			if units_on_marker then
				slot26 = units_on_marker

				for _, linked_unit_id in ipairs(slot25) do
					local unit_and_position = {
						unit = linked_unit_id,
						target_checkpoint = #entire_path_points + 1,
						initial_checkpoint = #entire_path_points + 1
					}
					slot33 = unit_and_position

					table.insert(slot31, units_on_path)
				end
			end

			local points_in_batch = #self._bezier_points
			slot28 = from_unit
			local z_step = (to_unit.position(slot26).z - from_unit.position(to_unit).z) / points_in_batch
			slot29 = from_unit
			local speed_step = (to_unit.mission_element_data(to_unit).marker_target_speed - from_unit.mission_element_data(to_unit).marker_target_speed) / points_in_batch
			local current_z = from_unit.position(to_unit).z
			slot30 = to_unit
			local current_speed = to_unit.mission_element_data(from_unit).marker_target_speed
			local final_speed = nil
			local total_distance = 0
			slot33 = self._bezier_points

			for _, point in ipairs(slot32) do
				current_z = current_z + z_step

				if current_speed == -1 then
					final_speed = -1
				else
					final_speed = (current_speed + speed_step) * 27.77
				end

				slot39 = {
					point = point,
					speed = final_speed
				}

				table.insert(slot37, entire_path_points)

				if 1 < #entire_path_points - points_until_marker then
					local distance_vector = entire_path_points[#entire_path_points].point - entire_path_points[#entire_path_points - 1].point
					slot39 = distance_vector
					total_distance = total_distance + distance_vector.length(slot38)
				end
			end

			local accumulated_distance = 0

			for i = points_until_marker + 1, #entire_path_points, 1 do
				if 1 < i - points_until_marker then
					local distance_vector = entire_path_points[i].point - entire_path_points[i - 1].point
					slot39 = distance_vector
					accumulated_distance = accumulated_distance + distance_vector.length(slot38)
				end

				slot41 = from_unit
				entire_path_points[i].speed = (from_unit.mission_element_data(slot38).marker_target_speed + (to_unit.mission_element_data(from_unit).marker_target_speed - from_unit.mission_element_data(to_unit).marker_target_speed) * accumulated_distance / total_distance) * 27.77
			end

			points_until_marker = #entire_path_points
		end
	end

	if entire_path_points then
		for j = 1, #entire_path_points, 1 do
			if entire_path_points[j + 1] then
				slot27 = 1

				Application.draw_line(slot21, Application, entire_path_points[j].point, entire_path_points[j + 1].point, 1, 1)
			end
		end
	end

	slot20 = linked_markers[#linked_markers]
	slot18 = linked_markers[#linked_markers].mission_element_data(slot19).bridges

	for i, bridge in ipairs(slot17) do
		slot24 = bridge

		table.insert(slot22, bridges_from_this_path)
	end

	slot19 = linked_markers[#linked_markers]
	marker_checkpoints[#entire_path_points] = linked_markers[#linked_markers].unit_data(slot18).unit_id
	local marker_ids = {}
	slot19 = linked_markers

	for _, marker in ipairs(slot18) do
		slot27 = marker
		slot25 = marker.unit_data(slot26).unit_id

		table.insert(slot23, marker_ids)
	end

	local first_marker_id = nil

	if linked_markers[1] then
		slot20 = linked_markers[1]
		first_marker_id = linked_markers[1].unit_data(slot19).unit_id
	end

	local path_id, path_type = nil
	slot23 = first_marker_id
	local existing_path = managers.motion_path.get_path_of_marker(slot21, managers.motion_path)

	if existing_path then
		path_id = existing_path.id
		path_type = existing_path.path_type
		self._hed.path_type = existing_path.path_type
	else
		slot24 = marker_ids
		path_id = managers.motion_path.get_path_id(slot22, managers.motion_path)
		path_type = self._hed.path_type or "airborne"
	end

	local entire_path_points_reverse = {}

	for i = 1, #entire_path_points, 1 do
		slot30 = {
			point = entire_path_points[i].point,
			speed = entire_path_points[#entire_path_points - i + 1].speed
		}

		table.insert(slot27, entire_path_points_reverse, 1)
	end

	slot24 = bridges_from_this_path

	for _, bridge in ipairs(slot23) do
		slot30 = bridge.marker_to
		local path_to = managers.motion_path.get_path_of_marker(slot28, managers.motion_path)

		if path_to then
			bridge.path_id = path_to.id
		else
			bridge.path_id = nil
		end
	end

	local path = {
		active = true,
		id = path_id,
		path_type = path_type,
		length = path_length,
		bridges = bridges_from_this_path,
		points = entire_path_points,
		points_bck = entire_path_points_reverse,
		markers = marker_ids,
		units = units_on_path,
		marker_checkpoints = marker_checkpoints
	}
	self._hed.path_id = path_id
	slot27 = skip_recreate

	managers.motion_path.update_path(slot24, managers.motion_path, path)

	return 
end
function MotionpathMarkerUnitElement:_get_unit(unit_id)
	slot4 = Application

	if Application.editor(slot3) then
		slot5 = unit_id

		return managers.editor.unit_with_id(slot3, managers.editor)
	else
		slot5 = unit_id

		return managers.worlddefinition.get_unit(slot3, managers.worlddefinition)
	end

	return 
end
function MotionpathMarkerUnitElement:_build_points(from_unit, to_unit)
	slot6 = from_unit
	slot7 = from_unit
	local cp1 = from_unit.position(slot4) + from_unit.rotation(from_unit).y(from_unit) * from_unit.mission_element_data(from_unit.rotation(from_unit)).cp_length * -1
	local x1 = from_unit.position(from_unit.mission_element_data(from_unit.rotation(from_unit)).cp_length).x
	local y1 = from_unit.position(from_unit).y
	slot8 = from_unit
	local z1 = from_unit.position(from_unit).z
	local x2 = cp1.x
	local y2 = cp1.y
	local z2 = cp1.z
	local x3 = 0
	local y3 = 0
	local z3 = 0
	local x4 = 0
	local y4 = 0
	local z4 = 0
	slot18 = to_unit
	x4 = to_unit.position(slot17).x
	slot18 = to_unit
	y4 = to_unit.position(slot17).y
	slot18 = to_unit
	z4 = to_unit.position(slot17).z
	slot19 = to_unit
	slot20 = to_unit
	local cp2 = to_unit.position(slot17) + to_unit.rotation(to_unit).y(to_unit) * to_unit.mission_element_data(to_unit.rotation(to_unit)).cp_length
	x3 = cp2.x
	y3 = cp2.y
	z3 = cp2.z

	return {
		x1,
		y1,
		z1,
		x2,
		y2,
		z2,
		x3,
		y3,
		z3,
		x4,
		y4,
		z4
	}
end
function MotionpathMarkerUnitElement:bez_interpolate(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, ...)
	local n = 0
	self._bezier_points = {}
	slot31 = cusp_limit

	bezier3.interpolate(slot15, function (s, x, y, z)
		slot6 = self._bezier_points
		slot11 = z

		table.insert(slot5, Vector3(slot8, x, y))

		n = n + 1

		return 
	end, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, scale, angle_tolerance)

	return n
end
function MotionpathMarkerUnitElement:bez_draw(id, b, t)
	slot8 = b
	local x, y, z, w, h, d = bezier3.bounding_box(unpack(slot7))
	local ax1, ay1, az1, ax2, ay2, az2, ax3, ay3, az3, ax4, ay4, az4, bx1, by1, bz1, bx2, by2, bz2, bx3, by3, bz3, bx4, by4, bz4 = nil

	if t == 1 then
		slot36 = b
		ax1, ay1, az1, ax2, ay2, az2, ax3, ay3, az3, ax4, ay4, az4 = unpack(slot35)
		bz4 = az4
		by4 = ay4
		bx4 = ax4
		bz3 = az4
		by3 = ay4
		bx3 = ax4
		bz2 = az4
		by2 = ay4
		bx2 = ax4
		bz1 = az4
		by1 = ay4
		bx1 = ax4
	else
		slot36 = t
		slot39 = b
		ax1, ay1, az1, ax2, ay2, az2, ax3, ay3, az3, ax4, ay4, az4, bx1, by1, bz1, bx2, by2, bz2, bx3, by3, bz3, bx4, by4, bz4 = bezier3.split(slot35, unpack(slot38))
	end

	slot49 = "#ffff00"
	local n1 = self.bez_interpolate(slot35, self, ax1, ay1, az1, ax2, ay2, az2, ax3, ay3, az3, ax4, ay4, az4)

	return n1
end

return 
