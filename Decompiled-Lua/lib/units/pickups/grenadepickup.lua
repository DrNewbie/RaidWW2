-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not GrenadePickup then
	slot2 = Pickup
	slot0 = class(slot1)
end

GrenadePickup = slot0
function GrenadePickup:init(unit)
	slot5 = unit

	GrenadePickup.super.init(slot3, self)

	slot4 = self

	self._randomize_glow_effect(slot3)

	return 
end
function GrenadePickup:_pickup(unit)
	if self._picked_up then
		return 
	end

	local inventory = unit.inventory(slot3)
	slot5 = unit
	slot5 = unit.character_damage(unit)

	if not unit.character_damage(unit).dead(unit) and inventory then
		local picked_up = false
		local gained_grenades = 0
		local effect_ammo_pickup_multiplier = 1
		local grenades_to_add = 0
		slot9 = managers.player

		if not managers.player.got_max_grenades(slot8) then
			slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_AMMO_EFFECT_INCREASE

			if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
				slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_AMMO_EFFECT_INCREASE
				effect_ammo_pickup_multiplier = effect_ammo_pickup_multiplier + (managers.buff_effect.get_effect_value(slot8, managers.buff_effect) or 1) - 1
			end

			slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_REWARD_INCREASE

			if managers.buff_effect.is_effect_active(slot8, managers.buff_effect) then
				slot10 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_REWARD_INCREASE
				effect_ammo_pickup_multiplier = effect_ammo_pickup_multiplier + (managers.buff_effect.get_effect_value(slot8, managers.buff_effect) or 1) - 1
			end

			grenades_to_add = (tweak_data.drop_loot[self.tweak_data].grenades_amount or 1) * effect_ammo_pickup_multiplier
			slot9 = managers.player
			slot12 = grenades_to_add
			gained_grenades = managers.player.add_grenade_amount(slot8, math.floor(slot11))
			picked_up = true
		end

		if picked_up then
			self._picked_up = true

			for i_grenade = 1, gained_grenades, 1 do
				slot13 = managers.player
				slot16 = managers.network
				slot16 = managers.network.session(slot15)
				slot16 = managers.network.session(slot15).local_peer(slot15)

				managers.player.register_grenade(slot12, managers.network.session(slot15).local_peer(slot15).id(slot15))
			end

			slot9 = managers.network
			slot12 = gained_grenades

			managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "register_grenades_pickup", self._unit)

			slot9 = Network

			if Network.is_client(slot8) then
				slot9 = managers.network
				slot11 = self._unit

				managers.network.session(slot8).send_to_host(slot8, managers.network.session(slot8), "sync_pickup")
			end

			slot9 = self

			self.consume(slot8)

			return true
		end
	end

	return false
end
function GrenadePickup:register_grenades(gained_grenades, peer)

	-- Decompilation error in this vicinity:
	local player = managers.player.local_player(slot4)
	slot6 = player

	if peer and not self._grenade_registered then
		for i_grenade = 1, gained_grenades, 1 do
			slot10 = managers.player
			slot13 = peer

			managers.player.register_grenade(slot9, peer.id(slot12))
		end

		self._grenade_registered = true
	end

	return 
end
function GrenadePickup:get_pickup_type()
	return "grenade"
end

return 
