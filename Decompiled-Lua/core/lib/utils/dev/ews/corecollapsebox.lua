-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreCollapseBox = CoreCollapseBox or class()
function CoreCollapseBox:init(parent, orientation, caption, expanded_size, expand, style)

	-- Decompilation error in this vicinity:
	self._caption = caption or ""
	self._expand = not expand
	self._parent = parent
	self._expanded_size = expanded_size
	slot12 = ""
	self._panel = EWS.Panel(slot8, EWS, self._parent, "")
	self._box = slot7
	slot10 = self._box

	self._panel.set_sizer(slot8, self._panel)

	slot13 = "NO_BORDER"
	self._btn = EWS.Button(slot8, EWS, self._panel, "", "")
	slot10 = "FONTFAMILY_TELETYPE"

	self._btn.set_font_family(slot8, self._btn)

	slot10 = "FONTWEIGHT_BOLD"

	self._btn.set_font_weight(slot8, self._btn)

	slot13 = self

	self.connect(slot8, self, "", "EVT_COMMAND_BUTTON_CLICKED", self._cb)

	slot13 = "EXPAND"

	self._box.add(slot8, self._box, self._btn, 0, 0)

	slot12 = (style == "NO_BORDER" and "SIMPLE_BORDER") or ""
	self._lower_panel = EWS.Panel(slot8, EWS, self._panel, "")

	if self._expanded_size then
		slot10 = self._expanded_size

		self._lower_panel.set_min_size(slot8, self._lower_panel)
	end

	slot10 = orientation
	self._lower_box = EWS.BoxSizer(slot8, EWS)
	slot10 = self._lower_box

	self._lower_panel.set_sizer(slot8, self._lower_panel)

	slot13 = (style == "NO_BORDER" and "LEFT,RIGHT,EXPAND") or "EXPAND"

	self._box.add(slot8, self._box, self._lower_panel, 1, 4)

	slot9 = self

	self._cb(slot8)

	return 
end
function CoreCollapseBox:connect(id, event, cb, data)
	slot11 = data

	self._btn.connect(slot6, self._btn, id, event, cb)

	return 
end
function CoreCollapseBox:panel()
	return self._panel
end
function CoreCollapseBox:lower_panel()
	return self._lower_panel
end
function CoreCollapseBox:box()
	return self._lower_box
end
function CoreCollapseBox:expanded()
	return self._expand
end
function CoreCollapseBox:expanded_size()
	return self._expanded_size
end
function CoreCollapseBox:set_expand(b)
	self._expand = not expand
	slot4 = self

	self._cb(slot3)

	return 
end
function CoreCollapseBox:set_expanded_size(v)
	slot4 = self._parent

	self._parent.freeze(slot3)

	self._expanded_size = v
	slot5 = v

	self._lower_panel.set_sizer(slot3, self._lower_panel)

	slot4 = self._parent

	self._parent.layout(slot3)

	slot4 = self._parent

	self._parent.thaw(slot3)

	slot4 = self._parent

	self._parent.refresh(slot3)

	return 
end
function CoreCollapseBox:_cb()
	self._expand = not self._expand
	slot3 = self._parent

	self._parent.freeze(slot2)

	local icon = (self._expand and "[-]") or "[+]"
	slot5 = self._expand

	self._lower_panel.set_visible(slot3, self._lower_panel)

	slot5 = icon .. " " .. self._caption

	self._btn.set_caption(slot3, self._btn)

	slot4 = self._parent

	self._parent.layout(slot3)

	slot4 = self._parent

	self._parent.thaw(slot3)

	slot4 = self._parent

	self._parent.refresh(slot3)

	return 
end

return 
