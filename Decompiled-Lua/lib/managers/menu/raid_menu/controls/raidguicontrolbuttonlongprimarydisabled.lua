if not RaidGUIControlButtonLongPrimaryDisabled then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonLongPrimaryDisabled = slot0
RaidGUIControlButtonLongPrimaryDisabled.ICON = "btn_dissabled_256"
RaidGUIControlButtonLongPrimaryDisabled.HOVER_ICON = "btn_dissabled_256_hover"
RaidGUIControlButtonLongPrimaryDisabled.W = tweak_data.gui.icons[RaidGUIControlButtonLongPrimaryDisabled.ICON].texture_rect[3]
RaidGUIControlButtonLongPrimaryDisabled.H = tweak_data.gui.icons[RaidGUIControlButtonLongPrimaryDisabled.ICON].texture_rect[4]
function RaidGUIControlButtonLongPrimaryDisabled:init(parent, params)
	if not params then
		slot6 = "Trying to create a long primary disabled button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_red
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonLongPrimaryDisabled.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonLongPrimaryDisabled.ICON].texture_rect
	params.texture_color = Color.white
	params.no_highlight = true
	params.no_click = true
	params.w = RaidGUIControlButtonLongPrimary.W
	params.h = RaidGUIControlButtonLongPrimary.H
	slot7 = params

	RaidGUIControlButtonLongPrimaryDisabled.super.init(RaidGUIControlButtonLongPrimaryDisabled.ICON, self, parent)

	return 
end
function RaidGUIControlButtonLongPrimaryDisabled:show()
	slot3 = self

	RaidGUIControlButtonLongPrimaryDisabled.super.show(slot2)

	self._params.no_click = true
	self._params.no_highlight = true

	return 
end
function RaidGUIControlButtonLongPrimaryDisabled:hide()
	slot3 = self

	RaidGUIControlButtonLongPrimaryDisabled.super.hide(slot2)

	self._params.no_click = true
	self._params.no_highlight = true

	return 
end

return 
