slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSimpleAnimationCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSimpleAnimationCutsceneKey = slot0
CoreSimpleAnimationCutsceneKey.ELEMENT_NAME = "simple_animation"
CoreSimpleAnimationCutsceneKey.NAME = "Simple Animation"
slot4 = ""

CoreSimpleAnimationCutsceneKey.register_serialized_attribute("Simple Animation", CoreSimpleAnimationCutsceneKey, "unit_name")

slot4 = ""

CoreSimpleAnimationCutsceneKey.register_serialized_attribute("Simple Animation", CoreSimpleAnimationCutsceneKey, "group")

slot4 = "group"

CoreSimpleAnimationCutsceneKey.attribute_affects("Simple Animation", CoreSimpleAnimationCutsceneKey, "unit_name")

CoreSimpleAnimationCutsceneKey.control_for_group = CoreCutsceneKeyBase.standard_combo_box_control
function CoreSimpleAnimationCutsceneKey:__tostring()
	slot4 = self
	slot6 = self

	return "Trigger simple animation \"" .. self.group(slot3) .. "\" on \"" .. self.unit_name(slot5) .. "\"."
end
function CoreSimpleAnimationCutsceneKey:skip(player)
	slot7 = self
	local unit = self._unit(slot3, self.unit_name(slot6))
	local group = self.group(self)
	slot8 = 0

	unit.anim_play(self, unit, group)

	slot7 = group
	slot11 = group

	unit.anim_set_time(self, unit, unit.anim_length(slot9, unit))

	return 
end
function CoreSimpleAnimationCutsceneKey:evaluate(player, fast_forward)
	slot5 = self
	slot8 = self
	slot8 = self
	slot7 = 0

	self._unit(slot4, self.unit_name(slot7)).anim_play(slot4, self._unit(slot4, self.unit_name(slot7)), self.group(slot7))

	return 
end
function CoreSimpleAnimationCutsceneKey:revert(player)
	slot7 = self
	local unit = self._unit(slot3, self.unit_name(slot6))
	local group = self.group(self)
	slot7 = group

	if unit.anim_is_playing(self, unit) then
		slot8 = 0

		unit.anim_set_time(slot5, unit, group)

		slot7 = group

		unit.anim_stop(slot5, unit)
	end

	return 
end
function CoreSimpleAnimationCutsceneKey:update(player, time)
	slot5 = self
	slot8 = self
	slot8 = self
	slot7 = time

	self._unit(slot4, self.unit_name(slot7)).anim_set_time(slot4, self._unit(slot4, self.unit_name(slot7)), self.group(slot7))

	return 
end
function CoreSimpleAnimationCutsceneKey:is_valid_unit_name(unit_name)
	slot5 = unit_name

	if self.super.is_valid_unit_name(slot3, self) then
		slot5 = unit_name

		return 0 < #self._unit_animation_groups(slot3, self)
	end
end
function CoreSimpleAnimationCutsceneKey:is_valid_group(group)
	slot6 = self
	slot9 = self
	slot5 = group

	return table.contains(slot3, self._unit_animation_groups(slot5, self.unit_name(slot8)))
end
function CoreSimpleAnimationCutsceneKey:refresh_control_for_group(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot7 = self
	local groups = self._unit_animation_groups(slot3, self.unit_name(slot6))
	slot5 = groups

	if not table.empty(self) then
		slot6 = true

		control.set_enabled(slot4, control)

		local value = self.group(slot4)
		slot6 = groups

		for _, group in ipairs(self) do
			slot12 = group

			control.append(slot10, control)

			if group == value then
				slot12 = group

				control.set_value(slot10, control)
			end
		end
	else
		slot6 = false

		control.set_enabled(slot4, control)
	end

	slot5 = control

	control.thaw(slot4)

	return 
end

return 
