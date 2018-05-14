CoreEnvEditor = CoreEnvEditor or class()
function CoreEnvEditor:create_interface()
	slot4 = "sun_ray_color"
	slot12 = "Global illumination"
	local gui = self.add_sky_param(slot2, self, EnvEdColorBox.new(slot6, EnvEdColorBox, self, self.get_tab("Sun color", self)))

	self.add_gui_element(self, self, gui, "Global illumination")

	slot5 = "sun_ray_color_scale"
	slot13 = "Global illumination"
	slot16 = 1000
	gui = self.add_sky_param(self, self, SingelSlider.new("Global lighting", SingelSlider, self, self.get_tab(self, self), "Sun intensity", nil, 0, 10000, 1000))

	self.add_gui_element(self, self, gui, "Global illumination")

	slot5 = "sky_rotation"
	slot13 = "Global illumination"
	slot16 = 1
	gui = self.add_sky_param(self, self, SingelSlider.new("Global lighting", SingelSlider, self, self.get_tab("Sun intensity", self), "Sun rotation", nil, 0, 359, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "fog_start_color"
	slot15 = "Global illumination"
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", EnvEdColorBox.new(self, EnvEdColorBox, self, self.get_tab(0, self)))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "fog_far_low_color"
	slot15 = "Global illumination"
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", EnvEdColorBox.new(self, EnvEdColorBox, self, self.get_tab("Fog start color", self)))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "fog_min_range"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Fog far low color", self), "Fog min range", nil, 0, 5000, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "fog_max_range"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Fog min range", self), "Fog max range", nil, 0, 500000, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "fog_max_density"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Fog max range", self), "Fog max density", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "sky_top_color"
	slot15 = "Global illumination"
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", EnvEdColorBox.new(self, EnvEdColorBox, self, self.get_tab("Fog max density", self)))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "sky_top_color_scale"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Ambient top color", self), "Ambient top scale", nil, 0, 10000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "sky_bottom_color"
	slot15 = "Global illumination"
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", EnvEdColorBox.new(self, EnvEdColorBox, self, self.get_tab("Ambient top scale", self)))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "sky_bottom_color_scale"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Ambient bottom color", self), "Ambient bottom scale", nil, 0, 10000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ambient_color"
	slot15 = "Global illumination"
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", EnvEdColorBox.new(self, EnvEdColorBox, self, self.get_tab("Ambient bottom scale", self)))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ambient_color_scale"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Ambient color", self), "Ambient color scale", nil, 0, 10000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ambient_falloff_scale"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Ambient color scale", self), "Ambient falloff scale", nil, 0, 10000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "effect_light_scale"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Ambient falloff scale", self), "Effect lighting scale", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "spec_factor"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Effect lighting scale", self), "Specular factor", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "gloss_factor"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "deferred", "apply_ambient", SingelSlider.new(self, SingelSlider, self, self.get_tab("Specular factor", self), "Glossiness factor", nil, -1000, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ssao_radius"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "SSAO_post_processor", "apply_SSAO", SingelSlider.new(self, SingelSlider, self, self.get_tab("Glossiness factor", self), "SSAO radius", nil, 1, 100, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ssao_intensity"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "SSAO_post_processor", "apply_SSAO", SingelSlider.new(self, SingelSlider, self, self.get_tab("SSAO radius", self), "SSAO intensity (value of 0 turns off the effect)", nil, 0, 10000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "bloom_intensity"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "bloom_combine_post_processor", "post_DOF", SingelSlider.new(self, SingelSlider, self, self.get_tab("SSAO intensity (value of 0 turns off the effect)", self), "Bloom intensity (value of 0 turns off the effect)", nil, 0, 2000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "light_scatter_density"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "volumetric_light_scatter", "post_volumetric_light_scatter", SingelSlider.new(self, SingelSlider, self, self.get_tab("Bloom intensity (value of 0 turns off the effect)", self), "Volumetric light scatter density", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "light_scatter_weight"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "volumetric_light_scatter", "post_volumetric_light_scatter", SingelSlider.new(self, SingelSlider, self, self.get_tab("Volumetric light scatter density", self), "Volumetric light scatter weight", nil, 0, 100, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "light_scatter_decay"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "volumetric_light_scatter", "post_volumetric_light_scatter", SingelSlider.new(self, SingelSlider, self, self.get_tab("Volumetric light scatter weight", self), "Volumetric light scatter decay", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "light_scatter_exposure"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "volumetric_light_scatter", "post_volumetric_light_scatter", SingelSlider.new(self, SingelSlider, self, self.get_tab("Volumetric light scatter decay", self), "Volumetric light scatter exposure (value of 0 turns off the effect)", nil, 0, 2000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "ghost_dispersal"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Volumetric light scatter exposure (value of 0 turns off the effect)", self), "Lens ghost dispersal", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "halo_width"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Lens ghost dispersal", self), "Lens halo width", nil, 0, 2000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "chromatic_distortion"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Lens halo width", self), "Lens chromatic distortion", nil, 0, 30, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "weight_exponent"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Lens chromatic distortion", self), "Lens weight exponent", nil, 1, 50, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "downsample_scale"
	slot15 = "Global illumination"
	slot18 = 1
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Lens weight exponent", self), "Lens downsample scale", nil, 0, 10, 1))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot7 = "downsample_bias"
	slot15 = "Global illumination"
	slot18 = 1000
	gui = self.add_post_processors_param(self, self, "lens_flare_post_processor", "lens_flare_material", SingelSlider.new(self, SingelSlider, self, self.get_tab("Lens downsample scale", self), "Lens downssample bias (value of 1 turns off the effect)", nil, 0, 1000, 1000))
	slot7 = "Global lighting"

	self.add_gui_element(self, self, gui, "Global illumination")

	slot6 = "color0"
	slot14 = "Skydome"
	gui = self.add_underlay_param(self, self, "sky", EnvEdColorBox.new(SingelSlider.new, EnvEdColorBox, self, self.get_tab(self.get_tab("Lens downsample scale", self), self)))
	slot7 = "Sky"

	self.add_gui_element(self, self, gui, "Skydome")

	slot6 = "color0_scale"
	slot14 = "Skydome"
	slot17 = 1000
	gui = self.add_underlay_param(self, self, "sky", SingelSlider.new(SingelSlider.new, SingelSlider, self, self.get_tab("Color top", self), "Color top scale", nil, 0, 10000, 1000))
	slot7 = "Sky"

	self.add_gui_element(self, self, gui, "Skydome")

	slot6 = "color2"
	slot14 = "Skydome"
	gui = self.add_underlay_param(self, self, "sky", EnvEdColorBox.new(SingelSlider.new, EnvEdColorBox, self, self.get_tab("Color top scale", self)))
	slot7 = "Sky"

	self.add_gui_element(self, self, gui, "Skydome")

	slot6 = "color2_scale"
	slot14 = "Skydome"
	slot17 = 1000
	gui = self.add_underlay_param(self, self, "sky", SingelSlider.new(SingelSlider.new, SingelSlider, self, self.get_tab("Color low", self), "Color low scale", nil, 0, 10000, 1000))

	self.add_gui_element(self, self, gui, "Skydome")

	slot5 = "underlay"
	slot13 = "Skydome"
	slot11 = "Underlay"
	local gui = self.add_sky_param(self, self, PathBox.new("Sky", PathBox, self, self.get_tab(self.get_tab("Color low", self), self)))

	self.add_gui_element(self, self, gui, "Skydome")

	slot6 = "global_texture"
	slot14 = "Skydome"
	slot13 = "texture"
	gui = self.add_sky_param(self, self, DBPickDialog.new("Sky", DBPickDialog, self, self.get_tab(self, self), "Global cubemap"))

	self.add_gui_element(self, self, gui, "Skydome")

	slot6 = "global_world_overlay_texture"
	slot14 = "Global textures"
	slot13 = "texture"
	gui = self.add_sky_param(self, self, DBPickDialog.new("Sky", DBPickDialog, self, self.get_tab("Global cubemap", self), "Global world overlay texture"))

	self.add_gui_element(self, self, gui, "Global textures")

	slot6 = "global_world_overlay_mask_texture"
	slot14 = "Global textures"
	slot13 = "texture"
	gui = self.add_sky_param(self, self, DBPickDialog.new("World", DBPickDialog, self, self.get_tab("Global world overlay texture", self), "Global world overlay mask texture"))
	slot8 = "World"

	self.add_gui_element(self, self, gui, "Global textures")

	slot5 = self
	slot13 = "Global textures"
	slot12 = "texture"
	gui = self.add_colorgrade(self, DBPickDialog.new("Global textures", DBPickDialog, self, self.get_tab(self.get_tab("Global world overlay texture", self), self), "Colorgrade LUT texture"))
	slot8 = "Colorgrade"

	self.add_gui_element(self, self, gui, "Global textures")

	return 
end
function CoreEnvEditor:create_simple_interface()
	return 
end

return 
