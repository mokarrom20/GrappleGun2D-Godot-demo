extends Node2D

export var tension = 0.5

onready var box = $Box #the player thing[maybe]
onready var gg = $GrappleGun #the dampedspringjoint2d [it will act as the main grapple gun]
onready var ray = $Box/RayCast2D #the raycast inside Box scene

onready var ggrope = $GGRope #a line2d with a bit of script to draw 'rope'

##instead of getting the 'thing to stick' ... i made a cursor[a static body 2d] to act as the Node B
##this will solve the 'tilemap' problem cause whenever we are getting the 'thingtostick.global_position'...it will return the position of the whole tilemap.Not the individual tiles
onready var cursor = $cursor

func _physics_process(delta):
	gg.global_position = box.global_position #the dampedspringjoint2d node is kinda hard to work with...(it needs to be in touch with the thing it connects to[idk what i just meant])
	ray.look_at(get_global_mouse_position()) #this will rotate the raycast to the mouse position
	
	if Input.is_action_just_pressed("shoot_grapple"):
		if ray.is_colliding():
			cursor.position = ray.get_collision_point() #we are setting the position of cursor to the collision point of our Raycast
			var distancelenght = (box.position).distance_to(cursor.position) #this line will give us the distance
			gg.length = distancelenght  #cause dampedspringjoint2d needs to be long enough to touch two nodes
			gg.global_rotation_degrees = ray.global_rotation_degrees - 90 #we used "look_at()" function to rotate but because of some 'Axis' issue....we need to substract 90 degrees
			gg.rest_length = distancelenght * tension #this will apply the 'pulling' effect
			ggrope.start_pos = cursor.global_position #for the rope
			gg.node_b = cursor.get_path() #actually setting the node_b
			
	################################################################################
	##optional:i actually added a sprite to indicate if the ray is colliding or not
	if ray.is_colliding():
		$Box/RayCast2D/RaycastIndicator.modulate = Color8(255,0,255,255)
	else:
		$Box/RayCast2D/RaycastIndicator.modulate = Color8(200,200,200,255)
	################################################################################
	
	
	if Input.is_action_pressed("shoot_grapple"):
		if gg.node_a != gg.node_b: #if the node b is not node a [the box] then we are sure that there is something to draw
			ggrope.visible = true
			ggrope.end_pos = box.global_position
	
	if not Input.is_action_pressed("shoot_grapple"):
		ggrope.visible = false #hide the rope
		gg.node_b = gg.node_a #set node_b to node_a
	pass
