extends Node3D
##@experimental
##  ┬─┬ノ( º _ ºノ) stay calm, code on

@onready var player = $PC
@onready var left_Side = $PC/Control/WarrantyArea

var customer_line = []

var customer_p = preload("res://TQ/Assets/customer.tscn")
var customer_i = customer_p.instantiate()


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	#customer spawning
	
	$CustomerWaitLine.add_child(customer_i)
	customer_line.append(customer_i)
	customer_i.transform.origin = $CustomerSpawn.global_position
	customer_i.look_at(player.global_position)
	
	#item sheet reading
	#var file = FileAccess.open("res://example.csv", FileAccess.READ)
	#
	#await get_tree().create_timer(2.0).timeout
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
	
	
	if customer_i.progress == 100:
		customer_i.progress = customer_i.progress
	pass

func warranty_list_up():
	#print("warranty info")
	if left_Side.mouse_entered:
		$WarrantyList/AnimationPlayer.play("Observe")
		print('mouse entered')
	pass

func warranty_list_down():
	if left_Side.mouse_exited:
		$WarrantyList/AnimationPlayer.play_backwards("Observe")
		print('mouse left')
	
	pass
