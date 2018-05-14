if not RaidGUIControlRespec then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlRespec = slot0
RaidGUIControlRespec.DEFAULT_W = 520
RaidGUIControlRespec.DEFAULT_H = 240
RaidGUIControlRespec.TITLE_H = 64
RaidGUIControlRespec.TITLE_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlRespec.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlRespec.TITLE_COLOR = Color.white
RaidGUIControlRespec.DESCRIPTION_W = 520
RaidGUIControlRespec.DESCRIPTION_Y = 80
RaidGUIControlRespec.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlRespec.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlRespec.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlRespec.COST_PADDING_DOWN = 32
function RaidGUIControlRespec:init(parent, params)
	slot7 = params

	RaidGUIControlRespec.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlRespec:init] Parameters not specified for the skill details " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_respec_title(slot4)

	slot5 = self

	self._create_respec_description(slot4)

	return 
end
function RaidGUIControlRespec:_create_control_panel()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	control_params.w = self._params.w or RaidGUIControlRespec.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlRespec.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlRespec:_create_respec_title()
	local skill_title_params = {
		vertical = "center",
		name = "respec_title",
		wrap = false,
		align = "left",
		y = 0,
		x = 0
	}
	slot7 = "menu_character_skills_retrain_title"
	skill_title_params.text = utf8.to_upper(managers.localization.text(slot5, managers.localization))
	slot4 = self._object
	skill_title_params.w = self._object.w(slot3)
	skill_title_params.h = RaidGUIControlRespec.TITLE_H
	skill_title_params.font = RaidGUIControlRespec.TITLE_FONT
	skill_title_params.font_size = RaidGUIControlRespec.TITLE_FONT_SIZE
	skill_title_params.color = RaidGUIControlRespec.TITLE_COLOR
	slot5 = skill_title_params
	self._title = self._object.label(slot3, self._object)

	return 
end
function RaidGUIControlRespec:_create_respec_description()
	local description_text_params = {
		name = "respec_description",
		wrap = true,
		word_wrap = true,
		x = 0
	}
	slot5 = "menu_character_skills_retrain_desc"
	description_text_params.text = managers.localization.text(slot3, managers.localization)
	description_text_params.y = RaidGUIControlRespec.DESCRIPTION_Y
	description_text_params.w = RaidGUIControlRespec.DESCRIPTION_W
	slot5 = self._title
	description_text_params.h = self._object.h(slot3) - self._title.h(self._object)
	description_text_params.font = RaidGUIControlRespec.DESCRIPTION_FONT
	description_text_params.font_size = RaidGUIControlRespec.DESCRIPTION_FONT_SIZE
	description_text_params.color = RaidGUIControlRespec.DESCRIPTION_COLOR
	slot5 = description_text_params
	self._description = self._object.label(self._title.h(self._object), self._object)

	return 
end

return 
