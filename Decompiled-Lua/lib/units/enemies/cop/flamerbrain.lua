if not FlamerBrain then
	slot2 = CopBrain
	slot0 = class(slot1)
end

FlamerBrain = slot0
FlamerBrain.UPDATE_INTERVAL = 2
FlamerBrain.ATTACK_INTERVAL = 0.5
function FlamerBrain:stealth_action_allowed()
	return false
end
function FlamerBrain:init(unit)
	slot5 = unit

	FlamerBrain.super.init(slot3, self)

	slot7 = self._unit
	slot3 = tostring(self._unit.key(slot6))
	self._ukey = "flamer_" .. slot3
	slot9 = FlamerBrain.UPDATE_INTERVAL

	managers.queued_tasks.queue(slot3, managers.queued_tasks, self._ukey, self.queued_update, self, nil)

	slot4 = Application
	self._old_t = Application.time(slot3)
	slot4 = self._unit
	slot5 = "flamer_breathing_start"

	self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))

	self.is_flamer = true

	return 
end
function FlamerBrain:add_pos_rsrv(rsrv_name, pos_rsrv)
	pos_rsrv.radius = pos_rsrv.radius * 2
	local pos_reservations = self._logic_data.pos_rsrv

	if pos_reservations[rsrv_name] then
		slot7 = pos_reservations[rsrv_name]

		managers.navigation.unreserve_pos(slot5, managers.navigation)
	end

	pos_rsrv.filter = self._logic_data.pos_rsrv_id
	slot7 = pos_rsrv

	managers.navigation.add_pos_reservation(slot5, managers.navigation)

	pos_reservations[rsrv_name] = pos_rsrv

	if not pos_rsrv.id then
		slot7 = "[CopBrain:add_pos_rsrv] missing id"
		slot10 = pos_rsrv

		debug_pause_unit(slot5, self._unit, inspect(slot9))

		return 
	end

	return 
end
function FlamerBrain:queued_update()
	slot3 = self._unit

	if not alive(slot2) then
		return 
	end

	slot3 = Application
	local t = Application.time(slot2)
	local dt = t - self._old_t
	slot7 = dt

	self._queued_update(slot4, self, t)

	return 
end
function FlamerBrain:_queued_update(t, dt)
	if self._current_logic_name == "inactive" then
		return 
	end

	local assault_candidates = {}
	local att_obj = self._logic_data.attention_obj

	if att_obj and att_obj.nav_tracker then
		local pos = att_obj.m_pos
		local nav_seg = att_obj.nav_tracker.nav_segment(slot7)
		slot9 = managers.groupai
		slot10 = nav_seg
		local area = managers.groupai.state(att_obj.nav_tracker).get_area_from_nav_seg_id(att_obj.nav_tracker, managers.groupai.state(att_obj.nav_tracker))
		slot11 = {
			area = area,
			nav_seg = nav_seg,
			pos = pos
		}

		table.insert(managers.groupai.state(att_obj.nav_tracker), assault_candidates)
	else
		slot9 = managers.groupai
		slot9 = managers.groupai.state(slot8)

		for criminal_key, criminal_data in pairs(managers.groupai.state(slot8).all_char_criminals(slot8)) do
			if not criminal_data.status then
				local pos = criminal_data.m_pos
				local nav_seg = criminal_data.tracker.nav_segment(slot12)
				slot14 = managers.groupai
				slot15 = nav_seg
				local area = managers.groupai.state(criminal_data.tracker).get_area_from_nav_seg_id(criminal_data.tracker, managers.groupai.state(criminal_data.tracker))
				slot16 = {
					area = area,
					nav_seg = nav_seg,
					pos = pos
				}

				table.insert(managers.groupai.state(criminal_data.tracker), assault_candidates)
			end
		end
	end

	local assalut_target = nil
	local should_aquire_new_pos = false

	if 0 < #assault_candidates then
		assalut_target = assault_candidates[1]
		slot9 = assalut_target.pos
		slot12 = self._unit
		self._distance_to_target = mvector3.distance(slot8, self._unit.position(slot11))
		slot9 = self._unit
		slot11 = self._distance_to_target

		self._unit.network(slot8).send(slot8, self._unit.network(slot8), "sync_distance_to_target")

		if self._distance_to_target <= 600 and not self._pause_hunt then
			should_aquire_new_pos = true
			self._pause_hunt = true
		elseif 600 < self._distance_to_target then
			self._pause_hunt = false
			should_aquire_new_pos = true

			if self._old_assault_pos then
				slot10 = self._old_assault_pos
				local moved_dis = mvector3.distance(slot8, assalut_target.pos)

				if moved_dis < 250 then
					should_aquire_new_pos = false
				end
			end
		end
	end

	if should_aquire_new_pos then
		self._old_assault_pos = mvector3.copy(slot8)
		local attack_objective = {
			type = "free",
			no_retreat = true,
			attitude = "engage"
		}
		slot11 = attack_objective

		self.set_objective(assalut_target.pos, self)

		slot15 = FlamerBrain.ATTACK_INTERVAL

		managers.queued_tasks.queue(assalut_target.pos, managers.queued_tasks, nil, self._hunt, self, assalut_target)
	end

	slot14 = FlamerBrain.UPDATE_INTERVAL

	managers.queued_tasks.queue(slot8, managers.queued_tasks, self._ukey, self.queued_update, self, nil)

	return 
end
function FlamerBrain:distance_to_target()
	return self._distance_to_target
end
function FlamerBrain:_hunt(assalut_target)
	if self._current_logic_name == "inactive" then
		return 
	end

	if 1200 < self._distance_to_target then
		local objective = {
			type = "defend_area",
			area = assalut_target.area,
			nav_seg = assalut_target.nav_seg
		}
		slot5 = assalut_target.pos
		objective.pos = mvector3.copy(slot4)
		objective.no_retreat = true
		objective.attitude = "engage"
		slot6 = objective

		self.set_objective(slot4, self)
	end

	return 
end
function FlamerBrain:clbk_death(my_unit, damage_info)
	slot7 = damage_info

	FlamerBrain.super.clbk_death(slot4, self, my_unit)

	slot5 = self._unit
	slot6 = "flamer_breathing_break"

	self._unit.sound_source(slot4).post_event(slot4, self._unit.sound_source(slot4))

	return 
end
function FlamerBrain:pre_destroy(unit)
	slot6 = self

	managers.queued_tasks.unqueue_all(slot3, managers.queued_tasks, self._ukey)

	slot5 = unit

	FlamerBrain.super.pre_destroy(slot3, self)

	return 
end

return 
