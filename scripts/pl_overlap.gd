extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_areas():
		$AudioStreamPlayer2D.play()
		var parent = get_parent()
		if parent.position.x < -400:
			var world = parent.get_parent().get_parent()
			var timer = world.get_node("timer")
			timer.stop()
			var camera = world.get_node("Camera2D")
			camera.position.x = 3000
			parent = parent.get_parent()
			parent.queue_free()
			return
		parent.freeze()
		parent.velocity = Vector2(-1500, -150)
