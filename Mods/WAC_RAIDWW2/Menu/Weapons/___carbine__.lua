WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_bfc55f589d4dbd28 = T_bfc55f589d4dbd28 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_bfc55f589d4dbd28__Menu", name_id = "bm_w_carbine", inject_menu = "WACApplyMyMenuMenu", class = T_bfc55f589d4dbd28}) 
T_c7994cf4b9a32c3a = T_c7994cf4b9a32c3a or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_c7994cf4b9a32c3a__FMenu", name_id = "Loc_99726fb493fd8631", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_c7994cf4b9a32c3a}) 
function T_c7994cf4b9a32c3a:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_4c0a5d7261ffa8c8", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] or false 
	self:Toggle({ name = "T_c942104086a84bd4", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_b_standard"][i] = false end end end }) 
end 
T_6fa2cfd7db8462ca = T_6fa2cfd7db8462ca or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_6fa2cfd7db8462ca__FMenu", name_id = "Loc_4b33f55ac3dfc20e", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_6fa2cfd7db8462ca}) 
function T_6fa2cfd7db8462ca:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_2151f83a70a63380", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_8c001aa252a802d4", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] or false 
	self:Toggle({ name = "T_25929034a7a6ae79", text = "Loc_a3f0121d68b6cb62", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]["wpn_fps_ass_carbine_body_wooden"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"]) do if i ~= "wpn_fps_ass_carbine_body_wooden" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_standard"][i] = false end end end }) 
end 
T_ca33bb9520dbfd9d = T_ca33bb9520dbfd9d or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ca33bb9520dbfd9d__FMenu", name_id = "Loc_e23ef2752774d360", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_ca33bb9520dbfd9d}) 
function T_ca33bb9520dbfd9d:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_c61293b9b9f4df36", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] or false 
	self:Toggle({ name = "T_cdea374ef8fe3fbc", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_dh_standard"][i] = false end end end }) 
end 
T_4fec18ee964a5054 = T_4fec18ee964a5054 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_4fec18ee964a5054__FMenu", name_id = "Loc_15e9d72e9187c701", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_4fec18ee964a5054}) 
function T_4fec18ee964a5054:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_55a7a091dc67ab62", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] or false 
	self:Toggle({ name = "T_e8f4e8aefa455368", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_bolt_standard"][i] = false end end end }) 
end 
T_39ce883df7d30cea = T_39ce883df7d30cea or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_39ce883df7d30cea__FMenu", name_id = "Loc_e0e7f30395013e7a", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_39ce883df7d30cea}) 
function T_39ce883df7d30cea:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_c70613b0ac9fa162", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_76c655a0a4a1a47a", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] or false 
	self:Toggle({ name = "T_e3dde2fb060a2734", text = "Loc_16c5d1284f952d29", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]["wpn_fps_ass_carbine_m_extended"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"]) do if i ~= "wpn_fps_ass_carbine_m_extended" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_standard"][i] = false end end end }) 
end 
T_00b226fa85f09fe3 = T_00b226fa85f09fe3 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_00b226fa85f09fe3__FMenu", name_id = "Loc_c3682cb07aae0c51", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_00b226fa85f09fe3}) 
function T_00b226fa85f09fe3:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_f800dd6ac8006efa", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] or false 
	self:Toggle({ name = "T_90d86db1780546fe", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_g_standard"][i] = false end end end }) 
end 
T_162f5373878f36dc = T_162f5373878f36dc or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_162f5373878f36dc__FMenu", name_id = "Loc_47d9f03927b1c3c4", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_162f5373878f36dc}) 
function T_162f5373878f36dc:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_05e401c050bda6ef", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] or false 
	self:Toggle({ name = "T_fa782ce8b8e318be", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_s_standard"][i] = false end end end }) 
end 
T_437fe23cd28be19f = T_437fe23cd28be19f or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_437fe23cd28be19f__FMenu", name_id = "Loc_a3f0121d68b6cb62", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_437fe23cd28be19f}) 
function T_437fe23cd28be19f:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] or false 
	self:Toggle({ name = "T_c5367802afa01590", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] or false 
	self:Toggle({ name = "T_9683c928680de81f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] or false 
	self:Toggle({ name = "T_419751e649b18e30", text = "Loc_4b33f55ac3dfc20e", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]["wpn_fps_ass_carbine_body_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"]) do if i ~= "wpn_fps_ass_carbine_body_standard" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_body_wooden"][i] = false end end end }) 
end 
T_b82426ded95a02b1 = T_b82426ded95a02b1 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b82426ded95a02b1__FMenu", name_id = "Loc_16c5d1284f952d29", inject_menu = "T_bfc55f589d4dbd28__Menu", class = T_b82426ded95a02b1}) 
function T_b82426ded95a02b1:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] or false 
	self:Toggle({ name = "T_62d0c3c11bd90861", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] or false 
	self:Toggle({ name = "T_4552022b825e2c0d", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] or false 
	self:Toggle({ name = "T_ea21a78249443731", text = "Loc_e0e7f30395013e7a", value = WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] = false else WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]["wpn_fps_ass_carbine_m_standard"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"]) do if i ~= "wpn_fps_ass_carbine_m_standard" then WACApplyMyMenu._settings._apply["wpn_fps_ass_carbine_m_extended"][i] = false end end end }) 
end 
