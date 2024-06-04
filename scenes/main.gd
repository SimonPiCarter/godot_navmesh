extends Node2D

@onready var triangulation = $Triangulation

# Called when the node enters the scene tree for the first time.
func _ready():
	triangulation.init(500, 500)
	triangulation.insert_point(20, 20)
	triangulation.insert_point(40 ,30)
	triangulation.insert_point(40 ,20)
	triangulation.insert_point(50 ,30)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		triangulation.insert_point(
			event.position.x - triangulation.position.x, 
			event.position.y - triangulation.position.y
		)
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		triangulation.select(
			event.position.x - triangulation.position.x, 
			event.position.y - triangulation.position.y
		)
