-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
GoldEconomyManager = GoldEconomyManager or class()
GoldEconomyManager.THOUSAND_SEPARATOR = "."
GoldEconomyManager.VERSION = 7
function GoldEconomyManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function GoldEconomyManager:_setup()
	if not Global.gold_economy_manager then
		Global.gold_economy_manager = {}
		slot6 = true
		Global.gold_economy_manager.total = Application.digest_value(slot3, Application, 0)
		slot6 = true
		Global.gold_economy_manager.current = Application.digest_value(slot3, Application, 0)
		slot6 = true
		Global.gold_economy_manager.respec_cost_multiplier = Application.digest_value(slot3, Application, 0)
		slot6 = true
		Global.gold_economy_manager.respec_reset = Application.digest_value(slot3, Application, 10)
		slot4 = tweak_data.camp_customization.default_camp
		Global.gold_economy_manager.applied_upgrades = deep_clone(slot3)
		slot4 = tweak_data.camp_customization
		Global.gold_economy_manager.owned_upgrades = tweak_data.camp_customization.get_applyable_upgrades(slot3)
		Global.gold_economy_manager.gold_awards = {}
	end

	self._global = Global.gold_economy_manager
	self._camp_units = {}
	self._automatic_camp_units = {}

	return 
end
function GoldEconomyManager:debug_add_gold(amount)
	slot6 = true

	self.add_gold(slot3, self, amount)

	return 
end
function GoldEconomyManager:spend_gold(amount, is_debug)
	if amount <= 0 then
		return 
	end

	slot8 = self
	slot6 = self.current(slot7) - amount

	self._set_current(slot4, self)

	slot5 = managers.raid_menu

	managers.raid_menu.refresh_footer_gold_amount(slot4)

	return 
end
function GoldEconomyManager:add_gold(amount, is_debug)
	if amount <= 0 then
		return 
	end

	slot8 = self
	slot6 = self.current(slot7) + amount

	self._set_current(slot4, self)

	slot8 = self
	slot6 = self.total(slot7) + amount

	self._set_total(slot4, self)

	slot5 = managers.raid_menu

	managers.raid_menu.refresh_footer_gold_amount(slot4)

	return 
end
function GoldEconomyManager:total()
	slot5 = false

	return Application.digest_value(slot2, Application, self._global.total)
end
function GoldEconomyManager:_set_total(value)
	slot7 = true
	self._global.total = Application.digest_value(slot4, Application, value)

	return 
end
function GoldEconomyManager:current()
	slot5 = false

	return Application.digest_value(slot2, Application, self._global.current)
end
function GoldEconomyManager:_set_current(value)
	slot7 = true
	self._global.current = Application.digest_value(slot4, Application, value)

	return 
end
function GoldEconomyManager:respec()
	slot3 = self
	slot6 = self

	self.spend_gold(slot2, self.respec_cost(slot5))

	slot5 = false
	local old = Application.digest_value(slot2, Application, self._global.respec_cost_multiplier)
	slot7 = true
	self._global.respec_cost_multiplier = Application.digest_value(self._global.respec_cost_multiplier, Application, old + 1)

	return 
end
function GoldEconomyManager:decrease_respec_reset()
	slot5 = false
	local old = Application.digest_value(slot2, Application, self._global.respec_reset)
	local new = old - 1

	if new == 1 then
		slot7 = false
		local old_multiplier = Application.digest_value(slot4, Application, self._global.respec_cost_multiplier)
		local new_multiplier = old_multiplier - 1

		if new_multiplier < 0 then
			new_multiplier = 0
		end

		slot10 = true
		self._global.respec_cost_multiplier = Application.digest_value(slot7, Application, new_multiplier)
		new = 10
	end

	slot8 = true
	self._global.respec_reset = Application.digest_value(slot5, Application, new)

	return 
end
function GoldEconomyManager:respec_reset_value()
	slot5 = false

	return Application.digest_value(slot2, Application, self._global.respec_reset)
end
function GoldEconomyManager:respec_cost()
	slot5 = false
	local multiplier = Application.digest_value(slot2, Application, self._global.respec_cost_multiplier)
	local char_level = managers.experience.current_level(Application)
	slot5 = char_level * (1 + multiplier) * TweakData.RESPEC_COST_CONSTANT
	local cost = math.ceil(managers.experience)

	return cost
end
function GoldEconomyManager:respec_cost_string()
	slot3 = self
	slot6 = self

	return self.gold_string(slot2, self.respec_cost(slot5))
end
function GoldEconomyManager:gold_string(amount)
	slot8 = amount
	local total = tostring(math.round(math.abs(slot7)))
	slot5 = total
	local reverse = string.reverse(math.round)
	local s = ""
	slot8 = reverse

	for i = 1, string.len(slot7), 1 do

		-- Decompilation error in this vicinity:
		slot9 = s
		slot14 = i
		slot10 = string.sub(slot11, reverse, i)
		slot14 = 3
		slot13 = reverse
		s = slot9 .. slot10 .. ((i ~= string.len(slot12) and GoldEconomyManager.THOUSAND_SEPARATOR) or "")
	end

	slot7 = s
	s = string.reverse(slot6)

	if amount < 0 then
		s = "-" .. s
	end

	return s
end
function GoldEconomyManager:save(data)
	local state = {
		version = GoldEconomyManager.VERSION,
		total = self._global.total,
		current = self._global.current,
		respec_cost_multiplier = self._global.respec_cost_multiplier,
		respec_reset = self._global.respec_reset,
		applied_upgrades = self._global.applied_upgrades,
		owned_upgrades = self._global.owned_upgrades,
		gold_awards = self._global.gold_awards
	}
	data.GoldEconomyManager = state

	return 
end
function GoldEconomyManager:load(data)
	slot4 = self

	self.reset(slot3)

	local state = data.GoldEconomyManager

	if state then
		self._global.total = state.total or 0
		self._global.current = state.current or 0

		if state.respec_cost_multiplier then
			self._global.respec_cost_multiplier = state.respec_cost_multiplier
		end

		if state.respec_reset then
			self._global.respec_reset = state.respec_reset
		end
	end

	local needs_upgrade = false

	if not state or not state.version or state.version ~= GoldEconomyManager.VERSION then
		needs_upgrade = true
		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)
	else
		self._global.applied_upgrades = state.applied_upgrades
		self._global.owned_upgrades = state.owned_upgrades
	end

	slot6 = self

	self.append_camp_upgrades(slot5)

	if not needs_upgrade then
		slot6 = self
		needs_upgrade = self.filter_camp_upgrades(slot5)
	end

	if needs_upgrade then
		slot6 = self

		self.upgrade_player_camp(slot5)
	end

	self._global.gold_awards = (state and state.gold_awards) or {}
	slot6 = self

	self.get_gold_awards((state and state.gold_awards) or )

	return 
end
function GoldEconomyManager:get_gold_awards()
	local eligible_awards = tweak_data.dlc.get_eligible_gold_awards(slot2)
	slot4 = eligible_awards

	for _, award in pairs(tweak_data.dlc) do
		if not self._global.gold_awards[award.item] then
			self._global.gold_awards[award.item] = true
			slot10 = award.amount

			self.add_gold(award.item, self)

			slot9 = managers.savefile

			managers.savefile.set_resave_required(award.item)
		end
	end

	return 
end
function GoldEconomyManager:append_camp_upgrades()
	local applyable_upgrades = tweak_data.camp_customization.get_applyable_upgrades(slot2)
	slot4 = applyable_upgrades

	for _, upgrade in pairs(tweak_data.camp_customization) do
		slot11 = upgrade.level

		if not self.is_upgrade_owned(slot8, self, upgrade.upgrade) then
			slot10 = upgrade

			table.insert(slot8, self._global.owned_upgrades)
		end
	end

	return 
end
function GoldEconomyManager:filter_camp_upgrades()
	for index = #self._global.owned_upgrades, 1, -1 do
		local upgrade = self._global.owned_upgrades[index]
		local upgrade_data = tweak_data.camp_customization.camp_upgrades[upgrade.upgrade].levels[upgrade.level]

		if upgrade_data then
			slot10 = upgrade_data

			if not tweak_data.camp_customization.is_upgrade_unlocked(slot8, tweak_data.camp_customization) then
				slot10 = index

				table.remove(slot8, self._global.owned_upgrades)
			end
		end
	end

	local needs_layout = false

	for index = #self._global.applied_upgrades, 1, -1 do
		local upgrade = self._global.applied_upgrades[index]
		slot11 = upgrade.level

		if not self.is_upgrade_owned(slot8, self, upgrade.upgrade) then
			slot10 = upgrade.upgrade
			local default_level = tweak_data.camp_customization.get_default_upgrade_level(slot8, tweak_data.camp_customization)

			if upgrade.level ~= default_level then
				upgrade.level = default_level
				needs_layout = true
			end
		end
	end

	return needs_layout
end
function GoldEconomyManager:upgrade_player_camp()
	slot3 = tweak_data.camp_customization.default_camp

	for _, data in ipairs(slot2) do
		local found = false
		slot9 = self._global.applied_upgrades

		for __, camp in ipairs(slot8) do
			if camp.upgrade == data.upgrade then
				found = true

				break
			end
		end

		if not found then
			slot11 = data.upgrade

			Application.debug(slot8, Application, "[GoldEconomyManager:upgrade_player_camp()] Adding new camp asset")

			slot10 = {
				level = data.level,
				upgrade = data.upgrade
			}

			table.insert(slot8, self._global.applied_upgrades)
		end
	end

	return 
end
function GoldEconomyManager:layout_camp()
	slot3 = managers.player

	if not managers.player.local_player_in_camp(slot2) then
		return 
	end

	slot3 = self._automatic_camp_units

	for upgrade_name, unit in pairs(slot2) do
		local gold_spread = tweak_data.camp_customization.camp_upgrades_automatic[upgrade_name].gold
		slot10 = gold_spread
		local gold_level = self._calculate_gold_pile_level(slot8, self)
		slot10 = unit
		slot11 = gold_level

		unit.gold_asset(self).apply_upgrade_level(self, unit.gold_asset(self))
	end

	slot3 = self._global.applied_upgrades

	for _, data in ipairs(slot2) do
		local levels = self._camp_units[data.upgrade]
		local asset_level = nil
		asset_level = data.level

		if levels then
			slot10 = levels

			for level, units in pairs(slot9) do
				slot15 = units

				for _, unit in pairs(slot14) do
					if level == asset_level then
						slot20 = unit
						slot21 = asset_level

						unit.gold_asset(slot19).apply_upgrade_level(slot19, unit.gold_asset(slot19))
					else
						slot20 = unit
						slot21 = 0

						unit.gold_asset(slot19).apply_upgrade_level(slot19, unit.gold_asset(slot19))
					end
				end
			end
		end
	end

	return 
end
function GoldEconomyManager:_calculate_gold_pile_level(gold_spread)
	local index = #gold_spread + 1
	slot5 = self

	if self.current(slot4) == 0 then
		return 0
	end

	slot5 = gold_spread

	for i, value in ipairs(slot4) do
		slot10 = self

		if self.current(slot9) < value then
			index = i - 1

			break
		end
	end

	return index
end
function GoldEconomyManager:reset()
	Global.gold_economy_manager = nil
	slot3 = self

	self._setup(nil)

	slot3 = self

	self.get_gold_awards(nil)

	return 
end
function GoldEconomyManager:get_difficulty_multiplier(difficulty)
	slot7 = difficulty
	local multiplier = tweak_data.get_value(slot3, tweak_data, "experience_manager", "difficulty_multiplier")

	return multiplier or 0
end
function GoldEconomyManager:register_camp_upgrade_unit(name, unit, level)
	self._camp_units[name] = self._camp_units[name] or {}

	if not self._camp_units[name][level] then
		self._camp_units[name][level] = {}
	end

	slot7 = unit

	table.insert(slot5, self._camp_units[name][level])

	return 
end
function GoldEconomyManager:register_automatic_camp_upgrade_unit(name, unit)
	self._automatic_camp_units[name] = self._automatic_camp_units[name] or {}

	if not self._automatic_camp_units[name] then
		self._automatic_camp_units[name] = {}
	end

	self._automatic_camp_units[name] = unit

	return 
end
function GoldEconomyManager:reset_camp_units()
	self._camp_units = {}

	return 
end
function GoldEconomyManager:get_store_items_data()
	local result = {}
	local is_host = Network.is_server(slot3)
	slot5 = tweak_data.camp_customization.camp_upgrades

	for upgrade_slot_name, upgrade_slot in pairs(Network) do
		slot10 = upgrade_slot.levels

		for upgrade_level, upgrade in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			slot17 = upgrade_level
			local is_default = tweak_data.camp_customization.is_default_upgrade(slot14, tweak_data.camp_customization, upgrade_slot_name)
		end
	end

	GoldEconomyManager.store = result

	return result
end
function GoldEconomyManager:is_upgrade_owned(upgrade_slot_name, upgrade_level)
	slot5 = self._global.owned_upgrades

	for _, upgrade in ipairs(slot4) do
		if upgrade.upgrade == upgrade_slot_name and upgrade.level == upgrade_level then
			return true
		end
	end

	return false
end
function GoldEconomyManager:is_upgrade_applied(upgrade_slot_name, upgrade_level)
	slot5 = self._global.applied_upgrades

	for _, upgrade in ipairs(slot4) do
		if upgrade.upgrade == upgrade_slot_name and upgrade.level == upgrade_level then
			return true
		end
	end

	return false
end
function GoldEconomyManager:_get_current_camp_upgrade_data(upgrade_slot_name)
	slot4 = self._global.applied_upgrades

	for _, upgrade_slot_name in pairs(slot3) do
		if upgrade_slot_name == camp_upgrade_data.upgrade then
			return camp_upgrade_data
		end
	end

	return nil
end
function GoldEconomyManager:update_camp_upgrade(upgrade_slot_name, upgrade_level)
	if not upgrade_slot_name or not upgrade_level then
		return 
	end

	slot5 = self._global.applied_upgrades

	for _, camp_upgrade_data in pairs(slot4) do
		if camp_upgrade_data.upgrade == upgrade_slot_name and camp_upgrade_data.level ~= upgrade_level then
			camp_upgrade_data.level = upgrade_level
		end
	end

	slot7 = upgrade_level

	if not self.is_upgrade_owned(slot4, self, upgrade_slot_name) then
		slot6 = {
			upgrade = upgrade_slot_name,
			level = upgrade_level
		}

		table.insert(slot4, self._global.owned_upgrades)
	end

	return 
end

return 
