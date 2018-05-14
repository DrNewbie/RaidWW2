if not HuskTeamAIMovement then
	slot2 = TeamAIMovement
	slot0 = class(slot1)
end

HuskTeamAIMovement = slot0
function HuskTeamAIMovement:init(unit)
	slot5 = unit

	HuskTeamAIMovement.super.init(slot3, self)

	self._queued_actions = {}
	slot4 = self._m_pos
	self._m_host_stop_pos = mvector3.copy(slot3)

	return 
end
function HuskTeamAIMovement:_post_init()
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if managers.groupai.state(slot2).whisper_mode(slot2) then
		slot3 = self._unit
		slot5 = 24

		self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)
	end

	slot4 = "idle"

	self.play_redirect(slot2, self)

	return 
end
function HuskTeamAIMovement:sync_arrested()
	slot3 = self._unit
	slot4 = "free"

	self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

	slot3 = self._unit
	slot5 = false

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	slot3 = self._unit
	slot5 = 24

	self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)

	return 
end
function HuskTeamAIMovement:_upd_actions(t)
	slot5 = t

	TeamAIMovement._upd_actions(slot3, self)

	slot4 = self

	HuskCopMovement._chk_start_queued_action(slot3)

	return 
end
function HuskTeamAIMovement:action_request(action_desc)
	slot5 = action_desc

	return HuskCopMovement.action_request(slot3, self)
end
function HuskTeamAIMovement:chk_action_forbidden(action_desc)
	slot5 = action_desc

	return HuskCopMovement.chk_action_forbidden(slot3, self)
end

return 
