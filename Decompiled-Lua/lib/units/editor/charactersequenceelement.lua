-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not SequenceCharacterElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CharacterSequenceElement = slot0
CharacterSequenceElement.SAVE_UNIT_POSITION = false
CharacterSequenceElement.SAVE_UNIT_ROTATION = false
function CharacterSequenceElement:init(unit)
	slot5 = unit

	CharacterSequenceElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.sequence = ""
	slot5 = "use_instigator"

	table.insert("", self._save_values)

	slot5 = "elements"

	table.insert("", self._save_values)

	slot5 = "sequence"

	table.insert("", self._save_values)

	return 
end
function CharacterSequenceElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_spawn_enemy",
		"ai_spawn_civilian"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot9 = "use_instigator"

	self._build_value_checkbox(slot5, self, panel, panel_sizer)

	local text = EWS.TextCtrl(slot5, EWS, panel, self._hed.sequence, "")
	slot13 = "set_element_data"

	text.connect(EWS, text, "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "sequence",
		ctrlr = text
	}

	text.connect(EWS, text, "EVT_KILL_FOCUS", callback({
		value = "sequence",
		ctrlr = text
	}, self, self))

	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text, 0, 0)

	return 
end
function CharacterSequenceElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CharacterSequenceElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0,
				r = 0,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CharacterSequenceElement:remove_links(unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function CharacterSequenceElement:on_lmb()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true
	end

	return 
end
function CharacterSequenceElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "on_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CharacterSequenceElement:update_editing()
	return 
end

return 
