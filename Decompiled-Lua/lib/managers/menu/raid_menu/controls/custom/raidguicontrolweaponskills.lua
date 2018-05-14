-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlWeaponSkills then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlWeaponSkills = slot0
RaidGUIControlWeaponSkills.ROW_HEIGHT = 96
RaidGUIControlWeaponSkills.FIRST_ROW_Y = 39
RaidGUIControlWeaponSkills.ROMAN_NUMERALS = {
	"I",
	"II",
	"III",
	"IV"
}
RaidGUIControlWeaponSkills.TIER_LABEL_ACTIVE_ALPHA = 1
RaidGUIControlWeaponSkills.TIER_LABEL_INACTIVE_ALPHA = 0.6
function RaidGUIControlWeaponSkills:init(parent, params)
	slot7 = params

	RaidGUIControlWeaponSkills.super.init(slot4, self, parent)

	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	slot5 = self

	self._create_items(slot4)

	slot5 = self

	self._create_tier_labels(slot4)

	self._temp_weapon_points = 0
	self._temp_skills = {}
	RaidGUIControlWeaponSkills.gui = self
	self._on_selected_weapon_skill_callback = params.on_selected_weapon_skill_callback
	self._on_unselected_weapon_skill_callback = params.on_unselected_weapon_skill_callback

	return 
end
function RaidGUIControlWeaponSkills:_create_items()
	self._rows = {}
	local row_params = {
		x = 0,
		y = RaidGUIControlWeaponSkills.FIRST_ROW_Y,
		h = RaidGUIControlWeaponSkills.ROW_HEIGHT
	}
	slot4 = self._object
	row_params.layer = self._object.layer(slot3) + 1
	row_params.on_mouse_enter_callback = self._params.on_mouse_enter_callback
	row_params.on_mouse_exit_callback = self._params.on_mouse_exit_callback
	slot6 = "on_selected_weapon_skill_callback"
	row_params.on_selected_weapon_skill_callback = callback(slot3, self, self)
	slot6 = "on_unselected_weapon_skill_callback"
	row_params.on_unselected_weapon_skill_callback = callback(slot3, self, self)
	slot6 = "get_available_points"
	row_params.get_available_points_callback = callback(slot3, self, self)
	row_params.on_click_weapon_skill_callback = self._params.on_click_weapon_skill_callback
	slot6 = "toggle_select_item_callback"
	row_params.toggle_select_item_callback = callback(slot3, self, self)

	for i_skill = 1, WeaponSkillsTweakData.MAX_SKILLS_IN_TIER, 1 do
		slot10 = row_params
		local row = self._object.create_custom_control(slot7, self._object, RaidGUIControlWeaponSkillRow)
		row_params.y = row_params.y + RaidGUIControlWeaponSkills.ROW_HEIGHT
		slot10 = row

		table.insert(RaidGUIControlWeaponSkills.ROW_HEIGHT, self._rows)
	end

	return 
end
function RaidGUIControlWeaponSkills:_create_tier_labels()
	local tier_panel_params = {
		h = 30,
		name = "tier_label_panel"
	}
	slot5 = tier_panel_params
	self._tier_panel = self._object.panel(slot3, self._object)
	self._tier_labels = {}

	for i = 1, #RaidGUIControlWeaponSkills.ROMAN_NUMERALS, 1 do
		local text = self.translate(slot7, self, "menu_weapons_stats_tier_abbreviation") .. RaidGUIControlWeaponSkills.ROMAN_NUMERALS[i]
		local tier_label_params = {
			align = "center",
			vertical = "bottom"
		}
		slot11 = i
		tier_label_params.name = "tier_" .. tostring(true) .. "_label"
		tier_label_params.font = tweak_data.gui.fonts.din_compressed
		tier_label_params.font_size = tweak_data.gui.font_sizes.size_24
		tier_label_params.color = tweak_data.gui.colors.raid_white
		tier_label_params.alpha = RaidGUIControlWeaponSkills.TIER_LABEL_ACTIVE_ALPHA
		tier_label_params.text = text
		slot11 = tier_label_params
		local tier_label = self._tier_panel.text(tostring(true), self._tier_panel)
		slot11 = tier_label
		local _, _, w, h = tier_label.text_rect(self._tier_panel)
		slot16 = w

		tier_label.set_w(slot14, tier_label)

		slot16 = h

		tier_label.set_h(slot14, tier_label)

		slot16 = tier_label.y(slot17) - 5

		tier_label.set_y(slot14, tier_label)

		slot19 = self._rows[1]
		slot19 = self._rows[1].get_skill_buttons(tier_label)[1]
		slot16 = RaidGUIControlWeaponSkillRow.BUTTON_START_X + self._rows[1].get_skill_buttons(tier_label)[1].w(tier_label) / 2 + (i - 1) * RaidGUIControlWeaponSkillRow.BUTTON_SPACING

		tier_label.set_center_x(slot14, tier_label)

		slot16 = tier_label

		table.insert(slot14, self._tier_labels)
	end

	return 
end
function RaidGUIControlWeaponSkills:get_rows()
	return self._rows
end
function RaidGUIControlWeaponSkills:get_temp_points()
	return self._temp_weapon_points
end
function RaidGUIControlWeaponSkills:set_temp_points(value)
	self._temp_weapon_points = value

	return 
end
function RaidGUIControlWeaponSkills:get_temp_skills()
	return self._temp_skills
end
function RaidGUIControlWeaponSkills:get_available_points()
	slot3 = managers.weapon_skills
	local available_points = managers.weapon_skills.get_available_weapon_skill_points(slot2) - self._temp_weapon_points

	return available_points
end
function RaidGUIControlWeaponSkills:set_weapon(weapon_category_id, weapon_id)
	slot6 = weapon_id
	local weapon_skills = managers.weapon_skills.get_weapon_skills(slot4, managers.weapon_skills)

	if not weapon_skills then
		return 
	end

	self._weapon_id = weapon_id
	self._weapon_category_id = weapon_category_id
	self._temp_weapon_points = 0
	self._temp_skills = {}
	local num_tiers = #weapon_skills
	local num_skills = #weapon_skills[num_tiers]

	for i = 1, #self._tier_labels, 1 do
		if i <= num_tiers then
			slot14 = i
			local unlocked = managers.weapon_skills.is_weapon_tier_unlocked(slot11, managers.weapon_skills, weapon_id)
			slot14 = (unlocked and RaidGUIControlWeaponSkills.TIER_LABEL_ACTIVE_ALPHA) or RaidGUIControlWeaponSkills.TIER_LABEL_INACTIVE_ALPHA

			self._tier_labels[i].set_alpha(slot12, self._tier_labels[i])

			slot14 = true

			self._tier_labels[i].set_visible(slot12, self._tier_labels[i])
		else
			slot13 = false

			self._tier_labels[i].set_visible(slot11, self._tier_labels[i])
		end
	end

	slot8 = self._rows

	for i_skill, row in ipairs(slot7) do
		if i_skill <= num_skills then
			slot13 = row

			row.show(slot12)

			slot16 = i_skill

			row.set_weapon_skill(slot12, row, weapon_id, weapon_skills)
		else
			slot13 = row

			row.hide(slot12)
		end
	end

	return 
end
function RaidGUIControlWeaponSkills:apply_selected_skills()
	slot3 = self._temp_skills

	for skill, _ in pairs(slot2) do
		slot10 = self._weapon_category_id

		managers.weapon_skills.activate_skill(slot7, managers.weapon_skills, skill)

		if skill.i_tier and 4 <= skill.i_tier then
			slot9 = self._weapon_id

			managers.statistics.tier_4_weapon_skill_bought(slot7, managers.statistics)
		end
	end

	slot3 = managers.weapon_skills
	slot6 = self

	managers.weapon_skills.set_available_weapon_skill_points(slot2, self.get_available_points(slot5))

	slot6 = "activate"

	managers.weapon_skills.update_weapon_skills(slot2, managers.weapon_skills, self._weapon_category_id, self._weapon_id)

	slot3 = managers.player

	managers.player._internal_load(slot2)

	slot3 = managers.player
	slot3 = managers.player.local_player(slot2)
	slot5 = true

	managers.player.local_player(slot2).inventory(slot2).equip_selection(slot2, managers.player.local_player(slot2).inventory(slot2), self._weapon_category_id)

	slot4 = Global.savefile_manager.save_progress_slot

	managers.savefile.save_game(slot2, managers.savefile)

	slot5 = self._weapon_id

	self.set_weapon(slot2, self, self._weapon_category_id)

	return 
end
function RaidGUIControlWeaponSkills:mouse_moved(o, x, y)
	return 
end
function RaidGUIControlWeaponSkills:highlight_on()
	return 
end
function RaidGUIControlWeaponSkills:highlight_off()
	return 
end
function RaidGUIControlWeaponSkills:on_selected_weapon_skill_callback(button, data, skip_update_points)
	slot7 = data

	self._on_selected_weapon_skill_callback(slot5, button)

	return 
end
function RaidGUIControlWeaponSkills:on_unselected_weapon_skill_callback(button, data)
	slot6 = data

	self._on_unselected_weapon_skill_callback(slot4, button)

	return 
end
function RaidGUIControlWeaponSkills:unacquire_all_temp_skills(weapon_category_id)
	local weapon_category = ""

	if weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		weapon_category = "primary_weapon"
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		weapon_category = "secondary_weapon"
	end

	local upgrades_data = tweak_data.upgrades.values[weapon_category]
	slot6 = upgrades_data

	for upgrade_name, data in pairs(slot5) do
		slot14 = 0
		local upgrade_level = managers.player.upgrade_level(slot10, managers.player, weapon_category, upgrade_name)

		if 0 < upgrade_level then
			slot16 = WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE

			managers.weapon_skills.update_weapon_skill_by_upgrade_name(slot11, managers.weapon_skills, weapon_category, upgrade_name, upgrade_level)
		end
	end

	slot6 = self._rows

	for _, skill_row in ipairs(slot5) do
		slot13 = skill_row

		for _, skill_button in ipairs(skill_row.get_skill_buttons(slot12)) do
			slot16 = skill_button

			if skill_button.get_state(slot15) == RaidGUIControlButtonWeaponSkill.STATE_SELECTED then
				slot16 = skill_button

				if skill_button.visible(slot15) then
					slot17 = RaidGUIControlButtonWeaponSkill.STATE_NORMAL

					skill_button.set_state(slot15, skill_button)
				end
			end
		end
	end

	slot6 = self._rows

	for _, skill_row in ipairs(slot5) do
		local upgrade_level = 0
		local upgrade_name = ""
		slot15 = skill_row

		for _, skill_button in ipairs(skill_row.get_skill_buttons(slot14)) do
			slot18 = skill_button

			if skill_button.get_state(slot17) == RaidGUIControlButtonWeaponSkill.STATE_ACTIVE then
				slot18 = skill_button

				if skill_button.visible(slot17) then
					slot18 = skill_button
					local skill_button_data = skill_button.get_data(slot17)

					if upgrade_level < skill_button_data.value.value then
						upgrade_level = skill_button_data.value.value
						upgrade_name = skill_button_data.value.skill_name
					end
				end
			end
		end

		if 0 < upgrade_level then
			slot14 = upgrade_name
			local upgrade_name = managers.weapon_skills.get_upgrade_name_from_raid_stat_name(slot12, managers.weapon_skills)
			slot18 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

			managers.weapon_skills.update_weapon_skill_by_upgrade_name(managers.weapon_skills, managers.weapon_skills, weapon_category, upgrade_name, upgrade_level)
		end
	end

	return 
end
function RaidGUIControlWeaponSkills:set_selected(value, dont_trigger_selected_callback)
	self._selected = value
	self._selected_row_idx = 1
	self._selected_button_idx = 1
	local current_skill_button = self.get_current_weapon_skill_button(slot4)
	slot7 = dont_trigger_selected_callback

	current_skill_button.select_skill(self, current_skill_button)

	return 
end
function RaidGUIControlWeaponSkills:toggle_select_item_callback(select_flag, row_idx, button_idx)
	if select_flag then
		local current_skill_button = self.get_current_weapon_skill_button(slot5)
		slot9 = button_idx
		local new_skill_button = self.get_weapon_skill_button(self, self, row_idx)

		if current_skill_button ~= new_skill_button then
			slot8 = current_skill_button

			current_skill_button.unselect_skill(slot7)
		end

		slot8 = new_skill_button

		new_skill_button.select_skill(slot7)

		self._selected_row_idx = row_idx
		self._selected_button_idx = button_idx
		slot10 = row_idx

		self._consume_breadcrumb(slot7, self, button_idx)
	elseif not select_flag then
		slot8 = button_idx
		local unselect_skill_button = self.get_weapon_skill_button(slot5, self, row_idx)

		if unselect_skill_button then
			slot7 = unselect_skill_button

			unselect_skill_button.unselect_skill(slot6)
		end

		self._selected_row_idx = row_idx
		self._selected_button_idx = button_idx
	end

	return 
end
function RaidGUIControlWeaponSkills:_consume_breadcrumb(tier_index, skill_index)
	slot6 = self._weapon_category_id
	local weapon_category = managers.weapon_inventory.get_weapon_category_name_by_bm_category_id(slot4, managers.weapon_inventory)
	slot8 = {
		weapon_category,
		self._weapon_id,
		tier_index,
		skill_index
	}

	managers.breadcrumb.remove_breadcrumb(managers.weapon_inventory, managers.breadcrumb, BreadcrumbManager.CATEGORY_WEAPON_UPGRADE)

	return 
end
function RaidGUIControlWeaponSkills:get_current_weapon_skill_button()
	slot5 = self._selected_button_idx

	return self.get_weapon_skill_button(slot2, self, self._selected_row_idx)
end
function RaidGUIControlWeaponSkills:get_weapon_skill_button(i_row, i_button)
	slot5 = self._rows[i_row]
	local skill_button = self._rows[i_row].get_skill_buttons(slot4)[i_button]

	if skill_button then
		slot6 = skill_button
	else
		return nil
	end

	return 
end
function RaidGUIControlWeaponSkills:_select_weapon_skill_button(weapon_skill_button)
	slot4 = weapon_skill_button

	weapon_skill_button.select_skill(slot3)

	return 
end
function RaidGUIControlWeaponSkills:_unselect_weapon_skill_button(weapon_skill_button)
	slot4 = weapon_skill_button

	weapon_skill_button.unselect_skill(slot3)

	return 
end
function RaidGUIControlWeaponSkills:move_up()
	slot5 = "_select_up_skill_button"
	self._move_controller_callback = callback(slot2, self, self)
	slot3 = self

	return self._move_controller(slot2)
end
function RaidGUIControlWeaponSkills:move_down()
	slot5 = "_select_down_skill_button"
	self._move_controller_callback = callback(slot2, self, self)
	slot3 = self

	return self._move_controller(slot2)
end
function RaidGUIControlWeaponSkills:move_left()
	slot5 = "_select_left_skill_button"
	self._move_controller_callback = callback(slot2, self, self)
	slot3 = self

	return self._move_controller(slot2)
end
function RaidGUIControlWeaponSkills:move_right()
	slot5 = "_select_right_skill_button"
	self._move_controller_callback = callback(slot2, self, self)
	slot3 = self

	return self._move_controller(slot2)
end
function RaidGUIControlWeaponSkills:_move_controller()
	if self._selected then
		slot3 = self
		local current_skill_button = self.get_current_weapon_skill_button(slot2)
		local new_skill_button = self._move_controller_callback()

		if current_skill_button and new_skill_button then
			slot5 = new_skill_button

			if not new_skill_button.visible(slot4) then
				return 
			end

			slot6 = current_skill_button

			self._unselect_weapon_skill_button(slot4, self)

			slot6 = new_skill_button

			self._select_weapon_skill_button(slot4, self)
		end

		return true
	end

	return 
end
function RaidGUIControlWeaponSkills:_select_up_skill_button()
	self._new_selected_row_idx = self._selected_row_idx - 1

	if self._new_selected_row_idx <= 0 then
		self._selected_row_idx = 1
	else
		self._selected_row_idx = self._new_selected_row_idx
	end

	local skill_button = nil
	slot5 = self._rows[self._selected_row_idx]

	for counter = self._selected_button_idx, #self._rows[self._selected_row_idx].get_skill_buttons(self._selected_row_idx), 1 do
		slot10 = counter
		skill_button = self.get_weapon_skill_button(slot7, self, self._selected_row_idx)

		if skill_button then
			slot8 = skill_button

			if skill_button.visible(slot7) then
				self._selected_button_idx = counter

				return skill_button
			end
		end
	end

	return skill_button
end
function RaidGUIControlWeaponSkills:_select_down_skill_button()
	self._new_selected_row_idx = self._selected_row_idx + 1

	if #self._rows < self._new_selected_row_idx then
		self._selected_row_idx = #self._rows
	else
		self._selected_row_idx = self._new_selected_row_idx
	end

	local skill_button = nil
	slot5 = self._rows[self._selected_row_idx]

	for counter = self._selected_button_idx, #self._rows[self._selected_row_idx].get_skill_buttons(self._selected_row_idx), 1 do
		slot10 = counter
		skill_button = self.get_weapon_skill_button(slot7, self, self._selected_row_idx)

		if skill_button then
			slot8 = skill_button

			if skill_button.visible(slot7) then
				self._selected_button_idx = counter

				return skill_button
			end
		end
	end

	if not skill_button then
		self._selected_row_idx = self._selected_row_idx - 1
	end

	return skill_button
end
function RaidGUIControlWeaponSkills:_select_left_skill_button()
	self._new_selected_button_idx = self._selected_button_idx - 1
	slot5 = self._new_selected_button_idx
	local skill_point = self.get_weapon_skill_button(slot2, self, self._selected_row_idx)

	if skill_point then
		self._selected_button_idx = self._new_selected_button_idx

		return skill_point
	else
		slot6 = self._selected_button_idx

		return self.get_weapon_skill_button(slot3, self, self._selected_row_idx)
	end

	return 
end
function RaidGUIControlWeaponSkills:_select_right_skill_button()
	self._new_selected_button_idx = self._selected_button_idx + 1
	slot4 = self._rows[self._selected_row_idx]

	if #self._rows[self._selected_row_idx].get_skill_buttons(self._selected_row_idx) < self._new_selected_button_idx then
		slot3 = self._rows[self._selected_row_idx]
		self._selected_button_idx = #self._rows[self._selected_row_idx].get_skill_buttons(self._selected_row_idx)
		self._new_selected_button_idx = self._selected_button_idx + 1
	else
		slot5 = self._new_selected_button_idx

		if self.get_weapon_skill_button(slot2, self, self._selected_row_idx) then
			self._selected_button_idx = self._new_selected_button_idx
		end
	end

	slot5 = self._selected_button_idx

	return self.get_weapon_skill_button(slot2, self, self._selected_row_idx)
end
function RaidGUIControlWeaponSkills:confirm_pressed()
	slot3 = self
	self._selected_skill_button = self.get_current_weapon_skill_button(slot2)
	slot3 = self._selected_skill_button

	self._selected_skill_button.on_mouse_released(slot2)

	return 
end

return 
