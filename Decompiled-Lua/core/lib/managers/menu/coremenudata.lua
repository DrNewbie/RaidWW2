slot3 = "CoreMenuData"

core.module(slot1, core)

slot3 = "CoreMenuNode"

core.import(slot1, core)

slot3 = "CoreSerialize"

core.import(slot1, core)

Data = Data or class()
function Data:init()
	self._nodes = {}

	return 
end
function Data:get_node(node_name, ...)
	local node = nil

	if node_name then
		node = self._nodes[node_name]

		if not node then
			slot6 = "Data:get_node(): No node named '" .. node_name .. "'"

			Application.error(slot4, Application)

			return nil
		end
	else
		node = self._default_node_name and self._nodes[self._default_node_name]

		if not node then
			slot6 = "Data:get_node(): No default node"

			Application.error(slot4, Application)

			return nil
		end
	end

	slot5 = node

	if node.parameters(slot4).modifier then
		slot7 = node
		slot5 = node.parameters(slot6).modifier

		for _, modify_func in ipairs(slot4) do
			slot10 = node
			node = modify_func(slot9, ...)
		end
	end

	return node
end
function Data:load_data(file_path, menu_id)
	slot9 = file_path
	local root = PackageManager.script_data(slot4, PackageManager, file_path.id("menu"))
	local menu = nil
	slot7 = root

	for _, c in ipairs(Idstring(slot7)) do
		if c._meta == "menu" and c.id and c.id == menu_id then
			menu = c

			break
		end
	end

	if not menu then
		slot8 = "Data:load_data(): No menu with id '" .. menu_id .. "' in '" .. file_path .. "'"

		Application.error(slot6, Application)

		return 
	end

	slot7 = menu

	for _, c in ipairs(slot6) do
		local type = c._meta

		if type == "node" then
			local node_class = CoreMenuNode.MenuNode
			local type = c.type

			if type then
				slot15 = type
				node_class = CoreSerialize.string_to_classtable(slot14)
			end

			local name = c.name

			if name then
				slot18 = c
				self._nodes[name] = node_class.new(slot16, node_class)
			else
				slot17 = "Menu node without name in '" .. menu_id .. "' in '" .. file_path .. "'"

				Application.error(slot15, Application)
			end
		elseif type == "default_node" then
			self._default_node_name = c.name
		end
	end

	return 
end
function Data:set_callback_handler(callback_handler)
	slot4 = self._nodes

	for name, node in pairs(slot3) do
		slot10 = callback_handler

		node.set_callback_handler(slot8, node)
	end

	return 
end

return 
