-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementKillZone then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementKillZone = slot0
function ElementKillZone:init(...)
	slot3 = self

	ElementKillZone.super.init(slot2, ...)

	return 
end
function ElementKillZone:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = instigator

	if alive(slot3) then
		self._values.type = self._values.type or "sniper"
		slot4 = managers.player

		if instigator == managers.player.player_unit(slot3) then
			slot6 = self._values.type

			managers.killzone.set_unit(slot3, managers.killzone, instigator)
		else
			slot4 = instigator

			if instigator.network(slot3) then
				local rpc_params = {
					"killzone_set_unit",
					self._values.type
				}
				slot5 = instigator
				slot6 = rpc_params

				instigator.network(slot4).send_to_unit(slot4, instigator.network(slot4))
			else
				slot4 = Application

				if Application.production_build(slot3) and instigator.chracter_damage then
					slot4 = Network
				else
					slot8 = instigator
					slot5 = "Unsupported unit type added to killzone:   " .. inspect(slot7)

					Application.error(slot3, Application)
				end
			end
		end
	end

	slot5 = self._unit or instigator

	ElementKillZone.super.on_executed(slot3, self)

	return 
end

return 
