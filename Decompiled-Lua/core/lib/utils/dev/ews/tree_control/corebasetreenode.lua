CoreBaseTreeNode = CoreBaseTreeNode or class()
function CoreBaseTreeNode:path(separator)
	separator = separator or "/"
	slot4 = self
	local parent = self.parent(slot3)

	if parent then
		slot5 = parent
		slot7 = self

		return parent.path(slot4) .. separator .. self.text(slot6)
	end

	slot5 = self

	return self.text(slot4)
end
function CoreBaseTreeNode:has_children()
	slot5 = self

	return 0 < table.getn(self.children(slot4))
end
function CoreBaseTreeNode:child(text, separator)
	slot7 = self

	for _, child in ipairs(self.children(slot6)) do
		slot10 = child

		if child.text(slot9) == text then
			return child
		end
	end

	return 
end
function CoreBaseTreeNode:child_at_path(path, separator)
	separator = separator or "/"
	slot8 = 1
	local first_path_component, remaining_path = string.split(slot4, path, separator, false)
	slot8 = first_path_component
	local child = self.child(separator, self)

	if child and remaining_path then
		slot10 = separator

		return child.child_at_path(slot7, child, remaining_path)
	end

	return child
end
function CoreBaseTreeNode:append_path(path, separator)
	separator = separator or "/"
	slot10 = 1
	local first_path_component, remaining_path = unpack(string.split(slot6, path, separator, false))
	slot8 = first_path_component

	if not self.child(slot6, self) then
		slot8 = first_path_component
		local node = self.append(slot6, self)
	end

	if remaining_path then
		slot10 = separator

		return node.append_path(slot7, node, remaining_path)
	end

	return node
end
function CoreBaseTreeNode:append_copy_of_node(node, recurse)
	slot5 = self
	slot8 = node
	local new_node = self.append(slot4, node.text(slot7))

	if recurse then
		slot8 = node

		for _, child in ipairs(node.children(slot7)) do
			slot13 = true

			new_node.append_copy_of_node(slot10, new_node, child)
		end
	end

	return new_node
end
function CoreBaseTreeNode:for_each_child(func, recurse)
	slot9 = self

	for _, child in ipairs(table.list_copy(self.children(slot8))) do
		slot10 = child

		if not func(slot9) then
			break
		end

		if recurse then
			slot12 = true

			child.for_each_child(slot9, child, func)
		end
	end

	return 
end
function CoreBaseTreeNode:remove_children()
	slot7 = self

	for _, child in ipairs(table.list_copy(self.children(slot6))) do
		slot8 = child

		child.remove(slot7)
	end

	return 
end

return 
