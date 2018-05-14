-- Decompilation Error: _glue_flows(node)

slot3 = "FreeFlight"

core.module(slot1, core)

slot3 = "CoreFreeFlight"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not FreeFlight then
	slot2 = CoreFreeFlight.FreeFlight
	slot0 = class(slot1)
end

FreeFlight = slot0
function FreeFlight:enable(...)
	slot3 = self

	FreeFlight.super.enable(slot2, ...)

	if managers.hud then
		slot3 = managers.hud

		managers.hud.set_freeflight_disabled(slot2)
	end

	return 
end
function FreeFlight:disable(...)
	slot3 = self

	FreeFlight.super.disable(slot2, ...)

	if managers.hud then
		slot3 = managers.hud

		managers.hud.set_freeflight_enabled(slot2)
	end

	return 
end
function FreeFlight:_pause()
	slot4 = true

	Application.set_pause(slot2, Application)

	return 
end
function FreeFlight:_unpause()
	slot4 = false

	Application.set_pause(slot2, Application)

	return 
end
slot3 = FreeFlight

CoreClass.override_class(function (self)
	slot4 = false

	Application.set_pause(slot2, Application)

	return 
end, CoreFreeFlight.FreeFlight)

return 
