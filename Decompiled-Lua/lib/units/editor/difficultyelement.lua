if not DifficultyUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DifficultyUnitElement = slot0
function DifficultyUnitElement:init(unit)
	slot5 = unit

	DifficultyUnitElement.super.init(slot3, self)

	self._hed.difficulty = 0
	slot5 = "difficulty"

	table.insert(0, self._save_values)

	return 
end
function DifficultyUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local difficulty_params = {
		name_proportions = 1,
		name = "Difficulty:",
		ctrlr_proportions = 2,
		tooltip = "Set the current difficulty in level",
		min = 0,
		floats = 2,
		max = 1,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.difficulty
	}
	local difficulty = CoreEWS.number_controller(slot5)
	slot13 = "set_element_data"

	difficulty.connect(difficulty_params, difficulty, "EVT_COMMAND_TEXT_ENTER", callback(slot10, self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "difficulty",
		ctrlr = difficulty
	}

	difficulty.connect(difficulty_params, difficulty, "EVT_KILL_FOCUS", callback({
		value = "difficulty",
		ctrlr = difficulty
	}, self, self))

	local help = {
		text = "Set the current difficulty in the level. Affects what enemies will be spawned etc.",
		panel = panel,
		sizer = panel_sizer
	}
	slot9 = help

	self.add_help_text(difficulty, self)

	return 
end

return 
