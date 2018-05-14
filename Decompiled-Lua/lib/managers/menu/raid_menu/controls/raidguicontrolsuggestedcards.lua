if not RaidGUIControlSuggestedCards then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSuggestedCards = slot0
RaidGUIControlSuggestedCards.PLAYERS_COUNT = 4
function RaidGUIControlSuggestedCards:init(parent, params)
	slot7 = params

	RaidGUIControlSuggestedCards.super.init(slot4, self, parent)

	RaidGUIControlSuggestedCards.control = self
	self._grid_params = self._params.grid_params or {}
	self._item_params = self._params.item_params or {}
	self._border_padding = 10
	self._item_width = self._item_params.w or 90
	self._item_height = self._item_params.h or 135
	self._grid_items = {}
	slot5 = self

	self.layout(slot4)

	return 
end
function RaidGUIControlSuggestedCards:layout()
	slot5 = true
	self._suggested_cards_panel = self._panel.panel(slot2, self._panel, {
		name = "suggested_cards_panel",
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
function RaidGUIControlSuggestedCards:_create_items()
	local item_data = {}
	local item_params = {}
	slot7 = self._object
	slot5 = (self._object.w(slot6) - RaidGUIControlSuggestedCards.PLAYERS_COUNT * self._item_width) / (RaidGUIControlSuggestedCards.PLAYERS_COUNT - 1)
	local horizontal_spacing = math.floor(slot4)

	for i = 1, RaidGUIControlSuggestedCards.PLAYERS_COUNT, 1 do
		item_params.x = (self._item_width + horizontal_spacing) * (i - 1)
		item_params.y = 0
		item_params.item_w = self._item_width
		item_params.item_h = self._item_height
		item_params.name = "suggested_card_" .. i
		item_params.peer_id = i
		item_data = managers.challenge_cards.get_suggested_cards(i)[i]
		local peer_name = ""
		slot11 = managers.network
		slot11 = managers.network.session(managers.challenge_cards)

		if managers.network.session(managers.challenge_cards).all_peers(managers.challenge_cards)[i] then
			slot11 = managers.network
			slot11 = managers.network.session(slot10)
			slot11 = managers.network.session(slot10).all_peers(slot10)[i]
			peer_name = managers.network.session(slot10).all_peers(slot10)[i].name(slot10)
			item_params.peer_name = peer_name
		else
			item_params.peer_name = ""
		end

		slot12 = {
			name = "label_peer_name",
			h = 30,
			wrap = true,
			align = "center",
			vertical = "center",
			x = item_params.x,
			y = self._suggested_cards_panel.h(slot14) - 30,
			w = self._item_width,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.filter,
			text = utf8.to_upper(slot14)
		}
		slot15 = self._suggested_cards_panel
		slot15 = peer_name
		self._label_peer_name = self._suggested_cards_panel.label(slot10, self._suggested_cards_panel)
		slot15 = self._grid_params
		local item = self._suggested_cards_panel.create_custom_control(slot10, self._suggested_cards_panel, RaidGUIControlCardSuggested, item_params, item_data)

		if item_data then
			slot13 = item_data

			item.set_card(slot11, item)
		end

		self._grid_items[i] = item
	end

	return 
end
function RaidGUIControlSuggestedCards:_delete_items()
	slot3 = self._suggested_cards_panel._controls

	for slot4, slot5 in pairs(slot2) do
	end

	slot3 = self._suggested_cards_panel

	self._suggested_cards_panel.clear(slot2)

	return 
end
function RaidGUIControlSuggestedCards:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlSuggestedCards:mouse_released(o, button, x, y)
	slot7 = self._grid_items

	for _, grid_item in ipairs(slot6) do
		slot14 = y

		if grid_item.inside(slot11, grid_item, x) then
			slot16 = y
			local handled = grid_item.mouse_released(slot11, grid_item, o, button, x)

			if handled then
				slot14 = grid_item

				self.select_grid_item_by_item(slot12, self)

				return true
			end
		end
	end

	return false
end
function RaidGUIControlSuggestedCards:select_grid_item_by_item(grid_item)
	if self._selected_item then
		slot4 = self._selected_item

		self._selected_item.unselect(slot3)
	end

	self._selected_item = grid_item

	if self._selected_item then
		slot4 = self._selected_item

		self._selected_item.select(slot3)
	end

	return 
end
function RaidGUIControlSuggestedCards:selected_grid_item()
	slot3 = self._grid_items

	for index, grid_item in ipairs(slot2) do
		if grid_item == self._selected_item then
			return self._selected_item, index
		end
	end

	return nil, nil
end
function RaidGUIControlSuggestedCards:lock_selected_grid_item()
	if self._selected_item then
		self._locked_item = self._selected_item
		slot3 = self._locked_item

		self._locked_item.lock(slot2)
	end

	return 
end
function RaidGUIControlSuggestedCards:unlock_grid_item()
	if self._locked_item then
		slot3 = self._locked_item

		self._locked_item.unlock(slot2)

		self._locked_item = nil
	end

	return 
end
function RaidGUIControlSuggestedCards:locked_grid_item()
	return self._locked_item
end
function RaidGUIControlSuggestedCards:mouse_moved(o, x, y)
	if self._grid_items then
		for i = 1, #self._grid_items, 1 do
			slot13 = y
			local handled = self._grid_items[i].mouse_moved(slot9, self._grid_items[i], o, x)

			return handled
		end
	end

	return false
end

return 
