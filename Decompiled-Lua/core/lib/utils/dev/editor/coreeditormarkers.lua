function CoreEditor:build_marker_panel()
	slot6 = "TAB_TRAVERSAL"
	self._marker_panel = EWS.Panel(slot2, EWS, self._ews_editor_frame, "Markers")
	slot4 = "VERTICAL"
	local marker_sizer = EWS.BoxSizer(slot2, EWS)
	slot5 = marker_sizer

	self._marker_panel.set_sizer(EWS, self._marker_panel)

	slot5 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	local create_marker_btn = EWS.Button(EWS, EWS, self._marker_panel, "Create Marker", "_create_marker")
	slot12 = "on_make_marker"
	slot9 = nil

	create_marker_btn.connect(EWS, create_marker_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot10 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, create_marker_btn, 0, 2)

	local use_marker_btn = EWS.Button(EWS, EWS, self._marker_panel, "Use Marker", "_use_marker")
	slot13 = "on_use_marker"
	slot10 = nil

	use_marker_btn.connect(EWS, use_marker_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot11 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, use_marker_btn, 0, 2)

	local delete_marker_btn = EWS.Button(EWS, EWS, self._marker_panel, "Del. Marker", "_delete_marker")
	slot14 = "on_delete_marker"
	slot11 = nil

	delete_marker_btn.connect(EWS, delete_marker_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot12 = "RIGHT"

	btn_sizer.add(EWS, btn_sizer, delete_marker_btn, 0, 2)

	slot12 = "EXPAND"

	marker_sizer.add(EWS, marker_sizer, btn_sizer, 0, 0)

	slot9 = "VERTICAL"
	local marker_list_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._ews_markers = EWS.ListBox(EWS, EWS, self._marker_panel, "_markers")
	slot13 = "EXPAND"

	marker_list_sizer.add(EWS, marker_list_sizer, self._ews_markers, 0, 0)

	slot13 = "EXPAND"

	marker_sizer.add(EWS, marker_sizer, marker_list_sizer, 0, 0)

	return self._marker_panel
end
function CoreEditor:marker_name()
	local i = 1

	while self._markers["marker" .. i] do
		i = i + 1
	end

	return "marker" .. i
end
function CoreEditor:on_make_marker()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for the marker:", "Create Marker", self.marker_name(slot8), Vector3(self, -1, -1))

	if name and name ~= "" then
		if self._markers[name] then
			slot4 = self

			self.on_make_marker(slot3)
		else
			slot5 = name

			self.make_marker(slot3, self)
		end
	end

	return 
end
function CoreEditor:make_marker(name)
	if self._current_layer then
		slot5 = name
		local m = Marker.new(slot3, Marker)
		slot6 = m

		if self._current_layer.create_marker(Marker, self._current_layer) then
			slot6 = name

			self._ews_markers.append(slot4, self._ews_markers)

			self._markers[name] = m
		end
	end

	return 
end
function CoreEditor:on_use_marker()
	slot3 = self
	local s = self.get_marker_string(slot2)

	if s then
		slot5 = s

		self.use_marker(slot3, self)
	end

	return 
end
function CoreEditor:use_marker(name)
	if self._current_layer and self._markers[name] then
		slot5 = self._markers[name]

		self._current_layer.use_marker(slot3, self._current_layer)
	end

	return 
end
function CoreEditor:on_delete_marker()
	slot3 = self
	local s = self.get_marker_string(slot2)

	if s then
		slot5 = s

		self.delete_marker(slot3, self)
	end

	return 
end
function CoreEditor:delete_marker(name)
	if self._markers[name] then
		self._markers[name] = nil
	end

	slot5 = name

	self.remove_marker_from_list(slot3, self)

	return 
end
function CoreEditor:get_marker_string()
	slot3 = self._ews_markers

	if 0 < self._ews_markers.nr_items(slot2) then
		slot3 = self._ews_markers
		local i = self._ews_markers.selected_index(slot2)

		if 0 <= i then
			slot5 = i

			return self._ews_markers.get_string(slot3, self._ews_markers)
		end
	end

	return nil
end
function CoreEditor:remove_marker_from_list(s)
	local i = 0
	slot5 = self._ews_markers
	local size = self._ews_markers.nr_items(slot4)

	while i < size do
		slot7 = i

		if s == self._ews_markers.get_string(slot5, self._ews_markers) then
			slot7 = i

			self._ews_markers.remove(slot5, self._ews_markers)

			break
		end

		i = i + 1
	end

	return 
end
function CoreEditor:create_marker(name, pos, rot)
	slot10 = rot
	self._markers[name] = Marker.new(slot6, Marker, name, pos)

	return 
end
function CoreEditor:get_marker(name)
	if self._markers[name] then
		return self._markers[name]
	end

	return nil
end
function CoreEditor:clear_markers()
	slot3 = self._ews_markers

	self._ews_markers.clear(slot2)

	self._markers = {}

	return 
end
Marker = Marker or class()
function Marker:init(name, pos, rot)
	self._name = name
	self._pos = pos
	self._rot = rot

	return 
end
function Marker:set_pos(pos)
	self._pos = pos

	return 
end
function Marker:set_rot(rot)
	self._rot = rot

	return 
end
function Marker:draw()
	local l = 2000
	slot9 = self._rot
	slot9 = 0

	Application.draw_line(slot3, Application, self._pos, self._pos + self._rot.x(slot8) * l, 0.5, 0)

	slot9 = self._rot
	slot9 = 0

	Application.draw_line(slot3, Application, self._pos, self._pos + self._rot.y(0) * l, 0, 0.5)

	slot9 = self._rot
	slot9 = 0.5

	Application.draw_line(slot3, Application, self._pos, self._pos + self._rot.z(0.5) * l, 0, 0)

	return 
end
function Marker:save(file, t)
	t = t .. "\t"
	slot18 = self._rot
	slot20 = self._rot
	slot22 = self._rot
	slot6 = t .. "<marker name=\"" .. self._name .. "\" pos=\"" .. self._pos.x .. " " .. self._pos.y .. " " .. self._pos.z .. "\" rot=\"" .. self._rot.yaw(slot17) .. " " .. self._rot.pitch(slot19) .. " " .. self._rot.roll(slot21) .. "\"/>"

	file.puts("\t", file)

	return 
end

return 
