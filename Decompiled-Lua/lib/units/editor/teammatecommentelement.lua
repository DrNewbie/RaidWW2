if not TeammateCommentUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

TeammateCommentUnitElement = slot0
function TeammateCommentUnitElement:init(unit)
	slot5 = unit

	TeammateCommentUnitElement.super.init(slot3, self)

	self._hed.comment = "none"
	self._hed.close_to_element = false
	self._hed.use_instigator = false
	self._hed.radius = 0
	self._hed.test_robber = 1
	slot5 = "comment"

	table.insert(1, self._save_values)

	slot5 = "close_to_element"

	table.insert(1, self._save_values)

	slot5 = "use_instigator"

	table.insert(1, self._save_values)

	slot5 = "radius"

	table.insert(1, self._save_values)

	return 
end
function TeammateCommentUnitElement:post_init(...)
	slot3 = self

	TeammateCommentUnitElement.super.post_init(slot2, ...)

	return 
end
function TeammateCommentUnitElement:update_selected(t, dt)
	if self._hed.radius ~= 0 then
		local brush = Draw.brush(slot4)
		slot6 = brush
		slot12 = 1

		brush.set_color(Draw, Color(slot8, 0.15, 1, 1))

		slot12 = 0.5
		local pen = Draw.pen(Draw, Color(slot8, 0.15, 0.5, 0.5))
		slot10 = self._unit
		slot10 = 4

		brush.sphere(Draw, brush, self._unit.position(0.15), self._hed.radius)

		slot10 = self._unit
		slot9 = self._hed.radius

		pen.sphere(Draw, pen, self._unit.position(self._hed.radius))
	end

	return 
end
function TeammateCommentUnitElement:test_element()
	if self._hed.comment then
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

		slot5 = "third"

		self._ss.set_switch(slot2, self._ss, "int_ext")

		for i = self._hed.test_robber, 10, 1 do
			slot12 = i
			slot9 = "rb" .. tostring(slot11)

			self._ss.set_switch(slot6, self._ss, "robber")

			slot8 = self._hed.comment

			if self._ss.post_event(slot6, self._ss) then
				break
			end
		end
	end

	return 
end
function TeammateCommentUnitElement:stop_test_element()
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
function TeammateCommentUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot14 = managers.groupai
	slot12 = managers.groupai.state(slot13).teammate_comment_names
	slot10 = "Select a comment"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "comment", table.list_add(slot10, {
		"none"
	}))

	slot10 = "Play close to element"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "close_to_element", "Play close to element")

	slot10 = "Play on instigator"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "use_instigator", "Play on instigator")

	slot10 = "(Optional) Sets a distance to use with the check (in cm)"

	self._build_value_number(slot4, self, panel, panel_sizer, "radius", {
		floats = 0,
		min = 0
	})

	slot10 = "Can be used to test different robber voice (not saved/loaded)"

	self._build_value_number(slot4, self, panel, panel_sizer, "test_robber", {
		floats = 0,
		min = 0
	})

	slot6 = "If \"Play close to element\" is checked, the comment will be played on a teammate close to the element position, otherwise close to the player."

	self._add_help_text(slot4, self)

	return 
end
function TeammateCommentUnitElement:destroy()
	slot3 = self

	self.stop_test_element(slot2)

	slot3 = self

	TeammateCommentUnitElement.super.destroy(slot2)

	return 
end

return 
