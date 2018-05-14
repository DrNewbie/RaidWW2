-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlSkillDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSkillDetails = slot0
RaidGUIControlSkillDetails.DEFAULT_W = 736
RaidGUIControlSkillDetails.DEFAULT_H = 240
RaidGUIControlSkillDetails.TITLE_H = 64
RaidGUIControlSkillDetails.TITLE_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlSkillDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlSkillDetails.TITLE_COLOR = Color.white
RaidGUIControlSkillDetails.DESCRIPTION_W = 576
RaidGUIControlSkillDetails.DESCRIPTION_Y = 80
RaidGUIControlSkillDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlSkillDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlSkillDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlSkillDetails.ACTIVE_LEVEL_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlSkillDetails.PENDING_LEVEL_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlSkillDetails.INACTIVE_LEVEL_COLOR = tweak_data.gui.colors.raid_dark_grey
function RaidGUIControlSkillDetails:init(parent, params)
	slot7 = params

	RaidGUIControlSkillDetails.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlSkillDetails:init] Parameters not specified for the skill details " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_skill_title(slot4)

	slot5 = self

	self._create_skill_description(slot4)

	return 
end
function RaidGUIControlSkillDetails:_create_control_panel()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	control_params.w = self._params.w or RaidGUIControlSkillDetails.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlSkillDetails.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlSkillDetails:_create_skill_title()
	local skill_title_params = {
		vertical = "center",
		name = "skill_title",
		wrap = false,
		align = "left",
		text = "",
		y = 0,
		x = 0
	}
	slot4 = self._object
	skill_title_params.w = self._object.w(slot3)
	skill_title_params.h = RaidGUIControlSkillDetails.TITLE_H
	skill_title_params.font = RaidGUIControlSkillDetails.TITLE_FONT
	skill_title_params.font_size = RaidGUIControlSkillDetails.TITLE_FONT_SIZE
	skill_title_params.color = RaidGUIControlSkillDetails.TITLE_COLOR
	slot5 = skill_title_params
	self._title = self._object.label(slot3, self._object)

	return 
end
function RaidGUIControlSkillDetails:_create_skill_description()
	local description_text_params = {
		name = "skill_description",
		wrap = true,
		word_wrap = true,
		text = "",
		x = 0,
		y = RaidGUIControlSkillDetails.DESCRIPTION_Y,
		w = RaidGUIControlSkillDetails.DESCRIPTION_W
	}
	slot5 = self._title
	description_text_params.h = self._object.h(slot3) - self._title.h(self._object)
	description_text_params.font = RaidGUIControlSkillDetails.DESCRIPTION_FONT
	description_text_params.font_size = RaidGUIControlSkillDetails.DESCRIPTION_FONT_SIZE
	description_text_params.color = RaidGUIControlSkillDetails.DESCRIPTION_COLOR
	slot5 = description_text_params
	self._description = self._object.text(self._title.h(self._object), self._object)

	return 
end
function RaidGUIControlSkillDetails:set_skill(skill, title, description, color_changes)

	-- Decompilation error in this vicinity:
	slot7 = self._title

	return 
end
function RaidGUIControlSkillDetails:_animate_skill_change(skill_title_label, new_title, new_description, color_changes)
	local t = 0
	slot8 = self._title._object
	local starting_alpha = self._title._object.alpha(slot7)
	local fade_out_duration = starting_alpha * 0.1
	local fade_in_duration = 0.18

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = fade_out_duration
		local current_alpha = Easing.quintic_in(slot11, t, starting_alpha, -starting_alpha)
		slot14 = current_alpha

		self._title._object.set_alpha(t, self._title._object)

		slot14 = current_alpha

		self._description.set_alpha(t, self._description)
	end

	slot12 = 0

	self._title._object.set_alpha(slot10, self._title._object)

	slot12 = 0

	self._description.set_alpha(slot10, self._description)

	slot12 = new_title

	self._title.set_text(slot10, self._title)

	slot12 = new_description

	self._description.set_text(slot10, self._description)

	slot12 = RaidGUIControlSkillDetails.DESCRIPTION_COLOR

	self._description.set_color(slot10, self._description)

	if color_changes then
		slot11 = color_changes

		for index, color_change in pairs(slot10) do
			local color = RaidGUIControlSkillDetails.DESCRIPTION_COLOR

			if color_change.state == ExperienceGui.STAT_LEVEL_ACTIVE then
				color = RaidGUIControlSkillDetails.ACTIVE_LEVEL_COLOR
			elseif color_change.state == ExperienceGui.STAT_LEVEL_INACTIVE then
				color = RaidGUIControlSkillDetails.INACTIVE_LEVEL_COLOR
			elseif color_change.state == ExperienceGui.STAT_LEVEL_PENDING then
				color = RaidGUIControlSkillDetails.PENDING_LEVEL_COLOR
			end

			slot20 = color

			self._description.set_range_color(slot16, self._description, color_change.start_index, color_change.end_index)
		end
	end

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = fade_in_duration * 0.8
		local current_name_alpha = Easing.quintic_out(slot11, t, 0, 1)
		slot14 = current_name_alpha

		self._title._object.set_alpha(t, self._title._object)

		slot16 = fade_in_duration
		local current_description_alpha = Easing.quintic_out(t, t, 0, 1)
		slot15 = current_description_alpha

		self._description.set_alpha(t, self._description)
	end

	slot12 = 1

	self._title._object.set_alpha(slot10, self._title._object)

	slot12 = 1

	self._description.set_alpha(slot10, self._description)

	return 
end

return 
