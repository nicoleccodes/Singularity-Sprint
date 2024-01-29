extends Node2D
var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var go = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if go:
		time += delta
		var node = get_node("Label")
		node.text = str("%10.2f" % time)

func stop():
	go = false
	var node = get_node("Label")
	var text = node.text
	var world = get_parent()
	var label = world.get_node("end").get_node("Label2")
	var end = world.get_node("end")
	end.stop()
	label.text = text
