-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
SavefileGenerator = SavefileGenerator or class()
SavefileGenerator.path = "aux_assets\\inventory\\"
SavefileGenerator.savefile_slot = 11
SavefileGenerator.generate = function ()
	local file_path = SavefileGenerator._root_path() .. SavefileGenerator.path
	slot4 = file_path

	if not SystemFS.exists(slot2, SystemFS) then
		slot4 = file_path

		SystemFS.make_dir(slot2, SystemFS)
	end

	file_path = file_path .. "filesave_slot_11.xml"
	local cache_object = Global.savefile_manager.meta_data_list[SavefileGenerator.savefile_slot].cache

	SavefileGenerator._reset_indent_counter()

	slot7 = "w"
	slot3 = SystemFS.open(slot4, SystemFS, file_path)
	SavefileGenerator.file_content = slot3
	slot4 = cache_object

	SavefileGenerator._process_table(slot3)

	slot5 = SavefileGenerator.file_content

	SystemFS.close(slot3, SystemFS)

	slot5 = "Savefile Generation Completed."

	Application.trace(slot3, Application)

	return 
end
SavefileGenerator._process_table = function (table_object)
	slot3 = table_object

	for key, value in pairs(slot2) do
		slot8 = value

		if type(slot7) == "table" then
			local indent = SavefileGenerator._get_indent()
			slot10 = indent .. "<table name=\"" .. key .. "\">"

			SavefileGenerator.file_content.puts(slot8, SavefileGenerator.file_content)

			slot9 = value

			SavefileGenerator._process_table(slot8)

			slot10 = indent .. "</table>"

			SavefileGenerator.file_content.puts(slot8, SavefileGenerator.file_content)
		end
	end

	return 
end
SavefileGenerator._increase_indent_counter = function ()
	SavefileGenerator.indent_counter = SavefileGenerator.indent_counter + 1

	return 
end
SavefileGenerator._reset_indent_counter = function ()
	SavefileGenerator.indent_counter = 0

	return 
end
SavefileGenerator._get_indent = function ()
	local indent = ""

	for i = 1, SavefileGenerator.indent_counter, 1 do
		indent = indent .. SavefileGenerator.indent
	end

	return indent
end
SavefileGenerator._root_path = function ()
	slot3 = "-assetslocation"
	local path = Application.base_path(slot1) .. (CoreApp.arg_value(Application) or "..\\..\\")
	slot5 = true
	path = Application.nice_path(slot2, Application, path)
	local f = nil

	function f(s)

		-- Decompilation error in this vicinity:
		slot5 = ""
		local str, i = string.gsub(slot2, s, "\\[%w_%.%s]+\\%.%.")
	end

	slot4 = path

	return f(Application)
end

return 
