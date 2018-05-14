slot3 = "CoreSlotManager"

core.module(slot1, core)

SlotManager = SlotManager or class()
function SlotManager:init()
	local unit_manager = World.unit_manager(slot2)
	slot6 = 0

	unit_manager.set_slot_limited(World, unit_manager, 0)

	slot5 = 1

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 10

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 11

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 15

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 19

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 29

	unit_manager.set_slot_infinite(World, unit_manager)

	slot5 = 35

	unit_manager.set_slot_infinite(World, unit_manager)

	self._masks = {}
	slot8 = 36
	self._masks.statics = World.make_slot_mask(unit_manager, World, 1, 15)
	slot12 = 36
	self._masks.editor_all = World.make_slot_mask(unit_manager, World, 1, 10, 11, 15, 19, 35)
	slot6 = 10
	self._masks.mission_elements = World.make_slot_mask(unit_manager, World)
	slot12 = 38
	self._masks.surface_move = World.make_slot_mask(unit_manager, World, 1, 11, 20, 21, 24, 35)
	slot6 = 10
	self._masks.hub_elements = World.make_slot_mask(unit_manager, World)
	slot6 = 19
	self._masks.sound_layer = World.make_slot_mask(unit_manager, World)
	slot6 = 19
	self._masks.environment_layer = World.make_slot_mask(unit_manager, World)
	slot6 = 19
	self._masks.portal_layer = World.make_slot_mask(unit_manager, World)
	slot6 = 19
	self._masks.ai_layer = World.make_slot_mask(unit_manager, World)
	slot6 = 11
	self._masks.dynamics = World.make_slot_mask(unit_manager, World)
	slot8 = 15
	self._masks.statics_layer = World.make_slot_mask(unit_manager, World, 1, 11)
	slot6 = 11
	self._masks.dynamics_layer = World.make_slot_mask(unit_manager, World)
	slot6 = 1
	self._masks.dump_all = World.make_slot_mask(unit_manager, World)
	slot6 = 35
	self._masks.wires = World.make_slot_mask(unit_manager, World)
	slot6 = 1
	self._masks.brush_placeable = World.make_slot_mask(unit_manager, World)
	slot6 = 29
	self._masks.brushes = World.make_slot_mask(unit_manager, World)

	return 
end
function SlotManager:get_mask(...)
	local mask = nil
	local arg_list = {
		...
	}
	slot5 = arg_list

	for _, name in pairs(slot4) do
		local next_mask = self._masks[name]

		if next_mask then
			if not mask then
				mask = next_mask
			else
				mask = mask + next_mask
			end
		else
			slot15 = name
			slot12 = "Invalid slotmask \"" .. tostring(slot14) .. "\"."

			Application.error(slot10, Application)
		end
	end

	if #arg_list == 0 then
		slot6 = "No parameters passed to get_mask function."

		Application.error(slot4, Application)
	end

	return mask
end
function SlotManager:get_mask_name(slotmask)
	slot5 = slotmask

	return table.get_key(slot3, self._masks)
end
function SlotManager:get_mask_map()
	return self._masks
end

return 
