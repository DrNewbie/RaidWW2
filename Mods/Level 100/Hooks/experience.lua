local ThisSavePath = SavePath
local ThisSaveFile = ThisSavePath.."OverLevel100.json"
local ThisNewLevel = 100
local ThisModIds = ModPath and Idstring(ModPath):key() or tostring(math.random())
local Load1 = "F_"..Idstring("Load1::"..ThisModIds):key()
local Hook1 = "F_"..Idstring("Hook1::"..ThisModIds):key()


if tweak_data and tweak_data.experience_manager and not tweak_data[Load1] then
	tweak_data[Load1] = true
	local lv40 = tweak_data.experience_manager.levels[40]
	local lv40_p = Application:digest_value(lv40.points, false)
	for i = 41, ThisNewLevel do
		tweak_data.experience_manager.levels[i] = lv40
		tweak_data.experience_manager.levels[i].points = Application:digest_value(math.round(lv40_p * i / 40), true)
	end
end

if RaidExperienceManager and not RaidExperienceManager[Load1] then
	RaidExperienceManager[Load1] = true
	RaidExperienceManager.LEVEL_CAP = Application:digest_value(ThisNewLevel, true)
	local OverLevel100 = {}

	local function __SyncDataLoad()
		local __save_file = io.open(ThisSaveFile, "r")
		if not __save_file then
			return false
		end
		local fileT = __save_file:read("*all"):gsub("%[%]","{}") 
		__save_file:close()
		if fileT == "" then
			return false
		end
		OverLevel100 = json.decode(fileT)
		return
	end

	local function __SyncDataSave(__data)
		if type(__data) ~= "table" or type(__data.level) ~= "number" or type(__data.points) ~= "number" then
			__data = {level = 0, points = 0}
		end
		local __save_file = io.open(ThisSaveFile, "w+")
		if not __save_file then
			return false
		end
		__save_file:write(json.encode(__data))
		__save_file:close()
		return
	end

	function RaidExperienceManager:SyncXpData()
		if self:current_level() < 40 then
			return false
		end
		--[[
		if type(OverLevel100) == "table" and type(OverLevel100.level) == "number" then
			if OverLevel100.level ~= self:current_level() then
				self:_set_current_level(OverLevel100.level)
				if type(OverLevel100.points) == "number" then
					self:_set_next_level_data_current_points(OverLevel100.points)
				end
			end
		end
		]]
		__SyncDataSave({level = self:current_level(), points = self:next_level_data_current_points()})
	end

	Hooks:PostHook(RaidExperienceManager, "update_progress", Hook1, function(self)	
		__SyncDataLoad()
		self:SyncXpData()
	end)
end