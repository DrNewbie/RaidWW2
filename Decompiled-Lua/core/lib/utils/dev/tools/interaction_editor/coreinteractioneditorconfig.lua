slot3 = "CoreInteractionEditorConfig"

core.module(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

EDITOR_TITLE = "Interaction Manager"
slot2 = "toolbar/new_16x16.png"
NEW_ICON = CoreEws.image_path(slot1)
slot2 = "toolbar/open_16x16.png"
OPEN_ICON = CoreEws.image_path(slot1)
slot2 = "toolbar/save_16x16.png"
SAVE_ICON = CoreEws.image_path(slot1)
slot2 = "toolbar/save_all_16x16.png"
SAVE_ALL_ICON = CoreEws.image_path(slot1)
CLOSE_ICON = CoreEws.image_path(slot1)
slot5 = 243
slot5 = 172
slot5 = 102
slot5 = 100
slot5 = 102
slot5 = 200
slot5 = 166
slot5 = 95
NODE_COLORS = {
	Color("toolbar/delete_16x16.png", 243, 243),
	Color("toolbar/delete_16x16.png", 102, 255),
	Color("toolbar/delete_16x16.png", 255, 185),
	Color("toolbar/delete_16x16.png", 200, 100),
	Color("toolbar/delete_16x16.png", 255, 136),
	Color("toolbar/delete_16x16.png", 100, 200),
	Color("toolbar/delete_16x16.png", 36, 120),
	Color("toolbar/delete_16x16.png", 33, 166)
}
DEFAULT_NODE_COLOR = NODE_COLORS[1]
NODE_TYPES = {
	"undefined",
	"event",
	"boolean",
	"color",
	"number",
	"references",
	"string",
	"vector"
}

return 
