WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_ae28dbafae99bd34 = T_ae28dbafae99bd34 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ae28dbafae99bd34__Menu", name_id = "bm_w_lee_enfield", inject_menu = "WACApplyMyMenuMenu", class = T_ae28dbafae99bd34}) 
T_f7a8745db5ffd37f = T_f7a8745db5ffd37f or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_f7a8745db5ffd37f__FMenu", name_id = "Loc_d1da8051aabc1414", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_f7a8745db5ffd37f}) 
function T_f7a8745db5ffd37f:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_9a665ad25ee4287e", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] or false 
	self:Toggle({ name = "T_fc5ac21a7382151a", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_dh_standard"][i] = false end end end }) 
end 
T_f885343e21e51d08 = T_f885343e21e51d08 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_f885343e21e51d08__FMenu", name_id = "Loc_c2305f51dafb3b72", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_f885343e21e51d08}) 
function T_f885343e21e51d08:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_b05c0af69dff2af5", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_85eb7e495607671b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] or false 
	self:Toggle({ name = "T_5dd3d8da60130f3b", text = "Loc_e8ef718737944b5a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]["wpn_fps_snp_lee_enfield_b_long"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"]) do if i ~= "wpn_fps_snp_lee_enfield_b_long" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_standard"][i] = false end end end }) 
end 
T_3c300800a3e62488 = T_3c300800a3e62488 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_3c300800a3e62488__FMenu", name_id = "Loc_68ec6c5af1808c88", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_3c300800a3e62488}) 
function T_3c300800a3e62488:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_e7d85c20fd0d54c1", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_a8d4d7bab2257fc6", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_body_standard"][i] = false end end end }) 
end 
T_a7417a8bf93829a5 = T_a7417a8bf93829a5 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_a7417a8bf93829a5__FMenu", name_id = "Loc_b74d3116a07d8eea", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_a7417a8bf93829a5}) 
function T_a7417a8bf93829a5:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] or false 
	self:Toggle({ name = "T_8b45f1674a7315b6", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] or false 
	self:Toggle({ name = "T_8de353c7e7de494e", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_firepin"][i] = false end end end }) 
end 
T_b612f0486d28124e = T_b612f0486d28124e or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b612f0486d28124e__FMenu", name_id = "Loc_6637b3b0d2f0045b", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_b612f0486d28124e}) 
function T_b612f0486d28124e:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_9db0b229ed7f3931", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] or false 
	self:Toggle({ name = "T_a7fb93ee9ce93b32", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_s_standard"][i] = false end end end }) 
end 
T_88a53920f3bf651e = T_88a53920f3bf651e or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_88a53920f3bf651e__FMenu", name_id = "Loc_623e949191b10235", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_88a53920f3bf651e}) 
function T_88a53920f3bf651e:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_da72db25f0baaaa9", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_d05c1ba48ccc2964", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] or false 
	self:Toggle({ name = "T_ea835938d82fac95", text = "Loc_ad2710d6885d3a42", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]["wpn_fps_snp_lee_enfield_m_extended"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"]) do if i ~= "wpn_fps_snp_lee_enfield_m_extended" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_standard"][i] = false end end end }) 
end 
T_4a5d6dc55f619900 = T_4a5d6dc55f619900 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_4a5d6dc55f619900__FMenu", name_id = "Loc_e6dd2b7e25d0a1c2", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_4a5d6dc55f619900}) 
function T_4a5d6dc55f619900:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] or false 
	self:Toggle({ name = "T_ce7f1d4da8fba466", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] or false 
	self:Toggle({ name = "T_05658dc3d6872f43", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_bullet"][i] = false end end end }) 
end 
T_4025c5b8c51ab27c = T_4025c5b8c51ab27c or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_4025c5b8c51ab27c__FMenu", name_id = "Loc_e8ef718737944b5a", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_4025c5b8c51ab27c}) 
function T_4025c5b8c51ab27c:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] or false 
	self:Toggle({ name = "T_855f9fe6c5230264", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] or false 
	self:Toggle({ name = "T_118a57909ddf9654", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] or false 
	self:Toggle({ name = "T_6b3c9290a034a55f", text = "Loc_c2305f51dafb3b72", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]["wpn_fps_snp_lee_enfield_b_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"]) do if i ~= "wpn_fps_snp_lee_enfield_b_standard" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_b_long"][i] = false end end end }) 
end 
T_93099e0acff3a318 = T_93099e0acff3a318 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_93099e0acff3a318__FMenu", name_id = "Loc_9a8e8f4e64c29946", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_93099e0acff3a318}) 
function T_93099e0acff3a318:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] or false 
	self:Toggle({ name = "T_ea3b6e1ca7418503", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] or false 
	self:Toggle({ name = "T_6d0ac99f924059ca", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_ns_coned"][i] = false end end end }) 
end 
T_30e378dc03f04a06 = T_30e378dc03f04a06 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_30e378dc03f04a06__FMenu", name_id = "Loc_5e8a63d196b9b3d5", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_30e378dc03f04a06}) 
function T_30e378dc03f04a06:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] or false 
	self:Toggle({ name = "T_3661799266bf6152", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] or false 
	self:Toggle({ name = "T_0132cd17fa3b37bb", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_pad_buffered"][i] = false end end end }) 
end 
T_b3cb85e51bb795eb = T_b3cb85e51bb795eb or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b3cb85e51bb795eb__FMenu", name_id = "Loc_10e7467a54f8a4ab", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_b3cb85e51bb795eb}) 
function T_b3cb85e51bb795eb:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] or false 
	self:Toggle({ name = "T_e744f3fc355d0b63", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] or false 
	self:Toggle({ name = "T_1666db1dcd8b5c59", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_cheek_rest"][i] = false end end end }) 
end 
T_b8c54b90f2def2a8 = T_b8c54b90f2def2a8 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b8c54b90f2def2a8__FMenu", name_id = "Loc_ad2710d6885d3a42", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_b8c54b90f2def2a8}) 
function T_b8c54b90f2def2a8:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] or false 
	self:Toggle({ name = "T_472519e55bdc37ff", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] or false 
	self:Toggle({ name = "T_c90c8deb01f60f72", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] or false 
	self:Toggle({ name = "T_86ce58ee976bfab5", text = "Loc_623e949191b10235", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]["wpn_fps_snp_lee_enfield_m_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"]) do if i ~= "wpn_fps_snp_lee_enfield_m_standard" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_m_extended"][i] = false end end end }) 
end 
T_63dec78f7758b27d = T_63dec78f7758b27d or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_63dec78f7758b27d__FMenu", name_id = "Loc_15e181718d15bf3d", inject_menu = "T_ae28dbafae99bd34__Menu", class = T_63dec78f7758b27d}) 
function T_63dec78f7758b27d:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] or false 
	self:Toggle({ name = "T_2b190be2800a91d8", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] or false 
	self:Toggle({ name = "T_e10619c0b4b5a3a4", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_snp_lee_enfield_o_scope"][i] = false end end end }) 
end 
