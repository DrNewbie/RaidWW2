local Ply_init_SwitchFakeWeaponGadget = false

Hooks:PostHook(PlayerStandard, "init", "SwitchFakeWeaponGadget", function(self)
	if Input and Input:keyboard() and not Ply_init_SwitchFakeWeaponGadget then
		Ply_init_SwitchFakeWeaponGadget = true
		self._weapon_gadget_last = false
		self._weapon_gadget_record = {}
		Input:keyboard():add_trigger(Idstring("f9"), callback(self, self, "change_SwitchFakeWeaponGadget"))
	end
end)

function PlayerStandard:change_SwitchFakeWeaponGadget()
	if self._weapon_gadget_last then
		self._weapon_gadget_last = false
	else
		self._weapon_gadget_last = true
	end
	local weapon_unit = self._ext_inventory and self._ext_inventory:equipped_unit()
	if weapon_unit and alive(weapon_unit) then
		self._weapon_gadget_record[weapon_unit:key()] = self._weapon_gadget_last
	end
end

Hooks:PostHook(PlayerStandard, "update", "FakeWeaponGadget_Ply_update", function(self, t, dt)
	if self._weapon_gadget_last then
		local weapon_unit = self._ext_inventory and self._ext_inventory:equipped_unit()				
		if weapon_unit and alive(weapon_unit) then
			local weapon_base = weapon_unit:base()
			if weapon_base and weapon_base._unit then
				if not weapon_base._laser and WeaponLaserRaid then
					self._ext_inventory:equipped_unit():base()._laser = WeaponLaserRaid:new(weapon_unit)
					self._ext_inventory:equipped_unit():base()._laser:steup(weapon_unit)
				end
				local _laser = weapon_base._laser
				if _laser and _laser._laser_brush then
					local mvec_to = Vector3()
					local from_pos = weapon_base._custom_position or weapon_base._unit:position()
					local from_rot = weapon_base._custom_rotation or weapon_base._unit:rotation()
					if from_pos and from_rot then
						local forward = from_rot:y()
						mvector3.set(mvec_to, forward)
						mvector3.multiply(mvec_to, 20000)
						mvector3.add(mvec_to, from_pos)
						mvector3.set(_laser._ray_from_pos, mvec_to)
						mvector3.set(_laser._ray_to_pos, from_pos)
						if _laser._use_laser ~= self._weapon_gadget_record[weapon_unit:key()] then
							_laser._use_laser = self._weapon_gadget_record[weapon_unit:key()]
						end
						if _laser._use_laser then
							_laser._laser_brush:cylinder(_laser._ray_from_pos, _laser._ray_to_pos, _laser._laser_size)
						end
					end
				end
			end
		end
	end
end)