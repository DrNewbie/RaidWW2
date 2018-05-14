-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAIArea then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAIArea = slot0
function ElementAIArea:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot4 = self._values.nav_segs

	if next(slot3) then
		local nav_segs = {}
		slot5 = self._values.nav_segs

		for _, segment_id in pairs(slot4) do
			slot12 = segment_id
			local unique_id = managers.navigation.get_segment_unique_id(slot9, managers.navigation, self._sync_id or 0)
			slot12 = unique_id

			table.insert(managers.navigation, nav_segs)
		end

		local area_id = managers.worldcollection.get_next_navstitcher_id(slot4)
		slot6 = managers.groupai
		slot9 = self._values.position

		managers.groupai.state(managers.worldcollection).add_area(managers.worldcollection, managers.groupai.state(managers.worldcollection), area_id, nav_segs)
	end

	self._values.nav_segs = nil
	self._values.position = nil
	slot4 = self._values
	self._values = clone(nil)
	slot5 = instigator

	ElementAIArea.super.on_executed(nil, self)

	return 
end

return 
