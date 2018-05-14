if not RaidGUIControlSkilltreeProgressBar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSkilltreeProgressBar = slot0
RaidGUIControlSkilltreeProgressBar.DEFAULT_H = 96
RaidGUIControlSkilltreeProgressBar.PROGRESS_BAR_H = 32
RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_PANEL_H = 64
RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT_SIZE = tweak_data.gui.font_sizes.size_46
RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W = 100
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICONS_PANEL_H = 32
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON = "icon_weapon_unlocked"
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_18
RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT = 6
RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON = "slider_mid_dot"
RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE = 8
RaidGUIControlSkilltreeProgressBar.SLIDER_PIMPLE_ICON = "slider_pimple"
RaidGUIControlSkilltreeProgressBar.SLIDER_PIMPLE_COLOR = tweak_data.gui.colors.raid_red
function RaidGUIControlSkilltreeProgressBar:init(parent, params)
	params.horizontal_padding = params.horizontal_padding or 0
	slot7 = params

	RaidGUIControlSkilltreeProgressBar.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlSkilltreeProgressBar:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_panels(slot4)

	slot5 = self._inner_panel
	self._bar_w = self._inner_panel.w(slot4)
	self._current_level = params.initial_level or 1
	self._horizontal_padding = self._params.horizontal_padding or 0
	slot5 = self

	self._create_progress_bar(slot4)

	slot5 = self

	self._create_background(slot4)

	slot5 = self

	self._create_slider_pimples(slot4)

	slot5 = self

	self._create_level_marks_on_progress_bar(slot4)

	slot5 = self

	self._create_level_and_weapons_info(slot4)

	self._progress = params.initial_progress or 0
	slot6 = self._progress

	self.set_progress(slot4, self)

	return 
end
function RaidGUIControlSkilltreeProgressBar:close()
	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_panels()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_panel") + 1
	control_params.w = self._params.w
	control_params.h = self._params.h or RaidGUIControlSkilltreeProgressBar.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel
	control_params.x = self._params.horizontal_padding
	control_params.y = 0
	control_params.w = self._params.bar_w or control_params.w - self._params.horizontal_padding * 2
	slot4 = self._object
	control_params.h = self._object.h(self._params)
	slot5 = control_params
	self._inner_panel = self._object.panel(self._params, self._object)

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_progress_bar()
	local progress_bar_params = {
		left = "slider_large_left",
		name = "progress_bar",
		y = 0,
		center = "slider_large_center",
		x = 0,
		right = "slider_large_right",
		w = self._bar_w + self._horizontal_padding * 2,
		h = self._params.progress_bar_h or RaidGUIControlSkilltreeProgressBar.PROGRESS_BAR_H
	}
	slot5 = progress_bar_params
	self._progress_bar = self._object.progress_bar_simple(slot3, self._object)
	slot7 = self._object

	self._progress_bar.set_bottom(slot3, self._object.h(slot6))

	slot5 = self._progress_bar
	self._progress_padding = self._horizontal_padding / self._progress_bar.w(self._progress_bar)
	slot5 = self._progress_bar
	self._progress_multiplier = self._bar_w / self._progress_bar.w(self._progress_bar)

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_background()
	local background_panel_params = {
		name = "background_panel",
		y = 0
	}
	slot4 = self._progress_bar
	background_panel_params.x = self._progress_bar.x(slot3)
	slot4 = self._progress_bar
	background_panel_params.w = self._progress_bar.w(slot3)
	slot5 = self._progress_bar
	slot3 = self._progress_bar.h(self._object)
	background_panel_params.h = self._object.h(slot3) - slot3
	slot4 = self._progress_bar
	background_panel_params.layer = self._progress_bar.layer(slot3) - 5
	slot5 = background_panel_params
	self._background_panel = self._object.panel(slot3, self._object)
	local texture_center = "skl_level_bg"
	local texture_left = "skl_level_bg_left"
	local texture_right = "skl_level_bg_right"
	local background_params = {
		name = "background",
		y = 0,
		x = 0
	}
	slot8 = self._background_panel
	background_params.w = self._background_panel.w(slot7)
	slot9 = texture_center
	background_params.h = tweak_data.gui.icon_h(slot7, tweak_data.gui)
	background_params.left = texture_left
	background_params.center = texture_center
	background_params.right = texture_right
	background_params.color = Color.white
	self._background = self._background_panel.three_cut_bitmap(slot7, self._background_panel)
	local line_texture = "skl_bg_vline"
	local progress_line_params = {
		name = "progress_line",
		halign = "right"
	}
	slot12 = line_texture
	progress_line_params.x = self._background_panel.w(background_params) - tweak_data.gui.icon_w(self._background_panel, tweak_data.gui)
	slot12 = line_texture
	slot9 = tweak_data.gui.icon_h(self._background_panel, tweak_data.gui)
	progress_line_params.y = self._background_panel.h(tweak_data.gui.icon_w(self._background_panel, tweak_data.gui)) - slot9
	slot11 = line_texture
	progress_line_params.w = tweak_data.gui.icon_w(slot9, tweak_data.gui)
	slot11 = line_texture
	progress_line_params.h = tweak_data.gui.icon_h(slot9, tweak_data.gui)
	progress_line_params.texture = tweak_data.gui.icons[line_texture].texture
	progress_line_params.texture_rect = tweak_data.gui.icons[line_texture].texture_rect
	slot11 = progress_line_params
	self._progress_line = self._background_panel.image(slot9, self._background_panel)

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_slider_pimples()
	local icon = RaidGUIControlSkilltreeProgressBar.SLIDER_PIMPLE_ICON
	slot5 = icon
	local icon_w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	local icon_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	local slider_pimples_panel_params = {
		name = "slider_pimples_panel",
		x = 0
	}
	slot7 = self._progress_bar
	slider_pimples_panel_params.y = self._progress_bar.y(icon) - icon_h
	slot7 = self._object
	slider_pimples_panel_params.w = self._object.w(icon)
	slider_pimples_panel_params.h = icon_h
	slot7 = self._progress_bar
	slider_pimples_panel_params.layer = self._progress_bar.layer(icon) + 5
	slot8 = slider_pimples_panel_params
	self._slider_pimples_panel = self._object.panel(icon, self._object)
	local current_level = 1
	local level_cap = managers.experience.level_cap(self._object)
	slot9 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(managers.experience)
	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]

	while current_level <= level_cap do
		if current_level == 1 or current_level % 5 == 0 or weapon_unlock_progression[current_level] then
			local level_mark_params = {
				y = 0,
				name = "slider_pimple_" .. current_level,
				x = (self._params.horizontal_padding + ((current_level - 1) * self._bar_w) / (level_cap - 1)) - icon_w / 2,
				w = icon_w,
				h = icon_h,
				color = RaidGUIControlSkilltreeProgressBar.SLIDER_PIMPLE_COLOR,
				texture = tweak_data.gui.icons[icon].texture,
				texture_rect = tweak_data.gui.icons[icon].texture_rect
			}
			slot13 = level_mark_params
			slot10 = self._slider_pimples_panel.image(icon_w / 2, self._slider_pimples_panel)
		end

		current_level = current_level + 1
	end

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_level_marks_on_progress_bar()
	local level_marks_panel_params = {
		name = "level_marks_panel",
		y = 0,
		x = 0
	}
	slot4 = self._object
	level_marks_panel_params.w = self._object.w(slot3)
	slot4 = self._progress_bar
	level_marks_panel_params.h = self._progress_bar.h(slot3)
	slot5 = level_marks_panel_params
	self._level_marks_panel = self._object.panel(slot3, self._object)
	slot7 = self._progress_bar

	self._level_marks_panel.set_center_y(slot3, self._progress_bar.center_y(slot6))

	local current_level = 1
	slot5 = managers.experience
	local level_cap = managers.experience.level_cap(self._level_marks_panel)
	self._level_marks = {}
	local icon = RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON

	while current_level <= level_cap do
		local level_mark_params = {
			name = "level_label_" .. current_level,
			x = (self._params.horizontal_padding + ((current_level - 1) * self._bar_w) / (level_cap - 1)) - RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE / 2
		}
		slot8 = self._level_marks_panel
		level_mark_params.y = self._level_marks_panel.h(RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE / 2) / 2 - RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE / 2
		level_mark_params.w = RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE
		level_mark_params.h = RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE
		level_mark_params.color = tweak_data.gui.colors.progress_bar_dot
		level_mark_params.texture = tweak_data.gui.icons[icon].texture
		level_mark_params.texture_rect = tweak_data.gui.icons[icon].texture_rect
		slot9 = level_mark_params
		local level_mark = self._level_marks_panel.image(RaidGUIControlSkilltreeProgressBar.LEVEL_MARK_ICON_SIZE / 2, self._level_marks_panel)
		slot10 = level_mark

		table.insert(self._level_marks_panel, self._level_marks)

		current_level = current_level + 1
	end

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_level_and_weapons_info()
	local level_labels_panel_params = {
		name = "level_labels_panel",
		y = 0,
		x = 0,
		w = self._object.w(slot3)
	}
	slot5 = self._slider_pimples_panel
	slot3 = self._slider_pimples_panel.h(self._object)
	level_labels_panel_params.h = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_PANEL_H - slot3
	slot5 = level_labels_panel_params
	self._level_labels_panel = self._object.panel(slot3, self._object)
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
		local draw_label = current_level == 1 or current_level % 5 == 0
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
function RaidGUIControlSkilltreeProgressBar:_create_label_for_level(level, draw_level_label, number_of_weapon_unlocks)
	local level_label_panel_params = {
		y = 0,
		x = 0
	}
	slot8 = level
	slot6 = tostring(slot7)
	level_label_panel_params.name = "level_" .. slot6 .. "_label_panel"
	level_label_panel_params.w = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W
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
		level_label_text_params.font = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT
		level_label_text_params.font_size = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT_SIZE
		slot10 = level
		level_label_text_params.text = tostring(slot9)
		level_label_text_params.color = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR
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
		local weapon_icon = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON
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
		icon_params.color = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON_COLOR
		slot16 = icon_params
		local icon = weapon_unlock.bitmap(tostring(slot15), weapon_unlock)
		local panel_w = icon_w
		local panel_h = icon_h

		if 1 < number_of_weapon_unlocks then
			local weapon_unlock_amount_text_params = {
				name = "weapon_unlock_number_text",
				y = 0,
				x = 0,
				font = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_FONT,
				font_size = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_FONT_SIZE
			}
			slot19 = number_of_weapon_unlocks
			weapon_unlock_amount_text_params.text = tostring(slot18) .. "X"
			weapon_unlock_amount_text_params.color = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON_COLOR
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
		local label_x = (level_label_panel.w(slot9) - (level_label.w(level_label_panel) + weapon_unlock.w(level_label) + RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT)) / 2
		slot12 = label_x

		level_label.set_x(RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT, level_label)

		slot14 = level_label
		slot12 = level_label.right(slot13) + RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT

		weapon_unlock.set_x(RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_TEXT_PADDING_RIGHT, weapon_unlock)
	end

	return level_label_panel
end
function RaidGUIControlSkilltreeProgressBar:_create_level_labels()
	local level_labels_panel_params = {
		name = "level_labels_panel",
		y = 0,
		x = 0,
		w = self._bar_w,
		h = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_PANEL_H
	}
	slot5 = level_labels_panel_params
	self._level_labels_panel = self._inner_panel.panel(slot3, self._inner_panel)
	self._level_labels = {}
	local level_label_params = {
		vertical = "center",
		name = "level_label_1",
		align = "left",
		y = 0,
		x = 0,
		w = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W
	}
	slot5 = self._level_labels_panel
	level_label_params.h = self._level_labels_panel.h(self._inner_panel)
	level_label_params.font = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT
	level_label_params.font_size = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT_SIZE
	slot7 = true
	level_label_params.text = self.translate(self._inner_panel, self, "menu_level_label_shorthand") .. " 1"
	level_label_params.color = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR
	slot6 = level_label_params
	local level_label = self._level_labels_panel.text(" 1", self._level_labels_panel)
	slot7 = level_label

	table.insert(self._level_labels_panel, self._level_labels)

	slot6 = managers.experience
	local level_cap = managers.experience.level_cap(self._level_labels_panel)
	local current_level = 5

	while current_level < level_cap do
		slot9 = self._level_labels_panel
		slot9 = current_level
		level_label_params = {
			vertical = "center",
			align = "center",
			y = 0,
			name = "level_label_" .. current_level,
			x = ((current_level - 1) * self._bar_w) / (level_cap - 1) - RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W / 2,
			w = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W,
			h = self._level_labels_panel.h(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W / 2),
			font = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT,
			font_size = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT_SIZE,
			text = tostring(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W / 2),
			color = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR
		}
		slot9 = level_label_params
		level_label = self._level_labels_panel.text(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR, self._level_labels_panel)
		slot9 = level_label

		table.insert(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR, self._level_labels)

		current_level = current_level + 5
	end

	slot10 = level_cap
	slot9 = self._level_labels_panel
	slot11 = true
	slot11 = level_cap
	level_label_params = {
		vertical = "center",
		align = "right",
		y = 0,
		name = "level_label_" .. tostring(slot9),
		x = self._bar_w - RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W,
		w = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W,
		h = self._level_labels_panel.h(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W),
		font = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT,
		font_size = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_FONT_SIZE,
		text = self.translate(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_W, self, "menu_level_label_shorthand") .. " " .. tostring("menu_level_label_shorthand"),
		color = RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR
	}
	slot9 = level_label_params
	level_label = self._level_labels_panel.text(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR, self._level_labels_panel)
	slot9 = level_label

	table.insert(RaidGUIControlSkilltreeProgressBar.LEVEL_LABELS_COLOR, self._level_labels)

	return 
end
function RaidGUIControlSkilltreeProgressBar:_create_weapon_unlock_icons()
	local weapon_unlock_icons_panel_params = {
		name = "weapon_unlock_icons_panel",
		x = 0
	}
	slot4 = self._object
	weapon_unlock_icons_panel_params.y = self._object.h(slot3) - RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICONS_PANEL_H
	weapon_unlock_icons_panel_params.w = self._bar_w
	weapon_unlock_icons_panel_params.h = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICONS_PANEL_H
	slot5 = weapon_unlock_icons_panel_params
	self._weapon_unlock_icons_panel = self._inner_panel.panel(RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICONS_PANEL_H, self._inner_panel)
	local weapon_icon = tweak_data.gui.icons[RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON]
	local icon_h = self._weapon_unlock_icons_panel.h(self._inner_panel)
	slot7 = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON
	local icon_w = icon_h * tweak_data.gui.icon_w(self._weapon_unlock_icons_panel, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	self._weapon_unlock_icons = {}
	slot7 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(tweak_data.gui)
	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]
	local level_cap = managers.experience.level_cap(RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON)
	slot10 = weapon_unlock_progression

	for level, weapons in pairs(managers.experience) do
		local icon_x = ((level - 1) * self._bar_w) / (level_cap - 1) - icon_w / 2

		if icon_x < 0 then
			icon_x = 0
		elseif self._bar_w < icon_x + icon_w then
			icon_x = self._bar_w - icon_w
		end

		local icon_params = {
			alpha = 0.4,
			y = 0
		}
		slot18 = level
		icon_params.name = "weapon_unlock_icon_" .. tostring(slot17)
		icon_params.x = icon_x
		icon_params.w = icon_w
		icon_params.h = icon_h
		icon_params.texture = tweak_data.gui.icons[RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON].texture
		icon_params.texture_rect = tweak_data.gui.icons[RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON].texture_rect
		icon_params.color = RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON_COLOR
		slot18 = icon_params
		local icon = self._weapon_unlock_icons_panel.bitmap(RaidGUIControlSkilltreeProgressBar.WEAPON_UNLOCK_ICON, self._weapon_unlock_icons_panel)
		local unlocked = false

		if level <= self._current_level then
			slot20 = 1

			icon.set_alpha(slot18, icon)

			unlocked = true
		end

		local weapon_unlock_icon = {
			icon = icon,
			unlocked = unlocked
		}
		self._weapon_unlock_icons[level] = weapon_unlock_icon
	end

	return 
end
function RaidGUIControlSkilltreeProgressBar:set_progress(progress)
	slot5 = self._progress_padding + progress * self._progress_multiplier

	self._progress_bar.set_foreground_progress(slot3, self._progress_bar)

	slot8 = self._progress_bar
	slot5 = (self._progress_padding + progress * self._progress_multiplier) * self._progress_bar.w(slot7)

	self._slider_pimples_panel.set_w(slot3, self._slider_pimples_panel)

	slot8 = self._progress_bar
	slot5 = (self._progress_padding + progress * self._progress_multiplier) * self._progress_bar.w(slot7)

	self._background_panel.set_w(slot3, self._background_panel)

	local right_edge_x = self._inner_panel.w(slot3) * progress
	slot6 = self._object

	if self._object.w(self._inner_panel) < self._inner_panel.w(self._inner_panel) then
		slot5 = self._object

		if self._object.w(slot4) * 0.7 < right_edge_x then
			local x = -(right_edge_x - self._object.w(slot4) * 0.7)
			slot7 = self._object

			if x < -(self._inner_panel.w(self._object) - self._object.w(self._inner_panel)) then
				slot7 = self._object
				x = -(self._inner_panel.w(slot5) - self._object.w(self._inner_panel))
			end

			slot7 = x

			self._inner_panel.set_x(slot5, self._inner_panel)
		end
	end

	return 
end
function RaidGUIControlSkilltreeProgressBar:unlock_level(level)
	for i = self._current_level, level, 1 do
		if self._weapon_unlock_icons[i] then
			slot9 = 1

			self._weapon_unlock_icons[i].icon.set_alpha(slot7, self._weapon_unlock_icons[i].icon)

			self._weapon_unlock_icons[i].unlocked = true
		end
	end

	self._current_level = level

	return 
end
function RaidGUIControlSkilltreeProgressBar:set_level(level)
	for i = 1, level, 1 do
		if self._weapon_unlock_icons[i] then
			slot9 = 1

			self._weapon_unlock_icons[i].icon.set_alpha(slot7, self._weapon_unlock_icons[i].icon)

			self._weapon_unlock_icons[i].unlocked = true
		end
	end

	self._current_level = level

	return 
end
function RaidGUIControlSkilltreeProgressBar:hide()
	slot4 = 0

	self._object.set_alpha(slot2, self._object)

	return 
end
function RaidGUIControlSkilltreeProgressBar:fade_in()
	slot3 = self._object
	slot3 = self._object.get_engine_panel(slot2)
	slot8 = "_animate_fade_in"

	self._object.get_engine_panel(slot2).animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlSkilltreeProgressBar:_animate_fade_in()
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

return 
