slot2 = "core/lib/utils/dev/ews/CoreFilteredTreePanel"

require(slot1)

if not CoreAnimationStateTreePanel then
	slot2 = CoreFilteredTreePanel
	slot0 = class(slot1)
end

CoreAnimationStateTreePanel = slot0
function CoreAnimationStateTreePanel:init(parent_frame, unit)
	slot6 = parent_frame

	self.super.init(slot4, self)

	slot6 = unit

	self.set_unit(slot4, self)

	return 
end
function CoreAnimationStateTreePanel:unit()
	return self._unit
end
function CoreAnimationStateTreePanel:set_unit(unit)
	self._unit = unit
	slot4 = self

	self._refresh_tree(slot3)

	return 
end
function CoreAnimationStateTreePanel:_refresh_tree()
	slot3 = self
	slot3 = self._tree_control(slot2)

	self._tree_control(slot2).freeze(slot2)

	slot3 = self
	slot3 = self._tree_control(slot2)

	self._tree_control(slot2).clear(slot2)

	slot3 = self

	if self.unit(slot2) then
		slot3 = self
		slot3 = self.unit(slot2)
		local state_machine = self.unit(slot2).anim_state_machine(slot2)

		if state_machine then
			slot6 = state_machine
			slot6 = state_machine.config(slot5)

			function slot5(a, b)
				slot4 = a
				slot5 = b
				slot5 = b.name(a.name(slot3))

				return a.name(slot3).s(slot3) < b.name(a.name(slot3)).s(a.name(slot3))
			end

			local sorted_states = table.sorted_copy(slot3, state_machine.config(slot5).states(slot5))
			slot5 = sorted_states

			for _, state in ipairs(state_machine.config(slot5).states(slot5)) do
				slot10 = self
				slot10 = self._tree_control(slot9)
				slot13 = state
				slot13 = state.name(slot12)

				self._tree_control(slot9).append_path(slot9, state.name(slot12).s(slot12))
			end
		end
	end

	slot3 = self
	slot3 = self._tree_control(slot2)

	self._tree_control(slot2).thaw(slot2)

	return 
end

return 
