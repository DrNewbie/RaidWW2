if not RaidGUIControlCard then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCard = slot0
function RaidGUIControlCard:init(parent, item_params, item_data, grid_params)
	slot9 = item_params

	RaidGUIControlCard.super.init(slot6, self, parent)

	self._item_data = item_data
	slot9 = true
	self._card_panel = self._panel.panel(slot6, self._panel, {
		name = "panel_card",
		x = item_params.x,
		y = item_params.y,
		w = item_params.w,
		h = item_params.h
	})
	self._object = self._card_panel
	slot8 = {
		name = "glow_texture",
		y = -2,
		visible = false,
		x = -2,
		w = self._card_panel.w(slot10) + 6,
		h = self._card_panel.h(slot10) + 5,
		color = Color.green,
		texture = tweak_data.challenge_cards.card_glow.texture,
		texture_rect = tweak_data.challenge_cards.card_glow.texture_rect
	}
	slot11 = self._card_panel
	slot11 = self._card_panel
	self._card_glow = self._card_panel.bitmap(slot6, self._card_panel)
	slot8 = {
		name = "glow_lock_texture",
		y = -2,
		visible = false,
		x = -2,
		w = self._card_panel.w(slot10) + 6,
		h = self._card_panel.h(slot10) + 5,
		color = tweak_data.menu.raid_red,
		texture = tweak_data.challenge_cards.card_glow.texture,
		texture_rect = tweak_data.challenge_cards.card_glow.texture_rect
	}
	slot11 = self._card_panel
	slot11 = self._card_panel
	self._card_lock_glow = self._card_panel.bitmap(slot6, self._card_panel)

	if self._item_data then
		slot8 = {
			name = "bitmap_card",
			y = 0,
			x = 0,
			w = item_params.w,
			h = item_params.h,
			texture = tweak_data.challenge_cards.rarity_definition[item_data.rarity].texture_path_thumb,
			texture_rect = tweak_data.challenge_cards.rarity_definition[item_data.rarity].texture_rect_thumb
		}
		self._bitmap_card = self._card_panel.bitmap(slot6, self._card_panel)
		slot8 = {
			w = 33,
			name = "label_xp_value",
			h = 17,
			wrap = true,
			font_size = 15,
			y = 112,
			x = 5,
			font = tweak_data.menu.pd2_medium_font,
			text = "+" .. self._item_data.bonus_xp .. "xp"
		}
		self._xp_value = self._card_panel.label(slot6, self._card_panel)
	end

	slot7 = self

	self._create_border(slot6)

	self._selected = false
	self._locked = false

	if grid_params.on_click_callback then
		self._on_click_callback = grid_params.on_click_callback
	end

	local card_name = ""

	if item_data then
		card_name = item_data.name
	end

	slot9 = {
		w = 80,
		name = "label_card_info",
		h = 30,
		wrap = true,
		font_size = 15,
		y = 52,
		x = 5,
		font = tweak_data.menu.pd2_medium_font,
		text = card_name
	}
	self._label_card_description = self._card_panel.label(slot7, self._card_panel)
	self._object = self._card_panel
	self._name = "card_control"

	return 
end
function RaidGUIControlCard:_create_border()
	local border_thickness = 1.6
	slot5 = {
		name = "border_left",
		y = 0,
		orientation = "vertical",
		x = 0,
		layer = 2,
		w = border_thickness,
		h = self._card_panel.h(slot7)
	}
	slot8 = self._card_panel
	self._border_left = self._card_panel.gradient(slot3, self._card_panel)
	slot5 = {
		0,
		Color(slot7, 0.19215686274509805, 0.23529411764705882),
		1,
		Color(slot7, 0.3137254901960784, 0.40784313725490196)
	}
	slot10 = 0.25098039215686274
	slot10 = 0.35294117647058826

	self._border_left.set_gradient_points(slot3, self._border_left)

	slot5 = {
		name = "border_right",
		y = 0,
		orientation = "vertical",
		layer = 2,
		x = self._card_panel.w(slot7) - border_thickness,
		w = border_thickness,
		h = self._card_panel.h(slot7)
	}
	slot8 = self._card_panel
	slot8 = self._card_panel
	self._border_right = self._card_panel.gradient(slot3, self._card_panel)
	slot5 = {
		0,
		Color(slot7, 0.3058823529411765, 0.40784313725490196),
		1,
		Color(slot7, 0.3411764705882353, 0.35294117647058826)
	}
	slot10 = 0.36470588235294116
	slot10 = 0.3176470588235294

	self._border_right.set_gradient_points(slot3, self._border_right)

	slot5 = {
		name = "border_up",
		y = 0,
		orientation = "horizontal",
		x = 0,
		layer = 2,
		w = self._card_panel.w(slot7),
		h = border_thickness
	}
	slot8 = self._card_panel
	self._border_up = self._card_panel.gradient(slot3, self._card_panel)
	slot5 = {
		0,
		Color(slot7, 0.19215686274509805, 0.23529411764705882),
		0.38,
		Color(slot7, 0.34901960784313724, 0.34901960784313724),
		0.544,
		Color(slot7, 0.596078431372549, 0.6274509803921569),
		0.77,
		Color(slot7, 0.34901960784313724, 0.34901960784313724),
		1,
		Color(slot7, 0.3058823529411765, 0.40784313725490196)
	}
	slot10 = 0.25098039215686274
	slot10 = 0.3411764705882353
	slot10 = 0.5843137254901961
	slot10 = 0.3411764705882353
	slot10 = 0.36470588235294116

	self._border_up.set_gradient_points(slot3, self._border_up)

	slot5 = {
		name = "border_down",
		orientation = "horizontal",
		x = 0,
		layer = 2,
		y = self._card_panel.h(slot7) - border_thickness,
		w = self._card_panel.w(slot7),
		h = border_thickness
	}
	slot8 = self._card_panel
	slot8 = self._card_panel
	self._border_down = self._card_panel.gradient(slot3, self._card_panel)
	slot5 = {
		0,
		Color(slot7, 0.3137254901960784, 0.40784313725490196),
		0.3,
		Color(slot7, 0.596078431372549, 0.615686274509804),
		0.69,
		Color(slot7, 0.6039215686274509, 0.615686274509804),
		1,
		Color(slot7, 0.3411764705882353, 0.35294117647058826)
	}
	slot10 = 0.35294117647058826
	slot10 = 0.592156862745098
	slot10 = 0.5882352941176471
	slot10 = 0.3176470588235294

	self._border_down.set_gradient_points(slot3, self._border_down)

	return 
end
function RaidGUIControlCard:mouse_released(o, button, x, y)
	slot8 = button

	self.on_mouse_released(slot6, self)

	return true
end
function RaidGUIControlCard:on_mouse_released(button)
	if self._on_click_callback then
		slot6 = self._item_data

		self._on_click_callback(slot3, button, self)
	end

	return 
end
function RaidGUIControlCard:selected()
	return self._selected
end
function RaidGUIControlCard:select()
	self._selected = true

	if self._card_glow then
		slot3 = self._card_glow

		if alive(slot2) and self._item_data then
			slot3 = self._card_glow

			self._card_glow.show(slot2)

			slot3 = self._card_lock_glow

			self._card_lock_glow.hide(slot2)
		end
	end

	return 
end
function RaidGUIControlCard:unselect()
	self._selected = false

	if self._card_glow then
		slot3 = self._card_glow

		if alive(slot2) then
			slot3 = self._card_glow

			self._card_glow.hide(slot2)
		end
	end

	return 
end
function RaidGUIControlCard:locked()
	return self._locked
end
function RaidGUIControlCard:lock()
	self._locked = true

	if self._card_lock_glow then
		slot3 = self._card_lock_glow

		if alive(slot2) and self._item_data then
			slot3 = self._card_lock_glow

			self._card_lock_glow.show(slot2)

			slot3 = self._card_glow

			self._card_glow.hide(slot2)
		end
	end

	return 
end
function RaidGUIControlCard:unlock()
	self._locked = false

	if self._card_lock_glow then
		slot3 = self._card_lock_glow

		if alive(slot2) then
			slot3 = self._card_lock_glow

			self._card_lock_glow.hide(slot2)
		end
	end

	return 
end

return 
