@icon("res://item/item.svg")
class_name Item extends Resource

#DANGER: DO NOT FORGET! When you duplicate resources instead of
#creating them fresh new, you may open yourself to weird value changing bugs.
#I don't know if they fixed it, if so let me know. 

@export var item_texture : CompressedTexture2D
@export var item_price : float
@export var item_name : String
@export var item_lore : String
