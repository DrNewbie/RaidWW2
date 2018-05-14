if not CartInteractionExt then
	slot2 = UseInteractionExt
	slot0 = class(slot1)
end

CartInteractionExt = slot0
function CartInteractionExt:interact_distance(...)
	slot3 = self

	return CartInteractionExt.super.interact_distance(slot2, ...)
end
function CartInteractionExt:can_select(player)
	slot5 = player

	return CartInteractionExt.super.can_select(slot3, self)
end
function CartInteractionExt:check_interupt()
	slot3 = self

	return CartInteractionExt.super.check_interupt(slot2)
end
function CartInteractionExt:interact(player)
	slot5 = player

	CartInteractionExt.super.super.interact(slot3, self)

	slot5 = "CartInteractionExt:interact: "
	slot8 = self._unit

	Application.trace(slot3, Application, inspect(slot7))

	slot5 = self._unit

	managers.motion_path.push_cart(slot3, managers.motion_path)

	return 
end
function CartInteractionExt:sync_interacted(peer, player, status, skip_alive_check)
	if not self._active then
		return 
	end

	return 
end
function CartInteractionExt:set_contour(color, opacity)
	return 
end

return 
