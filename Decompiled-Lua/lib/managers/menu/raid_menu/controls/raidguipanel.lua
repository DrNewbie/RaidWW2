-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidGUIPanel = RaidGUIPanel or class()
RaidGUIPanel.ID = 1
RaidGUIPanel.TYPE = "raid_gui_panel"
function RaidGUIPanel:init(parent, params)

	-- Decompilation error in this vicinity:
	self._type = self._type or RaidGUIPanel.TYPE
	self._panel_id = RaidGUIPanel.ID
	RaidGUIPanel.ID = RaidGUIPanel.ID + 1
	self._name = params.name or self._type .. "_" .. self._panel_id
	self._parent = parent
	slot5 = params
	self._params = clone(slot4)
	self._params.name = params.name or self._name
	slot3 = self._params
	self._controls = {}

	return 
end
function RaidGUIPanel:get_controls()
	return self._controls
end
function RaidGUIPanel:get_engine_panel()
	return self._engine_panel
end
function RaidGUIPanel:center()
	slot3 = self._engine_panel

	return self._engine_panel.center(slot2)
end
function RaidGUIPanel:center_x()
	slot3 = self._engine_panel

	return self._engine_panel.center_x(slot2)
end
function RaidGUIPanel:center_y()
	slot3 = self._engine_panel

	return self._engine_panel.center_y(slot2)
end
function RaidGUIPanel:set_top(value)
	slot5 = value

	return self._engine_panel.set_top(slot3, self._engine_panel)
end
function RaidGUIPanel:set_bottom(value)
	slot5 = value

	return self._engine_panel.set_bottom(slot3, self._engine_panel)
end
function RaidGUIPanel:get_panel()
	return self
end
function RaidGUIPanel:layer()
	slot3 = self._engine_panel

	return self._engine_panel.layer(slot2)
end
function RaidGUIPanel:close()
	slot3 = self._controls

	for _, control in ipairs(slot2) do
		slot8 = control

		control.close(slot7)
	end

	self._controls = {}
	slot3 = self._engine_panel

	self._engine_panel.clear(slot2)

	return 
end
function RaidGUIPanel:clear()
	slot3 = self._controls

	for _, control in ipairs(slot2) do
		slot8 = control

		control.close(slot7)
	end

	self._controls = {}
	slot3 = self._engine_panel

	self._engine_panel.clear(slot2)

	return 
end
function RaidGUIPanel:child(control_name)
	slot4 = self._engine_panel

	if alive(slot3) then
		slot5 = control_name

		return self._engine_panel.child(slot3, self._engine_panel)
	else
		return nil
	end

	return 
end
function RaidGUIPanel:children()
	slot3 = self._engine_panel

	return self._engine_panel.children(slot2)
end
function RaidGUIPanel:parent()
	return self._parent
end
function RaidGUIPanel:remove(control)
	local removed = false
	local i = #self._controls

	while 0 < i do
		if self._controls[i] == control then
			slot7 = i

			table.remove(slot5, self._controls)

			if control._object._type == RaidGUIPanel.TYPE then
				slot6 = self._engine_panel
				slot9 = control._object

				self._engine_panel.remove(slot5, control._object.get_engine_panel(slot8))
			else
				slot7 = control._object

				self._engine_panel.remove(slot5, self._engine_panel)
			end

			removed = true

			break
		end

		i = i - 1
	end

	if not removed and control ~= nil then
		slot7 = control

		self._engine_panel.remove(slot5, self._engine_panel)
	end

	control = nil

	return 
end
function RaidGUIPanel:get_max_control_y()
	local max_y = 0
	slot4 = self._controls

	for _, control in pairs(slot3) do
		slot10 = control
		local bottom_y = control.y(slot8) + control.h(control)

		if max_y < bottom_y then
			max_y = bottom_y
		end
	end

	return max_y
end
function RaidGUIPanel:fit_content_height()
	local max_y = self.get_max_control_y(slot2)
	slot5 = max_y

	self._engine_panel.set_h(self, self._engine_panel)

	return 
end
function RaidGUIPanel:key_press(callback)
	if callback then
		slot5 = callback

		self._engine_panel.key_press(slot3, self._engine_panel)
	end

	return 
end
function RaidGUIPanel:key_release(callback)
	if callback then
		slot5 = callback

		self._engine_panel.key_release(slot3, self._engine_panel)
	end

	return 
end
function RaidGUIPanel:enter_text(callback)
	if callback then
		slot5 = callback

		self._engine_panel.enter_text(slot3, self._engine_panel)
	end

	return 
end
function RaidGUIPanel:inside(x, y)
	slot7 = y

	if self._engine_panel.inside(slot4, self._engine_panel, x) then
		slot5 = self._engine_panel
		slot3 = self._engine_panel.tree_visible(slot4)
	end

	return slot3
end
function RaidGUIPanel:mouse_moved(o, x, y)
	local used = false
	local pointer = nil
	slot8 = self._controls

	for _, control in ipairs(slot7) do
		slot16 = y
		local u, p = control.mouse_moved(slot12, control, o, x)

		if not used and u then
			used = u
			pointer = p
		end
	end

	return used, pointer
end
function RaidGUIPanel:mouse_pressed(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		slot16 = y
		local handled = control.mouse_pressed(slot11, control, o, button, x)

		if handled then
			return true
		end
	end

	return false
end
function RaidGUIPanel:mouse_clicked(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		slot16 = y
		local handled = control.mouse_clicked(slot11, control, o, button, x)

		if handled then
			return true
		end
	end

	return false
end
function RaidGUIPanel:mouse_double_click(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		if control then
			slot12 = control

			if control.visible(slot11) then
				slot14 = y

				if control.inside(slot11, control, x) then
					slot16 = y
					local handled = control.mouse_double_click(slot11, control, o, button, x)

					if handled then
						return true
					end
				end
			end
		end
	end

	return false
end
function RaidGUIPanel:mouse_released(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		if control then
			slot12 = control

			if control.visible(slot11) then
				slot14 = y

				if control.inside(slot11, control, x) then
					slot16 = y
					local handled = control.mouse_released(slot11, control, o, button, x)

					if handled then
						return true
					end
				end
			end
		end
	end

	return false
end
function RaidGUIPanel:mouse_scroll_up(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		slot14 = y

		if control.inside(slot11, control, x) then
			slot16 = y
			local handled = control.mouse_scroll_up(slot11, control, o, button, x)

			if handled then
				return true
			end
		end
	end

	return false
end
function RaidGUIPanel:mouse_scroll_down(o, button, x, y)
	slot7 = self._controls

	for _, control in ipairs(slot6) do
		slot14 = y

		if control.inside(slot11, control, x) then
			slot16 = y
			local handled = control.mouse_scroll_down(slot11, control, o, button, x)

			if handled then
				return true
			end
		end
	end

	return false
end
function RaidGUIPanel:back_pressed()
	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return 
end
function RaidGUIPanel:special_btn_pressed(...)
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.special_btn_pressed(slot13, ...)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:move_up()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.move_up(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:move_down()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.move_down(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:move_left()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.move_left(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:move_right()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.move_right(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:scroll_up()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.scroll_up(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:scroll_down()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.scroll_down(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:scroll_left()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.scroll_left(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:scroll_right()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled, target = control.scroll_right(slot13)

			if handled then
				return true
			end

			if not handled and target then
				return false, target
			end
		end
	end

	return false
end
function RaidGUIPanel:special_btn_pressed(...)
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled = control.special_btn_pressed(slot13, ...)

			if handled then
				return true
			end
		end
	end

	return false
end
function RaidGUIPanel:confirm_pressed()
	local component_controls = managers.menu_component._active_controls
	slot4 = component_controls

	for _, controls in pairs(slot3) do
		slot9 = controls

		for _, control in pairs(slot8) do
			slot14 = control
			local handled = control.confirm_pressed(slot13)

			if handled then
				return true
			end
		end
	end

	return false
end
function RaidGUIPanel:set_background(params)
	if params.texture then
		if self._background then
			slot5 = self._background

			self._engine_panel.remove(slot3, self._engine_panel)
		end

		params.name = self._name .. "_bg"
		params.x = 0
		params.y = 0
		slot4 = self._engine_panel
		params.w = self._engine_panel.w("_bg")
		slot4 = self._engine_panel
		params.h = self._engine_panel.h("_bg")
		params.layer = 1
		slot5 = params
		self._background = self.bitmap("_bg", self)
	elseif params.background_color then
		if self._background then
			slot5 = self._background

			self._engine_panel.remove(slot3, self._engine_panel)
		end

		slot5 = {
			layer = 1,
			name = self._name .. "_bg",
			color = params.background_color
		}
		self._background = self.rect(slot3, self)
	end

	return 
end
function RaidGUIPanel:remove_background()
	slot4 = self._background

	self.remove(slot2, self)

	return 
end
function RaidGUIPanel:set_background_color(color)
	if self._background then
		slot5 = color

		self._background.set_color(slot3, self._background)
	end

	return 
end
function RaidGUIPanel:highlight_on()
	return 
end
function RaidGUIPanel:highlight_off()
	return 
end
function RaidGUIPanel:show()
	slot3 = self._engine_panel

	self._engine_panel.show(slot2)

	return 
end
function RaidGUIPanel:hide()
	slot3 = self._engine_panel

	self._engine_panel.hide(slot2)

	return 
end
function RaidGUIPanel:tree_visible()
	slot3 = self._engine_panel

	return self._engine_panel.tree_visible(slot2)
end
function RaidGUIPanel:set_visible(flag)
	slot5 = flag

	return self._engine_panel.set_visible(slot3, self._engine_panel)
end
function RaidGUIPanel:visible()
	if self._engine_panel.alive then
		if self._engine_panel.alive then
			slot3 = self._engine_panel

			if alive(slot2) then
				slot3 = self._engine_panel
				slot1 = self._engine_panel.visible(slot2)
			end
		end

		return slot1
	else
		slot3 = self._engine_panel

		return self._engine_panel.visible(slot2)
	end

	return 
end
function RaidGUIPanel:text(params)
	slot6 = params.font_size
	params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, params.font)
	slot5 = params

	return self._engine_panel.text(slot3, self._engine_panel)
end
function RaidGUIPanel:rect(params)
	slot5 = params

	return self._engine_panel.rect(slot3, self._engine_panel)
end
function RaidGUIPanel:bitmap(params)
	slot5 = params

	return self._engine_panel.bitmap(slot3, self._engine_panel)
end
function RaidGUIPanel:multi_bitmap(params)
	slot5 = params

	return self._engine_panel.multi_bitmap(slot3, self._engine_panel)
end
function RaidGUIPanel:gradient(params)
	slot5 = params

	return self._engine_panel.gradient(slot3, self._engine_panel)
end
function RaidGUIPanel:polyline(params)
	slot5 = params

	return self._engine_panel.polyline(slot3, self._engine_panel)
end
function RaidGUIPanel:polygon(params)
	slot5 = params

	return self._engine_panel.polygon(slot3, self._engine_panel)
end
function RaidGUIPanel:video(params)
	slot6 = params
	local control = RaidGUIControlVideo.new(slot3, RaidGUIControlVideo, self)
	slot6 = control

	self._add_control(RaidGUIControlVideo, self)

	return control
end
function RaidGUIPanel:unit(params)
	slot5 = params

	return self._engine_panel.unit(slot3, self._engine_panel)
end
function RaidGUIPanel:panel(params, dont_create_panel)
	slot7 = params
	local control = RaidGUIPanel.new(slot4, RaidGUIPanel, self)

	if not dont_create_panel then
		slot7 = control

		self._add_control(slot5, self)
	end

	return control
end
function RaidGUIPanel:label(params)
	slot6 = params.font_size
	params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, params.font)
	slot6 = params
	local control = RaidGUIControlLabel.new(slot3, RaidGUIControlLabel, self)
	slot6 = control

	self._add_control(RaidGUIControlLabel, self)

	return control
end
function RaidGUIPanel:label_title(params)
	slot6 = params
	local control = RaidGUIControlLabelTitle.new(slot3, RaidGUIControlLabelTitle, self)
	slot6 = control

	self._add_control(RaidGUIControlLabelTitle, self)

	return control
end
function RaidGUIPanel:label_subtitle(params)
	slot6 = params
	local control = RaidGUIControlLabelSubtitle.new(slot3, RaidGUIControlLabelSubtitle, self)
	slot6 = control

	self._add_control(RaidGUIControlLabelSubtitle, self)

	return control
end
function RaidGUIPanel:label_named_value(params)
	slot6 = params
	local control = RaidGUIControlLabelNamedValue.new(slot3, RaidGUIControlLabelNamedValue, self)
	slot6 = control

	self._add_control(RaidGUIControlLabelNamedValue, self)

	return control
end
function RaidGUIPanel:label_named_value_with_delta(params)
	slot6 = params
	local control = RaidGUIControlLabelNamedValueWithDelta.new(slot3, RaidGUIControlLabelNamedValueWithDelta, self)
	slot6 = control

	self._add_control(RaidGUIControlLabelNamedValueWithDelta, self)

	return control
end
function RaidGUIPanel:button(params)
	slot6 = params
	local control = RaidGUIControlButton.new(slot3, RaidGUIControlButton, self)
	slot6 = control

	self._add_control(RaidGUIControlButton, self)

	return control
end
function RaidGUIPanel:small_button(params)
	slot6 = params
	local control = RaidGUIControlButtonSmall.new(slot3, RaidGUIControlButtonSmall, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonSmall, self)

	return control
end
function RaidGUIPanel:short_primary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonShortPrimary.new(slot3, RaidGUIControlButtonShortPrimary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonShortPrimary, self)

	return control
end
function RaidGUIPanel:short_primary_gold_button(params)
	slot6 = params
	local control = RaidGUIControlButtonShortPrimaryGold.new(slot3, RaidGUIControlButtonShortPrimaryGold, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonShortPrimaryGold, self)

	return control
end
function RaidGUIPanel:short_primary_button_disabled(params)
	slot6 = params
	local control = RaidGUIControlButtonShortPrimaryDisabled.new(slot3, RaidGUIControlButtonShortPrimaryDisabled, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonShortPrimaryDisabled, self)

	return control
end
function RaidGUIPanel:short_secondary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonShortSecondary.new(slot3, RaidGUIControlButtonShortSecondary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonShortSecondary, self)

	return control
end
function RaidGUIPanel:short_tertiary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonShortTertiary.new(slot3, RaidGUIControlButtonShortTertiary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonShortTertiary, self)

	return control
end
function RaidGUIPanel:long_primary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonLongPrimary.new(slot3, RaidGUIControlButtonLongPrimary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonLongPrimary, self)

	return control
end
function RaidGUIPanel:long_primary_button_disabled(params)
	slot6 = params
	local control = RaidGUIControlButtonLongPrimaryDisabled.new(slot3, RaidGUIControlButtonLongPrimaryDisabled, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonLongPrimaryDisabled, self)

	return control
end
function RaidGUIPanel:long_secondary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonLongSecondary.new(slot3, RaidGUIControlButtonLongSecondary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonLongSecondary, self)

	return control
end
function RaidGUIPanel:long_tertiary_button(params)
	slot6 = params
	local control = RaidGUIControlButtonLongTertiary.new(slot3, RaidGUIControlButtonLongTertiary, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonLongTertiary, self)

	return control
end
function RaidGUIPanel:info_button(params)
	slot6 = params
	local control = RaidGUIControlButtonSubtitle.new(slot3, RaidGUIControlButtonSubtitle, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonSubtitle, self)

	return control
end
function RaidGUIPanel:button_weapon_skill(params)
	slot6 = params
	local control = RaidGUIControlButtonWeaponSkill.new(slot3, RaidGUIControlButtonWeaponSkill, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonWeaponSkill, self)

	return control
end
function RaidGUIPanel:toggle_button(params)
	slot6 = params
	local control = RaidGUIControlButtonToggle.new(slot3, RaidGUIControlButtonToggle, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonToggle, self)

	return control
end
function RaidGUIPanel:switch_button(params)
	slot6 = params
	local control = RaidGUIControlButtonSwitch.new(slot3, RaidGUIControlButtonSwitch, self)
	slot6 = control

	self._add_control(RaidGUIControlButtonSwitch, self)

	return control
end
function RaidGUIPanel:breadcrumb(params)
	slot6 = params
	local control = RaidGUIControlBreadcrumb.new(slot3, RaidGUIControlBreadcrumb, self)
	slot6 = control

	self._add_control(RaidGUIControlBreadcrumb, self)

	return control
end
function RaidGUIPanel:image(params)
	slot6 = params
	local control = RaidGUIControlImage.new(slot3, RaidGUIControlImage, self)
	slot6 = control

	self._add_control(RaidGUIControlImage, self)

	return control
end
function RaidGUIPanel:info_icon(params)
	slot6 = params
	local control = RaidGUIControlInfoIcon.new(slot3, RaidGUIControlInfoIcon, self)
	slot6 = control

	self._add_control(RaidGUIControlInfoIcon, self)

	return control
end
function RaidGUIPanel:three_cut_bitmap(params)
	slot6 = params
	local control = RaidGUIControlThreeCutBitmap.new(slot3, RaidGUIControlThreeCutBitmap, self)
	slot6 = control

	self._add_control(RaidGUIControlThreeCutBitmap, self)

	return control
end
function RaidGUIPanel:image_button(params)
	slot6 = params
	local control = RaidGUIControlImageButton.new(slot3, RaidGUIControlImageButton, self)
	slot6 = control

	self._add_control(RaidGUIControlImageButton, self)

	return control
end
function RaidGUIPanel:navigation_button(params)
	slot6 = params
	local control = RaidGUIControlNavigationButton.new(slot3, RaidGUIControlNavigationButton, self)
	slot6 = control

	self._add_control(RaidGUIControlNavigationButton, self)

	return control
end
function RaidGUIPanel:animated_bitmap(params)
	slot6 = params
	local control = RaidGUIControlAnimatedBitmap.new(slot3, RaidGUIControlAnimatedBitmap, self)
	slot6 = control

	self._add_control(RaidGUIControlAnimatedBitmap, self)

	return control
end
function RaidGUIPanel:list(params)
	slot6 = params
	local control = RaidGUIControlList.new(slot3, RaidGUIControlList, self)
	slot6 = control

	self._add_control(RaidGUIControlList, self)

	return control
end
function RaidGUIPanel:list_active(params)
	slot6 = params
	local control = RaidGUIControlListActive.new(slot3, RaidGUIControlListActive, self)
	slot6 = control

	self._add_control(RaidGUIControlListActive, self)

	return control
end
function RaidGUIPanel:stepper(params)
	slot6 = params
	local control = RaidGUIControlStepper.new(slot3, RaidGUIControlStepper, self)
	slot6 = control

	self._add_control(RaidGUIControlStepper, self)

	return control
end
function RaidGUIPanel:stepper_simple(params)
	slot6 = params
	local control = RaidGUIControlStepperSimple.new(slot3, RaidGUIControlStepperSimple, self)
	slot6 = control

	self._add_control(RaidGUIControlStepperSimple, self)

	return control
end
function RaidGUIPanel:slider(params)
	slot6 = params
	local control = RaidGUIControlSlider.new(slot3, RaidGUIControlSlider, self)
	slot6 = control

	self._add_control(RaidGUIControlSlider, self)

	return control
end
function RaidGUIPanel:slider_simple(params)
	slot6 = params
	local control = RaidGUIControlSliderSimple.new(slot3, RaidGUIControlSliderSimple, self)
	slot6 = control

	self._add_control(RaidGUIControlSliderSimple, self)

	return control
end
function RaidGUIPanel:table(params)
	slot6 = params
	local control = RaidGUIControlTable.new(slot3, RaidGUIControlTable, self)
	slot6 = control

	self._add_control(RaidGUIControlTable, self)

	return control
end
function RaidGUIPanel:tabs(params)
	slot6 = params
	local control = RaidGUIControlTabs.new(slot3, RaidGUIControlTabs, self)
	slot6 = control

	self._add_control(RaidGUIControlTabs, self)

	return control
end
function RaidGUIPanel:rotate_unit(params)
	slot6 = params
	local control = RaidGUIControlRotateUnit.new(slot3, RaidGUIControlRotateUnit, self)
	slot6 = control

	self._add_control(RaidGUIControlRotateUnit, self)

	return control
end
function RaidGUIPanel:progress_bar(params)
	slot6 = params
	local control = RaidGUIControlProgressBar.new(slot3, RaidGUIControlProgressBar, self)
	slot6 = control

	self._add_control(RaidGUIControlProgressBar, self)

	return control
end
function RaidGUIPanel:progress_bar_simple(params)
	slot6 = params
	local control = RaidGUIControlProgressBarSimple.new(slot3, RaidGUIControlProgressBarSimple, self)
	slot6 = control

	self._add_control(RaidGUIControlProgressBarSimple, self)

	return control
end
function RaidGUIPanel:branching_progress_bar(params)
	slot6 = params
	local control = RaidGUIControlBranchingProgressBar.new(slot3, RaidGUIControlBranchingProgressBar, self)
	slot6 = control

	self._add_control(RaidGUIControlBranchingProgressBar, self)

	return control
end
function RaidGUIPanel:keybind(params)
	slot6 = params
	local control = RaidGuiControlKeyBind.new(slot3, RaidGuiControlKeyBind, self)
	slot6 = control

	self._add_control(RaidGuiControlKeyBind, self)

	return control
end
function RaidGUIPanel:grid(params)
	slot6 = params
	local control = RaidGUIControlGrid.new(slot3, RaidGUIControlGrid, self)
	slot6 = control

	self._add_control(RaidGUIControlGrid, self)

	return control
end
function RaidGUIPanel:grid_active(params)
	slot6 = params
	local control = RaidGUIControlGridActive.new(slot3, RaidGUIControlGridActive, self)
	slot6 = control

	self._add_control(RaidGUIControlGridActive, self)

	return control
end
function RaidGUIPanel:paged_grid(params)
	slot6 = params
	local control = RaidGUIControlPagedGrid.new(slot3, RaidGUIControlPagedGrid, self)
	slot6 = control

	self._add_control(RaidGUIControlPagedGrid, self)

	return control
end
function RaidGUIPanel:scroll_grid(params)
	slot6 = params
	local control = RaidGUIControlScrollGrid.new(slot3, RaidGUIControlScrollGrid, self)
	slot6 = control

	self._add_control(RaidGUIControlScrollGrid, self)

	return control
end
function RaidGUIPanel:paged_grid_character_customization(params)
	slot6 = params
	local control = RaidGUIControlPagedGridCharacterCustomization.new(slot3, RaidGUIControlPagedGridCharacterCustomization, self)
	slot6 = control

	self._add_control(RaidGUIControlPagedGridCharacterCustomization, self)

	return control
end
function RaidGUIPanel:suggested_cards_grid(params)
	slot6 = params
	local control = RaidGUIControlSuggestedCards.new(slot3, RaidGUIControlSuggestedCards, self)
	slot6 = control

	self._add_control(RaidGUIControlSuggestedCards, self)

	return control
end
function RaidGUIPanel:suggested_cards_grid_large(params)
	slot6 = params
	local control = RaidGUIControlSuggestedCardsLarge.new(slot3, RaidGUIControlSuggestedCardsLarge, self)
	slot6 = control

	self._add_control(RaidGUIControlSuggestedCardsLarge, self)

	return control
end
function RaidGUIPanel:input_field(params)
	slot6 = params
	local control = RaidGUIControlInputField.new(slot3, RaidGUIControlInputField, self)
	slot6 = control

	self._add_control(RaidGUIControlInputField, self)

	return control
end
function RaidGUIPanel:scrollable_area(params)
	slot6 = params
	local control = RaidGUIControlScrollableArea.new(slot3, RaidGUIControlScrollableArea, self)
	slot6 = control

	self._add_control(RaidGUIControlScrollableArea, self)

	return control
end
function RaidGUIPanel:scrollbar(params)
	slot6 = params
	local control = RaidGUIControlScrollbar.new(slot3, RaidGUIControlScrollbar, self)
	slot6 = control

	self._add_control(RaidGUIControlScrollbar, self)

	return control
end
function RaidGUIPanel:legend(params)
	slot6 = params
	local control = RaidGUIControlLegend.new(slot3, RaidGUIControlLegend, self)
	slot6 = control

	self._add_control(RaidGUIControlLegend, self)

	return control
end
function RaidGUIPanel:create_custom_control(control_class, params, ...)
	slot7 = params
	local control = control_class.new(slot4, control_class, self, ...)
	slot7 = control

	self._add_control(control_class, self)

	return control
end
function RaidGUIPanel:_add_control(control)
	slot4 = control
	local control_layer = control.layer(slot3)
	local control_index = #self._controls + 1

	for i = 1, #self._controls, 1 do
		slot10 = self._controls[i]

		if self._controls[i].layer(slot9) < control_layer then
			control_index = i

			break
		end
	end

	slot8 = control

	table.insert(slot5, self._controls, control_index)

	return 
end
function RaidGUIPanel:w()
	slot3 = self._engine_panel

	return self._engine_panel.w(slot2)
end
function RaidGUIPanel:h()
	slot3 = self._engine_panel

	return self._engine_panel.h(slot2)
end
function RaidGUIPanel:animate(params)
	slot5 = params

	self._engine_panel.animate(slot3, self._engine_panel)

	return 
end
function RaidGUIPanel:stop()
	slot3 = self._engine_panel

	self._engine_panel.stop(slot2)

	return 
end
function RaidGUIPanel:x()
	slot3 = self._engine_panel

	return self._engine_panel.x(slot2)
end
function RaidGUIPanel:y()
	slot3 = self._engine_panel

	return self._engine_panel.y(slot2)
end
function RaidGUIPanel:world_x()
	slot3 = self._engine_panel

	return self._engine_panel.world_x(slot2)
end
function RaidGUIPanel:world_y()
	slot3 = self._engine_panel

	return self._engine_panel.world_y(slot2)
end
function RaidGUIPanel:size()
	slot3 = self._engine_panel

	return self._engine_panel.size(slot2)
end
function RaidGUIPanel:set_debug(flag)
	slot5 = flag

	return self._engine_panel.set_debug(slot3, self._engine_panel)
end
function RaidGUIPanel:left()
	slot3 = self._engine_panel

	return self._engine_panel.left(slot2)
end
function RaidGUIPanel:right()
	slot3 = self._engine_panel

	return self._engine_panel.right(slot2)
end
function RaidGUIPanel:top()
	slot3 = self._engine_panel

	return self._engine_panel.top(slot2)
end
function RaidGUIPanel:world_top()
	slot3 = self._engine_panel

	return self._engine_panel.world_top(slot2)
end
function RaidGUIPanel:bottom()
	slot3 = self._engine_panel

	return self._engine_panel.bottom(slot2)
end
function RaidGUIPanel:world_bottom()
	slot3 = self._engine_panel

	return self._engine_panel.world_bottom(slot2)
end
function RaidGUIPanel:set_center(x, y)
	slot7 = y

	return self._engine_panel.set_center(slot4, self._engine_panel, x)
end
function RaidGUIPanel:set_center_x(x)
	slot5 = x

	return self._engine_panel.set_center_x(slot3, self._engine_panel)
end
function RaidGUIPanel:set_center_y(y)
	slot5 = y

	return self._engine_panel.set_center_y(slot3, self._engine_panel)
end
function RaidGUIPanel:set_right(right)
	slot5 = right

	return self._engine_panel.set_right(slot3, self._engine_panel)
end
function RaidGUIPanel:set_left(left)
	slot5 = left

	return self._engine_panel.set_left(slot3, self._engine_panel)
end
function RaidGUIPanel:set_x(x)
	slot5 = x

	return self._engine_panel.set_x(slot3, self._engine_panel)
end
function RaidGUIPanel:set_y(y)
	slot5 = y

	return self._engine_panel.set_y(slot3, self._engine_panel)
end
function RaidGUIPanel:set_size(w, h)
	slot7 = h

	self._engine_panel.set_size(slot4, self._engine_panel, w)

	return 
end
function RaidGUIPanel:set_w(w)
	slot5 = w

	return self._engine_panel.set_w(slot3, self._engine_panel)
end
function RaidGUIPanel:set_h(h)
	slot5 = h

	return self._engine_panel.set_h(slot3, self._engine_panel)
end
function RaidGUIPanel:alpha()
	slot3 = self._engine_panel

	return self._engine_panel.alpha(slot2)
end
function RaidGUIPanel:set_alpha(alpha)
	slot5 = alpha

	self._engine_panel.set_alpha(slot3, self._engine_panel)

	return 
end
function RaidGUIPanel:set_rotation(angle)
	slot6 = self._engine_panel

	for i, element in pairs(self._engine_panel.children(slot5)) do
		if element.rotate then
			slot9 = element
			slot14 = angle

			element.set_center(slot8, self.get_position_after_rotation(slot11, self, element))

			slot10 = angle

			element.set_rotation(slot8, element)
		end
	end

	slot4 = self._controls

	for i, control in pairs(slot3) do
		slot9 = control
		slot14 = angle

		control.set_center(slot8, self.get_position_after_rotation(slot11, self, control))

		slot10 = angle

		control.set_rotation(slot8, control)
	end

	self._rotation = angle

	return 
end
function RaidGUIPanel:rotate(angle)
	local current_rotation = self.rotation(slot3)
	slot6 = current_rotation + angle

	self.set_rotation(self, self)

	return 
end
function RaidGUIPanel:rotation()
	return self._rotation or 0
end
function RaidGUIPanel:get_position_after_rotation(element, angle)
	local center_x = self.w(slot4) / 2
	local center_y = self.h(self) / 2
	slot7 = element
	local old_angle = element.rotation(self)
	local angle_difference = angle - old_angle
	slot10 = angle_difference
	slot11 = angle_difference
	local new_x = (center_x + (element.center_x(slot8) - center_x) * math.cos(element)) - (element.center_y(element) - center_y) * math.sin(element)
	slot11 = angle_difference
	slot12 = angle_difference
	local new_y = center_y + (element.center_x(math.sin(element)) - center_x) * math.sin(element) + (element.center_y(element) - center_y) * math.cos(element)

	return new_x, new_y
end
function RaidGUIPanel:engine_panel_alive()
	slot3 = self._engine_panel

	if alive(slot2) then
		return true
	end

	return false
end
function RaidGUIPanel:scrollable_area_post_setup(params)
	return 
end

return 
