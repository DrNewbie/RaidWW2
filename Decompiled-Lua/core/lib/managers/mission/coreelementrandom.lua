slot3 = "CoreElementRandom"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

if not ElementRandom then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementRandom = slot0
function ElementRandom:init(...)
	slot3 = self

	ElementRandom.super.init(slot2, ...)

	slot3 = self._values.on_executed
	self._original_on_executed = CoreTable.clone(slot2)

	return 
end
function ElementRandom:client_on_executed(...)
	return 
end
function ElementRandom:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	self._unused_randoms = {}
	slot4 = self._original_on_executed

	for i, element_data in ipairs(slot3) do
		if self._values.ignore_disabled and self._values.ignore_disabled then
			slot10 = element_data.id
			slot9 = self.get_mission_element(slot8, self)

			if self.get_mission_element(slot8, self).enabled(slot8) then
				slot10 = i

				table.insert(slot8, self._unused_randoms)
			end
		end
	end

	self._values.on_executed = {}
	slot4 = self
	local amount = self._calc_amount()

	if self._values.counter_id then
		slot6 = self._values.counter_id
		local element = self.get_mission_element(slot4, self)
		slot6 = element
		amount = element.counter_value(self)
	end

	slot7 = #self._original_on_executed

	for i = 1, math.min(slot5, amount), 1 do
		slot13 = self
		slot10 = self._original_on_executed[self._get_random_elements(slot12)]

		table.insert(slot8, self._values.on_executed)
	end

	slot6 = instigator

	ElementRandom.super.on_executed(slot4, self)

	return 
end
function ElementRandom:_calc_amount()
	local amount = self._values.amount or 1

	if self._values.amount_random and 0 < self._values.amount_random then
		slot4 = self._values.amount_random + 1
		amount = (amount + math.random(slot3)) - 1
	end

	return amount
end
function ElementRandom:_get_random_elements()
	local t = {}
	local rand = math.random(slot3)
	slot6 = rand

	return table.remove(#self._unused_randoms, self._unused_randoms)
end

return 
