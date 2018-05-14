DLCTweakData = DLCTweakData or class()
DLCTweakData.DLC_GRANT_TYPE_AUTO = 1
DLCTweakData.DLC_GRANT_TYPE_DROP = 2
DLCTweakData.DLC_GRANT_TYPE_BUY = 3
DLCTweakData.DLC_NAME_FULL_GAME = "full_game"
DLCTweakData.DLC_NAME_PREORDER = "preorder"
DLCTweakData.DLC_NAME_SPECIAL_EDITION = "special_edition"
DLCTweakData.DLC_NAME_RAID_COMMUNITY = "raid_community"
DLCTweakData.DLC_NAME_OFFICIAL_SOUNDTRACK = "official_soundtrack"
DLCTweakData.DLC_REWARD_CUSTOMIZATION_JACKET_RANDOM = "customization_jacket_random"
function DLCTweakData:init(tweak_data)
	slot4 = managers.dlc

	if managers.dlc.is_installing(slot3) then
		tweak_data.BUNDLED_DLC_PACKAGES = {}
	else
		tweak_data.BUNDLED_DLC_PACKAGES = {}
	end

	slot4 = self

	self._init_descriptions(slot3)

	return 
end
function DLCTweakData:_init_descriptions()
	self.descriptions = {
		[DLCTweakData.DLC_NAME_PREORDER] = {}
	}
	self.descriptions[DLCTweakData.DLC_NAME_PREORDER].content = {
		customizations = {
			{
				item = "american_highlander_jacket_upper"
			},
			{
				item = "american_highlander_jacket_lower"
			},
			{
				item = "russian_highlander_jacket_upper"
			},
			{
				item = "russian_highlander_jacket_lower"
			},
			{
				item = "german_highlander_jacket_upper"
			},
			{
				item = "german_highlander_jacket_lower"
			},
			{
				item = "british_highlander_jacket_upper"
			},
			{
				item = "british_highlander_jacket_lower"
			}
		},
		weapons = {
			{
				item = "garand_golden"
			}
		},
		gold_award = {
			item = "preorder_army_crate",
			amount = 50
		}
	}
	self.descriptions[DLCTweakData.DLC_NAME_SPECIAL_EDITION] = {
		content = {
			customizations = {
				{
					item = "american_highlander_jacket_upper"
				},
				{
					item = "american_highlander_jacket_lower"
				},
				{
					item = "russian_highlander_jacket_upper"
				},
				{
					item = "russian_highlander_jacket_lower"
				},
				{
					item = "german_highlander_jacket_upper"
				},
				{
					item = "german_highlander_jacket_lower"
				},
				{
					item = "british_highlander_jacket_upper"
				},
				{
					item = "british_highlander_jacket_lower"
				},
				{
					item = "american_special_edition_001_upper"
				},
				{
					item = "british_special_edition_001_upper"
				},
				{
					item = "german_special_edition_001_upper"
				},
				{
					item = "russian_special_edition_001_upper"
				}
			},
			melee_weapons = {
				{
					item = "km_dagger"
				},
				{
					item = "marching_mace"
				}
			},
			vehicle_skins = {
				{
					item = "kubelwagen_special_edition",
					vehicle = "kubelwagen"
				}
			},
			camp_customizations = {
				{
					item = "special_edition_bomb"
				}
			},
			weapons = {
				{
					item = "garand_golden"
				}
			},
			gold_award = {
				item = "preorder_army_crate",
				amount = 50
			}
		}
	}
	self.descriptions[DLCTweakData.DLC_NAME_RAID_COMMUNITY] = {
		content = {
			gold_award = {
				item = "raid_community_group",
				amount = 100
			},
			random_customization = {
				item = "raid_community_group"
			}
		}
	}
	self.descriptions[DLCTweakData.DLC_NAME_OFFICIAL_SOUNDTRACK] = {
		content = {
			melee_weapons = {
				{
					item = "marching_mace"
				}
			}
		}
	}

	return 
end
function DLCTweakData:get_eligible_gold_awards()
	local eligible_awards = {}
	slot4 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot3) do
		if dlc_desc.content.gold_award then
			slot10 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
				slot10 = {
					name = dlc_name,
					item = dlc_desc.content.gold_award.item,
					amount = dlc_desc.content.gold_award.amount
				}

				table.insert(slot8, eligible_awards)
			end
		end
	end

	return eligible_awards
end
function DLCTweakData:get_eligible_random_customizations()
	local eligible_awards = {}
	slot4 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot3) do
		if dlc_desc.content.random_customization then
			slot10 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
				slot10 = {
					item = dlc_desc.content.random_customization.item
				}

				table.insert(slot8, eligible_awards)
			end
		end
	end

	return eligible_awards
end
function DLCTweakData:get_unlocked_weapons()
	local weapons = {}
	slot4 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot3) do
		if dlc_desc.content.weapons then
			slot10 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
				slot9 = dlc_desc.content.weapons

				for _, weapon in pairs(slot8) do
					weapons[weapon.item] = true
				end
			end
		end
	end

	return weapons
end
function DLCTweakData:get_locked_weapons()
	slot3 = self
	local unlocked_weapons = self.get_unlocked_weapons(slot2)
	local weapons = {}
	slot5 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot4) do
		if dlc_desc.content.weapons then
			slot11 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot9, managers.dlc) then
				slot10 = dlc_desc.content.weapons

				for _, weapon in pairs(slot9) do
					if not unlocked_weapons[weapon.item] then
						weapons[weapon.item] = true
					end
				end
			end
		end
	end

	return weapons
end
function DLCTweakData:is_weapon_unlocked(weapon_id)
	slot4 = self
	local weapons = self.get_unlocked_weapons(slot3)
	local unlocked = (weapons[weapon_id] and true) or false

	return unlocked
end
function DLCTweakData:get_unlocked_melee_weapons()
	local weapons = {}
	slot4 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot3) do
		if dlc_desc.content.melee_weapons then
			slot10 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
				slot9 = dlc_desc.content.melee_weapons

				for _, weapon in pairs(slot8) do
					weapons[weapon.item] = true
				end
			end
		end
	end

	return weapons
end
function DLCTweakData:get_locked_melee_weapons()
	slot3 = self
	local unlocked_weapons = self.get_unlocked_melee_weapons(slot2)
	local weapons = {}
	slot5 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot4) do
		if dlc_desc.content.melee_weapons then
			slot11 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot9, managers.dlc) then
				slot10 = dlc_desc.content.melee_weapons

				for _, weapon in pairs(slot9) do
					if not unlocked_weapons[weapon.item] then
						weapons[weapon.item] = true
					end
				end
			end
		end
	end

	return weapons
end
function DLCTweakData:is_melee_weapon_unlocked(weapon_id)
	slot4 = self
	local melee_weapons = self.get_unlocked_melee_weapons(slot3)
	local unlocked = (melee_weapons[weapon_id] and true) or false

	return unlocked
end
function DLCTweakData:get_unlocked_customizations()
	local customizations = {}
	slot4 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot3) do
		if dlc_desc.content.customizations then
			slot10 = dlc_name

			if managers.dlc.is_dlc_unlocked(slot8, managers.dlc) then
				slot9 = dlc_desc.content.customizations

				for _, customization in pairs(slot8) do
					customizations[customization.item] = true
				end
			end
		end
	end

	return customizations
end
function DLCTweakData:get_locked_customizations()
	slot3 = self
	local unlocked_customizations = self.get_unlocked_customizations(slot2)
	local customizations = {}
	slot5 = self.descriptions

	for dlc_name, dlc_desc in pairs(slot4) do
		if dlc_desc.content.customizations then
			slot11 = dlc_name

			if not managers.dlc.is_dlc_unlocked(slot9, managers.dlc) then
				slot10 = dlc_desc.content.customizations

				for _, customization in pairs(slot9) do
					if not unlocked_customizations[customization] then
						customizations[customization.item] = true
					end
				end
			end
		end
	end

	return customizations
end
function DLCTweakData:is_customization_unlocked(customization_name)
	slot4 = self
	local customizations = self.get_unlocked_customizations(slot3)
	local unlocked = (customizations[customization_id] and true) or false

	return unlocked
end

return 
