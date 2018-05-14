slot2 = "core/lib/utils/dev/ews/tree_control/CoreManagedTreeControl"

require(slot1)

slot2 = "core/lib/utils/dev/ews/tree_control/CoreTreeNode"

require(slot1)

if not CoreFilteredTreeControl then
	slot2 = CoreManagedTreeControl
	slot0 = class(slot1)
end

CoreFilteredTreeControl = slot0
function CoreFilteredTreeControl:init(parent_frame, styles)
	slot7 = styles

	self.super.init(slot4, self, parent_frame)

	slot5 = CoreTreeNode
	self._virtual_root_node = CoreTreeNode.new(slot4)
	slot6 = "on_append"
	slot11 = "_on_node_appended"

	self._virtual_root_node.set_callback(slot4, self._virtual_root_node, callback(slot8, self, self))

	slot6 = "on_remove"
	slot11 = "_on_node_removed"

	self._virtual_root_node.set_callback(slot4, self._virtual_root_node, callback(slot8, self, self))

	self._filters = {}
	self._freeze_count = 0

	return 
end
function CoreFilteredTreeControl:add_filter(predicate)
	slot5 = predicate

	table.insert(slot3, self._filters)

	slot4 = self

	self.refresh_tree(slot3)

	return predicate
end
function CoreFilteredTreeControl:remove_filter(predicate)
	slot5 = predicate

	table.delete(slot3, self._filters)

	slot4 = self

	self.refresh_tree(slot3)

	return 
end
function CoreFilteredTreeControl:refresh_tree()
	if self._freeze_count ~= 0 then
		return 
	end

	slot3 = self

	self.freeze(slot2)

	slot3 = self

	self._view_tree_root(slot2).remove_children(slot2)

	local function append_to_visible_tree(child)
		slot4 = child

		if self._node_passes_filters(slot2, self) then
			slot3 = self
			slot3 = self._view_tree_root(slot2)
			slot6 = child

			self._view_tree_root(slot2).append_path(slot2, child.path(slot5))
		end

		return true
	end

	slot4 = self
	slot6 = true

	self._tree_root(self._view_tree_root(slot2)).for_each_child(self._view_tree_root(slot2), self._tree_root(self._view_tree_root(slot2)), append_to_visible_tree)

	slot5 = true

	self.thaw(self._view_tree_root(slot2), self)

	return 
end
function CoreFilteredTreeControl:_node_passes_filters(node)
	slot4 = self._filters

	for _, predicate in ipairs(slot3) do
		slot9 = node

		if not predicate(slot8) then
			return false
		end
	end

	return true
end
function CoreFilteredTreeControl:_on_node_appended(new_node)
	local visible_parent_node = self._view_tree_root(slot3)
	slot5 = new_node

	if new_node.parent(self) then
		slot5 = self
		slot5 = self._view_tree_root(slot4)
		slot8 = new_node
		slot8 = new_node.parent(slot7)
		visible_parent_node = self._view_tree_root(slot4).child_at_path(slot4, new_node.parent(slot7).path(slot7))
	end

	if visible_parent_node then
		slot6 = new_node

		if self._node_passes_filters(slot4, self) then
			slot6 = new_node

			visible_parent_node.append_copy_of_node(slot4, visible_parent_node)
		end
	end

	return 
end
function CoreFilteredTreeControl:_on_node_removed(removed_node)
	slot4 = self
	slot4 = self._view_tree_root(slot3)
	slot7 = removed_node
	local visible_node = self._view_tree_root(slot3).child_at_path(slot3, removed_node.path(slot6))

	if visible_node then
		slot5 = visible_node

		visible_node.remove(slot4)
	end

	return 
end
function CoreFilteredTreeControl:clear()
	slot3 = self

	self.super.clear(slot2)

	slot3 = self

	self.refresh_tree(slot2)

	return 
end
function CoreFilteredTreeControl:_tree_root()
	return self._virtual_root_node
end
function CoreFilteredTreeControl:freeze()
	if self._freeze_count == 0 then
		slot3 = self

		self.super.freeze(slot2)
	end

	self._freeze_count = self._freeze_count + 1

	return 
end
function CoreFilteredTreeControl:thaw(already_refreshed)
	self._freeze_count = self._freeze_count - 1

	if self._freeze_count == 0 then
		if not already_refreshed then
			slot4 = self

			self.refresh_tree(slot3)
		end

		slot4 = self

		self.super.thaw(slot3)
	end

	return 
end

return 
