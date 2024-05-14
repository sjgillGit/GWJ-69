extends Node3D
class_name Shopping_Items
##@experimental

## should be the master script for items the shoppers can bring to the counter


@export var ITEMNAME: String

@export var ITEMSTATS = {
	"Value" : 100,
	'Condition' : 50,
	
}


@export_multiline var DESCRIPTION

@export var ITEM_ID: int = 0

func _ready():
	match_item_id()
	
	ItemLib.Item_Name = ITEMNAME
	ItemLib.Item_Description = DESCRIPTION
	
	ITEMSTATS['Value'] = randi_range(1, 1000)
	ITEMSTATS['Condition'] = randi_range(1, 100)
	
	$RecalcTimer.connect("timeout", update_list)
	pass


func _process(delta):
	rotate_y(0.01)
	pass

func update_list():
	
	ItemLib.Item_Name = ITEMNAME
	ItemLib.Item_Description = DESCRIPTION
	
	pass


func match_item_id():
	match ITEM_ID:
		0:
			ItemLib.ITEMLIST[0]
			print(str(ITEM_ID))
	pass
