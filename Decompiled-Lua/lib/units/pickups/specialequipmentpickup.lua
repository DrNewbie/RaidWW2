if not SpecialEquipmentPickup then
	slot2 = Pickup
	slot0 = class(slot1)
end

SpecialEquipmentPickup = slot0
function SpecialEquipmentPickup:init(unit)
	slot5 = unit

	SpecialEquipmentPickup.super.init(slot3, self)

	slot5 = unit

	managers.occlusion.remove_occlusion(slot3, managers.occlusion)

	return 
end
function SpecialEquipmentPickup:_pickup(unit)
	local equipment = unit.equipment(slot3)
	slot5 = unit
	slot5 = unit.character_damage(unit)

	if not unit.character_damage(unit).dead(unit) and equipment then
		slot6 = self._special

		if managers.player.can_pickup_equipment(slot4, managers.player) then
			slot6 = {
				name = self._special,
				amount = self._amount
			}

			managers.player.add_special(slot4, managers.player)

			slot5 = Network

			if Network.is_client(slot4) then
				slot5 = managers.network
				slot7 = self._unit

				managers.network.session(slot4).send_to_host(slot4, managers.network.session(slot4), "sync_pickup")
			end

			if self._global_event then
				slot7 = unit

				managers.mission.call_global_event(slot4, managers.mission, self._global_event)
			end

			slot5 = unit
			slot8 = false

			unit.sound(slot4).play(slot4, unit.sound(slot4), "pickup_ammo", nil)

			slot5 = self

			self.consume(slot4)

			return true
		end
	end

	return false
end
function SpecialEquipmentPickup:destroy(...)
	slot4 = self._unit

	managers.occlusion.add_occlusion(slot2, managers.occlusion)

	slot3 = self

	SpecialEquipmentPickup.super.destroy(slot2, ...)

	return 
end

return 
