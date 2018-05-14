if not InstigatorRuleUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InstigatorRuleUnitElement = slot0
InstigatorRuleUnitElement.SAVE_UNIT_POSITION = false
InstigatorRuleUnitElement.SAVE_UNIT_ROTATION = false
function InstigatorRuleUnitElement:init(unit)
	slot5 = unit

	InstigatorRuleUnitElement.super.init(slot3, self)

	self._hed.instigator = "none"
	self._hed.rules = {}
	self._hed.invert = false
	slot5 = "instigator"

	table.insert(false, self._save_values)

	slot5 = "rules"

	table.insert(false, self._save_values)

	slot5 = "invert"

	table.insert(false, self._save_values)

	return 
end
function InstigatorRuleUnitElement:_rule_updated(category, value)
	self._hed.rules[self._hed.instigator] = self._hed.rules[self._hed.instigator] or {}
	self._hed.rules[self._hed.instigator][category] = (0 < #value and value) or nil

	return 
end
function InstigatorRuleUnitElement:_instigator_changed(params)
	slot4 = self

	self._update_rules_panel(slot3)

	return 
end
function InstigatorRuleUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local instigator_params = {
		name = "Instigator:",
		name_proportions = 1,
		tooltip = "Select an instigator type for the area",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = panel_sizer
	}
	slot6 = managers.mission
	instigator_params.options = managers.mission.area_instigator_categories(slot5)
	instigator_params.value = self._hed.instigator
	local instigator = CoreEWS.combobox(slot5)
	slot13 = "set_element_data"

	instigator.connect(instigator_params, instigator, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	slot13 = "_instigator_changed"
	slot10 = {
		ctrlr = instigator
	}

	instigator.connect(instigator_params, instigator, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		value = "instigator",
		ctrlr = instigator
	}, self, self))

	slot12 = "Invert rule"

	self._build_value_checkbox(instigator_params, self, panel, panel_sizer, "invert", "Check this to have the rule inverted, i.e. exclude one unit from triggering the connected element")

	slot10 = "TAB_TRAVERSAL"
	self._rules_panel = EWS.Panel(instigator_params, EWS, panel, "rules_panel")
	slot8 = "VERTICAL"
	self._rules_panel_sizer = EWS.BoxSizer(instigator_params, EWS)
	slot8 = self._rules_panel_sizer

	self._rules_panel.set_sizer(instigator_params, self._rules_panel)

	slot7 = self._rules_panel

	self._rules_panel.destroy_children(instigator_params)

	slot11 = "EXPAND"

	panel_sizer.add(instigator_params, panel_sizer, self._rules_panel, 1, 1)

	slot7 = self

	self._update_rules_panel(instigator_params)

	return 
end
function InstigatorRuleUnitElement:_update_rules_panel(panel, panel_sizer)
	panel = self._rules_panel
	panel_sizer = self._rules_panel_sizer
	slot5 = self._rules_panel

	self._rules_panel.destroy_children(slot4)

	local instigator = self._hed.instigator

	if instigator == "player" then
		local states_params = {
			name = "Player states:",
			tooltip = "Select player state rules",
			panel = panel,
			sizer = panel_sizer
		}
		slot7 = managers.player
		states_params.options = managers.player.player_states(slot6)
		states_params.value = self._hed.rules[instigator] and self._hed.rules[instigator].states
		slot10 = "states"
		states_params.updated_callback = callback(slot6, self, self, "_rule_updated")
		slot7 = states_params
		local states = CoreEws.list_selector(slot6)
		local carry_ids_params = {
			name = "Carry ids:",
			tooltip = "Select player carry ids rules",
			panel = panel,
			sizer = panel_sizer
		}
		slot9 = tweak_data.carry
		carry_ids_params.options = tweak_data.carry.get_carry_ids(self)
		carry_ids_params.value = self._hed.rules[instigator] and self._hed.rules[instigator].carry_ids
		slot12 = "carry_ids"
		carry_ids_params.updated_callback = callback(slot8, self, self, "_rule_updated")
		slot9 = carry_ids_params
		local states = CoreEws.list_selector(slot8)
		local options = {}
		slot11 = tweak_data.equipments.specials

		for name, _ in pairs(self) do
			slot17 = name

			table.insert(slot15, options)
		end

		local mission_equipment_params = {
			name = "Mission equipment:",
			tooltip = "Select player mission equipment rules",
			panel = panel,
			sizer = panel_sizer,
			options = options,
			value = self._hed.rules[instigator] and self._hed.rules[instigator].mission_equipment
		}
		slot15 = "mission_equipment"
		mission_equipment_params.updated_callback = callback(slot11, self, self, "_rule_updated")
		slot12 = mission_equipment_params
		slot10 = CoreEws.list_selector(slot11)
	elseif instigator == "enemies" then
		local carry_ids_params = {
			name = "Enemy name:",
			tooltip = "Select enemy names rules",
			panel = panel,
			sizer = panel_sizer
		}
		slot7 = managers.enemy
		carry_ids_params.options = managers.enemy.enemy_units(slot6)
		carry_ids_params.value = self._hed.rules[instigator] and self._hed.rules[instigator].enemy_names
		slot10 = "enemy_names"
		carry_ids_params.updated_callback = callback(slot6, self, self, "_rule_updated")
		slot7 = carry_ids_params
		local states = CoreEws.list_selector(slot6)
		local pickups_params = {
			name = "Pickup:",
			tooltip = "Select a pickup rule",
			panel = panel,
			sizer = panel_sizer,
			options = PickupUnitElement.get_options(),
			value = self._hed.rules[instigator] and self._hed.rules[instigator].pickup
		}
		slot12 = "pickup"
		pickups_params.updated_callback = callback(slot8, self, self, "_rule_updated")
		slot9 = pickups_params
		slot7 = CoreEws.list_selector(slot8)
	elseif instigator == "civilians" then
		local civilian_names_params = {
			name = "Civilian name:",
			tooltip = "Select civilian names rules",
			panel = panel,
			sizer = panel_sizer,
			options = SpawnCivilianUnitElement._options,
			value = self._hed.rules[instigator] and self._hed.rules[instigator].civilian_names
		}
		slot10 = "civilian_names"
		civilian_names_params.updated_callback = callback(slot6, self, self, "_rule_updated")
		slot7 = civilian_names_params
		local states = CoreEws.list_selector(slot6)
		local pickups_params = {
			name = "Pickup:",
			tooltip = "Select a pickup rule",
			panel = panel,
			sizer = panel_sizer,
			options = PickupUnitElement.get_options(),
			value = self._hed.rules[instigator] and self._hed.rules[instigator].pickup
		}
		slot12 = "pickup"
		pickups_params.updated_callback = callback(slot8, self, self, "_rule_updated")
		slot9 = pickups_params
		slot7 = CoreEws.list_selector(slot8)
	elseif instigator == "loot" then
		local params = {
			name = "Carry ids:",
			tooltip = "Select a loot carry id rule",
			panel = panel,
			sizer = panel_sizer
		}
		slot7 = tweak_data.carry
		params.options = tweak_data.carry.get_carry_ids(slot6)
		params.value = self._hed.rules[instigator] and self._hed.rules[instigator].carry_ids
		slot10 = "carry_ids"
		params.updated_callback = callback(slot6, self, self, "_rule_updated")
		slot7 = params
		slot5 = CoreEws.list_selector(slot6)
	end

	slot6 = self._rules_panel

	self._rules_panel.layout(slot5)

	slot6 = self._panel

	self._panel.layout(slot5)

	slot7 = "Mission"
	slot6 = managers.editor.layer(slot5, managers.editor)

	managers.editor.layer(slot5, managers.editor).do_layout(slot5)

	return 
end

return 
