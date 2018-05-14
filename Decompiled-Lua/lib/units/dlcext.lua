DLCExt = DLCExt or class()
function DLCExt:init(unit)
	self._unit = unit
	slot4 = Network

	if Network.is_server(slot3) and self._sequence_dlc then
		slot5 = self._sequence_dlc

		if managers.dlc.is_dlc_unlocked(slot3, managers.dlc) then
			slot4 = unit

			if unit.damage(slot3) then
				slot4 = unit
				slot5 = self._sequence_name

				if unit.damage(slot3).has_sequence(slot3, unit.damage(slot3)) then
					slot4 = unit
					slot5 = self._sequence_name

					unit.damage(slot3).run_sequence_simple(slot3, unit.damage(slot3))
				end
			end
		end
	end

	return 
end

return 
