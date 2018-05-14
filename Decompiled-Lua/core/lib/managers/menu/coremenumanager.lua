-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuManager"

core.module(slot1, core)

slot3 = "CoreMenuData"

core.import(slot1, core)

slot3 = "CoreMenuLogic"

core.import(slot1, core)

slot3 = "CoreMenuInput"

core.import(slot1, core)

slot3 = "CoreMenuRenderer"

core.import(slot1, core)

Manager = Manager or class()
function Manager:init()
	managers.menu = managers.menu or self
	self._registered_menus = {}
	self._open_menus = {}

	return 
end
function Manager:destroy()
	slot3 = self._open_menus

	for _, menu in ipairs(slot2) do
		slot9 = menu.name

		self.close_menu(slot7, self)
	end

	self._open_menus = {}
	self._registered_menus = {}

	return 
end
function Manager:register_menu(menu)
	if menu.name and self._registered_menus[menu.name] then
		return 
	end

	slot4 = CoreMenuData.Data
	menu.data = CoreMenuData.Data.new(slot3)
	slot6 = menu.id

	menu.data.load_data(slot3, menu.data, menu.content_file)

	slot5 = menu.callback_handler

	menu.data.set_callback_handler(slot3, menu.data)

	slot5 = menu.data
	menu.logic = CoreMenuLogic.Logic.new(slot3, CoreMenuLogic.Logic)
	slot5 = "menu_manager_menu_closed"
	slot11 = menu.name

	menu.logic.register_callback(slot3, menu.logic, callback(slot7, self, self, "_menu_closed"))

	slot5 = "menu_manager_select_node"
	slot11 = menu.name

	menu.logic.register_callback(slot3, menu.logic, callback(slot7, self, self, "_node_selected"))

	if not menu.input then
		slot6 = menu.name
		menu.input = CoreMenuInput.MenuInput.new(slot3, CoreMenuInput.MenuInput, menu.logic)
	else
		slot4 = "return " .. menu.input
		menu.input = 
		-- Decompilation error in this vicinity:
		loadstring(slot3)()
		slot6 = menu.name
		menu.input = menu.input.new(slot3, menu.input, menu.logic)
	end

	if not menu.renderer then
		slot5 = menu.logic
		menu.renderer = CoreMenuRenderer.Renderer.new(slot3, CoreMenuRenderer.Renderer)
	else
		slot4 = "return " .. menu.renderer
		menu.renderer = 
		-- Decompilation error in this vicinity:
		loadstring(slot3)()
		slot5 = menu.logic
		menu.renderer = menu.renderer.new(slot3, menu.renderer)
	end

	slot4 = menu.renderer

	menu.renderer.preload(slot3)

	if menu.name then
		self._registered_menus[menu.name] = menu
	else
		slot5 = "Manager:register_menu(): Menu '" .. menu.id .. "' is missing a name, in '" .. menu.content_file .. "'"

		Application.error(slot3, Application)
	end

	return 
end
function Manager:get_menu(menu_name)
	local menu = self._registered_menus[menu_name]

	return menu
end
function Manager:open_menu(menu_name, position, ...)
	local menu = self._registered_menus[menu_name]

	if menu then
		slot6 = self._open_menus

		for _, open_menu in ipairs(slot5) do
			if open_menu.name == menu_name then
				return false
			end
		end

		local current_open_menu = self._open_menus[#self._open_menus]

		if self._open_menus[#self._open_menus] then
		end

		if position then
			slot9 = menu

			table.insert(slot6, self._open_menus, position)
		else
			slot8 = menu

			table.insert(slot6, self._open_menus)
		end

		if current_open_menu and current_open_menu ~= self._open_menus[#self._open_menus] then
			slot7 = current_open_menu.renderer

			current_open_menu.renderer.hide(slot6)
		end

		slot7 = managers.player

		if managers.player.player_unit(slot6) then
			slot7 = managers.player
			slot7 = managers.player.player_unit(slot6)
			slot8 = nil

			managers.player.player_unit(slot6).movement(slot6)._current_state._interupt_action_steelsight(slot6, managers.player.player_unit(slot6).movement(slot6)._current_state)
		end

		slot7 = menu.renderer

		menu.renderer.open(slot6, ...)

		slot7 = menu.logic

		menu.logic.open(slot6, ...)

		slot8 = position

		menu.input.open(slot6, menu.input, ...)

		slot8 = true

		self.input_enabled(slot6, self)

		return true
	else
		slot7 = "Manager:open_menu: No menu named '" .. menu_name .. "'"

		Application.error(slot5, Application)

		return false
	end

	return 
end
function Manager:close_menu(menu_name)
	local menu = nil

	if menu_name then
		slot5 = self._open_menus

		for _, open_menu in ipairs(slot4) do
			if open_menu.name == menu_name then
				menu = open_menu

				break
			end
		end
	else
		menu = self._open_menus[#self._open_menus]
	end

	if menu then
		slot6 = true

		menu.logic.close(slot4, menu.logic)

		slot5 = menu.input

		menu.input.close(slot4)

		slot5 = menu.renderer

		menu.renderer.close(slot4)
	end

	return 
end
function Manager:_menu_closed(menu_name)
	if menu_name then
		slot4 = self._open_menus

		for i, menu in ipairs(slot3) do
			if menu.name == menu_name then
				slot10 = i

				table.remove(slot8, self._open_menus)
			end
		end
	else
		slot5 = #self._open_menus

		table.remove(slot3, self._open_menus)
	end

	if self._open_menus[#self._open_menus] then
		slot4 = self._open_menus[#self._open_menus].renderer

		self._open_menus[#self._open_menus].renderer.show(#self._open_menus)

		slot5 = true

		self._open_menus[#self._open_menus].logic.accept_input(#self._open_menus, self._open_menus[#self._open_menus].logic)

		slot4 = self._open_menus[#self._open_menus].logic

		self._open_menus[#self._open_menus].logic.soft_open(#self._open_menus)
	end

	return 
end
function Manager:_node_selected(menu_name, node)
	return 
end
function Manager:input_enabled(enabled)
	self._input_enabled = enabled
	slot4 = self._open_menus

	for _, menu in ipairs(slot3) do
		slot10 = enabled

		menu.input.focus(slot8, menu.input)
	end

	return 
end
function Manager:update(t, dt)
	local active_menu = self._open_menus[#self._open_menus]

	if active_menu then
		slot8 = dt

		active_menu.logic.update(slot5, active_menu.logic, t)

		if self._input_enabled then
			slot8 = dt

			active_menu.input.update(slot5, active_menu.input, t)
		end
	end

	slot6 = self._open_menus

	for _, menu in ipairs(slot5) do
		slot13 = dt

		menu.renderer.update(slot10, menu.renderer, t)
	end

	return 
end

return 
