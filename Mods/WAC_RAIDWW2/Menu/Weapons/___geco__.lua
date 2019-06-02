WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_5cf5d032a6d11512 = T_5cf5d032a6d11512 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_5cf5d032a6d11512__Menu", name_id = "bm_w_geco", inject_menu = "WACApplyMyMenuMenu", class = T_5cf5d032a6d11512}) 
T_f6d0d4fdfd03e134 = T_f6d0d4fdfd03e134 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_f6d0d4fdfd03e134__FMenu", name_id = "Loc_efd8713ddfb53a5d", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_f6d0d4fdfd03e134}) 
function T_f6d0d4fdfd03e134:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_8657bd684d998f62", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_1bf38a1c46f10a93", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] or false 
	self:Toggle({ name = "T_003bf76f65c19c45", text = "Loc_819d5b575547a0eb", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]["wpn_fps_sho_geco_b_short"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"]) do if i ~= "wpn_fps_sho_geco_b_short" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_standard"][i] = false end end end }) 
end 
T_c1b7d75dc69c5532 = T_c1b7d75dc69c5532 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_c1b7d75dc69c5532__FMenu", name_id = "Loc_09012628fed6eaa9", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_c1b7d75dc69c5532}) 
function T_c1b7d75dc69c5532:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_de1c707f10405671", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] or false 
	self:Toggle({ name = "T_1e6df119fccff07f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] or false 
	self:Toggle({ name = "T_0b2dfb7aeeadea71", text = "Loc_15cf650e54314ada", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]["wpn_fps_sho_geco_s_cheek_rest"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"]) do if i ~= "wpn_fps_sho_geco_s_cheek_rest" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_standard"][i] = false end end end }) 
end 
T_4660ff14b5f37a2e = T_4660ff14b5f37a2e or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_4660ff14b5f37a2e__FMenu", name_id = "Loc_69a66ab119deaa5a", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_4660ff14b5f37a2e}) 
function T_4660ff14b5f37a2e:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] or false 
	self:Toggle({ name = "T_51c06d8b49ea4343", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] or false 
	self:Toggle({ name = "T_ddfeb218fface72e", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_lock"][i] = false end end end }) 
end 
T_72b6ad8490575dfa = T_72b6ad8490575dfa or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_72b6ad8490575dfa__FMenu", name_id = "Loc_a19f9b3f2df6f737", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_72b6ad8490575dfa}) 
function T_72b6ad8490575dfa:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_9cc4df1c464319c5", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_69113c567a576559", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_body_standard"][i] = false end end end }) 
end 
T_9bc7db7b14b684eb = T_9bc7db7b14b684eb or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_9bc7db7b14b684eb__FMenu", name_id = "Loc_b2ef753d472be780", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_9bc7db7b14b684eb}) 
function T_9bc7db7b14b684eb:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] or false 
	self:Toggle({ name = "T_dd93466c8799f1ab", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] or false 
	self:Toggle({ name = "T_07813a7fa50d2e8f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_1"][i] = false end end end }) 
end 
T_97f48fa64fe1f4a4 = T_97f48fa64fe1f4a4 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_97f48fa64fe1f4a4__FMenu", name_id = "Loc_52b5831b6359ad0d", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_97f48fa64fe1f4a4}) 
function T_97f48fa64fe1f4a4:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] or false 
	self:Toggle({ name = "T_e5e52b6b50620746", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] or false 
	self:Toggle({ name = "T_78a023fab4610f24", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_shell_2"][i] = false end end end }) 
end 
T_3c241774949798bf = T_3c241774949798bf or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_3c241774949798bf__FMenu", name_id = "Loc_239b87715562e697", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_3c241774949798bf}) 
function T_3c241774949798bf:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] or false 
	self:Toggle({ name = "T_556d524cf497fd75", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] or false 
	self:Toggle({ name = "T_e98fa72c3c463711", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_1"][i] = false end end end }) 
end 
T_137f169204d80cc1 = T_137f169204d80cc1 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_137f169204d80cc1__FMenu", name_id = "Loc_058229011408e508", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_137f169204d80cc1}) 
function T_137f169204d80cc1:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] or false 
	self:Toggle({ name = "T_1d910ed99aa3146f", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] or false 
	self:Toggle({ name = "T_67dc61cf21a3fde7", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_trigger_2"][i] = false end end end }) 
end 
T_9ec20e74fd0a5b1c = T_9ec20e74fd0a5b1c or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_9ec20e74fd0a5b1c__FMenu", name_id = "Loc_819d5b575547a0eb", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_9ec20e74fd0a5b1c}) 
function T_9ec20e74fd0a5b1c:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] or false 
	self:Toggle({ name = "T_bf72998ed7377f2e", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] or false 
	self:Toggle({ name = "T_2388626798d9e66c", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] or false 
	self:Toggle({ name = "T_4dd524180752810c", text = "Loc_efd8713ddfb53a5d", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]["wpn_fps_sho_geco_b_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"]) do if i ~= "wpn_fps_sho_geco_b_standard" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_b_short"][i] = false end end end }) 
end 
T_5c27adf447887353 = T_5c27adf447887353 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_5c27adf447887353__FMenu", name_id = "Loc_15cf650e54314ada", inject_menu = "T_5cf5d032a6d11512__Menu", class = T_5c27adf447887353}) 
function T_5c27adf447887353:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] or false 
	self:Toggle({ name = "T_28e682a4f64f3dab", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] or false 
	self:Toggle({ name = "T_7ec45173662aae0d", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] or false 
	self:Toggle({ name = "T_47e3780cbc68cf61", text = "Loc_09012628fed6eaa9", value = WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]["wpn_fps_sho_geco_s_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"]) do if i ~= "wpn_fps_sho_geco_s_standard" then WACApplyMyMenu._settings._apply["wpn_fps_sho_geco_s_cheek_rest"][i] = false end end end }) 
end 
