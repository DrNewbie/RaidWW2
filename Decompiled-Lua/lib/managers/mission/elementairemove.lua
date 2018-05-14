slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAIRemove then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAIRemove = slot0
function ElementAIRemove:init(...)
	slot3 = self

	ElementAIRemove.super.init(slot2, ...)

	return 
end
function ElementAIRemove:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.use_instigator then
		if self._values.true_death then
			slot4 = instigator
			slot5 = {
				damage = 1000,
				col_ray = {},
				drop_loot = self._values.drop_loot
			}

			instigator.character_damage(slot3).damage_mission(slot3, instigator.character_damage(slot3))
		else
			slot4 = instigator
			slot5 = false

			instigator.brain(slot3).set_active(slot3, instigator.brain(slot3))

			slot4 = instigator
			slot6 = 0

			instigator.base(slot3).set_slot(slot3, instigator.base(slot3), instigator)
		end
	else
		slot4 = self._values.elements

		for _, id in ipairs(slot3) do
			slot10 = id
			local element = self.get_mission_element(slot8, self)

			if self._values.true_death then
				slot10 = element

				element.kill_all_units(slot9)
			else
				slot10 = element

				element.unspawn_all_units(slot9)
			end
		end
	end

	slot5 = instigator

	ElementAIRemove.super.on_executed(slot3, self)

	return 
end

return 
