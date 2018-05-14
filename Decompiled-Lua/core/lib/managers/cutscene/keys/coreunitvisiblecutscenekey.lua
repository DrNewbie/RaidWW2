slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreUnitVisibleCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreUnitVisibleCutsceneKey = slot0
CoreUnitVisibleCutsceneKey.ELEMENT_NAME = "unit_visible"
CoreUnitVisibleCutsceneKey.NAME = "Unit Visibility"
slot4 = ""

CoreUnitVisibleCutsceneKey.register_serialized_attribute("Unit Visibility", CoreUnitVisibleCutsceneKey, "unit_name")

slot5 = toboolean

CoreUnitVisibleCutsceneKey.register_serialized_attribute("Unit Visibility", CoreUnitVisibleCutsceneKey, "visible", true)

function CoreUnitVisibleCutsceneKey:__tostring()
	slot3 = self
	slot5 = self

	return ((self.visible(slot2) and "Show") or "Hide") .. " \"" .. self.unit_name(slot4) .. "\"."
end
function CoreUnitVisibleCutsceneKey:unload()
	if self._cast then
		slot5 = true

		self.play(slot2, self, nil)
	end

	return 
end
function CoreUnitVisibleCutsceneKey:play(player, undo, fast_forward)
	slot8 = self.evaluate
	slot7 = "Cutscene key must define the \"evaluate\" method to use the default CoreCutsceneKeyBase:play method."

	assert(slot5, type(slot7) == "function")

	if undo then
		slot7 = {
			unit_name = self.unit_name(slot9)
		}
		slot10 = self
		local preceeding_key = self.preceeding_key(slot5, self)

		if preceeding_key then
			slot9 = false

			preceeding_key.evaluate(slot6, preceeding_key, player)
		else
			slot10 = true

			self.evaluate(slot6, self, player, false)
		end
	else
		slot8 = fast_forward

		self.evaluate(slot5, self, player)
	end

	return 
end
function CoreUnitVisibleCutsceneKey:evaluate(player, fast_forward, visible)
	slot6 = self._cast

	assert(slot5)

	if not visible then
		slot6 = self
		visible = self.visible(slot5)
	end

	slot6 = self._cast
	slot9 = self
	local cast_member = self._cast.unit(slot5, self.unit_name(slot8))

	if cast_member then
		slot10 = self
		slot9 = visible

		self._cast.set_unit_visible(slot6, self._cast, self.unit_name(slot9))
	else
		slot10 = self
		slot9 = true
		local unit_in_world = self._unit(slot6, self, self.unit_name(slot9))

		if unit_in_world then
			slot9 = visible

			set_unit_and_children_visible(slot7, unit_in_world)
		end
	end

	return 
end

return 
