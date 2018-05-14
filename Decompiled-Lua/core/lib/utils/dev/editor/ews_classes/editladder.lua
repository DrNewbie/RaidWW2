slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditLadder then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditLadder = slot0
function EditLadder:init(editor)
	slot5 = {
		name = "Ladder",
		class = self
	}
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	self._panel = panel
	slot11 = "_update_width"
	slot11 = "_update_width"
	self._width_params = {
		value = 0,
		name = "Width [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the width of the ladder in cm",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(slot8, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(slot8, self, self)
			}
		}
	}
	slot6 = self._width_params

	CoreEws.number_controller()

	slot11 = "_update_height"
	slot11 = "_update_height"
	self._height_params = {
		value = 0,
		name = "Height [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the height of the ladder in cm",
		min = 0,
		floats = 0,
		panel = panel,
		sizer = sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(slot8, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(slot8, self, self)
			}
		}
	}
	slot6 = self._height_params

	CoreEws.number_controller()

	slot6 = panel

	panel.layout()

	slot7 = false

	panel.set_enabled(, panel)

	return 
end
function EditLadder:update(t, dt)
	slot5 = self._selected_units

	for _, unit in ipairs(slot4) do
		slot10 = unit

		if unit.ladder(slot9) then
			slot10 = unit
			slot10 = unit.ladder(slot9)

			unit.ladder(slot9).debug_draw(slot9)
		end
	end

	return 
end
function EditLadder:_update_width(params)
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.ladder(slot8) then
			slot9 = unit
			slot10 = self._width_params.value

			unit.ladder(slot8).set_width(slot8, unit.ladder(slot8))
		end
	end

	return 
end
function EditLadder:_update_height(params)
	slot4 = self._selected_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.ladder(slot8) then
			slot9 = unit
			slot10 = self._height_params.value

			unit.ladder(slot8).set_height(slot8, unit.ladder(slot8))
		end
	end

	return 
end
function EditLadder:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then
		slot5 = unit

		if unit.ladder(slot4) then
			self._reference_unit = unit
			self._selected_units = units
			self._no_event = true
			slot5 = self._width_params
			slot8 = unit
			slot8 = unit.ladder(slot7)

			CoreEws.change_entered_number(slot4, unit.ladder(slot7).width(slot7))

			slot5 = self._height_params
			slot8 = unit
			slot8 = unit.ladder(slot7)

			CoreEws.change_entered_number(slot4, unit.ladder(slot7).height(slot7))

			self._no_event = false

			return true
		end
	end

	self._selected_units = {}

	return false
end

return 
