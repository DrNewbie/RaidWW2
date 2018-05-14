if not RaidGUIControlMissionUnlock then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlMissionUnlock = slot0
RaidGUIControlMissionUnlock.WIDTH = 448
RaidGUIControlMissionUnlock.HEIGHT = 688
RaidGUIControlMissionUnlock.ACTIVE_Y_OFFSET = 85
RaidGUIControlMissionUnlock.DESCRIPTION_Y = 480
RaidGUIControlMissionUnlock.DESCRIPTION_Y_OFFSET = 30
function RaidGUIControlMissionUnlock:init(parent, params)
	slot7 = params

	RaidGUIControlMissionUnlock.super.init(slot4, self, parent)

	self._on_click_callback = params.on_click_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._mission = params.mission
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_background(slot4)

	slot5 = self

	self._create_selector_triangles(slot4)

	slot5 = self

	self._create_active_border(slot4)

	slot5 = self

	self._create_folder(slot4)

	slot5 = self

	self._create_mission_description(slot4)

	return 
end
function RaidGUIControlMissionUnlock:_create_panel()
	local panel_params = {
		name = "mission_unlock_" .. self._params.mission,
		w = RaidGUIControlMissionUnlock.WIDTH,
		h = RaidGUIControlMissionUnlock.HEIGHT
	}
	slot5 = panel_params
	self._object = self._panel.panel(self._params.mission, self._panel)

	return 
end
function RaidGUIControlMissionUnlock:_create_background()
	local background_params = {
		name = "background",
		layer = 1,
		visible = false,
		color = tweak_data.gui.colors.raid_unlock_select_background
	}
	slot5 = background_params
	self._background = self._object.rect(slot3, self._object)

	return 
end
function RaidGUIControlMissionUnlock:_create_selector_triangles()
	local top_select_triangle_params = {
		layer = 3,
		visible = false,
		rotation = 90,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	slot5 = top_select_triangle_params
	self._top_triangle = self._object.bitmap(slot3, self._object)

	self._top_triangle.set_right(slot3, self._object.w(slot6))

	local bottom_select_triangle_params = {
		layer = 3,
		visible = false,
		rotation = 45,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	slot6 = top_select_triangle_params
	self._bottom_triangle = self._object.bitmap(self._top_triangle, self._object)
	slot5 = self._bottom_triangle
	slot8 = self._object

	self._bottom_triangle.set_bottom(self._top_triangle, self._object.h(self._object))

	slot6 = -90

	self._bottom_triangle.set_rotation(self._top_triangle, self._bottom_triangle)

	return 
end
function RaidGUIControlMissionUnlock:_create_active_border()
	local border_color = tweak_data.gui.colors.raid_red
	local border_thickness = 2
	local border_panel_params = {
		visible = false,
		name = "border_panel"
	}
	slot7 = border_panel_params
	self._border_panel = self._object.panel(slot5, self._object)
	local top_border_params = {
		name = "top_border",
		layer = 2
	}
	slot7 = self._border_panel
	top_border_params.w = self._border_panel.w(self._object)
	top_border_params.h = border_thickness
	top_border_params.color = border_color
	local top_border = self._border_panel.rect(self._object, self._border_panel)
	local bottom_border_params = {
		name = "bottom_border",
		layer = 2
	}
	slot9 = self._object
	bottom_border_params.w = self._object.w(top_border_params)
	bottom_border_params.h = border_thickness
	bottom_border_params.color = border_color
	slot10 = bottom_border_params
	local bottom_border = self._border_panel.rect(top_border_params, self._border_panel)
	slot13 = self._border_panel

	bottom_border.set_bottom(self._border_panel, self._border_panel.h(slot12))

	local left_border_params = {
		name = "left_border",
		layer = 2,
		w = border_thickness
	}
	slot11 = self._border_panel
	left_border_params.h = self._border_panel.h(bottom_border)
	left_border_params.color = border_color
	local left_border = self._border_panel.rect(bottom_border, self._border_panel)
	local right_border_params = {
		name = "right_border",
		layer = 2,
		w = border_thickness
	}
	slot13 = self._border_panel
	right_border_params.h = self._border_panel.h(left_border_params)
	right_border_params.color = border_color
	slot14 = right_border_params
	local right_border = self._border_panel.rect(left_border_params, self._border_panel)
	slot14 = right_border
	slot17 = self._border_panel

	right_border.set_right(self._border_panel, self._border_panel.w(slot16))

	return 
end
function RaidGUIControlMissionUnlock:_create_folder()
	local mission_tweak_data = tweak_data.operations.mission_data(slot2, tweak_data.operations)
	local folder_panel_params = {
		name = "folder_panel",
		h = 448,
		layer = 5
	}
	slot6 = folder_panel_params
	self._folder_panel = self._object.panel(self._mission, self._object)
	slot6 = self._object.h(slot7) / 2

	self._folder_panel.set_center_y(self._mission, self._folder_panel)

	local folder_image_params = {
		name = "folder_image",
		layer = 50,
		texture = tweak_data.gui.icons.folder_mission_selection.texture,
		texture_rect = tweak_data.gui.icons.folder_mission_selection.texture_rect
	}
	slot7 = folder_image_params
	self._folder_image = self._folder_panel.bitmap(self._folder_panel, self._folder_panel)
	slot9 = self._folder_panel
	slot7 = self._folder_panel.w(self._object) / 2

	self._folder_image.set_center_x(self._folder_panel, self._folder_image)

	slot9 = self._folder_panel
	slot7 = self._folder_panel.h(self._object) / 2

	self._folder_image.set_center_y(self._folder_panel, self._folder_image)

	slot7 = mission_tweak_data.icon_menu_big
	local icon_w = tweak_data.gui.icon_w(self._folder_panel, tweak_data.gui)
	slot8 = mission_tweak_data.icon_menu_big
	local icon_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	local mission_image_params = {
		name = "mission_icon",
		valign = "center",
		halign = "center",
		texture = tweak_data.gui.icons[mission_tweak_data.icon_menu_big].texture,
		texture_rect = tweak_data.gui.icons[mission_tweak_data.icon_menu_big].texture_rect
	}
	slot9 = self._folder_image
	mission_image_params.w = self._folder_image.w(mission_tweak_data.icon_menu_big) * 0.7
	slot9 = self._folder_image
	mission_image_params.layer = self._folder_image.layer(mission_tweak_data.icon_menu_big) + 1
	mission_image_params.color = tweak_data.gui.colors.raid_light_red
	slot9 = self._folder_image
	mission_image_params.layer = self._folder_image.layer(mission_tweak_data.icon_menu_big) + 1
	slot10 = mission_image_params
	self._mission_image = self._folder_panel.bitmap(mission_tweak_data.icon_menu_big, self._folder_panel)
	slot12 = self._mission_image
	slot10 = self._mission_image.w(slot11) * icon_h / icon_w

	self._mission_image.set_h(mission_tweak_data.icon_menu_big, self._mission_image)

	slot9 = self._mission_image
	slot12 = self._folder_image

	self._mission_image.set_center_x(mission_tweak_data.icon_menu_big, self._folder_image.center_x(icon_h / icon_w))

	slot12 = self._folder_image
	slot10 = self._folder_image.center_y(icon_h / icon_w) - 20

	self._mission_image.set_center_y(mission_tweak_data.icon_menu_big, self._mission_image)

	local mission_title_params = {
		name = "folder_mission_title",
		h = 32,
		vertical = "center",
		w = 192,
		align = "center",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_light_red
	}
	slot10 = self._mission_image
	mission_title_params.layer = self._mission_image.layer(self._mission_image)
	mission_title_params.text = self.translate(self._mission_image, self, mission_tweak_data.name_id)
	slot10 = self._folder_image
	mission_title_params.layer = self._folder_image.layer(self._mission_image) + 1
	slot11 = mission_title_params
	self._folder_mission_title = self._folder_panel.text(self._mission_image, self._folder_panel)
	slot10 = self._folder_mission_title
	slot13 = self._mission_image

	self._folder_mission_title.set_center_x(self._mission_image, self._mission_image.center_x(true))

	slot13 = self._mission_image
	slot11 = self._mission_image.center_y(true) + 124

	self._folder_mission_title.set_center_y(self._mission_image, self._folder_mission_title)

	slot10 = self

	self._fit_mission_title(self._mission_image)

	self._mission_photos = {}
	local mission_photos = deep_clone(self._mission_image)
	slot11 = mission_photos

	math.shuffle(mission_tweak_data.photos)

	slot11 = mission_photos
	local mission_photo_data = table.remove(mission_tweak_data.photos)
	local mission_photo_params = {
		static = true,
		layer = 1,
		alpha = 0,
		photo = mission_photo_data.photo
	}
	local mission_photo = self._folder_panel.create_custom_control(true, self._folder_panel, RaidGUIControlIntelImage)
	local position_x = math.random() * 0.07 + 0.72
	local position_y = math.random() * 0.06 + 0.16
	slot20 = self._folder_image
	slot17 = self._folder_image.x(slot18) + self._folder_image.w(self._folder_image) * position_x

	mission_photo.set_center_x(mission_photo_params, mission_photo)

	slot20 = self._folder_image
	slot17 = self._folder_image.y(self._folder_image.w(self._folder_image) * position_x) + self._folder_image.h(self._folder_image) * position_y

	mission_photo.set_center_y(mission_photo_params, mission_photo)

	slot17 = -0.7
	local rotation = math.random(mission_photo_params, -3)
	slot18 = rotation

	mission_photo.set_rotation(-3, mission_photo)

	slot18 = {
		initial_alpha = 1,
		final_alpha = 1,
		initial_x = 0.5,
		initial_y = 0.25,
		photo = mission_photo,
		rotation = rotation,
		position_x = position_x,
		position_y = position_y
	}

	table.insert(-3, self._mission_photos)

	slot17 = mission_photos
	mission_photo_data = table.remove(-3)
	mission_photo_params = {
		static = true,
		layer = 3,
		alpha = 0,
		photo = mission_photo_data.photo
	}
	mission_photo = self._folder_panel.create_custom_control(mission_photo_data.photo, self._folder_panel, RaidGUIControlIntelImage)
	position_x = math.random() * 0.07 + 0.65
	position_y = math.random() * 0.04 + 0.47
	slot21 = self._folder_image
	slot18 = self._folder_image.x(mission_photo_params) + self._folder_image.w(self._folder_image) * position_x

	mission_photo.set_center_x(mission_photo_data.photo, mission_photo)

	slot21 = self._folder_image
	slot18 = self._folder_image.y(self._folder_image.w(self._folder_image) * position_x) + self._folder_image.h(self._folder_image) * position_y

	mission_photo.set_center_y(mission_photo_data.photo, mission_photo)

	slot18 = -2
	rotation = math.random(mission_photo_data.photo, -2)
	slot18 = rotation

	mission_photo.set_rotation(mission_photo_data.photo, mission_photo)

	slot18 = {
		initial_alpha = 1,
		final_alpha = 1,
		initial_x = 0.5,
		photo = mission_photo,
		rotation = rotation,
		position_x = position_x,
		initial_y = position_y,
		position_y = position_y
	}

	table.insert(mission_photo_data.photo, self._mission_photos)

	mission_photo_data = table.remove(mission_photo_data.photo)
	slot18 = self._folder_mission_title
	mission_photo_params = {
		static = true,
		alpha = 0,
		photo = mission_photo_data.photo,
		layer = self._folder_mission_title.layer(mission_photos) + 1
	}
	mission_photo = self._folder_panel.create_custom_control(self._folder_mission_title.layer(mission_photos) + 1, self._folder_panel, RaidGUIControlIntelImage)
	position_x = math.random() * 0.07 + 0.31
	position_y = math.random() * 0.03 + 0.79
	slot21 = self._folder_image
	slot18 = self._folder_image.x(mission_photo_params) + self._folder_image.w(self._folder_image) * position_x

	mission_photo.set_center_x(self._folder_mission_title.layer(mission_photos) + 1, mission_photo)

	slot21 = self._folder_image
	slot18 = self._folder_image.y(self._folder_image.w(self._folder_image) * position_x) + self._folder_image.h(self._folder_image) * position_y

	mission_photo.set_center_y(self._folder_mission_title.layer(mission_photos) + 1, mission_photo)

	slot18 = 5
	rotation = math.random(self._folder_mission_title.layer(mission_photos) + 1, -2)
	slot18 = rotation

	mission_photo.set_rotation(self._folder_mission_title.layer(mission_photos) + 1, mission_photo)

	slot18 = {
		initial_alpha = 0,
		final_alpha = 1,
		initial_x = 0.5,
		initial_y = 0.6,
		photo = mission_photo,
		rotation = rotation,
		position_x = position_x,
		position_y = position_y
	}

	table.insert(self._folder_mission_title.layer(mission_photos) + 1, self._mission_photos)

	return 
end
function RaidGUIControlMissionUnlock:_fit_mission_title()
	local default_font_size = tweak_data.gui.font_sizes.size_32
	local font_sizes = {}
	slot5 = tweak_data.gui.font_sizes

	for index, size in pairs(slot4) do
		if size <= default_font_size then
			slot11 = size

			table.insert(slot9, font_sizes)
		end
	end

	slot5 = font_sizes

	table.sort(slot4)

	for i = #font_sizes, 1, -1 do
		slot10 = font_sizes[i]

		self._folder_mission_title.set_font_size(slot8, self._folder_mission_title)

		slot9 = self._folder_mission_title
		local _, _, w, _ = self._folder_mission_title.text_rect(slot8)
		slot13 = self._folder_mission_title

		if w <= self._folder_mission_title.w(slot12) then
			break
		end
	end

	return 
end
function RaidGUIControlMissionUnlock:_create_mission_description()
	local mission_tweak_data = tweak_data.operations.mission_data(slot2, tweak_data.operations)
	local mission_description_panel_params = {
		alpha = 0,
		name = "mission_description_panel",
		h = 192,
		w = 384,
		y = RaidGUIControlMissionUnlock.DESCRIPTION_Y
	}
	slot6 = mission_description_panel_params
	self._description_panel = self._object.panel(self._mission, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	self._description_panel.set_center_x(self._mission, self._description_panel)

	local mission_title_params = {
		h = 32,
		align = "center",
		vertical = "center",
		name = "mission_title",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot8 = true
	mission_title_params.text = self.translate(self._description_panel, self, mission_tweak_data.name_id)
	slot7 = mission_title_params
	self._mission_title = self._description_panel.text(self._description_panel, self._description_panel)
	local mission_description_params = {
		name = "mission_description",
		vertical = "top",
		wrap = true,
		align = "center",
		y = 48
	}
	slot7 = self._description_panel
	mission_description_params.h = self._description_panel.h(self._description_panel) - 32
	mission_description_params.font = tweak_data.gui.fonts.lato
	mission_description_params.font_size = tweak_data.gui.font_sizes.extra_small
	mission_description_params.color = tweak_data.gui.colors.raid_grey
	slot8 = mission_tweak_data.loading.text
	mission_description_params.text = self.translate(self._description_panel, self)
	slot8 = mission_description_params
	self._mission_description = self._description_panel.text(self._description_panel, self._description_panel)
	slot10 = self._description_panel
	slot8 = self._description_panel.w(slot9) / 2

	self._mission_description.set_center_x(self._description_panel, self._mission_description)

	return 
end
function RaidGUIControlMissionUnlock:close()
	return 
end
function RaidGUIControlMissionUnlock:mission()
	return self._mission
end
function RaidGUIControlMissionUnlock:on_mouse_released()
	slot4 = not self._active

	self.set_active(slot2, self)

	self._selected = self._active
	slot4 = "highlight"

	managers.menu_component.post_event(slot2, managers.menu_component)

	if self._on_click_callback then
		slot5 = self._active

		self._on_click_callback(slot2, self, self._mission)
	end

	return 
end
function RaidGUIControlMissionUnlock:on_double_click()
	if self._on_double_click_callback then
		slot4 = self._active

		self._on_double_click_callback(slot2, self._mission)

		return true
	end

	return false
end
function RaidGUIControlMissionUnlock:confirm_pressed()
	slot3 = self

	self.on_double_click(slot2)

	return 
end
function RaidGUIControlMissionUnlock:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlMissionUnlock.super.on_mouse_over(slot4, self, x)

	self._mouse_inside = true
	slot5 = self

	self._highlight_on(slot4)

	return 
end
function RaidGUIControlMissionUnlock:on_mouse_out(x, y)
	slot7 = y

	RaidGUIControlMissionUnlock.super.on_mouse_out(slot4, self, x)

	self._mouse_inside = false
	slot5 = self

	self._highlight_off(slot4)

	return 
end
function RaidGUIControlMissionUnlock:_highlight_on()
	if self._active then
		return 
	end

	slot3 = self._folder_image

	self._folder_image.stop(slot2)

	slot3 = self._folder_image
	slot8 = "_animate_open_folder"

	self._folder_image.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlMissionUnlock:_highlight_off()
	if self._active then
		return 
	end

	slot3 = self._folder_image

	self._folder_image.stop(slot2)

	slot3 = self._folder_image
	slot8 = "_animate_close_folder"

	self._folder_image.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlMissionUnlock:set_active(active)
	self._active = active
	slot5 = active

	self._background.set_visible(slot3, self._background)

	slot5 = active

	self._top_triangle.set_visible(slot3, self._top_triangle)

	slot5 = active

	self._bottom_triangle.set_visible(slot3, self._bottom_triangle)

	if not active and not self._mouse_inside then
		slot4 = self

		self._highlight_off(slot3)
	end

	return 
end
function RaidGUIControlMissionUnlock:set_selected(selected)
	if selected then
		slot4 = self

		self.select(slot3)
	else
		slot4 = self

		self.unselect(slot3)
	end

	slot4 = self

	self.on_mouse_released(slot3)

	return 
end
function RaidGUIControlMissionUnlock:select()
	self._selected = true
	slot3 = self._folder_image

	self._folder_image.stop(slot2)

	slot3 = self._folder_image
	slot8 = "_animate_open_folder"

	self._folder_image.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlMissionUnlock:unselect()
	self._selected = false
	slot3 = self._folder_image

	self._folder_image.stop(slot2)

	slot3 = self._folder_image
	slot8 = "_animate_close_folder"

	self._folder_image.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlMissionUnlock:_animate_open_folder(o)
	local duration = 0.4
	self._show_details_animation_t = self._show_details_animation_t or 0
	local t = self._show_details_animation_t * duration
	slot7 = "paper_shuffle_menu"

	managers.menu_component.post_event(slot5, managers.menu_component)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_offset = Easing.quartic_in_out(slot6, t, 0, RaidGUIControlMissionUnlock.ACTIVE_Y_OFFSET)
		slot11 = self._object
		slot9 = self._object.h(duration) / 2 - current_offset

		self._folder_panel.set_center_y(t, self._folder_panel)

		slot11 = duration
		local current_description_offset = Easing.quartic_in_out(t, t, RaidGUIControlMissionUnlock.DESCRIPTION_Y_OFFSET, -RaidGUIControlMissionUnlock.DESCRIPTION_Y_OFFSET)
		slot10 = RaidGUIControlMissionUnlock.DESCRIPTION_Y + current_description_offset

		self._description_panel.set_y(t, self._description_panel)

		if duration - t < 0.25 then
			slot12 = 0.25
			local current_description_alpha = Easing.quartic_in_out(slot8, t - duration - 0.2, 0, 1)
			slot11 = current_description_alpha

			self._description_panel.set_alpha(t - duration - 0.2, self._description_panel)
		end

		slot9 = self._mission_photos

		for index, photo_data in pairs(slot8) do
			local current_x = Easing.quartic_out(slot13, t, photo_data.initial_x, photo_data.position_x - photo_data.initial_x)
			slot19 = self._folder_image
			slot16 = self._folder_image.x(duration) + self._folder_image.w(self._folder_image) * current_x

			photo_data.photo.set_center_x(t, photo_data.photo)

			local current_y = Easing.quartic_out(t, t, photo_data.initial_y, photo_data.position_y - photo_data.initial_y)
			slot20 = self._folder_image
			slot17 = self._folder_image.y(duration) + self._folder_image.h(self._folder_image) * current_y

			photo_data.photo.set_center_y(t, photo_data.photo)

			slot19 = duration
			local current_photo_alpha = Easing.quartic_in_out(t, t, photo_data.initial_alpha, photo_data.final_alpha - photo_data.initial_alpha)
			slot18 = current_photo_alpha

			photo_data.photo.set_alpha(t, photo_data.photo)
		end

		self._show_details_animation_t = t / duration
	end

	self._show_details_animation_t = 1
	slot9 = self._object
	slot7 = self._object.h(slot8) / 2 - RaidGUIControlMissionUnlock.ACTIVE_Y_OFFSET

	self._folder_panel.set_center_y(slot5, self._folder_panel)

	slot7 = 1

	self._description_panel.set_alpha(slot5, self._description_panel)

	slot7 = RaidGUIControlMissionUnlock.DESCRIPTION_Y

	self._description_panel.set_y(slot5, self._description_panel)

	slot6 = self._mission_photos

	for index, photo_data in pairs(slot5) do
		slot15 = self._folder_image
		slot12 = self._folder_image.x(slot13) + self._folder_image.w(self._folder_image) * photo_data.position_x

		photo_data.photo.set_center_x(slot10, photo_data.photo)

		slot15 = self._folder_image
		slot12 = self._folder_image.y(self._folder_image.w(self._folder_image) * photo_data.position_x) + self._folder_image.h(self._folder_image) * photo_data.position_y

		photo_data.photo.set_center_y(slot10, photo_data.photo)

		slot12 = photo_data.final_alpha

		photo_data.photo.set_alpha(slot10, photo_data.photo)
	end

	return 
end
function RaidGUIControlMissionUnlock:_animate_close_folder(o)
	local duration = 0.4
	self._show_details_animation_t = self._show_details_animation_t or 0
	local t = (1 - self._show_details_animation_t) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_offset = Easing.quartic_in_out(slot6, t, RaidGUIControlMissionUnlock.ACTIVE_Y_OFFSET, -RaidGUIControlMissionUnlock.ACTIVE_Y_OFFSET)
		slot11 = self._object
		slot9 = self._object.h(duration) / 2 - current_offset

		self._folder_panel.set_center_y(t, self._folder_panel)

		slot11 = duration
		local current_description_offset = Easing.quartic_in_out(t, t, 0, RaidGUIControlMissionUnlock.DESCRIPTION_Y_OFFSET)
		slot10 = RaidGUIControlMissionUnlock.DESCRIPTION_Y + current_description_offset

		self._description_panel.set_y(t, self._description_panel)

		slot12 = 0.25
		local current_description_alpha = Easing.quartic_in_out(t, t, 1, -1)
		slot11 = current_description_alpha

		self._description_panel.set_alpha(t, self._description_panel)

		slot10 = self._mission_photos

		for index, photo_data in pairs(t) do
			local current_x = Easing.quartic_in(slot14, t, photo_data.position_x, photo_data.initial_x - photo_data.position_x)
			slot20 = self._folder_image
			slot17 = self._folder_image.x(duration) + self._folder_image.w(self._folder_image) * current_x

			photo_data.photo.set_center_x(t, photo_data.photo)

			local current_y = Easing.quartic_in(t, t, photo_data.position_y, photo_data.initial_y - photo_data.position_y)
			slot21 = self._folder_image
			slot18 = self._folder_image.y(duration) + self._folder_image.h(self._folder_image) * current_y

			photo_data.photo.set_center_y(t, photo_data.photo)

			slot20 = duration
			local current_photo_alpha = Easing.quartic_in_out(t, t, photo_data.final_alpha, photo_data.initial_alpha - photo_data.final_alpha)
			slot19 = current_photo_alpha

			photo_data.photo.set_alpha(t, photo_data.photo)
		end

		self._show_details_animation_t = 1 - t / duration
	end

	self._show_details_animation_t = 0
	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	self._folder_panel.set_center_y(slot5, self._folder_panel)

	slot7 = 0

	self._description_panel.set_alpha(slot5, self._description_panel)

	slot7 = RaidGUIControlMissionUnlock.DESCRIPTION_Y + RaidGUIControlMissionUnlock.DESCRIPTION_Y_OFFSET

	self._description_panel.set_y(slot5, self._description_panel)

	slot6 = self._mission_photos

	for index, photo_data in pairs(slot5) do
		slot15 = self._folder_image
		slot12 = self._folder_image.x(slot13) + self._folder_image.w(self._folder_image) * photo_data.initial_x

		photo_data.photo.set_center_x(slot10, photo_data.photo)

		slot15 = self._folder_image
		slot12 = self._folder_image.y(self._folder_image.w(self._folder_image) * photo_data.initial_x) + self._folder_image.h(self._folder_image) * photo_data.initial_y

		photo_data.photo.set_center_y(slot10, photo_data.photo)

		slot12 = photo_data.initial_alpha

		photo_data.photo.set_alpha(slot10, photo_data.photo)
	end

	return 
end

return 
