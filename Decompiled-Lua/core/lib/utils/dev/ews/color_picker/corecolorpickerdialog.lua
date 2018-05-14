-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreColorPickerDialog"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreColorPickerPanel"

core.import(slot1, core)

if not ColorPickerDialog then
	slot3 = CoreEvent.BasicEventHandling
	slot0 = CoreClass.mixin(slot1, CoreClass.class())
end

ColorPickerDialog = slot0
ColorPickerDialog.EDITOR_TITLE = "Color Picker"
function ColorPickerDialog:init(parent_frame, enable_alpha, orientation, enable_value)

	-- Decompilation error in this vicinity:
	orientation = orientation or "HORIZONTAL"
	slot8 = "Invalid orientation."

	assert(slot6, orientation == "HORIZONTAL" or orientation == "VERTICAL")

	slot14 = 0
	self._window = EWS.Frame(slot7, EWS, ColorPickerDialog.EDITOR_TITLE, Vector3(slot11, -1, -1), frame_size, "SYSTEM_MENU,CAPTION,CLOSE_BOX,CLIP_CHILDREN")
	slot9 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot7, EWS)
	slot10 = sizer

	self._window.set_sizer(EWS, self._window)

	slot9 = self._window
	slot12 = "toolbar/color_16x16.png"

	self._window.set_icon(EWS, CoreEws.image_path(frame_size))

	slot16 = "_on_close"
	slot13 = ""

	self._window.connect(EWS, self._window, "", "EVT_CLOSE_WINDOW", CoreEvent.callback(parent_frame, self, self))

	slot13 = enable_value
	self._picker_panel = CoreColorPickerPanel.ColorPickerPanel.new(EWS, CoreColorPickerPanel.ColorPickerPanel, self._window, enable_alpha, orientation)
	slot15 = "_on_color_updated"

	self._picker_panel.connect(EWS, self._picker_panel, "EVT_COLOR_UPDATED", CoreEvent.callback(orientation, self, self))

	slot15 = "_on_color_changed"
	slot12 = self._picker_panel

	self._picker_panel.connect(EWS, self._picker_panel, "EVT_COLOR_CHANGED", CoreEvent.callback(self._picker_panel, self, self))

	slot12 = self._picker_panel
	slot13 = "EXPAND"

	sizer.add(EWS, sizer, self._picker_panel.panel(CoreEvent.callback(self._picker_panel, self, self)), 0, 0)

	slot10 = true

	self.set_visible(EWS, self)

	return 
end
function ColorPickerDialog:update(time, delta_time)
	slot7 = delta_time

	self._picker_panel.update(slot4, self._picker_panel, time)

	return 
end
function ColorPickerDialog:color()
	slot3 = self._picker_panel

	return self._picker_panel.color(slot2)
end
function ColorPickerDialog:set_color(color)
	slot5 = color

	self._picker_panel.set_color(slot3, self._picker_panel)

	return 
end
function ColorPickerDialog:set_position(newpos)
	slot5 = newpos

	self._window.set_position(slot3, self._window)

	return 
end
function ColorPickerDialog:set_visible(visible)
	slot5 = visible

	self._window.set_visible(slot3, self._window)

	return 
end
function ColorPickerDialog:center(window)
	slot8 = window
	slot8 = self._window
	slot5 = (window.get_position(slot6) + window.get_size(window) * 0.5) - self._window.get_size(window) * 0.5

	self._window.set_position(slot3, self._window)

	return 
end
function ColorPickerDialog:close()
	slot3 = self._window

	self._window.destroy(slot2)

	return 
end
function ColorPickerDialog:_on_color_updated(sender, color)
	slot7 = color

	self._send_event(slot4, self, "EVT_COLOR_UPDATED")

	return 
end
function ColorPickerDialog:_on_color_changed(sender, color)
	slot7 = color

	self._send_event(slot4, self, "EVT_COLOR_CHANGED")

	return 
end
function ColorPickerDialog:_on_close()
	slot4 = false

	self._window.set_visible(slot2, self._window)

	slot5 = self._window

	self._send_event(slot2, self, "EVT_CLOSE_WINDOW")

	slot4 = ColorPickerDialog.EDITOR_TITLE

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end

return 
