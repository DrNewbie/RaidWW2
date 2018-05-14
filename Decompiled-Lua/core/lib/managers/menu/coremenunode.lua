-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuNode"

core.module(slot1, core)

slot3 = "CoreSerialize"

core.import(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemToggle"

core.import(slot1, core)

MenuNode = MenuNode or class()
function MenuNode:init(data_node)
	local parameters = {}
	slot5 = data_node

	for key, value in pairs(slot4) do
		if key ~= "_meta" then
			slot10 = value

			if type(slot9) ~= "table" then
				parameters[key] = value
			end
		end
	end

	if parameters.modifier then
		slot6 = " "
		local modifier_names = string.split(slot4, parameters.modifier)
		parameters.modifier = {}

		for i = 1, #modifier_names, 1 do
			slot10 = "return " .. modifier_names[i] .. ":new()"
			local modifier_instance = 
			-- Decompilation error in this vicinity:
			loadstring(slot9)()
			slot14 = "modify_node"
			parameters.modifier[i] = callback(modifier_names[i], modifier_instance, modifier_instance)
		end
	end

	if parameters.refresh then
		slot6 = " "
		local refresh_names = string.split(slot4, parameters.refresh)
		parameters.refresh = {}

		for i = 1, #refresh_names, 1 do
			slot10 = "return " .. refresh_names[i] .. ":new()"
			local refresh_instance = 
			-- Decompilation error in this vicinity:
			loadstring(slot9)()
			slot14 = "refresh_node"
			parameters.refresh[i] = callback(refresh_names[i], refresh_instance, refresh_instance)
		end
	end

	if parameters.update then
		slot6 = " "
		local update_names = string.split(slot4, parameters.update)
		parameters.update = {}

		for i = 1, #update_names, 1 do
			slot10 = "return " .. update_names[i] .. ":new()"
			local update_instance = 
			-- Decompilation error in this vicinity:
			loadstring(slot9)()
			slot14 = "update_node"
			parameters.update[i] = callback(update_names[i], update_instance, update_instance)
		end
	end

	if parameters.back_callback then
		slot6 = " "
		parameters.back_callback = string.split(slot4, parameters.back_callback)
	else
		parameters.back_callback = {}
	end

	if parameters.back_callback then
		parameters.back_callback_name = parameters.back_callback
		parameters.back_callback = {}
	end

	if parameters.focus_changed_callback then
		slot6 = " "
		parameters.focus_changed_callback = string.split(slot4, parameters.focus_changed_callback)
	else
		parameters.focus_changed_callback = {}
	end

	if parameters.focus_changed_callback then
		parameters.focus_changed_callback_name = parameters.focus_changed_callback
		parameters.focus_changed_callback = {}
	end

	if parameters.menu_components then
		slot6 = " "
		parameters.menu_components = string.split(slot4, parameters.menu_components)
	end

	slot6 = parameters

	self.set_parameters(slot4, self)

	slot6 = data_node

	self._parse_items(slot4, self)

	self._selected_item = nil

	return 
end
function MenuNode:_parse_items(data_node)
	self._items = {}
	self._legends = {}
	slot4 = data_node

	for _, c in ipairs(slot3) do
		local type = c._meta

		if type == "item" then
			slot11 = c
			local item = self.create_item(slot9, self)
			slot12 = item

			self.add_item(self, self)
		elseif type == "default_item" then
			self._default_item_name = c.name
		elseif type == "legend" then
			slot11 = {
				string_id = c.name,
				pc = c.pc,
				visible_callback = c.visible_callback
			}

			table.insert(slot9, self._legends)
		end
	end

	return 
end
function MenuNode:update(t, dt)
	return 
end
function MenuNode:clean_items()
	self._items = {}

	return 
end
function MenuNode:create_item(data_node, parameters)
	local item = CoreMenuItem.Item

	if data_node then
		local type = data_node.type

		if type then
			item_type = type
			slot7 = item_type
			item = CoreSerialize.string_to_classtable(slot6)
		end
	end

	slot8 = parameters
	item = item.new(slot5, item, data_node)

	return item
end
function MenuNode:default_item_name()
	return self._default_item_name
end
function MenuNode:set_default_item_name(default_item_name)
	self._default_item_name = default_item_name

	return 
end
function MenuNode:parameters()
	return self._parameters
end
function MenuNode:set_parameters(parameters)
	self._parameters = parameters

	return 
end
function MenuNode:add_item(item)
	slot6 = "item_dirty"
	item.dirty_callback = callback(slot3, self, self)

	if self.callback_handler then
		slot5 = self.callback_handler

		item.set_callback_handler(slot3, item)
	end

	local last = self._items[#self._items]

	if last then
		slot5 = last

		if not last.parameters(slot4).back then
			slot5 = last
			local is_back = last.parameters(slot4).last_item
		end
	end

	if is_back then
		slot8 = item

		table.insert(slot5, self._items, #self._items)
	else
		slot7 = item

		table.insert(slot5, self._items)
	end

	return 
end
function MenuNode:insert_item(item, i)
	slot7 = "item_dirty"
	item.dirty_callback = callback(slot4, self, self)

	if self.callback_handler then
		slot6 = self.callback_handler

		item.set_callback_handler(slot4, item)
	end

	slot7 = item

	table.insert(slot4, self._items, i)

	return 
end
function MenuNode:delete_item(item_name)
	slot6 = self

	for i, item in ipairs(self.items(slot5)) do
		slot9 = item

		if item.parameters(slot8).name == item_name then
			slot9 = self

			if item == self.selected_item(slot8) then
				self._selected_item = nil
			end

			slot10 = i
			local del_item = table.remove(slot8, self._items)
			slot10 = del_item

			del_item.on_delete_item(self._items)

			return del_item
		end
	end

	return 
end
function MenuNode:item(item_name)
	item_name = item_name or self._default_item_name
	local item = nil
	slot7 = self

	for _, i in ipairs(self.items(slot6)) do
	end

	return item
end
function MenuNode:items()
	return self._items
end
function MenuNode:set_items(items)
	self._items = items

	return 
end
function MenuNode:selected_item()
	return self._selected_item
end
function MenuNode:select_item(item_name)

	-- Decompilation error in this vicinity:
	if not item_name then
		slot4 = self

		if self.item(slot3) then
			slot4 = self
			slot4 = self.item(slot3)

			if not self.item(slot3).visible(slot3) then
				slot6 = self

				for i, item in ipairs(self.items(slot5)) do
					slot9 = item

					if item.visible(slot8) then
						slot9 = item
						self._default_item_name = item.name(slot8)

						break
					end
				end
			end
		end
	end

	slot5 = item_name
	self._selected_item = self.item(slot3, self)

	return 
end
function MenuNode:set_callback_handler(callback_handler)
	self.callback_handler = callback_handler
	slot4 = self._parameters.back_callback_name

	for _, callback_name in pairs(slot3) do
		slot9 = self._parameters.back_callback
		slot14 = callback_name

		table.insert(slot8, callback(slot11, callback_handler, callback_handler))
	end

	slot4 = self._parameters.focus_changed_callback_name

	for _, callback_name in pairs(slot3) do
		slot9 = self._parameters.focus_changed_callback
		slot14 = callback_name

		table.insert(slot8, callback(slot11, callback_handler, callback_handler))
	end

	slot4 = self._items

	for _, item in ipairs(slot3) do
		slot10 = callback_handler

		item.set_callback_handler(slot8, item)
	end

	return 
end
function MenuNode:trigger_back()
	slot3 = self

	if self.parameters(slot2).block_back then
		return true
	end

	local block_back = nil
	slot6 = self
	slot4 = self.parameters(slot5).back_callback

	for _, callback in pairs(slot3) do
		if not block_back then
			slot9 = self
			block_back = callback(slot8)
		end
	end

	return block_back
end
function MenuNode:trigger_focus_changed(in_focus, ...)
	slot6 = self
	slot4 = self.parameters(slot5).focus_changed_callback

	for _, callback in pairs(slot3) do
		slot10 = in_focus

		callback(slot8, self, ...)
	end

	return 
end
function MenuNode:item_dirty(item)
	if self.dirty_callback then
		slot5 = item

		self.dirty_callback(slot3, self)
	end

	return 
end
function MenuNode:legends()
	return self._legends
end

return 
