PlayerSkill = {
	has_skill = function (category, skill, player)
		if player then
			slot5 = player
			slot7 = skill

			return player.base(slot4).upgrade_value(slot4, player.base(slot4), category) ~= nil
		else
			slot7 = skill

			return managers.player.has_category_upgrade(slot4, managers.player, category)
		end

		return 
	end,
	skill_data = function (category, skill, default, player)
		if player then
			slot6 = player
			slot8 = skill

			return player.base(slot5).upgrade_value(slot5, player.base(slot5), category) or default
		else
			slot9 = default

			return managers.player.upgrade_value(slot5, managers.player, category, skill)
		end

		return 
	end,
	skill_level = function (category, skill, default, player)
		if player then
			slot6 = player
			slot8 = skill

			return player.base(slot5).upgrade_level(slot5, player.base(slot5), category) or 0
		else
			slot9 = default

			return managers.player.upgrade_level(slot5, managers.player, category, skill)
		end

		return 
	end
}

return 
