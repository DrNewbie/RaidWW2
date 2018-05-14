if not MoveObjectInteractionExt then
	slot2 = UseInteractionExt
	slot0 = class(slot1)
end

MoveObjectInteractionExt = slot0
MoveObjectInteractionExt.interact_distance = function (self, ...)
	slot3 = self

	return MoveObjectInteractionExt.super.interact_distance(slot2, ...)
end
MoveObjectInteractionExt.can_select = function (self, player)
	slot5 = player

	return MoveObjectInteractionExt.super.can_select(slot3, self)
end
MoveObjectInteractionExt.check_interupt = function (self)
	slot3 = self

	return MoveObjectInteractionExt.super.check_interupt(slot2)
end
MoveObjectInteractionExt.interact = function (self, player)
	slot5 = player

	MoveObjectInteractionExt.super.super.interact(slot3, self)

	slot5 = "MoveObjectInteractionExt:interact: "
	slot8 = self._unit

	Application.trace(slot3, Application, inspect(slot7))

	slot6 = {
		moving_unit = self._unit
	}

	managers.player.set_player_state(slot3, managers.player, "move_object")

	return 
end
MoveObjectInteractionExt.sync_interacted = function (self, peer, player, status, skip_alive_check)
	if not self._active then
		return 
	end

	return 
end
MoveObjectInteractionExt.set_contour = function (self, color, opacity)
	return 
end

return 
