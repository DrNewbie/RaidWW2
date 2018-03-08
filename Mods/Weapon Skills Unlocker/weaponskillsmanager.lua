Hooks:PostHook(WeaponSkillsManager, "init", "WeaponSkillsUnlocker", function(self, ...)
	if self and self._global and type(self._global.weapon_skills_skill_tree) == "table" then
		local i_count = 0
		for weapon_i, weapon_d in pairs(self._global.weapon_skills_skill_tree) do
			if type(weapon_d) == "table" then
				for i, d in pairs(weapon_d) do
					if type(i) == "number" then
						i_count = i_count + 1
						if type(d) == "table" then
							for i_d, d_d in pairs(d) do
								if type(d_d) == "table" then
									for ii_d, dd_d in pairs(d_d) do
										if dd_d.skill_name then
											self._global.weapon_skills_skill_tree[weapon_i][i][i_d][ii_d].active = true
											self._global.weapon_skills_skill_tree[weapon_i][i][i_d][ii_d].challenge_unlocked = true
										end
									end
								end
							end
						end
					end
				end
				for i = 1, i_count do
					self._global.weapon_skills_skill_tree[weapon_i].tier_unlock[i] = "weapon_tier_unlocked"
				end
			end
		end
	end
end )