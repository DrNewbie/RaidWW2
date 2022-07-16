DoctorBagSimpleBaseInteractionExt = DoctorBagSimpleBaseInteractionExt or class(DoctorBagBaseInteractionExt)

function DoctorBagSimpleBaseInteractionExt:_interact_blocked(player)
	local is_berserker = player:character_damage():is_berserker()
	return is_berserker, false, is_berserker and "hint_health_berserking" or false
end