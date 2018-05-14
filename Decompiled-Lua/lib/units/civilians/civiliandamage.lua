-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CivilianDamage then
	slot2 = CopDamage
	slot0 = class(slot1)
end

CivilianDamage = slot0
function CivilianDamage:init(unit)
	slot5 = unit

	CivilianDamage.super.init(slot3, self)

	self._pickup = nil

	return 
end
function CivilianDamage:die(variant)
	slot4 = self._unit
	slot6 = 17

	self._unit.base(slot3).set_slot(slot3, self._unit.base(slot3), self._unit)

	slot4 = self

	self.drop_pickup(slot3)

	slot4 = self._unit

	if self._unit.unit_data(slot3).mission_element then
		slot4 = self._unit
		slot6 = self._unit

		self._unit.unit_data(slot3).mission_element.event(slot3, self._unit.unit_data(slot3).mission_element, "death")

		slot4 = self._unit

		if not self._unit.unit_data(slot3).alerted_event_called then
			slot4 = self._unit
			self._unit.unit_data(slot3).alerted_event_called = true
			slot4 = self._unit
			slot6 = self._unit

			self._unit.unit_data(true).mission_element.event(true, self._unit.unit_data(true).mission_element, "alerted")
		end
	end

	slot6 = managers.interaction

	if alive(managers.interaction.active_unit(slot5)) then
		slot4 = managers.interaction
		slot4 = managers.interaction.active_unit(slot3)
		slot4 = managers.interaction.active_unit(slot3).interaction(slot3)

		managers.interaction.active_unit(slot3).interaction(slot3).selected(slot3)
	end

	variant = variant or "bullet"
	self._health = 0
	self._health_ratio = 0
	self._dead = true
	slot5 = false

	self.set_mover_collision_state(slot3, self)

	return 
end
function CivilianDamage:_on_damage_received(damage_info)
	slot5 = damage_info

	self._call_listeners(slot3, self)

	if damage_info.result.type == "death" then
		slot5 = damage_info

		self._unregister_from_enemy_manager(slot3, self)

		slot4 = Network

		if Network.is_client(slot3) then
			slot4 = self._unit
			slot6 = false

			self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3), false)
		end
	end

	local attacker_unit = damage_info and damage_info.attacker_unit
	slot5 = attacker_unit

	if alive(slot4) then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				slot5 = attacker_unit
				slot5 = attacker_unit.base(slot4)
				attacker_unit = attacker_unit.base(slot4).thrower_unit(slot4)
			end
		end
	end

	slot5 = managers.player

	if attacker_unit == managers.player.player_unit(slot4) and damage_info then
		slot7 = damage_info

		managers.player.on_damage_dealt(slot4, managers.player, self._unit)
	end

	return 
end
function CivilianDamage:print(...)
	slot3 = "civ_damage"

	cat_print(slot2, ...)

	return 
end
function CivilianDamage:_unregister_from_enemy_manager(damage_info)
	slot6 = damage_info

	managers.enemy.on_civilian_died(slot3, managers.enemy, self._unit)

	return 
end
function CivilianDamage:damage_bullet(attack_data)
	slot6 = "civ_harmless_bullets"

	if managers.player.has_category_upgrade(slot3, managers.player, "player") then
		slot4 = self._unit

		if not self._unit.anim_data(slot3).no_intimidation_by_dmg then
		end
	end

	attack_data.damage = 10
	slot5 = attack_data

	return CopDamage.damage_bullet(slot3, self)
end
function CivilianDamage:damage_explosion(attack_data)
	if attack_data.variant == "explosion" then
		attack_data.damage = 10
	end

	slot5 = attack_data

	return CopDamage.damage_explosion(slot3, self)
end
function CivilianDamage:damage_fire(attack_data)
	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	slot5 = attack_data

	return CopDamage.damage_fire(slot3, self)
end
function CivilianDamage:damage_melee(attack_data)
	slot6 = "civ_harmless_melee"

	if managers.player.has_category_upgrade(slot3, managers.player, "player") then
		slot4 = self._unit

		if not self._unit.anim_data(slot3).no_intimidation_by_dmg then
		end
	end

	attack_data.damage = 10
	slot5 = attack_data

	return CopDamage.damage_melee(slot3, self)
end
function CivilianDamage:damage_tase(attack_data)
	slot6 = "civ_harmless_melee"

	if managers.player.has_category_upgrade(slot3, managers.player, "player") then
		slot4 = self._unit

		if not self._unit.anim_data(slot3).no_intimidation_by_dmg then
		end
	end

	attack_data.damage = 10
	slot5 = attack_data

	return CopDamage.damage_tase(slot3, self)
end

return 
