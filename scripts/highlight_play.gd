extends StaticBody2D
var hovering = false

# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hovering and Input.is_action_just_pressed("select"):
		var parent = get_parent()
		if parent.get_node("char1_body") != null:
			Global.test = "C"
		elif parent.get_node("char2_body") != null:
			Global.test = "G"
		else:
			Global.test = "T"
		get_tree().change_scene_to_file("res://world.tscn")


func _on_mouse_entered():
	$start.texture = load("res://GUI/Hover.png")
	hovering = true


func _on_mouse_exited():
	$start.texture = load("res://GUI/Default.png")
	hovering = false
