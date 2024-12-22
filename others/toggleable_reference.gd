@tool
@icon("res://others/toggleable_ref_rect.svg")
class_name ToggleableReferenceRect extends ReferenceRect


func _enter_tree() -> void:
	#LAYOUT_DIRECTION_MAX
	#set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	border_width = 3.2
	add_to_group("reference_rect")
