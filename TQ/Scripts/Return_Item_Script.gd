extends Node3D
class_name Shopping_Items
##@experimental

## should be the master script for items the shoppers can bring to the counter


@export var ITEMNAME: String

@export var ITEMSTATS = {
	"Value" : 100,
	'Condition' : 50,
	
}


@export var DESCRIPTION: String

func _ready():
	ItemLib.Item_Name = ITEMNAME
	ItemLib.Item_Description = DESCRIPTION
	
	ITEMSTATS['Value'] = randi_range(1, 1000)
	ITEMSTATS['Condition'] = randi_range(1, 100)
	
	$RecalcTimer.connect("timeout", update_list)
	pass


func _process(delta):
	rotate_z(0.01)
	pass

func update_list():
	ItemLib.Item_Name = ITEMNAME
	ItemLib.Item_Description = DESCRIPTION
	pass
