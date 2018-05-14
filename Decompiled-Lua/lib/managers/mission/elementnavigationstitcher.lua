slot3 = "CoreShapeManager"

core.import(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementNavigationStitcher then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementNavigationStitcher = slot0
function ElementNavigationStitcher:init(...)
	slot3 = self

	ElementNavigationStitcher.super.init(slot2, ...)

	slot6 = self._sync_id
	local unit = managers.worldcollection.get_unit_with_id(slot2, managers.worldcollection, self._id, nil)

	return 
end
function ElementNavigationStitcher:on_script_activated()
	self._on_script_activated_done = true
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementNavigationStitcher:set_enabled(enabled)
	slot5 = enabled

	ElementNavigationStitcher.super.set_enabled(slot3, self)

	return 
end
function ElementNavigationStitcher:on_executed(instigator, ...)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementNavigationStitcher.super.on_executed(slot3, self, ...)

	return 
end
function ElementNavigationStitcher:pre_destroy()
	slot3 = self

	self.tear(slot2)

	return 
end
function ElementNavigationStitcher:debug_draw()
	if not self._debug_shape then
		slot4 = {
			position = self._values.position,
			rotation = self._values.rotation,
			width = self._values.width,
			depth = self._values.depth,
			height = self._values.height
		}
		self._debug_shape = CoreShapeManager.ShapeBoxMiddle.new(slot2, CoreShapeManager.ShapeBoxMiddle)
	end

	slot9 = 0.3

	self._debug_shape.draw(slot2, self._debug_shape, 0, 0, 0.2, 0.2, 0.8)

	return 
end
function ElementNavigationStitcher:_snap_to_grid(coord)
	coord = coord + self._grid_size / 2

	return coord - coord % self._grid_size
end
function ElementNavigationStitcher:_snap_pos_to_grid(pos)
	slot4 = pos
	slot8 = pos.x

	mvector3.set_x(slot3, self._snap_to_grid(slot6, self))

	slot4 = pos
	slot8 = pos.y

	mvector3.set_y(slot3, self._snap_to_grid(slot6, self))

	return 
end
function ElementNavigationStitcher:_calculate_extents()
	local x_half_extent = self._values.width / 2 * self._values.rotation.x(slot3)
	slot5 = self._values.rotation
	local y_half_extent = self._values.depth / 2 * self._values.rotation.y(self._values.rotation)
	local pos = self._values.position
	self._extents = {
		top_left = pos - x_half_extent + y_half_extent,
		top_right = pos + x_half_extent + y_half_extent,
		bottom_left = pos - x_half_extent - y_half_extent,
		bottom_right = (pos + x_half_extent) - y_half_extent,
		height = pos.z
	}
	slot7 = self._extents.top_left

	self._snap_pos_to_grid(pos.z, self)

	slot7 = self._extents.top_right

	self._snap_pos_to_grid(pos.z, self)

	slot7 = self._extents.bottom_left

	self._snap_pos_to_grid(pos.z, self)

	slot7 = self._extents.bottom_right

	self._snap_pos_to_grid(pos.z, self)

	self._extents.aabb = {}
	slot10 = self._extents.top_right.x
	slot7 = math.min(slot8, self._extents.top_left.x)
	slot11 = self._extents.bottom_right.x
	self._extents.aabb.min_x = math.min(self, math.min(self._extents.top_left.x, self._extents.bottom_left.x))
	slot10 = self._extents.top_right.y
	slot7 = math.min(math.min, self._extents.top_left.y)
	slot11 = self._extents.bottom_right.y
	self._extents.aabb.min_y = math.min(self, math.min(self._extents.top_left.y, self._extents.bottom_left.y))
	slot10 = self._extents.top_right.x
	slot7 = math.max(math.min, self._extents.top_left.x)
	slot11 = self._extents.bottom_right.x
	self._extents.aabb.max_x = math.max(self, math.max(self._extents.top_left.x, self._extents.bottom_left.x))
	slot10 = self._extents.top_right.y
	slot7 = math.max(math.max, self._extents.top_left.y)
	slot11 = self._extents.bottom_right.y
	self._extents.aabb.max_y = math.max(self, math.max(self._extents.top_left.y, self._extents.bottom_left.y))

	return 
end
function ElementNavigationStitcher:_create_nav_data()
	self._nav_data = {
		version = 6,
		door_high_pos = {},
		door_low_pos = {},
		door_high_quads = {},
		door_low_quads = {},
		helper_blockers = {},
		quad_borders_x_pos = {},
		quad_borders_x_neg = {},
		quad_borders_y_pos = {},
		quad_borders_y_neg = {},
		quad_heights_xp_yp = {},
		quad_heights_xp_yn = {},
		quad_heights_xn_yp = {},
		quad_heights_xn_yn = {},
		segments = {}
	}
	self._nav_data.segments[1] = {
		location_id = "location_unknown",
		id = 1,
		position = self._values.position,
		pos = self._values.position,
		vis_groups = {}
	}
	self._nav_data.segments[1].vis_groups[1] = 1
	slot6 = 1
	self._nav_data.segments[1].unique_id = managers.navigation.get_segment_unique_id(, managers.navigation, self._world_id)
	self._nav_data.visibility_groups = {
		{
			pos = self._values.position,
			quads = {},
			visible_groups = {}
		}
	}
	self._nav_data.parent_world_id = self._sync_id

	return 
end
function ElementNavigationStitcher:_create_quad(x, y)
	slot5 = self._nav_data.quad_borders_x_pos
	slot11 = x + self._grid_size / 2
	slot8 = self._snap_to_grid(slot9, self) / self._grid_size

	table.insert(slot4, math.round(slot7))

	slot5 = self._nav_data.quad_borders_x_neg
	slot11 = x - self._grid_size / 2
	slot8 = self._snap_to_grid(self._grid_size, self) / self._grid_size

	table.insert(slot4, math.round(slot7))

	slot5 = self._nav_data.quad_borders_y_pos
	slot11 = y + self._grid_size / 2
	slot8 = self._snap_to_grid(self._grid_size, self) / self._grid_size

	table.insert(slot4, math.round(slot7))

	slot5 = self._nav_data.quad_borders_y_neg
	slot11 = y - self._grid_size / 2
	slot8 = self._snap_to_grid(self._grid_size, self) / self._grid_size

	table.insert(slot4, math.round(slot7))

	slot6 = self._extents.height + 0.9

	table.insert(slot4, self._nav_data.quad_heights_xp_yp)

	slot6 = self._extents.height + 0.9

	table.insert(slot4, self._nav_data.quad_heights_xp_yn)

	slot6 = self._extents.height + 0.9

	table.insert(slot4, self._nav_data.quad_heights_xn_yp)

	slot6 = self._extents.height + 0.9

	table.insert(slot4, self._nav_data.quad_heights_xn_yn)

	local i_quad = #self._nav_data.quad_borders_x_pos
	slot7 = i_quad

	table.insert(self._nav_data.quad_heights_xn_yn, self._nav_data.visibility_groups[1].quads)

	return i_quad
end
function ElementNavigationStitcher:_create_top_door(i_x, i_y, z)
	local i_top_quad = self._quad_grid[i_y - 1][i_x]
	local i_bottom_quad = self._quad_grid[i_y][i_x]
	local xp = self._nav_data.quad_borders_x_pos[i_top_quad]
	local xn = self._nav_data.quad_borders_x_neg[i_top_quad]
	local yn = self._nav_data.quad_borders_y_neg[i_top_quad]
	slot11 = self._nav_data.door_high_pos
	slot16 = z + 0.9

	table.insert(slot10, Vector3(slot13, xp, yn))

	slot11 = self._nav_data.door_low_pos
	slot16 = z + 0.9

	table.insert(slot10, Vector3(slot13, xn, yn))

	slot12 = i_top_quad

	table.insert(slot10, self._nav_data.door_high_quads)

	slot12 = i_bottom_quad

	table.insert(slot10, self._nav_data.door_low_quads)

	return 
end
function ElementNavigationStitcher:_create_left_door(i_x, i_y, z)
	local i_left_quad = self._quad_grid[i_y][i_x - 1]
	local i_right_quad = self._quad_grid[i_y][i_x]
	local xp = self._nav_data.quad_borders_x_pos[i_left_quad]
	local yp = self._nav_data.quad_borders_y_pos[i_left_quad]
	local yn = self._nav_data.quad_borders_y_neg[i_left_quad]
	slot11 = self._nav_data.door_high_pos
	slot16 = z + 0.9

	table.insert(slot10, Vector3(slot13, xp, yp))

	slot11 = self._nav_data.door_low_pos
	slot16 = z + 0.9

	table.insert(slot10, Vector3(slot13, xp, yn))

	slot12 = i_left_quad

	table.insert(slot10, self._nav_data.door_high_quads)

	slot12 = i_right_quad

	table.insert(slot10, self._nav_data.door_low_quads)

	return 
end
function ElementNavigationStitcher:_create_quads()
	local z = self._extents.height
	local i_x = 1
	local i_y = 1
	self._quad_grid = {}
	local pos = nil
	local x = self._extents.aabb.min_x + self._grid_size / 2

	while x <= self._extents.aabb.max_x do
		i_y = 1
		local y = self._extents.aabb.max_y - self._grid_size / 2

		while self._extents.aabb.min_y <= y do
			if not self._quad_grid[i_y] then
				self._quad_grid[i_y] = {}
			end

			slot14 = z
			slot11 = false
			local inside = managers.navigation.is_point_inside(slot8, managers.navigation, Vector3(slot11, x, y))

			if not inside then
				slot12 = y
				local i_quad = self._create_quad(slot9, self, x)
				self._quad_grid[i_y][i_x] = i_quad

				if 2 <= i_y and self._quad_grid[i_y - 1][i_x] then
					slot14 = z

					self._create_top_door(slot10, self, i_x, i_y)
				end

				if 2 <= i_x and self._quad_grid[i_y][i_x - 1] then
					slot14 = z

					self._create_left_door(slot10, self, i_x, i_y)
				end
			end

			y = y - self._grid_size
			i_y = i_y + 1
		end

		x = x + self._grid_size
		i_x = i_x + 1
	end

	self._ct_x = i_x - 1
	self._ct_y = i_y - 1

	return 
end
function ElementNavigationStitcher:_collect_external_top_door(x, y, z, i_quad)
	slot9 = z + 0.9
	local door_high_pos = Vector3(slot6, self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_y_pos[i_quad] * self._grid_size)
	slot10 = z + 0.9
	local door_low_pos = Vector3(self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_y_pos[i_quad] * self._grid_size)
	slot11 = z + 0.9
	local stitch_quad_pos = Vector3(self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, x, y)
	slot12 = z + 0.9
	local external_quad_pos = Vector3(x, x, y + self._grid_size)
	slot12 = {
		side = "top",
		stitch_quad_pos = stitch_quad_pos,
		external_quad_pos = external_quad_pos,
		door_high_pos = door_high_pos,
		door_low_pos = door_low_pos
	}

	table.insert(x, self._external_doors)

	return 
end
function ElementNavigationStitcher:_collect_external_left_door(x, y, z, i_quad)
	slot9 = z + 0.9
	local door_high_pos = Vector3(slot6, self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_y_pos[i_quad] * self._grid_size)
	slot10 = z + 0.9
	local door_low_pos = Vector3(self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_y_neg[i_quad] * self._grid_size)
	slot11 = z + 0.9
	local stitch_quad_pos = Vector3(self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, x, y)
	slot12 = z + 0.9
	local external_quad_pos = Vector3(x, x - self._grid_size, y)
	slot12 = {
		side = "left",
		stitch_quad_pos = stitch_quad_pos,
		external_quad_pos = external_quad_pos,
		door_high_pos = door_high_pos,
		door_low_pos = door_low_pos
	}

	table.insert(x - self._grid_size, self._external_doors)

	return 
end
function ElementNavigationStitcher:_collect_external_bottom_door(x, y, z, i_quad)
	slot9 = z + 0.9
	local door_high_pos = Vector3(slot6, self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_y_neg[i_quad] * self._grid_size)
	slot10 = z + 0.9
	local door_low_pos = Vector3(self._nav_data.quad_borders_x_neg[i_quad] * self._grid_size, self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_y_neg[i_quad] * self._grid_size)
	slot11 = z + 0.9
	local stitch_quad_pos = Vector3(self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, x, y)
	slot12 = z + 0.9
	local external_quad_pos = Vector3(x, x, y - self._grid_size)
	slot12 = {
		side = "bottom",
		stitch_quad_pos = stitch_quad_pos,
		external_quad_pos = external_quad_pos,
		door_high_pos = door_high_pos,
		door_low_pos = door_low_pos
	}

	table.insert(x, self._external_doors)

	return 
end
function ElementNavigationStitcher:_collect_external_right_door(x, y, z, i_quad)
	slot9 = z + 0.9
	local door_high_pos = Vector3(slot6, self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_y_neg[i_quad] * self._grid_size)
	slot10 = z + 0.9
	local door_low_pos = Vector3(self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, self._nav_data.quad_borders_y_pos[i_quad] * self._grid_size)
	slot11 = z + 0.9
	local stitch_quad_pos = Vector3(self._nav_data.quad_borders_x_pos[i_quad] * self._grid_size, x, y)
	slot12 = z + 0.9
	local external_quad_pos = Vector3(x, x + self._grid_size, y)
	slot12 = {
		side = "right",
		stitch_quad_pos = stitch_quad_pos,
		external_quad_pos = external_quad_pos,
		door_high_pos = door_high_pos,
		door_low_pos = door_low_pos
	}

	table.insert(x + self._grid_size, self._external_doors)

	return 
end
function ElementNavigationStitcher:_collect_external_doors()
	self._external_doors = {}
	local i_x = 1
	local i_y = 1
	local top_left_x = self._extents.aabb.min_x - self._grid_size / 2
	local top_left_y = self._extents.aabb.max_y + self._grid_size / 2
	local z = self._extents.height

	for i_x = 1, self._ct_x, 1 do
		local x = top_left_x + i_x * self._grid_size

		for i_y = 1, self._ct_y, 1 do
			local y = top_left_y - i_y * self._grid_size
			local i_quad = self._quad_grid[i_y][i_x]

			if i_quad then
				if i_y <= 1 or not self._quad_grid[i_y - 1] or not self._quad_grid[i_y - 1][i_x] then
					slot24 = z
					slot21 = false

					if managers.navigation.is_point_inside(slot18, managers.navigation, Vector3(slot21, x, y + self._grid_size)) then
						slot23 = self._quad_grid[i_y][i_x]

						self._collect_external_top_door(slot18, self, x, y, z)
					end
				end

				if i_x <= 1 or not self._quad_grid[i_y][i_x - 1] then
					slot24 = z
					slot21 = false

					if managers.navigation.is_point_inside(slot18, managers.navigation, Vector3(slot21, x - self._grid_size, y)) then
						slot23 = self._quad_grid[i_y][i_x]

						self._collect_external_left_door(slot18, self, x, y, z)
					end
				end

				if not self._quad_grid[i_y + 1] or not self._quad_grid[i_y + 1][i_x] then
					slot24 = z
					slot21 = false

					if managers.navigation.is_point_inside(slot18, managers.navigation, Vector3(slot21, x, y - self._grid_size)) then
						slot23 = self._quad_grid[i_y][i_x]

						self._collect_external_bottom_door(slot18, self, x, y, z)
					end
				end

				if not self._quad_grid[i_y][i_x + 1] then
					slot24 = z
					slot21 = false

					if managers.navigation.is_point_inside(slot18, managers.navigation, Vector3(slot21, x + self._grid_size, y)) then
						slot23 = self._quad_grid[i_y][i_x]

						self._collect_external_right_door(slot18, self, x, y, z)
					end
				end
			end
		end
	end

	return 
end
function ElementNavigationStitcher:_create_external_doors()
	slot3 = self._external_doors

	for _, door in ipairs(slot2) do
		slot12 = door.door_low_pos

		managers.navigation._quad_field.add_door(slot7, managers.navigation._quad_field, door.stitch_quad_pos, door.external_quad_pos, door.door_high_pos)
	end

	return 
end
function ElementNavigationStitcher:_clear_data()
	self._extents = {}
	self._nav_data = {}
	self._external_doors = {}
	self._has_created = false

	return 
end
function ElementNavigationStitcher:stitch(from_dropin)
	if self._has_created and not from_dropin then
		return 
	end

	self._has_created = true

	if not self._world_id then
		slot4 = managers.worldcollection
		slot2 = managers.worldcollection.get_next_navstitcher_id(slot3)
	end

	self._world_id = slot2
	slot4 = managers.navigation
	self._grid_size = managers.navigation.grid_size(slot3)
	slot4 = self

	self._calculate_extents(slot3)

	slot4 = self

	self._create_nav_data(slot3)

	slot4 = self

	self._create_quads(slot3)

	if #self._nav_data.quad_borders_x_pos == 0 then
		slot5 = "[ElementNavigationStitcher] Navigation stitcher area is fully inside existing navigation - nothing to stitch"

		Application.error(slot3, Application)

		slot4 = self

		self._clear_data(slot3)

		return 
	end

	slot4 = self

	self._collect_external_doors(slot3)

	slot11 = 0
	slot9 = true

	managers.navigation.set_load_data(slot3, managers.navigation, self._nav_data, self._world_id, Vector3(slot8, 0, 0), 0)

	slot4 = self

	self._create_external_doors(slot3)

	slot5 = self._world_id

	managers.navigation._quad_field.refresh_neighbours(slot3, managers.navigation._quad_field)

	slot6 = true

	managers.navigation._resolve_segment_neighbours(slot3, managers.navigation, self._world_id)

	slot5 = self._world_id

	managers.groupai._state.merge_world_data(slot3, managers.groupai._state)

	return 
end
function ElementNavigationStitcher:tear()
	if not self._has_created then
		return 
	end

	slot3 = self

	self._clear_data(slot2)

	slot4 = self._world_id

	managers.navigation.unload_world_data(slot2, managers.navigation)

	return 
end
function ElementNavigationStitcher:save(data)
	data.enabled = self._values.enabled
	data.has_created = self._has_created
	data.world_id = self._world_id

	return 
end
function ElementNavigationStitcher:load(data)
	if not self._on_script_activated_done then
		slot4 = self

		self.on_script_activated(slot3)
	end

	self._world_id = data.world_id
	self._has_created = data.has_created

	if self._has_created then
		slot4 = managers.navigation

		if managers.navigation.is_streamed_data_ready(slot3) then
			slot5 = "[ElementNavigationStitcher:load] Stitching!"

			Application.debug(slot3, Application)

			slot5 = true

			self.stitch(slot3, self)
		else
			slot5 = "[ElementNavigationStitcher:load] Queuing stitching!"

			Application.debug(slot3, Application)

			slot6 = {
				"navigation_ready"
			}
			slot11 = "_queue_stitch"

			managers.navigation.add_listener(slot3, managers.navigation, "stitcher" .. self._id, callback(slot8, self, self))
		end
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end
function ElementNavigationStitcher:_queue_stitch()
	slot4 = "[ElementNavigationStitcher:load] Stitching from queue!"

	Application.debug(slot2, Application)

	slot4 = true

	self.stitch(slot2, self)

	return 
end

return 
