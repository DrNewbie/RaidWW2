if not GoldAssetAutomaticExt then
	slot2 = GoldAssetExt
	slot0 = class(slot1)
end

GoldAssetAutomaticExt = slot0
slot2 = "gold_asset"
local idstr_gold_asset = Idstring(slot1)
function GoldAssetAutomaticExt:init(unit)
	self._unit = unit
	self._tweak_data = tweak_data.camp_customization.camp_upgrades_automatic[self.tweak_data_name]
	slot6 = false

	self._unit.set_extension_update_enabled(self.tweak_data_name, self._unit, idstr_gold_asset)

	if self._tweak_data.gold then
		slot6 = unit

		managers.gold_economy.register_automatic_camp_upgrade_unit(slot3, managers.gold_economy, self.tweak_data_name)
	end

	return 
end
function GoldAssetAutomaticExt:apply_upgrade_level(level)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot7 = level

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_automatic_camp_asset", self._unit)

		slot5 = level

		self._apply_upgrade_level(slot3, self)
	end

	return 
end
function GoldAssetAutomaticExt:_apply_upgrade_level(level)
	slot5 = true

	self._unit.set_enabled(slot3, self._unit)

	slot4 = self._unit

	if self._unit.damage(slot3) then
		slot4 = self._unit
		slot5 = "reset"

		if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
			slot4 = self._unit
			slot5 = "reset"

			self._unit.damage(slot3).run_sequence(slot3, self._unit.damage(slot3))
		end
	end

	if 0 < level then
		for counter = 1, level, 1 do
			slot8 = self._unit
			slot13 = counter
			slot9 = "level_" .. string.format(slot11, "%02d")

			self._unit.damage(slot7).run_sequence_simple(slot7, self._unit.damage(slot7))
		end
	end

	return 
end

return 
