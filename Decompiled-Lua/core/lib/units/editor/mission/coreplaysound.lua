-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CorePlaySoundUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CorePlaySoundUnitElement = slot0

if not PlaySoundUnitElement then
	slot2 = CorePlaySoundUnitElement
	slot0 = class(slot1)
end

PlaySoundUnitElement = slot0
function PlaySoundUnitElement:init(...)
	slot3 = self

	PlaySoundUnitElement.super.init(slot2, ...)

	return 
end
function CorePlaySoundUnitElement:init(unit)
	slot5 = unit

	CorePlaySoundUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.append_prefix = false
	self._hed.use_instigator = false
	slot5 = "sound_event"

	table.insert(false, self._save_values)

	slot5 = "elements"

	table.insert(false, self._save_values)

	slot5 = "append_prefix"

	table.insert(false, self._save_values)

	slot5 = "use_instigator"

	table.insert(false, self._save_values)

	return 
end
function CorePlaySoundUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function CorePlaySoundUnitElement:update_editing()
	return 
end
function CorePlaySoundUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CorePlaySoundUnitElement:add_element()
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
function CorePlaySoundUnitElement:remove_links(unit)
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
function CorePlaySoundUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CorePlaySoundUnitElement:post_init(...)
	slot3 = self

	CorePlaySoundUnitElement.super.post_init(slot2, ...)

	slot3 = self

	self._add_soundbank(slot2)

	return 
end
function CorePlaySoundUnitElement:test_element()
	if self._hed.sound_event then
		slot4 = false

		managers.editor.set_wanted_mute(slot2, managers.editor)

		slot4 = true

		managers.editor.set_listener_enabled(slot2, managers.editor)

		if self._ss then
			slot3 = self._ss

			self._ss.stop(slot2)
		end

		slot6 = self._unit
		slot4 = self._unit.unit_data(slot5).name_id
		self._ss = SoundDevice.create_source(slot2, SoundDevice)
		slot3 = self._ss
		slot6 = self._unit

		self._ss.set_position(slot2, self._unit.position(slot5))

		slot3 = self._ss
		slot6 = self._unit

		self._ss.set_orientation(slot2, self._unit.rotation(slot5))

		slot4 = self._hed.sound_event

		self._ss.post_event(slot2, self._ss)
	end

	return 
end
function CorePlaySoundUnitElement:stop_test_element()
	slot4 = true

	managers.editor.set_wanted_mute(slot2, managers.editor)

	slot4 = false

	managers.editor.set_listener_enabled(slot2, managers.editor)

	if self._ss then
		slot3 = self._ss

		self._ss.stop(slot2)
	end

	return 
end
function CorePlaySoundUnitElement:set_category(params)
	local value = params.value
	slot5 = self._sound_params
	slot9 = value

	CoreEws.update_combobox_options(slot4, managers.sound_environment.scene_events(slot7, managers.sound_environment))

	slot9 = value
	slot6 = managers.sound_environment.scene_events(slot7, managers.sound_environment)[1]

	CoreEws.change_combobox_value(slot4, self._sound_params)

	self._hed.sound_event = self._sound_params.value
	slot5 = self

	self._add_soundbank(self._sound_params.value)

	return 
end
function CorePlaySoundUnitElement:_add_soundbank()
	slot3 = self

	self.stop_test_element(slot2)

	slot3 = managers.sound_environment
	slot7 = self._hed.sound_event

	managers.sound_environment.add_soundbank(slot2, managers.sound_environment.scene_soundbank(slot5, managers.sound_environment))

	return 
end
function CorePlaySoundUnitElement:set_element_data(params, ...)
	slot5 = params

	CorePlaySoundUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "sound_event" then
		slot4 = self

		self._add_soundbank(slot3)
	end

	return 
end
function CorePlaySoundUnitElement:_build_panel(panel, panel_sizer)
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

	slot6 = managers.sound_environment
	local paths = managers.sound_environment.scene_paths(slot5)

	if #paths <= 0 then
		local help = {
			panel = panel,
			sizer = panel_sizer,
			text = "No scene sounds available in project!"
		}
		slot9 = help

		self.add_help_text(slot7, self)

		return 
	end

	slot5 = self._hed

	if not self._hed.sound_event then
		slot9 = paths[1]
		slot6 = managers.sound_environment.scene_events(slot7, managers.sound_environment)[1]
	end

	slot5.sound_event = slot6
	slot7 = self

	self._add_soundbank(slot6)

	slot8 = self._hed.sound_event
	local path_value = managers.sound_environment.scene_path(slot6, managers.sound_environment)
	slot8 = {
		name = "Category:",
		panel = panel,
		sizer = panel_sizer,
		options = paths,
		value = path_value,
		value_changed_cb = callback(slot10, self, self)
	}
	slot13 = "set_category"
	local _, _ = CoreEws.combobox_and_list(managers.sound_environment)
	slot17 = path_value
	slot15 = "Select a sound event"
	local _, sound_params = self._build_value_combobox(callback(slot10, self, self), self, panel, panel_sizer, "sound_event", managers.sound_environment.scene_events(slot15, managers.sound_environment))
	self._sound_params = sound_params
	slot16 = "Append unit prefix"

	self._build_value_checkbox(panel, self, panel, panel_sizer, "append_prefix")

	slot16 = "Play on instigator"

	self._build_value_checkbox(panel, self, panel, panel_sizer, "use_instigator")

	return 
end
function CorePlaySoundUnitElement:add_to_mission_package()
	slot4 = {
		category = "soundbanks",
		name = managers.sound_environment.scene_soundbank(slot6, managers.sound_environment)
	}
	slot8 = self._hed.sound_event

	managers.editor.add_to_sound_package(slot2, managers.editor)

	return 
end
function CorePlaySoundUnitElement:destroy()
	slot3 = self

	self.stop_test_element(slot2)

	slot3 = self

	CorePlaySoundUnitElement.super.destroy(slot2)

	return 
end

return 
