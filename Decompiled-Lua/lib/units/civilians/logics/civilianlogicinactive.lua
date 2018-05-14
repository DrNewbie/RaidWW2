-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/logics/CopLogicInactive"

require(slot1)

slot2 = CopLogicInactive
CivilianLogicInactive = class(slot1)
function CivilianLogicInactive.on_enemy_weapons_hot(data)
	slot3 = data.unit
	slot4 = nil

	data.unit.brain(slot2).set_attention_settings(slot2, data.unit.brain(slot2))

	return 
end
function CivilianLogicInactive._register_attention(data, my_data)
	slot4 = data.unit
	slot4 = data.unit.character_damage(slot3)

	if data.unit.character_damage(slot3).dead(slot3) then
		slot4 = managers.groupai
		slot4 = managers.groupai.state(slot3)
	else
		slot4 = data.unit
		slot5 = nil

		data.unit.brain(slot3).set_attention_settings(slot3, data.unit.brain(slot3))
	end

	return 
end
function CivilianLogicInactive._set_interaction(data, my_data)
	slot4 = data.unit
	slot4 = data.unit.character_damage(slot3)

	if data.unit.character_damage(slot3).dead(slot3) then
		slot4 = managers.groupai
		slot4 = managers.groupai.state(slot3)

		if not managers.groupai.state(slot3).whisper_mode(slot3) then
			slot4 = data.unit
			slot5 = "corpse_dispose"

			data.unit.interaction(slot3).set_tweak_data(slot3, data.unit.interaction(slot3))

			slot4 = data.unit
			slot7 = true

			data.unit.interaction(slot3).set_active(slot3, data.unit.interaction(slot3), true, true)
		end
	end

	return 
end

return 
