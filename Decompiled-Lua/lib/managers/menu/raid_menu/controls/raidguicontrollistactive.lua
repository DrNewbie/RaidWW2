if not RaidGUIControlListActive then
	slot2 = RaidGUIControlList
	slot0 = class(slot1)
end

RaidGUIControlListActive = slot0
function RaidGUIControlListActive:init(parent, params)
	slot7 = params

	RaidGUIControlListActive.super.init(slot4, self, parent)

	self._special_action_callback = self._params.special_action_callback
	self._selected_callback = self._params.selected_callback
	self._unselected_callback = self._params.unselected_callback

	return 
end
function RaidGUIControlListActive:activate_item_by_value(item_value)
	if self._active_item then
		slot4 = self._active_item

		self._active_item.deactivate(slot3)

		self._active_item = nil
	end

	if self._list_items then
		slot4 = self._list_items

		for _, item in pairs(slot3) do
			slot9 = item
			local item_data = item.data(slot8)

			if item_data.value == item_value then
				self._active_item = item
				slot10 = self._active_item

				self._active_item.activate(slot9)
			end
		end
	end

	return 
end
function RaidGUIControlListActive:activate_item_by_index(index)
	slot7 = self._list_items[index]
	slot5 = self._list_items[index].data(slot6).value

	self.activate_item_by_value(slot3, self)

	return 
end
function RaidGUIControlListActive:get_active_item()
	return self._active_item
end
function RaidGUIControlListActive:get_active_item_index()
	if self._active_item and self._list_items then
		slot3 = self._list_items

		for index, item in pairs(slot2) do
			if item == self._active_item then
				return index
			end
		end
	end

	return nil
end
function RaidGUIControlListActive:_create_item(item_class, item_params, item_data)
	if self._special_action_callback then
		item_params.special_action_callback = self._special_action_callback
	end

	slot9 = item_data

	return self._object.create_custom_control(slot5, self._object, item_class, item_params)
end
function RaidGUIControlListActive:set_selected(value, dont_trigger_selected_callback)
	self._selected = value

	if self._selected_item and self._selected then
		slot5 = self._selected_item

		self._selected_item.unselect(slot4)
	end

	if self._selected then
		slot5 = self
		self._selected_item_idx = self.get_active_item_index(slot4) or 1
		slot8 = true

		self.select_item_by_index(slot4, self, self._selected_item_idx, dont_trigger_selected_callback)

		if self._selected_callback then
			self._selected_callback()
		end
	end

	if not self._selected then
		if self._list_items then
			slot5 = self._list_items

			for _, item in pairs(slot4) do
				if _ ~= self._selected_item_idx then
					slot10 = item

					item.unselect(slot9)
				else
					slot10 = item

					item.highlight_off(slot9)
				end
			end
		end

		if self._unselected_callback then
			self._unselected_callback()
		end
	end

	return 
end

return 
