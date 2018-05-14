if not HUDMapTab then
	slot2 = HUDMapBase
	slot0 = class(slot1)
end

HUDMapTab = slot0
HUDMapTab.BACKGROUND_LAYER = 1
HUDMapTab.INNER_PANEL_LAYER = 2
HUDMapTab.WAYPOINT_PANEL_LAYER = 3
HUDMapTab.PLAYER_PINS_LAYER = 5
HUDMapTab.PIN_PANEL_PADDING = 50
function HUDMapTab:init(panel, params)
	slot6 = params

	HUDMapTab.super.init(slot4, self)

	slot7 = params

	self._create_panel(slot4, self, panel)

	slot5 = self

	self._create_inner_panel(slot4)

	slot5 = self

	self._create_pin_panel(slot4)

	slot5 = self

	self._create_waypoint_panel(slot4)

	self._waypoints = {}

	return 
end
function HUDMapTab:_create_panel(panel, params)
	local panel_params = {
		halign = "scale",
		name = "map_panel",
		valign = "scale"
	}

	if not params.layer then
		slot6 = panel
		slot4 = panel.layer(slot5)
	end

	panel_params.layer = slot4
	slot7 = panel_params
	self._object = panel.panel(slot5, panel)

	return 
end
function HUDMapTab:_create_inner_panel()
	local inner_panel_params = {
		halign = "center",
		name = "inner_panel",
		valign = "center",
		layer = HUDMapTab.INNER_PANEL_LAYER
	}
	slot5 = inner_panel_params
	self._inner_panel = self._object.panel(slot3, self._object)

	return 
end
function HUDMapTab:_create_pin_panel()
	slot4 = "player_pins_panel"

	if self._object.child(slot2, self._object) then
		slot4 = "player_pins_panel"
		slot3 = self._object.child(slot2, self._object)

		self._object.child(slot2, self._object).clear(slot2)

		slot3 = self._object
		slot7 = "player_pins_panel"

		self._object.remove(slot2, self._object.child(slot5, self._object))
	end

	local player_pins_panel_params = {
		halign = "scale",
		name = "player_pins_panel",
		valign = "scale",
		layer = HUDMapTab.PLAYER_PINS_LAYER
	}
	slot5 = player_pins_panel_params
	local player_pins_panel = self._inner_panel.panel(slot3, self._inner_panel)

	return 
end
function HUDMapTab:_create_waypoint_panel()
	slot4 = "waypoint_panel"

	if self._object.child(slot2, self._object) then
		slot4 = "waypoint_panel"
		slot3 = self._object.child(slot2, self._object)

		self._object.child(slot2, self._object).clear(slot2)

		slot3 = self._object
		slot7 = "waypoint_panel"

		self._object.remove(slot2, self._object.child(slot5, self._object))
	end

	local waypoint_panel_params = {
		halign = "scale",
		name = "waypoint_panel",
		valign = "scale",
		layer = HUDMapTab.WAYPOINT_PANEL_LAYER
	}
	slot5 = waypoint_panel_params
	local waypoint_panel = self._inner_panel.panel(slot3, self._inner_panel)

	return 
end
function HUDMapTab:_fit_inner_panel()
	local panel_shape = tweak_data.levels[self._current_level].map.panel_shape
	slot5 = "map_background_panel"
	local background_panel = self._object.child(slot3, self._object)
	local x = (background_panel.x(self._object) + panel_shape.x) - HUDMapTab.PIN_PANEL_PADDING
	slot6 = background_panel
	local y = (background_panel.y(background_panel) + panel_shape.y) - HUDMapTab.PIN_PANEL_PADDING
	local w = panel_shape.w + HUDMapTab.PIN_PANEL_PADDING * 2
	local h = panel_shape.h + HUDMapTab.PIN_PANEL_PADDING * 2
	slot13 = h

	self._inner_panel.set_shape(slot8, self._inner_panel, x, y, w)

	return 
end
function HUDMapTab:_create_player_pins()
	slot4 = "player_pins_panel"
	local pin_panel = self._inner_panel.child(slot2, self._inner_panel)
	slot4 = pin_panel

	pin_panel.clear(self._inner_panel)

	self._player_pins = {}
	slot5 = pin_panel

	self._create_peer_pins(self._inner_panel, self)

	slot5 = pin_panel

	self._create_ai_pins(self._inner_panel, self)

	return 
end
function HUDMapTab:_create_peer_pins(panel)
	slot4 = managers.network
	local peers = managers.network.session(slot3).all_peers(slot3)
	slot5 = peers

	for index, peer in pairs(managers.network.session(slot3)) do
		local peer_pin_params = {
			id = index
		}
		slot11 = peer
		peer_pin_params.nationality = peer.character(slot10)
		slot13 = peer_pin_params
		local peer_pin = HUDMapPlayerPin.new(slot10, HUDMapPlayerPin, panel)
		slot12 = managers.network
		slot12 = managers.network.session(HUDMapPlayerPin)

		if peer == managers.network.session(HUDMapPlayerPin).local_peer(HUDMapPlayerPin) then
			self._local_player_pin = peer_pin
		end

		slot13 = peer_pin

		table.insert(slot11, self._player_pins)
	end

	return 
end
function HUDMapTab:_create_ai_pins(panel)
	slot4 = managers.criminals
	local ai_characters = managers.criminals.ai_criminals(slot3)
	local peer_pins_number = #self._player_pins
	slot6 = ai_characters

	for index, ai_character in pairs(slot5) do
		local peer_pin_params = {
			ai = true,
			id = peer_pins_number + index,
			nationality = ai_character.name
		}
		slot14 = peer_pin_params
		local peer_pin = HUDMapPlayerPin.new(slot11, HUDMapPlayerPin, panel)
		slot14 = peer_pin

		table.insert(HUDMapPlayerPin, self._player_pins)
	end

	return 
end
function HUDMapTab:_setup_level(level)
	slot5 = level

	self._set_level(slot3, self)

	slot4 = self

	self._create_map_background(slot3)

	slot4 = self

	self._fit_inner_panel(slot3)

	slot4 = self

	self._create_base_icon(slot3)

	slot4 = self

	self._create_player_pins(slot3)

	slot4 = self

	self._create_waypoints(slot3)

	return 
end
function HUDMapTab:_create_map_background()
	slot4 = "map_background_panel"

	if self._object.child(slot2, self._object) then
		slot3 = self._object
		slot7 = "map_background_panel"

		self._object.remove(slot2, self._object.child(slot5, self._object))
	end

	local map_texture = tweak_data.levels[self._current_level].map.texture
	local background_panel_params = {
		name = "map_background_panel",
		halign = "center",
		valign = "center"
	}
	slot6 = map_texture
	background_panel_params.w = tweak_data.gui.icon_w(slot4, tweak_data.gui)
	slot6 = map_texture
	background_panel_params.h = tweak_data.gui.icon_h(slot4, tweak_data.gui)
	background_panel_params.layer = HUDMapTab.BACKGROUND_LAYER
	slot6 = background_panel_params
	local background_panel = self._object.panel(slot4, self._object)
	slot9 = self._object
	slot7 = self._object.w(slot8) / 2

	background_panel.set_center_x(self._object, background_panel)

	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	background_panel.set_center_y(self._object, background_panel)

	local background_image_params = {
		name = "background_image",
		texture = tweak_data.gui.icons[map_texture].texture,
		texture_rect = tweak_data.gui.icons[map_texture].texture_rect
	}
	slot8 = background_image_params
	local background_image = background_panel.bitmap(background_panel, background_panel)

	return 
end
function HUDMapTab:_create_base_icon()
	slot4 = "map_background_panel"
	local background_panel = self._object.child(slot2, self._object)
	slot5 = "base_icon"

	if self._inner_panel.child(self._object, self._inner_panel) then
		slot4 = self._inner_panel
		slot8 = "base_icon"

		self._inner_panel.remove(slot3, self._inner_panel.child(slot6, self._inner_panel))
	end

	slot6 = tweak_data.levels[self._current_level].map.base_location.y
	local base_x, base_y = self._get_map_position(slot3, self, tweak_data.levels[self._current_level].map.base_location.x)
	local base_icon_texture = tweak_data.levels[self._current_level].map.base_icon or "map_camp"
	local base_icon_params = {
		name = "base_icon",
		texture = tweak_data.gui.icons[base_icon_texture].texture,
		texture_rect = tweak_data.gui.icons[base_icon_texture].texture_rect
	}
	slot9 = base_icon_params
	local base_icon = self._inner_panel.bitmap(slot7, self._inner_panel)
	slot10 = base_x

	base_icon.set_center_x(self._inner_panel, base_icon)

	slot10 = base_y

	base_icon.set_center_y(self._inner_panel, base_icon)

	return 
end
function HUDMapTab:_create_waypoints()
	slot4 = "waypoint_panel"
	local waypoint_panel = self._inner_panel.child(slot2, self._inner_panel)
	local waypoints = managers.hud.get_all_waypoints(self._inner_panel)
	slot5 = waypoint_panel

	waypoint_panel.clear(managers.hud)

	self._waypoints = {}
	slot5 = waypoints

	for index, waypoint_data in pairs(managers.hud) do
		slot11 = waypoint_data

		self._create_waypoint(slot9, self)
	end

	return 
end
function HUDMapTab:_create_waypoint(waypoint_data)
	slot5 = "waypoint_panel"
	local waypoint_panel = self._inner_panel.child(slot3, self._inner_panel)

	if self._waypoints[waypoint_data.id_string] then
		slot6 = waypoint_data.id_string

		self.remove_waypoint(slot4, self)
	end

	if waypoint_data.waypoint_radius then
		slot6 = self
		waypoint_data.waypoint_radius = waypoint_data.waypoint_radius * self._get_map_size_factor(slot5)
	end

	slot6 = waypoint_data
	local waypoint = HUDMapWaypointBase.create(slot4, waypoint_panel)

	if waypoint then
		self._waypoints[waypoint_data.id_string] = waypoint
	end

	return 
end
function HUDMapTab:show()
	slot3 = self

	if not self._current_level_has_map(slot2) then
		return 
	end

	slot3 = self
	local current_level = self._get_current_player_level(slot2)

	if current_level ~= self._current_level then
		slot5 = current_level

		self._setup_level(slot3, self)
	end

	slot5 = true

	self._object.set_visible(slot3, self._object)

	slot4 = self

	HUDMapTab.super.show(slot3)

	return 
end
function HUDMapTab:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	slot3 = self

	HUDMapTab.super.hide(slot2)

	return 
end
function HUDMapTab:refresh_peers()
	slot3 = self

	if not self._current_level_has_map(slot2) then
		return 
	end

	slot3 = self

	self._create_player_pins(slot2)

	return 
end
function HUDMapTab:add_waypoint(data)
	slot5 = data

	self._create_waypoint(slot3, self)

	return 
end
function HUDMapTab:remove_waypoint(id)
	slot5 = "waypoint_panel"
	local waypoint_panel = self._inner_panel.child(slot3, self._inner_panel)

	if self._waypoints[id] then
		slot5 = self._waypoints[id]

		self._waypoints[id].destroy(slot4)

		self._waypoints[id] = nil
	end

	return 
end
function HUDMapTab:peer_enter_vehicle(peer_id)
	if not self._player_pins then
		return 
	end

	return 
end
function HUDMapTab:peer_exit_vehicle(peer_id)
	if not self._player_pins then
		return 
	end

	return 
end
function HUDMapTab:update()
	slot3 = self

	self._update_peer_positions(slot2)

	slot3 = self

	self._update_ai_positions(slot2)

	slot3 = self

	self._update_waypoints(slot2)

	return 
end
function HUDMapTab:_update_peer_positions()
	slot3 = managers.network
	local peers = managers.network.session(slot2).all_peers(slot2)
	slot4 = peers

	for index, peer in pairs(managers.network.session(slot2)) do
		local unit = peer.unit(slot8)
		slot10 = unit

		if alive(peer) then
			slot14 = unit
			slot12 = unit.position(unit).y
			local map_x, map_y = self._get_map_position(slot9, self, unit.position(slot12).x)
			slot12 = self._player_pins[index]

			self._player_pins[index].show(unit.position(slot12).x)

			slot14 = map_y

			self._player_pins[index].set_position(unit.position(slot12).x, self._player_pins[index], map_x)
		else
			slot10 = self._player_pins[index]

			self._player_pins[index].hide(slot9)
		end
	end

	return 
end
function HUDMapTab:_update_ai_positions()
	local ai_characters = managers.criminals.ai_criminals(slot2)
	slot4 = managers.network
	local peer_pins_number = managers.network.session(managers.criminals).count_all_peers(managers.criminals)
	slot5 = ai_characters

	for index, ai_character in pairs(managers.network.session(managers.criminals)) do
		if self._player_pins[peer_pins_number + index] then
			local unit = ai_character.unit
			slot11 = unit

			if alive(slot10) then
				slot15 = unit
				slot13 = unit.position(unit).y
				local map_x, map_y = self._get_map_position(slot10, self, unit.position(slot13).x)
				slot13 = self._player_pins[peer_pins_number + index]

				self._player_pins[peer_pins_number + index].show(peer_pins_number + index)

				slot15 = map_y

				self._player_pins[peer_pins_number + index].set_position(peer_pins_number + index, self._player_pins[peer_pins_number + index], map_x)
			else
				slot11 = self._player_pins[peer_pins_number + index]

				self._player_pins[peer_pins_number + index].hide(peer_pins_number + index)
			end
		end
	end

	return 
end
function HUDMapTab:_update_waypoints()
	local all_waypoints = managers.hud.get_all_waypoints(slot2)
	slot4 = all_waypoints

	for index, waypoint_data in pairs(managers.hud) do
		if self._waypoints[index] then
			slot11 = waypoint_data.position.y
			local map_x, map_y = self._get_map_position(slot8, self, waypoint_data.position.x)
			slot13 = map_y

			self._waypoints[index].set_position(waypoint_data.position.x, self._waypoints[index], map_x)

			slot12 = waypoint_data

			self._waypoints[index].set_data(waypoint_data.position.x, self._waypoints[index])
		end
	end

	return 
end
function HUDMapTab:_get_map_position(world_x, world_y)
	slot7 = self._world_borders.right - self._world_borders.left
	slot7 = self._inner_panel
	local map_x = HUDMapTab.PIN_PANEL_PADDING + (world_x - self._world_borders.left) / math.abs(slot6) * (self._inner_panel.w(slot6) - HUDMapTab.PIN_PANEL_PADDING * 2)
	slot8 = self._world_borders.down - self._world_borders.up
	slot8 = self._inner_panel
	local map_y = HUDMapTab.PIN_PANEL_PADDING + math.abs(HUDMapTab.PIN_PANEL_PADDING * 2) / math.abs(world_y - self._world_borders.up) * (self._inner_panel.h(world_y - self._world_borders.up) - HUDMapTab.PIN_PANEL_PADDING * 2)

	return map_x, map_y
end
function HUDMapTab:_get_map_size_factor()
	if not self._world_borders then
		return 1
	end

	local world_w = self._world_borders.right - self._world_borders.left
	slot4 = self._inner_panel
	local map_w = self._inner_panel.w(slot3)

	return map_w / world_w
end

return 
