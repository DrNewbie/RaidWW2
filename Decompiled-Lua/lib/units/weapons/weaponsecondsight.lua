if not WeaponSecondSight then
	slot2 = WeaponGadgetBase
	slot0 = class(slot1)
end

WeaponSecondSight = slot0
WeaponSecondSight.GADGET_TYPE = "second_sight"
function WeaponSecondSight:init(unit)
	slot5 = unit

	WeaponSecondSight.super.init(slot3, self)

	return 
end
function WeaponSecondSight:_check_state(...)
	slot3 = self

	WeaponSecondSight.super._check_state(slot2, ...)

	return 
end
function WeaponSecondSight:toggle_requires_stance_update()
	return true
end
function WeaponSecondSight:destroy(unit)
	slot5 = unit

	WeaponSecondSight.super.destroy(slot3, self)

	return 
end

return 
