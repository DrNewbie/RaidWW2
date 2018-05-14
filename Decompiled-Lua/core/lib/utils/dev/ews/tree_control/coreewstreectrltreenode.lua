slot2 = "core/lib/utils/dev/ews/tree_control/CoreBaseTreeNode"

require(slot1)

if not CoreEWSTreeCtrlTreeNode then
	slot2 = CoreBaseTreeNode
	slot0 = class(slot1)
end

CoreEWSTreeCtrlTreeNode = slot0
function CoreEWSTreeCtrlTreeNode:init(ews_tree_ctrl, item_id, checkbox_style)
	self._checkbox_style = checkbox_style
	slot7 = "nil argument supplied as ews_tree_ctrl"
	self._tree_ctrl = assert(slot5, ews_tree_ctrl)
	slot7 = "nil argument supplied as item_id"
	self._item_id = assert(slot5, item_id)
	slot7 = 0

	self.set_state(slot5, self)

	return 
end
function CoreEWSTreeCtrlTreeNode:id()
	return self._item_id
end
function CoreEWSTreeCtrlTreeNode:expand(recurse)
	slot5 = self._item_id

	self._tree_ctrl.expand(slot3, self._tree_ctrl)

	if recurse then
		slot6 = self

		for _, child in ipairs(self.children(slot5)) do
			slot10 = true

			child.expand(slot8, child)
		end
	end

	return 
end
function CoreEWSTreeCtrlTreeNode:collapse(recurse)
	slot5 = self._item_id

	self._tree_ctrl.collapse(slot3, self._tree_ctrl)

	if recurse then
		slot6 = self

		for _, child in ipairs(self.children(slot5)) do
			slot10 = true

			child.collapse(slot8, child)
		end
	end

	return 
end
function CoreEWSTreeCtrlTreeNode:set_selected(state)
	if state == nil then
		state = true
	end

	slot6 = state

	self._tree_ctrl.select_item(slot3, self._tree_ctrl, self._item_id)

	return 
end
function CoreEWSTreeCtrlTreeNode:state(state)
	if self._checkbox_style then
		slot6 = "NORMAL"

		return self._tree_ctrl.get_item_image(slot3, self._tree_ctrl, self._item_id)
	else
		return 0
	end

	return 
end
function CoreEWSTreeCtrlTreeNode:set_state(state)
	if self._checkbox_style then
		slot5 = state

		self._change_state(slot3, self)
	end

	return 
end
function CoreEWSTreeCtrlTreeNode:checkbox_style()
	return self._checkbox_style
end
function CoreEWSTreeCtrlTreeNode:set_checkbox_style(style)
	self._checkbox_style = style

	return 
end
function CoreEWSTreeCtrlTreeNode:set_image(image, item_state)
	slot8 = item_state or "NORMAL"

	self._tree_ctrl.set_item_image(slot4, self._tree_ctrl, self._item_id, image)

	return 
end
function CoreEWSTreeCtrlTreeNode:get_image(item_state)
	slot6 = item_state or "NORMAL"

	return self._tree_ctrl.get_item_image(slot3, self._tree_ctrl, self._item_id)
end
function CoreEWSTreeCtrlTreeNode:_change_state(state)
	slot7 = "NORMAL"

	self._tree_ctrl.set_item_image(slot3, self._tree_ctrl, self._item_id, state)

	return 
end
function CoreEWSTreeCtrlTreeNode:text()
	slot4 = self._item_id

	return self._tree_ctrl.get_item_text(slot2, self._tree_ctrl)
end
function CoreEWSTreeCtrlTreeNode:parent()
	slot4 = self._item_id
	local parent_id = self._tree_ctrl.get_parent(slot2, self._tree_ctrl)

	if parent_id ~= -1 then
		slot5 = parent_id

		if self._tree_ctrl.get_parent(slot3, self._tree_ctrl) ~= -1 then
			slot7 = self._checkbox_style

			return CoreEWSTreeCtrlTreeNode.new(slot3, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, parent_id)
		end
	end

	return 
end
function CoreEWSTreeCtrlTreeNode:children()
	slot6 = self._item_id

	function slot4(child_id)
		slot6 = self._checkbox_style

		return CoreEWSTreeCtrlTreeNode.new(slot2, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, child_id)
	end

	return table.collect(slot2, self._tree_ctrl.get_children(slot4, self._tree_ctrl))
end
function CoreEWSTreeCtrlTreeNode:append(text)
	slot10 = text
	slot7 = self._checkbox_style

	return CoreEWSTreeCtrlTreeNode.new(slot3, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, self._tree_ctrl.append(slot7, self._tree_ctrl, self._item_id))
end
function CoreEWSTreeCtrlTreeNode:remove()
	slot4 = self._item_id

	self._tree_ctrl.remove(slot2, self._tree_ctrl)

	return 
end
function CoreEWSTreeCtrlTreeNode:has_children()
	slot6 = self._item_id

	return 0 < table.getn(self._tree_ctrl.get_children(slot4, self._tree_ctrl))
end

return 
