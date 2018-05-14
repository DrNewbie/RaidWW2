slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSmokeGrenade then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSmokeGrenade = slot0
function ElementSmokeGrenade:init(...)
	slot3 = self

	ElementSmokeGrenade.super.init(slot2, ...)

	return 
end
function ElementSmokeGrenade:client_on_executed(...)
	return 
end
function ElementSmokeGrenade:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local is_flashbang = self._values.effect_type == "flash"

	if self._values.immediate then
		slot5 = managers.groupai
		slot5 = managers.groupai.state(slot4)

		if managers.groupai.state(slot4).get_assault_mode(slot4) or self._values.ignore_control then
			slot5 = managers.network
			slot6 = "sync_smoke_grenade_kill"

			managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4))

			slot5 = managers.groupai

			managers.groupai.state(slot4).sync_smoke_grenade_kill(slot4)

			local pos = self._values.position
			slot6 = managers.network
			slot11 = is_flashbang

			managers.network.session(managers.groupai.state(slot4)).send_to_peers_synched(managers.groupai.state(slot4), managers.network.session(managers.groupai.state(slot4)), "sync_smoke_grenade", pos, pos, self._values.duration)

			slot6 = managers.groupai
			slot10 = is_flashbang

			managers.groupai.state(managers.groupai.state(slot4)).sync_smoke_grenade(managers.groupai.state(slot4), managers.groupai.state(managers.groupai.state(slot4)), pos, pos, self._values.duration)

			slot6 = managers.groupai
			managers.groupai.state(managers.groupai.state(slot4))._smoke_grenade_ignore_control = self._values.ignore_control
		end
	else
		slot5 = managers.groupai
		managers.groupai.state(slot4)._smoke_grenade_queued = {
			self._values.position,
			self._values.duration,
			self._values.ignore_control,
			is_flashbang
		}
	end

	slot5 = (is_flashbang and "FLAAAASHBAAAAANG") or "SMOOOOOOOKEEEEEEEE"

	print(slot4)

	slot6 = instigator

	ElementSmokeGrenade.super.on_executed(slot4, self)

	return 
end

return 
