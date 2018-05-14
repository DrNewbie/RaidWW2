if not CoreSpawnUnitUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreSpawnUnitUnitElement = slot0

if not SpawnUnitUnitElement then
	slot2 = CoreSpawnUnitUnitElement
	slot0 = class(slot1)
end

SpawnUnitUnitElement = slot0
function SpawnUnitUnitElement:init(...)
	slot3 = self

	CoreSpawnUnitUnitElement.init(slot2, ...)

	return 
end
function CoreSpawnUnitUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.unit_name = "none"
	self._hed.unit_spawn_velocity = 0
	self._hed.unit_spawn_mass = 0
	slot7 = 1
	slot3 = Vector3(self, 0, 0)
	self._hed.unit_spawn_dir = slot3
	slot5 = "unit_name"

	table.insert(slot3, self._save_values)

	slot5 = "unit_spawn_velocity"

	table.insert(slot3, self._save_values)

	slot5 = "unit_spawn_mass"

	table.insert(slot3, self._save_values)

	slot5 = "unit_spawn_dir"

	table.insert(slot3, self._save_values)

	self._test_units = {}

	return 
end
function CoreSpawnUnitUnitElement:test_element()
	if self._hed.unit_name ~= "none" then
		slot4 = self._unit.position(slot5)
		slot7 = self._unit
		local unit = safe_spawn_unit(slot2, self._hed.unit_name, self._unit.rotation(self._unit))
		slot5 = unit

		table.insert(self._hed.unit_name, self._test_units)

		slot6 = self._hed.unit_spawn_dir * self._hed.unit_spawn_velocity

		unit.push(self._hed.unit_name, unit, self._hed.unit_spawn_mass)
	end

	return 
end
function CoreSpawnUnitUnitElement:stop_test_element()
	slot3 = self._test_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = unit

			World.delete_unit(slot7, World)
		end
	end

	self._test_units = {}

	return 
end
function CoreSpawnUnitUnitElement:update_selected(time, rel_time)
	slot9 = self._unit
	slot10 = 0.75

	Application.draw_arrow(slot4, Application, self._unit.position(slot7), self._unit.position(self._unit) + self._hed.unit_spawn_dir * 400, 0.75, 0.75)

	return 
end
function CoreSpawnUnitUnitElement:update_editing(time, rel_time)
	slot5 = Input
	local kb = Input.keyboard(slot4)
	local speed = 60 * rel_time
	slot7 = kb
	slot10 = "left"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.unit_spawn_dir
		slot13 = 0
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir.rotate_with(slot7, Rotation(slot10, speed, 0))
	end

	slot7 = kb
	slot10 = "right"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.unit_spawn_dir
		slot13 = 0
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir.rotate_with(slot7, Rotation(slot10, -speed, 0))
	end

	slot7 = kb
	slot10 = "up"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.unit_spawn_dir
		slot13 = speed
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = kb
	slot10 = "down"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.unit_spawn_dir
		slot13 = -speed
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = self._unit
	local from = self._unit.position(slot6)
	local to = from + self._hed.unit_spawn_dir * 100000
	slot10 = {
		from = from,
		to = to,
		mask = managers.slot.get_mask(slot12, managers.slot)
	}
	slot14 = "statics_layer"
	local ray = managers.editor.unit_by_raycast(slot8, managers.editor)

	if ray and ray.unit then
		slot15 = 0

		Application.draw_sphere(slot9, Application, ray.position, 25, 1, 0)
	end

	return 
end
function CoreSpawnUnitUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local unit_options = {
		"none"
	}
	slot8 = managers.editor
	slot8 = managers.editor.layers(slot7).Dynamics

	for name, _ in pairs(managers.editor.layers(slot7).Dynamics.get_unit_map(slot7)) do
		slot11 = unit_options
		slot15 = name

		table.insert(slot10, managers.editor.get_real_name(slot13, managers.editor))
	end

	slot11 = "Select a unit from the combobox"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "unit_name", unit_options)

	slot12 = "Velocity"

	self._build_value_number(slot5, self, panel, panel_sizer, "unit_spawn_velocity", {
		floats = 0,
		min = 0
	}, "Use this to add a velocity to a physic push on the spawned unit(will need mass as well)")

	slot12 = "Mass"

	self._build_value_number(slot5, self, panel, panel_sizer, "unit_spawn_mass", {
		floats = 0,
		min = 0
	}, "Use this to add a mass to a physic push on the spawned unit(will need velocity as well)")

	slot7 = [[
Select a unit to be spawned in the unit combobox.

Add velocity and mass if you want to give the spawned unit a push as if it was hit by an object of mass mass, traveling at a velocity of velocity relative to the unit (both values are required to give the push)

Body slam (80 kg, 10 m/s)
Fist punch (8 kg, 10 m/s)
Bullet hit (10 g, 900 m/s)]]

	self._add_help_text(slot5, self)

	return 
end
function CoreSpawnUnitUnitElement:add_to_mission_package()
	slot4 = {
		category = "units",
		name = self._hed.unit_name,
		continent = self._unit.unit_data(slot6).continent
	}
	slot7 = self._unit

	managers.editor.add_to_world_package(slot2, managers.editor)

	return 
end

return 
