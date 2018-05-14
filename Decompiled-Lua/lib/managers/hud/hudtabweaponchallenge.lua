HUDTabWeaponChallenge = HUDTabWeaponChallenge or class()
HUDTabWeaponChallenge.WIDTH = 384
HUDTabWeaponChallenge.HEIGHT = 256
HUDTabWeaponChallenge.RIGHT_SIDE_X = 64
HUDTabWeaponChallenge.TITLE_Y = 32
HUDTabWeaponChallenge.TITLE_H = 64
HUDTabWeaponChallenge.TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDTabWeaponChallenge.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDTabWeaponChallenge.TITLE_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDTabWeaponChallenge.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
HUDTabWeaponChallenge.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
slot3 = "b8b8b8"
HUDTabWeaponChallenge.DESCRIPTION_COLOR = Color(slot2)
HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE = 30
HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON = "bullet_empty"
HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON = "bullet_active"
HUDTabWeaponChallenge.INDEX_BULLET_PANEL_W = 96
HUDTabWeaponChallenge.INDEX_BULLET_PADDING = 5
function HUDTabWeaponChallenge:init(panel)
	slot5 = panel

	self._create_panel(slot3, self)

	slot4 = self

	self._create_inner_panel(slot3)

	slot4 = self

	self._create_index_bullet_panel(slot3)

	slot4 = self

	self._create_title(slot3)

	slot4 = self

	self._create_tier_label(slot3)

	slot4 = self

	self._create_icon(slot3)

	slot4 = self

	self._create_description(slot3)

	slot4 = self

	self._create_progress_bar(slot3)

	return 
end
function HUDTabWeaponChallenge:_create_panel(panel)
	local panel_params = {
		name = "weapon_challenge_panel",
		halign = "left",
		valign = "bottom",
		w = HUDTabWeaponChallenge.WIDTH + HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE,
		h = HUDTabWeaponChallenge.HEIGHT
	}
	slot6 = panel_params
	self._object = panel.panel(HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE, panel)
	slot5 = self._object
	self._initial_x_position = self._object.x(HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE)

	return 
end
function HUDTabWeaponChallenge:_create_inner_panel()
	local inner_panel_params = {
		name = "weapon_challenge_inner_panel",
		halign = "grow",
		valign = "grow"
	}
	slot4 = self._object
	inner_panel_params.w = self._object.w(slot3) - HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE
	slot5 = inner_panel_params
	self._inner_panel = self._object.panel(HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE, self._object)

	return 
end
function HUDTabWeaponChallenge:_create_index_bullet_panel()
	local index_bullet_panel_params = {
		name = "index_bullet_panel",
		h = 32,
		halign = "right",
		valign = "top",
		w = HUDTabWeaponChallenge.INDEX_BULLET_PANEL_W
	}
	slot5 = index_bullet_panel_params
	self._index_bullet_panel = self._object.panel(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) - HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE

	self._index_bullet_panel.set_right(slot3, self._index_bullet_panel)

	return 
end
function HUDTabWeaponChallenge:_create_title()
	local title_params = {
		name = "weapon_challenge_title",
		vertical = "center",
		align = "left",
		text = "INCREASE ACCURACY",
		y = HUDTabWeaponChallenge.TITLE_Y,
		x = HUDTabWeaponChallenge.RIGHT_SIDE_X
	}
	slot4 = self._inner_panel
	title_params.w = self._inner_panel.w(slot3) - HUDTabWeaponChallenge.RIGHT_SIDE_X
	title_params.h = HUDTabWeaponChallenge.TITLE_H
	slot6 = HUDTabWeaponChallenge.TITLE_FONT_SIZE
	title_params.font = tweak_data.gui.get_font_path(HUDTabWeaponChallenge.RIGHT_SIDE_X, tweak_data.gui, HUDTabWeaponChallenge.TITLE_FONT)
	title_params.font_size = HUDTabWeaponChallenge.TITLE_FONT_SIZE
	title_params.color = HUDTabWeaponChallenge.TITLE_COLOR
	slot5 = title_params
	self._title = self._inner_panel.text(HUDTabWeaponChallenge.RIGHT_SIDE_X, self._inner_panel)

	return 
end
function HUDTabWeaponChallenge:_create_tier_label()
	local tier_label_params = {
		name = "weapon_challenge_tier",
		vertical = "center",
		align = "left",
		text = "TI",
		y = HUDTabWeaponChallenge.TITLE_Y,
		h = HUDTabWeaponChallenge.TITLE_H
	}
	slot6 = HUDTabWeaponChallenge.TITLE_FONT_SIZE
	tier_label_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, HUDTabWeaponChallenge.TITLE_FONT)
	tier_label_params.font_size = HUDTabWeaponChallenge.TITLE_FONT_SIZE
	tier_label_params.color = HUDTabWeaponChallenge.TITLE_COLOR
	slot5 = tier_label_params
	self._tier = self._inner_panel.text(slot3, self._inner_panel)

	return 
end
function HUDTabWeaponChallenge:_create_icon()
	local default_icon = "wpn_skill_accuracy"
	local icon_params = {
		name = "weapon_challenge_icon",
		y = HUDTabWeaponChallenge.TITLE_Y + HUDTabWeaponChallenge.TITLE_H,
		texture = tweak_data.gui.icons[default_icon].texture,
		texture_rect = tweak_data.gui.icons[default_icon].texture_rect
	}
	slot6 = icon_params
	self._icon = self._inner_panel.bitmap(HUDTabWeaponChallenge.TITLE_H, self._inner_panel)

	return 
end
function HUDTabWeaponChallenge:_create_description()
	local description_params = {
		name = "weapon_challenge_description",
		wrap = true,
		text = "Bla bla bla bla",
		x = HUDTabWeaponChallenge.RIGHT_SIDE_X,
		y = HUDTabWeaponChallenge.TITLE_Y + HUDTabWeaponChallenge.TITLE_H
	}
	slot4 = self._inner_panel
	description_params.w = self._inner_panel.w(HUDTabWeaponChallenge.TITLE_H) - HUDTabWeaponChallenge.RIGHT_SIDE_X
	slot6 = HUDTabWeaponChallenge.DESCRIPTION_FONT_SIZE
	description_params.font = tweak_data.gui.get_font_path(HUDTabWeaponChallenge.RIGHT_SIDE_X, tweak_data.gui, HUDTabWeaponChallenge.DESCRIPTION_FONT)
	description_params.font_size = HUDTabWeaponChallenge.DESCRIPTION_FONT_SIZE
	description_params.color = HUDTabWeaponChallenge.DESCRIPTION_COLOR
	slot5 = description_params
	self._description = self._inner_panel.text(HUDTabWeaponChallenge.RIGHT_SIDE_X, self._inner_panel)

	return 
end
function HUDTabWeaponChallenge:_create_progress_bar()
	local texture_center = "slider_large_center"
	local texture_left = "slider_large_left"
	local texture_right = "slider_large_right"
	local progress_bar_panel_params = {
		vertical = "bottom",
		name = "weapon_challenge_progress_bar_panel",
		is_root_panel = true,
		x = 0
	}
	slot7 = self._inner_panel
	progress_bar_panel_params.w = self._inner_panel.w(slot6)
	slot8 = texture_center
	progress_bar_panel_params.h = tweak_data.gui.icon_h(slot6, tweak_data.gui)
	self._progress_bar_panel = RaidGUIPanel.new(slot6, RaidGUIPanel, self._inner_panel)
	slot10 = self._inner_panel
	slot8 = self._inner_panel.h(progress_bar_panel_params) - 32

	self._progress_bar_panel.set_center_y(slot6, self._progress_bar_panel)

	local progress_bar_background_params = {
		name = "weapon_challenge_progress_bar_background",
		layer = 1
	}
	slot8 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w(self._progress_bar_panel)
	slot9 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h(self._progress_bar_panel, tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	slot9 = 0.5
	progress_bar_background_params.color = Color.white.with_alpha(self._progress_bar_panel, Color.white)
	local progress_bar_background = self._progress_bar_panel.three_cut_bitmap(self._progress_bar_panel, self._progress_bar_panel)
	local progress_bar_foreground_panel_params = {
		halign = "scale",
		name = "weapon_challenge_progress_bar_foreground_panel",
		y = 0,
		layer = 2,
		x = 0,
		valign = "scale"
	}
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.w = self._progress_bar_panel.w(progress_bar_background_params)
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.h = self._progress_bar_panel.h(progress_bar_background_params)
	slot11 = progress_bar_foreground_panel_params
	self._progress_bar_foreground_panel = self._progress_bar_panel.panel(progress_bar_background_params, self._progress_bar_panel)
	local progress_bar_background_params = {
		name = "weapon_challenge_progress_bar_background"
	}
	slot11 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w(self._progress_bar_panel)
	slot12 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h(self._progress_bar_panel, tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	progress_bar_background_params.color = tweak_data.gui.colors.raid_red
	local progress_bar_background = self._progress_bar_foreground_panel.three_cut_bitmap(self._progress_bar_panel, self._progress_bar_foreground_panel)
	local progress_bar_text_params = {
		name = "weapon_challenge_progress_bar_text",
		vertical = "center",
		align = "center",
		text = "123/456",
		y = -2,
		x = 0,
		layer = 5
	}
	slot13 = self._progress_bar_panel
	progress_bar_text_params.w = self._progress_bar_panel.w(progress_bar_background_params)
	slot13 = self._progress_bar_panel
	progress_bar_text_params.h = self._progress_bar_panel.h(progress_bar_background_params)
	progress_bar_text_params.font = tweak_data.gui.fonts.din_compressed
	progress_bar_text_params.font_size = tweak_data.gui.font_sizes.size_24
	progress_bar_text_params.color = tweak_data.gui.colors.raid_dirty_white
	slot14 = progress_bar_text_params
	self._progress_text = self._progress_bar_panel.label(progress_bar_background_params, self._progress_bar_panel)

	return 
end
function HUDTabWeaponChallenge:set_challenges(challenges)
	self._challenges = challenges
	slot4 = self

	self._create_challenge_bullets(slot3)

	slot5 = 1

	self.set_challenge(slot3, self)

	return 
end
function HUDTabWeaponChallenge:_create_challenge_bullets()
	slot3 = self._index_bullet_panel

	self._index_bullet_panel.clear(slot2)

	self._active_bullets = {}
	self._inactive_bullets = {}

	for i = #self._challenges, 1, -1 do
		local inactive_bullet_params = {}
		slot10 = HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON
		inactive_bullet_params.x = self._index_bullet_panel.w(slot7) - tweak_data.gui.icon_w(self._index_bullet_panel, tweak_data.gui) * i - HUDTabWeaponChallenge.INDEX_BULLET_PADDING * (i - 1)
		slot10 = HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON
		inactive_bullet_params.y = self._index_bullet_panel.h(HUDTabWeaponChallenge.INDEX_BULLET_PADDING * (i - 1)) / 2 - tweak_data.gui.icon_h(self._index_bullet_panel, tweak_data.gui) / 2
		inactive_bullet_params.texture = tweak_data.gui.icons[HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON].texture
		inactive_bullet_params.texture_rect = tweak_data.gui.icons[HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON].texture_rect
		slot8 = self._index_bullet_panel
		inactive_bullet_params.layer = self._index_bullet_panel.layer(HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON) + 1
		slot9 = inactive_bullet_params
		local inactive_bullet = self._index_bullet_panel.bitmap(HUDTabWeaponChallenge.INDEX_BULLET_INACTIVE_ICON, self._index_bullet_panel)
		slot10 = inactive_bullet

		table.insert(self._index_bullet_panel, self._inactive_bullets)

		local active_bullet_params = {
			alpha = 0,
			texture = tweak_data.gui.icons[HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON].texture,
			texture_rect = tweak_data.gui.icons[HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON].texture_rect
		}
		slot10 = inactive_bullet
		active_bullet_params.layer = inactive_bullet.layer(HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON) + 1
		slot11 = active_bullet_params
		local active_bullet = self._index_bullet_panel.bitmap(HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON, self._index_bullet_panel)
		slot11 = active_bullet
		slot14 = inactive_bullet

		active_bullet.set_center(self._index_bullet_panel, inactive_bullet.center(slot13))

		slot12 = active_bullet

		table.insert(self._index_bullet_panel, self._active_bullets)
	end

	return 
end
function HUDTabWeaponChallenge:set_challenge(index, animate)
	if self._currently_shown_challenge == index then
		animate = false
	end

	if animate then
		slot5 = self._object

		self._object.stop(slot4)

		slot10 = "_animate_data_change"

		self._object.animate(slot4, self._object, callback(index, self, self))
	else
		slot6 = index

		self._set_challenge(slot4, self)

		slot5 = self._active_bullets

		for index, bullet in pairs(slot4) do
			slot11 = 0

			bullet.set_alpha(slot9, bullet)
		end

		slot6 = 1

		self._active_bullets[index].set_alpha(slot4, self._active_bullets[index])
	end

	return 
end
function HUDTabWeaponChallenge:_set_challenge(challenge_index)
	local challenge, count, target, min_range = nil
	local challenge_data = self._challenges[challenge_index]

	if challenge_data.challenge_id then
		challenge = managers.challenge.get_challenge(slot8, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
		local tasks = challenge.tasks(slot8)
		slot10 = tasks[1]
		count = tasks[1].current_count(challenge)
		slot10 = tasks[1]
		target = tasks[1].target(challenge)
		slot12 = tasks[1]
		slot10 = tasks[1].min_range(challenge_data.challenge_id) / 100
		min_range = math.round(challenge)
	end

	local skill_tweak_data = tweak_data.weapon_skills.skills[challenge_data.skill_name]
	slot10 = self._title
	slot16 = skill_tweak_data.name_id

	self._title.set_text(slot9, utf8.to_upper(managers.localization.text(slot14, managers.localization)))

	slot10 = self._description
	slot15 = {
		AMOUNT = target,
		RANGE = min_range,
		WEAPON = managers.localization.text(slot17, managers.localization)
	}

	self._description.set_text(slot9, managers.localization.text(slot12, managers.localization, challenge_data.challenge_briefing_id))

	slot13 = "menu_weapons_stats_tier_abbreviation"
	local tier_text = utf8.to_upper(managers.localization.text(managers.localization.text, managers.localization)) .. RaidGUIControlWeaponSkills.ROMAN_NUMERALS[challenge_data.tier]
	slot12 = tier_text

	self._tier.set_text(challenge_data.tier, self._tier)

	slot11 = self._tier
	local _, _, w, _ = self._tier.text_rect(challenge_data.tier)
	slot16 = w

	self._tier.set_w(challenge_data.challenge_briefing_id, self._tier)

	slot18 = self._icon

	self._tier.set_center_x(challenge_data.challenge_briefing_id, self._icon.center_x(slot17))

	local icon = tweak_data.gui.icons[skill_tweak_data.icon]
	slot17 = icon.texture
	slot20 = icon.texture_rect

	self._icon.set_image(self._tier, self._icon, unpack(tweak_data.weapon[challenge_data.weapon_id].name_id))

	slot19 = self._progress_bar_panel
	slot17 = self._progress_bar_panel.w(unpack) * count / target

	self._progress_bar_foreground_panel.set_w(self._tier, self._progress_bar_foreground_panel)

	local progress_text = nil

	if count ~= target then
		slot17 = count
		slot19 = target
		progress_text = tostring(slot16) .. "/" .. tostring(slot18)
	else
		slot20 = "menu_weapon_challenge_completed"
		progress_text = utf8.to_upper(managers.localization.text(slot18, managers.localization))
	end

	slot18 = progress_text

	self._progress_text.set_text(slot16, self._progress_text)

	self._currently_shown_challenge = challenge_index

	return 
end
function HUDTabWeaponChallenge:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	slot4 = self._object
	self._initial_x_position = self._object.x(slot3)

	return 
end
function HUDTabWeaponChallenge:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDTabWeaponChallenge:set_bottom(y)
	slot5 = y

	self._object.set_bottom(slot3, self._object)

	return 
end
function HUDTabWeaponChallenge:set_top(y)
	slot5 = y

	self._object.set_top(slot3, self._object)

	return 
end
function HUDTabWeaponChallenge:set_left(x)
	slot5 = x

	self._object.set_left(slot3, self._object)

	slot4 = self._object
	self._initial_x_position = self._object.x(slot3)

	return 
end
function HUDTabWeaponChallenge:set_right(x)
	slot5 = x

	self._object.set_right(slot3, self._object)

	slot4 = self._object
	self._initial_x_position = self._object.x(slot3)

	return 
end
function HUDTabWeaponChallenge:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	slot4 = self._object
	self._initial_x_position = self._object.x(slot3)

	return 
end
function HUDTabWeaponChallenge:set_center_y(y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
function HUDTabWeaponChallenge:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDTabWeaponChallenge:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDTabWeaponChallenge:_animate_data_change(panel, challenge_data)
	local fade_out_duration = 0.3
	local fade_in_duration = 0.3
	slot7 = self._inner_panel
	local t = (1 - self._inner_panel.alpha(slot6)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_alpha = Easing.quartic_in(slot8, t, 1, -1)
		slot11 = current_alpha

		self._inner_panel.set_alpha(t, self._inner_panel)

		slot14 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON
		slot11 = current_alpha * tweak_data.gui.icon_w(fade_out_duration, tweak_data.gui)

		self._active_bullets[self._currently_shown_challenge].set_w(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

		slot14 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON
		slot11 = current_alpha * tweak_data.gui.icon_h(fade_out_duration, tweak_data.gui)

		self._active_bullets[self._currently_shown_challenge].set_h(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

		slot10 = self._active_bullets[self._currently_shown_challenge]
		slot13 = self._inactive_bullets[self._currently_shown_challenge]

		self._active_bullets[self._currently_shown_challenge].set_center(self._currently_shown_challenge, self._inactive_bullets[self._currently_shown_challenge].center(self._currently_shown_challenge))

		slot13 = fade_out_duration
		local current_position = Easing.quartic_in(self._currently_shown_challenge, t, 0, HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE)
		slot11 = current_position
		current_position = math.round(t)
		slot12 = current_position

		self._inner_panel.set_x(t, self._inner_panel)
	end

	slot9 = 0

	self._inner_panel.set_alpha(slot7, self._inner_panel)

	slot9 = HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE

	self._inner_panel.set_x(slot7, self._inner_panel)

	slot9 = 0

	self._active_bullets[self._currently_shown_challenge].set_alpha(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

	slot8 = self._active_bullets[self._currently_shown_challenge]
	slot12 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON

	self._active_bullets[self._currently_shown_challenge].set_w(self._currently_shown_challenge, tweak_data.gui.icon_w(slot10, tweak_data.gui))

	slot8 = self._active_bullets[self._currently_shown_challenge]
	slot12 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON

	self._active_bullets[self._currently_shown_challenge].set_h(self._currently_shown_challenge, tweak_data.gui.icon_h(slot10, tweak_data.gui))

	slot8 = self._active_bullets[self._currently_shown_challenge]
	slot11 = self._inactive_bullets[self._currently_shown_challenge]

	self._active_bullets[self._currently_shown_challenge].set_center(self._currently_shown_challenge, self._inactive_bullets[self._currently_shown_challenge].center(self._currently_shown_challenge))

	slot9 = challenge_data

	self._set_challenge(self._currently_shown_challenge, self)

	slot9 = 1

	self._active_bullets[self._currently_shown_challenge].set_alpha(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

	slot9 = 0

	self._active_bullets[self._currently_shown_challenge].set_w(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

	slot9 = 0

	self._active_bullets[self._currently_shown_challenge].set_h(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

	slot8 = self._active_bullets[self._currently_shown_challenge]
	slot11 = self._inactive_bullets[self._currently_shown_challenge]

	self._active_bullets[self._currently_shown_challenge].set_center(self._currently_shown_challenge, self._inactive_bullets[self._currently_shown_challenge].center(self._currently_shown_challenge))

	slot8 = 0.2

	wait(self._currently_shown_challenge)

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_alpha = Easing.quartic_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._inner_panel.set_alpha(t, self._inner_panel)

		slot14 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON
		slot11 = current_alpha * tweak_data.gui.icon_w(fade_in_duration, tweak_data.gui)

		self._active_bullets[self._currently_shown_challenge].set_w(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

		slot14 = HUDTabWeaponChallenge.INDEX_BULLET_ACTIVE_ICON
		slot11 = current_alpha * tweak_data.gui.icon_h(fade_in_duration, tweak_data.gui)

		self._active_bullets[self._currently_shown_challenge].set_h(self._currently_shown_challenge, self._active_bullets[self._currently_shown_challenge])

		slot10 = self._active_bullets[self._currently_shown_challenge]
		slot13 = self._inactive_bullets[self._currently_shown_challenge]

		self._active_bullets[self._currently_shown_challenge].set_center(self._currently_shown_challenge, self._inactive_bullets[self._currently_shown_challenge].center(self._currently_shown_challenge))

		slot13 = fade_in_duration
		local current_position = Easing.quartic_out(self._currently_shown_challenge, t, HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE, -HUDTabWeaponChallenge.ANIMATION_MOVE_X_DISTANCE)
		slot11 = current_position
		current_position = math.round(t)
		slot12 = current_position

		self._inner_panel.set_x(t, self._inner_panel)
	end

	slot9 = 1

	self._inner_panel.set_alpha(slot7, self._inner_panel)

	slot9 = 0

	self._inner_panel.set_x(slot7, self._inner_panel)

	return 
end

return 
