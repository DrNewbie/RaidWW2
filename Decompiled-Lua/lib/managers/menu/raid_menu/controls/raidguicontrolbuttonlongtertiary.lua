if not RaidGUIControlButtonLongTertiary then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonLongTertiary = slot0
RaidGUIControlButtonLongTertiary.ICON = "btn_tetriary_256"
RaidGUIControlButtonLongTertiary.HOVER_ICON = "btn_tetriary_256_hover"
RaidGUIControlButtonLongTertiary.W = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.ICON].texture_rect[3]
RaidGUIControlButtonLongTertiary.H = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.ICON].texture_rect[4]
function RaidGUIControlButtonLongTertiary:init(parent, params)
	if not params then
		slot6 = "Trying to create a short primary button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_grey
	params.highlight_color = tweak_data.gui.colors.raid_grey
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.ICON].texture_rect
	params.texture_color = Color.white
	params.highlight_texture = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.HOVER_ICON].texture
	params.highlight_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonLongTertiary.HOVER_ICON].texture_rect
	params.texture_highlight_color = Color.white
	params.w = RaidGUIControlButtonLongTertiary.W
	params.h = RaidGUIControlButtonLongTertiary.H
	slot7 = params

	RaidGUIControlButtonLongTertiary.super.init(RaidGUIControlButtonLongTertiary.HOVER_ICON, self, parent)

	return 
end

return 
