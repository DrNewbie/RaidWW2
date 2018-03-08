function CopLogicInactive._set_interaction(data, my_data)
	if data.unit:character_damage():dead() and managers.groupai:state():whisper_mode() then
		if data.unit:unit_data().has_alarm_pager then
			if data.brain.begin_alarm_pager then
				data.brain:begin_alarm_pager()
			end
		else
			data.unit:interaction():set_tweak_data("corpse_dispose")
			data.unit:interaction():set_active(true, true, true)
		end
	end
end