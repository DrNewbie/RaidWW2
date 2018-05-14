if not WeaponSimpleAnim then
	slot2 = WeaponGadgetBase
	slot0 = class(slot1)
end

WeaponSimpleAnim = slot0
WeaponSimpleAnim.GADGET_TYPE = "simple_anim"
function WeaponSimpleAnim:init(unit)
	slot5 = unit

	WeaponSimpleAnim.super.init(slot3, self)

	self._on_event = "wp_gl40_sight_on"
	self._off_event = "wp_gl40_sight_off"
	self._anim_state = self._on

	if self.anim then
		slot4 = self.anim
		self._anim = Idstring(slot3)
	end

	return 
end
function WeaponSimpleAnim:_check_state(...)
	slot3 = self

	WeaponSimpleAnim.super._check_state(slot2, ...)

	if self._anim_state ~= self._on then
		self._anim_state = self._on
		slot3 = self

		self.play_anim(slot2)
	end

	return 
end
function WeaponSimpleAnim:play_anim()
	if not self._anim then
		return 
	end

	slot4 = self._anim
	local length = self._unit.anim_length(slot2, self._unit)
	local speed = (self._anim_state and 1) or -1
	slot8 = speed

	self._unit.anim_play_to(slot4, self._unit, self._anim, (self._anim_state and length) or 0)

	return 
end
function WeaponSimpleAnim:toggle_requires_stance_update()
	return true
end
function WeaponSimpleAnim:destroy(unit)
	slot5 = unit

	WeaponSimpleAnim.super.destroy(slot3, self)

	return 
end

return 
