CampCustomizationTweakData = CampCustomizationTweakData or class()
CampCustomizationTweakData.init = function (self)
	slot3 = self

	self._setup_camp_assets(slot2)

	slot3 = self

	self._setup_default_camp_list(slot2)

	return 
end
CampCustomizationTweakData._setup_camp_assets = function (self)
	self.camp_upgrades_automatic = {
		gold_pile = {
			gold = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9,
				10,
				15,
				20,
				25,
				30,
				35,
				40,
				45,
				50,
				60,
				70,
				80,
				90,
				100,
				120,
				140,
				160,
				180,
				200,
				250,
				300,
				350,
				400,
				450,
				500,
				550,
				600,
				650,
				700,
				750,
				800,
				850,
				900,
				950,
				1000,
				1100,
				1200,
				1300,
				1400,
				1500,
				1600,
				1700,
				1800,
				1900,
				2000,
				2100,
				2200,
				2300,
				2400,
				2500,
				3000,
				3500,
				4000,
				5000,
				6000,
				7000,
				8000,
				9000,
				10000,
				11000,
				12000,
				13000,
				14000,
				15000,
				1700,
				20000,
				22000,
				24000,
				26000,
				28000,
				30000,
				35000,
				40000,
				45000,
				50000,
				70000,
				100000,
				150000,
				250000
			}
		}
	}
	self.camp_upgrades = {
		bomb = {
			levels = {
				{
					name_id = "golden_bomb_lvl_1_name_id",
					scene_unit = "units/vanilla/props/props_camp_upgrades/props_bomb/level_1/props_camp_bomb_level_01_shop",
					description_id = "golden_bomb_lvl_1_desc_id",
					grid_icon = "units/vanilla/props/props_camp_upgrades/props_bomb/bomb_l01_hud"
				},
				{
					gold_price = 500,
					scene_unit = "units/vanilla/props/props_camp_upgrades/props_bomb/level_2/props_camp_bomb_level_02_shop",
					grid_icon = "units/vanilla/props/props_camp_upgrades/props_bomb/bomb_l02_hud",
					name_id = "golden_bomb_lvl_2_name_id",
					description_id = "golden_bomb_lvl_2_desc_id"
				},
				{
					scene_unit = "units/vanilla/props/props_camp_upgrades/props_special_edition_bomb/props_special_edition_bomb_shop",
					grid_icon = "units/vanilla/props/props_camp_upgrades/props_special_edition_bomb/bomb_special_edition_hud",
					name_id = "special_edition_bomb_name_id",
					description_id = "special_edition_bomb_desc_id",
					dlc = DLCTweakData.DLC_NAME_SPECIAL_EDITION
				}
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.toilet = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_toilet/level_01/props_camp_toilet_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_toilet/toilet_l01_hud",
				name_id = "golden_toilet_lvl_1_name_id",
				description_id = "golden_toilet_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 180, 0)
			},
			{
				gold_price = 125,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_toilet/level_02/props_camp_toilet_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_toilet/toilet_l02_hud",
				name_id = "golden_toilet_lvl_2_name_id",
				description_id = "golden_toilet_lvl_2_desc_id",
				scene_unit_rotation = Rotation(slot6, 180, 0)
			}
		}
	}
	self.camp_upgrades.mission_table = {
		levels = {
			{
				name_id = "mission_table_lvl_1_name_id",
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_mission/level_1/props_table_mission_level_01_shop",
				description_id = "mission_table_lvl_1_desc_id",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_mission/table_missions_l01_hud"
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_mission/level_2/props_table_mission_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_mission/table_missions_l02_hud",
				name_id = "mission_table_lvl_2_name_id",
				description_id = "mission_table_lvl_2_desc_id"
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.weapons_table = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_weapon_upgrades/level_1/props_table_weapon_upgrades_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_weapon_upgrades/table_weapons_l01_hud",
				name_id = "weapons_table_lvl_1_name_id",
				description_id = "weapons_table_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_weapon_upgrades/level_2/props_table_weapon_upgrades_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_weapon_upgrades/table_weapons_hud",
				name_id = "weapons_table_lvl_2_name_id",
				description_id = "weapons_table_lvl_2_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			}
		}
	}
	self.camp_upgrades.skill_table = {
		levels = {
			{
				name_id = "skill_table_lvl_1_name_id",
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_skills/level_1/props_table_skills_level_01_shop",
				description_id = "skill_table_lvl_1_desc_id",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_skills/table_skills_l01_hud"
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_skills/level_2/props_table_skills_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_skills/table_skills_l02_hud",
				name_id = "skill_table_lvl_2_name_id",
				description_id = "skill_table_lvl_2_desc_id"
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.character_table = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_caracter_creation/level_1/props_table_caracter_creation_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_caracter_creation/table_character_customization_l01_hud",
				name_id = "char_table_lvl_1_name_id",
				description_id = "char_table_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_caracter_creation/level_2/props_table_caracter_creation_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_caracter_creation/table_character_customization_l02_hud",
				name_id = "char_table_lvl_2_name_id",
				description_id = "char_table_lvl_2_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			}
		}
	}
	self.camp_upgrades.card_table = {
		levels = {
			{
				name_id = "card_table_lvl_1_name_id",
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_challenge_cards/level_1/props_card_table_level_01_shop",
				description_id = "card_table_lvl_1_desc_id",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_challenge_cards/table_cards_l01_hud"
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_challenge_cards/level_2/props_card_table_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_challenge_cards/table_cards_l02_hud",
				name_id = "card_table_lvl_2_name_id",
				description_id = "card_table_lvl_2_desc_id"
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.radio_table = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_radio/level_1/props_table_radio_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_radio/table_servers_l01_hud",
				name_id = "radio_table_lvl_1_name_id",
				description_id = "radio_table_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			},
			{
				gold_price = 250,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_table_radio/level_2/props_table_radio_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_table_radio/table_servers_l02_hud",
				name_id = "radio_table_lvl_2_name_id",
				description_id = "radio_table_lvl_2_desc_id",
				scene_unit_rotation = Rotation(slot6, 90, 0)
			}
		}
	}
	self.camp_upgrades.large_picture_1 = {
		levels = {
			{
				gold_price = 50,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_painting_medium_01/level_1/props_painting_medium_01_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_painting_medium_01/painting_medium_01_l02_hud",
				name_id = "large_picture_lvl_1_name_id",
				description_id = "large_picture_lvl_1_desc_id"
			}
		}
	}
	self.camp_upgrades.large_picture_2 = {
		levels = {
			{
				gold_price = 50,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_painting_medium_02/level_1/props_painting_medium_02_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_painting_medium_02/painting_medium_02_l02_hud",
				name_id = "large_picture_lvl_2_name_id",
				description_id = "large_picture_lvl_2_desc_id"
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.piano = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_piano/broken_level_0/props_camp_piano_broken_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_piano/piano_l01_hud",
				name_id = "piano_lvl_1_name_id",
				description_id = "piano_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 0, 0)
			},
			{
				gold_price = 125,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_piano/level_1/props_camp_piano_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_piano/piano_l02_hud",
				name_id = "piano_lvl_1_name_id",
				description_id = "piano_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 0, 0)
			}
		}
	}
	slot9 = 0
	self.camp_upgrades.rug = {
		levels = {
			{
				gold_price = 25,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_carpet/level_1/props_camp_carpet_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_carpet/carpet_l02_hud",
				name_id = "rug_lvl_1_name_id",
				description_id = "rug_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 180, 0)
			}
		}
	}
	slot9 = 0
	slot9 = 0
	self.camp_upgrades.control_table = {
		levels = {
			{
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_control_table/level_01/props_camp_control_table_level_01_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_control_table/table_control_l01_hud",
				name_id = "control_table_lvl_1_name_id",
				description_id = "control_tables_lvl_1_desc_id",
				scene_unit_rotation = Rotation(slot6, 0, 0)
			},
			{
				gold_price = 125,
				scene_unit = "units/vanilla/props/props_camp_upgrades/props_camp_control_table/level_02/props_camp_control_table_golden_level_02_shop",
				grid_icon = "units/vanilla/props/props_camp_upgrades/props_camp_control_table/table_control_l02_hud",
				name_id = "control_table_lvl_2_name_id",
				description_id = "control_tables_lvl_2_desc_id",
				scene_unit_rotation = Rotation(slot6, 0, 0)
			}
		}
	}

	return 
end
CampCustomizationTweakData._setup_default_camp_list = function (self)
	self.default_camp = {
		{
			upgrade = "gold_pile"
		},
		{
			level = 1,
			upgrade = "bomb"
		},
		{
			level = 1,
			upgrade = "toilet"
		},
		{
			level = 1,
			upgrade = "mission_table"
		},
		{
			level = 1,
			upgrade = "weapons_table"
		},
		{
			level = 1,
			upgrade = "skill_table"
		},
		{
			level = 1,
			upgrade = "character_table"
		},
		{
			level = 1,
			upgrade = "card_table"
		},
		{
			level = 1,
			upgrade = "radio_table"
		},
		{
			level = 0,
			upgrade = "large_picture_1"
		},
		{
			level = 0,
			upgrade = "large_picture_2"
		},
		{
			level = 1,
			upgrade = "piano"
		},
		{
			level = 0,
			upgrade = "rug"
		},
		{
			level = 1,
			upgrade = "control_table"
		}
	}

	return 
end
CampCustomizationTweakData.get_applyable_upgrades = function (self)
	local upgrades = {}
	slot4 = self.camp_upgrades

	for upgrade_slot_name, upgrade_slot in pairs(slot3) do
		slot9 = upgrade_slot.levels

		for upgrade_level, upgrade in ipairs(slot8) do
			slot17 = upgrade_level

			if self.is_upgrade_applyable(slot13, self, upgrade, upgrade_slot_name) then
				slot15 = {
					upgrade = upgrade_slot_name,
					level = upgrade_level
				}

				table.insert(slot13, upgrades)
			end
		end
	end

	return upgrades
end
CampCustomizationTweakData.is_upgrade_applyable = function (self, upgrade, upgrade_slot_name, upgrade_level)
	slot8 = upgrade_level

	if self.is_default_upgrade(slot5, self, upgrade_slot_name) then
		return true
	end

	if not upgrade.dlc and upgrade.gold_price then
		return false
	end

	if upgrade.dlc then
		slot7 = upgrade.dlc

		if managers.dlc.is_dlc_unlocked(slot5, managers.dlc) and not upgrade.gold_price then
			return true
		end
	end

	return false
end
CampCustomizationTweakData.is_upgrade_unlocked = function (self, upgrade)
	if not upgrade.dlc and upgrade.gold_price then
		return true
	end

	if upgrade.dlc then
		slot5 = upgrade.dlc

		if managers.dlc.is_dlc_unlocked(slot3, managers.dlc) then
			return true
		end
	end

	return false
end
CampCustomizationTweakData.is_default_upgrade = function (self, upgrade_slot_name, upgrade_level)
	slot6 = upgrade_slot_name

	if upgrade_level == self.get_default_upgrade_level(slot4, self) and 0 < upgrade_level then
		return true
	end

	return false
end
CampCustomizationTweakData.get_default_upgrade_level = function (self, upgrade_slot_name)
	slot4 = self.default_camp

	for key, upgrade in pairs(slot3) do
		if upgrade.upgrade == upgrade_slot_name then
			return upgrade.level
		end
	end

	return nil
end

return 
