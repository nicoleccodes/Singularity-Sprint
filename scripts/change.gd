extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var hold = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("change"):
		hold = !hold
		if hold:
			texture = load("res://sprites/thumbnail_Untitled_Artwork 1.png")
		else:
			texture = load("res://sprites/thumbnail_Untitled_Artwork.png")
