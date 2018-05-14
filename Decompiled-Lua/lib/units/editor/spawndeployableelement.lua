if not SpawnDeployableUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnDeployableUnitElement = slot0
function SpawnDeployableUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.deployable_id = "none"
	slot5 = "deployable_id"

	table.insert("none", self._save_values)

	return 
end
function SpawnDeployableUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select a deployable_id to be spawned."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "deployable_id", {
		"none",
		"doctor_bag",
		"ammo_bag",
		"grenade_crate",
		"bodybags_bag"
	})

	return 
end

return 
