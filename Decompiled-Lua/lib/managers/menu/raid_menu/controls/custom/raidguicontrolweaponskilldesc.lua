-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlWeaponSkillDesc then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlWeaponSkillDesc = slot0
RaidGUIControlWeaponSkillDesc.CONTENT_W = 352
RaidGUIControlWeaponSkillDesc.BUTTON_SPACING = 96
RaidGUIControlWeaponSkillDesc.BUTTON_Y = 23
RaidGUIControlWeaponSkillDesc.BUTTON_HEIGHT = 54
RaidGUIControlWeaponSkillDesc.BUTTON_WIDTH = 40
RaidGUIControlWeaponSkillDesc.LINE_START_X = 36
RaidGUIControlWeaponSkillDesc.LINE_STRIDE = 96
RaidGUIControlWeaponSkillDesc.LINE_Y = 45
RaidGUIControlWeaponSkillDesc.LINE_LENGTH = 64
RaidGUIControlWeaponSkillDesc.LINE_THICKNESS = 3
slot3 = "878787"
RaidGUIControlWeaponSkillDesc.STATUS_COLOR = Color(slot2)
RaidGUIControlWeaponSkillDesc.CHALLENGE_LOCKED_TEXT = "menu_weapon_challenge_locked"
RaidGUIControlWeaponSkillDesc.CHALLENGE_IN_PROGRESS_TEXT = "menu_weapon_challenge_in_progress"
RaidGUIControlWeaponSkillDesc.CHALLENGE_COMPLETED_TEXT = "menu_weapon_challenge_completed"
RaidGUIControlWeaponSkillDesc.CHALLENGE_LOCKED_DESCRIPTION = "weapon_skill_challenge_locked"
function RaidGUIControlWeaponSkillDesc:init(parent, params)
	slot7 = params

	RaidGUIControlWeaponSkillDesc.super.init(slot4, self, parent)

	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	slot5 = self

	self._create_labels(slot4)

	slot5 = self

	self._create_progress_bar(slot4)

	return 
end
function RaidGUIControlWeaponSkillDesc:set_weapon_skill(skill_data)

	-- Decompilation error in this vicinity:
	local skill = skill_data.value
	local skill_info = tweak_data.weapon_skills.skills[skill.skill_name]
	local name_id = skill_info.name_id
	slot12 = true
	slot14 = true
	slot8 = self.translate(slot9, self, name_id) .. " " .. self.translate(name_id, self, "menu_inventory_tier") .. " " .. RaidGUIControlButtonWeaponSkill.ROMAN_NUMERALS[skill.tier]

	self._name_label.set_text(slot6, self._name_label)

	local desc_id = skill_info.desc_id
	slot8 = self._desc_label
	slot13 = false

	self._desc_label.set_text(self._name_label, self.translate(self.translate(name_id, self, "menu_inventory_tier"), self, desc_id))

	local challenge, count, target, min_range = nil

	if skill.challenge_id then
		challenge = managers.challenge.get_challenge(slot11, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
		local tasks = challenge.tasks(slot11)
		slot13 = tasks[1]
		count = tasks[1].current_count(challenge)
		slot13 = tasks[1]
		target = tasks[1].target(challenge)
		slot15 = tasks[1]
		slot13 = tasks[1].min_range(skill.challenge_id) / 100
		min_range = math.round(challenge)
	end

	slot13 = false

	self._challenge_locked_label.set_visible(slot11, self._challenge_locked_label)

	slot13 = true

	self._desc_label.set_visible(slot11, self._desc_label)

	return 
end
function RaidGUIControlWeaponSkillDesc:_create_labels()
	local params_name_label = {
		text = "UNKNOWN SKILL NAME",
		h = 38,
		y = 0,
		x = 0,
		name = self._params.name .. "_name_label",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot5 = params_name_label
	self._name_label = self._object.label("_name_label", self._object)
	local params_status_label = {
		h = 32,
		vertical = "bottom",
		align = "left",
		text = "lol",
		y = 32,
		x = 0,
		name = self._params.name .. "_status_label",
		w = RaidGUIControlWeaponSkillDesc.CONTENT_W,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = RaidGUIControlWeaponSkillDesc.STATUS_COLOR
	}
	slot6 = params_status_label
	self._status_label = self._object.label("_status_label", self._object)
	local params_desc_label = {
		h = 100,
		wrap = true,
		word_wrap = true,
		text = "Unknown skill description. Lorem ipsum glupsum tumsum. Kajaznam kolko ovog stane u tri linije mozda jos malo a mozda i ne.",
		y = 96,
		x = 0,
		name = self._params.name .. "_desc_label",
		w = RaidGUIControlWeaponSkillDesc.CONTENT_W,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	slot7 = params_desc_label
	self._desc_label = self._object.label("_desc_label", self._object)
	local tier_unlocks_at_level_label_params = {
		name = "cant_equip_explenation_label",
		h = 58,
		wrap = true,
		align = "left",
		text = "",
		visible = false,
		x = 0,
		layer = 1
	}
	slot7 = self._desc_label
	tier_unlocks_at_level_label_params.y = self._desc_label.y(self._object)
	tier_unlocks_at_level_label_params.w = RaidGUIControlWeaponSkillDesc.CONTENT_W
	tier_unlocks_at_level_label_params.font = tweak_data.gui.fonts.din_compressed
	tier_unlocks_at_level_label_params.font_size = tweak_data.gui.font_sizes.small
	tier_unlocks_at_level_label_params.color = tweak_data.gui.colors.raid_red
	slot8 = tier_unlocks_at_level_label_params
	self._challenge_locked_label = self._object.label(self._object, self._object)

	return 
end
function RaidGUIControlWeaponSkillDesc:_create_progress_bar()
	local progress_bar_panel_params = {
		vertical = "bottom",
		h = 32,
		x = 0,
		name = self._params.name .. "_progress_bar_panel",
		w = RaidGUIControlWeaponSkillDesc.CONTENT_W
	}
	slot5 = progress_bar_panel_params
	self._progress_bar_panel = self._object.panel("_progress_bar_panel", self._object)
	slot4 = self._progress_bar_panel
	slot7 = self._object

	self._progress_bar_panel.set_bottom("_progress_bar_panel", self._object.h(slot6))

	local texture_center = "slider_large_center"
	local texture_left = "slider_large_left"
	local texture_right = "slider_large_right"
	local progress_bar_background_params = {
		layer = 1,
		name = self._params.name .. "_progress_bar_background"
	}
	slot8 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w("_progress_bar_background")
	slot9 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h("_progress_bar_background", tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	slot9 = 0.5
	progress_bar_background_params.color = Color.white.with_alpha("_progress_bar_background", Color.white)
	slot9 = progress_bar_background_params
	local progress_bar_background = self._progress_bar_panel.three_cut_bitmap("_progress_bar_background", self._progress_bar_panel)
	local progress_bar_foreground_panel_params = {
		halign = "scale",
		y = 0,
		layer = 2,
		x = 0,
		valign = "scale",
		name = self._params.name .. "_progress_bar_foreground_panel"
	}
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.w = self._progress_bar_panel.w("_progress_bar_foreground_panel")
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.h = self._progress_bar_panel.h("_progress_bar_foreground_panel")
	slot11 = progress_bar_foreground_panel_params
	self._progress_bar_foreground_panel = self._progress_bar_panel.panel("_progress_bar_foreground_panel", self._progress_bar_panel)
	local progress_bar_background_params = {
		name = self._params.name .. "_progress_bar_background"
	}
	slot11 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w("_progress_bar_background")
	slot12 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h("_progress_bar_background", tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	progress_bar_background_params.color = tweak_data.gui.colors.raid_red
	slot12 = progress_bar_background_params
	local progress_bar_background = self._progress_bar_foreground_panel.three_cut_bitmap("_progress_bar_background", self._progress_bar_foreground_panel)
	local progress_bar_text_params = {
		vertical = "center",
		align = "center",
		text = "123/456",
		y = -2,
		x = 0,
		layer = 5,
		name = self._params.name .. "_progress_bar_text"
	}
	slot13 = self._progress_bar_panel
	progress_bar_text_params.w = self._progress_bar_panel.w("_progress_bar_text")
	slot13 = self._progress_bar_panel
	progress_bar_text_params.h = self._progress_bar_panel.h("_progress_bar_text")
	progress_bar_text_params.font = tweak_data.gui.fonts.din_compressed
	progress_bar_text_params.font_size = tweak_data.gui.font_sizes.size_24
	progress_bar_text_params.color = tweak_data.gui.colors.raid_dirty_white
	slot14 = progress_bar_text_params
	self._progress_text = self._progress_bar_panel.label("_progress_bar_text", self._progress_bar_panel)

	return 
end
function RaidGUIControlWeaponSkillDesc:set_progress(count, target)
	slot8 = self._progress_bar_panel
	slot6 = self._progress_bar_panel.w(slot7) * count / target

	self._progress_bar_foreground_panel.set_w(slot4, self._progress_bar_foreground_panel)

	if count ~= target then
		slot8 = count
		slot10 = target
		slot6 = tostring(slot7) .. "/" .. tostring(slot9)

		self._progress_text.set_text(slot4, self._progress_text)
	else
		slot5 = self._progress_text
		slot11 = "menu_weapon_challenge_completed"

		self._progress_text.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))
	end

	return 
end
function RaidGUIControlWeaponSkillDesc:on_click_weapon_skill_button()
	return 
end
function RaidGUIControlWeaponSkillDesc:on_mouse_enter_weapon_skill_button()
	return 
end
function RaidGUIControlWeaponSkillDesc:on_mouse_exit_weapon_skill_button()
	return 
end

return 
