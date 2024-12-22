@icon("res://GUI/shop_slot.svg")
class_name ItemUISlot extends Control

@onready var item_texture_rect: TextureRect = %ItemTextureRect
@onready var item_name_label: Label = %ItemName
@onready var lore_rich_text: RichTextLabel = %Lore
@onready var price_label: Label = %PriceLabel
@onready var buy_button: TextureButton = %BuyButton


func insert_values(item_name: String)->void:
	item_texture_rect.texture = Global.items[item_name].item_texture
	item_name_label.text = Global.items[item_name].item_name
	
	#NOTE:if you want to use bbcode you can enable it but
	#you will have to use .append_text()
	lore_rich_text.add_text(Global.items[item_name].item_lore)
	price_label.text = str(Global.items[item_name].item_price)


func get_lost_lol()->void:
	self.mouse_entered.disconnect(_mouse_tween)
	self.mouse_exited.disconnect(_mouse_tween)
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(position.x + 13, position.y), 1.2).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "position", Vector2(position.x - 270, position.y), 0.45).set_trans(Tween.TRANS_QUAD)
	tween.parallel().tween_property(self, "modulate", Color.TRANSPARENT, 0.8).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.1)
	await tween.finished
	tween = create_tween()
	tween.tween_property(self, "custom_minimum_size", Vector2(0, 0), 0.5).set_trans(Tween.TRANS_QUAD)
	await tween.finished
	queue_free()
	
func _mouse_tween(val: Vector2, tw_time: float = 0.2)->void:
	var tween = create_tween()
	tween.tween_property(self, "scale", val, tw_time)
	
func _enter_tree() -> void:
	self.mouse_entered.connect(_mouse_tween.bind(Vector2.ONE * 1.01))
	self.mouse_exited.connect(_mouse_tween.bind(Vector2.ONE))
