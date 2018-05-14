-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAwardAchievment then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAwardAchievment = slot0
function ElementAwardAchievment:init(...)
	slot3 = self

	ElementAwardAchievment.super.init(slot2, ...)

	return 
end
function ElementAwardAchievment:client_on_executed_end_screen(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementAwardAchievment:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementAwardAchievment:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local award_achievement = true

	if self._values.award_instigator then
		slot5 = instigator

		if type(slot4) == "userdata" then
			slot5 = instigator

			if alive(slot4) then
				local local_player = managers.player.local_player(slot4)
				slot6 = local_player
				award_achievement = alive(managers.player) and local_player == instigator

				if not award_achievement then
					slot6 = instigator

					if instigator.vehicle_driving(slot5) then
						slot6 = instigator
						slot7 = local_player
						local seat = instigator.vehicle_driving(slot5).find_seat_for_player(slot5, instigator.vehicle_driving(slot5))

						if seat and seat.driving then
							award_achievement = true
						end
					elseif not true then
					end
				end
			end
		end
	end

	if self._values.players_from_start then
		slot5 = managers.statistics
	end

	if award_achievement then
		slot7 = self._values.achievment

		print(slot4, "[ElementAwardAchievment:on_executed]", "achievment")

		slot6 = self._values.achievment

		managers.achievment.award(slot4, managers.achievment)
	end

	slot6 = instigator

	ElementAwardAchievment.super.on_executed(slot4, self)

	return 
end

return 
