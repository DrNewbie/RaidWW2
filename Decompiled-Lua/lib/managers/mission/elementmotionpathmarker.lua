-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMotionpathMarker then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMotionpathMarker = slot0
function ElementMotionpathMarker:init(...)
	slot3 = self

	ElementMotionpathMarker.super.init(slot2, ...)

	self._network_execute = true

	if self._values.icon == "guis/textures/VehicleMarker" then
		self._values.icon = "wp_standard"
	end

	return 
end
function ElementMotionpathMarker:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementMotionpathMarker:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementMotionpathMarker:on_executed(instigator)
	slot5 = instigator

	ElementMotionpathMarker.super.on_executed(slot3, self)

	return 
end
function ElementMotionpathMarker:operation_remove()
	return 
end
function ElementMotionpathMarker:save(data)
	data.enabled = self._values.enabled
	data.motion_state = self._values.motion_state

	return 
end
function ElementMotionpathMarker:load(data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	self._values.motion_state = data.motion_state

	return 
end
function ElementMotionpathMarker:add_trigger(trigger_id, outcome, callback)
	slot12 = callback

	motion_path.add_trigger(slot6, motion_path, self._id, self._values.path_id, trigger_id, outcome)

	return 
end
function ElementMotionpathMarker:motion_operation_goto_marker(checkpoint_marker_id, goto_marker_id)
	slot8 = goto_marker_id

	motion_path.operation_goto_marker(slot5, motion_path, checkpoint_marker_id)

	return 
end
function ElementMotionpathMarker:motion_operation_teleport_to_marker(checkpoint_marker_id, teleport_to_marker_id)
	slot8 = teleport_to_marker_id

	motion_path.operation_teleport_to_marker(slot5, motion_path, checkpoint_marker_id)

	return 
end
function ElementMotionpathMarker:motion_operation_set_motion_state(state)
	self._values.motion_state = state

	return 
end
function ElementMotionpathMarker:motion_operation_set_rotation(operator_id)
	slot7 = operator_id

	motion_path.operation_set_unit_target_rotation(slot4, motion_path, self._id)

	return 
end

return 
