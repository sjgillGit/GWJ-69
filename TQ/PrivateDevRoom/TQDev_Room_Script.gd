extends Node3D
##@experimental
##  ┬─┬ノ( º _ ºノ) stay calm, code on

@onready var player = $PC
@onready var left_Side = $PC/Control/WarrantyArea

var customer_line = []



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	#customer spawning
	var customer_p = preload("res://TQ/Assets/customer.tscn")
	var customer_i = customer_p.instantiate()
	
	$CustomerWaitLine.add_child(customer_i)
	customer_line.append(customer_i)
	customer_i.transform.origin = $CustomerSpawn.global_position
	customer_i.look_at(player.global_position)
	
	#item sheet reading
	#var file = FileAccess.open("res://example.csv", FileAccess.READ)
	#
	left_Side.connect("mouse_entered", warranty_list_up)
	left_Side.connect('mouse_exited', warranty_list_down)
	
	#
	#while !file.eof_reached():
		#var csv_data := file.get_csv_line()
		## process csv data - for example just print it
		#print("CSV data is %s" % ", ".join(csv_data))
	pass


func _input(event):
	if Input.is_action_just_pressed("Esc"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("Dev_Button"):
		print(str(customer_line[0]))
		pass
	pass


func _process(delta):
	#customer_i.transform.origin = move_toward(player.global_position, 0.5)
	$CustomerWaitLine/Customer/Sprite3D.look_at(player.global_position)
	$CustomerWaitLine/Customer.progress += 0.03
	pass

func warranty_list_up():
	#print("warranty info")
	if left_Side.mouse_entered:
		$WarrantyList/AnimationPlayer.play("Observe")
	
	pass

func warranty_list_down():
	if left_Side.mouse_exited:
		$WarrantyList/AnimationPlayer.play_backwards("Observe")
		#print('mouse left')
	
	pass
