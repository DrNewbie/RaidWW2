WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_edfb1a5603ee1be3 = T_edfb1a5603ee1be3 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_edfb1a5603ee1be3__Menu", name_id = "bm_w_shotty", inject_menu = "WACApplyMyMenuMenu", class = T_edfb1a5603ee1be3}) 
T_f87c7afb55df1054 = T_f87c7afb55df1054 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_f87c7afb55df1054__FMenu", name_id = "Loc_f0f52cace9688ebf", inject_menu = "T_edfb1a5603ee1be3__Menu", class = T_f87c7afb55df1054}) 
function T_f87c7afb55df1054:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_1fdb721825420d0c", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_eb12bf67f0cd8170", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_b_standard"][i] = false end end end }) 
end 
T_59e2138bf5990a40 = T_59e2138bf5990a40 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_59e2138bf5990a40__FMenu", name_id = "Loc_f19b10012400135b", inject_menu = "T_edfb1a5603ee1be3__Menu", class = T_59e2138bf5990a40}) 
function T_59e2138bf5990a40:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_f7e8b95e86f4d583", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_8473f631efd6a436", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_body_standard"][i] = false end end end }) 
end 
T_04a0a284f76e1155 = T_04a0a284f76e1155 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_04a0a284f76e1155__FMenu", name_id = "Loc_816bcf90ef4d1125", inject_menu = "T_edfb1a5603ee1be3__Menu", class = T_04a0a284f76e1155}) 
function T_04a0a284f76e1155:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] or false 
	self:Toggle({ name = "T_0666015975de70eb", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] or false 
	self:Toggle({ name = "T_4b65272c48854517", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_lock"][i] = false end end end }) 
end 
T_e6a00c24ca1faa5a = T_e6a00c24ca1faa5a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_e6a00c24ca1faa5a__FMenu", name_id = "Loc_76e119a313094ce5", inject_menu = "T_edfb1a5603ee1be3__Menu", class = T_e6a00c24ca1faa5a}) 
function T_e6a00c24ca1faa5a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] or false 
	self:Toggle({ name = "T_7b8f6689d87f912c", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] or false 
	self:Toggle({ name = "T_0f80d8d4da255d6e", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_1"][i] = false end end end }) 
end 
T_5694715db8a73f45 = T_5694715db8a73f45 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_5694715db8a73f45__FMenu", name_id = "Loc_d8e182c20264fa8f", inject_menu = "T_edfb1a5603ee1be3__Menu", class = T_5694715db8a73f45}) 
function T_5694715db8a73f45:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] or false 
	self:Toggle({ name = "T_9f299fd7e1b2375a", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] or false 
	self:Toggle({ name = "T_d1d56c7126ba3f43", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_shotty_shell_2"][i] = false end end end }) 
end 
