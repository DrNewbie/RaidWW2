local master_IntimitateInteractionExt_interact_blocked = IntimitateInteractionExt._interact_blocked

function IntimitateInteractionExt:_interact_blocked( player )
	if self.tweak_data == "corpse_dispose" then
		if managers.player:chk_body_bags_depleted() then
			return true, nil, "body_bag_limit_reached"
		end
		return not managers.player:can_carry("person")
	end
	return master_IntimitateInteractionExt_interact_blocked(self, player)
end

function CarryInteractionExt:_interact_blocked( player )
	return not managers.player:can_carry( self._unit:carry_data():carry_id() )
end

function CarryInteractionExt:can_select( player )
	return CarryInteractionExt.super.can_select( self, player )
end
