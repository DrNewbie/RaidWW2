slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementBlackscreen then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementBlackscreen = slot0
function ElementBlackscreen:init(...)
	slot3 = self

	ElementBlackscreen.super.init(slot2, ...)

	return 
end
function ElementBlackscreen:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementBlackscreen:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.action == "fade_in" then
		local data = {}
		slot6 = self._values.level
		local loading_screen = tweak_data.operations.get_loading_screen(slot4, tweak_data.operations)
		data.background = loading_screen.image
		data.loading_text = loading_screen.text
		data.skip_delete_brushes = self._values.skip_delete_brushes
		slot7 = data

		managers.menu.show_loading_screen(tweak_data.operations, managers.menu)
	elseif self._values.action == "fade_out" then
		slot4 = managers.menu

		managers.menu.hide_loading_screen(slot3)
	elseif self._values.action == "fade_to_black" then
		slot4 = managers.menu

		managers.menu.fade_to_black(slot3)
	end

	slot5 = instigator

	ElementBlackscreen.super.on_executed(slot3, self)

	return 
end

return 
