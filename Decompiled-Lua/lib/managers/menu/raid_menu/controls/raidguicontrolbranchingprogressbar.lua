-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlBranchingProgressBar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlBranchingProgressBar = slot0
function RaidGUIControlBranchingProgressBar:init(parent, params)
	slot7 = params

	RaidGUIControlBranchingProgressBar.super.init(slot4, self, parent)

	self._levels = {}
	slot6 = {
		name = "wrap_panel",
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h
	}
	self._object = self._panel.panel(slot4, self._panel)
	slot6 = {
		name = "scrollable_panel",
		y = 0,
		x = 0,
		w = params.w,
		h = params.h
	}
	self._scrollable_panel = self._object.panel(slot4, self._object)
	slot5 = self._scrollable_panel
	slot3 = self._scrollable_panel.panel
	slot6 = {
		name = "scrollable_panel",
		x = params.elements_panel_x or 0,
		y = params.elements_panel_y or 0
	}

	if not params.elements_panel_w then
		slot9 = self._scrollable_panel
		slot7 = self._scrollable_panel.w(slot8)
	end

	slot6.w = slot7

	if not params.elements_panel_h then
		slot9 = self._scrollable_panel
		slot7 = self._scrollable_panel.h(slot8)
	end

	slot6.h = slot7
	self._elements_panel = slot3(slot4, slot5)
	self._data_source_callback = params.data_source_callback

	if not self._data_source_callback then
		slot6 = "[RaidGUIControlBranchingProgressBar] No data source callback given!"

		Application.error(slot4, Application)

		return 
	end

	self._draggable = false
	slot6 = params

	self._create_elements(slot4, self)

	self._current_points = params.starting_points or 0
	slot5 = self
	self._current_level = self._get_current_level(slot4)
	self._path_animation_duration = params.path_animation_duration or 0.25
	self._activate_automatically = params.automatic or false
	self._on_mouse_enter_callback = params.on_mouse_enter_callback
	self._on_mouse_exit_callback = params.on_mouse_exit_callback
	self._on_click_callback = params.on_click_callback
	self._mouse_travel = 0
	self._panel_acceleration = 0
	slot6 = self._current_points

	self._set_initial_state(slot4, self)

	slot6 = self._object

	if self._object.w(self._scrollable_panel) < self._scrollable_panel.w(slot4) then
		self._draggable = true
		slot6 = "branching_progress_bar"
		slot11 = "update"

		managers.hud.add_updator(slot4, managers.hud, callback(slot8, self, self))
	end

	if params.horizontal == "center" then
		slot6 = self._object

		if self._scrollable_panel.w(slot4) < self._object.w(self._scrollable_panel) then
			slot9 = self._scrollable_panel
			slot6 = self._object.w(slot7) / 2 - self._scrollable_panel.w(self._object) / 2

			self._scrollable_panel.set_x(slot4, self._scrollable_panel)
		end
	end

	return 
end
function RaidGUIControlBranchingProgressBar:close()
	RaidGUIControlScrollbar.super.close()

	slot4 = "branching_progress_bar"

	managers.hud.remove_updator(slot2, managers.hud)

	self._dragging = false
	self._draggable = false

	return 
end
function RaidGUIControlBranchingProgressBar:_create_elements(params)
	local node_tree = self._data_source_callback()
	local panel_padding = params.padding or 0
	local x_step = params.x_step or 200
	local y_step = params.y_step or 20
	local leading_path_length = nil

	if node_tree[1].points_needed and 0 < node_tree[1].points_needed then
		leading_path_length = params.leading_path_length or x_step / 2
	else
		leading_path_length = 0
	end

	local x = panel_padding + leading_path_length
	local active_level = 1
	slot11 = node_tree

	for level_index, level_data in pairs(slot10) do
		local nodes = {}
		local paths = {}
		slot18 = level_data.nodes

		for node_index, node_data in ipairs(slot17) do
			local node_state = RaidGUIControlBranchingBarNode.STATE_INACTIVE

			if node_data.state and node_data.state == "active" then
				node_state = RaidGUIControlBranchingBarNode.STATE_ACTIVE
				active_level = level_index
			end

			local node_value_data = node_data.value or {}
			node_value_data.level = level_index
			node_value_data.index = node_index
			local node_params = {}
			slot27 = level_index
			slot25 = tostring(slot26)
			slot29 = node_index
			node_params.name = "node_" .. slot25 .. "_" .. tostring(slot28)
			node_params.x = x
			node_params.value = node_data.value
			slot28 = "_node_click_callback"
			node_params.on_click_callback = callback(slot25, self, self)
			slot28 = "_node_enter_callback"
			node_params.on_mouse_enter_callback = callback(slot25, self, self)
			slot28 = "_node_exit_callback"
			node_params.on_mouse_exit_callback = callback(slot25, self, self)
			slot28 = "on_mouse_released"
			node_params.on_node_mouse_released_callback = callback(slot25, self, self)
			slot28 = "on_mouse_pressed"
			node_params.on_node_mouse_pressed_callback = callback(slot25, self, self)
			slot28 = "on_mouse_moved"
			node_params.on_node_mouse_moved_callback = callback(slot25, self, self)
			slot26 = self._elements_panel
			node_params.layer = self._elements_panel.layer(slot25) + 3
			node_params.parents = node_data.parents
			node_params.level = level_index
			node_params.state = node_state
			local node_class = params.node_class or RaidGUIControlBranchingBarSkilltreeNode
			local node = self._elements_panel.create_custom_control(slot26, self._elements_panel, node_class)
			slot28 = self._elements_panel
			slot30 = node
			local y_padding = (self._elements_panel.h(self._elements_panel) - #level_data.nodes * node.h(node_params) - (#level_data.nodes - 1) * y_step) / 2
			slot33 = node
			slot30 = y_padding + (node_index - 1) * (node.h(slot32) + y_step)

			node.set_y(node.h(node_params), node)

			if not self._node_width then
				slot31 = node
				self._node_width = math.ceil(node.w(slot30))
			end

			slot33 = node
			slot30 = x + (self._node_width - node.w(slot32)) / 2

			node.set_x(slot28, node)

			slot30 = node

			table.insert(slot28, nodes)

			local path_class = params.path_class or RaidGUIControlBranchingBarSkilltreePath

			if node_data.parents and #node_data.parents ~= 0 then
				slot30 = node_data.parents

				for _, parent_index in pairs(slot29) do
					local previous_node = self._levels[level_index - 1].nodes[parent_index]
					local path_vector = {}
					slot38 = node
					slot39 = previous_node
					path_vector.x = (node.x(slot36) + node.w(node) / 2) - (previous_node.x(node) + previous_node.w(previous_node) / 2)
					slot38 = node
					slot39 = previous_node
					path_vector.y = (node.y(previous_node.x(node) + previous_node.w(previous_node) / 2) + node.h(node) / 2) - (previous_node.y(node) + previous_node.h(previous_node) / 2)
					local identity_vector = {
						x = 3,
						y = 0
					}
					slot39 = path_vector.x
					slot40 = identity_vector.x
					local angle = math.atan2(previous_node.h(previous_node) / 2, path_vector.y) - math.atan2(path_vector.y, identity_vector.y)
					slot40 = angle
					local dx = (node.w(path_vector.y) / 2 - 2) * math.cos(node)
					local dy = (node.w(node) / 2 - 2) * math.sin(node)
					local points = {}
					slot45 = previous_node
					slot46 = previous_node
					local starting_point = Vector3(angle, previous_node.x(slot43) + previous_node.w(previous_node) / 2 + dx, previous_node.y(previous_node) + previous_node.h(previous_node) / 2 + dy)
					slot46 = node
					slot47 = node
					slot45 = 0
					local ending_point = Vector3(previous_node.x(slot43) + previous_node.w(previous_node) / 2 + dx, (node.x(0) + node.w(node) / 2) - dx, (node.y(node) + node.h(node) / 2) - dy)
					local path_params = {
						starting_point = starting_point,
						starting_point_index = parent_index,
						ending_point = ending_point,
						ending_point_index = node_index
					}
					slot45 = self._elements_panel
					path_params.layer = self._elements_panel.layer((node.y(node) + node.h(node) / 2) - dy) + 1
					path_params.line_width = params.path_width or 3
					slot47 = path_params
					local path = self._elements_panel.create_custom_control(slot44, self._elements_panel, path_class)
					slot47 = path

					table.insert(self._elements_panel, paths)
				end
			elseif level_index == 1 and level_data.points_needed and 0 < level_data.points_needed then
				slot34 = node
				local starting_point = Vector3(slot29, node.x(slot31) - leading_path_length, node.y(node) + node.h(node) / 2)
				slot35 = node
				slot33 = 0
				local ending_point = Vector3(node.x(slot31) - leading_path_length, node.x(0) + 2, node.y(node) + node.h(node) / 2)
				local path_params = {
					starting_point_index = 0,
					starting_point = starting_point,
					ending_point = ending_point,
					ending_point_index = node_index
				}
				slot33 = self._elements_panel
				path_params.layer = self._elements_panel.layer(node.y(node) + node.h(node) / 2) + 1
				path_params.line_width = params.path_width or 3
				slot35 = path_params
				local path = self._elements_panel.create_custom_control(slot32, self._elements_panel, path_class)
				slot35 = path

				table.insert(self._elements_panel, paths)
			end
		end

		local level = {
			nodes = nodes,
			paths = paths,
			points_needed = level_data.points_needed
		}
		slot20 = level

		table.insert(slot18, self._levels)

		x = x + self._node_width + x_step
	end

	slot12 = #node_tree * self._node_width + (#node_tree - 1) * params.x_step + panel_padding * 2 + leading_path_length

	self._elements_panel.set_w(slot10, self._elements_panel)

	slot11 = self._scrollable_panel
	slot14 = self._elements_panel

	self._scrollable_panel.set_w(slot10, self._elements_panel.w(panel_padding * 2))

	local active_level_position_x = panel_padding + self._node_width / 2 + (active_level - 1) * (params.x_step + self._node_width)
	slot13 = self._object
	local panel_position_x = -active_level_position_x + self._object.w(self._node_width) / 2

	if 0 < panel_position_x then
		panel_position_x = 0
	else
		slot14 = self._object

		if panel_position_x < -(self._elements_panel.w(slot12) - self._object.w(self._elements_panel)) then
			slot14 = self._object
			panel_position_x = -(self._elements_panel.w(slot12) - self._object.w(self._elements_panel))
		end
	end

	slot14 = panel_position_x

	self._scrollable_panel.set_x(slot12, self._scrollable_panel)

	return 
end
function RaidGUIControlBranchingProgressBar:_check_if_node_reachable(node)
	slot4 = node

	if node.level(slot3) == 1 then
		return true
	end

	slot6 = node

	for _, parent_index in pairs(node.parents(slot5)) do
		slot10 = node
		local previous_node = self._levels[node.level(slot9) - 1].nodes[parent_index]
		slot10 = previous_node

		if previous_node.state(slot9) ~= RaidGUIControlBranchingBarNode.STATE_DISABLED then
			return true
		end
	end

	return false
end
function RaidGUIControlBranchingProgressBar:_check_if_node_blocked(node)
	slot4 = node

	if node.level(slot3) == 1 then
		return false
	end

	slot6 = node

	for _, parent_index in pairs(node.parents(slot5)) do

		-- Decompilation error in this vicinity:
		slot10 = node
		local previous_node = self._levels[node.level(slot9) - 1].nodes[parent_index]
		slot10 = previous_node
	end

	return false
end
function RaidGUIControlBranchingProgressBar:_set_initial_state(initial_points)
	self._current_points = initial_points
	slot5 = true

	self._refresh_tree(slot3, self)

	return 
end
function RaidGUIControlBranchingProgressBar:_node_click_callback(node, node_data)
	if not self._on_click_callback then
		return 
	end

	local node = self._levels[node_data.level].nodes[node_data.index]
	slot6 = node

	if node.state(slot5) == RaidGUIControlBranchingBarNode.STATE_PENDING then
		slot6 = node

		node.set_active(slot5)

		slot6 = self

		self._refresh_tree(slot5)

		slot6 = node_data

		self._on_click_callback(slot5)
	end

	return 
end
function RaidGUIControlBranchingProgressBar:_node_enter_callback(node, node_data)
	if self._on_mouse_enter_callback then
		slot5 = node_data

		self._on_mouse_enter_callback(slot4)
	end

	return 
end
function RaidGUIControlBranchingProgressBar:_node_exit_callback(node, node_data)
	if self._on_mouse_exit_callback then
		slot5 = node_data

		self._on_mouse_exit_callback(slot4)
	end

	return 
end
function RaidGUIControlBranchingProgressBar:_get_level_progress(level)
	if self._levels[level].points_needed == 0 then
		return 1
	end

	local level_progress = nil

	if level == 1 then
		if self._levels[level].points_needed and 0 < self._levels[level].points_needed then
			level_progress = self._current_points / self._levels[level].points_needed
		else
			level_progress = 1
		end
	else
		local previous_level_points_needed = nil

		if self._levels[level - 1].points_needed then
			previous_level_points_needed = self._levels[level - 1].points_needed
		else
			previous_level_points_needed = 0
		end

		level_progress = (self._current_points - previous_level_points_needed) / (self._levels[level].points_needed - previous_level_points_needed)
	end

	if level_progress < 0 then
		return 0
	elseif 1 < level_progress then
		return 1
	end

	return level_progress
end
function RaidGUIControlBranchingProgressBar:_get_current_level()
	local current_level = 1

	for i = 1, #self._levels, 1 do
		if self._levels[i].points_needed and self._levels[i].points_needed <= self._current_points then
			current_level = i
		else
			break
		end
	end

	return current_level
end
function RaidGUIControlBranchingProgressBar:_get_level_by_points(points)
	local current_level = 0

	for i = 1, #self._levels, 1 do
		if self._levels[i].points_needed <= points then
			current_level = i
		else
			break
		end
	end

	return current_level
end
function RaidGUIControlBranchingProgressBar:_refresh_tree(full_refresh)
	local current_level_index = 1
	local need_to_check_further = true
	local level_progress = nil

	while (need_to_check_further or full_refresh) and current_level_index <= #self._levels do
		local current_level = self._levels[current_level_index]
		need_to_check_further = false
		slot9 = current_level_index
		level_progress = self._get_level_progress(slot7, self)

		for j = 1, #current_level.nodes, 1 do
			slot13 = current_level.nodes[j]
			local is_reachable = self._check_if_node_reachable(slot11, self)
			slot14 = current_level.nodes[j]
			local is_blocked = self._check_if_node_blocked(self, self)
			slot14 = current_level.nodes[j]
			local node_state = current_level.nodes[j].state(self)

			if level_progress == 1 and node_state == RaidGUIControlBranchingBarNode.STATE_INACTIVE and is_reachable then
				if self._activate_automatically then
					slot15 = current_level.nodes[j]

					current_level.nodes[j].set_active(slot14)
				else
					if not self._first_available_level then
						self._first_available_level = current_level_index
					end

					slot15 = current_level.nodes[j]

					current_level.nodes[j].set_pending(slot14)
				end

				need_to_check_further = true
			elseif node_state == RaidGUIControlBranchingBarNode.STATE_PENDING_BLOCKED and is_reachable and not is_blocked then
				slot15 = current_level.nodes[j]

				current_level.nodes[j].set_pending(slot14)
			elseif node_state == RaidGUIControlBranchingBarNode.STATE_ACTIVE then
				for k = 1, #current_level.nodes, 1 do
					if k ~= j then
						slot19 = current_level.nodes[k]

						current_level.nodes[k].set_disabled(slot18)
					end
				end

				need_to_check_further = true
				current_level.active = true
				current_level.active_node_index = j
			elseif not is_reachable then
				slot15 = current_level.nodes[j]

				current_level.nodes[j].set_disabled(slot14)

				need_to_check_further = true
			end

			if level_progress == 1 then
				need_to_check_further = true
			end
		end

		slot9 = current_level_index

		self._refresh_level_paths(slot7, self)

		current_level_index = current_level_index + 1
	end

	return 
end
function RaidGUIControlBranchingProgressBar:_refresh_level_paths(level_index)
	if level_index < 1 or #self._levels < level_index then
		return 
	end

	local level = self._levels[level_index]
	slot6 = level_index
	local level_progress = self._get_level_progress(slot4, self)

	for j = 1, #level.paths, 1 do
		local path = level.paths[j]
		slot11 = path
		local endpoints = path.endpoints(slot10)
		slot12 = level.nodes[endpoints[2]]
		local node_state = level.nodes[endpoints[2]].state(endpoints[2])
		local previous_node_state = nil

		if level_index == 1 then
			previous_node_state = RaidGUIControlBranchingBarNode.STATE_ACTIVE
		else
			slot14 = self._levels[level_index - 1].nodes[endpoints[1]]
			previous_node_state = self._levels[level_index - 1].nodes[endpoints[1]].state(endpoints[1])
		end

		if node_state == RaidGUIControlBranchingBarNode.STATE_DISABLED or previous_node_state == RaidGUIControlBranchingBarNode.STATE_DISABLED then
			slot14 = path

			path.set_disabled(slot13)
		else
			if node_state == RaidGUIControlBranchingBarNode.STATE_ACTIVE and previous_node_state == RaidGUIControlBranchingBarNode.STATE_ACTIVE then
				level_progress = 1
				slot14 = path

				path.set_locked(slot13)
			elseif 1 <= level_progress then
				level_progress = 1
				slot14 = path

				path.set_full(slot13)
			elseif level_progress < 0 then
				level_progress = 0
			else
				slot14 = path

				path.set_active(slot13)
			end

			slot15 = level_progress

			path.set_progress(slot13, path)
		end
	end

	return 
end
function RaidGUIControlBranchingProgressBar:set_points(points)
	local old_points = self._current_points
	self._current_points = points
	slot6 = self._current_points
	local new_level = self._get_level_by_points(slot4, self)
	slot7 = old_points

	if new_level ~= self._get_level_by_points(self, self) or #self._levels < new_level then
		slot6 = self

		self._refresh_tree(slot5)
	else
		slot7 = new_level + 1

		self._refresh_level_paths(slot5, self)
	end

	return 
end
function RaidGUIControlBranchingProgressBar:get_points()
	return self._current_points
end
function RaidGUIControlBranchingProgressBar:give_points(points, animate)
	if animate == true then
		slot5 = self._scrollable_panel
		slot10 = "_animate_giving_points"
		slot8 = self._path_animation_duration

		self._scrollable_panel.get_engine_panel(slot4).animate(slot4, self._scrollable_panel.get_engine_panel(slot4), callback(slot7, self, self), points)
	else
		slot6 = self._current_points + points

		self.set_points(slot4, self)
	end

	return 
end
function RaidGUIControlBranchingProgressBar:reset_points()
	self._current_points = 0
	slot4 = 0

	self.give_points(slot2, self)

	return 
end
function RaidGUIControlBranchingProgressBar:_animate_giving_points(panel, new_points, duration)
	local t = 0
	local starting_points = self._current_points

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local current_points = self._ease_in_out_quint(slot8, self, t, starting_points, new_points)
		slot11 = current_points

		self.set_points(self, self)
	end

	slot9 = starting_points + new_points

	self.set_points(slot7, self)

	return 
end
function RaidGUIControlBranchingProgressBar:on_mouse_moved(o, x, y)
	if not self._draggable then
		return 
	end

	slot9 = y

	RaidGUIControlBranchingProgressBar.super.on_mouse_moved(slot5, self, o, x)

	if not self._dragging then
		return 
	end

	if not self._mouse_start_x then
		self._mouse_start_x = x
		self._mouse_last_x = x
	end

	slot6 = self._scrollable_panel

	if 35 < self._scrollable_panel.x(slot5) then
		slot8 = self._scrollable_panel
		slot6 = self._scrollable_panel.x(slot7) - 35
		self._move_damping = 1 - math.abs(slot5) / 100
	else
		slot8 = self._object

		if self._scrollable_panel.x(slot5) < -(self._scrollable_panel.w(self._scrollable_panel) - self._object.w(self._scrollable_panel) + 35) then
			slot10 = self._object
			slot6 = self._scrollable_panel.x(slot7) + self._scrollable_panel.w(self._scrollable_panel) - self._object.w(self._scrollable_panel) + 35
			self._move_damping = 1 - math.abs(slot5) / 100
		else
			self._move_damping = 1
		end
	end

	if self._move_damping < 0 then
		self._move_damping = 0
	end

	self._mouse_travel = (x - self._mouse_last_x) * self._move_damping
	slot6 = self._scrollable_panel
	local scrollable_panel_new_x = self._scrollable_panel.x(self._move_damping) + (x - self._mouse_last_x) * self._move_damping
	slot7 = scrollable_panel_new_x
	scrollable_panel_new_x = math.round(self._move_damping)
	slot8 = scrollable_panel_new_x

	self._scrollable_panel.set_x(self._move_damping, self._scrollable_panel)

	self._mouse_last_x = x

	return true, "grab"
end
function RaidGUIControlBranchingProgressBar:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlBranchingProgressBar.super.on_mouse_over(slot4, self, x)

	return 
end
function RaidGUIControlBranchingProgressBar:on_mouse_out(x, y)
	if not self._draggable then
		return 
	end

	slot7 = y

	RaidGUIControlBranchingProgressBar.super.on_mouse_out(slot4, self, x)

	slot5 = self

	self.on_mouse_released(slot4)

	self._dragging = false

	return 
end
function RaidGUIControlBranchingProgressBar:on_mouse_pressed()
	if not self._draggable then
		return 
	end

	slot4 = self

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._pointer_type = "grab"
	self._dragging = true
	self._mouse_start_x = nil
	slot3 = self._scrollable_panel
	self._panel_start_x = self._scrollable_panel.x(slot2)
	self._panel_velocity = nil
	self._panel_acceleration = nil
	self._controller_enabled = false

	return 
end
function RaidGUIControlBranchingProgressBar:on_mouse_released()
	if not self._draggable then
		return 
	end

	self._pointer_type = "hand"
	self._dragging = false
	self._mouse_start_x = nil
	self._panel_start_x = nil
	self._panel_acceleration = 0

	if self._on_value_change_callback then
		self._on_value_change_callback()
	end

	return 
end
function RaidGUIControlBranchingProgressBar:show()
	slot3 = self._object

	self._object.show(slot2)

	slot3 = self._bar

	self._bar.show(slot2)

	return 
end
function RaidGUIControlBranchingProgressBar:hide()
	slot3 = self._object

	self._object.hide(slot2)

	slot3 = self._bar

	self._bar.hide(slot2)

	return 
end
function RaidGUIControlBranchingProgressBar:_ease_in_out_quint(t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t * t * t + starting_value
	end

	t = t - 2

	return change / 2 * (t * t * t * t * t + 2) + starting_value
end
function RaidGUIControlBranchingProgressBar:update(t, dt)

	-- Decompilation error in this vicinity:
	if not self._panel_velocity then
		self._panel_velocity = self._mouse_travel / dt
		slot5 = self._scrollable_panel
		self._scrollable_panel_x = self._scrollable_panel.x(slot4)
	end

	slot5 = self._scrollable_panel

	if 0.01 < self._scrollable_panel_x then
		self._spring = true
		self._panel_acceleration = -25 * self._scrollable_panel_x - 10 * self._panel_velocity
	else
		slot7 = self._object

		if self._scrollable_panel_x < -(self._scrollable_panel.w(slot5) - self._object.w(self._scrollable_panel)) then
			self._spring = true
			slot6 = self._object
			self._panel_acceleration = 25 * (-(self._scrollable_panel.w(slot4) - self._object.w(self._scrollable_panel)) - self._scrollable_panel_x) - 10 * self._panel_velocity
		elseif self._scrollable_panel_x <= 0.01 then
			slot7 = self._object

			if -(self._scrollable_panel.w(slot5) - self._object.w(self._scrollable_panel)) <= self._scrollable_panel_x and self._spring then
				self._spring = false
				self._panel_acceleration = 0
			end
		end
	end

	self._panel_velocity = self._panel_velocity * 0.9
	self._panel_velocity = self._panel_velocity + self._panel_acceleration * dt
	slot5 = self._scrollable_panel
	local previous_x = self._scrollable_panel.x(self._panel_acceleration * dt)
	self._scrollable_panel_x = self._scrollable_panel_x + self._panel_velocity * dt
	slot6 = self._scrollable_panel
	slot9 = self._scrollable_panel_x

	self._scrollable_panel.set_x(self._panel_velocity * dt, math.floor(slot8))

	return 
end
function RaidGUIControlBranchingProgressBar:clear_selection()
	self._selected_nodes = {}
	self._first_available_level = 2
	local current_level_index = 2
	local need_to_check_further = true

	while need_to_check_further and current_level_index <= #self._levels do
		local current_level = self._levels[current_level_index]

		for j = 1, #current_level.nodes, 1 do
			local node = current_level.nodes[j]
			slot11 = node

			if node.state(slot10) == RaidGUIControlBranchingBarNode.STATE_INACTIVE then
				need_to_check_further = false
			else
				slot11 = node

				if node.state(slot10) == RaidGUIControlBranchingBarNode.STATE_SELECTED then
					slot11 = node

					node.set_pending(slot10)
				else
					slot11 = node

					if node.state(slot10) == RaidGUIControlBranchingBarNode.STATE_ACTIVE then
						self._first_available_level = current_level_index + 1
					end
				end
			end
		end

		current_level_index = current_level_index + 1
	end

	slot6 = true

	self._refresh_tree(slot4, self)

	slot6 = self._levels[1].nodes[1]

	self._set_scrollable_panel_x(slot4, self)

	return 
end

return 
