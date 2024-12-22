@tool
extends CanvasLayer

@onready var debug_section: Panel = $GUIManager/MarginContainer/GeneralHBox/DebugSection

@export_group("Reference Rects")
@export_tool_button("Toggle Reference Vis.", "ReferenceRect")
var toggle_vis_action = _toggle_ref_rect

@export_tool_button("Show All", "Callable")
var show_all_vis_action = _show_all_ref_rect

@export_tool_button("Hide All", "Callable")
var hide_all_vis_action = _hide_all_ref_rect

#region Reference Rect Actions

func _toggle_ref_rect(): 
	for reference_rect: ReferenceRect in get_tree().get_nodes_in_group("reference_rect"):
		reference_rect.visible = !reference_rect.visible

func _show_all_ref_rect():
	for reference_rect: ReferenceRect in get_tree().get_nodes_in_group("reference_rect"):
		reference_rect.show()
		
func _hide_all_ref_rect():
	for reference_rect: ReferenceRect in get_tree().get_nodes_in_group("reference_rect"):
		reference_rect.hide()
		
#endregion

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug"):
		debug_section.visible = !debug_section.visible
	if event.is_action_pressed("esc"):
		get_tree().quit()
