if not TeamAISound then
	slot2 = PlayerSound
	slot0 = class(slot1)
end

TeamAISound = slot0
function TeamAISound:init(unit)
	self._unit = unit
	slot4 = unit
	slot4 = unit.base(slot3)

	unit.base(slot3).post_init(slot3)

	local ss = unit.sound_source(slot3)
	slot10 = unit
	slot7 = tweak_data.character[unit.base(slot9)._tweak_table].speech_prefix

	ss.set_switch(unit, ss, "robber")

	slot7 = "third"

	ss.set_switch(unit, ss, "int_ext")

	return 
end
function TeamAISound:set_voice(voice)
	local ss = self._unit.sound_source(slot3)
	slot7 = voice

	ss.set_switch(self._unit, ss, "robber")

	slot7 = "third"

	ss.set_switch(self._unit, ss, "int_ext")

	return 
end

return 
