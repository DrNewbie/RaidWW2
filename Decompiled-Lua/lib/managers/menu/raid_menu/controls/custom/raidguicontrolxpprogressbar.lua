if not RaidGUIControlXPProgressBar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlXPProgressBar = slot0
RaidGUIControlXPProgressBar.DEFAULT_H = 177
RaidGUIControlXPProgressBar.INNER_PANEL_H = 177
RaidGUIControlXPProgressBar.PROGRESS_BAR_H = 32
RaidGUIControlXPProgressBar.LEVEL_LABELS_PANEL_H = 64
RaidGUIControlXPProgressBar.LEVEL_LABELS_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPProgressBar.LEVEL_LABELS_FONT_SIZE = tweak_data.gui.font_sizes.size_46
RaidGUIControlXPProgressBar.LEVEL_LABELS_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPProgressBar.LEVEL_LABELS_W = 100
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICONS_PANEL_H = 32
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICON = "icon_weapon_unlocked"
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICON_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_18
RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT = 6
RaidGUIControlXPProgressBar.LEVEL_MARK_ICON = "slider_mid_dot"
RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE = 8
RaidGUIControlXPProgressBar.MARKS_PER_LEVEL = 5
RaidGUIControlXPProgressBar.SLIDER_PIMPLE_ICON = "slider_pimple"
RaidGUIControlXPProgressBar.SLIDER_PIMPLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPProgressBar.SLIDER_PIN_ICON = "slider_pin"
RaidGUIControlXPProgressBar.SLIDER_PIN_Y = 55
slot3 = "787878"
RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_INACTIVE = Color(slot2)
RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_ACTIVE = tweak_data.gui.colors.raid_red
RaidGUIControlXPProgressBar.NEW_XP_W = 256
RaidGUIControlXPProgressBar.NEW_XP_H = 64
RaidGUIControlXPProgressBar.NEW_XP_TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPProgressBar.NEW_XP_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlXPProgressBar.NEW_XP_TEXT_COLOR = tweak_data.gui.colors.raid_white
function RaidGUIControlXPProgressBar:init(parent, params)
	params.horizontal_padding = params.horizontal_padding or 0
	slot7 = params

	RaidGUIControlXPProgressBar.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlXPProgressBar:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_panels(slot4)

	slot5 = self._inner_panel
	self._bar_w = self._inner_panel.w(slot4) - self._params.horizontal_padding * 2
	self._current_level = params.initial_level or 1
	self._horizontal_padding = self._params.horizontal_padding or 0
	slot5 = self

	self._create_progress_bar(slot4)

	slot5 = self

	self._create_slider_pimples(slot4)

	slot5 = self

	self._create_level_marks_on_progress_bar(slot4)

	slot5 = self

	self._create_level_and_weapons_info(slot4)

	slot5 = self

	self._create_new_xp_label(slot4)

	self._progress = params.initial_progress or 0
	slot7 = 0

	self.set_progress(slot4, self, self._progress)

	return 
end
function RaidGUIControlXPProgressBar:close()
	return 
end
function RaidGUIControlXPProgressBar:_create_panels()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_panel") + 1
	control_params.w = self._params.w
	control_params.h = self._params.h or RaidGUIControlXPProgressBar.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel
	control_params.x = 0
	control_params.y = 0
	control_params.w = self._params.bar_w or control_params.w
	control_params.h = RaidGUIControlXPProgressBar.INNER_PANEL_H
	slot5 = control_params
	self._inner_panel = self._object.panel(self._params, self._object)

	return 
end
function RaidGUIControlXPProgressBar:_create_progress_bar()
	local progress_bar_params = {
		left = "slider_large_left",
		name = "progress_bar",
		y = 0,
		center = "slider_large_center",
		x = 0,
		right = "slider_large_right",
		w = self._bar_w + self._horizontal_padding * 2,
		h = self._params.progress_bar_h or RaidGUIControlXPProgressBar.PROGRESS_BAR_H
	}
	slot5 = progress_bar_params
	self._progress_bar = self._inner_panel.progress_bar_simple(slot3, self._inner_panel)
	slot5 = 96

	self._progress_bar.set_bottom(slot3, self._progress_bar)

	slot5 = self._progress_bar
	self._progress_padding = self._horizontal_padding / self._progress_bar.w(self._progress_bar)
	slot5 = self._progress_bar
	self._progress_multiplier = self._bar_w / self._progress_bar.w(self._progress_bar)

	return 
end
function RaidGUIControlXPProgressBar:_create_slider_pimples()
	local icon = RaidGUIControlXPProgressBar.SLIDER_PIMPLE_ICON
	slot5 = icon
	local icon_w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	slot6 = icon
	local icon_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	local pin_icon = RaidGUIControlXPProgressBar.SLIDER_PIN_ICON
	local slider_pimples_panel_params = {
		name = "slider_pimples_panel",
		x = 0
	}
	slot8 = self._progress_bar
	slider_pimples_panel_params.y = self._progress_bar.y(slot7) - icon_h
	slot8 = self._inner_panel
	slider_pimples_panel_params.w = self._inner_panel.w(slot7)
	slider_pimples_panel_params.h = icon_h
	slot8 = self._progress_bar
	slider_pimples_panel_params.layer = self._progress_bar.layer(slot7) + 5
	slot9 = slider_pimples_panel_params
	self._slider_pimples_panel = self._inner_panel.panel(slot7, self._inner_panel)
	local current_level = 1
	local level_cap = managers.experience.level_cap(self._inner_panel)
	slot10 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(managers.experience)
	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]
	self._level_pins = {}

	while current_level <= level_cap do
		local level_mark_params = {
			y = 0,
			name = "slider_pimple_" .. current_level,
			x = (self._params.horizontal_padding + ((current_level - 1) * self._bar_w) / (level_cap - 1)) - icon_w / 2,
			w = icon_w,
			h = icon_h,
			color = RaidGUIControlXPProgressBar.SLIDER_PIMPLE_COLOR,
			texture = tweak_data.gui.icons[icon].texture,
			texture_rect = tweak_data.gui.icons[icon].texture_rect
		}
		local level_mark = self._slider_pimples_panel.image(icon_w / 2, self._slider_pimples_panel)
		local level_pin_params = {
			layer = 200,
			name = "slider_pin_" .. current_level
		}
		slot17 = pin_icon
		level_pin_params.x = (self._params.horizontal_padding + ((current_level - 1) * self._bar_w) / (level_cap - 1)) - tweak_data.gui.icon_w(level_cap - 1, tweak_data.gui) / 2
		level_pin_params.y = RaidGUIControlXPProgressBar.SLIDER_PIN_Y
		level_pin_params.texture = tweak_data.gui.icons[pin_icon].texture
		level_pin_params.texture_rect = tweak_data.gui.icons[pin_icon].texture_rect
		level_pin_params.color = (current_level == 1 and RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_ACTIVE) or RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_INACTIVE
		slot16 = level_pin_params
		local level_pin = self._inner_panel.bitmap(level_mark_params, self._inner_panel)
		slot17 = level_pin

		table.insert(self._inner_panel, self._level_pins)

		current_level = current_level + 1
	end

	return 
end
function RaidGUIControlXPProgressBar:_create_level_marks_on_progress_bar()
	local level_marks_panel_params = {
		name = "level_marks_panel",
		y = 0,
		x = 0
	}
	slot4 = self._inner_panel
	level_marks_panel_params.w = self._inner_panel.w(slot3)
	slot4 = self._progress_bar
	level_marks_panel_params.h = self._progress_bar.h(slot3)
	slot5 = level_marks_panel_params
	self._level_marks_panel = self._inner_panel.panel(slot3, self._inner_panel)
	slot7 = self._progress_bar

	self._level_marks_panel.set_center_y(slot3, self._progress_bar.center_y(slot6))

	local current_level = 1
	slot5 = managers.experience
	local level_cap = managers.experience.level_cap(self._level_marks_panel)
	self._level_marks = {}
	local icon = RaidGUIControlXPProgressBar.LEVEL_MARK_ICON
	local level_w = self._bar_w / (level_cap - 1)

	while current_level <= level_cap do
		for i = 2, RaidGUIControlXPProgressBar.MARKS_PER_LEVEL, 1 do
			local level_mark_params = {}
			slot16 = i
			level_mark_params.name = "level_label_" .. current_level .. "_" .. tostring(slot15)
			level_mark_params.x = (self._params.horizontal_padding + (current_level - 1) * level_w) - RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE / 2 + (i - 1) * level_w / RaidGUIControlXPProgressBar.MARKS_PER_LEVEL
			slot13 = self._level_marks_panel
			level_mark_params.y = self._level_marks_panel.h((i - 1) * level_w / RaidGUIControlXPProgressBar.MARKS_PER_LEVEL) / 2 - RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE / 2
			level_mark_params.w = RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE
			level_mark_params.h = RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE
			level_mark_params.color = tweak_data.gui.colors.progress_bar_dot
			level_mark_params.texture = tweak_data.gui.icons[icon].texture
			level_mark_params.texture_rect = tweak_data.gui.icons[icon].texture_rect
			slot14 = level_mark_params
			local level_mark = self._level_marks_panel.image(RaidGUIControlXPProgressBar.LEVEL_MARK_ICON_SIZE / 2, self._level_marks_panel)
			slot15 = level_mark

			table.insert(self._level_marks_panel, self._level_marks)
		end

		current_level = current_level + 1
	end

	return 
end
function RaidGUIControlXPProgressBar:_create_level_and_weapons_info()
	local level_labels_panel_params = {
		name = "level_labels_panel",
		y = 0,
		x = 0,
		w = self._inner_panel.w(slot3)
	}
	slot5 = self._slider_pimples_panel
	slot3 = self._slider_pimples_panel.h(self._inner_panel)
	level_labels_panel_params.h = RaidGUIControlXPProgressBar.LEVEL_LABELS_PANEL_H - slot3
	slot5 = level_labels_panel_params
	self._level_labels_panel = self._inner_panel.panel(slot3, self._inner_panel)
	slot4 = self._level_labels_panel
	slot7 = self._slider_pimples_panel

	self._level_labels_panel.set_bottom(slot3, self._slider_pimples_panel.y(slot6))

	self._level_labels = {}
	self._weapon_unlock_icons = {}
	slot4 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(slot3)
	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]
	slot6 = managers.experience
	local level_cap = managers.experience.level_cap(self._slider_pimples_panel.y)
	local current_level = 1

	while current_level <= level_cap do
		local draw_label = current_level == 1 or current_level % 1 == 0
		local number_of_weapon_unlocks = (weapon_unlock_progression[current_level] and weapon_unlock_progression[current_level].weapons and #weapon_unlock_progression[current_level].weapons) or 0

		if draw_label or number_of_weapon_unlocks then
			slot13 = number_of_weapon_unlocks
			local level_label = self._create_label_for_level(slot9, self, current_level, draw_label)
			slot12 = self._horizontal_padding + ((current_level - 1) * self._bar_w) / (level_cap - 1)

			level_label.set_center_x(self, level_label)

			slot12 = level_label

			table.insert(self, self._level_labels)
		end

		current_level = current_level + 1
	end

	return 
end
function RaidGUIControlXPProgressBar:_create_new_xp_label()
	local new_xp_params = {
		vertical = "center",
		name = "new_xp_text",
		align = "center",
		alpha = 0,
		text = "",
		w = RaidGUIControlXPProgressBar.NEW_XP_W,
		h = RaidGUIControlXPProgressBar.NEW_XP_H,
		font = RaidGUIControlXPProgressBar.NEW_XP_TEXT_FONT,
		font_size = RaidGUIControlXPProgressBar.NEW_XP_TEXT_FONT_SIZE,
		color = RaidGUIControlXPProgressBar.NEW_XP_TEXT_COLOR
	}
	slot5 = new_xp_params
	self._new_xp_text = self._inner_panel.text(slot3, self._inner_panel)
	slot4 = self._new_xp_text
	slot7 = self._inner_panel

	self._new_xp_text.set_bottom(slot3, self._inner_panel.h(slot6))

	return 
end
function RaidGUIControlXPProgressBar:_create_label_for_level(level, draw_level_label, number_of_weapon_unlocks)
	local level_label_panel_params = {
		y = 0,
		x = 0
	}
	slot8 = level
	slot6 = tostring(slot7)
	level_label_panel_params.name = "level_" .. slot6 .. "_label_panel"
	level_label_panel_params.w = RaidGUIControlXPProgressBar.LEVEL_LABELS_W
	slot7 = self._level_labels_panel
	level_label_panel_params.h = self._level_labels_panel.h(slot6)
	slot8 = level_label_panel_params
	local level_label_panel = self._level_labels_panel.panel(slot6, self._level_labels_panel)
	local level_label = nil

	if draw_level_label then
		local level_label_text_params = {
			vertical = "center",
			name = "level_label_text",
			align = "center",
			y = 0,
			x = 0
		}
		slot10 = level_label_panel
		level_label_text_params.w = level_label_panel.w(slot9)
		slot10 = level_label_panel
		level_label_text_params.h = level_label_panel.h(slot9)
		level_label_text_params.font = RaidGUIControlXPProgressBar.LEVEL_LABELS_FONT
		level_label_text_params.font_size = RaidGUIControlXPProgressBar.LEVEL_LABELS_FONT_SIZE
		slot10 = level
		level_label_text_params.text = tostring(slot9)
		level_label_text_params.color = RaidGUIControlXPProgressBar.LEVEL_LABELS_COLOR
		slot11 = level_label_text_params
		level_label = level_label_panel.text(slot9, level_label_panel)
		slot10 = level_label
		local _, _, w, _ = level_label.text_rect(slot9)
		slot15 = w

		level_label.set_w(slot13, level_label)

		slot17 = level_label_panel
		slot15 = level_label_panel.w(slot16) / 2

		level_label.set_center_x(slot13, level_label)
	end

	local weapon_unlock = nil

	if 0 < number_of_weapon_unlocks then
		local weapon_unlock_panel_params = {
			name = "weapon_unlock_panel",
			y = 0,
			x = 0
		}
		slot11 = level_label_panel
		weapon_unlock_panel_params.w = level_label_panel.w(slot10)
		slot11 = level_label_panel
		weapon_unlock_panel_params.h = level_label_panel.h(slot10)
		slot12 = weapon_unlock_panel_params
		weapon_unlock = level_label_panel.panel(slot10, level_label_panel)
		local weapon_icon = RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICON
		slot13 = weapon_icon
		local icon_w = tweak_data.gui.icon_w(level_label_panel, tweak_data.gui)
		slot14 = weapon_icon
		local icon_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
		local icon_params = {
			y = 0,
			x = 0
		}
		slot16 = level
		icon_params.name = "weapon_unlock_icon_" .. tostring(slot15)
		icon_params.w = icon_w
		icon_params.h = icon_h
		icon_params.texture = tweak_data.gui.icons[weapon_icon].texture
		icon_params.texture_rect = tweak_data.gui.icons[weapon_icon].texture_rect
		icon_params.color = RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICON_COLOR
		slot16 = icon_params
		local icon = weapon_unlock.bitmap(tostring(slot15), weapon_unlock)
		local panel_w = icon_w
		local panel_h = icon_h

		if 1 < number_of_weapon_unlocks then
			local weapon_unlock_amount_text_params = {
				name = "weapon_unlock_number_text",
				y = 0,
				x = 0,
				font = RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_FONT,
				font_size = RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_FONT_SIZE
			}
			slot19 = number_of_weapon_unlocks
			weapon_unlock_amount_text_params.text = tostring(slot18) .. "X"
			weapon_unlock_amount_text_params.color = RaidGUIControlXPProgressBar.WEAPON_UNLOCK_ICON_COLOR
			slot20 = weapon_unlock_amount_text_params
			local weapon_unlock_amount = weapon_unlock.text("X", weapon_unlock)
			slot20 = weapon_unlock_amount
			local _, _, w, h = weapon_unlock_amount.text_rect(weapon_unlock)
			slot25 = w

			weapon_unlock_amount.set_w(slot23, weapon_unlock_amount)

			slot25 = h

			weapon_unlock_amount.set_h(slot23, weapon_unlock_amount)

			slot24 = weapon_unlock_amount
			slot27 = icon

			weapon_unlock_amount.set_right(slot23, icon.right(slot26))

			panel_h = panel_h + h
			slot25 = panel_h / 2

			icon.set_center_y(slot23, icon)

			slot24 = weapon_unlock_amount
			slot27 = icon

			weapon_unlock_amount.set_center_y(slot23, icon.bottom(slot26))
		end

		slot19 = panel_w

		weapon_unlock.set_w(slot17, weapon_unlock)

		slot19 = panel_h

		weapon_unlock.set_h(slot17, weapon_unlock)

		slot21 = level_label_panel
		slot19 = level_label_panel.w(slot20) / 2

		weapon_unlock.set_center_x(slot17, weapon_unlock)

		slot21 = level_label_panel
		slot19 = level_label_panel.h(slot20) / 2

		weapon_unlock.set_center_y(slot17, weapon_unlock)

		local unlocked = false

		if level <= self._current_level then
			slot20 = 1

			weapon_unlock.set_alpha(slot18, weapon_unlock)

			unlocked = true
		end

		local weapon_unlock_icon = {
			icon = weapon_unlock,
			unlocked = unlocked
		}
		self._weapon_unlock_icons[level] = weapon_unlock_icon
	end

	if level_label ~= nil and weapon_unlock ~= nil then
		slot12 = weapon_unlock
		local label_x = (level_label_panel.w(slot9) - (level_label.w(level_label_panel) + weapon_unlock.w(level_label) + RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT)) / 2
		slot12 = label_x

		level_label.set_x(RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT, level_label)

		slot14 = level_label
		slot12 = level_label.right(slot13) + RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT

		weapon_unlock.set_x(RaidGUIControlXPProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT, weapon_unlock)
	end

	return level_label_panel
end
function RaidGUIControlXPProgressBar:set_progress(progress, points_added_total)
	slot6 = self._progress_padding + progress * self._progress_multiplier

	self._progress_bar.set_foreground_progress(slot4, self._progress_bar)

	slot6 = (self._progress_padding + progress * self._progress_multiplier) * self._progress_bar.w(slot8)

	self._slider_pimples_panel.set_w(slot4, self._slider_pimples_panel)

	local right_edge_x = self._inner_panel.w(slot4) * progress
	slot11 = points_added_total
	slot13 = true
	slot7 = "+" .. string.format(self._progress_bar, "%d") .. self.translate("%d", self, "menu_label_xp")

	self._new_xp_text.set_text(self._inner_panel, self._new_xp_text)

	slot6 = self._new_xp_text

	if self._new_xp_text.alpha(self._inner_panel) == 0 and 0 < points_added_total then
		slot6 = self._new_xp_text
		slot11 = "_animate_fade_in_object"

		self._new_xp_text.animate(slot5, callback(slot8, self, self))
	end

	slot6 = self._new_xp_text
	local _, _, w, _ = self._new_xp_text.text_rect(slot5)
	slot11 = w

	self._new_xp_text.set_w(slot9, self._new_xp_text)

	slot10 = self._new_xp_text
	slot13 = self._slider_pimples_panel

	self._new_xp_text.set_center_x(slot9, self._slider_pimples_panel.right(slot12))

	slot11 = self._inner_panel

	if self._inner_panel.w(self._new_xp_text) < self._new_xp_text.right(slot9) then
		slot10 = self._new_xp_text
		slot13 = self._inner_panel

		self._new_xp_text.set_right(slot9, self._inner_panel.w(slot12))
	end

	return 
end
function RaidGUIControlXPProgressBar:unlock_level(level)
	for i = self._current_level, level, 1 do
		if self._weapon_unlock_icons[i] then
			slot9 = 1

			self._weapon_unlock_icons[i].icon.set_alpha(slot7, self._weapon_unlock_icons[i].icon)

			self._weapon_unlock_icons[i].unlocked = true
		end

		if self._level_pins[i] then
			slot9 = RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_ACTIVE

			self._level_pins[i].set_color(slot7, self._level_pins[i])
		end
	end

	self._current_level = level
	slot4 = managers.experience
	local level_cap = managers.experience.level_cap(slot3)

	if level == level_cap then
		return 
	end

	local inner_x = -((self._bar_w - 2 * self._progress_padding) / (level_cap - 1)) * (level - 1)
	slot6 = self._inner_panel
	slot6 = self._inner_panel.get_engine_panel(slot5)

	self._inner_panel.get_engine_panel(slot5).stop(slot5)

	slot6 = self._inner_panel
	slot11 = "_animate_inner_panel_position"
	slot8 = inner_x

	self._inner_panel.get_engine_panel(slot5).animate(slot5, self._inner_panel.get_engine_panel(slot5), callback(slot8, self, self))

	return 
end
function RaidGUIControlXPProgressBar:set_level(level)
	for i = 1, level, 1 do
		if self._weapon_unlock_icons[i] then
			slot9 = 1

			self._weapon_unlock_icons[i].icon.set_alpha(slot7, self._weapon_unlock_icons[i].icon)

			self._weapon_unlock_icons[i].unlocked = true
		end

		if self._level_pins[i] then
			slot9 = RaidGUIControlXPProgressBar.SLIDER_PIN_COLOR_ACTIVE

			self._level_pins[i].set_color(slot7, self._level_pins[i])
		end
	end

	self._current_level = level
	slot4 = managers.experience
	local level_cap = managers.experience.level_cap(slot3)

	if level == level_cap then
		level = level - 1
	end

	local inner_x = -((self._bar_w - 2 * self._progress_padding) / (level_cap - 1)) * (level - 1)
	slot7 = inner_x

	self._inner_panel.set_x(slot5, self._inner_panel)

	return 
end
function RaidGUIControlXPProgressBar:hide()
	slot4 = 0

	self._object.set_alpha(slot2, self._object)

	return 
end
function RaidGUIControlXPProgressBar:fade_in()
	slot3 = self._object
	slot3 = self._object.get_engine_panel(slot2)
	slot8 = "_animate_fade_in"

	self._object.get_engine_panel(slot2).animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlXPProgressBar:_animate_fade_in()
	local duration = 0.3
	slot4 = self._object
	local t = self._object.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)
	end

	slot6 = 1

	self._object.set_alpha(slot4, self._object)

	return 
end
function RaidGUIControlXPProgressBar:_animate_fade_in_object(object)
	local duration = 0.3
	slot5 = object
	local t = object.alpha(slot4) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 1)
		slot9 = current_alpha

		object.set_alpha(t, object)
	end

	slot7 = 1

	object.set_alpha(slot5, object)

	return 
end
function RaidGUIControlXPProgressBar:_animate_inner_panel_position(panel, new_x)
	local duration = 0.7
	local t = 0
	slot7 = panel
	local initial_position = panel.x(slot6)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_position = Easing.quartic_in_out(slot8, t, initial_position, new_x - initial_position)
		slot11 = current_position

		panel.set_x(t, panel)
	end

	slot9 = new_x

	panel.set_x(slot7, panel)

	return 
end

return 
