CoreHubElement = CoreHubElement or class()

if not HubElement then
	slot2 = CoreHubElement
	slot0 = class(slot1)
end

HubElement = slot0
function HubElement:init(...)
	slot3 = self

	CoreHubElement.init(slot2, ...)

	return 
end
function CoreHubElement:init(unit)
	self._unit = unit
	slot4 = self._unit
	self._hed = self._unit.hub_element_data(slot3)
	slot4 = self._unit
	self._ud = self._unit.unit_data(slot3)
	slot5 = 1

	self._unit.anim_play(slot3, self._unit)

	self._save_values = {}
	self._mission_trigger_values = {}
	self._update_selected_on = false
	slot4 = managers.editor
	self._parent_panel = managers.editor.hub_element_panel(slot3)
	slot4 = managers.editor
	self._parent_sizer = managers.editor.hub_element_sizer(slot3)
	self._panels = {}
	slot4 = Draw
	self._arrow_brush = Draw.brush(slot3)
	slot4 = self

	self._createicon(slot3)

	return 
end
function CoreHubElement:_createicon()
	local iconsize = 128

	if Global.iconsize then
		iconsize = Global.iconsize
	end

	if self._icon == nil then
		return 
	end

	slot4 = self._unit
	slot7 = "c_hub_element_sphere"
	local root = self._unit.get_object(slot3, Idstring(slot6))

	if root == nil then
		return 
	end

	if self._iconcolor == nil then
		self._iconcolor = "fff"
	end

	slot5 = World
	self._icon_gui = World.newgui(slot4)
	slot6 = "core/guis/core_edit_icon"

	self._icon_gui.preload(slot4, self._icon_gui)

	slot8 = 0
	local pos = self._unit.position(slot4) - Vector3(self._unit, iconsize / 2, iconsize / 2)
	slot15 = 0
	slot11 = Vector3(slot12, iconsize, 0)
	slot16 = 0
	self._icon_ws = self._icon_gui.create_linked_workspace(self._unit, self._icon_gui, 64, 64, root, pos, Vector3(iconsize, 0, iconsize))
	slot7 = self._icon_ws.BILLBOARD_BOTH

	self._icon_ws.set_billboard(self._unit, self._icon_ws)

	slot6 = self._icon_ws
	slot7 = "core/guis/core_edit_icon"

	self._icon_ws.panel(self._unit).gui(self._unit, self._icon_ws.panel(self._unit))

	slot6 = self._icon_ws
	slot7 = "core/guis/core_edit_icon"
	slot6 = self._icon_ws.panel(self._unit).gui(self._unit, self._icon_ws.panel(self._unit))
	self._icon_script = self._icon_ws.panel(self._unit).gui(self._unit, self._icon_ws.panel(self._unit)).script(self._unit)
	slot7 = self._icon
	slot10 = self._iconcolor

	self._icon_script.seticon(self._unit, self._icon_script, tostring(root))

	return 
end
function CoreHubElement:_create_panel()
	if self._panel then
		return 
	end

	slot5 = self._parent_sizer
	self._panel, self._panel_sizer = self._add_panel(slot2, self, self._parent_panel)

	return 
end
function CoreHubElement:_build_panel()
	self._panel = nil

	return 
end
function CoreHubElement:panel(id, parent, parent_sizer)
	if id then
		if self._panels[id] then
			return self._panels[id]
		end

		slot8 = parent_sizer
		local panel, panel_sizer = self._add_panel(slot5, self, parent)
		slot10 = panel_sizer

		self._build_panel(parent, self, panel)

		self._panels[id] = panel

		return self._panels[id]
	end

	if not self._panel then
		slot6 = self

		self._build_panel(slot5)
	end

	return self._panel
end
function CoreHubElement:_add_panel(parent, parent_sizer)
	slot8 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot4, EWS, parent, "")
	slot7 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot8 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot14 = managers.editor
	slot17 = self._unit
	slot14 = ""
	slot11 = "ALIGN_CENTER_HORIZONTAL"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticText(slot9, EWS, panel, managers.editor.category_name(slot13, self._unit.name(slot16)), 0), 0, 0)

	slot13 = "LI_HORIZONTAL"
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticLine(0, EWS, panel, ""), 0, 0)

	slot11 = "EXPAND"

	parent_sizer.add(EWS, parent_sizer, panel, 1, 0)

	slot8 = false

	panel.set_visible(EWS, panel)

	slot8 = {
		alive = true
	}

	panel.set_extension(EWS, panel)

	return panel, panel_sizer
end
function CoreHubElement:add_help_text(data)
	if data.panel and data.sizer then
		slot11 = "TE_MULTILINE,TE_READONLY,TE_WORDWRAP,TE_CENTRE"
		slot8 = "EXPAND,TOP,BOTTOM"

		data.sizer.add(slot3, data.sizer, EWS.TextCtrl(slot6, EWS, data.panel, data.text, 0), 0, 5)
	end

	return 
end
function CoreHubElement:set_element_data(data)
	if data.callback then
		local he = self._unit.hub_element(slot3)
		slot7 = data.params

		he[data.callback](self._unit, he, data.ctrlr)
	end

	if data.value then
		slot6 = data.ctrlr
		self._hed[data.value] = data.ctrlr.get_value(slot5)
		slot6 = self._hed[data.value]
		self._hed[data.value] = tonumber(slot5) or self._hed[data.value]
	end

	return 
end
function CoreHubElement:selected()
	return 
end
function CoreHubElement:update_selected()
	return 
end
function CoreHubElement:update_unselected()
	return 
end
function CoreHubElement:begin_editing()
	return 
end
function CoreHubElement:end_editing()
	return 
end
function CoreHubElement:clone_data()
	return 
end
function CoreHubElement:layer_finished()
	return 
end
function CoreHubElement:action_type()
	return self._action_type or self._type
end
function CoreHubElement:trigger_type()
	return self._trigger_type or self._type
end
function CoreHubElement:save_mission_action(file, t, hub, dont_save_values)
	slot7 = self
	local type = self.action_type(slot6)

	if type then
		slot8 = hub
		slot9 = self._unit
		local ha = hub.hub_element(slot7).get_hub_action(slot7, hub.hub_element(slot7))
		slot16 = self
		slot10 = t .. "<action type=\"" .. type .. "\" name=\"" .. self.name(slot15) .. "\" mode=\"" .. ha.type .. "\" start_time=\"" .. ha.action_delay .. "\">"

		file.puts(hub.hub_element(slot7), file)

		if not dont_save_values then
			slot9 = self._save_values

			for _, name in ipairs(slot8) do
				slot17 = name

				self.save_value(slot13, self, file, t)
			end
		end

		slot10 = t .. "</action>"

		file.puts(slot8, file)
	end

	return 
end
function CoreHubElement:save_mission_action_enemy(file, t, hub)
	slot6 = hub
	slot7 = self._unit
	local ha = hub.hub_element(slot5).get_hub_action(slot5, hub.hub_element(slot5))
	local pos = self._unit.position(hub.hub_element(slot5))
	local rot = self._unit.rotation(self._unit)
	slot14 = self
	slot16 = self
	slot10 = t .. "<action type=\"" .. self.action_type(slot13) .. "\" name=\"" .. self.name(slot15) .. "\" mode=\"" .. ha.type .. "\" start_time=\"" .. ha.action_delay .. "\">"

	file.puts(self._unit, file)

	if ha.type == "" or ha.type == "create" then
		slot10 = t .. "\t<enemy name=\"" .. self._hed.enemy_name .. "\">"

		file.puts(slot8, file)

		slot9 = self._save_values

		for _, name in ipairs(slot8) do
			slot17 = name

			self.save_value(slot13, self, file, t .. "\t")
		end

		slot10 = t .. "\t</enemy>"

		file.puts(slot8, file)
	end

	slot10 = t .. "</action>"

	file.puts(slot8, file)

	return 
end
function CoreHubElement:save_data(file, t)
	slot7 = t

	self.save_values(slot4, self, file)

	return 
end
function CoreHubElement:save_values(file, t)
	t = t .. "\t"
	slot6 = t .. "<values>"

	file.puts("\t", file)

	slot5 = self._save_values

	for _, name in ipairs("\t") do
		slot13 = name

		self.save_value(slot9, self, file, t)
	end

	slot6 = t .. "</values>"

	file.puts(slot4, file)

	return 
end
function CoreHubElement:save_value(file, t, name)
	t = t .. "\t"
	slot6 = file
	slot12 = self._unit

	file.puts("\t", save_value_string(slot8, self._hed, name, t))

	return 
end
function CoreHubElement:save_mission_trigger(file, t, hub)
	if 0 < #self._mission_trigger_values then
		slot6 = self
		local type = self.trigger_type(slot5)

		if type then
			slot7 = hub
			slot8 = self._unit
			local ht = hub.hub_element(slot6).get_hub_trigger(slot6, hub.hub_element(slot6))
			slot15 = self
			slot9 = t .. "<trigger type=\"" .. type .. "\" name=\"" .. self.name(slot14) .. "\" mode=\"" .. ht.type .. "\">"

			file.puts(hub.hub_element(slot6), file)

			slot8 = self._mission_trigger_values

			for _, name in ipairs(hub.hub_element(slot6)) do
				slot16 = name

				self.save_value(slot12, self, file, t)
			end

			slot9 = t .. "</trigger>"

			file.puts(slot7, file)
		end
	end

	return 
end
function CoreHubElement:name()
	slot3 = self._unit

	return self._unit.name(slot2) .. self._ud.unit_id
end
function CoreHubElement:load_data(data)
	return 
end
function CoreHubElement:get_color(type)
	if type then
		if type == "activate" or type == "enable" then
			return 0, 1, 0
		elseif type == "deactivate" or type == "disable" then
			return 1, 0, 0
		end
	end

	return 0, 1, 0
end
function CoreHubElement:draw_connections_selected()
	slot3 = self._hed.hubs

	for _, hub in ipairs(slot2) do
		local r = 1
		local g = 0.6
		local b = 0.2
		slot17 = true

		self.draw_arrow(slot10, self, self._unit, hub, r, g, b)
	end

	return 
end
function CoreHubElement:draw_connections_unselected()
	return 
end
function CoreHubElement:draw_arrow(from, to, r, g, b, thick)
	slot14 = b

	self._arrow_brush.set_color(slot8, Color(slot11, r, g))

	local mul = 1.2
	slot12 = 1
	r = math.clamp(self._arrow_brush, r * mul, 0)
	slot12 = 1
	g = math.clamp(self._arrow_brush, g * mul, 0)
	slot12 = 1
	b = math.clamp(self._arrow_brush, b * mul, 0)
	slot10 = from
	from = from.position(self._arrow_brush)
	slot10 = to
	to = to.position(self._arrow_brush)
	local len = from - to.length(self._arrow_brush)
	slot11 = to - from
	local dir = to - from.normalized(from - to)
	len = len - 50

	if thick then
		slot15 = 10

		self._arrow_brush.cylinder(slot11, self._arrow_brush, from, from + dir * len)

		slot18 = b

		Application.draw_cylinder(slot11, Application, from, from + dir * len, 10, r, g)
	else
		slot17 = b

		Application.draw_line(slot11, Application, from, to, r, g)
	end

	slot16 = from - to

	self._arrow_brush.cone(slot11, self._arrow_brush, to, to + from - to.normalized(slot15) * 150)

	slot16 = from - to
	slot18 = b

	Application.draw_cone(slot11, Application, to, to + from - to.normalized(48) * 150, 48, r, g)

	return 
end
function CoreHubElement:clear()
	return 
end
function CoreHubElement:action_types()
	return self._action_types
end
function CoreHubElement:timeline_color()
	return self._timeline_color
end
function CoreHubElement:add_triggers()
	return 
end
function CoreHubElement:clear_triggers()
	return 
end
function CoreHubElement:widget_affect_object()
	return nil
end
function CoreHubElement:use_widget_position()
	return nil
end
function CoreHubElement:set_enabled()
	return 
end
function CoreHubElement:set_disabled()
	return 
end
function CoreHubElement:set_update_selected_on(value)
	self._update_selected_on = value

	return 
end
function CoreHubElement:update_selected_on()
	return self._update_selected_on
end
function CoreHubElement:destroy()
	if self._panel then
		slot3 = self._panel
		self._panel.extension(slot2).alive = false
		slot3 = self._panel

		self._panel.destroy(false)
	end

	if self._icon_ws then
		slot4 = self._icon_ws

		self._icon_gui.destroy_workspace(slot2, self._icon_gui)

		self._icon_ws = nil
	end

	return 
end

return 
