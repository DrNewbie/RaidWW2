if not RaidGUIControlProgressBarSimple then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlProgressBarSimple = slot0
RaidGUIControlProgressBarSimple.DEFAULT_HEIGHT = 20
slot4 = 0.2
RaidGUIControlProgressBarSimple.DEFAULT_BACKGROUND_COLOR = Color.white.with_alpha(slot2, Color.white)
RaidGUIControlProgressBarSimple.DEFAULT_FOREGROUND_COLOR = tweak_data.gui.colors.raid_red
function RaidGUIControlProgressBarSimple:init(parent, params)
	slot7 = params

	RaidGUIControlProgressBarSimple.super.init(slot4, self, parent)

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_background_bar(slot4)

	slot5 = self

	self._create_foreground_bar(slot4)

	local initial_progress = params.initial_progress or 0
	slot7 = initial_progress

	self.set_progress(slot5, self)

	return 
end
function RaidGUIControlProgressBarSimple:_create_panel()
	local progress_bar_params = clone(slot2)
	progress_bar_params.name = progress_bar_params.name
	slot4 = self._panel
	progress_bar_params.layer = self._panel.layer(self._params) + 1

	if not self._params.w then
		slot4 = self._parent_panel
		slot2 = self._parent_panel.w(slot3)
	end

	progress_bar_params.w = slot2
	progress_bar_params.h = self._params.h or RaidGUIControlProgressBarSimple.DEFAULT_HEIGHT
	slot5 = progress_bar_params
	self._slider_panel = self._panel.panel(slot3, self._panel)
	self._object = self._slider_panel

	return 
end
function RaidGUIControlProgressBarSimple:_create_background_bar(...)
	local background_bar_params = {
		name = "background_bar",
		y = 0,
		x = 0,
		w = self._params.bar_w
	}
	slot4 = self._object
	background_bar_params.h = self._object.h(slot3)
	background_bar_params.left = self._params.left or "if_left_base"
	background_bar_params.center = self._params.center or "if_center_base"
	background_bar_params.right = self._params.right or "if_right_base"
	background_bar_params.color = self._params.background_color or RaidGUIControlProgressBarSimple.DEFAULT_BACKGROUND_COLOR
	slot4 = self._object
	background_bar_params.layer = self._object.layer(slot3) + 1
	slot5 = background_bar_params
	self._background = self._object.three_cut_bitmap(slot3, self._object)

	return 
end
function RaidGUIControlProgressBarSimple:_create_foreground_bar()
	local foreground_panel_params = {
		name = "foreground_panel",
		y = 0,
		x = 0
	}
	slot4 = self._background
	foreground_panel_params.w = self._background.w(slot3)
	slot4 = self._object
	foreground_panel_params.h = self._object.h(slot3)
	foreground_panel_params.layer = self._object.layer(slot3) + 10
	slot5 = foreground_panel_params
	self._foreground = self._object.panel(slot3, self._object)
	local foreground_image_params = {
		name = "foreground_bar",
		y = 0,
		x = 0
	}
	slot5 = self._foreground
	foreground_image_params.w = self._foreground.w(self._object)
	slot5 = self._foreground
	foreground_image_params.h = self._foreground.h(self._object)
	foreground_image_params.left = self._params.left or "if_left_base"
	foreground_image_params.center = self._params.center or "if_center_base"
	foreground_image_params.right = self._params.right or "if_right_base"
	foreground_image_params.color = self._params.foreground_color or RaidGUIControlProgressBarSimple.DEFAULT_FOREGROUND_COLOR
	slot6 = foreground_image_params
	self._foreground_image = self._foreground.three_cut_bitmap(self._object, self._foreground)

	return 
end
function RaidGUIControlProgressBarSimple:set_progress(progress)
	self._progress = progress
	slot7 = self._background
	slot5 = self._background.w(slot6) * progress

	self._foreground.set_w(slot3, self._foreground)

	slot4 = self._foreground_image
	slot7 = self._foreground

	self._foreground_image.set_w(slot3, self._foreground.w(slot6))

	return 
end
function RaidGUIControlProgressBarSimple:set_foreground_progress(progress)
	self._progress = progress
	slot7 = self._background
	slot5 = self._background.w(slot6) * progress

	self._foreground.set_w(slot3, self._foreground)

	slot4 = self._foreground_image
	slot7 = self._background

	self._foreground_image.set_w(slot3, self._background.w(slot6))

	return 
end
function RaidGUIControlProgressBarSimple:get_progress()
	return self._progress
end
function RaidGUIControlProgressBarSimple:show()
	slot4 = 1

	self._object.set_alpha(slot2, self._object)

	return 
end
function RaidGUIControlProgressBarSimple:hide()
	slot4 = 0

	self._object.set_alpha(slot2, self._object)

	return 
end

return 
