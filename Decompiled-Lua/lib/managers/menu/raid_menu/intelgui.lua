if not IntelGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

IntelGui = slot0
IntelGui.CATEGORY_BULLETINS = "bulletins"
IntelGui.CATEGORY_OPERATIONAL_STATUS = "operational_status"
IntelGui.CATEGORY_RAID_PERSONEL = "raid_personnel"
IntelGui.CATEGORY_OPPOSITION_FORCES = "opposition_forces"
IntelGui.CATEGORY_CONTROL_ARCHIVE = "control_archive"
function IntelGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	IntelGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "menu_intel_screen_name"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	return 
end
function IntelGui:_set_initial_data()
	self._selected_category = IntelGui.CATEGORY_RAID_PERSONEL

	return 
end
function IntelGui:_layout()
	slot3 = self

	self._disable_dof(slot2)

	slot3 = self

	self._layout_content(slot2)

	slot3 = self

	self._layout_tab_categories(slot2)

	slot3 = self

	self._layout_list(slot2)

	slot5 = false

	self._category_items_list.set_selected(slot2, self._category_items_list, true)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function IntelGui:_layout_tab_categories()
	local category_tabs_params = {
		name = "category_tabs",
		tab_width = 220,
		initial_tab_idx = 1,
		tab_align = "center",
		tab_height = 64,
		y = 80,
		x = 0,
		tab_font_size = tweak_data.gui.font_sizes.small
	}
	slot6 = "on_intel_category_selected"
	category_tabs_params.on_click_callback = callback(slot3, self, self)
	category_tabs_params.parent_control_ref = self
	category_tabs_params.tabs_params = {}
	slot4 = tweak_data.intel.category_index

	for category_index, category_name in ipairs(slot3) do
		category_tabs_params.tabs_params[category_index] = {
			name = "tab_" .. category_name,
			icon = nil
		}
		slot12 = true
		category_tabs_params.tabs_params[category_index].text = self.translate(category_name, self, tweak_data.intel.categories[category_name].name_id)
		category_tabs_params.tabs_params[category_index].callback_param = category_name
	end

	slot5 = category_tabs_params
	self._category_tabs = self._root_panel.tabs(slot3, self._root_panel)

	return 
end
function IntelGui:_layout_list()
	local category_items_list_scrollable_area_params = {
		scrollbar_width = 3,
		name = "category_items_list_scrollable_area",
		h = 752,
		y = 192,
		w = 384,
		x = 0,
		scroll_step = 19
	}
	slot5 = category_items_list_scrollable_area_params
	self._category_items_list_scrollable_area = self._root_panel.scrollable_area(slot3, self._root_panel)
	local category_items_list_params = {
		selection_enabled = true,
		name = "category_items_list",
		w = 384,
		on_mouse_over_sound_event = "highlight",
		y = 0,
		item_h = 62,
		x = 0,
		use_unlocked = false,
		item_font = tweak_data.gui.fonts.lato,
		item_font_size = tweak_data.gui.font_sizes.size_24
	}
	slot7 = "on_item_clicked_category_items_list"
	category_items_list_params.on_item_clicked_callback = callback(self._root_panel, self, self)
	slot7 = "on_item_selected_category_items_list"
	category_items_list_params.on_item_selected_callback = callback(self._root_panel, self, self)
	slot7 = "data_source_category_items_list"
	category_items_list_params.data_source_callback = callback(self._root_panel, self, self)
	category_items_list_params.item_class = RaidGUIControlListItem
	category_items_list_params.scrollable_area_ref = self._category_items_list_scrollable_area
	slot5 = self._category_items_list_scrollable_area
	slot6 = category_items_list_params
	self._category_items_list = self._category_items_list_scrollable_area.get_panel(self._root_panel).list(self._root_panel, self._category_items_list_scrollable_area.get_panel(self._root_panel))
	slot5 = self._category_items_list_scrollable_area

	self._category_items_list_scrollable_area.setup_scroll_area(self._root_panel)

	return 
end
function IntelGui:_layout_content()
	slot4 = self._selected_category

	self._create_category_controls(slot2, self)

	slot4 = self._selected_category

	self._setup_category_controls(slot2, self)

	return 
end
function IntelGui:close()
	slot3 = self

	IntelGui.super.close(slot2)

	return 
end
function IntelGui:on_intel_category_selected(data)
	self._selected_category = data
	slot5 = self._selected_category

	self._setup_category_controls(slot3, self)

	if self._selected_category == IntelGui.CATEGORY_CONTROL_ARCHIVE then
		slot4 = self

		self.bind_controller_inputs_play_video(slot3)
	else
		slot4 = self

		self.bind_controller_inputs(slot3)
	end

	slot4 = self._category_items_list

	self._category_items_list.refresh_data(slot3)

	slot4 = self._category_items_list_scrollable_area

	self._category_items_list_scrollable_area.setup_scroll_area(slot3)

	slot6 = false

	self._category_items_list.set_selected(slot3, self._category_items_list, true)

	return 
end
function IntelGui:on_item_clicked_category_items_list(data)
	slot5 = data.value

	self._list_item_selected(slot3, self)

	return 
end
function IntelGui:on_item_selected_category_items_list(data)
	slot5 = data.value

	self._list_item_selected(slot3, self)

	return 
end
function IntelGui:data_source_category_items_list()
	local result = {}
	local is_unlocked = true
	local data_source_table = tweak_data.intel.categories[self._selected_category].items

	if data_source_table then
		slot6 = data_source_table

		for list_item_index, list_item_data in pairs(slot5) do
			if self._selected_category == IntelGui.CATEGORY_CONTROL_ARCHIVE then
				slot13 = {
					list_item_data.id
				}
				is_unlocked = managers.unlock.is_unlocked(slot10, managers.unlock, {
					slot = UnlockManager.SLOT_PROFILE,
					identifier = UnlockManager.CATEGORY_CONTROL_ARCHIVE
				})
			elseif self._selected_category == IntelGui.CATEGORY_OPERATIONAL_STATUS or self._selected_category == IntelGui.CATEGORY_BULLETINS then
				list_item_index = #data_source_table - list_item_index + 1
				list_item_data = data_source_table[list_item_index]
			else
				is_unlocked = true
			end

			if is_unlocked then
				if #result == 0 then
					slot12 = {
						selected = true,
						text = self.translate(slot14, self, list_item_data.list_item_name_id),
						value = list_item_data.id
					}
					slot17 = false

					table.insert(slot10, result)
				else
					slot12 = {
						selected = false,
						text = self.translate(slot14, self, list_item_data.list_item_name_id),
						value = list_item_data.id
					}
					slot17 = false

					table.insert(slot10, result)
				end
			end
		end
	end

	return result
end
function IntelGui:_list_item_selected(list_item_value)
	slot5 = list_item_value

	self._show_selected_list_item_data(slot3, self)

	return 
end
function IntelGui:_create_category_controls(selected_category)
	slot6 = {
		visible = false,
		h = 752,
		y = 144,
		w = 1120,
		x = 512
	}
	self._bulletins_control = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlIntelBulletin)
	slot6 = {
		visible = false,
		h = 752,
		y = 144,
		w = 1120,
		x = 512
	}
	self._operational_status_control = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlIntelOperationalStatus)
	slot6 = {
		visible = false,
		h = 768,
		y = 160,
		w = 1088,
		x = 512
	}
	self._raid_personel_control = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlIntelRaidPersonel)
	slot6 = {
		visible = false,
		h = 704,
		y = 192,
		w = 1024,
		x = 544
	}
	self._opposite_forces_control = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlIntelOppositeForces)
	slot6 = {
		visible = false,
		h = 704,
		y = 192,
		w = 1024,
		x = 544
	}
	self._control_archive_control = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlIntelControlArchive)

	return 
end
function IntelGui:_setup_category_controls(selected_category)
	if selected_category == IntelGui.CATEGORY_BULLETINS then
		self._active_category_control = self._bulletins_control
		slot5 = true

		self._bulletins_control.set_visible(slot3, self._bulletins_control)

		slot5 = false

		self._operational_status_control.set_visible(slot3, self._operational_status_control)

		slot5 = false

		self._raid_personel_control.set_visible(slot3, self._raid_personel_control)

		slot5 = false

		self._opposite_forces_control.set_visible(slot3, self._opposite_forces_control)

		slot5 = false

		self._control_archive_control.set_visible(slot3, self._control_archive_control)
	elseif selected_category == IntelGui.CATEGORY_OPERATIONAL_STATUS then
		self._active_category_control = self._operational_status_control
		slot5 = false

		self._bulletins_control.set_visible(slot3, self._bulletins_control)

		slot5 = true

		self._operational_status_control.set_visible(slot3, self._operational_status_control)

		slot5 = false

		self._raid_personel_control.set_visible(slot3, self._raid_personel_control)

		slot5 = false

		self._opposite_forces_control.set_visible(slot3, self._opposite_forces_control)

		slot5 = false

		self._control_archive_control.set_visible(slot3, self._control_archive_control)
	elseif selected_category == IntelGui.CATEGORY_RAID_PERSONEL then
		self._active_category_control = self._raid_personel_control
		slot5 = false

		self._bulletins_control.set_visible(slot3, self._bulletins_control)

		slot5 = false

		self._operational_status_control.set_visible(slot3, self._operational_status_control)

		slot5 = true

		self._raid_personel_control.set_visible(slot3, self._raid_personel_control)

		slot5 = false

		self._opposite_forces_control.set_visible(slot3, self._opposite_forces_control)

		slot5 = false

		self._control_archive_control.set_visible(slot3, self._control_archive_control)
	elseif selected_category == IntelGui.CATEGORY_OPPOSITION_FORCES then
		self._active_category_control = self._opposite_forces_control
		slot5 = false

		self._bulletins_control.set_visible(slot3, self._bulletins_control)

		slot5 = false

		self._operational_status_control.set_visible(slot3, self._operational_status_control)

		slot5 = false

		self._raid_personel_control.set_visible(slot3, self._raid_personel_control)

		slot5 = true

		self._opposite_forces_control.set_visible(slot3, self._opposite_forces_control)

		slot5 = false

		self._control_archive_control.set_visible(slot3, self._control_archive_control)
	elseif selected_category == IntelGui.CATEGORY_CONTROL_ARCHIVE then
		self._active_category_control = self._control_archive_control
		slot5 = false

		self._bulletins_control.set_visible(slot3, self._bulletins_control)

		slot5 = false

		self._operational_status_control.set_visible(slot3, self._operational_status_control)

		slot5 = false

		self._raid_personel_control.set_visible(slot3, self._raid_personel_control)

		slot5 = false

		self._opposite_forces_control.set_visible(slot3, self._opposite_forces_control)

		slot5 = true

		self._control_archive_control.set_visible(slot3, self._control_archive_control)
	end

	return 
end
function IntelGui:_show_selected_list_item_data(list_item_value)
	slot5 = list_item_value

	self._active_category_control.set_data(slot3, self._active_category_control)

	local item_full_data = self._active_category_control.get_data(slot3)
	slot5 = self

	self._stop_intel_audio(self._active_category_control)

	if item_full_data and item_full_data.description_vo_id then
		slot6 = item_full_data.description_vo_id

		self._play_intel_audio(slot4, self)
	end

	return 
end
function IntelGui:update(t, dt)
	if self._control_archive_control then
		slot7 = dt

		self._control_archive_control.update(slot4, self._control_archive_control, t)
	end

	return 
end
function IntelGui:_play_intel_audio(intel_audio_id)
	slot5 = intel_audio_id
	self._intel_audio = managers.menu_component.post_event(slot3, managers.menu_component)

	return 
end
function IntelGui:_stop_intel_audio()
	slot4 = "play_intel_audio"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	slot3 = self._intel_audio

	if alive(slot2) then
		slot3 = self._intel_audio

		self._intel_audio.stop(slot2)

		self._intel_audio = nil
	end

	return 
end
function IntelGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_weapon_category_tab_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_weapon_category_tab_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_intel_tabs"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot7 = true

	self.set_controller_bindings(, self, bindings)

	slot6 = legend

	self.set_legend(, self)

	return 
end
function IntelGui:bind_controller_inputs_play_video()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_weapon_category_tab_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_weapon_category_tab_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_intel_tabs",
			"menu_legend_intel_play_video"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot7 = true

	self.set_controller_bindings(, self, bindings)

	slot6 = legend

	self.set_legend(, self)

	return 
end
function IntelGui:_on_weapon_category_tab_left()
	slot3 = self._category_tabs

	self._category_tabs._move_left(slot2)

	return true, nil
end
function IntelGui:_on_weapon_category_tab_right()
	slot3 = self._category_tabs

	self._category_tabs._move_right(slot2)

	return true, nil
end
function IntelGui:confirm_pressed()
	if self._selected_category == IntelGui.CATEGORY_CONTROL_ARCHIVE then
		slot3 = self._category_items_list
		local selected_item = self._category_items_list.selected_item(slot2)

		if selected_item then
			slot4 = self._category_items_list
			local selected_item_data = self._category_items_list.selected_item(slot3).data(slot3)
			slot5 = self._control_archive_control

			self._control_archive_control.play_video(self._category_items_list.selected_item(slot3))
		end
	end

	return true
end

return 
