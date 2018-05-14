slot2 = "lib/managers/menu/renderers/MenuNodeBaseGui"

require(slot1)

if not MenuNodeJukeboxGui then
	slot2 = MenuNodeBaseGui
	slot0 = class(slot1)
end

MenuNodeJukeboxGui = slot0
function MenuNodeJukeboxGui:init(node, layer, parameters)
	parameters.align = "left"
	parameters._align_line_proportions = 0.5
	slot9 = parameters

	MenuNodeJukeboxGui.super.init(slot5, self, node, layer)

	slot9 = self.item_panel
	slot9 = self.item_panel.parent(layer)
	slot7 = self.item_panel.parent(layer).y(layer) + 165

	self.item_panel.set_y(slot5, self.item_panel)

	slot6 = self

	self._set_topic_position(slot5)

	slot6 = node
	node.parameters(slot5).block_back = true
	slot6 = node
	node.parameters(true).allow_pause_menu = true

	return 
end
function MenuNodeJukeboxGui:close()
	slot3 = self

	MenuNodeJukeboxGui.super.close(slot2)

	return 
end

return 
