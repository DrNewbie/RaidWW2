-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/CopBase"

require(slot1)

if not HuskPlayerBase then
	slot2 = PlayerBase
	slot0 = class(slot1)
end

HuskPlayerBase = slot0
HuskPlayerBase.set_anim_lod = CopBase.set_anim_lod
HuskPlayerBase.set_visibility_state = CopBase.set_visibility_state
HuskPlayerBase._anim_lods = CopBase._anim_lods
function HuskPlayerBase:init(unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	self._upgrades = {}
	self._upgrade_levels = {}
	slot4 = self

	self._setup_suspicion_and_detection_data(slot3)

	slot4 = managers.player
	local player_unit = managers.player.player_unit(slot3)

	if player_unit then
		slot5 = player_unit

		if player_unit.base(slot4) then
			slot5 = managers.player

			managers.player.need_send_player_status(slot4)
		end
	end

	return 
end
function HuskPlayerBase:post_init()
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot4 = self._unit

	managers.occlusion.remove_occlusion(slot2, managers.occlusion)

	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	self._allow_invisible = true
	slot3 = managers.navigation

	if managers.navigation.is_data_ready(slot2) then
		slot3 = self

		self._do_post_init(slot2)
	else
		slot4 = "[HuskPlayerBase:post_init()] Navigation not ready! Queue player post_init method."

		Application.debug(slot2, Application)

		slot6 = self._unit
		self._nav_ready_listener_key = "HuskPlayerBase" .. tostring(self._unit.key(slot5))
		slot5 = {
			"navigation_ready"
		}
		slot10 = "_do_post_init"

		managers.navigation.add_listener(tostring(self._unit.key(slot5)), managers.navigation, self._nav_ready_listener_key, callback(slot7, self, self))
	end

	return 
end
function HuskPlayerBase:_do_post_init()
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	self._unit.movement(slot2).post_init(slot2)

	slot3 = managers.groupai
	slot4 = self._unit

	managers.groupai.state(slot2).register_criminal(slot2, managers.groupai.state(slot2))

	local spawn_state = self._spawn_state or "std/stand/still/idle/look"
	slot4 = self._unit
	slot5 = spawn_state

	self._unit.movement(slot3).play_state(slot3, self._unit.movement(slot3))

	if self._nav_ready_listener_key then
		slot5 = self._nav_ready_listener_key

		managers.navigation.remove_listener(slot3, managers.navigation)
	end

	return 
end
function HuskPlayerBase:set_upgrade_value(category, upgrade, level)
	if category == UpgradesTweakData.CLEAR_UPGRADES_FLAG then
		self._upgrades = {}

		return 
	end

	self._upgrades[category] = self._upgrades[category] or {}
	self._upgrade_levels[category] = self._upgrade_levels[category] or {}
	slot9 = level
	local value = managers.player.upgrade_value_by_level(self._upgrade_levels[category] or , managers.player, category, upgrade)
	self._upgrades[category][upgrade] = value
	self._upgrade_levels[category][upgrade] = level

	if upgrade == "passive_concealment_modifier" then
		slot7 = managers.blackmarket
		slot10 = managers.network
		slot11 = self._unit
		local con_mul, index = managers.blackmarket.get_concealment_of_peer(slot6, managers.network.session(slot9).peer_by_unit(slot9, managers.network.session(slot9)))
		slot11 = 1 / con_mul

		self.set_suspicion_multiplier(managers.network.session(slot9).peer_by_unit, self, "equipment")

		slot11 = 1 / con_mul

		self.set_detection_multiplier(managers.network.session(slot9).peer_by_unit, self, "equipment")
	elseif upgrade == "suspicion_multiplier" then
		slot9 = value

		self.set_suspicion_multiplier(slot6, self, upgrade)
	end

	return 
end
function HuskPlayerBase:upgrade_value(category, upgrade)
	return self._upgrades[category] and self._upgrades[category][upgrade]
end
function HuskPlayerBase:upgrade_level(category, upgrade)
	return self._upgrade_levels[category] and self._upgrade_levels[category][upgrade]
end
function HuskPlayerBase:pre_destroy(unit)
	slot4 = managers.groupai
	slot5 = self._unit

	managers.groupai.state(slot3).unregister_criminal(slot3, managers.groupai.state(slot3))

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot5 = self._unit
		local peer = managers.network.session(slot3).peer_by_unit(slot3, managers.network.session(slot3))

		if peer then
			slot6 = nil

			peer.set_unit(slot4, peer)
		end
	end

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	return 
end
function HuskPlayerBase:nick_name()

	-- Decompilation error in this vicinity:
	slot3 = managers.network
	slot4 = self._unit
	local peer = managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2))
end
function HuskPlayerBase:on_death_exit()
	return 
end
function HuskPlayerBase:chk_freeze_anims()
	return 
end

return 
