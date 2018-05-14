-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/logics/CopLogicBase"

require(slot1)

if not TeamAILogicBase then
	slot2 = CopLogicBase
	slot0 = class(slot1)
end

TeamAILogicBase = slot0
function TeamAILogicBase.on_long_dis_interacted(data, other_unit)
	return 
end
function TeamAILogicBase.on_cop_neutralized(data, cop_key)
	return 
end
function TeamAILogicBase.on_recovered(data, reviving_unit)
	return 
end
function TeamAILogicBase.clbk_heat(data)
	return 
end
function TeamAILogicBase.on_objective_unit_destroyed(data, unit)
	if not data.objective then
		return 
	end

	data.objective.destroy_clbk_key = nil
	data.objective.death_clbk_key = nil
	slot5 = data.objective

	data.objective_failed_clbk(nil, data.unit)

	return 
end
function TeamAILogicBase._get_logic_state_from_reaction(data, reaction)
	if not reaction or reaction <= AIAttentionObject.REACT_SCARED then
		return "idle"
	else
		return "assault"
	end

	return 
end
function TeamAILogicBase._set_attention_obj(data, new_att_obj, new_reaction)
	local old_att_obj = data.attention_obj
	data.attention_obj = new_att_obj

	if new_att_obj then
		new_att_obj.reaction = new_reaction or new_att_obj.settings.reaction
	end

	if old_att_obj and new_att_obj and old_att_obj.u_key == new_att_obj.u_key then
		if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t then
			if new_att_obj.settings.pause then
				new_att_obj.stare_expire_t = nil
				slot8 = new_att_obj.settings.pause[2]
				new_att_obj.pause_expire_t = data.t + math.lerp(slot6, new_att_obj.settings.pause[1], math.random())
				slot8 = "sec"

				print(math.lerp(slot6, new_att_obj.settings.pause[1], math.random()), "[TeamAILogicBase._chk_focus_on_attention_object] pausing for", current_attention.pause_expire_t - data.t)
			end
		elseif new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
			new_att_obj.pause_expire_t = nil
			slot8 = new_att_obj.settings.duration[2]
			new_att_obj.stare_expire_t = data.t + math.lerp(slot6, new_att_obj.settings.duration[1], math.random())
		end
	elseif new_att_obj and new_att_obj.settings.duration then
		slot8 = new_att_obj.settings.duration[2]
		new_att_obj.stare_expire_t = data.t + math.lerp(slot6, new_att_obj.settings.duration[1], math.random())
		new_att_obj.pause_expire_t = nil
	end

	return 
end
function TeamAILogicBase._chk_nearly_visible_chk_needed(data, attention_info, u_key)
	return not data.attention_obj or data.attention_obj.key == u_key
end
function TeamAILogicBase._chk_reaction_to_attention_object(data, attention_data, stationary)

	-- Decompilation error in this vicinity:
	local att_unit = attention_data.unit

	if data.cool then
		slot7 = AIAttentionObject.REACT_SURPRISED

		return math.min(slot5, attention_data.settings.reaction)
	elseif stationary then
		slot7 = AIAttentionObject.REACT_SHOOT

		return math.min(slot5, attention_data.settings.reaction)
	else
		return attention_data.settings.reaction
	end

	return 
end
function TeamAILogicBase.on_new_objective(data, old_objective)
	slot5 = old_objective

	CopLogicBase.update_follow_unit(slot3, data)

	return 
end
function TeamAILogicBase.on_intimidated(data, amount, aggressor_unit)
	return 
end

return 
