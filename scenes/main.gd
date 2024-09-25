extends Node2D

@onready var triangulation = $Triangulation

var pos_x = 50
var pos_x_2 = 50
var pos_y = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	triangulation.init(500, 500)

func spawn_rect(lbx,ubx,lby,uby):
	var idx = [
		triangulation.insert_point(lbx, lby, false),
		triangulation.insert_point(lbx, uby, false),
		triangulation.insert_point(ubx, uby, false),
		triangulation.insert_point(ubx, lby, false)
	]
	triangulation.insert_edge(idx[0], idx[1])
	triangulation.insert_edge(idx[1], idx[2])
	triangulation.insert_edge(idx[2], idx[3])
	triangulation.insert_edge(idx[3], idx[0])

func _input(event):

	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_A:
		spawn_rect(pos_x-10, pos_x+50+10, 50-10, 100+10)
		pos_x += 50
	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_Z:
		spawn_rect(pos_x_2-10, pos_x_2+50+10, 100+50-10, 100+100+10)
		pos_x_2 += 50

	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_E:
		triangulation.insert_point(50-10, pos_y-10, false)
		triangulation.insert_point(100+10, pos_y-10, false)
		triangulation.insert_point(100+10, pos_y+50+10, false)
		triangulation.insert_point(50-10, pos_y+50+10, false)
		pos_y += 50

	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_F:
		triangulation.finalize()

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var x = event.position.x - triangulation.position.x
		var y = event.position.y - triangulation.position.y
		x = round(x/20)*20
		y = round(y/20)*20
		spawn_rect(x-25, x+25, y-25, y+25)

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		var x = event.position.x - triangulation.position.x
		var y = event.position.y - triangulation.position.y
		triangulation.select(int(x), int(y))
