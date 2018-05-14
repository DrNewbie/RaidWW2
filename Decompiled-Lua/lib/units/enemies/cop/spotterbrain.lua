if not SpotterBrain then
	slot2 = CopBrain
	slot0 = class(slot1)
end

SpotterBrain = slot0
function SpotterBrain:stealth_action_allowed()
	return false
end
function SpotterBrain:reset_spotter()
	slot4 = "[SpotterBrain:reset_spotter()]"

	Application.debug(slot2, Application)

	slot4 = nil

	CopLogicBase._set_attention_obj(slot2, self._logic_data)

	self._logic_data.internal_data.shooting = nil
	slot3 = self._logic_data

	CopLogicBase._destroy_all_detected_attention_object_data(nil)

	slot3 = managers.groupai
	slot3 = managers.groupai.state(nil)
	slot6 = self._unit

	managers.groupai.state(nil)._clear_character_criminal_suspicion_data(nil, self._unit.key(slot5))

	self.on_cooldown = false

	return 
end
function SpotterBrain:on_barrage_ended()
	return 
end
function SpotterBrain:schedule_spotter_reset(delay)
	slot6 = delay

	Application.debug(slot3, Application, "[SpotterBrain:schedule_spotter_reset()] delay")

	self.on_cooldown = true
	slot10 = nil

	managers.queued_tasks.queue(slot3, managers.queued_tasks, nil, self.reset_spotter, self, nil, delay)

	return 
end
function SpotterBrain:set_logic(name, enter_params)
	slot7 = enter_params

	SpotterBrain.super.set_logic(slot4, self, name)

	return 
end
function SpotterBrain:action_request(action)
	if action.type == "shoot" then
		return 
	end

	slot5 = action

	return SpotterBrain.super.action_request(slot3, self)
end
function SpotterBrain:anim_clbk_throw_flare()
	slot4 = "[SpotterBrain:anim_clbk_throw_flare()]"

	Application.debug(slot2, Application)

	slot5 = self._spotted_unit

	managers.barrage.spawn_flare(slot2, managers.barrage, self._unit)

	return 
end
function SpotterBrain:destroy()
	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil)

	return 
end

return 
