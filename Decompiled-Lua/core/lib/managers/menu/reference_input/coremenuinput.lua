-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuInput"

core.module(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemSlider"

core.import(slot1, core)

slot3 = "CoreMenuItemToggle"

core.import(slot1, core)

MenuInput = MenuInput or class()
function MenuInput:init(logic, menu_name)
	self._logic = logic
	self._menu_name = menu_name
	self._accept_input = true
	slot11 = "accept_input"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	self._axis_delay_timer = {
		x = 0,
		y = 0
	}
	self._scroll_delay_timer = {
		x = 0,
		y = 0
	}
	self._item_input_action_map = {}
	slot9 = "input_item"
	self._item_input_action_map[CoreMenuItem.Item.TYPE] = callback("input_accept_input", self, self)
	slot9 = "input_slider"
	self._item_input_action_map[CoreMenuItemSlider.ItemSlider.TYPE] = callback("input_accept_input", self, self)
	slot9 = "input_toggle"
	self._item_input_action_map[CoreMenuItemToggle.ItemToggle.TYPE] = callback("input_accept_input", self, self)

	return 
end
function MenuInput:open(...)
	slot3 = self

	self.create_controller(slot2)

	return 
end
function MenuInput:close()
	slot3 = self

	self.destroy_controller(slot2)

	return 
end
function MenuInput:axis_timer()
	return self._axis_delay_timer
end
function MenuInput:set_axis_x_timer(time)
	self._axis_delay_timer.x = time

	return 
end
function MenuInput:set_axis_y_timer(time)
	self._axis_delay_timer.y = time

	return 
end
function MenuInput:scroll_timer()
	return self._scroll_delay_timer
end
function MenuInput:set_scroll_x_timer(time)
	self._scroll_delay_timer.x = time

	return 
end
function MenuInput:set_scroll_y_timer(time)
	self._scroll_delay_timer.y = time

	return 
end
function MenuInput:_input_hijacked()
	slot3 = managers.menu
	local active_menu = managers.menu.active_menu(slot2)

	if active_menu then
		slot4 = active_menu.renderer
		slot2 = active_menu.renderer.input_focus(slot3)
	end

	return slot2
end
function MenuInput:input_item(item, controller, mouse_click)
	slot7 = "confirm"

	if controller.get_input_pressed(slot5, controller) or mouse_click then
		slot6 = item

		if item.parameters(slot5).sign_in then
			print(slot5)

			local function f(success)
				slot3 = success

				print(slot2)

				if success then
					slot5 = item

					self._logic.trigger_item(slot2, self._logic, true)

					slot3 = self

					self.select_node(slot2)
				end

				return 
			end

			slot8 = f

			managers.menu.open_sign_in_menu("requires sign in", managers.menu)
		else
			slot6 = managers.menu
			slot6 = managers.menu.active_menu(slot5).renderer
			local node_gui = managers.menu.active_menu(slot5).renderer.active_node_gui(slot5)

			if node_gui and node_gui._listening_to_input then
				return 
			end

			slot9 = item

			self._logic.trigger_item(slot6, self._logic, true)

			slot7 = self

			self.select_node(slot6)
		end
	end

	return 
end
function MenuInput:input_slider(item, controller)
	local slider_delay_down = 0.1
	local slider_delay_pressed = 0.2
	slot7 = self

	if self.menu_right_input_bool(slot6) then
		slot7 = item

		item.increase(slot6)

		slot9 = item

		self._logic.trigger_item(slot6, self._logic, true)

		slot8 = slider_delay_down

		self.set_axis_x_timer(slot6, self)

		slot7 = self

		if self.menu_right_pressed(slot6) then
			slot7 = item
			local percentage = item.percentage(slot6)

			if 0 < percentage and percentage < 100 then
				slot9 = "slider_increase"

				self.post_event(slot7, self)
			end

			slot9 = slider_delay_pressed

			self.set_axis_x_timer(slot7, self)
		end
	else
		slot7 = self

		if self.menu_left_input_bool(slot6) then
			slot7 = item

			item.decrease(slot6)

			slot9 = item

			self._logic.trigger_item(slot6, self._logic, true)

			slot8 = slider_delay_down

			self.set_axis_x_timer(slot6, self)

			slot7 = self

			if self.menu_left_pressed(slot6) then
				slot8 = slider_delay_pressed

				self.set_axis_x_timer(slot6, self)

				slot7 = item
				local percentage = item.percentage(slot6)

				if 0 < percentage and percentage < 100 then
					slot9 = "slider_decrease"

					self.post_event(slot7, self)
				end
			end
		end
	end

	return 
end
function MenuInput:input_toggle(item, controller, mouse_click)
	local toggle_delay_down = 0.3
	local toggle_delay_pressed = 0.6
	slot9 = "confirm"

	if controller.get_input_pressed(slot7, controller) or mouse_click then
		slot8 = item

		item.toggle(slot7)

		slot10 = item

		self._logic.trigger_item(slot7, self._logic, true)
	end

	return 
end
function MenuInput:update(t, dt)
	slot5 = self

	self._check_releases(slot4)

	slot5 = self

	self.any_keyboard_used(slot4)

	local axis_timer = self.axis_timer(slot4)
	slot6 = self
	local scroll_timer = self.scroll_timer(self)

	if 0 < axis_timer.y then
		slot8 = axis_timer.y - dt

		self.set_axis_y_timer(slot6, self)
	end

	if 0 < axis_timer.x then
		slot8 = axis_timer.x - dt

		self.set_axis_x_timer(slot6, self)
	end

	if 0 < scroll_timer.y then
		slot8 = scroll_timer.y - dt

		self.set_scroll_y_timer(slot6, self)
	end

	if 0 < scroll_timer.x then
		slot8 = scroll_timer.x - dt

		self.set_scroll_x_timer(slot6, self)
	end

	slot7 = self

	if self._input_hijacked(slot6) then
		return false
	end

	if self._accept_input and self._controller then
		if axis_timer.y <= 0 then
			slot7 = self

			if self.menu_up_input_bool(slot6) then
				slot7 = managers.menu
				slot7 = managers.menu.active_menu(slot6).renderer

				managers.menu.active_menu(slot6).renderer.move_up(slot6)

				slot7 = self

				self.prev_item(slot6)

				slot8 = 0.12

				self.set_axis_y_timer(slot6, self)

				slot7 = self

				if self.menu_up_pressed(slot6) then
					slot8 = 0.3

					self.set_axis_y_timer(slot6, self)
				end
			else
				slot7 = self

				if self.menu_down_input_bool(slot6) then
					slot7 = managers.menu
					slot7 = managers.menu.active_menu(slot6).renderer

					managers.menu.active_menu(slot6).renderer.move_down(slot6)

					slot7 = self

					self.next_item(slot6)

					slot8 = 0.12

					self.set_axis_y_timer(slot6, self)

					slot7 = self

					if self.menu_down_pressed(slot6) then
						slot8 = 0.3

						self.set_axis_y_timer(slot6, self)
					end
				end
			end
		end

		if axis_timer.x <= 0 then
			slot7 = self._logic
			local item = self._logic.selected_item(slot6)

			if item then
				slot9 = self._controller

				self._item_input_action_map[item.TYPE](item.TYPE, item)
			end
		end

		slot8 = "menu_update"

		if self._controller.get_input_pressed(slot6, self._controller) then
			slot7 = "update something"

			print(slot6)

			slot7 = self._logic

			self._logic.update_node(slot6)
		end
	end

	return true
end
function MenuInput:menu_up_input_bool()
	if self._controller then
		slot4 = "menu_up"

		return self._controller.get_input_bool(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_up_pressed()
	if self._controller then
		slot4 = "menu_up"

		return self._controller.get_input_pressed(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_up_released()
	if self._controller then
		slot4 = "menu_up"

		return self._controller.get_input_released(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_down_input_bool()
	if self._controller then
		slot4 = "menu_down"

		return self._controller.get_input_bool(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_down_pressed()
	if self._controller then
		slot4 = "menu_down"

		return self._controller.get_input_pressed(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_down_released()
	if self._controller then
		slot4 = "menu_down"

		return self._controller.get_input_released(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_left_input_bool()
	if self._controller then
		slot4 = "menu_left"

		return self._controller.get_input_bool(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_left_pressed()
	if self._controller then
		slot4 = "menu_left"

		return self._controller.get_input_pressed(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_left_released()
	if self._controller then
		slot4 = "menu_left"

		return self._controller.get_input_released(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_right_input_bool()
	if self._controller then
		slot4 = "menu_right"

		return self._controller.get_input_bool(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_right_pressed()
	if self._controller then
		slot4 = "menu_right"

		return self._controller.get_input_pressed(slot2, self._controller)
	end

	return false
end
function MenuInput:menu_right_released()
	if self._controller then
		slot4 = "menu_right"

		return self._controller.get_input_released(slot2, self._controller)
	end

	return false
end
function MenuInput:_check_releases()

	-- Decompilation error in this vicinity:
	slot3 = self
	slot3 = self

	return 
end
function MenuInput:accept_input(accept)
	self._accept_input = accept

	return 
end
function MenuInput:focus(focus)
	if focus then
		slot4 = self

		self.create_controller(slot3)
	else
		slot4 = self

		self.destroy_controller(slot3)
	end

	return 
end
function MenuInput:controller_hotswap_triggered()
	self._controller = nil
	slot3 = self

	self.create_controller(slot2)

	return 
end
function MenuInput:create_controller()
	if not self._controller then
		slot6 = false
		local controller = managers.controller.create_controller(slot2, managers.controller, nil, nil)
		slot5 = "cancel"
		slot10 = "back"

		controller.add_trigger(managers.controller, controller, callback(slot7, self, self))

		slot5 = true

		controller.set_enabled(managers.controller, controller)

		self._controller = controller
		slot5 = "menu_input"
		slot10 = "controller_hotswap_triggered"

		managers.controller.add_hotswap_callback(managers.controller, managers.controller, callback(slot7, self, self))
	end

	return 
end
function MenuInput:destroy_controller()
	if self._controller then
		slot3 = self._controller

		self._controller.destroy(slot2)

		self._controller = nil
	end

	return 
end
function MenuInput:logic_changed()
	return 
end
function MenuInput:next_item()
	if not self._accept_input then
		return 
	end

	slot3 = self._logic
	local current_item = self._logic.selected_item(slot2)

	if current_item then
		local current_item_name = current_item.parameters(slot3).name
		slot5 = self._logic
		slot5 = self._logic.selected_node(current_item)
		local items = self._logic.selected_node(current_item).items(current_item)
		local done = nil
		slot7 = items

		for i, v in ipairs(slot6) do
			slot12 = v

			if v.parameters(slot11).name == current_item_name then
				for check = 1, #items - 1, 1 do
					local next_item = items[((i + check) - 1) % #items + 1]
					slot17 = next_item

					if next_item.visible(slot16) and next_item.TYPE ~= "divider" then
						slot20 = next_item

						self._logic.select_item(slot16, self._logic, next_item.parameters(true).name)

						done = true

						break
					end
				end

				if done then
					break
				end
			end
		end
	end

	return 
end
function MenuInput:prev_item()
	slot3 = self._logic
	local current_item = self._logic.selected_item(slot2)

	if current_item then
		local current_item_name = current_item.parameters(slot3).name
		slot5 = self._logic
		slot5 = self._logic.selected_node(current_item)
		local items = self._logic.selected_node(current_item).items(current_item)
		local done = nil
		slot7 = items

		for i, v in ipairs(slot6) do
			slot12 = v

			if v.parameters(slot11).name == current_item_name then
				for check = 1, #items - 1, 1 do
					local prev_item = items[(i - check - 1) % #items + 1]
					slot17 = prev_item

					if prev_item.visible(slot16) and prev_item.TYPE ~= "divider" then
						slot20 = prev_item

						self._logic.select_item(slot16, self._logic, prev_item.parameters(true).name)

						done = true

						break
					end
				end

				if done then
					break
				end
			end
		end
	end

	return 
end
function MenuInput:back(queue, skip_nodes)
	slot5 = self

	if self._input_hijacked(slot4) == true then
		return 
	end

	slot5 = self._logic

	if self._logic.selected_node(slot4) then
		slot5 = self._logic
		slot5 = self._logic.selected_node(slot4)

		if self._logic.selected_node(slot4).parameters(slot4).block_back then
			return 
		end
	end

	slot9 = skip_nodes
	slot7 = (type(slot8) == "number" and skip_nodes) or false

	self._logic.navigate_back(slot4, self._logic, queue == true or false)

	return 
end
function MenuInput:select_node()
	slot3 = self._logic
	local item = self._logic.selected_item(slot2)

	if item then
		slot4 = item

		if item.visible(slot3) then
			slot4 = item
			local parameters = item.parameters(slot3)

			if parameters.next_node then
				slot5 = item

				if item.enabled(slot4) or parameters.ignore_disabled then
					slot7 = true
					slot10 = parameters.next_node_parameters or {}

					self._logic.select_node(slot4, self._logic, parameters.next_node, unpack(slot9))
				end
			end

			if parameters.previous_node then
				slot5 = self

				self.back(slot4)
			end
		end
	end

	return 
end
function MenuInput:any_keyboard_used()

	-- Decompilation error in this vicinity:
	slot3 = {
		"menu_right",
		"menu_left",
		"menu_up",
		"menu_down",
		"confirm"
	}

	for _, key in ipairs(slot2) do
		slot9 = key

		if self._controller.get_input_bool(slot7, self._controller) then
			self._keyboard_used = true

			return 
		end
	end

	return 
end

return 
