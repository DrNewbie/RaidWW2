if not MenuNodeReticleSwitchGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeReticleSwitchGui = slot0
function MenuNodeReticleSwitchGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 1
	parameters.to_upper = true
	slot9 = parameters

	MenuNodeReticleSwitchGui.super.init(slot5, self, node, layer)

	slot7 = node

	self.setup(slot5, self)

	return 
end
function MenuNodeReticleSwitchGui:setup(node)
	slot5 = "reticle_color"
	local color = node.item(slot3, node).value(slot3)
	slot6 = "reticle_type"
	local type = node.item(node.item(slot3, node), node).value(node.item(slot3, node))
	slot6 = node
	local data = node.parameters(node.item(node.item(slot3, node), node)).menu_component_data
	local part_id = data.name
	slot8 = color
	slot10 = type
	local data_string = tostring(slot7) .. " " .. tostring(slot9)
	slot11 = part_id
	local texture = managers.blackmarket.get_texture_switch_from_data(tostring(slot9), managers.blackmarket, data_string)
	slot11 = texture

	self.set_reticle_texture(managers.blackmarket, self)

	return 
end
function MenuNodeReticleSwitchGui:make_fine_text(text)
	slot4 = text
	local x, y, w, h = text.text_rect(slot3)

	text.set_size(slot7, text, w)

	slot9 = math.round(h)
	slot12 = y

	text.set_position(slot7, text, math.round(x))

	return x, y, w, h
end
function MenuNodeReticleSwitchGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	MenuNodeReticleSwitchGui.super._setup_item_panel(slot4, self, safe_rect)

	slot6 = safe_rect.width * (1 - self._align_line_proportions)

	self.item_panel.set_w(slot4, self.item_panel)

	slot8 = self.item_panel
	slot9 = self.item_panel
	slot9 = self.item_panel.parent(self.item_panel.parent(1 - self._align_line_proportions))
	slot7 = self.item_panel.parent(self.item_panel.parent(1 - self._align_line_proportions)).h(self.item_panel.parent(1 - self._align_line_proportions)) / 2

	self.item_panel.set_center(slot4, self.item_panel, self.item_panel.parent(1 - self._align_line_proportions).w(1 - self._align_line_proportions) / 2)

	local static_y = self.static_y and safe_rect.height * self.static_y

	if static_y then
		slot6 = self.item_panel

		if static_y < self.item_panel.y(slot5) then
			slot7 = static_y

			self.item_panel.set_y(slot5, self.item_panel)
		end
	end

	slot7 = math.round(self.item_panel.x(slot10))
	slot12 = self.item_panel

	self.item_panel.set_position(slot5, self.item_panel, math.round(self.item_panel.y(self.item_panel)))

	slot7 = self.item_panel

	self._rec_round_object(slot5, self)

	slot6 = self.box_panel

	if alive(slot5) then
		slot6 = self.item_panel
		slot7 = self.box_panel

		self.item_panel.parent(slot5).remove(slot5, self.item_panel.parent(slot5))

		self.box_panel = nil
	end

	slot6 = self.item_panel
	slot6 = self.item_panel.parent(slot5)
	self.box_panel = self.item_panel.parent(slot5).panel(slot5)
	slot6 = self.box_panel
	slot9 = self.item_panel

	self.box_panel.set_x(slot5, self.item_panel.x(slot8))

	slot6 = self.box_panel
	slot9 = self.item_panel

	self.box_panel.set_w(slot5, self.item_panel.w(slot8))

	slot7 = self._align_data.panel

	if self._align_data.panel.h(self.item_panel) < self.item_panel.h(slot5) then
		slot7 = 0

		self.box_panel.set_y(slot5, self.box_panel)

		slot6 = self.box_panel
		slot9 = self.item_panel
		slot9 = self.item_panel.parent(slot8)

		self.box_panel.set_h(slot5, self.item_panel.parent(slot8).h(slot8))
	else
		slot6 = self.box_panel
		slot9 = self.item_panel

		self.box_panel.set_y(slot5, self.item_panel.top(slot8))

		slot6 = self.box_panel
		slot9 = self.item_panel

		self.box_panel.set_h(slot5, self.item_panel.h(slot8))
	end

	slot8 = 20

	self.box_panel.grow(slot5, self.box_panel, 20)
	self.box_panel.move(slot5, self.box_panel, -10)

	slot7 = 151

	self.box_panel.set_layer(slot5, self.box_panel)

	slot7 = {
		w = 128,
		h = 128,
		layer = 10
	}
	self._texture_panel = self.box_panel.panel(slot5, self.box_panel)
	slot10 = self.box_panel
	slot8 = self.box_panel.h(self.box_panel) / 2

	self._texture_panel.set_center(slot5, self._texture_panel, self.box_panel.w(-10) / 2)

	slot7 = self._texture

	self._set_reticle_texture(slot5, self)

	slot8 = {
		sides = {
			1,
			1,
			1,
			1
		}
	}
	self.boxgui = BoxGuiObject.new(slot5, BoxGuiObject, self.box_panel)
	slot7 = false

	self.boxgui.set_clipping(slot5, self.boxgui)

	slot7 = 1000

	self.boxgui.set_layer(slot5, self.boxgui)

	slot7 = {
		alpha = 0.6,
		rotation = 360,
		color = Color.black
	}

	self.box_panel.rect(slot5, self.box_panel)

	slot6 = self._align_data.panel
	slot9 = self.box_panel

	self._align_data.panel.set_left(slot5, self.box_panel.left(Color.black))

	slot6 = self._list_arrows.up
	slot9 = self._align_data.panel

	self._list_arrows.up.set_world_left(slot5, self._align_data.panel.world_left(Color.black))

	slot9 = self._align_data.panel
	slot7 = self._align_data.panel.world_top(Color.black) - 10

	self._list_arrows.up.set_world_top(slot5, self._list_arrows.up)

	slot6 = self._list_arrows.up
	slot9 = self.box_panel

	self._list_arrows.up.set_width(slot5, self.box_panel.width(Color.black))

	slot7 = 360

	self._list_arrows.up.set_rotation(slot5, self._list_arrows.up)

	slot7 = 1050

	self._list_arrows.up.set_layer(slot5, self._list_arrows.up)

	slot6 = self._list_arrows.down
	slot9 = self._align_data.panel

	self._list_arrows.down.set_world_left(slot5, self._align_data.panel.world_left(Color.black))

	slot9 = self._align_data.panel
	slot7 = self._align_data.panel.world_bottom(Color.black) + 10

	self._list_arrows.down.set_world_bottom(slot5, self._list_arrows.down)

	slot6 = self._list_arrows.down
	slot9 = self.box_panel

	self._list_arrows.down.set_width(slot5, self.box_panel.width(Color.black))

	slot7 = 360

	self._list_arrows.down.set_rotation(slot5, self._list_arrows.down)

	slot7 = 1050

	self._list_arrows.down.set_layer(slot5, self._list_arrows.down)

	slot6 = self

	self._set_topic_position(slot5)

	return 
end
function MenuNodeReticleSwitchGui:update_item_dlc_locks()
	local node = self.node

	if not node then
		return 
	end

	slot5 = "reticle_type"
	local type = node.item(slot3, node).value(slot3)
	slot6 = "reticle_color"
	local color = node.item(node.item(slot3, node), node).value(node.item(slot3, node))
	slot11 = type
	local type_data = tweak_data.get_raw_value(node.item(node.item(slot3, node), node), tweak_data, "gui", "weapon_texture_switches", "types", "sight")
	slot11 = color
	local color_data = tweak_data.get_raw_value(tweak_data, tweak_data, "gui", "weapon_texture_switches", "color_indexes")
	slot8 = Application

	if Application.production_build(tweak_data) then
		slot10 = type

		assert(slot7, type_data, "Missing sight type in tweak data")

		slot10 = color

		assert(slot7, color_data, "Missing sight color in tweak data")
	end

	local type_dlc = (type_data and type_data.dlc) or false
	local color_dlc = (color_data and color_data.dlc) or false

	if type_dlc then
		slot11 = type_dlc
		slot8 = managers.dlc.is_dlc_unlocked(slot9, managers.dlc)

		if managers.dlc.is_dlc_unlocked(slot9, managers.dlc) then
			slot8 = false
		end
	else
		local pass_type = true
	end

	if color_dlc then
		slot12 = color_dlc
		slot9 = managers.dlc.is_dlc_unlocked(slot10, managers.dlc)

		if managers.dlc.is_dlc_unlocked(slot10, managers.dlc) then
			slot9 = false
		end
	else
		local pass_color = true
	end

	local type_row_item = self.row_item_by_name(slot11, self)
	type_row_item.hightlight_color = not pass_type and tweak_data.screen_colors.important_1
	type_row_item.row_item_color = not pass_type and tweak_data.screen_colors.important_1
	slot14 = "reticle_color"
	local color_row_item = self.row_item_by_name(slot12, self)
	color_row_item.hightlight_color = not pass_color and tweak_data.screen_colors.important_1
	color_row_item.row_item_color = not pass_color and tweak_data.screen_colors.important_1
	local confirm = node.item("reticle_type", node)
	local require_dlc = "dialog_require_dlc_"
	slot16 = confirm
	confirm.parameters("confirm").text_id = (not pass_type and require_dlc .. type_dlc) or (not pass_color and require_dlc .. color_dlc) or "dialog_apply"
	slot16 = self
	slot20 = "reticle_type"

	self.reload_item((not pass_type and require_dlc .. type_dlc) or (not pass_color and require_dlc .. color_dlc) or "dialog_apply", node.item(slot18, node))

	slot16 = self
	slot20 = "reticle_color"

	self.reload_item((not pass_type and require_dlc .. type_dlc) or (not pass_color and require_dlc .. color_dlc) or "dialog_apply", node.item(slot18, node))

	slot16 = self
	slot20 = "confirm"

	self.reload_item((not pass_type and require_dlc .. type_dlc) or (not pass_color and require_dlc .. color_dlc) or "dialog_apply", node.item(slot18, node))

	return pass_type and pass_color
end
function MenuNodeReticleSwitchGui:set_reticle_texture(texture)
	slot5 = texture

	self._set_reticle_texture(slot3, self)

	return 
end
function MenuNodeReticleSwitchGui:_set_reticle_texture(texture)
	if texture then
		slot4 = self._texture_panel

		if alive(slot3) then
			slot7 = "texture"
			slot6 = texture

			if DB.has(slot3, DB, Idstring(slot6)) then
				slot4 = self._texture_panel

				self._texture_panel.clear(slot3)

				slot4 = self

				self._unretrieve_texture(slot3)

				self._texture = texture
				slot4 = texture
				self._texture_ids = Idstring(slot3)
				slot5 = self._texture
				slot10 = "_texture_done_callback"
				self._texture_index = managers.menu_component.request_texture(slot3, managers.menu_component, callback(slot7, self, self))
			end
		end
	end

	return 
end
function MenuNodeReticleSwitchGui:_unretrieve_texture()
	if self._texture then
		slot5 = self._texture_index

		managers.menu_component.unretrieve_texture(slot2, managers.menu_component, self._texture)

		self._texture = nil
		self._texture_ids = nil
		self._texture_index = nil
	end

	return 
end
function MenuNodeReticleSwitchGui:_texture_done_callback(texture_ids)
	if self then
		slot4 = self._texture_panel

		if alive(slot3) then
			slot5 = {
				blend_mode = "add",
				texture = texture_ids,
				w = self._texture_panel.w(slot7),
				h = self._texture_panel.h(slot7)
			}
			slot8 = self._texture_panel
			slot8 = self._texture_panel

			self._texture_panel.bitmap(slot3, self._texture_panel)

			self._texture_index = false
		end
	end

	return 
end
function MenuNodeReticleSwitchGui:get_recticle_texture_ids()
	return self._texture_ids
end
function MenuNodeReticleSwitchGui:_setup_item_panel_parent(safe_rect, shape)
	shape = shape or {}
	shape.x = shape.x or safe_rect.x
	shape.y = shape.y or safe_rect.y + 0
	shape.w = shape.w or safe_rect.width
	shape.h = shape.h or safe_rect.height - 0
	slot7 = shape

	MenuNodeReticleSwitchGui.super._setup_item_panel_parent(slot4, self, safe_rect)

	return 
end
function MenuNodeReticleSwitchGui:_rec_round_object(object)
	if object.children then
		slot6 = object

		for i, d in ipairs(object.children(slot5)) do
			slot10 = d

			self._rec_round_object(slot8, self)
		end
	end

	slot4 = object
	local x, y = object.position(slot3)
	slot7 = math.round(slot8)
	slot10 = y

	object.set_position(slot5, object, math.round(x))

	return 
end
function MenuNodeReticleSwitchGui:_setup_item_rows(node)
	slot5 = node

	MenuNodeReticleSwitchGui.super._setup_item_rows(slot3, self)

	return 
end
function MenuNodeReticleSwitchGui:reload_item(item)
	slot5 = item

	MenuNodeReticleSwitchGui.super.reload_item(slot3, self)

	slot5 = item
	local row_item = self.row_item(slot3, self)

	if row_item then
		slot5 = row_item.gui_panel

		if alive(slot4) then
			slot6 = "right"

			row_item.gui_panel.set_halign(slot4, row_item.gui_panel)

			slot5 = row_item.gui_panel
			slot8 = self.item_panel

			row_item.gui_panel.set_right(slot4, self.item_panel.w(slot7))
		end
	end

	return 
end
function MenuNodeReticleSwitchGui:_align_marker(row_item)
	slot5 = row_item

	MenuNodeReticleSwitchGui.super._align_marker(slot3, self)

	slot4 = row_item.item

	if row_item.item.parameters(slot3).pd2_corner then
		slot4 = self._marker_data.marker
		slot7 = row_item.gui_panel

		self._marker_data.marker.set_world_right(slot3, row_item.gui_panel.world_right(slot6))

		return 
	end

	slot4 = self._marker_data.marker
	slot7 = self.item_panel

	self._marker_data.marker.set_world_right(slot3, self.item_panel.world_right(slot6))

	return 
end
function MenuNodeReticleSwitchGui:close()
	slot3 = self

	self._unretrieve_texture(slot2)

	slot3 = self

	MenuNodeReticleSwitchGui.super.close(slot2)

	return 
end

return 
