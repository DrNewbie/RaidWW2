slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementBarrage then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementBarrage = slot0
function ElementBarrage:init(...)
	slot3 = self

	ElementBarrage.super.init(slot2, ...)

	return 
end
function ElementBarrage:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if not self._values.type or not self._values.operation then
		return 
	end

	if self._values.operation == "start" then
		local tweak_data = tweak_data.barrage[self._values.type]

		if not tweak_data then
			slot7 = self._values.type

			Application.error(slot4, Application, "[Barrage] Barrage tweak data doesn't exist for barrage type: ")

			return 
		end

		slot6 = tweak_data

		managers.barrage.start_barrage(slot4, managers.barrage)
	elseif self._values.operation == "stop" then
		slot4 = managers.barrage

		managers.barrage.stop_barrage(slot3)
	elseif self._values.operation == "set_spotter_type" then
		local tweak_data = tweak_data.barrage[self._values.type]

		if not tweak_data then
			slot7 = self._values.type

			Application.error(slot4, Application, "[Barrage] Barrage tweak data doesn't exist for barrage type: ")

			return 
		end

		slot6 = tweak_data

		managers.barrage.set_spotter_barrage_type(slot4, managers.barrage)
	else
		slot6 = self._values.operation

		Application.error(slot3, Application, "[Barrage] Barrage manager doesn't support operation: ")
	end

	slot5 = instigator

	ElementBarrage.super.on_executed(slot3, self)

	return 
end
function ElementBarrage:client_on_executed(...)
	slot3 = self

	ElementBarrage.super.on_executed(slot2)

	return 
end

return 
