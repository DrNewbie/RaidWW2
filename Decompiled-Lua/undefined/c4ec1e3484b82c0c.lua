RevivePumpkinExt = RevivePumpkinExt or class()
function RevivePumpkinExt:init(unit)
	local idstr_pumpkin_asset = Idstring(slot3)
	self._unit = unit
	self._should_sync = true

	self._unit.set_extension_update_enabled("revive_pumpkin", self._unit, idstr_pumpkin_asset)

	slot8 = unit
	self._listener_key_enter = "revive_pumpkin_enter" .. tostring(unit.key(false))
	slot8 = unit
	self._listener_key_exit = "revive_pumpkin_exit" .. tostring(unit.key(false))
	slot6 = BuffEffectManager.EFFECT_NO_BLEEDOUT_PUMPIKIN_REVIVE

	if not managers.buff_effect.is_effect_active(tostring(unit.key(false)), managers.buff_effect) then
		slot5 = Application

		if not Application.editor(slot4) then
			slot5 = Network

			if Network.is_server(slot4) then
				slot6 = 0

				self._unit.set_slot(slot4, self._unit)

				return 
			end
		end
	end

	slot7 = {
		PlayerManager.EVENT_LOCAL_PLAYER_ENTER_RESPAWN
	}
	slot12 = "local_player_enter_resapwn"

	managers.system_event_listener.add_listener(slot4, managers.system_event_listener, self._listener_key_enter, callback(slot9, self, self))

	slot12 = "local_player_exit_resapwn"

	managers.system_event_listener.add_listener(slot4, managers.system_event_listener, self._listener_key_exit, callback(slot9, self, self))

	self._materials = {}
	slot8 = "material"
	local all_materials = self._unit.get_objects_by_type(slot4, Idstring({
		PlayerManager.EVENT_LOCAL_PLAYER_EXIT_RESPAWN
	}))
	slot6 = all_materials

	for _, m in ipairs(self._unit) do
		slot11 = m
		slot14 = "contour_color"

		if m.variable_exists(slot10, Idstring(slot13)) then
			slot12 = m

			table.insert(slot10, self._materials)

			slot14 = "contour_opacity"

			m.set_variable(slot10, m, Idstring(0))
		end
	end

	return 
end
function RevivePumpkinExt:local_player_enter_resapwn(level)
	slot5 = "[RevivePumpkinExt:local_player_enter_resapwn]"

	Application.debug(slot3, Application)

	slot4 = self._materials

	for _, m in ipairs(slot3) do
		slot12 = "contour_opacity"

		m.set_variable(slot8, m, Idstring(1))
	end

	return 
end
function RevivePumpkinExt:local_player_exit_resapwn(level)
	slot5 = "[RevivePumpkinExt:local_player_exit_resapwn]"

	Application.debug(slot3, Application)

	slot4 = self._materials

	for _, m in ipairs(slot3) do
		slot12 = "contour_opacity"

		m.set_variable(slot8, m, Idstring(0))
	end

	return 
end
function RevivePumpkinExt:destroy()
	slot4 = self._listener_key_enter

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot4 = self._listener_key_exit

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot4 = CoreSystemEventListenerManager.SystemEventListenerManager.PUMPKIN_DESTROYED

	managers.system_event_listener.call_listeners(slot2, managers.system_event_listener)

	if self._should_sync then
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot3 = managers.network
			slot5 = self._unit

			managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_revive_pumpkin_destroyed")
		end
	end

	return 
end
function RevivePumpkinExt:set_should_sync(should_sync)
	self._should_sync = should_sync

	return 
end

return 
