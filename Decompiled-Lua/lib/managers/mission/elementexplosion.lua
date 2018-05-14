slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementExplosion then
	slot2 = ElementFeedback
	slot0 = class(slot1)
end

ElementExplosion = slot0
function ElementExplosion:init(...)
	slot3 = self

	ElementExplosion.super.init(slot2, ...)

	slot3 = Application

	if Application.editor(slot2) and self._values.explosion_effect ~= "none" then
		slot3 = self.IDS_EFFECT
		slot6 = self._values.explosion_effect

		CoreEngineAccess._editor_load(slot2, self._values.explosion_effect.id(slot5))
	end

	return 
end
function ElementExplosion:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementExplosion:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = "ElementExplosion:on_executed( instigator )"

	print(slot3)

	slot4 = self
	local pos, rot = self.get_orientation(slot3)
	slot6 = managers.player
	local player = managers.player.player_unit(slot5)

	if player then
		slot7 = player
		slot8 = {
			position = pos,
			range = self._values.range,
			damage = self._values.player_damage
		}

		player.character_damage(slot6).damage_explosion(slot6, player.character_damage(slot6))
	end

	slot11 = rot
	slot12 = self._values.sound_event

	managers.explosion.spawn_sound_and_effects(slot6, managers.explosion, pos, rot.z(slot10), self._values.range, self._values.explosion_effect)

	slot7 = Network

	if Network.is_server(slot6) then
		slot8 = {
			curve_pow = 5,
			player_damage = 0,
			hit_pos = pos,
			range = self._values.range,
			collision_slotmask = managers.slot.get_mask(slot10, managers.slot),
			damage = self._values.damage,
			no_raycast_check_characters = self._values.no_raycast_check_characters
		}
		slot12 = "explosion_targets"

		managers.explosion.detect_and_give_dmg(slot6, managers.explosion)

		slot7 = managers.network
		slot12 = rot
		slot13 = 5

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "element_explode_on_client", pos, rot.z(managers.slot), self._values.damage, self._values.range)
	end

	slot8 = instigator

	ElementExplosion.super.on_executed(slot6, self)

	return 
end

return 
