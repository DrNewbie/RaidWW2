CoreXMLTextCtrl = CoreXMLTextCtrl or class()
function CoreXMLTextCtrl:init(parent, value, id, syntax_colors, style)
	if syntax_colors then
		self._syntax_colors = syntax_colors
	else
		self._syntax_colors = {}
		slot11 = 255
		self._syntax_colors.NODE = Vector3(slot8, 50, 50)
		slot11 = 50
		self._syntax_colors.KEY = Vector3(slot8, 250, 50)
		slot11 = 0
		self._syntax_colors.VALUE = Vector3(slot8, 0, 0)
		slot11 = 0
		self._syntax_colors.NORMAL = Vector3(slot8, 0, 0)
	end

	slot12 = style or "TE_MULTILINE,TE_RICH2,TE_DONTWRAP"
	self._text_ctrl = EWS.TextCtrl(slot7, EWS, parent, value or "", id or "")
	slot9 = "FONTFAMILY_TELETYPE"

	self._text_ctrl.set_default_style_font_family(slot7, self._text_ctrl)

	slot9 = 10

	self._text_ctrl.set_default_style_font_size(slot7, self._text_ctrl)

	return 
end
function CoreXMLTextCtrl:update(t)
	self._skip_event = nil

	if self._check_syntax then
		if self._last_syntax_check then
			if 3 < t - self._last_syntax_check then
				local text = self._text_ctrl.get_value(slot3)
				self._last_syntax_check = nil
				self._check_syntax = nil
				self._skip_event = true
				slot5 = "node"
				slot6 = text

				if Node(self._text_ctrl).try_read_xml(self._text_ctrl, Node(self._text_ctrl)) then
					local node = Node(slot4)
					slot7 = "<n>\n" .. text .. "</n>\n"

					node.read_xml("node", node)

					slot6 = node

					if 0 < node.num_children("node") then
						slot6 = self._text_ctrl

						self._text_ctrl.freeze(slot5)

						slot7 = ""

						self._text_ctrl.set_value(slot5, self._text_ctrl)

						slot8 = node

						self._draw_text_with_color(slot5, self, "")

						slot7 = "NORMAL"

						self._set_tc_color(slot5, self)

						slot6 = self._text_ctrl

						self._text_ctrl.thaw(slot5)

						slot7 = 0

						self._text_ctrl.set_insertion_point(slot5, self._text_ctrl)

						slot7 = 0

						self._text_ctrl.show_position(slot5, self._text_ctrl)

						slot6 = self._text_ctrl

						self._text_ctrl.update(slot5)
					end

					self._xml_ok = true
				else
					self._xml_ok = nil
				end
			end
		else
			self._last_syntax_check = t
		end
	end

	return 
end
function CoreXMLTextCtrl:text_ctrl()
	return self._text_ctrl
end
function CoreXMLTextCtrl:xml_ok()
	return self._xml_ok == true
end
function CoreXMLTextCtrl:check()
	self._check_syntax = true
	self._last_syntax_check = 0

	return 
end
function CoreXMLTextCtrl:set_value(value)
	slot5 = value

	self._text_ctrl.set_value(slot3, self._text_ctrl)

	slot4 = self

	self.check(slot3)

	slot5 = math.huge

	self.update(slot3, self)

	return 
end
function CoreXMLTextCtrl:_on_text_change()
	if not self._skip_event then
		self._check_syntax = true
		self._last_syntax_check = nil
	end

	return 
end
function CoreXMLTextCtrl:_draw_text_with_color(level, node)
	slot5 = node

	for child in node.children(slot4) do
		slot10 = "NODE"

		self._set_tc_color(slot8, self)

		slot14 = child

		self._text_ctrl.append(slot8, self._text_ctrl)

		slot11 = child

		for k, v in pairs(child.parameters(level .. "<" .. child.name(slot13))) do
			slot15 = "KEY"

			self._set_tc_color(slot13, self)

			slot15 = " " .. k .. "="

			self._text_ctrl.append(slot13, self._text_ctrl)

			slot15 = "VALUE"

			self._set_tc_color(slot13, self)

			slot15 = "\"" .. v .. "\""

			self._text_ctrl.append(slot13, self._text_ctrl)
		end

		slot10 = "NODE"

		self._set_tc_color(slot8, self)

		slot9 = child

		if child.num_children(slot8) == 0 then
			slot10 = "/>\n"

			self._text_ctrl.append(slot8, self._text_ctrl)
		else
			slot10 = ">\n"

			self._text_ctrl.append(slot8, self._text_ctrl)

			slot11 = child

			self._draw_text_with_color(slot8, self, level .. "    ")

			slot14 = child
			slot10 = level .. "</" .. child.name(slot13) .. ">\n"

			self._text_ctrl.append(slot8, self._text_ctrl)
		end
	end

	return 
end
function CoreXMLTextCtrl:_set_tc_color(color)
	slot5 = self._syntax_colors[color]

	self._text_ctrl.set_default_style_colour(slot3, self._text_ctrl)

	return 
end

return 
