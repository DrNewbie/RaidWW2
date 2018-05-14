AmmoPickup = AmmoPickup or class()
function AmmoPickup:init(unit)
	self._unit = unit

	return 
end
function AmmoPickup:set_multiplier(mul)
	self._ammo_mul = mul

	return 
end
function AmmoPickup:pickup()
	if self._ammo_mul then
		slot3 = managers.player
		local player_unit = managers.player.player_unit(slot2)

		if player_unit then
			slot4 = player_unit

			if alive(slot3) then
				slot4 = player_unit
				local inventory = player_unit.inventory(slot3)
				slot7 = inventory

				for id, weapon in pairs(inventory.available_selections(slot6)) do
					slot10 = weapon.unit

					if weapon.unit.base(slot9).add_ammo_ratio then
						slot10 = weapon.unit
						slot11 = self._ammo_mul

						if weapon.unit.base(slot9).add_ammo_ratio(slot9, weapon.unit.base(slot9)) then
							slot11 = id
							slot14 = weapon.unit
							slot14 = weapon.unit.base(slot13)

							managers.hud.set_ammo_amount(slot9, managers.hud, weapon.unit.base(slot13).ammo_info(slot13))
						end
					end
				end

				return true
			end
		end
	end

	return false
end

return 
