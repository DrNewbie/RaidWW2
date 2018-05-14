-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementRope"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementRopeOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementRopeOperator = slot0
function ElementRopeOperator:init(...)
	slot3 = self

	ElementRopeOperator.super.init(slot2, ...)

	return 
end
function ElementRopeOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementRopeOperator:on_executed(instigator)
	if not self._values.enabled or not self._values.rope_unit_id then
		return 
	end

	slot7 = self._sync_id
	local rope_unit = managers.worldcollection.get_unit_with_id(slot3, managers.worldcollection, self._values.rope_unit_id, nil)

	if rope_unit then
		if self._values.operation == "attach" then
			slot6 = rope_unit

			self._attach_rope(slot4, self)
		elseif self._values.operation == "detach" then
			slot6 = rope_unit

			self._detach_rope(slot4, self)
		end
	end

	slot6 = instigator

	ElementRopeOperator.super.on_executed(slot4, self)

	return 
end
function ElementRopeOperator:_attach_rope(rope_unit)

	-- Decompilation error in this vicinity:
	local dragged_unit = rope_unit
	slot8 = "anim_rope_start"
	local steering_joint = rope_unit.get_object(slot4, Idstring(slot7))
	slot7 = "body_collision_start"
	local steering_body = rope_unit.body(rope_unit, rope_unit)
	slot9 = self._id
	local operator_unit = mission.get_element_by_id(slot7, mission)
	slot9 = steering_body

	steering_body.set_keyframed(mission)

	local target_position = operator_unit._values.position
	local target_rotation = operator_unit._values.rotation
	slot12 = target_position

	steering_body.set_position(slot10, steering_body)

	slot12 = target_rotation

	steering_body.set_rotation(slot10, steering_body)

	slot12 = target_position

	steering_joint.set_position(slot10, steering_joint)

	slot12 = target_rotation

	steering_joint.set_rotation(slot10, steering_joint)

	return 
end
function ElementRopeOperator:_detach_rope(rope_unit)
	local dragged_unit = rope_unit
	slot6 = "body_collision_start"
	local steering_body = rope_unit.body(slot4, rope_unit)
	slot6 = steering_body

	steering_body.set_dynamic(rope_unit)

	return 
end

if not ElementRopeTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementRopeTrigger = slot0
function ElementRopeTrigger:init(...)
	slot3 = self

	ElementRopeTrigger.super.init(slot2, ...)

	return 
end
function ElementRopeTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.outcome
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
function ElementRopeTrigger:client_on_executed(...)
	return 
end
function ElementRopeTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementRopeTrigger.super.on_executed(slot3, self)

	return 
end

return 
