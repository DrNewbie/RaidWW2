slot3 = "CoreMenuLogic"

core.module(slot1, core)

Logic = Logic or class()
function Logic:init(menu_data)
	self._data = menu_data
	self._node_stack = {}
	self._callback_map = {
		renderer_show_node = nil,
		renderer_refresh_node_stack = nil,
		renderer_refresh_node = nil,
		renderer_update_node = nil,
		renderer_select_item = nil,
		renderer_deselect_item = nil,
		renderer_trigger_item = nil,
		renderer_navigate_back = nil,
		renderer_node_item_dirty = nil,
		input_accept_input = nil,
		menu_manager_menu_closed = nil,
		menu_manager_select_node = nil
	}
	self._action_queue = {}
	self._action_callback_map = {}
	slot7 = "_select_node"
	self._action_callback_map.select_node = callback(slot4, self, self)
	slot7 = "_navigate_back"
	self._action_callback_map.navigate_back = callback(slot4, self, self)
	slot7 = "_select_item"
	self._action_callback_map.select_item = callback(slot4, self, self)
	slot7 = "_trigger_item"
	self._action_callback_map.trigger_item = callback(slot4, self, self)
	slot7 = "_refresh_node"
	self._action_callback_map.refresh_node = callback(slot4, self, self)
	slot7 = "_refresh_node_stack"
	self._action_callback_map.refresh_node_stack = callback(slot4, self, self)
	slot7 = "_update_node"
	self._action_callback_map.update_node = callback(slot4, self, self)

	return 
end
function Logic:open(...)
	slot3 = managers.system_menu
	self._accept_input = not managers.system_menu.is_active(slot2)
	slot5 = true

	self.select_node(slot2, self, nil)

	return 
end
function Logic:_queue_action(action_name, ...)
	slot5 = {
		action_name = action_name,
		parameters = {
			...
		}
	}

	table.insert(slot3, self._action_queue)

	return 
end
function Logic:_execute_action_queue()
	while self._accept_input and 0 < #self._action_queue do
		local action = self._action_queue[1]

		if self._action_callback_map[action.action_name] then
			slot6 = action.parameters

			self._action_callback_map[action.action_name](unpack(slot5))
		end

		slot5 = 1

		table.remove(slot3, self._action_queue)
	end

	return 
end
function Logic:update(t, dt)
	slot5 = self

	if self.selected_node(slot4) then
		slot5 = self
		slot7 = dt

		self.selected_node(slot4).update(slot4, self.selected_node(slot4), t)
	end

	slot5 = self

	self._execute_action_queue(slot4)

	return 
end
function Logic:select_node(node_name, queue, ...)
	if self._accept_input or queue then
		slot7 = node_name

		self._queue_action(slot4, self, "select_node", ...)
	end

	return 
end
function Logic:_select_node(node_name, ...)
	slot5 = node_name
	local node = self.get_node(slot3, self, ...)
	local has_active_menu = (managers.menu._open_menus and 0 < #managers.menu._open_menus and true) or false

	if has_active_menu and node then
		slot6 = self
		local selected_node = self.selected_node(slot5)

		if selected_node then
			slot8 = false

			selected_node.trigger_focus_changed(slot6, selected_node)
		end

		slot8 = true

		node.trigger_focus_changed(slot6, node, ...)

		slot7 = node

		if node.parameters(slot6).menu_components then
			slot10 = node

			managers.menu_component.set_active_components(slot6, managers.menu_component, node.parameters(node).menu_components)
		end

		slot8 = node

		table.insert(slot6, self._node_stack)

		slot9 = node

		self._call_callback(slot6, self, "renderer_show_node")

		slot7 = node

		node.select_item(slot6)

		slot8 = "renderer_select_item"
		slot11 = node

		self._call_callback(slot6, self, node.selected_item(slot10))

		slot9 = node

		self._call_callback(slot6, self, "menu_manager_select_node")
	end

	return 
end
function Logic:refresh_node_stack(queue, ...)
	slot5 = "refresh_node_stack"

	self._queue_action(slot3, self, ...)

	return 
end
function Logic:_refresh_node_stack(...)
	slot3 = self._node_stack

	for i, node in ipairs(slot2) do
		slot8 = node

		if node.parameters(slot7).refresh then
			slot10 = node
			slot8 = node.parameters(slot9).refresh

			for _, refresh_func in ipairs(slot7) do
				slot13 = node
				node = refresh_func(slot12, ...)
			end
		end

		slot8 = node
		local selected_item = node.selected_item(slot7)
		slot9 = node
		slot7 = node.select_item

		if selected_item then
			slot12 = selected_item
			slot10 = selected_item.name(slot11)
		end

		slot7(slot8, slot9)
	end

	slot4 = "renderer_refresh_node_stack"

	self._call_callback(slot2, self)

	return 
end
function Logic:refresh_node(node_name, queue, ...)
	slot7 = node_name

	self._queue_action(slot4, self, "refresh_node", ...)

	return 
end
function Logic:_refresh_node(node_name, ...)
	slot4 = self
	local node = self.selected_node(slot3)

	if node then
		slot5 = node

		if node.parameters(slot4).refresh then
			slot7 = node
			slot5 = node.parameters(slot6).refresh

			for _, refresh_func in ipairs(slot4) do
				slot10 = node
				node = refresh_func(slot9, ...)
			end
		end
	end

	if node then
		slot7 = node

		self._call_callback(slot4, self, "renderer_refresh_node")

		slot5 = node
		local selected_item = node.selected_item(slot4)
		slot6 = node
		slot4 = node.select_item

		if selected_item then
			slot9 = selected_item
			slot7 = selected_item.name(slot8)
		end

		slot4(slot5, slot6)

		slot7 = "renderer_select_item"
		slot10 = node

		self._call_callback(slot5, self, node.selected_item(slot9))
	end

	return 
end
function Logic:update_node(node_name, queue, ...)
	slot7 = node_name

	self._queue_action(slot4, self, "update_node", ...)

	return 
end
function Logic:_update_node(node_name, ...)
	slot4 = self
	local node = self.selected_node(slot3)

	if node then
		slot5 = node

		if node.parameters(slot4).update then
			slot7 = node
			slot5 = node.parameters(slot6).update

			for _, update_func in ipairs(slot4) do
				slot10 = node
				node = update_func(slot9, ...)
			end
		end
	else
		slot6 = "[CoreLogic:_update_node] Trying to update selected node, but none is selected!"

		Application.error(slot4, Application)
	end

	return 
end
function Logic:navigate_back(queue, skip_nodes)
	if self._accept_input or queue then
		slot7 = skip_nodes

		self._queue_action(slot4, self, "navigate_back")
	end

	return 
end
function Logic:_navigate_back(skip_nodes)
	local node = self._node_stack[#self._node_stack]

	if node then
		slot5 = node

		if node.trigger_back(slot4) then
			return 
		end

		slot6 = false

		node.trigger_focus_changed(slot4, node)
	end

	slot5 = skip_nodes
	skip_nodes = (type(slot4) == "number" and skip_nodes) or 0

	if 1 + skip_nodes < #self._node_stack then
		for i = 1, 1 + skip_nodes, 1 do
			slot10 = #self._node_stack

			table.remove(slot8, self._node_stack)

			slot10 = "renderer_navigate_back"

			self._call_callback(slot8, self)
		end

		node = self._node_stack[#self._node_stack]

		if node then
			slot6 = true

			node.trigger_focus_changed(slot4, node)

			slot5 = node

			if node.parameters(slot4).menu_components then
				slot8 = node

				managers.menu_component.set_active_components(slot4, managers.menu_component, node.parameters(node).menu_components)
			end
		end
	end

	slot7 = node

	self._call_callback(slot4, self, "menu_manager_select_node")

	return 
end
function Logic:soft_open()
	local node = self._node_stack[#self._node_stack]

	if node then
		slot4 = node

		if node.parameters(slot3).menu_components then
			slot7 = node

			managers.menu_component.set_active_components(slot3, managers.menu_component, node.parameters(node).menu_components)
		end

		slot6 = node

		self._call_callback(slot3, self, "menu_manager_select_node")
	end

	return 
end
function Logic:selected_node()
	return self._node_stack[#self._node_stack]
end
function Logic:selected_node_name()
	slot3 = self
	slot3 = self.selected_node(slot2)

	return self.selected_node(slot2).parameters(slot2).name
end
function Logic:select_item(item_name, queue)
	if self._accept_input or queue then
		slot7 = item_name

		self._queue_action(slot4, self, "select_item")
	end

	return 
end
function Logic:mouse_over_select_item(item_name, queue)
	if self._accept_input or queue then
		slot8 = true

		self._queue_action(slot4, self, "select_item", item_name)
	end

	return 
end
function Logic:_select_item(item_name, mouse_over)
	slot5 = self
	local current_node = self.selected_node(slot4)

	if current_node then
		slot6 = current_node
		local current_item = current_node.selected_item(slot5)

		if current_item then
			slot9 = current_item

			self._call_callback(slot6, self, "renderer_deselect_item")
		end

		slot8 = item_name

		current_node.select_item(slot6, current_node)

		slot11 = current_node

		self._call_callback(slot6, self, "renderer_select_item", current_node.selected_item(mouse_over))
	end

	return 
end
function Logic:trigger_item(queue, item)
	if self._accept_input or queue then
		slot7 = item

		self._queue_action(slot4, self, "trigger_item")
	end

	return 
end
function Logic:_trigger_item(item)
	if not item then
		slot4 = self
		item = self.selected_item(slot3)
	end

	if item then
		slot4 = item

		item.trigger(slot3)

		slot6 = item

		self._call_callback(slot3, self, "renderer_trigger_item")
	end

	return 
end
function Logic:selected_item()
	local item = nil
	slot4 = self
	local node = self.selected_node(slot3)

	if node then
		slot5 = node
		item = node.selected_item(slot4)
	end

	return item
end
function Logic:get_item(name)
	local item = nil
	slot5 = self
	local node = self.selected_node(slot4)

	if node then
		slot7 = name
		item = node.item(slot5, node)
	end

	return item
end
function Logic:get_node(node_name, ...)
	slot5 = node_name
	local node = self._data.get_node(slot3, self._data, ...)

	if node and not node.dirty_callback then
		slot7 = "node_item_dirty"
		node.dirty_callback = callback(slot4, self, self)
	end

	return node
end
function Logic:accept_input(accept)
	self._accept_input = accept
	slot6 = accept

	self._call_callback(slot3, self, "input_accept_input")

	return 
end
function Logic:register_callback(id, callback)
	self._callback_map[id] = callback

	return 
end
function Logic:_call_callback(id, ...)
	if self._callback_map[id] then
		self._callback_map[id](...)
	else
		slot5 = "Logic:_call_callback: Callback " .. id .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
function Logic:node_item_dirty(node, item)
	slot8 = item

	self._call_callback(slot4, self, "renderer_node_item_dirty", node)

	return 
end
function Logic:renderer_closed()
	slot4 = "menu_manager_menu_closed"

	self._call_callback(slot2, self)

	return 
end
function Logic:close(closing_menu)
	local selected_node = self.selected_node(slot3)
	slot6 = {}

	managers.menu_component.set_active_components(self, managers.menu_component)

	self._action_queue = {}

	for index = #self._node_stack, 1, -1 do
		local node = self._node_stack[index]

		if not closing_menu and node then
			slot10 = node

			node.trigger_back(slot9)
		end
	end

	self._node_stack = {}
	slot7 = false

	self._call_callback(slot4, self, "menu_manager_select_node")

	return 
end

return 
