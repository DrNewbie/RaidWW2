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

if not ElementEscort then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEscort = slot0
function ElementEscort:_get_next_point(mission, next_points)
	local valid_next_elements = {}
	slot6 = next_points

	for _, next_point in ipairs(slot5) do
		slot12 = next_point
		local next_element = mission.get_element_by_id(slot10, mission)

		if next_element then
			slot12 = next_element

			if next_element.enabled(slot11) then
				slot12 = next_element

				if next_element.can_be_used(slot11) then
					slot13 = next_element

					table.insert(slot11, valid_next_elements)
				end
			end
		end
	end

	slot6 = valid_next_elements

	return table.random(slot5)
end
function ElementEscort:increment_usage()
	slot4 = "usage_times"

	if self.value(slot2, self) == 0 then
		return 
	end

	self._used_times = (self._used_times or 0) + 1

	return 
end
function ElementEscort:can_be_used()

	-- Decompilation error in this vicinity:
	slot4 = "usage_times"

	if self.value(slot2, self) == 0 then
		return true
	end
end
function ElementEscort:start_escort_path(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.brain(slot3) then
			if next_element then

				-- Decompilation error in this vicinity:
				local points = {}
				slot9 = "position"
				points[1] = {
					position = self.value(slot7, self)
				}
				local last_element = nil

				while next_element do
					slot9 = {
						position = next_element.value(slot11, next_element)
					}
					slot13 = "position"

					table.insert(slot7, points)

					slot8 = next_element

					next_element.increment_usage(slot7)

					slot9 = "break_point"

					if next_element.value(slot7, next_element) then
						break
					end

					last_element = next_element
					slot9 = "next_points"

					if next_element.value(slot7, next_element) then
						slot9 = mission
						slot13 = "next_points"
						local next_element = self._get_next_point(slot7, self, next_element.value(slot11, next_element))
					end
				end

				if next_element then
					slot9 = "break_so"
					local break_so = next_element.value(slot7, next_element)
				end

				if break_so == "none" then
					break_so = nil
				end

				slot9 = unit
				slot9 = unit.brain(slot8)
				slot7 = unit.brain(slot8).set_objective
				slot10 = {
					path_style = "coarse",
					type = "escort",
					haste = "walk",
					path_data = {
						points = points
					},
					next_escort_point = next_element or last_element,
					break_so = break_so
				}

				if next_element or last_element then
					slot11 = next_element or last_element
					slot14 = "rotation"
					slot11 = slot11.value(slot12, slot11)
				end

				slot10.end_rot = slot11

				slot7(slot8, slot9)

				slot9 = unit

				if unit.escort(slot8) then
					slot9 = unit
					slot10 = true

					unit.escort(slot8).set_active(slot8, unit.escort(slot8))
				end
			else
				slot6 = unit
				slot7 = {
					type = "escort"
				}

				unit.brain(slot5).set_objective(slot5, unit.brain(slot5))

				slot6 = unit

				if unit.escort(slot5) then
					slot6 = unit
					slot7 = false

					unit.escort(slot5).set_active(slot5, unit.escort(slot5))
				end
			end
		end
	end

	return 
end
function ElementEscort:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot4 = self
	slot5 = "spawn_elements"
	local spawn_elements = self.value(slot3, self)

	if spawn_elements and 0 < #spawn_elements then
		slot5 = spawn_elements

		for _, spawn_id in ipairs(slot4) do
			slot11 = spawn_id
			local spawn_element = self.get_mission_element(slot9, self)
			slot13 = spawn_element

			for _, unit in ipairs(spawn_element.units(slot12)) do
				slot17 = unit

				self.start_escort_path(slot15, self)
			end
		end
	else
		slot6 = instigator

		self.start_escort_path(slot4, self)
	end

	slot6 = instigator

	ElementEscort.super.on_executed(slot4, self)

	return 
end

return 
