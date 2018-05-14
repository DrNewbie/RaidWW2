if not EnableSoundEnvironmentElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EnableSoundEnvironmentElement = slot0
function EnableSoundEnvironmentElement:init(unit)
	slot5 = unit

	EnableSoundEnvironmentElement.super.init(slot3, self)

	self._hed.enable = true
	self._hed.elements = {}
	slot5 = "enable"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function EnableSoundEnvironmentElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot9))

	slot12 = "add_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)
	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	slot8 = ""
	local enable_sound_env = EWS.CheckBox(slot4, EWS, panel, "Enable")
	slot7 = self._hed.enable

	enable_sound_env.set_value(EWS, enable_sound_env)

	slot12 = "set_element_data"
	slot9 = {
		value = "enable",
		ctrlr = enable_sound_env
	}

	enable_sound_env.connect(EWS, enable_sound_env, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,LEFT", self, self))

	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, enable_sound_env, 0, 0)

	return 
end
function EnableSoundEnvironmentElement:update_editing()
	return 
end
function EnableSoundEnvironmentElement:update_selected(t, dt)
	slot7 = managers.sound_environment

	for _, area in ipairs(managers.sound_environment.areas(slot6)) do
		slot10 = self._hed.elements

		for _, name in ipairs(slot9) do
			slot15 = area

			if area.name(slot14) == name then
				slot16 = {
					g = 0.5,
					b = 1,
					r = 0.9,
					from_unit = self._unit,
					to_unit = area.unit(slot18)
				}
				slot19 = area

				self._draw_link(slot14, self)
			end
		end
	end

	return 
end
function EnableSoundEnvironmentElement:update_unselected()
	slot3 = self._hed.elements

	for _, name in ipairs(slot2) do
		slot10 = managers.sound_environment

		for _, area in ipairs(managers.sound_environment.areas(slot9)) do
			slot13 = area

			if area.name(slot12) == name then
				slot15 = area

				if not alive(area.unit(slot14)) then
					slot14 = name

					self._add_or_remove_graph(slot12, self)
				end
			end
		end
	end

	return 
end
function EnableSoundEnvironmentElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "core/units/sound_environment/sound_environment", 1) then
			slot6 = managers.sound_environment

			for _, area in ipairs(managers.sound_environment.areas(slot5)) do
				slot9 = area
				slot10 = ray.unit

				if area.unit(slot8).key(slot8) == ray.unit.key(area.unit(slot8)) then
					slot9 = self
					slot12 = area

					self._add_or_remove_graph(slot8, area.name(slot11))

					return 
				end
			end
		end
	end

	return 
end
function EnableSoundEnvironmentElement:remove_links(unit)
	slot6 = managers.sound_environment

	for _, area in ipairs(managers.sound_environment.areas(slot5)) do
		slot9 = area
		slot10 = unit

		if area.unit(slot8).key(slot8) == unit.key(area.unit(slot8)) then
			slot9 = self._hed.elements

			for _, name in ipairs(slot8) do
				slot14 = area

				if name == area.name(slot13) then
					slot15 = name

					table.delete(slot13, self._hed.elements)
				end
			end
		end
	end

	return 
end
function EnableSoundEnvironmentElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function EnableSoundEnvironmentElement:add_unit_list_btn()
	local function f(unit)
		slot4 = "sound"

		return unit.type(slot2) == Idstring(unit)
	end

	slot6 = f
	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add Trigger Unit")
	slot6 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(SelectUnitByNameModal, managers.editor)
	slot8 = dialog

	for _, unit in ipairs(dialog.selected_units(slot7)) do
		slot13 = managers.sound_environment

		for _, area in ipairs(managers.sound_environment.areas(slot12)) do
			slot16 = area
			slot17 = unit

			if area.unit(slot15).key(slot15) == unit.key(area.unit(slot15)) then
				slot16 = self
				slot19 = area

				self._add_or_remove_graph(slot15, area.name(slot18))

				return 
			end
		end
	end

	return 
end
function EnableSoundEnvironmentElement:_add_or_remove_graph(id)
	slot5 = id

	if table.contains(slot3, self._hed.elements) then
		slot5 = id

		table.delete(slot3, self._hed.elements)
	else
		slot5 = id

		table.insert(slot3, self._hed.elements)
	end

	return 
end

return 
