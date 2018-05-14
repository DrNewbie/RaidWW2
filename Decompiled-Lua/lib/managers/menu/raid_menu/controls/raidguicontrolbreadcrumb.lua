if not RaidGUIControlBreadcrumb then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlBreadcrumb = slot0
RaidGUIControlBreadcrumb.IMAGE = "breadcumb_indicator"
RaidGUIControlBreadcrumb.PADDING = 42
RaidGUIControlBreadcrumb.ATTRACT_Y_OFFSET = 3
RaidGUIControlBreadcrumb.ATTRACT_MAX_ANGLE = 6
RaidGUIControlBreadcrumb.HIDE_ANIMATION_ROTATION = 30
RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE = 0.8
RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE = 1.6
function RaidGUIControlBreadcrumb:init(parent, params)
	slot7 = params or {}

	RaidGUIControlBreadcrumb.super.init(slot4, self, parent)

	slot5 = managers.breadcrumb
	self._id = managers.breadcrumb.get_unique_breadcrumb_id(slot4)
	self._visible = false
	self._padding = (params and params.padding) or RaidGUIControlBreadcrumb.PADDING
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_breadcrumb_icon(slot4)

	if self._params.delay then
		slot9 = self._id
		slot10 = self._params.delay

		managers.queued_tasks.queue(slot4, managers.queued_tasks, "breadcrumb_" .. tostring(slot8) .. "_presence_check", self.check_presence, self, nil)
	else
		slot5 = self

		self.check_presence(slot4)
	end

	slot5 = self

	self._subscribe_to_relevant_events(slot4)

	return 
end
function RaidGUIControlBreadcrumb:_create_panel()
	local panel_params = {
		name = "breadcrumb_panel",
		halign = "right",
		valign = "center"
	}
	slot5 = RaidGUIControlBreadcrumb.IMAGE
	panel_params.w = tweak_data.gui.icon_w(slot3, tweak_data.gui) + 2 * self._padding
	slot5 = RaidGUIControlBreadcrumb.IMAGE
	panel_params.h = tweak_data.gui.icon_h(2 * self._padding, tweak_data.gui) + 2 * self._padding
	panel_params.layer = (self._params and self._params.layer) or 1
	slot6 = true
	self._object = self._panel.panel(slot3, self._panel, panel_params)

	return 
end
function RaidGUIControlBreadcrumb:_create_breadcrumb_icon()
	local icon_params = {
		name = "breadcrumb_icon",
		valign = "center",
		halign = "center",
		alpha = 0,
		texture = tweak_data.gui.icons[RaidGUIControlBreadcrumb.IMAGE].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlBreadcrumb.IMAGE].texture_rect
	}
	slot5 = icon_params
	self._icon = self._object.bitmap(RaidGUIControlBreadcrumb.IMAGE, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._icon.set_center_x(RaidGUIControlBreadcrumb.IMAGE, self._icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._icon.set_center_y(RaidGUIControlBreadcrumb.IMAGE, self._icon)

	return 
end
function RaidGUIControlBreadcrumb:_subscribe_to_relevant_events()
	if self._params.category or self._params.identifiers then
		slot7 = self._id
		slot6 = self._params.identifiers
		slot11 = "check_presence"

		managers.breadcrumb.register_breadcrumb_change_listener(slot2, managers.breadcrumb, "breadcrumb_" .. tostring(slot6) .. "_event_listener", self._params.category, callback(slot8, self, self))
	end

	return 
end
function RaidGUIControlBreadcrumb:check_presence()
	if not self._params then
		return 
	end

	local should_be_visible = false

	if (self._params.category or self._params.identifiers) and not should_be_visible then
		slot6 = self._params.identifiers
		should_be_visible = managers.breadcrumb.category_has_breadcrumbs(slot3, managers.breadcrumb, self._params.category)
	end

	if self._params.check_callback then
		local callback_result = self._params.check_callback()
		should_be_visible = should_be_visible or callback_result
	end

	if should_be_visible and not self._visible then
		self._visible = true
		slot4 = self._icon

		self._icon.stop(slot3)

		slot9 = "_animate_show"
		slot5 = callback(slot6, self, self)
		slot9 = 0.7

		self._icon.animate(slot3, self._icon, math.random(self, 0))
	elseif not should_be_visible and self._visible then
		slot4 = self

		self.consume(slot3)
	end

	return 
end
function RaidGUIControlBreadcrumb:consume()
	if self._consumed then
		return 
	end

	self._consumed = true
	self._visible = false
	slot3 = self._icon

	if alive(slot2) then
		slot3 = self._icon

		self._icon.stop(slot2)

		slot3 = self._icon
		slot8 = "_animate_hide"

		self._icon.animate(slot2, callback(slot5, self, self))
	end

	return 
end
function RaidGUIControlBreadcrumb:close()
	slot7 = self._id
	slot4 = "breadcrumb_" .. tostring(slot6) .. "_event_listener"

	managers.breadcrumb.unregister_breadcrumb_change_listener(slot2, managers.breadcrumb)

	slot4 = self._id

	managers.breadcrumb.clear_unique_breadcrumb_id(slot2, managers.breadcrumb)

	slot3 = self._icon

	self._icon.stop(slot2)

	slot7 = self._id
	slot4 = "breadcrumb_" .. tostring("_event_listener") .. "_presence_check"

	if managers.queued_tasks.has_task(slot2, managers.queued_tasks) then
		slot7 = self._id
		slot4 = "breadcrumb_" .. tostring(slot6) .. "_presence_check"

		managers.queued_tasks.unqueue(slot2, managers.queued_tasks)
	end

	slot3 = self._object

	self._object.clear(slot2)

	return 
end
function RaidGUIControlBreadcrumb:_animate_show(icon, delay)
	local t = 0
	local duration = 0.25
	slot8 = 0

	self._icon.set_alpha(slot6, self._icon)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_alpha = Easing.quartic_in_out(slot7, t, 0, 1)
		slot10 = current_alpha

		self._icon.set_alpha(t, self._icon)
	end

	slot8 = 1

	self._icon.set_alpha(slot6, self._icon)

	slot9 = delay

	self._animate_attract(slot6, self, icon)

	return 
end
function RaidGUIControlBreadcrumb:_animate_attract(icon, delay)
	while true do
		local t = 0
		local duration = 0.8
		slot8 = 0

		self._icon.set_rotation(slot6, self._icon)

		slot10 = self._object
		slot8 = self._object.w(slot9) / 2

		self._icon.set_center_x(slot6, self._icon)

		slot10 = self._object
		slot8 = self._object.h(slot9) / 2

		self._icon.set_center_y(slot6, self._icon)

		if delay then
			slot7 = delay

			wait(slot6)
		end

		while t < duration do
			local dt = coroutine.yield()
			t = t + dt
			slot9 = duration
			local current_y_offset = Easing.sine_pulse(slot7, t) * RaidGUIControlBreadcrumb.ATTRACT_Y_OFFSET
			slot12 = self._object
			slot10 = self._object.h(slot11) / 2 - current_y_offset

			self._icon.set_center_y(t, self._icon)
		end

		slot8 = 0

		self._icon.set_rotation(slot6, self._icon)

		slot10 = self._object
		slot8 = self._object.w(slot9) / 2

		self._icon.set_center_x(slot6, self._icon)

		slot10 = self._object
		slot8 = self._object.h(slot9) / 2

		self._icon.set_center_y(slot6, self._icon)

		slot7 = 1 + math.random() * 0.5

		wait(slot6)

		delay = nil
	end

	return 
end
function RaidGUIControlBreadcrumb:_get_sine_wave_interpolation(amplitude, t, duration)
	slot9 = 17 * math.pi
	slot7 = (math.deg(math.pi) * t) / duration

	return amplitude * math.sin(slot5) * math.sin((math.deg(slot7) * t) / duration)
end
function RaidGUIControlBreadcrumb:_animate_hide(icon)
	local t = 0
	local duration = 0.4
	slot10 = RaidGUIControlBreadcrumb.IMAGE
	slot7 = tweak_data.gui.icon_w(slot8, tweak_data.gui) * RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE

	self._icon.set_w(slot5, self._icon)

	slot10 = RaidGUIControlBreadcrumb.IMAGE
	slot7 = tweak_data.gui.icon_h(RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE, tweak_data.gui) * RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE

	self._icon.set_h(slot5, self._icon)

	slot9 = self._object
	slot7 = self._object.w(RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE) / 2

	self._icon.set_center_x(slot5, self._icon)

	slot9 = self._object
	slot7 = self._object.h(RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE) / 2

	self._icon.set_center_y(slot5, self._icon)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_rotation = Easing.quartic_in(slot6, t, 0, RaidGUIControlBreadcrumb.HIDE_ANIMATION_ROTATION)
		slot9 = current_rotation

		self._icon.set_rotation(t, self._icon)

		local current_scale = Easing.quartic_in(t, t, RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE, RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE - RaidGUIControlBreadcrumb.HIDE_ANIMATION_INITIAL_SCALE)
		slot13 = RaidGUIControlBreadcrumb.IMAGE
		slot10 = tweak_data.gui.icon_w(duration, tweak_data.gui) * current_scale

		self._icon.set_w(t, self._icon)

		slot13 = RaidGUIControlBreadcrumb.IMAGE
		slot10 = tweak_data.gui.icon_h(duration, tweak_data.gui) * current_scale

		self._icon.set_h(t, self._icon)

		slot12 = self._object
		slot10 = self._object.w(duration) / 2

		self._icon.set_center_x(t, self._icon)

		slot12 = self._object
		slot10 = self._object.h(duration) / 2

		self._icon.set_center_y(t, self._icon)

		slot12 = duration - 0.05
		local current_alpha = Easing.quartic_in(t, t, 1, -1)
		slot11 = current_alpha

		self._icon.set_alpha(t, self._icon)
	end

	slot7 = RaidGUIControlBreadcrumb.HIDE_ANIMATION_ROTATION

	self._icon.set_rotation(slot5, self._icon)

	slot10 = RaidGUIControlBreadcrumb.IMAGE
	slot7 = tweak_data.gui.icon_w(slot8, tweak_data.gui) * RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE

	self._icon.set_w(slot5, self._icon)

	slot10 = RaidGUIControlBreadcrumb.IMAGE
	slot7 = tweak_data.gui.icon_h(RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE, tweak_data.gui) * RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE

	self._icon.set_h(slot5, self._icon)

	slot9 = self._object
	slot7 = self._object.w(RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE) / 2

	self._icon.set_center_x(slot5, self._icon)

	slot9 = self._object
	slot7 = self._object.h(RaidGUIControlBreadcrumb.HIDE_ANIMATION_FINAL_SCALE) / 2

	self._icon.set_center_y(slot5, self._icon)

	slot7 = 0

	self._icon.set_alpha(slot5, self._icon)

	return 
end

return 
