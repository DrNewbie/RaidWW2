-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
TrackBehaviour = TrackBehaviour or class()

if not EditableTrackBehaviour then
	slot2 = TrackBehaviour
	slot0 = class(slot1)
end

EditableTrackBehaviour = slot0

if not ClipDragTrackBehaviour then
	slot2 = TrackBehaviour
	slot0 = class(slot1)
end

ClipDragTrackBehaviour = slot0

if not MovePlayheadTrackBehaviour then
	slot2 = TrackBehaviour
	slot0 = class(slot1)
end

MovePlayheadTrackBehaviour = slot0

if not BoxSelectionTrackBehaviour then
	slot2 = TrackBehaviour
	slot0 = class(slot1)
end

BoxSelectionTrackBehaviour = slot0
function TrackBehaviour:init()
	self._default_behaviour = self

	return 
end
function TrackBehaviour:set_delegate(track_behaviour_delegate)
	self._delegate = track_behaviour_delegate

	return self
end
function TrackBehaviour:set_default_behaviour(behaviour)
	self._default_behaviour = behaviour

	return self
end
function TrackBehaviour:populate_from(behaviour)
	self._default_behaviour = behaviour._default_behaviour
	self._delegate = behaviour._delegate

	return self
end
function TrackBehaviour:change_behaviour(new_behaviour)
	slot5 = "change_track_behaviour"
	slot9 = self

	self._invoke_on_delegate(slot3, self, new_behaviour.populate_from(slot7, new_behaviour))

	return self
end
function TrackBehaviour:restore_default_behaviour()
	slot4 = self._default_behaviour

	self.change_behaviour(slot2, self)

	return self
end
function TrackBehaviour:_delegate_supports(method_name)
	if self._delegate then
		slot4 = self._delegate[method_name]

		return type(slot3) == "function"
	end
end
function TrackBehaviour:_invoke_on_delegate(method_name, ...)
	if self._delegate == nil then
		slot4 = "Failed to call required delegate method \"" .. method_name .. "\" - no delegate object has been assigned"

		error(slot3)
	else
		local func = self._delegate[method_name]
		slot5 = func

		if type(slot4) == "function" then
			slot5 = self._delegate

			return func(slot4, ...)
		else
			slot5 = "Failed to call required delegate method \"" .. method_name .. "\" - method not defined"

			error(slot4)
		end
	end

	return 
end
EditableTrackBehaviour.CLIP_EDGE_HANDLE_WIDTH = 6
function EditableTrackBehaviour:init()
	slot3 = self

	self.super.init(slot2)

	return 
end
function EditableTrackBehaviour:on_mouse_motion(sender, track, event)
	if sender.clips and sender == track then
		slot7 = event
		local clip_below_cursor = sender.clip_at_event(slot5, sender)

		if clip_below_cursor then
			slot8 = clip_below_cursor
			slot12 = sender
			local drag_mode = self._drag_mode(slot6, self, event.get_position(slot10, event))

			if drag_mode == "LEFT_EDGE" or drag_mode == "RIGHT_EDGE" then
				slot9 = "SIZEWE"

				return EWS.set_cursor(slot7, EWS)
			end
		end

		slot8 = nil

		EWS.set_cursor(slot6, EWS)
	end

	return 
end
function EditableTrackBehaviour:on_mouse_left_down(sender, track, event)
	if not sender.clips then
		slot6 = self
		slot9 = MovePlayheadTrackBehaviour

		self.change_behaviour(slot5, MovePlayheadTrackBehaviour.new(slot8))
	elseif sender == track then
		slot7 = event
		local item_below_cursor = sender.clip_at_event(slot5, sender)

		if item_below_cursor then
			slot7 = item_below_cursor

			if item_below_cursor.selected(slot6) then
				slot7 = event

				if event.control_down(slot6) then
					slot9 = false

					self._set_item_selected(slot6, self, item_below_cursor)
				end
			else
				slot7 = event

				if not event.control_down(slot6) then
					slot8 = "deselect_all_items"

					self._invoke_on_delegate(slot6, self)
				end

				slot9 = true

				self._set_item_selected(slot6, self, item_below_cursor)
			end

			slot7 = item_below_cursor

			if item_below_cursor.selected(slot6) then
				slot8 = item_below_cursor
				slot12 = sender
				local drag_mode = self._drag_mode(slot6, self, event.get_position(slot10, event))
				slot9 = "_signal_drag"

				if self._delegate_supports(self, self) then
					slot11 = drag_mode

					self._invoke_on_delegate(slot7, self, "_signal_drag", item_below_cursor)
				end

				slot8 = self
				slot16 = sender
				slot14 = drag_mode

				self.change_behaviour(slot7, ClipDragTrackBehaviour.new(slot10, ClipDragTrackBehaviour, item_below_cursor, event.get_position(slot14, event)))
			end
		else
			slot7 = event

			if not event.control_down(slot6) then
				slot8 = "deselect_all_items"

				self._invoke_on_delegate(slot6, self)
			end

			self._invoke_on_delegate(slot6, self, "_on_start_box_selection")

			slot7 = self
			slot10 = BoxSelectionTrackBehaviour

			self.change_behaviour(slot6, BoxSelectionTrackBehaviour.new(event))
		end
	end

	slot6 = event

	event.skip(slot5)

	return 
end
function EditableTrackBehaviour:_set_item_selected(item, selected)
	slot6 = "set_item_selected"

	if self._delegate_supports(slot4, self) then
		slot8 = selected

		self._invoke_on_delegate(slot4, self, "set_item_selected", item)
	else
		slot6 = selected

		item.set_selected(slot4, item)
	end

	return 
end
function EditableTrackBehaviour:_drag_mode(clip, position)
	slot8 = -EditableTrackBehaviour.CLIP_EDGE_HANDLE_WIDTH

	if clip.point_is_near_edge(slot4, clip, position, "LEFT_EDGE") then
		return "LEFT_EDGE"
	else
		slot8 = -EditableTrackBehaviour.CLIP_EDGE_HANDLE_WIDTH

		if clip.point_is_near_edge(slot4, clip, position, "RIGHT_EDGE") then
			return "RIGHT_EDGE"
		else
			return "CLIP"
		end
	end

	return 
end
ClipDragTrackBehaviour.SNAP_RADIUS = 10
function ClipDragTrackBehaviour:init(clip, drag_start, mode)
	slot6 = self

	self.super.init(slot5)

	self._clip = clip
	slot6 = self._clip
	self._clip_initial_start_time = self._clip.start_time(slot5)
	slot6 = self._clip
	self._clip_initial_end_time = self._clip.end_time(slot5)
	self._mode = mode or "CLIP"
	self._drag_start = drag_start
	self._previous_mouse_position = self._drag_start
	self._snapped_edge = "LEFT"

	if self._mode == "RIGHT_EDGE" then
		self._snapped_edge = "RIGHT"
	end

	return 
end
function ClipDragTrackBehaviour:on_mouse_motion(sender, track, event)

	-- Decompilation error in this vicinity:
	slot6 = self
	slot10 = sender

	self._determine_snapped_edge(slot5, event.get_position(slot8, event))

	slot8 = event
	local time_displacement = self._time_displacement(slot5, self, sender)
	slot5 = ipairs
	slot8 = sender
	self._previous_mouse_position = event.get_position(slot6, event)
	slot7 = event

	event.skip(slot6)

	return 
end
function ClipDragTrackBehaviour:on_mouse_left_up(sender, track, event)

	-- Decompilation error in this vicinity:
	slot4 = ipairs
	slot6 = self

	self.restore_default_behaviour(slot5)

	slot6 = event

	event.skip(slot5)

	return 
end
function ClipDragTrackBehaviour:_determine_snapped_edge(position)
	if self._mode == "CLIP" then
		local drag_delta_x = position.x - self._previous_mouse_position.x

		if 0 < drag_delta_x then
			self._snapped_edge = "RIGHT"
		elseif drag_delta_x < 0 then
			self._snapped_edge = "LEFT"
		end
	end

	return 
end
function ClipDragTrackBehaviour:_time_displacement(track, event)
	slot9 = track
	slot6 = event.get_position(slot7, event).x - self._drag_start.x
	local time_displacement = track.pixels_to_units(slot4, track)
	slot6 = event

	if event.shift_down(track) then
		return time_displacement
	else
		slot7 = "playhead_position"
	end

	return 
end
function ClipDragTrackBehaviour:_snap_to_time(time)
	slot4 = self

	return time - self._dragged_clip_edge_time(slot3)
end
function ClipDragTrackBehaviour:_snap_to_grid(track, time_displacement)
	local unsnapped_time = self._dragged_clip_edge_time(slot4) + time_displacement
	slot6 = self
	slot10 = unsnapped_time

	return self._snap_to_time(self, self._closest_grid_line_time(slot8, self))
end
function ClipDragTrackBehaviour:_closest_grid_line_time(time)
	slot4 = 0
	slot8 = 100

	return math.max(slot3, math.round(slot6, time))
end
function ClipDragTrackBehaviour:_dragged_clip_edge_time()
	if self._snapped_edge == "LEFT" then
		return self._clip_initial_start_time
	elseif self._snapped_edge == "RIGHT" then
		return self._clip_initial_end_time
	end

	return 
end
function ClipDragTrackBehaviour:_snap_to_clips(track, time_displacement)
	if not track.clips then
		return nil
	end

	local closest_snapped_displacement = nil

	local function update_closest_snapped_displacement(initial_time, displacement, clip_edge)
		local unsnapped_time = initial_time + displacement
		local snapped_displacement = clip_edge - initial_time

		if closest_snapped_displacement == nil then
			closest_snapped_displacement = snapped_displacement
		else
			local snapped_time = initial_time + snapped_displacement
			slot8 = snapped_time - unsnapped_time
			local snapped_displacement_diff = math.abs(slot7)
			local closest_snapped_time = initial_time + closest_snapped_displacement
			slot10 = closest_snapped_time - unsnapped_time
			local closest_snapped_displacement_diff = math.abs(slot9)

			if snapped_displacement_diff < closest_snapped_displacement_diff then
				closest_snapped_displacement = snapped_displacement
			end
		end

		return 
	end

	slot9 = track

	for _, clip in ipairs(track.clips(slot8)) do
		slot12 = clip

		if not clip.selected(slot11) then
			if self._snapped_edge == "LEFT" then
				slot13 = time_displacement
				slot16 = clip

				update_closest_snapped_displacement(slot11, self._clip_initial_start_time, clip.end_time(slot15))
			elseif self._snapped_edge == "RIGHT" then
				slot13 = time_displacement
				slot16 = clip

				update_closest_snapped_displacement(slot11, self._clip_initial_end_time, clip.start_time(slot15))
			end
		end
	end

	return closest_snapped_displacement
end
function MovePlayheadTrackBehaviour:on_mouse_motion(sender, track, event)
	if sender == track then
		local pos = event.get_position(slot5)
		slot11 = sender
		slot8 = event.get_position(slot9, event).x
		local time = sender.pixels_to_units(event, sender)
		slot10 = time

		self._invoke_on_delegate(sender, self, "set_playhead_position")
	end

	slot6 = event

	event.skip(slot5)

	return 
end
function MovePlayheadTrackBehaviour:on_mouse_left_up(sender, track, event)
	if sender == track then
		slot9 = event

		self.on_mouse_motion(slot5, self, sender, track)

		slot6 = self

		self.restore_default_behaviour(slot5)
	end

	return 
end
function BoxSelectionTrackBehaviour:on_mouse_motion(sender, track, event)
	if sender == track then
		slot8 = event

		self._invoke_on_delegate(slot5, self, "_on_drag_box_selection")
	end

	slot6 = event

	event.skip(slot5)

	return 
end
function BoxSelectionTrackBehaviour:on_mouse_left_up(sender, track, event)
	if sender == track then
		slot9 = event

		self.on_mouse_motion(slot5, self, sender, track)

		slot8 = event

		self._invoke_on_delegate(slot5, self, "_on_commit_box_selection")

		slot6 = self

		self.restore_default_behaviour(slot5)
	end

	return 
end

return 
