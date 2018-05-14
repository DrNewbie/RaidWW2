-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlImageViewer then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlImageViewer = slot0
RaidGUIControlImageViewer.ANIMATION_DURATION = 2
RaidGUIControlImageViewer.ANIMATION_WAIT = 5
RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT = 32
RaidGUIControlImageViewer.BULLET_WIDTH = 16
RaidGUIControlImageViewer.BULLET_HEIGHT = 16
RaidGUIControlImageViewer.BULLET_PADDING = 2
function RaidGUIControlImageViewer:init(parent, params)
	slot7 = params

	RaidGUIControlImageViewer.super.init(slot4, self, parent)

	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	slot5 = self

	self._layout(slot4)

	return 
end
function RaidGUIControlImageViewer:_layout()
	self._image_frames = {}
	self._bullets = {}
	self._bullets_active = {}
	slot4 = {
		name = "_image_frame_1",
		alpha = 1,
		y = 0,
		x = 0,
		w = self._params.w,
		h = self._params.h - RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT,
		layer = self._object.layer(RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT) + 1,
		texture = tweak_data.gui.icons.intel_table_opp_img_herr_a.texture,
		texture_rect = tweak_data.gui.icons.intel_table_opp_img_herr_a.texture_rect
	}
	slot7 = self._object
	self._image_frame_1 = self._object.bitmap(slot2, self._object)
	slot4 = self._image_frame_1

	table.insert(slot2, self._image_frames)

	slot4 = {
		name = "_image_frame_2",
		alpha = 1,
		y = 0,
		x = self._params.w,
		w = self._params.w,
		h = self._params.h - RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT,
		layer = self._object.layer(RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT) + 1,
		texture = tweak_data.gui.icons.intel_table_opp_img_herr_a.texture,
		texture_rect = tweak_data.gui.icons.intel_table_opp_img_herr_a.texture_rect
	}
	slot7 = self._object
	self._image_frame_2 = self._object.bitmap(slot2, self._object)
	slot4 = self._image_frame_2

	table.insert(slot2, self._image_frames)

	slot4 = {
		x = 0,
		y = self._image_frame_1.h(RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT),
		w = self._params.w,
		h = RaidGUIControlImageViewer.BULLET_PANEL_HEIGHT
	}
	slot7 = self._image_frame_1
	self._bullet_panel = self._object.panel(slot2, self._object)

	return 
end
function RaidGUIControlImageViewer:set_data(item_value)
	slot4 = self._object

	self._object.stop(slot3)

	slot4 = self

	self._reset_animation_state(slot3)

	if item_value then
		self._data = item_value
		slot4 = self

		self.start(slot3)
	end

	return 
end
function RaidGUIControlImageViewer:_reset_animation_state()
	slot4 = 0

	self._image_frames[1].set_x(slot2, self._image_frames[1])

	slot4 = self._params.w

	self._image_frames[2].set_x(slot2, self._image_frames[2])

	if self._bullets_active then
		for i = 1, #self._bullets_active, 1 do
			slot8 = self._bullets_active[i]

			self._bullet_panel.remove(slot6, self._bullet_panel)

			self._bullets_active[i] = nil
		end
	end

	if self._bullets then
		for i = 1, #self._bullets, 1 do
			slot8 = self._bullets[i]

			self._bullet_panel.remove(slot6, self._bullet_panel)

			self._bullets[i] = nil
		end
	end

	return 
end
function RaidGUIControlImageViewer:start()
	if not self._data then
		return 
	end

	slot4 = self._data[1].texture

	self._image_frames[1].set_image(slot2, self._image_frames[1])

	slot3 = self._image_frames[1]
	slot6 = self._data[1].texture_rect

	self._image_frames[1].set_texture_rect(slot2, unpack(slot5))

	if 1 < #self._data then
		for i = 1, #self._data, 1 do
			slot7 = self._bullets
			slot11 = {
				x = (i - 1) * (RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING),
				y = RaidGUIControlImageViewer.BULLET_HEIGHT / 2,
				w = RaidGUIControlImageViewer.BULLET_WIDTH,
				h = RaidGUIControlImageViewer.BULLET_HEIGHT,
				layer = self._object.layer(RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING) + 1,
				texture = tweak_data.gui.icons.bullet_empty.texture,
				texture_rect = tweak_data.gui.icons.bullet_empty.texture_rect
			}
			slot14 = self._object

			table.insert(slot6, self._bullet_panel.bitmap(slot9, self._bullet_panel))

			slot7 = self._bullets_active
			slot11 = {
				h = 0,
				w = 0,
				x = (i - 1) * (RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING),
				y = RaidGUIControlImageViewer.BULLET_HEIGHT / 2,
				layer = self._object.layer(RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING) + 2,
				texture = tweak_data.gui.icons.bullet_active.texture,
				texture_rect = tweak_data.gui.icons.bullet_active.texture_rect
			}
			slot14 = self._object

			table.insert(slot6, self._bullet_panel.bitmap(slot9, self._bullet_panel))
		end

		slot4 = #self._data * (RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING)

		self._bullet_panel.set_w(slot2, self._bullet_panel)

		slot4 = self._params.w / 2

		self._bullet_panel.set_center_x(slot2, self._bullet_panel)

		slot3 = self._object
		slot8 = "_animate_image_rotation"

		self._object.animate(slot2, callback(RaidGUIControlImageViewer.BULLET_WIDTH + RaidGUIControlImageViewer.BULLET_PADDING, self, self))
	end

	return 
end
function RaidGUIControlImageViewer:_animate_image_rotation()
	self._current_image_index = 1
	self._active_image_frame = 1
	slot4 = self._data[1].texture

	self._image_frames[1].set_image(slot2, self._image_frames[1])

	slot3 = self._image_frames[1]
	slot6 = self._data[1].texture_rect

	self._image_frames[1].set_texture_rect(slot2, unpack(slot5))

	slot4 = RaidGUIControlImageViewer.BULLET_WIDTH

	self._bullets_active[1].set_w(slot2, self._bullets_active[1])

	slot4 = RaidGUIControlImageViewer.BULLET_HEIGHT

	self._bullets_active[1].set_h(slot2, self._bullets_active[1])

	slot3 = self._bullets_active[1]
	slot6 = self._bullets[1]

	self._bullets_active[1].set_center_x(slot2, self._bullets[1].center_x(slot5))

	slot3 = self._bullets_active[1]
	slot6 = self._bullets[1]

	self._bullets_active[1].set_center_y(slot2, self._bullets[1].center_y(slot5))

	slot3 = RaidGUIControlImageViewer.ANIMATION_WAIT

	wait(slot2)

	while true do
		slot5 = #self._data
		local next_image_index = self._get_next_index(slot2, self, self._current_image_index)
		slot6 = 2
		local next_frame_index = self._get_next_index(self, self, self._active_image_frame)
		slot6 = self._data[next_image_index].texture

		self._image_frames[next_frame_index].set_image(self, self._image_frames[next_frame_index])

		slot5 = self._image_frames[next_frame_index]
		slot8 = self._data[next_image_index].texture_rect

		self._image_frames[next_frame_index].set_texture_rect(self, unpack(slot7))

		local t = 0
		local animation_duration = RaidGUIControlImageViewer.ANIMATION_DURATION
		local distance = self._params.w

		while t < animation_duration do

			-- Decompilation error in this vicinity:
			local dt = coroutine.yield()
			t = t + dt
			local current_distance = dt / animation_duration * distance
			slot10 = self._image_frames

			for _, image_frame in ipairs(slot9) do
				slot18 = image_frame
				slot16 = image_frame.x(slot17) - current_distance

				image_frame.set_x(slot14, image_frame)
			end

			slot10 = self._bullets[self._current_image_index]
			local active_bullet_center_x = self._bullets[self._current_image_index].center_x(self._current_image_index)
			local active_bullet_center_y = self._bullets[self._current_image_index].center_y(self._current_image_index)
			local next_bullet_center_x = self._bullets[next_image_index].center_x(self._bullets[self._current_image_index])
			slot13 = self._bullets[next_image_index]
			local next_bullet_center_y = self._bullets[next_image_index].center_y(self._bullets[next_image_index])
		end

		slot9 = self._params.w

		self._image_frames[self._active_image_frame].set_x(self._active_image_frame, self._image_frames[self._active_image_frame])

		slot9 = 0

		self._image_frames[next_frame_index].set_x(self._active_image_frame, self._image_frames[next_frame_index])

		self._current_image_index = next_image_index
		self._active_image_frame = next_frame_index
		slot8 = RaidGUIControlImageViewer.ANIMATION_WAIT

		wait(self._active_image_frame)
	end

	return 
end
function RaidGUIControlImageViewer:_get_next_index(current_index, table_size)
	local next_index = (current_index + 1) % table_size

	if next_index == 0 then
		next_index = table_size
	end

	return next_index
end
function RaidGUIControlImageViewer:destroy()
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self

	self._reset_animation_state(slot2)

	return 
end

return 
