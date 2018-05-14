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
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementFilter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementFilter = slot0
function ElementFilter:init(...)
	slot3 = self

	ElementFilter.super.init(slot2, ...)

	return 
end
function ElementFilter:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementFilter:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	if not self._check_platform(slot3) then
		return 
	end

	slot4 = self

	if not self._check_difficulty(slot3) then
		return 
	end

	slot4 = self

	if not self._check_players(slot3) then
		return 
	end

	slot4 = self

	if not self._check_mode(slot3) then
		return 
	end

	slot4 = self

	if not self._check_alarm(slot3) then
		return 
	end

	slot5 = instigator

	ElementFilter.super.on_executed(slot3, self)

	return 
end
local win32 = Idstring(function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	if not self._check_platform(slot3) then
		return 
	end

	slot4 = self

	if not self._check_difficulty(slot3) then
		return 
	end

	slot4 = self

	if not self._check_players(slot3) then
		return 
	end

	slot4 = self

	if not self._check_mode(slot3) then
		return 
	end

	slot4 = self

	if not self._check_alarm(slot3) then
		return 
	end

	slot5 = instigator

	ElementFilter.super.on_executed(slot3, self)

	return 
end)
local ps3 = Idstring("WIN32")
local x360 = Idstring("PS3")
local ps4 = Idstring("X360")
slot6 = "XB1"
local xb1 = Idstring("PS4")
function ElementFilter:_check_platform()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if Global.running_simulation then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		slot5 = managers.editor
		local platform = Idstring(managers.editor.mission_platform(slot4))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-13, warpins: 2 ---
	if not platform then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot4 = SystemInfo
		platform = SystemInfo.platform(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-22, warpins: 2 ---
	if self._values.platform_win32 and (platform == win32 or platform == ps4 or platform == xb1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-33, warpins: 3 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-37, warpins: 3 ---
	if self._values.platform_ps3 and (platform == ps3 or platform == x360) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 2 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 46-47, warpins: 3 ---
	return false
	--- END OF BLOCK #4 ---



end
function ElementFilter:_check_difficulty()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local diff = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-15, warpins: 2 ---
	if self._values.difficulty_normal and diff == "difficulty_1" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-23, warpins: 3 ---
	if self._values.difficulty_hard and diff == "difficulty_2" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-27, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-31, warpins: 3 ---
	if self._values.difficulty_overkill and diff == "difficulty_3" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-35, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 36-39, warpins: 3 ---
	if self._values.difficulty_overkill_145 and diff == "difficulty_4" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-43, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 44-45, warpins: 3 ---
	return false
	--- END OF BLOCK #5 ---



end
function ElementFilter:_check_players()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if Global.running_simulation then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		slot3 = managers.editor
		local players = managers.editor.mission_player(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	if not players then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		slot4 = managers.network

		if managers.network.session(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-27, warpins: 1 ---
			slot4 = managers.network
			slot4 = managers.network.session(slot3)
			players = managers.network.session(slot3).amount_of_players(slot3)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-29, warpins: 3 ---
	if not players then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-31, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-35, warpins: 2 ---
	if self._values.player_1 and players == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-39, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 40-43, warpins: 3 ---
	if self._values.player_2 and players == 2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-47, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 48-51, warpins: 3 ---
	if self._values.player_3 and players == 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-55, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 56-59, warpins: 3 ---
	if self._values.player_4 and players == 4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-63, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 64-65, warpins: 3 ---
	return false
	--- END OF BLOCK #7 ---



end
function ElementFilter:_check_mode()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if self._values.mode_control == nil or self._values.mode_assault == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 2 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-20, warpins: 2 ---
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if managers.groupai.state(slot2).get_assault_mode(slot2) and self._values.mode_assault then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-26, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-36, warpins: 3 ---
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if not managers.groupai.state(slot2).get_assault_mode(slot2) and self._values.mode_control then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-42, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 43-44, warpins: 3 ---
	return false
	--- END OF BLOCK #3 ---



end
function ElementFilter:_check_alarm()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot4 = self._sync_id
	local alarm = managers.worldcollection.get_alarm_for_world(slot2, managers.worldcollection)

	if self._values.alarm_on == nil or self._values.alarm_off == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 2 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-18, warpins: 2 ---
	if alarm and self._values.alarm_on then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-24, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-26, warpins: 3 ---
	if not alarm and self._values.alarm_off then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-32, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 33-33, warpins: 3 ---
	return 
	--- END OF BLOCK #3 ---



end

return 
