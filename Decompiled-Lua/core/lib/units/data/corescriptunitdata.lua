CoreScriptUnitData = CoreScriptUnitData or class()
slot5 = 0
CoreScriptUnitData.world_pos = Vector3(slot2, 0, 0)
slot5 = 0
CoreScriptUnitData.local_pos = Vector3(slot2, 0, 0)
slot5 = 0
CoreScriptUnitData.local_rot = Rotation(slot2, 0, 0)
CoreScriptUnitData.unit_id = 0
CoreScriptUnitData.name_id = "none"
CoreScriptUnitData.mesh_variation = nil
CoreScriptUnitData.material = nil
CoreScriptUnitData.unique_item = false
CoreScriptUnitData.only_exists_in_editor = false
CoreScriptUnitData.only_visible_in_editor = false
CoreScriptUnitData.editable_gui = false
CoreScriptUnitData.editable_gui_text = "Default"
CoreScriptUnitData.portal_visible_inverse = false
CoreScriptUnitData.exists_in_stages = {
	true,
	true,
	true,
	true,
	true,
	true
}
CoreScriptUnitData.helper_type = "none"
CoreScriptUnitData.disable_shadows = nil
CoreScriptUnitData.hide_on_projection_light = nil
CoreScriptUnitData.disable_on_ai_graph = nil
slot2 = Application

if Application.editor(nil) then
	function CoreScriptUnitData:init()
		self.unit_groups = {}

		return 
	end
else
	function CoreScriptUnitData:init()
		return 
	end
end

return 
