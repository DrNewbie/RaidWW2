if not TeamAIBase then
	slot2 = CopBase
	slot0 = class(slot1)
end

TeamAIBase = slot0
function TeamAIBase:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot4 = true

	self._ext_movement.post_init(slot2, self._ext_movement)

	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).post_init(slot2)

	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	self._allow_invisible = true
	slot3 = self

	self._register(slot2)

	slot4 = self._unit

	managers.occlusion.remove_occlusion(slot2, managers.occlusion)

	return 
end
function TeamAIBase:nick_name()
	local name = self._tweak_table
	slot5 = "menu_" .. name

	return managers.localization.text(slot3, managers.localization)
end
function TeamAIBase:default_weapon_name(slot)
	return tweak_data.character[self._tweak_table].weapon.weapons_of_choice[slot or "primary"]
end
function TeamAIBase:arrest_settings()
	return tweak_data.character[self._tweak_table].arrest
end
function TeamAIBase:pre_destroy(unit)
	slot4 = self

	self.remove_from_vehicle(slot3)

	slot4 = self

	self.unregister(slot3)

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	return 
end
function TeamAIBase:save(data)
	data.base = {
		tweak_table = self._tweak_table
	}

	return 
end
function TeamAIBase:on_death_exit()
	slot3 = self

	TeamAIBase.super.on_death_exit(slot2)

	slot3 = self

	self.unregister(slot2)

	slot5 = 0

	self.set_slot(slot2, self, self._unit)

	return 
end
function TeamAIBase:_register()
	if not self._registered then
		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).register_criminal(slot2, managers.groupai.state(slot2))

		self._registered = true
	end

	return 
end
function TeamAIBase:unregister()
	if self._registered then
		slot3 = Network

		if Network.is_server(slot2) then
			slot3 = self._unit
			slot3 = self._unit.brain(slot2)
			slot4 = nil

			self._unit.brain(slot2).attention_handler(slot2).set_attention(slot2, self._unit.brain(slot2).attention_handler(slot2))
		end

		slot3 = managers.groupai
		slot4 = self._unit

		if managers.groupai.state(slot2).all_AI_criminals(slot2)[self._unit.key(managers.groupai.state(slot2))] then
			slot3 = managers.groupai
			slot4 = self._unit

			managers.groupai.state(slot2).unregister_criminal(slot2, managers.groupai.state(slot2))
		end

		slot4 = self._unit
		self._char_name = managers.criminals.character_name_by_unit(slot2, managers.criminals)
		self._registered = nil
	end

	return 
end
function TeamAIBase:remove_from_vehicle()
	slot3 = self._unit
	local unit_movement = self._unit.movement(slot2)

	if unit_movement.vehicle_unit and unit_movement.vehicle_seat and unit_movement.vehicle_seat.occupant == self._unit then
		slot4 = unit_movement.vehicle_unit
		slot5 = unit_movement.vehicle_seat

		unit_movement.vehicle_unit.vehicle_driving(slot3)._evacuate_seat(slot3, unit_movement.vehicle_unit.vehicle_driving(slot3))
	end

	return 
end
function TeamAIBase:chk_freeze_anims()
	return 
end

return 
