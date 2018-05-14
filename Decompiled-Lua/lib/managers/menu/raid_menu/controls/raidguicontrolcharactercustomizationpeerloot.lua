if not RaidGUIControlCharacterCustomizationPeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCharacterCustomizationPeerLoot = slot0
RaidGUIControlCharacterCustomizationPeerLoot.WIDTH = 544
RaidGUIControlCharacterCustomizationPeerLoot.HEIGHT = 96
RaidGUIControlCharacterCustomizationPeerLoot.ICON_UPPER = "rwd_upper_body"
RaidGUIControlCharacterCustomizationPeerLoot.ICON_LOWER = "rwd_lower_body"
RaidGUIControlCharacterCustomizationPeerLoot.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlCharacterCustomizationPeerLoot.NAME_Y = 12
RaidGUIControlCharacterCustomizationPeerLoot.NAME_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlCharacterCustomizationPeerLoot.NAME_PADDING_DOWN = 2
RaidGUIControlCharacterCustomizationPeerLoot.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlCharacterCustomizationPeerLoot.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlCharacterCustomizationPeerLoot.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlCharacterCustomizationPeerLoot.TEXT_X = 128
function RaidGUIControlCharacterCustomizationPeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlCharacterCustomizationPeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlCharacterCustomizationPeerLoot:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot6 = params

	self._create_customization_details(slot4, self)

	return 
end
function RaidGUIControlCharacterCustomizationPeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlCharacterCustomizationPeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlCharacterCustomizationPeerLoot.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlCharacterCustomizationPeerLoot:_create_customization_details(params)
	local icon = nil

	if params.customization.part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		icon = RaidGUIControlCharacterCustomizationPeerLoot.ICON_UPPER
	else
		icon = RaidGUIControlCharacterCustomizationPeerLoot.ICON_LOWER
	end

	local params_customization_image = {
		name = "card_image",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect
	}
	slot7 = params_customization_image
	self._customization_image = self._control_panel.bitmap(slot5, self._control_panel)
	local params_player_name = {
		name = "peer_customization_name_label",
		align = "left",
		text = "",
		layer = 1,
		x = RaidGUIControlCharacterCustomizationPeerLoot.TEXT_X,
		y = RaidGUIControlCharacterCustomizationPeerLoot.NAME_Y
	}
	slot7 = self._object
	params_player_name.w = self._object.w(self._control_panel) - RaidGUIControlCharacterCustomizationPeerLoot.TEXT_X
	params_player_name.color = RaidGUIControlCharacterCustomizationPeerLoot.NAME_COLOR
	params_player_name.font = RaidGUIControlCharacterCustomizationPeerLoot.FONT
	params_player_name.font_size = RaidGUIControlCharacterCustomizationPeerLoot.NAME_FONT_SIZE
	slot8 = params_player_name
	self._name_label = self._object.text(RaidGUIControlCharacterCustomizationPeerLoot.TEXT_X, self._object)
	slot7 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlCharacterCustomizationPeerLoot.TEXT_X)
	slot12 = h

	self._name_label.set_h(slot10, self._name_label)

	local params_customization_description = {
		name = "customization_description_label",
		wrap = true,
		align = "left",
		text = "",
		layer = 1
	}
	slot12 = self._name_label
	params_customization_description.x = self._name_label.x(self._name_label)
	slot13 = self._name_label
	params_customization_description.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlCharacterCustomizationPeerLoot.NAME_PADDING_DOWN
	slot12 = self._name_label
	params_customization_description.w = self._name_label.w(RaidGUIControlCharacterCustomizationPeerLoot.NAME_PADDING_DOWN)
	params_customization_description.color = RaidGUIControlCharacterCustomizationPeerLoot.DESCRIPTION_COLOR
	params_customization_description.font = RaidGUIControlCharacterCustomizationPeerLoot.FONT
	params_customization_description.font_size = RaidGUIControlCharacterCustomizationPeerLoot.DESCRIPTION_FONT_SIZE
	slot13 = params_customization_description
	self._customization_description = self._object.text(RaidGUIControlCharacterCustomizationPeerLoot.NAME_PADDING_DOWN, self._object)

	return 
end
function RaidGUIControlCharacterCustomizationPeerLoot:set_customization(customization)
	self._customization = customization
	slot4 = self._customization_description
	slot9 = true

	self._customization_description.set_text(slot3, self.translate(slot6, self, customization.name))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlCharacterCustomizationPeerLoot:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlCharacterCustomizationPeerLoot:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlCharacterCustomizationPeerLoot.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlCharacterCustomizationPeerLoot.NAME_PADDING_DOWN

	self._customization_description.set_y(slot6, self._customization_description)

	return 
end

return 
