-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpotter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpotter = slot0
function ElementSpotter:init(...)
	slot3 = self

	ElementSpotter.super.init(slot2, ...)

	slot3 = self._values.rotation
	self._forward = self._values.rotation.y(slot2)
	self._enemy_contours = {}

	return 
end
function ElementSpotter:on_script_activated()
	if self._values.enabled then
		slot3 = self

		self.add_callback(slot2)
	end

	return 
end
function ElementSpotter:set_enabled(enabled)
	slot5 = enabled

	ElementSpotter.super.set_enabled(slot3, self)

	if enabled then
		slot4 = self

		self.add_callback(slot3)
	else
		slot4 = self

		self.remove_callback(slot3)
	end

	return 
end
function ElementSpotter:add_callback()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	if not self._callback then
		slot8 = "update_spotter"
		slot5 = 0.1
		self._callback = self._mission_script.add(slot2, self._mission_script, callback(slot5, self, self))
	end

	return 
end
function ElementSpotter:remove_callback()
	if self._callback then
		slot4 = self._callback

		self._mission_script.remove(slot2, self._mission_script)

		self._callback = nil
	end

	return 
end
function ElementSpotter:on_executed(instigator, ...)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementSpotter.super.on_executed(slot3, self, ...)

	return 
end
local mvec1 = Vector3()
function ElementSpotter:update_spotter()
	if not self._values.enabled then
		return 
	end

	if self._found_units then

		-- Decompilation error in this vicinity:
		slot4 = 1
		local unit = table.remove(slot2, self._found_units)
		self._found_units = (0 < #self._found_units and self._found_units) or nil
		slot4 = unit
		slot4 = managers.groupai
		slot4 = managers.groupai.state(slot3)

		if managers.groupai.state(slot3).whisper_mode(slot3) then
			slot5 = unit

			if not tweak_data.character[unit.base(slot4)._tweak_table].silent_priority_shout then
				slot5 = unit

				if not tweak_data.character[unit.base(slot4)._tweak_table].priority_shout then
					return 
				end
			end
		else
			slot5 = unit

			if not tweak_data.character[unit.base(slot4)._tweak_table].priority_shout then
				return 
			end
		end

		slot4 = mvec1
		slot7 = unit
		slot7 = unit.movement(slot6)

		mvector3.set(slot3, unit.movement(slot6).m_head_pos(slot6))

		slot5 = self._values.position

		mvector3.subtract(slot3, mvec1)

		slot4 = mvec1

		mvector3.normalize(slot3)

		slot5 = mvec1
		local angle = mvector3.angle(slot3, self._forward)

		if angle < 45 then
			slot9 = unit
			slot9 = unit.movement(slot8)
			slot15 = "world_geometry"
			slot13 = "report"
			local ray = World.raycast(slot4, World, "ray", unit.movement(slot8).m_head_pos(slot8), self._values.position, "ray_type", "ai_vision", "slot_mask", managers.slot.get_mask(slot13, managers.slot))

			if not ray then
				slot8 = false

				if managers.game_play_central.auto_highlight_enemy(slot5, managers.game_play_central, unit) then
					slot8 = "on_outlined"

					self.on_executed(slot5, self, unit)
				end

				slot8 = "on_spotted"

				self.on_executed(slot5, self, unit)
			end
		end
	else
		slot4 = "all"
		slot8 = "enemies"
		self._found_units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))
		self._found_units = (0 < #self._found_units and self._found_units) or nil
	end

	return 
end

return 
