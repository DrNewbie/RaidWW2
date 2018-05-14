-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreObjectVisibleCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreObjectVisibleCutsceneKey = slot0
CoreObjectVisibleCutsceneKey.ELEMENT_NAME = "object_visible"
CoreObjectVisibleCutsceneKey.NAME = "Object Visibility"
slot4 = ""

CoreObjectVisibleCutsceneKey.register_serialized_attribute("Object Visibility", CoreObjectVisibleCutsceneKey, "unit_name")

slot4 = ""

CoreObjectVisibleCutsceneKey.register_serialized_attribute("Object Visibility", CoreObjectVisibleCutsceneKey, "object_name")

slot5 = toboolean

CoreObjectVisibleCutsceneKey.register_serialized_attribute("Object Visibility", CoreObjectVisibleCutsceneKey, "visible", true)

function CoreObjectVisibleCutsceneKey:__tostring()
	slot3 = self
	slot5 = self
	slot7 = self

	return ((self.visible(slot2) and "Show") or "Hide") .. " \"" .. self.object_name(slot4) .. "\" in \"" .. self.unit_name(slot6) .. "\"."
end
function CoreObjectVisibleCutsceneKey:unload(player)
	if player and self._cast then
		slot6 = true

		self.play(slot3, self, player)
	end

	return 
end
function CoreObjectVisibleCutsceneKey:skip(player)
	if self._cast then
		slot5 = player

		self.play(slot3, self)
	end

	return 
end
function CoreObjectVisibleCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot7 = {
			unit_name = self.unit_name(slot9),
			object_name = self.object_name(slot9)
		}
		slot10 = self
		slot10 = self
		local preceeding_key = self.preceeding_key(slot5, self)

		if preceeding_key then
			slot9 = false

			preceeding_key.evaluate(slot6, preceeding_key, player)
		else
			slot9 = false
			slot13 = self.unit_name(slot14)
			slot16 = self

			self.evaluate(slot6, self, player, self._unit_initial_object_visibility(slot11, self, self.object_name(self)))
		end
	else
		slot8 = fast_forward

		self.evaluate(slot5, self, player)
	end

	return 
end
function CoreObjectVisibleCutsceneKey:evaluate(player, fast_forward, visible)

	-- Decompilation error in this vicinity:
	slot6 = self._cast

	assert(slot5)

	slot7 = self.unit_name(slot8)
	slot10 = self
	local object = self._unit_object(slot5, self, self.object_name(self))
	slot7 = object
	slot5 = object.set_visibility
end
function CoreObjectVisibleCutsceneKey:is_valid_object_name(object_name)
	slot5 = object_name

	if not self.super.is_valid_object_name(slot3, self) then
		return false
	else
		slot7 = self
		slot7 = true
		local object = self._unit_object(slot3, self, self.unit_name(slot6), object_name)

		return object and object.set_visibility ~= nil
	end

	return 
end

return 
