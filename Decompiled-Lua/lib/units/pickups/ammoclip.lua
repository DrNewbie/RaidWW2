-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not AmmoClip then
	slot2 = Pickup
	slot0 = class(slot1)
end

AmmoClip = slot0
AmmoClip.EVENT_IDS = {
	bonnie_share_ammo = 1,
	register_grenade = 16
}
function AmmoClip:init(unit)
	slot5 = unit

	AmmoClip.super.init(slot3, self)

	self._ammo_type = ""
	slot4 = self

	self._randomize_glow_effect(slot3)

	return 
end
function AmmoClip:_pickup(unit)
	if self._picked_up then
		return 
	end

	local inventory = unit.inventory(slot3)
	slot5 = unit
	slot5 = unit.character_damage(unit)

	if not unit.character_damage(unit).dead(unit) and inventory then
		local picked_up = false

		if self._projectile_id then
			slot6 = managers.blackmarket

			if managers.blackmarket.equipped_projectile(slot5) == self._projectile_id then
				slot6 = managers.player

				if not managers.player.got_max_grenades(slot5) then
					slot7 = self._ammo_count or 1

					managers.player.add_grenade_amount(slot5, managers.player)

					picked_up = true
				end
			end
		else
			local available_selections = {}
			slot9 = inventory

			for i, weapon in pairs(inventory.available_selections(slot8)) do
				slot13 = i

				if inventory.is_equipped(slot11, inventory) then
					slot14 = weapon

					table.insert(slot11, available_selections, 1)
				else
					slot13 = weapon

					table.insert(slot11, available_selections)
				end
			end

			slot8 = BuffEffectManager.EFFECT_AMMO_PICKUPS_REFIL_GRENADES

			if managers.buff_effect.is_effect_active(slot6, managers.buff_effect) then
				slot8 = BuffEffectManager.EFFECT_AMMO_PICKUPS_REFIL_GRENADES
				local grenades_refill_amount = managers.buff_effect.get_effect_value(slot6, managers.buff_effect)
				slot9 = grenades_refill_amount or 1

				managers.player.add_grenade_amount(slot7, managers.player)
			end

			local success, add_amount = nil
			slot9 = available_selections

			for _, weapon in ipairs(slot8) do
			end
		end

		if picked_up then

			-- Decompilation error in this vicinity:
			self._picked_up = true

			if not self._projectile_id and not self._weapon_category then
				local restored_health = nil
				slot7 = unit
				slot7 = unit.character_damage(slot6)

				if not unit.character_damage(slot6).is_downed(slot6) then
					slot9 = "loose_ammo_restore_health"

					if managers.player.has_category_upgrade(slot6, managers.player, "temporary") then
						slot9 = "loose_ammo_restore_health"

						if not managers.player.has_activate_temporary_upgrade(slot6, managers.player, "temporary") then
							slot9 = "loose_ammo_restore_health"

							managers.player.activate_temporary_upgrade(slot6, managers.player, "temporary")

							slot10 = 0
							local values = managers.player.temporary_upgrade_value(slot6, managers.player, "temporary", "loose_ammo_restore_health")

							if values ~= 0 then
								slot9 = values[2]
								local restore_value = math.random(slot7, values[1])
								local base = tweak_data.upgrades.loose_ammo_restore_health_values.base
								slot14 = 13
								local sync_value = math.round(math.clamp(slot11, restore_value - base, 0))
								restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
								local damage_ext = unit.character_damage(slot10)
								slot12 = damage_ext

								if not damage_ext.need_revive(unit) then
									slot12 = damage_ext

									if not damage_ext.dead(slot11) then
										slot12 = damage_ext

										if not damage_ext.is_berserker(slot11) then
											slot14 = true

											damage_ext.restore_health(slot11, damage_ext, restore_value)

											slot12 = unit
											slot15 = false

											unit.sound(slot11).play(slot11, unit.sound(slot11), "pickup_ammo_health_boost", nil)
										end
									end
								end

								slot14 = "loose_ammo_restore_health_give_team"

								if managers.player.has_category_upgrade(slot11, managers.player, "player") then
									slot12 = managers.network
									slot16 = 2 + sync_value

									managers.network.session(slot11).send_to_peers_synched(slot11, managers.network.session(slot11), "sync_unit_event_id_16", self._unit, "pickup")
								end
							end
						end
					end
				end

				slot9 = "loose_ammo_give_team"

				if managers.player.has_category_upgrade(slot6, managers.player, "temporary") then
					slot9 = "loose_ammo_give_team"

					if not managers.player.has_activate_temporary_upgrade(slot6, managers.player, "temporary") then
						slot9 = "loose_ammo_give_team"

						managers.player.activate_temporary_upgrade(slot6, managers.player, "temporary")

						slot7 = managers.network
						slot11 = AmmoClip.EVENT_IDS.bonnie_share_ammo

						managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_unit_event_id_16", self._unit, "pickup")
					end
				end
			elseif self._projectile_id then
				slot6 = managers.player
				slot9 = managers.network
				slot9 = managers.network.session(slot8)
				slot9 = managers.network.session(slot8).local_peer(slot8)

				managers.player.register_grenade(slot5, managers.network.session(slot8).local_peer(slot8).id(slot8))

				slot6 = managers.network
				slot10 = AmmoClip.EVENT_IDS.register_grenade

				managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_unit_event_id_16", self._unit, "pickup")
			end

			slot6 = Network

			if Network.is_client(slot5) then
				slot6 = managers.network
				slot8 = self._unit

				managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "sync_pickup")
			end

			if inventory and picked_up then
				slot8 = inventory

				for id, wpn in pairs(inventory.available_selections(slot7)) do
					slot12 = id
					slot15 = wpn.unit
					slot15 = wpn.unit.base(slot14)

					managers.hud.set_ammo_amount(slot10, managers.hud, wpn.unit.base(slot14).ammo_info(slot14))
				end
			end

			slot6 = unit
			slot9 = false

			unit.sound(slot5).play(slot5, unit.sound(slot5), self._pickup_event or "pickup_ammo", nil)

			slot6 = self

			self.consume(slot5)

			return true
		end
	end

	return false
end
function AmmoClip:sync_net_event(event, peer)

	-- Decompilation error in this vicinity:
	local player = managers.player.local_player(slot4)
	slot6 = player

	if event == AmmoClip.EVENT_IDS.bonnie_share_ammo then
		slot6 = player
		local inventory = player.inventory(slot5)

		if inventory then
			local picked_up = false
			slot10 = inventory

			for id, weapon in pairs(inventory.available_selections(slot9)) do
				slot13 = weapon.unit
				slot13 = weapon.unit.base(slot12)
				slot11 = weapon.unit.base(slot12).add_ammo
				slot14 = tweak_data.drop_loot[self.tweak_data].ammo_multiplier or 1
				slot15 = tweak_data.upgrades.loose_ammo_give_team_ratio or 0.25
				slot15 = nil

				if not slot11(slot12, slot13, slot14 * slot15) then
				end
			end

			if picked_up then
				slot10 = inventory

				for id, weapon in pairs(inventory.available_selections(slot9)) do
					slot14 = id
					slot17 = weapon.unit
					slot17 = weapon.unit.base(slot16)

					managers.hud.set_ammo_amount(slot12, managers.hud, weapon.unit.base(slot16).ammo_info(slot16))
				end
			end
		end
	elseif event == AmmoClip.EVENT_IDS.register_grenade then
		if peer and not self._grenade_registered then
			slot6 = managers.player
			slot9 = peer

			managers.player.register_grenade(slot5, peer.id(slot8))

			self._grenade_registered = true
		end
	elseif AmmoClip.EVENT_IDS.bonnie_share_ammo < event then
		local damage_ext = player.character_damage(slot5)
		slot7 = damage_ext

		if not damage_ext.need_revive(player) then
			slot7 = damage_ext

			if not damage_ext.dead(slot6) then
				slot7 = damage_ext

				if not damage_ext.is_berserker(slot6) then
					local restore_value = event - 2 + (tweak_data.upgrades.loose_ammo_restore_health_values.base or 3)
					restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
					restore_value = restore_value * (tweak_data.upgrades.loose_ammo_give_team_health_ratio or 0.35)
				end
			end
		end
	end

	return 
end
function AmmoClip:get_pickup_type()
	return "ammo"
end

return 
