extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func jump():
	for i in range(6):
		var name = "res://animations/JA" + str(i) + ".png"
		texture = load(name)
		await get_tree().create_timer(0.04).timeout
	texture = null
