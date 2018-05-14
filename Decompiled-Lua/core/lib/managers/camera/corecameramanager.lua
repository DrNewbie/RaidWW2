-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreCameraManager"

core.module(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreCameraMixer"

core.import(slot1, core)

slot3 = "CoreCameraDataInterpreter"

core.import(slot1, core)

slot3 = "CoreTransformCameraNode"

core.import(slot1, core)

slot3 = "CoreUnitLinkCameraNode"

core.import(slot1, core)

slot3 = "CoreCollisionCameraNode"

core.import(slot1, core)

slot3 = "CoreSpringCameraNode"

core.import(slot1, core)

slot3 = "CoreAimCameraNode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

slot3 = "CoreUnit"

core.import(slot1, core)

CameraBase = CameraBase or CoreClass.class()
function CameraBase:init()
	self._nodes = {}
	self._name_to_nodes = {}
	self._setup = nil
	self._default_blend = 0
	self._blend_table = {}

	return 
end
function CameraBase:destroy()
	slot3 = self._nodes

	for index, node in ipairs(slot2) do
		slot8 = node

		node.destroy(slot7)
	end

	self._nodes = {}
	self._setup = nil

	return 
end
function CameraBase:name()
	return self._setup._name
end
function CameraBase:transition_blend(from_camera)
	slot5 = from_camera

	return self._blend_table[from_camera.name(slot4)]
end
function CameraBase:default_blend()
	return self._default_blend
end
function CameraBase:node(node_name)
	return self._name_to_nodes[node_name]
end
function CameraBase:nodes()
	return self._nodes
end
CameraManager = CameraManager or CoreClass.class()
function CameraManager:init(templates)
	self._layers = {}
	slot5 = templates

	self.create_layers(slot3, self)

	return 
end
function CameraManager:destroy()
	slot3 = self._layers

	for index, mixer in ipairs(slot2) do
		slot8 = mixer

		mixer.destroy(slot7)
	end

	self._layers = {}

	return 
end
function CameraManager:create_layers(templates)
	slot4 = self._layers

	for index, mixer in ipairs(slot3) do
		slot9 = mixer

		mixer.destroy(slot8)
	end

	self._layers = {}
	self._name_to_layer = {}
	self._templates = templates
	slot4 = templates._interpreter_class
	self._interpreter = templates._interpreter_class.new(slot3)
	slot4 = templates._layers

	for index, layer_name in ipairs(slot3) do
		slot10 = layer_name
		local mixer = CoreCameraMixer.CameraMixer.new(slot8, CoreCameraMixer.CameraMixer)
		slot11 = mixer

		table.insert(CoreCameraMixer.CameraMixer, self._layers)

		self._name_to_layer[layer_name] = mixer
	end

	return 
end
function CameraManager:view_camera(camera_name, force_new_camera)
	local layer_name = self.get_camera_layer(slot4, self)
	local mixer = self._name_to_layer[layer_name]
	slot7 = mixer
	local active_camera = mixer.active_camera(camera_name)

	if active_camera and not force_new_camera then
		slot8 = active_camera

		if active_camera.name(slot7) == camera_name then
			return active_camera
		end
	end

	slot10 = self._unit
	local camera = self.create_camera(slot7, self, camera_name)
	local blend_time = 0

	if active_camera then
		slot11 = active_camera
		blend_time = camera.transition_blend(slot9, camera)
	end

	if not blend_time then
		slot10 = camera
		blend_time = camera.default_blend(slot9)
	end

	slot10 = blend_time

	assert(slot9)

	slot12 = blend_time

	mixer.add_camera(slot9, mixer, camera)

	return camera
end
function CameraManager:stop_all_layers()
	slot3 = self._layers

	for index, layer in ipairs(slot2) do
		slot8 = layer

		layer.stop(slot7)
	end

	return 
end
function CameraManager:stop_layer(layer_name)
	local mixer = nil

	if layer_name then
		mixer = self._name_to_layer[layer_name]
	else
		mixer = self._layers[1]
	end

	slot5 = mixer

	mixer.stop(slot4)

	return 
end
function CameraManager:get_camera_layer(name)
	local camera_setups = self._templates._setups

	local function get_camera_layer(name)
		local camera_setup = camera_setups[name]
		slot4 = camera_setup

		assert(slot3)

		local layer = camera_setup._layer

		if layer then
			return layer
		end

		local parent_name = camera_setup._inherits

		if parent_name then
			slot6 = parent_name

			return get_camera_layer(slot5)
		end

		return 
	end

	local layer_name = get_camera_layer(slot5)
	slot7 = layer_name

	assert(name)

	return layer_name
end
function CameraManager:create_camera(name)
	local templates = self._templates
	local camera_setups = templates._setups
	local camera_node_setups = templates._node_setups
	local camera_list = {}

	local function get_camera_chain(name, cam_list)
		local camera_setup = camera_setups[name]
		slot5 = camera_setup

		assert(slot4)

		local parent_name = camera_setup._inherits

		if parent_name then
			slot7 = cam_list

			get_camera_chain(slot5, parent_name)
		end

		slot7 = camera_setup

		table.insert(slot5, cam_list)

		return 
	end

	slot10 = camera_list

	get_camera_chain(slot8, name)

	slot9 = CameraBase
	local camera = CameraBase.new(slot8)
	local nodes = camera._nodes
	local name_to_nodes = camera._name_to_nodes
	local blend_table = camera._blend_table
	local parent_node = nil
	local num_cameras = 0
	slot15 = camera_list

	for _, camera_setup in ipairs(slot14) do
		num_cameras = num_cameras + 1
		slot20 = camera_setup._camera_nodes

		for index, node_table in ipairs(slot19) do
			local node_setup = camera_node_setups[node_table._node_name]
			slot27 = node_setup._settings
			local camera_node = node_setup._class.new(slot25, node_setup._class)

			if node_table._name then
				camera_node._name = node_table._name
			end

			name_to_nodes[camera_node._name] = camera_node

			if node_table._position then
				camera_node._pivot_position = node_table._position
			end

			if node_table._rotation then
				camera_node._pivot_rotation = node_table._rotation
			end

			if parent_node then
				slot28 = parent_node

				camera_node.set_parent(slot26, camera_node)
			end

			parent_node = camera_node
			slot28 = camera_node

			table.insert(slot26, nodes)
		end

		if camera_setup._default_blend then
			camera._default_blend = camera_setup._default_blend
		end

		slot20 = camera_setup._blend_table

		for key, value in pairs(slot19) do
			blend_table[key] = value
		end

		if camera_setup._layer then
			camera._layer = camera_setup._layer
		end
	end

	camera._setup = camera_list[num_cameras]

	return camera
end
function CameraManager:update(time, dt)
	self._interpreter.reset(slot4)

	local interpreter_class = self._templates._interpreter_class
	slot6 = self._layers

	for index, mixer in ipairs(self._interpreter) do
		slot15 = dt

		mixer.update(slot10, mixer, self._interpreter, interpreter_class, time)
	end

	if self._debug_render_enable then
		slot6 = self._layers

		for index, mixer in ipairs(slot5) do
			slot13 = dt

			mixer.debug_render(slot10, mixer, time)
		end
	end

	return 
end
function CameraManager:interpreter()
	return self._interpreter
end
function CameraManager:print_cameras()
	slot3 = self._layers

	for index, mixer in ipairs(slot2) do
		slot9 = "layer: '" .. mixer._name .. "'"

		cat_print(slot7, "debug")

		local cameras = mixer.cameras(slot7)
		slot9 = cameras

		for _, camera in ipairs(mixer) do
			slot15 = "camera: '" .. camera._setup._name .. "'"

			cat_print(slot13, "debug")
		end
	end

	return 
end
CameraTemplateManager = CameraTemplateManager or CoreClass.class()
CameraTemplateManager.camera_db_type = "camera"
CameraTemplateManager.camera_db_path = "cameras/cameras"
function CameraTemplateManager:init()
	self._camera_space = {}
	self._parse_func_table = {
		interpreter = CameraTemplateManager.parse_interpreter,
		layer = CameraTemplateManager.parse_layer,
		camera = CameraTemplateManager.parse_camera,
		camera_node = CameraTemplateManager.parse_camera_node,
		depends_on = CameraTemplateManager.parse_depends_on
	}
	self._camera_managers = {}
	slot3 = self

	self.load_cameras(CameraTemplateManager.parse_depends_on)

	return 
end
function CameraTemplateManager:create_camera_manager(camera_space)
	local camera_space = self._camera_space[camera_space]
	slot6 = camera_space
	local cm = CameraManager.new(slot4, CameraManager)
	slot7 = cm

	table.insert(CameraManager, self._camera_managers)

	return cm
end
function CameraTemplateManager:load_cameras()
	slot3 = self

	self.clear(slot2)

	slot5 = CameraTemplateManager.camera_db_path

	if DB.has(slot2, DB, CameraTemplateManager.camera_db_type) then
		slot5 = CameraTemplateManager.camera_db_path
		local xml_node = DB.load_node(slot2, DB, CameraTemplateManager.camera_db_type)
		slot4 = xml_node
		local xml_node_children = xml_node.children(DB)

		for xml_child_node in nil do
			slot9 = xml_child_node

			if xml_child_node.name(slot8) == "camera_file" then
				slot10 = "file"

				if xml_child_node.has_parameter(slot8, xml_child_node) then
					slot9 = self
					slot13 = "file"

					self.load_camera_file(slot8, xml_child_node.parameter(slot11, xml_child_node))
				end
			end
		end
	end

	slot3 = self._camera_managers

	for index, cm in ipairs(slot2) do
		local template_name = cm._templates._name
		local template = self._camera_space[template_name]
		slot11 = template

		cm.create_layers(slot9, cm)
	end

	return 
end
function CameraTemplateManager:load_camera_file(file_name)
	slot6 = file_name

	if DB.has(slot3, DB, CameraTemplateManager.camera_db_type) then
		slot6 = file_name
		local xml_node = DB.load_node(slot3, DB, CameraTemplateManager.camera_db_type)
		slot5 = xml_node

		if xml_node.name(DB) == "camera_space" then
			local space_name = xml_node.parameter(slot4, xml_node)
			self._camera_space[space_name] = self._camera_space[space_name] or {}
			local space = self._camera_space[space_name]
			space._name = space_name
			space._interpreter_class = CoreCameraDataInterpreter.CameraDataInterpreter
			space._node_setups = {}
			space._setups = {}
			space._layers = {}
			slot7 = xml_node
			local xml_node_children = xml_node.children("name")

			for xml_child_node in nil do
				slot13 = xml_child_node
				local parse_func = self._parse_func_table[xml_child_node.name(slot12)]

				if parse_func then
					slot15 = space

					parse_func(slot12, self, xml_child_node)
				end
			end
		end
	end

	return 
end
function CameraTemplateManager:clear()
	self._camera_space = {}

	return 
end
function CameraTemplateManager:get_layers(camera_space)
	local space = self._camera_space[camera_space]

	return space._layers
end
function CameraTemplateManager:parse_layer(xml_node, space)
	slot6 = "name"
	local layer_name = xml_node.parameter(slot4, xml_node)
	slot7 = layer_name

	table.insert(xml_node, space._layers)

	return 
end
function CameraTemplateManager:parse_interpreter(xml_node, space)
	slot6 = "class"
	local interpreter_class = xml_node.parameter(slot4, xml_node)
	slot7 = interpreter_class
	space._interpreter_class = rawget(xml_node, _G)

	return 
end
function CameraTemplateManager:parse_camera(xml_node, space)
	local camera_setups = space._setups
	local setup = {}
	slot8 = "name"
	local name = xml_node.parameter(slot6, xml_node)
	slot8 = name

	assert(xml_node)

	slot9 = "inherits"

	if xml_node.has_parameter(xml_node, xml_node) then
		slot9 = "inherits"
		setup._inherits = xml_node.parameter(slot7, xml_node)
	end

	slot9 = "layer"

	if xml_node.has_parameter(slot7, xml_node) then
		slot9 = "layer"
		setup._layer = xml_node.parameter(slot7, xml_node)
	end

	setup._name = name
	setup._camera_nodes = {}
	setup._blend_table = {}
	camera_setups[name] = setup

	local function parse_node(xml_node)
		local node = {}
		slot5 = "node_name"
		node._node_name = xml_node.parameter(slot3, xml_node)
		slot4 = node._node_name

		assert(slot3)

		slot5 = "name"

		if xml_node.has_parameter(slot3, xml_node) then
			slot5 = "name"
			node._name = xml_node.parameter(slot3, xml_node)
		end

		slot5 = "position"

		if xml_node.has_parameter(slot3, xml_node) then
			slot7 = "position"
			node._position = math.string_to_vector(xml_node.parameter(slot5, xml_node))
		end

		slot5 = "rotation"

		if xml_node.has_parameter(slot3, xml_node) then
			slot7 = "rotation"
			node._rotation = CoreMath.string_to_rotation(xml_node.parameter(slot5, xml_node))
		end

		slot5 = node

		table.insert(slot3, setup._camera_nodes)

		return 
	end

	local function parse_default_blend(xml_node)
		slot4 = "blend"

		if xml_node.has_parameter(slot2, xml_node) then
			slot7 = "blend"
			setup._default_blend = tonumber(xml_node.parameter(slot5, xml_node))
		end

		return 
	end

	local function parse_from_blend(xml_node)
		slot4 = "name"

		if xml_node.has_parameter(slot2, xml_node) then
			local name = xml_node.parameter(slot2, xml_node)
			local blend_value = 0
			slot6 = "blend"

			if xml_node.has_parameter("name", xml_node) then
				slot6 = "blend"
				blend_value = xml_node.parameter(slot4, xml_node)
			end

			setup._blend_table[name] = blend_value
		end

		return 
	end

	local parse_func_table = {
		node = parse_node,
		default = parse_default_blend,
		from = parse_from_blend
	}
	slot12 = xml_node
	local xml_node_children = xml_node.children(slot11)

	for xml_child_node in nil do
		slot17 = xml_child_node
		local parse_func = parse_func_table[xml_child_node.name(slot16)]

		if parse_func then
			slot18 = xml_child_node

			parse_func(slot17)
		end
	end

	return 
end
function CameraTemplateManager:parse_camera_node(xml_node, space)
	local function split_string(str)
		local strings = {}
		slot5 = "[^%p]+"

		for word in string.gmatch(slot3, str) do
			slot9 = word

			table.insert(slot7, strings)
		end

		return strings
	end

	slot7 = "class"

	if xml_node.has_parameter(slot5, xml_node) then
		slot7 = "name"

		if xml_node.has_parameter(slot5, xml_node) then
			local camera_node_setups = space._node_setups
			slot8 = "class"
			local class_name = xml_node.parameter(slot6, xml_node)
			slot8 = class_name
			local class_hier = split_string(xml_node)
			local class = nil

			if 1 < #class_hier then
				slot11 = class_hier[1]
				local module = core.import(slot9, core)
				class = module[class_hier[2]]
			else
				slot11 = class_name
				class = rawget(slot9, _G)
			end

			if not class then
				slot10 = class

				assert(slot9)
			end

			local settings = {}
			slot12 = settings

			class.compile_settings(slot10, xml_node)

			local setup = {
				_class = class,
				_class_name = class_name,
				_settings = settings
			}
			slot13 = "name"
			local name = xml_node.parameter(xml_node, xml_node)
			camera_node_setups[name] = setup
		end
	end

	return 
end
function CameraTemplateManager:parse_depends_on(xml_node, space)
	slot5 = Application

	if Application.editor(slot4) then
		slot6 = "unit"

		if xml_node.has_parameter(slot4, xml_node) then
			slot8 = "unit"

			CoreUnit.editor_load_unit(xml_node.parameter(slot6, xml_node))
		else
			slot6 = "effect"

			if xml_node.has_parameter(slot4, xml_node) then
				slot5 = "effect"
				slot9 = "effect"
				slot8 = xml_node.parameter(slot7, xml_node)

				CoreEngineAccess._editor_load(slot4, xml_node.parameter(slot7, xml_node).id(slot7))
			end
		end
	end

	return 
end
function CameraTemplateManager:update(t, dt)
	slot5 = self._camera_managers

	for index, cam_man in ipairs(slot4) do
		slot12 = dt

		cam_man.update(slot9, cam_man, t)
	end

	return 
end

return 
