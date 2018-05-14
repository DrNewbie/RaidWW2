slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementTeleportPlayer then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTeleportPlayer = slot0
ElementTeleportPlayer.PEER_OFFSETS = {
	0,
	1,
	-1,
	2
}
function ElementTeleportPlayer:init(...)
	slot3 = self

	ElementTeleportPlayer.super.init(slot2, ...)

	return 
end
function ElementTeleportPlayer:value(name)
	return self._values[name]
end
function ElementTeleportPlayer:get_spawn_position()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
	local position = self._values.position
	slot5 = self._values.rotation
	local x = self._values.rotation.x(slot4)
	position = position + ElementTeleportPlayer.PEER_OFFSETS[peer_id] * x * 100

	return position
end
function ElementTeleportPlayer:client_on_executed(...)
	if not self._values.enabled then
		return 
	end

	slot3 = managers.player

	if not managers.player.local_player(slot2) then
		return 
	end

	local position = self.get_spawn_position(slot2)
	slot6 = self._values.rotation

	managers.player.warp_to(self, managers.player, position)

	slot4 = managers.player
	slot2 = managers.player.set_player_state

	if not self._values.state then
		slot7 = managers.player
		slot5 = managers.player.current_state(slot6)
	end

	slot2(slot3, slot4)

	slot4 = managers.menu

	managers.menu.hide_loading_screen(slot3)

	return 
end
function ElementTeleportPlayer:on_executed(instigator)
	slot6 = self._sync_id

	Application.debug(slot3, Application, "[ElementTeleportPlayer:on_executed]")

	if not self._values.enabled then
		return 
	end

	slot4 = managers.player

	if not managers.player.local_player(slot3) then
		return 
	end

	local position = self.get_spawn_position(slot3)
	slot7 = self._values.rotation

	managers.player.warp_to(self, managers.player, position)

	slot5 = managers.player
	slot3 = managers.player.set_player_state

	if not self._values.state then
		slot8 = managers.player
		slot6 = managers.player.current_state(slot7)
	end

	slot3(slot4, slot5)

	slot5 = managers.menu

	managers.menu.hide_loading_screen(slot4)

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)
	slot3 = managers.groupai.state(slot4).on_player_spawn_state_set

	if not self._values.state then
		slot8 = managers.player
		slot6 = managers.player.default_player_state(slot7)
	end

	slot3(slot4, slot5)

	slot6 = self._unit or instigator

	ElementTeleportPlayer.super.on_executed(slot4, self)

	return 
end
function ElementTeleportPlayer:_spawnt_team_ai()
	managers.worldcollection.team_ai_transition = false
	slot3 = managers.groupai
	slot4 = true

	managers.groupai.state(false).on_criminal_team_AI_enabled_state_changed(false, managers.groupai.state(false))

	return 
end

return 
