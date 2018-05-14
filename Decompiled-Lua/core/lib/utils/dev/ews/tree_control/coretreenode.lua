slot2 = "core/lib/utils/dev/ews/tree_control/CoreBaseTreeNode"

require(slot1)

if not CoreTreeNode then
	slot2 = CoreBaseTreeNode
	slot0 = class(slot1)
end

CoreTreeNode = slot0
function CoreTreeNode:init(text)
	self._text = text or ""
	self._parent = nil
	self._children = {}

	return 
end
function CoreTreeNode:set_callback(event_name, func)
	self._callbacks = self._callbacks or {}
	self._callbacks[event_name] = func

	return 
end
function CoreTreeNode:_invoke_callback(event_name, ...)
	local callback_table = self._callbacks

	if not callback_table then
		return 
	end

	local callback = callback_table[event_name]

	if callback then
		callback(...)
	end

	return 
end
function CoreTreeNode:text()
	return self._text
end
function CoreTreeNode:parent()
	if self._parent and self._parent._parent then
		return self._parent
	end

	return 
end
function CoreTreeNode:remove_children()
	slot3 = self

	return self.super.remove_children(slot2)
end
function CoreTreeNode:children()
	return self._children
end
function CoreTreeNode:append(text)
	slot5 = text
	local new_node = CoreTreeNode.new(slot3, CoreTreeNode)
	new_node._callbacks = self._callbacks
	new_node._parent = self
	slot6 = new_node

	table.insert(CoreTreeNode, self._children)

	slot7 = new_node

	self._invoke_callback(CoreTreeNode, self, "on_append")

	return new_node
end
function CoreTreeNode:remove()
	slot5 = self

	self._invoke_callback(slot2, self, "on_remove")

	if self._parent then
		slot4 = self

		table.delete(slot2, self._parent._children)
	end

	self._text = ""
	self._parent = nil
	self._children = {}

	return 
end

return 
