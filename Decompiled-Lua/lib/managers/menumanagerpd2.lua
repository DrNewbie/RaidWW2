slot3 = "CoreMenuManager"

core.import(slot1, core)

slot3 = "CoreMenuCallbackHandler"

core.import(slot1, core)

slot2 = "lib/managers/menu/MenuSceneManager"

require(slot1)

slot2 = "lib/managers/menu/MenuComponentManager"

require(slot1)

slot2 = "lib/managers/menu/items/MenuItemDivider"

require(slot1)

slot3 = "CoreEvent"

core.import(slot1, core)

function MenuManager:update(t, dt, ...)
	slot7 = dt

	MenuManager.super.update(slot4, self, t, ...)

	slot7 = dt

	managers.menu_component.update(slot4, managers.menu_component, t)

	return 
end
function MenuManager:on_view_character(user)
	slot5 = "outfit"
	local outfit = user.rich_presence(slot3, user)

	if outfit ~= "" then
		slot5 = managers.menu
		slot5 = managers.menu.active_menu(slot4).logic

		if managers.menu.active_menu(slot4).logic.selected_node_name(slot4) ~= "view_character" then
			slot5 = managers.menu
			slot8 = {}

			managers.menu.active_menu(slot4).logic.select_node(slot4, managers.menu.active_menu(slot4).logic, "view_character", true)
		end

		slot8 = 300

		managers.menu_component.create_view_character_profile_gui(slot4, managers.menu_component, user, 0)
	end

	return 
end
function MenuManager:on_enter_lobby()
	slot3 = "function MenuManager:on_enter_lobby()"

	print(slot2)

	slot3 = managers.menu
	slot6 = {}

	managers.menu.active_menu(slot2).logic.select_node(slot2, managers.menu.active_menu(slot2).logic, "lobby", true)

	slot4 = "MPLobby"

	managers.platform.set_rich_presence(slot2, managers.platform)

	slot3 = managers.network
	slot3 = managers.network.session(slot2)

	managers.network.session(slot2).on_entered_lobby(slot2)

	slot3 = self

	self.setup_local_lobby_character(slot2)

	if Global.exe_argument_level then
		slot3 = MenuCallbackHandler

		MenuCallbackHandler.start_the_game(slot2)
	end

	return 
end
function MenuManager:on_leave_active_job()
	slot4 = {
		quit = true
	}

	managers.statistics.stop_session(slot2, managers.statistics)

	slot3 = managers.raid_job

	managers.raid_job.deactivate_current_job(slot2)

	slot3 = managers.worldcollection

	managers.worldcollection.on_simulation_ended(slot2)

	if managers.groupai then
		slot3 = managers.groupai
		slot4 = false

		managers.groupai.state(slot2).set_AI_enabled(slot2, managers.groupai.state(slot2))
	end

	slot4 = "menu_exit"

	self._sound_source.post_event(slot2, self._sound_source)

	slot4 = "lobby_menu"

	managers.menu.close_menu(slot2, managers.menu)

	slot4 = "menu_pause"

	managers.menu.close_menu(slot2, managers.menu)

	return 
end
function MenuManager:setup_local_lobby_character()
	slot3 = managers.network
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	local level = managers.experience.current_level(managers.network.session(slot2))
	local character = local_peer.character(managers.experience)
	local player_class = managers.skilltree.get_character_profile_class(local_peer)
	slot7 = local_peer
	slot10 = managers.blackmarket

	local_peer.set_outfit_string(managers.skilltree, managers.blackmarket.outfit_string(slot9))

	slot8 = player_class

	local_peer.set_class(managers.skilltree, local_peer)

	slot7 = managers.network
	slot10 = player_class

	managers.network.session(managers.skilltree).send_to_peers_loaded(managers.skilltree, managers.network.session(managers.skilltree), "sync_profile", level)

	slot7 = managers.network
	slot7 = managers.network.session(managers.skilltree)

	managers.network.session(managers.skilltree).check_send_outfit(managers.skilltree)

	return 
end
function MenuManager:set_cash_safe_scene_done(done, silent)
	self._cash_safe_scene_done = done

	if not silent then
		slot5 = managers.menu
		local logic = managers.menu.active_menu(slot4).logic

		if logic then
			slot6 = logic

			logic.refresh_node(slot5)
		end
	end

	return 
end
function MenuManager:cash_safe_scene_done()
	return self._cash_safe_scene_done
end
function MenuManager:http_test()
	slot4 = "http://www.overkillsoftware.com/?feed=rss"
	slot9 = "http_test_result"

	Steam.http_request(slot2, Steam, callback(slot6, self, self))

	return 
end
function MenuManager:http_test_result(success, body)
	slot6 = success

	print(slot4, "success")

	slot6 = body

	print(slot4, "body")

	slot12 = "</title>"

	print(inspect(self._get_text_block(slot8, self, body, "<title>")))

	slot12 = "</link>"

	print(inspect(self._get_text_block(slot8, self, body, "<link>")))

	return 
end
MenuMarketItemInitiator = MenuMarketItemInitiator or class()
function MenuMarketItemInitiator:modify_node(node)
	local node_name = node.parameters(slot3).name
	slot6 = "armor"
	local armor_item = node.item(node, node)
	slot7 = armor_item

	self._add_expand_armor(node, self)

	slot7 = "submachine_guns"
	local submachine_guns_item = node.item(node, node)
	slot9 = 3

	self._add_expand_weapon(node, self, submachine_guns_item)

	slot8 = "assault_rifles"
	local assault_rifles_item = node.item(node, node)
	slot10 = 2

	self._add_expand_weapon(node, self, assault_rifles_item)

	slot9 = "handguns"
	local handguns_item = node.item(node, node)
	slot11 = 1

	self._add_expand_weapon(node, self, handguns_item)

	slot10 = "support_equipment"
	local support_equipment_item = node.item(node, node)

	if support_equipment_item then
		slot10 = self

		if self._uses_owned_stats(slot9) then
			slot12 = 1

			support_equipment_item.set_parameter(slot9, support_equipment_item, "current")

			slot12 = 4

			support_equipment_item.set_parameter(slot9, support_equipment_item, "total")
		end
	end

	slot11 = "miscellaneous"
	local miscellaneous_item = node.item(slot9, node)

	if miscellaneous_item then
		slot11 = self

		if self._uses_owned_stats(slot10) then
			slot13 = 0

			miscellaneous_item.set_parameter(slot10, miscellaneous_item, "current")

			slot13 = 6

			miscellaneous_item.set_parameter(slot10, miscellaneous_item, "total")
		end
	end

	slot12 = "masks"
	local masks_item = node.item(slot10, node)
	slot13 = masks_item

	self._add_expand_mask(node, self)

	slot13 = "character"
	local character_item = node.item(node, node)
	slot14 = character_item

	self._add_expand_character(node, self)

	return node
end
function MenuMarketItemInitiator:_add_weapon(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_character(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_mask(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_armor(bm_data)
	return true
end
function MenuMarketItemInitiator:_uses_owned_stats()
	return true
end
function MenuMarketItemInitiator:_add_weapon_params()
	return 
end
function MenuMarketItemInitiator:_add_mask_params(params)
	return 
end
function MenuMarketItemInitiator:_add_character_params(params)
	return 
end
function MenuMarketItemInitiator:_add_armor_params(params)
	return 
end
function MenuMarketItemInitiator:_add_expand_weapon(item, selection_index)
	if not item then
		return 
	end

	local i = 0
	local j = 0
	slot7 = tweak_data.weapon

	for weapon, data in pairs(slot6) do
		if data.autohit and data.use_data.selection_index == selection_index then
			i = i + 1
			local bm_data = Global.blackmarket_manager.weapons[weapon]
			local unlocked = bm_data.unlocked
			local owned = bm_data.owned

			if owned and unlocked then
				j = j + 1
			end

			local equipped = bm_data.equipped
			local condition = bm_data.condition
			slot18 = bm_data

			if self._add_weapon(slot16, self) then
				slot18 = weapon
				local weapon_item = item.get_item(slot16, item)

				if not weapon_item then
					local params = {
						callback = "test_clicked_weapon",
						type = "MenuItemWeaponExpand",
						name = weapon,
						text_id = data.name_id,
						weapon_id = weapon,
						unlocked = (unlocked and true) or false,
						condition = condition,
						weapon_slot = selection_index
					}
					slot20 = params

					self._add_weapon_params(slot18, self)

					slot20 = params
					weapon_item = CoreMenuNode.MenuNode.create_item(slot18, item)
					slot20 = weapon_item

					item.add_item(slot18, item)
				end

				slot18 = weapon_item
				weapon_item.parameters(slot17).unlocked = unlocked
				slot18 = weapon_item
				weapon_item.parameters(slot17).equipped = (equipped and true) or false
				slot18 = weapon_item
				weapon_item.parameters((equipped and true) or false).owned = owned
				slot18 = weapon_item
				weapon_item.parameters((equipped and true) or false).condition = condition
			end
		end
	end

	slot7 = self

	if self._uses_owned_stats(slot6) then
		slot9 = j

		item.set_parameter(slot6, item, "current")

		slot9 = i

		item.set_parameter(slot6, item, "total")
	end

	slot8 = nil

	item._show_items(slot6, item)

	return i
end
function MenuMarketItemInitiator:_add_expand_mask(item)
	local i = 0
	local j = 0
	slot6 = tweak_data.blackmarket.masks

	for mask_id, data in pairs(slot5) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.masks[mask_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped

		if owned then
			j = j + 1
		end

		slot16 = bm_data

		if self._add_mask(slot14, self) then
			slot16 = mask_id
			local mask_item = item.get_item(slot14, item)

			if not mask_item then
				local params = {
					callback = "test_clicked_mask",
					type = "MenuItemMaskExpand",
					name = mask_id,
					text_id = data.name_id,
					unlocked = (unlocked and true) or false,
					mask_id = mask_id
				}
				slot18 = params

				self._add_mask_params(slot16, self)

				slot18 = params
				mask_item = CoreMenuNode.MenuNode.create_item(slot16, item)
				slot18 = mask_item

				item.add_item(slot16, item)
			end

			slot16 = mask_item
			mask_item.parameters(slot15).equipped = (equipped and true) or false
			slot16 = mask_item
			mask_item.parameters((equipped and true) or false).owned = owned
		end
	end

	slot6 = self

	if self._uses_owned_stats(slot5) then
		slot8 = j

		item.set_parameter(slot5, item, "current")

		slot8 = i

		item.set_parameter(slot5, item, "total")
	end

	slot7 = nil

	item._show_items(slot5, item)

	return i
end
function MenuMarketItemInitiator:_add_expand_character(item)
	local i = 0
	local j = 0
	slot6 = tweak_data.blackmarket.characters

	for character_id, data in pairs(slot5) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.characters[character_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped

		if owned then
			j = j + 1
		end

		slot16 = bm_data

		if self._add_character(slot14, self) then
			slot16 = character_id
			local character_item = item.get_item(slot14, item)

			if not character_item then
				local params = {
					callback = "clicked_character",
					type = "MenuItemCharacterExpand",
					name = character_id,
					text_id = data.name_id,
					unlocked = (unlocked and true) or false,
					character_id = character_id
				}
				slot18 = params

				self._add_character_params(slot16, self)

				slot18 = params
				character_item = CoreMenuNode.MenuNode.create_item(slot16, item)
				slot18 = character_item

				item.add_item(slot16, item)
			end

			slot16 = character_item
			character_item.parameters(slot15).equipped = (equipped and true) or false
			slot16 = character_item
			character_item.parameters((equipped and true) or false).owned = owned
		end
	end

	slot6 = self

	if self._uses_owned_stats(slot5) then
		slot8 = j

		item.set_parameter(slot5, item, "current")

		slot8 = i

		item.set_parameter(slot5, item, "total")
	end

	slot7 = nil

	item._show_items(slot5, item)

	return i
end
function MenuMarketItemInitiator:_add_expand_armor(item)
	if not item then
		return 
	end

	local i = 0
	local j = 0
	slot6 = tweak_data.blackmarket.armors

	for armor_id, data in pairs(slot5) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped
		local condition = bm_data.condition

		if owned then
			j = j + 1
		end

		slot17 = bm_data

		if self._add_armor(slot15, self) then
			slot17 = armor_id
			local armor_item = item.get_item(slot15, item)

			if not armor_item then
				local params = {
					callback = "test_clicked_armor",
					type = "MenuItemArmorExpand",
					name = armor_id,
					text_id = data.name_id,
					armor_id = armor_id,
					condition = condition
				}
				slot19 = params

				self._add_armor_params(slot17, self)

				slot19 = params
				armor_item = CoreMenuNode.MenuNode.create_item(slot17, item)
				slot19 = armor_item

				item.add_item(slot17, item)
			end

			slot17 = armor_item
			armor_item.parameters(slot16).equipped = equipped
			slot17 = armor_item
			armor_item.parameters(slot16).unlocked = unlocked
			slot17 = armor_item
			armor_item.parameters(slot16).owned = owned
			slot17 = armor_item
			armor_item.parameters(slot16).condition = condition
		end
	end

	slot6 = self

	if self._uses_owned_stats(slot5) then
		slot8 = j

		item.set_parameter(slot5, item, "current")

		slot8 = i

		item.set_parameter(slot5, item, "total")
	end

	slot7 = nil

	item._show_items(slot5, item)

	return i
end

if not MenuBlackMarketInitiator then
	slot2 = MenuMarketItemInitiator
	slot0 = class(slot1)
end

MenuBlackMarketInitiator = slot0
MenuBuyUpgradesInitiator = MenuBuyUpgradesInitiator or class()
function MenuBuyUpgradesInitiator:modify_node(original_node, weapon_id, p2, p3)
	local node = deep_clone(slot6)
	local node_name = node.parameters(original_node).name
	slot9 = node
	node.parameters(node).topic_id = tweak_data.weapon[weapon_id].name_id
	slot10 = "scopes"
	local scopes_item = node.item(tweak_data.weapon[weapon_id].name_id, node)
	slot13 = "scopes"

	self._add_expand_upgrade(node, self, scopes_item, weapon_id)

	slot11 = "barrels"
	local barrels_item = node.item(node, node)
	slot14 = "barrels"

	self._add_expand_upgrade(node, self, barrels_item, weapon_id)

	slot12 = "grips"
	local grips_item = node.item(node, node)
	slot15 = "grips"

	self._add_expand_upgrade(node, self, grips_item, weapon_id)

	return node
end
function MenuBuyUpgradesInitiator:_add_expand_upgrade(item, weapon_id, upgrade)
	return 
	return 
end
MenuComponentInitiator = MenuComponentInitiator or class()
function MenuComponentInitiator:modify_node(original_node, data)
	slot5 = original_node
	local node = deep_clone(slot4)

	if data and data.back_callback then
		slot8 = node

		table.insert(slot5, node.parameters(data.back_callback).back_callback)
	end

	slot6 = node
	node.parameters(slot5).menu_component_data = data

	return node
end
MenuLoadoutInitiator = MenuLoadoutInitiator or class()
function MenuLoadoutInitiator:modify_node(original_node, data)
	local node = deep_clone(slot4)
	slot6 = node
	node.parameters(original_node).menu_component_data = data
	slot6 = node
	node.parameters(original_node).menu_component_next_node_name = "loadout"

	return node
end

if not MenuCharacterCustomizationInitiator then
	slot2 = MenuMarketItemInitiator
	slot0 = class(slot1)
end

MenuCharacterCustomizationInitiator = slot0
function MenuCharacterCustomizationInitiator:_add_weapon(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_character(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_mask(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_armor(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_uses_owned_stats()
	return false
end
function MenuCharacterCustomizationInitiator:_add_weapon_params(params)
	params.customize = true

	return 
end
function MenuCharacterCustomizationInitiator:_add_mask_params(params)
	params.customize = true

	return 
end
function MenuCharacterCustomizationInitiator:_add_character_params(params)
	params.customize = true

	return 
end
function MenuCharacterCustomizationInitiator:_add_armor_params(params)
	params.customize = true

	return 
end
function MenuManager:show_repair_weapon(params, weapon, cost)
	local dialog_data = {}
	slot8 = "dialog_repair_weapon_title"
	dialog_data.title = managers.localization.text(slot6, managers.localization)
	slot9 = {
		WEAPON = weapon,
		COST = cost
	}
	dialog_data.text = managers.localization.text(slot6, managers.localization, "dialog_repair_weapon_message")
	local yes_button = {}
	slot9 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	yes_button.callback_func = params.yes_func
	local no_button = {}
	slot10 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot10 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
function MenuManager:show_buy_weapon(params, weapon, cost)
	local dialog_data = {}
	slot8 = "dialog_buy_weapon_title"
	dialog_data.title = managers.localization.text(slot6, managers.localization)
	slot9 = {
		WEAPON = weapon,
		COST = cost
	}
	dialog_data.text = managers.localization.text(slot6, managers.localization, "dialog_buy_weapon_message")
	local yes_button = {}
	slot9 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	yes_button.callback_func = params.yes_func
	local no_button = {}
	slot10 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot10 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
FbiFilesInitiator = FbiFilesInitiator or class()
function FbiFilesInitiator:modify_node(node, up)
	node.clean_items(slot4)

	local params = {
		callback = "on_visit_fbi_files",
		name = "on_visit_fbi_files",
		help_id = "menu_visit_fbi_files_help",
		text_id = "menu_visit_fbi_files"
	}
	slot8 = params
	local new_item = node.create_item(node, node, nil)
	slot8 = new_item

	node.add_item(node, node)

	slot7 = managers.network

	if managers.network.session(node) then
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		local peer = managers.network.session(slot6).local_peer(slot6)
		local params = {
			localize_help = false,
			localize = false,
			to_upper = false,
			callback = "on_visit_fbi_files_suspect"
		}
		slot9 = peer
		params.name = peer.user_id(slot8)
		slot9 = peer
		slot11 = managers.experience
		params.text_id = peer.name(slot8) .. " (" .. (managers.experience.current_level(slot10) or "") .. ")"
		slot9 = peer
		params.rpc = peer.rpc(" (")
		params.peer = peer
		slot11 = params
		local new_item = node.create_item(" (", node, nil)

		node.add_item(node, node)

		slot12 = managers.network
		slot12 = managers.network.session(new_item)

		for _, peer in pairs(managers.network.session(new_item).peers(new_item)) do
			local params = {
				localize_help = false,
				localize = false,
				to_upper = false,
				callback = "on_visit_fbi_files_suspect"
			}
			slot16 = peer
			params.name = peer.user_id(slot15)
			slot16 = peer
			slot18 = peer
			params.text_id = peer.name(slot15) .. " (" .. (peer.level(slot17) or "") .. ")"
			slot16 = peer
			params.rpc = peer.rpc(" (")
			params.peer = peer
			slot18 = params
			local new_item = node.create_item(" (", node, nil)
			slot18 = new_item

			node.add_item(node, node)
		end
	end

	slot8 = node

	managers.menu.add_back_button(slot6, managers.menu)

	return node
end
function FbiFilesInitiator:refresh_node(node)
	slot5 = node

	return self.modify_node(slot3, self)
end
MenuInitiatorBase = MenuInitiatorBase or class()
function MenuInitiatorBase:modify_node(original_node, data)
	return original_node
end
function MenuInitiatorBase:create_divider(node, id, text_id, size, color)
	local params = {
		name = "divider_" .. id,
		no_text = not text_id,
		text_id = text_id,
		size = size or 8,
		color = color
	}
	local data_node = {
		type = "MenuItemDivider"
	}
	slot12 = params
	local new_item = node.create_item(slot9, node, data_node)
	slot12 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:create_toggle(node, params)
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "ui/main_menu/textures/debug_menu_tickbox",
			x = 24,
			s_icon = "ui/main_menu/textures/debug_menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "ui/main_menu/textures/debug_menu_tickbox",
			x = 0,
			s_icon = "ui/main_menu/textures/debug_menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	slot8 = params
	local new_item = node.create_item(slot5, node, data_node)
	slot8 = params.enabled

	new_item.set_enabled(node, new_item)

	slot8 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:create_item(node, params)
	local data_node = {}
	slot8 = params
	local new_item = node.create_item(slot5, node, data_node)
	slot8 = params.enabled

	new_item.set_enabled(node, new_item)

	slot8 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:create_multichoice(node, choices, params)
	if #choices == 0 then
		return 
	end

	local data_node = {
		type = "MenuItemMultiChoice"
	}
	slot7 = choices

	for _, choice in ipairs(slot6) do
		slot13 = choice

		table.insert(slot11, data_node)
	end

	slot9 = params
	local new_item = node.create_item(slot6, node, data_node)
	slot9 = choices[1].value

	new_item.set_value(node, new_item)

	slot9 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:create_slider(node, params)
	local data_node = {
		type = "CoreMenuItemSlider.ItemSlider",
		show_value = params.show_value,
		min = params.min,
		max = params.max,
		step = params.step,
		show_value = params.show_value
	}
	slot8 = params
	local new_item = node.create_item(slot5, node, data_node)
	slot8 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:create_input(node, params)
	local data_node = {
		type = "MenuItemInput"
	}
	slot8 = params
	local new_item = node.create_item(slot5, node, data_node)
	slot8 = params.enabled

	new_item.set_enabled(node, new_item)

	slot8 = new_item

	node.add_item(node, node)

	return new_item
end
function MenuInitiatorBase:add_back_button(node)
	slot5 = "back"

	node.delete_item(slot3, node)

	local params = {
		visible_callback = "is_pc_controller",
		name = "back",
		back = true,
		text_id = "menu_back",
		last_item = true,
		previous_node = true
	}
	slot7 = params
	local new_item = node.create_item(node, node, nil)
	slot7 = new_item

	node.add_item(node, node)

	return new_item
end

if not MenuChooseWeaponCosmeticInitiator then
	slot2 = MenuInitiatorBase
	slot0 = class(slot1)
end

MenuChooseWeaponCosmeticInitiator = slot0
function MenuChooseWeaponCosmeticInitiator:modify_node(original_node, data)
	local node = deep_clone(slot4)
	slot6 = node

	node.clean_items(original_node)

	slot7 = "divider_end"

	if not node.item(original_node, node) then
		if data and data.instance_ids then
			local sort_items = {}
			slot7 = data.instance_ids

			for id, data in pairs(slot6) do
				slot13 = id

				table.insert(slot11, sort_items)
			end

			slot7 = sort_items

			for _, instance_id in ipairs(slot6) do
				slot14 = {
					localize = false,
					enabled = true,
					name = instance_id,
					text_id = instance_id
				}

				self.create_item(slot11, self, node)
			end

			slot9 = data.instance_ids

			print(inspect(slot8))
		end

		slot8 = "end"

		self.create_divider(slot5, self, node)

		slot7 = node

		self.add_back_button(slot5, self)

		slot7 = "back"

		node.set_default_item_name(slot5, node)

		slot7 = "back"

		node.select_item(slot5, node)
	end

	slot7 = false

	managers.menu_component.set_blackmarket_enabled(slot5, managers.menu_component)

	return node
end
function MenuChooseWeaponCosmeticInitiator:add_back_button(node)
	node.delete_item(slot3, node)

	local params = {
		visible_callback = "is_pc_controller",
		name = "back",
		halign = "right",
		text_id = "menu_back",
		last_item = "true",
		align = "right",
		previous_node = "true"
	}
	local data_node = {}
	slot8 = params
	local new_item = node.create_item("back", node, data_node)
	slot8 = new_item

	node.add_item(node, node)

	return new_item
end

if not MenuOpenContainerInitiator then
	slot2 = MenuInitiatorBase
	slot0 = class(slot1)
end

MenuOpenContainerInitiator = slot0
function MenuOpenContainerInitiator:modify_node(original_node, data)
	local node = deep_clone(slot4)
	slot6 = node
	node.parameters(original_node).container_data = data.container or {}
	slot7 = false

	managers.menu_component.set_blackmarket_enabled(data.container or , managers.menu_component)

	slot7 = node

	self.update_node(data.container or , self)

	return node
end
function MenuOpenContainerInitiator:refresh_node(node)
	slot5 = node

	self.update_node(slot3, self)

	return node
end
function MenuOpenContainerInitiator:update_node(node)
	slot5 = "open_container"
	local item = node.item(slot3, node)

	if item then
		slot5 = item
		slot11 = node
		slot9 = node.parameters(slot10).container_data

		item.set_enabled(slot4, MenuCallbackHandler.have_safe_and_drill_for_container(slot7, MenuCallbackHandler))
	end

	return 
end
MenuEconomySafeInitiator = MenuEconomySafeInitiator or class()
function MenuEconomySafeInitiator:modify_node(node, safe_entry)
	slot5 = node
	node.parameters(slot4).safe_entry = safe_entry

	return node
end

return 
