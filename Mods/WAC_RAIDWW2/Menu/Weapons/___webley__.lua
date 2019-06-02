WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_8b7f7df55dced2e7 = T_8b7f7df55dced2e7 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_8b7f7df55dced2e7__Menu", name_id = "bm_w_webley", inject_menu = "WACApplyMyMenuMenu", class = T_8b7f7df55dced2e7}) 
T_8644c3bee0d2497a = T_8644c3bee0d2497a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_8644c3bee0d2497a__FMenu", name_id = "Loc_253222c09bcf4937", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_8644c3bee0d2497a}) 
function T_8644c3bee0d2497a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_024e3d15ddcd8d97", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_ddb58a2352ed6248", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_body_standard"][i] = false end end end }) 
end 
T_9d268c91fbe811fa = T_9d268c91fbe811fa or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_9d268c91fbe811fa__FMenu", name_id = "Loc_54916f87f89e1c56", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_9d268c91fbe811fa}) 
function T_9d268c91fbe811fa:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_d3dd77403e06f696", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] or false 
	self:Toggle({ name = "T_a2611ea3a5c0a953", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_lock_standard"][i] = false end end end }) 
end 
T_e294df848bb3d54c = T_e294df848bb3d54c or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_e294df848bb3d54c__FMenu", name_id = "Loc_93b5fb1b02ff2175", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_e294df848bb3d54c}) 
function T_e294df848bb3d54c:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_c01536486d8bea3d", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] or false 
	self:Toggle({ name = "T_de8a633268c58365", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_hammer_standard"][i] = false end end end }) 
end 
T_ab94aa812ae562c7 = T_ab94aa812ae562c7 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ab94aa812ae562c7__FMenu", name_id = "Loc_d6b5c4556a321434", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_ab94aa812ae562c7}) 
function T_ab94aa812ae562c7:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_e637c055d56ff898", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] or false 
	self:Toggle({ name = "T_fa627c195a729960", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_trigger_standard"][i] = false end end end }) 
end 
T_45a4993a340d8a31 = T_45a4993a340d8a31 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_45a4993a340d8a31__FMenu", name_id = "Loc_cef636e60319d608", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_45a4993a340d8a31}) 
function T_45a4993a340d8a31:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_de63ee55c3ce7d26", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_d02f624d3e3fd28f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_b_standard"][i] = false end end end }) 
end 
T_08a84f21a5149147 = T_08a84f21a5149147 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_08a84f21a5149147__FMenu", name_id = "Loc_585fa08f78c44d1a", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_08a84f21a5149147}) 
function T_08a84f21a5149147:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_55625bee4e8bbd3a", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_0814d33f8da5213b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_m_standard"][i] = false end end end }) 
end 
T_d058f79ecf784cef = T_d058f79ecf784cef or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_d058f79ecf784cef__FMenu", name_id = "Loc_d98dce171d3f95e1", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_d058f79ecf784cef}) 
function T_d058f79ecf784cef:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_79684c5d20b81ec7", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] or false 
	self:Toggle({ name = "T_7dea743b8157a81d", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_ejector_standard"][i] = false end end end }) 
end 
T_5e6d1ae34d57b588 = T_5e6d1ae34d57b588 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_5e6d1ae34d57b588__FMenu", name_id = "Loc_b8773c078921bd9d", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_5e6d1ae34d57b588}) 
function T_5e6d1ae34d57b588:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] or false 
	self:Toggle({ name = "T_f994e2e4f99b44a6", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] or false 
	self:Toggle({ name = "T_372850a247c6046c", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_1"][i] = false end end end }) 
end 
T_13cb067a6897da37 = T_13cb067a6897da37 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_13cb067a6897da37__FMenu", name_id = "Loc_e9f39d979f054435", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_13cb067a6897da37}) 
function T_13cb067a6897da37:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] or false 
	self:Toggle({ name = "T_fd0927d078b118aa", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] or false 
	self:Toggle({ name = "T_7e10cf0c32b5ae4b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_2"][i] = false end end end }) 
end 
T_ff5f5dec1354515a = T_ff5f5dec1354515a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ff5f5dec1354515a__FMenu", name_id = "Loc_b7f115e142293dcb", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_ff5f5dec1354515a}) 
function T_ff5f5dec1354515a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] or false 
	self:Toggle({ name = "T_a55853765dc8a5ff", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] or false 
	self:Toggle({ name = "T_fc9110a9f67cdda0", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_3"][i] = false end end end }) 
end 
T_40917f837b6d6251 = T_40917f837b6d6251 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_40917f837b6d6251__FMenu", name_id = "Loc_18b8aedec8e178f0", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_40917f837b6d6251}) 
function T_40917f837b6d6251:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] or false 
	self:Toggle({ name = "T_4a1c1cc0bd02d5cd", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] or false 
	self:Toggle({ name = "T_d6a87cd0c56cfd66", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_4"][i] = false end end end }) 
end 
T_ded4420af24eafcb = T_ded4420af24eafcb or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ded4420af24eafcb__FMenu", name_id = "Loc_17aa6772d13047a1", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_ded4420af24eafcb}) 
function T_ded4420af24eafcb:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] or false 
	self:Toggle({ name = "T_086e720142ab1d36", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] or false 
	self:Toggle({ name = "T_180fa0598193e7d2", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_5"][i] = false end end end }) 
end 
T_43fe8907c1c9641f = T_43fe8907c1c9641f or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_43fe8907c1c9641f__FMenu", name_id = "Loc_21b86f1dc4b8d49d", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_43fe8907c1c9641f}) 
function T_43fe8907c1c9641f:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] or false 
	self:Toggle({ name = "T_80d3ad84a9a493e9", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] or false 
	self:Toggle({ name = "T_56b26c5b00a3ae52", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_casing_6"][i] = false end end end }) 
end 
T_b17d41e2c376be75 = T_b17d41e2c376be75 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b17d41e2c376be75__FMenu", name_id = "Loc_7d6ce1508d64ede9", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_b17d41e2c376be75}) 
function T_b17d41e2c376be75:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] or false 
	self:Toggle({ name = "T_7f2f612e804b3a3b", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] or false 
	self:Toggle({ name = "T_52449a33a0091d18", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullet_clip"][i] = false end end end }) 
end 
T_f1b9ab6b19125636 = T_f1b9ab6b19125636 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_f1b9ab6b19125636__FMenu", name_id = "Loc_d721dfd9a171b858", inject_menu = "T_8b7f7df55dced2e7__Menu", class = T_f1b9ab6b19125636}) 
function T_f1b9ab6b19125636:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] or false 
	self:Toggle({ name = "T_6355ce893b887f34", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] or false 
	self:Toggle({ name = "T_cf74f013576f984f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_webley_bullets"][i] = false end end end }) 
end 
