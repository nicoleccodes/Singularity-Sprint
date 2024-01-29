extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func throw(count):
	var sprite = get_node("Sprite2D")
	for i in range(1, 7):
		await get_tree().create_timer(0.1).timeout
		var hold = "res://animations/M" + str(i) + ".PNG"
		sprite.texture = load(hold)
