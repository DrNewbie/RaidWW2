function set_widget_help(widget, help_text)
	slot5 = help_text

	widget.set_tool_tip(slot3, widget)

	return 
end

function set_widget_box_help(widget, help_header, help_text, view)
	local function on_enter(t, evt)
		slot5 = "FONTWEIGHT_BOLD"

		t.set_own_font_weight(slot3, t)

		slot4 = t

		t.refresh(slot3)

		slot4 = evt

		evt.skip(slot3)

		return 
	end

	local function on_leave(t, evt)
		slot5 = "FONTWEIGHT_NORMAL"

		t.set_own_font_weight(slot3, t)

		slot4 = t

		t.refresh(slot3)

		slot4 = evt

		evt.skip(slot3)

		return 
	end

	local function on_left_down(t, evt)
		slot6 = t[3]

		t[1].set_box_help(slot3, t[1], t[2])

		return 
	end

	slot10 = "(click to get help text in textbox)\n" .. help_text

	widget.set_tool_tip(slot8, widget)

	slot12 = widget

	widget.connect(slot8, widget, "EVT_ENTER_WINDOW", on_enter)

	slot12 = widget

	widget.connect(slot8, widget, "EVT_LEAVE_WINDOW", on_leave)

	slot12 = {
		view,
		help_header,
		help_text
	}

	widget.connect(slot8, widget, "EVT_LEFT_DOWN", on_left_down)

	return 
end

function base_path(n)
	slot3 = n
	slot4 = "\\"
	local bs = n.reverse(slot2).find(slot2, n.reverse(slot2))

	if bs then
		slot5 = #n - bs + 2

		return n.sub(slot3, n)
	else
		return n
	end

	return 
end

function dir_name(n)
	slot3 = n
	slot4 = "\\"
	local bs = n.reverse(slot2).find(slot2, n.reverse(slot2))

	if bs then
		slot6 = #n - bs + 1

		return n.sub(slot3, n, 1)
	else
		return n
	end

	return 
end

return 
