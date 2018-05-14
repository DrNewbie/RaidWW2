CoreMaterialEditorRemote = CoreMaterialEditorRemote or class()
CoreMaterialEditorRemote.PORT = 11332
CoreMaterialEditorRemote.TEMP_PATH = "core/temp/"
function CoreMaterialEditorRemote:init()
	slot5 = self

	Network.bind(slot2, Network, self.PORT)

	return 
end
function CoreMaterialEditorRemote:reload_shader_libs()
	slot4 = self.TEMP_PATH .. "temp_rt.xml"

	Application.update_filesystem_index(slot2, Application)

	slot4 = self.TEMP_PATH .. "temp_rt.xml"

	Application.load_render_templates(slot2, Application)

	slot3 = SystemInfo

	if SystemInfo.platform(slot2) == "WIN32" then
		slot3 = SystemInfo

		if SystemInfo.renderer(slot2) == "DX10" then
			slot4 = self.TEMP_PATH .. "temp_lib_win32dx10.diesel"

			Application.update_filesystem_index(slot2, Application)

			slot4 = self.TEMP_PATH .. "temp_lib_win32dx10"

			Application.load_shader_config(slot2, Application)
		else
			slot4 = self.TEMP_PATH .. "temp_lib_win32dx9.diesel"

			Application.update_filesystem_index(slot2, Application)

			slot4 = self.TEMP_PATH .. "temp_lib_win32dx9"

			Application.load_shader_config(slot2, Application)
		end
	else
		slot3 = SystemInfo

		if SystemInfo.platform(slot2) == "X360" then
			slot4 = self.TEMP_PATH .. "temp_lib_x360.diesel"

			Application.update_filesystem_index(slot2, Application)

			slot4 = self.TEMP_PATH .. "temp_lib_x360"

			Application.load_shader_config(slot2, Application)
		else
			slot4 = self.TEMP_PATH .. "temp_lib_ps3.diesel"

			Application.update_filesystem_index(slot2, Application)

			slot4 = self.TEMP_PATH .. "temp_lib_ps3"

			Application.load_shader_config(slot2, Application)
		end
	end

	return 
end

return 
