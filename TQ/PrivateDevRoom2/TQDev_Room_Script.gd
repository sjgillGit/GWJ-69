extends Node3D
##@experimental
##  ┬─┬ノ( º _ ºノ) stay calm, code on

@onready var player = $PC
@onready var left_Side = $PC/Control/WarrantyArea

var customer_line = []

var customer_p = load("res://TQ/Assets/customer.tscn")
var customer_i = customer_p.instantiate()

var spawn_time = randf_range(4, 8)





func _ready():
	$SpawnTimer.wait_time = spawn_time
	$SpawnTimer.connect("timeout", spawn_customer)
	#print(str($SpawnTimer.time_left))
	
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
	
	#player location
	Globals.PC_Location = player.transform.origin
	
	#var chosen = randi_range(0, ItemLib.ITEM_LIBRARY.size())
	
	
	var spawn_p = load
	var spawn_i = ItemLib.ITEM_LIBRARY[0].instantiate()
	
	$ItemSpawnPoint.add_child(spawn_i)
	
	#spawn_p.transform.origin = $ItemSpawnPoint.global_position
	
	
	pass


func _input(event):
	
	if Input.is_action_just_pressed("Esc"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("Dev_Button"):
		print(str(customer_line[0]))
		pass
	
	
	pass


func _process(delta):
	print(str($SpawnTimer.time_left))
	
	
	#customer_i.transform.origin = move_toward(player.global_position, 0.5)
	$CustomerWaitLine/Customer/Sprite3D.look_at(player.global_position)
	#$CustomerWaitLine/Customer.progress += 0.03
	
	
	#if customer_i.progress == 100:
		#customer_i.progress = 100
		
	if $SpawnTimer.timeout:
		$SpawnTimer.wait_time = spawn_time
		$CustomerWaitLine.add_child(customer_i)
		
	pass

func warranty_list_up():
	
	if left_Side.mouse_entered:
		$WarrantyList/AnimationPlayer.play("Observe")
		print('mouse entered')
	
	pass

func warranty_list_down():
	
	if left_Side.mouse_exited:
		$WarrantyList/AnimationPlayer.play_backwards("Observe")
		print('mouse left')
	
	pass

func spawn_customer():
	if customer_line.size() <= 5:
		$CustomerWaitLine.add_child(customer_i)
		customer_line.append(customer_i)
		customer_i.transform.origin = $CustomerSpawn.global_position
	pass
