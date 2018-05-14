-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
Warcry = Warcry or class()
Warcry.BERSERK = "berserk"
Warcry.CLUSTERTRUCK = "clustertruck"
Warcry.GHOST = "ghost"
Warcry.SHARPSHOOTER = "sharpshooter"
Warcry.team_buffs = {}
Warcry.create = function (warcry_name)
	if warcry_name == "berserk" then
		slot3 = WarcryBerserk

		return WarcryBerserk.new(slot2)
	elseif warcry_name == "clustertruck" then
		slot3 = WarcryClustertruck

		return WarcryClustertruck.new(slot2)
	elseif warcry_name == "ghost" then
		slot3 = WarcryGhost

		return WarcryGhost.new(slot2)
	elseif warcry_name == "sharpshooter" then
		slot3 = WarcrySharpshooter

		return WarcrySharpshooter.new(slot2)
	end

	return 
end
Warcry.get_metatable = function (warcry_name)
	if warcry_name == "berserk" then
		return WarcryBerserk
	elseif warcry_name == "clustertruck" then
		return WarcryClustertruck
	elseif warcry_name == "ghost" then
		return WarcryGhost
	elseif warcry_name == "sharpshooter" then
		return WarcrySharpshooter
	end

	return 
end
Warcry.init = function (self)
	self._level = 1

	return 
end
Warcry.update = function (self, dt)
	local remaining = managers.warcry.remaining(slot3)
	slot5 = managers.warcry
	local duration = managers.warcry.duration(managers.warcry)
	local lerp = duration - remaining
	local lerp_duration = self._tweak_data.lerp_duration

	if lerp <= lerp_duration then
		return lerp / lerp_duration
	elseif remaining <= lerp_duration then
		return (duration - lerp) / lerp_duration
	end

	return 1
end
Warcry.get_type = function (self)
	return self._type
end
Warcry.set_level = function (self, level)
	self._level = level

	return 
end
Warcry.get_level = function (self)
	return self._level
end
Warcry.get_level_description = function (self, level)
	return 
end
Warcry.activate = function (self)
	local current_buffs = nil

	if #self._tweak_data.buffs < self._level then
		current_buffs = self._tweak_data.buffs[#self._tweak_data.buffs]
	else
		current_buffs = self._tweak_data.buffs[self._level]
	end

	slot4 = current_buffs

	for index, buff in pairs(slot3) do
		slot10 = buff

		self._acquire_buff(slot8, self)
	end

	slot4 = self

	self._acquire_team_buffs(slot3)

	self._active = true
	slot5 = 0

	managers.environment_controller.set_last_life_mod(slot3, managers.environment_controller)

	slot5 = self._tweak_data.ids_effect_name

	managers.warcry.set_warcry_post_effect(slot3, managers.warcry)

	return 
end
Warcry._buff_identifier = function (self, buff)
	slot5 = self._type
	slot7 = buff

	return "warcry_" .. tostring(slot4) .. "_buff_" .. tostring(slot6)
end
Warcry._acquire_buff = function (self, buff)
	slot6 = nil
	slot10 = buff

	managers.upgrades.aquire(slot3, managers.upgrades, buff, self._buff_identifier(slot8, self))

	return 
end
slot2 = "empty"
local ids_empty = Idstring(function (self, buff)
	slot6 = nil
	slot10 = buff

	managers.upgrades.aquire(slot3, managers.upgrades, buff, self._buff_identifier(slot8, self))

	return 
end)
Warcry.deactivate = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not self._active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	local current_buffs = nil

	if #self._tweak_data.buffs < self._level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		current_buffs = self._tweak_data.buffs[#self._tweak_data.buffs]
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		current_buffs = self._tweak_data.buffs[self._level]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-26, warpins: 2 ---
	slot4 = current_buffs

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-32, warpins: 0 ---
	for index, buff in pairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot10 = buff

		self._unacquire_buff(slot8, self)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-32, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 33-47, warpins: 1 ---
	slot4 = self

	self._unacquire_team_buffs(slot3)

	self._active = false
	slot5 = 1

	managers.environment_controller.set_last_life_mod(slot3, managers.environment_controller)

	if managers.warcry then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-53, warpins: 1 ---
		slot5 = ids_empty

		managers.warcry.set_warcry_post_effect(slot3, managers.warcry)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 54-54, warpins: 2 ---
	return 
	--- END OF BLOCK #5 ---



end
Warcry._unacquire_buff = function (self, buff)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot5 = buff
	slot9 = buff

	managers.upgrades.unaquire(slot3, managers.upgrades, self._buff_identifier(slot7, self))

	return 
	--- END OF BLOCK #0 ---



end
Warcry._get_upgrade_definition_name = function (self, upgrade_definition_name)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = upgrade_definition_name

	if tweak_data.upgrades.upgrade_has_levels(slot3, tweak_data.upgrades) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		local upgrade_level = self._level
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-21, warpins: 2 ---
		slot8 = upgrade_level

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 22-25, warpins: 0 ---
		while not tweak_data.upgrades.definitions[upgrade_definition_name .. "_" .. tostring(slot7)] do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-22, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-24, warpins: 1 ---
			upgrade_level = upgrade_level - 1
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 25-25, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 25-30, warpins: 1 ---
		slot7 = upgrade_level
		upgrade_definition_name = upgrade_definition_name .. "_" .. tostring(slot6)
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 2 ---
	return upgrade_definition_name
	--- END OF BLOCK #1 ---



end
Warcry.duration = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
Warcry.cleanup = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self

	self._unacquire_team_buffs(slot2)

	return 
	--- END OF BLOCK #0 ---



end
Warcry._acquire_team_buffs = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self.team_buffs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot3 = self.team_buffs

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-46, warpins: 0 ---
		for _, buff in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-16, warpins: 1 ---
			slot10 = buff.id

			if managers.player.has_team_category_upgrade(slot7, managers.player, buff.category) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-19, warpins: 1 ---
				if buff.use_levels then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-30, warpins: 1 ---
					slot11 = 0
					local level = managers.player.team_upgrade_value(slot7, managers.player, buff.category, buff.id)

					if 0 < level then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 31-40, warpins: 1 ---
						slot14 = level
						slot10 = buff.upgrade .. "_" .. tostring(slot13)

						self._acquire_team_buff(slot8, self)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 41-44, warpins: 1 ---
					slot9 = buff.upgrade

					self._acquire_team_buff(slot7, self)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 45-46, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 47-47, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
Warcry._acquire_team_buff = function (self, id)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = id

	self._acquire_buff(slot3, self)

	if managers.network then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		slot4 = managers.network

		if managers.network.session(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-30, warpins: 1 ---
			slot4 = managers.network
			slot10 = id

			managers.network.session(slot3).send_to_peers(slot3, managers.network.session(slot3), "sync_warcry_team_buff", id, self._buff_identifier(true, self))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end
Warcry._unacquire_team_buffs = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self.team_buffs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot3 = self.team_buffs

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-49, warpins: 0 ---
		for _, buff in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			if buff.use_levels then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-18, warpins: 1 ---
				local buff_values = tweak_data.upgrades.values.team[buff.category] and tweak_data.upgrades.values.team[buff.category][buff.id]

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 27-28, warpins: 2 ---
				if buff_values then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-32, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 33-42, warpins: 0 ---
					for level = 1, #buff_values, 1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 33-42, warpins: 2 ---
						slot18 = level
						slot14 = buff.upgrade .. "_" .. tostring(slot17)

						self._unacquire_team_buff(slot12, self)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 43-43, warpins: 1 ---
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-47, warpins: 1 ---
				slot9 = buff.upgrade

				self._unacquire_team_buff(slot7, self)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-49, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
Warcry._unacquire_team_buff = function (self, id)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = id

	self._unacquire_buff(slot3, self)

	if managers.network then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		slot4 = managers.network

		if managers.network.session(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-30, warpins: 1 ---
			slot4 = managers.network
			slot10 = id

			managers.network.session(slot3).send_to_peers(slot3, managers.network.session(slot3), "sync_warcry_team_buff", id, self._buff_identifier(false, self))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end

return 
