WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_7429b6a7b4316f1c = T_7429b6a7b4316f1c or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_7429b6a7b4316f1c__Menu", name_id = "bm_w_tt33", inject_menu = "WACApplyMyMenuMenu", class = T_7429b6a7b4316f1c}) 
T_1824032153c61110 = T_1824032153c61110 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_1824032153c61110__FMenu", name_id = "Loc_8872cf740784d90d", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_1824032153c61110}) 
function T_1824032153c61110:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_bc6ae78cfe5f642a", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_07c0584af3a2010d", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_body_standard"][i] = false end end end }) 
end 
T_56d047e235ac9226 = T_56d047e235ac9226 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_56d047e235ac9226__FMenu", name_id = "Loc_5d7fa2991fcf678b", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_56d047e235ac9226}) 
function T_56d047e235ac9226:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_f43cbf3c7acda355", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_018f166fcf58868b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_b_standard"][i] = false end end end }) 
end 
T_fc3dacd87b6384ac = T_fc3dacd87b6384ac or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_fc3dacd87b6384ac__FMenu", name_id = "Loc_9e6233584215c155", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_fc3dacd87b6384ac}) 
function T_fc3dacd87b6384ac:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_25ab24f71a9eb15b", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] or false 
	self:Toggle({ name = "T_79270406bc21d6cb", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_sl_standard"][i] = false end end end }) 
end 
T_d33950ec0c2d079e = T_d33950ec0c2d079e or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_d33950ec0c2d079e__FMenu", name_id = "Loc_313aa0ced4012f7d", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_d33950ec0c2d079e}) 
function T_d33950ec0c2d079e:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_90cc41b48622a4ef", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_41dd49735e4d7e2f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] or false 
	self:Toggle({ name = "T_340f75dbfabf7127", text = "Loc_5bb9342be2230976", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_extended"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]) do if i ~= "wpn_fps_pis_tt33_m_extended" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] or false 
	self:Toggle({ name = "T_894a2734092fb956", text = "Loc_1f14bbf24615f10c", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]["wpn_fps_pis_tt33_m_long"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"]) do if i ~= "wpn_fps_pis_tt33_m_long" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_standard"][i] = false end end end }) 
end 
T_478d500253ec05ef = T_478d500253ec05ef or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_478d500253ec05ef__FMenu", name_id = "Loc_c3324e2f7cbcd087", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_478d500253ec05ef}) 
function T_478d500253ec05ef:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] or false 
	self:Toggle({ name = "T_fffea31ebe0603f7", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] or false 
	self:Toggle({ name = "T_daf7ea83e3b60fe2", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_hammer"][i] = false end end end }) 
end 
T_abbf691b6cc6605b = T_abbf691b6cc6605b or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_abbf691b6cc6605b__FMenu", name_id = "Loc_61f2481b94098c26", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_abbf691b6cc6605b}) 
function T_abbf691b6cc6605b:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] or false 
	self:Toggle({ name = "T_4a82b09341d2db97", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] or false 
	self:Toggle({ name = "T_7600a785090234dc", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_trigger"][i] = false end end end }) 
end 
T_56bb49de1748717e = T_56bb49de1748717e or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_56bb49de1748717e__FMenu", name_id = "Loc_abcf4969bd904935", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_56bb49de1748717e}) 
function T_56bb49de1748717e:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] or false 
	self:Toggle({ name = "T_056de40e29b51022", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] or false 
	self:Toggle({ name = "T_c5a5b96af252bd40", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_release"][i] = false end end end }) 
end 
T_474dce83f400923c = T_474dce83f400923c or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_474dce83f400923c__FMenu", name_id = "Loc_6a3a0f3a8561ea21", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_474dce83f400923c}) 
function T_474dce83f400923c:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_39a40f1fd1218484", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] or false 
	self:Toggle({ name = "T_38ac7d32bf1d453d", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] or false 
	self:Toggle({ name = "T_0da5505cf419834e", text = "Loc_8ccc381a1bce93d5", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]["wpn_fps_pis_tt33_g_wooden"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"]) do if i ~= "wpn_fps_pis_tt33_g_wooden" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_standard"][i] = false end end end }) 
end 
T_001d1d534d9a6e33 = T_001d1d534d9a6e33 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_001d1d534d9a6e33__FMenu", name_id = "Loc_5bb9342be2230976", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_001d1d534d9a6e33}) 
function T_001d1d534d9a6e33:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] or false 
	self:Toggle({ name = "T_d39e115c522cacda", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] or false 
	self:Toggle({ name = "T_126e1ba756ace7d6", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] or false 
	self:Toggle({ name = "T_67cfb1d032eb143a", text = "Loc_313aa0ced4012f7d", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]) do if i ~= "wpn_fps_pis_tt33_m_standard" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] or false 
	self:Toggle({ name = "T_8409d9ed3f63ba58", text = "Loc_1f14bbf24615f10c", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]["wpn_fps_pis_tt33_m_long"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"]) do if i ~= "wpn_fps_pis_tt33_m_long" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_extended"][i] = false end end end }) 
end 
T_9e637fb626d91e70 = T_9e637fb626d91e70 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_9e637fb626d91e70__FMenu", name_id = "Loc_1f14bbf24615f10c", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_9e637fb626d91e70}) 
function T_9e637fb626d91e70:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] or false 
	self:Toggle({ name = "T_f5a31a5b8cedd7e2", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] or false 
	self:Toggle({ name = "T_729ac283abea8abd", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] or false 
	self:Toggle({ name = "T_eb449b1b891a2c3b", text = "Loc_313aa0ced4012f7d", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]) do if i ~= "wpn_fps_pis_tt33_m_standard" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] or false 
	self:Toggle({ name = "T_441455b5f4fbac8a", text = "Loc_5bb9342be2230976", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]["wpn_fps_pis_tt33_m_extended"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"]) do if i ~= "wpn_fps_pis_tt33_m_extended" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_m_long"][i] = false end end end }) 
end 
T_10d90670d9147e96 = T_10d90670d9147e96 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_10d90670d9147e96__FMenu", name_id = "Loc_86928ea6945acf3a", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_10d90670d9147e96}) 
function T_10d90670d9147e96:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] or false 
	self:Toggle({ name = "T_9cc0083bcc5eb77b", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] or false 
	self:Toggle({ name = "T_f1181d0436f9894b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_ns_brake"][i] = false end end end }) 
end 
T_b8a42659cef7283a = T_b8a42659cef7283a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b8a42659cef7283a__FMenu", name_id = "Loc_8ccc381a1bce93d5", inject_menu = "T_7429b6a7b4316f1c__Menu", class = T_b8a42659cef7283a}) 
function T_b8a42659cef7283a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] or false 
	self:Toggle({ name = "T_284cb2a935c107e0", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] or false 
	self:Toggle({ name = "T_7ab4a8af6a28a8fb", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] or false 
	self:Toggle({ name = "T_aa8919fd69b16c3b", text = "Loc_6a3a0f3a8561ea21", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]["wpn_fps_pis_tt33_g_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"]) do if i ~= "wpn_fps_pis_tt33_g_standard" then WACApplyMyMenu._settings._apply["wpn_fps_pis_tt33_g_wooden"][i] = false end end end }) 
end 
