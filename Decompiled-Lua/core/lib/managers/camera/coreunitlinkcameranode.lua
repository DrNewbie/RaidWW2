-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreUnitLinkCameraNode"

core.module(slot1, core)

slot3 = "CoreTransformCameraNode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

if not UnitLinkCameraNode then
	slot2 = CoreTransformCameraNode.TransformCameraNode
	slot0 = CoreClass.class(slot1)
end

UnitLinkCameraNode = slot0
UnitLinkCameraNode.init = function (self, settings)
	slot5 = settings

	UnitLinkCameraNode.super.init(slot3, self)

	return 
end
UnitLinkCameraNode.compile_settings = function (xml_node, settings)
	slot5 = settings

	UnitLinkCameraNode.super.compile_settings(slot3, xml_node)

	slot4 = xml_node
	local xml_node_children = xml_node.children(slot3)

	for xml_child_node in nil do
		slot9 = xml_child_node

		if xml_child_node.name(slot8) == "link" then
			slot7 = assert
			slot12 = "object"

			if xml_child_node.has_parameter(slot10, xml_child_node) then
				slot12 = "connection"
				slot9 = xml_child_node.has_parameter(slot10, xml_child_node)
			end

			slot7(slot8)

			slot10 = "object"
			local object_str = xml_child_node.parameter(slot8, xml_child_node)
			local object = Idstring(xml_child_node)
			slot12 = "connection"
			local connection_type = xml_child_node.parameter(object_str, xml_child_node)

			if connection_type == "pos_x" then
				settings.link_x = object
			elseif connection_type == "pos_y" then
				settings.link_y = object
			elseif connection_type == "pos_z" then
				settings.link_z = object
			elseif connection_type == "pos" then
				settings.link_x = object
				settings.link_y = object
				settings.link_z = object
			elseif connection_type == "rot" then
				settings.link_rot = object
			elseif connection_type == "all" then
				settings.link_x = object
				settings.link_y = object
				settings.link_z = object
				settings.link_rot = object
			end
		end
	end

	return 
end
UnitLinkCameraNode.set_unit = function (self, unit)
	local settings = self._settings

	if settings.link_x then
		slot6 = settings.link_x
		self._link_x = unit.get_object(slot4, unit)
	end

	if settings.link_y then
		slot6 = settings.link_y
		self._link_y = unit.get_object(slot4, unit)
	end

	if settings.link_z then
		slot6 = settings.link_z
		self._link_z = unit.get_object(slot4, unit)
	end

	if settings.link_rot then
		slot6 = settings.link_rot
		self._link_rot = unit.get_object(slot4, unit)
	end

	self._unit = unit

	return 
end
UnitLinkCameraNode.update = function (self, t, dt, in_data, out_data)
	local local_position = self._local_position
	slot8 = self._unit

	if CoreCode.alive(slot7) then
		local link = self._link_x

		if link then
			slot12 = link
			slot10 = link.position(slot11).x

			mvector3.set_x(slot8, local_position)
		end

		link = self._link_y

		if link then
			slot12 = link
			slot10 = link.position(slot11).y

			mvector3.set_y(slot8, local_position)
		end

		link = self._link_z

		if link then
			slot12 = link
			slot10 = link.position(slot11).z

			mvector3.set_z(slot8, local_position)
		end

		link = self._link_rot

		if link then
			slot9 = link
			self._local_rotation = link.rotation(slot8)
		end
	end

	slot12 = out_data

	UnitLinkCameraNode.super.update(slot7, self, t, dt, in_data)

	return 
end

return 
