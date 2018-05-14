slot3 = "CoreInteractionEditorPropUI"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreInteractionEditorGenericPanel"

core.import(slot1, core)

InteractionEditorPropUI = InteractionEditorPropUI or CoreClass.class()
function InteractionEditorPropUI:init(parent, owner)
	slot8 = ""
	self._prop_panel = EWS.Panel(slot4, EWS, parent, "")
	slot6 = "VERTICAL"
	self._box = EWS.BoxSizer(slot4, EWS)

	self._prop_panel.set_sizer(slot4, self._prop_panel)

	self._node_panels = {}
	slot10 = owner
	self._node_panels[CoreInteractionEditorGenericPanel.NAME] = CoreInteractionEditorGenericPanel.InteractionEditorGenericPanel.new(self._box, CoreInteractionEditorGenericPanel.InteractionEditorGenericPanel, self._prop_panel, self._box)

	return 
end
function InteractionEditorPropUI:window()
	return self._prop_panel
end
function InteractionEditorPropUI:clean()
	if self._current_panel then
		slot4 = false

		self._current_panel.set_visible(slot2, self._current_panel)

		self._current_panel = nil
	end

	return 
end
function InteractionEditorPropUI:rebuild(desc, node)
	slot7 = node
	self._current_panel = self._node_panels[desc.node_type(slot5, desc)] or self._node_panels[CoreInteractionEditorGenericPanel.NAME]
	slot8 = node

	self._current_panel.set_visible(slot4, self._current_panel, true, desc)

	return 
end

return 
