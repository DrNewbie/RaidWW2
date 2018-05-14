if not HUDNameVehicleLabel then
	slot2 = HUDNameLabel
	slot0 = class(slot1)
end

HUDNameVehicleLabel = slot0
function HUDNameVehicleLabel:init(hud, params)
	self._vehicle_name = params.vehicle_name
	self._vehicle_unit = params.vehicle_unit
	self._id = params.id
	slot6 = hud

	self._create_panel(slot4, self)

	slot5 = self

	self._create_name(slot4)

	return 
end
function HUDNameVehicleLabel:_create_panel(hud)
	slot5 = {
		name = "vehicle_name_label_" .. self._vehicle_name,
		w = HUDNameLabel.W,
		h = HUDNameLabel.H
	}
	self._object = hud.panel.panel(slot3, hud.panel)

	return 
end
function HUDNameVehicleLabel:_create_name()
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bag_rect = {
		2,
		34,
		20,
		17
	}
	local crim_color = tweak_data.chat_colors[1]
	slot7 = {
		name = "text",
		vertical = "top",
		h = 25,
		w = 256,
		align = "left",
		layer = -1,
		text = utf8.to_upper(slot9),
		font = HUDNameLabel.PLAYER_NAME_FONT,
		font_size = HUDNameLabel.PLAYER_NAME_FONT_SIZE,
		color = crim_color
	}
	local text = self._object.text(slot5, self._object)
	slot8 = {
		name = "bag",
		layer = 0,
		visible = false,
		y = 1,
		x = 1,
		texture = tabs_texture,
		texture_rect = bag_rect,
		color = crim_color * 1.1.with_alpha(self._vehicle_name, crim_color * 1.1)
	}
	slot12 = 1
	local bag = self._object.bitmap(self._object, self._object)
	slot9 = {
		name = "bag_number",
		vertical = "top",
		h = 18,
		w = 32,
		align = "left",
		visible = false,
		layer = -1,
		text = utf8.to_upper(crim_color * 1.1),
		font = HUDNameLabel.PLAYER_NAME_FONT,
		font_size = HUDNameLabel.PLAYER_NAME_FONT_SIZE,
		color = crim_color
	}
	local bag_number = self._object.text(self._object, self._object)
	slot10 = {
		w = 256,
		name = "cheater",
		h = 18,
		align = "center",
		visible = false,
		layer = -1,
		text = utf8.to_upper(managers.localization.text(slot14, managers.localization)),
		font = HUDNameLabel.PLAYER_NAME_FONT,
		font_size = HUDNameLabel.PLAYER_NAME_FONT_SIZE,
		color = tweak_data.screen_colors.pro_color
	}
	slot16 = "menu_hud_cheater"

	self._object.text(self._object, self._object)

	slot10 = {
		vertical = "bottom",
		name = "action",
		h = 18,
		w = 256,
		align = "left",
		visible = false,
		rotation = 360,
		layer = -1,
		text = utf8.to_upper(""),
		font = HUDNameLabel.PLAYER_NAME_FONT,
		font_size = HUDNameLabel.PLAYER_NAME_FONT_SIZE,
		color = crim_color * 1.1.with_alpha("", crim_color * 1.1)
	}
	slot13 = "Fixing"
	slot14 = 1

	self._object.text(self._object, self._object)

	return 
end
function HUDNameVehicleLabel:id()
	return self._id
end
function HUDNameVehicleLabel:panel()
	return self._object
end
function HUDNameVehicleLabel:destroy()
	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end
function HUDNameVehicleLabel:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDNameVehicleLabel:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end

return 
