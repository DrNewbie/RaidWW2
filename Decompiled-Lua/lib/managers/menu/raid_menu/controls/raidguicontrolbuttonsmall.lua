if not RaidGUIControlButtonSmall then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonSmall = slot0
RaidGUIControlButtonSmall.ICON = "btn_small_128"
RaidGUIControlButtonSmall.HOVER_ICON = "btn_small_128_hover"
RaidGUIControlButtonSmall.W = tweak_data.gui.icons[RaidGUIControlButtonSmall.ICON].texture_rect[3]
RaidGUIControlButtonSmall.H = tweak_data.gui.icons[RaidGUIControlButtonSmall.ICON].texture_rect[4]
function RaidGUIControlButtonSmall:init(parent, params)
	if not params then
		slot6 = "Trying to create a long primary button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_grey
	params.highlight_color = tweak_data.gui.colors.raid_grey
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonSmall.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSmall.ICON].texture_rect
	params.texture_color = Color.white
	params.highlight_texture = tweak_data.gui.icons[RaidGUIControlButtonSmall.HOVER_ICON].texture
	params.highlight_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSmall.HOVER_ICON].texture_rect
	params.texture_highlight_color = Color.white
	params.w = RaidGUIControlButtonSmall.W
	params.h = RaidGUIControlButtonSmall.H
	slot7 = params

	RaidGUIControlButtonSmall.super.init(RaidGUIControlButtonSmall.HOVER_ICON, self, parent)

	return 
end

return 
