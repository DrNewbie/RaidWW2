if not RaidGUIControlThreeCutBitmap then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlThreeCutBitmap = slot0
RaidGUIControlThreeCutBitmap.CENTER_OVERFLOW = 1
function RaidGUIControlThreeCutBitmap:init(parent, params)
	slot7 = params

	RaidGUIControlThreeCutBitmap.super.init(slot4, self, parent)

	if not self._params.left or not self._params.center or not self._params.right then
		slot7 = self._params.name

		Application.error(slot4, Application, "[RaidGUIControlThreeCutBitmap:init] One or more textures not specified for the three cut bitmap control: ")

		return 
	end

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._layout_parts(slot4)

	return 
end
function RaidGUIControlThreeCutBitmap:_create_panel()
	slot3 = self._params
	local three_cut_params = clone(slot2)
	three_cut_params.name = three_cut_params.name .. "_three_cut_bitmap"
	slot4 = self._panel
	three_cut_params.layer = self._panel.layer("_three_cut_bitmap")

	if not self._params.h then
		slot4 = self
		slot2 = self.h(slot3)
	end

	three_cut_params.h = slot2
	slot5 = three_cut_params
	self._slider_panel = self._panel.panel(slot3, self._panel)
	self._object = self._slider_panel

	return 
end
function RaidGUIControlThreeCutBitmap:_layout_parts()
	slot3 = self
	self._h = self.h(slot2)
	local left_texture_rect = {
		tweak_data.gui.icons[self._params.left].texture_rect[1],
		tweak_data.gui.icons[self._params.left].texture_rect[2],
		tweak_data.gui.icons[self._params.left].texture_rect[3] - 1,
		tweak_data.gui.icons[self._params.left].texture_rect[4]
	}
	local left_params = {
		x = 0,
		name = self._name .. "_left",
		y = self._h / 2 - tweak_data.gui.icons[self._params.left].texture_rect[4] / 2,
		w = tweak_data.gui.icons[self._params.left].texture_rect[3] - 1
	}
	slot5 = self._object
	left_params.h = self._object.h(self._params.left)
	left_params.texture = tweak_data.gui.icons[self._params.left].texture
	left_params.texture_rect = left_texture_rect
	left_params.color = self._params.color or Color.white
	slot5 = self._object
	left_params.layer = self._object.layer(slot4) + 2
	self._left = self._object.bitmap(slot4, self._object)
	local right_texture_rect = {
		tweak_data.gui.icons[self._params.right].texture_rect[1] + 1,
		tweak_data.gui.icons[self._params.right].texture_rect[2],
		tweak_data.gui.icons[self._params.right].texture_rect[3] - 1,
		tweak_data.gui.icons[self._params.right].texture_rect[4]
	}
	local right_params = {
		name = self._name .. "_right"
	}
	slot7 = self._object
	right_params.x = self._object.w("_right") - tweak_data.gui.icons[self._params.right].texture_rect[3]
	right_params.y = self._h / 2 - tweak_data.gui.icons[self._params.right].texture_rect[4] / 2
	right_params.w = tweak_data.gui.icons[self._params.right].texture_rect[3] - 1
	slot7 = self._object
	right_params.h = self._object.h(self._params.right)
	right_params.texture = tweak_data.gui.icons[self._params.right].texture
	right_params.texture_rect = right_texture_rect
	right_params.color = self._params.color or Color.white
	slot7 = self._object
	right_params.layer = self._object.layer(left_params) + 2
	self._right = self._object.bitmap(left_params, self._object)
	slot7 = self._right
	slot10 = self._object

	self._right.set_right(left_params, self._object.right(slot9))

	local center_texture_rect = {
		tweak_data.gui.icons[self._params.center].texture_rect[1] + 2,
		tweak_data.gui.icons[self._params.center].texture_rect[2],
		tweak_data.gui.icons[self._params.center].texture_rect[3] - 4,
		tweak_data.gui.icons[self._params.center].texture_rect[4]
	}
	local center_params = {
		name = self._name .. "_center"
	}
	slot9 = self._left
	center_params.x = self._left.w("_center")
	center_params.y = self._h / 2 - tweak_data.gui.icons[self._params.center].texture_rect[4] / 2
	slot10 = self._left
	slot10 = self._right
	center_params.w = self._object.w(tweak_data.gui.icons[self._params.center].texture_rect[4] / 2) - self._left.w(self._object) - self._right.w(self._object)
	slot9 = self._object
	center_params.h = self._object.h(self._right.w(self._object))
	center_params.texture = tweak_data.gui.icons[self._params.center].texture
	center_params.texture_rect = center_texture_rect
	center_params.color = self._params.color or Color.white
	slot10 = center_params
	self._center = self._object.bitmap(right_params, self._object)

	return 
end
function RaidGUIControlThreeCutBitmap:set_color(color)
	slot5 = color

	self._left.set_color(slot3, self._left)

	slot5 = color

	self._center.set_color(slot3, self._center)

	slot5 = color

	self._right.set_color(slot3, self._right)

	return 
end
function RaidGUIControlThreeCutBitmap:color()
	slot3 = self._left

	return self._left.color(slot2)
end
function RaidGUIControlThreeCutBitmap:set_w(w)
	slot5 = w

	self._object.set_w(slot3, self._object)
	self._left.set_x(slot3, self._left)

	slot7 = self._right
	slot4 = w - self._left.w(0) - self._right.w(self._left) + 2 * RaidGUIControlThreeCutBitmap.CENTER_OVERFLOW
	local center_w = math.ceil(slot3)

	if center_w < 0 then
		center_w = 0
	end

	slot6 = center_w

	self._center.set_w(slot4, self._center)

	slot5 = self._left
	local center_x = self._left.w(slot4) - RaidGUIControlThreeCutBitmap.CENTER_OVERFLOW

	if center_x < 0 then
		center_x = 0
	end

	slot7 = center_x

	self._center.set_x(slot5, self._center)

	slot10 = self._center
	slot7 = (self._center.x(slot8) + self._center.w(self._center)) - RaidGUIControlThreeCutBitmap.CENTER_OVERFLOW

	self._right.set_x(slot5, self._right)

	return 
end
function RaidGUIControlThreeCutBitmap:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlThreeCutBitmap:h()
	local height = tweak_data.gui.icons[self._params.left].texture_rect[4]

	if height < tweak_data.gui.icons[self._params.center].texture_rect[4] then
		height = tweak_data.gui.icons[self._params.center].texture_rect[4]
	end

	if height < tweak_data.gui.icons[self._params.right].texture_rect[4] then
		height = tweak_data.gui.icons[self._params.right].texture_rect[4]
	end

	return height
end

return 
