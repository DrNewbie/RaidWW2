-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlSuggestedCardsLarge then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSuggestedCardsLarge = slot0
function RaidGUIControlSuggestedCardsLarge:init(parent, params)
	slot7 = params

	RaidGUIControlSuggestedCardsLarge.super.init(slot4, self, parent)

	RaidGUIControlSuggestedCardsLarge.control = self
	self._grid_params = self._params.grid_params or {}
	self._item_params = self._params.item_params or {}
	self._item_width = self._item_params.item_w
	self._item_height = self._item_params.item_h
	self._selected_marker_w = self._item_params.selected_marker_w
	self._selected_marker_h = self._item_params.selected_marker_h
	self._grid_items = {}
	slot5 = self

	self.layout(slot4)

	return 
end
function RaidGUIControlSuggestedCardsLarge:layout()
	slot5 = true
	self._suggested_cards_panel = self._panel.panel(slot2, self._panel, {
		name = "suggested_cards_panel_large_" .. self._name,
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	})
	self._object = self._suggested_cards_panel
	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlSuggestedCardsLarge:_create_items()
	local item_data = {}
	local item_params = {}
	slot5 = (self._params.w - RaidGUIControlSuggestedCards.PLAYERS_COUNT * self._selected_marker_w) / (RaidGUIControlSuggestedCards.PLAYERS_COUNT - 1)
	local item_spacing = math.floor(slot4)

	for i = 1, RaidGUIControlSuggestedCards.PLAYERS_COUNT, 1 do
		item_params.x = (self._selected_marker_w + item_spacing) * (i - 1)
		item_params.y = 0
		item_params.item_width = self._item_width
		item_params.item_height = self._item_height
		item_params.selected_marker_w = self._selected_marker_w
		item_params.selected_marker_h = self._selected_marker_h
		item_params.name = "suggested_card_" .. i
		item_params.peer_id = i
		slot12 = "_item_selected_callback"
		item_params.item_selected_callback = callback(i, self, self)
		item_params.item_idx = i
		slot10 = managers.challenge_cards
		item_data = managers.challenge_cards.get_suggested_cards(i)[i]
		slot14 = self._grid_params
		local item = self._suggested_cards_panel.create_custom_control(i, self._suggested_cards_panel, RaidGUIControlCardSuggestedLarge, item_params, item_data)

		if item_data then
			slot12 = item_data

			item.set_card(slot10, item)
		end

		self._grid_items[i] = item
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:_item_selected_callback(item_idx)
	slot5 = item_idx

	self.select_item(slot3, self)

	return 
end
function RaidGUIControlSuggestedCardsLarge:_delete_items()
	slot3 = self._suggested_cards_panel._controls

	for slot4, slot5 in pairs(slot2) do
	end

	slot3 = self._suggested_cards_panel

	self._suggested_cards_panel.clear(slot2)

	return 
end
function RaidGUIControlSuggestedCardsLarge:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlSuggestedCardsLarge:mouse_released(o, button, x, y)
	slot7 = self._grid_items

	for _, grid_item in ipairs(slot6) do
		slot14 = y

		if grid_item.inside(slot11, grid_item, x) then
			slot16 = y
			local handled = grid_item.mouse_released(slot11, grid_item, o, button, x)

			if handled then
				return true
			end
		end
	end

	return false
end
function RaidGUIControlSuggestedCardsLarge:mouse_moved(o, x, y)
	if self._grid_items then
		for i = 1, #self._grid_items, 1 do
			slot13 = y
			local handled = self._grid_items[i].mouse_moved(slot9, self._grid_items[i], o, x)

			return handled
		end
	end

	return false
end
function RaidGUIControlSuggestedCardsLarge:move_selection_right()
	local index = self._selected_item._params.item_idx
	local start_index = index

	while true do
		index = (index + 1) % (#self._grid_items + 1)

		if index == 0 then
			index = 1
		end

		slot6 = index
		local selected_item = self.select_item(slot4, self)

		if selected_item then
			slot6 = selected_item

			return selected_item.get_data(slot5)
		end

		if index == start_index then
			return 
		end
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:move_selection_left()
	local index = self._selected_item._params.item_idx
	local start_index = index

	while true do
		index = index - 1

		if index == 0 then
			index = #self._grid_items
		end

		slot6 = index
		local selected_item = self.select_item(slot4, self)

		if selected_item then
			slot6 = selected_item

			return selected_item.get_data(slot5)
		end

		if index == start_index then
			return 
		end
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:select_first_available_item()
	for i_item_data = 1, #self._grid_items, 1 do
		slot8 = i_item_data
		local selected_item = self.select_item(slot6, self)

		if selected_item then
			return selected_item
		end
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:select_item(item_idx)

	-- Decompilation error in this vicinity:
	for i_item_data = 1, #self._grid_items, 1 do
		if i_item_data == item_idx then
			slot9 = true

			self._grid_items[i_item_data].select(slot7, self._grid_items[i_item_data])

			self._selected_item = self._grid_items[i_item_data]
		else
			slot8 = self._grid_items[i_item_data]

			self._grid_items[i_item_data].unselect(slot7)
		end
	end

	return self._selected_item
end
function RaidGUIControlSuggestedCardsLarge:selected_item()
	return self._selected_item
end
function RaidGUIControlSuggestedCardsLarge:lock_selected_grid_item()
	if self._selected_item then
		self._locked_item = self._selected_item
		slot3 = self._locked_item

		self._locked_item.lock(slot2)
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:unlock_grid_item()
	if self._locked_item then
		slot3 = self._locked_item

		self._locked_item.unlock(slot2)

		self._locked_item = nil
	end

	return 
end
function RaidGUIControlSuggestedCardsLarge:locked_grid_item()
	return self._locked_item
end

return 
