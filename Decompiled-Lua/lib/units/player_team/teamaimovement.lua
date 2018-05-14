if not TeamAIMovement then
	slot2 = CopMovement
	slot0 = class(slot1)
end

TeamAIMovement = slot0
TeamAIMovement._char_name_to_index = HuskPlayerMovement._char_name_to_index
TeamAIMovement._char_model_names = HuskPlayerMovement._char_model_names
function TeamAIMovement:_post_init()
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if managers.groupai.state(slot2).whisper_mode(slot2) then
		if not self._heat_listener_clbk then
			slot3 = Network

			if Network.is_server(slot2) then
				slot6 = self._unit
				slot2 = tostring(self._unit.key(slot5))
				self._heat_listener_clbk = "TeamAIMovement" .. slot2
				slot3 = managers.groupai
				slot5 = {
					"whisper_mode"
				}
				slot10 = "heat_clbk"

				managers.groupai.state(slot2).add_listener(slot2, managers.groupai.state(slot2), self._heat_listener_clbk, callback(slot7, self, self))
			end
		end

		slot3 = self._unit
		slot5 = 24

		self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)
	else
		slot4 = false

		self.set_cool(slot2, self)
	end

	slot3 = self._nav_tracker
	self._standing_nav_seg_id = self._nav_tracker.nav_segment(slot2)
	slot4 = "idle"

	self.play_redirect(slot2, self)

	return 
end
function TeamAIMovement:set_character_anim_variables()
	slot3 = self

	HuskPlayerMovement.set_character_anim_variables(slot2)

	return 
end
function TeamAIMovement:check_visual_equipment()
	return 
end
function TeamAIMovement:m_detect_pos()
	return self._m_head_pos
end
function TeamAIMovement:set_position(pos)
	slot5 = pos

	CopMovement.set_position(slot3, self)

	slot4 = self

	self._upd_location(slot3)

	return 
end
function TeamAIMovement:set_m_pos(pos)
	slot5 = pos

	CopMovement.set_m_pos(slot3, self)

	slot4 = self

	self._upd_location(slot3)

	return 
end
function TeamAIMovement:_upd_location()
	slot3 = self._nav_tracker
	local nav_seg_id = self._nav_tracker.nav_segment(slot2)

	if self._standing_nav_seg_id ~= nav_seg_id then
		self._standing_nav_seg_id = nav_seg_id
		slot4 = managers.groupai
		slot6 = nav_seg_id

		managers.groupai.state(slot3).on_criminal_nav_seg_change(slot3, managers.groupai.state(slot3), self._unit)
	end

	return 
end
function TeamAIMovement:get_location_id()
	slot4 = self._standing_nav_seg_id

	return managers.navigation.get_nav_seg_metadata(slot2, managers.navigation).location_id
end
function TeamAIMovement:on_cuffed()
	slot3 = self._unit
	slot4 = "surrender"

	self._unit.brain(slot2).set_logic(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = "arrested"

	self._unit.network(slot2).send(slot2, self._unit.network(slot2))

	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	self._unit.character_damage(slot2).on_arrested(slot2)

	return 
end
function TeamAIMovement:on_discovered()
	if self._cool then
		slot3 = self

		self._switch_to_not_cool(slot2)
	end

	return 
end
function TeamAIMovement:on_tase_ended()
	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	self._unit.character_damage(slot2).on_tase_ended(slot2)

	return 
end
function TeamAIMovement:tased()
	slot3 = self._unit

	return self._unit.anim_data(slot2).tased
end
function TeamAIMovement:cool()
	return self._cool
end
function TeamAIMovement:downed()
	slot3 = self._unit

	return self._unit.interaction(slot2)._active
end
function TeamAIMovement:set_cool(state)
	if state then
		state = true
	else
		state = false
	end

	if state == self._cool then
		return 
	end

	local old_state = self._cool

	if state then
		self._cool = true

		if not self._heat_listener_clbk then
			slot5 = Network

			if Network.is_server(slot4) then
				slot8 = self._unit
				slot4 = tostring(self._unit.key(slot7))
				self._heat_listener_clbk = "TeamAIMovement" .. slot4
				slot5 = managers.groupai
				slot7 = {
					"whisper_mode"
				}
				slot12 = "heat_clbk"

				managers.groupai.state(slot4).add_listener(slot4, managers.groupai.state(slot4), self._heat_listener_clbk, callback(slot9, self, self))
			end
		end

		slot5 = self._unit
		slot7 = 24

		self._unit.base(slot4).set_slot(slot4, self._unit.base(slot4), self._unit)

		slot5 = self._unit

		if self._unit.brain(slot4).on_cool_state_changed then
			slot5 = self._unit
			slot6 = true

			self._unit.brain(slot4).on_cool_state_changed(slot4, self._unit.brain(slot4))
		end

		slot6 = 1

		self.set_stance_by_code(slot4, self)
	else
		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		self._not_cool_t = TimerManager.game(slot4).time(slot4)
		slot6 = true

		self._switch_to_not_cool(slot4, self)
	end

	return 
end
function TeamAIMovement:heat_clbk(state)
	if self._cool and not state then
		slot4 = self

		self._switch_to_not_cool(slot3)
	end

	return 
end
function TeamAIMovement:_switch_to_not_cool(instant)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	if self._heat_listener_clbk then
		slot4 = managers.groupai
		slot5 = self._heat_listener_clbk

		managers.groupai.state(slot3).remove_listener(slot3, managers.groupai.state(slot3))

		self._heat_listener_clbk = nil
	end

	if instant then
		if self._switch_to_not_cool_clbk_id then
			slot5 = self._switch_to_not_cool_clbk_id

			managers.enemy.remove_delayed_clbk(slot3, managers.enemy)
		end

		self._switch_to_not_cool_clbk_id = "dummy"
		slot4 = self

		self._switch_to_not_cool_clbk_func(slot3)
	elseif not self._switch_to_not_cool_clbk_id then
		self._switch_to_not_cool_clbk_id = "switch_to_not_cool_clbk" .. tostring(self._unit.key(slot6))
		slot10 = "_switch_to_not_cool_clbk_func"
		slot9 = TimerManager
		slot9 = TimerManager.game(self)
		slot7 = TimerManager.game(self).time(self) + math.random() * 1 + 0.5

		managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot6)), managers.enemy, self._switch_to_not_cool_clbk_id, callback(self._unit, self, self))
	end

	return 
end
function TeamAIMovement:_switch_to_not_cool_clbk_func()
	if self._switch_to_not_cool_clbk_id and self._cool then
		self._switch_to_not_cool_clbk_id = nil
		self._cool = false
		slot3 = TimerManager
		slot3 = TimerManager.game(slot2)
		self._not_cool_t = TimerManager.game(slot2).time(slot2)
		slot3 = self._unit
		slot5 = 16

		self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)

		slot3 = self._unit

		if self._unit.brain(slot2)._logic_data then
			slot3 = self._unit
			slot3 = self._unit.brain(slot2)

			if self._unit.brain(slot2).is_available_for_assignment(slot2) then
				slot3 = self._unit
				slot3 = self._unit.brain(slot2)

				self._unit.brain(slot2).set_objective(slot2)

				slot3 = self._unit
				slot4 = {
					sync = true,
					body_part = 1,
					type = "idle"
				}

				self._unit.movement(slot2).action_request(slot2, self._unit.movement(slot2))
			end
		end

		slot4 = 2

		self.set_stance_by_code(slot2, self)

		slot3 = self._unit
		slot4 = false

		self._unit.brain(slot2).on_cool_state_changed(slot2, self._unit.brain(slot2))
	end

	return 
end
function TeamAIMovement:zipline_unit()
	return nil
end
function TeamAIMovement:current_state_name()
	return nil
end
function TeamAIMovement:pre_destroy()
	if self._heat_listener_clbk then
		slot3 = managers.groupai
		slot4 = self._heat_listener_clbk

		managers.groupai.state(slot2).remove_listener(slot2, managers.groupai.state(slot2))

		self._heat_listener_clbk = nil
	end

	if self._nav_tracker then
		slot4 = self._nav_tracker

		managers.navigation.destroy_nav_tracker(slot2, managers.navigation)

		self._nav_tracker = nil
	end

	if self._switch_to_not_cool_clbk_id then
		slot4 = self._switch_to_not_cool_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._switch_to_not_cool_clbk_id = nil
	end

	if self._link_data then
		slot3 = self._link_data.parent
		slot9 = unit
		slot4 = "CopMovement" .. tostring(unit.key(slot8))

		self._link_data.parent.base(slot2).remove_destroy_listener(slot2, self._link_data.parent.base(slot2))
	end

	slot3 = self._rope

	if alive(slot2) then
		slot3 = self._rope
		slot3 = self._rope.base(slot2)

		self._rope.base(slot2).retract(slot2)

		self._rope = nil
	end

	slot3 = self

	self._destroy_gadgets(slot2)

	slot3 = self._active_actions

	for i_action, action in ipairs(slot2) do
		if action and action.on_destroy then
			slot8 = action

			action.on_destroy(slot7)
		end
	end

	if self._attention and self._attention.destroy_listener_key then
		slot3 = self._attention.unit
		slot4 = self._attention.destroy_listener_key

		self._attention.unit.base(slot2).remove_destroy_listener(slot2, self._attention.unit.base(slot2))

		self._attention.destroy_listener_key = nil
	end

	return 
end

return 
