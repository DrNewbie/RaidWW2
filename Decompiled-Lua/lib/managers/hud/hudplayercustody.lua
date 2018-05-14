-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDPlayerCustody = HUDPlayerCustody or class()
function HUDPlayerCustody:init(hud)
	self._hud = hud
	self._hud_panel = hud.panel
	self._last_respawn_type_is_ai_trade = false
	slot5 = "custody_panel"

	if self._hud_panel.child(slot3, self._hud_panel) then
		slot4 = self._hud_panel
		slot8 = "custody_panel"

		self._hud_panel.remove(slot3, self._hud_panel.child(slot6, self._hud_panel))
	end

	local custody_panel = self._hud_panel.panel(slot3, self._hud_panel)
	local timer_message_params = {
		text = "custodddddy in",
		vertical = "center",
		h = 40,
		name = "timer_msg",
		w = 400,
		align = "center",
		font = tweak_data.gui.fonts.din_compressed_outlined_24,
		font_size = tweak_data.gui.font_sizes.size_24
	}
	slot7 = timer_message_params
	local timer_msg = custody_panel.text({
		valign = "grow",
		name = "custody_panel",
		halign = "grow"
	}, custody_panel)
	slot7 = timer_msg

	timer_msg.set_text(custody_panel, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

	slot7 = timer_msg
	local _, _, w, h = timer_msg.text_rect(custody_panel)
	slot12 = h

	timer_msg.set_h(managers.localization.text, timer_msg)

	slot11 = timer_msg
	slot17 = timer_msg
	slot14 = self._hud_panel.center_x(slot15) - timer_msg.w(self._hud_panel) / 2

	timer_msg.set_x(managers.localization.text, math.round("hud_respawning_in"))

	slot12 = 28

	timer_msg.set_y(managers.localization.text, timer_msg)

	local timer_params = {
		text = "00:00",
		vertical = "bottom",
		h = 32,
		name = "timer",
		align = "center"
	}
	slot12 = custody_panel
	timer_params.w = custody_panel.w(timer_msg)
	timer_params.font = tweak_data.gui.fonts.din_compressed_outlined_42
	timer_params.font_size = tweak_data.gui.font_sizes.menu_list
	slot13 = timer_params
	local timer = custody_panel.text(timer_msg, custody_panel)
	slot13 = timer
	local _, _, w, h = timer.text_rect(custody_panel)
	slot18 = h

	timer.set_h(self._hud_panel, timer)

	slot17 = timer
	slot22 = timer_msg
	slot20 = timer_msg.bottom(slot21) - 6

	timer.set_y(self._hud_panel, math.round(slot19))

	slot17 = timer
	slot20 = self._hud_panel

	timer.set_center_x(self._hud_panel, self._hud_panel.center_x(slot19))

	self._timer = timer
	self._last_time = -1
	self._last_trade_delay_time = -1

	return 
end
function HUDPlayerCustody:set_pumpkin_challenge()
	slot6 = "card_ra_season_of_resurrection_name_id"
	local top_text = utf8.to_upper(managers.localization.text(slot4, managers.localization))
	slot5 = "custody_panel"
	slot5 = "timer_msg"

	self._hud_panel.child(managers.localization.text, self._hud_panel).child(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel)).set_text(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel).child(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel)))

	slot7 = "hud_pumpkin_revive_tutorial"
	local bottom_text = utf8.to_upper(managers.localization.text(top_text, managers.localization))
	slot6 = bottom_text

	self._timer.set_text(managers.localization.text, self._timer)

	return 
end
function HUDPlayerCustody:set_timer_visibility(visible)
	slot5 = "custody_panel"
	slot5 = "timer_msg"
	slot4 = self._hud_panel.child(slot3, self._hud_panel).child(slot3, self._hud_panel.child(slot3, self._hud_panel))
	slot10 = "hud_respawning_in"

	self._hud_panel.child(slot3, self._hud_panel).child(slot3, self._hud_panel.child(slot3, self._hud_panel)).set_text(slot3, utf8.to_upper(managers.localization.text(slot8, managers.localization)))

	slot5 = visible

	self._timer.set_visible(slot3, self._timer)

	slot5 = "custody_panel"
	slot5 = "timer_msg"
	slot5 = visible

	self._hud_panel.child(slot3, self._hud_panel).child(slot3, self._hud_panel.child(slot3, self._hud_panel)).set_visible(slot3, self._hud_panel.child(slot3, self._hud_panel).child(slot3, self._hud_panel.child(slot3, self._hud_panel)))

	return 
end
function HUDPlayerCustody:set_respawn_time(time)
	slot5 = self._last_time

	if math.floor(slot3) == math.floor(time) then
		return 
	end

	self._last_time = time
	slot5 = time
	local time_text = self._get_time_text(slot3, self)
	slot5 = self._timer
	slot10 = time_text

	self._timer.set_text(self, utf8.to_upper(tostring(slot9)))

	return 
end
function HUDPlayerCustody:set_civilians_killed(amount)
	return 
end
function HUDPlayerCustody:set_trade_delay(time)
	return 
end
function HUDPlayerCustody:set_trade_delay_visible(visible)
	return 
end
function HUDPlayerCustody:set_negotiating_visible(visible)
	return 
end
function HUDPlayerCustody:set_can_be_trade_visible(visible)
	return 
end
function HUDPlayerCustody:_get_time_text(time)
	slot6 = time
	time = math.max(slot3, math.floor(0))
	local minutes = math.floor(slot3)
	time = time - minutes * 60
	slot5 = time
	local seconds = math.round(time / 60)
	local text = ""

	return text .. ((minutes < 10 and "0" .. minutes) or minutes) .. ":" .. ((seconds < 10 and "0" .. seconds) or seconds)
end
function HUDPlayerCustody:_animate_text_pulse(text)
	local t = 0

	while true do
		local dt = coroutine.yield()
		t = t + dt
		slot8 = t * 360 * 0.5
		local alpha = 0.5 + math.abs(slot5) / 2
		slot8 = alpha

		text.set_alpha(math.sin(slot7), text)
	end

	return 
end
function HUDPlayerCustody:set_respawn_type(is_ai_trade)
	if self._last_respawn_type_is_ai_trade ~= is_ai_trade then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		slot2 = utf8.to_upper
		slot6 = managers.localization
		slot4 = managers.localization.text
		slot7 = (is_ai_trade and "hud_ai_traded_in") or "hud_respawning_in"
		local text = utf8.to_upper(managers.localization.text(slot5, managers.localization))
		slot6 = "custody_panel"
		slot6 = "timer_msg"
		slot6 = text

		self._hud_panel.child(managers.localization.text, self._hud_panel).child(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel)).set_text(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel).child(managers.localization.text, self._hud_panel.child(managers.localization.text, self._hud_panel)))

		self._last_respawn_type_is_ai_trade = is_ai_trade
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 1 ---
		slot7 = "hud_ai_traded_in"

		if "hud_ai_traded_in" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 1 ---
			slot7 = "hud_respawning_in"
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-30, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	return 
end

return 
