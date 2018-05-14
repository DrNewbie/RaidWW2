if not ChallengeCardsLootRewardGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

ChallengeCardsLootRewardGui = slot0
ChallengeCardsLootRewardGui.EVENT_KET_STEAM_LOOT_DROPPED = "event_key_steam_loot_dropped"
function ChallengeCardsLootRewardGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	ChallengeCardsLootRewardGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot7 = managers.raid_menu
	slot12 = "on_escape"

	managers.raid_menu.register_on_escape_callback(slot6, callback(fullscreen_ws, self, self))

	self._timer_frequency = 30
	self._timer = 31

	return 
end
function ChallengeCardsLootRewardGui:_set_initial_data()
	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	slot5 = managers.challenge_cards
	self._loot_list = clone(managers.challenge_cards.get_temp_steam_loot("menu_challenge_cards"))

	return 
end
function ChallengeCardsLootRewardGui:_layout()
	slot3 = self

	self.bind_controller_inputs(slot2)

	slot4 = self._loot_list

	self._show_loot_list(slot2, self)

	return 
end
function ChallengeCardsLootRewardGui:_show_loot_list(loot_list)
	local coord_y = 200
	local loot_reward_card_params = {
		x = 0,
		y = coord_y
	}
	slot6 = self._root_panel
	loot_reward_card_params.w = self._root_panel.w(slot5)
	slot6 = self._root_panel
	loot_reward_card_params.h = self._root_panel.h(slot5) - coord_y
	loot_reward_card_params.item_params = {
		item_w = 256,
		item_h = 352,
		wrapper_h = 600
	}
	loot_reward_card_params.loot_list = loot_list
	slot8 = loot_reward_card_params
	self._loot_cards = self._root_panel.create_custom_control(slot5, self._root_panel, RaidGUIControlLootRewardCards)

	return 
end
function ChallengeCardsLootRewardGui:update(t, dt)
	return 
end
function ChallengeCardsLootRewardGui:_continue_button_on_click()
	slot3 = managers.raid_menu

	managers.raid_menu.close_menu(slot2)

	return 
end
function ChallengeCardsLootRewardGui:close()
	if self._closing then
		return 
	end

	self._closing = true
	slot3 = game_state_machine
	slot3 = game_state_machine.current_state(slot2)

	game_state_machine.current_state(slot2).continue(slot2)

	self._peer_slots = {}
	slot3 = self

	ChallengeCardsLootRewardGui.super.close(slot2)

	return 
end
function ChallengeCardsLootRewardGui:on_escape()
	slot3 = self

	self._continue_button_on_click(slot2)

	return true
end
function ChallengeCardsLootRewardGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_continue_button_on_click"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_continue"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_continue",
			callback = callback(true, self, self, "_continue_button_on_click")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end

return 
