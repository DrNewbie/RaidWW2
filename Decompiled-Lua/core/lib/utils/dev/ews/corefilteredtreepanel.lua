slot2 = "core/lib/utils/dev/ews/tree_control/CoreFilteredTreeControl"

require(slot1)

CoreFilteredTreePanel = CoreFilteredTreePanel or class()
function CoreFilteredTreePanel:init(parent_frame)
	slot5 = parent_frame

	self._create_panel(slot3, self)

	self._tree_refresh_timeout = 0

	return 
end
function CoreFilteredTreePanel:add_to_sizer(sizer, proportion, border, flags)
	slot11 = flags

	return sizer.add(slot6, sizer, self._panel, proportion, border)
end
function CoreFilteredTreePanel:connect(event_type, script_callback, script_data)
	slot6 = self
	slot9 = script_data

	return self._tree_control(slot5).connect(slot5, self._tree_control(slot5), event_type, script_callback)
end
function CoreFilteredTreePanel:update(time, delta_time)
	if 0 < self._tree_refresh_timeout then
		self._tree_refresh_timeout = self._tree_refresh_timeout - delta_time

		if self._tree_refresh_timeout <= 0 then
			slot5 = self

			if self._tree_control(slot4) then
				self._tree_refresh_timeout = 0
				slot5 = self
				slot5 = self._tree_control(slot4)

				self._tree_control(slot4).refresh_tree(slot4)
			end
		end
	end

	return 
end
function CoreFilteredTreePanel:_tree_control()
	return self._filtered_tree_control
end
function CoreFilteredTreePanel:_create_panel(parent_frame)
	slot7 = ""
	self._panel = EWS.Panel(slot3, EWS, parent_frame, "")
	slot5 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = panel_sizer

	self._panel.set_sizer(EWS, self._panel)

	local filter_panel, filter_text_ctrl = self._create_filter_bar_panel(EWS, self)
	slot11 = "EXPAND"

	panel_sizer.add(self._panel, panel_sizer, filter_panel, 0, 0)

	slot8 = self._panel
	self._filtered_tree_control = CoreFilteredTreeControl.new(self._panel, CoreFilteredTreeControl)
	slot11 = "EXPAND"

	self._filtered_tree_control.add_to_sizer(self._panel, self._filtered_tree_control, panel_sizer, 1, 0)

	function slot8(node)
		slot6 = filter_text_ctrl
		slot6 = true

		return string.find(slot2, node.path(slot4), filter_text_ctrl.get_value(node), 1)
	end

	self._filtered_tree_control.add_filter(self._panel, self._filtered_tree_control)

	slot8 = "EVT_COMMAND_TEXT_UPDATED"
	slot13 = "_on_filter_text_updated"

	filter_text_ctrl.connect(self._panel, filter_text_ctrl, callback(0, self, self))

	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot13 = "_on_filter_enter_pressed"

	filter_text_ctrl.connect(self._panel, filter_text_ctrl, callback(0, self, self))

	return 
end
function CoreFilteredTreePanel:_create_filter_bar_panel(parent_frame)
	slot7 = ""
	local panel = EWS.Panel(slot3, EWS, parent_frame, "")
	slot6 = "HORIZONTAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot10 = "magnifying_glass_32x32.png"
	slot10 = "NO_BORDER"
	local image = EWS.BitmapButton(EWS, EWS, panel, CoreEWS.image_path(slot9), "")
	slot11 = "TOP,BOTTOM,LEFT,EXPAND"

	panel_sizer.add(EWS, panel_sizer, image, 0, 5)

	slot11 = ""
	local filter_text_ctrl = EWS.TextCtrl(EWS, EWS, panel, "", "")
	slot12 = "LEFT,RIGHT,ALIGN_CENTER_VERTICAL"

	panel_sizer.add(EWS, panel_sizer, filter_text_ctrl, 1, 5)

	return panel, filter_text_ctrl
end
function CoreFilteredTreePanel:_on_filter_text_updated()
	self._tree_refresh_timeout = 0.25

	return 
end
function CoreFilteredTreePanel:_on_filter_enter_pressed()
	if 0 < self._tree_refresh_timeout then
		self._tree_refresh_timeout = 0
		slot3 = self
		slot3 = self._tree_control(slot2)

		self._tree_control(slot2).refresh_tree(slot2)
	end

	slot3 = self
	slot4 = true

	self._tree_control(slot2).expand(slot2, self._tree_control(slot2))

	return 
end

return 
