WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_d44868267b277caa = T_d44868267b277caa or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_d44868267b277caa__Menu", name_id = "bm_w_bren", inject_menu = "WACApplyMyMenuMenu", class = T_d44868267b277caa}) 
T_d9ae156ae04f64d9 = T_d9ae156ae04f64d9 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_d9ae156ae04f64d9__FMenu", name_id = "Loc_8412302269deb0d1", inject_menu = "T_d44868267b277caa__Menu", class = T_d9ae156ae04f64d9}) 
function T_d9ae156ae04f64d9:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_d9776f2beeb4249d", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_e295c97527d13ea4", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] or false 
	self:Toggle({ name = "T_d4acb2ec2fa2a029", text = "Loc_c4644d6a3a125596", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]["wpn_fps_lmg_bren_b_long"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"]) do if i ~= "wpn_fps_lmg_bren_b_long" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_standard"][i] = false end end end }) 
end 
T_139f2a9a05148989 = T_139f2a9a05148989 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_139f2a9a05148989__FMenu", name_id = "Loc_9e8f3b68d2a512e5", inject_menu = "T_d44868267b277caa__Menu", class = T_139f2a9a05148989}) 
function T_139f2a9a05148989:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_fe2b3aa1efe249ca", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_84af4c37771707a6", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_body_standard"][i] = false end end end }) 
end 
T_7de6f8203f2a1286 = T_7de6f8203f2a1286 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_7de6f8203f2a1286__FMenu", name_id = "Loc_b3aab54eb1dbef0d", inject_menu = "T_d44868267b277caa__Menu", class = T_7de6f8203f2a1286}) 
function T_7de6f8203f2a1286:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_586f356d8e0c350d", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] or false 
	self:Toggle({ name = "T_6399bdd3a1e1dbb5", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_dh_standard"][i] = false end end end }) 
end 
T_b0c4a47fce55b88a = T_b0c4a47fce55b88a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b0c4a47fce55b88a__FMenu", name_id = "Loc_4624e52bc13cde29", inject_menu = "T_d44868267b277caa__Menu", class = T_b0c4a47fce55b88a}) 
function T_b0c4a47fce55b88a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_ae229f21b9160adf", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_f6de41b84b42b8f0", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] or false 
	self:Toggle({ name = "T_c810ca6133413b0d", text = "Loc_1e8fa8cc047d2877", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]["wpn_fps_lmg_bren_m_extended"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"]) do if i ~= "wpn_fps_lmg_bren_m_extended" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_standard"][i] = false end end end }) 
end 
T_7b4842e2c74e198d = T_7b4842e2c74e198d or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_7b4842e2c74e198d__FMenu", name_id = "Loc_60baba3467cfa755", inject_menu = "T_d44868267b277caa__Menu", class = T_7b4842e2c74e198d}) 
function T_7b4842e2c74e198d:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_740a99d7f7e05c8a", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] or false 
	self:Toggle({ name = "T_f272ad6221897842", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_s_standard"][i] = false end end end }) 
end 
T_19746d1208bea19b = T_19746d1208bea19b or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_19746d1208bea19b__FMenu", name_id = "Loc_18ec6f0828558e5b", inject_menu = "T_d44868267b277caa__Menu", class = T_19746d1208bea19b}) 
function T_19746d1208bea19b:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_0c81cff9fad0d009", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] or false 
	self:Toggle({ name = "T_97c261d60ef96def", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] or false 
	self:Toggle({ name = "T_33a0ff6caca166dd", text = "Loc_f3f57ec164b6ff0f", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]["wpn_fps_lmg_bren_pad_buffered"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"]) do if i ~= "wpn_fps_lmg_bren_pad_buffered" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_standard"][i] = false end end end }) 
end 
T_a16aef7bc6274f9a = T_a16aef7bc6274f9a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_a16aef7bc6274f9a__FMenu", name_id = "Loc_c4644d6a3a125596", inject_menu = "T_d44868267b277caa__Menu", class = T_a16aef7bc6274f9a}) 
function T_a16aef7bc6274f9a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] or false 
	self:Toggle({ name = "T_25a8b967b61114b2", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] or false 
	self:Toggle({ name = "T_1f044ecdbf0e9da4", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] or false 
	self:Toggle({ name = "T_ae7c377078095940", text = "Loc_8412302269deb0d1", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]["wpn_fps_lmg_bren_b_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"]) do if i ~= "wpn_fps_lmg_bren_b_standard" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_b_long"][i] = false end end end }) 
end 
T_859b8ca08f1ef360 = T_859b8ca08f1ef360 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_859b8ca08f1ef360__FMenu", name_id = "Loc_11225caead311e7c", inject_menu = "T_d44868267b277caa__Menu", class = T_859b8ca08f1ef360}) 
function T_859b8ca08f1ef360:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] or false 
	self:Toggle({ name = "T_12b8f29e9404df6f", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] or false 
	self:Toggle({ name = "T_26d024cd8df4e8bd", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_ns_brake"][i] = false end end end }) 
end 
T_16706d123d808db5 = T_16706d123d808db5 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_16706d123d808db5__FMenu", name_id = "Loc_5d466270f8f417ab", inject_menu = "T_d44868267b277caa__Menu", class = T_16706d123d808db5}) 
function T_16706d123d808db5:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] or false 
	self:Toggle({ name = "T_47d7f9ddf4081bfe", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] or false 
	self:Toggle({ name = "T_62ee4a9b594b3b23", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_bipod"][i] = false end end end }) 
end 
T_531804bc2bb057ee = T_531804bc2bb057ee or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_531804bc2bb057ee__FMenu", name_id = "Loc_59a43c2ce2f36a3f", inject_menu = "T_d44868267b277caa__Menu", class = T_531804bc2bb057ee}) 
function T_531804bc2bb057ee:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] or false 
	self:Toggle({ name = "T_f79772a11178bd5d", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] or false 
	self:Toggle({ name = "T_eb7883d7d63bb9f6", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_support"][i] = false end end end }) 
end 
T_ab94213c88fc8fc2 = T_ab94213c88fc8fc2 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ab94213c88fc8fc2__FMenu", name_id = "Loc_1e8fa8cc047d2877", inject_menu = "T_d44868267b277caa__Menu", class = T_ab94213c88fc8fc2}) 
function T_ab94213c88fc8fc2:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] or false 
	self:Toggle({ name = "T_76ee4e1c16534238", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] or false 
	self:Toggle({ name = "T_6d96e4ebdcac4f62", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] or false 
	self:Toggle({ name = "T_66276aaa8851e7bd", text = "Loc_4624e52bc13cde29", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]["wpn_fps_lmg_bren_m_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"]) do if i ~= "wpn_fps_lmg_bren_m_standard" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_m_extended"][i] = false end end end }) 
end 
T_945d6130db3f1a7d = T_945d6130db3f1a7d or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_945d6130db3f1a7d__FMenu", name_id = "Loc_f3f57ec164b6ff0f", inject_menu = "T_d44868267b277caa__Menu", class = T_945d6130db3f1a7d}) 
function T_945d6130db3f1a7d:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] or false 
	self:Toggle({ name = "T_2f4e20cf8bdb3501", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] or false 
	self:Toggle({ name = "T_64884ee144620527", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] or false 
	self:Toggle({ name = "T_ff180c644eee351d", text = "Loc_18ec6f0828558e5b", value = WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]["wpn_fps_lmg_bren_pad_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"]) do if i ~= "wpn_fps_lmg_bren_pad_standard" then WACApplyMyMenu._settings._apply["wpn_fps_lmg_bren_pad_buffered"][i] = false end end end }) 
end 
