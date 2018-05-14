GoldAssetExt = GoldAssetExt or class()
slot2 = "gold_asset"
local idstr_gold_asset = Idstring(slot1)
function GoldAssetExt:init(unit)
	self._unit = unit
	self._tweak_data = tweak_data.camp_customization.camp_upgrades[self.tweak_data_name]
	slot6 = false

	self._unit.set_extension_update_enabled(self.tweak_data_name, self._unit, idstr_gold_asset)

	slot4 = self.upgrade_levels

	for _, level in ipairs(self.tweak_data_name) do
		slot11 = unit
		slot14 = level

		managers.gold_economy.register_camp_upgrade_unit(slot8, managers.gold_economy, self.tweak_data_name, tonumber(slot13))
	end

	return 
end
function GoldAssetExt:apply_upgrade_level(level)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot7 = level

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_camp_asset", self._unit)
	end

	if level == 0 then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = "disable_interaction"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "disable_interaction"

				self._unit.damage(slot3).run_sequence(slot3, self._unit.damage(slot3))
			end
		end

		slot5 = false

		self._unit.set_enabled(slot3, self._unit)
	else
		slot7 = level

		Application.debug(slot3, Application, "[GoldAssetExt:apply_upgrade_level] Applying camp upgrade ", self.tweak_data_name)

		slot5 = true

		self._unit.set_enabled(slot3, self._unit)

		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = "enable_interaction"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "enable_interaction"

				self._unit.damage(slot3).run_sequence(slot3, self._unit.damage(slot3))
			end
		end

		local upgrade = self._tweak_data.levels[level]

		if not upgrade then
			slot7 = level

			debug_pause(slot4, "[GoldAssetExt:apply_upgrade_level] Trying to apply non existant level for camp asset", self.tweak_data_name)

			return 
		end

		if upgrade.sequence then
			slot5 = self._unit
			slot6 = upgrade.sequence

			self._unit.damage(slot4).run_sequence_simple(slot4, self._unit.damage(slot4))
		end
	end

	return 
end
function GoldAssetExt:tweak_data()
	return self._tweak_data
end

return 
