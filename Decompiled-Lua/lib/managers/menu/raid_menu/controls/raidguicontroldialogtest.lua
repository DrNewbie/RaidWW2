if not RaidGUIControlDialogTest then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlDialogTest = slot0
function RaidGUIControlDialogTest:init(parent, params)
	slot7 = params

	RaidGUIControlDialogTest.super.init(slot4, self, parent)

	self._yes_callback = self._params.yes_callback
	self._no_callback = self._params.no_callback
	slot6 = {
		name = "dialog_panel",
		y = 0,
		x = 0,
		w = self._panel.w(slot8),
		h = self._panel.h(slot8),
		layer = self._panel.layer(slot8) + 100
	}
	slot9 = self._panel
	slot9 = self._panel
	slot9 = self._panel
	self._object = self._panel.panel(slot4, self._panel)
	slot9 = self._object
	slot9 = self._object
	self._background = self._object.rect(slot4, self._object)
	slot5 = self._object
	local center_x, center_y = self._object.center(slot4)
	slot8 = {
		w = 576,
		name = "dialog_title",
		h = 32,
		vertical = "center",
		align = "center",
		visible = false,
		x = center_x,
		y = center_y - 82,
		text = self.translate(0.9, self, "character_creation_create_title"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.dialg_title
	}
	slot13 = true
	self._title_label = self._object.label({
		name = "background",
		y = 0,
		x = 0,
		w = self._object.w(slot8),
		h = self._object.h(slot8),
		color = tweak_data.gui.colors.raid_black.with_alpha(slot8, tweak_data.gui.colors.raid_black)
	}, self._object)
	slot8 = center_x

	self._title_label.set_center_x(, self._title_label)

	slot8 = true

	self._title_label.set_visible(, self._title_label)

	slot8 = {
		visible = false,
		name = "input_field",
		h = 48,
		w = 430,
		x = center_x,
		y = center_y,
		ws = self._params.ws
	}
	self._input_box = self._object.input_field(, self._object)
	slot8 = center_x

	self._input_box.set_center_x(, self._input_box)

	slot8 = center_y

	self._input_box.set_center_y(, self._input_box)

	slot8 = true

	self._input_box.set_visible(, self._input_box)

	slot8 = {
		name = "yes_button",
		x = center_x,
		y = center_y + 112,
		text = self.translate(0.9, self, "yes"),
		on_click_callback = self._yes_callback
	}
	slot13 = true
	self._yes_button = self._object.short_primary_button(, self._object)
	slot7 = self._yes_button

	self._yes_button.set_x(, self._input_box.x(self._yes_callback))

	slot8 = true

	self._yes_button.set_visible(, self._yes_button)

	slot8 = {
		name = "no_button",
		x = center_x,
		y = center_y + 112,
		text = self.translate(self._input_box, self, "no"),
		on_click_callback = self._no_callback
	}
	slot13 = true
	self._no_button = self._object.short_secondary_button(, self._object)
	slot11 = self._input_box
	slot11 = self._no_button
	slot8 = (self._input_box.x(self._no_callback) + self._input_box.w(self._input_box)) - self._no_button.w(self._input_box)

	self._no_button.set_x(, self._no_button)

	slot8 = true

	self._no_button.set_visible(, self._no_button)

	return 
end
function RaidGUIControlDialogTest:get_new_profile_name()
	slot3 = self._input_box

	return self._input_box.get_text(slot2)
end
function RaidGUIControlDialogTest:confirm_pressed()
	return true
end

return 
