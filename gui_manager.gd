extends Control

const SLOT = preload("res://GUI/slot.tscn")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var _item_content_box: VBoxContainer = %ItemContentVBox
@export var place_every_item : bool = true

func _ready() -> void:
	if place_every_item: _place_every_item()
	
func _place_every_item()->void:
	for i in Global.items.keys():
		add_item_slot(i)
	
func add_item_slot(item_name: String) -> void:
	if not Global.items.keys().has(item_name): return
	
	var new_item_slot : ItemUISlot = SLOT.instantiate()
	new_item_slot.name = "SlotInstance-%s" % item_name
	
	_item_content_box.add_child(new_item_slot)
	
	#Made this so its readible on Remote Tree :D but you don't need it
	if str(new_item_slot.name) != "SlotInstance-%s" % item_name:
		var nname = str(new_item_slot.name)[-1]
		var val = str_to_var(nname)
		if val is int:
			val = 1
			new_item_slot.name = "SlotInstance-%s%s" % [item_name, val]
	#--
	
	#by binding and setting meta we can do our logic more
	#flexible and easy
	new_item_slot.set_meta("item_name", item_name)
	new_item_slot.buy_button.pressed.connect(_item_bought.bind(new_item_slot))
	
	#this is valid too
	#new_item_slot.buy_button.pressed.connect(_les_printos.bind(item_name))
	
	new_item_slot.insert_values(item_name)
	
func clear_all()->void:
	for le_child : ItemUISlot in _item_content_box.get_children():
		le_child.queue_free()
	
func _item_bought(item_slot: ItemUISlot)->void:
	item_slot.buy_button.disabled = true
	if not item_slot.has_meta("item_name"):
		print_rich("[color=red]BRO[/color]") 
		return
	
	audio_stream_player.play()
	Global.add_item_to_player(item_slot.get_meta("item_name"))
	item_slot.get_lost_lol()


func _les_printos(val: String)->void:
	print(val)
	#but the logic is not implemented
