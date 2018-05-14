if not RaidGUIControlGridActive then
	slot2 = RaidGUIControlGrid
	slot0 = class(slot1)
end

RaidGUIControlGridActive = slot0
function RaidGUIControlGridActive:init(parent, params)
	slot7 = params

	RaidGUIControlGridActive.super.init(slot4, self, parent)

	return 
end
function RaidGUIControlGridActive:activate_item_by_value(params)
	slot4 = self._grid_items

	for grid_item_index, grid_item in ipairs(slot3) do
		slot9 = grid_item
		local grid_item_data = grid_item.get_data(slot8)

		if grid_item_data[params.key] == params.value then
			self._active_item = grid_item
			slot10 = self._active_item

			self._active_item.activate(slot9)

			self._active_item_idx = grid_item_index
		else
			slot10 = grid_item

			grid_item.deactivate(slot9)
		end
	end

	return self._active_item
end
function RaidGUIControlGridActive:get_active_item()
	return self._active_item
end
function RaidGUIControlGridActive:set_selected(value, dont_fire_select_callback)
	if value then
		local first_item_data = self._grid_items[1].get_data(slot4)
		slot7 = {
			key = "key_name",
			value = first_item_data.key_name
		}

		self.activate_item_by_value(self._grid_items[1], self)

		slot8 = dont_fire_select_callback

		RaidGUIControlGridActive.super.set_selected(self._grid_items[1], self, value)
	end

	return 
end

return 
