HUDWeaponBase = HUDWeaponBase or class()
HUDWeaponBase.ALPHA_WHEN_SELECTED = 1
HUDWeaponBase.ALPHA_WHEN_UNSELECTED = 0.5
function HUDWeaponBase:init(index, weapons_panel, tweak_data)
	self._tweak_data = tweak_data

	return 
end
function HUDWeaponBase:panel()
	return self._object
end
function HUDWeaponBase:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDWeaponBase:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDWeaponBase:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDWeaponBase:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDWeaponBase:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDWeaponBase:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	self._index = nil

	return 
end
function HUDWeaponBase:destroy()
	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end
function HUDWeaponBase:index()
	return self._index
end
function HUDWeaponBase:name_id()
	return self._tweak_data.name_id
end
function HUDWeaponBase:set_index(index)
	self._index = index

	return 
end
function HUDWeaponBase:set_current_clip(current_clip)
	return 
end
function HUDWeaponBase:set_current_left(current_left)
	return 
end
function HUDWeaponBase:set_max_clip(max_clip)
	return 
end
function HUDWeaponBase:set_max(max)
	return 
end
function HUDWeaponBase:set_selected(selected)
	slot4 = self._object

	self._object.stop(slot3)

	slot9 = "_animate_alpha"
	slot6 = (selected and HUDWeaponBase.ALPHA_WHEN_SELECTED) or HUDWeaponBase.ALPHA_WHEN_UNSELECTED

	self._object.animate(slot3, self._object, callback(slot6, self, self))

	return 
end
function HUDWeaponBase:_animate_alpha(root_panel, new_alpha)
	local start_alpha = (new_alpha == HUDWeaponBase.ALPHA_WHEN_SELECTED and HUDWeaponBase.ALPHA_WHEN_UNSELECTED) or HUDWeaponBase.ALPHA_WHEN_SELECTED
	local duration = 0.2
	slot7 = self._object
	local t = (self._object.alpha(slot6) - start_alpha) / (new_alpha - start_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_alpha = Easing.quartic_in_out(slot8, t, start_alpha, new_alpha - start_alpha)
		slot11 = current_alpha

		self._object.set_alpha(t, self._object)

		if self._current_clip_text then
			slot11 = 1

			self._current_clip_text.set_alpha(slot9, self._current_clip_text)
		end
	end

	slot9 = new_alpha

	self._object.set_alpha(slot7, self._object)

	if self._current_clip_text then
		slot9 = 1

		self._current_clip_text.set_alpha(slot7, self._current_clip_text)
	end

	return 
end

return 
