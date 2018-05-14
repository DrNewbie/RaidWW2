if not SpawnGrenadeUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnGrenadeUnitElement = slot0
function SpawnGrenadeUnitElement:init(unit)
	slot5 = unit

	SpawnGrenadeUnitElement.super.init(slot3, self)

	self._hed.grenade_type = "m24"
	slot7 = 1
	self._hed.spawn_dir = Vector3(self, 0, 0)
	self._hed.strength = 1
	slot5 = "grenade_type"

	table.insert(1, self._save_values)

	slot5 = "spawn_dir"

	table.insert(1, self._save_values)

	slot5 = "strength"

	table.insert(1, self._save_values)

	return 
end
function SpawnGrenadeUnitElement:test_element()
	if self._hed.grenade_type == "m24" then
		slot6 = self._unit
		slot5 = self._hed.spawn_dir * self._hed.strength

		ProjectileBase.throw_projectile(slot2, 1, self._unit.position(slot5))
	end

	return 
end
function SpawnGrenadeUnitElement:update_selected(time, rel_time)
	slot9 = self._unit
	slot11 = 0.075

	Application.draw_arrow(slot4, Application, self._unit.position(slot7), self._unit.position(self._unit) + self._hed.spawn_dir * 35, 0.75, 0.75, 0.75)

	return 
end
function SpawnGrenadeUnitElement:update_editing(time, rel_time)
	slot5 = Input
	local kb = Input.keyboard(slot4)
	local speed = 60 * rel_time
	slot7 = kb
	slot10 = "left"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = 0
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, speed, 0))
	end

	slot7 = kb
	slot10 = "right"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = 0
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, -speed, 0))
	end

	slot7 = kb
	slot10 = "up"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = speed
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = kb
	slot10 = "down"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = -speed
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = self._unit
	local from = self._unit.position(slot6)
	local to = from + self._hed.spawn_dir * 100000
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
function SpawnGrenadeUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = tweak_data.projectiles
	slot10 = "Select what type of grenade will be spawned."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "grenade_type", table.map_keys(slot10))

	slot10 = "Use this to add a strength to a physic push on the spawned grenade"

	self._build_value_number(slot4, self, panel, panel_sizer, "strength", {
		floats = 1
	})

	slot6 = "Spawns a grenade."

	self._add_help_text(slot4, self)

	return 
end

return 
