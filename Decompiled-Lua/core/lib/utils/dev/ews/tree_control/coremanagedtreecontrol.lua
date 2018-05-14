-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = require
slot2 = "core/lib/utils/dev/ews/tree_control/CoreEWSTreeCtrlTreeNode"

slot0(slot1)

slot0 = CoreManagedTreeControl

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreManagedTreeControl = slot0
slot0 = CoreManagedTreeControl
slot1 = "TR_HAS_CHECKBOX"
slot0.CHECKBOX_STYLE_STR = slot1
slot0 = CoreManagedTreeControl
slot1 = "EVT_COMMAND_TREE_CHECKBOX_UPDATED"
slot0.CHECKBOX_UPDATED_EVENT_NAME = slot1
slot0 = CoreManagedTreeControl
slot1 = CoreEWS
slot1 = slot1.image_path
slot3 = "tree_checkbox_unchecked_16x16.png"
slot1 = slot1(slot2)
slot0.CHECKBOX_STATE0_ICON = slot1
slot0 = CoreManagedTreeControl
slot1 = CoreEWS
slot1 = slot1.image_path
slot3 = "tree_checkbox_checked_16x16.png"
slot1 = slot1(slot2)
slot0.CHECKBOX_STATE1_ICON = slot1
slot0 = CoreManagedTreeControl

function slot1(self, parent_frame, styles)
	slot6 = styles or "TR_HAS_BUTTONS,TR_HIDE_ROOT,TR_LINES_AT_ROOT,TR_SINGLE"
	self._styles, self._checkbox_style = self._eat_checkbox_style(slot4, self)
	slot5 = EWS
	slot3 = EWS.TreeCtrl
	slot6 = parent_frame
	slot7 = ""
	slot8 = self._styles
	slot3 = slot3(slot4, slot5, slot6, slot7)
	self._tree_ctrl = slot3
	slot5 = self
	slot3 = self._init_checkbox_icons

	slot3(slot4)

	slot3 = self._checkbox_style

	if slot3 then
		slot3 = self._tree_ctrl
		slot5 = slot3
		slot3 = slot3.connect
		slot6 = ""
		slot7 = "EVT_LEFT_DOWN"
		slot8 = callback
		slot10 = self
		slot11 = self
		slot12 = "_change_state"
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = ""

		slot3(slot4, slot5, slot6, slot7, slot8)

		slot3 = self._tree_ctrl
		slot5 = slot3
		slot3 = slot3.connect
		slot6 = ""
		slot7 = "EVT_COMMAND_TREE_ITEM_GETTOOLTIP"
		slot8 = callback
		slot10 = self
		slot11 = self
		slot12 = "_tooltip"
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = ""

		slot3(slot4, slot5, slot6, slot7, slot8)
	end

	slot3 = CoreEWSTreeCtrlTreeNode
	slot5 = slot3
	slot3 = slot3.new
	slot6 = self._tree_ctrl
	slot7 = self._tree_ctrl
	slot9 = slot7
	slot7 = slot7.append_root
	slot10 = "hidden_root"
	slot7 = slot7(slot8, slot9)
	slot8 = self._checkbox_style
	slot3 = slot3(slot4, slot5, slot6, slot7)
	self._visible_root_node = slot3
	slot3 = {}
	self._tree_event_wrapper_map = slot3
	slot3 = {}
	self._custom_callbacks = slot3
	slot3 = {}
	self._tooltips = slot3

	return 
end

slot0.init = slot1
slot0 = CoreManagedTreeControl

function slot1(self, styles)
	local checkbox_style = false
	local ret = ""
	slot4 = string
	slot4 = slot4.gmatch
	slot6 = styles
	slot7 = "[%w_]+"
	slot4, slot5, slot6 = slot4(slot5, slot6)

	for style in slot4, slot5, slot6 do
		slot8 = self.CHECKBOX_STYLE_STR

		if style == slot8 then
			checkbox_style = true
		else
			slot8 = ret
			slot9 = ","
			slot10 = style
			ret = slot8 .. slot9 .. slot10
		end
	end

	slot4 = ret
	slot5 = checkbox_style

	return slot4, slot5
end

slot0._eat_checkbox_style = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._checkbox_style

	if slot1 then
		slot3 = self
		slot1 = self.set_image_list
		slot4 = EWS
		slot6 = slot4
		slot4 = slot4.ImageList
		slot7 = 16
		slot8 = 16
		slot9 = false

		slot1(slot2, slot4(slot5, slot6, slot7, slot8))

		slot1 = self._image_list
		slot3 = slot1
		slot1 = slot1.add
		slot4 = self.CHECKBOX_STATE0_ICON

		slot1(slot2, slot3)

		slot1 = self._image_list
		slot3 = slot1
		slot1 = slot1.add
		slot4 = self.CHECKBOX_STATE1_ICON

		slot1(slot2, slot3)
	end

	return 
end

slot0._init_checkbox_icons = slot1
slot0 = CoreManagedTreeControl

function slot1(self, data, event)
	slot3 = self._tree_ctrl
	slot5 = slot3
	slot3 = slot3.hit_test
	local id, hit = slot3(slot4)
	slot5 = -1

	if slot5 < id then
		if hit == "ONITEMICON" then
			slot5 = self._tree_ctrl
			slot7 = slot5
			slot5 = slot5.freeze

			slot5(slot6)

			slot5 = self._tree_ctrl
			slot7 = slot5
			slot5 = slot5.get_item_image
			slot8 = id
			slot9 = "NORMAL"
			local state = slot5(slot6, slot7, slot8)

			if state == 0 then
				state = 1
			elseif state == 1 then
				state = 0
			else
				slot6 = self._tree_ctrl
				slot8 = slot6
				slot6 = slot6.thaw

				slot6(slot7)

				slot6 = self._tree_ctrl
				slot8 = slot6
				slot6 = slot6.update

				slot6(slot7)

				return 
			end

			slot6 = self._tree_ctrl
			slot8 = slot6
			slot6 = slot6.set_item_image
			slot9 = id
			slot10 = state
			slot11 = "NORMAL"

			slot6(slot7, slot8, slot9, slot10)

			slot6 = self._tree_ctrl
			slot8 = slot6
			slot6 = slot6.thaw

			slot6(slot7)

			slot6 = self._tree_ctrl
			slot8 = slot6
			slot6 = slot6.update

			slot6(slot7)

			slot8 = self
			slot6 = self._find_and_do_custom_callback
			slot9 = self.CHECKBOX_UPDATED_EVENT_NAME
			slot10 = {
				_state = state,
				_id = id
			}

			slot6(slot7, slot8, slot9)

			return 
		elseif hit == "ONITEMBUTTON" then
			slot5 = self._tree_ctrl
			slot7 = slot5
			slot5 = slot5.is_expanded
			slot8 = id
			slot5 = slot5(slot6, slot7)

			if slot5 then
				slot5 = self._tree_ctrl
				slot7 = slot5
				slot5 = slot5.collapse
				slot8 = id

				slot5(slot6, slot7)
			else
				slot5 = self._tree_ctrl
				slot7 = slot5
				slot5 = slot5.expand
				slot8 = id

				slot5(slot6, slot7)
			end

			return 
		end
	end

	slot7 = event
	slot5 = event.skip

	slot5(slot6)

	return 
end

slot0._change_state = slot1
slot0 = CoreManagedTreeControl

function slot1(self, data, event)
	slot3 = self._tree_ctrl
	slot5 = slot3
	slot3 = slot3.hit_test
	local id, hit = slot3(slot4)
	slot5 = -1

	if slot5 < id and (hit == "ONITEMICON" or hit == "ONITEMLABEL") then
		slot11 = id
		slot8 = self._tooltips[tostring(slot10)] or ""

		event.set_tool_tip(slot6, event)
	end

	return 
end

slot0._tooltip = slot1
slot0 = CoreManagedTreeControl

function slot1(self, cb_type, data)
	slot3 = pairs
	slot5 = self._custom_callbacks
	slot3, slot4, slot5 = slot3(slot4)

	for k, v in slot3, slot4, slot5 do
		slot8 = v._event_type

		if slot8 == cb_type then
			slot8 = k
			slot10 = v._script_data
			slot11 = data

			slot8(slot9, slot10)
		end
	end

	return 
end

slot0._find_and_do_custom_callback = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._visible_root_node

	return slot1
end

slot0._view_tree_root = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._visible_root_node

	return slot1
end

slot0._tree_root = slot1
slot0 = CoreManagedTreeControl

function slot1(self, node, text)
	slot3 = self._tooltips
	slot4 = tostring
	slot6 = node._item_id
	slot4 = slot4(slot5)
	slot3[slot4] = text

	return 
end

slot0.set_tooltip = slot1
slot0 = CoreManagedTreeControl

function slot1(self, list)
	self._image_list = list
	slot2 = self._tree_ctrl
	slot4 = slot2
	slot2 = slot2.set_image_list
	slot5 = list

	slot2(slot3, slot4)

	return 
end

slot0.set_image_list = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._image_list

	return slot1
end

slot0.get_image_list = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot3 = self
	slot1 = self._tree_root
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove_children

	slot1(slot2)

	slot1 = pairs
	slot3 = self._custom_callbacks
	slot1, slot2, slot3 = slot1(slot2)

	for k, v in slot1, slot2, slot3 do
		slot6 = v._event_type
		slot7 = self.CHECKBOX_UPDATED_EVENT_NAME

		if slot6 == slot7 then
			slot6 = self._custom_callbacks
			slot7 = nil
			slot6[k] = slot7
		end
	end

	return 
end

slot0.clear = slot1
slot0 = CoreManagedTreeControl

function slot1(self, size)
	slot2 = self._tree_ctrl
	slot4 = slot2
	slot2 = slot2.set_size
	slot5 = size

	slot2(slot3, slot4)

	return 
end

slot0.set_size = slot1
slot0 = CoreManagedTreeControl

function slot1(self, size)
	slot2 = self._tree_ctrl
	slot4 = slot2
	slot2 = slot2.set_min_size
	slot5 = size

	slot2(slot3, slot4)

	return 
end

slot0.set_min_size = slot1
slot0 = CoreManagedTreeControl

function slot1(self, sizer, proportion, border, flags)
	slot7 = sizer
	slot5 = sizer.add
	slot8 = self._tree_ctrl
	slot9 = proportion
	slot10 = border
	slot11 = flags

	return slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.add_to_sizer = slot1
slot0 = CoreManagedTreeControl

function slot1(self, sizer)
	slot4 = sizer
	slot2 = sizer.detach
	slot5 = self._tree_ctrl

	return slot2(slot3, slot4)
end

slot0.detach_from_sizer = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._tree_ctrl
	slot3 = slot1
	slot1 = slot1.freeze

	return slot1(slot2)
end

slot0.freeze = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot1 = self._tree_ctrl
	slot3 = slot1
	slot1 = slot1.thaw

	return slot1(slot2)
end

slot0.thaw = slot1
slot0 = CoreManagedTreeControl

function slot1(self, item_text)
	slot4 = self
	slot2 = self._tree_root
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.append
	slot5 = item_text

	return slot2(slot3, slot4)
end

slot0.append = slot1
slot0 = CoreManagedTreeControl

function slot1(self, path)
	slot4 = self
	slot2 = self._tree_root
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.append_path
	slot5 = path

	return slot2(slot3, slot4)
end

slot0.append_path = slot1
slot0 = CoreManagedTreeControl

function slot1(self, node, recurse)
	slot5 = self
	slot3 = self._tree_root
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.append_copy_of_node
	slot6 = node
	slot7 = recurse

	return slot3(slot4, slot5, slot6)
end

slot0.append_copy_of_node = slot1
slot0 = CoreManagedTreeControl

function slot1(self, recurse)
	slot4 = self
	slot2 = self._view_tree_root
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.expand
	slot5 = recurse

	slot2(slot3, slot4)

	return 
end

slot0.expand = slot1
slot0 = CoreManagedTreeControl

function slot1(self, recurse)
	slot4 = self
	slot2 = self._view_tree_root
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.collapse
	slot5 = recurse

	slot2(slot3, slot4)

	return 
end

slot0.collapse = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot3 = self
	slot1 = self._tree_root
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.children

	return slot1(slot2)
end

slot0.root_nodes = slot1
slot0 = CoreManagedTreeControl

function slot1(self)
	slot3 = self
	slot1 = self._tree_root

	return slot1(slot2)
end

slot0.root_node = slot1
slot0 = CoreManagedTreeControl

function slot1(self, event_type, script_callback, script_data)
	slot4 = self.CHECKBOX_UPDATED_EVENT_NAME

	if event_type == slot4 then
		slot4 = self._custom_callbacks
		slot5 = {
			_event_type = event_type,
			_script_data = script_data
		}
		slot4[script_callback] = slot5
	else
		slot4 = string
		slot4 = slot4.begins
		slot6 = event_type
		slot7 = "EVT_COMMAND_TREE_"
		slot4 = slot4(slot5, slot6)

		if slot4 then
			local function tree_event_wrapper(data, event, ...)
				slot4 = event
				local event_metatable = getmetatable(slot3) or {}
				slot3 = setmetatable
				slot5 = {}
				slot6 = {}
				slot7 = event_metatable.__index
				slot6.__index = slot7
				local wrapped_event = slot3(slot4, slot5)
				slot6 = event
				slot4 = event.get_item
				local item_id = slot4(slot5)
				slot7 = event
				slot5 = event.get_old_item
				local old_item_id = slot5(slot6)

				function slot6()

					-- Decompilation error in this vicinity:
					slot0 = item_id
				end

				wrapped_event.get_item = slot6

				function slot6()

					-- Decompilation error in this vicinity:
					slot0 = old_item_id
				end

				wrapped_event.get_old_item = slot6
				slot6 = script_callback
				slot8 = data
				slot9 = wrapped_event

				return slot6(slot7, slot8, ...)
			end

			slot5 = self._tree_event_wrapper_map
			slot5 = slot5[script_callback]

			if not slot5 then
				slot5 = self._tree_event_wrapper_map
				slot5[script_callback] = tree_event_wrapper
				slot5 = self._tree_ctrl
				slot7 = slot5
				slot5 = slot5.connect
				slot8 = event_type
				slot9 = tree_event_wrapper
				slot10 = script_data

				slot5(slot6, slot7, slot8, slot9)
			end
		else
			slot4 = self._tree_ctrl
			slot6 = slot4
			slot4 = slot4.connect
			slot7 = event_type
			slot8 = script_callback
			slot9 = script_data

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	return 
end

slot0.connect = slot1
slot0 = CoreManagedTreeControl

function slot1(self, event_type, script_callback)
	slot3 = self.CHECKBOX_UPDATED_EVENT_NAME

	if event_type == slot3 then
		slot3 = self._custom_callbacks
		slot4 = nil
		slot3[script_callback] = slot4
	else
		slot3 = string
		slot3 = slot3.begins
		slot5 = event_type
		slot6 = "EVT_COMMAND_TREE_"
		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = self._tree_event_wrapper_map
			local resolved_wrapper = slot3[script_callback]

			if resolved_wrapper then
				slot4 = self._tree_ctrl
				slot6 = slot4
				slot4 = slot4.disconnect
				slot7 = event_type
				slot8 = resolved_wrapper

				slot4(slot5, slot6, slot7)

				slot4 = self._tree_event_wrapper_map
				slot5 = nil
				slot4[script_callback] = slot5
			end
		else
			slot3 = self._tree_ctrl
			slot5 = slot3
			slot3 = slot3.disconnect
			slot6 = event_type
			slot7 = script_callback

			slot3(slot4, slot5, slot6)
		end
	end

	return 
end

slot0.disconnect = slot1

return 
