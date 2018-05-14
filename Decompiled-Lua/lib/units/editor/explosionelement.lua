if not ExplosionUnitElement then
	slot2 = FeedbackUnitElement
	slot0 = class(slot1)
end

ExplosionUnitElement = slot0
function ExplosionUnitElement:init(unit)
	slot5 = unit

	ExplosionUnitElement.super.init(slot3, self)

	self._hed.damage = 40
	self._hed.player_damage = 10
	self._hed.explosion_effect = "effects/vanilla/explosions/exp_projectile_001"
	self._hed.no_raycast_check_characters = nil
	self._hed.sound_event = "trip_mine_explode"
	slot5 = "damage"

	table.insert("trip_mine_explode", self._save_values)

	slot5 = "player_damage"

	table.insert("trip_mine_explode", self._save_values)

	slot5 = "explosion_effect"

	table.insert("trip_mine_explode", self._save_values)

	slot5 = "no_raycast_check_characters"

	table.insert("trip_mine_explode", self._save_values)

	slot5 = "sound_event"

	table.insert("trip_mine_explode", self._save_values)

	return 
end
function ExplosionUnitElement:update_selected(...)
	slot3 = self

	ExplosionUnitElement.super.update_selected(slot2, ...)

	return 
end
function ExplosionUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "The damage done to beings and props from the explosion"

	self._build_value_number(slot4, self, panel, panel_sizer, "damage", {
		floats = 0,
		min = 0
	})
	self._build_value_number(slot4, self, panel, panel_sizer, "player_damage", {
		floats = 0,
		min = 0
	})

	slot11 = {
		"none"
	}
	slot14 = self
	slot10 = "Select and explosion effect"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "explosion_effect", table.list_add("The player damage from the explosion", self._effect_options(slot13)))

	slot9 = {
		"no_sound",
		"trip_mine_explode"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "sound_event")

	slot9 = "No raycast check against characters"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "no_raycast_check_characters")

	slot7 = panel_sizer

	ExplosionUnitElement.super._build_panel(slot4, self, panel)

	return 
end
function ExplosionUnitElement:add_to_mission_package()
	slot3 = self

	ExplosionUnitElement.super.add_to_mission_package(slot2)

	if self._hed.explosion_effect ~= "none" then
		slot4 = {
			category = "effects",
			name = self._hed.explosion_effect,
			continent = self._unit.unit_data(slot6).continent
		}
		slot7 = self._unit

		managers.editor.add_to_world_package(slot2, managers.editor)
	end

	return 
end

return 
