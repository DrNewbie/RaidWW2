-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
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
slot3 = "CoreLocalizationManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not LocalizationManager then
	slot2 = CoreLocalizationManager.LocalizationManager
	slot0 = class(slot1)
end

LocalizationManager = slot0
LocalizationManager.TYPEWRITER_UTF_PREFIX = 55000
function LocalizationManager:init()
	slot3 = self

	LocalizationManager.super.init(slot2)

	slot3 = self

	self._setup_macros(slot2)

	slot4 = 95

	Application.set_default_letter(slot2, Application)

	return 
end
function LocalizationManager:_convert_typewriter_font(char)
	slot4 = char
	local c = utf8.to_upper(slot3)
	slot6 = c
	local retVal = LocalizationManager.TYPEWRITER_UTF_PREFIX + string.byte(slot5)

	return retVal
end
function LocalizationManager:_setup_macros()
	local btn_a = utf8.char(slot2)
	local btn_b = utf8.char(57344)
	local btn_x = utf8.char(57345)
	local btn_y = utf8.char(57346)
	local btn_back = utf8.char(57347)
	local btn_start = utf8.char(57348)
	local stick_l = utf8.char(57349)
	local stick_r = utf8.char(57350)
	local btn_top_l = utf8.char(57351)
	local btn_top_r = utf8.char(57352)
	local btn_bottom_l = utf8.char(57353)
	local btn_bottom_r = utf8.char(57354)
	local btn_stick_l = utf8.char(57355)
	local btn_stick_r = utf8.char(57356)
	local btn_dpad_d = utf8.char(57357)
	local btn_dpad_r = utf8.char(57358)
	local btn_dpad_u = utf8.char(57359)
	local btn_dpad_l = utf8.char(57360)
	local btn_inv_new = utf8.char(57361)
	local btn_ghost = utf8.char(57362)
	local btn_skull = utf8.char(57363)
	local btn_padlock = utf8.char(57364)
	local btn_stat_boost = utf8.char(57365)
	slot26 = 57367
	local btn_team_boost = utf8.char(57366)
	local btn_accept = btn_a
	local btn_cancel = btn_b
	local btn_attack = btn_a
	local btn_block = btn_b
	local btn_interact = btn_top_r
	local btn_primary = btn_bottom_r
	local btn_use_item = btn_top_l
	local btn_secondary = btn_top_l
	local btn_reload = btn_x
	local btn_jump = btn_a
	local swap_accept = false
	slot39 = "PS3"

	if SystemInfo.platform(slot37) == Idstring(SystemInfo) then
		slot38 = PS3

		if PS3.pad_cross_circle_inverted(slot37) then
			swap_accept = true
		end
	end

	if swap_accept then
		local btn_tmp = btn_a
		btn_a = btn_b
		btn_b = btn_tmp
		btn_accept = btn_a
		btn_cancel = btn_b
	end

	slot39 = "WIN32"

	if SystemInfo.platform(slot37) == Idstring(SystemInfo) then
		btn_stick_r = stick_r
		btn_stick_l = stick_l
	end

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_BACK")

	slot40 = btn_start

	self.set_default_macro(slot37, self, "BTN_START")

	slot40 = btn_a

	self.set_default_macro(slot37, self, "BTN_A")

	slot40 = btn_b

	self.set_default_macro(slot37, self, "BTN_B")

	slot40 = btn_x

	self.set_default_macro(slot37, self, "BTN_X")

	slot40 = btn_y

	self.set_default_macro(slot37, self, "BTN_Y")

	slot40 = btn_top_l

	self.set_default_macro(slot37, self, "BTN_TOP_L")

	slot40 = btn_top_r

	self.set_default_macro(slot37, self, "BTN_TOP_R")

	slot40 = btn_bottom_l

	self.set_default_macro(slot37, self, "BTN_BOTTOM_L")

	slot40 = btn_bottom_r

	self.set_default_macro(slot37, self, "BTN_BOTTOM_R")

	slot40 = btn_stick_l

	self.set_default_macro(slot37, self, "BTN_STICK_L")

	slot40 = btn_stick_r

	self.set_default_macro(slot37, self, "BTN_STICK_R")

	slot40 = stick_l

	self.set_default_macro(slot37, self, "STICK_L")

	slot40 = stick_r

	self.set_default_macro(slot37, self, "STICK_R")

	slot40 = btn_interact

	self.set_default_macro(slot37, self, "BTN_INTERACT")

	slot40 = btn_use_item

	self.set_default_macro(slot37, self, "BTN_USE_ITEM")

	slot40 = btn_primary

	self.set_default_macro(slot37, self, "BTN_PRIMARY")

	slot40 = btn_secondary

	self.set_default_macro(slot37, self, "BTN_SECONDARY")

	slot40 = btn_reload

	self.set_default_macro(slot37, self, "BTN_RELOAD")

	slot40 = btn_jump

	self.set_default_macro(slot37, self, "BTN_JUMP")

	slot40 = btn_x

	self.set_default_macro(slot37, self, "BTN_SKILLSET")

	slot40 = btn_b

	self.set_default_macro(slot37, self, "BTN_CROUCH")

	slot40 = btn_accept

	self.set_default_macro(slot37, self, "BTN_ACCEPT")

	slot40 = btn_cancel

	self.set_default_macro(slot37, self, "BTN_CANCEL")

	slot40 = btn_attack

	self.set_default_macro(slot37, self, "BTN_ATTACK")

	slot40 = btn_block

	self.set_default_macro(slot37, self, "BTN_BLOCK")

	slot40 = btn_a

	self.set_default_macro(slot37, self, "CONTINUE")

	slot40 = btn_dpad_d

	self.set_default_macro(slot37, self, "BTN_GADGET")

	slot40 = btn_dpad_d

	self.set_default_macro(slot37, self, "BTN_BIPOD")

	slot40 = btn_dpad_r

	self.set_default_macro(slot37, self, "BTN_DPAD_RIGHT")

	slot40 = btn_inv_new

	self.set_default_macro(slot37, self, "BTN_INV_NEW")

	slot40 = btn_ghost

	self.set_default_macro(slot37, self, "BTN_GHOST")

	slot40 = btn_skull

	self.set_default_macro(slot37, self, "BTN_SKULL")

	slot40 = btn_padlock

	self.set_default_macro(slot37, self, "BTN_PADLOCK")

	slot40 = btn_top_l

	self.set_default_macro(slot37, self, "BTN_SEAT")

	slot40 = btn_stat_boost

	self.set_default_macro(slot37, self, "BTN_STAT_BOOST")

	slot40 = btn_team_boost

	self.set_default_macro(slot37, self, "BTN_TEAM_BOOST")

	slot40 = btn_y

	self.set_default_macro(slot37, self, "BTN_SWITCH_WEAPON")

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_STATS_VIEW")

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_RESET_SKILLS")

	slot40 = btn_start

	self.set_default_macro(slot37, self, "BTN_RESET_ALL_SKILLS")

	return 
end
slot3 = "PS3"
local is_PS3 = SystemInfo.platform(function (self)
	local btn_a = utf8.char(slot2)
	local btn_b = utf8.char(57344)
	local btn_x = utf8.char(57345)
	local btn_y = utf8.char(57346)
	local btn_back = utf8.char(57347)
	local btn_start = utf8.char(57348)
	local stick_l = utf8.char(57349)
	local stick_r = utf8.char(57350)
	local btn_top_l = utf8.char(57351)
	local btn_top_r = utf8.char(57352)
	local btn_bottom_l = utf8.char(57353)
	local btn_bottom_r = utf8.char(57354)
	local btn_stick_l = utf8.char(57355)
	local btn_stick_r = utf8.char(57356)
	local btn_dpad_d = utf8.char(57357)
	local btn_dpad_r = utf8.char(57358)
	local btn_dpad_u = utf8.char(57359)
	local btn_dpad_l = utf8.char(57360)
	local btn_inv_new = utf8.char(57361)
	local btn_ghost = utf8.char(57362)
	local btn_skull = utf8.char(57363)
	local btn_padlock = utf8.char(57364)
	local btn_stat_boost = utf8.char(57365)
	slot26 = 57367
	local btn_team_boost = utf8.char(57366)
	local btn_accept = btn_a
	local btn_cancel = btn_b
	local btn_attack = btn_a
	local btn_block = btn_b
	local btn_interact = btn_top_r
	local btn_primary = btn_bottom_r
	local btn_use_item = btn_top_l
	local btn_secondary = btn_top_l
	local btn_reload = btn_x
	local btn_jump = btn_a
	local swap_accept = false
	slot39 = "PS3"

	if SystemInfo.platform(slot37) == Idstring(SystemInfo) then
		slot38 = PS3

		if PS3.pad_cross_circle_inverted(slot37) then
			swap_accept = true
		end
	end

	if swap_accept then
		local btn_tmp = btn_a
		btn_a = btn_b
		btn_b = btn_tmp
		btn_accept = btn_a
		btn_cancel = btn_b
	end

	slot39 = "WIN32"

	if SystemInfo.platform(slot37) == Idstring(SystemInfo) then
		btn_stick_r = stick_r
		btn_stick_l = stick_l
	end

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_BACK")

	slot40 = btn_start

	self.set_default_macro(slot37, self, "BTN_START")

	slot40 = btn_a

	self.set_default_macro(slot37, self, "BTN_A")

	slot40 = btn_b

	self.set_default_macro(slot37, self, "BTN_B")

	slot40 = btn_x

	self.set_default_macro(slot37, self, "BTN_X")

	slot40 = btn_y

	self.set_default_macro(slot37, self, "BTN_Y")

	slot40 = btn_top_l

	self.set_default_macro(slot37, self, "BTN_TOP_L")

	slot40 = btn_top_r

	self.set_default_macro(slot37, self, "BTN_TOP_R")

	slot40 = btn_bottom_l

	self.set_default_macro(slot37, self, "BTN_BOTTOM_L")

	slot40 = btn_bottom_r

	self.set_default_macro(slot37, self, "BTN_BOTTOM_R")

	slot40 = btn_stick_l

	self.set_default_macro(slot37, self, "BTN_STICK_L")

	slot40 = btn_stick_r

	self.set_default_macro(slot37, self, "BTN_STICK_R")

	slot40 = stick_l

	self.set_default_macro(slot37, self, "STICK_L")

	slot40 = stick_r

	self.set_default_macro(slot37, self, "STICK_R")

	slot40 = btn_interact

	self.set_default_macro(slot37, self, "BTN_INTERACT")

	slot40 = btn_use_item

	self.set_default_macro(slot37, self, "BTN_USE_ITEM")

	slot40 = btn_primary

	self.set_default_macro(slot37, self, "BTN_PRIMARY")

	slot40 = btn_secondary

	self.set_default_macro(slot37, self, "BTN_SECONDARY")

	slot40 = btn_reload

	self.set_default_macro(slot37, self, "BTN_RELOAD")

	slot40 = btn_jump

	self.set_default_macro(slot37, self, "BTN_JUMP")

	slot40 = btn_x

	self.set_default_macro(slot37, self, "BTN_SKILLSET")

	slot40 = btn_b

	self.set_default_macro(slot37, self, "BTN_CROUCH")

	slot40 = btn_accept

	self.set_default_macro(slot37, self, "BTN_ACCEPT")

	slot40 = btn_cancel

	self.set_default_macro(slot37, self, "BTN_CANCEL")

	slot40 = btn_attack

	self.set_default_macro(slot37, self, "BTN_ATTACK")

	slot40 = btn_block

	self.set_default_macro(slot37, self, "BTN_BLOCK")

	slot40 = btn_a

	self.set_default_macro(slot37, self, "CONTINUE")

	slot40 = btn_dpad_d

	self.set_default_macro(slot37, self, "BTN_GADGET")

	slot40 = btn_dpad_d

	self.set_default_macro(slot37, self, "BTN_BIPOD")

	slot40 = btn_dpad_r

	self.set_default_macro(slot37, self, "BTN_DPAD_RIGHT")

	slot40 = btn_inv_new

	self.set_default_macro(slot37, self, "BTN_INV_NEW")

	slot40 = btn_ghost

	self.set_default_macro(slot37, self, "BTN_GHOST")

	slot40 = btn_skull

	self.set_default_macro(slot37, self, "BTN_SKULL")

	slot40 = btn_padlock

	self.set_default_macro(slot37, self, "BTN_PADLOCK")

	slot40 = btn_top_l

	self.set_default_macro(slot37, self, "BTN_SEAT")

	slot40 = btn_stat_boost

	self.set_default_macro(slot37, self, "BTN_STAT_BOOST")

	slot40 = btn_team_boost

	self.set_default_macro(slot37, self, "BTN_TEAM_BOOST")

	slot40 = btn_y

	self.set_default_macro(slot37, self, "BTN_SWITCH_WEAPON")

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_STATS_VIEW")

	slot40 = btn_back

	self.set_default_macro(slot37, self, "BTN_RESET_SKILLS")

	slot40 = btn_start

	self.set_default_macro(slot37, self, "BTN_RESET_ALL_SKILLS")

	return 
end) == Idstring(SystemInfo)
function LocalizationManager:btn_macro(button, to_upper)

	-- Decompilation error in this vicinity:
	slot5 = managers.menu

	if not managers.menu.is_pc_controller(slot4) then
		return 
	end

	local type = managers.controller.get_default_wrapper_type(slot4)
	slot9 = type
	slot9 = button
	slot8 = managers.controller.get_settings(slot7, managers.controller).get_connection(slot7, managers.controller.get_settings(slot7, managers.controller))
	slot6 = managers.controller.get_settings(slot7, managers.controller).get_connection(slot7, managers.controller.get_settings(slot7, managers.controller)).get_input_name_list(slot7)[1]
	local key = tostring(managers.controller)
	local text = "[" .. key .. "]"
end
function LocalizationManager:ids(file)
	slot4 = Localizer
	slot7 = file

	return Localizer.ids(slot3, Idstring(slot6))
end
function LocalizationManager:to_upper_text(string_id, macros)
	slot9 = macros

	return utf8.to_upper(self.text(slot6, self, string_id))
end
function LocalizationManager:steam_btn(button)
	return button
end
function LocalizationManager:debug_file(file)
	local t = {}
	slot6 = file
	local ids_in_file = self.ids(slot4, self)
	slot6 = ids_in_file

	for i, ids in ipairs(self) do
		local s = ids.s(slot10)
		slot14 = {
			BTN_INTERACT = self.btn_macro(slot16, self)
		}
		slot18 = "interact"
		local text = self.text(ids, self, s)
		t[s] = text
	end

	return t
end
function LocalizationManager:check_translation()
	local path = "g:/projects/payday2/trunk/assets/strings"
	slot5 = path
	local files = SystemFS.list(slot3, SystemFS)
	local p_files = {}
	local l_files = {}
	slot7 = files

	for i, file in ipairs(slot6) do
		slot15 = true
		local s_index = string.find(slot11, file, ".", 1)
		slot16 = true
		local e_index = string.find(file, file, ".", s_index + 1)
		slot16 = s_index - 1
		local prename = string.sub(file, file, 1)
		p_files[prename] = p_files[prename] or {}
		slot16 = file

		table.insert(slot14, p_files[prename])

		if not e_index then
			slot13 = "english"
		else
			slot17 = e_index - 1
			local language = string.sub(slot14, file, s_index + 1)
		end

		l_files[language] = l_files[language] or {}
		slot17 = file

		table.insert(slot15, l_files[language])

		if e_index then
		end
	end

	local parsed = {}
	slot8 = l_files

	for language, files in pairs(slot7) do
		parsed[language] = parsed[language] or {}
		slot13 = files

		for _, file in ipairs(slot12) do
			slot19 = path .. "/" .. file
			slot18 = SystemFS.parse_xml(slot17, SystemFS)

			for child in SystemFS.parse_xml(slot17, SystemFS).children(slot17) do
				slot24 = "id"
				slot25 = "value"
				parsed[language][child.parameter(slot22, child)] = child.parameter(child, child)
			end
		end
	end

	slot8 = parsed

	for language, ids in pairs(slot7) do
		if language ~= "english" then
			slot13 = ids

			for id, value in pairs(slot12) do
				if value == parsed.english[id] then
					slot21 = value

					print(slot17, "same as english", language, id)
				end
			end
		end
	end

	return 
end
slot4 = LocalizationManager

CoreClass.override_class(function (self)
	local path = "g:/projects/payday2/trunk/assets/strings"
	slot5 = path
	local files = SystemFS.list(slot3, SystemFS)
	local p_files = 
	local l_files = 
	slot7 = files

	for i, file in ipairs(slot6) do
		slot15 = true
		local s_index = string.find(slot11, file, ".", 1)
		slot16 = true
		local e_index = string.find(file, file, ".", s_index + 1)
		slot16 = s_index - 1
		local prename = string.sub(file, file, 1)
		p_files[prename] = p_files[prename] or 
		slot16 = file

		table.insert(slot14, p_files[prename])

		if not e_index then
			slot13 = "english"
		else
			slot17 = e_index - 1
			local language = string.sub(slot14, file, s_index + 1)
		end

		l_files[language] = l_files[language] or 
		slot17 = file

		table.insert(slot15, l_files[language])

		if e_index then
		end
	end

	local parsed = 
	slot8 = l_files

	for language, files in pairs(slot7) do
		parsed[language] = parsed[language] or 
		slot13 = files

		for _, file in ipairs(slot12) do
			slot19 = path .. "/" .. file
			slot18 = SystemFS.parse_xml(slot17, SystemFS)

			for child in SystemFS.parse_xml(slot17, SystemFS).children(slot17) do
				slot24 = "id"
				slot25 = "value"
				parsed[language][child.parameter(slot22, child)] = child.parameter(child, child)
			end
		end
	end

	slot8 = parsed

	for language, ids in pairs(slot7) do
		if language ~= "english" then
			slot13 = ids

			for id, value in pairs(slot12) do
				if value == parsed.english[id] then
					slot21 = value

					print(slot17, "same as english", language, id)
				end
			end
		end
	end

	return 
end, CoreLocalizationManager.LocalizationManager)

function LocalizationManager:check_translation()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	local path = "d:/raid_ww2_trunk/assets/strings"
	slot5 = path
	local files = SystemFS.list(slot3, SystemFS)
	local p_files = {}
	local l_files = {}
	slot7 = files

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-64, warpins: 0 ---
	for i, file in ipairs(slot6) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-35, warpins: 1 ---
		slot15 = true
		local s_index = string.find(slot11, file, ".", 1)
		slot16 = true
		local e_index = string.find(file, file, ".", s_index + 1)
		slot16 = s_index - 1
		local prename = string.sub(file, file, 1)
		p_files[prename] = p_files[prename] or {}
		slot16 = file

		table.insert(slot14, p_files[prename])

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-44, warpins: 2 ---
		if not e_index then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-46, warpins: 1 ---
			slot13 = "english"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-52, warpins: 1 ---
			slot17 = e_index - 1
			local language = string.sub(slot14, file, s_index + 1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 53-55, warpins: 2 ---
		l_files[language] = l_files[language] or {}
		slot17 = file

		table.insert(slot15, l_files[language])
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 57-62, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 63-64, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 65-69, warpins: 1 ---
	local parsed = {}
	slot8 = l_files

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 70-106, warpins: 0 ---
	for language, files in pairs(slot7) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-72, warpins: 1 ---
		parsed[language] = parsed[language] or {}
		slot13 = files

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 74-78, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 79-104, warpins: 0 ---
		for _, file in ipairs(slot12) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-90, warpins: 1 ---
			slot19 = path .. "/" .. file
			slot18 = SystemFS.parse_xml(slot17, SystemFS)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 91-102, warpins: 0 ---
			for child in SystemFS.parse_xml(slot17, SystemFS).children(slot17) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 91-100, warpins: 1 ---
				slot24 = "id"
				slot25 = "value"
				parsed[language][child.parameter(slot22, child)] = child.parameter(child, child)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 101-102, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 103-104, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 105-106, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 107-123, warpins: 1 ---
	slot9 = "w+"
	local out_file = io.open(slot7, "d:/missing_strings.txt")
	slot9 = out_file

	io.output("d:/missing_strings.txt")

	slot9 = "Missing Localised Strings:\n"

	io.write("d:/missing_strings.txt")

	slot9 = parsed

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 124-151, warpins: 0 ---
	for language, ids in pairs("d:/missing_strings.txt") do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-125, warpins: 1 ---
		if language ~= "english" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 126-136, warpins: 1 ---
			slot14 = "\tLanguage: " .. language .. "\n"

			io.write(slot13)

			slot14 = parsed.english

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 137-149, warpins: 0 ---
			for id, value in pairs(slot13) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 137-140, warpins: 1 ---
				if parsed[language][id] == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 141-147, warpins: 1 ---
					slot19 = "\t\tID: " .. id .. "\n"

					io.write(slot18)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 148-149, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 150-151, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 152-159, warpins: 1 ---
	slot9 = "Non-Localised String:\n"

	io.write(slot8)

	slot9 = parsed

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 160-187, warpins: 0 ---
	for language, ids in pairs(slot8) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 160-161, warpins: 1 ---
		if language ~= "english" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 162-172, warpins: 1 ---
			slot14 = "\tLanguage: " .. language .. "\n"

			io.write(slot13)

			slot14 = ids

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 173-185, warpins: 0 ---
			for id, value in pairs(slot13) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 173-176, warpins: 1 ---
				if value == parsed.english[id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 177-183, warpins: 1 ---
					slot19 = "\t\tID: " .. id .. "\n"

					io.write(slot18)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 184-185, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 186-187, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 188-192, warpins: 1 ---
	slot9 = out_file

	io.close(slot8)

	return 
	--- END OF BLOCK #8 ---



end
function LocalizationManager:check_keybind_translation(binding)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	self._keybind_translations = {
		"left ctrl",
		"right ctrl",
		"confirm",
		"enter",
		"esc",
		"left",
		"right",
		"up",
		"down",
		"space",
		"delete",
		"left shift",
		"right shift",
		"left alt",
		"right alt",
		"num",
		"mouse",
		"caps lock",
		"backspace",
		"insert",
		"home",
		"end",
		"page up",
		"page down",
		"scroll lock",
		"pause"
	}
	local translation = binding
	slot5 = self._keybind_translations

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-87, warpins: 0 ---
	for _, binding_record in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		if binding_record == "num" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-17, warpins: 1 ---
			slot12 = 3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-40, warpins: 2 ---
			if binding_record == "mouse" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-48, warpins: 1 ---
				slot12 = 5
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 70-71, warpins: 2 ---
				if binding_record == binding then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 72-85, warpins: 1 ---
					slot16 = "_"
					slot11 = "menu_keybind_" .. string.gsub(slot13, binding, " ")
					translation = managers.localization.text(slot9, managers.localization)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 86-87, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 88-88, warpins: 1 ---
	return translation
	--- END OF BLOCK #2 ---



end

return 
