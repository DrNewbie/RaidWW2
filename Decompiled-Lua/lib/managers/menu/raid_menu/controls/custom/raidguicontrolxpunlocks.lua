if not RaidGUIControlXPSkillSet then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlXPSkillSet = slot0
RaidGUIControlXPSkillSet.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlXPSkillSet.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPSkillSet.FLAVOR_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlXPSkillSet.FLAVOR_TEXT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPSkillSet.TEXT_H = 79
RaidGUIControlXPSkillSet.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPSkillSet.SINGLE_ICON_CENTER_Y = 208
RaidGUIControlXPSkillSet.ICON_CENTER_Y = 208
RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE = 0.8
RaidGUIControlXPSkillSet.DOUBLE_ICON_DISTANCE = 444
RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE = 0.6
RaidGUIControlXPSkillSet.TRIPLE_ICON_DISTANCE = 260
function RaidGUIControlXPSkillSet:init(parent)
	slot5 = parent

	self._create_panel(slot3, self)

	slot4 = self

	self._create_content_panel(slot3)

	slot4 = self

	self._create_icon_panel(slot3)

	slot4 = self

	self._create_text(slot3)

	return 
end
function RaidGUIControlXPSkillSet:_create_panel(parent)
	local panel_params = {
		halign = "scale",
		name = "skill_set_unlock_panel",
		visible = false,
		valign = "scale"
	}
	slot6 = panel_params
	self._object = parent.panel(slot4, parent)

	return 
end
function RaidGUIControlXPSkillSet:_create_content_panel()
	local panel_params = {
		alpha = 0,
		name = "content_panel",
		halign = "scale",
		valign = "scale"
	}
	slot5 = panel_params
	self._content_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlXPSkillSet:_create_icon_panel()
	local icon_panel_params = {
		halign = "scale",
		name = "icon_panel",
		valign = "scale"
	}
	slot5 = icon_panel_params
	self._icon_panel = self._content_panel.panel(slot3, self._content_panel)

	return 
end
function RaidGUIControlXPSkillSet:_create_text()
	local title_text_params = {
		align = "center",
		vertical = "center",
		name = "skill_set_unlock_title_text",
		h = RaidGUIControlXPSkillSet.TEXT_H,
		font = RaidGUIControlXPSkillSet.FONT,
		font_size = RaidGUIControlXPSkillSet.TITLE_FONT_SIZE,
		color = RaidGUIControlXPSkillSet.TITLE_COLOR,
		text = utf8.to_upper(managers.localization.text(slot5, managers.localization, "menu_skill_set_unlocked"))
	}
	slot5 = title_text_params
	local title = self._content_panel.text(slot3, self._content_panel)
	slot5 = title
	local _, _, w, _ = title.text_rect(self._content_panel)
	slot10 = w

	title.set_w({
		LEVEL = tostring(slot10)
	}, title)

	slot9 = title
	slot12 = self._content_panel

	title.set_bottom(, self._content_panel.h(1))

	slot12 = self._content_panel
	slot10 = self._content_panel.w(1) / 2

	title.set_center_x(, title)

	local flavor_text_params = {
		align = "center",
		vertical = "center",
		name = "skill_set_unlock_flavor_text",
		h = RaidGUIControlXPSkillSet.TEXT_H,
		font = RaidGUIControlXPSkillSet.FONT,
		font_size = RaidGUIControlXPSkillSet.FLAVOR_TEXT_FONT_SIZE,
		color = RaidGUIControlXPSkillSet.FLAVOR_TEXT_COLOR
	}
	slot12 = true
	flavor_text_params.text = self.translate(title, self, "menu_congratulations")
	slot11 = flavor_text_params
	local flavor_text = self._content_panel.text(title, self._content_panel)
	slot11 = flavor_text
	local _, _, w, _ = flavor_text.text_rect(self._content_panel)
	slot16 = w

	flavor_text.set_w(slot14, flavor_text)

	slot15 = flavor_text
	slot18 = title

	flavor_text.set_bottom(slot14, title.y(slot17))

	slot15 = flavor_text
	slot18 = title

	flavor_text.set_x(slot14, title.x(slot17))

	return 
end
function RaidGUIControlXPSkillSet:set_level(level)
	slot5 = "skill_set_unlock_title_text"
	local title = self._content_panel.child(slot3, self._content_panel)
	slot5 = title
	slot12 = {
		LEVEL = tostring(slot14)
	}
	slot15 = level

	title.set_text(self._content_panel, utf8.to_upper(managers.localization.text(slot9, managers.localization, "menu_skill_set_unlocked")))

	slot5 = title
	local _, _, w, _ = title.text_rect(self._content_panel)
	slot10 = w

	title.set_w(managers.localization.text, title)

	slot9 = title
	slot12 = self._content_panel

	title.set_bottom(managers.localization.text, self._content_panel.h("menu_skill_set_unlocked"))

	slot10 = self._content_panel.w("menu_skill_set_unlocked") / 2

	title.set_center_x(managers.localization.text, title)

	slot10 = "skill_set_unlock_flavor_text"
	local flavor_text = self._content_panel.child(managers.localization.text, self._content_panel)
	slot10 = flavor_text
	slot13 = title

	flavor_text.set_bottom(self._content_panel, title.y(self._content_panel))

	slot10 = flavor_text
	slot13 = title

	flavor_text.set_x(self._content_panel, title.x(self._content_panel))

	slot10 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(self._content_panel)
	local level_skills = tweak_data.skilltree.skill_trees[character_class][level]
	slot12 = self._content_panel
	slot12 = self._content_panel.get_engine_panel(title.x)

	self._content_panel.get_engine_panel(title.x).stop(title.x)

	slot12 = self._content_panel
	slot17 = "_animate_skill_change"
	slot14 = level_skills

	self._content_panel.get_engine_panel(title.x).animate(title.x, self._content_panel.get_engine_panel(title.x), callback(slot14, self, self))

	return 
end
function RaidGUIControlXPSkillSet:_create_icons(skills)
	local icons = {}
	slot5 = skills

	for _, skill in pairs(slot4) do
		local skill_data = tweak_data.skilltree.skills[skill.skill_name]
		slot15 = skill.skill_name

		Application.debug(slot10, Application)

		local icon_params = {}
		slot13 = skill_data.name_id
		icon_params.name = "skill_" .. tostring("[RaidGUIControlXPSkillSet] Creating large icon for skill " .. tostring(slot14)) .. "_icon"
		icon_params.texture = tweak_data.gui.icons[skill_data.icon_large].texture
		icon_params.texture_rect = tweak_data.gui.icons[skill_data.icon_large].texture_rect
		slot13 = icon_params
		local icon = self._icon_panel.bitmap(skill_data.icon_large, self._icon_panel)
		slot14 = icon

		table.insert(self._icon_panel, icons)
	end

	if #icons == 1 then
		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(slot7) / 2

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])
	elseif #icons == 2 then
		slot8 = icons[1]
		slot6 = icons[1].w(slot7) * RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE

		icons[1].set_w(slot4, icons[1])

		slot8 = icons[1]
		slot6 = icons[1].h(RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE) * RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE

		icons[1].set_h(slot4, icons[1])

		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE) / 2 - RaidGUIControlXPSkillSet.DOUBLE_ICON_DISTANCE / 2

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])

		slot8 = icons[2]
		slot6 = icons[2].w(RaidGUIControlXPSkillSet.DOUBLE_ICON_DISTANCE / 2) * RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE

		icons[2].set_w(slot4, icons[2])

		slot8 = icons[2]
		slot6 = icons[2].h(RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE) * RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE

		icons[2].set_h(slot4, icons[2])

		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(RaidGUIControlXPSkillSet.DOUBLE_ICON_SCALE) / 2 + RaidGUIControlXPSkillSet.DOUBLE_ICON_DISTANCE / 2

		icons[2].set_center_x(slot4, icons[2])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[2].set_center_y(slot4, icons[2])
	elseif #icons == 3 then
		slot8 = icons[1]
		slot6 = icons[1].w(slot7) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[1].set_w(slot4, icons[1])

		slot8 = icons[1]
		slot6 = icons[1].h(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[1].set_h(slot4, icons[1])

		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) / 2 - RaidGUIControlXPSkillSet.TRIPLE_ICON_DISTANCE

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])

		slot8 = icons[2]
		slot6 = icons[2].w(RaidGUIControlXPSkillSet.TRIPLE_ICON_DISTANCE) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[2].set_w(slot4, icons[2])

		slot8 = icons[2]
		slot6 = icons[2].h(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[2].set_h(slot4, icons[2])

		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) / 2

		icons[2].set_center_x(slot4, icons[2])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[2].set_center_y(slot4, icons[2])

		slot8 = icons[3]
		slot6 = icons[3].w(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[3].set_w(slot4, icons[3])

		slot8 = icons[3]
		slot6 = icons[3].h(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) * RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE

		icons[3].set_h(slot4, icons[3])

		slot8 = self._icon_panel
		slot6 = self._icon_panel.w(RaidGUIControlXPSkillSet.TRIPLE_ICON_SCALE) / 2 + RaidGUIControlXPSkillSet.TRIPLE_ICON_DISTANCE

		icons[3].set_center_x(slot4, icons[3])

		slot6 = RaidGUIControlXPSkillSet.ICON_CENTER_Y

		icons[3].set_center_y(slot4, icons[3])
	end

	return 
end
function RaidGUIControlXPSkillSet:_animate_skill_change(panel, skills)
	local fade_out_duration = 0.25
	local fade_in_duration = 0.3
	slot7 = self._content_panel
	local t = (1 - self._content_panel.alpha(slot6)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._content_panel.set_alpha(t, self._content_panel)
	end

	slot9 = 0

	self._content_panel.set_alpha(slot7, self._content_panel)

	slot8 = self._icon_panel

	self._icon_panel.clear(slot7)

	slot9 = skills

	self._create_icons(slot7, self)

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._content_panel.set_alpha(t, self._content_panel)
	end

	slot9 = 1

	self._content_panel.set_alpha(slot7, self._content_panel)

	return 
end

if not RaidGUIControlXPDoubleUnlock then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlXPDoubleUnlock = slot0
RaidGUIControlXPDoubleUnlock.TITLE_CENTER_Y = 144
RaidGUIControlXPDoubleUnlock.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlXPDoubleUnlock.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPDoubleUnlock.SUBTITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlXPDoubleUnlock.SUBTITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPDoubleUnlock.FLAVOR_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlXPDoubleUnlock.FLAVOR_TEXT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPDoubleUnlock.TEXT_H = 79
RaidGUIControlXPDoubleUnlock.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_Y = 192
RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_H = 320
RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y = 128
RaidGUIControlXPDoubleUnlock.SINGLE_ICON_SCALE = 0.6
RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE = 0.43
RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_DISTANCE = 184
RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE = 0.33
RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_DISTANCE = 148
function RaidGUIControlXPDoubleUnlock:init(parent)
	slot5 = parent

	self._create_panel(slot3, self)

	slot4 = self

	self._create_skill_panel(slot3)

	slot4 = self

	self._create_weapon_panel(slot3)

	slot4 = self

	self._create_title_text(slot3)

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_panel(parent)
	local panel_params = {
		halign = "scale",
		name = "skill_set_unlock_panel",
		visible = false,
		valign = "scale"
	}
	slot6 = panel_params
	self._object = parent.panel(slot4, parent)

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_weapon_panel()
	local weapon_panel_params = {
		halign = "scale",
		name = "weapon_panel",
		alpha = 0,
		valign = "scale",
		y = RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_Y,
		h = RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_H
	}
	slot4 = self._object
	weapon_panel_params.w = self._object.w(slot3) / 2
	slot5 = weapon_panel_params
	self._weapon_panel = self._object.panel(slot3, self._object)
	local weapon_icon_panel_params = {
		halign = "scale",
		name = "weapon_icon_panel",
		valign = "scale"
	}
	slot6 = weapon_icon_panel_params
	self._weapon_icon_panel = self._weapon_panel.panel(self._object, self._weapon_panel)
	local weapon_name_params = {
		text = "",
		align = "center",
		vertical = "center",
		name = "weapon_name",
		h = RaidGUIControlXPDoubleUnlock.TEXT_H,
		font = RaidGUIControlXPDoubleUnlock.FONT,
		font_size = RaidGUIControlXPDoubleUnlock.SUBTITLE_FONT_SIZE,
		color = RaidGUIControlXPDoubleUnlock.SUBTITLE_COLOR
	}
	slot7 = weapon_name_params
	self._weapon_name = self._weapon_panel.text(self._weapon_panel, self._weapon_panel)
	slot9 = self._weapon_panel
	slot7 = self._weapon_panel.w(slot8) / 2

	self._weapon_name.set_center_x(self._weapon_panel, self._weapon_name)

	slot6 = self._weapon_name
	slot9 = self._weapon_panel

	self._weapon_name.set_bottom(self._weapon_panel, self._weapon_panel.h(slot8))

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_skill_panel()
	local skill_panel_params = {
		halign = "scale",
		name = "skill_panel",
		alpha = 0,
		valign = "scale",
		y = RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_Y,
		h = RaidGUIControlXPDoubleUnlock.CONTENT_PANELS_H
	}
	slot4 = self._object
	skill_panel_params.x = self._object.w(slot3) / 2
	slot4 = self._object
	skill_panel_params.w = self._object.w(slot3) / 2
	slot5 = skill_panel_params
	self._skill_panel = self._object.panel(slot3, self._object)
	local skill_icon_panel_params = {
		halign = "scale",
		name = "skill_icon_panel",
		valign = "scale"
	}
	slot6 = skill_icon_panel_params
	self._skill_icon_panel = self._skill_panel.panel(self._object, self._skill_panel)
	local skill_set_title_params = {
		text = "",
		align = "center",
		vertical = "center",
		name = "skill_set_title",
		h = RaidGUIControlXPDoubleUnlock.TEXT_H,
		font = RaidGUIControlXPDoubleUnlock.FONT,
		font_size = RaidGUIControlXPDoubleUnlock.SUBTITLE_FONT_SIZE,
		color = RaidGUIControlXPDoubleUnlock.SUBTITLE_COLOR
	}
	slot7 = skill_set_title_params
	self._skill_set_title = self._skill_panel.text(self._skill_panel, self._skill_panel)
	slot9 = self._skill_panel
	slot7 = self._skill_panel.w(slot8) / 2

	self._skill_set_title.set_center_x(self._skill_panel, self._skill_set_title)

	slot6 = self._skill_set_title
	slot9 = self._skill_panel

	self._skill_set_title.set_bottom(self._skill_panel, self._skill_panel.h(slot8))

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_title_text()
	local title_text_params = {
		align = "center",
		vertical = "center",
		name = "skill_set_unlock_title_text",
		h = RaidGUIControlXPDoubleUnlock.TEXT_H,
		font = RaidGUIControlXPDoubleUnlock.FONT,
		font_size = RaidGUIControlXPDoubleUnlock.TITLE_FONT_SIZE,
		color = RaidGUIControlXPDoubleUnlock.TITLE_COLOR
	}
	slot6 = true
	title_text_params.text = self.translate(slot3, self, "menu_double_unlock")
	slot5 = title_text_params
	local title = self._object.text(slot3, self._object)
	slot5 = title
	local _, _, w, _ = title.text_rect(self._object)
	slot10 = w

	title.set_w(slot8, title)

	slot10 = RaidGUIControlXPDoubleUnlock.TITLE_CENTER_Y

	title.set_center_y(slot8, title)

	slot12 = self._object
	slot10 = self._object.w(slot11) / 2

	title.set_center_x(slot8, title)

	local flavor_text_params = {
		align = "center",
		vertical = "center",
		name = "skill_set_unlock_flavor_text",
		h = RaidGUIControlXPDoubleUnlock.TEXT_H,
		font = RaidGUIControlXPDoubleUnlock.FONT,
		font_size = RaidGUIControlXPDoubleUnlock.FLAVOR_TEXT_FONT_SIZE,
		color = RaidGUIControlXPDoubleUnlock.FLAVOR_TEXT_COLOR
	}
	slot12 = true
	flavor_text_params.text = self.translate(title, self, "menu_congratulations")
	slot11 = flavor_text_params
	local flavor_text = self._object.text(title, self._object)
	slot11 = flavor_text
	local _, _, w, _ = flavor_text.text_rect(self._object)
	slot16 = w

	flavor_text.set_w(slot14, flavor_text)

	slot15 = flavor_text
	slot18 = title

	flavor_text.set_bottom(slot14, title.y(slot17))

	slot15 = flavor_text
	slot18 = title

	flavor_text.set_x(slot14, title.x(slot17))

	return 
end
function RaidGUIControlXPDoubleUnlock:set_level(level)
	slot4 = self._skill_set_title
	slot11 = {
		LEVEL = tostring(slot13)
	}
	slot14 = level

	self._skill_set_title.set_text(slot3, utf8.to_upper(managers.localization.text(slot8, managers.localization, "menu_skill_set_title")))

	slot4 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(slot3)
	local level_skills = tweak_data.skilltree.skill_trees[character_class][level]
	slot6 = self._skill_panel
	slot6 = self._skill_panel.get_engine_panel(utf8.to_upper)

	self._skill_panel.get_engine_panel(utf8.to_upper).stop(utf8.to_upper)

	slot6 = self._skill_panel
	slot11 = "_animate_skill_change"
	slot8 = level_skills

	self._skill_panel.get_engine_panel(utf8.to_upper).animate(utf8.to_upper, self._skill_panel.get_engine_panel(utf8.to_upper), callback(slot8, self, self))

	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]

	if weapon_unlock_progression[level] and weapon_unlock_progression[level].weapons then
		slot7 = self._weapon_panel
		slot7 = self._weapon_panel.get_engine_panel(slot6)

		self._weapon_panel.get_engine_panel(slot6).stop(slot6)

		slot7 = self._weapon_panel
		slot12 = "_animate_weapon_change"
		slot9 = weapon_unlock_progression[level]

		self._weapon_panel.get_engine_panel(slot6).animate(slot6, self._weapon_panel.get_engine_panel(slot6), callback(slot9, self, self))
	end

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_skill_icons(skills)
	local icons = {}
	slot5 = skills

	for _, skill in pairs(slot4) do
		local skill_data = tweak_data.skilltree.skills[skill.skill_name]
		local icon_params = {}
		slot13 = skill_data.name_id
		icon_params.name = "skill_" .. tostring(slot12) .. "_icon"
		icon_params.texture = tweak_data.gui.icons[skill_data.icon_large].texture
		icon_params.texture_rect = tweak_data.gui.icons[skill_data.icon_large].texture_rect
		slot13 = icon_params
		local icon = self._skill_icon_panel.bitmap(skill_data.icon_large, self._skill_icon_panel)
		slot14 = icon

		table.insert(self._skill_icon_panel, icons)
	end

	if #icons == 1 then
		slot8 = icons[1]
		slot6 = icons[1].w(slot7) * RaidGUIControlXPDoubleUnlock.SINGLE_ICON_SCALE

		icons[1].set_w(slot4, icons[1])

		slot8 = icons[1]
		slot6 = icons[1].h(RaidGUIControlXPDoubleUnlock.SINGLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.SINGLE_ICON_SCALE

		icons[1].set_h(slot4, icons[1])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.SINGLE_ICON_SCALE) / 2

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])
	elseif #icons == 2 then
		slot8 = icons[1]
		slot6 = icons[1].w(slot7) * RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE

		icons[1].set_w(slot4, icons[1])

		slot8 = icons[1]
		slot6 = icons[1].h(RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE

		icons[1].set_h(slot4, icons[1])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE) / 2 - RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_DISTANCE / 2

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])

		slot8 = icons[2]
		slot6 = icons[2].w(RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_DISTANCE / 2) * RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE

		icons[2].set_w(slot4, icons[2])

		slot8 = icons[2]
		slot6 = icons[2].h(RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE

		icons[2].set_h(slot4, icons[2])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_SCALE) / 2 + RaidGUIControlXPDoubleUnlock.DOUBLE_ICON_DISTANCE / 2

		icons[2].set_center_x(slot4, icons[2])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[2].set_center_y(slot4, icons[2])
	elseif #icons == 3 then
		slot8 = icons[1]
		slot6 = icons[1].w(slot7) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[1].set_w(slot4, icons[1])

		slot8 = icons[1]
		slot6 = icons[1].h(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[1].set_h(slot4, icons[1])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) / 2 - RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_DISTANCE

		icons[1].set_center_x(slot4, icons[1])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[1].set_center_y(slot4, icons[1])

		slot8 = icons[2]
		slot6 = icons[2].w(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_DISTANCE) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[2].set_w(slot4, icons[2])

		slot8 = icons[2]
		slot6 = icons[2].h(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[2].set_h(slot4, icons[2])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) / 2

		icons[2].set_center_x(slot4, icons[2])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[2].set_center_y(slot4, icons[2])

		slot8 = icons[3]
		slot6 = icons[3].w(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[3].set_w(slot4, icons[3])

		slot8 = icons[3]
		slot6 = icons[3].h(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) * RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE

		icons[3].set_h(slot4, icons[3])

		slot8 = self._skill_icon_panel
		slot6 = self._skill_icon_panel.w(RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_SCALE) / 2 + RaidGUIControlXPDoubleUnlock.TRIPLE_ICON_DISTANCE

		icons[3].set_center_x(slot4, icons[3])

		slot6 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

		icons[3].set_center_y(slot4, icons[3])
	end

	return 
end
function RaidGUIControlXPDoubleUnlock:_create_weapon_icons(weapon_unlocks)
	local weapon_skill_unlock = weapon_unlocks.weapons[1]
	local weapon_tweak_data = tweak_data.weapon[tweak_data.skilltree.skills[weapon_skill_unlock].upgrades[1]]
	local icon_params = {
		name = "weapon_icon",
		texture = tweak_data.gui.icons[weapon_tweak_data.gui.icon_large].texture,
		texture_rect = tweak_data.gui.icons[weapon_tweak_data.gui.icon_large].texture_rect
	}
	slot8 = icon_params
	local icon = self._weapon_icon_panel.bitmap(weapon_tweak_data.gui.icon_large, self._weapon_icon_panel)
	slot11 = self._weapon_icon_panel
	slot9 = self._weapon_icon_panel.w(slot10) / 2

	icon.set_center_x(self._weapon_icon_panel, icon)

	slot9 = RaidGUIControlXPDoubleUnlock.ICON_CENTER_Y

	icon.set_center_y(self._weapon_icon_panel, icon)

	slot8 = self._weapon_name
	slot13 = true

	self._weapon_name.set_text(self._weapon_icon_panel, self.translate(slot10, self, weapon_tweak_data.name_id))

	slot8 = self._weapon_name
	local _, _, w, _ = self._weapon_name.text_rect(self._weapon_icon_panel)
	slot12 = self._weapon_name

	if self._weapon_name.w(self) < w then
		slot13 = self._weapon_name
		slot16 = self._weapon_name

		self._refit_title_text(slot11, self, self._weapon_name.font_size(slot15))
	end

	return 
end
function RaidGUIControlXPDoubleUnlock:_animate_skill_change(skill_panel, skills)
	local fade_out_duration = 0.25
	local fade_in_duration = 0.3
	slot7 = self._skill_panel
	local t = (1 - self._skill_panel.alpha(slot6)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._skill_panel.set_alpha(t, self._skill_panel)
	end

	slot9 = 0

	self._skill_panel.set_alpha(slot7, self._skill_panel)

	slot8 = self._skill_icon_panel

	self._skill_icon_panel.clear(slot7)

	slot9 = skills

	self._create_skill_icons(slot7, self)

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._skill_panel.set_alpha(t, self._skill_panel)
	end

	slot9 = 1

	self._skill_panel.set_alpha(slot7, self._skill_panel)

	return 
end
function RaidGUIControlXPDoubleUnlock:_animate_weapon_change(weapon_panel, weapon_unlocks)
	local fade_out_duration = 0.25
	local fade_in_duration = 0.3
	slot7 = self._weapon_panel
	local t = (1 - self._weapon_panel.alpha(slot6)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._weapon_panel.set_alpha(t, self._weapon_panel)
	end

	slot9 = 0

	self._weapon_panel.set_alpha(slot7, self._weapon_panel)

	slot8 = self._weapon_icon_panel

	self._weapon_icon_panel.clear(slot7)

	slot9 = weapon_unlocks

	self._create_weapon_icons(slot7, self)

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._weapon_panel.set_alpha(t, self._weapon_panel)
	end

	slot9 = 1

	self._weapon_panel.set_alpha(slot7, self._weapon_panel)

	return 
end
function RaidGUIControlXPDoubleUnlock:_refit_title_text(title_control, original_font_size)
	local font_sizes = {}
	slot6 = tweak_data.gui.font_sizes

	for index, size in pairs(slot5) do
		if size < original_font_size then
			slot12 = size

			table.insert(slot10, font_sizes)
		end
	end

	slot6 = font_sizes

	table.sort(slot5)

	for i = #font_sizes, 1, -1 do
		slot11 = font_sizes[i]

		title_control.set_font_size(slot9, title_control)

		slot10 = title_control
		local _, _, w, h = title_control.text_rect(slot9)
		slot14 = title_control

		if h <= title_control.h(slot13) then
			slot14 = title_control

			if w <= title_control.w(slot13) then
				break
			end
		end
	end

	return 
end

return 
