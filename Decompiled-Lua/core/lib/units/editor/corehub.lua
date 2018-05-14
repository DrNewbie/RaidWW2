-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CoreHub then
	slot2 = HubElement
	slot0 = class(slot1)
end

CoreHub = slot0

if not Hub then
	slot2 = CoreHub
	slot0 = class(slot1)
end

Hub = slot0
function Hub:init(...)
	slot3 = self

	CoreHub.init(slot2, ...)

	return 
end
function CoreHub:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	slot6 = 0
	self._timeline_color = Vector3(slot3, 0, 1)
	self._hed.required_triggers = "all"
	self._hed.trigger_once = true
	self._hed.trigger_on_inverse = false
	self._hed.actions_data = {}
	self._hed.triggers_data = {}
	self._hed.default_test_hub = false
	self._hed.use_as_start = false
	self._hed.never_start = false
	self._hed.start_from_relay = "none"
	self._hed.hub_entered_from_zone = "none"
	slot5 = "required_triggers"

	table.insert("none", self._save_values)

	slot5 = "actions_data"

	table.insert("none", self._save_values)

	slot5 = "triggers_data"

	table.insert("none", self._save_values)

	slot5 = "default_test_hub"

	table.insert("none", self._save_values)

	slot5 = "trigger_once"

	table.insert("none", self._save_values)

	slot5 = "trigger_on_inverse"

	table.insert("none", self._save_values)

	slot5 = "use_as_start"

	table.insert("none", self._save_values)

	slot5 = "never_start"

	table.insert("none", self._save_values)

	slot5 = "activate"

	table.insert("none", self._hed.action_types)

	slot5 = "deactivate"

	table.insert("none", self._hed.action_types)

	slot5 = "trigger_actions"

	table.insert("none", self._hed.action_types)

	return 
end
function CoreHub:set_actions()
	if not self._actions_ctrlrs then
		return 
	end

	slot3 = self._actions_ctrlrs.actions

	self._actions_ctrlrs.actions.clear(slot2)

	if #self._hed.actions ~= 0 then
		slot3 = self

		self.append_actions_sorted(slot2)

		if self._selected_action then
			slot6 = self._selected_action.unit_id
		else
			slot6 = self
			slot7 = self._actions_ctrlrs.action_delay

			self.select_action(slot2, self, self._action_names(slot5)[1], self._actions_ctrlrs.actions, self._actions_ctrlrs.action_types)
		end
	else
		slot4 = false

		self._actions_ctrlrs.actions.set_enabled(slot2, self._actions_ctrlrs.actions)

		local action_types = self._actions_ctrlrs.action_types
		slot4 = action_types

		action_types.clear(self._actions_ctrlrs.actions)

		slot5 = false

		action_types.set_enabled(self._actions_ctrlrs.actions, action_types)

		local action_delay = self._actions_ctrlrs.action_delay
		slot6 = "-"

		action_delay.set_value(action_types, action_delay)

		slot6 = false

		action_delay.set_enabled(action_types, action_delay)
	end

	return 
end
function CoreHub:append_actions_sorted()
	slot3 = self._actions_ctrlrs.actions

	self._actions_ctrlrs.actions.clear(slot2)

	slot5 = self

	for _, name in ipairs(self._action_names(slot4)) do
		slot9 = name

		self._actions_ctrlrs.actions.append(slot7, self._actions_ctrlrs.actions)
	end

	return 
end
function CoreHub:_action_names()
	local names = {}
	slot4 = self._hed.actions

	for _, action in ipairs(slot3) do
		slot9 = names
		slot13 = action

		table.insert(slot8, self.combobox_name(slot11, self))
	end

	slot4 = names

	table.sort(slot3)

	return names
end
function CoreHub:set_triggers()
	if not self._triggers_ctrlrs then
		return 
	end

	slot3 = self._triggers_ctrlrs.triggers

	self._triggers_ctrlrs.triggers.clear(slot2)

	if #self._hed.triggers ~= 0 then
		slot3 = self

		self.append_triggers_sorted(slot2)

		if self._selected_trigger then
			slot6 = self._selected_trigger.unit_id
		else
			slot6 = self
			slot6 = self._triggers_ctrlrs.trigger_types

			self.select_trigger(slot2, self, self._trigger_names(slot5)[1], self._triggers_ctrlrs.triggers)
		end
	else
		slot4 = false

		self._triggers_ctrlrs.triggers.set_enabled(slot2, self._triggers_ctrlrs.triggers)

		local trigger_types = self._triggers_ctrlrs.trigger_types
		slot4 = trigger_types

		trigger_types.clear(self._triggers_ctrlrs.triggers)

		slot5 = false

		trigger_types.set_enabled(self._triggers_ctrlrs.triggers, trigger_types)
	end

	return 
end
function CoreHub:append_triggers_sorted()
	slot3 = self._triggers_ctrlrs.triggers

	self._triggers_ctrlrs.triggers.clear(slot2)

	slot5 = self

	for _, name in ipairs(self._trigger_names(slot4)) do
		slot9 = name

		self._triggers_ctrlrs.triggers.append(slot7, self._triggers_ctrlrs.triggers)
	end

	return 
end
function CoreHub:_trigger_names()
	local names = {}
	slot4 = self._hed.triggers

	for _, trigger in ipairs(slot3) do
		slot9 = names
		slot13 = trigger

		table.insert(slot8, self.combobox_name(slot11, self))
	end

	slot4 = names

	table.sort(slot3)

	return names
end
function CoreHub:set_required_triggers()
	slot3 = self._required_triggers

	self._required_triggers.clear(slot2)

	for i = 1, #self._hed.triggers - 1, 1 do
		slot8 = i

		self._required_triggers.append(slot6, self._required_triggers)
	end

	slot4 = "all"

	self._required_triggers.append(slot2, self._required_triggers)

	if self._hed.required_triggers ~= "all" then
		slot3 = self._hed.required_triggers

		if #self._hed.triggers - 1 < tonumber(slot2) then
			slot3 = self._hed.required_triggers

			if tonumber(slot2) == 1 then
				self._hed.required_triggers = "all"
			else
				self._hed.required_triggers = self._hed.required_triggers - 1
			end
		end
	end

	slot4 = self._hed.required_triggers

	self._required_triggers.set_value(slot2, self._required_triggers)

	return 
end
function CoreHub:set_trigger_type(trigger_types)
	if self._selected_trigger then
		slot5 = trigger_types
		self._selected_trigger.type = trigger_types.get_value(slot4)
	end

	return 
end
function CoreHub:set_action_type(action_types)
	if self._selected_action then
		slot5 = action_types
		self._selected_action.type = action_types.get_value(slot4)
	end

	return 
end
function CoreHub:set_action_delay(action_delay)
	if self._selected_action then
		slot6 = action_delay
		local value = tonumber(action_delay.get_value(slot5)) or 0
		self._selected_action.action_delay = value
		slot5 = action_delay
		slot9 = self._selected_action.action_delay

		action_delay.change_value(slot4, string.format(slot7, "%.4f"))

		if self._timeline then
			slot6 = self._selected_action

			self._timeline.action_delay_updated(slot4, self._timeline)
		end
	end

	return 
end
function CoreHub:ews_select_action()
	slot6 = self._actions_ctrlrs.actions
	slot7 = self._actions_ctrlrs.action_delay

	self.select_action(slot2, self, self._actions_ctrlrs.actions.get_value(slot5), self._actions_ctrlrs.actions, self._actions_ctrlrs.action_types)

	return 
end
function CoreHub:select_action_with_unit(unit)
	slot5 = unit

	if not table.contains(slot3, self._hed.actions) then
		return 
	end

	slot8 = unit
	slot8 = self._actions_ctrlrs.action_delay

	self.select_action(slot3, self, self.combobox_name(slot6, self), self._actions_ctrlrs.actions, self._actions_ctrlrs.action_types)

	return 
end
function CoreHub:ews_select_trigger()
	slot6 = self._triggers_ctrlrs.triggers
	slot6 = self._triggers_ctrlrs.trigger_types

	self.select_trigger(slot2, self, self._triggers_ctrlrs.triggers.get_value(slot5), self._triggers_ctrlrs.triggers)

	return 
end
function CoreHub:select_trigger_with_unit(unit)
	slot5 = unit

	if not table.contains(slot3, self._hed.triggers) then
		return 
	end

	slot8 = unit
	slot7 = self._triggers_ctrlrs.trigger_types

	self.select_trigger(slot3, self, self.combobox_name(slot6, self), self._triggers_ctrlrs.triggers)

	return 
end
function CoreHub:select_action(s, actions, action_types, action_delay)
	local action_id = self.combobox_id(slot6, self)
	local a = self._hed.actions_data[action_id]
	self._selected_action = a
	slot10 = true

	actions.set_enabled(s, actions)

	slot10 = s

	actions.set_value(s, actions)

	slot10 = true

	action_types.set_enabled(s, action_types)

	slot9 = action_types

	action_types.clear(s)

	slot10 = self._selected_action.unit_id
	local action_unit = self.action_unit(s, self)
	slot10 = action_unit

	if #action_unit.hub_element_data(self).action_types ~= 0 then
		slot12 = action_unit
		slot10 = action_unit.hub_element_data(slot11).action_types

		for _, types in ipairs(slot9) do
			slot16 = types

			action_types.append(slot14, action_types)
		end

		slot11 = self._selected_action.type

		action_types.set_value(slot9, action_types)
	else
		slot11 = false

		action_types.set_enabled(slot9, action_types)
	end

	slot11 = true

	action_delay.set_enabled(slot9, action_delay)

	slot10 = action_delay
	slot14 = self._selected_action.action_delay

	action_delay.change_value(slot9, string.format(slot12, "%.4f"))

	if self._timeline then
		slot11 = self._selected_action

		self._timeline.select_action(slot9, self._timeline)
	end

	return 
end
function CoreHub:select_trigger(s, triggers, trigger_types)
	local trigger_id = self.combobox_id(slot5, self)
	local t = self._hed.triggers_data[trigger_id]
	self._selected_trigger = t
	slot9 = true

	triggers.set_enabled(s, triggers)

	slot9 = s

	triggers.set_value(s, triggers)

	slot9 = true

	trigger_types.set_enabled(s, trigger_types)

	slot8 = trigger_types

	trigger_types.clear(s)

	slot9 = self._selected_trigger.unit_id
	local trigger_unit = self.trigger_unit(s, self)
	slot9 = trigger_unit

	if #trigger_unit.hub_element_data(self).trigger_types ~= 0 then
		slot11 = trigger_unit
		slot9 = trigger_unit.hub_element_data(slot10).trigger_types

		for _, types in ipairs(slot8) do
			slot15 = types

			trigger_types.append(slot13, trigger_types)
		end

		slot10 = self._selected_trigger.type

		trigger_types.set_value(slot8, trigger_types)
	else
		slot10 = false

		trigger_types.set_enabled(slot8, trigger_types)
	end

	return 
end
function CoreHub:update_selected(t, dt)
	slot8 = self._unit
	slot10 = 0

	Application.draw_circle(slot4, Application, self._unit.position(slot7), 75, 1, 1)

	return 
end
function CoreHub:draw_connections_selected(t, dt)
	slot7 = dt

	self.draw_triggers(slot4, self, t)

	slot7 = dt

	self.draw_actions(slot4, self, t)

	return 
end
function CoreHub:draw_actions(t, dt)
	slot5 = self._hed.actions

	for _, action in ipairs(slot4) do
		slot10 = action
		slot15 = action
		slot11 = self._hed.actions_data[self.id_string(slot13, self)].type
		local r, g, b = action.hub_element(slot9).get_color(slot9, action.hub_element(slot9))
		slot19 = true

		self.draw_arrow(self.id_string(slot13, self), self, self._unit, action, r * 0.5, g * 0.5, b * 0.5)
	end

	if self._selected_action then
		slot8 = self._selected_action.unit_id

		if alive(self.action_unit(slot6, self)) then
			slot6 = self._selected_action.unit_id
			local action = self.action_unit(slot4, self)
			slot6 = action
			slot7 = self._selected_action.type
			local r, g, b = action.hub_element(self).get_color(self, action.hub_element(self))
			local s = 0.75 + (1 + math.sin(slot8)) * 0.25 * 0.5
			slot14 = b * s

			Application.draw(t * 100, Application, action, r * s, g * s)

			slot16 = true

			self.draw_arrow(t * 100, self, self._unit, action, r * s, g * s, b * s)
		end
	end

	return 
end
function CoreHub:draw_triggers(t, dt)
	slot5 = self._hed.triggers

	for _, trigger in ipairs(slot4) do
		local r = 1
		local g = 1
		local b = 0
		slot13 = trigger

		if trigger.name(slot12) == "hub" then
			b = 1
			g = 0
			r = 0
		end

		slot19 = true

		self.draw_arrow(slot12, self, trigger, self._unit, r * 0.5, g * 0.5, b * 0.5)
	end

	if self._selected_trigger then
		slot8 = self._selected_trigger.unit_id

		if alive(self.trigger_unit(slot6, self)) then
			local r = 1
			local g = 1
			local b = 0
			slot9 = self._selected_trigger.unit_id
			local trigger = self.trigger_unit(slot7, self)
			slot9 = trigger

			if trigger.name(self) == "hub" then
				b = 1
				g = 0
				r = 0
			end

			local s = 0.75 + (1 + math.sin(slot8)) * 0.25 * 0.5
			slot14 = b * s

			Application.draw(t * 100, Application, trigger, r * s, g * s)

			slot16 = true

			self.draw_arrow(t * 100, self, trigger, self._unit, r * s, g * s, b * s)
		end
	end

	return 
end
function CoreHub:update_unselected()
	return 
end
function CoreHub:draw_connections_unselected()
	slot6 = self._unit
	slot8 = 0

	Application.draw_circle(slot2, Application, self._unit.position(slot5), 50, 1, 1)

	slot3 = self._hed.triggers

	for _, trigger in ipairs(slot2) do
		local r = 1
		local g = 1
		local b = 0
		slot11 = trigger

		if trigger.name(slot10) == "hub" then
			b = 0.75
			g = 0.1
			r = 0.1
		end

		slot14 = trigger
		slot16 = b

		Application.draw_circle(slot10, Application, trigger.position(slot13), 50, r, g)

		slot17 = false

		self.draw_arrow(slot10, self, trigger, self._unit, r * 0.75, g * 0.75, b * 0.75)
	end

	slot3 = self._hed.actions

	for _, action in ipairs(slot2) do
		slot8 = action
		slot10 = self.id_string(slot11, self)
		slot9 = self._hed.actions_data[slot10].type
		local r, g, b = action.hub_element(slot7).get_color(slot7, action.hub_element(slot7))
		slot14 = action
		slot16 = b

		Application.draw_circle(slot10, Application, action.position(action), 50, r, g)

		slot17 = false

		self.draw_arrow(slot10, self, self._unit, action, r * 0.5, g * 0.5, b * 0.5)
	end

	return 
end
function CoreHub:combobox_name(unit)
	slot4 = unit
	slot6 = unit

	return unit.unit_data(slot3).name_id .. " (" .. unit.unit_data(slot5).unit_id .. ")"
end
function CoreHub:combobox_id(name)
	local s = nil
	local e = string.len(slot4) - 1
	slot6 = name

	for i = string.len(name), 0, -1 do
		slot12 = i
		local t = string.sub(slot9, name, i)

		if t == "(" then
			s = i + 1

			break
		end
	end

	slot8 = e

	return string.sub(slot5, name, s)
end
function CoreHub:id_string(unit)
	slot6 = unit
	slot4 = unit.unit_data(slot5).unit_id

	return tostring(slot3)
end
function CoreHub:save_mission_action(file, t, hub)
	slot10 = true

	HubElement.save_mission_action(slot5, self, file, t, hub)

	return 
end
function CoreHub:save_mission_trigger(file, tab)
	local name = self._unit.name(slot4)
	slot12 = self._unit
	slot7 = tab .. "<trigger type=\"Hub\" name=\"" .. name .. self._unit.unit_data(slot11).unit_id .. "\"/>"

	file.puts(self._unit, file)

	return 
end
function CoreHub:layer_finished()
	local hed = self._hed
	local t = {}
	slot5 = hed.actions_data

	for key, value in pairs(slot4) do
		slot11 = value.unit_id
		local unit = managers.worlddefinition.get_hub_element_unit(slot9, managers.worlddefinition)
		slot12 = unit
		t[self.id_string(managers.worlddefinition, self)] = value
	end

	hed.actions_data = t
	slot5 = hed.actions_data

	for key, value in pairs(slot4) do
		slot11 = value.unit_id
		local a = managers.worlddefinition.get_hub_element_unit(slot9, managers.worlddefinition)

		table.insert(managers.worlddefinition, hed.actions)

		slot13 = a
		slot12 = self._unit

		table.insert(managers.worlddefinition, a.hub_element_data(a).hubs)
	end

	local tt = {}
	slot6 = hed.triggers_data

	for key, value in pairs(slot5) do
		local v = value
		slot12 = value

		if type_name(slot11) == "number" then
			v = {
				type = "",
				unit_id = v
			}
		end

		slot13 = v.unit_id
		local unit = managers.worlddefinition.get_hub_element_unit(slot11, managers.worlddefinition)
		slot14 = unit
		tt[self.id_string(managers.worlddefinition, self)] = v
	end

	hed.triggers_data = tt
	slot6 = hed.triggers_data

	for key, value in pairs(slot5) do
		slot12 = value.unit_id
		local t = managers.worlddefinition.get_hub_element_unit(slot10, managers.worlddefinition)

		table.insert(managers.worlddefinition, hed.triggers)

		slot14 = t
		slot13 = self._unit

		table.insert(managers.worlddefinition, t.hub_element_data(t).hubs)
	end

	return 
end
function CoreHub:action_unit(id)
	slot4 = self._hed.actions

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.unit_data(slot8).unit_id == id then
			return unit
		end
	end

	return 
end
function CoreHub:trigger_unit(id)
	slot4 = self._hed.triggers

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.unit_data(slot8).unit_id == id then
			return unit
		end
	end

	return 
end
function CoreHub:add_action(a)
	slot5 = a

	if table.contains(slot3, self._hed.actions) then
		return 
	end

	table.insert(slot3, self._hed.actions)

	slot5 = self._unit

	table.insert(slot3, a.hub_element_data(a).hubs)

	slot5 = a
	local s = self.id_string(slot3, self)
	slot7 = a
	self._hed.actions_data[s] = {
		type = "",
		action_delay = 0,
		unit_id = a.unit_data(a).unit_id
	}
	slot5 = a

	if #a.hub_element_data().action_types ~= 0 then
		slot6 = a
		self._hed.actions_data[s].type = a.hub_element_data(slot5).action_types[1]
	end

	slot5 = self

	self.append_actions_sorted(slot4)

	if self._timeline then
		slot6 = a

		self._timeline.add_action(slot4, self._timeline)
	end

	slot9 = a
	slot9 = self._actions_ctrlrs.action_delay

	self.select_action(slot4, self, self.combobox_name(slot7, self), self._actions_ctrlrs.actions, self._actions_ctrlrs.action_types)

	return 
end
function CoreHub:add_trigger(t)
	slot5 = t

	if table.contains(slot3, self._hed.triggers) then
		return 
	end

	table.insert(slot3, self._hed.triggers)

	slot5 = self._unit

	table.insert(slot3, t.hub_element_data(t).hubs)

	slot5 = t
	local s = self.id_string(slot3, self)
	slot7 = t
	self._hed.triggers_data[s] = {
		type = "",
		unit_id = t.unit_data(t).unit_id
	}
	slot5 = t

	if #t.hub_element_data().trigger_types ~= 0 then
		slot6 = t
		self._hed.triggers_data[s].type = t.hub_element_data(slot5).trigger_types[1]
	end

	if self._triggers_ctrlrs.triggers then
		slot5 = self

		self.append_triggers_sorted(slot4)
	end

	slot9 = t
	slot8 = self._triggers_ctrlrs.trigger_types

	self.select_trigger(slot4, self, self.combobox_name(slot7, self), self._triggers_ctrlrs.triggers)

	slot5 = self

	self.set_required_triggers(slot4)

	return 
end
function CoreHub:remove_action(a)
	slot8 = a

	cat_print(slot3, "editor", a.name(slot7))

	slot6 = a
	slot5 = self._unit

	table.delete(slot3, a.hub_element_data("remove_action").hubs)

	slot5 = a

	self.delete_action(slot3, self)

	if self._timeline then
		slot5 = a

		self._timeline.remove_action(slot3, self._timeline)
	end

	return 
end
function CoreHub:delete_action(a)
	slot6 = self._unit
	slot5 = a

	table.delete(slot3, self._unit.hub_element_data(slot5).actions)

	if self._selected_action then
		slot5 = self._selected_action.unit_id

		if self.action_unit(slot3, self) == a then
			self._selected_action = nil
		end
	end

	slot6 = a
	self._hed.actions_data[self.id_string(slot4, self)] = nil
	slot4 = self

	self.set_actions(self.id_string(slot4, self))

	if self._timeline then
		slot5 = a

		self._timeline.remove_action(slot3, self._timeline)
	end

	return 
end
function CoreHub:remove_trigger(t)
	slot8 = t

	cat_print(slot3, "editor", t.name(slot7))

	slot6 = t
	slot5 = self._unit

	table.delete(slot3, t.hub_element_data("remove_trigger").hubs)

	slot5 = t

	self.delete_trigger(slot3, self)

	slot4 = self

	self.set_required_triggers(slot3)

	return 
end
function CoreHub:delete_trigger(t)
	slot6 = self._unit
	slot5 = t

	table.delete(slot3, self._unit.hub_element_data(slot5).triggers)

	if self._selected_trigger then
		slot5 = self._selected_trigger.unit_id

		if self.trigger_unit(slot3, self) == t then
			self._selected_trigger = nil
		end
	end

	slot6 = t
	self._hed.triggers_data[self.id_string(slot4, self)] = nil
	slot4 = self

	self.set_triggers(self.id_string(slot4, self))

	return 
end
function CoreHub:get_hub_action(unit)
	slot6 = unit

	return self._hed.actions_data[self.id_string(slot4, self)]
end
function CoreHub:get_hub_trigger(unit)
	slot6 = unit

	return self._hed.triggers_data[self.id_string(slot4, self)]
end
function CoreHub:on_timeline_btn()
	if not self._timeline then
		slot6 = self._unit
		slot4 = self._unit.unit_data(slot5).name_id
		self._timeline = HubTimeline.new(slot2, HubTimeline)
		slot4 = self._unit

		self._timeline.set_hub_unit(slot2, self._timeline)
	else
		slot4 = true

		self._timeline.set_visible(slot2, self._timeline)
	end

	return 
end
function CoreHub:_build_panel()
	slot3 = self

	self._create_panel(slot2)

	slot7 = "BU_EXACTFIT,NO_BORDER"
	local timeline_btn = EWS.Button(slot2, EWS, self._panel, "Timeline", "")
	slot8 = "TOP,BOTTOM,EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, timeline_btn, 0, 5)

	slot5 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = "on_timeline_btn"

	timeline_btn.connect(EWS, timeline_btn, callback(5, self, self))

	slot7 = ""
	local use_as_start_cb = EWS.CheckBox(EWS, EWS, self._panel, "Start hub")
	slot6 = self._hed.use_as_start

	use_as_start_cb.set_value(EWS, use_as_start_cb)

	slot6 = "Tell the mission that this is the start hub, not the one without triggers."

	use_as_start_cb.set_tool_tip(EWS, use_as_start_cb)

	slot11 = "set_element_data"
	slot8 = {
		value = "use_as_start",
		ctrlr = use_as_start_cb
	}

	use_as_start_cb.connect(EWS, use_as_start_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, self))

	slot8 = ""
	local trigger_once_cb = EWS.CheckBox(EWS, EWS, self._panel, "Trigger Once")
	slot7 = self._hed.trigger_once

	trigger_once_cb.set_value(EWS, trigger_once_cb)

	slot7 = "The hub will only perform actions once."

	trigger_once_cb.set_tool_tip(EWS, trigger_once_cb)

	slot12 = "set_element_data"
	slot9 = {
		value = "trigger_once",
		ctrlr = trigger_once_cb
	}

	trigger_once_cb.connect(EWS, trigger_once_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, self))

	slot9 = ""
	local trigger_on_inverse_cb = EWS.CheckBox(EWS, EWS, self._panel, "Actions On Inverse")
	slot8 = self._hed.trigger_on_inverse

	trigger_on_inverse_cb.set_value(EWS, trigger_on_inverse_cb)

	slot8 = "Will have the hub perform actions when triggers reaches start state again."

	trigger_on_inverse_cb.set_tool_tip(EWS, trigger_on_inverse_cb)

	slot13 = "set_element_data"
	slot10 = {
		value = "trigger_on_inverse",
		ctrlr = trigger_on_inverse_cb
	}

	trigger_on_inverse_cb.connect(EWS, trigger_on_inverse_cb, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, self))

	slot8 = "HORIZONTAL"
	local trigger_cbs_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = "VERTICAL"
	local trigger_cb1_sizer = EWS.BoxSizer(EWS, EWS)
	slot13 = "EXPAND,TOP"

	trigger_cb1_sizer.add(EWS, trigger_cb1_sizer, use_as_start_cb, 0, 5)

	slot13 = "EXPAND,BOTTOM"

	trigger_cb1_sizer.add(EWS, trigger_cb1_sizer, trigger_once_cb, 0, 5)

	slot13 = "EXPAND"

	trigger_cbs_sizer.add(EWS, trigger_cbs_sizer, trigger_cb1_sizer, 1, 0)

	slot15 = "LI_VERTICAL"
	slot13 = "EXPAND,TOP,RIGHT"

	trigger_cbs_sizer.add(EWS, trigger_cbs_sizer, EWS.StaticLine(1, EWS, self._panel, ""), 0, 5)

	slot10 = "VERTICAL"
	local trigger_cb2_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND,TOP"

	trigger_cb2_sizer.add(EWS, trigger_cb2_sizer, trigger_on_inverse_cb, 0, 5)

	slot14 = "EXPAND"

	trigger_cbs_sizer.add(EWS, trigger_cbs_sizer, trigger_cb2_sizer, 1, 0)

	slot14 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, trigger_cbs_sizer, 0, 0)

	local text_prop = 1
	local ctrl_prop = 3
	slot15 = "Actions"
	local actions_sizer = EWS.StaticBoxSizer(trigger_cbs_sizer, EWS, self._panel, "VERTICAL")
	slot14 = "HORIZONTAL"
	local action_sizer = EWS.BoxSizer(EWS, EWS)
	slot21 = ""
	slot18 = "ALIGN_CENTER_VERTICAL"

	action_sizer.add(EWS, action_sizer, EWS.StaticText(slot16, EWS, self._panel, "Action:", 0), text_prop, 0)

	slot18 = "CB_DROPDOWN,CB_READONLY"
	local actions = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot19 = "EXPAND"

	action_sizer.add(EWS, action_sizer, actions, ctrl_prop, 0)

	slot19 = "EXPAND"

	actions_sizer.add(EWS, actions_sizer, action_sizer, 0, 0)

	slot16 = "HORIZONTAL"
	local action_types_sizer = EWS.BoxSizer(EWS, EWS)
	slot23 = ""
	slot20 = "ALIGN_CENTER_VERTICAL"

	action_types_sizer.add(EWS, action_types_sizer, EWS.StaticText(0, EWS, self._panel, "Types:", 0), text_prop, 0)

	slot20 = "CB_DROPDOWN,CB_READONLY"
	local action_types = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot21 = "EXPAND"

	action_types_sizer.add(EWS, action_types_sizer, action_types, ctrl_prop, 0)

	slot23 = "set_action_type"
	slot20 = action_types

	action_types.connect(EWS, action_types, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot21 = "EXPAND"

	actions_sizer.add(EWS, actions_sizer, action_types_sizer, 0, 0)

	slot18 = "HORIZONTAL"
	local action_delay_sizer = EWS.BoxSizer(EWS, EWS)
	slot25 = ""
	slot22 = "ALIGN_CENTER_VERTICAL"

	action_delay_sizer.add(EWS, action_delay_sizer, EWS.StaticText(0, EWS, self._panel, "Delay:", 0), text_prop, 0)

	slot22 = "TE_CENTRE"
	local action_delay = EWS.TextCtrl(EWS, EWS, self._panel, "-", "")
	slot23 = "EXPAND"

	action_delay_sizer.add(EWS, action_delay_sizer, action_delay, ctrl_prop, 0)

	slot25 = "verify_number"

	action_delay.connect(EWS, action_delay, "EVT_CHAR", callback(0, nil, _G))

	slot25 = "set_element_data"

	action_delay.connect(EWS, action_delay, "EVT_COMMAND_TEXT_ENTER", callback(action_delay, self, self))

	slot25 = "set_element_data"
	slot22 = {
		callback = "set_action_delay",
		ctrlr = action_delay
	}

	action_delay.connect(EWS, action_delay, "EVT_KILL_FOCUS", callback({
		callback = "set_action_delay",
		ctrlr = action_delay
	}, self, self))

	slot23 = "EXPAND"

	actions_sizer.add(EWS, actions_sizer, action_delay_sizer, 0, 0)
	self._panel_sizer.add(EWS, self._panel_sizer, actions_sizer, 0, 0)

	self._actions_ctrlrs = {
		actions = actions,
		action_delay = action_delay,
		action_types = action_types
	}
	slot22 = "Triggers"
	local triggers_sizer = EWS.StaticBoxSizer(EWS, EWS, self._panel, "VERTICAL")
	slot21 = "HORIZONTAL"
	local required_trigger_sizer = EWS.BoxSizer(EWS, EWS)
	slot28 = ""
	slot25 = "ALIGN_CENTER_VERTICAL"

	required_trigger_sizer.add(EWS, required_trigger_sizer, EWS.StaticText("EXPAND", EWS, self._panel, "Required:", 0), text_prop, 0)

	slot25 = "CB_DROPDOWN,CB_READONLY"
	self._required_triggers = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot25 = "EXPAND"

	required_trigger_sizer.add(EWS, required_trigger_sizer, self._required_triggers, ctrl_prop, 0)

	slot27 = "set_element_data"
	slot24 = {
		value = "required_triggers",
		ctrlr = self._required_triggers
	}

	self._required_triggers.connect(EWS, self._required_triggers, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot25 = "EXPAND"

	triggers_sizer.add(EWS, triggers_sizer, required_trigger_sizer, 0, 0)

	slot22 = "HORIZONTAL"
	local trigger_sizer = EWS.BoxSizer(EWS, EWS)
	slot29 = ""
	slot26 = "ALIGN_CENTER_VERTICAL"

	trigger_sizer.add(EWS, trigger_sizer, EWS.StaticText(0, EWS, self._panel, "Trigger:", 0), text_prop, 0)

	slot26 = "CB_DROPDOWN,CB_READONLY"
	local triggers = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot27 = "EXPAND"

	trigger_sizer.add(EWS, trigger_sizer, triggers, ctrl_prop, 0)

	slot27 = "EXPAND"

	triggers_sizer.add(EWS, triggers_sizer, trigger_sizer, 0, 0)

	slot24 = "HORIZONTAL"
	local trigger_types_sizer = EWS.BoxSizer(EWS, EWS)
	slot31 = ""
	slot28 = "ALIGN_CENTER_VERTICAL"

	trigger_types_sizer.add(EWS, trigger_types_sizer, EWS.StaticText(0, EWS, self._panel, "Types:", 0), text_prop, 0)

	slot28 = "CB_DROPDOWN,CB_READONLY"
	local trigger_types = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot29 = "EXPAND"

	trigger_types_sizer.add(EWS, trigger_types_sizer, trigger_types, ctrl_prop, 0)

	slot31 = "set_trigger_type"
	slot28 = trigger_types

	trigger_types.connect(EWS, trigger_types, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot29 = "EXPAND"

	triggers_sizer.add(EWS, triggers_sizer, trigger_types_sizer, 0, 0)

	slot29 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, triggers_sizer, 0, 0)

	self._triggers_ctrlrs = {
		triggers = triggers,
		trigger_types = trigger_types
	}
	slot31 = "ews_select_action"

	actions.connect(EWS, actions, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot31 = "ews_select_trigger"
	slot28 = triggers

	triggers.connect(EWS, triggers, "EVT_COMMAND_COMBOBOX_SELECTED", callback(actions, self, self))

	slot25 = self

	self.set_actions(EWS)

	slot25 = self

	self.set_triggers(EWS)

	slot25 = self

	self.set_required_triggers(EWS)

	return 
end
function CoreHub:destroy()
	if self._timeline then
		slot3 = self._timeline

		self._timeline.destroy(slot2)
	end

	slot3 = self

	HubElement.destroy(slot2)

	return 
end

return 
