slot2 = "core/lib/utils/dev/ews/CoreAnimationStateTreePanel"

require(slot1)

CorePuppeteer = CorePuppeteer or class()
CorePuppeteer.EDITOR_TITLE = "Puppeteer"
function CorePuppeteer:init(unit)
	if not unit and managers.editor then
		slot4 = managers.editor
		unit = managers.editor.selected_unit(slot3)
	end

	if not unit then
		slot4 = World
		unit = World.selected_unit(slot3)
	end

	slot5 = unit
	slot5 = true

	self._create_window(slot3, self).set_visible(slot3, self._create_window(slot3, self))

	slot6 = true

	CoreEWS.check_news(slot3, self._window, "puppeteer")

	if managers.editor then
		slot4 = managers.editor
		slot9 = "_on_selected_unit_changed"
		self._selected_unit_callback = managers.editor.add_selected_unit_callback(slot3, callback(slot6, self, self))
	end

	return 
end
function CorePuppeteer:_create_window(unit)
	slot10 = 0
	slot11 = 0
	self._window = EWS.Frame(slot3, EWS, CorePuppeteer.EDITOR_TITLE, Vector3(slot7, 100, 500), Vector3(100, 255, 450))
	slot11 = "_on_close"
	slot8 = ""

	self._window.connect(slot3, self._window, "", "EVT_CLOSE_WINDOW", callback("STAY_ON_TOP,RESIZE_BORDER,CLOSE_BOX,CAPTION,SYSTEM_MENU,CLIP_CHILDREN", self, self))

	slot5 = "VERTICAL"
	local main_box = EWS.BoxSizer(slot3, EWS)
	slot6 = main_box

	self._window.set_sizer(EWS, self._window)

	slot7 = unit
	self._state_tree_panel = CoreAnimationStateTreePanel.new(EWS, CoreAnimationStateTreePanel, self._window)
	slot9 = "EXPAND"

	self._state_tree_panel.add_to_sizer(EWS, self._state_tree_panel, main_box, 1, 0)

	slot6 = "EVT_COMMAND_TREE_ITEM_ACTIVATED"
	slot11 = "_on_tree_item_activated"

	self._state_tree_panel.connect(EWS, self._state_tree_panel, callback(0, self, self))

	slot8 = self
	slot9 = "EXPAND"

	main_box.add(EWS, main_box, self._create_options_panel(callback), 0, 0)

	return self._window
end
function CorePuppeteer:_create_options_panel()
	slot6 = ""
	local panel = EWS.Panel(slot2, EWS, self._window, "")
	slot5 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot6 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot9 = TimerManager
	slot9 = TimerManager.game_animation(slot8)
	slot11 = ""
	local time_multiplier_slider = EWS.Slider(EWS, EWS, panel, TimerManager.game_animation(slot8).multiplier(slot8) * 100, 0, 100, "")
	slot12 = "_on_time_multiplier_slider_updated"

	time_multiplier_slider.connect(EWS, time_multiplier_slider, "EVT_SCROLL_CHANGED", callback(100, self, self))

	slot12 = "_on_time_multiplier_slider_updated"
	slot9 = time_multiplier_slider

	time_multiplier_slider.connect(EWS, time_multiplier_slider, "EVT_SCROLL_THUMBTRACK", callback(time_multiplier_slider, self, self))

	slot11 = "Playback Rate:"
	slot10 = "TOP,LEFT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticText(callback(time_multiplier_slider, self, self), EWS, panel), 0, 8)

	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, time_multiplier_slider, 0, 0)

	slot8 = "Drive Position"
	self._drive_movement_checkbox = EWS.CheckBox(EWS, EWS, panel)
	slot8 = "_on_drive_movement_checkbox_clicked"
	self._drive_movement_checkbox_callback = callback(EWS, self, self)
	slot8 = self._drive_movement_checkbox_callback

	self._drive_movement_checkbox.connect(EWS, self._drive_movement_checkbox, "EVT_COMMAND_CHECKBOX_CLICKED")

	slot10 = "ALL,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._drive_movement_checkbox, 0, 8)

	return panel
end
function CorePuppeteer:set_position(newpos)
	slot5 = newpos

	self._window.set_position(slot3, self._window)

	return 
end
function CorePuppeteer:update(time, delta_time)
	slot7 = delta_time

	self._state_tree_panel.update(slot4, self._state_tree_panel, time)

	return 
end
function CorePuppeteer:destroy()
	slot3 = self._window

	if alive(slot2) then
		slot3 = self._window

		self._window.destroy(slot2)

		self._window = nil
	end

	return 
end
function CorePuppeteer:close()
	if managers.editor and self._selected_unit_callback then
		slot4 = self._selected_unit_callback

		managers.editor.remove_selected_unit_callback(slot2, managers.editor)
	end

	slot3 = self._window

	self._window.destroy(slot2)

	return 
end
function CorePuppeteer:unit()
	if self._state_tree_panel then
		slot3 = self._state_tree_panel

		return self._state_tree_panel.unit(slot2)
	end

	return 
end
function CorePuppeteer:_on_close()
	slot4 = CorePuppeteer.EDITOR_TITLE

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
function CorePuppeteer:_on_tree_item_activated(data, event)
	slot5 = event
	local tree_node = event.get_item(slot4)

	if tree_node then
		slot6 = tree_node

		if not tree_node.has_children(slot5) then
			slot6 = self
			slot6 = self.unit(slot5)
			slot9 = tree_node
			slot9 = tree_node.path(slot8)

			self.unit(slot5).play_state(slot5, tree_node.path(slot8).id(slot8))
		end
	end

	return 
end
function CorePuppeteer:_on_drive_movement_checkbox_clicked(data, event)
	slot5 = self

	if not self.unit(slot4) then
		return 
	end

	slot5 = self
	slot5 = self.unit(slot4)
	slot10 = event
	slot10 = "script"

	self.unit(slot4).set_driving(slot4, iff(slot7, event.is_checked(slot9), "animation"))

	return 
end
function CorePuppeteer:_on_time_multiplier_slider_updated(slider, event)
	slot5 = TimerManager
	slot8 = slider
	slot6 = slider.get_value(slot7) / 100

	TimerManager.game_animation(slot4).set_multiplier(slot4, TimerManager.game_animation(slot4))

	return 
end
function CorePuppeteer:_on_selected_unit_changed(selected_unit)
	slot4 = self

	if selected_unit == self.unit(slot3) then
		return 
	end

	if self._state_tree_panel then
		slot5 = selected_unit

		self._state_tree_panel.set_unit(slot3, self._state_tree_panel)
	end

	if self._drive_movement_checkbox then
		slot4 = self._drive_movement_checkbox
		slot2 = self._drive_movement_checkbox.set_value

		if selected_unit then
			slot7 = selected_unit
			slot5 = selected_unit.driving(slot6) == "animation"

			slot2(slot3, slot4)
		end
	end

	return 
end

return 
