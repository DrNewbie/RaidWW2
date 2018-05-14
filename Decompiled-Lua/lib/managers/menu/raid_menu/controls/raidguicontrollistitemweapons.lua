if not RaidGUIControlListItemWeapons then
	slot2 = RaidGUIControlListItemMenu
	slot0 = class(slot1)
end

RaidGUIControlListItemWeapons = slot0
function RaidGUIControlListItemWeapons:_get_font_desc()
	return tweak_data.gui.fonts.lato, tweak_data.gui.font_sizes.size_24
end

return 
