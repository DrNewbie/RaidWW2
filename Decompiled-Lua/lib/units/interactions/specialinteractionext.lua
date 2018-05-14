if not SpecialInteractionExt then
	slot2 = UseInteractionExt
	slot0 = class(slot1)
end

SpecialInteractionExt = slot0
function SpecialInteractionExt:_interact_blocked(player)
	return false
end
function SpecialInteractionExt:interact(player)
	slot5 = player

	if not self.can_interact(slot3, self) then
		return 
	end

	SpecialInteractionExt.super.super.interact(slot3, self)

	slot4 = self._tweak_data
	local params = deep_clone(slot3)
	local pm = managers.player
	params.target_unit = self._unit
	slot12 = 0
	slot7 = 1
	params.number_of_circles = math.max(player, params.number_of_circles - pm.upgrade_value(slot8, pm, "interaction", "wheel_amount_decrease"))
	local count = params.number_of_circles

	for i = 1, count, 1 do
		slot16 = 1
		params.circle_difficulty[i] = params.circle_difficulty[i] * pm.upgrade_value(slot12, pm, "interaction", "wheel_hotspot_increase")
		slot16 = 1
		params.circle_rotation_speed[i] = params.circle_rotation_speed[i] * pm.upgrade_value(slot12, pm, "interaction", "wheel_rotation_speed_increase")
	end

	self._player = player
	slot7 = self._unit
	self._unit.unit_data(slot6)._interaction_done = false
	slot8 = "[SpecialInteractionExt:interact]"
	slot11 = self._tweak_data

	Application.debug(false, Application, inspect(slot10))

	slot9 = params

	game_state_machine.change_state_by_name(false, game_state_machine, "ingame_special_interaction")

	return true
end
function SpecialInteractionExt:special_interaction_done()
	slot4 = self._player

	SpecialInteractionExt.super.interact(slot2, self)

	slot3 = managers.network
	slot5 = self._unit

	managers.network.session(slot2).send_to_peers(slot2, managers.network.session(slot2), "special_interaction_done")

	return 
end
function SpecialInteractionExt:set_special_interaction_done()
	slot4 = "[SpecialInteractionExt:set_special_interaction_done()]"

	Application.debug(slot2, Application)

	slot3 = self._unit
	self._unit.unit_data(slot2)._interaction_done = true

	return 
end

return 
