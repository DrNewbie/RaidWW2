HUDEquipment = HUDEquipment or class()
HUDEquipment.DEFAULT_W = 38
HUDEquipment.DEFAULT_H = 38
HUDEquipment.FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDEquipment.FONT_SIZE = 20
function HUDEquipment:init(equipment_panel, icon, equipment_id, amount)
	self._id = equipment_id
	self._amount = 1
	slot9 = equipment_id

	self._create_panel(slot6, self, equipment_panel)

	slot8 = icon

	self._create_icon(slot6, self)

	slot7 = self

	self._create_amount_text(slot6)

	if amount then
		slot8 = amount

		self.set_amount(slot6, self)
	end

	return 
end
function HUDEquipment:_create_panel(equipment_panel, equipment_id)
	local panel_params = {}
	slot7 = equipment_id
	panel_params.name = "equipment_" .. tostring(slot6) .. "_panel"
	panel_params.w = HUDEquipment.DEFAULT_W
	panel_params.h = HUDEquipment.DEFAULT_H
	slot7 = panel_params
	self._object = equipment_panel.panel(tostring(slot6), equipment_panel)

	return 
end
function HUDEquipment:_create_icon(icon)
	local icon_params = {
		name = "icon",
		layer = 1,
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect
	}
	slot6 = icon_params
	self._icon = self._object.bitmap(slot4, self._object)
	slot5 = self._icon
	slot8 = self._object

	self._icon.set_bottom(slot4, self._object.h(slot7))

	return 
end
function HUDEquipment:_create_amount_text()
	local amount_text_params = {
		name = "amount_text",
		vertical = "top",
		align = "right",
		text = "",
		y = 0,
		x = 0,
		layer = 3,
		font = HUDEquipment.FONT,
		font_size = HUDEquipment.FONT_SIZE
	}
	slot5 = amount_text_params
	self._amount_text = self._object.text(slot3, self._object)
	slot4 = self

	self._fit_amount_text(slot3)

	return 
end
function HUDEquipment:set_amount(amount)
	self._amount = amount
	slot5 = amount

	self._amount_text.set_text(slot3, self._amount_text)

	slot4 = self

	self._fit_amount_text(slot3)

	if 1 < amount then
		slot5 = 1

		self._amount_text.set_alpha(slot3, self._amount_text)
	else
		slot5 = 0

		self._amount_text.set_alpha(slot3, self._amount_text)
	end

	return 
end
function HUDEquipment:_fit_amount_text()
	slot3 = self._amount_text
	local _, _, w, h = self._amount_text.text_rect(slot2)
	slot8 = w

	self._amount_text.set_w(slot6, self._amount_text)

	slot8 = h

	self._amount_text.set_h(slot6, self._amount_text)

	slot10 = self._object
	slot8 = self._object.w(slot9) - 1

	self._amount_text.set_right(slot6, self._amount_text)

	slot8 = 0

	self._amount_text.set_top(slot6, self._amount_text)

	return 
end
function HUDEquipment:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDEquipment:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDEquipment:id()
	return self._id
end
function HUDEquipment:amount()
	return self._amount
end
function HUDEquipment:destroy()
	slot3 = self._object

	self._object.clear(slot2)

	return 
end

return 
