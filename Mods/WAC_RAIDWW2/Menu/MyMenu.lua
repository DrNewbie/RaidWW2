if not WACApplyMyMenu and RequiredScript == "lib/managers/menu/menucomponentmanager" then
	WACApplyMyMenu = class(BLTMenu)

	WACApplyMyMenu.ModPath = ModPath

	WACApplyMyMenu.SavePath = WACApplyMyMenu.ModPath.."Menu/___save.txt"

	function WACApplyMyMenu:reset()
		self._settings = {
			_enable = true,
			_apply = {}
		}
	end
	
	WACApplyMyMenu:reset()

	function WACApplyMyMenu:save()
		local _file = io.open(self.SavePath, "w+")
		if _file then
			_file:write(json.encode(self._settings))
			_file:close()
		end
	end
	
	function WACApplyMyMenu:Apply()
		local is_new = false
		for ii_fid, dd_fdd in pairs(WACApplyMyMenu._settings._apply) do
			for iii_fid, ddd_fdd in pairs(dd_fdd) do
				if ddd_fdd == true then
					is_new = true
					break
				end
			end
			if is_new then
				break
			end
		end
		if not is_new then
			
		else
			local _file = io.open(self.ModPath.."Menu/ApplySet.lua", "w+")
			if _file and tweak_data and tweak_data.weapon and tweak_data.weapon.factory and tweak_data.weapon.factory.parts then
				_file:write('Hooks:PostHook(WeaponFactoryTweakData, "init", "F_"..Idstring("Post.WeaponFactoryTweakData.init.WAC"):key(), function(self) \n')
				for ii_fid, dd_fdd in pairs(WACApplyMyMenu._settings._apply) do
					for iii_fid, ddd_fdd in pairs(dd_fdd) do
						if ddd_fdd == true then
							if iii_fid == 'Invisible' then
								_file:write('	self.parts["'..ii_fid..'"].unit = "units/upd_015/weapons/wpn_third_pis_shotty_pts/wpn_third_pis_shotty_shell_1" \n')
								_file:write('	self.parts["'..ii_fid..'"].third_unit = "units/upd_015/weapons/wpn_fps_pis_shotty_pts/wpn_fps_pis_shotty_shell_1" \n')
							elseif iii_fid == 'Forced' then
								for w_fid, w_fda in pairs(tweak_data.weapon.factory) do
									if type(w_fda) == "table" and w_fda.uses_parts and table.contains(w_fda.uses_parts, ii_fid) and not table.contains(w_fda.default_blueprint, ii_fid) then
										_file:write('	table.insert(self["'..w_fid..'"].default_blueprint, "'..ii_fid..'") \n')
									end
								end
							else
								local xudd = tweak_data.weapon.factory.parts[iii_fid]
								_file:write('	self.parts["'..ii_fid..'"].unit = "'..xudd.unit..'" \n')
								_file:write('	self.parts["'..ii_fid..'"].third_unit = "'..xudd.third_unit..'" \n')
							end
							break
						end
					end
				end
				_file:write('end) \n')
				_file:close()
			end
		end
	end

	function WACApplyMyMenu:load()
		local _file = io.open(self.SavePath, "r")
		if _file then
			for k, v in pairs(json.decode(_file:read("*all")) or {}) do
				if k then
					self._settings[k] = v
				end
			end
			_file:close()
			self:Apply()
		else
			self:reset()
			self:save()
		end
	end

	function WACApplyMyMenu:Close()
		self:save()
		self:Apply()
	end

	function WACApplyMyMenu:Init(root, args)
		--self:Toggle({ name = "WACApplyMyMenu_Enable_toggle", text = "WACApplyMyMenu_Enable_name_id", value = self._settings._enable, callback = function() if self._settings._enable then self._settings._enable = false else self._settings._enable = true end end })
		local uwu = {
			name = "WACApplyMyMenu_ReMenu_button",
			text = "WACApplyMyMenu_ReMenu_button_name",
			callback = function()
				local new_loc = {
					["WACApplyMyMenuName_name_id"] = "WAC",
					["WACApplyMyMenu_ReMenu_button_name"] = "uwu"
				}
				if tweak_data.weapon then
					for weapon_id, weapon_data in pairs(tweak_data.weapon) do
						if weapon_data.name_id and weapon_data.AMMO_PICKUP then
							local _fid = managers.weapon_factory:get_factory_id_by_weapon_id(weapon_id)
							if type(_fid) == "string" then
								local _fdd = tweak_data.weapon.factory[_fid]
								if type(_fdd) == "table" then
									local _udd = _fdd.uses_parts
									if type(_udd) == "table" then
										local _file = io.open(self.ModPath..'Menu/Weapons/___'..weapon_id..'__.lua', "w+")
										if _file then
											local _w_class = "T_"..Idstring('WACApplyMyMenuW__'..weapon_id):key()
											_file:write('WACApplyMyMenu = WACApplyMyMenu or nil \n')
											_file:write('if not WACApplyMyMenu then return end \n')
											_file:write(_w_class..' = '.._w_class..' or class(BLTMenu) \n')
											_file:write('RaidMenuHelper:CreateMenu({name = "'.._w_class..'__Menu", name_id = "'..weapon_data.name_id..'", inject_menu = "WACApplyMyMenuMenu", class = '.._w_class..'}) \n')
											local _udd_apply = {}
											local _udd_uapply = {}
											for _, _u_fid in pairs(_udd) do
												local _a_obj = tweak_data.weapon.factory.parts[_u_fid].a_obj
												_udd_apply[_a_obj] = _udd_apply[_a_obj] or {'Invisible', 'Forced'}
												table.insert(_udd_apply[_a_obj], _u_fid)
												_udd_uapply[_u_fid] = _a_obj
											end
											for _, _u_fid in pairs(_udd) do
												local _new_loc_add = "Loc_"..Idstring('WACApplyMyMenuFN__'.._u_fid):key()
												local _f_class = "T_"..Idstring('WACApplyMyMenuF__'.._u_fid):key()
												_file:write(_f_class..' = '.._f_class..' or class(BLTMenu) \n')
												_file:write('RaidMenuHelper:CreateMenu({name = "'.._f_class..'__FMenu", name_id = "'.._new_loc_add..'", inject_menu = "'.._w_class..'__Menu", class = '.._f_class..'}) \n')
												_file:write('function '.._f_class..':Init() \n')
												_file:write('	WACApplyMyMenu = WACApplyMyMenu or {} \n')
												_file:write('	WACApplyMyMenu._settings = WACApplyMyMenu._settings or {} \n')
												_file:write('	WACApplyMyMenu._settings._apply = WACApplyMyMenu._settings._apply or {} \n')
												for _, _xu_fid in pairs(_udd_apply[_udd_uapply[_u_fid]]) do
													if _xu_fid ~= _u_fid then
														local _new_loc_xadd = "Loc_"..Idstring('WACApplyMyMenuFN__'.._xu_fid):key()
														self._settings._apply[_u_fid] = self._settings._apply[_u_fid] or {}
														self._settings._apply[_u_fid][_xu_fid] = self._settings._apply[_u_fid][_xu_fid] or false
														_r_name = "T_"..Idstring('WACApplyMyMenuApply__'.._u_fid..'-->'.._xu_fid):key()
														_file:write('	WACApplyMyMenu._settings._apply["'.._u_fid..'"] = WACApplyMyMenu._settings._apply["'.._u_fid..'"] or {} \n')
														_file:write('	WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] = WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] or false \n')
														_file:write('	self:Toggle({ name = "'.._r_name..'", text = "'.._new_loc_xadd..'", value = WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] and true or false, callback = function() if WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] then WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] = false else WACApplyMyMenu._settings._apply["'.._u_fid..'"]["'.._xu_fid..'"] = true end for i, d in pairs(WACApplyMyMenu._settings._apply["'.._u_fid..'"]) do if i ~= "'.._xu_fid..'" then WACApplyMyMenu._settings._apply["'.._u_fid..'"][i] = false end end end }) \n')
													end
												end
												_file:write('end \n')
												new_loc[_new_loc_add] = _u_fid
											end
											_file:close()
										end
									end
								end
							end
						end
					end
					local _loc_file = io.open(self.ModPath..'Loc/EN.json', "w+")
					if _loc_file then
						new_loc["Loc_"..Idstring('WACApplyMyMenuFN__Invisible'):key()] = 'Invisible'
						new_loc["Loc_"..Idstring('WACApplyMyMenuFN__Forced'):key()] = 'Forced'
						_loc_file:write(json.encode(new_loc))
						_loc_file:close()
					end
				end
			end
		}
		self:MenuButton(uwu)
	end

	Hooks:Add("MenuComponentManagerInitialize", "WACApplyMyMenu.MenuComponentManagerInitialize", function(self)
		RaidMenuHelper:CreateMenu({
			name = "WACApplyMyMenuMenu",
			name_id = "WACApplyMyMenuName_name_id",
			inject_menu = "blt_options",
			class = WACApplyMyMenu,
		})
		local _files = file.GetFiles(WACApplyMyMenu.ModPath..'Menu/Weapons/') or {}
		for _i, _p in pairs(_files) do
			dofile(WACApplyMyMenu.ModPath..'Menu/Weapons/'.._p)
		end
	end)
	
	WACApplyMyMenu:load()
end