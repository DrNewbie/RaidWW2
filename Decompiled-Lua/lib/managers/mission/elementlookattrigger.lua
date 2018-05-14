slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementLookAtTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLookAtTrigger = slot0
function ElementLookAtTrigger:init(...)
	slot3 = self

	ElementLookAtTrigger.super.init(slot2, ...)

	return 
end
function ElementLookAtTrigger:on_script_activated()
	slot3 = self

	self.add_callback(slot2)

	return 
end
function ElementLookAtTrigger:set_enabled(enabled)
	slot5 = enabled

	ElementLookAtTrigger.super.set_enabled(slot3, self)

	if enabled then
		slot4 = self

		self.add_callback(slot3)
	end

	return 
end
function ElementLookAtTrigger:add_callback()
	if not self._callback then
		slot8 = "update_lookat"
		slot5 = self._values.interval
		self._callback = self._mission_script.add(slot2, self._mission_script, callback(slot5, self, self))
	end

	return 
end
function ElementLookAtTrigger:remove_callback()
	if self._callback then
		slot4 = self._callback

		self._mission_script.remove(slot2, self._mission_script)

		self._callback = nil
	end

	return 
end
function ElementLookAtTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementLookAtTrigger.super.on_executed(slot3, self)

	if not self._values.enabled then
		slot4 = self

		self.remove_callback(slot3)
	end

	return 
end
function ElementLookAtTrigger:update_lookat()
	if not self._values.enabled then
		return 
	end

	local player = managers.player.player_unit(slot2)
	slot4 = player

	if alive(managers.player) then
		slot5 = player
		slot5 = player.camera(slot4)
		local dir = self._values.position - player.camera(slot4).position(slot4)

		if self._values.distance and 0 < self._values.distance then
			slot5 = dir
			local distance = dir.length(slot4)

			if self._values.distance < distance then
				return 
			end
		end

		if self._values.in_front then
			slot5 = player
			slot5 = player.camera(slot4)
			slot5 = player.camera(slot4).forward(slot4)
			slot8 = self._values.rotation
			local dot = player.camera(slot4).forward(slot4).dot(slot4, self._values.rotation.y(slot7))

			if 0 < dot then
				return 
			end
		end

		slot5 = dir
		dir = dir.normalized(slot4)
		slot5 = player
		slot5 = player.camera(slot4)
		slot6 = dir
		local dot = player.camera(slot4).forward(slot4).dot(slot4, player.camera(slot4).forward(slot4))

		if self._values.sensitivity <= dot then
			slot6 = Network

			if Network.is_client(slot5) then
				slot6 = managers.network
				slot10 = player

				managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "to_server_mission_element_trigger", self._sync_id, self._id)
			else
				slot7 = player

				self.on_executed(slot5, self)
			end
		end
	end

	return 
end

return 
