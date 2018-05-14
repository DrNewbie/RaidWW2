-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = RaidGUIControlSkilltree

if not slot0 then
	slot0 = class
	slot2 = RaidGUIControlBranchingProgressBar
	slot0 = slot0(slot1)
end

RaidGUIControlSkilltree = slot0
slot0 = RaidGUIControlSkilltree
slot1 = 416
slot0.DEFAULT_H = slot1
slot0 = RaidGUIControlSkilltree
slot1 = 320
slot0.DEFAULT_BPB_H = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, parent, params)
	slot3 = Application
	slot5 = slot3
	slot3 = slot3.debug
	slot6 = "[RaidGUIControlSkilltree:init]"

	slot3(slot4, slot5)

	slot3 = params.h

	if not slot3 then
		slot3 = RaidGUIControlSkilltree
		slot3 = slot3.DEFAULT_H
	end

	params.h = slot3
	slot3 = params.elements_panel_h

	if not slot3 then
		slot3 = RaidGUIControlSkilltree
		slot3 = slot3.DEFAULT_BPB_H
	end

	params.elements_panel_h = slot3
	slot3 = 100
	params.x_step = slot3
	slot3 = RaidGUIControlSkilltree
	slot3 = slot3.super
	slot3 = slot3.init
	slot5 = self
	slot6 = parent
	slot7 = params

	slot3(slot4, slot5, slot6)

	slot3 = self._levels
	slot3 = slot3[1]
	slot3 = slot3.nodes
	slot3 = slot3[1]
	slot5 = slot3
	slot3 = slot3.x
	slot3 = slot3(slot4)
	slot4 = self._levels
	slot4 = slot4[1]
	slot4 = slot4.nodes
	slot4 = slot4[1]
	slot6 = slot4
	slot4 = slot4.w
	slot4 = slot4(slot5)
	slot4 = slot4 / 2
	local progress_bar_x = slot3 + slot4
	slot4 = self._levels
	slot5 = self._levels
	slot5 = #slot5
	slot4 = slot4[slot5]
	slot4 = slot4.nodes
	slot4 = slot4[1]
	slot6 = slot4
	slot4 = slot4.x
	slot4 = slot4(slot5)
	slot5 = self._levels
	slot6 = self._levels
	slot6 = #slot6
	slot5 = slot5[slot6]
	slot5 = slot5.nodes
	slot5 = slot5[1]
	slot7 = slot5
	slot5 = slot5.w
	slot5 = slot5(slot6)
	slot5 = slot5 / 2
	slot4 = slot4 + slot5
	slot5 = self._levels
	slot5 = slot5[1]
	slot5 = slot5.nodes
	slot5 = slot5[1]
	slot7 = slot5
	slot5 = slot5.x
	slot5 = slot5(slot6)
	slot6 = self._levels
	slot6 = slot6[1]
	slot6 = slot6.nodes
	slot6 = slot6[1]
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 / 2
	slot5 = slot5 + slot6
	local progress_bar_w = slot4 - slot5
	local progress_bar_params = {
		initial_progress = 0,
		name = "progress_bar",
		initial_level = 1,
		y = 0,
		x = 0
	}
	slot6 = self._scrollable_panel
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	progress_bar_params.w = slot6
	slot6 = self._scrollable_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	progress_bar_params.h = slot6
	progress_bar_params.horizontal_padding = progress_bar_x
	progress_bar_params.bar_w = progress_bar_w
	slot6 = self._scrollable_panel
	slot8 = slot6
	slot6 = slot6.create_custom_control
	slot9 = RaidGUIControlSkilltreeProgressBar
	slot10 = progress_bar_params
	slot6 = slot6(slot7, slot8, slot9)
	self._progress_bar = slot6
	slot6 = self._progress_bar
	slot8 = slot6
	slot6 = slot6.set_bottom
	slot9 = self._scrollable_panel
	slot11 = slot9
	slot9 = slot9.h

	slot6(slot7, slot9(slot10))

	slot6 = params.on_selection_changed_callback
	self._selection_changed_callback = slot6
	slot6 = {}
	self._selected_nodes = slot6

	return 
end

slot0.init = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = {}
	self._selected_nodes = slot1
	slot1 = 2
	self._first_available_level = slot1
	local current_level_index = 2
	local need_to_check_further = true

	while need_to_check_further and current_level_index <= slot3 do
		slot3 = self._levels
		local current_level = slot3[current_level_index]
		slot4 = 1
		slot5 = current_level.nodes
		slot5 = #slot5
		slot6 = 1

		for j = slot4, slot5, slot6 do
			slot8 = current_level.nodes
			local node = slot8[j]
			slot11 = node
			slot9 = node.state
			slot9 = slot9(slot10)
			slot10 = RaidGUIControlBranchingBarNode
			slot10 = slot10.STATE_INACTIVE

			if slot9 == slot10 then
				need_to_check_further = false
			else
				slot11 = node
				slot9 = node.state
				slot9 = slot9(slot10)
				slot10 = RaidGUIControlBranchingBarNode
				slot10 = slot10.STATE_ACTIVE

				if slot9 == slot10 then
					slot11 = node
					slot9 = node.set_selected

					slot9(slot10)

					slot9 = self._selected_nodes
					slot10 = node._data
					slot10 = slot10.level
					slot11 = node._data
					slot9[slot10] = slot11
				else
					slot9 = current_level.nodes
					slot9 = slot9[j]
					slot11 = slot9
					slot9 = slot9.set_pending

					slot9(slot10)
				end
			end
		end

		current_level_index = current_level_index + 1
	end

	slot5 = self
	slot3 = self._refresh_tree
	slot6 = true

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self._set_scrollable_panel_x
	slot6 = self._levels
	slot6 = slot6[1]
	slot6 = slot6.nodes
	slot6 = slot6[1]

	slot3(slot4, slot5)

	return 
end

slot0.on_respec = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, points, animate)
	slot3 = RaidGUIControlSkilltree
	slot3 = slot3.super
	slot3 = slot3.give_points
	slot5 = self
	slot6 = points
	slot7 = animate

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.get_progress
	local progress = slot3(slot4)
	slot4 = self._progress_bar
	slot6 = slot4
	slot4 = slot4.set_progress
	slot7 = progress

	slot4(slot5, slot6)

	slot4 = self._progress_bar
	slot6 = slot4
	slot4 = slot4.unlock_level
	slot9 = self
	slot7 = self._get_current_level

	slot4(slot5, slot7(slot8))

	return 
end

slot0.give_points = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self._get_current_level
	local current_level = slot1(slot2)
	slot2 = current_level - 1
	slot3 = self._levels
	slot3 = #slot3
	slot3 = slot3 - 1
	local levels_progress = slot2 / slot3
	local progress_in_level = 0
	slot4 = managers
	slot4 = slot4.experience
	slot6 = slot4
	slot4 = slot4.level_cap
	local level_cap = slot4(slot5)

	if current_level < level_cap then
		slot7 = self
		slot5 = self._get_level_progress
		slot8 = current_level + 1
		slot5 = slot5(slot6, slot7)
		slot6 = self._levels
		slot6 = #slot6
		slot6 = slot6 - 1
		progress_in_level = slot5 / slot6
	end

	slot5 = levels_progress + progress_in_level

	return slot5
end

slot0.get_progress = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, node, node_data)
	slot3 = self._on_click_callback

	if not slot3 then
		return 
	end

	slot3 = self._levels
	slot4 = node_data.level
	slot3 = slot3[slot4]
	slot3 = slot3.nodes
	slot4 = node_data.index
	local node = slot3[slot4]
	slot6 = node
	slot4 = node.state
	slot4 = slot4(slot5)
	slot5 = RaidGUIControlBranchingBarNode
	slot5 = slot5.STATE_PENDING

	if slot4 == slot5 then
		slot4 = self._activate_automatically

		if slot4 then
			slot6 = node
			slot4 = node.set_active

			slot4(slot5)

			slot4 = self._on_click_callback
			slot6 = node_data

			slot4(slot5)

			slot6 = self
			slot4 = self._refresh_tree

			slot4(slot5)
		else
			slot6 = self
			slot4 = self._select_node
			slot7 = node_data

			slot4(slot5, slot6)
		end
	else
		slot6 = node
		slot4 = node.state
		slot4 = slot4(slot5)
		slot5 = RaidGUIControlBranchingBarNode
		slot5 = slot5.STATE_SELECTED

		if slot4 == slot5 then
			slot6 = self
			slot4 = self._unselect_node
			slot7 = node_data.level
			slot8 = node_data.index

			slot4(slot5, slot6, slot7)
		end
	end

	return 
end

slot0._node_click_callback = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, node_data)
	slot2 = self._levels
	slot3 = node_data.level
	slot2 = slot2[slot3]
	slot2 = slot2.nodes
	slot3 = node_data.index
	local node = slot2[slot3]
	slot3 = pairs
	slot5 = self._levels
	slot6 = node_data.level
	slot5 = slot5[slot6]
	slot5 = slot5.nodes
	slot3, slot4, slot5 = slot3(slot4)

	for i, level_node in slot3, slot4, slot5 do
		slot10 = level_node
		slot8 = level_node.state
		slot8 = slot8(slot9)
		slot9 = RaidGUIControlBranchingBarNode
		slot9 = slot9.STATE_SELECTED

		if slot8 == slot9 then
			slot10 = level_node
			slot8 = level_node.set_pending

			slot8(slot9)
		end
	end

	slot5 = node
	slot3 = node.set_selected

	slot3(slot4)

	slot3 = self._selected_nodes
	slot4 = node_data.level
	slot3[slot4] = node_data
	slot3 = self._selection_changed_callback

	if slot3 then
		slot3 = self._selection_changed_callback

		slot3()
	end

	slot3 = managers
	slot3 = slot3.hud
	slot3 = slot3._sound_source
	slot5 = slot3
	slot3 = slot3.post_event
	slot6 = "skill_select"

	slot3(slot4, slot5)

	return 
end

slot0._select_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, level, index)
	slot3 = self._levels
	slot3 = slot3[level]
	slot3 = slot3.nodes
	local node = slot3[index]
	slot6 = node
	slot4 = node.set_pending

	slot4(slot5)

	slot4 = self._selected_nodes
	slot5 = nil
	slot4[level] = slot5
	slot4 = self._selection_changed_callback

	if slot4 then
		slot4 = self._selection_changed_callback

		slot4()
	end

	slot4 = managers
	slot4 = slot4.hud
	slot4 = slot4._sound_source
	slot6 = slot4
	slot4 = slot4.post_event
	slot7 = "skill_remove"

	slot4(slot5, slot6)

	return 
end

slot0._unselect_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = self._selected_nodes

	return slot1
end

slot0.get_selected_nodes = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = self._selected_nodes
	slot2 = self._first_available_level
	slot1 = slot1[slot2]

	if not slot1 then
		slot1 = false

		return slot1
	end

	local largest_selected_index = 0
	slot2 = pairs
	slot4 = self._selected_nodes
	slot2, slot3, slot4 = slot2(slot3)

	for index, node in slot2, slot3, slot4 do
		if largest_selected_index < index then
			largest_selected_index = index
		end
	end

	local last_selected_index = self._first_available_level
	slot3 = self._first_available_level
	slot4 = largest_selected_index
	slot5 = 1

	for i = slot3, slot4, slot5 do
		slot7 = self._selected_nodes
		slot7 = slot7[i]

		if slot7 then
			slot7 = i - last_selected_index
			slot8 = 1

			if slot8 < slot7 then
				slot7 = false

				return slot7
			end

			last_selected_index = i
		end
	end

	slot3 = true

	return slot3
end

slot0.is_selection_valid = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	local largest_selected_index = 0
	slot2 = pairs
	slot4 = self._selected_nodes
	slot2, slot3, slot4 = slot2(slot3)

	for index, node_data in slot2, slot3, slot4 do
		slot7 = self._levels
		slot8 = node_data.level
		slot7 = slot7[slot8]
		slot7 = slot7.nodes
		slot8 = node_data.index
		local node = slot7[slot8]
		slot10 = node
		slot8 = node.set_active

		slot8(slot9)

		if largest_selected_index < index then
			largest_selected_index = index
		end
	end

	slot2 = {}
	self._selected_nodes = slot2
	slot2 = largest_selected_index + 1
	self._first_available_level = slot2
	slot4 = self
	slot2 = self._refresh_tree

	slot2(slot3)

	return 
end

slot0.apply_selected_skills = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, node, node_data)
	slot3 = self._on_mouse_enter_callback
	slot5 = node_data

	slot3(slot4)

	return 
end

slot0._node_enter_callback = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, value)
	self._selected = value
	slot4 = self
	slot2 = self._get_active_level_node_index
	slot2, slot3 = slot2(slot3)
	self._selected_node_idx = slot3
	self._selected_level_idx = slot2
	slot4 = self
	slot2 = self.get_skill_tree_node
	slot5 = self._selected_level_idx
	slot5 = slot5 + 1
	slot6 = self._selected_node_idx
	local skill_node = slot2(slot3, slot4, slot5)

	if skill_node then
		slot3 = self._selected_level_idx
		slot3 = slot3 + 1
		self._selected_level_idx = slot3
	else
		slot5 = self
		slot3 = self.get_skill_tree_node
		slot6 = self._selected_level_idx
		slot7 = self._selected_node_idx
		slot3 = slot3(slot4, slot5, slot6)
		skill_node = slot3
	end

	slot5 = self
	slot3 = self._select_skill_tree_node
	slot6 = skill_node

	slot3(slot4, slot5)

	return 
end

slot0.set_selected = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = self._levels

	if not slot1 then
		slot1 = 1
		slot2 = 1

		return slot1, slot2
	end

	local last_active_level = nil
	slot2 = ipairs
	slot4 = self._levels
	slot2, slot3, slot4 = slot2(slot3)

	for level_index, level_data in slot2, slot3, slot4 do
		slot7 = level_data.active

		if slot7 then
			slot7 = clone
			slot9 = level_data
			slot7 = slot7(slot8)
			last_active_level = slot7
			last_active_level.level = level_index
		else
			slot7 = level_data.active

			if not slot7 and last_active_level then
				slot7 = last_active_level.level
				slot8 = last_active_level.active_node_index

				return slot7, slot8
			else
				slot7 = level_data.active

				if not slot7 and not last_active_level then
				end
			end
		end
	end

	if last_active_level then
		slot2 = last_active_level.level
		slot3 = last_active_level.active_node_index

		return slot2, slot3
	end

	slot2 = 1
	slot3 = 1

	return slot2, slot3
end

slot0._get_active_level_node_index = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, skill_node)
	slot4 = skill_node
	slot2 = skill_node.mouse_clicked
	slot5, slot6 = nil
	slot9 = skill_node
	slot7 = skill_node.world_x
	slot7 = slot7(slot8)
	slot10 = skill_node
	slot8 = skill_node.world_y

	slot2(slot3, slot4, slot5, slot6, slot8(slot9))

	slot4 = skill_node
	slot2 = skill_node.set_hovered

	slot2(slot3)

	return 
end

slot0._click_skill_tree_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, skill_node)
	slot4 = skill_node
	slot2 = skill_node.set_hovered

	slot2(slot3)

	slot4 = skill_node
	slot2 = skill_node.on_mouse_over

	slot2(slot3)

	return 
end

slot0._select_skill_tree_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, skill_node)
	slot4 = skill_node
	slot2 = skill_node.refresh_current_state

	slot2(slot3)

	slot4 = skill_node
	slot2 = skill_node.on_mouse_out

	slot2(slot3)

	return 
end

slot0._unselect_skill_tree_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, level_idx, node_idx)
	slot3 = self._levels
	local level = slot3[level_idx]

	if level then
		slot4 = level.nodes
		local node = slot4[node_idx]

		if node then
			slot5 = self._levels
			slot5 = slot5[level_idx]
			slot5 = slot5.nodes
			slot5 = slot5[node_idx]

			return slot5
		end
	end

	slot4 = nil

	return slot4
end

slot0.get_skill_tree_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, level, node)
	slot3 = self._selected_level_idx

	if slot3 == level then
		slot3 = self._selected_node_idx

		if slot3 == node then
			return 
		end
	end

	slot5 = self
	slot3 = self._unselect_skill_tree_node
	slot8 = self
	slot6 = self.get_current_skill_tree_node

	slot3(slot4, slot6(slot7))

	slot5 = self
	slot3 = self.get_skill_tree_node
	slot6 = level
	slot7 = node
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot3
	slot3 = slot3.set_hovered

	slot3(slot4)

	self._selected_level_idx = level
	self._selected_node_idx = node

	return 
end

slot0.select_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self.get_skill_tree_node
	slot4 = self._selected_level_idx
	slot5 = self._selected_node_idx

	return slot1(slot2, slot3, slot4)
end

slot0.get_current_skill_tree_node = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = self._selected_node_idx
	slot1 = slot1 - 1
	self._new_selected_node_idx = slot1
	slot1 = self._new_selected_node_idx
	slot2 = 0

	if slot1 <= slot2 then
		slot1 = 1
		self._selected_node_idx = slot1
	else
		slot3 = self
		slot1 = self.get_skill_tree_node
		slot4 = self._selected_level_idx
		slot5 = self._selected_node_idx
		local old_skill_node = slot1(slot2, slot3, slot4)
		slot4 = self
		slot2 = self._unselect_skill_tree_node
		slot5 = old_skill_node

		slot2(slot3, slot4)

		slot2 = self._new_selected_node_idx
		self._selected_node_idx = slot2
		slot4 = self
		slot2 = self.get_skill_tree_node
		slot5 = self._selected_level_idx
		slot6 = self._selected_node_idx
		local skill_node = slot2(slot3, slot4, slot5)
		slot5 = self
		slot3 = self._select_skill_tree_node
		slot6 = skill_node

		slot3(slot4, slot5)
	end

	slot1 = true

	return slot1
end

slot0.move_up = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot1 = self._selected_node_idx
	slot1 = slot1 + 1
	self._new_selected_node_idx = slot1
	slot1 = self._new_selected_node_idx
	slot2 = self._levels
	slot3 = self._selected_level_idx
	slot2 = slot2[slot3]
	slot2 = slot2.nodes
	slot2 = #slot2

	if slot2 < slot1 then
		slot1 = self._levels
		slot2 = self._selected_level_idx
		slot1 = slot1[slot2]
		slot1 = slot1.nodes
		slot1 = #slot1
		self._selected_node_idx = slot1
	else
		slot3 = self
		slot1 = self.get_skill_tree_node
		slot4 = self._selected_level_idx
		slot5 = self._selected_node_idx
		local old_skill_node = slot1(slot2, slot3, slot4)
		slot4 = self
		slot2 = self._unselect_skill_tree_node
		slot5 = old_skill_node

		slot2(slot3, slot4)

		slot2 = self._new_selected_node_idx
		self._selected_node_idx = slot2
		slot4 = self
		slot2 = self.get_skill_tree_node
		slot5 = self._selected_level_idx
		slot6 = self._selected_node_idx
		local skill_node = slot2(slot3, slot4, slot5)
		slot5 = self
		slot3 = self._select_skill_tree_node
		slot6 = skill_node

		slot3(slot4, slot5)
	end

	slot1 = true

	return slot1
end

slot0.move_down = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self._move_left
	slot4 = 1

	return slot1(slot2, slot3)
end

slot0.move_left = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self._move_right
	slot4 = 1

	return slot1(slot2, slot3)
end

slot0.move_right = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self._move_left
	slot4 = 3

	return slot1(slot2, slot3)
end

slot0.shoulder_move_left = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self._move_right
	slot4 = 3

	return slot1(slot2, slot3)
end

slot0.shoulder_move_right = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, value)
	slot2 = self._selected_level_idx
	slot2 = slot2 - value
	self._new_selected_level_idx = slot2
	slot2 = self._selected_level_idx

	if slot2 == 1 then
		slot2 = false

		return slot2
	else
		slot2 = self._new_selected_level_idx
		slot3 = 0

		if slot2 <= slot3 then
			slot4 = self
			slot2 = self.get_skill_tree_node
			slot5 = self._selected_level_idx
			slot6 = self._selected_node_idx
			local old_skill_node = slot2(slot3, slot4, slot5)
			slot5 = self
			slot3 = self._unselect_skill_tree_node
			slot6 = old_skill_node

			slot3(slot4, slot5)

			slot3 = 1
			self._selected_level_idx = slot3
		else
			slot4 = self
			slot2 = self.get_skill_tree_node
			slot5 = self._selected_level_idx
			slot6 = self._selected_node_idx
			local old_skill_node = slot2(slot3, slot4, slot5)
			slot5 = self
			slot3 = self._unselect_skill_tree_node
			slot6 = old_skill_node

			slot3(slot4, slot5)

			slot3 = self._new_selected_level_idx
			self._selected_level_idx = slot3
		end
	end

	slot2 = self._selected_node_idx
	slot3 = 1
	slot4 = -1

	for count = slot2, slot3, slot4 do
		self._selected_node_idx = count
		slot8 = self
		slot6 = self.get_skill_tree_node
		slot9 = self._selected_level_idx
		slot10 = self._selected_node_idx
		local skill_node = slot6(slot7, slot8, slot9)

		if skill_node then
			slot9 = self
			slot7 = self._select_skill_tree_node
			slot10 = skill_node

			slot7(slot8, slot9)

			slot9 = self
			slot7 = self._set_scrollable_panel_x
			slot10 = skill_node

			slot7(slot8, slot9)

			slot7 = true

			return slot7
		end
	end

	slot2 = false

	return slot2
end

slot0._move_left = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, value)
	slot2 = self._selected_level_idx
	slot2 = slot2 + value
	self._new_selected_level_idx = slot2
	slot2 = self._selected_level_idx
	slot3 = self._levels
	slot3 = #slot3

	if slot2 == slot3 then
		slot2 = false

		return slot2
	else
		slot2 = self._new_selected_level_idx
		slot3 = self._levels
		slot3 = #slot3

		if slot3 < slot2 then
			slot4 = self
			slot2 = self.get_skill_tree_node
			slot5 = self._selected_level_idx
			slot6 = self._selected_node_idx
			local old_skill_node = slot2(slot3, slot4, slot5)
			slot5 = self
			slot3 = self._unselect_skill_tree_node
			slot6 = old_skill_node

			slot3(slot4, slot5)

			slot3 = self._levels
			slot3 = #slot3
			self._selected_level_idx = slot3
		else
			slot4 = self
			slot2 = self.get_skill_tree_node
			slot5 = self._selected_level_idx
			slot6 = self._selected_node_idx
			local old_skill_node = slot2(slot3, slot4, slot5)
			slot5 = self
			slot3 = self._unselect_skill_tree_node
			slot6 = old_skill_node

			slot3(slot4, slot5)

			slot3 = self._new_selected_level_idx
			self._selected_level_idx = slot3
		end
	end

	slot2 = self._selected_node_idx
	slot3 = 1
	slot4 = -1

	for count = slot2, slot3, slot4 do
		self._selected_node_idx = count
		slot8 = self
		slot6 = self.get_skill_tree_node
		slot9 = self._selected_level_idx
		slot10 = self._selected_node_idx
		local skill_node = slot6(slot7, slot8, slot9)

		if skill_node then
			slot9 = self
			slot7 = self._select_skill_tree_node
			slot10 = skill_node

			slot7(slot8, slot9)

			slot9 = self
			slot7 = self._set_scrollable_panel_x
			slot10 = skill_node

			slot7(slot8, slot9)

			slot7 = true

			return slot7
		end
	end

	slot2 = false

	return slot2
end

slot0._move_right = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self, skill_node)
	slot2 = true
	self._controller_enabled = slot2
	slot4 = skill_node
	slot2 = skill_node.x
	slot2 = slot2(slot3)
	slot2 = -slot2
	local scrollable_panel_new_x = slot2 + 800
	slot3 = 0

	if slot3 < scrollable_panel_new_x then
		scrollable_panel_new_x = 0
	else
		slot3 = math
		slot3 = slot3.abs
		slot5 = scrollable_panel_new_x
		slot3 = slot3(slot4)
		slot4 = self._scrollable_panel
		slot6 = slot4
		slot4 = slot4.w
		slot4 = slot4(slot5)
		slot7 = self
		slot5 = self.w
		slot5 = slot5(slot6)
		slot4 = slot4 - slot5

		if slot4 < slot3 then
			slot3 = self._scrollable_panel
			slot5 = slot3
			slot3 = slot3.w
			slot3 = slot3(slot4)
			slot6 = self
			slot4 = self.w
			slot4 = slot4(slot5)
			slot3 = slot3 - slot4
			scrollable_panel_new_x = -slot3
		end
	end

	slot3 = self._scrollable_panel
	slot5 = slot3
	slot3 = slot3.set_x
	slot6 = scrollable_panel_new_x

	slot3(slot4, slot5)

	return 
end

slot0._set_scrollable_panel_x = slot1
slot0 = RaidGUIControlSkilltree

function slot1(self)
	slot3 = self
	slot1 = self.get_current_skill_tree_node
	local skill_node = slot1(slot2)
	slot4 = self
	slot2 = self._click_skill_tree_node
	slot5 = skill_node

	slot2(slot3, slot4)

	return 
end

slot0.confirm_pressed = slot1

return 
