slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementCharacterDamage then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCharacterDamage = slot0
function ElementCharacterDamage:init(...)
	slot3 = self

	ElementCharacterDamage.super.init(slot2, ...)

	self._units = {}
	slot4 = "damage_types"
	local dmg_filter = self.value(slot2, self)

	if dmg_filter and dmg_filter ~= "" then
		self._allow_damage_types = {}
		slot5 = " "
		local dmgs = string.split(slot3, dmg_filter)
		slot5 = dmgs

		for _, dmg_type in ipairs(dmg_filter) do
			slot11 = dmg_type

			table.insert(slot9, self._allow_damage_types)
		end
	end

	return 
end
function ElementCharacterDamage:destroy()
	return 
end
function ElementCharacterDamage:on_created()
	return 
end
function ElementCharacterDamage:on_script_activated()
	slot6 = "elements"

	for _, id in ipairs(self.value(slot4, self)) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)

		if element.add_event_callback then
			slot10 = "spawn"
			slot15 = "unit_spawned"

			element.add_event_callback(slot8, element, callback(slot12, self, self))
		end
	end

	return 
end
function ElementCharacterDamage:unit_spawned(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.character_damage(slot3) then
			slot4 = unit
			slot10 = unit
			slot6 = nil
			slot11 = "clbk_linked_unit_took_damage"

			unit.character_damage(slot3).add_listener(slot3, unit.character_damage(slot3), "character_damage_" .. tostring(unit.key(slot9)), callback(unit.key, self, self))
		end
	end

	return 
end
function ElementCharacterDamage:clbk_linked_unit_took_damage(unit, damage_info)
	slot5 = unit

	if not alive(slot4) then
		return 
	end

	local damage = damage_info.damage
	slot7 = "percentage"

	if self.value(slot5, self) then
		slot6 = unit
		damage = damage / unit.character_damage(slot5)._HEALTH_INIT * 100
	end

	slot9 = damage_info.variant

	self.on_executed(slot5, self, damage_info.attacker_unit, damage)

	return 
end
function ElementCharacterDamage:on_executed(instigator, damage, damage_type)
	if not self._values.enabled then
		return 
	end

	local allow = true

	if self._allow_damage_types then
		slot8 = damage_type

		if not table.contains(slot6, self._allow_damage_types) then
			allow = false
		end
	end

	if allow then
		slot7 = damage * tweak_data.gui.stats_present_multiplier
		damage = math.floor(slot6)
		slot10 = damage

		self.override_value_on_element_type(slot6, self, "ElementCounterOperator", "amount")

		slot8 = instigator

		ElementCharacterDamage.super.on_executed(slot6, self)
	end

	return 
end
function ElementCharacterDamage:save(data)
	data.enabled = self._values.enabled

	return 
end
function ElementCharacterDamage:load(data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end

return 
