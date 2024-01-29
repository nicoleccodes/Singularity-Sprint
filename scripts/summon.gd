extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	first_object(100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
var rng = RandomNumberGenerator.new()
var projectiles = ["proj1", "proj2", "proj3", "proj4", "proj5", "proj6", "proj7", "proj8", "proj9"]
#var ranges = [[200, 400], [200, 400], [200, 400], [200, 400]]
	
func first_object(count):
	if count == 0:
		var camera = get_node("Camera2D")
		camera.position.x = 3000
		var label = get_node("end").get_node("Label")
		label.text = "You Won!\nPress space to restart\n\nYou survived all of the"
		var label2 = get_node("end").get_node("Label2")
		label2.text = get_node("timer").get_node("Label").text
		return
	await get_tree().create_timer(0.7).timeout
	var guy = get_node("guy")
	guy.throw(1)
	await get_tree().create_timer(0.3).timeout
	var num = rng.randf_range(0, projectiles.size())
	var proj = projectiles[num]
	proj = proj + "/CharacterBody2D"
	var node = get_node(proj)
	var new_node = node.duplicate()
	new_node.position.x = 1000
	new_node.position.y = rng.randf_range(200, 400)
	add_child(new_node)
	count -= 1
	first_object(count)
