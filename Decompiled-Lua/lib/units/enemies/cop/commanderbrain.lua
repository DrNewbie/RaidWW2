if not CommanderBrain then
	slot2 = CopBrain
	slot0 = class(slot1)
end

CommanderBrain = slot0
CommanderBrain.INTENSITY_INCREASE = 0.2
function CommanderBrain:stealth_action_allowed()
	return false
end
function CommanderBrain:init(unit)
	slot5 = unit

	CommanderBrain.super.init(slot3, self)

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.enemy

		managers.enemy.register_commander(slot3)

		self._registered = true
	end

	return 
end
function CommanderBrain:pre_destroy(unit)
	slot5 = unit

	CommanderBrain.super.pre_destroy(slot3, self)

	slot4 = Network

	if Network.is_server(slot3) and self._registered then
		slot4 = managers.enemy

		managers.enemy.unregister_commander(slot3)

		self._registered = false
	end

	return 
end
function CommanderBrain:clbk_death(my_unit, damage_info)
	slot7 = damage_info

	CommanderBrain.super.clbk_death(slot4, self, my_unit)

	slot5 = Network

	if Network.is_server(slot4) and self._registered then
		slot5 = managers.enemy

		managers.enemy.unregister_commander(slot4)

		self._registered = false
	end

	return 
end

return 
