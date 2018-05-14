if not RaidGUIControlButtonShortSecondary then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonShortSecondary = slot0
RaidGUIControlButtonShortSecondary.ICON = "btn_secondary_192"
RaidGUIControlButtonShortSecondary.HOVER_ICON = "btn_secondary_192_hover"
RaidGUIControlButtonShortSecondary.W = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.ICON].texture_rect[3]
RaidGUIControlButtonShortSecondary.H = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.ICON].texture_rect[4]
function RaidGUIControlButtonShortSecondary:init(parent, params)
	if not params then
		slot6 = "Trying to create a short secondary button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_black
	params.highlight_color = tweak_data.gui.colors.raid_black
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.ICON].texture_rect
	params.texture_color = Color.white
	params.highlight_texture = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.HOVER_ICON].texture
	params.highlight_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonShortSecondary.HOVER_ICON].texture_rect
	params.texture_highlight_color = Color.white
	params.w = RaidGUIControlButtonShortSecondary.W
	params.h = RaidGUIControlButtonShortSecondary.H
	slot7 = params

	RaidGUIControlButtonShortSecondary.super.init(RaidGUIControlButtonShortSecondary.HOVER_ICON, self, parent)

	return 
end

return 
