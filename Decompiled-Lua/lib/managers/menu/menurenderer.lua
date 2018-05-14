slot3 = "CoreMenuRenderer"

core.import(slot1, core)

slot2 = "lib/managers/menu/MenuNodeGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/MenuNodeGuiRaid"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeBaseGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeTableGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeStatsGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeCreditsGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeButtonLayoutGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeHiddenGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeUpdatesGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeReticleSwitchGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuNodeJukeboxGui"

require(slot1)

slot2 = "lib/managers/menu/renderers/MenuModInfoGui"

require(slot1)

if not MenuRenderer then
	slot2 = CoreMenuRenderer.Renderer
	slot0 = class(slot1)
end

MenuRenderer = slot0
MenuRenderer.init = function (self, logic, ...)
	slot5 = logic

	MenuRenderer.super.init(slot3, self, ...)

	slot5 = "MenuRenderer"
	self._sound_source = SoundDevice.create_source(slot3, SoundDevice)

	return 
end
MenuRenderer.show_node = function (self, node)
	local gui_class = MenuNodeGui
	slot5 = node

	if node.parameters(slot4).gui_class then
		slot7 = node
		slot5 = node.parameters(slot6).gui_class
		gui_class = CoreSerialize.string_to_classtable(slot4)
	end

	local parameters = {
		marker_alpha = 1,
		align = "left",
		row_item_blend_mode = "normal",
		to_upper = true,
		font = tweak_data.menu.pd2_medium_font,
		row_item_color = tweak_data.menu.default_font_row_item_color,
		row_item_hightlight_color = tweak_data.menu.default_hightlight_row_item_color,
		font_size = tweak_data.menu.pd2_medium_font_size,
		node_gui_class = gui_class
	}
	slot6 = node
	parameters.spacing = node.parameters(slot5).spacing
	slot7 = 1
	parameters.marker_color = tweak_data.screen_colors.button_stage_3.with_alpha(slot5, tweak_data.screen_colors.button_stage_3)
	slot8 = parameters

	MenuRenderer.super.show_node(slot5, self, node)

	return 
end
MenuRenderer.open = function (self, ...)
	slot3 = self

	MenuRenderer.super.open(slot2, ...)

	self._menu_stencil_align = "left"
	self._menu_stencil_default_image = "guis/textures/empty"
	self._menu_stencil_image = self._menu_stencil_default_image

	self._create_blackborders()

	return 
end
MenuRenderer.destroy_blackborder_workspace_instance = function ()
	slot2 = Global.blackborder_workspace

	if alive(slot1) then
		slot2 = Overlay
		slot3 = Global.blackborder_workspace

		Overlay.gui(slot1).destroy_workspace(slot1, Overlay.gui(slot1))
	end

	Global.blackborder_workspace = nil

	return 
end
MenuRenderer.get_blackborder_workspace_instance = function ()
	if not Global.blackborder_workspace then
		slot3 = managers.gui_data
		slot1 = managers.gui_data.create_fullscreen_workspace(slot2)
		Global.blackborder_workspace = slot1
		slot2 = Global.blackborder_workspace
		slot3 = {
			name = "top_border",
			layer = 1000,
			color = Color.black
		}

		Global.blackborder_workspace.panel(slot1).rect(slot1, Global.blackborder_workspace.panel(slot1))

		slot2 = Global.blackborder_workspace
		slot3 = {
			name = "bottom_border",
			layer = 1000,
			color = Color.black
		}

		Global.blackborder_workspace.panel(slot1).rect(slot1, Global.blackborder_workspace.panel(slot1))

		slot2 = Global.blackborder_workspace
		slot3 = {
			name = "left_border",
			layer = 1000,
			color = Color.black
		}

		Global.blackborder_workspace.panel(slot1).rect(slot1, Global.blackborder_workspace.panel(slot1))

		slot2 = Global.blackborder_workspace
		slot3 = {
			name = "right_border",
			layer = 1000,
			color = Color.black
		}

		Global.blackborder_workspace.panel(slot1).rect(slot1, Global.blackborder_workspace.panel(slot1))
	end

	return Global.blackborder_workspace
end
MenuRenderer.close = function (self, ...)
	slot3 = self

	MenuRenderer.super.close(slot2, ...)

	slot3 = managers.raid_menu

	if managers.raid_menu.ct_open_menus(slot2) == 1 then
		MenuRenderer._remove_blackborders()
	end

	return 
end
MenuRenderer._remove_blackborders = function ()
	local blackborder_workspace = MenuRenderer.get_blackborder_workspace_instance()
	slot3 = blackborder_workspace
	slot4 = false

	blackborder_workspace.panel(slot2).set_visible(slot2, blackborder_workspace.panel(slot2))

	return 
end
MenuRenderer._create_blackborders = function ()
	slot3 = "[MenuRenderer][_create_blackborders]"

	Application.debug(slot1, Application)

	local blackborder_workspace = MenuRenderer.get_blackborder_workspace_instance()
	slot3 = blackborder_workspace
	slot4 = true

	blackborder_workspace.panel(Application).set_visible(Application, blackborder_workspace.panel(Application))

	slot3 = blackborder_workspace
	slot4 = "top_border"
	local top_border = blackborder_workspace.panel(Application).child(Application, blackborder_workspace.panel(Application))
	slot4 = blackborder_workspace
	slot5 = "bottom_border"
	local bottom_border = blackborder_workspace.panel(blackborder_workspace.panel(Application)).child(blackborder_workspace.panel(Application), blackborder_workspace.panel(blackborder_workspace.panel(Application)))
	slot5 = blackborder_workspace
	slot6 = "left_border"
	local left_border = blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application))).child(blackborder_workspace.panel(blackborder_workspace.panel(Application)), blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application))))
	slot6 = blackborder_workspace
	slot7 = "right_border"
	local right_border = blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application)))).child(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application))), blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application)))))
	slot7 = blackborder_workspace
	local width = blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application))))).w(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application)))))
	slot8 = blackborder_workspace
	local height = blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application)))))).h(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application))))))
	slot9 = tweak_data.gui.base_resolution
	local base_resolution = clone(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(blackborder_workspace.panel(Application)))))))
	local base_aspect_ratio = base_resolution.x / base_resolution.y
	base_resolution.y = width / base_aspect_ratio
	base_resolution.x = height * base_aspect_ratio
	local border_w = (width - base_resolution.x) / 2
	local border_h = (height - base_resolution.y) / 2
	slot15 = -1

	top_border.set_position(slot12, top_border, -1)

	slot15 = border_h + 2

	top_border.set_size(slot12, top_border, width + 2)

	slot14 = 0 < border_h

	top_border.set_visible(slot12, top_border)

	slot17 = border_h
	slot15 = (math.ceil(slot16) + base_resolution.y) - 1

	bottom_border.set_position(slot12, bottom_border, -1)

	slot15 = border_h + 2

	bottom_border.set_size(slot12, bottom_border, width + 2)

	slot14 = 0 < border_h

	bottom_border.set_visible(slot12, bottom_border)

	slot15 = -1

	left_border.set_position(slot12, left_border, -1)

	slot15 = height + 2

	left_border.set_size(slot12, left_border, border_w + 2)

	slot14 = 0 < border_w

	left_border.set_visible(slot12, left_border)

	slot16 = border_w

	right_border.set_position(slot12, right_border, (math.floor(-1) + base_resolution.x) - 1)

	slot15 = height + 2

	right_border.set_size(slot12, right_border, border_w + 2)

	slot14 = 0 < border_w

	right_border.set_visible(slot12, right_border)

	return 
end
MenuRenderer.update = function (self, t, dt)
	slot7 = dt

	MenuRenderer.super.update(slot4, self, t)

	return 
end
local mugshot_stencil = {
	random = {
		"bg_lobby_fullteam",
		65
	},
	undecided = {
		"bg_lobby_fullteam",
		65
	},
	american = {
		"bg_hoxton",
		65
	},
	german = {
		"bg_wolf",
		55
	},
	russian = {
		"bg_dallas",
		65
	},
	spanish = {
		"bg_chains",
		60
	}
}
MenuRenderer.highlight_item = function (self, item, ...)
	slot5 = item

	MenuRenderer.super.highlight_item(slot3, self, ...)

	slot5 = "highlight"

	self.post_event(slot3, self)

	return 
end
MenuRenderer.trigger_item = function (self, item)
	slot5 = item

	MenuRenderer.super.trigger_item(slot3, self)

	if item then
		slot4 = item

		if item.visible(slot3) then
			slot4 = item

			if item.parameters(slot3).sound ~= "false" then
				slot4 = item
				local item_type = item.type(slot3)

				if item_type == "" then
					slot6 = "menu_enter"

					self.post_event(slot4, self)
				elseif item_type == "toggle" then
					slot5 = item

					if item.value(slot4) == "on" then
						slot6 = "box_tick"

						self.post_event(slot4, self)
					else
						slot6 = "box_untick"

						self.post_event(slot4, self)
					end
				elseif item_type == "slider" then
					slot5 = item
					local percentage = item.percentage(slot4)

					if 0 < percentage and percentage < 100 then
					end
				elseif item_type == "multi_choice" then
				end
			end
		end
	end

	return 
end
MenuRenderer.post_event = function (self, event)
	slot5 = event

	self._sound_source.post_event(slot3, self._sound_source)

	return 
end
MenuRenderer.navigate_back = function (self)
	slot3 = self

	MenuRenderer.super.navigate_back(slot2)

	slot3 = self
	slot3 = self.active_node_gui(slot2)

	self.active_node_gui(slot2).update_item_icon_visibility(slot2)

	slot4 = "menu_exit"

	self.post_event(slot2, self)

	return 
end
MenuRenderer.resolution_changed = function (self, ...)
	slot3 = self

	MenuRenderer.super.resolution_changed(slot2, ...)
	self._create_blackborders()

	slot3 = self
	local active_node_gui = self.active_node_gui(slot2)

	if active_node_gui and active_node_gui.update_item_icon_visibility then
		slot4 = self
		slot4 = self.active_node_gui(slot3)

		self.active_node_gui(slot3).update_item_icon_visibility(slot3)
	end

	return 
end
MenuRenderer.current_menu_text = function (self, topic_id)
	local ids = {}
	slot5 = self._node_gui_stack

	for i, node_gui in ipairs(slot4) do
		slot13 = node_gui.node
		slot11 = node_gui.node.parameters(slot12).topic_id

		table.insert(slot9, ids)
	end

	slot6 = topic_id

	table.insert(slot4, ids)

	local s = ""
	slot6 = ids

	for i, id in ipairs(ids) do
		slot13 = id
		s = s .. managers.localization.text(slot11, managers.localization)
		s = s .. ((i < #ids and " > ") or "")
	end

	return s
end
MenuRenderer.accept_input = function (self, accept)
	slot5 = accept

	managers.menu_component.accept_input(slot3, managers.menu_component)

	return 
end
MenuRenderer.input_focus = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).input_focus then
			slot3 = self
			slot3 = self.active_node_gui(slot2)
			local input_focus = self.active_node_gui(slot2).input_focus(slot2)

			if input_focus then
				return input_focus
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.input_focus(slot2)
end
MenuRenderer.mouse_pressed = function (self, o, button, x, y)
	slot7 = self

	if self.active_node_gui(slot6) then
		slot7 = self

		if self.active_node_gui(slot6).mouse_pressed then
			slot7 = self
			slot10 = y

			if self.active_node_gui(slot6).mouse_pressed(slot6, self.active_node_gui(slot6), button, x) then
				return true
			end
		end
	end

	slot11 = y

	if managers.menu_component.mouse_pressed(slot6, managers.menu_component, o, button, x) then
		return true
	end

	return 
end
MenuRenderer.mouse_released = function (self, o, button, x, y)
	slot7 = self

	if self.active_node_gui(slot6) then
		slot7 = self

		if self.active_node_gui(slot6).mouse_released then
			slot7 = self
			slot10 = y

			if self.active_node_gui(slot6).mouse_released(slot6, self.active_node_gui(slot6), button, x) then
				return true
			end
		end
	end

	slot11 = y

	if managers.menu_component.mouse_released(slot6, managers.menu_component, o, button, x) then
		return true
	end

	return false
end
MenuRenderer.mouse_clicked = function (self, o, button, x, y)
	slot11 = y

	if managers.menu_component.mouse_clicked(slot6, managers.menu_component, o, button, x) then
		return true
	end

	return false
end
MenuRenderer.mouse_double_click = function (self, o, button, x, y)
	slot11 = y

	if managers.menu_component.mouse_double_click(slot6, managers.menu_component, o, button, x) then
		return true
	end

	return false
end
MenuRenderer.mouse_moved = function (self, o, x, y)
	local wanted_pointer = "arrow"
	slot7 = self

	if self.active_node_gui(slot6) then
		slot7 = self

		if self.active_node_gui(slot6).mouse_moved then
			slot7 = managers.menu_component

			if managers.menu_component.input_focus(slot6) ~= true then
				slot7 = self
				slot10 = y
				local used, pointer = self.active_node_gui(slot6).mouse_moved(slot6, self.active_node_gui(slot6), o, x)

				if not pointer then
				end

				if used then
					return true, wanted_pointer
				end
			end
		end
	end

	slot10 = y
	local used, pointer = managers.menu_component.mouse_moved(slot6, managers.menu_component, o, x)

	if not pointer then
	end

	if used then
		return true, wanted_pointer
	end

	return false, wanted_pointer
end
MenuRenderer.scroll_up = function (self)
	slot3 = managers.menu_component

	return managers.menu_component.scroll_up(slot2)
end
MenuRenderer.scroll_down = function (self)
	slot3 = managers.menu_component

	return managers.menu_component.scroll_down(slot2)
end
MenuRenderer.move_up = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).move_up then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).move_up(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.move_up(slot2)
end
MenuRenderer.move_down = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).move_down then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).move_down(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.move_down(slot2)
end
MenuRenderer.move_left = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).move_left then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).move_left(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.move_left(slot2)
end
MenuRenderer.move_right = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).move_right then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).move_right(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.move_right(slot2)
end
MenuRenderer.scroll_up = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).scroll_up then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).scroll_up(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.scroll_up(slot2)
end
MenuRenderer.scroll_down = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).scroll_down then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).scroll_down(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.scroll_down(slot2)
end
MenuRenderer.scroll_left = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).scroll_left then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).scroll_left(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.scroll_left(slot2)
end
MenuRenderer.scroll_right = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).scroll_right then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).scroll_right(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.scroll_right(slot2)
end
MenuRenderer.next_page = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).next_page then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).next_page(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.next_page(slot2)
end
MenuRenderer.previous_page = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).previous_page then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).previous_page(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.previous_page(slot2)
end
MenuRenderer.confirm_pressed = function (self)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).confirm_pressed then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).confirm_pressed(slot2) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.confirm_pressed(slot2)
end
MenuRenderer.back_pressed = function (self)
	slot3 = managers.menu_component

	return managers.menu_component.back_pressed(slot2)
end
MenuRenderer.special_btn_pressed = function (self, ...)
	slot3 = self

	if self.active_node_gui(slot2) then
		slot3 = self

		if self.active_node_gui(slot2).special_btn_pressed then
			slot3 = self
			slot3 = self.active_node_gui(slot2)

			if self.active_node_gui(slot2).special_btn_pressed(slot2, ...) then
				return true
			end
		end
	end

	slot3 = managers.menu_component

	return managers.menu_component.special_btn_pressed(slot2, ...)
end
MenuRenderer.ws_test = function (self)
	slot3 = self._test_safe

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._test_safe

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))
	end

	slot3 = self._test_full

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._test_full

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))
	end

	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._test_safe = Overlay.gui(slot2).create_screen_workspace(slot2)
	slot4 = self._test_safe

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._test_full = Overlay.gui(slot2).create_screen_workspace(slot2)

	managers.gui_data.layout_fullscreen_workspace(slot2, managers.gui_data)

	local x = 150
	local y = 200
	slot7 = y
	local fx, fy = managers.gui_data.safe_to_full(self._test_full, managers.gui_data, x)
	slot7 = self._test_safe
	slot8 = {
		h = 48,
		w = 48,
		orientation = "vertical",
		layer = 0,
		x = x,
		y = y,
		color = Color.green
	}
	local safe = self._test_safe.panel(x).rect(x, self._test_safe.panel(x))
	slot8 = self._test_full
	slot9 = {
		h = 48,
		w = 48,
		orientation = "vertical",
		layer = 0,
		x = fx,
		y = fy,
		color = Color.red
	}
	local full = self._test_full.panel(self._test_safe.panel(x)).rect(self._test_safe.panel(x), self._test_full.panel(self._test_safe.panel(x)))

	return 
end

return 
