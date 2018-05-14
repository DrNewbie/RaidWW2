if not SpecializationBoxGui then
	slot2 = TextBoxGui
	slot0 = class(slot1)
end

SpecializationBoxGui = slot0
SpecializationBoxGui.TEXT = ""
SpecializationBoxGui.init = function (self, ...)
	local ws, title, text, content_data, config = ...
	config.forced_h = 210
	config.w = 600
	config.is_title_outside = true
	slot8 = self

	SpecializationBoxGui.super.init(slot7, ...)

	return 
end

local function make_fine_text(text)
	slot3 = text
	local x, y, w, h = text.text_rect(slot2)
	slot7 = text

	if text.wrap(slot6) == true then
		slot8 = h

		text.set_h(slot6, text)
	else
		slot9 = h

		text.set_size(slot6, text, w)
	end

	slot8 = math.round(text.x(slot11))
	slot13 = text

	text.set_position(slot6, text, math.round(text.y(text)))

	return 
end

SpecializationBoxGui._create_text_box = function (self, ws, title, text, content_data, config)
	slot13 = config
	local panel = SpecializationBoxGui.super._create_text_box(slot7, self, ws, title, text, content_data)
	local xp_present = content_data.xp_present
	slot11 = "points"
	local available_points = managers.skilltree.get_specialization_value(ws, managers.skilltree)
	slot12 = available_points
	local points_present = math.min(managers.skilltree, content_data.points_present)
	slot12 = xp_present / points_present
	local conversion_rate_number = math.round(content_data.points_present)
	local small_text = {
		text = "",
		blend_mode = "add",
		layer = 1,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size
	}
	local medium_text = {
		text = "",
		blend_mode = "add",
		layer = 1,
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size
	}
	slot16 = medium_text
	local progress_text = self._scroll_panel.text(slot14, self._scroll_panel)

	progress_text.set_position(self._scroll_panel, progress_text, 10)

	slot16 = progress_text
	slot20 = "menu_st_spec_xp_progress"

	progress_text.set_text(self._scroll_panel, managers.localization.to_upper_text(30, managers.localization))

	slot16 = progress_text

	make_fine_text(self._scroll_panel)

	slot17 = {
		alpha = 0.4,
		layer = 1,
		h = progress_text.h(managers.localization),
		color = Color.black
	}
	slot20 = progress_text
	local progress_bg = self._scroll_panel.rect(self._scroll_panel, self._scroll_panel)
	slot18 = progress_text.right(managers.localization) + 4
	slot21 = progress_text

	progress_bg.set_position(self._scroll_panel, progress_bg, progress_text.top(progress_text))

	slot21 = progress_bg
	slot18 = self._scroll_panel.w(progress_text.top) - progress_bg.left(self._scroll_panel) - 5

	progress_bg.set_w(self._scroll_panel, progress_bg)

	slot18 = {
		alpha = 1,
		blend_mode = "add",
		layer = 2,
		color = Color.white
	}
	local progress_bar = self._scroll_panel.rect(self._scroll_panel, self._scroll_panel)
	slot18 = progress_bar
	slot21 = progress_bg

	progress_bar.set_shape(self._scroll_panel, progress_bg.shape(self._scroll_panel))

	slot19 = 0

	progress_bar.set_w(self._scroll_panel, progress_bar)

	slot20 = -4

	progress_bar.grow(self._scroll_panel, progress_bar, 0)
	progress_bar.move(self._scroll_panel, progress_bar, 2)

	slot18 = progress_bar

	progress_bar.set_center_y(self._scroll_panel, progress_bg.center_y(0))

	slot19 = {
		alpha = 1,
		blend_mode = "add",
		layer = 3,
		color = Color.white
	}
	local progress_end = self._scroll_panel.rect(self._scroll_panel, self._scroll_panel)
	slot19 = progress_end
	slot22 = progress_bg

	progress_end.set_shape(self._scroll_panel, progress_bg.shape(progress_bg))

	slot20 = 2

	progress_end.set_w(self._scroll_panel, progress_end)
	progress_end.grow(self._scroll_panel, progress_end, 0)

	slot19 = progress_end
	slot22 = progress_bg

	progress_end.set_center_y(self._scroll_panel, progress_bg.center_y(-4))

	slot19 = progress_end

	progress_end.set_right(self._scroll_panel, progress_bg.right(-4))

	slot20 = small_text
	local conversion_rate_text = self._scroll_panel.text(self._scroll_panel, self._scroll_panel)
	slot20 = conversion_rate_text
	slot25 = {
		rate = string.format(slot27, "%i:1")
	}
	slot29 = conversion_rate_number

	conversion_rate_text.set_text(self._scroll_panel, managers.localization.to_upper_text(progress_bg, managers.localization, "menu_st_spec_xp_conversion"))

	slot20 = conversion_rate_text

	make_fine_text(self._scroll_panel)

	slot22 = progress_bg.bottom(progress_bg) + 2

	conversion_rate_text.set_position(self._scroll_panel, conversion_rate_text, progress_bg.left(progress_bg))

	slot21 = progress_text
	local w = progress_bg.right(self._scroll_panel) - progress_text.left(progress_bg)
	slot22 = {
		layer = 2
	}
	local exp_panel = self._scroll_panel.panel(progress_bg, self._scroll_panel)
	slot22 = exp_panel
	slot25 = progress_text

	exp_panel.set_left(self._scroll_panel, progress_text.left(progress_bg))

	slot23 = w / 2 - 10

	exp_panel.set_w(self._scroll_panel, exp_panel)

	slot25 = conversion_rate_text
	slot23 = conversion_rate_text.bottom(progress_bg) + 20

	exp_panel.set_top(self._scroll_panel, exp_panel)

	slot26 = exp_panel
	slot23 = self._scroll_panel.h(progress_bg) - exp_panel.top(self._scroll_panel) - 10

	exp_panel.set_h(self._scroll_panel, exp_panel)

	slot24 = {
		sides = {
			1,
			1,
			1,
			1
		}
	}

	BoxGuiObject.new(self._scroll_panel, BoxGuiObject, exp_panel)

	slot23 = small_text
	local exp_title_text = exp_panel.text(self._scroll_panel, exp_panel)
	slot24 = true

	exp_title_text.set_wrap(exp_panel, exp_title_text)

	slot24 = true

	exp_title_text.set_word_wrap(exp_panel, exp_title_text)
	exp_title_text.set_position(exp_panel, exp_title_text, 5)

	slot26 = exp_panel
	slot24 = exp_panel.w(5) - 10

	exp_title_text.set_w(exp_panel, exp_title_text)

	slot23 = exp_title_text
	slot27 = "menu_st_spec_xp_gained"

	exp_title_text.set_text(exp_panel, managers.localization.to_upper_text(5, managers.localization))

	slot23 = exp_title_text

	make_fine_text(exp_panel)

	slot24 = medium_text
	local exp_count_text = exp_panel.text(exp_panel, exp_panel)
	slot25 = exp_title_text.left(managers.localization) + 10

	exp_count_text.set_position(exp_panel, exp_count_text, exp_title_text.bottom(exp_title_text))

	slot24 = exp_count_text
	slot29 = xp_present

	exp_count_text.set_text(exp_panel, string.add_decimal_marks_to_string(tostring(exp_title_text)))

	slot24 = exp_count_text

	make_fine_text(exp_panel)

	slot25 = {
		layer = 2
	}
	local points_panel = self._scroll_panel.panel(exp_panel, self._scroll_panel)
	slot26 = w / 2 - 10

	points_panel.set_w(self._scroll_panel, points_panel)

	slot25 = points_panel
	slot28 = progress_bg

	points_panel.set_right(self._scroll_panel, progress_bg.right(tostring))

	slot25 = points_panel
	slot28 = exp_panel

	points_panel.set_top(self._scroll_panel, exp_panel.top(tostring))

	slot25 = points_panel
	slot28 = exp_panel

	points_panel.set_h(self._scroll_panel, exp_panel.h(tostring))

	slot27 = {
		sides = {
			1,
			1,
			1,
			1
		}
	}

	BoxGuiObject.new(self._scroll_panel, BoxGuiObject, points_panel)

	slot26 = small_text
	local points_gained_title_text = points_panel.text(self._scroll_panel, points_panel)

	points_gained_title_text.set_position(points_panel, points_gained_title_text, 5)

	slot26 = points_gained_title_text
	slot30 = "menu_st_spec_xp_perk_gained"

	points_gained_title_text.set_text(points_panel, managers.localization.to_upper_text(5, managers.localization))

	slot26 = points_gained_title_text

	make_fine_text(points_panel)

	slot27 = medium_text
	local points_gained_count_text = points_panel.text(points_panel, points_panel)
	slot28 = points_gained_title_text.left(managers.localization) + 10

	points_gained_count_text.set_position(points_panel, points_gained_count_text, points_gained_title_text.bottom(points_gained_title_text))

	slot27 = points_gained_count_text
	slot32 = 0

	points_gained_count_text.set_text(points_panel, string.add_decimal_marks_to_string(tostring(points_gained_title_text)))

	slot27 = points_gained_count_text

	make_fine_text(points_panel)

	slot28 = small_text
	local available_points_title_text = points_panel.text(points_panel, points_panel)
	slot32 = points_gained_count_text

	available_points_title_text.set_position(points_panel, available_points_title_text, points_gained_title_text.left(tostring))

	slot28 = available_points_title_text
	slot32 = "menu_st_spec_xp_perk_total"

	available_points_title_text.set_text(points_panel, managers.localization.to_upper_text(points_gained_count_text.bottom(points_gained_title_text) + 2, managers.localization))

	slot28 = available_points_title_text

	make_fine_text(points_panel)

	slot29 = medium_text
	local available_points_count_text = points_panel.text(points_panel, points_panel)
	slot30 = available_points_title_text.left(managers.localization) + 10

	available_points_count_text.set_position(points_panel, available_points_count_text, available_points_title_text.bottom(available_points_title_text))

	slot29 = available_points_count_text
	slot34 = available_points - points_present

	available_points_count_text.set_text(points_panel, string.add_decimal_marks_to_string(tostring(available_points_title_text)))

	slot29 = available_points_count_text

	make_fine_text(points_panel)

	slot29 = self._panel
	slot34 = self._panel

	self._panel.set_y(points_panel, math.round(self._panel.y(available_points_title_text)))

	slot34 = self._scroll_panel

	self._scroll_panel.set_y(points_panel, math.round(self._scroll_panel.y(available_points_title_text)))

	slot31 = progress_bar
	self._anim_data = {
		progress_width = 0,
		start_points_present = 0,
		points_present = 0,
		goto_end = false,
		start_progress_width = 0,
		end_xp_present = 0,
		progress_bar = progress_bar,
		end_progress_width = progress_end.right(self._scroll_panel) - progress_bar.left(progress_end),
		exp_count_text = exp_count_text,
		points_gained_count_text = points_gained_count_text,
		available_points_count_text = available_points_count_text,
		start_xp_present = xp_present,
		xp_present = xp_present,
		end_points_present = points_present,
		start_available_points_present = available_points - points_present,
		end_available_points_present = available_points,
		available_points_present = available_points - points_present,
		conversion_rate = conversion_rate_number
	}
	local xp_present = content_data.xp_present
	local points_present = content_data.points_present
	slot31 = xp_present / points_present
	local conversion_rate_number = math.round(progress_end)

	return 
end
SpecializationBoxGui.chk_close = function (self)
	if not self._anim_data or self._anim_data.conversion_ended then
		return true
	end

	self._anim_data.goto_end = true

	return false
end
SpecializationBoxGui._update = function (o, self)
	local init_done = false

	while not init_done do
		init_done = not not self._anim_data

		coroutine.yield()
	end

	wait(slot4)

	local dt = nil
	slot7 = self._anim_data.end_points_present / 20
	local speed = math.max(1, 5)
	slot8 = "count_1"

	managers.menu_component.post_event(5, managers.menu_component)

	while self._anim_data and not self._anim_data.goto_end and (self._anim_data.xp_present ~= self._anim_data.end_xp_present or self._anim_data.points_present ~= self._anim_data.end_points_present) do
		dt = coroutine.yield()
		slot10 = self._anim_data.conversion_rate * dt * speed
		self._anim_data.xp_present = math.step(slot7, self._anim_data.xp_present, self._anim_data.end_xp_present)
		slot10 = dt * speed
		self._anim_data.points_present = math.step(slot7, self._anim_data.points_present, self._anim_data.end_points_present)
		self._anim_data.available_points_present = self._anim_data.start_available_points_present + self._anim_data.points_present
		slot7 = self._anim_data.exp_count_text
		slot14 = self._anim_data.xp_present

		self._anim_data.exp_count_text.set_text(self._anim_data.start_available_points_present + self._anim_data.points_present, string.add_decimal_marks_to_string(tostring(math.round(slot13))))

		slot7 = self._anim_data.exp_count_text

		make_fine_text(self._anim_data.start_available_points_present + self._anim_data.points_present)

		slot7 = self._anim_data.points_gained_count_text
		slot14 = self._anim_data.points_present

		self._anim_data.points_gained_count_text.set_text(self._anim_data.start_available_points_present + self._anim_data.points_present, string.add_decimal_marks_to_string(tostring(math.round(slot13))))

		slot7 = self._anim_data.points_gained_count_text

		make_fine_text(self._anim_data.start_available_points_present + self._anim_data.points_present)

		slot7 = self._anim_data.available_points_count_text
		slot14 = self._anim_data.available_points_present

		self._anim_data.available_points_count_text.set_text(self._anim_data.start_available_points_present + self._anim_data.points_present, string.add_decimal_marks_to_string(tostring(math.round(slot13))))
		make_fine_text(self._anim_data.start_available_points_present + self._anim_data.points_present)

		slot10 = self._anim_data.points_present / self._anim_data.end_points_present
		self._anim_data.progress_width = math.lerp(self._anim_data.available_points_count_text, self._anim_data.start_progress_width, self._anim_data.end_progress_width)
		slot8 = self._anim_data.progress_width

		self._anim_data.progress_bar.set_width(math.lerp(self._anim_data.available_points_count_text, self._anim_data.start_progress_width, self._anim_data.end_progress_width), self._anim_data.progress_bar)

		speed = speed + speed * 0.2 * dt
	end

	slot8 = "count_1_finished"

	managers.menu_component.post_event(slot6, managers.menu_component)

	slot7 = self._anim_data.exp_count_text
	slot14 = self._anim_data.end_xp_present

	self._anim_data.exp_count_text.set_text(slot6, string.add_decimal_marks_to_string(tostring(math.round(slot13))))

	slot7 = self._anim_data.exp_count_text

	make_fine_text(slot6)

	slot7 = self._anim_data.points_gained_count_text
	slot14 = self._anim_data.end_points_present

	self._anim_data.points_gained_count_text.set_text(slot6, string.add_decimal_marks_to_string(tostring(math.round(slot13))))

	slot7 = self._anim_data.points_gained_count_text

	make_fine_text(slot6)

	slot7 = self._anim_data.available_points_count_text
	slot14 = self._anim_data.end_available_points_present

	self._anim_data.available_points_count_text.set_text(slot6, string.add_decimal_marks_to_string(tostring(math.round(slot13))))

	slot7 = self._anim_data.available_points_count_text

	make_fine_text(slot6)

	slot8 = self._anim_data.end_progress_width

	self._anim_data.progress_bar.set_width(slot6, self._anim_data.progress_bar)

	self._anim_data.conversion_ended = true

	return 
end

return 
