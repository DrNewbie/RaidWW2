if not RaidGUIControlButtonShortPrimaryDisabled then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonShortPrimaryDisabled = slot0
RaidGUIControlButtonShortPrimaryDisabled.ICON = "btn_dissabled_192"
RaidGUIControlButtonShortPrimaryDisabled.HOVER_ICON = "btn_dissabled_192_hover"
RaidGUIControlButtonShortPrimaryDisabled.W = tweak_data.gui.icons[RaidGUIControlButtonShortPrimaryDisabled.ICON].texture_rect[3]
RaidGUIControlButtonShortPrimaryDisabled.H = tweak_data.gui.icons[RaidGUIControlButtonShortPrimaryDisabled.ICON].texture_rect[4]
function RaidGUIControlButtonShortPrimaryDisabled:init(parent, params)
	if not params then
		slot6 = "Trying to create a short primary disabled button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_red
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonShortPrimaryDisabled.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortPrimaryDisabled.ICON].texture_rect
	params.texture_color = Color.white
	params.no_highlight = true
	params.no_click = true
	params.w = RaidGUIControlButtonShortPrimaryDisabled.W
	params.h = RaidGUIControlButtonShortPrimaryDisabled.H
	slot7 = params

	RaidGUIControlButtonShortPrimaryDisabled.super.init(RaidGUIControlButtonShortPrimaryDisabled.ICON, self, parent)

	return 
end
function RaidGUIControlButtonShortPrimaryDisabled:show()
	slot3 = self

	RaidGUIControlButtonShortPrimaryDisabled.super.show(slot2)

	self._params.no_click = true
	self._params.no_highlight = true

	return 
end
function RaidGUIControlButtonShortPrimaryDisabled:hide()
	slot3 = self

	RaidGUIControlButtonShortPrimaryDisabled.super.hide(slot2)

	self._params.no_click = true
	self._params.no_highlight = true

	return 
end

return 
