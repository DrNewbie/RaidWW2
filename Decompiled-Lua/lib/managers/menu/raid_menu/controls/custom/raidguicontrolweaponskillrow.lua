if not RaidGUIControlWeaponSkillRow then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlWeaponSkillRow = slot0
RaidGUIControlWeaponSkillRow.BUTTON_START_X = 0
RaidGUIControlWeaponSkillRow.BUTTON_SPACING = 95
RaidGUIControlWeaponSkillRow.BUTTON_Y = 24
RaidGUIControlWeaponSkillRow.BUTTON_HEIGHT = 54
RaidGUIControlWeaponSkillRow.BUTTON_WIDTH = 40
RaidGUIControlWeaponSkillRow.LINE_START_X = 46 + RaidGUIControlWeaponSkillRow.BUTTON_START_X
RaidGUIControlWeaponSkillRow.LINE_STRIDE = 96
RaidGUIControlWeaponSkillRow.LINE_Y = 56
RaidGUIControlWeaponSkillRow.LINE_LENGTH = 64
RaidGUIControlWeaponSkillRow.LINE_THICKNESS = 3
function RaidGUIControlWeaponSkillRow:init(parent, params)
	slot7 = params

	RaidGUIControlWeaponSkillRow.super.init(slot4, self, parent)

	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	slot5 = self

	self._create_skill_label(slot4)

	slot5 = self

	self._create_items(slot4)

	return 
end
function RaidGUIControlWeaponSkillRow:set_weapon_skill(weapon_id, weapon_skills, i_skill)
	self._weapon_id = weapon_id
	self._weapon_skills = weapon_skills
	self._i_skill = i_skill
	local num_tiers = #weapon_skills
	self._skill_id = weapon_skills[num_tiers][i_skill][1].skill_name
	self._skill_data = tweak_data.weapon_skills.skills[self._skill_id]
	self._skill_name_id = self._skill_data.name_id
	local text = "UNKNOWN2"

	if self._skill_name_id then
		slot10 = true
		text = self.translate(slot7, self, self._skill_name_id)
		slot9 = text

		self._name_label.set_text(slot7, self._name_label)
	end

	for i_tier = 1, WeaponSkillsTweakData.MAX_TIERS, 1 do
		slot14 = i_tier
		local unlocked = managers.weapon_skills.is_weapon_tier_unlocked(slot11, managers.weapon_skills, self._weapon_id)
		local button = self._buttons[i_tier]
		local skill = (weapon_skills[i_tier] and weapon_skills[i_tier][i_skill] and weapon_skills[i_tier][i_skill][1]) or nil
		local left_skill = (weapon_skills[i_tier - 1] and weapon_skills[i_tier - 1][i_skill] and weapon_skills[i_tier - 1][i_skill][1]) or nil
		slot23 = i_skill

		button.set_skill(slot15, button, weapon_id, skill, self._skill_data, left_skill, unlocked, i_tier)
	end

	return 
end
function RaidGUIControlWeaponSkillRow:_create_skill_label()
	local name_label_params = {
		vertical = "center",
		h = 24,
		wrap = true,
		align = "left",
		text = "UNKNOWN",
		y = 0,
		x = 0,
		name = self._params.name .. "_name_label"
	}
	slot4 = self._object
	name_label_params.w = self._object.w("_name_label")
	name_label_params.font = tweak_data.gui.fonts.din_compressed
	name_label_params.font_size = tweak_data.gui.font_sizes.size_20
	name_label_params.color = tweak_data.gui.colors.raid_grey
	slot5 = name_label_params
	self._name_label = self._object.label("_name_label", self._object)

	return 
end
function RaidGUIControlWeaponSkillRow:_create_items()
	local lines_params = {
		x = RaidGUIControlWeaponSkillRow.LINE_START_X,
		y = RaidGUIControlWeaponSkillRow.LINE_Y,
		w = RaidGUIControlWeaponSkillRow.LINE_LENGTH,
		h = RaidGUIControlWeaponSkillRow.LINE_THICKNESS,
		color = tweak_data.color
	}
	self._lines = {}

	for i_tier = 1, WeaponSkillsTweakData.MAX_TIERS - 1, 1 do
		slot9 = lines_params
		local line = self._object.rect(slot7, self._object)
		slot10 = line

		table.insert(self._object, self._lines)

		lines_params.x = lines_params.x + RaidGUIControlWeaponSkillRow.LINE_STRIDE
	end

	local skill_params = {
		text = "",
		line_enabled = true,
		x = RaidGUIControlWeaponSkillRow.BUTTON_START_X,
		y = RaidGUIControlWeaponSkillRow.BUTTON_Y,
		h = RaidGUIControlWeaponSkillRow.BUTTON_HEIGHT,
		w = RaidGUIControlWeaponSkillRow.BUTTON_WIDTH
	}
	slot7 = "on_click_weapon_skill_button"
	skill_params.on_click_callback = callback(slot4, self, self)
	skill_params.on_mouse_enter_callback = self._params.on_mouse_enter_callback
	skill_params.on_mouse_exit_callback = self._params.on_mouse_exit_callback
	skill_params.on_selected_weapon_skill_callback = self._params.on_selected_weapon_skill_callback
	skill_params.on_unselected_weapon_skill_callback = self._params.on_unselected_weapon_skill_callback
	skill_params.get_available_points_callback = self._params.get_available_points_callback
	skill_params.on_click_weapon_skill_callback = self._params.on_click_weapon_skill_callback
	skill_params.toggle_select_item_callback = self._params.toggle_select_item_callback
	slot5 = self._object
	skill_params.layer = self._object.layer(slot4) + 3
	local left_button = nil
	self._buttons = {}

	for i_tier = 1, WeaponSkillsTweakData.MAX_TIERS, 1 do
		slot15 = left_button
		local skill_button = self._object.create_custom_control(slot9, self._object, RaidGUIControlButtonWeaponSkill, skill_params, i_tier, self._lines[i_tier - 1])
		slot12 = skill_button

		table.insert(self._object, self._buttons)

		skill_params.x = skill_params.x + RaidGUIControlWeaponSkillRow.BUTTON_SPACING
		left_button = skill_button
	end

	return 
end
function RaidGUIControlWeaponSkillRow:get_skill_buttons()
	return self._buttons
end
function RaidGUIControlWeaponSkillRow:on_click_weapon_skill_button()
	return 
end
function RaidGUIControlWeaponSkillRow:on_mouse_enter_weapon_skill_button()
	return 
end
function RaidGUIControlWeaponSkillRow:on_mouse_exit_weapon_skill_button()
	return 
end
function RaidGUIControlWeaponSkillRow:mouse_moved(o, x, y)
	return 
end

return 
