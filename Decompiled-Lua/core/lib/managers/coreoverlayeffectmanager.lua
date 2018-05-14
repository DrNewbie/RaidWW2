-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreOverlayEffectManager"

core.module(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

OverlayEffectManager = OverlayEffectManager or class()
function OverlayEffectManager:init()
	local gui = Overlay.newgui(slot2)
	self._vp_overlay = Application.create_scene_viewport(Overlay, Application, 0, 0, 1)
	slot4 = Overlay
	self._overlay_camera = Overlay.create_camera(Overlay)
	slot5 = self._overlay_camera

	self._vp_overlay.set_camera(Overlay, self._vp_overlay)

	slot4 = gui
	self._ws = gui.create_screen_workspace(Overlay)
	slot4 = self._ws
	slot7 = TimerManager

	self._ws.set_timer(Overlay, TimerManager.main(0))

	self._playing_effects = {}
	self._paused = nil
	self._presets = {}
	slot12 = 0

	self.add_preset(Overlay, self, "custom")

	slot5 = 1999

	self.set_default_layer(Overlay, self)

	slot4 = managers.viewport
	slot9 = "change_resolution"

	managers.viewport.add_resolution_changed_func(Overlay, callback({
		blend_mode = "normal",
		fade_in = 0,
		sustain = 0,
		fade_out = 0,
		color = Color(1, 1, 0, 0)
	}, self, self))

	return 
end
function OverlayEffectManager:set_visible(visible)
	slot4 = self._ws
	slot5 = visible

	self._ws.panel(slot3).set_visible(slot3, self._ws.panel(slot3))

	return 
end
function OverlayEffectManager:add_preset(name, settings)
	self._presets[name] = settings

	return 
end
function OverlayEffectManager:presets()
	return self._presets
end
function OverlayEffectManager:set_default_layer(layer)
	self._default_layer = layer

	return 
end
function OverlayEffectManager:update(t, dt)
	slot5 = self._vp_overlay

	self._vp_overlay.update(slot4)

	slot5 = self

	self.check_pause_state(slot4)

	slot7 = dt

	self.progress_effects(slot4, self, t)

	return 
end
function OverlayEffectManager:destroy()
	slot3 = self._overlay_camera

	if CoreCode.alive(slot2) then
		slot4 = self._overlay_camera

		Overlay.delete_camera(slot2, Overlay)

		self._overlay_camera = nil
	end

	if self._vp_overlay then
		slot4 = self._vp_overlay

		Application.destroy_viewport(slot2, Application)

		self._vp_overlay = nil
	end

	slot3 = self._ws

	if CoreCode.alive(slot2) then
		slot3 = Overlay
		slot4 = self._ws

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))

		self._ws = nil
	end

	return 
end
function OverlayEffectManager:render()
	if Global.render_debug.render_overlay then
		slot5 = self._vp_overlay

		Application.render(slot2, Application, "Overlay")
	end

	return 
end
function OverlayEffectManager:progress_effects(t, dt, paused)
	slot6 = self._playing_effects

	for key, effect in pairs(slot5) do
		local data = effect.data

		if not paused or data.play_paused then

			-- Decompilation error in this vicinity:
			local fade_in_end_t = effect.start_t + data.fade_in
			local sustain_end_t = data.sustain and fade_in_end_t + data.sustain
			local effect_end_t = sustain_end_t and sustain_end_t + data.fade_out
			local new_alpha = nil

			if eff_t < fade_in_end_t then
				new_alpha = (eff_t - effect.start_t) / data.fade_in
			elseif not sustain_end_t or eff_t < sustain_end_t then
				new_alpha = 1
			elseif eff_t < effect_end_t then
				new_alpha = 1 - (eff_t - sustain_end_t) / data.fade_out
			else
				slot17 = self._ws
				slot18 = effect.rectangle

				self._ws.panel(slot16).remove(slot16, self._ws.panel(slot16))

				slot17 = self._ws
				slot18 = effect.text

				self._ws.panel(slot16).remove(slot16, self._ws.panel(slot16))

				self._playing_effects[key] = nil
			end

			if new_alpha then
				new_alpha = new_alpha * data.color.alpha
				effect.current_alpha = new_alpha

				if effect.gradient_points then
					for i = 2, #effect.gradient_points, 2 do
						slot23 = new_alpha
						effect.gradient_points[i] = effect.gradient_points[i].with_alpha(slot21, effect.gradient_points[i])
					end

					slot18 = effect.gradient_points

					effect.rectangle.set_gradient_points(slot16, effect.rectangle)
				else
					slot17 = effect.rectangle
					slot21 = new_alpha

					effect.rectangle.set_color(slot16, data.color.with_alpha(slot19, data.color))
				end

				slot17 = effect.text
				slot21 = new_alpha * ((data.text_color and data.text_color.alpha) or 1)

				effect.text.set_color(slot16, data.text_color or Color.white.with_alpha(slot19, data.text_color or Color.white))
			end
		end
	end

	return 
end
function OverlayEffectManager:paused_update(t, dt)
	slot6 = true

	self.check_pause_state(slot4, self)

	slot8 = true

	self.progress_effects(slot4, self, t, dt)

	return 
end
function OverlayEffectManager:check_pause_state(paused)
	if self._paused then
		if not paused then
			slot4 = self._playing_effects

			for key, effect in pairs(slot3) do
				slot9 = effect.rectangle

				effect.rectangle.show(slot8)

				slot9 = effect.text

				effect.text.show(slot8)
			end

			self._paused = nil
		end
	elseif paused then
		slot4 = self._playing_effects

		for _, effect in pairs(slot3) do
			if not effect.data.play_paused then
				slot9 = effect.rectangle

				effect.rectangle.hide(slot8)

				slot9 = effect.text

				effect.text.hide(slot8)
			end
		end

		self._paused = true
	end

	return 
end
function OverlayEffectManager:play_effect(data)
	if data then
		local spawn_alpha = data.color.alpha * ((0 < data.fade_in and 0) or 1)
		local rectangle = nil

		if data.gradient_points then
			slot6 = self._ws
			slot7 = {
				w = RenderSettings.resolution.x,
				h = RenderSettings.resolution.y,
				color = data.color.with_alpha(slot9, data.color),
				gradient_points = data.gradient_points,
				orientation = data.orientation
			}
			slot11 = spawn_alpha
			rectangle = self._ws.panel(slot5).gradient(slot5, self._ws.panel(slot5))
		else
			slot6 = self._ws
			slot7 = {
				w = RenderSettings.resolution.x,
				h = RenderSettings.resolution.y,
				color = data.color.with_alpha(slot9, data.color)
			}
			slot11 = spawn_alpha
			rectangle = self._ws.panel(slot5).rect(slot5, self._ws.panel(slot5))
		end

		slot7 = self._default_layer

		rectangle.set_layer(slot5, rectangle)

		slot7 = data.blend_mode

		rectangle.set_blend_mode(slot5, rectangle)

		if data.play_paused or not self._paused then
			slot6 = rectangle

			rectangle.show(slot5)
		else
			slot6 = rectangle

			rectangle.hide(slot5)
		end

		slot6 = self._ws
		slot7 = {
			vertical = "center",
			valign = "center",
			align = "center",
			halign = "center",
			text = data.text or "",
			font = data.font or "core/fonts/system_font",
			font_size = data.font_size or 21,
			blend_mode = data.text_blend_mode or data.blend_mode or "normal",
			color = data.text_color or Color.white.with_alpha(slot9, data.text_color or Color.white),
			layer = self._default_layer + 1
		}
		slot11 = spawn_alpha * ((data.text_color and data.text_color.alpha) or 1)
		local text = self._ws.panel(slot5).text(slot5, self._ws.panel(slot5))

		if data.text_to_upper then
			slot7 = text
			slot12 = text

			text.set_text(slot6, utf8.to_upper(text.text(slot11)))
		end

		local effect = {
			rectangle = rectangle,
			text = text
		}

		if not data.timer then
			slot8 = TimerManager
			slot6 = TimerManager.game(slot7)
		end

		slot8 = slot6
		effect.start_t = slot6.time(slot7)
		effect.data = {}
		effect.current_alpha = spawn_alpha
		effect.gradient_points = data.gradient_points
		slot8 = data

		for key, value in pairs(slot7) do
			effect.data[key] = value
		end

		local id = 1

		while self._playing_effects[id] do
			id = id + 1
		end

		slot11 = effect

		table.insert(slot8, self._playing_effects, id)

		return id
	else
		slot5 = "OverlayEffectManager, no effect_data sent to play_effect"

		cat_error(slot3, "georgios")
	end

	return 
end
function OverlayEffectManager:stop_effect(id)
	if id then
		if self._playing_effects[id] then
			slot4 = self._ws
			slot5 = self._playing_effects[id].rectangle

			self._ws.panel(slot3).remove(slot3, self._ws.panel(slot3))

			slot4 = self._ws
			slot5 = self._playing_effects[id].text

			self._ws.panel(slot3).remove(slot3, self._ws.panel(slot3))

			self._playing_effects[id] = nil
		end
	else
		slot4 = self._playing_effects

		for key, effect in pairs(slot3) do
			slot9 = self._ws
			slot10 = effect.rectangle

			self._ws.panel(slot8).remove(slot8, self._ws.panel(slot8))

			slot9 = self._ws
			slot10 = effect.text

			self._ws.panel(slot8).remove(slot8, self._ws.panel(slot8))

			self._playing_effects[key] = nil
		end
	end

	return 
end
function OverlayEffectManager:fade_out_effect(id)
	if id then
		local effect = self._playing_effects[id]

		if effect then
			if not effect.data.timer then
				slot5 = TimerManager
				slot3 = TimerManager.game(slot4)
			end

			effect.start_t = slot3.time(slot4)
			effect.data.sustain = 0
			effect.data.fade_in = 0
			slot7 = effect.current_alpha
			effect.data.color = effect.data.color.with_alpha(slot3, effect.data.color)
		end
	else
		slot4 = self._playing_effects

		for key, effect in pairs(slot3) do
			if not effect.data.timer then
				slot9 = TimerManager
				slot7 = TimerManager.game(slot8)
			end

			effect.start_t = slot7.time(slot8)
			effect.data.sustain = 0
			effect.data.fade_in = 0
			slot11 = effect.current_alpha
			effect.data.color = effect.data.color.with_alpha(slot7, effect.data.color)
		end
	end

	return 
end
function OverlayEffectManager:change_resolution()
	local res = RenderSettings.resolution
	slot4 = self._playing_effects

	for _, effect in pairs(slot3) do
		slot10 = {
			w = res.x,
			h = res.y
		}

		effect.rectangle.configure(slot8, effect.rectangle)
	end

	return 
end

return 
