-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ComicBookGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

ComicBookGui = slot0
ComicBookGui.PAGE_WIDTH = 992
ComicBookGui.PAGE_HEIGHT = 768
ComicBookGui.TOTAL_PAGE_COUNT = 14
ComicBookGui.PAGING_NO_PAGE_COLOR_CIRCLE = tweak_data.gui.colors.raid_dark_grey
ComicBookGui.PAGING_NO_PAGE_COLOR_ARROW = tweak_data.gui.colors.raid_dark_grey
ComicBookGui.PAGING_NORMAL_PAGE_COLOR_CIRCLE = tweak_data.gui.colors.raid_grey_effects
ComicBookGui.PAGING_NORMAL_PAGE_COLOR_ARROW = tweak_data.gui.colors.raid_dirty_white
ComicBookGui.NORMAL_PAGE_HOVER_COLOR_CIRCLE = tweak_data.gui.colors.raid_red
ComicBookGui.NORMAL_PAGE_HOVER_COLOR_ARROW = tweak_data.gui.colors.raid_dirty_white
ComicBookGui.BULLET_PANEL_HEIGHT = 32
ComicBookGui.BULLET_WIDTH = 16
ComicBookGui.BULLET_HEIGHT = 16
ComicBookGui.BULLET_PADDING = 2
ComicBookGui.ANIMATION_DURATION = 1
ComicBookGui.PAGE_NAME = "ui/comic_book/raid_comic_"
function ComicBookGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	ComicBookGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "menu_comic_book_screen_name"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	slot7 = self

	self._process_comic_book(slot6)

	return 
end
function ComicBookGui:_set_initial_data()
	self._current_page = 1
	self._bullets_normal = {}
	self._bullets_active = {}

	return 
end
function ComicBookGui:close()
	slot3 = self

	ComicBookGui.super.close(slot2)

	return 
end
function ComicBookGui:_layout()
	slot3 = self

	self._disable_dof(slot2)

	slot4 = {
		visible = true,
		y = 0,
		x = 0,
		w = tweak_data.gui.icons.players_icon_outline.texture_rect[3],
		h = tweak_data.gui.icons.players_icon_outline.texture_rect[4]
	}
	self._left_arrow = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		visible = true,
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons.players_icon_outline.texture,
		texture_rect = tweak_data.gui.icons.players_icon_outline.texture_rect,
		color = ComicBookGui.PAGING_NO_PAGE_COLOR_CIRCLE,
		highlight_color = ComicBookGui.NORMAL_PAGE_HOVER_COLOR_CIRCLE,
		on_click_callback = callback(slot6, self, self)
	}
	slot9 = "_on_left_arrow_clicked"
	self._left_arrow_circle = self._left_arrow.image_button(slot2, self._left_arrow)
	slot4 = {
		visible = true,
		y = 7,
		x = 7,
		texture = tweak_data.gui.icons.ico_page_turn_left.texture,
		texture_rect = tweak_data.gui.icons.ico_page_turn_left.texture_rect,
		color = ComicBookGui.PAGING_NO_PAGE_COLOR_ARROW
	}
	self._left_arrow_arrow = self._left_arrow.bitmap(slot2, self._left_arrow)
	slot4 = 176

	self._left_arrow.set_center_x(slot2, self._left_arrow)

	slot4 = 464

	self._left_arrow.set_center_y(slot2, self._left_arrow)

	slot4 = {
		visible = true,
		y = 0,
		x = 0,
		w = tweak_data.gui.icons.players_icon_outline.texture_rect[3],
		h = tweak_data.gui.icons.players_icon_outline.texture_rect[4]
	}
	self._right_arrow = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		visible = true,
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons.players_icon_outline.texture,
		texture_rect = tweak_data.gui.icons.players_icon_outline.texture_rect,
		color = ComicBookGui.PAGING_NO_PAGE_COLOR_CIRCLE,
		highlight_color = ComicBookGui.NORMAL_PAGE_HOVER_COLOR_CIRCLE,
		on_click_callback = callback(slot6, self, self)
	}
	slot9 = "_on_right_arrow_clicked"
	self._right_arrow_circle = self._right_arrow.image_button(slot2, self._right_arrow)
	slot4 = {
		visible = true,
		y = 7,
		x = 7,
		texture = tweak_data.gui.icons.ico_page_turn_right.texture,
		texture_rect = tweak_data.gui.icons.ico_page_turn_right.texture_rect,
		color = ComicBookGui.PAGING_NO_PAGE_COLOR_ARROW
	}
	self._right_arrow_arrow = self._right_arrow.bitmap(slot2, self._right_arrow)
	slot4 = 1552

	self._right_arrow.set_center_x(slot2, self._right_arrow)

	slot4 = 464

	self._right_arrow.set_center_y(slot2, self._right_arrow)

	slot4 = {
		texture = "ui/comic_book/raid_comic_001",
		visible = true,
		y = 96,
		x = 0,
		w = ComicBookGui.PAGE_WIDTH,
		h = ComicBookGui.PAGE_HEIGHT
	}
	self._comic_book_image = self._root_panel.bitmap(slot2, self._root_panel)
	slot3 = self._comic_book_image

	self._comic_book_image.set_center_x(slot2, self._root_panel.center_x(ComicBookGui.PAGE_HEIGHT))

	slot4 = {
		h = 32,
		x = 0,
		y = self._root_panel.h(self._root_panel) - ComicBookGui.BULLET_PANEL_HEIGHT * 2,
		w = self._root_panel.w(ComicBookGui.BULLET_PANEL_HEIGHT * 2)
	}
	slot7 = self._root_panel
	slot7 = self._root_panel
	self._bullet_panel = self._root_panel.panel(slot2, self._root_panel)

	for i = 1, ComicBookGui.TOTAL_PAGE_COUNT, 1 do
		slot7 = self._bullets_normal
		slot11 = {
			x = (i - 1) * (ComicBookGui.BULLET_WIDTH + ComicBookGui.BULLET_PADDING),
			y = ComicBookGui.BULLET_HEIGHT / 2,
			w = ComicBookGui.BULLET_WIDTH,
			h = ComicBookGui.BULLET_HEIGHT,
			texture = tweak_data.gui.icons.bullet_empty.texture,
			texture_rect = tweak_data.gui.icons.bullet_empty.texture_rect
		}

		table.insert(slot6, self._bullet_panel.bitmap(slot9, self._bullet_panel))

		slot7 = self._bullets_active
		slot11 = {
			h = 0,
			w = 0,
			x = (i - 1) * (ComicBookGui.BULLET_WIDTH + ComicBookGui.BULLET_PADDING),
			y = ComicBookGui.BULLET_HEIGHT / 2,
			texture = tweak_data.gui.icons.bullet_active.texture,
			texture_rect = tweak_data.gui.icons.bullet_active.texture_rect
		}

		table.insert(slot6, self._bullet_panel.bitmap(slot9, self._bullet_panel))
	end

	slot4 = ComicBookGui.TOTAL_PAGE_COUNT * (ComicBookGui.BULLET_WIDTH + ComicBookGui.BULLET_PADDING)

	self._bullet_panel.set_w(slot2, self._bullet_panel)

	slot6 = self._root_panel
	slot4 = self._root_panel.w(ComicBookGui.BULLET_WIDTH + ComicBookGui.BULLET_PADDING) / 2

	self._bullet_panel.set_center_x(slot2, self._bullet_panel)

	slot4 = ComicBookGui.BULLET_WIDTH

	self._bullets_active[1].set_w(slot2, self._bullets_active[1])

	slot4 = ComicBookGui.BULLET_HEIGHT

	self._bullets_active[1].set_h(slot2, self._bullets_active[1])

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function ComicBookGui:_process_comic_book()
	slot4 = "paper_shuffle_menu"

	managers.menu_component.post_event(slot2, managers.menu_component)

	if self._current_page == 1 then
		slot4 = ComicBookGui.PAGING_NO_PAGE_COLOR_CIRCLE

		self._left_arrow_circle.set_color(slot2, self._left_arrow_circle)

		slot4 = ComicBookGui.PAGING_NO_PAGE_COLOR_ARROW

		self._left_arrow_arrow.set_color(slot2, self._left_arrow_arrow)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_CIRCLE

		self._right_arrow_circle.set_color(slot2, self._right_arrow_circle)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_ARROW

		self._right_arrow_arrow.set_color(slot2, self._right_arrow_arrow)

		slot4 = ComicBookGui.PAGE_WIDTH / 2

		self._comic_book_image.set_w(slot2, self._comic_book_image)

		slot5 = true

		self._left_arrow_circle.set_param_value(slot2, self._left_arrow_circle, "no_highlight")

		slot5 = false

		self._right_arrow_circle.set_param_value(slot2, self._right_arrow_circle, "no_highlight")

		slot3 = self

		self.bind_controller_inputs_right_only(slot2)
	elseif self._current_page == ComicBookGui.TOTAL_PAGE_COUNT then
		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_CIRCLE

		self._left_arrow_circle.set_color(slot2, self._left_arrow_circle)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_ARROW

		self._left_arrow_arrow.set_color(slot2, self._left_arrow_arrow)

		slot4 = ComicBookGui.PAGING_NO_PAGE_COLOR_CIRCLE

		self._right_arrow_circle.set_color(slot2, self._right_arrow_circle)

		slot4 = ComicBookGui.PAGING_NO_PAGE_COLOR_ARROW

		self._right_arrow_arrow.set_color(slot2, self._right_arrow_arrow)

		slot4 = ComicBookGui.PAGE_WIDTH / 2

		self._comic_book_image.set_w(slot2, self._comic_book_image)

		slot5 = false

		self._left_arrow_circle.set_param_value(slot2, self._left_arrow_circle, "no_highlight")

		slot5 = true

		self._right_arrow_circle.set_param_value(slot2, self._right_arrow_circle, "no_highlight")

		slot3 = self

		self.bind_controller_inputs_left_only(slot2)
	else
		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_CIRCLE

		self._left_arrow_circle.set_color(slot2, self._left_arrow_circle)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_ARROW

		self._left_arrow_arrow.set_color(slot2, self._left_arrow_arrow)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_CIRCLE

		self._right_arrow_circle.set_color(slot2, self._right_arrow_circle)

		slot4 = ComicBookGui.PAGING_NORMAL_PAGE_COLOR_ARROW

		self._right_arrow_arrow.set_color(slot2, self._right_arrow_arrow)

		slot4 = ComicBookGui.PAGE_WIDTH

		self._comic_book_image.set_w(slot2, self._comic_book_image)

		slot5 = false

		self._left_arrow_circle.set_param_value(slot2, self._left_arrow_circle, "no_highlight")

		slot5 = false

		self._right_arrow_circle.set_param_value(slot2, self._right_arrow_circle, "no_highlight")

		slot3 = self

		self.bind_controller_inputs(slot2)
	end

	slot3 = self._comic_book_image

	self._comic_book_image.set_center_x(slot2, self._root_panel.center_x(slot5))

	slot8 = self._current_page
	slot4 = ComicBookGui.PAGE_NAME .. string.format(self._root_panel, "%03d")

	self._comic_book_image.set_image(slot2, self._comic_book_image)

	return 
end
function ComicBookGui:_animate_bullets(params)
	local current_page = params.current_page
	local previous_page = params.previous_page
	slot7 = 0

	self._bullets_active[previous_page].set_w(slot5, self._bullets_active[previous_page])

	slot7 = 0

	self._bullets_active[previous_page].set_h(slot5, self._bullets_active[previous_page])

	slot7 = 0

	self._bullets_active[current_page].set_w(slot5, self._bullets_active[current_page])

	slot7 = 0

	self._bullets_active[current_page].set_h(slot5, self._bullets_active[current_page])

	local t = 0
	local animation_duration = ComicBookGui.ANIMATION_DURATION

	while t < animation_duration do

		-- Decompilation error in this vicinity:
		local dt = coroutine.yield()
		t = t + dt
	end

	return 
end
function ComicBookGui:_stop_animation(current_page, previous_page)
	if previous_page then
		slot6 = 0

		self._bullets_active[previous_page].set_w(slot4, self._bullets_active[previous_page])

		slot6 = 0

		self._bullets_active[previous_page].set_h(slot4, self._bullets_active[previous_page])
	end

	if current_page then
		slot6 = 0

		self._bullets_active[current_page].set_w(slot4, self._bullets_active[current_page])

		slot6 = 0

		self._bullets_active[current_page].set_h(slot4, self._bullets_active[current_page])
	end

	slot5 = self._bullet_panel

	self._bullet_panel.stop(slot4)

	return 
end
function ComicBookGui:_page_left()
	if self._current_page == 1 then
		return 
	end

	slot5 = self._previous_page

	self._stop_animation(slot2, self, self._current_page)

	self._previous_page = self._current_page
	self._current_page = self._current_page - 1

	if self._current_page < 1 then
		self._current_page = 1
	end

	slot3 = self

	self._process_comic_book(slot2)

	slot3 = self._bullet_panel
	slot9 = {
		current_page = self._current_page,
		previous_page = self._previous_page
	}

	self._bullet_panel.animate(slot2, callback(slot5, self, self, "_animate_bullets"))

	slot5 = self._current_page

	Application.trace(slot2, Application, "[ComicBookGui:_page_left] self._current_page ")

	return 
end
function ComicBookGui:_page_right()
	if self._current_page == ComicBookGui.TOTAL_PAGE_COUNT then
		return 
	end

	slot5 = self._previous_page

	self._stop_animation(slot2, self, self._current_page)

	self._previous_page = self._current_page
	self._current_page = self._current_page + 1

	if ComicBookGui.TOTAL_PAGE_COUNT < self._current_page then
		self._current_page = ComicBookGui.TOTAL_PAGE_COUNT
	end

	slot3 = self

	self._process_comic_book(slot2)

	slot3 = self._bullet_panel
	slot9 = {
		current_page = self._current_page,
		previous_page = self._previous_page
	}

	self._bullet_panel.animate(slot2, callback(slot5, self, self, "_animate_bullets"))

	slot5 = self._current_page

	Application.trace(slot2, Application, "[ComicBookGui:_page_right] self._current_page ")

	return 
end
function ComicBookGui:_on_left_arrow_clicked()
	slot3 = self

	self._page_left(slot2)

	return 
end
function ComicBookGui:_on_right_arrow_clicked()
	slot3 = self

	self._page_right(slot2)

	return 
end
function ComicBookGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_left_arrow_clicked"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_right_arrow_clicked"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_comic_book_left",
			"menu_legend_comic_book_right"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot7 = true

	self.set_controller_bindings(, self, bindings)

	slot6 = legend

	self.set_legend(, self)

	return 
end
function ComicBookGui:bind_controller_inputs_left_only()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_left_arrow_clicked"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_comic_book_left"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot7 = true

	self.set_controller_bindings(, self, bindings)

	slot6 = legend

	self.set_legend(, self)

	return 
end
function ComicBookGui:bind_controller_inputs_right_only()
	local bindings = {}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_right_arrow_clicked"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_comic_book_right"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot7 = true

	self.set_controller_bindings(, self, bindings)

	slot6 = legend

	self.set_legend(, self)

	return 
end
function ComicBookGui:confirm_pressed()
	return false
end

return 
