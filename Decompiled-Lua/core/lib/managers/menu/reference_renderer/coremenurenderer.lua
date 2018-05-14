slot3 = "CoreMenuRenderer"

core.module(slot1, core)

slot3 = "CoreMenuNodeGui"

core.import(slot1, core)

Renderer = Renderer or class()
Renderer.border_height = 44
function Renderer:preload()
	return 
end
function Renderer:init(logic, parameters)
	parameters = parameters or {}
	self._logic = logic
	slot6 = "renderer_show_node"
	slot11 = "show_node"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_refresh_node_stack"
	slot11 = "refresh_node_stack"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_refresh_node"
	slot11 = "refresh_node"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_select_item"
	slot11 = "highlight_item"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_deselect_item"
	slot11 = "fade_item"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_trigger_item"
	slot11 = "trigger_item"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_navigate_back"
	slot11 = "navigate_back"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	slot6 = "renderer_node_item_dirty"
	slot11 = "node_item_dirty"

	self._logic.register_callback(slot4, self._logic, callback(slot8, self, self))

	self._timer = 0
	self._base_layer = parameters.layer or 200
	slot5 = managers.gui_data
	self.ws = managers.gui_data.create_saferect_workspace(slot4)
	slot5 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_workspace(slot4)
	slot5 = self._fullscreen_ws
	slot6 = {
		valign = "scale",
		halign = "scale",
		layer = self._base_layer
	}
	self._fullscreen_panel = self._fullscreen_ws.panel(slot4).panel(slot4, self._fullscreen_ws.panel(slot4))
	slot5 = self._fullscreen_ws

	self._fullscreen_ws.hide(slot4)

	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot4)
	slot6 = self.ws
	slot7 = {
		layer = self._base_layer
	}
	self._main_panel = self.ws.panel(managers.viewport).panel(managers.viewport, self.ws.panel(managers.viewport))
	slot6 = self.ws
	slot7 = {
		w = safe_rect_pixels.width,
		h = safe_rect_pixels.height,
		layer = self._base_layer
	}
	self.safe_rect_panel = self.ws.panel(managers.viewport).panel(managers.viewport, self.ws.panel(managers.viewport))

	return 
end
function Renderer:_scaled_size()
	slot3 = managers.gui_data

	return managers.gui_data.scaled_size(slot2)
end
function Renderer:open(...)
	slot4 = self.ws

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot4 = self._fullscreen_ws

	managers.gui_data.layout_fullscreen_workspace(slot2, managers.gui_data)

	slot3 = self

	self._layout_main_panel(slot2)

	slot3 = managers.viewport
	slot8 = "resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot2, callback(slot5, self, self))
	self._node_gui_stack = {}
	self._open = true
	slot3 = self._fullscreen_ws

	self._fullscreen_ws.show(slot2)

	return 
end
function Renderer:is_open()
	return self._open
end
function Renderer:show_node(node, parameters)
	local layer = self._base_layer
	slot6 = self
	local previous_node_gui = self.active_node_gui(slot5)

	if previous_node_gui then
		slot7 = previous_node_gui
		layer = previous_node_gui.layer(slot6)
		slot8 = false

		previous_node_gui.set_visible(slot6, previous_node_gui)
	end

	local new_node_gui = nil

	if parameters.node_gui_class then
		slot11 = parameters
		new_node_gui = parameters.node_gui_class.new(slot7, parameters.node_gui_class, node, layer + 1)
	else
		slot9 = " NO gui class"

		Application.trace(slot7, Application)

		slot11 = parameters
		new_node_gui = CoreMenuNodeGui.NodeGui.new(slot7, CoreMenuNodeGui.NodeGui, node, layer + 1)
	end

	slot9 = new_node_gui

	table.insert(slot7, self._node_gui_stack)

	slot8 = managers.system_menu

	if not managers.system_menu.is_active(slot7) then
		slot9 = 0.2

		self.disable_input(slot7, self)
	end

	return 
end
function Renderer:refresh_node_stack(parameters)
	slot4 = self._node_gui_stack

	for i, node_gui in ipairs(slot3) do
		slot11 = parameters

		node_gui.refresh_gui(slot8, node_gui, node_gui.node)

		if node_gui.node then
			slot9 = node_gui.node
			local selected_item = node_gui.node.selected_item(slot8)
		end

		if selected_item then
			slot11 = selected_item

			node_gui.highlight_item(slot9, node_gui)
		end
	end

	return 
end
function Renderer:refresh_node(node, parameters)
	local layer = self._base_layer
	local node_gui = self.active_node_gui(slot5)
	slot9 = parameters

	node_gui.refresh_gui(self, node_gui, node)

	return 
end
function Renderer:highlight_item(item, mouse_over)
	slot5 = self
	local active_node_gui = self.active_node_gui(slot4)

	if active_node_gui then
		slot8 = mouse_over

		active_node_gui.highlight_item(slot5, active_node_gui, item)
	end

	return 
end
function Renderer:fade_item(item)
	slot4 = self
	local active_node_gui = self.active_node_gui(slot3)

	if active_node_gui then
		slot6 = item

		active_node_gui.fade_item(slot4, active_node_gui)
	end

	return 
end
function Renderer:trigger_item(item)
	slot4 = self
	local node_gui = self.active_node_gui(slot3)

	if node_gui then
		slot6 = item

		node_gui.reload_item(slot4, node_gui)
	end

	return 
end
function Renderer:navigate_back()
	slot3 = self
	local active_node_gui = self.active_node_gui(slot2)

	if active_node_gui then
		slot4 = active_node_gui

		active_node_gui.close(slot3)

		slot5 = #self._node_gui_stack

		table.remove(slot3, self._node_gui_stack)

		slot4 = self
		slot5 = true

		self.active_node_gui(slot3).set_visible(slot3, self.active_node_gui(slot3))

		slot5 = 0.2

		self.disable_input(slot3, self)
	end

	return 
end
function Renderer:node_item_dirty(node, item)
	local node_name = node.parameters(slot4).name
	slot6 = self._node_gui_stack

	for _, gui in pairs(node) do
		if gui.name == node_name then
			slot12 = item

			gui.reload_item(slot10, gui)
		end
	end

	return 
end
function Renderer:update(t, dt)
	slot6 = dt

	self.update_input_timer(slot4, self)

	slot5 = self._node_gui_stack

	for _, node_gui in ipairs(slot4) do
		slot12 = dt

		node_gui.update(slot9, node_gui, t)
	end

	return 
end
function Renderer:update_input_timer(dt)
	if 0 < self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			slot5 = true

			self._logic.accept_input(slot3, self._logic)
		end
	end

	return 
end
function Renderer:active_node_gui()
	return self._node_gui_stack[#self._node_gui_stack]
end
function Renderer:disable_input(time)
	self._timer = time
	slot5 = false

	self._logic.accept_input(slot3, self._logic)

	return 
end
function Renderer:close()
	slot3 = self._fullscreen_ws

	self._fullscreen_ws.hide(slot2)

	self._open = false

	if self._resolution_changed_callback_id then
		slot4 = self._resolution_changed_callback_id

		managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)
	end

	slot3 = self._node_gui_stack

	for _, node_gui in ipairs(slot2) do
		slot8 = node_gui

		node_gui.close(slot7)
	end

	slot3 = self._main_panel

	self._main_panel.clear(slot2)

	slot3 = self._fullscreen_panel

	self._fullscreen_panel.clear(slot2)

	slot3 = self.safe_rect_panel

	self.safe_rect_panel.clear(slot2)

	self._node_gui_stack = {}
	slot3 = self._logic

	self._logic.renderer_closed(slot2)

	return 
end
function Renderer:hide()
	slot3 = self
	local active_node_gui = self.active_node_gui(slot2)

	if active_node_gui then
		slot5 = false

		active_node_gui.set_visible(slot3, active_node_gui)
	end

	return 
end
function Renderer:show()
	slot3 = self
	local active_node_gui = self.active_node_gui(slot2)

	if active_node_gui then
		slot5 = true

		active_node_gui.set_visible(slot3, active_node_gui)
	end

	return 
end
function Renderer:_layout_main_panel()
	local scaled_size = self._scaled_size(slot2)
	slot8 = scaled_size.height

	self._main_panel.set_shape(self, self._main_panel, 0, 0, scaled_size.width)

	local safe_rect = self._scaled_size(self)
	slot9 = safe_rect.height

	self.safe_rect_panel.set_shape(self, self.safe_rect_panel, safe_rect.x, safe_rect.y, safe_rect.width)

	return 
end
function Renderer:resolution_changed()
	local res = RenderSettings.resolution
	slot5 = self.ws

	managers.gui_data.layout_workspace(slot3, managers.gui_data)

	slot5 = self._fullscreen_ws

	managers.gui_data.layout_fullscreen_workspace(slot3, managers.gui_data)

	slot4 = self

	self._layout_main_panel(slot3)

	slot4 = self._node_gui_stack

	for _, node_gui in ipairs(slot3) do
		slot9 = node_gui

		node_gui.resolution_changed(slot8)
	end

	return 
end
function Renderer:selected_node()
	local stack = self._node_gui_stack

	return stack[#stack]
end

return 
