slot3 = "CoreColorPickerPanel"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreColorPickerDraggables"

core.import(slot1, core)

slot3 = "CoreColorPickerFields"

core.import(slot1, core)

if not ColorPickerPanel then
	slot3 = CoreEvent.BasicEventHandling
	slot0 = CoreClass.mixin(slot1, CoreClass.class())
end

ColorPickerPanel = slot0
function ColorPickerPanel:init(parent_frame, enable_alpha, orientation, enable_value)
	slot7 = orientation == "HORIZONTAL" or orientation == "VERTICAL"

	assert(slot6)

	slot11 = enable_value

	self._create_panel(slot6, self, parent_frame, enable_alpha, orientation)

	return 
end
function ColorPickerPanel:panel()
	return self._panel
end
function ColorPickerPanel:color()
	slot3 = self._fields

	return self._fields.color(slot2)
end
function ColorPickerPanel:set_color(color)
	slot5 = color

	self._draggables.set_color(slot3, self._draggables)

	slot5 = color

	self._fields.set_color(slot3, self._fields)

	return 
end
function ColorPickerPanel:update(time, delta_time)
	slot7 = delta_time

	self._draggables.update(slot4, self._draggables, time)

	slot7 = delta_time

	self._fields.update(slot4, self._fields, time)

	return 
end
function ColorPickerPanel:_create_panel(parent_frame, enable_alpha, orientation, enable_value)
	slot8 = parent_frame
	self._panel = EWS.Panel(slot6, EWS)
	slot8 = orientation
	local panel_sizer = EWS.BoxSizer(slot6, EWS)
	slot9 = panel_sizer

	self._panel.set_sizer(EWS, self._panel)

	slot11 = enable_value
	self._draggables = CoreColorPickerDraggables.ColorPickerDraggables.new(EWS, CoreColorPickerDraggables.ColorPickerDraggables, self._panel, enable_alpha)
	self._fields = CoreColorPickerFields.ColorPickerFields.new(EWS, CoreColorPickerFields.ColorPickerFields, self._panel, enable_alpha)
	slot14 = "_on_color_updated"

	self._draggables.connect(EWS, self._draggables, "EVT_COLOR_UPDATED", CoreEvent.callback(enable_value, self, self))

	slot14 = "_on_color_updated"

	self._fields.connect(EWS, self._fields, "EVT_COLOR_UPDATED", CoreEvent.callback(self._draggables, self, self))

	slot14 = "_on_color_changed"

	self._draggables.connect(EWS, self._draggables, "EVT_COLOR_CHANGED", CoreEvent.callback(self._fields, self, self))

	slot14 = "_on_color_changed"
	slot11 = self._fields

	self._fields.connect(EWS, self._fields, "EVT_COLOR_CHANGED", CoreEvent.callback(self._draggables, self, self))

	slot11 = self._draggables
	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._draggables.panel(CoreEvent.callback(self._draggables, self, self)), 0, 0)

	slot11 = self._fields
	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, self._fields.panel(0), 1, 0)

	return 
end
function ColorPickerPanel:_on_color_updated(sender, color)
	slot6 = sender
	slot6 = color

	table.exclude(slot4, {
		self._draggables,
		self._fields
	})[1].set_color(slot4, table.exclude(slot4, )[1])

	slot7 = color

	self._send_event(slot4, self, "EVT_COLOR_UPDATED")

	return 
end
function ColorPickerPanel:_on_color_changed(sender, color)
	slot7 = color

	self._send_event(slot4, self, "EVT_COLOR_CHANGED")

	return 
end

return 
