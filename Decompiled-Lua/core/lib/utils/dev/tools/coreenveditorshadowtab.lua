slot3 = "CoreEnvironmentFeeder"

core.import(slot1, core)

ShadowBlock = ShadowBlock or CoreClass.class()
function ShadowBlock:init()
	self._parameters = {}

	return 
end
function ShadowBlock:map()
	return self._parameters
end
function ShadowBlock:set(key, value)
	self._parameters[key] = value

	return 
end
function ShadowBlock:get(key)
	return self._parameters[key]
end
CoreEnvEditor = CoreEnvEditor or class()
function CoreEnvEditor:init_shadow_tab()
	self._shadow_blocks = {}
	self._shadow_params = {}
	slot3 = self

	self.create_shadow_tab(slot2)

	slot3 = self

	self.parse_shadow_data(slot2)

	slot3 = Draw
	self._debug_pen = Draw.pen(slot2)

	return 
end
function CoreEnvEditor:load_shadow_data(block)
	slot6 = block

	for k, v in pairs(block.map(slot5)) do
		local param = self._shadow_params[k]

		if param then
			slot11 = v

			param.set_value(slot9, param)
		end
	end

	return 
end
function CoreEnvEditor:parse_shadow_data()
	local values = {}
	slot6 = CoreEnvironmentFeeder.PostShadowSlice0Feeder.DATA_PATH_KEY
	values.slice0 = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot6 = CoreEnvironmentFeeder.PostShadowSlice1Feeder.DATA_PATH_KEY
	values.slice1 = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot6 = CoreEnvironmentFeeder.PostShadowSlice2Feeder.DATA_PATH_KEY
	values.slice2 = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot6 = CoreEnvironmentFeeder.PostShadowSlice3Feeder.DATA_PATH_KEY
	values.slice3 = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot6 = CoreEnvironmentFeeder.PostShadowSliceOverlapFeeder.DATA_PATH_KEY
	values.shadow_slice_overlap = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot6 = CoreEnvironmentFeeder.PostShadowSliceDepthsFeeder.DATA_PATH_KEY
	values.shadow_slice_depths = managers.viewport.get_environment_value(slot3, managers.viewport, self._env_path)
	slot5 = values
	local block = self.convert_to_block(slot3, self)
	self._shadow_blocks[self._env_path] = block
	slot6 = block

	self.load_shadow_data(self._env_path, self)

	return 
end
function CoreEnvEditor:set_params_enabled(b)
	slot4 = self._shadow_params

	for _, v in pairs(slot3) do
		slot10 = "enabling " .. _

		cat_print(slot8, "debug")

		slot10 = b

		v._slider.set_enabled(slot8, v._slider)
	end

	return 
end
function CoreEnvEditor:clear_param_sliders()
	slot3 = self._shadow_params

	for k, v in pairs(slot2) do
		slot9 = 1

		v.set_value(slot7, v)
	end

	return 
end
function CoreEnvEditor:serialize(str)
	slot4 = self._shadow_params

	for k, v in pairs(slot3) do
		slot10 = k
		slot13 = v

		self._shadow_blocks[str].set(slot8, self._shadow_blocks[str], v.get_value(slot12))
	end

	return 
end
function CoreEnvEditor:convert_to_block(values)
	local block = ShadowBlock.new(slot3)
	slot7 = values.shadow_slice_depths.x

	block.set(ShadowBlock, block, "d0")

	slot7 = values.shadow_slice_depths.y

	block.set(ShadowBlock, block, "d1")

	slot7 = values.shadow_slice_depths.z

	block.set(ShadowBlock, block, "d2")

	slot7 = values.slice3.y

	block.set(ShadowBlock, block, "d3")

	slot7 = values.shadow_slice_overlap.x

	block.set(ShadowBlock, block, "o1")

	slot7 = values.shadow_slice_overlap.y

	block.set(ShadowBlock, block, "o2")

	slot7 = values.shadow_slice_overlap.z

	block.set(ShadowBlock, block, "o3")

	return block
end
function CoreEnvEditor:shadow_feed_params(feed_params)
	local interface_params = self._posteffect.post_processors.shadow_processor.modifiers.shadow_modifier.params
	slot8 = interface_params.d0
	local s0 = Vector3(slot4, 0, interface_params.d0.get_value(slot7))
	slot9 = interface_params.o1
	slot9 = interface_params.d1
	local s1 = Vector3(0, interface_params.d0.get_value(0) - interface_params.o1.get_value(interface_params.d0), interface_params.d1.get_value(interface_params.d0))
	slot10 = interface_params.o2
	slot10 = interface_params.d2
	local s2 = Vector3(interface_params.d0.get_value(0) - interface_params.o1.get_value(interface_params.d0), interface_params.d1.get_value(0) - interface_params.o2.get_value(interface_params.d1), interface_params.d2.get_value(interface_params.d1))
	slot11 = interface_params.o3
	slot11 = interface_params.d3
	local s3 = Vector3(interface_params.d1.get_value(0) - interface_params.o2.get_value(interface_params.d1), interface_params.d2.get_value(0) - interface_params.o3.get_value(interface_params.d2), interface_params.d3.get_value(interface_params.d2))
	slot10 = interface_params.d1.get_value(interface_params.d0)
	slot13 = interface_params.d2
	local shadow_slice_depths = Vector3(interface_params.d2.get_value(0) - interface_params.o3.get_value(interface_params.d2), interface_params.d0.get_value(0), interface_params.d2.get_value(interface_params.d1))
	slot11 = interface_params.o2.get_value(interface_params.o1)
	slot14 = interface_params.o3
	local shadow_slice_overlaps = Vector3(interface_params.d0.get_value(0), interface_params.o1.get_value(interface_params.d2.get_value), interface_params.o3.get_value(interface_params.o2))
	feed_params.slice0 = s0
	feed_params.slice1 = s1
	feed_params.slice2 = s2
	feed_params.slice3 = s3
	feed_params.shadow_slice_depths = shadow_slice_depths
	feed_params.shadow_slice_overlap = shadow_slice_overlaps

	return feed_params
end
function CoreEnvEditor:create_shadow_tab()
	slot6 = ""
	local panel = EWS.Panel(slot2, EWS, self._main_notebook, "")
	slot5 = "VERTICAL"
	local panel_box = EWS.BoxSizer(EWS, EWS)
	local scrolled_window = EWS.ScrolledWindow(EWS, EWS, panel, "")
	slot6 = scrolled_window
	slot11 = 0

	scrolled_window.set_scroll_rate(EWS, Vector3("VSCROLL", 0, 1))

	slot11 = 0
	slot7 = Vector3("VSCROLL", 0, 0)
	slot12 = -1

	scrolled_window.set_virtual_size_hints(EWS, scrolled_window, Vector3(0, 1, -1))

	slot6 = scrolled_window
	slot11 = 0

	scrolled_window.set_virtual_size(EWS, Vector3(Vector3, 200, 2000))

	slot7 = "VERTICAL"
	local box = EWS.BoxSizer(EWS, EWS)
	slot10 = "Settings"
	local settings_box = EWS.StaticBoxSizer(EWS, EWS, scrolled_window, "VERTICAL")
	slot12 = "d0"
	slot24 = true
	self._shadow_params.d0 = self.add_post_processors_param(scrolled_window, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "First slice depth start", nil, 1, 10000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(scrolled_window, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "First slice depth start", nil, 1, 10000, 1, 1)), settings_box, self._shadow_params.d0._box, 0, 0)

	slot12 = "d1"
	slot24 = true
	self._shadow_params.d1 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Second slice depth start", nil, 1, 10000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Second slice depth start", nil, 1, 10000, 1, 1)), settings_box, self._shadow_params.d1._box, 0, 0)

	slot12 = "d2"
	slot24 = true
	self._shadow_params.d2 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Third slice depth start", nil, 1, 10000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Third slice depth start", nil, 1, 10000, 1, 1)), settings_box, self._shadow_params.d2._box, 0, 0)

	slot12 = "d3"
	slot24 = true
	self._shadow_params.d3 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Third slice depth end", nil, 1, 50000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Third slice depth end", nil, 1, 50000, 1, 1)), settings_box, self._shadow_params.d3._box, 0, 0)

	slot12 = "o1"
	slot24 = true
	self._shadow_params.o1 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Blend overlap between first and second shadow slice", nil, 1, 10000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Blend overlap between first and second shadow slice", nil, 1, 10000, 1, 1)), settings_box, self._shadow_params.o1._box, 0, 0)

	slot12 = "o2"
	slot24 = true
	self._shadow_params.o2 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Blend overlap between second and third shadow slice", nil, 1, 10000, 1, 1))
	slot12 = "EXPAND"

	settings_box.add(self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Blend overlap between second and third shadow slice", nil, 1, 10000, 1, 1)), settings_box, self._shadow_params.o2._box, 0, 0)

	slot12 = "o3"
	slot24 = true
	slot7 = self.add_post_processors_param(settings_box, self, "shadow_processor", "shadow_modifier", SingelSlider.new(slot14, SingelSlider, self, scrolled_window, "Blend overlap between third and forth shadow slice", nil, 1, 10000, 1, 1))
	self._shadow_params.o3 = slot7
	slot12 = "EXPAND"

	settings_box.add(slot7, settings_box, self._shadow_params.o3._box, 0, 0)

	slot11 = "slice0"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot11 = "slice1"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot11 = "slice2"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot11 = "slice3"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot11 = "shadow_slice_overlap"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot11 = "shadow_slice_depths"
	slot14 = DummyWidget

	self.add_post_processors_param(slot7, self, "shadow_processor", "shadow_modifier", DummyWidget.new(SingelSlider.new))

	slot12 = "EXPAND"

	box.add(slot7, box, settings_box, 0, 0)

	slot9 = box

	scrolled_window.set_sizer(slot7, scrolled_window)

	slot12 = "EXPAND"

	panel_box.add(slot7, panel_box, scrolled_window, 1, 0)

	slot9 = panel_box

	panel.set_sizer(slot7, panel)

	slot11 = false

	self._main_notebook.add_page(slot7, self._main_notebook, panel, "Shadow slices")

	return 
end

return 
