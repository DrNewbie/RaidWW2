-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
MotionPathPathFinder = MotionPathPathFinder or class()
MotionPathPathFinder._VERSION = 0.1
function MotionPathPathFinder:init()
	self._open_nodes = {}
	self._closed_nodes = {}

	return 
end
function MotionPathPathFinder:set_mp_manager(manager)
	self._motion_path_manager = manager

	return 
end
function MotionPathPathFinder:recreate_graph()
	self._nodes = {}
	self._graph_units = {}
	slot3 = self._motion_path_manager._paths

	for _, path in ipairs(slot2) do
		if path.path_type == "ground" then
			slot9 = path

			self._add_path(slot7, self)
		end
	end

	self._graph_units = {}
	self._open_nodes = {}
	self._closed_nodes = {}

	return 
end
function MotionPathPathFinder:_make_link(current_pos, target_marker_index, path)
	local link = nil
	local target_marker = path.markers[target_marker_index]

	if target_marker then
		local target_unit = self._get_mop_marker_data(slot7, self)
		local pos = target_unit.position
		slot11 = pos
		local distance = mvector3.distance(target_marker, current_pos)
		link = {
			target_marker = target_marker,
			distance = distance
		}
	end

	return link
end
function MotionPathPathFinder:_add_path(path)
	local point_index = 1
	local last_marker, current_unit, current_pos = nil

	for i_marker = 1, #path.markers, 1 do
		local current_marker = path.markers[i_marker]
		slot14 = current_marker
		local current_unit = self._get_mop_marker_data(slot12, self)

		if not current_unit then
			return 
		end

		local current_pos = current_unit.position
		local links = {}
		slot16 = links
		slot22 = path

		table.insert(slot15, self._make_link(slot18, self, current_pos, i_marker + 1))

		slot16 = links
		slot22 = path

		table.insert(slot15, self._make_link(slot18, self, current_pos, i_marker - 1))

		slot16 = path.bridges

		for _, bridge in ipairs(slot15) do
			if not bridge.disabled and bridge.marker_from == current_marker then
				local link = {
					target_marker = bridge.marker_to,
					distance = bridge.distance
				}
				slot23 = link

				table.insert(slot21, links)
			end
		end

		local node = {
			g_score = 0,
			heuristic = 1000000,
			path = path,
			marker = current_marker,
			links = links,
			pos = current_pos
		}
		self._nodes[current_marker] = node
	end

	return 
end
function MotionPathPathFinder:_get_unit(unit_id)
	local unit = self._graph_units[unit_id]

	if not unit then
		slot5 = Application

		if Application.editor(slot4) then
			slot6 = unit_id
			unit = managers.editor.unit_with_id(slot4, managers.editor)
		else
			slot6 = unit_id
			unit = managers.worlddefinition.get_unit(slot4, managers.worlddefinition)
		end

		self._graph_units[unit_id] = unit
	end

	return unit
end
function MotionPathPathFinder:_get_mop_marker_data(unit_id)
	return unit
end
function MotionPathPathFinder:find_path(start_pos, end_pos)

	-- Decompilation error in this vicinity:
	self._graph_units = {}
	slot7 = end_pos
	local end_node, start_node = self._astar_search(slot4, self, start_pos)

	if not end_node or not start_node then
		return nil
	end

	local last_path = end_node.path
	local current_node = end_node

	while current_node and start_node.path ~= current_node.path do
		last_path = current_node.path
		current_node = current_node.came_from
	end

	return last_path
end
function MotionPathPathFinder:_astar_search(start_pos, end_pos)
	slot7 = end_pos
	local start_node, end_node = self._find_nodes(slot4, self, start_pos)

	if not start_node or not end_node then
		return nil, nil
	end

	if start_node == end_node then
		return start_node, start_node
	end

	slot7 = self._open_nodes

	for k, v in pairs(slot6) do
		self._open_nodes[k] = nil
	end

	slot7 = self._closed_nodes

	for k, v in pairs(slot6) do
		self._closed_nodes[k] = nil
	end

	start_node.g_score = 0
	slot8 = end_pos
	start_node.heuristic = mvector3.distance(slot6, start_node.pos)
	start_node.came_from = nil
	self._open_nodes[start_node.marker] = start_node
	local g_score = 0
	local iteration = 1
	slot9 = self._open_nodes

	while next(slot8) ~= nil do
		slot10 = self._open_nodes
		local best_node = self._get_best_node(slot8, self)

		if best_node.marker == end_node.marker then
			return best_node, start_node
		end

		self._open_nodes[best_node.marker] = nil
		self._closed_nodes[best_node.marker] = best_node
		slot10 = best_node.links

		for _, link in ipairs(best_node.marker) do
			if not self._closed_nodes[link.target_marker] then
				local distance = link.distance or 0
				local g_score = best_node.g_score + distance
				local node_in_open = self._open_nodes[link.target_marker]

				if not node_in_open then
					local target_node = self._nodes[link.target_marker]

					if target_node then
						target_node.g_score = g_score
						slot20 = end_pos
						target_node.heuristic = mvector3.distance(slot18, target_node.pos)
						target_node.came_from = best_node
						self._open_nodes[link.target_marker] = target_node
					else
						slot20 = "A* failed, link doesn't have a target marker  - "
						slot23 = link

						Application.error(slot18, Application, inspect(slot22))

						return nil, nil
					end
				elseif g_score < node_in_open.g_score then
					node_in_open.g_score = g_score
					node_in_open.came_from = best_node
				end
			end
		end

		iteration = iteration + 1
	end

	return nil, nil
end
function MotionPathPathFinder:_find_nodes(start_pos, end_pos)
	if not start_pos or not end_pos then
		return nil, nil
	end

	local start_node = nil
	local start_node_distance = 100000000
	local end_node = nil
	local end_node_distance = 100000000
	slot9 = self._nodes

	for marker, node in pairs(slot8) do
		slot15 = node.pos
		local start_distance = mvector3.distance(slot13, start_pos)

		if start_distance < start_node_distance then
			start_node_distance = start_distance
			start_node = node
		end

		slot16 = node.pos
		local end_distance = mvector3.distance(slot14, end_pos)

		if end_distance < end_node_distance then
			end_node_distance = end_distance
			end_node = node
		end
	end

	return start_node, end_node
end
function MotionPathPathFinder:_get_best_node(open_nodes)
	local best_node = nil
	local heuristic = 100000000
	slot6 = open_nodes

	for marker, node in pairs(slot5) do
		if node.heuristic < heuristic then
			heuristic = node.heuristic
			best_node = node
		end
	end

	return best_node
end

return 
