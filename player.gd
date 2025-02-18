extends Area2D

signal hit

const SPEED = 400 #px/sec


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	
	# process inputs
	if Input.is_action_pressed("move_left"):
		velocity.x = SPEED * delta * -1
	
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED * delta
	
	if Input.is_action_pressed("move_up"):
		velocity.y = SPEED * delta * -1
	
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED * delta
	
	position += velocity
