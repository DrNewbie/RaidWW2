slot2 = "core/lib/setups/CoreLoadingSetup"

require(slot1)

slot2 = "lib/utils/LightLoadingScreenGuiScript"

require(slot1)

if not LightLoadingSetup then
	slot2 = CoreLoadingSetup
	slot0 = class(slot1)
end

LightLoadingSetup = slot0
function LightLoadingSetup:init()
	slot3 = Scene
	self._camera = Scene.create_camera(slot2)
	slot4 = self._camera

	LoadingViewport.set_camera(slot2, LoadingViewport)

	slot6 = Scene
	slot8 = arg.is_win32
	self._gui_wrapper = LightLoadingScreenGuiScript.new(slot2, LightLoadingScreenGuiScript, Scene.gui(slot5), arg.res, -1, arg.layer)

	return 
end
function LightLoadingSetup:update(t, dt)
	slot7 = dt

	self._gui_wrapper.update(slot4, self._gui_wrapper, -1)

	return 
end
function LightLoadingSetup:destroy()
	slot3 = self

	LightLoadingSetup.super.destroy(slot2)

	slot4 = self._camera

	Scene.delete_camera(slot2, Scene)

	return 
end

if not setup then
	slot2 = LightLoadingSetup
	slot0 = LightLoadingSetup.new(slot1)
end

setup = slot0
slot2 = setup

setup.make_entrypoint(slot1)

return 
