extends Panel

signal debug_shop_item_add(val: String)

@onready var _gui_manager: Control = %GUIManager
@onready var _money_edit_container: HBoxContainer = $MarginContainer/DebugContentVBox/ScrollContainer/DebugUtilVBox/MoneyEditContainer
@onready var _money_line_edit: LineEdit = %MoneyLineEdit
@onready var _item_option_button: OptionButton = %ItemOptionButton


func _ready() -> void:
	%MoneyAddButton.pressed.connect(_add_money)
	%ItemAddButton.pressed.connect(_add_item_to_shop)
	%BankruptButton.pressed.connect(_bankrupt)
	%ClearShopButton.pressed.connect(_gui_manager.clear_all)
	self.debug_shop_item_add.connect(_gui_manager.add_item_slot)
	
	for le_item : String in Global.items.keys():
		_item_option_button.add_item(le_item)
	
func _add_money()->void:
	var _line_val = _money_line_edit.text
	if not _line_val.is_valid_float(): _money_line_edit.text = "invalid value"; return
	
	Global.player_money += _line_val.to_float()
	
	var tween = create_tween()
	tween.tween_property(_money_edit_container, "modulate", Color.GREEN_YELLOW, 0.1)
	tween.tween_property(_money_edit_container, "modulate", Color.WHITE, 1.2)

func _bankrupt()->void:
	Global.player_money = 0

func _add_item_to_shop()->void:
	debug_shop_item_add.emit(_item_option_button.get_item_text(_item_option_button.selected))
