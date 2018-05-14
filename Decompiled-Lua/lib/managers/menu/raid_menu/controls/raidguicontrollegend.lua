-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlLegend then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLegend = slot0
RaidGUIControlLegend.X = 0
RaidGUIControlLegend.y = 0
RaidGUIControlLegend.W = 1200
RaidGUIControlLegend.H = 32
RaidGUIControlLegend.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlLegend.FONT_SIZE = tweak_data.gui.font_sizes.large
RaidGUIControlLegend.COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlLegend.LABEL_PADDING = 15
function RaidGUIControlLegend:init(parent, params)
	params.x = params.x or RaidGUIControlLegend.X
	params.y = params.y or RaidGUIControlLegend.Y
	params.w = params.w or RaidGUIControlLegend.W
	params.h = params.h or RaidGUIControlLegend.H
	params.color = params.color or RaidGUIControlLegend.COLOR
	slot7 = params

	RaidGUIControlLegend.super.init(slot4, self, parent)

	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	slot6 = self

	managers.raid_menu.set_current_legend_control(slot4, managers.raid_menu)

	slot6 = "menu_legend"
	slot11 = "controller_hotswap_triggered"

	managers.controller.add_hotswap_callback(slot4, managers.controller, callback(slot8, self, self))

	return 
end
function RaidGUIControlLegend:close()
	slot4 = nil

	managers.raid_menu.set_current_legend_control(slot2, managers.raid_menu)

	slot3 = self

	RaidGUIControlLegend.super.close(slot2)

	return 
end
function RaidGUIControlLegend:controller_hotswap_triggered()
	slot3 = self

	self._create_legend(slot2)

	return 
end
function RaidGUIControlLegend:set_labels(legend)
	self._legend = legend
	slot4 = self

	self._create_legend(slot3)

	return 
end
function RaidGUIControlLegend:_create_legend()

	-- Decompilation error in this vicinity:
	slot3 = self._object

	self._object.clear(slot2)

	self._labels = {}
	slot3 = managers.controller

	return 
end
function RaidGUIControlLegend:_create_console_legend(label_params)
	if not self._legend.controller then
		return 
	end

	local x = 0
	slot5 = self._legend.controller

	for _, legend_item in ipairs(slot4) do
		label_params.x = x

		if legend_item.translated_text then
			label_params.text = legend_item.translated_text
		elseif legend_item.text then
			slot13 = legend_item.macros
			label_params.text = self.translate(slot9, self, legend_item.text, true)
		else
			slot12 = true
			label_params.text = self.translate(slot9, self, legend_item)
		end

		slot11 = label_params
		local label = self._object.label(slot9, self._object)
		slot11 = label
		local _, _, w, _ = label.text_rect(self._object)
		slot16 = w

		label.set_w(slot14, label)

		if legend_item.padding then
			x = x + w + legend_item.padding
		else
			x = x + w + RaidGUIControlLegend.LABEL_PADDING
		end

		slot16 = label

		table.insert(slot14, self._labels)
	end

	return 
end
function RaidGUIControlLegend:_create_pc_legend()
	if not self._legend.keyboard then
		return 
	end

	local coord_x = 0
	local padding = 10
	slot5 = self._legend.keyboard

	for _, legend_item in ipairs(slot4) do
		local legend_pc_params = {
			icon_align = "right",
			h = 32,
			y = 0,
			name = "pc_legend_" .. legend_item.key,
			x = coord_x,
			icon = tweak_data.gui.icons.ico_nav_right_base
		}
		slot13 = true
		legend_pc_params.text = self.translate(legend_item.key, self, legend_item.key)
		legend_pc_params.on_click_callback = legend_item.callback

		if legend_item.key == "footer_back" then
			legend_pc_params.icon_align = "left"
			legend_pc_params.icon = tweak_data.gui.icons.ico_nav_back_base
		end

		slot12 = legend_pc_params
		local nav_button = self._object.navigation_button(slot10, self._object)
		slot13 = nav_button

		table.insert(self._object, self._labels)

		slot12 = nav_button
		coord_x = coord_x + nav_button.w(self._object) + padding
	end

	return 
end

return 
