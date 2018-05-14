-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPlayerState then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPlayerState = slot0
function ElementPlayerState:init(...)
	slot3 = self

	ElementPlayerState.super.init(slot2, ...)

	return 
end
function ElementPlayerState:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementPlayerState:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local state = self._values.state
	slot5 = managers.player
	local player_unit = managers.player.player_unit(slot4)
	local requires_alive_player = false

	if self._values.state == "electrocution" then
		state = "tased"
		requires_alive_player = true
		slot7 = player_unit

		if alive(slot6) then
			slot7 = player_unit
			slot7 = player_unit.movement(slot6)

			player_unit.movement(slot6).on_non_lethal_electrocution(slot6)
		end
	end

	if not self._values.use_instigator or instigator == player_unit then
	end

	slot8 = self._unit or instigator

	ElementPlayerState.super.on_executed(slot6, self)

	return 
end

if not ElementPlayerStateTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPlayerStateTrigger = slot0
function ElementPlayerStateTrigger:init(...)
	slot3 = self

	ElementPlayerStateTrigger.super.init(slot2, ...)

	return 
end
function ElementPlayerStateTrigger:on_script_activated()
	slot6 = self
	slot5 = {
		self._values.state
	}
	slot12 = Network
	slot10 = (Network.is_client(slot11) and "send_to_host") or "on_executed"

	managers.player.add_listener(slot2, managers.player, self._unique_string_id(slot5), callback(slot7, self, self))

	return 
end
function ElementPlayerStateTrigger:send_to_host(instigator)
	if instigator then
		slot4 = managers.network
		slot8 = instigator

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "to_server_mission_element_trigger", self._sync_id, self._id)
	end

	return 
end
function ElementPlayerStateTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._unit or instigator

	ElementPlayerStateTrigger.super.on_executed(slot3, self)

	return 
end

return 
