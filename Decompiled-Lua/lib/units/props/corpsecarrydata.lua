if not CorpseCarryData then
	slot2 = CarryData
	slot0 = class(slot1)
end

CorpseCarryData = slot0
function CorpseCarryData:init(...)
	slot3 = self

	CorpseCarryData.super.init(slot2, ...)

	slot4 = BuffEffectManager.EFFECT_ATTACK_ONLY_IN_AIR

	if managers.buff_effect.is_effect_active(slot2, managers.buff_effect) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = "halloween_2017"

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = "halloween_2017"

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end
	end

	return 
end
function CorpseCarryData:on_thrown()
	if not self._dismembered_parts then
		slot3 = managers.player
		slot6 = self
		slot1 = managers.player.carry_temporary_data(slot2, self.carry_id(slot5))
	end

	self._dismembered_parts = slot1
	slot1 = ipairs
	slot3 = self._dismembered_parts or {}

	for _, dismember_part in slot1(slot2) do
		slot10 = dismember_part

		if self._dismember(slot7, self, dismember_part .. "_no_blood") then
			slot9 = dismember_part

			self._dismember(slot7, self)
		end
	end

	slot3 = managers.player
	slot6 = self

	managers.player.clear_carry_temporary_data(slot2, self.carry_id(slot5))

	return 
end
function CorpseCarryData:_dismember(part_name, decal_name)
	slot5 = self._unit
	slot6 = part_name

	if not self._unit.damage(slot4).has_sequence(slot4, self._unit.damage(slot4)) then
		return false
	end

	slot5 = self._unit
	slot6 = part_name

	self._unit.damage(slot4).run_sequence_simple(slot4, self._unit.damage(slot4))

	local decal_data = tweak_data.character.dismemberment_data.blood_decal_data[decal_name or part_name]

	if decal_data then
		local materials = self._unit.materials(slot5)
		slot7 = materials

		for i, material in ipairs(self._unit) do
			slot13 = Idstring(slot14)
			slot18 = 0

			material.set_variable(slot11, material, Vector3("gradient_uv_offset", decal_data[1], decal_data[2]))

			slot15 = "gradient_power"
			slot14 = decal_data[3]

			material.set_variable(slot11, material, Idstring(Vector3))
		end
	end

	return 
end
function CarryData:on_pickup()
	if self._dismembered_parts then
		slot6 = self
		slot5 = self._dismembered_parts

		managers.player.set_carry_temporary_data(slot2, managers.player, self.carry_id(slot5))
	end

	return 
end

return 
