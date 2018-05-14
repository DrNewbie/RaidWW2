DialogCharExt = DialogCharExt or class()
function DialogCharExt:init(unit)
	self._unit = unit
	slot6 = self._unit

	managers.dialog.register_character(slot3, managers.dialog, self.character)

	return 
end

return 
