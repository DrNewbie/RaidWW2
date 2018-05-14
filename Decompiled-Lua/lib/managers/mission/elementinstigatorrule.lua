slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementInstigatorRule then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstigatorRule = slot0
function ElementInstigatorRule:init(...)
	slot3 = self

	ElementInstigatorRule.super.init(slot2, ...)

	slot3 = self._values.rules

	for instigator_type, rules in pairs(slot2) do
		slot8 = rules

		for rule, data in pairs(slot7) do
			local restructured_data = {}
			slot14 = data

			for _, value in ipairs(slot13) do
				if rule == "enemy_names" or rule == "civilian_names" then
					slot19 = value
					slot19 = Idstring(slot18)
					restructured_data[Idstring(slot18).key(slot18)] = true
				else
					restructured_data[value] = true
				end
			end

			rules[rule] = restructured_data
		end
	end

	return 
end
function ElementInstigatorRule:on_script_activated(...)
	slot3 = self

	ElementInstigatorRule.super.on_script_activated(slot2, ...)

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementInstigatorRule:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementInstigatorRule:check_rules(instigator_type, instigator)
	if not self._values.enabled then
		return true
	end

	local rules = self._values.rules[instigator_type]

	if not rules then
		return true
	end

	slot6 = rules

	if not next(slot5) then
		return true
	end

	local check_result = true

	if instigator_type == "player" then
		slot9 = instigator
		check_result = self._check_player_rules(slot6, self, rules)
	elseif instigator_type == "enemies" then
		slot9 = instigator
		check_result = self._check_enemies_rules(slot6, self, rules)
	elseif instigator_type == "civilians" then
		slot9 = instigator
		check_result = self._check_civilians_rules(slot6, self, rules)
	elseif instigator_type == "loot" then
		slot9 = instigator
		check_result = self._check_loot_rules(slot6, self, rules)
	end

	if self._values.invert then
		check_result = not check_result
	end

	return check_result
end
function ElementInstigatorRule:_check_player_rules(rules, instigator)
	slot5 = rules

	for rule, data in pairs(slot4) do
		if rule == "carry_ids" then
			slot10 = managers.player
			local current_carry_id = managers.player.current_carry_id(slot9)

			if not data[current_carry_id] then
				return false
			end
		end

		if rule == "states" then
			slot10 = managers.player
			local current_state = managers.player.current_state(slot9)

			if not data[current_state] then
				return false
			end
		end

		if rule == "mission_equipment" then
			slot10 = data

			for value, _ in pairs(slot9) do
				slot16 = value

				if not managers.player.has_special_equipment(slot14, managers.player) then
					return false
				end
			end
		end
	end

	return true
end
function ElementInstigatorRule:_check_enemies_rules(rules, instigator)
	slot5 = rules

	for rule, data in pairs(slot4) do
		if rule == "enemy_names" then
			slot10 = instigator
			slot10 = instigator.name(slot9)

			if not data[instigator.name(slot9).key(slot9)] then
				return false
			end
		end

		if rule == "pickup" then
			slot10 = instigator
			slot10 = instigator.character_damage(slot9)

			if not data[instigator.character_damage(slot9).pickup(slot9)] then
				return false
			end
		end
	end

	return true
end
function ElementInstigatorRule:_check_civilians_rules(rules, instigator)
	slot5 = rules

	for rule, data in pairs(slot4) do
		if rule == "civilian_names" then
			slot10 = instigator
			slot10 = instigator.name(slot9)

			if not data[instigator.name(slot9).key(slot9)] then
				return false
			end
		end

		if rule == "pickup" then
			slot10 = instigator
			slot10 = instigator.character_damage(slot9)

			if not data[instigator.character_damage(slot9).pickup(slot9)] then
				return false
			end
		end
	end

	return true
end
function ElementInstigatorRule:_check_loot_rules(rules, instigator)
	slot5 = rules

	for rule, data in pairs(slot4) do
		if rule == "carry_ids" then
			slot10 = instigator
			slot10 = instigator.carry_data(slot9)

			if not data[instigator.carry_data(slot9).carry_id(slot9)] then
				return false
			end
		end
	end

	return true
end
function ElementInstigatorRule:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementInstigatorRule.super.on_executed(slot3, self)

	return 
end

return 
