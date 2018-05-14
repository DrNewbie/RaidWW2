-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NavFieldBuilder = NavFieldBuilder or class()
NavFieldBuilder._VERSION = 6
NavFieldBuilder.init = function (self)
	self._door_access_types = {
		walk = 1
	}
	self._opposite_side_str = {
		x_neg = "x_pos",
		y_pos = "y_neg",
		y_neg = "y_pos",
		x_pos = "x_neg"
	}
	self._perp_pos_dir_str_map = {
		x_neg = "y_pos",
		y_pos = "x_pos",
		y_neg = "x_pos",
		x_pos = "y_pos"
	}
	self._perp_neg_dir_str_map = {
		x_neg = "y_neg",
		y_pos = "x_neg",
		y_neg = "x_neg",
		x_pos = "y_neg"
	}
	self._dim_str_map = {
		x_neg = "x",
		y_pos = "y",
		y_neg = "y",
		x_pos = "x"
	}
	self._perp_dim_str_map = {
		x_neg = "y",
		y_pos = "x",
		y_neg = "x",
		x_pos = "y"
	}
	self._neg_dir_str_map = {
		x_neg = true,
		y_neg = true
	}
	self._x_dir_str_map = {
		x_neg = true,
		x_pos = true
	}
	slot6 = 0
	slot6 = 0
	slot6 = 0
	slot6 = 0
	slot2 = Vector3(slot3, 0, -1)
	self._dir_str_to_vec = {
		x_pos = Vector3(slot3, 1, 0),
		x_neg = Vector3(slot3, -1, 0),
		y_pos = Vector3(slot3, 0, 1),
		y_neg = slot2
	}
	self._ground_padding = 35
	self._wall_padding = 24
	self._max_nr_rooms = 200000
	self._room_height = 70
	self._grid_size = 25
	self._air_ray_rad = self._grid_size * 1.2
	self._gnd_ray_rad = self._grid_size * 0.9
	self._room_dimention_max = 1000
	self._raycast_dis_max = 10000
	self._max_fall = 800
	slot5 = self._ground_padding + self._grid_size
	self._up_vec = Vector3(slot2, 0, 0)
	slot5 = -self._max_fall
	self._down_vec = Vector3(slot2, 0, 0)
	slot4 = "AI_graph_obstacle_check"
	self._slotmask = managers.slot.get_mask(slot2, managers.slot)
	self._rooms = {}
	self._room_doors = {}
	self._visibility_groups = {}
	self._nav_segments = {}

	return 
end
NavFieldBuilder.clear = function (self)
	self._rooms = {}
	self._room_doors = {}
	self._visibility_groups = {}
	self._nav_segments = {}
	self._building = nil
	self._progress_dialog_cancel = nil
	slot3 = self

	self._reenable_all_blockers(slot2)

	self._helper_blockers = nil
	self._new_blockers = nil

	return 
end
NavFieldBuilder.load = function (self, data)
	local quad_grid_size = self._grid_size
	self._helper_blockers = data.helper_blockers

	if data.quad_borders_x_pos then
		for i_room = 1, #data.quad_borders_x_pos, 1 do
			local room = {
				borders = {
					x_pos = data.quad_borders_x_pos[i_room] * quad_grid_size,
					x_neg = data.quad_borders_x_neg[i_room] * quad_grid_size,
					y_pos = data.quad_borders_y_pos[i_room] * quad_grid_size,
					y_neg = data.quad_borders_y_neg[i_room] * quad_grid_size
				},
				height = {
					xp_yp = data.quad_heights_xp_yp[i_room],
					xp_yn = data.quad_heights_xp_yn[i_room],
					xn_yp = data.quad_heights_xn_yp[i_room],
					xn_yn = data.quad_heights_xn_yn[i_room]
				},
				doors = {
					x_pos = {},
					x_neg = {},
					y_pos = {},
					y_neg = {}
				}
			}
			slot11 = room

			table.insert(, self._rooms)
		end

		for i_door = 1, #data.door_low_pos, 1 do
			local door = {}
			slot10 = data.door_low_pos[i_door]
			door.pos = mvector3.copy(slot9)
			slot10 = data.door_high_pos[i_door]
			door.pos1 = mvector3.copy(slot9)
			door.rooms = {
				data.door_low_quads[i_door],
				data.door_high_quads[i_door]
			}
			slot13 = door.pos
			slot11 = mvector3.x(slot12) * quad_grid_size

			mvector3.set_x(data.door_high_quads[i_door], door.pos)

			slot13 = door.pos
			slot11 = mvector3.y(slot12) * quad_grid_size

			mvector3.set_y(data.door_high_quads[i_door], door.pos)

			slot13 = door.pos1
			slot11 = mvector3.x(slot12) * quad_grid_size

			mvector3.set_x(data.door_high_quads[i_door], door.pos1)

			slot13 = door.pos1
			slot11 = mvector3.y(slot12) * quad_grid_size

			mvector3.set_y(data.door_high_quads[i_door], door.pos1)

			slot11 = door

			table.insert(data.door_high_quads[i_door], self._room_doors)

			local door_dim = nil

			if door.pos.x == door.pos1.x then
				door_dim = "y"
			else
				door_dim = "x"
			end

			local neg_side = door_dim .. "_neg"
			local pos_side = door_dim .. "_pos"
			local low_room = self._rooms[door.rooms[1]]
			local high_room = self._rooms[door.rooms[2]]
			slot16 = i_door

			table.insert(slot14, low_room.doors[pos_side])

			slot16 = i_door

			table.insert(slot14, high_room.doors[neg_side])
		end

		slot5 = data.visibility_groups

		for i_vis_group, load_vis_group in pairs(slot4) do
			local visible_groups = {}
			local quads = {}
			local visibility_group = {
				vis_groups = visible_groups,
				rooms = quads,
				pos = load_vis_group.pos
			}
			slot14 = visibility_group

			table.insert(slot12, self._visibility_groups)

			slot13 = load_vis_group.quads

			for _, i_quad in ipairs(slot12) do
				quads[i_quad] = true
				self._rooms[i_quad].vis_group = i_vis_group
			end

			slot13 = load_vis_group.visible_groups

			for _, visible_group_id in ipairs(slot12) do
				visible_groups[visible_group_id] = true
			end
		end

		slot5 = data.segments

		for _, load_seg in pairs(slot4) do
			slot10 = load_seg
			local segment = clone(slot9)
			self._nav_segments[load_seg.id] = segment
			slot11 = segment.vis_groups

			for _, vis_group_id in ipairs(load_seg.id) do
				self._visibility_groups[vis_group_id].seg = load_seg.id
			end
		end
	end

	return 
end
NavFieldBuilder.is_data_complete = function (self)
	slot3 = self._visibility_groups

	return next(slot2) and true
end
NavFieldBuilder.update = function (self, t, dt)
	if self._building then
		if self._progress_dialog_cancel then
			self._progress_dialog_cancel = nil
			slot5 = self

			self.clear(slot4)

			slot5 = self

			self._destroy_progress_bar(slot4)

			self._building = nil
		else
			slot5 = self

			self._building.task_clbk(slot4)
		end
	end

	return 
end
NavFieldBuilder._create_build_progress_bar = function (self, title, num_divistions)
	if not self._progress_dialog then
		slot10 = "PD_AUTO_HIDE,PD_SMOOTH,PD_CAN_ABORT,PD_ELAPSED_TIME,PD_ESTIMATED_TIME,PD_REMAINING_TIME"
		self._progress_dialog = EWS.ProgressDialog(slot4, EWS, Global.frame_panel, title, "", num_divistions)
		slot5 = self._progress_dialog

		self._progress_dialog.set_focus(slot4)

		slot5 = self._progress_dialog

		self._progress_dialog.update(slot4)
	end

	return 
end
NavFieldBuilder._destroy_progress_bar = function (self)
	if self._progress_dialog then
		slot3 = self._progress_dialog

		self._progress_dialog.destroy(slot2)

		self._progress_dialog = nil
	end

	return 
end
NavFieldBuilder.set_segment_state = function (self, id, state)
	self._nav_segments[id].no_access = (not state and true) or nil

	return 
end
NavFieldBuilder.build_nav_segments = function (self, build_settings, complete_clbk)
	self._build_complete_clbk = complete_clbk
	local all_vis_groups = self._visibility_groups
	slot6 = all_vis_groups

	if next(slot5) then
		slot6 = self._rooms

		for i_room, room in ipairs(slot5) do
			if not room.segment then
				room.segment = all_vis_groups[room.vis_group].seg
				room.vis_group = nil
			end
		end
	end

	self._visibility_groups = {}
	slot6 = build_settings

	for index, segment_settings in ipairs(slot5) do
		slot12 = segment_settings.id

		self.delete_segment(slot10, self)
	end

	slot8 = 1

	self.start_build_nav_segment(slot5, self, build_settings)

	return 
end
NavFieldBuilder.build_visibility_graph = function (self, complete_clbk, all_visible, ray_dis, pos_filter, neg_filter)
	local all_rooms = self._rooms
	local all_vis_groups = self._visibility_groups
	slot10 = all_rooms

	for i_room, room in ipairs(slot9) do
		if not room.segment then
			room.segment = all_vis_groups[room.vis_group].seg
		end

		room.vis_group = nil
	end

	self._visibility_groups = {}
	local all_vis_groups = self._visibility_groups

	if all_visible then
		local seg_to_vis_group_map = {}
		local nr_vis_groups = 0
		slot13 = self._nav_segments

		for nav_seg_id, nav_seg in pairs(slot12) do
			local new_vis_group = {
				rooms = {},
				pos = nav_seg.pos,
				vis_groups = {},
				seg = nav_seg_id
			}
			slot20 = new_vis_group

			table.insert(slot18, all_vis_groups)

			nr_vis_groups = nr_vis_groups + 1
			seg_to_vis_group_map[nav_seg_id] = nr_vis_groups
			nav_seg.vis_groups = {
				nr_vis_groups
			}
		end

		if 1 < nr_vis_groups then
			slot13 = all_vis_groups

			for i_vis_group, vis_group in ipairs(slot12) do
				local visible_groups = vis_group.vis_groups
				local i = 1

				repeat
					if i ~= i_vis_group then
						visible_groups[i] = true
					end

					i = i + 1
				until nr_vis_groups < i
			end
		end

		slot13 = all_rooms

		for i_room, room in ipairs(slot12) do
			local i_vis_group = seg_to_vis_group_map[room.segment]
			room.vis_group = i_vis_group
			all_vis_groups[i_vis_group].rooms[i_room] = true
		end

		slot13 = self

		self._cleanup_room_data_1(slot12)
		complete_clbk()

		return 
	end

	self._build_complete_clbk = complete_clbk
	self._room_visibility_data = {}
	slot13 = 5

	self._create_build_progress_bar(slot10, self, "Building Visibility Graph")

	self._building = {
		task_clbk = self._commence_vis_graph_build,
		pos_vis_filter = pos_filter,
		neg_vis_filter = neg_filter,
		ray_dis = ray_dis
	}
	local nr_rooms = #self._rooms

	if nr_rooms == 1 then
		self._building.stage = 2
		self._room_visibility_data[1] = {}
	else
		local i_room_a = 1
		local i_room_b = 2
		local room_a = all_rooms[i_room_a]
		local room_b = all_rooms[i_room_b]
		self._building.stage = 1
		self._building.current_i_room_a = i_room_a
		self._building.current_i_room_b = i_room_b
		self._building.new_pair = true
	end

	self._building.stage = self._building.stage or 2

	return 
end
NavFieldBuilder._chk_room_vis_filter = function (self, room_a, room_b, pos_filter, neg_filter)
	slot8 = room_b.segment
	local seg_low, seg_high = math.min_max(slot6, room_a.segment)

	if seg_low == seg_high or (pos_filter[seg_low] and pos_filter[seg_low][seg_high]) then
		return true
	elseif neg_filter[seg_low] and neg_filter[seg_low][seg_high] then
		return false
	end

	return nil
end
NavFieldBuilder.delete_segment = function (self, id)
	local all_vis_groups = self._visibility_groups
	local all_rooms = self._rooms
	local all_blockers = self._helper_blockers
	slot7 = all_vis_groups

	for i_vis_grp, vis_grp in ipairs(slot6) do
		slot12 = vis_grp.rooms

		for i_quad, _ in pairs(slot11) do
			if all_rooms[i_quad].vis_group ~= i_vis_grp then
				slot20 = i_quad

				print(slot16, " inconsistency1 i_vis_grp", i_vis_grp, "i_quad")
			end
		end
	end

	for i_room = #self._rooms, 1, -1 do
		local room = all_rooms[i_room]
		slot19 = room.vis_group and all_vis_groups[room.vis_group].seg

		print(slot11, " i_room", i_room, "vis_grp", room.vis_group, "segment", room.segment, "seg")

		if room.segment then
			if room.segment == id then
				slot12 = " deleting1"

				print(slot11)

				slot13 = i_room

				self._trash_room(slot11, self)

				slot13 = i_room

				self._destroy_room(slot11, self)
			end
		elseif room.vis_group and all_vis_groups[room.vis_group].seg == id then
			slot12 = " deleting2"

			print(slot11)

			slot13 = i_room

			self._trash_room(slot11, self)

			slot13 = i_room

			self._destroy_room(slot11, self)
		end
	end

	local all_nav_segments = self._nav_segments
	local seg = all_nav_segments[id]

	if not seg then
		slot9 = " segment not found"

		print(slot8)

		return 
	end

	all_nav_segments[id] = nil
	slot9 = all_nav_segments

	for test_seg_id, test_seg in pairs(slot8) do
		if test_seg.neighbours then
			test_seg.neighbours[id] = nil
		end
	end

	local owned_vis_groups = seg.vis_groups
	local index_owned_vis_group = #owned_vis_groups

	while 0 < index_owned_vis_group do
		local i_owned_vis_group = owned_vis_groups[index_owned_vis_group]
		slot15 = index_owned_vis_group

		print(slot11, "removing vis group", i_owned_vis_group, "at index")

		slot13 = i_owned_vis_group

		self._destroy_vis_group(slot11, self)

		index_owned_vis_group = index_owned_vis_group - 1
		local i = index_owned_vis_group

		while 0 < i do
			if i_owned_vis_group < owned_vis_groups[i] then
				slot16 = i

				print(slot12, "adjusting trash vis_group", owned_vis_groups[i], "at")

				owned_vis_groups[i] = owned_vis_groups[i] - 1
			end

			i = i - 1
		end
	end

	if self._helper_blockers then
		slot11 = all_blockers

		for u_id, segment in pairs(slot10) do
			if segment == id then
				all_blockers[u_id] = nil
			end
		end
	end

	slot11 = all_vis_groups

	for i_vis_grp, vis_grp in ipairs(slot10) do
		slot16 = vis_grp.rooms

		for i_quad, _ in pairs(slot15) do
			if not all_rooms[i_quad] then
				slot24 = i_quad

				print(slot20, " inconsistency2 i_vis_grp", i_vis_grp, "i_quad")
			end
		end
	end

	return 
end
NavFieldBuilder._destroy_vis_group = function (self, i_vis_group)
	local all_rooms = self._rooms
	local all_nav_segments = self._nav_segments
	local all_vis_groups = self._visibility_groups
	slot8 = i_vis_group
	local vis_group = table.remove(slot6, all_vis_groups)
	slot8 = all_rooms

	for i_room, room in ipairs(all_vis_groups) do
		if room.vis_group and i_vis_group < room.vis_group then
			room.vis_group = room.vis_group - 1
		end
	end

	slot8 = all_nav_segments

	for i_seg, seg in pairs(slot7) do
		local owned_vis_groups = seg.vis_groups
		slot14 = owned_vis_groups

		for index_owned_vis_group, i_owned_vis_group in ipairs(slot13) do
			if i_vis_group < i_owned_vis_group then
				owned_vis_groups[index_owned_vis_group] = i_owned_vis_group - 1
			end
		end
	end

	slot8 = all_vis_groups

	for _, test_vis_group in ipairs(slot7) do
		local visible_vis_groups = test_vis_group.vis_groups
		visible_vis_groups[i_vis_group] = nil
		local new_list = {}
		slot15 = visible_vis_groups

		for i_visibile_group, _ in pairs(slot14) do
			if i_vis_group < i_visibile_group then
				new_list[i_visibile_group - 1] = true
			else
				new_list[i_visibile_group] = true
			end
		end

		test_vis_group.vis_groups = new_list
	end

	return 
end
NavFieldBuilder.start_build_nav_segment = function (self, build_settings, segment_index)
	slot7 = 6

	self._create_build_progress_bar(slot4, self, "Building Navigation Segments")

	local build_seg = build_settings[segment_index]
	self._building = {
		build_settings = build_settings,
		segment_index = segment_index,
		task_clbk = self._commence_nav_field_build,
		stage = 1
	}
	slot7 = build_seg.id

	print(1, "[NavFieldBuilder]  Building navigation segment:  ")

	local nav_segment_id = build_seg.id
	self._building.id = nav_segment_id
	self._new_blockers = {}
	self._helper_blockers = self._helper_blockers or {}
	self._disabled_blockers = self._disabled_blockers or {}
	self._nav_segments[nav_segment_id] = {
		id = nav_segment_id,
		pos = build_seg.position,
		vis_groups = {},
		neighbours = {},
		location_id = build_seg.location_id,
		barrage_allowed = build_seg.barrage_allowed
	}
	slot9 = 15
	local all_blockers = World.find_units_quick(, World, "all")
	local to_remove = {}
	slot9 = self._helper_blockers

	for u_id, segment in pairs("all") do
		local verified = nil

		if segment ~= nav_segment_id then
			slot15 = all_blockers

			for _, blocker_unit in ipairs(slot14) do
				slot20 = blocker_unit
				local u_id_ = blocker_unit.unit_data(slot19).unit_id

				if u_id_ == u_id then
					verified = true

					break
				end
			end
		end

		if not verified then
			slot16 = u_id

			table.insert(slot14, to_remove)
		end
	end

	slot9 = to_remove

	for _, u_id in ipairs(slot8) do
		self._helper_blockers[u_id] = nil
	end

	slot9 = all_blockers

	for _, blocker_unit in ipairs(slot8) do
		slot14 = blocker_unit
		local u_id = blocker_unit.unit_data(slot13).unit_id
		local blocker_segment = self._helper_blockers[u_id]

		if blocker_segment then
			slot17 = blocker_unit

			self._disable_blocker(slot15, self)
		end
	end

	slot10 = build_seg.position
	slot12 = 0
	local start_pos_rounded = self._round_pos_to_grid_center(slot8, self) + Vector3(self, self._grid_size * 0.5, self._grid_size * 0.5)
	slot13 = self._gnd_ray_rad
	local ground_ray = self._sphere_ray(self, self, start_pos_rounded + self._up_vec, start_pos_rounded + self._down_vec)
	slot12 = "x_pos"
	slot16 = ground_ray.position.z

	self._analyse_room(self, self, start_pos_rounded.with_z(slot14, start_pos_rounded))

	return 
end
NavFieldBuilder._commence_nav_field_build = function (self)
	if self._building.stage == 1 then
		slot3 = self

		self._expand_rooms(slot2)
	elseif self._building.stage == 2 then
		if not self._building.sorted_rooms then
			self._building.sorted_rooms = {}
			local build_id = self._building.id
			slot4 = self._rooms

			for i_room, room in ipairs(slot3) do
				if room.segment == build_id then
					slot11 = self._building.sorted_rooms

					self._sort_room_by_area(slot8, self, i_room)
				end
			end
		end

		slot8 = self._building.sorted_rooms[#self._building.sorted_rooms]
		slot5 = "Merging Room " .. tostring(slot7)

		self._update_progress_bar(slot2, self, 2)

		slot3 = self
		local done = self._merge_rooms(slot2)

		if done then
			if not self._building.second_pass then
				self._building.stage = 3
			end

			self._building.second_pass = nil
			self._building.sorted_rooms = nil
		end
	elseif self._building.stage == 3 then
		slot3 = self._rooms

		for i_room, room in ipairs(slot2) do
			if room.segment == self._building.id then
				slot9 = i_room

				self._create_room_doors(slot7, self)
			end
		end

		self._building.stage = 4
	elseif self._building.stage == 4 then
		slot5 = "Calculating door heights"

		self._update_progress_bar(slot2, self, 3)

		slot3 = self

		self._calculate_door_heights(slot2)

		self._building.stage = 5
	elseif self._building.stage == 5 then
		slot5 = "Cleaning Up room_data"

		self._update_progress_bar(slot2, self, 4)

		slot3 = self

		self._cleanup_room_data(slot2)

		self._building.stage = 6
	elseif self._building.stage == 6 then
		slot3 = self

		self._set_new_blockers_used(slot2)

		slot3 = self

		self._reenable_all_blockers(slot2)

		slot3 = self

		self._destroy_progress_bar(slot2)

		if self._building.segment_index == #self._building.build_settings then
			self._building = false

			self._build_complete_clbk()
		else
			slot5 = self._building.segment_index + 1

			self.start_build_nav_segment(slot2, self, self._building.build_settings)
		end
	end

	return 
end
NavFieldBuilder._expand_rooms = function (self)
	local progress = nil

	local function can_room_expand(expansion_data)
		if expansion_data then
			slot3 = expansion_data

			for side, seg_list in pairs(slot2) do
				slot8 = seg_list

				if next(slot7) then
					return true
				end
			end
		end

		return 
	end

	local function expand_room(room)
		local expansion_data = room.expansion_segments
		local progress = nil
		slot5 = expansion_data

		for dir_str, exp_dir_data in pairs(slot4) do
			slot10 = exp_dir_data

			for i_segment, segment in pairs(slot9) do
				if self._max_nr_rooms <= #self._rooms then
					slot15 = "!\t\tError. Room # limit exceeded"

					print(slot14)

					exp_dir_data[i_segment] = nil

					break
				end

				local new_enter_pos = Vector3()
				local size_1 = segment[1][self._perp_dim_str_map[dir_str]] + self._grid_size * 0.5
				local size_2 = room.borders[dir_str] + ((self._neg_dir_str_map[dir_str] and -1) or 1) * self._grid_size * 0.5
				slot19 = size_1

				mvector3["set_" .. self._perp_dim_str_map[dir_str]]("set_" .. self._perp_dim_str_map[dir_str], new_enter_pos)

				slot19 = size_2

				mvector3["set_" .. self._dim_str_map[dir_str]]("set_" .. self._dim_str_map[dir_str], new_enter_pos)

				slot19 = segment[1].z

				mvector3.set_z("set_" .. self._dim_str_map[dir_str], new_enter_pos)

				slot21 = self._gnd_ray_rad
				local gnd_ray = self._sphere_ray("set_" .. self._dim_str_map[dir_str], self, new_enter_pos + self._up_vec, new_enter_pos + self._down_vec)

				if gnd_ray then
					slot20 = gnd_ray.position.z

					mvector3.set_z(slot18, new_enter_pos)
				else
					slot22 = segment[2]

					Application.error(slot18, Application, "! Error. NavFieldBuilder:_expand_rooms() ground ray failed! segment", segment[1])

					slot25 = 0

					Application.draw_cylinder(slot18, Application, new_enter_pos + self._up_vec, new_enter_pos + self._down_vec, self._gnd_ray_rad, 1, 0)

					slot20 = room

					managers.navigation.draw_room(slot18, managers.navigation)

					slot20 = true

					Application.set_pause(slot18, Application)

					progress = false

					break
				end

				slot21 = new_enter_pos
				local new_i_room = self._analyse_room(slot18, self, dir_str)
				local new_room = self._rooms[new_i_room]
				progress = true

				break
			end

			if progress then
				break
			end
		end

		return progress
	end

	slot6 = self._rooms

	for i_room, room in ipairs(slot5) do
		local expansion_segments = room.expansion_segments

		while not progress and can_room_expand(slot11) do
			slot13 = i_room
			slot15 = #self._rooms
			local text = "expanding room " .. tostring(slot12) .. " of " .. tostring(slot14)
			slot15 = text

			self._update_progress_bar(" of ", self, 1)

			slot13 = room
			progress = expand_room(" of ")

			if progress then
				break
			end
		end
	end

	if not progress then
		self._building.stage = 2
		self._building.second_pass = true
	end

	return 
end
NavFieldBuilder._merge_rooms = function (self)
	local function _remove_room_from_sorted_list(i_room, sorted_rooms)
		slot4 = sorted_rooms

		for sort_index, sorted_i_room in ipairs(slot3) do
			if sorted_i_room == i_room then
				slot10 = sort_index

				table.remove(slot8, sorted_rooms)

				break
			end
		end

		return 
	end

	local function _dispose_trash_rooms(trash_rooms, sorted_rooms)
		slot4 = trash_rooms

		for i, i_room in pairs(slot3) do
			slot10 = i_room

			self._destroy_room(slot8, self)

			slot9 = trash_rooms

			for next_i, next_i_room in pairs(slot8) do
				if i_room < next_i_room then
					trash_rooms[next_i] = next_i_room - 1
				end
			end

			slot10 = sorted_rooms

			_remove_room_from_sorted_list(slot8, i_room)

			slot9 = sorted_rooms

			for sort_index, room_index in ipairs(slot8) do
				if i_room < room_index then
					sorted_rooms[sort_index] = room_index - 1
				end
			end
		end

		return 
	end

	local function _find_walls_on_side(room, side)
		local all_doors = self._room_doors
		local borders = room.borders
		local fwd_border = borders[side]
		local along_dim = self._perp_dim_str_map[side]
		local perp_dim = self._dim_str_map[side]
		local left_corner = Vector3()
		local right_corner = Vector3()
		slot12 = borders[self._perp_neg_dir_str_map[side]]

		mvector3["set_" .. along_dim]("set_" .. along_dim, left_corner)

		slot12 = fwd_border

		mvector3["set_" .. perp_dim]("set_" .. perp_dim, left_corner)

		slot12 = borders[self._perp_pos_dir_str_map[side]]

		mvector3["set_" .. along_dim]("set_" .. along_dim, right_corner)

		slot12 = fwd_border

		mvector3["set_" .. perp_dim]("set_" .. perp_dim, right_corner)

		local walls = {
			{
				left_corner,
				right_corner
			}
		}
		slot12 = room.neighbours[side]

		for _, neighbour_data in ipairs(right_corner) do
			slot20 = along_dim
			walls = self._remove_seg_from_seg_list(slot16, self, walls, neighbour_data.overlap)
		end

		return walls
	end

	local function _get_room_expandable_borders(room)
		local expandable_sides = {}
		local neighbours = room.neighbours
		slot5 = room.expansion

		for side, obstacle_types in pairs(slot4) do
			local opp_side = self._opposite_side_str[side]
			local dim = self._perp_dim_str_map[side]
			slot15 = side

			if not next(_find_walls_on_side(slot13, room)) then
				local exp_seg = {}
				local neighbour_block = nil
				slot14 = neighbours[side]

				for _, neighbour_data in pairs(slot13) do

					-- Decompilation error in this vicinity:
					local neighbour = self._rooms[neighbour_data.room]
					local neighbour_expansion = neighbour.expansion and neighbour.expansion[opp_side]
					local overlap = neighbour_data.overlap
				end

				if not neighbour_block and #exp_seg == 1 and exp_seg[1][1][dim] == room.borders[self._perp_neg_dir_str_map[side]] and exp_seg[1][2][dim] == room.borders[self._perp_pos_dir_str_map[side]] then
					expandable_sides[side] = true
				end
			end
		end

		return expandable_sides
	end

	local function _is_larger_than_neighbours(room, dir_str)
		local area = room.area
		slot5 = room.neighbours[dir_str]

		for index_neightbour, neighbour_data in pairs(slot4) do
			local i_neighbour_room = neighbour_data.room
			local neighbour_area = self._rooms[i_neighbour_room].area

			if area < neighbour_area then
				return false
			end
		end

		return true
	end

	local sorted_rooms = self._building.sorted_rooms

	while 0 < #sorted_rooms do
		local i_room = sorted_rooms[#sorted_rooms]
		local room = self._rooms[i_room]
		local expandable_borders = _get_room_expandable_borders(slot10)
		slot12 = expandable_borders
		local exp_border = next(room)

		while exp_border do
			slot15 = exp_border

			if self._chk_room_side_too_long(slot12, self, room.borders) then
				if expandable_borders[self._perp_neg_dir_str_map[exp_border]] then
					exp_border = self._perp_neg_dir_str_map[exp_border]
				elseif expandable_borders[self._perp_pos_dir_str_map[exp_border]] then
					exp_border = self._perp_pos_dir_str_map[exp_border]
				end
			end

			slot16 = exp_border
			local border_seg = self._get_border_segment(slot12, self, room.height, room.borders)
			slot16 = exp_border
			local clip_size = self._room_expansion_space_at_side(self, self, room.borders)
			slot15 = room.neighbours[exp_border]

			for index_neighbour, neighbour_data in pairs(self) do
				local neighbour_room = self._rooms[neighbour_data.room]
				local neighbour_borders = neighbour_room.borders
				slot25 = border_seg
				local neighbour_clip_size = self._room_retract_space_at_side(slot21, self, neighbour_room, self._opposite_side_str[exp_border])

				if neighbour_clip_size < clip_size then
					clip_size = neighbour_clip_size
				end
			end

			if 0 < clip_size then
				slot16 = exp_border
			else
				expandable_borders[exp_border] = nil

				if expandable_borders[self._opposite_side_str[exp_border]] then
					exp_border = self._opposite_side_str[exp_border]
				elseif expandable_borders[self._perp_neg_dir_str_map[exp_border]] then
					exp_border = self._perp_neg_dir_str_map[exp_border]
				elseif expandable_borders[self._perp_pos_dir_str_map[exp_border]] then
					exp_border = self._perp_pos_dir_str_map[exp_border]
				else
					exp_border = nil
				end
			end
		end

		slot13 = sorted_rooms

		table.remove(slot12)

		return 
	end

	return true
end
NavFieldBuilder._sort_room_by_area = function (self, i_room, room_list, resort)
	if resort then
		slot6 = room_list

		for sort_index, i_sorted_room in ipairs(slot5) do
			if i_room == i_sorted_room then
				slot12 = sort_index

				table.remove(slot10, room_list)

				break
			end
		end
	end

	local room = self._rooms[i_room]
	local area = room.area
	local search_i = #room_list

	while 0 < search_i do
		local i_test_room = room_list[search_i]
		local test_room = self._rooms[i_test_room]
		local test_area = test_room.area

		if test_area <= area then
			break
		end

		search_i = search_i - 1
	end

	slot11 = i_room

	table.insert(slot8, room_list, search_i + 1)

	return 
end
NavFieldBuilder._update_progress_bar = function (self, percent_complete, text)
	if self._progress_dialog then
		slot7 = text
		local result = self._progress_dialog.update_bar(slot4, self._progress_dialog, percent_complete)

		if not result then
			slot10 = "YES_NO,ICON_QUESTION"
			slot15 = 0
			local confirm = EWS.message_box(slot5, EWS, Global.frame_panel, "Cancel calculation?", "AI", Vector3(slot12, -1, -1))

			if confirm == "NO" then
				slot7 = self._progress_dialog

				self._progress_dialog.resume(slot6)

				return 
			end

			self._progress_dialog_cancel = true
		end
	end

	return 
end
NavFieldBuilder._get_border_segment = function (self, height, borders, side)
	local seg = {
		Vector3(),
		Vector3()
	}
	slot8 = borders[side]

	mvector3["set_" .. self._dim_str_map[side]]("set_" .. self._dim_str_map[side], seg[1])

	slot8 = borders[side]

	mvector3["set_" .. self._dim_str_map[side]]("set_" .. self._dim_str_map[side], seg[2])

	slot8 = borders[self._perp_neg_dir_str_map[side]]

	mvector3["set_" .. self._perp_dim_str_map[side]]("set_" .. self._perp_dim_str_map[side], seg[1])

	slot8 = borders[self._perp_pos_dir_str_map[side]]

	mvector3["set_" .. self._perp_dim_str_map[side]]("set_" .. self._perp_dim_str_map[side], seg[2])

	slot9 = seg[1]
	local pos_z = self._get_room_height_at_pos("set_" .. self._perp_dim_str_map[side], height, borders)
	slot9 = pos_z

	mvector3.set_z(height, seg[1])

	slot10 = seg[2]
	local pos_z = self._get_room_height_at_pos(height, height, borders)
	slot10 = pos_z

	mvector3.set_z(height, seg[2])

	return seg
end
NavFieldBuilder._expand_room_over_neighbours = function (self, i_room, exp_border, clip_size)
	local room = self._rooms[i_room]
	local neighbours = room.neighbours[exp_border]
	local expand_vec = self._dir_str_to_vec[exp_border] * clip_size
	local new_rooms, trash_rooms, shrunk_rooms = nil

	repeat
		local new_room = nil
		slot13 = neighbours

		for index_neighbour, neighbour_data in pairs(slot12) do
			local clip_segment = neighbour_data.overlap
			slot22 = clip_segment
			new_room = self._split_room_for_retraction(slot18, self, neighbour_data.room, self._opposite_side_str[exp_border])

			if new_room then
				new_rooms = new_rooms or {}
				slot20 = new_room

				table.insert(slot18, new_rooms)

				break
			end
		end
	until not new_room

	local retract_rooms = {}
	slot13 = neighbours

	for index_neighbour, neighbour_data in pairs(slot12) do
		slot19 = neighbour_data

		table.insert(slot17, retract_rooms)
	end

	slot13 = room.expansion[exp_border]

	for obs_type, seg_list in pairs(slot12) do
		slot18 = seg_list

		for i_seg, seg in pairs(slot17) do
			seg[1] = seg[1] + expand_vec
			seg[2] = seg[2] + expand_vec
		end
	end

	slot13 = retract_rooms

	for _, neighbour_data in pairs(slot12) do
		local clip_segment = neighbour_data.overlap
		local want_neg_data = clip_segment[1][self._perp_dim_str_map[exp_border]] == room.borders[self._perp_neg_dir_str_map[exp_border]]
		local want_pos_data = clip_segment[2][self._perp_dim_str_map[exp_border]] == room.borders[self._perp_pos_dir_str_map[exp_border]]
		slot27 = want_pos_data
		local destroy, new_data = self._clip_room_border(slot20, self, neighbour_data.room, self._opposite_side_str[exp_border], clip_size, clip_segment, want_neg_data)

		if destroy then
			trash_rooms = trash_rooms or {}
			slot24 = neighbour_data.room

			table.insert(slot22, trash_rooms)
		else
			shrunk_rooms = shrunk_rooms or {}
			slot24 = neighbour_data.room

			table.insert(slot22, shrunk_rooms)
		end

		if new_data then
			slot23 = new_data.neighbours

			for side, neighbour_list in pairs(slot22) do
				slot28 = neighbour_list

				for neighbour_index, neighbour_data in pairs(slot27) do
					slot36 = side

					self._append_neighbour(slot32, self, room.neighbours[side], neighbour_data)

					if self._rooms[neighbour_data.room].neighbours then
						local new_data = {
							room = i_room,
							overlap = {
								neighbour_data.overlap[1],
								neighbour_data.overlap[2]
							}
						}
						slot37 = self._opposite_side_str[side]

						self._append_neighbour(neighbour_data.overlap[2], self, self._rooms[neighbour_data.room].neighbours[self._opposite_side_str[side]], new_data)
					end
				end
			end

			if not destroy then
				neighbour_data.overlap[1] = neighbour_data.overlap[1] + expand_vec
				neighbour_data.overlap[2] = neighbour_data.overlap[2] + expand_vec
			end

			if new_data.expansion[exp_border] then
				slot23 = new_data.expansion[exp_border]

				for obs_type, seg_list in pairs(slot22) do
					slot28 = seg_list

					for i_seg, seg in pairs(slot27) do
						slot33 = room.expansion[exp_border]

						for obs_type, old_seg_list in pairs(slot32) do
							slot42 = self._perp_dim_str_map[exp_border]
							room.expansion[exp_border][obs_type] = self._remove_seg_from_seg_list(slot38, self, old_seg_list, seg)
						end
					end
				end
			end

			slot23 = new_data.expansion

			for side, obs_data in pairs(slot22) do
				slot28 = obs_data

				for obs_type, seg_list in pairs(slot27) do
					slot33 = seg_list

					for i_seg, seg in pairs(slot32) do
						slot41 = self._perp_dim_str_map[side]

						self._append_seg_to_seg_list(slot37, self, room.expansion[side][obs_type], seg)
					end
				end
			end
		end
	end

	local new_border = room.borders[exp_border] + clip_size * ((self._neg_dir_str_map[exp_border] and -1) or 1)
	room.borders[exp_border] = new_border
	slot15 = room.borders
	room.area = self._calc_room_area(slot13, self)
	slot17 = "x_pos"

	self._find_room_height_from_expansion(slot13, self, room.expansion, room.height)

	return new_rooms, trash_rooms, shrunk_rooms
end
NavFieldBuilder._room_expansion_space_at_side = function (self, borders, exp_border)
	slot5 = borders[exp_border] - borders[self._opposite_side_str[exp_border]]
	local length_size = math.abs(slot4)

	return length_size
end
NavFieldBuilder._room_retract_space_at_side = function (self, room, side, border_line)
	local borders = room.borders
	local expansion = room.expansion
	local perp_neg_side = self._perp_neg_dir_str_map[side]
	local perp_pos_side = self._perp_pos_dir_str_map[side]
	local side_dim = self._dim_str_map[side]
	local side_perp_dim = self._perp_dim_str_map[side]
	local max_obstacle, min_obstacle = nil

	if border_line[1][side_perp_dim] < borders[perp_neg_side] then
		slot14 = expansion[perp_neg_side].stairs

		for i_seg, seg in pairs(slot13) do
			if not max_obstacle or max_obstacle < seg[2][side_dim] then
				max_obstacle = seg[2][side_dim]
			end

			if not min_obstacle or seg[1][side_dim] < min_obstacle then
				min_obstacle = seg[1][side_dim]
			end
		end
	end

	if borders[perp_pos_side] < border_line[2][side_perp_dim] then
		slot14 = expansion[perp_pos_side].stairs

		for i_seg, seg in pairs(slot13) do
			if not max_obstacle or max_obstacle < seg[2][side_dim] then
				max_obstacle = seg[2][side_dim]
			end

			if not min_obstacle or seg[1][side_dim] < min_obstacle then
				min_obstacle = seg[1][side_dim]
			end
		end
	end

	local clamp_length = nil

	if self._neg_dir_str_map[side] then
		if min_obstacle then
			clamp_length = min_obstacle - borders[side]
		else
			clamp_length = borders[self._opposite_side_str[side]] - borders[side]
		end
	elseif max_obstacle then
		clamp_length = borders[side] - max_obstacle
	else
		clamp_length = borders[side] - borders[self._opposite_side_str[side]]
	end

	return clamp_length
end
NavFieldBuilder._split_room_for_retraction = function (self, i_room, side, clip_segment)
	local room = self._rooms[i_room]
	local borders = room.borders
	local clip_perp_dim = self._perp_dim_str_map[side]
	local perp_neg_side = self._perp_neg_dir_str_map[side]
	local perp_pos_side = self._perp_pos_dir_str_map[side]
	local clip_line = {
		clip_segment[1][clip_perp_dim],
		clip_segment[2][clip_perp_dim]
	}
	local overlaps_neg = clip_line[1] == borders[perp_neg_side]
	local overlaps_pos = clip_line[2] == borders[perp_pos_side]

	if not overlaps_neg or not overlaps_pos then
		local split_pos = (overlaps_neg and clip_line[2]) or clip_line[1]
		slot18 = clip_perp_dim
		local new_i_room = self._split_room(slot14, self, i_room, split_pos)

		return new_i_room
	end

	return 
end
NavFieldBuilder._clip_room_border = function (self, i_room, side, clip_amount, clip_segment, want_neg_data, want_pos_data)
	local room = self._rooms[i_room]
	local borders = room.borders
	local neighbours = room.neighbours
	local expansion = room.expansion
	local expansion_segments = room.expansion_segments
	local new_data = {}
	local lower_neighbours = {
		x_pos = {},
		x_neg = {},
		y_pos = {},
		y_neg = {}
	}
	local upper_neighbours = {
		x_pos = {},
		x_neg = {},
		y_pos = {},
		y_neg = {}
	}
	local is_clip_side_neg = self._neg_dir_str_map[side]
	local clip_dim = self._dim_str_map[side]
	local clip_perp_dim = self._perp_dim_str_map[side]
	local perp_neg_side = self._perp_neg_dir_str_map[side]
	local perp_pos_side = self._perp_pos_dir_str_map[side]
	local opp_side = self._opposite_side_str[side]
	local clip_line = {
		clip_segment[1][clip_perp_dim],
		clip_segment[2][clip_perp_dim]
	}
	slot24 = borders[side] - borders[opp_side]
	local my_length = math.abs(slot23)

	if clip_amount < my_length then
		local lower_expansion_data = {}
		local upper_expansion_data = {}
		lower_expansion_data[perp_neg_side] = {}
		lower_expansion_data[perp_pos_side] = {}
		upper_expansion_data[perp_neg_side] = {}
		upper_expansion_data[perp_pos_side] = {}
		borders[side] = (self._neg_dir_str_map[side] and borders[side] + clip_amount) or borders[side] - clip_amount
		local clip_pos = Vector3()
		slot29 = borders[side]

		mvector3["set_" .. clip_dim]("set_" .. clip_dim, clip_pos)

		slot29 = borders[perp_neg_side]

		mvector3["set_" .. clip_perp_dim]("set_" .. clip_perp_dim, clip_pos)

		slot28 = expansion[perp_neg_side]

		for obs_type, obs_list in pairs("set_" .. clip_perp_dim) do
			slot36 = clip_dim
			local lower_part, upper_part = self._split_segment_list_at_position(slot32, self, obs_list, clip_pos)
			upper_expansion_data[perp_neg_side][obs_type] = upper_part
			lower_expansion_data[perp_neg_side][obs_type] = lower_part
		end

		slot31 = clip_dim
		local lower_part, upper_part = self._split_side_neighbours(slot27, self, neighbours[perp_neg_side], clip_pos)
		lower_neighbours[perp_neg_side] = lower_part
		upper_neighbours[perp_neg_side] = upper_part
		slot31 = borders[perp_pos_side]

		mvector3["set_" .. clip_perp_dim]("set_" .. clip_perp_dim, clip_pos)

		slot30 = expansion[perp_pos_side]

		for obs_type, obs_list in pairs("set_" .. clip_perp_dim) do
			slot38 = clip_dim
			local lower_part, upper_part = self._split_segment_list_at_position(slot34, self, obs_list, clip_pos)
			upper_expansion_data[perp_pos_side][obs_type] = upper_part
			lower_expansion_data[perp_pos_side][obs_type] = lower_part
		end

		slot33 = clip_dim
		local lower_part, upper_part = self._split_side_neighbours(slot29, self, neighbours[perp_pos_side], clip_pos)
		lower_neighbours[perp_pos_side] = lower_part
		upper_neighbours[perp_pos_side] = upper_part

		if is_clip_side_neg then
			new_data.expansion = lower_expansion_data
			new_data.neighbours = lower_neighbours
			expansion[perp_neg_side] = upper_expansion_data[perp_neg_side]
			expansion[perp_pos_side] = upper_expansion_data[perp_pos_side]
			slot32 = lower_neighbours[perp_neg_side]

			for neighbour_index, neighbour_data in pairs(slot31) do
				slot41 = perp_pos_side

				self._update_neighbour_data(slot36, self, neighbour_data.room, i_room, nil)
			end

			slot32 = lower_neighbours[perp_pos_side]

			for neighbour_index, neighbour_data in pairs(slot31) do
				slot41 = perp_neg_side

				self._update_neighbour_data(slot36, self, neighbour_data.room, i_room, nil)
			end

			neighbours[perp_neg_side] = upper_neighbours[perp_neg_side]
			neighbours[perp_pos_side] = upper_neighbours[perp_pos_side]
		else
			new_data.expansion = upper_expansion_data
			new_data.neighbours = upper_neighbours
			expansion[perp_neg_side] = lower_expansion_data[perp_neg_side]
			expansion[perp_pos_side] = lower_expansion_data[perp_pos_side]
			slot32 = upper_neighbours[perp_neg_side]

			for neighbour_index, neighbour_data in pairs(slot31) do
				slot41 = perp_pos_side

				self._update_neighbour_data(slot36, self, neighbour_data.room, i_room, nil)
			end

			slot32 = upper_neighbours[perp_pos_side]

			for neighbour_index, neighbour_data in pairs(slot31) do
				slot41 = perp_neg_side

				self._update_neighbour_data(slot36, self, neighbour_data.room, i_room, nil)
			end

			neighbours[perp_neg_side] = lower_neighbours[perp_neg_side]
			neighbours[perp_pos_side] = lower_neighbours[perp_pos_side]
		end

		if not want_neg_data then
			new_data.expansion[perp_neg_side] = {}
			new_data.neighbours[perp_neg_side] = {}
		end

		if not want_pos_data then
			new_data.expansion[perp_pos_side] = {}
			new_data.neighbours[perp_pos_side] = {}
		end

		slot35 = side
		local mid_space = self._get_border_segment(slot31, self, room.height, room.borders)
		expansion[side].spaces = {
			mid_space
		}
		local retract_vec = self._dir_str_to_vec[opp_side] * clip_amount
		slot34 = neighbours[side]

		for neighbour_index, neighbour_data in pairs(room.height) do
			local overlap = neighbour_data.overlap
			overlap[1] = overlap[1] + retract_vec
			overlap[2] = overlap[2] + retract_vec
		end

		slot34 = neighbours[perp_neg_side]

		for neighbour_index, neighbour_data in pairs(slot33) do
			local new_data = {
				room = i_room,
				overlap = {
					neighbour_data.overlap[1],
					neighbour_data.overlap[2]
				}
			}
			slot44 = perp_pos_side

			self._update_neighbour_data(neighbour_data.overlap[2], self, neighbour_data.room, i_room, new_data)
		end

		slot34 = neighbours[perp_pos_side]

		for neighbour_index, neighbour_data in pairs(slot33) do
			local new_data = {
				room = i_room,
				overlap = {
					neighbour_data.overlap[1],
					neighbour_data.overlap[2]
				}
			}
			slot44 = perp_neg_side

			self._update_neighbour_data(neighbour_data.overlap[2], self, neighbour_data.room, i_room, new_data)
		end

		slot35 = borders
		room.area = self._calc_room_area(slot33, self)
		slot37 = side

		self._find_room_height_from_expansion(slot33, self, expansion, room.height)
	else
		new_data.expansion = {}
		new_data.neighbours = {}

		if want_neg_data then
			new_data.expansion[perp_neg_side] = expansion[perp_neg_side]
			new_data.neighbours[perp_neg_side] = neighbours[perp_neg_side]
		end

		if want_pos_data then
			new_data.expansion[perp_pos_side] = expansion[perp_pos_side]
			new_data.neighbours[perp_pos_side] = neighbours[perp_pos_side]
		end

		new_data.expansion[opp_side] = expansion[opp_side]
		new_data.neighbours[opp_side] = neighbours[opp_side]
		slot26 = i_room

		self._trash_room(neighbours[opp_side], self)

		return true, new_data
	end

	return false, new_data
end
NavFieldBuilder._split_room = function (self, i_room, split_pos_along_dim, split_dim)
	local room = self._rooms[i_room]
	local borders = room.borders
	local expansion = room.expansion
	slot9 = self
	local new_room = self._create_empty_room(slot8)
	new_room.segment = room.segment
	local split_side = (split_dim == "x" and "x_pos") or "y_pos"
	local split_perp_neg_side = self._perp_neg_dir_str_map[split_side]
	local split_perp_pos_side = self._perp_pos_dir_str_map[split_side]
	local split_perp_dim = self._perp_dim_str_map[split_side]
	local split_opp_side = self._opposite_side_str[split_side]
	local split_pos = Vector3()
	slot17 = split_pos_along_dim

	mvector3["set_" .. split_dim]("set_" .. split_dim, split_pos)

	slot17 = borders[split_perp_neg_side]

	mvector3["set_" .. split_perp_dim]("set_" .. split_perp_dim, split_pos)

	slot16 = expansion[split_perp_neg_side]

	for obs_type, obs_list in pairs("set_" .. split_perp_dim) do
		slot24 = split_dim
		local lower_part, upper_part = self._split_segment_list_at_position(slot20, self, obs_list, split_pos)
		expansion[split_perp_neg_side][obs_type] = upper_part
		new_room.expansion[split_perp_neg_side][obs_type] = lower_part
	end

	slot19 = split_dim
	local lower_part, upper_part = self._split_side_neighbours(slot15, self, room.neighbours[split_perp_neg_side], split_pos)
	room.neighbours[split_perp_neg_side] = upper_part
	new_room.neighbours[split_perp_neg_side] = lower_part
	slot19 = borders[split_perp_pos_side]

	mvector3["set_" .. split_perp_dim]("set_" .. split_perp_dim, split_pos)

	slot18 = expansion[split_perp_pos_side]

	for obs_type, obs_list in pairs("set_" .. split_perp_dim) do
		slot26 = split_dim
		local lower_part, upper_part = self._split_segment_list_at_position(slot22, self, obs_list, split_pos)
		expansion[split_perp_pos_side][obs_type] = upper_part
		new_room.expansion[split_perp_pos_side][obs_type] = lower_part
	end

	slot21 = split_dim
	local lower_part, upper_part = self._split_side_neighbours(slot17, self, room.neighbours[split_perp_pos_side], split_pos)
	room.neighbours[split_perp_pos_side] = upper_part
	new_room.neighbours[split_perp_pos_side] = lower_part
	local space = {
		Vector3(),
		Vector3()
	}
	slot22 = split_pos_along_dim

	mvector3["set_" .. split_dim]("set_" .. split_dim, space[1])

	slot22 = split_pos_along_dim

	mvector3["set_" .. split_dim]("set_" .. split_dim, space[2])

	slot22 = borders[split_perp_neg_side]

	mvector3["set_" .. split_perp_dim]("set_" .. split_perp_dim, space[1])

	slot22 = borders[split_perp_pos_side]

	mvector3["set_" .. split_perp_dim]("set_" .. split_perp_dim, space[2])

	slot23 = space[1]
	local pos_z = self._get_room_height_at_pos("set_" .. split_perp_dim, room.height, borders)
	slot23 = pos_z

	mvector3.set_z(room.height, space[1])

	slot24 = space[2]
	pos_z = self._get_room_height_at_pos(room.height, room.height, borders)
	slot23 = pos_z

	mvector3.set_z(room.height, space[2])

	new_room.expansion[split_side] = {
		spaces = {
			space
		},
		walls = {},
		stairs = {},
		cliffs = {},
		unsorted = {}
	}
	new_room.expansion[split_opp_side] = room.expansion[split_opp_side]
	expansion[split_opp_side] = {
		spaces = {
			{
				space[1],
				space[2]
			}
		},
		walls = {},
		stairs = {},
		cliffs = {},
		unsorted = {}
	}
	new_room.neighbours[split_side] = {
		{
			room = i_room,
			overlap = {
				space[1],
				space[2]
			}
		}
	}
	local i_new_room = #self._rooms + 1
	slot23 = room.neighbours[split_opp_side]

	for neighbour_index, neighbour_data in pairs() do
		if self._rooms[neighbour_data.room].neighbours then
			slot32 = split_side

			self._update_neighbour_data(slot27, self, neighbour_data.room, i_room, nil)

			local new_data = {
				room = i_new_room,
				overlap = {
					neighbour_data.overlap[1],
					neighbour_data.overlap[2]
				}
			}
			slot32 = split_side

			self._append_neighbour(neighbour_data.overlap[2], self, self._rooms[neighbour_data.room].neighbours[split_side], new_data)
		end
	end

	new_room.neighbours[split_opp_side] = room.neighbours[split_opp_side]
	room.neighbours[split_opp_side] = {
		{
			room = i_new_room,
			overlap = {
				space[1],
				space[2]
			}
		}
	}
	new_room.borders[split_side] = split_pos_along_dim
	new_room.borders[split_opp_side] = room.borders[split_opp_side]
	new_room.borders[split_perp_neg_side] = room.borders[split_perp_neg_side]
	new_room.borders[split_perp_pos_side] = room.borders[split_perp_pos_side]
	room.borders[split_opp_side] = split_pos_along_dim
	slot26 = "x_pos"

	self._find_room_height_from_expansion(room.borders[split_perp_pos_side], self, new_room.expansion, new_room.height)

	slot26 = "x_pos"

	self._find_room_height_from_expansion(room.borders[split_perp_pos_side], self, room.expansion, room.height)

	slot24 = room.borders
	room.area = self._calc_room_area(room.borders[split_perp_pos_side], self)
	slot24 = new_room.borders
	new_room.area = self._calc_room_area(room.borders[split_perp_pos_side], self)
	slot23 = new_room.neighbours[split_perp_neg_side]

	for neighbour_index, neighbour_data in pairs(room.borders[split_perp_pos_side]) do
		if self._rooms[neighbour_data.room].neighbours then
			slot32 = split_perp_pos_side

			self._update_neighbour_data(slot27, self, neighbour_data.room, i_room, nil)

			local new_data = {
				room = i_new_room,
				overlap = {
					neighbour_data.overlap[1],
					neighbour_data.overlap[2]
				}
			}
			slot32 = split_perp_pos_side

			self._append_neighbour(neighbour_data.overlap[2], self, self._rooms[neighbour_data.room].neighbours[split_perp_pos_side], new_data)
		end
	end

	slot23 = new_room.neighbours[split_perp_pos_side]

	for neighbour_index, neighbour_data in pairs(slot22) do
		if self._rooms[neighbour_data.room].neighbours then
			slot32 = split_perp_neg_side

			self._update_neighbour_data(slot27, self, neighbour_data.room, i_room, nil)

			local new_data = {
				room = i_new_room,
				overlap = {
					neighbour_data.overlap[1],
					neighbour_data.overlap[2]
				}
			}
			slot32 = split_perp_neg_side

			self._append_neighbour(neighbour_data.overlap[2], self, self._rooms[neighbour_data.room].neighbours[split_perp_neg_side], new_data)
		end
	end

	slot23 = room.neighbours[split_perp_neg_side]

	for neighbour_index, neighbour_data in pairs(slot22) do
		local new_data = {
			room = i_room,
			overlap = {
				neighbour_data.overlap[1],
				neighbour_data.overlap[2]
			}
		}
		slot33 = split_perp_pos_side

		self._update_neighbour_data(neighbour_data.overlap[2], self, neighbour_data.room, i_room, new_data)
	end

	slot23 = room.neighbours[split_perp_pos_side]

	for neighbour_index, neighbour_data in pairs(slot22) do
		local new_data = {
			room = i_room,
			overlap = {
				neighbour_data.overlap[1],
				neighbour_data.overlap[2]
			}
		}
		slot33 = split_perp_neg_side

		self._update_neighbour_data(neighbour_data.overlap[2], self, neighbour_data.room, i_room, new_data)
	end

	slot24 = new_room

	self._add_room(slot22, self)

	return i_new_room
end
NavFieldBuilder._create_empty_room = function (self)
	local room = {
		neighbours = {},
		expansion = {},
		borders = {},
		height = {},
		doors = {},
		expansion_segments = {}
	}
	slot4 = self._perp_neg_dir_str_map

	for dir_str, perp_neg_dir_str in pairs(slot3) do
		room.expansion[dir_str] = {
			walls = {},
			spaces = {},
			stairs = {},
			cliffs = {},
			unsorted = {}
		}
		room.expansion_segments[dir_str] = {}
		room.neighbours[dir_str] = {}
		room.doors[dir_str] = {}
	end

	return room
end
NavFieldBuilder._cleanup_room_data = function (self)
	slot3 = self._rooms

	for i_room, room in ipairs(slot2) do
		local clean_room = {
			doors = room.doors,
			borders = room.borders,
			height = room.height,
			segment = room.segment
		}
		self._rooms[i_room] = clean_room
	end

	return 
end
NavFieldBuilder._cleanup_room_data_1 = function (self)
	slot3 = self._rooms

	for i_room, room in ipairs(slot2) do
		room.segment = nil
	end

	return 
end
NavFieldBuilder._calculate_door_heights = function (self)
	slot3 = self._room_doors

	for i_door, door in ipairs(slot2) do
		local room_1 = self._rooms[door.rooms[1]]
		local room_2 = self._rooms[door.rooms[2]]
		slot12 = door.pos
		local room_1_z = self._get_room_height_at_pos(slot9, room_1.height, room_1.borders)
		slot13 = door.pos
		local room_2_z = self._get_room_height_at_pos(room_1.height, room_2.height, room_2.borders)
		slot13 = (room_1_z + room_2_z) * 0.5
		door.pos = door.pos.with_z(room_2.height, door.pos)
		slot14 = door.pos1
		room_1_z = self._get_room_height_at_pos(room_2.height, room_1.height, room_1.borders)
		slot14 = door.pos1
		room_2_z = self._get_room_height_at_pos(room_2.height, room_2.height, room_2.borders)
		slot13 = (room_1_z + room_2_z) * 0.5
		door.pos1 = door.pos1.with_z(room_2.height, door.pos1)
	end

	return 
end
NavFieldBuilder._round_pos_to_grid_center = function (self, pos)
	local rounded_pos = Vector3()
	slot6 = pos.z

	mvector3.set_z(slot4, rounded_pos)

	local round_x = pos.x - pos.x % self._grid_size
	slot7 = round_x

	mvector3.set_x(self._grid_size, rounded_pos)

	local round_y = pos.y - pos.y % self._grid_size
	slot8 = round_y

	mvector3.set_y(self._grid_size, rounded_pos)

	return rounded_pos
end
NavFieldBuilder._add_room = function (self, room)
	if not room.area then
		slot4 = "[NavFieldBuilder:_add_room] missing area"
		slot7 = room

		debug_pause(slot3, inspect(slot6))

		room.area = 0
	end

	slot5 = room

	table.insert(slot3, self._rooms)

	return 
end
NavFieldBuilder._trash_room = function (self, i_room)
	local room = self._rooms[i_room]

	if room.doors then
		slot5 = room.doors

		for side, door_list in pairs(slot4) do
			local opp_side = self._opposite_side_str[side]
			slot11 = door_list

			for _, i_door in pairs(slot10) do
				local door = self._room_doors[i_door]
				local i_neighbour = (door.rooms[1] == i_room and door.rooms[2]) or door.rooms[1]
				local neigh_doors = self._rooms[i_neighbour].doors[opp_side]
				slot19 = neigh_doors

				for neigh_door_index, i_neigh_door in pairs(slot18) do
					if i_door == i_neigh_door then
						slot25 = neigh_door_index

						table.remove(slot23, neigh_doors)

						slot25 = i_door

						self._destroy_door(slot23, self)

						break
					end
				end
			end
		end
	end

	room.trashed = true

	if room.neighbours then
		slot5 = room.neighbours

		for side, neighbour_list in pairs(slot4) do
			local opp_side = self._opposite_side_str[side]
			slot11 = neighbour_list

			for i_neighbour, neighbour_data in pairs(slot10) do
				slot20 = opp_side

				self._update_neighbour_data(slot15, self, neighbour_data.room, i_room, nil)
			end
		end
	end

	slot5 = self._room_doors

	for i_door, door in pairs(slot4) do
		if i_room < door.rooms[1] then
			door.rooms[1] = door.rooms[1] - 1
		end

		if i_room < door.rooms[2] then
			door.rooms[2] = door.rooms[2] - 1
		end
	end

	slot5 = self._visibility_groups

	for i_vis_grp, vis_grp in ipairs(slot4) do
		local rooms = {}
		slot11 = vis_grp.rooms

		for old_i_room, _ in pairs(slot10) do
			if i_room < old_i_room then
				rooms[old_i_room - 1] = true
			else
				rooms[old_i_room] = true
			end
		end

		vis_grp.rooms = rooms
	end

	return 
end
NavFieldBuilder._destroy_room = function (self, i_room)
	slot5 = i_room

	table.remove(slot3, self._rooms)

	slot4 = self._rooms

	for i_test_room, test_room in ipairs(slot3) do
		if not test_room.trashed and test_room.neighbours then
			slot9 = test_room.neighbours

			for side, neighbour_list in pairs(slot8) do
				slot14 = neighbour_list

				for i_neighbour, neighbour_data in pairs(slot13) do
					if i_room < neighbour_data.room then
						neighbour_data.room = neighbour_data.room - 1
					end
				end
			end
		end
	end

	return 
end
NavFieldBuilder._add_door = function (self, door)
	slot5 = door

	table.insert(slot3, self._room_doors)

	return #self._room_doors
end
NavFieldBuilder._destroy_door = function (self, i_door)
	slot5 = i_door

	table.remove(slot3, self._room_doors)

	slot4 = self._rooms

	for i_room, room in ipairs(slot3) do
		slot9 = room.doors

		for side, door_list in pairs(slot8) do
			slot14 = door_list

			for door_index, i_test_door in pairs(slot13) do
				if i_door < i_test_door then
					door_list[door_index] = i_test_door - 1
				end
			end
		end
	end

	return 
end
NavFieldBuilder._analyse_room = function (self, enter_dir_str, enter_pos)
	local opp_dir_str_map = self._opposite_side_str
	local perp_pos_dir_str_map = self._perp_pos_dir_str_map
	local perp_neg_dir_str_map = self._perp_neg_dir_str_map
	local neg_dir_str_map = self._neg_dir_str_map
	local x_dir_str_map = self._x_dir_str_map
	local dir_vec_map = self._dir_str_to_vec
	local room = {
		neighbours = {}
	}
	local expansion = {}
	room.expansion = expansion
	local borders = {}
	room.borders = borders
	local height = {}
	room.height = height
	local expandable_sides_map = {}
	room.inclination = {}
	local expansion_segments = {}
	room.expansion_segments = expansion_segments
	room.doors = {}
	borders.x_pos = enter_pos.x + self._grid_size * 0.5
	borders.x_neg = enter_pos.x - self._grid_size * 0.5
	borders.y_pos = enter_pos.y + self._grid_size * 0.5
	borders.y_neg = enter_pos.y - self._grid_size * 0.5
	slot17 = perp_neg_dir_str_map

	for dir_str, perp_neg_dir_str in pairs(self._grid_size * 0.5) do
		room.expansion[dir_str] = {
			walls = {},
			spaces = {},
			stairs = {},
			cliffs = {},
			unsorted = {}
		}
		expansion_segments[dir_str] = {}
		expandable_sides_map[dir_str] = true
		room.neighbours[dir_str] = {}
		room.doors[dir_str] = {}
	end

	slot19 = enter_pos

	self._measure_init_room_expansion(slot16, self, room)

	local expanding_side = enter_dir_str
	local i_room = #self._rooms + 1
	slot23 = i_room

	self._expand_room_borders(room, self, expanding_side, room, expandable_sides_map)

	slot22 = room.neighbours

	self._fill_room_expansion_segments(room, self, room.expansion, expansion_segments)

	slot22 = "x_pos"

	self._find_room_height_from_expansion(room, self, expansion, height)

	slot20 = borders
	room.area = self._calc_room_area(room, self)
	room.segment = self._building.id
	slot20 = room

	self._add_room(room, self)

	slot19 = managers.navigation

	if managers.navigation.get_debug_draw_state(room) then
		slot19 = managers.navigation

		if managers.navigation.get_debug_draw_state(slot18).quads then
		end
	end

	return i_room
end
NavFieldBuilder._fill_room_expansion_segments = function (self, expansion, expansion_segments, neighbours)
	slot6 = expansion

	for side, obs_types in pairs(slot5) do
		local perp_dim = self._perp_dim_str_map[side]
		slot12 = obs_types.spaces

		for i_seg, segment in pairs(slot11) do
			slot18 = {
				segment[1],
				segment[2]
			}

			table.insert(slot16, expansion_segments[side])
		end

		slot12 = obs_types.stairs

		for i_seg, segment in pairs(slot11) do
			slot18 = {
				segment[1],
				segment[2]
			}

			table.insert(slot16, expansion_segments[side])
		end

		slot12 = neighbours[side]

		for i_neighbour, neighbour_data in pairs(slot11) do
			slot20 = perp_dim
			expansion_segments[side] = self._remove_seg_from_seg_list(slot16, self, expansion_segments[side], neighbour_data.overlap)
		end
	end

	return 
end
NavFieldBuilder._create_room_doors = function (self, i_room)
	local room = self._rooms[i_room]
	local neighbours = room.neighbours
	slot6 = neighbours

	for side, neightbour_list in pairs(slot5) do
		room.doors[side] = room.doors[side] or {}
		slot11 = neightbour_list

		for neighbour_index, neightbour_data in pairs(slot10) do
			local i_neighbour = neightbour_data.room
			local line = neightbour_data.overlap
			local neighbour_room = self._rooms[i_neighbour]
			local door = {}

			if self._neg_dir_str_map[side] then
				door.rooms = {
					i_neighbour,
					i_room
				}
			else
				door.rooms = {
					i_room,
					i_neighbour
				}
			end

			door.pos = neightbour_data.overlap[1]
			door.pos1 = neightbour_data.overlap[2]
			door.center = (door.pos + door.pos1) * 0.5
			slot21 = door
			local i_door = self._add_door(door.pos1, self)
			slot22 = i_door

			table.insert(self, room.doors[side])

			slot22 = i_door

			table.insert(self, neighbour_room.doors[self._opposite_side_str[side]])

			if self._rooms[i_neighbour].neighbours then
				slot21 = self._rooms[i_neighbour].neighbours

				for _, neighbours_neighbour_list in pairs(slot20) do
					slot26 = neighbours_neighbour_list

					for i_n, neighbours_neighbour_data in pairs(slot25) do
						if neighbours_neighbour_data.room == i_room then
							slot32 = i_n

							table.remove(slot30, neighbours_neighbour_list)

							break
						end
					end
				end
			end
		end
	end

	return 
end
NavFieldBuilder._expand_room_borders = function (self, expanding_side, room, expandable_sides_map, i_room)
	local opp_dir_str_map = self._opposite_side_str
	local perp_pos_dir_str_map = self._perp_pos_dir_str_map
	local perp_neg_dir_str_map = self._perp_neg_dir_str_map
	local neg_dir_str_map = self._neg_dir_str_map
	local x_dir_str_map = self._x_dir_str_map
	local dir_vec_map = self._dir_str_to_vec
	local borders = room.borders
	local expansion = room.expansion
	local neighbours = room.neighbours

	while expanding_side do

		-- Decompilation error in this vicinity:
		local dir_str = expanding_side
		local exp_data = expansion[dir_str]
		local unsorted_space = (exp_data.unsorted and exp_data.unsorted[1]) or exp_data.spaces[1]

		if not unsorted_space then
			return 
		end

		exp_data.unsorted = nil
		local opp_dir_str = opp_dir_str_map[dir_str]
		local perp_pos_dir_str = perp_pos_dir_str_map[dir_str]
		local perp_neg_dir_str = perp_neg_dir_str_map[dir_str]
		local dir_vec = dir_vec_map[dir_str]
		local expand_dim = self._dim_str_map[dir_str]
		local along_dim = self._perp_dim_str_map[dir_str]
		slot29 = room.inclination
		local res_expansion, expansion_blocked = self._expansion_check_obstacles(slot24, self, dir_str, dir_vec, unsorted_space)
	end

	slot16 = expandable_sides_map

	for dir_str, _ in pairs(slot15) do
		if expansion[dir_str].unsorted then
			local expand_seg = expansion[dir_str].unsorted[1]
			slot26 = room.inclination
			local res_expansion, expansion_blocked = self._expansion_check_obstacles(slot21, self, dir_str, dir_vec_map[dir_str], expand_seg)
			expansion[dir_str] = res_expansion
			slot26 = expand_seg
			local new_neighbours = self._expansion_check_neighbours(dir_str, self, dir_str)

			if new_neighbours then
				neighbours[dir_str] = new_neighbours
				slot25 = new_neighbours

				for _, neighbour_data in pairs(slot24) do
					local neighbour = self._rooms[neighbour_data.room]

					if neighbour.expansion_segments then
						slot36 = self._perp_dim_str_map[dir_str]
						neighbour.expansion_segments[opp_dir_str_map[dir_str]] = self._remove_seg_from_seg_list(slot32, self, neighbour.expansion_segments[opp_dir_str_map[dir_str]], neighbour_data.overlap)
					end

					if neighbour.neighbours then
						local new_data = {
							room = i_room,
							overlap = {
								neighbour_data.overlap[1],
								neighbour_data.overlap[2]
							}
						}
						slot35 = opp_dir_str_map[dir_str]

						self._append_neighbour(neighbour_data.overlap[2], self, neighbour.neighbours[opp_dir_str_map[dir_str]], new_data)
					end
				end
			end

			expansion[dir_str].unsorted = nil
		end
	end

	return 
end
NavFieldBuilder._append_neighbour = function (self, neighbours, new_neighbour, dir_str)
	local appended = nil
	local along_dim = self._perp_dim_str_map[dir_str]
	slot8 = neighbours

	for neighbour_index, neighbour_data in pairs(slot7) do
		local i_neighbour = neighbour_data.room

		if new_neighbour.room == i_neighbour then
			appended = true

			if new_neighbour.overlap[1][along_dim] < neighbour_data.overlap[1][along_dim] then
				neighbour_data.overlap[1] = new_neighbour.overlap[1]
			end

			if neighbour_data.overlap[2][along_dim] < new_neighbour.overlap[2][along_dim] then
				neighbour_data.overlap[2] = new_neighbour.overlap[2]
			end
		end
	end

	if not appended then
		slot9 = new_neighbour

		table.insert(slot7, neighbours)
	end

	return 
end
NavFieldBuilder._update_neighbour_data = function (self, i_room, i_neighbour, new_data, dir_str)
	if self._rooms[i_room].neighbours then
		local along_dim = self._perp_dim_str_map[dir_str]
		local neighbours = self._rooms[i_room].neighbours[dir_str]
		slot9 = neighbours

		for neighbour_index, neighbour_data in pairs(slot8) do
			if neighbour_data.room == i_neighbour then
				neighbours[neighbour_index] = nil
			end
		end

		if new_data then
			slot10 = new_data

			table.insert(slot8, neighbours)
		end
	end

	return 
end
NavFieldBuilder._split_side_neighbours = function (self, neighbours_list, split_pos, seg_dim)
	local low_seg_list = {}
	local high_seg_list = {}
	local split_length = split_pos[seg_dim]
	slot9 = neighbours_list

	for index_neighbour, neighbour_data in pairs(slot8) do
		local test_seg = neighbour_data.overlap
		local room = neighbour_data.room
		local test_min = test_seg[1][seg_dim]
		local test_max = test_seg[2][seg_dim]
		local new_segment1, new_segment2 = nil

		if split_length <= test_min then
			slot21 = {
				overlap = test_seg,
				room = room
			}

			table.insert(slot19, high_seg_list)
		elseif test_max <= split_length then
			slot21 = {
				overlap = test_seg,
				room = room
			}

			table.insert(slot19, low_seg_list)
		else
			slot20 = split_pos
			slot25 = (split_length - test_min) / (test_max - test_min)
			local mid_pos = split_pos.with_z(slot19, math.lerp(slot22, test_seg[1].z, test_seg[2].z))
			local new_segment1 = {
				test_seg[1],
				mid_pos
			}
			local new_segment2 = {
				mid_pos,
				test_seg[2]
			}
			slot24 = {
				overlap = new_segment1,
				room = room
			}

			table.insert(slot22, low_seg_list)

			slot24 = {
				overlap = new_segment2,
				room = room
			}

			table.insert(slot22, high_seg_list)
		end
	end

	return low_seg_list, high_seg_list
end
NavFieldBuilder._chk_room_side_too_long = function (self, borders, dir_str)
	slot5 = borders[dir_str] - borders[self._opposite_side_str[dir_str]]
	local exp_side_len = math.abs(slot4)
	local perp_side_len = borders[self._perp_pos_dir_str_map[dir_str]] - borders[self._perp_neg_dir_str_map[dir_str]]
	local room_dim_ratio = exp_side_len / perp_side_len

	return 2 <= room_dim_ratio and self._grid_size * 4 <= exp_side_len, 1 < room_dim_ratio
end
NavFieldBuilder._append_seg_to_seg_list = function (self, seg_list, seg, seg_dim)
	local appended, i_app_seg = nil
	slot8 = seg_list

	for i_seg, test_seg in pairs(slot7) do
		if test_seg[1][seg_dim] == seg[2][seg_dim] then
			test_seg[1] = seg[1]
			appended = 1
			i_app_seg = i_seg

			break
		elseif test_seg[2][seg_dim] == seg[1][seg_dim] then
			test_seg[2] = seg[2]
			appended = 2
			i_app_seg = i_seg

			break
		end
	end

	if not appended then
		slot9 = {
			seg[1],
			seg[2]
		}

		table.insert(slot7, seg_list)
	elseif appended == 1 then
		local app_pos = seg_list[i_app_seg][1][seg_dim]
		slot9 = seg_list

		for i_test_seg, test_seg in pairs(slot8) do
			if app_pos <= test_seg[2][seg_dim] and test_seg[1][seg_dim] < app_pos then
				seg_list[i_app_seg][1] = test_seg[1]
				slot15 = i_test_seg

				table.remove(test_seg[1], seg_list)

				break
			end
		end
	elseif appended == 2 then
		local app_pos = seg_list[i_app_seg][2][seg_dim]
		slot9 = seg_list

		for i_test_seg, test_seg in pairs(slot8) do
			if test_seg[1][seg_dim] <= app_pos and app_pos < test_seg[2][seg_dim] then
				seg_list[i_app_seg][2] = test_seg[2]
				slot15 = i_test_seg

				table.remove(test_seg[2], seg_list)

				break
			end
		end
	end

	return 
end
NavFieldBuilder._remove_seg_from_seg_list = function (self, seg_list, seg, seg_dim)
	local new_seg_list = {}
	slot7 = seg_list

	for i_seg, test_seg in pairs(slot6) do
		local new_segment1, new_segment2 = nil

		if test_seg[2][seg_dim] <= seg[1][seg_dim] or seg[2][seg_dim] <= test_seg[1][seg_dim] then
			new_segment1 = test_seg
		elseif seg[1][seg_dim] <= test_seg[1][seg_dim] and test_seg[2][seg_dim] <= seg[2][seg_dim] then
		elseif test_seg[1][seg_dim] < seg[1][seg_dim] and seg[2][seg_dim] < test_seg[2][seg_dim] then
			new_segment1 = {
				test_seg[1],
				seg[1]
			}
			new_segment2 = {
				seg[2],
				test_seg[2]
			}
		elseif seg[1][seg_dim] <= test_seg[1][seg_dim] then
			new_segment1 = {
				seg[2],
				test_seg[2]
			}
		else
			new_segment1 = {
				test_seg[1],
				seg[1]
			}
		end

		if new_segment1 then
			slot15 = new_segment1

			table.insert(slot13, new_seg_list)
		end

		if new_segment2 then
			slot15 = new_segment2

			table.insert(slot13, new_seg_list)
		end
	end

	return new_seg_list
end
NavFieldBuilder._split_segment_list_at_position = function (self, seg_list, split_pos, seg_dim)
	local low_seg_list = {}
	local high_seg_list = {}
	local split_length = split_pos[seg_dim]
	slot9 = seg_list

	for i_seg, test_seg in pairs(slot8) do
		local test_min = test_seg[1][seg_dim]
		local test_max = test_seg[2][seg_dim]
		local new_segment1, new_segment2 = nil

		if split_length <= test_min then
			slot19 = test_seg

			table.insert(slot17, high_seg_list)
		elseif test_max <= split_length then
			slot19 = test_seg

			table.insert(slot17, low_seg_list)
		else
			slot18 = split_pos
			slot23 = (split_length - test_min) / (test_max - test_min)
			local mid_pos = split_pos.with_z(slot17, math.lerp(slot20, test_seg[1].z, test_seg[2].z))
			local new_segment1 = {
				test_seg[1],
				mid_pos
			}
			local new_segment2 = {
				mid_pos,
				test_seg[2]
			}
			slot22 = new_segment1

			table.insert(slot20, low_seg_list)

			slot22 = new_segment2

			table.insert(slot20, high_seg_list)
		end
	end

	return low_seg_list, high_seg_list
end
NavFieldBuilder._seg_to_seg_list_intersection_bool = function (self, seg_list, seg, seg_dim)
	local seg_min = seg[1][seg_dim]
	local seg_max = seg[2][seg_dim]
	slot8 = seg_list

	for i_seg, test_seg in pairs(slot7) do
		if seg_max > test_seg[1][seg_dim] and test_seg[2][seg_dim] > seg_min then
			return true
		end
	end

	return 
end
NavFieldBuilder._expansion_check_obstacles = function (self, dir_str, dir_vec, exp_space, inclination)
	local x_dir_str_map = self._x_dir_str_map
	local expand_dim = self._dim_str_map[dir_str]
	local along_dim = self._perp_dim_str_map[dir_str]
	local grid_size = self._grid_size
	local padding_gnd = self._ground_padding
	local padding_wall = self._wall_padding
	local air_ray_rad = self._air_ray_rad
	local gnd_ray_rad = self._gnd_ray_rad
	local along_vec = Vector3()
	slot17 = grid_size * 0.5

	mvector3["set_" .. along_dim]("set_" .. along_dim, along_vec)

	local along_vec_inclination = exp_space[2] - exp_space[1]
	slot17 = along_vec_inclination

	mvector3.normalize(along_vec)

	local inclination_init = inclination[expand_dim]

	if self._neg_dir_str_map[dir_str] then
		inclination_init = -inclination_init
	end

	local step_vec = 2 * along_vec
	local seg_size_grid = (exp_space[2][along_dim] - exp_space[1][along_dim]) / grid_size
	local travel_seg = {
		exp_space[1] + along_vec,
		exp_space[2] - along_vec
	}
	local measuring = {}
	local pos_along_border = travel_seg[1]
	local res_expansion = {
		walls = {},
		stairs = {},
		spaces = {},
		cliffs = {}
	}
	local prev_air_pos = nil
	local i_grid = 0

	repeat
		local obstacle_found = nil
		slot30 = gnd_ray_rad
		local back_ground_ray = self._sphere_ray(slot26, self, pos_along_border + self._up_vec, pos_along_border + self._down_vec)

		if not back_ground_ray then
			slot34 = 0

			Application.draw_cylinder(slot27, Application, pos_along_border + self._up_vec, pos_along_border + self._down_vec, gnd_ray_rad, 1, 0)

			return res_expansion
		end

		slot29 = back_ground_ray.position.z + padding_gnd + air_ray_rad
		local air_pos = pos_along_border.with_z(slot27, pos_along_border)
		local air_from_pos = air_pos - dir_vec * grid_size
		local air_to_pos = air_pos + dir_vec * (padding_wall + grid_size)
		slot34 = air_ray_rad
		local air_ray = self._bundle_ray(slot30, self, air_from_pos, air_to_pos)

		if not air_ray then
			local air_from_pos = air_to_pos - dir_vec * (gnd_ray_rad + 2)
			local air_to_pos = air_from_pos - along_vec_inclination.normalized(slot32) * ((padding_wall + grid_size * 0.5) - 1)
			slot37 = air_ray_rad * 0.8
			air_ray = self._bundle_ray(along_vec_inclination, self, air_from_pos, air_to_pos)
		end

		if not air_ray then
			local air_from_pos = air_to_pos - dir_vec * (gnd_ray_rad + 2)
			local air_to_pos = air_from_pos + along_vec_inclination.normalized(slot32) * ((padding_wall + grid_size * 0.5) - 1)
			slot37 = air_ray_rad * 0.8
			air_ray = self._bundle_ray(along_vec_inclination, self, air_from_pos, air_to_pos)
		end

		if air_ray then
			obstacle_found = "walls"
			slot33 = 15

			if air_ray.unit.in_slot(slot31, air_ray.unit) then
				slot33 = air_ray.unit

				self._on_helper_hit(slot31, self)
			end
		else
			local void_ray_rad = grid_size * 0.5
			local ray_rad_dif = gnd_ray_rad - void_ray_rad
			local front_air_pos = (air_pos + dir_vec * grid_size * 2) - step_vec * 1.5
			slot38 = air_ray_rad
			local front_ray = self._bundle_ray(slot34, self, air_pos, front_air_pos)
			slot38 = void_ray_rad + 1
			local front_gnd_pos = math.step(self, front_air_pos, air_pos)

			if not front_ray then
				slot40 = void_ray_rad
				slot35 = self._sphere_ray(slot36, self, front_gnd_pos + self._up_vec, front_gnd_pos + self._down_vec)
			else
				slot35 = false

				if false then
					local front_ground_ray = true
				end
			end

			if not front_ray and front_ground_ray then
				slot38 = (front_ground_ray.position.z + ray_rad_dif) - back_ground_ray.position.z
			else
				obstacle_found = "cliffs"
			end

			if not obstacle_found then
				local front_air_pos = air_pos + dir_vec * grid_size
				slot42 = gnd_ray_rad
				local front_ground_ray = self._sphere_ray(slot38, self, front_air_pos + self._up_vec, front_air_pos + self._down_vec)
				local climb_vec = front_ground_ray.position - back_ground_ray.position
				local inclination = climb_vec.z / self._grid_size
				slot42 = inclination_init - inclination
				local abs_inc_diff = math.abs(front_air_pos + self._down_vec)

				if 0.5 < abs_inc_diff then
					obstacle_found = "stairs"
				end
			end

			obstacle_found = obstacle_found or "spaces"
		end

		if measuring[obstacle_found] then
			if i_grid == seg_size_grid - 1 then
				slot32 = measuring
				local meas_obs_type = next(slot31)
				local measured_seg = measuring[meas_obs_type]
				measured_seg[2] = pos_along_border + along_vec
				slot37 = gnd_ray_rad
				local ground_ray = self._sphere_ray(slot33, self, pos_along_border + self._up_vec, pos_along_border + self._down_vec)
				slot36 = ground_ray.position.z

				mvector3.set_z(self, measured_seg[2])

				slot36 = measured_seg

				table.insert(self, res_expansion[obstacle_found])
			end
		else
			slot32 = measuring
			local meas_obs_type = next(slot31)

			if meas_obs_type then
				local measured_seg = measuring[meas_obs_type]
				measured_seg[2] = pos_along_border - along_vec
				slot37 = gnd_ray_rad
				local ground_ray = self._sphere_ray(slot33, self, pos_along_border + self._up_vec, pos_along_border + self._down_vec)
				slot36 = ground_ray.position.z

				mvector3.set_z(self, measured_seg[2])

				slot36 = measured_seg

				table.insert(self, res_expansion[meas_obs_type])

				measuring[meas_obs_type] = nil
			end

			if i_grid == seg_size_grid - 1 then
				local measured_seg = {
					pos_along_border - along_vec,
					pos_along_border + along_vec
				}
				slot37 = gnd_ray_rad
				local ground_ray = self._sphere_ray(slot33, self, pos_along_border + self._up_vec, pos_along_border + self._down_vec)
				slot36 = ground_ray.position.z

				mvector3.set_z(self, measured_seg[1])

				slot36 = ground_ray.position.z

				mvector3.set_z(self, measured_seg[2])

				slot36 = measured_seg

				table.insert(self, res_expansion[obstacle_found])
			else
				local new_seg = {
					pos_along_border - along_vec
				}
				slot37 = gnd_ray_rad
				local ground_ray = self._sphere_ray(slot33, self, pos_along_border + self._up_vec, pos_along_border + self._down_vec)
				slot36 = ground_ray.position.z

				mvector3.set_z(self, new_seg[1])

				measuring[obstacle_found] = new_seg
			end
		end

		pos_along_border = pos_along_border + step_vec
		i_grid = i_grid + 1
		slot32 = pos_along_border
		slot37 = i_grid / seg_size_grid

		mvector3.set_z(slot31, math.lerp(slot34, travel_seg[1].z, travel_seg[2].z))
	until seg_size_grid <= i_grid

	slot24 = res_expansion
	slot27 = res_expansion.walls

	if not next(slot26) then
		slot27 = res_expansion.stairs

		if not next(slot26) then
			slot27 = res_expansion.cliffs
			slot25 = next(slot26)
		end
	end

	return slot24, slot25
end
NavFieldBuilder._expansion_check_neighbours = function (self, dir_str, exp_space)
	local opp_dir_str_map = self._opposite_side_str
	local perp_pos_dir_str_map = self._perp_pos_dir_str_map
	local perp_neg_dir_str_map = self._perp_neg_dir_str_map
	local neg_dir_str_map = self._neg_dir_str_map
	local x_dir_str_map = self._x_dir_str_map
	local dir_vec_map = self._dir_str_to_vec
	local dim_str_map = self._dim_str_map
	local perp_dim_str_map = self._perp_dim_str_map
	local expand_dim = dim_str_map[dir_str]
	local along_dim = perp_dim_str_map[dir_str]
	local expand_border = exp_space[1][dim_str_map[dir_str]]
	local expand_seg = {
		exp_space[1][perp_dim_str_map[dir_str]],
		exp_space[2][perp_dim_str_map[dir_str]]
	}
	local neighbours = {}
	local opp_dir_str = opp_dir_str_map[dir_str]
	slot19 = self._rooms

	for i_room, test_room in ipairs(slot18) do
		local test_borders = test_room.borders
		local test_border = test_room.borders[opp_dir_str]

		if expand_border == test_border then
			local test_border_seg = {
				test_borders[perp_neg_dir_str_map[dir_str]],
				test_borders[perp_pos_dir_str_map[dir_str]]
			}
			slot29 = expand_seg
			local overlap_line = self._chk_line_overlap(slot26, self, test_border_seg)

			if overlap_line then
				local overlap_seg = {
					Vector3(),
					Vector3()
				}
				slot30 = expand_border

				mvector3["set_" .. dim_str_map[dir_str]]("set_" .. dim_str_map[dir_str], overlap_seg[1])

				slot30 = overlap_line[1]

				mvector3["set_" .. perp_dim_str_map[dir_str]]("set_" .. perp_dim_str_map[dir_str], overlap_seg[1])

				slot31 = overlap_seg[1]
				local z1_test_room = self._get_room_height_at_pos("set_" .. perp_dim_str_map[dir_str], test_room.height, test_room.borders)
				slot32 = (overlap_line[1] - exp_space[1][along_dim]) / (exp_space[2][along_dim] - exp_space[1][along_dim])
				local z1_exp_room = math.lerp(test_room.height, exp_space[1].z, exp_space[2].z)
				slot32 = expand_border

				mvector3["set_" .. dim_str_map[dir_str]]("set_" .. dim_str_map[dir_str], overlap_seg[2])

				slot32 = overlap_line[2]

				mvector3["set_" .. perp_dim_str_map[dir_str]]("set_" .. perp_dim_str_map[dir_str], overlap_seg[2])

				slot33 = overlap_seg[2]
				local z2_test_room = self._get_room_height_at_pos("set_" .. perp_dim_str_map[dir_str], test_room.height, test_room.borders)
				slot34 = (overlap_line[2] - exp_space[1][along_dim]) / (exp_space[2][along_dim] - exp_space[1][along_dim])
				local z2_exp_room = math.lerp(test_room.height, exp_space[1].z, exp_space[2].z)
				local min_h_diff = 150

				if min_h_diff >= z1_test_room - z1_exp_room or min_h_diff >= z2_test_room - z2_exp_room then
					if z1_test_room - z1_exp_room < -min_h_diff and z2_test_room - z2_exp_room < -min_h_diff then
					else
						slot35 = (z1_test_room + z1_exp_room) * 0.5

						mvector3.set_z(slot33, overlap_seg[1])

						slot35 = (z2_test_room + z2_exp_room) * 0.5

						mvector3.set_z(slot33, overlap_seg[2])

						slot35 = {
							room = i_room,
							overlap = overlap_seg
						}

						table.insert(slot33, neighbours)
					end
				end
			end
		end
	end

	slot19 = neighbours

	return next(slot18) and neighbours
end
NavFieldBuilder._on_helper_hit = function (self, unit)
	slot4 = unit
	local unit_id = unit.unit_data(slot3).unit_id
	self._new_blockers[unit_id] = unit

	return 
end
NavFieldBuilder._set_new_blockers_used = function (self)
	slot3 = self._new_blockers

	for unit_id, unit in pairs(slot2) do
		self._helper_blockers[unit_id] = self._building.id
	end

	self._new_blockers = nil

	return 
end
NavFieldBuilder._disable_blocker = function (self, unit)
	local u_id = unit.unit_data(slot3).unit_id
	self._disabled_blockers[u_id] = unit
	slot6 = false

	unit.set_enabled(unit, unit)

	return 
end
NavFieldBuilder._enable_blocker = function (self, unit)
	slot4 = unit
	local u_id = unit.unit_data(slot3).unit_id
	self._disabled_blockers[u_id] = nil
	slot6 = true

	unit.set_enabled(nil, unit)

	return 
end
NavFieldBuilder._reenable_all_blockers = function (self)
	if self._disabled_blockers then
		slot3 = self._disabled_blockers

		for _, blocker_unit in pairs(slot2) do
			slot8 = blocker_unit

			if alive(slot7) then
				slot9 = true

				blocker_unit.set_enabled(slot7, blocker_unit)
			end
		end
	end

	self._disabled_blockers = nil

	return 
end
NavFieldBuilder._disable_all_blockers = function (self)
	slot5 = 15
	local all_blockers = World.find_units_quick(slot2, World, "all")
	self._disabled_blockers = self._disabled_blockers or {}
	slot4 = all_blockers

	for _, unit in ipairs(slot3) do
		slot10 = unit

		self._disable_blocker(slot8, self)
	end

	return 
end
NavFieldBuilder._chk_line_overlap = function (self, line1, line2)
	slot6 = line2[2]
	local overlap_max = math.min(slot4, line1[2])
	slot7 = line2[1]
	local overlap_min = math.max(line1[2], line1[1])

	return overlap_min < overlap_max and {
		overlap_min,
		overlap_max
	}
end
NavFieldBuilder._measure_init_room_expansion = function (self, room, enter_pos)
	local perp_pos_dir_str_map = self._perp_pos_dir_str_map
	local perp_neg_dir_str_map = self._perp_neg_dir_str_map
	local dim_str_map = self._dim_str_map
	local perp_dim_str_map = self._perp_dim_str_map
	local borders = room.borders
	local expansion = room.expansion
	local height = room.height
	local inclination = room.inclination
	slot13 = perp_neg_dir_str_map

	for dir_str, perp_neg_dir_str in pairs(slot12) do
		local perp_pos_dir_str = perp_pos_dir_str_map[dir_str]
		local dim_str = dim_str_map[dir_str]
		local perp_dim_str = perp_dim_str_map[dir_str]
		local init_space = {
			Vector3(),
			Vector3()
		}
		slot23 = borders[dir_str]

		mvector3["set_" .. dim_str]("set_" .. dim_str, init_space[1])

		slot23 = borders[dir_str]

		mvector3["set_" .. dim_str]("set_" .. dim_str, init_space[2])

		slot23 = borders[perp_neg_dir_str]

		mvector3["set_" .. perp_dim_str]("set_" .. perp_dim_str, init_space[1])

		slot23 = borders[perp_pos_dir_str]

		mvector3["set_" .. perp_dim_str]("set_" .. perp_dim_str, init_space[2])

		slot23 = enter_pos.z

		mvector3.set_z("set_" .. perp_dim_str, init_space[1])

		slot23 = enter_pos.z

		mvector3.set_z("set_" .. perp_dim_str, init_space[2])

		slot23 = init_space

		table.insert("set_" .. perp_dim_str, expansion[dir_str].unsorted)
	end

	local ray_from_pos = expansion.x_pos.unsorted[1][2]
	slot17 = self._gnd_ray_rad
	local ground_ray = self._sphere_ray(slot13, self, ray_from_pos + self._up_vec, ray_from_pos + self._down_vec)
	height.xp_yp = (ground_ray and ground_ray.position.z) or enter_pos.z
	slot16 = height.xp_yp

	mvector3.set_z(slot14, expansion.x_pos.unsorted[1][2])
	mvector3.set_z(slot14, expansion.y_pos.unsorted[1][2])

	local ray_from_pos = expansion.x_pos.unsorted[1][1]
	slot19 = self._gnd_ray_rad
	ground_ray = self._sphere_ray(expansion.y_pos.unsorted[1][2], self, ray_from_pos + self._up_vec, ray_from_pos + self._down_vec)
	height.xp_yn = (ground_ray and ground_ray.position.z) or enter_pos.z
	slot17 = height.xp_yn

	mvector3.set_z(slot15, expansion.x_pos.unsorted[1][1])
	mvector3.set_z(slot15, expansion.y_neg.unsorted[1][2])

	local ray_from_pos = expansion.x_neg.unsorted[1][2]
	slot20 = self._gnd_ray_rad
	ground_ray = self._sphere_ray(expansion.y_neg.unsorted[1][2], self, ray_from_pos + self._up_vec, ray_from_pos + self._down_vec)
	height.xn_yp = (ground_ray and ground_ray.position.z) or enter_pos.z
	slot18 = height.xn_yp

	mvector3.set_z(height.xp_yp, expansion.x_neg.unsorted[1][2])

	slot18 = height.xn_yp

	mvector3.set_z(height.xp_yp, expansion.y_pos.unsorted[1][1])

	local ray_from_pos = expansion.x_neg.unsorted[1][1]
	slot21 = self._gnd_ray_rad
	ground_ray = self._sphere_ray(expansion.y_pos.unsorted[1][1], self, ray_from_pos + self._up_vec, ray_from_pos + self._down_vec)
	height.xn_yn = (ground_ray and ground_ray.position.z) or enter_pos.z
	slot19 = height.xn_yn

	mvector3.set_z(height.xp_yn, expansion.x_neg.unsorted[1][1])

	slot19 = height.xn_yn

	mvector3.set_z(height.xp_yn, expansion.y_neg.unsorted[1][1])

	local z_x_pos = (height.xp_yp + height.xp_yn) * 0.5
	local z_x_neg = (height.xn_yp + height.xn_yn) * 0.5
	local z_y_pos = (height.xp_yp + height.xn_yp) * 0.5
	local z_y_neg = (height.xp_yn + height.xn_yn) * 0.5
	inclination.x = (z_x_pos - z_x_neg) / self._grid_size
	inclination.y = (z_y_pos - z_y_neg) / self._grid_size

	return 
end
NavFieldBuilder._calculate_expanded_border = function (self, dir_str, border, grid_step)
	return (self._neg_dir_str_map[dir_str] and border - grid_step) or border + grid_step
end
NavFieldBuilder._find_room_height_from_expansion = function (self, expansion, height, side)
	local y_max, y_min = nil
	slot8 = expansion[side]

	for obs_type, obs_list in pairs(slot7) do
		slot13 = obs_list

		for i_obs, obs_seg in pairs(slot12) do
			if not y_min or obs_seg[1].y < y_min then
				height.xp_yn = obs_seg[1].z
				y_min = obs_seg[1].y
			end

			if not y_max or y_max < obs_seg[2].y then
				height.xp_yp = obs_seg[2].z
				y_max = obs_seg[2].y
			end
		end
	end

	y_max, y_min = nil
	slot8 = expansion[self._opposite_side_str[side]]

	for obs_type, obs_list in pairs(slot7) do
		slot13 = obs_list

		for i_obs, obs_seg in pairs(slot12) do
			if not y_min or obs_seg[1].y < y_min then
				height.xn_yn = obs_seg[1].z
				y_min = obs_seg[1].y
			end

			if not y_max or y_max < obs_seg[2].y then
				height.xn_yp = obs_seg[2].z
				y_max = obs_seg[2].y
			end
		end
	end

	return 
end
NavFieldBuilder._get_room_height_at_pos = function (height, borders, pos)
	local lerp_x = (pos.x - borders.x_neg) / (borders.x_pos - borders.x_neg)
	local lerp_y = (pos.y - borders.y_neg) / (borders.y_pos - borders.y_neg)
	slot9 = lerp_y
	local side_x_pos_z = math.lerp(borders.y_neg, height.xp_yn, height.xp_yp)
	slot10 = lerp_y
	local side_x_neg_z = math.lerp(height.xp_yn, height.xn_yn, height.xn_yp)
	slot11 = lerp_x
	local plane_z = math.lerp(height.xn_yn, side_x_neg_z, side_x_pos_z)

	return plane_z
end
NavFieldBuilder._ground_ray = function (self, air_pos)
	slot11 = "walk"

	return World.raycast(slot3, World, "ray", air_pos, air_pos + self._down_vec, "slot_mask", self._slotmask, "ray_type")
end
NavFieldBuilder._sphere_ray = function (self, from, to, raycast_radius)
	slot15 = "walk"

	return World.raycast(slot5, World, "ray", from, to, "slot_mask", self._slotmask, "sphere_cast_radius", raycast_radius, "ray_type")
end
NavFieldBuilder._bundle_ray = function (self, from, to, raycast_radius)
	slot17 = 3
	slot20 = raycast_radius
	slot17 = "walk"

	return World.raycast(slot5, World, "ray", from, to, "slot_mask", self._slotmask, "sphere_cast_radius", raycast_radius, "bundle", math.max(slot16, math.ceil(slot19)), "ray_type")
end
NavFieldBuilder._check_line_z_overlap_bool = function (self, overlap_room_borders, ext_room_borders, overlap_room_height, ext_room_height, dir_str, clamp_a, segment)
	local is_x = dir_str == "x_pos" or dir_str == "x_neg"
	local seg_pos_1, seg_pos_2 = nil

	if is_x then
		slot15 = 0
		seg_pos_1 = Vector3(slot12, clamp_a, segment[1])
		slot15 = 0
		seg_pos_2 = Vector3(slot12, clamp_a, segment[2])
	else
		slot15 = 0
		seg_pos_1 = Vector3(slot12, segment[1], clamp_a)
		slot15 = 0
		seg_pos_2 = Vector3(slot12, segment[2], clamp_a)
	end

	slot15 = seg_pos_1
	local exp_z_1 = self._get_room_height_at_pos(slot12, ext_room_height, ext_room_borders)
	slot16 = seg_pos_2
	local exp_z_2 = self._get_room_height_at_pos(ext_room_height, ext_room_height, ext_room_borders)
	slot16 = exp_z_1

	mvector3.set_z(ext_room_height, seg_pos_1)

	slot16 = exp_z_2

	mvector3.set_z(ext_room_height, seg_pos_2)

	slot17 = seg_pos_1
	local overlap_z_1 = self._get_room_height_at_pos(ext_room_height, overlap_room_height, overlap_room_borders)
	slot18 = seg_pos_2
	local overlap_z_2 = self._get_room_height_at_pos(overlap_room_height, overlap_room_height, overlap_room_borders)
	local min_h_diff = 150

	if (min_h_diff < overlap_z_1 - exp_z_1 and min_h_diff < overlap_z_2 - exp_z_2) or (overlap_z_1 - exp_z_1 < -min_h_diff and overlap_z_2 - exp_z_2 < -min_h_diff) then
		return false
	end

	return true
end
NavFieldBuilder._check_room_overlap_bool = function (rect_1, rect_2)
	return rect_2.y_pos >= rect_1.y_neg and rect_1.y_pos >= rect_2.y_neg and rect_1.x_pos >= rect_2.x_neg and rect_2.x_pos >= rect_1.x_neg
end
NavFieldBuilder._commence_vis_graph_build = function (self)
	if self._building.stage == 1 then
		local i_room_a = self._building.current_i_room_a
		local i_room_b = self._building.current_i_room_b
		slot6 = i_room_a
		slot8 = i_room_b
		slot10 = #self._rooms
		local text = "Checking visibility between " .. tostring(slot5) .. " and " .. tostring(slot7) .. " of " .. tostring(slot9)
		slot8 = text

		self._update_progress_bar(" and ", self, 1)

		slot7 = self._building
		local complete = self._create_room_to_room_visibility_data(" and ", self)

		if complete then
			self._building.stage = 2
			self._building.current_i_room_a = nil
			self._building.current_i_room_b = nil
			self._building.old_rays = nil
		end
	elseif self._building.stage == 2 then
		slot5 = "creating visibility groups"

		self._update_progress_bar(slot2, self, 2)

		slot3 = self

		self._create_visibility_groups(slot2)

		self._building.stage = 3
	elseif self._building.stage == 3 then
		slot5 = "linking visibility groups"

		self._update_progress_bar(slot2, self, 3)

		slot3 = self

		self._link_visibility_groups(slot2)

		self._room_visibility_data = nil
		self._building.stage = 4
	elseif self._building.stage == 4 then
		slot5 = "finalizing"

		self._update_progress_bar(slot2, self, 5)

		slot3 = self

		self._cleanup_room_data_1(slot2)

		slot3 = self

		self._reenable_all_blockers(slot2)

		self._building = false
		slot3 = self

		self._destroy_progress_bar(slot2)
		self._build_complete_clbk()
	end

	return 
end
NavFieldBuilder._create_room_to_room_visibility_data = function (self, build_data)
	local i_room_a = build_data.current_i_room_a
	local i_room_b = build_data.current_i_room_b
	local all_rooms = self._rooms
	local nr_rooms = #all_rooms
	local room_a = all_rooms[i_room_a]
	local room_b = all_rooms[i_room_b]
	local current_nr_raycasts = 0
	local max_nr_raycasts = 300
	local ray_dis = build_data.ray_dis

	repeat
		local filtered, visibility, nr_raycasts, rays_x_a, rays_y_a, rays_x_b, rays_y_b = nil

		if build_data.new_pair and (build_data.pos_vis_filter or build_data.neg_vis_filter) then
			slot24 = build_data.neg_vis_filter
			visibility = self._chk_room_vis_filter(slot19, self, room_a, room_b, build_data.pos_vis_filter)

			if visibility ~= nil then
				filtered = true
				nr_raycasts = 1
			end
		end

		local old_rays = build_data.old_rays or {}

		if not filtered then
			slot29 = ray_dis
			visibility, nr_raycasts, rays_x_a, rays_y_a, rays_x_b, rays_y_b = self._chk_room_to_room_visibility(slot20, self, room_a, room_b, old_rays.x_a or 1, old_rays.y_a or 1, old_rays.x_b or 1, old_rays.y_b or 1, max_nr_raycasts - current_nr_raycasts)
		end

		current_nr_raycasts = current_nr_raycasts + nr_raycasts
		local pair_completed = filtered or visibility or not rays_x_a

		if visibility then
			slot24 = i_room_b

			self._set_rooms_visible(slot21, self, i_room_a)
		end

		if pair_completed then
			build_data.old_rays = nil

			repeat
				if i_room_b == nr_rooms then
					if not self._room_visibility_data[i_room_a] then
						self._room_visibility_data[i_room_a] = {}
					end

					if i_room_a == #self._rooms - 1 then
						return true
					else
						i_room_a = i_room_a + 1
						i_room_b = i_room_a + 1
						room_a = all_rooms[i_room_a]
						room_b = all_rooms[i_room_b]
					end
				else
					i_room_b = i_room_b + 1
					room_b = all_rooms[i_room_b]
				end

				build_data.new_pair = true

				break
			until i_room_a == nr_rooms
		else
			old_rays.x_a = rays_x_a
			old_rays.y_a = rays_y_a
			old_rays.x_b = rays_x_b
			old_rays.y_b = rays_y_b
			build_data.old_rays = old_rays
			build_data.new_pair = nil
		end
	until current_nr_raycasts == max_nr_raycasts

	build_data.current_i_room_a = i_room_a
	build_data.current_i_room_b = i_room_b

	return 
end
NavFieldBuilder._chk_room_to_room_visibility = function (self, room_a, room_b, old_rays_x_a, old_rays_y_a, old_rays_x_b, old_rays_y_b, nr_raycasts_allowed, ray_dis)
	local borders_a = room_a.borders
	local borders_b = room_b.borders
	local min_ray_dis = ray_dis
	slot15 = 1 + math.floor(slot16)
	local nr_rays_x_a = math.max(slot13, 2)
	slot16 = 1 + math.floor((borders_a.x_pos - borders_a.x_neg) / min_ray_dis)
	local nr_rays_y_a = math.max(2, 2)
	slot17 = 1 + math.floor((borders_a.y_pos - borders_a.y_neg) / min_ray_dis)
	local nr_rays_x_b = math.max(2, 2)
	slot20 = (borders_b.y_pos - borders_b.y_neg) / min_ray_dis
	slot18 = 1 + math.floor((borders_b.x_pos - borders_b.x_neg) / min_ray_dis)
	local nr_rays_y_b = math.max(2, 2)
	local nr_rays = 0
	local i_ray_x_a = old_rays_x_a
	local i_ray_y_a = old_rays_y_a
	local i_ray_x_b = old_rays_x_b
	local i_ray_y_b = old_rays_y_b
	local pos_from = Vector3()
	local pos_to = Vector3()
	local mvec3_set_static = mvector3.set_static
	local mvec3_set_z = mvector3.set_z
	local m_lerp = math.lerp
	local x_a, x_b, y_a, y_b = nil

	while i_ray_x_a <= nr_rays_x_a do
		if (i_ray_x_a ~= 1 or not borders_a.x_neg) and (i_ray_x_a ~= nr_rays_x_a or not borders_a.x_pos) then
			slot34 = i_ray_x_a / nr_rays_x_a
			x_a = m_lerp(slot31, borders_a.x_neg, borders_a.x_pos)
		end

		while i_ray_y_a <= nr_rays_y_a do
			if (i_ray_y_a ~= 1 or not borders_a.y_neg) and (i_ray_y_a ~= nr_rays_y_a or not borders_a.y_pos) then
				slot34 = i_ray_y_a / nr_rays_y_a
				y_a = m_lerp(slot31, borders_a.y_neg, borders_a.y_pos)
			end

			slot34 = y_a

			mvec3_set_static(slot31, pos_from, x_a)

			slot34 = pos_from
			local room_a_z = self._get_room_height_at_pos(slot31, room_a.height, room_a.borders) + 120
			slot34 = room_a_z

			mvec3_set_z(room_a.height, pos_from)

			while i_ray_x_b <= nr_rays_x_b do
				if (i_ray_x_b ~= 1 or not borders_b.x_neg) and (i_ray_x_b ~= nr_rays_x_b or not borders_b.x_pos) then
					slot35 = i_ray_x_b / nr_rays_x_b
					x_b = m_lerp(slot32, borders_b.x_neg, borders_b.x_pos)
				end

				while i_ray_y_b <= nr_rays_y_b do
					nr_rays = nr_rays + 1

					if (i_ray_y_b ~= 1 or not borders_b.y_neg) and (i_ray_y_b ~= nr_rays_y_b or not borders_b.y_pos) then
						slot35 = i_ray_y_b / nr_rays_y_b
						y_b = m_lerp(slot32, borders_b.y_neg, borders_b.y_pos)
					end

					slot35 = y_b

					mvec3_set_static(slot32, pos_to, x_b)

					slot35 = pos_to
					local room_b_z = self._get_room_height_at_pos(slot32, room_b.height, room_b.borders) + 120
					slot35 = room_b_z

					mvec3_set_z(room_b.height, pos_to)

					slot41 = "vis_graph"
					local vis_ray = World.raycast(room_b.height, World, "ray", pos_from, pos_to, "slot_mask", self._slotmask, "ray_type")

					if not vis_ray then
						return true, nr_rays
					elseif nr_rays == nr_raycasts_allowed then
						return false, nr_rays, i_ray_x_a, i_ray_y_a, i_ray_x_b, i_ray_y_b + 1
					end

					i_ray_y_b = i_ray_y_b + 1
				end

				i_ray_y_b = 1
				i_ray_x_b = i_ray_x_b + 1
			end

			i_ray_x_b = 1
			i_ray_y_a = i_ray_y_a + 1
		end

		i_ray_y_a = 1
		i_ray_x_a = i_ray_x_a + 1
	end

	return false, nr_rays
end
NavFieldBuilder._set_rooms_visible = function (self, i_room_a, i_room_b)
	local room_a = self._rooms[i_room_a]
	local room_b = self._rooms[i_room_b]
	self._room_visibility_data[i_room_a] = self._room_visibility_data[i_room_a] or {}
	self._room_visibility_data[i_room_b] = self._room_visibility_data[i_room_b] or {}
	self._room_visibility_data[i_room_a][i_room_b] = true
	self._room_visibility_data[i_room_b][i_room_a] = true

	return 
end
NavFieldBuilder._create_visibility_groups = function (self, nav_seg_id)
	local all_rooms = self._rooms
	local nav_segments = self._nav_segments
	self._visibility_groups = {}
	local vis_groups = self._visibility_groups

	if nav_seg_id then
		nav_segments[nav_seg_id].vis_groups = {}
	else
		slot7 = nav_segments

		for nav_seg_id, nav_seg in pairs(slot6) do
			nav_seg.vis_groups = {}
		end
	end

	slot7 = self
	local sorted_vis_list = self._sort_rooms_according_to_visibility(slot6)
	local search_index = #sorted_vis_list

	while 0 < search_index do
		local search_i = sorted_vis_list[search_index].i_room

		if not self._rooms[search_i].vis_group then
			local search_stack = {
				search_i
			}
			local searched_rooms = {}
			local room = all_rooms[search_i]
			slot14 = room
			local pos = self._calculate_room_center(slot12, self)
			local segment = room.segment
			local my_vis_group = {
				rooms = {},
				pos = pos,
				vis_groups = {},
				seg = segment
			}
			slot17 = my_vis_group

			table.insert(slot15, vis_groups)

			local i_vis_group = #vis_groups
			slot18 = i_vis_group

			table.insert(vis_groups, nav_segments[segment].vis_groups)

			repeat
				local top_stack_room_i = search_stack[1]
				my_vis_group.rooms[top_stack_room_i] = true
				slot24 = my_vis_group.pos

				self._add_visible_neighbours_to_stack(true, self, top_stack_room_i, search_stack, searched_rooms, self._room_visibility_data[top_stack_room_i], my_vis_group.rooms)

				searched_rooms[top_stack_room_i] = true
				all_rooms[top_stack_room_i].vis_group = i_vis_group
				slot19 = 1

				table.remove(true, search_stack)

				slot18 = search_stack
			until not next(true)
		end

		search_index = search_index - 1
	end

	return 
end
NavFieldBuilder._add_visible_neighbours_to_stack = function (self, i_room, search_stack, searched_rooms, vip_list, rooms_in_group, node_pos)
	local rooms = self._rooms
	local room = rooms[i_room]
	local segment = room.segment
	slot12 = room.doors

	for side_str, door_list in pairs(slot11) do
		slot17 = door_list

		for i_door, door_id in pairs(slot16) do
			local door_data = self._room_doors[door_id]
			local i_neighbour_room = (door_data.rooms[1] == i_room and door_data.rooms[2]) or door_data.rooms[1]
			local neighbour_room = rooms[i_neighbour_room]

			if vip_list[i_neighbour_room] and not searched_rooms[i_neighbour_room] and not neighbour_room.vis_group and segment == neighbour_room.segment then
				local accepted = true
				slot26 = rooms_in_group

				for i_room, _ in pairs(slot25) do
					if not self._room_visibility_data[i_neighbour_room][i_room] then
						accepted = false

						break
					end
				end

				if accepted then
					slot27 = i_neighbour_room

					table.insert(slot25, search_stack)
				end
			end
		end
	end

	return 
end
NavFieldBuilder._sort_rooms_according_to_visibility = function (self)
	local sorted_vis_list = {}
	slot4 = self._room_visibility_data

	for i_room, vis_room_list in ipairs(slot3) do
		local my_borders = self._rooms[i_room].borders
		slot11 = my_borders
		local my_total_area = self._calc_room_area(slot9, self)
		local my_data = {
			i_room = i_room,
			area = my_total_area
		}
		local search_index = #sorted_vis_list

		while 0 < search_index and my_total_area < sorted_vis_list[search_index].area do
			search_index = search_index - 1
		end

		slot15 = my_data

		table.insert(slot12, sorted_vis_list, search_index + 1)
	end

	return sorted_vis_list
end
NavFieldBuilder._calc_room_area = function (self, borders)
	return (borders.x_pos - borders.x_neg) * (borders.y_pos - borders.y_neg)
end
NavFieldBuilder._calculate_room_center = function (self, room)
	local borders = room.borders
	slot7 = 0
	local pos = Vector3(slot4, (borders.x_pos + borders.x_neg) * 0.5, (borders.y_pos + borders.y_neg) * 0.5)
	slot8 = pos
	local pos_z = self._get_room_height_at_pos((borders.x_pos + borders.x_neg) * 0.5, room.height, borders)
	slot8 = pos_z

	mvector3.set_z(room.height, pos)

	return pos
end
NavFieldBuilder._link_visibility_groups = function (self)
	slot3 = self._visibility_groups

	for i_group, group in ipairs(slot2) do
		slot8 = group.rooms

		for i_room, _ in pairs(slot7) do
			local visible_rooms = self._room_visibility_data[i_room]
			slot14 = visible_rooms

			for i_vis_room, _ in pairs(slot13) do
				local test_vis_group = self._rooms[i_vis_room].vis_group

				if not group.vis_groups[test_vis_group] and test_vis_group ~= i_group then
					group.vis_groups[test_vis_group] = true
				end
			end
		end
	end

	return 
end
NavFieldBuilder.set_nav_seg_metadata = function (self, nav_seg_id, param_name, param_value)
	if not self._nav_segments then
		return 
	end

	local nav_seg = self._nav_segments[nav_seg_id]

	if not nav_seg then
		return 
	end

	slot8 = "[NavFieldBuilder:_set_nav_seg_metadata]   hoooraaaaaaay"

	Application.trace(slot6, Application)

	nav_seg[param_name] = param_value

	return 
end

return 
