SpawnManager = SpawnManager or class()
function SpawnManager:init()
	self._spawn_requests = {}

	return 
end
function SpawnManager:spawn_enemy_group_in_vis_group(event, i_vis_group)
	local spawn_request = {
		groups = {}
	}
	slot6 = event.groups

	for unit_name, unit_data in pairs(slot5) do
		spawn_request.groups[unit_name] = {
			amount = unit_data.amount
		}
	end

	spawn_request.ai = event.ai
	slot6 = spawn_request.groups

	for unit_name, unit_data in pairs(slot5) do
		local spawn_positions = {}
		local i = 1

		while i <= unit_data.amount do
			slot14 = i_vis_group
			local new_pos = managers.navigation.find_random_position_in_visibility_group(slot12, managers.navigation)
			slot15 = new_pos

			table.insert(managers.navigation, spawn_positions)

			i = i + 1
		end

		unit_data.positions = spawn_positions
	end

	self._spawn_requests = self._spawn_requests or {}
	slot7 = spawn_request

	table.insert(slot5, self._spawn_requests)

	slot6 = self

	return self._spawn_units(slot5)
end
function SpawnManager:spawn_enemy_group(event)
	local spawn_request = {
		groups = {}
	}
	slot5 = event.groups

	for unit_name, unit_data in pairs(slot4) do
		spawn_request.groups[unit_name] = {
			amount = unit_data.amount
		}
	end

	spawn_request.ai = event.ai
	slot6 = "all"
	slot10 = "players"
	local criminals = World.find_units_quick(slot4, World, managers.slot.get_mask(slot8, managers.slot))

	if 0 < #criminals then
		local hide_from_trackers = {}
		slot7 = criminals

		for _, criminal_unit in ipairs(slot6) do
			slot12 = hide_from_trackers
			slot15 = criminal_unit
			slot15 = criminal_unit.movement(slot14)

			table.insert(slot11, criminal_unit.movement(slot14).nav_tracker(slot14))
		end

		slot8 = {
			trackers = hide_from_trackers
		}
		local vis_group_pos, i_vis_group = managers.navigation.find_hide_position(slot6, managers.navigation)

		if i_vis_group then
			slot9 = spawn_request.groups

			for unit_name, unit_data in pairs(slot8) do
				local spawn_positions = {}
				local i = 1

				while i <= unit_data.amount do
					slot17 = i_vis_group
					local new_pos = managers.navigation.find_random_position_in_visibility_group(slot15, managers.navigation)
					slot18 = new_pos

					table.insert(managers.navigation, spawn_positions)

					i = i + 1
				end

				unit_data.positions = spawn_positions
			end
		else
			slot9 = "SpawnManager:spawn_enemy_group() Could not find a hidden position. Cancelling spawn"

			print(slot8)

			return 
		end
	else
		slot6 = managers.navigation
		local new_pos, i_vis_group = managers.navigation.find_random_position(slot5)
		slot8 = spawn_request.groups

		for unit_name, unit_data in pairs(slot7) do
			local spawn_positions = {}
			local i = 1

			while i <= unit_data.amount do
				slot16 = i_vis_group
				local new_pos = managers.navigation.find_random_position_in_visibility_group(slot14, managers.navigation)
				slot17 = new_pos

				table.insert(managers.navigation, spawn_positions)

				i = i + 1
			end

			unit_data.positions = spawn_positions
		end
	end

	self._spawn_requests = self._spawn_requests or {}
	slot7 = spawn_request

	table.insert(slot5, self._spawn_requests)

	slot6 = self

	return self._spawn_units(slot5)
end
function SpawnManager:update(unit, t, dt)
	return 
end
function SpawnManager:_spawn_units()
	if self._spawn_requests then
		local units_spawned = {}
		local trash_requests = nil
		slot5 = self._spawn_requests

		for request_id, spawn_request in pairs(slot4) do
			local trash_groups = nil
			slot11 = spawn_request.groups

			for unit_name, unit_data in pairs(slot10) do
				if unit_data.amount == 1 then
					trash_groups = trash_groups or {}
					trash_groups[unit_name] = true
				else
					unit_data.amount = unit_data.amount - 1
				end

				slot19 = unit_name
				slot22 = math.random() * 360
				local new_unit = World.spawn_unit(slot15, World, Idstring(unit_data.positions[#unit_data.positions]), Rotation(slot20, math.UP))

				if spawn_request.ai then
					local ai_instance = {}
					slot18 = spawn_request.ai

					for k, v in pairs(slot17) do
						ai_instance[k] = v
					end

					slot18 = new_unit
					slot19 = ai_instance

					new_unit.brain(slot17).set_spawn_ai(slot17, new_unit.brain(slot17))
				end

				slot17 = unit_data.positions

				table.remove(slot16)

				slot18 = new_unit

				table.insert(slot16, units_spawned)
			end

			if trash_groups then
				slot11 = trash_groups

				for unit_name, _ in pairs(slot10) do
					spawn_request.groups[unit_name] = nil
				end
			end

			slot11 = spawn_request.groups

			if not next(slot10) then
				trash_requests = trash_requests or {}
				trash_requests[request_id] = true
			end
		end

		if trash_requests then
			slot5 = trash_requests

			for request_id, _ in pairs(slot4) do
				self._spawn_requests[request_id] = nil
			end
		end

		slot5 = self._spawn_requests

		if not next(slot4) then
			self._spawn_requests = nil
		end

		return units_spawned
	end

	return 
end

return 
