extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	
	#mainMenu buttons
	$Menu_Buttons/Start.connect("pressed", start_game)
	$Menu_Buttons/Quit.connect("pressed", quit_game)
	$Menu_Buttons/Credits.connect('pressed', toggle_Credits_Menu)
	
	#easter egg 
	$credits_Panel/Sprite2D/Button.connect('pressed', add_easter_egg)
	
	
	pass # Replace with function body.

func start_game():
	var load_P = load("res://TQ/Scenes/loading_screen.tscn")
	get_tree().change_scene_to_packed(load_P)
	
	pass


func quit_game():
	get_tree().quit()
	
	pass


func toggle_Credits_Menu():
	var credits_panel = $credits_Panel
	
	if credits_panel.visible == false:
		credits_panel.visible = true
	elif credits_panel.visible == true:
		credits_panel.visible = false
	
	
	pass


func add_easter_egg():
	PcScores.easter_eggs_in_basket += 1
	print(str(PcScores.easter_eggs_in_basket))
	
	if PcScores.easter_eggs_in_basket < 50:
		$credits_Panel/Sprite2D/sparkle.restart()
	
	if PcScores.easter_eggs_in_basket >= 50:
		$credits_Panel/Sprite2D.texture = load("res://TQ/Assets/EasterEgg/CrackedEasterEgg.png")
		print('hatched the easter egg!')
	pass
