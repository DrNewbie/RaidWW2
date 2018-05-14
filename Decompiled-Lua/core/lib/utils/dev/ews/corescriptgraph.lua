-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreScriptGraph"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

ScriptGraph = ScriptGraph or CoreClass.class()
CONFIG_VERSION = "1"
function ScriptGraph:init(parent, id, style)
	slot7 = "[ScriptGraph] Currently the only supported graph view type is 'FLOW'."

	assert(slot5, style == "FLOW" or not style)

	slot9 = style

	self._create_panel(slot5, self, parent, id)

	return 
end
function ScriptGraph:update(t, dt)
	slot6 = dt

	self._graph_view.update_graph(slot4, self._graph_view)

	return 
end
function ScriptGraph:window()
	return self._graph_view
end
function ScriptGraph:destroy()
	slot3 = self._graph_view

	self._graph_view.destroy(slot2)

	return 
end
function ScriptGraph:selected_nodes()
	local t = {}
	slot4 = self._graph_view

	for n in self._graph_view.selected_nodes(slot3) do
		slot9 = n

		table.insert(slot7, t)
	end

	return t
end
function ScriptGraph:last_selected_node()
	slot3 = self._graph_view

	return self._graph_view.last_selected_node(slot2)
end
function ScriptGraph:nodes()
	slot3 = self._graph_view

	return self._graph_view.nodes(slot2)
end
function ScriptGraph:graph_metadata()
	return self._graph_metadata
end
function ScriptGraph:set_graph_metadata(data)
	self._graph_metadata = data

	return 
end
function ScriptGraph:add_node(node)
	slot6 = node
	slot5 = "[ScriptGraph] The only supported node type is 'flow_node'."

	assert(slot3, node.type(slot5) == "FlowNode")

	slot5 = node

	self._graph.add_node(slot3, self._graph)

	return 
end
function ScriptGraph:connect(id, event_type, cb, data)
	slot11 = data

	self._graph_view.connect(slot6, self._graph_view, id, event_type, cb)

	return 
end
function ScriptGraph:save(id_map)
	local new_id_map = id_map or {}
	local config = Node(slot4)
	slot8 = self._name or ""

	config.set_parameter("graph", config, "name")

	slot8 = CONFIG_VERSION

	config.set_parameter("graph", config, "version")

	if self._graph_metadata then
		local gm = Node(slot5)
		slot8 = self._graph_metadata

		gm.add_child("metadata", gm)

		slot8 = gm

		config.add_child("metadata", config)
	end

	if id_map then
		slot6 = id_map

		for id, node in pairs(slot5) do
			local cfg_node = Node(slot10)
			slot13 = "name"
			slot16 = node

			cfg_node.set_parameter("node", cfg_node, node.name(slot15))

			slot13 = "type"
			slot16 = node

			cfg_node.set_parameter("node", cfg_node, node.type(slot15))

			slot14 = id

			cfg_node.set_parameter("node", cfg_node, "id")

			slot13 = "x"
			slot16 = node

			cfg_node.set_parameter("node", cfg_node, node.x(slot15))

			slot13 = "y"
			slot16 = node

			cfg_node.set_parameter("node", cfg_node, node.y(slot15))

			slot15 = id_map

			self._write_slots("node", self, cfg_node, node)

			slot14 = node

			self._write_icon("node", self, cfg_node)

			slot14 = node

			self._write_node_color("node", self, cfg_node)

			slot13 = cfg_node

			config.add_child("node", config)
		end
	else
		slot6 = self._graph_view

		for node in self._graph_view.nodes(slot5) do
			local cfg_node = Node(slot9)
			slot12 = "name"
			slot15 = node

			cfg_node.set_parameter("node", cfg_node, node.name(slot14))

			slot12 = "type"

			cfg_node.set_parameter("node", cfg_node, node.type(slot14))

			local id = tostring("node")
			new_id_map[id] = node
			slot14 = id

			cfg_node.set_parameter(node, cfg_node, "id")

			slot13 = "x"
			slot16 = node

			cfg_node.set_parameter(node, cfg_node, node.x(node))

			slot13 = "y"
			slot16 = node

			cfg_node.set_parameter(node, cfg_node, node.y(node))

			slot14 = node

			self._write_slots(node, self, cfg_node)

			slot14 = node

			self._write_icon(node, self, cfg_node)

			slot14 = node

			self._write_node_color(node, self, cfg_node)

			slot13 = cfg_node

			config.add_child(node, config)
		end
	end

	return config, new_id_map
end
function ScriptGraph:load(config_root)
	slot8 = config_root

	assert(slot3, config_root)
	assert(slot3, config_root.parameter("[ScriptGraph] Could not open: " .. tostring("version"), config_root) == CONFIG_VERSION)

	slot7 = "name"
	self._name = assert(config_root.parameter("[ScriptGraph] Bad version!", config_root))
	self._nodes = {}
	self._id_map = {}
	slot4 = config_root

	for node in config_root.children(slot3) do
		slot8 = node

		if node.name(slot7) == "metadata" then
			slot9 = 0
			self._graph_metadata = node.child(slot7, node)

			break
		end
	end

	slot4 = config_root

	for node in config_root.children(slot3) do
		slot8 = node

		if node.name(slot7) == "node" then
			slot9 = node
			local node_info = self._load_node_info(slot7, self)
			slot15 = "name"
			slot20 = "x"
			slot21 = "y"
			local ewsnode = EWS.FlowNode(self, EWS, assert(node.parameter(tonumber(assert(node.parameter(slot18, node))), node)), node_info.in_slot_names, node_info.out_slot_names, tonumber(assert(node.parameter(node, node))))
			slot16 = "type"
			self._nodes[assert(node.parameter(node_info.out_slot_names, node))] = {
				node_type = assert(node.parameter("id", node)),
				info = node_info,
				cnode = ewsnode
			}
			slot14 = "id"

			ewsnode.set_metadata(assert(node.parameter(node_info.out_slot_names, node)), node.parameter(node_info.out_slot_names, node))

			slot12 = "id"
			self._id_map[node.parameter(ewsnode, node)] = ewsnode
		end
	end

	slot4 = self._graph

	self._graph.clear(slot3)

	slot4 = self._nodes

	for _, node in pairs(slot3) do
		slot10 = node.cnode

		self._graph.add_node(slot8, self._graph)

		if node.info.icon then
			slot9 = node.cnode
			slot14 = node.info.icon

			node.cnode.set_icon(slot8, CoreEWS.image_path(node.info.icon.s(slot13)))
		end

		if node.info.color then
			slot9 = node.cnode
			slot12 = node.info.color

			node.cnode.set_colour(slot8, unpack(slot11))
		end
	end

	slot4 = self._nodes

	for _, node in pairs(slot3) do
		if node.info.out_slots then
			slot9 = node.info.out_slots

			for slot_name, slot in pairs(slot8) do
				slot14 = slot.con

				for _, con in pairs(slot13) do
					slot21 = con.id
					local dest_node = self._find_node_with_id(slot18, self, self._nodes)
					slot24 = con.desc

					node.cnode.set_target(self, node.cnode, slot_name, dest_node, con.slot)
				end

				if slot.col then
					slot15 = slot_name
					slot18 = slot.col

					node.cnode.set_output_colour(slot13, node.cnode, unpack(slot17))
				end
			end
		end

		if node.info.in_slots then
			slot9 = node.info.in_slots

			for slot_name, slot in pairs(slot8) do
				if slot.col then
					slot15 = slot_name
					slot18 = slot.col

					node.cnode.set_input_colour(slot13, node.cnode, unpack(slot17))
				end
			end
		end
	end

	slot4 = self._graph_view

	self._graph_view.refresh(slot3)

	return self._id_map
end
function ScriptGraph:_load_node_info(node)
	local info = {}
	slot5 = node

	for node_info in node.children(slot4) do
		slot9 = node_info

		if node_info.name(slot8) == "slot" then
			slot12 = "type"

			if assert(node_info.parameter(slot10, node_info)) == "in" then
				info.in_slots = info.in_slots or {}
				info.in_slot_names = info.in_slot_names or {}
				local color = nil
				slot13 = "name"
				local name = assert(node_info.parameter(slot11, node_info))
				slot11 = node_info

				for inf in node_info.children(node_info.parameter) do
					slot15 = inf

					if inf.name(slot14) == "color" then
						slot21 = "r"
						slot21 = "g"
						slot21 = "b"
						color = {
							tonumber(assert(inf.parameter(slot19, inf))),
							tonumber(assert(inf.parameter(slot19, inf))),
							tonumber(assert(inf.parameter(slot19, inf)))
						}
					end
				end

				slot12 = name

				table.insert(slot10, info.in_slot_names)

				info.in_slots[name] = {
					col = color
				}
			else
				info.out_slots = info.out_slots or {}
				info.out_slot_names = info.out_slot_names or {}
				local connection = {}
				local color = nil
				slot14 = "name"
				local name = assert(node_info.parameter(slot12, node_info))
				slot12 = node_info

				for inf in node_info.children(node_info.parameter) do
					slot16 = inf

					if inf.name(slot15) == "connection" then
						slot17 = {
							id = assert(inf.parameter(slot21, inf)),
							slot = assert(inf.parameter(slot21, inf)),
							desc = assert(inf.parameter(slot21, inf))
						}
						slot23 = "id"
						slot23 = "slot"
						slot23 = "desc"

						table.insert(slot15, connection)
					else
						slot16 = inf

						if inf.name(slot15) == "color" then
							slot22 = "r"
							slot22 = "g"
							slot22 = "b"
							color = {
								tonumber(assert(inf.parameter(slot20, inf))),
								tonumber(assert(inf.parameter(slot20, inf))),
								tonumber(assert(inf.parameter(slot20, inf)))
							}
						end
					end
				end

				slot13 = name

				table.insert(slot11, info.out_slot_names)

				info.out_slots[name] = {
					con = connection,
					col = color
				}
			end
		else
			slot9 = node_info

			if node_info.name(slot8) == "icon" then
				slot14 = "name"
				info.icon = assert(Idstring(node_info.parameter(slot12, node_info)))
			else
				slot9 = node_info

				if node_info.name(slot8) == "color" then
					slot15 = "r"
					slot15 = "g"
					slot15 = "b"
					info.color = {
						tonumber(assert(node_info.parameter(slot13, node_info))),
						tonumber(assert(node_info.parameter(slot13, node_info))),
						tonumber(assert(node_info.parameter(slot13, node_info)))
					}
				end
			end
		end
	end

	return info
end
function ScriptGraph:_create_panel(parent, id, style, window_style)
	slot7 = EWS
	self._graph = EWS.Graph(slot6)
	slot11 = "FLOW"
	self._graph_view = EWS.GraphView(slot6, EWS, parent, id or "", self._graph)
	slot8 = false

	self._graph_view.set_clipping(slot6, self._graph_view)

	slot8 = window_style or "SUNKEN_BORDER"

	self._graph_view.toggle_style(slot6, self._graph_view)

	return 
end
function ScriptGraph:_find_node_with_id(nodes, id)
	slot9 = id
	slot6 = "[ScriptGraph] The graph is corrupt! Can't find node id: " .. tostring(slot8)
	local node = assert(slot4, nodes[id])

	return node.cnode
end
function ScriptGraph:_find_id_with_node(id_map, node)
	slot5 = id_map

	for id, n in pairs(slot4) do
		if n == node then
			return id
		end
	end

	slot8 = node
	slot5 = "[ScriptGraph] Could not find node: " .. tostring(slot7)

	error(slot4)

	return 
end
function ScriptGraph:_write_icon(cfg_node, node)
	slot5 = node

	if node.icon(slot4) ~= "" then
		local icon = Node(slot4)
		slot8 = managers.database
		local path_len = string.len("icon")
		slot8 = "name"
		slot13 = node

		icon.set_parameter(managers.database.base_path(slot7) .. "core\\lib\\utils\\dev\\ews\\images\\", icon, string.sub(slot10, node.icon(path_len + 1)))

		slot8 = icon

		cfg_node.add_child(managers.database.base_path(slot7) .. "core\\lib\\utils\\dev\\ews\\images\\", cfg_node)
	end

	return 
end
function ScriptGraph:_write_connections(slot_node, slot, node, id_map)
	slot8 = slot
	local con_info = node.connection_info(slot6, node)
	slot8 = con_info

	for _, inf in pairs(node) do

		-- Decompilation error in this vicinity:
		local dest = inf.node
		local dest_slots = inf.slots
		slot16 = dest_slots

		for _, dest_slot in ipairs(slot15) do
			local con_node = Node(slot20)
			slot24 = id

			con_node.set_parameter("connection", con_node, "id")

			slot24 = dest_slot

			con_node.set_parameter("connection", con_node, "slot")

			slot24 = ""

			con_node.set_parameter("connection", con_node, "desc")

			slot23 = con_node

			slot_node.add_child("connection", slot_node)
		end
	end

	return 
end
function ScriptGraph:_write_output_color(slot_node, slot, node)
	slot7 = slot
	local r, g, b = node.output_colour(slot5, node)
	slot13 = "color"
	slot14 = b

	self._write_output_color_to_node(slot8, self, slot_node, Node(slot12), r, g)

	return 
end
function ScriptGraph:_write_input_color(slot_node, slot, node)
	return 
end
function ScriptGraph:_write_output_color_to_node(slot_node, color_node, r, g, b)
	slot9 = "r"
	slot14 = r

	color_node.set_parameter(slot7, color_node, tostring(assert(slot13)))

	slot9 = "g"
	slot14 = g

	color_node.set_parameter(slot7, color_node, tostring(assert(slot13)))

	slot9 = "b"
	slot14 = b

	color_node.set_parameter(slot7, color_node, tostring(assert(slot13)))

	slot9 = color_node

	slot_node.add_child(slot7, slot_node)

	return 
end
function ScriptGraph:_write_node_color(cfg_node, node)
	local color_node = Node(slot4)
	slot7 = "r"
	slot14 = node

	color_node.set_parameter("color", color_node, tostring(assert(node.r(slot13))))

	slot7 = "g"
	slot14 = node

	color_node.set_parameter("color", color_node, tostring(assert(node.g(slot13))))

	slot7 = "b"
	slot14 = node

	color_node.set_parameter("color", color_node, tostring(assert(node.b(slot13))))

	slot7 = color_node

	cfg_node.add_child("color", cfg_node)

	return 
end
function ScriptGraph:_write_slots(cfg_node, node, id_map)
	slot6 = node

	if node.type(slot5) == "FlowNode" then
		slot8 = node

		for _, slot in ipairs(node.inputs(slot7)) do
			local slot_node = Node(slot10)
			slot14 = slot

			slot_node.set_parameter("slot", slot_node, "name")

			slot14 = "in"

			slot_node.set_parameter("slot", slot_node, "type")

			slot16 = id_map

			self._write_connections("slot", self, slot_node, slot, node)

			slot15 = node

			self._write_input_color("slot", self, slot_node, slot)

			slot13 = slot_node

			cfg_node.add_child("slot", cfg_node)
		end

		slot8 = node

		for _, slot in ipairs(node.outputs(slot7)) do
			local slot_node = Node(slot10)
			slot14 = slot

			slot_node.set_parameter("slot", slot_node, "name")

			slot14 = "out"

			slot_node.set_parameter("slot", slot_node, "type")

			slot16 = id_map

			self._write_connections("slot", self, slot_node, slot, node)

			slot15 = node

			self._write_output_color("slot", self, slot_node, slot)

			slot13 = slot_node

			cfg_node.add_child("slot", cfg_node)
		end
	end

	return 
end

return 
