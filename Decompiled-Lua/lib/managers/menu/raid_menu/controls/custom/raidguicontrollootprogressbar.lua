if not RaidGUIControlLootProgressBar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLootProgressBar = slot0
RaidGUIControlLootProgressBar.DEFAULT_W = 1600
RaidGUIControlLootProgressBar.DEFAULT_H = 384
RaidGUIControlLootProgressBar.PROGRESS_BAR_H = 32
function RaidGUIControlLootProgressBar:init(parent, params)
	slot7 = params

	RaidGUIControlLootProgressBar.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlLootProgressBar:init] Parameters not specified for the loot progress bar " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	self._total_points = params.total_points
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_progress_bar(slot4)

	slot5 = self

	self._create_brackets(slot4)

	self._progress = params.initial_progress or 0
	slot6 = self._progress

	self.set_progress(slot4, self)

	return 
end
function RaidGUIControlLootProgressBar:close()
	return 
end
function RaidGUIControlLootProgressBar:_create_panel()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_panel") + 1
	control_params.w = self._params.w or RaidGUIControlLootProgressBar.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlLootProgressBar.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlLootProgressBar:_create_progress_bar()
	local progress_bar_params = {
		name = "progress_bar",
		y = 0,
		x = RaidGUIControlLootBracket.DEFAULT_W / 2
	}
	slot4 = self._object
	progress_bar_params.w = self._object.w(slot3) - RaidGUIControlLootBracket.DEFAULT_W
	progress_bar_params.h = RaidGUIControlLootProgressBar.PROGRESS_BAR_H
	slot4 = self._object
	progress_bar_params.layer = self._object.layer(RaidGUIControlLootBracket.DEFAULT_W) + 1
	slot5 = progress_bar_params
	self._progress_bar = self._object.progress_bar_simple(RaidGUIControlLootBracket.DEFAULT_W, self._object)
	slot8 = self._progress_bar
	slot5 = self._object.h(slot6) - self._progress_bar.h(self._object)

	self._progress_bar.set_y(RaidGUIControlLootBracket.DEFAULT_W, self._progress_bar)

	return 
end
function RaidGUIControlLootProgressBar:_create_brackets()
	self._brackets = {}
	local brackets = self._params.brackets
	slot4 = brackets

	for index, bracket in pairs(slot3) do
		local bracket_params = {
			y = 0,
			x = 0
		}
		slot11 = bracket.tier
		slot9 = utf8.to_upper(slot10)
		bracket_params.bracket = RaidGUIControlLootBracket[slot9]
		slot10 = self._object
		bracket_params.h = self._object.h(slot9)
		slot10 = self._object
		bracket_params.layer = self._object.layer(slot9) + 50
		slot12 = bracket_params
		local bracket_control = self._object.create_custom_control(slot9, self._object, RaidGUIControlLootBracket)
		slot13 = 1
		local bracket_progress = math.clamp(self._object, bracket.points_needed / self._total_points, 0)
		slot16 = self._progress_bar
		slot13 = self._progress_bar.x(slot14) + self._progress_bar.w(self._progress_bar) * bracket_progress

		bracket_control.set_center_x(bracket.points_needed / self._total_points, bracket_control)

		local new_bracket = {
			active = false,
			control = bracket_control,
			progress = bracket_progress
		}
		slot14 = new_bracket

		table.insert(bracket_control, self._brackets)
	end

	return 
end
function RaidGUIControlLootProgressBar:set_progress(progress)
	slot5 = progress

	self._progress_bar.set_progress(slot3, self._progress_bar)

	slot4 = self._brackets

	for index, bracket in pairs(slot3) do
		if bracket.progress <= progress and not bracket.active then
			slot9 = bracket.control

			bracket.control.activate(slot8)

			bracket.active = true

			if 1 < index then
				slot9 = self._brackets[index - 1].control

				self._brackets[index - 1].control.deactivate(index - 1)
			end
		end
	end

	return 
end
function RaidGUIControlLootProgressBar:hide()
	slot4 = 0

	self._object.set_alpha(slot2, self._object)

	return 
end
function RaidGUIControlLootProgressBar:fade_in()
	slot3 = self._object
	slot3 = self._object.get_engine_panel(slot2)
	slot8 = "_animate_fade_in"

	self._object.get_engine_panel(slot2).animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlLootProgressBar:_animate_fade_in()
	local duration = 0.3
	slot4 = self._object
	local t = self._object.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)
	end

	slot6 = 1

	self._object.set_alpha(slot4, self._object)

	return 
end

return 
