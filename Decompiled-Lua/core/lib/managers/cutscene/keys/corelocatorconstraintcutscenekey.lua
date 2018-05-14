slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreLocatorConstraintCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreLocatorConstraintCutsceneKey = slot0
CoreLocatorConstraintCutsceneKey.ELEMENT_NAME = "locator_constraint"
CoreLocatorConstraintCutsceneKey.NAME = "Locator Constraint"
slot4 = ""

CoreLocatorConstraintCutsceneKey.register_serialized_attribute("Locator Constraint", CoreLocatorConstraintCutsceneKey, "locator_name")

slot4 = ""

CoreLocatorConstraintCutsceneKey.register_serialized_attribute("Locator Constraint", CoreLocatorConstraintCutsceneKey, "parent_unit_name")

slot4 = ""

CoreLocatorConstraintCutsceneKey.register_serialized_attribute("Locator Constraint", CoreLocatorConstraintCutsceneKey, "parent_object_name")

CoreLocatorConstraintCutsceneKey.control_for_locator_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreLocatorConstraintCutsceneKey.control_for_parent_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreLocatorConstraintCutsceneKey.control_for_parent_object_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreLocatorConstraintCutsceneKey:__tostring()
	local attach_point_name = "disabled"
	slot4 = self

	if self.parent_unit_name(slot3) ~= "" then
		slot4 = self

		if self.parent_object_name(slot3) ~= "" then
			slot5 = self.parent_unit_name(slot6)
			slot8 = self
			attach_point_name = string.format(slot3, "\"%s/%s\"", self.parent_object_name(self))
		end
	end

	slot7 = self
	slot6 = attach_point_name

	return string.format(slot3, "Set constaint of locator \"%s\" to %s.", self.locator_name(slot6))
end
function CoreLocatorConstraintCutsceneKey:can_evaluate_with_player(player)
	return self._cast ~= nil
end
function CoreLocatorConstraintCutsceneKey:evaluate(player, fast_forward)
	slot9 = self
	slot8 = true
	local parent_object = self._unit_object(slot4, self, self.parent_unit_name(slot7), self.parent_object_name(self))
	slot7 = parent_object

	self._constrain_locator_to_object(self, self)

	return 
end
function CoreLocatorConstraintCutsceneKey:revert(player)
	slot5 = {
		locator_name = self.locator_name(slot7)
	}
	slot8 = self
	local preceeding_key = self.preceeding_key(slot3, self)

	if preceeding_key then
		slot7 = false

		preceeding_key.evaluate(slot4, preceeding_key, player)
	else
		slot6 = nil

		self._constrain_locator_to_object(slot4, self)
	end

	return 
end
function CoreLocatorConstraintCutsceneKey:update_gui(time, delta_time, player)
	slot9 = self
	slot9 = true
	local locator_object = self._unit_object(slot5, self, self.locator_name(slot8), "locator")

	if locator_object then
		local pen = Draw.pen(slot6)
		slot9 = "no_z"

		pen.set(Draw, pen)

		slot8 = pen
		slot13 = 0

		pen.set(Draw, Color(slot10, 1, 0.5))

		slot11 = locator_object
		slot12 = 1

		pen.sphere(Draw, pen, locator_object.position(slot10), 1, 5)

		slot12 = self
		slot11 = true
		local parent_object = self._unit_object(Draw, self, self.parent_unit_name(1), self.parent_object_name(self))

		if parent_object then
			slot9 = pen
			slot14 = 1

			pen.set(slot8, Color(slot11, 1, 0))

			slot10 = locator_object.position(slot11)
			slot13 = parent_object

			pen.line(slot8, pen, parent_object.position(locator_object))

			slot13 = parent_object
			slot11 = parent_object.rotation(parent_object)
			slot12 = 10

			pen.rotation(slot8, pen, parent_object.position(parent_object.position), slot11)

			slot9 = pen
			slot14 = 1

			pen.set(slot8, Color(slot11, 0, 1))

			slot12 = parent_object
			slot13 = 1

			pen.sphere(slot8, pen, parent_object.position(slot11), 1, 10)
		end
	end

	return 
end
function CoreLocatorConstraintCutsceneKey:is_valid_locator_name(locator_name)
	slot5 = "locator"

	if string.begins(slot3, locator_name) then
		slot5 = locator_name

		return self._unit_type(slot3, self) == "locator"
	end
end
function CoreLocatorConstraintCutsceneKey:is_valid_parent_unit_name(unit_name)
	if unit_name ~= nil and unit_name ~= "" then
		slot5 = unit_name
		slot2 = CoreCutsceneKeyBase.is_valid_unit_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_unit_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
function CoreLocatorConstraintCutsceneKey:is_valid_parent_object_name(object_name)
	if object_name ~= nil and object_name ~= "" then
		slot5 = object_name
		slot8 = self
		slot2 = CoreCutsceneKeyBase.is_valid_object_name(slot3, self, self.parent_unit_name(slot7))

		if CoreCutsceneKeyBase.is_valid_object_name(slot3, self, self.parent_unit_name(slot7)) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
function CoreLocatorConstraintCutsceneKey:refresh_control_for_locator_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot6 = self

	function slot5(unit_name)
		slot4 = unit_name

		return self.is_valid_locator_name(slot2, self)
	end

	local locator_names = table.find_all_values(slot3, self._unit_names(slot5))
	slot5 = locator_names

	for _, locator_name in ipairs(self._unit_names(slot5)) do
		slot11 = locator_name

		control.append(slot9, control)
	end

	slot8 = locator_names
	slot6 = not table.empty(slot7)

	control.set_enabled(slot4, control)

	slot6 = ""

	control.append(slot4, control)

	slot5 = control
	slot8 = self

	control.set_value(slot4, self.locator_name(slot7))

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreLocatorConstraintCutsceneKey:refresh_control_for_parent_unit_name(control)
	slot5 = control
	slot8 = self

	CoreCutsceneKeyBase.refresh_control_for_unit_name(slot3, self, self.parent_unit_name(slot7))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.parent_unit_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
function CoreLocatorConstraintCutsceneKey:refresh_control_for_parent_object_name(control)
	slot6 = self.parent_unit_name(slot7)
	slot9 = self

	CoreCutsceneKeyBase.refresh_control_for_object_name(slot3, self, control, self.parent_object_name(self))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.parent_object_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
function CoreLocatorConstraintCutsceneKey:on_attribute_before_changed(attribute_name, value, previous_value)
	slot7 = nil

	self.revert(slot5, self)

	return 
end
function CoreLocatorConstraintCutsceneKey:on_attribute_changed(attribute_name, value, previous_value)
	slot7 = nil

	self.evaluate(slot5, self)

	return 
end
function CoreLocatorConstraintCutsceneKey:_constrain_locator_to_object(parent_object)
	slot7 = self
	slot6 = true
	local locator_unit = self._unit(slot3, self, self.locator_name(slot6))

	if locator_unit == nil then
		return 
	end

	if parent_object then
		slot6 = false

		locator_unit.set_animations_enabled(slot4, locator_unit)

		slot6 = "locator"
		local locator_object = locator_unit.get_object(slot4, locator_unit)
		local position = locator_object.position(locator_unit)
		local rotation = locator_object.rotation(locator_object)
		local parent_unit = self._unit(locator_object, self.parent_unit_name(slot10))
		slot9 = locator_object
		slot14 = 0

		locator_object.set_local_position(self, Vector3(self, 0, 0))

		slot9 = locator_object

		locator_object.set_local_rotation(self, Rotation())

		slot10 = parent_object

		locator_object.link(self, locator_object)

		slot10 = position

		locator_object.set_position(self, locator_object)

		slot10 = rotation

		locator_object.set_rotation(self, locator_object)

		slot10 = locator_unit

		parent_unit.link(self, parent_unit)
	else
		slot6 = "locator"
		local locator_object = locator_unit.get_object(slot4, locator_unit)
		slot6 = locator_object

		locator_object.unlink(locator_unit)

		slot6 = locator_unit

		locator_unit.unlink(locator_unit)

		slot7 = true

		locator_unit.set_animations_enabled(locator_unit, locator_unit)
	end

	return 
end

return 
