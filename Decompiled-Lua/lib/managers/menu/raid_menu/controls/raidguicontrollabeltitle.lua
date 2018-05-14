if not RaidGUIControlLabelTitle then
	slot2 = RaidGUIControlLabel
	slot0 = class(slot1)
end

RaidGUIControlLabelTitle = slot0
function RaidGUIControlLabelTitle:init(parent, params)
	params.font = tweak_data.gui.fonts.din_compressed
	params.font_size = tweak_data.gui.font_sizes.size_56
	params.color = tweak_data.gui.colors.raid_red
	slot7 = params

	RaidGUIControlLabelTitle.super.init(slot4, self, parent)

	slot5 = self._object
	local _, _, w, h = self._object.text_rect(slot4)
	slot10 = w

	self._object.set_w(slot8, self._object)

	slot10 = h

	self._object.set_h(slot8, self._object)

	return 
end

return 
