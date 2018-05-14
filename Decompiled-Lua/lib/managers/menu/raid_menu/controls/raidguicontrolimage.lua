if not RaidGUIControlImage then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlImage = slot0
function RaidGUIControlImage:init(parent, params)
	slot7 = params

	RaidGUIControlImage.super.init(slot4, self, parent)

	if not self._params.texture then
		slot7 = self._params.name

		Application.error(slot4, Application, "[RaidGUIControlImage:init] Texture not specified for the image control: ")

		return 
	end

	self._on_mouse_pressed_callback = params.on_mouse_pressed_callback
	self._on_mouse_released_callback = params.on_mouse_released_callback

	if self._params.vertical == "center" then
		slot6 = self._params.panel
		self._params.y = (self._params.panel.h(slot5) - self._params.h) / 2
	end

	slot6 = self._params
	self._object = self._panel.bitmap(slot4, self._panel)

	return 
end
function RaidGUIControlImage:set_color(color)
	slot5 = color

	self._object.set_color(slot3, self._object)

	return 
end
function RaidGUIControlImage:color()
	slot3 = self._object

	return self._object.color(slot2)
end
function RaidGUIControlImage:set_image(texture)
	slot5 = texture

	self._object.set_image(slot3, self._object)

	return 
end
function RaidGUIControlImage:set_texture_rect(rect)
	slot4 = self._object
	slot7 = rect

	self._object.set_texture_rect(slot3, unpack(slot6))

	return 
end
function RaidGUIControlImage:on_mouse_pressed(o, button, x, y)
	if self._on_mouse_pressed_callback then
		self._on_mouse_pressed_callback()

		return true
	end

	return false
end
function RaidGUIControlImage:mouse_released(o, button, x, y)
	if self._on_mouse_released_callback then
		self._on_mouse_released_callback()

		return true
	end

	return false
end
function RaidGUIControlImage:center()
	slot3 = self._object

	return self._object.center(slot2)
end
function RaidGUIControlImage:set_center(x, y)
	slot7 = y

	self._object.set_center(slot4, self._object, x)

	return 
end
function RaidGUIControlImage:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	return 
end

return 
