if not RaidGUIControlIntelImageGrid then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelImageGrid = slot0
RaidGUIControlIntelImageGrid.DEFAULT_W = 474
RaidGUIControlIntelImageGrid.DEFAULT_H = 528
RaidGUIControlIntelImageGrid.SCROLL_ADVANCE = 20
function RaidGUIControlIntelImageGrid:init(parent, params)
	slot7 = params

	RaidGUIControlIntelImageGrid.super.init(slot4, self, parent)

	if not params.on_click_callback then
		slot9 = self._name
		slot6 = "[RaidGUIControlIntelImageGrid:init] Callback not specified for the intel image grid control " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	self._mission = params.mission or "flakturm"
	self._on_click_callback = params.on_click_callback
	slot5 = self

	self._create_panels(slot4)

	slot5 = self

	self._create_photos(slot4)

	return 
end
function RaidGUIControlIntelImageGrid:_create_panels()
	slot3 = self._params
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"

	if not self._params.layer then
		slot4 = self._panel
		slot2 = self._panel.layer(slot3) + 1
	end

	panel_params.layer = slot2
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlIntelImageGrid.DEFAULT_W
	panel_params.h = self._params.h or RaidGUIControlIntelImageGrid.DEFAULT_H
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)
	slot5 = panel_params
	self._inner_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageGrid:_create_photos(only_first_n_events)
	slot4 = self._inner_panel

	self._inner_panel.clear(slot3)

	slot5 = 0

	self._inner_panel.set_y(slot3, self._inner_panel)

	slot4 = self._inner_panel
	slot7 = self._object

	self._inner_panel.set_h(slot3, self._object.h(slot6))

	self._scrollable = false
	slot5 = only_first_n_events
	self._mission_photos = self._get_mission_photos(slot3, self)
	local y = 0
	local h = 0
	self._photos = {}

	for i = 1, #self._mission_photos, 1 do
		local photo_params = {
			x = 0,
			layer = 1,
			y = y,
			photo = self._mission_photos[i].photo
		}
		slot14 = i
		photo_params.on_click_callback = callback(slot10, self, self, "_on_photo_clicked")
		slot13 = photo_params
		local photo = self._inner_panel.create_custom_control(slot10, self._inner_panel, RaidGUIControlIntelImage)
		slot13 = photo

		table.insert(self._inner_panel, self._photos)

		if i % 2 == 0 then
			slot12 = photo
			slot15 = self._inner_panel

			photo.set_right(slot11, self._inner_panel.w(slot14))

			slot12 = photo
			y = y + photo.h(slot11)
		else
			slot12 = photo
			h = h + photo.h(slot11)
		end
	end

	slot7 = h

	self._inner_panel.set_h(slot5, self._inner_panel)

	slot6 = self

	self._check_scrollability(slot5)

	return 
end
function RaidGUIControlIntelImageGrid:_on_photo_clicked(photo_index)
	if self._selected_index == photo_index then
		return 
	end

	if self._selected_index then
		slot4 = self._photos[self._selected_index]

		self._photos[self._selected_index].unselect(self._selected_index)
	end

	self._selected_index = photo_index
	slot5 = self._mission_photos[photo_index]

	self._on_click_callback(slot3, photo_index)

	if self._scrollable then
		slot5 = self._inner_panel

		if self._photos[self._selected_index].y(self._selected_index) < -self._inner_panel.y(self._photos[self._selected_index]) then
			slot7 = self._photos[self._selected_index]
			slot5 = -self._photos[self._selected_index].y(self._selected_index)

			self._inner_panel.set_y(slot3, self._inner_panel)

			slot4 = self._inner_panel

			if 0 < self._inner_panel.y(slot3) then
				slot5 = 0

				self._inner_panel.set_y(slot3, self._inner_panel)
			end
		end

		slot4 = self._photos[self._selected_index]
		slot5 = self._photos[self._selected_index]
		slot5 = self._inner_panel
		slot5 = self._object

		if self._object.h(self._selected_index) < self._photos[self._selected_index].y(self._selected_index) + self._photos[self._selected_index].h(self._selected_index) + self._inner_panel.y(self._selected_index) then
			slot7 = self._photos[self._selected_index]
			slot5 = -self._photos[self._selected_index].y(self._selected_index)

			self._inner_panel.set_y(slot3, self._inner_panel)

			slot6 = self._inner_panel

			if self._inner_panel.y(slot3) < self._object.h(self._inner_panel) - self._inner_panel.h(self._object) then
				slot8 = self._inner_panel
				slot5 = self._object.h(slot6) - self._inner_panel.h(self._object)

				self._inner_panel.set_y(slot3, self._inner_panel)
			end
		end
	end

	return 
end
function RaidGUIControlIntelImageGrid:set_data(data)
	self._mission = data.mission

	if data.image_selected then
		self._selected_index = data.image_selected
		slot5 = true

		self._photos[self._selected_index].select(self._selected_index, self._photos[self._selected_index])

		slot5 = self._mission_photos[data.image_selected]

		self._on_click_callback(self._selected_index, data.image_selected)
	end

	if data.save_data then
		slot4 = data.save_data
		self._save_data = deep_clone(slot3)
	end

	slot5 = data.only_first_n_events

	self._create_photos(slot3, self)

	self._selected_index = nil
	slot5 = 1

	self.select(slot3, self)

	return 
end
function RaidGUIControlIntelImageGrid:select(index)
	if self._mission_photos[index] then
		slot5 = index

		self._on_photo_clicked(slot3, self)
	end

	return 
end
function RaidGUIControlIntelImageGrid:clear_selection()
	self._selected_index = nil

	return 
end
function RaidGUIControlIntelImageGrid:set_selected(value, dont_trigger_selected_callback)
	self._selected = value

	if self._selected_index then
		slot6 = false

		self._photos[self._selected_index].set_selected(self._selected_index, self._photos[self._selected_index])
	end

	if self._selected then
		local photo_to_select = nil

		if #self._photos % 2 == 0 then
			photo_to_select = #self._photos - 1
		else
			photo_to_select = #self._photos
		end

		slot7 = true

		self._photos[photo_to_select].set_selected(slot5, self._photos[photo_to_select])
	end

	return 
end
function RaidGUIControlIntelImageGrid:move_up()
	if self._selected and self._selected_index and self._photos[self._selected_index - 2] then
		slot4 = false

		self._photos[self._selected_index].set_selected(self._selected_index, self._photos[self._selected_index])

		slot4 = true

		self._photos[self._selected_index - 2].set_selected(self._selected_index - 2, self._photos[self._selected_index - 2])

		return true
	end

	slot3 = self
	local screen_move = RaidGUIControlIntelImageGrid.super.move_up(slot2)

	if screen_move then
		slot4 = self._photos[self._selected_index]

		self._photos[self._selected_index].highlight_off(self._selected_index)

		return true
	end

	return false
end
function RaidGUIControlIntelImageGrid:move_down()
	if self._selected and self._selected_index and self._photos[self._selected_index + 2] then
		slot4 = false

		self._photos[self._selected_index].set_selected(self._selected_index, self._photos[self._selected_index])

		slot4 = true

		self._photos[self._selected_index + 2].set_selected(self._selected_index + 2, self._photos[self._selected_index + 2])

		return true
	end

	slot3 = self
	local screen_move = RaidGUIControlIntelImageGrid.super.move_down(slot2)

	if screen_move then
		slot4 = self._photos[self._selected_index]

		self._photos[self._selected_index].highlight_off(self._selected_index)

		return true
	end

	return false
end
function RaidGUIControlIntelImageGrid:move_right()
	if self._selected and self._selected_index and self._selected_index % 2 ~= 0 and self._photos[self._selected_index + 1] then
		slot4 = false

		self._photos[self._selected_index].set_selected(self._selected_index, self._photos[self._selected_index])

		slot4 = true

		self._photos[self._selected_index + 1].set_selected(self._selected_index + 1, self._photos[self._selected_index + 1])

		return true
	end

	slot3 = self
	local screen_move = RaidGUIControlIntelImageGrid.super.move_right(slot2)

	if screen_move then
		slot4 = self._photos[self._selected_index]

		self._photos[self._selected_index].highlight_off(self._selected_index)

		return true
	end

	return false
end
function RaidGUIControlIntelImageGrid:move_left()
	if self._selected and self._selected_index and self._selected_index % 2 == 0 and self._photos[self._selected_index - 1] then
		slot4 = false

		self._photos[self._selected_index].set_selected(self._selected_index, self._photos[self._selected_index])

		slot4 = true

		self._photos[self._selected_index - 1].set_selected(self._selected_index - 1, self._photos[self._selected_index - 1])

		return true
	end

	slot3 = self
	local screen_move = RaidGUIControlIntelImageGrid.super.move_left(slot2)

	if screen_move then
		slot4 = self._photos[self._selected_index]

		self._photos[self._selected_index].highlight_off(self._selected_index)

		return true
	end

	return false
end
function RaidGUIControlIntelImageGrid:_get_mission_photos(only_first_n_events)
	local mission_tweak_data = tweak_data.operations.missions[self._mission]
	local photos = {}

	if self._save_data then
		mission_tweak_data.events_index = self._save_data.events_index
	end

	if mission_tweak_data.photos then
		slot6 = mission_tweak_data.photos

		for _, photo in pairs(slot5) do
			slot12 = photo

			table.insert(slot10, photos)
		end
	end

	if mission_tweak_data.job_type == OperationsTweakData.JOB_TYPE_OPERATION and only_first_n_events ~= 1 then
		local events = 1
		local operation_event_index = mission_tweak_data.events_index
		slot8 = operation_event_index

		for _, event in pairs(slot7) do
			local event_tweak_data = mission_tweak_data.events[event]

			if event_tweak_data.photos then
				slot14 = event_tweak_data.photos

				for _, photo in pairs(slot13) do
					slot20 = photo

					table.insert(slot18, photos)
				end
			end

			if only_first_n_events and events == only_first_n_events then
				break
			end

			events = events + 1
		end
	end

	if self._save_data then
		mission_tweak_data.events_index = nil
		self._save_data = nil
	end

	return photos
end
function RaidGUIControlIntelImageGrid:_check_scrollability()
	slot4 = self._object

	if self._inner_panel.h(slot2) <= self._object.h(self._inner_panel) then
		return 
	end

	self._scrollable = true

	return 
end
function RaidGUIControlIntelImageGrid:on_mouse_scroll_up()
	if not self._scrollable then
		return false
	end

	slot6 = self._inner_panel
	slot4 = self._inner_panel.y(slot5) + RaidGUIControlIntelImageGrid.SCROLL_ADVANCE

	self._inner_panel.set_y(slot2, self._inner_panel)

	slot3 = self._inner_panel

	if 0 < self._inner_panel.y(slot2) then
		slot4 = 0

		self._inner_panel.set_y(slot2, self._inner_panel)
	end

	return true
end
function RaidGUIControlIntelImageGrid:on_mouse_scroll_down()
	if not self._scrollable then
		return false
	end

	slot6 = self._inner_panel
	slot4 = self._inner_panel.y(slot5) - RaidGUIControlIntelImageGrid.SCROLL_ADVANCE

	self._inner_panel.set_y(slot2, self._inner_panel)

	slot5 = self._inner_panel

	if self._inner_panel.y(slot2) < self._object.h(self._inner_panel) - self._inner_panel.h(self._object) then
		slot7 = self._inner_panel
		slot4 = self._object.h(slot5) - self._inner_panel.h(self._object)

		self._inner_panel.set_y(slot2, self._inner_panel)
	end

	return true
end
function RaidGUIControlIntelImageGrid:close()
	return 
end

return 
