extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Menu_Buttons/Start.connect("pressed", start_game)
	$Menu_Buttons/Quit.connect("pressed", quit_game)
	
	
	pass # Replace with function body.

func start_game():
	get_tree().change_scene_to_file("res://TQ/Scenes/loading_screen.tscn")
	
	pass


func quit_game():
	get_tree().quit()
	pass
