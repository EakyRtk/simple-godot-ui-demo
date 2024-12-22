extends Node

#NOTE: it can be done in other ways but for this demo I will use
#dictionary{string: resource}

var player_money : float = 100.0 :
	set(value):
		if value < 0: player_money = 0
		else: player_money = value
		
var player_inventory : Array[String]

#--
#We identified this because we are going to store items as strings
#we need an interface to take item resources
#--

#NOTE: keep in mind that this is a const, if you want to make similar
#system to this and want to change values you can't change it

#--
#and because we used string values, when you try to do JSON savings
#and stuff, it will be easier for you to understand
#---

const items = {
	"face": preload("res://item/item_resources/face.tres"),
	"stick": preload("res://item/item_resources/stick.tres"),
	"sun": preload("res://item/item_resources/sun.tres"),
	"sword": preload("res://item/item_resources/sword.tres"),
	"tree": preload("res://item/item_resources/tree.tres")
}

func add_item_to_player(item_name: String)->void:
	player_inventory.append(item_name)
