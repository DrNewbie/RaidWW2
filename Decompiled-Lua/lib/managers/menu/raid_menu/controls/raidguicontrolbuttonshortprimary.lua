if not RaidGUIControlButtonShortPrimary then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonShortPrimary = slot0
RaidGUIControlButtonShortPrimary.ICON = "btn_primary_192"
RaidGUIControlButtonShortPrimary.HOVER_ICON = "btn_primary_192_hover"
RaidGUIControlButtonShortPrimary.DISABLED_ICON = "btn_dissabled_192"
RaidGUIControlButtonShortPrimary.DISABLED_HOVER_ICON = "btn_dissabled_192_hover"
RaidGUIControlButtonShortPrimary.W = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.ICON].texture_rect[3]
RaidGUIControlButtonShortPrimary.H = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.ICON].texture_rect[4]
function RaidGUIControlButtonShortPrimary:init(parent, params)
	if not params then
		slot6 = "Trying to create a short primary button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_black
	params.highlight_color = tweak_data.gui.colors.raid_black
	params.disable_color = tweak_data.gui.colors.raid_red
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.ICON].texture_rect
	params.texture_color = Color.white
	params.highlight_texture = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.HOVER_ICON].texture
	params.highlight_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.HOVER_ICON].texture_rect
	params.texture_highlight_color = Color.white
	params.disabled_texture = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.DISABLED_ICON].texture
	params.disabled_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.DISABLED_ICON].texture_rect
	params.highlight_disabled_texture = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.DISABLED_ICON].texture
	params.highlight_disabled_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortPrimary.DISABLED_ICON].texture_rect
	params.w = RaidGUIControlButtonShortPrimary.W
	params.h = RaidGUIControlButtonShortPrimary.H
	slot7 = params

	RaidGUIControlButtonShortPrimary.super.init(RaidGUIControlButtonShortPrimary.DISABLED_ICON, self, parent)

	return 
end
function RaidGUIControlButtonShortPrimary:enable()
	if self._object_image then
		slot4 = self._params.texture
		slot7 = self._params.texture_rect

		self._object_image.set_image(slot2, self._object_image, unpack(slot6))
	end

	if self._object_text then
		slot4 = self._params.color

		self._object_text.set_color(slot2, self._object_text)
	end

	slot5 = false

	self.set_param_value(slot2, self, "no_highlight")

	slot5 = false

	self.set_param_value(slot2, self, "no_click")

	self._enabled = true

	return 
end
function RaidGUIControlButtonShortPrimary:disable()
	slot3 = self

	self.highlight_off(slot2)

	slot5 = true

	self.set_param_value(slot2, self, "no_highlight")

	slot5 = true

	self.set_param_value(slot2, self, "no_click")

	if self._object_image then
		slot4 = self._params.disabled_texture
		slot7 = self._params.disabled_texture_rect

		self._object_image.set_image(slot2, self._object_image, unpack(slot6))
	end

	if self._object_text then
		slot4 = self._params.disable_color

		self._object_text.set_color(slot2, self._object_text)
	end

	self._enabled = false

	return 
end

return 
