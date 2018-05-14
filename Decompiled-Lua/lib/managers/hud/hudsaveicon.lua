HUDSaveIcon = HUDSaveIcon or class()
HUDSaveIcon.BACKGROUND = "saving_background"
HUDSaveIcon.DEFAULT_W = 250
HUDSaveIcon.DEFAULT_H = RaidGuiBase.PADDING
HUDSaveIcon.ICON_PADDING = 10
HUDSaveIcon.FONT = tweak_data.gui.fonts.din_compressed_outlined_32
HUDSaveIcon.FONT_SIZE = tweak_data.gui.font_sizes.size_32
slot3 = "878787"
HUDSaveIcon.COLOR = Color(slot2)
HUDSaveIcon.BULLET_ICON = "loading_revolver_circle"
slot3 = "787878"
HUDSaveIcon.BULLET_COLOR = Color(slot2)
HUDSaveIcon.NUMBER_OF_BULLETS = 8
HUDSaveIcon.RADIUS = 13
HUDSaveIcon.ONE_CIRCLE_DURATION = 1
HUDSaveIcon.DEFAULT_TEXT = "savefile_saving"
function HUDSaveIcon:init(workspace)
	self._ws = workspace
	slot4 = self._ws
	self._workspace_panel = self._ws.panel(slot3)
	slot5 = "save_icon_panel"

	if self._workspace_panel.child(slot3, self._workspace_panel) then
		slot4 = self._workspace_panel
		slot8 = "save_icon_panel"

		self._workspace_panel.remove(slot3, self._workspace_panel.child(slot6, self._workspace_panel))
	end

	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_text(slot3)

	slot4 = self

	self._create_bullets(slot3)

	return 
end
function HUDSaveIcon:_create_panel()
	local panel_params = {
		name = "save_icon_panel",
		alpha = 0,
		w = HUDSaveIcon.DEFAULT_W,
		h = HUDSaveIcon.DEFAULT_H,
		layer = tweak_data.gui.SAVEFILE_LAYER
	}
	slot5 = panel_params
	self._panel = self._workspace_panel.panel(slot3, self._workspace_panel)
	slot4 = self._panel
	slot7 = self._workspace_panel

	self._panel.set_bottom(slot3, self._workspace_panel.h(slot6))

	slot7 = self._workspace_panel
	slot5 = self._workspace_panel.w(slot6) / 2

	self._panel.set_center_x(slot3, self._panel)

	return 
end
function HUDSaveIcon:_create_background()
	local background_params = {
		name = "background",
		texture = tweak_data.gui.icons[HUDSaveIcon.BACKGROUND].texture,
		texture_rect = tweak_data.gui.icons[HUDSaveIcon.BACKGROUND].texture_rect
	}
	slot5 = background_params
	self._background = self._panel.bitmap(HUDSaveIcon.BACKGROUND, self._panel)
	slot7 = self._panel
	slot5 = self._panel.w(slot6) / 2

	self._background.set_center_x(HUDSaveIcon.BACKGROUND, self._background)

	slot7 = self._panel
	slot5 = self._panel.h(slot6) / 2

	self._background.set_center_y(HUDSaveIcon.BACKGROUND, self._background)

	return 
end
function HUDSaveIcon:_create_text()
	local text_params = {
		name = "save_icon_text",
		vertical = "center",
		text = "",
		y = 0,
		x = 0
	}
	slot4 = self._panel
	text_params.h = self._panel.h(slot3)
	text_params.font = HUDSaveIcon.FONT
	text_params.font_size = HUDSaveIcon.FONT_SIZE
	text_params.color = HUDSaveIcon.COLOR
	slot5 = text_params
	self._text = self._panel.text(slot3, self._panel)

	return 
end
function HUDSaveIcon:_create_bullets()
	local bullet_panel_params = {
		halign = "left",
		name = "bullet_panel",
		y = 0,
		w = 32,
		x = 0,
		valign = "center"
	}
	slot4 = self._panel
	bullet_panel_params.h = self._panel.h(slot3)
	slot5 = bullet_panel_params
	self._bullet_panel = self._panel.panel(slot3, self._panel)
	local single_bullet_angle = 360 / HUDSaveIcon.NUMBER_OF_BULLETS
	self._bullets = {}

	for i = 1, HUDSaveIcon.NUMBER_OF_BULLETS, 1 do
		local dx = HUDSaveIcon.RADIUS * math.cos(slot9)
		slot11 = single_bullet_angle * (i - 1) - 90
		local dy = HUDSaveIcon.RADIUS * math.sin(single_bullet_angle * (i - 1) - 90)
		local bullet_params = {}
		slot13 = i
		bullet_params.name = "bullet_" .. tostring(slot12)
		bullet_params.texture = tweak_data.gui.icons[HUDSaveIcon.BULLET_ICON].texture
		bullet_params.texture_rect = tweak_data.gui.icons[HUDSaveIcon.BULLET_ICON].texture_rect
		bullet_params.color = HUDSaveIcon.BULLET_COLOR
		slot13 = bullet_params
		local bullet = self._bullet_panel.bitmap(HUDSaveIcon.BULLET_ICON, self._bullet_panel)
		slot16 = self._bullet_panel
		slot14 = self._bullet_panel.w(slot15) / 2 + dx

		bullet.set_center_x(self._bullet_panel, bullet)

		slot16 = self._bullet_panel
		slot14 = self._bullet_panel.h(slot15) / 2 + dy

		bullet.set_center_y(self._bullet_panel, bullet)

		slot14 = bullet

		table.insert(self._bullet_panel, self._bullets)
	end

	return 
end
function HUDSaveIcon:show(params)
	local text = params.text or HUDSaveIcon.DEFAULT_TEXT
	slot5 = self._text
	slot11 = text

	self._text.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

	slot5 = self._text
	local _, _, w, _ = self._text.text_rect(slot4)
	slot10 = w

	self._text.set_w(managers.localization.text, self._text)

	local content_w = self._bullet_panel.w(managers.localization.text) + HUDSaveIcon.ICON_PADDING + w
	slot13 = self._panel
	slot11 = self._panel.w(slot12) / 2 - content_w / 2

	self._bullet_panel.set_x(self._bullet_panel, self._bullet_panel)

	slot13 = self._bullet_panel
	slot11 = self._bullet_panel.right(content_w / 2) + HUDSaveIcon.ICON_PADDING

	self._text.set_x(self._bullet_panel, self._text)

	if not self._shown then
		slot10 = self._panel

		self._panel.stop(slot9)

		slot10 = self._panel
		slot15 = "_animate_show"

		self._panel.animate(slot9, callback(slot12, self, self))

		self._shown = true
	end

	if not self._animating then
		self._active_bullet = 8
		slot10 = self._bullet_panel
		slot15 = "_animate_bullets"

		self._bullet_panel.animate(slot9, callback(slot12, self, self))

		self._animating = true
	end

	return 
end
function HUDSaveIcon:hide()
	slot3 = self._panel

	self._panel.stop(slot2)

	slot3 = self._panel
	slot8 = "_animate_hide"

	self._panel.animate(slot2, callback(slot5, self, self))

	self._shown = false

	return 
end
function HUDSaveIcon:_animate_bullets()
	while true do
		local shoot_duration = 0.1
		local t = 0
		slot5 = self._bullets[self._active_bullet]
		local center_x = self._bullets[self._active_bullet].center_x(self._active_bullet)
		slot6 = self._bullets[self._active_bullet]
		local center_y = self._bullets[self._active_bullet].center_y(self._active_bullet)

		while t < shoot_duration do
			local dt = coroutine.yield()
			t = t + dt
			local current_size = Easing.linear(slot7, t, 1, -1)
			slot13 = HUDSaveIcon.BULLET_ICON
			slot10 = current_size * tweak_data.gui.icon_w(shoot_duration, tweak_data.gui)

			self._bullets[self._active_bullet].set_w(self._active_bullet, self._bullets[self._active_bullet])

			slot13 = HUDSaveIcon.BULLET_ICON
			slot10 = current_size * tweak_data.gui.icon_h(shoot_duration, tweak_data.gui)

			self._bullets[self._active_bullet].set_h(self._active_bullet, self._bullets[self._active_bullet])

			slot10 = center_x

			self._bullets[self._active_bullet].set_center_x(self._active_bullet, self._bullets[self._active_bullet])

			slot10 = center_y

			self._bullets[self._active_bullet].set_center_y(self._active_bullet, self._bullets[self._active_bullet])
		end

		slot8 = 0

		self._bullets[self._active_bullet].set_alpha(self._active_bullet, self._bullets[self._active_bullet])

		slot7 = self._bullets[self._active_bullet]
		slot11 = HUDSaveIcon.BULLET_ICON

		self._bullets[self._active_bullet].set_w(self._active_bullet, tweak_data.gui.icon_w(slot9, tweak_data.gui))

		slot7 = self._bullets[self._active_bullet]
		slot11 = HUDSaveIcon.BULLET_ICON

		self._bullets[self._active_bullet].set_h(self._active_bullet, tweak_data.gui.icon_h(slot9, tweak_data.gui))

		slot8 = center_x

		self._bullets[self._active_bullet].set_center_x(self._active_bullet, self._bullets[self._active_bullet])

		slot8 = center_y

		self._bullets[self._active_bullet].set_center_y(self._active_bullet, self._bullets[self._active_bullet])

		local rotation_duration = 0.5
		t = 0
		local single_bullet_angle = 360 / #self._bullets
		local initial_rotations = {}

		for i = 1, #self._bullets, 1 do
			slot14 = initial_rotations
			slot17 = self._bullets[i]

			table.insert(slot13, self._bullets[i].rotation(slot16))
		end

		while t < rotation_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot14 = rotation_duration
			local current_rotation_offset = Easing.quartic_in_out(slot10, t, 0, single_bullet_angle)

			for i = 1, #self._bullets, 1 do
				local dx = HUDSaveIcon.RADIUS * math.cos(slot16)
				slot18 = (single_bullet_angle * (i - 1) + current_rotation_offset) - 90
				local dy = HUDSaveIcon.RADIUS * math.sin((single_bullet_angle * (i - 1) + current_rotation_offset) - 90)
				slot21 = self._bullet_panel
				slot19 = self._bullet_panel.w(slot20) / 2 + dx

				self._bullets[i].set_center_x((single_bullet_angle * (i - 1) + current_rotation_offset) - 90, self._bullets[i])

				slot21 = self._bullet_panel
				slot19 = self._bullet_panel.h(slot20) / 2 + dy

				self._bullets[i].set_center_y((single_bullet_angle * (i - 1) + current_rotation_offset) - 90, self._bullets[i])
			end
		end

		slot10 = 0.15

		wait(slot9)

		local reload_duration = 0.2
		t = 0
		slot11 = self._bullets[self._active_bullet]
		center_y = self._bullets[self._active_bullet].center_y(self._active_bullet)

		while t < reload_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot15 = reload_duration
			local current_position_offset = Easing.linear(slot11, t, 10, -10)
			slot14 = center_y - current_position_offset

			self._bullets[self._active_bullet].set_center_y(self._active_bullet, self._bullets[self._active_bullet])

			slot16 = reload_duration * 0.9
			local current_alpha = Easing.linear(self._active_bullet, t, 0, 1)
			slot15 = current_alpha

			self._bullets[self._active_bullet].set_alpha(self._active_bullet, self._bullets[self._active_bullet])
		end

		for i = 1, #self._bullets, 1 do
			local dx = HUDSaveIcon.RADIUS * math.cos(slot15)
			slot17 = single_bullet_angle * (i - 1) - 90
			local dy = HUDSaveIcon.RADIUS * math.sin(single_bullet_angle * (i - 1) - 90)
			slot20 = self._bullet_panel
			slot18 = self._bullet_panel.w(slot19) / 2 + dx

			self._bullets[i].set_center_x(single_bullet_angle * (i - 1) - 90, self._bullets[i])

			slot20 = self._bullet_panel
			slot18 = self._bullet_panel.h(slot19) / 2 + dy

			self._bullets[i].set_center_y(single_bullet_angle * (i - 1) - 90, self._bullets[i])
		end

		slot11 = 0.3

		wait(slot10)
	end

	return 
end
function HUDSaveIcon:_animate_show()
	local duration = 0.2
	slot4 = self._panel
	local t = self._panel.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._panel.set_alpha(t, self._panel)
	end

	slot6 = 1

	self._panel.set_alpha(slot4, self._panel)

	return 
end
function HUDSaveIcon:_animate_hide()
	local duration = 0.4
	slot4 = self._panel
	local t = (1 - self._panel.alpha(slot3)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_in(slot5, t, 1, -1)
		slot8 = current_alpha

		self._panel.set_alpha(t, self._panel)
	end

	slot6 = 0

	self._panel.set_alpha(slot4, self._panel)

	slot5 = self._ws

	self._ws.hide(slot4)

	return 
end

return 
