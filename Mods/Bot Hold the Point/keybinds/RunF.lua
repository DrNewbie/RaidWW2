local function AskBotHoldthePoint()
	if not managers.groupai:state():team_ai_enabled() then
		return
	end
	local ply_unit = managers.player:player_unit()
	if not ply_unit or not alive(ply_unit) then
		return
	end
	local PlyStandard = ply_unit:movement() and ply_unit:movement()._states.standard
	if not PlyStandard then
		return
	end
	local cam_fwd = ply_unit:camera():forward()
	for _, ai in pairs(managers.groupai:state():all_AI_criminals()) do
		if ai.unit and ai.unit:movement() and ai.unit:movement().set_should_stay then
			local ai_pos = ai.unit:movement()._m_pos
			local vec = ai_pos - ply_unit:position()
			local dis = mvector3.normalize(vec)
			local max_angle = math.max(8, math.lerp(10, 30, dis / 1200))
			local angle = vec:angle(cam_fwd)					
			if angle < max_angle or math.abs(max_angle-angle) < 10 then
				PlyStandard:_do_action_intimidate(TimerManager:game():time(), "cmd_point", "player_intimidate_follow", true)
				ai.unit:movement():set_should_stay(not ai.unit:movement()._should_stay)
				break
			end
		end
	end
end

AskBotHoldthePoint()