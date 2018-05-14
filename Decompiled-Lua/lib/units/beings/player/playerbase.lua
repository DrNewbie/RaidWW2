if not PlayerBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

PlayerBase = slot0
slot3 = "guis/spectator_mode_saferect"
PlayerBase.PLAYER_CUSTODY_HUD = Idstring(slot2)
slot3 = "guis/ingame_hud_saferect"
PlayerBase.INGAME_HUD_SAFERECT = Idstring(slot2)
slot3 = "guis/ingame_hud_fullscreen"
PlayerBase.INGAME_HUD_FULLSCREEN = Idstring(slot2)
PlayerBase.USE_GRENADES = true
function PlayerBase:init(unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	slot4 = self

	self._setup_suspicion_and_detection_data(slot3)

	slot5 = self._unit
	self._id = managers.player.player_id(slot3, managers.player)
	self._rumble_pos_callback = callback(slot3, self, self)
	slot4 = self

	self._setup_controller(slot3)

	slot7 = "base"
	slot6 = false

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring("get_rumble_position"))

	self._stats_screen_visible = false
	slot4 = managers.game_play_central

	managers.game_play_central.restart_portal_effects(slot3)

	return 
end
function PlayerBase:post_init()
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	self._unit.movement(slot2).post_init(slot2)

	slot3 = self

	self._equip_default_weapon(slot2)

	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	if self._unit.movement(slot2).nav_tracker(slot2) then
		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).register_criminal(slot2, managers.groupai.state(slot2))
	else
		self._unregistered = true
	end

	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	self._unit.character_damage(slot2).post_init(slot2)

	slot3 = managers.blackmarket
	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	local con_mul, index = managers.blackmarket.get_concealment_of_peer(slot2, managers.network.session(slot5).local_peer(slot5))
	slot7 = 1 / con_mul

	self.set_suspicion_multiplier(managers.network.session(slot5).local_peer, self, "equipment")

	slot7 = 1 / con_mul

	self.set_detection_multiplier(managers.network.session(slot5).local_peer, self, "equipment")

	return 
end
function PlayerBase:update(unit, t, dt)
	if self._wanted_controller_enabled_t then
		if self._wanted_controller_enabled_t <= 0 then
			if self._wanted_controller_enabled then
				slot7 = true

				self._controller.set_enabled(slot5, self._controller)

				self._wanted_controller_enabled = nil
				self._wanted_controller_enabled_t = nil
			end

			slot9 = "base"
			slot8 = false

			self._unit.set_extension_update_enabled(slot5, self._unit, Idstring(slot8))
		else
			self._wanted_controller_enabled_t = self._wanted_controller_enabled_t - 1
		end
	end

	return 
end
function PlayerBase:_setup_suspicion_and_detection_data()
	slot3 = tweak_data.player.suspicion
	self._suspicion_settings = deep_clone(slot2)
	self._suspicion_settings.multipliers = {}
	self._suspicion_settings.init_buildup_mul = self._suspicion_settings.buildup_mul
	self._suspicion_settings.init_range_mul = self._suspicion_settings.range_mul
	slot3 = self

	self.setup_hud_offset(self._suspicion_settings.range_mul)

	self._detection_settings = {
		multipliers = {},
		init_delay_mul = 1,
		init_range_mul = 1
	}

	return 
end
function PlayerBase:setup_hud_offset(peer)
	if not self._suspicion_settings then
		return 
	end

	slot2 = self._suspicion_settings
	slot5 = managers.blackmarket
	slot3 = managers.blackmarket.get_suspicion_offset_of_peer

	if not peer then
		slot8 = managers.network
		slot8 = managers.network.session(slot7)
		slot6 = managers.network.session(slot7).local_peer(slot7)
	end

	slot7 = tweak_data.player.SUSPICION_OFFSET_LERP or 0.75
	slot2.hud_offset = slot3(slot4, slot5, slot6)

	return 
end
function PlayerBase:stats_screen_visible()
	return self._stats_screen_visible
end
function PlayerBase:set_stats_screen_visible(visible)
	return 
end
function PlayerBase:set_enabled(enabled)
	slot7 = "movement"
	slot6 = enabled

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))

	return 
end
function PlayerBase:set_visible(visible)
	slot5 = visible

	self._unit.set_visible(slot3, self._unit)

	slot4 = self._unit
	slot4 = self._unit.camera(slot3)
	slot5 = visible

	self._unit.camera(slot3).camera_unit(slot3).set_visible(slot3, self._unit.camera(slot3).camera_unit(slot3))

	if visible then
		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)

		self._unit.inventory(slot3).show_equipped_unit(slot3)
	else
		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)

		self._unit.inventory(slot3).hide_equipped_unit(slot3)
	end

	return 
end
function PlayerBase:_equip_default_weapon()
	return 
end
function PlayerBase:_setup_controller()
	slot7 = self._id
	self._controller = managers.controller.create_controller(slot2, managers.controller, "player_" .. tostring(slot6), nil)
	slot5 = self._rumble_pos_callback

	managers.rumble.register_controller(slot2, managers.rumble, self._controller)

	slot4 = "main"

	managers.controller.set_ingame_mode(slot2, managers.controller)

	slot4 = "player_base"
	slot9 = "controller_hotswap_triggered"

	managers.controller.add_hotswap_callback(slot2, managers.controller, callback(false, self, self))

	return 
end
function PlayerBase:controller_hotswap_triggered()
	slot7 = self._id
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "player_" .. tostring(slot6), nil)
	slot5 = self._rumble_pos_callback

	managers.rumble.register_controller(slot2, managers.rumble, self._controller)

	slot4 = "main"

	managers.controller.set_ingame_mode(slot2, managers.controller)

	slot3 = managers.raid_menu

	if managers.raid_menu.is_any_menu_open(slot2) then
		slot4 = false

		self.set_controller_enabled(slot2, self)
	else
		slot4 = true

		self.set_controller_enabled(slot2, self)
	end

	return 
end
function PlayerBase:id()
	return self._id
end
function PlayerBase:nick_name()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)

	return managers.network.session(slot2).local_peer(slot2).name(slot2)
end
function PlayerBase:set_controller_enabled(enabled)
	if not self._controller then
		return 
	end

	if not enabled then
		slot5 = false

		self._controller.set_enabled(slot3, self._controller)
	end

	self._wanted_controller_enabled = enabled

	if self._wanted_controller_enabled then
		self._wanted_controller_enabled_t = 1
		slot7 = "base"
		slot6 = true

		self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))
	end

	return 
end
function PlayerBase:controller()
	return self._controller
end
slot2 = "metal"
local on_ladder_footstep_material = Idstring(function (self)
	return self._controller
end)
function PlayerBase:anim_data_clbk_footstep(foot)
	slot4 = self._unit
	local obj = self._unit.orientation_object(slot3)
	local proj_dir = math.UP
	slot6 = obj
	local proj_from = obj.position(slot5)
	local proj_to = proj_from - proj_dir * 30
	local material_name, pos, norm = nil
	slot11 = self._unit
	slot11 = self._unit.movement(slot10)

	if self._unit.movement(slot10).on_ladder(slot10) then
		material_name = on_ladder_footstep_material
	else
		slot13 = proj_to
		slot17 = "surface_move"
		material_name, pos, norm = World.pick_decal_material(slot10, World, proj_from, managers.slot.get_mask(slot15, managers.slot))
	end

	slot11 = self._unit
	slot13 = material_name

	self._unit.sound(slot10).play_footstep(slot10, self._unit.sound(slot10), foot)

	return 
end
function PlayerBase:get_rumble_position()
	slot3 = self._unit

	return self._unit.position(slot2) + math.UP * 100
end
function PlayerBase:replenish()
	slot5 = self._unit
	slot5 = self._unit.inventory(slot4)

	for id, weapon in pairs(self._unit.inventory(slot4).available_selections(slot4)) do
		slot8 = weapon.unit

		if alive(slot7) then
			slot8 = weapon.unit
			slot8 = weapon.unit.base(slot7)

			weapon.unit.base(slot7).replenish(slot7)

			slot9 = id
			slot12 = weapon.unit
			slot12 = weapon.unit.base(slot11)

			managers.hud.set_ammo_amount(slot7, managers.hud, weapon.unit.base(slot11).ammo_info(slot11))
		end
	end

	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	self._unit.character_damage(slot2).replenish(slot2)

	return 
end
function PlayerBase:suspicion_settings()
	return self._suspicion_settings
end
function PlayerBase:detection_settings()
	return self._detection_settings
end
function PlayerBase:set_suspicion_multiplier(reason, multiplier)
	self._suspicion_settings.multipliers[reason] = multiplier
	local buildup_mul = self._suspicion_settings.init_buildup_mul
	local range_mul = self._suspicion_settings.init_range_mul
	slot7 = self._suspicion_settings.multipliers

	for reason, mul in pairs(slot6) do
		buildup_mul = buildup_mul * mul

		if 1 < mul then
			slot12 = mul
			range_mul = range_mul * math.sqrt(slot11)
		end
	end

	self._suspicion_settings.buildup_mul = buildup_mul
	self._suspicion_settings.range_mul = range_mul

	return 
end
function PlayerBase:set_detection_multiplier(reason, multiplier)
	self._detection_settings.multipliers[reason] = multiplier
	local delay_mul = self._detection_settings.init_delay_mul
	local range_mul = self._detection_settings.init_range_mul
	slot7 = self._detection_settings.multipliers

	for reason, mul in pairs(slot6) do
		delay_mul = (delay_mul * 1) / mul
		slot12 = mul
		range_mul = range_mul * math.sqrt(slot11)
	end

	self._detection_settings.delay_mul = delay_mul
	self._detection_settings.range_mul = range_mul

	return 
end
function PlayerBase:arrest_settings()
	return tweak_data.player.arrest
end
function PlayerBase:_unregister()
	if not self._unregistered then
		slot3 = self._unit
		slot3 = self._unit.movement(slot2)
		slot4 = nil

		self._unit.movement(slot2).attention_handler(slot2).set_attention(slot2, self._unit.movement(slot2).attention_handler(slot2))

		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).unregister_criminal(slot2, managers.groupai.state(slot2))

		self._unregistered = true
	end

	return 
end
function PlayerBase:pre_destroy(unit)
	slot4 = self

	self._unregister(slot3)

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	slot5 = self._id

	managers.player.player_destroyed(slot3, managers.player)

	if self._controller then
		slot6 = self._rumble_pos_callback

		managers.rumble.unregister_controller(slot3, managers.rumble, self._controller)

		slot5 = "player_base"

		managers.controller.remove_hotswap_callback(slot3, managers.controller)

		slot4 = self._controller

		self._controller.destroy(slot3)

		self._controller = nil
	end

	slot4 = managers.hud

	managers.hud.clear_weapons(slot3)

	slot5 = false

	self.set_stats_screen_visible(slot3, self)

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
		local peer = managers.network.session(slot3).local_peer(slot3)

		if peer then
			slot6 = nil

			peer.set_unit(slot4, peer)
		end
	end

	return 
end

return 
