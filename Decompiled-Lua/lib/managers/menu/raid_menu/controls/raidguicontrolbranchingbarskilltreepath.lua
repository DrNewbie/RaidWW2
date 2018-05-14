if not RaidGUIControlBranchingBarSkilltreePath then
	slot2 = RaidGUIControlBranchingBarPath
	slot0 = class(slot1)
end

RaidGUIControlBranchingBarSkilltreePath = slot0
slot4 = 0
RaidGUIControlBranchingBarSkilltreePath.COLOR_ACTIVE = Color.white.with_alpha(slot2, Color.white)
slot4 = 0
RaidGUIControlBranchingBarSkilltreePath.COLOR_FILL = tweak_data.gui.colors.raid_red.with_alpha(slot2, tweak_data.gui.colors.raid_red)
slot4 = 0
RaidGUIControlBranchingBarSkilltreePath.COLOR_LOCKED = tweak_data.gui.colors.raid_red.with_alpha(slot2, tweak_data.gui.colors.raid_red)
slot5 = 0.34509803921568627
slot4 = 0
RaidGUIControlBranchingBarSkilltreePath.COLOR_DISABLED = Color(slot2, 0.34509803921568627, 0.34509803921568627).with_alpha(slot2, Color(slot2, 0.34509803921568627, 0.34509803921568627))
function RaidGUIControlBranchingBarSkilltreePath:init(parent, params)
	slot7 = params

	RaidGUIControlBranchingBarSkilltreePath.super.init(slot4, self, parent)

	local line_width = params.line_width or 3

	if not params.layer then
		slot6 = self._panel
		local layer = self._panel.layer(slot5) + 1
	end

	slot8 = {
		self.COLOR_ACTIVE,
		line_width = line_width,
		layer = layer
	}
	self._line = self._panel.polyline(slot6, self._panel)
	slot8 = {
		line_width = line_width,
		color = self.COLOR_FILL,
		layer = layer + 1
	}
	self._active_line = self._panel.polyline(slot6, self._panel)
	local points = {}
	slot9 = self._starting_point

	table.insert(self._panel, points)

	slot9 = points

	self._active_line.set_points(self._panel, self._active_line)

	slot9 = self._ending_point

	table.insert(self._panel, points)

	slot9 = points

	self._line.set_points(self._panel, self._line)

	slot8 = self

	self._init_state_data(self._panel)

	if self._state ~= self.STATE_ACTIVE then
		slot9 = self._state

		self.init_to_state(slot7, self)
	end

	self._object = self._line

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:_init_state_data()
	self._state_data = {
		STATE_ACTIVE = {}
	}
	self._state_data.STATE_ACTIVE.line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_ACTIVE
	self._state_data.STATE_ACTIVE.active_line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_ACTIVE
	self._state_data.STATE_FULL = {
		line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_FILL,
		line_points = {
			self._starting_point,
			self._ending_point
		},
		active_line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_FILL,
		active_line_points = {
			self._starting_point
		}
	}
	self._state_data.STATE_LOCKED = {
		line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_LOCKED,
		line_points = {
			self._starting_point,
			self._ending_point
		},
		active_line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_LOCKED,
		active_line_points = {
			self._starting_point
		}
	}
	self._state_data.STATE_DISABLED = {
		line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_DISABLED,
		line_points = {
			self._starting_point,
			self._ending_point
		},
		active_line_color = RaidGUIControlBranchingBarSkilltreePath.COLOR_DISABLED,
		active_line_points = {
			self._starting_point
		}
	}

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:set_active()
	self._state = self.STATE_ACTIVE
	slot4 = self._state

	self.init_to_state(slot2, self)

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:set_locked()
	self._state = self.STATE_LOCKED
	slot4 = self._state

	self.init_to_state(slot2, self)

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:set_full()
	self._state = self.STATE_FULL
	slot4 = self._state

	self.init_to_state(slot2, self)

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:set_disabled()
	self._state = self.STATE_DISABLED
	slot4 = self._state

	self.init_to_state(slot2, self)

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:set_progress(progress)
	slot5 = progress

	RaidGUIControlBranchingBarSkilltreePath.super.set_progress(slot3, self)

	local points = {}

	table.insert(self, points)

	slot9 = progress
	slot5 = math.lerp(self._starting_point, self._starting_point.x, self._ending_point.x)
	slot10 = progress
	slot7 = 0
	local second_point = Vector3(self, slot5, math.lerp(self._starting_point.x, self._starting_point.y, self._ending_point.y))
	slot7 = second_point

	table.insert(slot5, points)

	slot7 = points

	self._active_line.set_points(slot5, self._active_line)

	return 
end
function RaidGUIControlBranchingBarSkilltreePath:init_to_state(state)
	local state_data = self._state_data[state]
	slot6 = state_data.line_color

	self._line.set_color(slot4, self._line)

	slot6 = state_data.active_line_color

	self._active_line.set_color(slot4, self._active_line)

	if state_data.line_points then
		slot6 = state_data.line_points

		self._line.set_points(slot4, self._line)
	end

	if state_data.active_line_points then
		slot6 = state_data.active_line_points

		self._active_line.set_points(slot4, self._active_line)
	end

	return 
end

return 
