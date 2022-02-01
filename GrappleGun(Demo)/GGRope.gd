extends Line2D

export var start_pos = Vector2(0,0)
export var end_pos = Vector2(0,0)

func _process(delta):
	if visible:
		add_point(start_pos)
		add_point(end_pos , 1)
		remove_point(0)
	if not visible:
		clear_points()
