if not GroupAIStateZone then
	slot2 = GroupAIStateRaid
	slot0 = class(slot1)
end

GroupAIStateZone = slot0
GroupAIStateZone.MAX_DISTANCE_TO_PLAYER = 64000000
function GroupAIStateZone:init()
	slot3 = self

	GroupAIStateZone.super.init(slot2)

	return 
end
function GroupAIStateZone:nav_ready_listener_key()
	return "GroupAIStateZone"
end
function GroupAIStateZone:_upd_assault_spawning(task_data, primary_target_area)
	slot7 = primary_target_area

	GroupAIStateZone.super._upd_assault_spawning(slot4, self, task_data)

	slot5 = self._groups

	for group_id, group in pairs(slot4) do
		if group.has_spawned and group.objective.type ~= "retire" then
			local closest_dis_sq = nil
			slot13 = self

			for u_key, u_data in pairs(self.all_player_criminals(slot12)) do
				slot17 = group.objective.area.pos
				local my_dis_sq = mvector3.distance_sq(slot15, u_data.m_pos)

				if not closest_dis_sq or my_dis_sq < closest_dis_sq then
					closest_dis_sq = my_dis_sq
				end
			end

			if closest_dis_sq and GroupAIStateZone.MAX_DISTANCE_TO_PLAYER < closest_dis_sq then
				slot12 = group

				self._assign_group_to_retire(slot10, self)
			end
		end
	end

	return 
end

return 
