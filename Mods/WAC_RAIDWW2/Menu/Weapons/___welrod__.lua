WACApplyMyMenu = WACApplyMyMenu or nil 
if not WACApplyMyMenu then return end 
T_ad3770832349c778 = T_ad3770832349c778 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_ad3770832349c778__Menu", name_id = "bm_w_welrod", inject_menu = "WACApplyMyMenuMenu", class = T_ad3770832349c778}) 
T_675e3b63f5a3d9b1 = T_675e3b63f5a3d9b1 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_675e3b63f5a3d9b1__FMenu", name_id = "Loc_e66b0dc2d1e25e9d", inject_menu = "T_ad3770832349c778__Menu", class = T_675e3b63f5a3d9b1}) 
function T_675e3b63f5a3d9b1:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_a22af0497195e1ed", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] or false 
	self:Toggle({ name = "T_1528b2d7882b526b", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_body_standard"][i] = false end end end }) 
end 
T_9b408dfe2018c943 = T_9b408dfe2018c943 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_9b408dfe2018c943__FMenu", name_id = "Loc_071c6aa0c2275bb4", inject_menu = "T_ad3770832349c778__Menu", class = T_9b408dfe2018c943}) 
function T_9b408dfe2018c943:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_890828b5f40806fe", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] or false 
	self:Toggle({ name = "T_b0e57fb14df1149a", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_bolt_standard"][i] = false end end end }) 
end 
T_d15ff362f5d2ac78 = T_d15ff362f5d2ac78 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_d15ff362f5d2ac78__FMenu", name_id = "Loc_c678c5657285302d", inject_menu = "T_ad3770832349c778__Menu", class = T_d15ff362f5d2ac78}) 
function T_d15ff362f5d2ac78:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] or false 
	self:Toggle({ name = "T_1e7587bf52bdf4fb", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] or false 
	self:Toggle({ name = "T_4245d9a56ed8ffec", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_m_standard"][i] = false end end end }) 
end 
T_21a1398525971937 = T_21a1398525971937 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_21a1398525971937__FMenu", name_id = "Loc_e273e73bd7ac0d8a", inject_menu = "T_ad3770832349c778__Menu", class = T_21a1398525971937}) 
function T_21a1398525971937:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] or false 
	self:Toggle({ name = "T_0d0f0bb067f3abf9", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] or false 
	self:Toggle({ name = "T_f174d5ec9df41fc3", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_catch"][i] = false end end end }) 
end 
T_732abc09ab9faaa1 = T_732abc09ab9faaa1 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_732abc09ab9faaa1__FMenu", name_id = "Loc_39b053c2a5df5c27", inject_menu = "T_ad3770832349c778__Menu", class = T_732abc09ab9faaa1}) 
function T_732abc09ab9faaa1:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] or false 
	self:Toggle({ name = "T_1925ab430d5702d0", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] or false 
	self:Toggle({ name = "T_3cee107556b8b82f", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_trigger"][i] = false end end end }) 
end 
T_b4f9be35598264b0 = T_b4f9be35598264b0 or class(BLTMenu) 
RaidMenuHelper:CreateMenu({name = "T_b4f9be35598264b0__FMenu", name_id = "Loc_4edc634a935149d1", inject_menu = "T_ad3770832349c778__Menu", class = T_b4f9be35598264b0}) 
function T_b4f9be35598264b0:Init() 
	WACApplyMyMenu = WACApplyMyMenu or {} 
	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} 
	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] or false 
	self:Toggle({ name = "T_e84052ce37d0ea4f", text = "Loc_297030c20c18f83a", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Invisible"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]) do if i ~= "Invisible" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"][i] = false end end end }) 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"] or {} 
	WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] or false 
	self:Toggle({ name = "T_e94fdb73d31ef5ce", text = "Loc_a833f0b610957269", value = WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] = false else WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]["Forced"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"]) do if i ~= "Forced" then WACApplyMyMenu._settings._apply["wpn_fps_pis_welrod_safety"][i] = false end end end }) 
end 
