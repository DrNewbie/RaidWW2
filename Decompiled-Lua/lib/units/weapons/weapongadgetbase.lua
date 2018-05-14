if not WeaponGadgetBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

WeaponGadgetBase = slot0
WeaponGadgetBase.GADGET_TYPE = ""
function WeaponGadgetBase:init(unit)
	slot5 = unit

	WeaponGadgetBase.super.init(slot3, self)

	self._on = false

	return 
end
function WeaponGadgetBase:set_npc()
	return 
end
function WeaponGadgetBase:set_state(on, sound_source)
	slot5 = self

	if not self.is_bipod(slot4) then
		if self._on ~= on and sound_source and (self._on_event or self._off_event) then
			slot6 = (on and self._on_event) or self._off_event

			sound_source.post_event(slot4, sound_source)
		end

		self._on = on
	end

	slot5 = self

	self._check_state(slot4)

	return 
end
function WeaponGadgetBase:is_usable()
	return true
end
function WeaponGadgetBase:set_on()
	self._on = true
	slot3 = self

	self._check_state(slot2)

	return 
end
function WeaponGadgetBase:set_off()
	self._on = false
	slot3 = self

	self._check_state(slot2)

	return 
end
function WeaponGadgetBase:toggle()
	self._on = not self._on
	slot3 = self

	self._check_state(slot2)

	return 
end
function WeaponGadgetBase:is_on()
	return self._on
end
function WeaponGadgetBase:toggle_requires_stance_update()
	return false
end
function WeaponGadgetBase:_check_state()
	return 
end
function WeaponGadgetBase:is_bipod()
	return false
end
function WeaponGadgetBase:destroy(unit)
	slot5 = unit

	WeaponGadgetBase.super.pre_destroy(slot3, self)

	return 
end

return 
