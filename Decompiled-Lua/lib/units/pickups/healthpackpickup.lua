if not HealthPackPickup then
	slot2 = Pickup
	slot0 = class(slot1)
end

HealthPackPickup = slot0
function HealthPackPickup:init(unit)
	slot5 = unit

	HealthPackPickup.super.init(slot3, self)

	slot4 = self

	self._randomize_glow_effect(slot3)

	return 
end
function HealthPackPickup:_pickup(unit)
	if self._picked_up then
		return 
	end

	slot4 = unit
	slot4 = unit.character_damage(slot3)

	if not unit.character_damage(slot3).dead(slot3) then
		local picked_up = false
		slot5 = unit
		slot5 = unit.character_damage(slot4)

		if not unit.character_damage(slot4).full_health(slot4) then
			slot5 = unit
			slot5 = unit.character_damage(slot4)
			local current_health = unit.character_damage(slot4).get_real_health(slot4)
			local effect_health_pickup_multiplier = 1
			slot8 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_REWARD_INCREASE

			if managers.buff_effect.is_effect_active(slot6, managers.buff_effect) then
				slot8 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_REWARD_INCREASE
				effect_health_pickup_multiplier = effect_health_pickup_multiplier + (managers.buff_effect.get_effect_value(slot6, managers.buff_effect) or 1) - 1
			end

			slot8 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_HEALTH_EFFECT_INCREASE

			if managers.buff_effect.is_effect_active(slot6, managers.buff_effect) then
				slot8 = BuffEffectManager.EFFECT_ENEMY_LOOT_DROP_HEALTH_EFFECT_INCREASE
				effect_health_pickup_multiplier = effect_health_pickup_multiplier + (managers.buff_effect.get_effect_value(slot6, managers.buff_effect) or 1) - 1
			end

			local base_health_recovery = tweak_data.drop_loot[self.tweak_data].health_restored
			slot11 = 1
			local upgrade_health_pickup_multiplier = managers.player.upgrade_value(slot7, managers.player, "player", "pick_up_health_multiplier")
			local recovery_percentage = (base_health_recovery * (upgrade_health_pickup_multiplier + effect_health_pickup_multiplier - 1)) / 100
			slot10 = unit
			local max_health = unit.character_damage("player").get_max_health("player")
			slot11 = unit
			slot12 = current_health + recovery_percentage * max_health

			unit.character_damage(unit.character_damage("player")).set_health(unit.character_damage("player"), unit.character_damage(unit.character_damage("player")))

			picked_up = true

			if current_health < 30 then
				slot11 = unit
				slot12 = tweak_data.drop_loot[self.tweak_data].player_voice_over

				unit.sound_source(slot10).post_event(slot10, unit.sound_source(slot10))
			end
		end

		if picked_up then
			self._picked_up = true
			slot5 = Network

			if Network.is_client(slot4) then
				slot5 = managers.network
				slot7 = self._unit

				managers.network.session(slot4).send_to_host(slot4, managers.network.session(slot4), "sync_pickup")
			end

			slot5 = self

			self.consume(slot4)

			return true
		end
	end

	return false
end
function HealthPackPickup:sync_net_event(event, peer)
	return 
end
function HealthPackPickup:get_pickup_type()
	return "health"
end

return 
