-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/compilers/CoreCompilerSystem"

require(slot1)

CoreShaderLibCompiler = CoreShaderLibCompiler or class()
CoreShaderLibCompiler.SHADER_NAME = "base"
CoreShaderLibCompiler.TEMP_PATH = "core\\temp\\"
CoreShaderLibCompiler.SHADER_PATH = "core\\shader_sources\\"
CoreShaderLibCompiler.RT_PATH = "shaders\\"
CoreShaderLibCompiler.ROOT_PATH = "..\\"
function CoreShaderLibCompiler:compile(file, dest, force_recompile)
	if file.name ~= "shaders/base" or file.type ~= "render_template_database" then
		return false
	end

	if not force_recompile then
		slot8 = dest

		if self.up_to_date(slot5, self, file) then
			slot9 = file.properties

			dest.skip_update(slot5, dest, "render_template_database", file.name)

			if target() == "win32" then
				slot9 = {
					"d3d9"
				}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)

				slot9 = {
					"d3d10"
				}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)

				slot9 = {
					"d3d11"
				}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			elseif target() == "ps3" then
				slot9 = {}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			elseif target() == "ps4" then
				slot9 = {}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			elseif target() == "xb1" then
				slot9 = {}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			elseif target() == "x360" then
				slot9 = {}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			elseif target() == "lrb" then
				slot9 = {}

				dest.skip_update(slot5, dest, "shaders", "core/temp/" .. self.SHADER_NAME)
			else
				slot6 = "[CoreShaderLibCompiler] Unknown target: " .. target()

				error(slot5)
			end

			return true
		end
	end

	slot7 = "[CoreShaderLibCompiler] Compiling: " .. file.path

	cat_print(slot5, "debug")

	local params = self.create_make_file(slot5)
	slot7 = self

	self.run_compiler(self)

	if target() == "win32" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".d3d9.win32.shaders", "core/temp/" .. self.SHADER_NAME, {
			"d3d9"
		})

		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path("core/temp/" .. self.SHADER_NAME) .. self.TEMP_PATH .. self.SHADER_NAME .. ".d3d10.win32.shaders", "core/temp/" .. self.SHADER_NAME, {
			"d3d10"
		})

		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path("core/temp/" .. self.SHADER_NAME) .. self.TEMP_PATH .. self.SHADER_NAME .. ".d3d11.win32.shaders", "core/temp/" .. self.SHADER_NAME, {
			"d3d11"
		})
	elseif target() == "ps3" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".ps3.shaders", "core/temp/" .. self.SHADER_NAME, {})
	elseif target() == "xb1" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".xb1.shaders", "core/temp/" .. self.SHADER_NAME, {})
	elseif target() == "ps4" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".ps4.shaders", "core/temp/" .. self.SHADER_NAME, {})
	elseif target() == "x360" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".x360.shaders", "core/temp/" .. self.SHADER_NAME, {})
	elseif target() == "lrb" then
		slot10 = self
		slot11 = dest

		self.copy_file(slot6, self, self.base_path(slot9) .. self.TEMP_PATH .. self.SHADER_NAME .. ".lrb.shaders", "core/temp/" .. self.SHADER_NAME, {})
	else
		slot7 = "[CoreShaderLibCompiler] Unknown target: " .. target()

		error(slot6)
	end

	slot8 = params

	self.cleanup(slot6, self)

	return false
end
function CoreShaderLibCompiler:cleanup(params)
	slot5 = "[CoreShaderLibCompiler] Cleaning..."

	cat_print(slot3, "debug")

	return 
end
function CoreShaderLibCompiler:base_path()
	slot3 = self

	return self.root_path(slot2) .. "assets\\"
end
function CoreShaderLibCompiler:root_path()
	local path = data_path_abs() .. self.ROOT_PATH
	local f = nil

	function f(s)

		-- Decompilation error in this vicinity:
		slot5 = "\\"
		local str, i = string.gsub(slot2, s, "\\[%w_%.%s]+\\%.%.\\")
	end

	local out_path = f(slot4)
	slot7 = -1

	if string.sub(path, out_path) ~= "\\" then
		out_path = out_path .. "\\"
	end

	return out_path
end
function CoreShaderLibCompiler:up_to_date(file, dest)
	slot9 = file.properties

	if dest.up_to_date(slot4, dest, file.path, "render_template_database", file.name) then
		slot9 = {}

		if dest.up_to_date(slot4, dest, "core\\shader_sources\\base", "shader_source", "core/shader_sources/base") then
			slot9 = {}
			slot3 = dest.up_to_date(slot4, dest, "core\\shader_sources\\common_include", "shader_source", "core/shader_sources/common_include")
		end
	end

	return slot3
end
function CoreShaderLibCompiler:copy_file(from, to, properties, dest)
	slot8 = "rb"
	local from_file = io.open(slot6, from)

	if from_file then
		slot11 = properties
		local archive = dest.update(slot7, dest, "shaders", to)
		slot10 = "*a"
		local bin_str = from_file.read(dest, from_file)
		slot11 = bin_str

		archive.write(from_file, archive)

		slot10 = archive

		archive.close(from_file)

		slot10 = from_file

		from_file.close(from_file)
	else
		slot9 = " "

		if from.find(slot7, from) then
			slot11 = from

			error(string.format(slot9, "[CoreShaderLibCompiler] %s was not compiled! Your project path has a space in it (engine doesn't support spaces yet)."))
		else
			slot8 = "debug"
			slot12 = from

			cat_print(slot7, string.format(slot10, "[CoreShaderLibCompiler] %s was not compiled! You might be missing dll's...?."))
		end
	end

	return 
end
function CoreShaderLibCompiler:create_make_file()
	slot3 = self
	local make_params = self.get_make_params(slot2)
	slot8 = self
	local file = assert(io.open(slot5, self.base_path("w+") .. self.TEMP_PATH .. "make.xml"))
	slot6 = "<make>\n"

	file.write(io.open, file)

	slot6 = "\t<silent_fail/>\n"

	file.write(io.open, file)

	slot6 = "\t<rebuild/>\n"

	file.write(io.open, file)

	slot6 = "\t<file_io\n"

	file.write(io.open, file)

	slot5 = make_params

	for k, v in pairs(io.open) do
		slot18 = "\\"
		slot11 = "\t\t" .. k .. "=\"" .. string.gsub(slot15, v, "/") .. "\"\n"

		file.write(slot9, file)
	end

	slot6 = "\t/>\n</make>\n"

	file.write(slot4, file)

	slot5 = file

	file.close(slot4)

	return make_params
end
function CoreShaderLibCompiler:run_compiler()
	slot7 = self
	slot6 = self.TEMP_PATH
	local cmd = string.format(slot2, "%saux_assets\\engine\\bin\\shaderdev\\shaderdev -m \"%s%smake.xml\"", self.root_path(slot5), self.base_path(self))
	slot7 = "r"
	slot5 = cmd
	local file = assert("%saux_assets\\engine\\bin\\shaderdev\\shaderdev -m \"%s%smake.xml\"", io.popen(self.base_path(self), cmd))
	slot5 = file

	for line in file.lines(io.popen(self.base_path(self), cmd)) do
		slot10 = line

		cat_print(slot8, "debug")
	end

	return 
end
function CoreShaderLibCompiler:get_make_params()
	slot3 = self
	local rt = self.base_path(slot2) .. self.RT_PATH .. self.SHADER_NAME
	slot4 = self
	local src = self.base_path(self.SHADER_NAME) .. self.SHADER_PATH .. self.SHADER_NAME
	slot5 = self
	local tmp = self.base_path(self.SHADER_NAME) .. self.TEMP_PATH
	local make_params = {
		source = src .. ".shader_source",
		working_directory = tmp,
		render_templates = rt .. ".render_template_database"
	}

	if target() == "win32" then
		make_params.win32d3d9 = tmp .. self.SHADER_NAME .. ".d3d9.win32.shaders"
		make_params.win32d3d10 = tmp .. self.SHADER_NAME .. ".d3d10.win32.shaders"
		make_params.win32d3d11 = tmp .. self.SHADER_NAME .. ".d3d11.win32.shaders"
		make_params.ogl = tmp .. self.SHADER_NAME .. ".ogl.win32.shaders"
		make_params.ps3 = ""
		make_params.ps4 = ""
		make_params.xb1 = ""
		make_params.x360d3d9 = ""
		make_params.lrb = ""
	elseif target() == "ps3" then
		make_params.win32d3d9 = ""
		make_params.win32d3d10 = ""
		make_params.win32d3d11 = ""
		make_params.ogl = ""
		make_params.ps3 = tmp .. self.SHADER_NAME .. ".ps3.shaders"
		make_params.ps4 = ""
		make_params.xb1 = ""
		make_params.x360d3d9 = ""
		make_params.lrb = ""
	elseif target() == "ps4" then
		make_params.win32d3d9 = ""
		make_params.win32d3d10 = ""
		make_params.win32d3d11 = ""
		make_params.ogl = ""
		make_params.ps3 = ""
		make_params.ps4 = tmp .. self.SHADER_NAME .. ".ps4.shaders"
		make_params.xb1 = ""
		make_params.x360d3d9 = ""
		make_params.lrb = ""
	elseif target() == "xb1" then
		make_params.win32d3d9 = ""
		make_params.win32d3d10 = ""
		make_params.win32d3d11 = ""
		make_params.ogl = ""
		make_params.ps3 = ""
		make_params.ps4 = ""
		make_params.xb1 = tmp .. self.SHADER_NAME .. ".xb1.shaders"
		make_params.x360d3d9 = ""
		make_params.lrb = ""
	elseif target() == "x360" then
		make_params.win32d3d9 = ""
		make_params.win32d3d10 = ""
		make_params.win32d3d11 = ""
		make_params.ogl = ""
		make_params.ps3 = ""
		make_params.ps4 = ""
		make_params.xb1 = ""
		make_params.x360d3d9 = tmp .. self.SHADER_NAME .. ".x360.shaders"
		make_params.lrb = ""
	elseif target() == "lrb" then
		make_params.win32d3d9 = ""
		make_params.win32d3d10 = ""
		make_params.win32d3d11 = ""
		make_params.ogl = ""
		make_params.ps3 = ""
		make_params.ps4 = ""
		make_params.xb1 = ""
		make_params.x360d3d9 = ""
		make_params.lrb = tmp .. self.SHADER_NAME .. ".lrb.shaders"
	else
		slot7 = "[CoreShaderLibCompiler] Unknown target: " .. target()

		error(slot6)
	end

	return make_params
end

return 
