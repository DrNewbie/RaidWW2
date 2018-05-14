if not HUDObjectivesTab then
	slot2 = HUDObjectives
	slot0 = class(slot1)
end

HUDObjectivesTab = slot0
function HUDObjectivesTab:init(panel)
	slot5 = panel

	HUDObjectivesTab.super.init(slot3, self)

	self._show_objective_descriptions = true

	return 
end

return 
